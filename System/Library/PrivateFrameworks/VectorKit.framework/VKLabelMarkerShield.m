@implementation VKLabelMarkerShield

- (VKLabelMarkerShield)initWithImageKey:(id)a3
{
  id v5;
  VKLabelMarkerShield *v6;
  VKLabelMarkerShield *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKLabelMarkerShield;
  v6 = -[VKLabelMarkerShield init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_imageKey, a3);

  return v7;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)color
{
  float v2;
  float v3;
  float v4;
  float v5;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  -[VKImageSourceKey transitLineColor](self->_imageKey, "transitLineColor");
  result.var3 = v5;
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (NSString)text
{
  return -[VKImageSourceKey shieldText](self->_imageKey, "shieldText");
}

- (NSString)locale
{
  return -[VKImageSourceKey shieldTextLocale](self->_imageKey, "shieldTextLocale");
}

- (int64_t)type
{
  return -[VKImageSourceKey shieldType](self->_imageKey, "shieldType");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageKey, 0);
}

@end
