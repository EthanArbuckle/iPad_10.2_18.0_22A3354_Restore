@implementation STS18013RequestElement

- (STS18013RequestElement)initWithName:(id)a3 retention:(unsigned __int16)a4
{
  id v7;
  STS18013RequestElement *v8;
  STS18013RequestElement *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STS18013RequestElement;
  v8 = -[STS18013RequestElement init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_retention = a4;
  }

  return v9;
}

- (unsigned)retention
{
  return self->_retention;
}

- (void)setRetention:(unsigned __int16)a3
{
  self->_retention = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
