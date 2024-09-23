@implementation WDPicture

- (BOOL)hasContent
{
  return self->super.mDrawable != 0;
}

- (int)runType
{
  return 4;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDPicture;
  -[WDOfficeArt description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
