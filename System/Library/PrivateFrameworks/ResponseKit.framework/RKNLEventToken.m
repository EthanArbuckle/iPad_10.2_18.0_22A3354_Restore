@implementation RKNLEventToken

- (RKNLEventToken)initWithString:(id)a3 location:(int64_t)a4 length:(int64_t)a5
{
  id v9;
  RKNLEventToken *v10;
  RKNLEventToken *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RKNLEventToken;
  v10 = -[RKNLEventToken init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_string, a3);
    v11->_location = a4;
    v11->_length = a5;
  }

  return v11;
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unsigned)tokenID
{
  return self->_tokenID;
}

- (void)setTokenID:(unsigned int)a3
{
  self->_tokenID = a3;
}

- (int64_t)location
{
  return self->_location;
}

- (void)setLocation:(int64_t)a3
{
  self->_location = a3;
}

- (int64_t)length
{
  return self->_length;
}

- (void)setLength:(int64_t)a3
{
  self->_length = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
