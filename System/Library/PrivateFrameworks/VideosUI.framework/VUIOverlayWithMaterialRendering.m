@implementation VUIOverlayWithMaterialRendering

- (VUIOverlayWithMaterialRendering)initWithIdentifier:(id)a3 rect:(CGRect)a4 croppedRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  id v14;
  VUIOverlayWithMaterialRendering *v15;
  uint64_t v16;
  NSString *identifier;
  objc_super v19;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.size.height;
  v10 = a4.size.width;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  v14 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VUIOverlayWithMaterialRendering;
  v15 = -[VUIOverlayWithMaterialRendering init](&v19, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v14, "copy");
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v16;

    v15->_rect.origin.x = v12;
    v15->_rect.origin.y = v11;
    v15->_rect.size.width = v10;
    v15->_rect.size.height = v9;
    v15->_croppedRect.origin.x = x;
    v15->_croppedRect.origin.y = y;
    v15->_croppedRect.size.width = width;
    v15->_croppedRect.size.height = height;
  }

  return v15;
}

- (VUIOverlayWithMaterialRendering)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (CGRect)croppedRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_croppedRect.origin.x;
  y = self->_croppedRect.origin.y;
  width = self->_croppedRect.size.width;
  height = self->_croppedRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCroppedRect:(CGRect)a3
{
  self->_croppedRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
