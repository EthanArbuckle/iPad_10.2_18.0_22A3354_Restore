@implementation OADBulletColorSpecification

- (OADBulletColorSpecification)initWithBulletColor:(id)a3
{
  objc_storeStrong((id *)&self->mColor, a3);
  return self;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  OADColor *mColor;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    mColor = self->mColor;
    objc_msgSend(v4, "color");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[OADColor isEqual:](mColor, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)color
{
  return self->mColor;
}

- (unint64_t)hash
{
  return -[OADColor hash](self->mColor, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColor, 0);
}

@end
