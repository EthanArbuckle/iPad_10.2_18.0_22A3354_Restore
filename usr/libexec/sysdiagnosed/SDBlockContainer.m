@implementation SDBlockContainer

+ (id)containerWithName:(id)a3 forBlock:(id)a4 withTimeout:(double)a5 withDelegate:(id)a6
{
  id v9;
  id v10;
  id v11;
  SDBlockContainer *v12;
  SDBlockContainer *v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (v10)
  {
    v12 = -[SDContainer initWithName:andDestination:withDelegate:]([SDBlockContainer alloc], "initWithName:andDestination:withDelegate:", v9, 0, v11);
    v13 = v12;
    if (v12)
    {
      -[SDBlockContainer setBlock:](v12, "setBlock:", v10);
      -[SDTaskContainer setTimeout:](v13, "setTimeout:", a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      -[SDBlockContainer setPaths:](v13, "setPaths:", v14);

      -[SDBlockContainer setFlattenReturnedDirectoryPaths:](v13, "setFlattenReturnedDirectoryPaths:", 1);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100061738();
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v15, "stderrWrite:", CFSTR("Can't create a block container with nil block %@, block : %@"), v9, 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v16, "log:", CFSTR("Can't create a block container with nil block %@, block : %@"), v9, 0);

    v13 = 0;
  }

  return v13;
}

+ (id)containerWithName:(id)a3 forBlock:(id)a4 withTimeout:(double)a5 withDelegate:(id)a6 withCompletionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;

  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v17 = objc_msgSend((id)objc_opt_class(a1, v16), "containerWithName:forBlock:withTimeout:withDelegate:", v15, v14, v13, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  if (v18)
    objc_msgSend(v18, "setCompletionBlock:", v12);

  return v18;
}

- (void)end
{
  NSObject *v3;
  id v4;

  if (!-[SDBlockContainer finished](self, "finished"))
  {
    -[SDBlockContainer setFinished:](self, "setFinished:", 1);
    v3 = objc_claimAutoreleasedReturnValue(-[SDTaskContainer timeoutSource](self, "timeoutSource"));
    dispatch_source_cancel(v3);

    v4 = (id)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
    objc_msgSend(v4, "recordBlockTaskEnd");

  }
}

- (void)startTimeout
{
  _QWORD v3[5];

  -[SDTaskContainer timeout](self, "timeout");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100044024;
  v3[3] = &unk_100098F88;
  v3[4] = self;
  -[SDTaskContainer startTimeout:withHandler:](self, "startTimeout:withHandler:", v3);
}

- (BOOL)_execute
{
  void *v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  objc_msgSend(v3, "recordBlockTaskStart");

  global_queue = dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044168;
  block[3] = &unk_100098F88;
  block[4] = self;
  dispatch_async(v5, block);

  return 1;
}

- (NSMutableArray)paths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPaths:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (id)block
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (id)logBlock
{
  return self->_logBlock;
}

- (void)setLogBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)flattenReturnedDirectoryPaths
{
  return self->_flattenReturnedDirectoryPaths;
}

- (void)setFlattenReturnedDirectoryPaths:(BOOL)a3
{
  self->_flattenReturnedDirectoryPaths = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_logBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
