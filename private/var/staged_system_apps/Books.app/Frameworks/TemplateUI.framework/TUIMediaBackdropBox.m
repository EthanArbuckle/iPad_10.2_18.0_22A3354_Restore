@implementation TUIMediaBackdropBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIMediaBackdropLayout, a2);
}

+ (unint64_t)defaultRole
{
  return 1;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
  objc_storeStrong((id *)&self->_urlString, a3);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)load
{
  return self->_load;
}

- (void)setLoad:(unint64_t)a3
{
  self->_load = a3;
}

- (NSString)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (UIColor)fallbackColor
{
  return self->_fallbackColor;
}

- (void)setFallbackColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (NSString)resourceKind
{
  return self->_resourceKind;
}

- (void)setResourceKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)resourceInstance
{
  return self->_resourceInstance;
}

- (void)setResourceInstance:(id)a3
{
  objc_storeStrong(&self->_resourceInstance, a3);
}

- (id)resourceOptions
{
  return self->_resourceOptions;
}

- (void)setResourceOptions:(id)a3
{
  objc_storeStrong(&self->_resourceOptions, a3);
}

- (NSString)contentsGravity
{
  return self->_contentsGravity;
}

- (void)setContentsGravity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)crossfadesContents
{
  return self->_crossfadesContents;
}

- (void)setCrossfadesContents:(BOOL)a3
{
  self->_crossfadesContents = a3;
}

- (BOOL)continuousCorners
{
  return self->_continuousCorners;
}

- (void)setContinuousCorners:(BOOL)a3
{
  self->_continuousCorners = a3;
}

- (BOOL)shouldRasterize
{
  return self->_shouldRasterize;
}

- (void)setShouldRasterize:(BOOL)a3
{
  self->_shouldRasterize = a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentsGravity, 0);
  objc_storeStrong(&self->_resourceOptions, 0);
  objc_storeStrong(&self->_resourceInstance, 0);
  objc_storeStrong((id *)&self->_resourceKind, 0);
  objc_storeStrong((id *)&self->_fallbackColor, 0);
  objc_storeStrong((id *)&self->_blendMode, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end
