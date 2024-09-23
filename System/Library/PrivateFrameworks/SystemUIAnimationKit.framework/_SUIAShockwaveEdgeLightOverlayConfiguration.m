@implementation _SUIAShockwaveEdgeLightOverlayConfiguration

- (void)_setEdgeLightIntensity:(double)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("edgeLightIntensity"));

}

- (double)edgeLightIntensity
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("edgeLightIntensity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (void)_setEdgeLightMaskFrame:(CGRect)a3
{
  NSMutableDictionary *propertyDictionary;
  void *v4;
  CGRect v5;

  propertyDictionary = self->super._propertyDictionary;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v5, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("edgeLightMaskFrame"));

}

- (CGRect)edgeLightMaskFrame
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
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("edgeLightMaskFrame"));
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

- (void)_setEdgeLightMaskGradientLocations:(id)a3
{
  -[NSMutableDictionary setObject:forKey:](self->super._propertyDictionary, "setObject:forKey:", a3, CFSTR("edgeLightMaskGradientLocations"));
}

- (NSArray)edgeLightMaskGradientLocations
{
  return (NSArray *)-[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("edgeLightMaskGradientLocations"));
}

- (void)_setEdgeLightMaskGradientColors:(id)a3
{
  -[NSMutableDictionary setObject:forKey:](self->super._propertyDictionary, "setObject:forKey:", a3, CFSTR("edgeLightMaskGradientColors"));
}

- (NSArray)edgeLightMaskGradientColors
{
  return (NSArray *)-[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("edgeLightMaskGradientColors"));
}

- (void)_setEdgeLightMaskCenter:(CGPoint)a3
{
  NSMutableDictionary *propertyDictionary;
  void *v4;
  CGPoint v5;

  propertyDictionary = self->super._propertyDictionary;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v5, "{CGPoint=dd}");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("edgeLightMaskCenter"));

}

- (CGPoint)edgeLightMaskCenter
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGPoint result;

  v5 = 0.0;
  v6 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("edgeLightMaskCenter"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v5, 16);

  v3 = v5;
  v4 = v6;
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)_setEdgeLightMaskInnerRadius:(double)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("edgeLightMaskInnerRadius"));

}

- (double)edgeLightMaskInnerRadius
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("edgeLightMaskInnerRadius"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (void)_setEdgeLightMaskOuterRadius:(double)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("edgeLightMaskOuterRadius"));

}

- (double)edgeLightMaskOuterRadius
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("edgeLightMaskOuterRadius"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (void)_setEdgeLightMaskSourceRadius:(double)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("edgeLightMaskSourceRadius"));

}

- (double)edgeLightMaskSourceRadius
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("edgeLightMaskSourceRadius"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (void)_setEdgeLightMaskSourceBlurRadius:(double)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("edgeLightMaskSourceBlurRadius"));

}

- (double)edgeLightMaskSourceBlurRadius
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("edgeLightMaskSourceBlurRadius"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (void)_setFillLightIntensity:(double)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("fillLightIntensity"));

}

- (double)fillLightIntensity
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("fillLightIntensity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (void)_setFillLightMaskFrame:(CGRect)a3
{
  NSMutableDictionary *propertyDictionary;
  void *v4;
  CGRect v5;

  propertyDictionary = self->super._propertyDictionary;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v5, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("fillLightMaskFrame"));

}

- (CGRect)fillLightMaskFrame
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
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("fillLightMaskFrame"));
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

- (void)_setFillLightMaskGradientLocations:(id)a3
{
  -[NSMutableDictionary setObject:forKey:](self->super._propertyDictionary, "setObject:forKey:", a3, CFSTR("fillLightMaskGradientLocations"));
}

- (NSArray)fillLightMaskGradientLocations
{
  return (NSArray *)-[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("fillLightMaskGradientLocations"));
}

- (void)_setFillLightMaskGradientColors:(id)a3
{
  -[NSMutableDictionary setObject:forKey:](self->super._propertyDictionary, "setObject:forKey:", a3, CFSTR("fillLightMaskGradientColors"));
}

- (NSArray)fillLightMaskGradientColors
{
  return (NSArray *)-[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("fillLightMaskGradientColors"));
}

- (void)_setFillLightMaskCenter:(CGPoint)a3
{
  NSMutableDictionary *propertyDictionary;
  void *v4;
  CGPoint v5;

  propertyDictionary = self->super._propertyDictionary;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v5, "{CGPoint=dd}");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("fillLightMaskCenter"));

}

- (CGPoint)fillLightMaskCenter
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGPoint result;

  v5 = 0.0;
  v6 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("fillLightMaskCenter"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v5, 16);

  v3 = v5;
  v4 = v6;
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)_setFillLightMaskInnerRadius:(double)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("fillLightMaskInnerRadius"));

}

- (double)fillLightMaskInnerRadius
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("fillLightMaskInnerRadius"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (void)_setFillLightMaskOuterRadius:(double)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("fillLightMaskOuterRadius"));

}

- (double)fillLightMaskOuterRadius
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("fillLightMaskOuterRadius"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (void)_setFillLightMaskSourceRadius:(double)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("fillLightMaskSourceRadius"));

}

- (double)fillLightMaskSourceRadius
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("fillLightMaskSourceRadius"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (void)_setFillLightMaskSourceBlurRadius:(double)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("fillLightMaskSourceBlurRadius"));

}

- (double)fillLightMaskSourceBlurRadius
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("fillLightMaskSourceBlurRadius"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

+ (int64_t)configurationType
{
  return 4;
}

+ (CGRect)edgeLightMaskRectForState:(int64_t)a3 variant:(int64_t)a4 normalizedStartLocation:(CGRect)a5 settings:(id)a6 inBounds:(CGRect)a7 outSourceRadius:(double *)a8
{
  double height;
  double width;
  double y;
  double x;
  double v13;
  double v14;
  double v15;
  double v16;
  id v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGRect v74;
  CGRect result;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v13 = a5.size.height;
  v14 = a5.size.width;
  v15 = a5.origin.y;
  v16 = a5.origin.x;
  v19 = a6;
  v20 = v19;
  if ((unint64_t)a3 <= 5)
  {
    if (((1 << a3) & 0x2C) != 0)
    {
      objc_msgSend(v19, "edgeLightFinalCircleMask");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "donutMaskRectForState:variant:normalizedStartLocation:settings:inBounds:", a3, a4, v20, v16, v15, v14, v13, x, y, width, height);
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;
      objc_msgSend(v20, "chromaticAberrationFinalDonutMaskForShockwaveSize:", width, height);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "radiusOfMaximumOpacity");
      v32 = v31;

      objc_msgSend(v21, "innerRadius");
      v34 = v32 / v33;
      v74.origin.x = v23;
      v74.origin.y = v25;
      v74.size.width = v27;
      v74.size.height = v29;
      v35 = v34 * CGRectGetWidth(v74);
      BSRectWithSize();
      UIRectGetCenter();
      BSRectCenteredAboutPoint();
      v37 = v36;
      v39 = v38;
      v41 = v40;
      v43 = v42;
      if (a8)
      {
        objc_msgSend(v21, "gradientLayerSize");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "width");
        v46 = v35 / v45;

        objc_msgSend(v21, "majorDiameter");
        v48 = v46 * (v47 * 0.5);
LABEL_11:
        *a8 = v48;
      }
LABEL_12:

      goto LABEL_13;
    }
    if (((1 << a3) & 0x11) != 0)
    {
      objc_msgSend(v19, "edgeLightInitialCircleMask");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "gradientLayerSize");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "sizeValue");
      BSRectWithSize();

      objc_msgSend((id)objc_opt_class(), "donutMaskRectForState:variant:normalizedStartLocation:settings:inBounds:", a3, a4, v20, v16, v15, v14, v13, x, y, width, height);
      UIRectGetCenter();
      BSRectCenteredAboutPoint();
      v37 = v50;
      v39 = v51;
      v41 = v52;
      v43 = v53;
      if (!a8)
        goto LABEL_12;
    }
    else
    {
      objc_msgSend(v19, "edgeLightHintCircleMask");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "gradientLayerSize");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "sizeValue");
      BSRectWithSize();
      v72 = v56;
      v73 = v55;
      v70 = v58;
      v71 = v57;

      v37 = SAUIRectMovedOffscreenByProportionToNormalizedButtonRectInContextOfShockwaveBounds(v73, v72, v71, v70, 0.5, v59, v60, v61, v16, v15, v14, v13, x, y, width, height);
      v39 = v62;
      v41 = v63;
      v43 = v64;
      if (!a8)
        goto LABEL_12;
    }
    objc_msgSend(v21, "majorDiameter");
    v48 = v65 * 0.5;
    goto LABEL_11;
  }
  v37 = *MEMORY[0x24BDBF070];
  v39 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v41 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v43 = *(double *)(MEMORY[0x24BDBF070] + 24);
LABEL_13:

  v66 = v37;
  v67 = v39;
  v68 = v41;
  v69 = v43;
  result.size.height = v69;
  result.size.width = v68;
  result.origin.y = v67;
  result.origin.x = v66;
  return result;
}

+ (id)edgeLightOverlayConfigurationForState:(int64_t)a3 variant:(int64_t)a4 normalizedStartLocation:(CGRect)a5 settings:(id)a6 bounds:(CGRect)a7
{
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  id v17;
  _SUIAShockwaveEdgeLightOverlayConfiguration *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
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
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  CGRect v91;
  CGRect v92;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v11 = a5.size.height;
  v12 = a5.size.width;
  v13 = a5.origin.y;
  v14 = a5.origin.x;
  v17 = a6;
  v18 = objc_alloc_init(_SUIAShockwaveEdgeLightOverlayConfiguration);
  objc_msgSend(v17, "donutMaskPositionAnimationSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = width;
  v89 = height;
  v86 = x;
  v87 = y;
  v84 = v12;
  v85 = v11;
  v82 = v14;
  v83 = v13;
  if ((unint64_t)a3 > 5)
  {
    v20 = 0;
  }
  else if (((1 << a3) & 0x2C) != 0)
  {
    v90 = 0.0;
    objc_msgSend(v17, "edgeLightFinalCircleMask");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "edgeLightMaskRectForState:variant:normalizedStartLocation:settings:inBounds:outSourceRadius:", a3, a4, v17, &v90, v14, v13, v12, v11, x, y, width, height);
    -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightMaskFrame:](v18, "_setEdgeLightMaskFrame:");
    v21 = (void *)objc_msgSend(v19, "copy");
    -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v21, CFSTR("edgeLightMaskFrame"));

    objc_msgSend(v20, "locations");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightMaskGradientLocations:](v18, "_setEdgeLightMaskGradientLocations:", v22);

    v23 = (void *)objc_msgSend(v19, "copy");
    -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v23, CFSTR("edgeLightMaskGradientLocations"));

    objc_msgSend(v20, "colors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightMaskGradientColors:](v18, "_setEdgeLightMaskGradientColors:", v24);

    v25 = (void *)objc_msgSend(v19, "copy");
    -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v25, CFSTR("edgeLightMaskGradientColors"));

    -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightMaskSourceRadius:](v18, "_setEdgeLightMaskSourceRadius:", v90);
    v26 = (void *)objc_msgSend(v19, "copy");
    -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v26, CFSTR("edgeLightMaskSourceRadius"));

    objc_msgSend(v20, "blurRadius");
    -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightMaskSourceBlurRadius:](v18, "_setEdgeLightMaskSourceBlurRadius:");
    v27 = (void *)objc_msgSend(v19, "copy");
    -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v27, CFSTR("edgeLightMaskSourceBlurRadius"));

    if (a3 == 5)
    {
      -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightIntensity:](v18, "_setEdgeLightIntensity:", 0.0);
      objc_msgSend(v17, "lightIntensityCancelledAnimationSettings");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v28, "copy");
      -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v29, CFSTR("edgeLightIntensity"));

    }
    else
    {
      objc_msgSend(v17, "donutMaskEndTransitionDelay");
      v41 = v40;
      -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightIntensity:](v18, "_setEdgeLightIntensity:", 1.0);
      -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", CFSTR("edgeLightMaskFrame"), v41);
      -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", CFSTR("edgeLightMaskGradientColors"), v41);
      -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", CFSTR("edgeLightMaskGradientLocations"), v41);
      -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", CFSTR("edgeLightMaskSourceRadius"), v41);
      -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", CFSTR("edgeLightMaskSourceBlurRadius"), v41);
    }
  }
  else
  {
    if (((1 << a3) & 0x11) != 0)
    {
      v90 = 0.0;
      objc_msgSend(v17, "edgeLightInitialCircleMask");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "edgeLightMaskRectForState:variant:normalizedStartLocation:settings:inBounds:outSourceRadius:", a3, a4, v17, &v90, v14, v13, v12, v11, x, y, width, height);
      -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightMaskFrame:](v18, "_setEdgeLightMaskFrame:");
      objc_msgSend(v20, "locations");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightMaskGradientLocations:](v18, "_setEdgeLightMaskGradientLocations:", v30);

      objc_msgSend(v20, "colors");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightMaskGradientColors:](v18, "_setEdgeLightMaskGradientColors:", v31);

      -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightMaskSourceRadius:](v18, "_setEdgeLightMaskSourceRadius:", v90);
      objc_msgSend(v20, "blurRadius");
      -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightMaskSourceBlurRadius:](v18, "_setEdgeLightMaskSourceBlurRadius:");
      v32 = 1.0;
      if (a3 == 4)
      {
        v33 = (void *)objc_msgSend(v19, "copy", 1.0);
        -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v33, CFSTR("edgeLightMaskFrame"));

        v34 = (void *)objc_msgSend(v19, "copy");
        -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v34, CFSTR("edgeLightMaskGradientLocations"));

        v35 = (void *)objc_msgSend(v19, "copy");
        -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v35, CFSTR("edgeLightMaskGradientColors"));

        v36 = (void *)objc_msgSend(v19, "copy");
        -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v36, CFSTR("edgeLightMaskSourceRadius"));

        v37 = (void *)objc_msgSend(v19, "copy");
        -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v37, CFSTR("edgeLightMaskSourceBlurRadius"));

        objc_msgSend(v17, "lightIntensityCancelledAnimationSettings");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)objc_msgSend(v38, "copy");
        -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v39, CFSTR("edgeLightIntensity"));

        v32 = 0.0;
      }
    }
    else
    {
      objc_msgSend(v17, "edgeLightHintTransitionDelay");
      v80 = v42;
      v90 = 0.0;
      objc_msgSend(v17, "edgeLightHintCircleMask");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "edgeLightMaskRectForState:variant:normalizedStartLocation:settings:inBounds:outSourceRadius:", 1, a4, v17, &v90, v14, v13, v12, v11, x, y, width, height);
      -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightMaskFrame:](v18, "_setEdgeLightMaskFrame:");
      v43 = (void *)objc_msgSend(v19, "copy");
      -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v43, CFSTR("edgeLightMaskFrame"));

      -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", CFSTR("edgeLightMaskFrame"), v80);
      objc_msgSend(v20, "locations");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightMaskGradientLocations:](v18, "_setEdgeLightMaskGradientLocations:", v44);

      v45 = (void *)objc_msgSend(v19, "copy");
      -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v45, CFSTR("edgeLightMaskGradientLocations"));

      -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", CFSTR("edgeLightMaskGradientLocations"), v80);
      objc_msgSend(v20, "colors");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightMaskGradientColors:](v18, "_setEdgeLightMaskGradientColors:", v46);

      v47 = (void *)objc_msgSend(v19, "copy");
      -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v47, CFSTR("edgeLightMaskGradientColors"));

      -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", CFSTR("edgeLightMaskGradientColors"), v80);
      -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightMaskSourceRadius:](v18, "_setEdgeLightMaskSourceRadius:", v90);
      v48 = (void *)objc_msgSend(v19, "copy");
      -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v48, CFSTR("edgeLightMaskSourceRadius"));

      -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", CFSTR("edgeLightMaskSourceRadius"), v80);
      objc_msgSend(v20, "blurRadius");
      -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightMaskSourceBlurRadius:](v18, "_setEdgeLightMaskSourceBlurRadius:");
      v49 = (void *)objc_msgSend(v19, "copy");
      -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v49, CFSTR("edgeLightMaskSourceBlurRadius"));

      -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", CFSTR("edgeLightMaskSourceBlurRadius"), v80);
      v32 = 1.0;
    }
    -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightIntensity:](v18, "_setEdgeLightIntensity:", v32);
  }
  -[_SUIAShockwaveEdgeLightOverlayConfiguration edgeLightMaskFrame](v18, "edgeLightMaskFrame");
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v57 = v56;
  UIRectGetCenter();
  v59 = v58;
  v61 = v60;
  objc_msgSend(v20, "innerRadius");
  v63 = v62;
  v91.origin.x = v51;
  v91.origin.y = v53;
  v91.size.width = v55;
  v91.size.height = v57;
  v81 = v63 * CGRectGetWidth(v91) * 0.5;
  objc_msgSend(v20, "outerRadius");
  v65 = v64;
  v92.origin.x = v51;
  v92.origin.y = v53;
  v92.size.width = v55;
  v92.size.height = v57;
  v66 = v65 * CGRectGetWidth(v92) * 0.5;
  -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightMaskCenter:](v18, "_setEdgeLightMaskCenter:", v59, v61);
  -[_SUIAAbstractDictionaryBackedConfiguration behaviorSettingsForKeypath:](v18, "behaviorSettingsForKeypath:", CFSTR("edgeLightMaskFrame"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v67, CFSTR("edgeLightMaskCenter"));

  -[_SUIAAbstractDictionaryBackedConfiguration delayForApplicationOfKeypath:](v18, "delayForApplicationOfKeypath:", CFSTR("edgeLightMaskFrame"));
  -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", CFSTR("edgeLightMaskCenter"));
  -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightMaskInnerRadius:](v18, "_setEdgeLightMaskInnerRadius:", v81);
  -[_SUIAAbstractDictionaryBackedConfiguration behaviorSettingsForKeypath:](v18, "behaviorSettingsForKeypath:", CFSTR("edgeLightMaskGradientLocations"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v68, CFSTR("edgeLightMaskInnerRadius"));

  -[_SUIAAbstractDictionaryBackedConfiguration delayForApplicationOfKeypath:](v18, "delayForApplicationOfKeypath:", CFSTR("edgeLightMaskGradientLocations"));
  -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", CFSTR("edgeLightMaskInnerRadius"));
  -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightMaskOuterRadius:](v18, "_setEdgeLightMaskOuterRadius:", v66);
  -[_SUIAAbstractDictionaryBackedConfiguration behaviorSettingsForKeypath:](v18, "behaviorSettingsForKeypath:", CFSTR("edgeLightMaskGradientLocations"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v69, CFSTR("edgeLightMaskOuterRadius"));

  -[_SUIAAbstractDictionaryBackedConfiguration delayForApplicationOfKeypath:](v18, "delayForApplicationOfKeypath:", CFSTR("edgeLightMaskGradientLocations"));
  -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", CFSTR("edgeLightMaskOuterRadius"));
  +[_SUIAShockwaveFillLightConfiguration fillLightConfigurationForState:variant:normalizedStartLocation:settings:bounds:](_SUIAShockwaveFillLightConfiguration, "fillLightConfigurationForState:variant:normalizedStartLocation:settings:bounds:", a3, a4, v17, v82, v83, v84, v85, v86, v87, v88, v89);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  __133___SUIAShockwaveEdgeLightOverlayConfiguration_edgeLightOverlayConfigurationForState_variant_normalizedStartLocation_settings_bounds___block_invoke((uint64_t)v70, v18, v70, CFSTR("fillLightIntensity"), CFSTR("lightIntensity"));
  __133___SUIAShockwaveEdgeLightOverlayConfiguration_edgeLightOverlayConfigurationForState_variant_normalizedStartLocation_settings_bounds___block_invoke(v71, v18, v70, CFSTR("fillLightMaskFrame"), CFSTR("circleMaskFrame"));
  __133___SUIAShockwaveEdgeLightOverlayConfiguration_edgeLightOverlayConfigurationForState_variant_normalizedStartLocation_settings_bounds___block_invoke(v72, v18, v70, CFSTR("fillLightMaskGradientLocations"), CFSTR("circleGradientLocations"));
  __133___SUIAShockwaveEdgeLightOverlayConfiguration_edgeLightOverlayConfigurationForState_variant_normalizedStartLocation_settings_bounds___block_invoke(v73, v18, v70, CFSTR("fillLightMaskGradientColors"), CFSTR("circleGradientColors"));
  __133___SUIAShockwaveEdgeLightOverlayConfiguration_edgeLightOverlayConfigurationForState_variant_normalizedStartLocation_settings_bounds___block_invoke(v74, v18, v70, CFSTR("fillLightMaskInnerRadius"), CFSTR("circleMaskInnerRadius"));
  __133___SUIAShockwaveEdgeLightOverlayConfiguration_edgeLightOverlayConfigurationForState_variant_normalizedStartLocation_settings_bounds___block_invoke(v75, v18, v70, CFSTR("fillLightMaskOuterRadius"), CFSTR("circleMaskOuterRadius"));
  __133___SUIAShockwaveEdgeLightOverlayConfiguration_edgeLightOverlayConfigurationForState_variant_normalizedStartLocation_settings_bounds___block_invoke(v76, v18, v70, CFSTR("fillLightMaskSourceRadius"), CFSTR("circleMaskSourceRadius"));
  __133___SUIAShockwaveEdgeLightOverlayConfiguration_edgeLightOverlayConfigurationForState_variant_normalizedStartLocation_settings_bounds___block_invoke(v77, v18, v70, CFSTR("fillLightMaskSourceBlurRadius"), CFSTR("circleMaskSourceBlurRadius"));
  -[_SUIAShockwaveEdgeLightOverlayConfiguration fillLightMaskFrame](v18, "fillLightMaskFrame");
  UIRectGetCenter();
  -[_SUIAShockwaveEdgeLightOverlayConfiguration _setFillLightMaskCenter:](v18, "_setFillLightMaskCenter:");
  -[_SUIAAbstractDictionaryBackedConfiguration behaviorSettingsForKeypath:](v18, "behaviorSettingsForKeypath:", CFSTR("fillLightMaskFrame"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v18, "_setBehaviorSettings:forKeypath:", v78, CFSTR("fillLightMaskCenter"));

  -[_SUIAAbstractDictionaryBackedConfiguration delayForApplicationOfKeypath:](v18, "delayForApplicationOfKeypath:", CFSTR("fillLightMaskFrame"));
  -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", CFSTR("fillLightMaskCenter"));

  return v18;
}

@end
