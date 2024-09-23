@implementation OADDuotoneEffect

- (OADDuotoneEffect)init
{
  OADDuotoneEffect *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADDuotoneEffect;
  result = -[OADBlipEffect initWithType:](&v3, sel_initWithType_, 5);
  if (result)
  {
    result->mTransferMode1 = 11;
    result->mTransferMode2 = 4;
  }
  return result;
}

- (void)setColor1:(id)a3
{
  objc_storeStrong((id *)&self->mColor1, a3);
}

- (void)setColor2:(id)a3
{
  objc_storeStrong((id *)&self->mColor2, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[OADColor copyWithZone:](self->mColor1, "copyWithZone:", a3);
  objc_msgSend(v5, "setColor1:", v6);
  v7 = -[OADColor copyWithZone:](self->mColor2, "copyWithZone:", a3);
  objc_msgSend(v5, "setColor2:", v7);

  return v5;
}

- (void)setStyleColor:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[OADColor colorForStyleColor:](self->mColor1, "colorForStyleColor:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADDuotoneEffect setColor1:](self, "setColor1:", v4);

  -[OADColor colorForStyleColor:](self->mColor2, "colorForStyleColor:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADDuotoneEffect setColor2:](self, "setColor2:", v5);

}

- (id)color1
{
  return self->mColor1;
}

- (id)color2
{
  return self->mColor2;
}

- (int)transferMode1
{
  return self->mTransferMode1;
}

- (void)setTransferMode1:(int)a3
{
  self->mTransferMode1 = a3;
}

- (int)transferMode2
{
  return self->mTransferMode2;
}

- (void)setTransferMode2:(int)a3
{
  self->mTransferMode2 = a3;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  objc_super v7;

  v3 = -[OADColor hash](self->mColor1, "hash");
  v4 = -[OADColor hash](self->mColor2, "hash") ^ v3;
  v5 = self->mTransferMode1 ^ (unint64_t)self->mTransferMode2;
  v7.receiver = self;
  v7.super_class = (Class)OADDuotoneEffect;
  return v4 ^ v5 ^ -[OADBlipEffect hash](&v7, sel_hash);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  OADColor *mColor1;
  void *v6;
  OADColor *mColor2;
  void *v8;
  int mTransferMode1;
  int mTransferMode2;
  BOOL v11;
  objc_super v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    mColor1 = self->mColor1;
    objc_msgSend(v4, "color1");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[OADColor isEqual:](mColor1, "isEqual:", v6))
    {
      mColor2 = self->mColor2;
      objc_msgSend(v4, "color2");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[OADColor isEqual:](mColor2, "isEqual:", v8)
        && (mTransferMode1 = self->mTransferMode1, mTransferMode1 == objc_msgSend(v4, "transferMode1"))
        && (mTransferMode2 = self->mTransferMode2, mTransferMode2 == objc_msgSend(v4, "transferMode2")))
      {
        v13.receiver = self;
        v13.super_class = (Class)OADDuotoneEffect;
        v11 = -[OADBlipEffect isEqual:](&v13, sel_isEqual_, v4);
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColor2, 0);
  objc_storeStrong((id *)&self->mColor1, 0);
}

@end
