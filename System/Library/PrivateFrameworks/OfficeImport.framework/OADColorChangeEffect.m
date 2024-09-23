@implementation OADColorChangeEffect

- (OADColorChangeEffect)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADColorChangeEffect;
  return -[OADBlipEffect initWithType:](&v3, sel_initWithType_, 3);
}

- (void)setFromColor:(id)a3
{
  objc_storeStrong((id *)&self->mFromColor, a3);
}

- (void)setToColor:(id)a3
{
  objc_storeStrong((id *)&self->mToColor, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[OADColor copyWithZone:](self->mFromColor, "copyWithZone:", a3);
  objc_msgSend(v5, "setFromColor:", v6);
  v7 = -[OADColor copyWithZone:](self->mToColor, "copyWithZone:", a3);
  objc_msgSend(v5, "setToColor:", v7);

  return v5;
}

- (id)fromColor
{
  return self->mFromColor;
}

- (id)toColor
{
  return self->mToColor;
}

- (void)setStyleColor:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[OADColor colorForStyleColor:](self->mFromColor, "colorForStyleColor:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADColorChangeEffect setFromColor:](self, "setFromColor:", v4);

  -[OADColor colorForStyleColor:](self->mToColor, "colorForStyleColor:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADColorChangeEffect setToColor:](self, "setToColor:", v5);

}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  objc_super v6;

  v3 = -[OADColor hash](self->mFromColor, "hash");
  v4 = -[OADColor hash](self->mToColor, "hash") ^ v3;
  v6.receiver = self;
  v6.super_class = (Class)OADColorChangeEffect;
  return v4 ^ -[OADBlipEffect hash](&v6, sel_hash);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  OADColor *mFromColor;
  void *v6;
  OADColor *mToColor;
  void *v8;
  BOOL v9;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    mFromColor = self->mFromColor;
    objc_msgSend(v4, "fromColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[OADColor isEqual:](mFromColor, "isEqual:", v6))
    {
      mToColor = self->mToColor;
      objc_msgSend(v4, "toColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[OADColor isEqual:](mToColor, "isEqual:", v8))
      {
        v11.receiver = self;
        v11.super_class = (Class)OADColorChangeEffect;
        v9 = -[OADBlipEffect isEqual:](&v11, sel_isEqual_, v4);
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mToColor, 0);
  objc_storeStrong((id *)&self->mFromColor, 0);
}

@end
