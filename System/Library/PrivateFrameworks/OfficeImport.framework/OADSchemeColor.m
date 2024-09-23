@implementation OADSchemeColor

- (OADSchemeColor)initWithSchemeColorIndex:(int)a3
{
  OADSchemeColor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OADSchemeColor;
  result = -[OADSchemeColor init](&v5, sel_init);
  if (result)
    result->mIndex = a3;
  return result;
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
    && (v5 = -[OADSchemeColor hash](self, "hash"), v5 == objc_msgSend(v4, "hash")))
  {
    v8.receiver = self;
    v8.super_class = (Class)OADSchemeColor;
    v6 = -[OADColor isEqual:](&v8, sel_isEqual_, v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t mIndex;
  objc_super v4;

  mIndex = self->mIndex;
  v4.receiver = self;
  v4.super_class = (Class)OADSchemeColor;
  return -[OADColor hash](&v4, sel_hash) ^ mIndex;
}

- (int)schemeColorIndex
{
  return self->mIndex;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSchemeColorIndex:", self->mIndex);
  -[OADColor transforms](self, "transforms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);

  objc_msgSend(v5, "setTransforms:", v7);
  return v5;
}

+ (id)schemeColorWithIndex:(int)a3
{
  return -[OADSchemeColor initWithSchemeColorIndex:]([OADSchemeColor alloc], "initWithSchemeColorIndex:", *(_QWORD *)&a3);
}

@end
