@implementation VUIRemoteImageDescriptor

- (void)setClearsExisting:(BOOL)a3
{
  self->_clearsExisting = a3;
}

- (void)setTemplated:(BOOL)a3
{
  self->_templated = a3;
}

- (void)setRenderAsTemplate:(BOOL)a3
{
  self->_renderAsTemplate = a3;
}

- (void)setP3Specifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setExtension:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setCropCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setContinuousBorder:(BOOL)a3
{
  self->_continuousBorder = a3;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (void)setAccessibilityText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void)setShadow:(id)a3
{
  objc_storeStrong((id *)&self->_shadow, a3);
}

- (void)setHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColor, a3);
}

- (void)setBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_borderColor, a3);
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityText, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_placeholderSrc, 0);
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_cropCode, 0);
  objc_storeStrong((id *)&self->_p3Specifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_src, 0);
}

- (NSString)src
{
  return self->_src;
}

- (CGSize)downloadSize
{
  double width;
  double height;
  CGSize result;

  width = self->_downloadSize.width;
  height = self->_downloadSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSString)p3Specifier
{
  return self->_p3Specifier;
}

- (NSString)extension
{
  return self->_extension;
}

- (BOOL)displayScaleIsPointMultiplier
{
  return self->_displayScaleIsPointMultiplier;
}

- (NSString)cropCode
{
  return self->_cropCode;
}

- (CGSize)boundingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_boundingSize.width;
  height = self->_boundingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setScaleMode:(int64_t)a3
{
  self->_scaleMode = a3;
}

- (void)setPlaceholderColor:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderColor, a3);
}

- (int64_t)scaleMode
{
  return self->_scaleMode;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (NSString)accessibilityText
{
  return self->_accessibilityText;
}

- (VUIRemoteImageDescriptor)initWithSrc:(id)a3 size:(CGSize)a4 containerSize:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  double v7;
  double v8;
  id v11;
  VUIRemoteImageDescriptor *v12;
  VUIRemoteImageDescriptor *v13;
  BOOL v14;
  objc_super v16;

  height = a5.height;
  width = a5.width;
  v7 = a4.height;
  v8 = a4.width;
  v11 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VUIRemoteImageDescriptor;
  v12 = -[VUIRemoteImageDescriptor init](&v16, sel_init);
  v13 = v12;
  if (!v12 || (*MEMORY[0x1E0C9D820] == v8 ? (v14 = *(double *)(MEMORY[0x1E0C9D820] + 8) == v7) : (v14 = 0), v14))
  {

    v13 = 0;
  }
  else
  {
    objc_storeStrong((id *)&v12->_src, a3);
    v13->_boundingSize.width = v8;
    v13->_boundingSize.height = v7;
    v13->_containerSize.width = width;
    v13->_containerSize.height = height;
    v13->_aspectRatio = v8 / v7;
    *(_OWORD *)&v13->_decoratorType = xmmword_1D954F910;
    v13->_continuousBorder = 0;
    *(_OWORD *)&v13->_borderRadii.topLeft = VUICornerRadiiZero;
    *(_OWORD *)&v13->_borderRadii.bottomLeft = *(_OWORD *)&qword_1D954F8C0;
    v13->_sizeComputationOnly = 0;
    *(_WORD *)&v13->_optimizedImageRendering = 257;
  }

  return v13;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (void)setPlaceholderSrc:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setLoadsImmediately:(BOOL)a3
{
  self->_loadsImmediately = a3;
}

- (void)setDownloadSize:(CGSize)a3
{
  self->_downloadSize = a3;
}

- (void)setBorderRadii:(_VUICornerRadii)a3
{
  self->_borderRadii = a3;
}

- (NSString)placeholderSrc
{
  return self->_placeholderSrc;
}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (BOOL)optimizedImageRendering
{
  return self->_optimizedImageRendering;
}

- (BOOL)loadsImmediately
{
  return self->_loadsImmediately;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (unint64_t)decoratorType
{
  return self->_decoratorType;
}

- (CGSize)containerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_containerSize.width;
  height = self->_containerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)clearsExisting
{
  return self->_clearsExisting;
}

- (_VUICornerRadii)borderRadii
{
  double topLeft;
  double topRight;
  double bottomLeft;
  double bottomRight;
  _VUICornerRadii result;

  topLeft = self->_borderRadii.topLeft;
  topRight = self->_borderRadii.topRight;
  bottomLeft = self->_borderRadii.bottomLeft;
  bottomRight = self->_borderRadii.bottomRight;
  result.bottomRight = bottomRight;
  result.bottomLeft = bottomLeft;
  result.topRight = topRight;
  result.topLeft = topLeft;
  return result;
}

- (BOOL)animatesShadowChanges
{
  return self->_animatesShadowChanges;
}

- (VUIRemoteImageDescriptor)initWithSrc:(id)a3 size:(CGSize)a4
{
  return -[VUIRemoteImageDescriptor initWithSrc:size:containerSize:](self, "initWithSrc:size:containerSize:", a3, a4.width, a4.height, a4.width, a4.height);
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (void)setDisplayScaleIsPointMultiplier:(BOOL)a3
{
  self->_displayScaleIsPointMultiplier = a3;
}

- (BOOL)isTemplated
{
  return self->_templated;
}

- (BOOL)shouldRenderAsTemplate
{
  return self->_renderAsTemplate;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (int64_t)preferredVibrancy
{
  return self->_preferredVibrancy;
}

- (void)setPreferredVibrancy:(int64_t)a3
{
  self->_preferredVibrancy = a3;
}

- (void)setDecoratorType:(unint64_t)a3
{
  self->_decoratorType = a3;
}

- (BOOL)continuousBorder
{
  return self->_continuousBorder;
}

- (void)setAnimatesShadowChanges:(BOOL)a3
{
  self->_animatesShadowChanges = a3;
}

- (void)setOptimizedImageRendering:(BOOL)a3
{
  self->_optimizedImageRendering = a3;
}

- (BOOL)sizeComputationOnly
{
  return self->_sizeComputationOnly;
}

- (void)setSizeComputationOnly:(BOOL)a3
{
  self->_sizeComputationOnly = a3;
}

@end
