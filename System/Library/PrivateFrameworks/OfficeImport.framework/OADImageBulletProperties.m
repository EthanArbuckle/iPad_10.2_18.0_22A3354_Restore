@implementation OADImageBulletProperties

- (OADImageBulletProperties)initWithBlipRef:(id)a3
{
  objc_storeStrong((id *)&self->mImage, a3);
  return self;
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[OADBlipRef blip](self->mImage, "blip");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4[1], "blip");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)image
{
  return self->mImage;
}

- (unint64_t)hash
{
  return -[OADBlipRef hash](self->mImage, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mImage, 0);
}

@end
