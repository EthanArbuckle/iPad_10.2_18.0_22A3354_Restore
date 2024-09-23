@implementation PDSConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[PDSConfiguration queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueue:", v5);

  -[PDSConfiguration workloop](self, "workloop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWorkloop:", v6);

  -[PDSConfiguration daemonRootDirectory](self, "daemonRootDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setDaemonRootDirectory:", v8);

  -[PDSConfiguration pushHandlerPort](self, "pushHandlerPort");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setPushHandlerPort:", v10);

  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[PDSConfiguration queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDSConfiguration workloop](self, "workloop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDSConfiguration daemonRootDirectory](self, "daemonRootDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDSConfiguration pushHandlerPort](self, "pushHandlerPort");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; queue = %p; workloop = %p; daemonRootDirectory = %@; pushHandlerPort = %@>"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_workloop)workloop
{
  return self->_workloop;
}

- (void)setWorkloop:(id)a3
{
  objc_storeStrong((id *)&self->_workloop, a3);
}

- (NSURL)daemonRootDirectory
{
  return self->_daemonRootDirectory;
}

- (void)setDaemonRootDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_daemonRootDirectory, a3);
}

- (NSString)pushHandlerPort
{
  return self->_pushHandlerPort;
}

- (void)setPushHandlerPort:(id)a3
{
  objc_storeStrong((id *)&self->_pushHandlerPort, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushHandlerPort, 0);
  objc_storeStrong((id *)&self->_daemonRootDirectory, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
