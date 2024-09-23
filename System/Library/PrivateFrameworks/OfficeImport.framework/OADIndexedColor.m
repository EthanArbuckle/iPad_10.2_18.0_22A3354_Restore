@implementation OADIndexedColor

- (OADIndexedColor)initWithIndex:(unint64_t)a3
{
  OADIndexedColor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OADIndexedColor;
  result = -[OADIndexedColor init](&v5, sel_init);
  if (result)
    result->mIndex = a3;
  return result;
}

+ (id)indexedColorWithIndex:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIndex:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIndex:", self->mIndex);
  -[OADColor transforms](self, "transforms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);

  objc_msgSend(v5, "setTransforms:", v7);
  return v5;
}

- (unint64_t)index
{
  return self->mIndex;
}

- (id)colorFromPalette:(id)a3
{
  objc_msgSend(a3, "colorWithIndex:", self->mIndex);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)hash
{
  unint64_t mIndex;
  objc_super v4;

  mIndex = self->mIndex;
  v4.receiver = self;
  v4.super_class = (Class)OADIndexedColor;
  return -[OADColor hash](&v4, sel_hash) ^ mIndex;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[OADIndexedColor hash](self, "hash"), v5 == objc_msgSend(v4, "hash")))
  {
    v8.receiver = self;
    v8.super_class = (Class)OADIndexedColor;
    v6 = -[OADColor isEqual:](&v8, sel_isEqual_, v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
