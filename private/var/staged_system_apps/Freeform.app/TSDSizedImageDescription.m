@implementation TSDSizedImageDescription

- (TSDSizedImageDescription)initWithSize:(CGSize)a3 isWideGamut:(BOOL)a4 hasBakedMask:(BOOL)a5
{
  CGFloat height;
  CGFloat width;
  TSDSizedImageDescription *result;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)TSDSizedImageDescription;
  result = -[TSDSizedImageDescription init](&v10, "init");
  if (result)
  {
    result->_size.width = width;
    result->_size.height = height;
    result->_isWideGamut = a4;
    result->_hasBakedMask = a5;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  BOOL v9;

  if (self == a3)
    return 1;
  v4 = a3;
  objc_opt_class(TSDSizedImageDescription, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
    v9 = -[TSDSizedImageDescription isEqualToSizedImageDescription:](self, "isEqualToSizedImageDescription:", v8);
  else
    v9 = 0;

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", self->_size.width, self->_size.height));
  v4 = (unint64_t)objc_msgSend(v3, "hash") ^ self->_isWideGamut ^ (unint64_t)self->_hasBakedMask;

  return v4;
}

- (BOOL)isEqualToSizedImageDescription:(id)a3
{
  TSDSizedImageDescription *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;

  v4 = (TSDSizedImageDescription *)a3;
  if (self == v4)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    -[TSDSizedImageDescription size](self, "size");
    v6 = v5;
    v8 = v7;
    -[TSDSizedImageDescription size](v4, "size");
    v11 = v6 == v10 && v8 == v9;
    if (v11
      && (v12 = -[TSDSizedImageDescription isWideGamut](self, "isWideGamut"),
          v12 == -[TSDSizedImageDescription isWideGamut](v4, "isWideGamut")))
    {
      v14 = -[TSDSizedImageDescription hasBakedMask](self, "hasBakedMask");
      v13 = v14 ^ -[TSDSizedImageDescription hasBakedMask](v4, "hasBakedMask") ^ 1;
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }

  return v13;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isWideGamut
{
  return self->_isWideGamut;
}

- (BOOL)hasBakedMask
{
  return self->_hasBakedMask;
}

@end
