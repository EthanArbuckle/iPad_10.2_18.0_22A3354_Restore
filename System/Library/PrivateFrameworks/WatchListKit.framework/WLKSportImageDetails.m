@implementation WLKSportImageDetails

- (WLKSportImageDetails)initWithDictionary:(id)a3
{
  id v4;
  WLKSportImageDetails *v5;
  void *v6;
  uint64_t v7;
  NSString *joeColor;
  uint64_t v9;
  NSString *url;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WLKSportImageDetails;
  v5 = -[WLKSportImageDetails init](&v13, sel_init);
  if (v5)
  {
    v5->_disableGradient = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", CFSTR("disableGradient"), 0);
    objc_msgSend(v4, "wlk_numberForKey:", CFSTR("height"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_height = objc_msgSend(v6, "integerValue");

    v5->_isP3 = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", CFSTR("isP3"), 0);
    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("joeColor"));
    v7 = objc_claimAutoreleasedReturnValue();
    joeColor = v5->_joeColor;
    v5->_joeColor = (NSString *)v7;

    v5->_supportsLayeredImage = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", CFSTR("supportsLayeredImage"), 0);
    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("url"));
    v9 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSString *)v9;

    objc_msgSend(v4, "wlk_numberForKey:", CFSTR("width"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_width = objc_msgSend(v11, "integerValue");

  }
  return v5;
}

- (BOOL)disableGradient
{
  return self->_disableGradient;
}

- (int64_t)height
{
  return self->_height;
}

- (BOOL)isP3
{
  return self->_isP3;
}

- (NSString)joeColor
{
  return self->_joeColor;
}

- (BOOL)supportsLayeredImage
{
  return self->_supportsLayeredImage;
}

- (NSString)url
{
  return self->_url;
}

- (int64_t)width
{
  return self->_width;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_joeColor, 0);
}

@end
