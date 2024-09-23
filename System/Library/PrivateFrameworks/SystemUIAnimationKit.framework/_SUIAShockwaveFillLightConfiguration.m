@implementation _SUIAShockwaveFillLightConfiguration

- (void)_setLightType:(int64_t)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("lightType"));

}

- (int64_t)lightType
{
  void *v2;
  int64_t v4;

  v4 = 0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("lightType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (void)_setWhiteValue:(double)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("whiteValue"));

}

- (double)whiteValue
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("whiteValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (void)_setLightIntensity:(double)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("lightIntensity"));

}

- (double)lightIntensity
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("lightIntensity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (void)_setLightColorBrightnessAmount:(double)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("lightColorBrightnessAmount"));

}

- (double)lightColorBrightnessAmount
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("lightColorBrightnessAmount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (void)_setLightColorSaturateAmount:(double)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("lightColorSaturateAmount"));

}

- (double)lightColorSaturateAmount
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("lightColorSaturateAmount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (void)_setLightColorContrastAmount:(double)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("lightColorContrastAmount"));

}

- (double)lightColorContrastAmount
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("lightColorContrastAmount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (void)_setSideLightMaskFrame:(CGRect)a3
{
  NSMutableDictionary *propertyDictionary;
  void *v4;
  CGRect v5;

  propertyDictionary = self->super._propertyDictionary;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v5, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("sideLightMaskFrame"));

}

- (CGRect)sideLightMaskFrame
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
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("sideLightMaskFrame"));
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

- (void)_setSideLightMaskImage:(id)a3
{
  -[NSMutableDictionary setObject:forKey:](self->super._propertyDictionary, "setObject:forKey:", a3, CFSTR("sideLightMaskImage"));
}

- (UIImage)sideLightMaskImage
{
  return (UIImage *)-[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("sideLightMaskImage"));
}

- (void)_setSideLightMaskTransform:(CATransform3D *)a3
{
  NSMutableDictionary *propertyDictionary;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  void *v8;
  _OWORD v9[8];

  propertyDictionary = self->super._propertyDictionary;
  v4 = *(_OWORD *)&a3->m33;
  v9[4] = *(_OWORD *)&a3->m31;
  v9[5] = v4;
  v5 = *(_OWORD *)&a3->m43;
  v9[6] = *(_OWORD *)&a3->m41;
  v9[7] = v5;
  v6 = *(_OWORD *)&a3->m13;
  v9[0] = *(_OWORD *)&a3->m11;
  v9[1] = v6;
  v7 = *(_OWORD *)&a3->m23;
  v9[2] = *(_OWORD *)&a3->m21;
  v9[3] = v7;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v8, CFSTR("sideLightMaskTransform"));

}

- (CATransform3D)sideLightMaskTransform
{
  void *v4;
  CATransform3D *result;
  void *v6;

  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("sideLightMaskTransform"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "CATransform3DValue");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->m41 = 0u;
    *(_OWORD *)&retstr->m43 = 0u;
    *(_OWORD *)&retstr->m31 = 0u;
    *(_OWORD *)&retstr->m33 = 0u;
    *(_OWORD *)&retstr->m21 = 0u;
    *(_OWORD *)&retstr->m23 = 0u;
    *(_OWORD *)&retstr->m11 = 0u;
    *(_OWORD *)&retstr->m13 = 0u;
  }

  return result;
}

- (void)_setCircleMaskFrame:(CGRect)a3
{
  NSMutableDictionary *propertyDictionary;
  void *v4;
  CGRect v5;

  propertyDictionary = self->super._propertyDictionary;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v5, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("circleMaskFrame"));

}

- (CGRect)circleMaskFrame
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
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("circleMaskFrame"));
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

- (void)_setCircleGradientLocations:(id)a3
{
  -[NSMutableDictionary setObject:forKey:](self->super._propertyDictionary, "setObject:forKey:", a3, CFSTR("circleGradientLocations"));
}

- (NSArray)circleGradientLocations
{
  return (NSArray *)-[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("circleGradientLocations"));
}

- (void)_setCircleGradientColors:(id)a3
{
  -[NSMutableDictionary setObject:forKey:](self->super._propertyDictionary, "setObject:forKey:", a3, CFSTR("circleGradientColors"));
}

- (NSArray)circleGradientColors
{
  return (NSArray *)-[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("circleGradientColors"));
}

- (void)_setCircleMaskInnerRadius:(double)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("circleMaskInnerRadius"));

}

- (double)circleMaskInnerRadius
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("circleMaskInnerRadius"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (void)_setCircleMaskOuterRadius:(double)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("circleMaskOuterRadius"));

}

- (double)circleMaskOuterRadius
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("circleMaskOuterRadius"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (void)_setCircleMaskSourceRadius:(double)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("circleMaskSourceRadius"));

}

- (double)circleMaskSourceRadius
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("circleMaskSourceRadius"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (void)_setCircleMaskSourceBlurRadius:(double)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("circleMaskSourceBlurRadius"));

}

- (double)circleMaskSourceBlurRadius
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("circleMaskSourceBlurRadius"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

+ (int64_t)configurationType
{
  return 3;
}

+ (id)fillLightConfigurationForState:(int64_t)a3 variant:(int64_t)a4 normalizedStartLocation:(CGRect)a5 settings:(id)a6 bounds:(CGRect)a7
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  id v17;
  _SUIAShockwaveFillLightConfiguration *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  double v94;
  void *v95;
  void *v96;
  void *v97;
  double v98;
  CGFloat v99;
  double v100;
  CGFloat v101;
  double v102;
  CGFloat v103;
  double v104;
  CGFloat v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  void *v112;
  void *v113;
  _SUIAShockwaveFillLightConfiguration *v114;
  double v116;
  double v117;
  double v118;
  CATransform3D v119;
  CATransform3D v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v11 = a5.size.height;
  v12 = a5.size.width;
  v13 = a5.origin.y;
  v14 = a5.origin.x;
  v17 = a6;
  v18 = objc_alloc_init(_SUIAShockwaveFillLightConfiguration);
  if ((unint64_t)(a4 - 1) < 2)
  {
LABEL_2:
    -[_SUIAShockwaveFillLightConfiguration _setLightType:](v18, "_setLightType:", 1);
    goto LABEL_8;
  }
  if (!a4)
  {
    v19 = objc_msgSend(v17, "captureFillLightType");
    switch(v19)
    {
      case 0:
        v114 = 0;
        goto LABEL_29;
      case 1:
        goto LABEL_2;
      case 2:
        -[_SUIAShockwaveFillLightConfiguration _setLightType:](v18, "_setLightType:", 2);
        objc_msgSend(v17, "captureFillWhiteValue");
        -[_SUIAShockwaveFillLightConfiguration _setWhiteValue:](v18, "_setWhiteValue:");
        break;
    }
  }
LABEL_8:
  objc_msgSend(v17, "colorFillInitialCircleMask");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "gradientLayerSize");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sizeValue");
  BSRectWithSize();

  objc_msgSend(v17, "donutMaskPositionAnimationSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = v12;
  v23 = v11;
  v24 = SUIAScreenEdgeForNormalizedButtonRect();
  memset(&v120, 0, sizeof(v120));
  SUIACATransform3DFromNominalRightEdgeToEdge(v24, &v120);
  v121.origin.x = x;
  v121.origin.y = y;
  v121.size.width = width;
  v121.size.height = height;
  v25 = CGRectGetWidth(v121);
  v122.origin.x = x;
  v122.origin.y = y;
  v122.size.width = width;
  v122.size.height = height;
  v26 = CGRectGetHeight(v122);
  if (v25 < v26)
    v26 = v25;
  v119 = v120;
  CATransform3DScale(&v120, &v119, v26 / 393.0, v26 / 393.0, 1.0);
  v119 = v120;
  -[_SUIAShockwaveFillLightConfiguration _setSideLightMaskTransform:](v18, "_setSideLightMaskTransform:", &v119);
  v27 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("topAndBottomMask"), v28, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "size");
  v31 = v30;
  objc_msgSend(v29, "size");
  objc_msgSend(v29, "resizableImageWithCapInsets:resizingMode:", 0, v32 * 0.5 + -1.0, 0.0, v32 * 0.5 + -1.0, v31 + -1.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[_SUIAShockwaveFillLightConfiguration _setSideLightMaskImage:](v18, "_setSideLightMaskImage:", v33);
  objc_msgSend(v17, "fillLightInitialIntensity");
  if (!a4)
    objc_msgSend(v17, "fillLightCaptureInitialIntensity");
  v35 = v23;
  objc_msgSend(v17, "lightIntensityAnimationSettings", v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lightIntensityCancelledAnimationSettings");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fillLightColorBrightnessAmount");
  -[_SUIAShockwaveFillLightConfiguration _setLightColorBrightnessAmount:](v18, "_setLightColorBrightnessAmount:");
  objc_msgSend(v17, "fillLightColorSaturateAmount");
  -[_SUIAShockwaveFillLightConfiguration _setLightColorSaturateAmount:](v18, "_setLightColorSaturateAmount:");
  objc_msgSend(v17, "fillLightColorContrastAmount");
  -[_SUIAShockwaveFillLightConfiguration _setLightColorContrastAmount:](v18, "_setLightColorContrastAmount:");
  if ((unint64_t)a3 > 5)
  {
    v51 = v20;
    goto LABEL_28;
  }
  if (((1 << a3) & 0x2C) == 0)
  {
    if (((1 << a3) & 0x11) == 0)
    {
      if (!a4)
      {
        objc_msgSend(v17, "captureHintAnimationSettings");
        v88 = objc_claimAutoreleasedReturnValue();

        v22 = (void *)v88;
      }
      objc_msgSend(v17, "colorFillInitialCircleMask");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "donutMaskRectForState:variant:normalizedStartLocation:settings:inBounds:", 1, a4, v17, v14, v13, v117, v23, x, y, width, height);
      UIRectGetCenter();
      BSRectCenteredAboutPoint();
      -[_SUIAShockwaveFillLightConfiguration _setCircleMaskFrame:](v18, "_setCircleMaskFrame:");
      v89 = (void *)objc_msgSend(v22, "copy");
      -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v89, CFSTR("circleMaskFrame"));

      objc_msgSend(v51, "locations");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SUIAShockwaveFillLightConfiguration _setCircleGradientLocations:](v18, "_setCircleGradientLocations:", v90);

      v91 = (void *)objc_msgSend(v22, "copy");
      -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v91, CFSTR("circleGradientLocations"));

      objc_msgSend(v51, "colors");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SUIAShockwaveFillLightConfiguration _setCircleGradientColors:](v18, "_setCircleGradientColors:", v92);

      v93 = (void *)objc_msgSend(v22, "copy");
      -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v93, CFSTR("circleGradientColors"));

      objc_msgSend(v51, "majorDiameter");
      -[_SUIAShockwaveFillLightConfiguration _setCircleMaskSourceRadius:](v18, "_setCircleMaskSourceRadius:", v94 * 0.5);
      v95 = (void *)objc_msgSend(v22, "copy");
      -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v95, CFSTR("circleMaskSourceRadius"));

      objc_msgSend(v51, "blurRadius");
      -[_SUIAShockwaveFillLightConfiguration _setCircleMaskSourceBlurRadius:](v18, "_setCircleMaskSourceBlurRadius:");
      v96 = (void *)objc_msgSend(v22, "copy");
      -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v96, CFSTR("circleMaskSourceBlurRadius"));

      -[_SUIAShockwaveFillLightConfiguration _setLightIntensity:](v18, "_setLightIntensity:", v116);
      v87 = v36;
      goto LABEL_26;
    }
    objc_msgSend(v17, "colorFillInitialCircleMask");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "donutMaskRectForState:variant:normalizedStartLocation:settings:inBounds:", a3, a4, v17, v14, v13, v117, v23, x, y, width, height);
    UIRectGetCenter();
    BSRectCenteredAboutPoint();
    -[_SUIAShockwaveFillLightConfiguration _setCircleMaskFrame:](v18, "_setCircleMaskFrame:");
    objc_msgSend(v51, "locations");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SUIAShockwaveFillLightConfiguration _setCircleGradientLocations:](v18, "_setCircleGradientLocations:", v79);

    objc_msgSend(v51, "colors");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SUIAShockwaveFillLightConfiguration _setCircleGradientColors:](v18, "_setCircleGradientColors:", v80);

    objc_msgSend(v51, "majorDiameter");
    -[_SUIAShockwaveFillLightConfiguration _setCircleMaskSourceRadius:](v18, "_setCircleMaskSourceRadius:", v81 * 0.5);
    objc_msgSend(v51, "blurRadius");
    -[_SUIAShockwaveFillLightConfiguration _setCircleMaskSourceBlurRadius:](v18, "_setCircleMaskSourceBlurRadius:");
    if (a3 != 4)
    {
      -[_SUIAShockwaveFillLightConfiguration _setLightIntensity:](v18, "_setLightIntensity:", v116);
      goto LABEL_28;
    }
    objc_msgSend(v17, "fillLightFinalIntensity");
    -[_SUIAShockwaveFillLightConfiguration _setLightIntensity:](v18, "_setLightIntensity:");
    v82 = (void *)objc_msgSend(v22, "copy");
    -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v82, CFSTR("circleMaskFrame"));

    v83 = (void *)objc_msgSend(v22, "copy");
    -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v83, CFSTR("circleGradientLocations"));

    v84 = (void *)objc_msgSend(v22, "copy");
    -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v84, CFSTR("circleGradientColors"));

    v85 = (void *)objc_msgSend(v22, "copy");
    -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v85, CFSTR("circleMaskSourceRadius"));

    v86 = (void *)objc_msgSend(v22, "copy");
    -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v86, CFSTR("circleMaskSourceBlurRadius"));

LABEL_21:
    v87 = v37;
LABEL_26:
    v97 = (void *)objc_msgSend(v87, "copy");
    -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v97, CFSTR("lightIntensity"));

    goto LABEL_28;
  }
  if (!a4)
  {
    v38 = (void *)objc_msgSend(v22, "copy");

    objc_msgSend(v38, "retargetImpulse");
    v40 = v39;
    objc_msgSend(v17, "captureHintRetargetImpulse");
    objc_msgSend(v38, "setRetargetImpulse:", v40 + v41);
    v42 = (void *)objc_msgSend(v36, "copy");

    objc_msgSend(v42, "retargetImpulse");
    v44 = v43;
    objc_msgSend(v17, "captureHintRetargetImpulse");
    objc_msgSend(v42, "setRetargetImpulse:", v44 + v45);
    v46 = (void *)objc_msgSend(v37, "copy");

    objc_msgSend(v46, "retargetImpulse");
    v48 = v47;
    objc_msgSend(v17, "captureHintRetargetImpulse");
    v50 = v48 + v49;
    v35 = v23;
    objc_msgSend(v46, "setRetargetImpulse:", v50);
    v37 = v46;
    v36 = v42;
    v22 = v38;
  }
  objc_msgSend(v17, "colorFillFinalCircleMask");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "donutMaskRectForState:variant:normalizedStartLocation:settings:inBounds:", a3, a4, v17, v14, v13, v117, v35, x, y, width, height);
  v53 = v52;
  v55 = v54;
  v57 = v56;
  v59 = v58;
  objc_msgSend(v17, "chromaticAberrationFinalDonutMaskForShockwaveSize:", width, height);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "radiusOfMaximumOpacity");
  v62 = v61;

  objc_msgSend(v51, "innerRadius");
  v64 = v62 / v63;
  v123.origin.x = v53;
  v123.origin.y = v55;
  v123.size.width = v57;
  v123.size.height = v59;
  v118 = v64 * CGRectGetWidth(v123);
  BSRectWithSize();
  UIRectGetCenter();
  BSRectCenteredAboutPoint();
  -[_SUIAShockwaveFillLightConfiguration _setCircleMaskFrame:](v18, "_setCircleMaskFrame:");
  objc_msgSend(v17, "donutMaskEndTransitionDelay");
  v66 = v65;
  v67 = (void *)objc_msgSend(v22, "copy");
  -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v67, CFSTR("circleMaskFrame"));

  objc_msgSend(v51, "locations");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SUIAShockwaveFillLightConfiguration _setCircleGradientLocations:](v18, "_setCircleGradientLocations:", v68);

  v69 = (void *)objc_msgSend(v22, "copy");
  -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v69, CFSTR("circleGradientLocations"));

  objc_msgSend(v51, "colors");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SUIAShockwaveFillLightConfiguration _setCircleGradientColors:](v18, "_setCircleGradientColors:", v70);

  v71 = (void *)objc_msgSend(v22, "copy");
  -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v71, CFSTR("circleGradientColors"));

  objc_msgSend(v51, "gradientLayerSize");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "width");
  v74 = v118 / v73;

  objc_msgSend(v51, "majorDiameter");
  -[_SUIAShockwaveFillLightConfiguration _setCircleMaskSourceRadius:](v18, "_setCircleMaskSourceRadius:", v74 * (v75 * 0.5));
  v76 = (void *)objc_msgSend(v22, "copy");
  -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v76, CFSTR("circleMaskSourceRadius"));

  objc_msgSend(v51, "blurRadius");
  -[_SUIAShockwaveFillLightConfiguration _setCircleMaskSourceBlurRadius:](v18, "_setCircleMaskSourceBlurRadius:");
  v77 = (void *)objc_msgSend(v22, "copy");
  -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v77, CFSTR("circleMaskSourceBlurRadius"));

  objc_msgSend(v17, "fillLightFinalIntensity");
  -[_SUIAShockwaveFillLightConfiguration _setLightIntensity:](v18, "_setLightIntensity:");
  if (a3 == 5)
    goto LABEL_21;
  v78 = (void *)objc_msgSend(v36, "copy");
  -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v78, CFSTR("lightIntensity"));

  -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", CFSTR("circleMaskFrame"), v66);
  -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", CFSTR("circleGradientLocations"), v66);
  -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", CFSTR("circleGradientColors"), v66);
  -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", CFSTR("circleMaskSourceRadius"), v66);
  -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", CFSTR("circleMaskSourceBlurRadius"), v66);
  objc_msgSend(v17, "fillLightIntensityFinalStateDelay");
  -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", CFSTR("lightIntensity"));
LABEL_28:
  -[_SUIAShockwaveFillLightConfiguration circleMaskFrame](v18, "circleMaskFrame");
  v99 = v98;
  v101 = v100;
  v103 = v102;
  v105 = v104;
  objc_msgSend(v51, "innerRadius");
  v107 = v106;
  v124.origin.x = v99;
  v124.origin.y = v101;
  v124.size.width = v103;
  v124.size.height = v105;
  v108 = v107 * CGRectGetWidth(v124) * 0.5;
  objc_msgSend(v51, "outerRadius");
  v110 = v109;
  v125.origin.x = v99;
  v125.origin.y = v101;
  v125.size.width = v103;
  v125.size.height = v105;
  v111 = v110 * CGRectGetWidth(v125) * 0.5;
  -[_SUIAShockwaveFillLightConfiguration _setCircleMaskInnerRadius:](v18, "_setCircleMaskInnerRadius:", v108);
  -[_SUIAAbstractDictionaryBackedConfiguration behaviorSettingsForKeypath:](v18, "behaviorSettingsForKeypath:", CFSTR("circleGradientLocations"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v112, CFSTR("circleMaskInnerRadius"));

  -[_SUIAAbstractDictionaryBackedConfiguration delayForApplicationOfKeypath:](v18, "delayForApplicationOfKeypath:", CFSTR("circleGradientLocations"));
  -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", CFSTR("circleMaskInnerRadius"));
  -[_SUIAShockwaveFillLightConfiguration _setCircleMaskOuterRadius:](v18, "_setCircleMaskOuterRadius:", v111);
  -[_SUIAAbstractDictionaryBackedConfiguration behaviorSettingsForKeypath:](v18, "behaviorSettingsForKeypath:", CFSTR("circleGradientLocations"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v113, CFSTR("circleMaskOuterRadius"));

  -[_SUIAAbstractDictionaryBackedConfiguration delayForApplicationOfKeypath:](v18, "delayForApplicationOfKeypath:", CFSTR("circleGradientLocations"));
  -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", CFSTR("circleMaskOuterRadius"));
  v114 = v18;

LABEL_29:
  return v114;
}

@end
