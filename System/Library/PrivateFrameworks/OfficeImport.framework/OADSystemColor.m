@implementation OADSystemColor

- (OADSystemColor)initWithSystemColorID:(int)a3
{
  OADSystemColor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OADSystemColor;
  result = -[OADSystemColor init](&v5, sel_init);
  if (result)
    result->mSystemColorID = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSystemColorID:", self->mSystemColorID);
  -[OADColor transforms](self, "transforms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);

  objc_msgSend(v5, "setTransforms:", v7);
  return v5;
}

- (int)systemColorID
{
  return self->mSystemColorID;
}

- (unint64_t)hash
{
  uint64_t mSystemColorID;
  objc_super v4;

  mSystemColorID = self->mSystemColorID;
  v4.receiver = self;
  v4.super_class = (Class)OADSystemColor;
  return -[OADColor hash](&v4, sel_hash) ^ mSystemColorID;
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
    && (v5 = -[OADSystemColor hash](self, "hash"), v5 == objc_msgSend(v4, "hash")))
  {
    v8.receiver = self;
    v8.super_class = (Class)OADSystemColor;
    v6 = -[OADColor isEqual:](&v8, sel_isEqual_, v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
