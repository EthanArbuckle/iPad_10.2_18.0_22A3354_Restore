@implementation TUIVisibilityChangeRecord

- (TUIVisibilityChangeRecord)initWithLastTimestamp:(double)a3 timestamp:(double)a4 rootNode:(id)a5
{
  id v9;
  TUIVisibilityChangeRecord *v10;
  TUIVisibilityChangeRecord *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TUIVisibilityChangeRecord;
  v10 = -[TUIVisibilityChangeRecord init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    v10->_lastTimestamp = a3;
    v10->_timestamp = a4;
    objc_storeStrong((id *)&v10->_rootNode, a5);
  }

  return v11;
}

- (double)lastTimestamp
{
  return self->_lastTimestamp;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (TUIVisibilityChangeNode)rootNode
{
  return self->_rootNode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootNode, 0);
}

@end
