@implementation NSOperation

- (id)ic_loggingIdentifier
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), self);
}

- (id)ic_loggingValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperation name](self, "name"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperation name](self, "name"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("name"));

  }
  if (-[NSOperation isExecuting](self, "isExecuting"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSOperation isExecuting](self, "isExecuting")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isExecuting"));

  }
  if (-[NSOperation isFinished](self, "isFinished"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSOperation isFinished](self, "isFinished")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isFinished"));

  }
  return v3;
}

- (id)ic_shortLoggingOperationName
{
  objc_class *v2;
  NSString *v3;
  void *v4;
  void *v5;

  v2 = (objc_class *)objc_opt_class(self, a2);
  v3 = NSStringFromClass(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v4));

  return v5;
}

@end
