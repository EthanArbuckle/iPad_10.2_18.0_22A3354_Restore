@implementation PDURLSessionProxyMessageInfo

- (PDURLSessionProxyMessageInfo)initWithMessage:(id)a3 type:(unsigned __int16)a4
{
  id v7;
  PDURLSessionProxyMessageInfo *v8;
  PDURLSessionProxyMessageInfo *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDURLSessionProxyMessageInfo;
  v8 = -[PDURLSessionProxyMessageInfo init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_message, a3);
    v9->_type = a4;
  }

  return v9;
}

- (PBCodable)message
{
  return (PBCodable *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMessage:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int16)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
