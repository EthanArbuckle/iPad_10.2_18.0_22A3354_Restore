@implementation _UIStaticBatteryView

- (void)_createBoltLayersWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;

  height = a3.height;
  width = a3.width;
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  v8 = v7;

  -[_UIStaticBatteryView _batteryPathScaleFactor](self, "_batteryPathScaleFactor");
  v10 = width * v9;
  v11 = height * v9;
  v12 = *MEMORY[0x1E0C9D538];
  v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend((id)objc_opt_class(), "_batteryBoltMaskImageWithSize:boltSize:forScale:", width * v9, height * v9, width, height, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_retainAutorelease(v14);
  objc_msgSend(v15, "setContents:", objc_msgSend(v20, "CGImage"));
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C50]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCompositingFilter:", v16);

  objc_msgSend(v15, "setBounds:", v12, v13, v10, v11);
  -[_UIBatteryView setBoltMaskLayer:](self, "setBoltMaskLayer:", v15);
  objc_msgSend((id)objc_opt_class(), "_batteryBoltImageWithSize:boltSize:forScale:", v10, v11, width, height, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_retainAutorelease(v17);
  objc_msgSend(v18, "setContents:", objc_msgSend(v19, "CGImage"));
  objc_msgSend(v18, "setBounds:", v12, v13, v10, v11);
  -[_UIBatteryView setBoltLayer:](self, "setBoltLayer:", v18);

}

- (double)_batteryBoltSmallScaleFactor
{
  return 0.375;
}

- (void)_updateBodyColors
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  if (-[_UIBatteryView showsPercentage](self, "showsPercentage"))
  {
    -[_UIBatteryView _batteryUnfilledColor](self, "_batteryUnfilledColor");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = objc_msgSend(v3, "CGColor");

    -[_UIBatteryView bodyLayer](self, "bodyLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentsMultiplyColor:", v4);

    -[_UIBatteryView pinLayer](self, "pinLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentsMultiplyColor:", v4);

    -[_UIBatteryView _batteryTextColor](self, "_batteryTextColor");
  }
  else
  {
    -[_UIBatteryView bodyColor](self, "bodyColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "CGColor");
    -[_UIBatteryView bodyLayer](self, "bodyLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentsMultiplyColor:", v8);

    -[_UIBatteryView pinColor](self, "pinColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = objc_msgSend(v10, "CGColor");
    -[_UIBatteryView pinLayer](self, "pinLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentsMultiplyColor:", v11);

    -[_UIBatteryView boltColor](self, "boltColor");
  }
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = objc_msgSend(v15, "CGColor");
  -[_UIBatteryView boltLayer](self, "boltLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContentsMultiplyColor:", v13);

}

- (void)_updateFillLayer
{
  void *v3;
  _BOOL8 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  void *v39;
  double v40;
  __int128 v41;
  __int128 v42;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[_UIBatteryView _bodyRectForTraitCollection:](self, "_bodyRectForTraitCollection:", v3);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v3, "displayScale");
  v14 = v13;
  v15 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v41 = *MEMORY[0x1E0C9D648];
  v42 = v15;
  v40 = 0.0;
  -[_UIBatteryView _fillLayerFrame:cornerRadius:](self, "_fillLayerFrame:cornerRadius:", &v41, &v40);
  if (-[_UIStaticBatteryView _useImagesWithCutoutsForBolt](self, "_useImagesWithCutoutsForBolt"))
  {
    -[_UIBatteryView boltMaskLayer](self, "boltMaskLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v18 = v17;
    v20 = v19;

    -[_UIStaticBatteryView _boltPathSize](self, "_boltPathSize");
    v22 = v21;
    v24 = v23;
    -[_UIStaticBatteryView _boltRectForTraitCollection:boltSize:](self, "_boltRectForTraitCollection:boltSize:", v3, v18, v20);
    objc_msgSend((id)objc_opt_class(), "_batteryFillImageWithSize:forScale:cornerRadius:withBoltCutOutOfSize:inRect:boltFlipped:", v4, v42, v14, v40, v22, v24, v25 - *(double *)&v41, v26 - *((double *)&v41 + 1), v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[_UIBatteryView showsPercentage](self, "showsPercentage"))
  {
    -[_UIBatteryView _lineWidthAndInterspaceForTraitCollection:](self, "_lineWidthAndInterspaceForTraitCollection:", v3);
    v31 = v30;
    if (-[_UIBatteryView rounded](self, "rounded"))
    {
      v32 = v12 / 3.125;
    }
    else
    {
      -[_UIBatteryView _outsideCornerRadiusForTraitCollection:](self, "_outsideCornerRadiusForTraitCollection:", v3);
      v32 = v33 + v31 * -0.5;
    }
    objc_msgSend((id)objc_opt_class(), "_percentFillImageWithSize:forScale:batteryRect:cornerRadius:lineWidth:", v42, v14, v6, v8, v10, v12, v32, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_batteryFillImageWithSize:forScale:cornerRadius:", v42, v14, v40);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34 = objc_retainAutorelease(v29);
  v35 = objc_msgSend(v34, "CGImage");
  -[_UIBatteryView fillLayer](self, "fillLayer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setContents:", v35);

  v37 = v41;
  v38 = v42;
  -[_UIBatteryView fillLayer](self, "fillLayer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFrame:", v37, v38);

}

- (void)_updateBatteryFillColor
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;

  -[_UIBatteryView _batteryFillColor](self, "_batteryFillColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");
  -[_UIBatteryView fillLayer](self, "fillLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentsMultiplyColor:", v4);

  -[_UIBatteryView fillLayer](self, "fillLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 1.0;
  objc_msgSend(v6, "setOpacity:", v7);

  if (-[_UIBatteryView showsPercentage](self, "showsPercentage"))
    -[_UIStaticBatteryView _updateBodyColors](self, "_updateBodyColors");
}

- (BOOL)_useImagesWithCutoutsForBolt
{
  return !-[_UIBatteryView showsPercentage](self, "showsPercentage")
      && !self->_inflightBoltAnimationCount
      && -[_UIBatteryView _shouldShowBolt](self, "_shouldShowBolt");
}

- (CGRect)_updateBodyLayers
{
  void *v3;
  _BOOL8 v4;
  _BOOL8 v5;
  _BOOL8 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  double v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  CGFloat v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  CGRect v71;
  CGRect result;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UIStaticBatteryView _useImagesWithCutoutsForBolt](self, "_useImagesWithCutoutsForBolt");
  v5 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v6 = -[_UIBatteryView showsPercentage](self, "showsPercentage");
  -[_UIBatteryView _lineWidthAndInterspaceForTraitCollection:](self, "_lineWidthAndInterspaceForTraitCollection:", v3);
  v8 = v7;
  objc_msgSend(v3, "displayScale");
  v10 = v9;
  -[_UIBatteryView _batterySizeForTraitCollection:](self, "_batterySizeForTraitCollection:", v3);
  v65 = v11;
  -[_UIBatteryView _pinSizeForTraitCollection:](self, "_pinSizeForTraitCollection:", v3);
  v13 = v12;
  v67 = v14;
  -[_UIBatteryView _bodyRectForTraitCollection:](self, "_bodyRectForTraitCollection:", v3);
  v16 = v15;
  v68 = v18;
  v69 = v17;
  v70 = v19;
  -[UIView bounds](self, "bounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v66 = v26;
  if (-[_UIBatteryView rounded](self, "rounded"))
  {
    v27 = v70 / 3.125;
  }
  else
  {
    -[_UIBatteryView _outsideCornerRadiusForTraitCollection:](self, "_outsideCornerRadiusForTraitCollection:", v3);
    v27 = v28 + v8 * -0.5;
  }
  v64 = v27;
  if (v4)
  {
    -[_UIBatteryView boltMaskLayer](self, "boltMaskLayer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bounds");
    v63 = v16;
    v31 = v30;
    v62 = v21;
    v32 = v8;
    v34 = v33;

    -[_UIStaticBatteryView _boltPathSize](self, "_boltPathSize");
    v36 = v35;
    v61 = v37;
    -[_UIStaticBatteryView _boltRectForTraitCollection:boltSize:](self, "_boltRectForTraitCollection:boltSize:", v3, v31, v34);
    v8 = v32;
    v21 = v62;
    v16 = v63;
    v60 = v36;
    v38 = v66;
    objc_msgSend((id)objc_opt_class(), "_batteryBodyImageWithSize:forScale:batteryRect:cornerRadius:lineWidth:withBoltCutOutOfSize:inRect:boltFlipped:", v5, v25, v66, v10, v63, v69, v68, v70, v64, *(_QWORD *)&v8, v60, v61, v39, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = (void *)objc_opt_class();
    v45 = 0.0;
    if (!v6)
      v45 = v8;
    v38 = v66;
    objc_msgSend(v44, "_batteryBodyImageWithSize:forScale:batteryRect:cornerRadius:lineWidth:filled:", v6, v25, v66, v10, v16, v69, v68, v70, v64, *(_QWORD *)&v45);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v46 = objc_retainAutorelease(v43);
  v47 = objc_msgSend(v46, "CGImage");
  -[_UIBatteryView bodyLayer](self, "bodyLayer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setContents:", v47);

  -[_UIBatteryView bodyLayer](self, "bodyLayer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setFrame:", v21, v23, v25, v38);

  -[_UIBatteryView boltMaskLayer](self, "boltMaskLayer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setHidden:", v4);

  v71.origin.x = v21;
  v71.origin.y = v23;
  v71.size.width = v25;
  v71.size.height = v38;
  v51 = CGRectGetMidY(v71) + v67 * -0.5;
  -[_UIBatteryView pinLayer](self, "pinLayer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setFrame:", v8 + v65, v51, v13, v67);

  objc_msgSend((id)objc_opt_class(), "_batteryPinImageWithSize:forScale:complexPinPath:", -[_UIBatteryView internalSizeCategory](self, "internalSizeCategory") == 2, v13, v67, v10);
  v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v54 = objc_msgSend(v53, "CGImage");
  -[_UIBatteryView pinLayer](self, "pinLayer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setContents:", v54);

  v56 = v16;
  v58 = v68;
  v57 = v69;
  v59 = v70;
  result.size.height = v59;
  result.size.width = v58;
  result.origin.y = v57;
  result.origin.x = v56;
  return result;
}

- (CGSize)_boltPathSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[_UIBatteryView boltMaskLayer](self, "boltMaskLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[_UIStaticBatteryView _batteryPathScaleFactor](self, "_batteryPathScaleFactor");
  v9 = v7 / v8;
  v10 = v5 / v8;
  result.height = v9;
  result.width = v10;
  return result;
}

- (CGRect)_boltRectForTraitCollection:(id)a3 boltSize:(CGSize)a4
{
  double height;
  double width;
  CGFloat x;
  CGFloat y;
  CGFloat v9;
  CGFloat v10;
  double MidX;
  double MidY;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;
  CGRect result;

  height = a4.height;
  width = a4.width;
  -[_UIBatteryView _bodyRectForTraitCollection:](self, "_bodyRectForTraitCollection:", a3);
  x = v21.origin.x;
  y = v21.origin.y;
  v9 = v21.size.width;
  v10 = v21.size.height;
  MidX = CGRectGetMidX(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = v9;
  v22.size.height = v10;
  MidY = CGRectGetMidY(v22);
  -[_UIStaticBatteryView _batteryBoltLargeScaleFactor](self, "_batteryBoltLargeScaleFactor");
  v14 = v13;
  -[_UIBatteryView _batteryBoltScaleFactorMultiplier](self, "_batteryBoltScaleFactorMultiplier");
  v16 = v14 * v15;
  v17 = width * v16;
  v18 = height * v16;
  v19 = MidX - width * v16 * 0.5;
  v20 = MidY - v18 * 0.5;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (double)_batteryPathScaleFactor
{
  double v3;
  double v4;
  double v5;
  objc_super v7;

  -[_UIStaticBatteryView _batteryBoltLargeScaleFactor](self, "_batteryBoltLargeScaleFactor");
  v7.receiver = self;
  v7.super_class = (Class)_UIStaticBatteryView;
  v4 = 1.0 / v3;
  -[_UIBatteryView _batteryBoltLargeScaleFactor](&v7, sel__batteryBoltLargeScaleFactor);
  return v4 / (1.0 / v5);
}

- (double)_batteryBoltLargeScaleFactor
{
  return 0.5;
}

+ (id)_batteryPinImageWithSize:(CGSize)a3 forScale:(double)a4 complexPinPath:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  _UISignalViewCacheKey *v10;
  _UISignalViewCacheKey *v11;
  void *v12;
  void *v13;

  v5 = a5;
  height = a3.height;
  width = a3.width;
  if (qword_1ECD82668 != -1)
    dispatch_once(&qword_1ECD82668, &__block_literal_global_22_10);
  v10 = [_UISignalViewCacheKey alloc];
  v11 = -[_UISignalViewCacheKey initWithClass:size:rect:radius:lineWidth:alternate:scale:](v10, "initWithClass:size:rect:radius:lineWidth:alternate:scale:", a1, v5, width, height, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), 0.0, 0.0, *(_QWORD *)&a4);
  objc_msgSend((id)qword_1ECD82660, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(a1, "_pinBezierPathForSize:isComplex:", v5, width, height);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_imageWithRenderedBezierPath:size:scale:pathScaleFactor:stroke:fill:", v13, 0, 1, width, height, a4, 1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_1ECD82660, "setObject:forKey:", v12, v11);

  }
  return v12;
}

+ (id)_batteryFillImageWithSize:(CGSize)a3 forScale:(double)a4 cornerRadius:(double)a5 withBoltCutOutOfSize:(CGSize)a6 inRect:(CGRect)a7 boltFlipped:(BOOL)a8
{
  _BOOL8 v8;
  double height;
  double width;
  double v12;
  _UISignalViewCacheKey *v14;
  _UISignalViewCacheKey *v15;
  void *v16;
  void *v17;
  void *v18;
  double v21;

  v8 = a8;
  height = a6.height;
  width = a6.width;
  v21 = a3.height;
  v12 = a3.width;
  if (qword_1ECD826A8 != -1)
    dispatch_once(&qword_1ECD826A8, &__block_literal_global_26_6);
  v14 = [_UISignalViewCacheKey alloc];
  v15 = -[_UISignalViewCacheKey initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:](v14, "initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:", a1, v8, v12, v21, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), a5, 0.0, *(_QWORD *)&width, *(_QWORD *)&height, *(_QWORD *)&a7.origin.x, *(_QWORD *)&a7.origin.y, *(_QWORD *)&a7.size.width, *(_QWORD *)&a7.size.height, *(_QWORD *)&a4);
  objc_msgSend((id)qword_1ECD826A0, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(a1, "_batteryFillImageWithSize:forScale:cornerRadius:", v12, v21, a4, a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_batteryBoltMaskImageWithSize:boltSize:forScale:", width, height, width, height, a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_imageByPunchingImage:inRect:flippedHorizontally:outOfImage:inRect:size:scale:", v18, v8, v17, a7.origin.x, a7.origin.y, a7.size.width, a7.size.height, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v12, v21, *(_QWORD *)&v12, *(_QWORD *)&v21, *(_QWORD *)&a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_1ECD826A0, "setObject:forKey:", v16, v15);

  }
  return v16;
}

+ (id)_batteryBodyImageWithSize:(double)a3 forScale:(double)a4 batteryRect:(double)a5 cornerRadius:(double)a6 lineWidth:(double)a7 withBoltCutOutOfSize:(double)a8 inRect:(double)a9 boltFlipped:(uint64_t)a10
{
  _UISignalViewCacheKey *v28;
  _UISignalViewCacheKey *v29;
  void *v30;
  void *v31;
  void *v32;

  if (qword_1ECD82648 != -1)
    dispatch_once(&qword_1ECD82648, &__block_literal_global_20_8);
  v28 = [_UISignalViewCacheKey alloc];
  v29 = -[_UISignalViewCacheKey initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:](v28, "initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:", a1, a11, a2, a3, a5, a6, a7, a8, a9, a12, *MEMORY[0x1E0C9D820], *(_QWORD *)(MEMORY[0x1E0C9D820] + 8), *(_QWORD *)&a15, *(_QWORD *)&a16, *(_QWORD *)&a17, *(_QWORD *)&a18, *(_QWORD *)&a4);
  objc_msgSend((id)qword_1ECD82640, "objectForKey:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v30)
  {
    objc_msgSend(a1, "_batteryBodyImageWithSize:forScale:batteryRect:cornerRadius:lineWidth:filled:", 0, a2, a3, a4, a5, a6, a7, a8, a9, *(_QWORD *)&a12);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_batteryBoltMaskImageWithSize:boltSize:forScale:", a13, a14, a13, a14, a4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_imageByPunchingImage:inRect:flippedHorizontally:outOfImage:inRect:size:scale:", v32, a11, v31, a15, a16, a17, a18, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a2, a3, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_1ECD82640, "setObject:forKey:", v30, v29);

  }
  return v30;
}

+ (id)_batteryBoltMaskImageWithSize:(CGSize)a3 boltSize:(CGSize)a4 forScale:(double)a5
{
  double height;
  double width;
  double v8;
  double v9;
  _UISignalViewCacheKey *v11;
  _UISignalViewCacheKey *v12;
  void *v13;
  double v14;
  void *v15;

  height = a4.height;
  width = a4.width;
  v8 = a3.height;
  v9 = a3.width;
  if (qword_1ECD82688 != -1)
    dispatch_once(&qword_1ECD82688, &__block_literal_global_24_9);
  v11 = [_UISignalViewCacheKey alloc];
  v12 = -[_UISignalViewCacheKey initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:](v11, "initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:", a1, 0, v9, v8, *(_QWORD *)&width, *(_QWORD *)&height, *MEMORY[0x1E0C9D628], *(_QWORD *)(MEMORY[0x1E0C9D628] + 8), *(_QWORD *)(MEMORY[0x1E0C9D628] + 16), *(_QWORD *)(MEMORY[0x1E0C9D628] + 24), *(_QWORD *)&a5);
  objc_msgSend((id)qword_1ECD82680, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if (v9 / width <= v8 / height)
      v14 = v9 / width;
    else
      v14 = v8 / height;
    objc_msgSend(a1, "_boltMaskBezierPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_imageWithRenderedBezierPath:size:scale:pathScaleFactor:stroke:fill:", v15, 0, 1, v9, v8, a5, v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_1ECD82680, "setObject:forKey:", v13, v12);

  }
  return v13;
}

+ (id)_batteryBoltImageWithSize:(CGSize)a3 boltSize:(CGSize)a4 forScale:(double)a5
{
  double height;
  double width;
  double v8;
  double v9;
  _UISignalViewCacheKey *v11;
  _UISignalViewCacheKey *v12;
  void *v13;
  double v14;
  void *v15;

  height = a4.height;
  width = a4.width;
  v8 = a3.height;
  v9 = a3.width;
  if (qword_1ECD82678 != -1)
    dispatch_once(&qword_1ECD82678, &__block_literal_global_23_11);
  v11 = [_UISignalViewCacheKey alloc];
  v12 = -[_UISignalViewCacheKey initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:](v11, "initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:", a1, 0, v9, v8, *(_QWORD *)&width, *(_QWORD *)&height, *MEMORY[0x1E0C9D628], *(_QWORD *)(MEMORY[0x1E0C9D628] + 8), *(_QWORD *)(MEMORY[0x1E0C9D628] + 16), *(_QWORD *)(MEMORY[0x1E0C9D628] + 24), *(_QWORD *)&a5);
  objc_msgSend((id)qword_1ECD82670, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if (v9 / width <= v8 / height)
      v14 = v9 / width;
    else
      v14 = v8 / height;
    objc_msgSend(a1, "_boltBezierPathForSize:", width, height);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_imageWithRenderedBezierPath:size:scale:pathScaleFactor:stroke:fill:", v15, 0, 1, v9, v8, a5, v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_1ECD82670, "setObject:forKey:", v13, v12);

  }
  return v13;
}

- (void)_createFillLayer
{
  id v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIBatteryView setFillLayer:](self, "setFillLayer:", v5);
  +[UIColor clearColor](UIColor, "clearColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "setContentsMultiplyColor:", objc_msgSend(v3, "CGColor"));

  -[_UIBatteryView bodyLayer](self, "bodyLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSublayer:", v5);

  -[_UIBatteryView setPercentFillLayer:](self, "setPercentFillLayer:", v5);
}

- (void)_createBodyLayers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIBatteryView setBodyLayer:](self, "setBodyLayer:", v7);
  +[UIColor clearColor](UIColor, "clearColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "setContentsMultiplyColor:", objc_msgSend(v3, "CGColor"));

  -[UIView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSublayer:", v7);

  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBatteryView setPinLayer:](self, "setPinLayer:", v5);
  -[UIView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSublayer:", v5);

}

- (void)setShowsPercentage:(BOOL)a3
{
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)_UIStaticBatteryView;
  -[_UIBatteryView setShowsPercentage:](&v4, sel_setShowsPercentage_, a3);
  -[UIView frame](self, "frame");
  if (!CGRectIsEmpty(v5))
  {
    -[_UIStaticBatteryView _updateBodyLayers](self, "_updateBodyLayers");
    -[_UIStaticBatteryView _updateFillLayer](self, "_updateFillLayer");
  }
}

- (void)_willBeginAnimatingBoltToVisible:(BOOL)a3
{
  ++self->_inflightBoltAnimationCount;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin", a3);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[_UIStaticBatteryView _updateBodyLayers](self, "_updateBodyLayers");
  -[_UIStaticBatteryView _updateFillLayer](self, "_updateFillLayer");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)_didFinishAnimatingBoltToVisible:(BOOL)a3
{
  --self->_inflightBoltAnimationCount;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin", a3);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[_UIStaticBatteryView _updateBodyLayers](self, "_updateBodyLayers");
  -[_UIStaticBatteryView _updateFillLayer](self, "_updateFillLayer");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)setLowBatteryMode:(int64_t)a3
{
  _BOOL4 v5;
  objc_super v6;

  v5 = -[_UIBatteryView isLowBattery](self, "isLowBattery");
  v6.receiver = self;
  v6.super_class = (Class)_UIStaticBatteryView;
  -[_UIBatteryView setLowBatteryMode:](&v6, sel_setLowBatteryMode_, a3);
  if (v5 != -[_UIBatteryView isLowBattery](self, "isLowBattery"))
    -[_UIStaticBatteryView _updateBatteryFillColor](self, "_updateBatteryFillColor");
}

+ (id)_imageWithRenderedBezierPath:(id)a3 size:(CGSize)a4 scale:(double)a5 pathScaleFactor:(double)a6 stroke:(BOOL)a7 fill:(BOOL)a8
{
  double height;
  double width;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  double v21;
  BOOL v22;
  BOOL v23;

  height = a4.height;
  width = a4.width;
  v15 = a3;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __92___UIStaticBatteryView__imageWithRenderedBezierPath_size_scale_pathScaleFactor_stroke_fill___block_invoke;
  v19[3] = &unk_1E16C7B28;
  v21 = a6;
  v22 = a7;
  v20 = v15;
  v23 = a8;
  v16 = v15;
  objc_msgSend(a1, "_renderedImageOfSize:scale:withActions:", v19, width, height, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_imageByPunchingImage:(id)a3 inRect:(CGRect)a4 flippedHorizontally:(BOOL)a5 outOfImage:(id)a6 inRect:(CGRect)a7 size:(CGSize)a8 scale:(double)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  double v39;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v15 = a4.size.height;
  v16 = a4.size.width;
  v17 = a4.origin.y;
  v18 = a4.origin.x;
  v20 = a3;
  v21 = a6;
  if (a5)
  {
    objc_msgSend(v20, "imageWithHorizontallyFlippedOrientation");
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = v20;
  }
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __102___UIStaticBatteryView__imageByPunchingImage_inRect_flippedHorizontally_outOfImage_inRect_size_scale___block_invoke;
  v27[3] = &unk_1E16C7B50;
  v30 = x;
  v31 = y;
  v32 = width;
  v33 = height;
  v28 = v21;
  v29 = v22;
  v34 = v18;
  v35 = v17;
  v36 = v16;
  v37 = v15;
  v23 = v22;
  v24 = v21;
  objc_msgSend(a1, "_renderedImageOfSize:scale:withActions:", v27, a9, v38, v39);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)_renderedImageOfSize:(CGSize)a3 scale:(double)a4 withActions:(id)a5
{
  double height;
  double width;
  id v10;
  void *v11;
  UIGraphicsImageRenderer *v12;
  void *v13;
  void *v15;

  height = a3.height;
  width = a3.width;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIStaticBatteryView.m"), 308, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actions"));

  }
  +[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setScale:", a4);
  objc_msgSend(v11, "setOpaque:", 0);
  objc_msgSend(v11, "setPreferredRange:", 0x7FFFLL);
  v12 = -[UIGraphicsImageRenderer initWithSize:format:]([UIGraphicsImageRenderer alloc], "initWithSize:format:", v11, width, height);
  -[UIGraphicsImageRenderer imageWithActions:](v12, "imageWithActions:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_batteryBodyImageWithSize:(CGSize)a3 forScale:(double)a4 batteryRect:(CGRect)a5 cornerRadius:(double)a6 lineWidth:(double)a7 filled:(BOOL)a8
{
  _BOOL8 v8;
  double height;
  double width;
  double y;
  double x;
  double v14;
  double v15;
  _UISignalViewCacheKey *v17;
  void *v18;
  void *v19;

  v8 = a8;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a3.height;
  v15 = a3.width;
  if (qword_1ECD82638 != -1)
    dispatch_once(&qword_1ECD82638, &__block_literal_global_669);
  v17 = -[_UISignalViewCacheKey initWithClass:size:rect:radius:lineWidth:alternate:scale:]([_UISignalViewCacheKey alloc], "initWithClass:size:rect:radius:lineWidth:alternate:scale:", a1, v8, v15, v14, x, y, width, height, a6, a7, *(_QWORD *)&a4);
  objc_msgSend((id)_MergedGlobals_1332, "objectForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, a6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setLineWidth:", a7);
    objc_msgSend(a1, "_imageWithRenderedBezierPath:size:scale:pathScaleFactor:stroke:fill:", v19, 1, v8, v15, v14, a4, 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_MergedGlobals_1332, "setObject:forKey:", v18, v17);

  }
  return v18;
}

+ (id)_percentFillImageWithSize:(CGSize)a3 forScale:(double)a4 batteryRect:(CGRect)a5 cornerRadius:(double)a6 lineWidth:(double)a7
{
  double height;
  double width;
  double y;
  double x;
  double v12;
  double v13;
  _UISignalViewCacheKey *v15;
  void *v16;
  double v17;
  void *v18;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a3.height;
  v13 = a3.width;
  if (qword_1ECD82658 != -1)
    dispatch_once(&qword_1ECD82658, &__block_literal_global_21_6);
  v15 = -[_UISignalViewCacheKey initWithClass:size:rect:radius:lineWidth:alternate:scale:]([_UISignalViewCacheKey alloc], "initWithClass:size:rect:radius:lineWidth:alternate:scale:", a1, 0, v13, v12, x, y, width, height, a6, a7, *(_QWORD *)&a4);
  objc_msgSend((id)qword_1ECD82650, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    if (width >= a6 + a6)
      v17 = width;
    else
      v17 = a6 + a6;
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", x, y, v17, height, a6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLineWidth:", a7);
    objc_msgSend(a1, "_imageWithRenderedBezierPath:size:scale:pathScaleFactor:stroke:fill:", v18, 1, 1, v13, v12, a4, 1.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_1ECD82650, "setObject:forKey:", v16, v15);

  }
  return v16;
}

+ (id)_batteryFillImageWithSize:(CGSize)a3 forScale:(double)a4 cornerRadius:(double)a5
{
  double height;
  double width;
  _UISignalViewCacheKey *v10;
  _UISignalViewCacheKey *v11;
  void *v12;
  void *v13;

  height = a3.height;
  width = a3.width;
  if (qword_1ECD82698 != -1)
    dispatch_once(&qword_1ECD82698, &__block_literal_global_25_3);
  v10 = [_UISignalViewCacheKey alloc];
  v11 = -[_UISignalViewCacheKey initWithClass:size:rect:radius:lineWidth:alternate:scale:](v10, "initWithClass:size:rect:radius:lineWidth:alternate:scale:", a1, 0, width, height, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), a5, 0.0, *(_QWORD *)&a4);
  objc_msgSend((id)qword_1ECD82690, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[UIBezierPath _continuousRoundedCARectBezierPath:withRoundedCorners:cornerRadius:segments:](UIBezierPath, "_continuousRoundedCARectBezierPath:withRoundedCorners:cornerRadius:segments:", -1, 16, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, height, a5, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_imageWithRenderedBezierPath:size:scale:pathScaleFactor:stroke:fill:", v13, 0, 1, width, height, a4, 1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_1ECD82690, "setObject:forKey:", v12, v11);

  }
  return v12;
}

@end
