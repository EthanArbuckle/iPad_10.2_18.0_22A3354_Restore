@implementation OADBulletFontSpecification

- (OADBulletFontSpecification)initWithFont:(id)a3
{
  id v4;
  NSString *v5;
  NSString *mFont;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  mFont = self->mFont;
  self->mFont = v5;

  return self;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *mFont;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    mFont = self->mFont;
    objc_msgSend(v4, "font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSString isEqual:](mFont, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)font
{
  return self->mFont;
}

- (unint64_t)hash
{
  return -[NSString hash](self->mFont, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFont, 0);
}

@end
