@implementation MusicObjectPair

- (MusicObjectPair)initWithFirst:(id)a3 andSecond:(id)a4
{
  id v6;
  id v7;
  MusicObjectPair *v8;
  MusicObjectPair *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MusicObjectPair;
  v8 = -[MusicObjectPair init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[MusicObjectPair setFirst:](v8, "setFirst:", v6);
    -[MusicObjectPair setSecond:](v9, "setSecond:", v7);
  }

  return v9;
}

+ (id)pairWithFirst:(id)a3 andSecond:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithFirst:andSecond:", v7, v6);

  return v8;
}

- (id)first
{
  return self->_first;
}

- (void)setFirst:(id)a3
{
  objc_storeStrong(&self->_first, a3);
}

- (id)second
{
  return self->_second;
}

- (void)setSecond:(id)a3
{
  objc_storeStrong(&self->_second, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_second, 0);
  objc_storeStrong(&self->_first, 0);
}

@end
