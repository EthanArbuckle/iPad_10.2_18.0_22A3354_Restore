@implementation CHDMarker

- (CHDMarker)init
{
  CHDMarker *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHDMarker;
  result = -[CHDMarker init](&v3, sel_init);
  if (result)
    *(_QWORD *)&result->mSize = 0xFFFFFFFF00000000;
  return result;
}

- (void)setGraphicProperties:(id)a3
{
  OADGraphicProperties *v5;
  OADGraphicProperties **p_mGraphicProperties;
  OADGraphicProperties *mGraphicProperties;
  OADGraphicProperties *v8;

  v5 = (OADGraphicProperties *)a3;
  mGraphicProperties = self->mGraphicProperties;
  p_mGraphicProperties = &self->mGraphicProperties;
  if (mGraphicProperties != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mGraphicProperties, a3);
    v5 = v8;
  }

}

- (void)setSize:(unsigned int)a3
{
  self->mSize = a3;
}

- (void)setStyle:(int)a3
{
  self->mStyle = a3;
}

- (id)graphicProperties
{
  return self->mGraphicProperties;
}

- (unsigned)size
{
  return self->mSize;
}

- (int)style
{
  return self->mStyle;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHDMarker;
  -[CHDMarker description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mGraphicProperties, 0);
}

@end
