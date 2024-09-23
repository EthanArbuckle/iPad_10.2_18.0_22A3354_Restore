@implementation PUPhotoEditLayoutSupport

+ (id)layoutConstraintsForHidingView:(id)a3 layoutOrientation:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v17;

  v7 = a3;
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUPhotoEditLayoutSupport.m"), 22, CFSTR("The view must have a superview"));

  }
  if (a4 == 2)
  {
    v9 = (void *)MEMORY[0x1E0CB3718];
    v10 = 1.0;
    v11 = v7;
    v12 = 1;
    v13 = v8;
    v14 = 2;
  }
  else
  {
    if (a4 != 1)
    {
      v15 = 0;
      goto LABEL_9;
    }
    v9 = (void *)MEMORY[0x1E0CB3718];
    v10 = 1.0;
    v11 = v7;
    v12 = 3;
    v13 = v8;
    v14 = 4;
  }
  objc_msgSend(v9, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, v12, 0, v13, v14, v10, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v15;
}

+ (id)layoutConstraintsForHidingSecondaryView:(id)a3 layoutOrientation:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v10;

  v6 = a3;
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUPhotoEditLayoutSupport.m"), 45, CFSTR("The view must have a superview"));

  }
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 4, 0, v7, 3, 1.0, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)transitionFromBarView:(id)a3 orientation:(int64_t)a4 toBarView:(id)a5 orientation:(int64_t)a6 coordinator:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;

  v14 = a3;
  v15 = a5;
  v16 = a8;
  v17 = a7;
  +[PUPhotoEditLayoutSupport layoutConstraintsForHidingView:layoutOrientation:](PUPhotoEditLayoutSupport, "layoutConstraintsForHidingView:layoutOrientation:", v14, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPhotoEditLayoutSupport layoutConstraintsForHidingView:layoutOrientation:](PUPhotoEditLayoutSupport, "layoutConstraintsForHidingView:layoutOrientation:", v15, a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "superview");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUPhotoEditLayoutSupport.m"), 60, CFSTR("The view must have a superview"));

  }
  objc_msgSend(v20, "addConstraint:", v19);
  objc_msgSend(v15, "setAlpha:", 0.0);
  objc_msgSend(v20, "layoutIfNeeded");
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __114__PUPhotoEditLayoutSupport_transitionFromBarView_orientation_toBarView_orientation_coordinator_completionHandler___block_invoke;
  v31[3] = &unk_1E58A4570;
  v32 = v20;
  v33 = v18;
  v34 = v19;
  v35 = v14;
  v36 = v15;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __114__PUPhotoEditLayoutSupport_transitionFromBarView_orientation_toBarView_orientation_coordinator_completionHandler___block_invoke_2;
  v29[3] = &unk_1E58A4058;
  v30 = v16;
  v21 = v16;
  v22 = v15;
  v23 = v14;
  v24 = v19;
  v25 = v18;
  v26 = v20;
  objc_msgSend(v17, "animateAlongsideTransition:completion:", v31, v29);

}

+ (int)productType
{
  if (productType_onceToken != -1)
    dispatch_once(&productType_onceToken, &__block_literal_global_59300);
  return productType_productType;
}

+ (BOOL)isPhoneClassDevice
{
  if (isPhoneClassDevice_onceToken != -1)
    dispatch_once(&isPhoneClassDevice_onceToken, &__block_literal_global_7);
  return isPhoneClassDevice_isiPhoneClass;
}

+ (BOOL)isNotchedPhone
{
  int v3;
  uint64_t v4;

  v3 = objc_msgSend(a1, "isPhoneClassDevice");
  if (v3)
  {
    v4 = objc_msgSend(a1, "productType");
    LOBYTE(v3) = v4 != 2078329141 && v4 != 2159747553;
  }
  return v3;
}

+ (BOOL)doneCancelButtonsInNotchAreaForLayoutOrientation:(int64_t)a3 viewWidth:(double)a4
{
  BOOL v6;
  BOOL v7;

  v6 = +[PUPhotoEditLayoutSupport isPhoneClassDevice](PUPhotoEditLayoutSupport, "isPhoneClassDevice");
  v7 = a4 < 510.0 || v6;
  return a3 != 2 && v7;
}

+ (id)constraintsForNotchAreaButtonsLeading:(id)a3 trailing:(id)a4 inWindow:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  CGRect v20;
  double v21;
  double MinX;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  CGRect v48;
  CGRect v49;
  _QWORD v50[10];

  v50[8] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  memset(&v49, 0, sizeof(v49));
  memset(&v48, 0, sizeof(v48));
  v10 = (void *)MEMORY[0x1E0DC3BF8];
  v11 = a5;
  objc_msgSend(v10, "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "layoutDirection");
  objc_msgSend(v11, "screen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;

  objc_msgSend(v11, "screen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "bounds");
  objc_msgSend(a1, "getTopLeadingButtonFrame:topTrailingButtonFrame:inBounds:inRTL:", &v49, &v48, v14 == 1);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "setPreferredContentFittingSize:", *(_OWORD *)&v49.size);
    objc_msgSend(v9, "setPreferredContentFittingSize:", *(_OWORD *)&v48.size);
  }
  objc_msgSend(v8, "superview");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = v49;
    v46 = v13;
    if (v14 == 1)
    {
      v21 = v17 - CGRectGetMaxX(v20);
      MinX = CGRectGetMinX(v48);
    }
    else
    {
      v21 = CGRectGetMinX(v20);
      MinX = v17 - CGRectGetMaxX(v48);
    }
    objc_msgSend(v8, "widthAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToConstant:", v49.size.width);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v44;
    objc_msgSend(v8, "heightAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToConstant:", v49.size.height);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v42;
    objc_msgSend(v8, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:constant:", v40, v21);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v39;
    objc_msgSend(v8, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, v49.origin.y);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v50[3] = v36;
    objc_msgSend(v9, "widthAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToConstant:", v48.size.width);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v50[4] = v34;
    objc_msgSend(v9, "heightAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToConstant:", v48.size.height);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v50[5] = v23;
    objc_msgSend(v9, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, -MinX);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v50[6] = v26;
    objc_msgSend(v9, "topAnchor");
    v27 = v8;
    v28 = v9;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, v48.origin.y);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v50[7] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 8);
    v47 = (id)objc_claimAutoreleasedReturnValue();

    v9 = v28;
    v8 = v27;

    v13 = v46;
  }
  else
  {
    v47 = (id)MEMORY[0x1E0C9AA60];
  }

  return v47;
}

+ (double)topToolbarVerticalOffsetForLayoutOrientation:(int64_t)a3 view:(id)a4
{
  id v6;
  uint64_t v7;
  BOOL v9;
  double v10;
  _BOOL4 v11;
  double v12;
  _BOOL4 v13;
  double v14;

  v6 = a4;
  v7 = MGGetProductType();
  v9 = v7 == 2078329141 || v7 == 2159747553;
  if (a3 == 1 && v9)
  {
    v10 = 66.0;
  }
  else
  {
    v11 = +[PUPhotoEditLayoutSupport isPhoneClassDevice](PUPhotoEditLayoutSupport, "isPhoneClassDevice");
    if (a3 != 1 || v11)
    {
      v13 = +[PUPhotoEditLayoutSupport isPhoneClassDevice](PUPhotoEditLayoutSupport, "isPhoneClassDevice");
      v10 = 0.0;
      if (a3 == 1 && v13)
      {
        objc_msgSend(v6, "safeAreaInsets");
        v10 = fmin(fmax(59.0 - v14, 0.0), 12.0);
      }
    }
    else
    {
      objc_msgSend(v6, "bounds");
      if (objc_msgSend(a1, "doneCancelButtonsInNotchAreaForLayoutOrientation:viewWidth:", 1, v12))
        v10 = 46.0;
      else
        v10 = 0.0;
    }
  }

  return v10;
}

+ (void)getTopLeadingButtonFrame:(CGRect *)a3 topTrailingButtonFrame:(CGRect *)a4 inBounds:(CGRect)a5 inRTL:(BOOL)a6
{
  _BOOL4 v6;
  CGFloat height;
  double width;
  CGFloat y;
  CGFloat x;
  __int128 v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  BOOL v23;
  CGRect *v24;
  double MaxX;
  __int128 v26;
  __int128 v27;
  double v28;
  __int128 v29;
  __int128 v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v6 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = *MEMORY[0x1E0DC51A8];
  v29 = *MEMORY[0x1E0C9D820];
  v30 = v13;
  v28 = 0.0;
  v26 = v29;
  v27 = v13;
  objc_msgSend(a1, "currentDeviceButtonSize:offset:zoomedSize:zoomedOffset:normalScreenWidth:", &v29, &v30, &v26, &v27, &v28);
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  if (!CGRectIsEmpty(v31) && width < v28)
  {
    v29 = v26;
    v30 = v27;
  }
  if (a3)
  {
    PXRectWithSize();
    a3->origin.x = v14;
    a3->origin.y = v15;
    a3->size.width = v16;
    a3->size.height = v17;
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    a3->origin.y = CGRectGetMinY(v32) + *((double *)&v30 + 1);
  }
  if (a4)
  {
    PXRectWithSize();
    a4->origin.x = v18;
    a4->origin.y = v19;
    a4->size.width = v20;
    a4->size.height = v21;
    if (a3)
    {
      v22 = a3->origin.y;
    }
    else
    {
      v33.origin.x = x;
      v33.origin.y = y;
      v33.size.width = width;
      v33.size.height = height;
      v22 = CGRectGetMinX(v33) + *((double *)&v30 + 1);
    }
    a4->origin.y = v22;
  }
  v23 = !v6;
  if (v6)
    v24 = a4;
  else
    v24 = a3;
  if (!v23)
    a4 = a3;
  if (a4)
  {
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = height;
    MaxX = CGRectGetMaxX(v34);
    a4->origin.x = MaxX - CGRectGetWidth(*a4) - *(double *)&v30;
  }
  if (v24)
  {
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    v24->origin.x = CGRectGetMinX(v35) + *(double *)&v30;
  }
}

+ (void)currentDeviceButtonSize:(CGSize *)a3 offset:(UIOffset *)a4 zoomedSize:(CGSize *)a5 zoomedOffset:(UIOffset *)a6 normalScreenWidth:(double *)a7
{
  CGFloat v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  int v26;

  v13 = 26.0;
  v14 = 16.0;
  v15 = 16.0;
  v16 = 10.0;
  v17 = 10.0;
  v18 = 60.0;
  v19 = 375.0;
  v20 = MGGetProductType();
  if (v20 <= 2159747552)
  {
    if (v20 <= 1169082143)
    {
      if (v20 > 689804741)
      {
        if (v20 <= 910181309)
        {
          if (v20 != 689804742)
          {
            v21 = 851437781;
            goto LABEL_46;
          }
          goto LABEL_36;
        }
        if (v20 != 910181310)
        {
          if (v20 != 1060988941)
            goto LABEL_73;
          v15 = 19.0;
          v14 = 25.0;
          v17 = 18.0;
          v16 = 16.0;
          v22 = 64.0;
          v25 = 0x404E000000000000;
          goto LABEL_72;
        }
LABEL_53:
        v16 = 16.0;
        v14 = 28.0;
        v18 = 60.0;
        v19 = 414.0;
        v17 = 16.0;
        goto LABEL_54;
      }
      if (v20 != 133314240)
      {
        if (v20 != 330877086)
        {
          v24 = 574536383;
          goto LABEL_27;
        }
LABEL_37:
        v23 = 28.0;
        v13 = 27.0;
        v17 = 12.0;
        v18 = 68.0;
        v14 = 50.0;
        v16 = 40.0;
        v19 = 428.0;
        goto LABEL_38;
      }
LABEL_47:
      v13 = 28.0;
      v16 = 25.0;
      v18 = 66.0;
      v14 = 37.0;
      v19 = 390.0;
      goto LABEL_48;
    }
    if (v20 > 1434404432)
    {
      if (v20 <= 2032616840)
      {
        if (v20 != 1434404433)
        {
          if (v20 != 2021146989)
            goto LABEL_73;
          goto LABEL_40;
        }
LABEL_36:
        v16 = 18.0;
        v14 = 30.0;
        v17 = 16.0;
        v18 = 60.0;
        v19 = 390.0;
        v15 = 18.0;
LABEL_54:
        v22 = 60.0;
LABEL_55:
        v23 = 26.0;
        goto LABEL_56;
      }
      if (v20 == 2032616841)
        goto LABEL_53;
      if (v20 != 2078329141)
        goto LABEL_73;
LABEL_52:
      v17 = 6.0;
      v18 = 60.0;
      v14 = 10.0;
      v15 = 6.0;
      goto LABEL_54;
    }
    if (v20 != 1169082144)
    {
      if (v20 != 1234705395)
      {
        v22 = 60.0;
        v23 = 26.0;
        if (v20 != 1371389549)
          goto LABEL_73;
LABEL_56:
        if (!a3)
          goto LABEL_58;
        goto LABEL_57;
      }
      goto LABEL_53;
    }
LABEL_40:
    v15 = 18.0;
    v14 = 20.0;
    v17 = 16.0;
    v16 = 13.0;
    v18 = 60.0;
    v19 = 390.0;
    goto LABEL_54;
  }
  if (v20 > 2941181570)
  {
    if (v20 > 3743999267)
    {
      if (v20 > 3885279869)
      {
        if (v20 == 3885279870)
        {
          v15 = 19.0;
          v14 = 14.0;
          v22 = 58.0;
          v25 = 0x404A000000000000;
LABEL_72:
          v18 = *(double *)&v25;
          goto LABEL_55;
        }
        if (v20 != 4201643249)
          goto LABEL_73;
        v23 = 28.0;
        v17 = 20.0;
        v14 = 30.0;
        v16 = 22.0;
        v18 = 66.0;
        v19 = 428.0;
        v15 = 20.0;
LABEL_38:
        v22 = v18;
        if (!a3)
          goto LABEL_58;
        goto LABEL_57;
      }
      v22 = 60.0;
      v23 = 26.0;
      if (v20 == 3743999268)
        goto LABEL_56;
      v24 = 3825599860;
      goto LABEL_27;
    }
    if (v20 == 2941181571)
      goto LABEL_37;
    if (v20 != 3001488778)
    {
      if (v20 != 3585085679)
        goto LABEL_73;
      goto LABEL_36;
    }
    goto LABEL_40;
  }
  if (v20 <= 2722529671)
  {
    if (v20 != 2159747553)
    {
      if (v20 == 2309863438)
      {
        v16 = 28.0;
        v15 = 23.0;
        v17 = 20.0;
        v18 = 68.0;
        v14 = 42.0;
        v19 = 428.0;
        v13 = 28.0;
LABEL_48:
        v22 = v18;
        v23 = 28.0;
        if (!a3)
          goto LABEL_58;
LABEL_57:
        a3->width = v22;
        a3->height = v23;
        goto LABEL_58;
      }
      v24 = 2688879999;
LABEL_27:
      if (v20 != v24)
        goto LABEL_73;
      goto LABEL_37;
    }
    goto LABEL_52;
  }
  if (v20 > 2795618602)
  {
    if (v20 == 2795618603)
      goto LABEL_47;
    v21 = 2940697645;
  }
  else
  {
    if (v20 == 2722529672)
      goto LABEL_53;
    v21 = 2793418701;
  }
LABEL_46:
  if (v20 == v21)
    goto LABEL_47;
LABEL_73:
  v26 = objc_msgSend(a1, "isPhoneClassDevice");
  if (v26)
    v15 = 19.0;
  else
    v15 = 22.0;
  if (v26)
    v14 = 14.0;
  else
    v14 = 16.0;
  v23 = 28.0;
  if (v26)
    v23 = 26.0;
  v22 = 68.0;
  if (v26)
    v22 = 58.0;
  v16 = 0.0;
  v19 = 1.0;
  v17 = 0.0;
  v18 = 0.0;
  v13 = 0.0;
  if (a3)
    goto LABEL_57;
LABEL_58:
  if (a4)
  {
    a4->horizontal = v14;
    a4->vertical = v15;
  }
  if (a5)
  {
    a5->width = v18;
    a5->height = v13;
  }
  if (a6)
  {
    a6->horizontal = v16;
    a6->vertical = v17;
  }
  if (a7)
    *a7 = v19;
}

void __46__PUPhotoEditLayoutSupport_isPhoneClassDevice__block_invoke()
{
  const void *v0;

  v0 = (const void *)MGCopyAnswer();
  isPhoneClassDevice_isiPhoneClass = CFEqual(v0, CFSTR("iPhone")) != 0;
  if (v0)
    CFRelease(v0);
}

uint64_t __39__PUPhotoEditLayoutSupport_productType__block_invoke()
{
  uint64_t result;

  result = MGGetProductType();
  productType_productType = result;
  return result;
}

uint64_t __114__PUPhotoEditLayoutSupport_transitionFromBarView_orientation_toBarView_orientation_coordinator_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addConstraint:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "removeConstraint:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 64), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __114__PUPhotoEditLayoutSupport_transitionFromBarView_orientation_toBarView_orientation_coordinator_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
