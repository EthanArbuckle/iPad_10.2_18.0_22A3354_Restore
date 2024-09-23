@implementation OADFillOverlayEffect

- (OADFillOverlayEffect)init
{
  OADFillOverlayEffect *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADFillOverlayEffect;
  result = -[OADEffect initWithType:](&v3, sel_initWithType_, 5);
  if (result)
    *(&result->super.mType + 1) = 0;
  return result;
}

- (void)setBlendMode:(int)a3
{
  *(&self->super.mType + 1) = a3;
}

- (void)setFill:(id)a3
{
  objc_storeStrong((id *)&self->mBlendMode, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)objc_msgSend(*(id *)&self->mBlendMode, "copyWithZone:", a3);
  objc_msgSend(v5, "setFill:", v6);
  objc_msgSend(v5, "setBlendMode:", *((unsigned int *)&self->super.mType + 1));

  return v5;
}

- (int)blendMode
{
  return *(&self->super.mType + 1);
}

- (id)fill
{
  return *(id *)&self->mBlendMode;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = objc_msgSend(*(id *)&self->mBlendMode, "hash");
  v4 = *((unsigned int *)&self->super.mType + 1);
  v6.receiver = self;
  v6.super_class = (Class)OADFillOverlayEffect;
  return v3 ^ v4 ^ -[OADEffect hash](&v6, sel_hash);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = *(void **)&self->mBlendMode;
    objc_msgSend(v4, "fill");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6)
      && (v7 = *(&self->super.mType + 1), v7 == objc_msgSend(v4, "blendMode")))
    {
      v10.receiver = self;
      v10.super_class = (Class)OADFillOverlayEffect;
      v8 = -[OADEffect isEqual:](&v10, sel_isEqual_, v4);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADFillOverlayEffect;
  -[OADEffect description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBlendMode, 0);
}

@end
