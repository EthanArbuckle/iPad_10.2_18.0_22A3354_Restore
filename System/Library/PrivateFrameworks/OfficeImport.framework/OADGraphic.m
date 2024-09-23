@implementation OADGraphic

- (id)graphicProperties
{
  return self->super.mDrawableProperties;
}

- (id)masterGraphic
{
  return self->mMasterGraphic;
}

- (void)setMasterGraphic:(id)a3
{
  objc_storeStrong((id *)&self->mMasterGraphic, a3);
}

- (id)geometry
{
  return 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADGraphic;
  -[OADDrawable description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMasterGraphic, 0);
}

@end
