@implementation BKDisplayAnnotationCrosshatchedBackgroundStyle

- (void)applyToLayer:(id)a3 forContent:(id)a4
{
  id v5;
  CGPattern *v6;
  CGColorSpace *Pattern;
  CGColorSpace *v8;
  CGColorRef v9;
  uint64_t v10;
  CGColorRef v11;
  uint64_t v12;
  CGAffineTransform v13;
  CGPatternCallbacks callbacks;
  CGFloat components;
  CGRect v16;

  v5 = a3;
  objc_msgSend(v5, "bk_setBackgroundColorRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
  *(_OWORD *)&callbacks.version = unk_1000EA780;
  callbacks.releaseInfo = 0;
  CGAffineTransformMakeRotation(&v13, 1.0);
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = 16.0;
  v16.size.height = 16.0;
  v6 = CGPatternCreate(0, v16, &v13, 16.0, 16.0, kCGPatternTilingConstantSpacing, 1, &callbacks);
  Pattern = CGColorSpaceCreatePattern(0);
  if (Pattern)
  {
    v8 = Pattern;
    components = 1.0;
    v9 = CGColorCreateWithPattern(Pattern, v6, &components);
    if (v9)
    {
      v11 = v9;
      v12 = objc_opt_class(CAShapeLayer, v10);
      if ((objc_opt_isKindOfClass(self, v12) & 1) != 0)
        objc_msgSend(v5, "setFillColor:", v11);
      else
        objc_msgSend(v5, "setBackgroundColor:", v11);
      CFRelease(v11);
    }
    CFRelease(v8);
  }

}

@end
