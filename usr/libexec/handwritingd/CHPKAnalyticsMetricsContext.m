@implementation CHPKAnalyticsMetricsContext

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CHPKAnalyticsMetricsContext;
  v4 = a3;
  -[CHPKAnalyticsMetricsContext encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CHPKAnalyticsMetricsContext fingerDrawingEnabled](self, "fingerDrawingEnabled", v5.receiver, v5.super_class), CFSTR("UIPencilOnlyDrawWithPencilKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CHPKAnalyticsMetricsContext scribbleEnabled](self, "scribbleEnabled"), CFSTR("ApplePencilTextInputEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CHPKAnalyticsMetricsContext liveTextToggleEnabled](self, "liveTextToggleEnabled"), CFSTR("LiveTextEnabledKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CHPKAnalyticsMetricsContext liveTextSupportedByPrimaryLanguage](self, "liveTextSupportedByPrimaryLanguage"), CFSTR("LiveTextSupportedByPrimaryLanguageKey"));

}

- (CHPKAnalyticsMetricsContext)initWithCoder:(id)a3
{
  id v4;
  CHPKAnalyticsMetricsContext *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CHPKAnalyticsMetricsContext;
  v5 = -[CHPKAnalyticsMetricsContext initWithCoder:](&v7, "initWithCoder:", v4);
  if (v5)
  {
    v5->_fingerDrawingEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIPencilOnlyDrawWithPencilKey"));
    v5->_scribbleEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ApplePencilTextInputEnabled"));
    v5->_liveTextToggleEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("LiveTextEnabledKey"));
    v5->_liveTextSupportedByPrimaryLanguage = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("LiveTextSupportedByPrimaryLanguageKey"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  _BYTE *v7;

  v4 = objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHPKAnalyticsMetricsContext inputLanguage](self, "inputLanguage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHPKAnalyticsMetricsContext inputRegion](self, "inputRegion"));
  v7 = objc_msgSend(v4, "initWithInputLanguage:inputRegion:", v5, v6);

  v7[8] = self->_fingerDrawingEnabled;
  v7[9] = self->_scribbleEnabled;
  v7[10] = self->_liveTextToggleEnabled;
  v7[11] = self->_liveTextSupportedByPrimaryLanguage;
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CHPKAnalyticsMetricsContext *v4;
  CHPKAnalyticsMetricsContext *v5;
  uint64_t v6;
  CHPKAnalyticsMetricsContext *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v13;
  objc_super v14;

  v4 = (CHPKAnalyticsMetricsContext *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v11) = 1;
  }
  else if (v4
         && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0)
         && (v14.receiver = self,
             v14.super_class = (Class)CHPKAnalyticsMetricsContext,
             -[CHPKAnalyticsMetricsContext isEqual:](&v14, "isEqual:", v5)))
  {
    v7 = v5;
    v8 = -[CHPKAnalyticsMetricsContext fingerDrawingEnabled](v7, "fingerDrawingEnabled");
    if (v8 == -[CHPKAnalyticsMetricsContext fingerDrawingEnabled](self, "fingerDrawingEnabled")
      && (v9 = -[CHPKAnalyticsMetricsContext scribbleEnabled](v7, "scribbleEnabled"),
          v9 == -[CHPKAnalyticsMetricsContext scribbleEnabled](self, "scribbleEnabled"))
      && (v10 = -[CHPKAnalyticsMetricsContext liveTextToggleEnabled](v7, "liveTextToggleEnabled"),
          v10 == -[CHPKAnalyticsMetricsContext liveTextToggleEnabled](self, "liveTextToggleEnabled")))
    {
      v13 = -[CHPKAnalyticsMetricsContext liveTextSupportedByPrimaryLanguage](v7, "liveTextSupportedByPrimaryLanguage");
      v11 = v13 ^ -[CHPKAnalyticsMetricsContext liveTextSupportedByPrimaryLanguage](self, "liveTextSupportedByPrimaryLanguage") ^ 1;
    }
    else
    {
      LOBYTE(v11) = 0;
    }

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (BOOL)fingerDrawingEnabled
{
  return self->_fingerDrawingEnabled;
}

- (void)setFingerDrawingEnabled:(BOOL)a3
{
  self->_fingerDrawingEnabled = a3;
}

- (BOOL)scribbleEnabled
{
  return self->_scribbleEnabled;
}

- (void)setScribbleEnabled:(BOOL)a3
{
  self->_scribbleEnabled = a3;
}

- (BOOL)liveTextToggleEnabled
{
  return self->_liveTextToggleEnabled;
}

- (void)setLiveTextToggleEnabled:(BOOL)a3
{
  self->_liveTextToggleEnabled = a3;
}

- (BOOL)liveTextSupportedByPrimaryLanguage
{
  return self->_liveTextSupportedByPrimaryLanguage;
}

- (void)setLiveTextSupportedByPrimaryLanguage:(BOOL)a3
{
  self->_liveTextSupportedByPrimaryLanguage = a3;
}

@end
