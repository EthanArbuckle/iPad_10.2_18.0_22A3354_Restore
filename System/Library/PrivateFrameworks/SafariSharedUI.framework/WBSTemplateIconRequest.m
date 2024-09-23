@implementation WBSTemplateIconRequest

- (WBSTemplateIconRequest)initWithURL:(id)a3 title:(id)a4 monogramConfiguration:(id)a5 overrideForegroundColor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  WBSTemplateIconRequest *v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    v15 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("monogramTitleExtraInfoKey"));

  }
  if (v12)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("monogramConfigurationExtraInfoKey"));
  if (v13)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("overrideForegroundColorKey"));
  v18.receiver = self;
  v18.super_class = (Class)WBSTemplateIconRequest;
  v16 = -[WBSSiteMetadataRequest initWithURL:extraInfo:](&v18, sel_initWithURL_extraInfo_, v10, v14);

  return v16;
}

- (NSString)monogramTitle
{
  void *v2;
  void *v3;

  -[WBSSiteMetadataRequest extraInfo](self, "extraInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("monogramTitleExtraInfoKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (WBSTemplateIconMonogramConfiguration)monogramConfiguration
{
  void *v2;
  void *v3;

  -[WBSSiteMetadataRequest extraInfo](self, "extraInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("monogramConfigurationExtraInfoKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WBSTemplateIconMonogramConfiguration *)v3;
}

- (UIColor)overrideForegroundColor
{
  void *v2;
  void *v3;

  -[WBSSiteMetadataRequest extraInfo](self, "extraInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("overrideForegroundColorKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

@end
