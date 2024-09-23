@implementation _UILegibilitySettings

- (double)imageOutset
{
  return self->_imageOutset;
}

- (NSString)shadowCompositingFilterName
{
  return self->_shadowCompositingFilterName;
}

- (double)shadowAlpha
{
  return self->_shadowAlpha;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (double)minFillHeight
{
  return self->_minFillHeight;
}

- (_UILegibilitySettings)initWithStyle:(int64_t)a3 primaryColor:(id)a4 secondaryColor:(id)a5 shadowColor:(id)a6
{
  _UILegibilitySettings *v9;
  _UILegibilitySettings *v10;

  v9 = -[_UILegibilitySettings initWithStyle:](self, "initWithStyle:", a3);
  v10 = v9;
  if (v9)
  {
    -[_UILegibilitySettings setPrimaryColor:](v9, "setPrimaryColor:", a4);
    -[_UILegibilitySettings setSecondaryColor:](v10, "setSecondaryColor:", a5);
    -[_UILegibilitySettings setShadowColor:](v10, "setShadowColor:", a6);
  }
  return v10;
}

- (_UILegibilitySettings)initWithStyle:(int64_t)a3 contentColor:(id)a4
{
  _UILegibilitySettings *v6;
  _UILegibilitySettings *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UILegibilitySettings;
  v6 = -[_UILegibilitySettings init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[_UILegibilitySettings setStyle:](v6, "setStyle:", a3);
    -[_UILegibilitySettings setMinFillHeight:](v7, "setMinFillHeight:", 20.0);
    -[_UILegibilitySettings setPropertiesForStyle:](v7, "setPropertiesForStyle:", a3);
    -[_UILegibilitySettings setContentColor:](v7, "setContentColor:", a4);
  }
  return v7;
}

- (void)setShadowColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void)setPropertiesForStyle:(int64_t)a3
{
  double v4;
  const __CFString *v5;
  double v6;

  if (a3 == 2)
  {
    v5 = CFSTR("lightenSourceOver");
LABEL_7:
    -[_UILegibilitySettings setShadowCompositingFilterName:](self, "setShadowCompositingFilterName:", v5);
    -[_UILegibilitySettings setShadowRadius:](self, "setShadowRadius:", 12.0);
    -[_UILegibilitySettings setShadowAlpha:](self, "setShadowAlpha:", 1.0);
    -[_UILegibilitySettings shadowRadius](self, "shadowRadius");
    v4 = v6 + v6;
    goto LABEL_8;
  }
  if (a3 == 1)
  {
    v5 = CFSTR("darkenSourceOver");
    goto LABEL_7;
  }
  if (a3)
    return;
  v4 = 0.0;
  -[_UILegibilitySettings setShadowRadius:](self, "setShadowRadius:", 0.0);
  -[_UILegibilitySettings setShadowAlpha:](self, "setShadowAlpha:", 0.0);
LABEL_8:
  -[_UILegibilitySettings setImageOutset:](self, "setImageOutset:", v4);
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (void)setShadowRadius:(double)a3
{
  self->_shadowRadius = a3;
}

- (void)setShadowCompositingFilterName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setShadowAlpha:(double)a3
{
  self->_shadowAlpha = a3;
}

- (void)setMinFillHeight:(double)a3
{
  self->_minFillHeight = a3;
}

- (void)setImageOutset:(double)a3
{
  self->_imageOutset = a3;
}

- (void)setContentColor:(id)a3
{
  UIColor *contentColor;
  int64_t v6;
  UIColor *v7;
  UIColor *v8;

  contentColor = self->_contentColor;
  self->_contentColor = (UIColor *)a3;

  v6 = -[_UILegibilitySettings style](self, "style");
  switch(v6)
  {
    case 2:
      if (a3)
        v8 = ComputeLegibilityColorFromColor(a3, 0.3);
      else
        v8 = +[UIColor blackColor](UIColor, "blackColor");
      -[_UILegibilitySettings setPrimaryColor:](self, "setPrimaryColor:", v8);
      -[_UILegibilitySettings setSecondaryColor:](self, "setSecondaryColor:", -[UIColor colorWithAlphaComponent:](-[_UILegibilitySettings primaryColor](self, "primaryColor"), "colorWithAlphaComponent:", 0.45));
      v7 = +[UIColor whiteColor](UIColor, "whiteColor");
      goto LABEL_13;
    case 1:
      -[_UILegibilitySettings setPrimaryColor:](self, "setPrimaryColor:", +[UIColor whiteColor](UIColor, "whiteColor"));
      -[_UILegibilitySettings setSecondaryColor:](self, "setSecondaryColor:", -[UIColor colorWithAlphaComponent:](-[_UILegibilitySettings primaryColor](self, "primaryColor"), "colorWithAlphaComponent:", 0.45));
      if (a3)
        v7 = ComputeLegibilityColorFromColor(a3, 0.25);
      else
        v7 = +[UIColor blackColor](UIColor, "blackColor");
      goto LABEL_13;
    case 0:
      -[_UILegibilitySettings setPrimaryColor:](self, "setPrimaryColor:", +[UIColor clearColor](UIColor, "clearColor"));
      -[_UILegibilitySettings setSecondaryColor:](self, "setSecondaryColor:", +[UIColor clearColor](UIColor, "clearColor"));
      v7 = +[UIColor clearColor](UIColor, "clearColor");
LABEL_13:
      -[_UILegibilitySettings setShadowColor:](self, "setShadowColor:", v7);
      break;
  }
}

- (int64_t)style
{
  return self->_style;
}

- (UIColor)primaryColor
{
  return self->_primaryColor;
}

- (void)setSecondaryColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setPrimaryColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BOOL)isEqual:(id)a3
{
  UIColor *contentColor;
  unint64_t v6;
  _BOOL4 v7;
  UIColor *primaryColor;
  unint64_t v9;
  UIColor *secondaryColor;
  unint64_t v11;
  unint64_t shadowColor;
  unint64_t v13;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && self->_style == *((_QWORD *)a3 + 1)
    && vabdd_f64(self->_shadowAlpha, *((double *)a3 + 7)) < 2.22044605e-16
    && vabdd_f64(self->_shadowRadius, *((double *)a3 + 6)) < 2.22044605e-16
    && vabdd_f64(self->_imageOutset, *((double *)a3 + 8)) < 2.22044605e-16
    && vabdd_f64(self->_minFillHeight, *((double *)a3 + 9)) < 2.22044605e-16)
  {
    contentColor = self->_contentColor;
    v6 = *((_QWORD *)a3 + 2);
    if (contentColor == (UIColor *)v6
      || !((unint64_t)contentColor | v6)
      || (v7 = -[UIColor _isSimilarToColor:withinPercentage:](contentColor, "_isSimilarToColor:withinPercentage:", 0.01)))
    {
      primaryColor = self->_primaryColor;
      v9 = *((_QWORD *)a3 + 3);
      if (primaryColor == (UIColor *)v9
        || !((unint64_t)primaryColor | v9)
        || (v7 = -[UIColor _isSimilarToColor:withinPercentage:](primaryColor, "_isSimilarToColor:withinPercentage:", 0.01)))
      {
        secondaryColor = self->_secondaryColor;
        v11 = *((_QWORD *)a3 + 4);
        if (secondaryColor == (UIColor *)v11
          || !((unint64_t)secondaryColor | v11)
          || (v7 = -[UIColor _isSimilarToColor:withinPercentage:](secondaryColor, "_isSimilarToColor:withinPercentage:", 0.01)))
        {
          shadowColor = (unint64_t)self->_shadowColor;
          v13 = *((_QWORD *)a3 + 5);
          LOBYTE(v7) = 1;
          if (shadowColor != v13 && shadowColor | v13)
            LOBYTE(v7) = -[UIColor _isSimilarToColor:withinPercentage:](self->_shadowColor, "_isSimilarToColor:withinPercentage:", 0.01);
        }
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_shadowCompositingFilterName = 0;
  self->_contentColor = 0;

  self->_primaryColor = 0;
  self->_secondaryColor = 0;

  self->_shadowColor = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UILegibilitySettings;
  -[_UILegibilitySettings dealloc](&v3, sel_dealloc);
}

- (UIColor)secondaryColor
{
  return self->_secondaryColor;
}

+ (id)sharedInstanceForStyle:(int64_t)a3
{
  uint64_t *v3;
  dispatch_once_t *v5;
  void *v6;

  if (a3 != 2)
  {
    if (qword_1ECD78B18 == -1)
    {
      v3 = &qword_1ECD78B20;
      return (id)*v3;
    }
    v5 = &qword_1ECD78B18;
    v6 = &__block_literal_global_93_1;
LABEL_9:
    dispatch_once(v5, v6);
    v3 = v5 + 1;
    return (id)*v3;
  }
  if (qword_1ECD78B28 != -1)
  {
    v5 = &qword_1ECD78B28;
    v6 = &__block_literal_global_96;
    goto LABEL_9;
  }
  v3 = &qword_1ECD78B30;
  return (id)*v3;
}

- (_UILegibilitySettings)initWithStyle:(int64_t)a3
{
  return -[_UILegibilitySettings initWithStyle:contentColor:](self, "initWithStyle:contentColor:", a3, 0);
}

- (UIColor)contentColor
{
  return self->_contentColor;
}

- (_UILegibilitySettings)initWithContentColor:(id)a3
{
  return -[_UILegibilitySettings initWithStyle:contentColor:](self, "initWithStyle:contentColor:", +[_UILegibilitySettingsProvider styleForContentColor:](_UILegibilitySettingsProvider, "styleForContentColor:"), a3);
}

- (_UILegibilitySettings)initWithContentColor:(id)a3 contrast:(double)a4
{
  return -[_UILegibilitySettings initWithStyle:contentColor:](self, "initWithStyle:contentColor:", +[_UILegibilitySettingsProvider styleForContentColor:contrast:](_UILegibilitySettingsProvider, "styleForContentColor:contrast:", a4), a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _UILegibilitySettings *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = -[_UILegibilitySettings initWithStyle:primaryColor:secondaryColor:shadowColor:](+[_UILegibilitySettings allocWithZone:](_UILegibilitySettings, "allocWithZone:", a3), "initWithStyle:primaryColor:secondaryColor:shadowColor:", self->_style, self->_primaryColor, self->_secondaryColor, self->_shadowColor);
  v4->_contentColor = (UIColor *)-[UIColor copy](-[_UILegibilitySettings contentColor](self, "contentColor"), "copy");
  -[_UILegibilitySettings shadowRadius](self, "shadowRadius");
  v4->_shadowRadius = v5;
  -[_UILegibilitySettings shadowAlpha](self, "shadowAlpha");
  v4->_shadowAlpha = v6;
  -[_UILegibilitySettings imageOutset](self, "imageOutset");
  v4->_imageOutset = v7;
  -[_UILegibilitySettings minFillHeight](self, "minFillHeight");
  v4->_minFillHeight = v8;
  v4->_shadowCompositingFilterName = (NSString *)-[NSString copy](-[_UILegibilitySettings shadowCompositingFilterName](self, "shadowCompositingFilterName"), "copy");
  return v4;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  int64_t style;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = CFSTR("_UILegibilityStyleDefault");
  style = self->_style;
  if (style == 2)
    v5 = CFSTR("_UILegibilityStyleDarkContentWithLightShadow");
  if (style == 1)
    v5 = CFSTR("_UILegibilityStyleLightContentWithDarkShadow");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; style: '%@' primaryColor: '%@' secondaryColor: '%@' shadowColor: '%@' contentColor: '%@'>"),
                       v4,
                       self,
                       v5,
                       self->_primaryColor,
                       self->_secondaryColor,
                       self->_shadowColor,
                       self->_contentColor);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", -[_UILegibilitySettings style](self, "style"), CFSTR("UILegibilityStyle"));
  objc_msgSend(a3, "encodeObject:forKey:", -[_UILegibilitySettings contentColor](self, "contentColor"), CFSTR("UILegibilityContentColor"));
  objc_msgSend(a3, "encodeObject:forKey:", -[_UILegibilitySettings primaryColor](self, "primaryColor"), CFSTR("UILegibilityPrimaryColor"));
  objc_msgSend(a3, "encodeObject:forKey:", -[_UILegibilitySettings secondaryColor](self, "secondaryColor"), CFSTR("UILegibilitySecondaryColor"));
  objc_msgSend(a3, "encodeObject:forKey:", -[_UILegibilitySettings shadowColor](self, "shadowColor"), CFSTR("UILegibilityShadowColor"));
  objc_msgSend(a3, "encodeObject:forKey:", -[_UILegibilitySettings shadowCompositingFilterName](self, "shadowCompositingFilterName"), CFSTR("UILegibilityShadowCompositingFilterName"));
  -[_UILegibilitySettings shadowRadius](self, "shadowRadius");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("UILegibilityShadowRadius"));
  -[_UILegibilitySettings shadowAlpha](self, "shadowAlpha");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("UILegibilityShadowAlpha"));
  -[_UILegibilitySettings imageOutset](self, "imageOutset");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("UILegibilityImageOutset"));
  -[_UILegibilitySettings minFillHeight](self, "minFillHeight");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("UILegibilityMinFillHeight"));
}

- (_UILegibilitySettings)initWithCoder:(id)a3
{
  _UILegibilitySettings *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UILegibilitySettings;
  v4 = -[_UILegibilitySettings init](&v6, sel_init);
  if (v4)
  {
    -[_UILegibilitySettings setStyle:](v4, "setStyle:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("UILegibilityStyle")));
    -[_UILegibilitySettings setContentColor:](v4, "setContentColor:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UILegibilityContentColor")));
    -[_UILegibilitySettings setPrimaryColor:](v4, "setPrimaryColor:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UILegibilityPrimaryColor")));
    -[_UILegibilitySettings setSecondaryColor:](v4, "setSecondaryColor:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UILegibilitySecondaryColor")));
    -[_UILegibilitySettings setShadowColor:](v4, "setShadowColor:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UILegibilityShadowColor")));
    -[_UILegibilitySettings setShadowCompositingFilterName:](v4, "setShadowCompositingFilterName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UILegibilityShadowCompositingFilterName")));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("UILegibilityShadowRadius"));
    -[_UILegibilitySettings setShadowRadius:](v4, "setShadowRadius:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("UILegibilityShadowAlpha"));
    -[_UILegibilitySettings setShadowAlpha:](v4, "setShadowAlpha:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("UILegibilityImageOutset"));
    -[_UILegibilitySettings setImageOutset:](v4, "setImageOutset:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("UILegibilityMinFillHeight"));
    -[_UILegibilitySettings setMinFillHeight:](v4, "setMinFillHeight:");
  }
  return v4;
}

- (_UILegibilitySettings)initWithXPCDictionary:(id)a3
{
  _UILegibilitySettings *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UILegibilitySettings;
  v4 = -[_UILegibilitySettings init](&v6, sel_init);
  if (v4)
  {
    -[_UILegibilitySettings setStyle:](v4, "setStyle:", xpc_dictionary_get_int64(a3, (const char *)objc_msgSend(CFSTR("UILegibilityStyle"), "UTF8String")));
    objc_opt_class();
    objc_msgSend(CFSTR("UILegibilityContentColor"), "UTF8String");
    -[_UILegibilitySettings setContentColor:](v4, "setContentColor:", BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey());
    objc_opt_class();
    objc_msgSend(CFSTR("UILegibilityPrimaryColor"), "UTF8String");
    -[_UILegibilitySettings setPrimaryColor:](v4, "setPrimaryColor:", BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey());
    objc_opt_class();
    objc_msgSend(CFSTR("UILegibilitySecondaryColor"), "UTF8String");
    -[_UILegibilitySettings setSecondaryColor:](v4, "setSecondaryColor:", BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey());
    objc_opt_class();
    objc_msgSend(CFSTR("UILegibilityShadowColor"), "UTF8String");
    -[_UILegibilitySettings setShadowColor:](v4, "setShadowColor:", BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey());
    objc_msgSend(CFSTR("UILegibilityShadowCompositingFilterName"), "UTF8String");
    -[_UILegibilitySettings setShadowCompositingFilterName:](v4, "setShadowCompositingFilterName:", BSDeserializeStringFromXPCDictionaryWithKey());
    -[_UILegibilitySettings setShadowRadius:](v4, "setShadowRadius:", xpc_dictionary_get_double(a3, (const char *)objc_msgSend(CFSTR("UILegibilityShadowRadius"), "UTF8String")));
    -[_UILegibilitySettings setShadowAlpha:](v4, "setShadowAlpha:", xpc_dictionary_get_double(a3, (const char *)objc_msgSend(CFSTR("UILegibilityShadowAlpha"), "UTF8String")));
    -[_UILegibilitySettings setImageOutset:](v4, "setImageOutset:", xpc_dictionary_get_double(a3, (const char *)objc_msgSend(CFSTR("UILegibilityImageOutset"), "UTF8String")));
    -[_UILegibilitySettings setMinFillHeight:](v4, "setMinFillHeight:", xpc_dictionary_get_double(a3, (const char *)objc_msgSend(CFSTR("UILegibilityMinFillHeight"), "UTF8String")));
  }
  return v4;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;

  xpc_dictionary_set_int64(a3, (const char *)objc_msgSend(CFSTR("UILegibilityStyle"), "UTF8String"), -[_UILegibilitySettings style](self, "style"));
  -[_UILegibilitySettings contentColor](self, "contentColor");
  objc_msgSend(CFSTR("UILegibilityContentColor"), "UTF8String");
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
  -[_UILegibilitySettings primaryColor](self, "primaryColor");
  objc_msgSend(CFSTR("UILegibilityPrimaryColor"), "UTF8String");
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
  -[_UILegibilitySettings secondaryColor](self, "secondaryColor");
  objc_msgSend(CFSTR("UILegibilitySecondaryColor"), "UTF8String");
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
  -[_UILegibilitySettings shadowColor](self, "shadowColor");
  objc_msgSend(CFSTR("UILegibilityShadowColor"), "UTF8String");
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
  -[_UILegibilitySettings shadowCompositingFilterName](self, "shadowCompositingFilterName");
  objc_msgSend(CFSTR("UILegibilityShadowCompositingFilterName"), "UTF8String");
  BSSerializeStringToXPCDictionaryWithKey();
  v5 = (const char *)objc_msgSend(CFSTR("UILegibilityShadowRadius"), "UTF8String");
  -[_UILegibilitySettings shadowRadius](self, "shadowRadius");
  xpc_dictionary_set_double(a3, v5, v6);
  v7 = (const char *)objc_msgSend(CFSTR("UILegibilityShadowAlpha"), "UTF8String");
  -[_UILegibilitySettings shadowAlpha](self, "shadowAlpha");
  xpc_dictionary_set_double(a3, v7, v8);
  v9 = (const char *)objc_msgSend(CFSTR("UILegibilityImageOutset"), "UTF8String");
  -[_UILegibilitySettings imageOutset](self, "imageOutset");
  xpc_dictionary_set_double(a3, v9, v10);
  v11 = (const char *)objc_msgSend(CFSTR("UILegibilityMinFillHeight"), "UTF8String");
  -[_UILegibilitySettings minFillHeight](self, "minFillHeight");
  xpc_dictionary_set_double(a3, v11, v12);
}

@end
