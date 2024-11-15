@implementation OADBevel

- (OADBevel)init
{
  OADBevel *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OADBevel;
  result = -[OADBevel init](&v8, sel_init);
  if (result)
  {
    result->mType = 2;
    __asm { FMOV            V0.2S, #6.0 }
    *(_QWORD *)&result->mWidth = _D0;
  }
  return result;
}

- (void)setWidth:(float)a3
{
  self->mWidth = a3;
}

- (void)setHeight:(float)a3
{
  self->mHeight = a3;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->mType;
  *((_DWORD *)result + 3) = LODWORD(self->mWidth);
  *((_DWORD *)result + 4) = LODWORD(self->mHeight);
  return result;
}

- (int)type
{
  return self->mType;
}

- (float)width
{
  return self->mWidth;
}

- (float)height
{
  return self->mHeight;
}

- (unint64_t)hash
{
  return (unint64_t)self->mWidth ^ self->mType ^ (unint64_t)self->mHeight;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int mType;
  float mWidth;
  float v9;
  float mHeight;
  float v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  v5 = v4;
  v6 = v5;
  if (!v5)
    goto LABEL_7;
  mType = self->mType;
  if (mType != objc_msgSend(v5, "type"))
    goto LABEL_7;
  mWidth = self->mWidth;
  objc_msgSend(v6, "width");
  if (mWidth != v9)
    goto LABEL_7;
  mHeight = self->mHeight;
  objc_msgSend(v6, "height");
  v12 = mHeight == v11;
LABEL_8:

  return v12;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADBevel;
  -[OADBevel description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
