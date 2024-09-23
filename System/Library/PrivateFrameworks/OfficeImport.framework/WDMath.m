@implementation WDMath

- (WDMath)initWithParagraph:(id)a3 xmlBlob:(id)a4
{
  id v6;
  id v7;
  WDMath *v8;
  WDMath *v9;
  uint64_t v10;
  NSString *xmlBlob;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WDMath;
  v8 = -[WDRun initWithParagraph:](&v13, sel_initWithParagraph_, v6);
  v9 = v8;
  if (v8)
  {
    v8->_justification = 0;
    v10 = objc_msgSend(v7, "copy");
    xmlBlob = v9->_xmlBlob;
    v9->_xmlBlob = (NSString *)v10;

  }
  return v9;
}

- (int)runType
{
  return 15;
}

- (void)clearProperties
{
  WDCharacterProperties *properties;

  properties = self->_properties;
  self->_properties = 0;

}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDMath;
  -[WDRun description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)justification
{
  return self->_justification;
}

- (void)setJustification:(int)a3
{
  self->_justification = a3;
}

- (WDCharacterProperties)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (NSString)xmlBlob
{
  return self->_xmlBlob;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xmlBlob, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
