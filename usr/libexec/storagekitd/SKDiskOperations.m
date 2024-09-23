@implementation SKDiskOperations

- (SKDiskOperations)initWithWholeDiskOperation:(id)a3
{
  id v4;
  SKDiskOperations *v5;
  NSDictionary *v6;
  NSDictionary *wholeDiskOperation;
  uint64_t v8;
  NSMutableArray *childrenOperations;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKDiskOperations;
  v5 = -[SKDiskOperations init](&v11, "init");
  if (v5)
  {
    v6 = (NSDictionary *)objc_msgSend(v4, "copy");
    wholeDiskOperation = v5->_wholeDiskOperation;
    v5->_wholeDiskOperation = v6;

    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    childrenOperations = v5->_childrenOperations;
    v5->_childrenOperations = (NSMutableArray *)v8;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskOperations wholeDiskOperation](self, "wholeDiskOperation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", off_100051A50));
  v7 = objc_msgSend(v4, "isEqual:", v6);

  return v7;
}

- (NSDictionary)wholeDiskOperation
{
  return self->_wholeDiskOperation;
}

- (void)setWholeDiskOperation:(id)a3
{
  objc_storeStrong((id *)&self->_wholeDiskOperation, a3);
}

- (NSMutableArray)childrenOperations
{
  return self->_childrenOperations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childrenOperations, 0);
  objc_storeStrong((id *)&self->_wholeDiskOperation, 0);
}

@end
