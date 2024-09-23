@implementation PRMutableEditingLookProperties

- (PRMutableEditingLookProperties)initWithTimeFontConfiguration:(id)a3 titlePosterColor:(id)a4
{
  id v6;
  id v7;
  PRMutableEditingLookProperties *v8;
  uint64_t v9;
  PRTimeFontConfiguration *timeFontConfiguration;
  uint64_t v11;
  PRPosterColor *titlePosterColor;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PRMutableEditingLookProperties;
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

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PREditingLookProperties initWithProperties:]([PREditingLookProperties alloc], "initWithProperties:", self);
}

- (PRTimeFontConfiguration)timeFontConfiguration
{
  return self->_timeFontConfiguration;
}

- (void)setTimeFontConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (PRPosterColor)titlePosterColor
{
  return self->_titlePosterColor;
}

- (void)setTitlePosterColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titlePosterColor, 0);
  objc_storeStrong((id *)&self->_timeFontConfiguration, 0);
}

@end
