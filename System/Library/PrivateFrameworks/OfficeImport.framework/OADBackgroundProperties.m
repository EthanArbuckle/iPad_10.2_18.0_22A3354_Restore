@implementation OADBackgroundProperties

- (void)setFill:(id)a3
{
  objc_storeStrong((id *)&self->mFill, a3);
}

- (id)fill
{
  return self->mFill;
}

- (void)setEffects:(id)a3
{
  objc_storeStrong((id *)&self->mEffects, a3);
}

- (id)effects
{
  return self->mEffects;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  objc_object **v5;
  char v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = (objc_object **)v4;
    if ((TCObjectEqual((objc_object *)self->mFill, v5[1]) & 1) != 0)
      v6 = TCObjectEqual((objc_object *)self->mEffects, v5[2]);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[OADFill hash](self->mFill, "hash");
  return -[NSArray count](self->mEffects, "count") + v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mEffects, 0);
  objc_storeStrong((id *)&self->mFill, 0);
}

@end
