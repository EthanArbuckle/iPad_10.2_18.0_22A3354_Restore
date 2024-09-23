@implementation SDShareSheetProxyLoaderResult

- (id)description
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SDShareSheetProxyLoaderResult;
  v3 = -[SDShareSheetProxyLoaderResult description](&v11, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[SDShareSheetProxyLoaderResult state](self, "state");
  if (v5 > 2)
    v6 = 0;
  else
    v6 = *((_QWORD *)&off_100714BA8 + v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetProxyLoaderResult loadedIndexes](self, "loadedIndexes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetProxyLoaderResult failedIndexes](self, "failedIndexes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: state:%@ loadedIndex:%@ failedIndexes:%@"), v4, v6, v7, v8));

  return v9;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSIndexSet)loadedIndexes
{
  return self->_loadedIndexes;
}

- (void)setLoadedIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_loadedIndexes, a3);
}

- (NSIndexSet)failedIndexes
{
  return self->_failedIndexes;
}

- (void)setFailedIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_failedIndexes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedIndexes, 0);
  objc_storeStrong((id *)&self->_loadedIndexes, 0);
}

@end
