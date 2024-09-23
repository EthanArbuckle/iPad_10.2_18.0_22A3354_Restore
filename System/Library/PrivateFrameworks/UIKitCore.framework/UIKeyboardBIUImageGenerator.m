@implementation UIKeyboardBIUImageGenerator

- (UIKeyboardBIUImageGenerator)init
{
  UIKeyboardBIUImageGenerator *v2;
  uint64_t v3;
  UIColor *tintColor;
  uint64_t v5;
  UIColor *normalColor;
  uint64_t v7;
  NSMutableDictionary *imageCache;
  void *v9;
  uint64_t v10;
  UIImage *biuBoldImage;
  uint64_t v12;
  UIImage *biuItalicImage;
  uint64_t v14;
  UIImage *biuUnderlineImage;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)UIKeyboardBIUImageGenerator;
  v2 = -[UIKeyboardBIUImageGenerator init](&v17, sel_init);
  if (v2)
  {
    +[UIColor systemBlueColor](UIColor, "systemBlueColor");
    v3 = objc_claimAutoreleasedReturnValue();
    tintColor = v2->_tintColor;
    v2->_tintColor = (UIColor *)v3;

    +[UIColor blackColor](UIColor, "blackColor");
    v5 = objc_claimAutoreleasedReturnValue();
    normalColor = v2->_normalColor;
    v2->_normalColor = (UIColor *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    imageCache = v2->_imageCache;
    v2->_imageCache = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__accessibilitySettingsChanged_, CFSTR("UIAccessibilityButtonShapesEnabledStatusDidChangeNotification"), 0);

    v2->_useButtonShapes = _AXSButtonShapesEnabled() != 0;
    +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("UIButtonBarKeyboardBIUBold"));
    v10 = objc_claimAutoreleasedReturnValue();
    biuBoldImage = v2->_biuBoldImage;
    v2->_biuBoldImage = (UIImage *)v10;

    +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("UIButtonBarKeyboardBIUItalic"));
    v12 = objc_claimAutoreleasedReturnValue();
    biuItalicImage = v2->_biuItalicImage;
    v2->_biuItalicImage = (UIImage *)v12;

    +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("UIButtonBarKeyboardBIUUnderline"));
    v14 = objc_claimAutoreleasedReturnValue();
    biuUnderlineImage = v2->_biuUnderlineImage;
    v2->_biuUnderlineImage = (UIImage *)v14;

  }
  return v2;
}

- (void)_invalidateCache
{
  -[NSMutableDictionary removeAllObjects](self->_imageCache, "removeAllObjects");
}

- (void)setTintColor:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[UIColor isEqual:](self->_tintColor, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_tintColor, a3);
    -[UIKeyboardBIUImageGenerator _invalidateCache](self, "_invalidateCache");
  }

}

- (void)setNormalColor:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[UIColor isEqual:](self->_normalColor, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_normalColor, a3);
    -[UIKeyboardBIUImageGenerator _invalidateCache](self, "_invalidateCache");
  }

}

- (void)_accessibilitySettingsChanged:(id)a3
{
  _BOOL4 v4;

  v4 = _AXSButtonShapesEnabled() != 0;
  if (self->_useButtonShapes != v4)
  {
    self->_useButtonShapes = v4;
    -[UIKeyboardBIUImageGenerator _invalidateCache](self, "_invalidateCache");
  }
}

- (void)_drawBIUAtSize:(CGSize)a3 bold:(BOOL)a4 italic:(BOOL)a5 underline:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  double height;
  CGFloat width;
  _QWORD *ContextStack;
  CGContext *v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  height = a3.height;
  width = a3.width;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
  {
    v13 = 0;
    if (!v8)
      goto LABEL_7;
  }
  else
  {
    v13 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    if (!v8)
      goto LABEL_7;
  }
  -[UIImage drawAtPoint:](self->_biuBoldImage, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  if (self->_useButtonShapes)
  {
    v14.origin.y = height + -3.0;
    v14.origin.x = 3.0;
    v14.size.width = 3.0;
    v14.size.height = 3.0;
    CGContextFillEllipseInRect(v13, v14);
  }
LABEL_7:
  if (v7)
  {
    -[UIImage drawAtPoint:](self->_biuItalicImage, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    if (self->_useButtonShapes)
    {
      v15.origin.y = height + -3.0;
      v15.origin.x = 14.0;
      v15.size.width = 3.0;
      v15.size.height = 3.0;
      CGContextFillEllipseInRect(v13, v15);
    }
  }
  if (v6)
  {
    -[UIImage drawAtPoint:](self->_biuUnderlineImage, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    if (self->_useButtonShapes)
    {
      v16.origin.y = height + -3.0;
      v16.origin.x = 25.0;
      v16.size.width = 3.0;
      v16.size.height = 3.0;
      CGContextFillEllipseInRect(v13, v16);
    }
  }
  -[UIColor setFill](self->_tintColor, "setFill");
  v17.origin.x = 0.0;
  v17.origin.y = 0.0;
  v17.size.width = width;
  v17.size.height = height;
  UIRectFillUsingBlendMode(v17, kCGBlendModeSourceIn);
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = width;
  v18.size.height = height;
  CGContextBeginTransparencyLayerWithRect(v13, v18, 0);
  if (v8)
  {
    if (v7)
      goto LABEL_15;
LABEL_19:
    -[UIImage drawAtPoint:](self->_biuItalicImage, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    if (v6)
      goto LABEL_17;
    goto LABEL_16;
  }
  -[UIImage drawAtPoint:](self->_biuBoldImage, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  if (!v7)
    goto LABEL_19;
LABEL_15:
  if (!v6)
LABEL_16:
    -[UIImage drawAtPoint:](self->_biuUnderlineImage, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
LABEL_17:
  -[UIColor setFill](self->_normalColor, "setFill");
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = width;
  v19.size.height = height;
  UIRectFillUsingBlendMode(v19, kCGBlendModeSourceIn);
  CGContextEndTransparencyLayer(v13);
}

- (id)BIUImageForBold:(BOOL)a3 italic:(BOOL)a4 underline:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  id v21;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v9 = 2;
  if (!a4)
    v9 = 0;
  v10 = 4;
  if (!a5)
    v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9 | a3 | v10 | 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_imageCache, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[UIImage size](self->_biuBoldImage, "size");
    v15 = v14;
    if (self->_useButtonShapes)
      v16 = v13 + 6.0;
    else
      v16 = v13;
    -[UIImage scale](self->_biuBoldImage, "scale");
    _UIGraphicsBeginImageContextWithOptions(0, 0, v15, v16, v17);
    -[UIKeyboardBIUImageGenerator _drawBIUAtSize:bold:italic:underline:](self, "_drawBIUAtSize:bold:italic:underline:", v7, v6, v5, v15, v16);
    _UIGraphicsGetImageFromCurrentImageContext(0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    if (self->_useButtonShapes)
      v19 = -8.0;
    else
      v19 = -2.0;
    objc_msgSend(v18, "imageWithAlignmentRectInsets:", 0.0, 0.0, v19, 0.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "imageWithRenderingMode:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_imageCache, "setObject:forKeyedSubscript:", v12, v11);
  }
  v21 = v12;

  return v21;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (UIColor)normalColor
{
  return self->_normalColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_biuUnderlineImage, 0);
  objc_storeStrong((id *)&self->_biuItalicImage, 0);
  objc_storeStrong((id *)&self->_biuBoldImage, 0);
}

@end
