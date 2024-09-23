@implementation PPTokenCount

- (PPTokenCount)initWithToken:(id)a3 count:(unsigned int)a4
{
  id v7;
  PPTokenCount *v8;
  PPTokenCount *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPTokenCount;
  v8 = -[PPTokenCount init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_token, a3);
    v9->_count = a4;
  }

  return v9;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (unsigned)count
{
  return self->_count;
}

- (void)setCount:(unsigned int)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
}

@end
