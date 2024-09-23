@implementation UIKBRenderFactory_Composite

- (Class)_overlayFactoryClass
{
  return 0;
}

- (UIKBRenderFactory_Composite)initWithRenderingContext:(id)a3 skipLayoutSegments:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  UIKBRenderFactory_Composite *v7;
  UIKBRenderFactory_Composite *v8;
  uint64_t v9;
  UIKBRenderFactory *overlayFactory;
  objc_super v12;

  v4 = a4;
  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIKBRenderFactory_Composite;
  v7 = -[UIKBRenderFactory initWithRenderingContext:skipLayoutSegments:](&v12, sel_initWithRenderingContext_skipLayoutSegments_, v6, v4);
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(objc_alloc(-[UIKBRenderFactory_Composite _overlayFactoryClass](v7, "_overlayFactoryClass")), "initWithRenderingContext:skipLayoutSegments:", v6, v4);
    overlayFactory = v8->_overlayFactory;
    v8->_overlayFactory = (UIKBRenderFactory *)v9;

  }
  return v8;
}

- (UIEdgeInsets)wideShadowPaddleInsets
{
  IMP MethodImplementation;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  MethodImplementation = class_getMethodImplementation(-[UIKBRenderFactory_Composite _overlayFactoryClass](self, "_overlayFactoryClass"), a2);
  ((void (*)(UIKBRenderFactory *, SEL))MethodImplementation)(self->_overlayFactory, a2);
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (UIEdgeInsets)wideShadowPopupMenuInsets
{
  IMP MethodImplementation;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  MethodImplementation = class_getMethodImplementation(-[UIKBRenderFactory_Composite _overlayFactoryClass](self, "_overlayFactoryClass"), a2);
  ((void (*)(UIKBRenderFactory *, SEL))MethodImplementation)(self->_overlayFactory, a2);
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (UIEdgeInsets)variantPaddedFrameInsets
{
  IMP MethodImplementation;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  MethodImplementation = class_getMethodImplementation(-[UIKBRenderFactory_Composite _overlayFactoryClass](self, "_overlayFactoryClass"), a2);
  ((void (*)(UIKBRenderFactory *, SEL))MethodImplementation)(self->_overlayFactory, a2);
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (UIEdgeInsets)variantSymbolFrameInsets
{
  IMP MethodImplementation;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  MethodImplementation = class_getMethodImplementation(-[UIKBRenderFactory_Composite _overlayFactoryClass](self, "_overlayFactoryClass"), a2);
  ((void (*)(UIKBRenderFactory *, SEL))MethodImplementation)(self->_overlayFactory, a2);
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (CGPoint)variantSymbolTextOffset
{
  IMP MethodImplementation;
  double v5;
  double v6;
  CGPoint result;

  MethodImplementation = class_getMethodImplementation(-[UIKBRenderFactory_Composite _overlayFactoryClass](self, "_overlayFactoryClass"), a2);
  ((void (*)(UIKBRenderFactory *, SEL))MethodImplementation)(self->_overlayFactory, a2);
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)variantAnnotationTextOffset
{
  IMP MethodImplementation;
  double v5;
  double v6;
  CGPoint result;

  MethodImplementation = class_getMethodImplementation(-[UIKBRenderFactory_Composite _overlayFactoryClass](self, "_overlayFactoryClass"), a2);
  ((void (*)(UIKBRenderFactory *, SEL))MethodImplementation)(self->_overlayFactory, a2);
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)popupSymbolTextOffset
{
  IMP MethodImplementation;
  double v5;
  double v6;
  CGPoint result;

  MethodImplementation = class_getMethodImplementation(-[UIKBRenderFactory_Composite _overlayFactoryClass](self, "_overlayFactoryClass"), a2);
  ((void (*)(UIKBRenderFactory *, SEL))MethodImplementation)(self->_overlayFactory, a2);
  result.y = v6;
  result.x = v5;
  return result;
}

- (double)popupFontSize
{
  IMP MethodImplementation;
  double result;

  MethodImplementation = class_getMethodImplementation(-[UIKBRenderFactory_Composite _overlayFactoryClass](self, "_overlayFactoryClass"), a2);
  ((void (*)(UIKBRenderFactory *, SEL))MethodImplementation)(self->_overlayFactory, a2);
  return result;
}

- (BOOL)isTallPopup
{
  IMP MethodImplementation;

  MethodImplementation = class_getMethodImplementation(-[UIKBRenderFactory_Composite _overlayFactoryClass](self, "_overlayFactoryClass"), a2);
  return ((uint64_t (*)(UIKBRenderFactory *, SEL))MethodImplementation)(self->_overlayFactory, a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayFactory, 0);
}

@end
