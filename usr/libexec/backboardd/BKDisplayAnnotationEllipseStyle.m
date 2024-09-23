@implementation BKDisplayAnnotationEllipseStyle

- (void)applyToLayer:(id)a3 forContent:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGPath *Mutable;
  id v23;
  CGRect v24;

  v5 = a3;
  v6 = a4;
  v8 = objc_opt_class(CAShapeLayer, v7);
  v9 = v5;
  v23 = v9;
  if (v8)
  {
    if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0)
      v10 = v23;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  v13 = objc_opt_class(BKDisplayAnnotationShapeContent, v12);
  v14 = v6;
  v15 = v14;
  if (v13)
  {
    if ((objc_opt_isKindOfClass(v14, v13) & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
  }
  else
  {
    v16 = 0;
  }
  v17 = v16;

  if (v11)
  {
    objc_msgSend(v17, "shapeSize");
    v19 = v18;
    v21 = v20;
    Mutable = CGPathCreateMutable();
    v24.origin.x = 0.0;
    v24.origin.y = 0.0;
    v24.size.width = v19;
    v24.size.height = v21;
    CGPathAddEllipseInRect(Mutable, 0, v24);
    objc_msgSend(v11, "setBounds:", 0.0, 0.0, v19, v21);
    objc_msgSend(v11, "setPath:", Mutable);
    CFRelease(Mutable);
  }

}

@end
