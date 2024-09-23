@implementation _UIPickerViewStyle_iOS

- (CGSize)defaultSizeForTraitCollection:(id)a3
{
  id v3;
  double v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  CGSize result;

  v3 = a3;
  if (!dyld_program_sdk_at_least())
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v5 = 0x4074000000000000;
    }
    else
    {
      v8 = objc_msgSend(v3, "verticalSizeClass");
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8 == 1)
      {
        objc_msgSend(v9, "_boundsForInterfaceOrientation:", 4);
        v5 = v11;

        v4 = 162.0;
        goto LABEL_12;
      }
      objc_msgSend(v9, "_boundsForInterfaceOrientation:", 1);
      v5 = v12;

    }
    v4 = 216.0;
    goto LABEL_12;
  }
  if (objc_msgSend(v3, "verticalSizeClass") == 1)
    v4 = 162.0;
  else
    v4 = 216.0;
  v5 = 0x4074000000000000;
LABEL_12:

  v13 = *(double *)&v5;
  v14 = v4;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 forTraitCollection:(id)a4
{
  double height;
  double width;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[_UIPickerViewStyle_iOS defaultSizeForTraitCollection:](self, "defaultSizeForTraitCollection:", a4);
  if (height != 0.0)
  {
    v7 = 216.0;
    if (height < 216.0)
      v7 = dbl_18667F540[height < 180.0];
  }
  if (width != 0.0)
    v6 = width;
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)sizeIsValid:(CGSize)a3
{
  double height;
  BOOL v5;

  height = a3.height;
  if ((dyld_program_sdk_at_least() & 1) != 0)
    return 1;
  v5 = height == 216.0;
  if (height == 180.0)
    v5 = 1;
  return height == 162.0 || v5;
}

- (double)defaultRowHeightForSize:(CGSize)a3
{
  double result;

  result = 32.0;
  if (a3.height < 216.0)
    return 24.0;
  return result;
}

- (double)paddingBetweenWheels
{
  return 5.0;
}

- (double)paddingAroundWheels
{
  return 0.0;
}

- (double)selectionBarSideInset
{
  return 9.0;
}

- (double)labelSideOffset
{
  return 9.0;
}

- (CATransform3D)perspectiveTransform
{
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = (_OWORD *)MEMORY[0x1E0CD2610];
  v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&retstr->m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&retstr->m33 = v4;
  v5 = v3[7];
  *(_OWORD *)&retstr->m41 = v3[6];
  *(_OWORD *)&retstr->m43 = v5;
  v6 = v3[1];
  *(_OWORD *)&retstr->m11 = *v3;
  *(_OWORD *)&retstr->m13 = v6;
  v7 = v3[3];
  *(_OWORD *)&retstr->m21 = v3[2];
  *(_OWORD *)&retstr->m23 = v7;
  retstr->m34 = -0.00111111111;
  return self;
}

- (void)configureMaskGradientLayer:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.0);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "CGColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.71);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "CGColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.8);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "CGColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v5;
  v11[1] = v7;
  v11[2] = v9;
  v11[3] = v9;
  v11[4] = v7;
  v11[5] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColors:", v10);

  objc_msgSend(v3, "setLocations:", &unk_1E1A93728);
}

- (id)createCenterHighlightView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  +[UIColor quaternarySystemFillColor](UIColor, "quaternarySystemFillColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  objc_msgSend(v2, "_setContinuousCornerRadius:", 8.0);
  return v2;
}

- (double)horizontalPaddingForCenterHighlightView
{
  int v2;
  double result;

  v2 = dyld_program_sdk_at_least();
  result = 0.0;
  if (v2)
    return 9.0;
  return result;
}

- (double)verticalPaddingForCenterHighlightView
{
  return 2.0;
}

- (double)horizontalPaddingForContents
{
  int v2;
  double result;

  v2 = dyld_program_sdk_at_least();
  result = 0.0;
  if (v2)
    return 9.0;
  return result;
}

- (double)_zCoordinateForYCoordinate:(double)a3 inBounds:(CGRect)a4
{
  float v4;

  v4 = a3 / a4.size.height + -0.5;
  return (float)(cosf(v4) + -1.0);
}

- (double)_unitYForViewY:(double)a3 inBounds:(CGRect)a4
{
  return a3 / a4.size.height + -0.5 + a3 / a4.size.height + -0.5;
}

- (double)_yRangingFromZeroTo:(double)a3 forUnitY:(double)a4
{
  return (a4 * 0.5 + 0.5) * a3;
}

- (double)_viewYForUnitY:(double)a3 inBounds:(CGRect)a4
{
  double result;

  -[_UIPickerViewStyle_iOS _yRangingFromZeroTo:forUnitY:](self, "_yRangingFromZeroTo:forUnitY:", a4.size.height, a3, a4.origin.y, a4.size.width);
  return result;
}

- (double)_zForUnitY:(double)a3 inBounds:(CGRect)a4 rowHeight:(double)a5
{
  double height;
  double v7;

  height = a4.size.height;
  -[_UIPickerViewStyle_iOS _viewYForUnitY:inBounds:](self, "_viewYForUnitY:inBounds:", a3);
  -[_UIPickerViewStyle_iOS _rotationForCellCenterY:inBounds:rowHeight:](self, "_rotationForCellCenterY:inBounds:rowHeight:");
  *(float *)&v7 = v7;
  return height / 3.14159265 * 1.05 * cosf(*(float *)&v7) - height / 3.14159265 * 1.05;
}

- (double)_distanceToCenterForY:(double)a3 inBounds:(CGRect)a4
{
  return a4.size.height * 0.5 - a3;
}

- (double)_yForY:(double)a3 inBounds:(CGRect)a4 rowHeight:(double)a5
{
  double height;
  double v6;

  height = a4.size.height;
  -[_UIPickerViewStyle_iOS _rotationForCellCenterY:inBounds:rowHeight:](self, "_rotationForCellCenterY:inBounds:rowHeight:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5);
  *(float *)&v6 = v6;
  return height / -3.14159265 * 1.05 * sinf(*(float *)&v6);
}

- (double)_rotationForCellCenterY:(double)a3 inBounds:(CGRect)a4 rowHeight:(double)a5
{
  float v5;

  v5 = (a4.size.height + a4.size.height) / a5;
  return (a3 + a4.size.height * -0.5) / a5 * -6.28318531 / ceilf(v5);
}

- (CATransform3D)transformForCellAtY:(SEL)a3 inBounds:(double)a4 rowHeight:(CGRect)a5 selectionBarRect:(double)a6
{
  double height;
  double width;
  double y;
  double x;
  __int128 *v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CATransform3D *result;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v53;
  CATransform3D v54;
  CATransform3D v55;
  CATransform3D v56;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = (__int128 *)MEMORY[0x1E0CD2610];
  v49 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v50 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&retstr->m31 = v50;
  *(_OWORD *)&retstr->m33 = v49;
  v47 = v15[7];
  v48 = v15[6];
  *(_OWORD *)&retstr->m41 = v48;
  *(_OWORD *)&retstr->m43 = v47;
  v45 = v15[1];
  v46 = *v15;
  *(_OWORD *)&retstr->m11 = *v15;
  *(_OWORD *)&retstr->m13 = v45;
  v43 = v15[3];
  v44 = v15[2];
  *(_OWORD *)&retstr->m21 = v44;
  *(_OWORD *)&retstr->m23 = v43;
  memset(&v56, 0, sizeof(v56));
  -[_UIPickerViewStyle_iOS _rotationForCellCenterY:inBounds:rowHeight:](self, "_rotationForCellCenterY:inBounds:rowHeight:", a4, a5.origin.x);
  CATransform3DMakeRotation(&v56, v16, 1.0, 0.0, 0.0);
  memset(&v55, 0, sizeof(v55));
  -[_UIPickerViewStyle_iOS _distanceToCenterForY:inBounds:](self, "_distanceToCenterForY:inBounds:", a4, x, y, width, height);
  CATransform3DMakeTranslation(&v55, 0.0, v17, 0.0);
  memset(&v54, 0, sizeof(v54));
  -[_UIPickerViewStyle_iOS _yForY:inBounds:rowHeight:](self, "_yForY:inBounds:rowHeight:", a4, x, y, width, height, a6);
  v19 = v18;
  -[_UIPickerViewStyle_iOS _unitYForViewY:inBounds:](self, "_unitYForViewY:inBounds:", a4, x, y, width, height);
  -[_UIPickerViewStyle_iOS _zForUnitY:inBounds:rowHeight:](self, "_zForUnitY:inBounds:rowHeight:");
  CATransform3DMakeTranslation(&v54, 0.0, v19, v20);
  result = (CATransform3D *)-[_UIPickerViewStyle_iOS _distanceToCenterForY:inBounds:](self, "_distanceToCenterForY:inBounds:", a4, x, y, width, height);
  if (fabs(v22) > a7.size.height * 0.5)
  {
    *(_OWORD *)&a.m31 = v50;
    *(_OWORD *)&a.m33 = v49;
    *(_OWORD *)&a.m41 = v48;
    *(_OWORD *)&a.m43 = v47;
    *(_OWORD *)&a.m11 = v46;
    *(_OWORD *)&a.m13 = v45;
    *(_OWORD *)&a.m21 = v44;
    *(_OWORD *)&a.m23 = v43;
    b = v56;
    CATransform3DConcat(&v53, &a, &b);
    v23 = *(_OWORD *)&v53.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v53.m31;
    *(_OWORD *)&retstr->m33 = v23;
    v24 = *(_OWORD *)&v53.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v53.m41;
    *(_OWORD *)&retstr->m43 = v24;
    v25 = *(_OWORD *)&v53.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v53.m11;
    *(_OWORD *)&retstr->m13 = v25;
    v26 = *(_OWORD *)&v53.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v53.m21;
    *(_OWORD *)&retstr->m23 = v26;
    v27 = *(_OWORD *)&retstr->m33;
    *(_OWORD *)&a.m31 = *(_OWORD *)&retstr->m31;
    *(_OWORD *)&a.m33 = v27;
    v28 = *(_OWORD *)&retstr->m43;
    *(_OWORD *)&a.m41 = *(_OWORD *)&retstr->m41;
    *(_OWORD *)&a.m43 = v28;
    v29 = *(_OWORD *)&retstr->m13;
    *(_OWORD *)&a.m11 = *(_OWORD *)&retstr->m11;
    *(_OWORD *)&a.m13 = v29;
    v30 = *(_OWORD *)&retstr->m23;
    *(_OWORD *)&a.m21 = *(_OWORD *)&retstr->m21;
    *(_OWORD *)&a.m23 = v30;
    b = v55;
    CATransform3DConcat(&v53, &a, &b);
    v31 = *(_OWORD *)&v53.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v53.m31;
    *(_OWORD *)&retstr->m33 = v31;
    v32 = *(_OWORD *)&v53.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v53.m41;
    *(_OWORD *)&retstr->m43 = v32;
    v33 = *(_OWORD *)&v53.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v53.m11;
    *(_OWORD *)&retstr->m13 = v33;
    v34 = *(_OWORD *)&v53.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v53.m21;
    *(_OWORD *)&retstr->m23 = v34;
    v35 = *(_OWORD *)&retstr->m33;
    *(_OWORD *)&a.m31 = *(_OWORD *)&retstr->m31;
    *(_OWORD *)&a.m33 = v35;
    v36 = *(_OWORD *)&retstr->m43;
    *(_OWORD *)&a.m41 = *(_OWORD *)&retstr->m41;
    *(_OWORD *)&a.m43 = v36;
    v37 = *(_OWORD *)&retstr->m13;
    *(_OWORD *)&a.m11 = *(_OWORD *)&retstr->m11;
    *(_OWORD *)&a.m13 = v37;
    v38 = *(_OWORD *)&retstr->m23;
    *(_OWORD *)&a.m21 = *(_OWORD *)&retstr->m21;
    *(_OWORD *)&a.m23 = v38;
    b = v54;
    result = CATransform3DConcat(&v53, &a, &b);
    v39 = *(_OWORD *)&v53.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v53.m31;
    *(_OWORD *)&retstr->m33 = v39;
    v40 = *(_OWORD *)&v53.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v53.m41;
    *(_OWORD *)&retstr->m43 = v40;
    v41 = *(_OWORD *)&v53.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v53.m11;
    *(_OWORD *)&retstr->m13 = v41;
    v42 = *(_OWORD *)&v53.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v53.m21;
    *(_OWORD *)&retstr->m23 = v42;
  }
  return result;
}

- (double)horizontalBiasForEndTablesWithColumnFrame:(CGRect)a3 tableFrame:(CGRect)a4
{
  double width;
  double x;
  double v6;
  double MidX;
  double v8;

  width = a4.size.width;
  x = a4.origin.x;
  v6 = a3.size.width;
  MidX = CGRectGetMidX(a3);
  v8 = 0.0;
  if (floor(width) > ceil(v6 / 3.0))
    return (x + width * 0.5 - MidX) / -10.0;
  return v8;
}

@end
