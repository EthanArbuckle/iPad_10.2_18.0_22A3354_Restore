@implementation SKTaskExecuter

- (SKTaskExecuter)initWithTasks:(id)a3
{
  id v5;
  SKTaskExecuter *v6;
  SKTaskExecuter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKTaskExecuter;
  v6 = -[SKTaskExecuter init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_tasks, a3);

  return v7;
}

- (BOOL)waitWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  int v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  unsigned int v29;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskExecuter tasks](self, "tasks"));
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &stru_100044D48);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskExecuter tasks](self, "tasks"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_100044D88));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", v7));

  if (objc_msgSend(v8, "count"))
  {
    do
    {
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", &stru_100044DA8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskExecuter tasks](self, "tasks"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_100044DC8));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filteredArrayUsingPredicate:", v10));

      v8 = v11;
    }
    while (objc_msgSend(v11, "count"));
  }
  else
  {
    v11 = v8;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskExecuter tasks](self, "tasks"));
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", &stru_100044DE8);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskExecuter tasks](self, "tasks"));
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", &stru_100044E08);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskExecuter tasks](self, "tasks"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_100044E28));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "filteredArrayUsingPredicate:", v15));

  v17 = objc_msgSend(v16, "count");
  if (v17)
  {
    v18 = sub_10000BA9C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(v16, "count");
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", 0));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "task"));
      v24 = 136315650;
      v25 = "-[SKTaskExecuter waitWithError:]";
      v26 = 2048;
      v27 = v20;
      v28 = 1024;
      v29 = objc_msgSend(v22, "terminationStatus");
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s: %lu tasks failed, first exit status %d", (uint8_t *)&v24, 0x1Cu);

    }
    if (a3)
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", 140, 0));
  }

  return v17 == 0;
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
