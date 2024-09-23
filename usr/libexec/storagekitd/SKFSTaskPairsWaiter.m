@implementation SKFSTaskPairsWaiter

- (SKFSTaskPairsWaiter)initWithTaskPairs:(id)a3
{
  id v5;
  SKFSTaskPairsWaiter *v6;
  SKFSTaskPairsWaiter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKFSTaskPairsWaiter;
  v6 = -[SKFSTaskPairsWaiter init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_taskPairs, a3);

  return v7;
}

- (BOOL)waitWithError:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  intptr_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKFSTaskPairsWaiter taskPairs](self, "taskPairs"));
  v5 = objc_msgSend(v4, "mutableCopy");
  while (1)
  {

    if (!objc_msgSend(v5, "count"))
      break;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v5, "removeObjectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "msgHandler"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "group"));
    v8 = dispatch_time(0, 100000000);
    v9 = dispatch_group_wait(v7, v8);

    if (v9)
      objc_msgSend(v5, "addObject:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "msgHandler"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "msgHandler"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "error"));
      v14 = +[SKError failWithError:error:](SKError, "failWithError:error:", v13, a3);

      goto LABEL_8;
    }
  }
  v14 = 1;
LABEL_8:

  return v14;
}

- (NSArray)taskPairs
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTaskPairs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskPairs, 0);
}

@end
