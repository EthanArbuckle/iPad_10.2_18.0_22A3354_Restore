@implementation TUIPair

- (TUIPair)initWithFirst:(id)a3 second:(id)a4
{
  id v7;
  id v8;
  TUIPair *v9;
  TUIPair *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUIPair;
  v9 = -[TUIPair init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_first, a3);
    objc_storeStrong(&v10->_second, a4);
  }

  return v10;
}

- (id)first
{
  return self->_first;
}

- (id)second
{
  return self->_second;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_second, 0);
  objc_storeStrong(&self->_first, 0);
}

@end
