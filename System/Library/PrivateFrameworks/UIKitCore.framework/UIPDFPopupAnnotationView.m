@implementation UIPDFPopupAnnotationView

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPDFPopupAnnotationView;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  UIImage *image;
  UIImage *v6;
  UIImage *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v16;
  _QWORD *ContextStack;
  CGContext *v18;
  CGColor *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  if (-[UIPDFPageView showAnnotations](-[UIPDFAnnotationController pageView](-[UIPDFAnnotation annotationController](-[UIPDFAnnotationView annotation](self, "annotation", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height), "annotationController"), "pageView"), "showAnnotations"))
  {
    v4 = (void *)-[UIPDFAnnotation parent](-[UIPDFAnnotationView annotation](self, "annotation"), "parent");
    image = self->_image;
    if (image
      || (v6 = (UIImage *)objc_msgSend((id)objc_msgSend(v4, "annotationController"), "marginNoteImage:", v4),
          self->_image = v6,
          v7 = v6,
          (image = self->_image) != 0))
    {
      -[UIImage size](image, "size");
      v9 = v8;
      v11 = v10;
      -[UIView bounds](self, "bounds");
      x = v24.origin.x;
      y = v24.origin.y;
      width = v24.size.width;
      height = v24.size.height;
      v16 = CGRectGetWidth(v24) - v9;
      v25.origin.x = x;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      -[UIImage drawInRect:](self->_image, "drawInRect:", v16 * 0.5, (CGRectGetHeight(v25) - v11) * 0.5, v9, v11);
    }
    else
    {
      ContextStack = GetContextStack(0);
      if (*(int *)ContextStack < 1)
        v18 = 0;
      else
        v18 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
      v19 = (CGColor *)objc_msgSend(v4, "color");
      CGContextSaveGState(v18);
      CGContextSetFillColorWithColor(v18, v19);
      -[UIView bounds](self, "bounds");
      CGContextFillRect(v18, v26);
      CGContextSetStrokeColorWithColor(v18, -[UIColor CGColor](+[UIColor blackColor](UIColor, "blackColor"), "CGColor"));
      -[UIView bounds](self, "bounds");
      v28 = CGRectInset(v27, 2.0, 2.0);
      v20 = v28.origin.x;
      v21 = v28.origin.y;
      v22 = v28.size.width;
      v23 = v28.size.height;
      CGContextSetLineWidth(v18, 1.0);
      v29.origin.x = v20;
      v29.origin.y = v21;
      v29.size.width = v22;
      v29.size.height = v23;
      CGContextStrokeRect(v18, v29);
      CGContextRestoreGState(v18);
    }
  }
}

@end
