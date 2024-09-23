@implementation _HUDRow

- (_HUDRow)initWithName:(id)a3
{
  id v5;
  _HUDRow *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_HUDRow;
  v6 = -[_HUDRow init](&v8, sel_init);
  if (v6)
  {
    if (v5 && objc_msgSend(v5, "length"))
    {
      objc_storeStrong((id *)&v6->_name, a3);
    }
    else
    {

      v6 = 0;
    }
  }

  return v6;
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
