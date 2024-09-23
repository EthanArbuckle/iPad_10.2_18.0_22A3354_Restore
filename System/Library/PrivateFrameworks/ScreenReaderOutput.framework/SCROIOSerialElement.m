@implementation SCROIOSerialElement

- (SCROIOSerialElement)initWithFileDescriptor:(int)a3
{
  SCROIOSerialElement *v4;
  SCROIOSerialElement *v5;
  unsigned int v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCROIOSerialElement;
  v4 = -[SCROIOSerialElement init](&v8, sel_init);
  v5 = v4;
  v4->_fileDescriptor = a3;
  do
    v6 = __ldxr((unsigned int *)&_currentIdentifier_0);
  while (__stxr(v6 + 1, (unsigned int *)&_currentIdentifier_0));
  -[SCROIOElement setIdentifier:](v4, "setIdentifier:");
  return v5;
}

- (int)transport
{
  return 16;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)SCROIOSerialElement;
  -[SCROIOSerialElement description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ fd: %d"), v4, self->_fileDescriptor);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (int)fileDescriptor
{
  return self->_fileDescriptor;
}

- (void)setFileDescriptor:(int)a3
{
  self->_fileDescriptor = a3;
}

@end
