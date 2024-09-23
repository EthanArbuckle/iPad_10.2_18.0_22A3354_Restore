@implementation SKRemoteTaskExecuter

- (SKRemoteTaskExecuter)initWithTasks:(id)a3
{
  id v5;
  SKRemoteTaskExecuter *v6;
  SKRemoteTaskExecuter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKRemoteTaskExecuter;
  v6 = -[SKRemoteTaskExecuter init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_tasks, a3);

  return v7;
}

- (BOOL)waitWithError:(id *)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKRemoteTaskExecuter tasks](self, "tasks", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "waitWithError:", a3))
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (NSArray)tasks
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
}

@end
