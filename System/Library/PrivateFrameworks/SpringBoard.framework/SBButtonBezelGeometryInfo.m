@implementation SBButtonBezelGeometryInfo

+ (id)buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__SBButtonBezelGeometryInfo_buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel_onceToken != -1)
    dispatch_once(&buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel_onceToken, block);
  return (id)buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel___result;
}

void __82__SBButtonBezelGeometryInfo_buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel___result;
  buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel___result = (uint64_t)v1;

}

- (CGRect)normalizedButtonHWRectForButton:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v9;
  void *v10;
  const __CFString *v11;
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
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGRect v31;
  CGRect result;
  CGRect v33;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  switch(a3)
  {
    case 0:
    case 2:
      v11 = CFSTR("UserIntentPhysicalButtonNormalizedCGRect");
      v12 = 1.0;
      goto LABEL_9;
    case 1:
    case 5:
    case 6:
    case 7:
    case 11:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSBSHardwareButtonKind();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBButtonBezelGeometryInfo.m"), 91, CFSTR("We're currently not supporting getting the button position for the %@ button"), v10);

      break;
    case 3:
      v11 = CFSTR("VolumeUpButtonNormalizedCGRect");
      goto LABEL_8;
    case 4:
      v11 = CFSTR("VolumeDownButtonNormalizedCGRect");
      goto LABEL_8;
    case 8:
      v11 = CFSTR("RingerButtonNormalizedCGRect");
LABEL_8:
      v12 = 0.0;
LABEL_9:
      v13 = SBMGGetCGRectAnswer((uint64_t)v11, v12);
      goto LABEL_10;
    case 9:
      v3 = 1.0;
      SBMGGetCGRectAnswer((uint64_t)CFSTR("CameraButtonNormalizedCGRect"), 1.0);
      goto LABEL_11;
    case 10:
      v21 = SBMGGetCGRectAnswer((uint64_t)CFSTR("VolumeUpButtonNormalizedCGRect"), 0.0);
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v33.origin.x = SBMGGetCGRectAnswer((uint64_t)CFSTR("VolumeDownButtonNormalizedCGRect"), 0.0);
      v33.origin.y = v28;
      v33.size.width = v29;
      v33.size.height = v30;
      v31.origin.x = v21;
      v31.origin.y = v23;
      v31.size.width = v25;
      v31.size.height = v27;
      *(CGRect *)&v13 = CGRectUnion(v31, v33);
LABEL_10:
      v3 = v13;
LABEL_11:
      v4 = v14;
      v5 = v15;
      v6 = v16;
      break;
    default:
      break;
  }
  v17 = v3;
  v18 = v4;
  v19 = v5;
  v20 = v6;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)buttonHWRectForButton:(int64_t)a3 onEmbeddedDisplayBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double MinX;
  double v16;
  double MinY;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[SBButtonBezelGeometryInfo normalizedButtonHWRectForButton:](self, "normalizedButtonHWRectForButton:", a3);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v24 = v14;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MinX = CGRectGetMinX(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v16 = v9 * CGRectGetMaxX(v26) + (1.0 - v9) * MinX;
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MinY = CGRectGetMinY(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v18 = v11 * CGRectGetMaxY(v28) + (1.0 - v11) * MinY;
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  v19 = v13 * CGRectGetWidth(v29) + (1.0 - v13) * 0.0;
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  v20 = v24 * CGRectGetHeight(v30) + (1.0 - v24) * 0.0;
  v21 = v16;
  v22 = v18;
  v23 = v19;
  result.size.height = v20;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)buttonHWRectForButton:(int64_t)a3 inView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double MinX;
  double v29;
  double MinY;
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
  double v44;
  double v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect result;

  v6 = a4;
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "screen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "_isEmbeddedScreen"))
  {

  }
  else
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

    if (v11)
      NSLog(CFSTR("-[SBButtonBezelGeometryInfo buttonHWRectForButton:inView:] only works on views in the embedded display's window"));
  }
  objc_msgSend(v8, "screen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_referenceBounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  -[SBButtonBezelGeometryInfo normalizedButtonHWRectForButton:](self, "normalizedButtonHWRectForButton:", a3);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v45 = v27;
  v46.origin.x = v14;
  v46.origin.y = v16;
  v46.size.width = v18;
  v46.size.height = v20;
  MinX = CGRectGetMinX(v46);
  v47.origin.x = v14;
  v47.origin.y = v16;
  v47.size.width = v18;
  v47.size.height = v20;
  v29 = v22 * CGRectGetMaxX(v47) + (1.0 - v22) * MinX;
  v48.origin.x = v14;
  v48.origin.y = v16;
  v48.size.width = v18;
  v48.size.height = v20;
  MinY = CGRectGetMinY(v48);
  v49.origin.x = v14;
  v49.origin.y = v16;
  v49.size.width = v18;
  v49.size.height = v20;
  v31 = v24 * CGRectGetMaxY(v49) + (1.0 - v24) * MinY;
  v50.origin.x = v14;
  v50.origin.y = v16;
  v50.size.width = v18;
  v50.size.height = v20;
  v32 = v26 * CGRectGetWidth(v50) + (1.0 - v26) * 0.0;
  v51.origin.x = v14;
  v51.origin.y = v16;
  v51.size.width = v18;
  v51.size.height = v20;
  objc_msgSend(v6, "convertRect:fromView:", v7, v29, v31, v32, v45 * CGRectGetHeight(v51) + (1.0 - v45) * 0.0);
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;

  v41 = v34;
  v42 = v36;
  v43 = v38;
  v44 = v40;
  result.size.height = v44;
  result.size.width = v43;
  result.origin.y = v42;
  result.origin.x = v41;
  return result;
}

- (unint64_t)buttonScreenEdgeForButton:(int64_t)a3
{
  void *v6;

  -[SBButtonBezelGeometryInfo normalizedButtonHWRectForButton:](self, "normalizedButtonHWRectForButton:", a3);
  if (BSFloatIsZero() && (BSFloatIsZero() & 1) != 0)
    return 2;
  if (BSFloatIsOne() && (BSFloatIsZero() & 1) != 0)
    return 8;
  if (BSFloatIsZero() && !BSFloatIsZero())
    return 1;
  if (BSFloatIsOne() && !BSFloatIsZero())
    return 4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBButtonBezelGeometryInfo.m"), 123, CFSTR("Button rect is not on edge of screen"));

  return 0;
}

@end
