import React, { useEffect, useState } from 'react';
import axios from 'axios';

import './TaskList.css';

const TaskList = () => {
  const [tasks, setTasks] = useState([]);

  useEffect(() => {
    const fetchTasks = async () => {
      try {
        const { data } = await axios.get('http://localhost:3000/api/tasks');
        if (data) {
          setTasks(data.data);
        }
      } catch (error) {
        console.error('Error fetching tasks:', error);
      }
    };

    fetchTasks();

    return () => {
      setTasks([]);
    };
  }, []);

  const handleUpdateTaskCompleted = async (id, isCompleted) => {
    try {
      const { data } = await axios.put(`http://localhost:3000/api/tasks/${id}`, { completed: isCompleted });
      setTasks(prevTasks => [data.data, ...prevTasks.filter(task => task.id != id)].sort((task1, task2) => task1.id - task2.id))
    } catch (error) {
      console.error('Error updating tasks:', error);
    }
  }

  const handleRemoveTaskCompleted = async (id) => {
    try {
      const { data } = await axios.delete(`http://localhost:3000/api/tasks/${id}`);
      setTasks(prevTasks => [...prevTasks.filter(task => task.id != id)])
    } catch (error) {
      console.error('Error updating tasks:', error);
    }
  }

  const formatDate = (dateString) => {
    const options = { weekday: 'short', year: 'numeric', month: 'short', day: 'numeric', hour: 'numeric', minute: 'numeric' };
    return new Date(dateString).toLocaleDateString(undefined, options);
  };
  console.log(tasks)
  return (
    <div className="task-list">
      <h1>Tasks</h1>
      {tasks && tasks.map((task) => (
        <div key={task.id} className={`task`}>
          <input className='checkbox' type="checkbox" checked={task.completed} onClick={() => handleUpdateTaskCompleted(task.id, !task.completed)}  readOnly />
          <div className="task-details">
            <div>
            <p className="task-title">{task.title}</p>
            <p className="task-subtitle">{task.subtitle}</p>
            </div>
            <div className={`priority`}><div className={`tag ${task.priority.toLowerCase()}`}>{task.priority.toUpperCase()} PRIORITY</div></div>
            <div className="due-date">
              <span role="img" aria-label="clock">⏱</span> {formatDate(task.due_date)}
            </div>
            {task.completed && <button className='remove-btn' type='button' onClick={() => handleRemoveTaskCompleted(task.id)}>
              ❌
            </button>}
          </div>
        </div>
      ))}
    </div>
  );
};

export default TaskList;
