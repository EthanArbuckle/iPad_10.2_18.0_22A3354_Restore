@implementation OADPlaceholderColor

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[OADColor transforms](self, "transforms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setTransforms:", v7);

  return v5;
}

- (id)colorForStyleColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[OADColor transforms](self, "transforms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transforms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(v5, "count") && (!v6 || !objc_msgSend(v6, "count")))
  {
    v7 = (void *)objc_msgSend(v4, "copy");

    v4 = v7;
    objc_msgSend(v7, "setTransforms:", v5);
  }

  return v4;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADPlaceholderColor;
  return -[OADColor hash](&v3, sel_hash);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)OADPlaceholderColor;
    v5 = -[OADColor isEqual:](&v7, sel_isEqual_, v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
