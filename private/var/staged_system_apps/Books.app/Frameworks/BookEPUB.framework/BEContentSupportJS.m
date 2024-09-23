@implementation BEContentSupportJS

- (BEContentSupportJS)initWithMode:(unint64_t)a3 forDisplay:(BOOL)a4 imageFilterMode:(unint64_t)a5 lineGuideEnabled:(BOOL)a6
{
  return -[BEContentSupportJS initWithMode:forDisplay:attributes:imageFilterMode:lineGuideEnabled:](self, "initWithMode:forDisplay:attributes:imageFilterMode:lineGuideEnabled:", a3, a4, 0, a5, a6);
}

- (BEContentSupportJS)initWithMode:(unint64_t)a3 forDisplay:(BOOL)a4 attributes:(id)a5 imageFilterMode:(unint64_t)a6 lineGuideEnabled:(BOOL)a7
{
  id v12;
  BEContentSupportJS *v13;
  BEContentSupportJS *v14;
  NSDictionary *v15;
  NSDictionary *attributes;
  objc_super v18;

  v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)BEContentSupportJS;
  v13 = -[BEContentSupportJS init](&v18, "init");
  v14 = v13;
  if (v13)
  {
    v13->_mode = a3;
    v13->_forDisplay = a4;
    v15 = (NSDictionary *)objc_msgSend(v12, "copy");
    attributes = v14->_attributes;
    v14->_attributes = v15;

    v14->_imageFilterMode = a6;
    v14->_singleTapEnabled = 1;
    v14->_lineGuideEnabled = a7;
  }

  return v14;
}

- (int64_t)_interfaceLevel
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection"));
  v3 = objc_msgSend(v2, "be_contentSupportInterfaceLevel");

  return (int64_t)v3;
}

- (id)mainFrameOnlyJavascript:(int64_t)a3
{
  return 0;
}

- (id)mainFrameJavascriptURL:(int64_t)a3
{
  void *v3;
  id v4;
  void *v5;

  if (a3 == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[content_support sourceName](content_support, "sourceName"));
    v4 = BEJavascriptProviderUniqueURLForFilename((uint64_t)v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)anyFrameJavascript:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];
  _QWORD v19[3];

  if (a3)
  {
    if (self->_mode == 4)
      v4 = 0;
    else
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_content_support._updateImageVisibilityAndFilter(%lu);"),
                       -[BEContentSupportJS imageFilterMode](self, "imageFilterMode")));
  }
  else
  {
    v18[0] = CFSTR("mode");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_mode));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
    v7 = (void *)v6;
    v8 = CFSTR("0");
    if (v6)
      v8 = (const __CFString *)v6;
    v19[0] = v8;
    v18[1] = CFSTR("configuration");
    v9 = sub_4CBC(self->_forDisplay, -[BEContentSupportJS _interfaceLevel](self, "_interfaceLevel"), -[BEContentSupportJS imageFilterMode](self, "imageFilterMode"), self->_singleTapEnabled, self->_lineGuideEnabled);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v19[1] = v10;
    v18[2] = CFSTR("image_mime_types");
    v11 = BESupportedImageMimeTypesJSON();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v19[2] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 3));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[content_support source](content_support, "source"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BESimpleTemplate javascriptStringFromJavascriptSource:replacements:](BESimpleTemplate, "javascriptStringFromJavascriptSource:replacements:", v14, v13));

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[BEContentSupportJS _javascriptForAttributes:](BEContentSupportJS, "_javascriptForAttributes:", self->_attributes));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", v15));

  return v16;
}

- (id)anyFrameJavascriptURL:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;

  if (a3)
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[content_support sourceName](content_support, "sourceName"));
    v5 = BEJavascriptProviderUniqueURLForFilename((uint64_t)v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v5);

  }
  return v3;
}

+ (NSString)performAfterLoad
{
  return (NSString *)CFSTR("__ibooks_content_support._performAfterLoad()");
}

+ (id)javascriptForDocumentTheme:(id)a3 level:(int64_t)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("BKFlowingBookViewControllerInvertImagesKey"));

  v8 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v9 = (void *)v8;
  v10 = CFSTR("0");
  if (v7)
    v10 = CFSTR("1");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_content_support.setDocumentTheme('%@','%@','%@');"),
                    v5,
                    v8,
                    v10));

  return v11;
}

+ (id)javascriptForUpdatedDisplaySetting:(BOOL)a3 imageFilterMode:(unint64_t)a4 lineGuideEnabled:(BOOL)a5
{
  id v5;
  void *v6;
  void *v7;

  v5 = sub_4CBC(a3, 0, a4, 1, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_content_support.updateConfiguration('%@')"), v6));

  return v7;
}

+ (id)javascriptForSwappingAllImages
{
  return CFSTR("__ibooks_content_support.useBookProtocolForAllImages()");
}

+ (id)javascriptForUpdatedImageFilterMode:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_content_support.refetchVisibleImages(%@)"), v4));

  return v5;
}

+ (id)javascriptForUpdatedLineGuideDisplayEnabled:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_content_support.updateLineGuideEnabledStatus(%@)"), v4));

  return v5;
}

+ (id)javascriptForUpdatedLineGuideDisplayChange
{
  return CFSTR("__ibooks_content_support.notifyNativeOfVisibleElementCFIs()");
}

+ (id)_javascriptForAttributes:(id)a3
{
  void *v3;
  id v4;
  __CFString *v5;

  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", a3, 4, 0));
    v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v3, 4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_content_support.setDocumentAttributes('%@');"),
                           v4));

  }
  else
  {
    v5 = &stru_38FF08;
  }
  return v5;
}

- (unint64_t)imageFilterMode
{
  return self->_imageFilterMode;
}

- (BOOL)lineGuideEnabled
{
  return self->_lineGuideEnabled;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (BOOL)forDisplay
{
  return self->_forDisplay;
}

- (void)setForDisplay:(BOOL)a3
{
  self->_forDisplay = a3;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)singleTapEnabled
{
  return self->_singleTapEnabled;
}

- (void)setSingleTapEnabled:(BOOL)a3
{
  self->_singleTapEnabled = a3;
}

- (NSDictionary)configurationDictionary
{
  return self->_configurationDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationDictionary, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
