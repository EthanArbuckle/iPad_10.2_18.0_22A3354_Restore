@implementation _UIFocusRegionDebugQuickLook

+ (void)drawDebugQuickLookImageForRegion:(id)a3 withInfo:(id)a4 inContext:(CGContext *)a5
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  CGPattern *v19;
  double v20;
  id v21;
  CGPattern *v22;
  CGPattern *v23;
  id v24;
  const CGFloat *Components;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v35 = a3;
  v7 = a4;
  objc_msgSend(v35, "_debugDrawingConfigurationWithDebugInfo:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "snapshot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "snapshotFrameForRegion:", v35);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    objc_msgSend(v8, "color");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (CGPattern *)objc_msgSend(v8, "pattern");
    v20 = 0.5;
    if (!v19)
      objc_msgSend(v8, "patternAlpha", 0.5);
    objc_msgSend(v18, "colorWithAlphaComponent:", v20);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(a5, (CGColorRef)objc_msgSend(v21, "CGColor"));

    v36.origin.x = v11;
    v36.origin.y = v13;
    v36.size.width = v15;
    v36.size.height = v17;
    CGContextFillRect(a5, v36);
    if (v19)
    {
      v22 = _UIFocusDebugImagePatternCreateWithType(v19, a5);
      v23 = _UIFocusDebugImagePatternCreateWithType(v22, a5);
      objc_msgSend(v8, "patternAlpha");
      objc_msgSend(v18, "colorWithAlphaComponent:");
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      Components = CGColorGetComponents((CGColorRef)objc_msgSend(v24, "CGColor"));
      CGContextSetFillPattern(a5, v23, Components);

      v37.origin.x = v11;
      v37.origin.y = v13;
      v37.size.width = v15;
      v37.size.height = v17;
      CGContextFillRect(a5, v37);
      CGPatternRelease(v23);
    }
    if (objc_msgSend(v8, "dashedStroke"))
    {
      +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v11, v13, v15, v17, 12.0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setLineDash:count:phase:", &drawDebugQuickLookImageForRegion_withInfo_inContext__dashedLineLength, 1, 0.0);
      objc_msgSend(v26, "setLineWidth:", 4.0);
      objc_msgSend(v18, "colorWithAlphaComponent:", 0.5);
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetStrokeColorWithColor(a5, (CGColorRef)objc_msgSend(v27, "CGColor"));

      objc_msgSend(v26, "stroke");
    }
    else
    {
      CGContextSetStrokeColorWithColor(a5, (CGColorRef)objc_msgSend(objc_retainAutorelease(v18), "CGColor"));
      v38.origin.x = v11;
      v38.origin.y = v13;
      v38.size.width = v15;
      v38.size.height = v17;
      CGContextStrokeRect(a5, v38);
    }
    objc_msgSend(v7, "focusMapSearchInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "destinationRegions");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "containsObject:", v35);

    if (v30)
    {
      CGContextSaveGState(a5);
      v39.origin.x = v11;
      v39.origin.y = v13;
      v39.size.width = v15;
      v39.size.height = v17;
      v40 = CGRectInset(v39, -6.0, -6.0);
      +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v40.origin.x, v40.origin.y, v40.size.width, v40.size.height, 12.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setLineWidth:", 3.0);
      +[UIColor redColor](UIColor, "redColor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "colorWithAlphaComponent:", 0.5);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "colorWithAlphaComponent:", 0.5);
      v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetStrokeColorWithColor(a5, (CGColorRef)objc_msgSend(v34, "CGColor"));

      objc_msgSend(v31, "stroke");
      CGContextRestoreGState(a5);

    }
  }

}

@end
