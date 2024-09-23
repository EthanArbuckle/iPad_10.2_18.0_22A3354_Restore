@implementation KTOptInWatcher

- (KTOptInWatcher)initWithTargetState:(unint64_t)a3
{
  KTOptInWatcher *v4;
  KTCondition *v5;
  KTOptInWatcher *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KTOptInWatcher;
  v4 = -[KTOptInWatcher init](&v8, "init");
  if (v4)
  {
    v5 = objc_alloc_init(KTCondition);
    -[KTOptInWatcher setTargetResolved:](v4, "setTargetResolved:", v5);

    -[KTOptInWatcher setTargetState:](v4, "setTargetState:", a3);
    v6 = v4;
  }

  return v4;
}

- (unint64_t)targetState
{
  return self->_targetState;
}

- (void)setTargetState:(unint64_t)a3
{
  self->_targetState = a3;
}

- (KTCondition)targetResolved
{
  return (KTCondition *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTargetResolved:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)loggableData
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLoggableData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggableData, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_targetResolved, 0);
}

@end
