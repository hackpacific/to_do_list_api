# To Do List API with DEMO

This is a To Do list API for front end projects. It has a user table and a task table.

## API endpoints

Before you start, create a new user account by sending a post request to '/users'. It will return an object like this:

```
{ success: true, id: 1 }
```

The id will be your api_key for making requests to the following tasks endpoints.

Tasks

<table>
  <thead>
    <tr>
      <td>URI</td>
      <td>Type</td>
      <td>Description</td>
      <td>Request Body</td>
      <td>Sample Response</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>/tasks?api_key=your_user_id</td>
      <td>GET</td>
      <td>Returns an object with a tasks property that contains an array of tasks belonging to you.</td>
      <td>N/A</td>
      <td>
<pre>{
  tasks: [
    { id: 1,
      content: 'A to do list task',
      complete: 'false',
      created_at: DateObject
    },
    { id: 2,
      content: 'Another to do list task',
      complete: 'true',
      created_at: DateObject
    },
  ]
}</pre>
      </td>
    </tr>
    <tr>
      <td>/tasks?api_key=your_user_id</td>
      <td>POST</td>
      <td>Creates a new task under your user account.</td>
      <td>
<pre>{
  task: {
    content: 'This is a task'
  }
}
</pre>
      </td>
      <td>
<pre>{
  task: {
    id: 1,
    content: 'This is a task',
    complete: 'false',
    created_at: DateObject
  }
}</pre>
      </td>
    </tr>
    <tr>
      <td>/tasks/:id/mark_complete?api_key=your_user_id</td>
      <td>PUT</td>
      <td>Mark the complete property to true for the task specified by id.</td>
      <td>N/A
      </td>
      <td>
<pre>{
  task: {
    id: 1,
    content: 'This is a task',
    complete: 'true',
    created_at: DateObject,
    updated_at: DateObject
  }
}</pre>
      </td>
    </tr>
    <tr>
      <td>/tasks/:id/mark_active?api_key=your_user_id</td>
      <td>PUT</td>
      <td>Mark the complete property to false for the task specified by id.</td>
      <td>N/A
      </td>
      <td>
<pre>{
  task: {
    id: 1,
    content: 'This is a task',
    complete: 'false',
    created_at: DateObject,
    updated_at: DateObject
  }
}</pre>
      </td>
    </tr>
    <tr>
      <td>/tasks/:id?api_key=your_user_id</td>
      <td>DELETE</td>
      <td>Delete the task specified by id.</td>
      <td>N/A
      </td>
      <td>
<pre>{
  success: true
}</pre>
      </td>
    </tr>
  </tbody>
</table>

## DEMO

The To Do List Demo is located at /demo. It uses the user id 1 to make requests.

## Running the server locally

After downloading the repository
Install the gems

```
bundle
```

Create the database

```
rake db:create
```

Start server:

```
rails s
```

Visit localhost:3000 to see the homepage
# Twitter Project

To start server:

```
rails s
```
