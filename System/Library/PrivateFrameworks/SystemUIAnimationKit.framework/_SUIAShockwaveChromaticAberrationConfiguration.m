@implementation _SUIAShockwaveChromaticAberrationConfiguration

- (void)_setDonutMaskFrame:(CGRect)a3
{
  NSMutableDictionary *propertyDictionary;
  void *v4;
  CGRect v5;

  propertyDictionary = self->super._propertyDictionary;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v5, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("donutMaskFrame"));

}

- (CGRect)donutMaskFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  __int128 v7;
  __int128 v8;
  CGRect result;

  v7 = 0u;
  v8 = 0u;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("donutMaskFrame"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v7, 32);

  v4 = *((double *)&v7 + 1);
  v3 = *(double *)&v7;
  v6 = *((double *)&v8 + 1);
  v5 = *(double *)&v8;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_setDonutGradientLocations:(id)a3
{
  -[NSMutableDictionary setObject:forKey:](self->super._propertyDictionary, "setObject:forKey:", a3, CFSTR("donutGradientLocations"));
}

- (NSArray)donutGradientLocations
{
  return (NSArray *)-[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("donutGradientLocations"));
}

- (void)_setDonutGradientColors:(id)a3
{
  -[NSMutableDictionary setObject:forKey:](self->super._propertyDictionary, "setObject:forKey:", a3, CFSTR("donutGradientColors"));
}

- (NSArray)donutGradientColors
{
  return (NSArray *)-[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("donutGradientColors"));
}

- (void)_setAberrationIntensity:(double)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("aberrationIntensity"));

}

- (double)aberrationIntensity
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("aberrationIntensity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (void)_setAberrationMagnitude:(CGPoint)a3
{
  NSMutableDictionary *propertyDictionary;
  void *v4;
  CGPoint v5;

  propertyDictionary = self->super._propertyDictionary;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v5, "{CGPoint=dd}");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("aberrationMagnitude"));

}

- (CGPoint)aberrationMagnitude
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGPoint result;

  v5 = 0.0;
  v6 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("aberrationMagnitude"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v5, 16);

  v3 = v5;
  v4 = v6;
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)_setAberrationBlurRadius:(double)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("aberrationBlurRadius"));

}

- (double)aberrationBlurRadius
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("aberrationBlurRadius"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (void)_setAberrationEDRGain:(double)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("aberrationEDRGain"));

}

- (double)aberrationEDRGain
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("aberrationEDRGain"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (void)_setAberrationColorBrightnessFactor:(double)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("aberrationColorBrightnessFactor"));

}

- (double)aberrationColorBrightnessFactor
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("aberrationColorBrightnessFactor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (void)_setAberrationMultiplyFactor:(double)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("aberrationMultiplyFactor"));

}

- (double)aberrationMultiplyFactor
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("aberrationMultiplyFactor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (void)_setAberrationColorSaturateAmount:(double)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("aberrationColorSaturateAmount"));

}

- (double)aberrationColorSaturateAmount
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("aberrationColorSaturateAmount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

+ (int64_t)configurationType
{
  return 1;
}

+ (CGRect)donutMaskRectForState:(int64_t)a3 variant:(int64_t)a4 normalizedStartLocation:(CGRect)a5 settings:(id)a6 inBounds:(CGRect)a7
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect result;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v14 = a6;
  objc_msgSend(v14, "chromaticAberrationInitialDonutMask");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "gradientLayerSize");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sizeValue");
  BSRectWithSize();
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  if ((unint64_t)a3 <= 5)
  {
    if (((1 << a3) & 0x2C) != 0)
    {
      objc_msgSend(v14, "chromaticAberrationFinalDonutMaskForShockwaveSize:", width, height);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "maximumExtentOfZeroOpacity");
      UIRectGetCenter();
      SUIAExpandNormalizedPoint(x, y, width, height, v26);
      v62.origin.x = x;
      v62.origin.y = y;
      v62.size.width = width;
      v62.size.height = height;
      CGRectGetMinX(v62);
      v63.origin.x = x;
      v63.origin.y = y;
      v63.size.width = width;
      v63.size.height = height;
      CGRectGetMinY(v63);
      UIDistanceBetweenPoints();
      v64.origin.x = x;
      v64.origin.y = y;
      v64.size.width = width;
      v64.size.height = height;
      CGRectGetMaxX(v64);
      v65.origin.x = x;
      v65.origin.y = y;
      v65.size.width = width;
      v65.size.height = height;
      CGRectGetMinY(v65);
      UIDistanceBetweenPoints();
      v66.origin.x = x;
      v66.origin.y = y;
      v66.size.width = width;
      v66.size.height = height;
      CGRectGetMinX(v66);
      v67.origin.x = x;
      v67.origin.y = y;
      v67.size.width = width;
      v67.size.height = height;
      CGRectGetMaxY(v67);
      UIDistanceBetweenPoints();
      v68.origin.x = x;
      v68.origin.y = y;
      v68.size.width = width;
      v68.size.height = height;
      CGRectGetMaxX(v68);
      v69.origin.x = x;
      v69.origin.y = y;
      v69.size.width = width;
      v69.size.height = height;
      CGRectGetMaxY(v69);
      UIDistanceBetweenPoints();
      v27 = SUIAScreenEdgeForNormalizedButtonRect();
      if (v27 == 8 || v27 == 2)
        objc_msgSend(v14, "finalFitVsDiameterRatioLongEdgeForShockwaveSize:", width, height);
      else
        objc_msgSend(v14, "finalFitVsDiameterRatioShortEdgeForShockwaveSize:", width, height);
      BSRectWithSize();
      v18 = SAUIRectMovedOffscreenByProportionToNormalizedButtonRectInContextOfShockwaveBounds(v35, v36, v37, v38, 0.0, a5.origin.x, a5.origin.y, v39, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, x, y, width, height);
      v20 = v40;
      v22 = v41;
      v24 = v42;

    }
    else if (((1 << a3) & 0x11) != 0 || a4)
    {
      objc_msgSend(v14, "donutMaskInitialEdgeOutsetProportion");
      v18 = SAUIRectMovedOffscreenByProportionToNormalizedButtonRectInContextOfShockwaveBounds(v18, v20, v22, v24, v28, v29, v30, v31, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, x, y, width, height);
      v20 = v32;
      v22 = v33;
      v24 = v34;
    }
    else
    {
      objc_msgSend(a1, "donutMaskRectForState:variant:normalizedStartLocation:settings:inBounds:", 0, 0, v14, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, x, y, width, height);
      v59 = v47;
      v60 = v48;
      objc_msgSend(a1, "donutMaskRectForState:variant:normalizedStartLocation:settings:inBounds:", 2, 0, v14, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, x, y, width, height);
      v50 = v49;
      objc_msgSend(v14, "captureHintInterpolationProgress");
      v52 = v51;
      v22 = v59 + v51 * (v50 - v59);
      v24 = v60 + v51 * (v50 - v60);
      UIRectGetCenter();
      v54 = v53;
      v56 = v55;
      UIRectGetCenter();
      v18 = v54 + v52 * (v57 - v54) - v22 * 0.5;
      v20 = v56 + v52 * (v58 - v56) - v24 * 0.5;
    }
  }

  v43 = v18;
  v44 = v20;
  v45 = v22;
  v46 = v24;
  result.size.height = v46;
  result.size.width = v45;
  result.origin.y = v44;
  result.origin.x = v43;
  return result;
}

+ (id)chromaticAberrationConfigurationForState:(int64_t)a3 variant:(int64_t)a4 buttonEmanating:(BOOL)a5 normalizedStartLocation:(CGRect)a6 settings:(id)a7 bounds:(CGRect)a8
{
  double width;
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  id v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  int v24;
  double v25;
  double v26;
  double v27;
  int v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double height;
  double v60;
  double v61;
  CATransform3D v62;
  CGAffineTransform v63;
  CATransform3D v64;

  height = a8.size.height;
  width = a8.size.width;
  y = a8.origin.y;
  x = a8.origin.x;
  v11 = a6.size.height;
  v12 = a6.size.width;
  v13 = a6.origin.y;
  v14 = a6.origin.x;
  v18 = a7;
  v19 = objc_alloc_init((Class)a1);
  objc_msgSend(v18, "donutMaskPositionAnimationSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "aberrationMagnitudeX");
  v61 = v21;
  objc_msgSend(v18, "aberrationMagnitudeY");
  v60 = v22;
  v23 = SUIAScreenEdgeForNormalizedButtonRect();
  memset(&v64, 0, sizeof(v64));
  SUIACATransform3DFromNominalRightEdgeToEdge(v23, &v64);
  memset(&v63, 0, sizeof(v63));
  v62 = v64;
  CATransform3DGetAffineTransform(&v63, &v62);
  objc_msgSend(v19, "_setAberrationMagnitude:", vaddq_f64(*(float64x2_t *)&v63.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v63.c, v60), *(float64x2_t *)&v63.a, v61)));
  objc_msgSend(v18, "aberrationBlurRadius");
  objc_msgSend(v19, "_setAberrationBlurRadius:");
  v24 = objc_msgSend(v18, "aberrationUseEDR");
  v25 = 0.0;
  v26 = 0.0;
  if (v24)
    objc_msgSend(v18, "aberrationEDRGain", 0.0);
  objc_msgSend(v19, "_setAberrationEDRGain:", v26);
  if (objc_msgSend(v18, "aberrationUseColorBrightness"))
  {
    objc_msgSend(v18, "aberrationColorBrightness");
    v25 = v27;
  }
  objc_msgSend(v19, "_setAberrationColorBrightnessFactor:", v25);
  v28 = objc_msgSend(v18, "aberrationUseColorMatrixMultiply");
  v29 = 0.0;
  v30 = 0.0;
  if (v28)
    objc_msgSend(v18, "aberrationColorMatrixMultiplyFactor", 0.0);
  objc_msgSend(v19, "_setAberrationMultiplyFactor:", v30);
  if (objc_msgSend(v18, "aberrationUseColorSaturate"))
  {
    objc_msgSend(v18, "aberrationColorSaturateAmount");
    v29 = v31;
  }
  objc_msgSend(v19, "_setAberrationColorSaturateAmount:", v29);
  objc_msgSend(v19, "_setAberrationIntensity:", 1.0);
  if ((unint64_t)a3 <= 5)
  {
    if (((1 << a3) & 0x2C) != 0)
    {
      if (!a4)
      {
        v32 = (void *)objc_msgSend(v20, "copy");

        objc_msgSend(v32, "retargetImpulse");
        v34 = v33;
        objc_msgSend(v18, "captureHintRetargetImpulse");
        objc_msgSend(v32, "setRetargetImpulse:", v34 + v35);
        v20 = v32;
      }
      objc_msgSend((id)objc_opt_class(), "donutMaskRectForState:variant:normalizedStartLocation:settings:inBounds:", a3, a4, v18, v14, v13, v12, v11, x, y, width, height);
      objc_msgSend(v19, "_setDonutMaskFrame:");
      objc_msgSend(v18, "donutMaskEndTransitionDelay");
      v37 = v36;
      objc_msgSend(v18, "chromaticAberrationFinalDonutMaskForShockwaveSize:", width, height);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend(v20, "copy");
      objc_msgSend(v19, "_setBehaviorSettings:forKeypath:", v39, CFSTR("donutMaskFrame"));

      objc_msgSend(v38, "locations");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_setDonutGradientLocations:", v40);

      v41 = (void *)objc_msgSend(v20, "copy");
      objc_msgSend(v19, "_setBehaviorSettings:forKeypath:", v41, CFSTR("donutGradientLocations"));

      objc_msgSend(v38, "colors");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_setDonutGradientColors:", v42);

      v43 = (void *)objc_msgSend(v20, "copy");
      objc_msgSend(v19, "_setBehaviorSettings:forKeypath:", v43, CFSTR("donutGradientColors"));

      objc_msgSend(v19, "_setAberrationIntensity:", 0.0);
      if (a3 == 5)
        objc_msgSend(v18, "abberationCancelledFadeOutAnimationSettings");
      else
        objc_msgSend(v18, "abberationFadeOutAnimationSettings");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (void *)objc_msgSend(v50, "copy");
      objc_msgSend(v19, "_setBehaviorSettings:forKeypath:", v51, CFSTR("aberrationIntensity"));

      if (a3 != 5)
      {
        objc_msgSend(v19, "_setDelay:forApplicationOfKeypath:", CFSTR("donutMaskFrame"), v37);
        objc_msgSend(v19, "_setDelay:forApplicationOfKeypath:", CFSTR("donutGradientLocations"), v37);
        objc_msgSend(v19, "_setDelay:forApplicationOfKeypath:", CFSTR("donutGradientColors"), v37);
        objc_msgSend(v18, "aberrationFadeOutDelay");
        objc_msgSend(v19, "_setDelay:forApplicationOfKeypath:", CFSTR("aberrationIntensity"));
      }

      goto LABEL_28;
    }
    if (((1 << a3) & 0x11) == 0)
    {
      if (!a4)
      {
        objc_msgSend(v18, "captureHintAnimationSettings");
        v52 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "_setAberrationMagnitude:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
        v20 = (void *)v52;
      }
      objc_msgSend((id)objc_opt_class(), "donutMaskRectForState:variant:normalizedStartLocation:settings:inBounds:", 1, a4, v18, v14, v13, v12, v11, x, y, width, height);
      objc_msgSend(v19, "_setDonutMaskFrame:");
      v53 = (void *)objc_msgSend(v20, "copy");
      objc_msgSend(v19, "_setBehaviorSettings:forKeypath:", v53, CFSTR("donutMaskFrame"));

      objc_msgSend(v18, "chromaticAberrationInitialDonutMask");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "locations");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_setDonutGradientLocations:", v55);

      v56 = (void *)objc_msgSend(v20, "copy");
      objc_msgSend(v19, "_setBehaviorSettings:forKeypath:", v56, CFSTR("donutGradientLocations"));

      objc_msgSend(v18, "chromaticAberrationInitialDonutMask");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "colors");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_setDonutGradientColors:", v57);

      goto LABEL_27;
    }
    if (!a4)
      objc_msgSend(v19, "_setAberrationMagnitude:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
    objc_msgSend((id)objc_opt_class(), "donutMaskRectForState:variant:normalizedStartLocation:settings:inBounds:", a3, a4, v18, v14, v13, v12, v11, x, y, width, height);
    objc_msgSend(v19, "_setDonutMaskFrame:");
    objc_msgSend(v18, "chromaticAberrationInitialDonutMask");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "locations");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_setDonutGradientLocations:", v45);

    objc_msgSend(v18, "chromaticAberrationInitialDonutMask");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "colors");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_setDonutGradientColors:", v47);

    if (a3 == 4)
    {
      v48 = (void *)objc_msgSend(v20, "copy");
      objc_msgSend(v19, "_setBehaviorSettings:forKeypath:", v48, CFSTR("donutMaskFrame"));

      v49 = (void *)objc_msgSend(v20, "copy");
      objc_msgSend(v19, "_setBehaviorSettings:forKeypath:", v49, CFSTR("donutGradientLocations"));
LABEL_27:

      v38 = (void *)objc_msgSend(v20, "copy");
      objc_msgSend(v19, "_setBehaviorSettings:forKeypath:", v38, CFSTR("donutGradientColors"));
LABEL_28:

    }
  }

  return v19;
}

@end
