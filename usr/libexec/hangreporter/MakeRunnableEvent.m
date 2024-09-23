@implementation MakeRunnableEvent

- (MakeRunnableEvent)initWithMadeRunnableByThreadID:(unint64_t)a3 atTime:(unint64_t)a4 inInterrupt:(BOOL)a5
{
  _BOOL8 v5;
  MakeRunnableEvent *v8;
  MakeRunnableEvent *v9;
  objc_super v11;

  v5 = a5;
  v11.receiver = self;
  v11.super_class = (Class)MakeRunnableEvent;
  v8 = -[MakeRunnableEvent init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[MakeRunnableEvent setMadeRunnableByThreadId:](v8, "setMadeRunnableByThreadId:", a3);
    -[MakeRunnableEvent setTimestamp:](v9, "setTimestamp:", a4);
    -[MakeRunnableEvent setInInterrupt:](v9, "setInInterrupt:", v5);
  }
  return v9;
}

- (unint64_t)madeRunnableByThreadId
{
  return self->_madeRunnableByThreadId;
}

- (void)setMadeRunnableByThreadId:(unint64_t)a3
{
  self->_madeRunnableByThreadId = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (BOOL)inInterrupt
{
  return self->_inInterrupt;
}

- (void)setInInterrupt:(BOOL)a3
{
  self->_inInterrupt = a3;
}

@end
