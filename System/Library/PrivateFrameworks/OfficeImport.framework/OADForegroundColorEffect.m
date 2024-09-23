@implementation OADForegroundColorEffect

- (OADForegroundColorEffect)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADForegroundColorEffect;
  return -[OADBlipEffect initWithType:](&v3, sel_initWithType_, 6);
}

- (void)setForegroundColor:(id)a3
{
  objc_storeStrong((id *)&self->mForegroundColor, a3);
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v3 = -[OADColor hash](self->mForegroundColor, "hash");
  v5.receiver = self;
  v5.super_class = (Class)OADForegroundColorEffect;
  return -[OADBlipEffect hash](&v5, sel_hash) ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  OADColor *mForegroundColor;
  void *v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    mForegroundColor = self->mForegroundColor;
    objc_msgSend(v4, "foregroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[OADColor isEqual:](mForegroundColor, "isEqual:", v6))
    {
      v9.receiver = self;
      v9.super_class = (Class)OADForegroundColorEffect;
      v7 = -[OADBlipEffect isEqual:](&v9, sel_isEqual_, v4);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)foregroundColor
{
  return self->mForegroundColor;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[OADColor copyWithZone:](self->mForegroundColor, "copyWithZone:", a3);
  objc_msgSend(v5, "setForegroundColor:", v6);

  return v5;
}

- (void)setStyleColor:(id)a3
{
  id v4;

  -[OADColor colorForStyleColor:](self->mForegroundColor, "colorForStyleColor:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[OADForegroundColorEffect setForegroundColor:](self, "setForegroundColor:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mForegroundColor, 0);
}

@end
