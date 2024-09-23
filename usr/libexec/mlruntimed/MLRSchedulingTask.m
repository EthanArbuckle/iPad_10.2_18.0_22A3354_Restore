@implementation MLRSchedulingTask

- (MLRSchedulingTask)initWithBundleIdentifier:(id)a3 taskSource:(int64_t)a4 maxTimeLimit:(double)a5
{
  id v9;
  MLRSchedulingTask *v10;
  MLRSchedulingTask *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MLRSchedulingTask;
  v10 = -[MLRSchedulingTask init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_bundleIdentifier, a3);
    v11->_source = a4;
    v11->_maxTimeLimit = a5;
  }

  return v11;
}

- (MLRSchedulingTask)initWithBundleIdentifier:(id)a3 taskSource:(int64_t)a4
{
  return -[MLRSchedulingTask initWithBundleIdentifier:taskSource:maxTimeLimit:](self, "initWithBundleIdentifier:taskSource:maxTimeLimit:", a3, a4, 0.0);
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  void *v9;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MLRSchedulingTask bundleIdentifier](self, "bundleIdentifier"));
  v7 = -[MLRSchedulingTask source](self, "source");
  -[MLRSchedulingTask maxTimeLimit](self, "maxTimeLimit");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@(%@, %ld, %f)"), v5, v6, v7, v8));

  return v9;
}

- (int64_t)source
{
  return self->_source;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (double)maxTimeLimit
{
  return self->_maxTimeLimit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
