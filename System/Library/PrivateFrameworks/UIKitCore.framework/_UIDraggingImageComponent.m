@implementation _UIDraggingImageComponent

- (_UIDraggingImageComponent)initWithImage:(id)a3 frame:(CGRect)a4 ignoreAccessibilityFilters:(BOOL)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  _UIDraggingImageComponent *v13;
  _UIDraggingImageComponent *v14;
  objc_super v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  if (!v12)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("image must be non-nil"));
  v16.receiver = self;
  v16.super_class = (Class)_UIDraggingImageComponent;
  v13 = -[_UIDraggingImageComponent init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_image, a3);
    v14->_ignoresAccessibilityFilters = a5;
    v14->_frame.origin.x = x;
    v14->_frame.origin.y = y;
    v14->_frame.size.width = width;
    v14->_frame.size.height = height;
  }

  return v14;
}

- (_UIDraggingImageComponent)initWithView:(id)a3
{
  id v5;
  id *v6;
  _UIDraggingImageComponent *v7;

  v5 = a3;
  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("view must be non-nil"));
  objc_msgSend(v5, "bounds");
  v6 = -[_UIDraggingImageComponent _initWithNoImageAndFrame:](self, "_initWithNoImageAndFrame:");
  v7 = (_UIDraggingImageComponent *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 2, a3);
    v7->_ignoresAccessibilityFilters = objc_msgSend(v5, "accessibilityIgnoresInvertColors");
  }

  return v7;
}

- (id)initHidingDragImage
{
  id result;

  result = -[_UIDraggingImageComponent _initWithNoImageAndFrame:](self, "_initWithNoImageAndFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (result)
    *((_BYTE *)result + 9) = 1;
  return result;
}

- (id)_initWithNoImageAndFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id result;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)_UIDraggingImageComponent;
  result = -[_UIDraggingImageComponent init](&v8, sel_init);
  if (result)
  {
    *((CGFloat *)result + 4) = x;
    *((CGFloat *)result + 5) = y;
    *((CGFloat *)result + 6) = width;
    *((CGFloat *)result + 7) = height;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  UIImage *image;
  void *v6;
  void *v7;
  CGRect v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  image = self->_image;
  -[_UIDraggingImageComponent frame](self, "frame");
  NSStringFromCGRect(v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p image=%@ frame=%@>"), v4, self, image, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (UIView)view
{
  return self->_view;
}

- (UIImage)image
{
  return self->_image;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)ignoresAccessibilityFilters
{
  return self->_ignoresAccessibilityFilters;
}

- (BOOL)hidesImage
{
  return self->_hidesImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
