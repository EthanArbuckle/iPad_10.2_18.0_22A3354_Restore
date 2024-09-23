@implementation PRImmutableEditingLookProperties

- (PRImmutableEditingLookProperties)initWithTimeFontConfiguration:(id)a3 titlePosterColor:(id)a4
{
  id v6;
  id v7;
  PRImmutableEditingLookProperties *v8;
  uint64_t v9;
  PRTimeFontConfiguration *timeFontConfiguration;
  uint64_t v11;
  PRPosterColor *titlePosterColor;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PRImmutableEditingLookProperties;
  v8 = -[PREditingLookProperties initWithTimeFontConfiguration:titlePosterColor:](&v14, sel_initWithTimeFontConfiguration_titlePosterColor_, v6, v7);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    timeFontConfiguration = v8->_timeFontConfiguration;
    v8->_timeFontConfiguration = (PRTimeFontConfiguration *)v9;

    v11 = objc_msgSend(v7, "copy");
    titlePosterColor = v8->_titlePosterColor;
    v8->_titlePosterColor = (PRPosterColor *)v11;

  }
  return v8;
}

- (id)timeFontConfiguration
{
  return self->_timeFontConfiguration;
}

- (id)titlePosterColor
{
  return self->_titlePosterColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titlePosterColor, 0);
  objc_storeStrong((id *)&self->_timeFontConfiguration, 0);
}

@end
