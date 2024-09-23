@implementation WDFormField

- (WDFormField)initWithParagraph:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDFormField;
  return -[WDRun initWithParagraph:](&v4, sel_initWithParagraph_, a3);
}

- (unsigned)position
{
  return self->mPosition;
}

- (void)setPosition:(unsigned int)a3
{
  self->mPosition = a3;
}

- (BOOL)linkAbsolute
{
  return self->mLinkAbsolute;
}

- (void)setLinkAbsolute:(BOOL)a3
{
  self->mLinkAbsolute = a3;
}

- (BOOL)linkSpecifyingNamedLocation
{
  return self->mLinkSpecifyingNamedLocation;
}

- (void)setLinkSpecifyingNamedLocation:(BOOL)a3
{
  self->mLinkSpecifyingNamedLocation = a3;
}

- (id)namedLocation
{
  return self->mNamedLocation;
}

- (void)setNamedLocation:(id)a3
{
  objc_storeStrong((id *)&self->mNamedLocation, a3);
}

- (id)URI
{
  return self->mURI;
}

- (void)setURI:(id)a3
{
  objc_storeStrong((id *)&self->mURI, a3);
}

- (id)macName
{
  return self->mMacName;
}

- (void)setMacName:(id)a3
{
  objc_storeStrong((id *)&self->mMacName, a3);
}

- (id)dosName
{
  return self->mDosName;
}

- (void)setDosName:(id)a3
{
  objc_storeStrong((id *)&self->mDosName, a3);
}

- (int)runType
{
  return 16;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDFormField;
  -[WDRun description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDosName, 0);
  objc_storeStrong((id *)&self->mMacName, 0);
  objc_storeStrong((id *)&self->mURI, 0);
  objc_storeStrong((id *)&self->mNamedLocation, 0);
}

@end
