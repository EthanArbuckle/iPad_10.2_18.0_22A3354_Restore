@implementation GKNetworkRequestInfo

- (GKNetworkRequestInfo)init
{
  GKNetworkRequestInfo *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *currentTasks;
  NSMutableDictionary *v5;
  NSMutableDictionary *pendingRequests;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKNetworkRequestInfo;
  v2 = -[GKNetworkRequestInfo init](&v8, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    currentTasks = v2->_currentTasks;
    v2->_currentTasks = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = v5;

  }
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestInfo currentTasks](self, "currentTasks"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestInfo pendingRequests](self, "pendingRequests"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The current tasks are: %@ the pending tasks are:%@"), v3, v4));

  return v5;
}

- (NSMutableDictionary)currentTasks
{
  return self->_currentTasks;
}

- (void)setCurrentTasks:(id)a3
{
  objc_storeStrong((id *)&self->_currentTasks, a3);
}

- (NSMutableDictionary)pendingRequests
{
  return self->_pendingRequests;
}

- (void)setPendingRequests:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRequests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_currentTasks, 0);
}

@end
