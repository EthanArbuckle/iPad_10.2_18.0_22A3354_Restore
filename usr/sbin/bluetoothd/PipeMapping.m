@implementation PipeMapping

- (PipeMapping)initWithIdentifier:(id)a3 handle:(unsigned __int16)a4
{
  id v7;
  PipeMapping *v8;
  PipeMapping *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PipeMapping;
  v8 = -[PipeMapping init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_pipeHandle = a4;
  }

  return v9;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("identifier:%@ handle:%#06x"), self->_identifier, self->_pipeHandle);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unsigned)pipeHandle
{
  return self->_pipeHandle;
}

- (void)setPipeHandle:(unsigned __int16)a3
{
  self->_pipeHandle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
