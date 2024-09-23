@implementation PendingCallback

- (int)type
{
  return self->_type;
}

- (unint64_t)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void)setTaskIdentifier:(unint64_t)a3
{
  self->_taskIdentifier = a3;
}

- (void)setArgs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (PendingCallback)initWithCallbackType:(int)a3 taskIdentifier:(unint64_t)a4 args:(id)a5
{
  uint64_t v6;
  id v8;
  PendingCallback *v9;
  PendingCallback *v10;
  objc_super v12;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PendingCallback;
  v9 = -[PendingCallback init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    -[PendingCallback setType:](v9, "setType:", v6);
    -[PendingCallback setTaskIdentifier:](v10, "setTaskIdentifier:", a4);
    -[PendingCallback setArgs:](v10, "setArgs:", v8);
  }

  return v10;
}

- (NSArray)args
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_args, 0);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[PendingCallback type](self, "type"), CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[PendingCallback taskIdentifier](self, "taskIdentifier"), CFSTR("taskIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PendingCallback args](self, "args"));
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("args"));

}

- (PendingCallback)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  -[PendingCallback setType:](self, "setType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type")));
  -[PendingCallback setTaskIdentifier:](self, "setTaskIdentifier:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("taskIdentifier")));
  v5 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSArray), CFSTR("args"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[PendingCallback setArgs:](self, "setArgs:", v6);

  return self;
}

- (BOOL)hasBeenCalled
{
  return self->_hasBeenCalled;
}

- (void)setHasBeenCalled:(BOOL)a3
{
  self->_hasBeenCalled = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
