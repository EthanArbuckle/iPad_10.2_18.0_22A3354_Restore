@implementation UIImage(PhotosUI)

- (id)pu_tintedImageWithColor:()PhotosUI
{
  CGFloat v4;
  CGFloat v5;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  CGSize v15;
  CGRect v16;

  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = a3;
  objc_msgSend(a1, "size");
  v8 = v7;
  v10 = v9;
  objc_msgSend(a1, "scale");
  v12 = v11;
  v15.width = v8;
  v15.height = v10;
  UIGraphicsBeginImageContextWithOptions(v15, 0, v12);
  objc_msgSend(a1, "drawAtPoint:blendMode:alpha:", 17, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 1.0);
  objc_msgSend(v6, "setFill");

  v16.origin.x = v4;
  v16.origin.y = v5;
  v16.size.width = v8;
  v16.size.height = v10;
  UIRectFillUsingBlendMode(v16, kCGBlendModeSourceIn);
  UIGraphicsGetImageFromCurrentImageContext();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v13;
}

- (id)pu_overlayedImageWithColor:()PhotosUI
{
  CGFloat v4;
  CGFloat v5;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  CGSize v15;
  CGRect v16;

  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = a3;
  objc_msgSend(a1, "size");
  v8 = v7;
  v10 = v9;
  objc_msgSend(a1, "scale");
  v12 = v11;
  v15.width = v8;
  v15.height = v10;
  UIGraphicsBeginImageContextWithOptions(v15, 0, v12);
  objc_msgSend(a1, "drawAtPoint:blendMode:alpha:", 17, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 1.0);
  objc_msgSend(v6, "setFill");

  v16.origin.x = v4;
  v16.origin.y = v5;
  v16.size.width = v8;
  v16.size.height = v10;
  UIRectFillUsingBlendMode(v16, kCGBlendModeNormal);
  UIGraphicsGetImageFromCurrentImageContext();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v13;
}

- (PUImageExtraction)pu_extractPlayOverlayBackgroundImageFromCenter:()PhotosUI inRect:contentMode:asynchronously:handler:
{
  id v21;
  PUImageExtraction *v22;
  void *v23;
  void *v24;
  PUImageExtraction *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  PUImageExtraction *v33;
  void *v35;
  _QWORD aBlock[4];
  PUImageExtraction *v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  char v49;

  v21 = a5;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIImage+PhotosUI.m"), 137, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  v22 = objc_alloc_init(PUImageExtraction);
  if (pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler__onceToken != -1)
    dispatch_once(&pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler__onceToken, &__block_literal_global_105662);
  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("PXPlayVideoOverlayBackgroundMask"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("PXPlayVideoOverlayGlyphMask"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __110__UIImage_PhotosUI__pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler___block_invoke_2;
  aBlock[3] = &unk_1E58AB900;
  v25 = v22;
  v37 = v25;
  v26 = v23;
  v42 = a6;
  v43 = a7;
  v38 = v26;
  v39 = a1;
  v44 = a8;
  v45 = a9;
  v46 = a10;
  v47 = a11;
  v48 = a3;
  v27 = v24;
  v40 = v27;
  v49 = a4;
  v28 = v21;
  v41 = v28;
  v29 = _Block_copy(aBlock);
  v30 = v29;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("PXPlayVideoOverlayApproximation"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v28 + 2))(v28, v31);
    dispatch_get_global_queue(2, 0);
    v32 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v32, v30);

  }
  else
  {
    (*((void (**)(void *))v29 + 2))(v29);
  }
  v33 = v25;

  return v33;
}

+ (id)pu_imageWithIconImage:()PhotosUI iconImageColor:text:font:textColor:fillColor:strokeColor:cornerRadius:inset:
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  __CFString *v24;
  __CFString *v25;
  id v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  _BOOL4 v38;
  _BOOL4 v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  id v46;
  __CFString *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  double v54;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  __CFString *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;

  v19 = a6;
  v20 = a7;
  v21 = a9;
  v22 = a11;
  v23 = a12;
  v24 = &stru_1E58AD278;
  if (a8)
    v24 = a8;
  v25 = v24;
  v26 = a10;
  if (!v21)
  {
    v27 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontSize");
    objc_msgSend(v27, "systemFontOfSize:");
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v26, *MEMORY[0x1E0DC1140], v21, *MEMORY[0x1E0DC1138], 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString sizeWithAttributes:](v25, "sizeWithAttributes:", v28);
  v30 = v29;
  v32 = v31;
  objc_msgSend(v19, "size");
  v34 = v33;
  v36 = v35;
  v37 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v38 = v33 == *MEMORY[0x1E0C9D820];
  if (v36 != v37)
    v38 = 0;
  v39 = v30 == *MEMORY[0x1E0C9D820];
  if (v32 != v37)
    v39 = 0;
  if (v38 || v39)
    v40 = 0.0;
  else
    v40 = 3.0;
  if (v33 >= v32)
    v41 = v33;
  else
    v41 = v32;
  v42 = v30 + v33 + v40 + a2 * 2.0;
  v54 = a2;
  v43 = a3;
  v44 = v41 + a3 * 2.0;
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v42, v44);
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __119__UIImage_PhotosUI__pu_imageWithIconImage_iconImageColor_text_font_textColor_fillColor_strokeColor_cornerRadius_inset___block_invoke;
  v56[3] = &unk_1E58AB890;
  v63 = 0;
  v64 = 0;
  v65 = v42;
  v66 = v44;
  v57 = v22;
  v58 = v23;
  v67 = a1;
  v68 = v54;
  v59 = v20;
  v60 = v19;
  v69 = v43;
  v70 = v34;
  v71 = v36;
  v72 = v40;
  v73 = v30;
  v74 = v32;
  v61 = v25;
  v62 = v28;
  v46 = v28;
  v47 = v25;
  v48 = v19;
  v49 = v20;
  v50 = v23;
  v51 = v22;
  objc_msgSend(v45, "imageWithActions:", v56);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  return v52;
}

+ (uint64_t)pu_imageWithIconImage:()PhotosUI iconImageColor:text:font:textColor:fillColor:strokeColor:cornerRadius:
{
  return objc_msgSend(a1, "pu_imageWithIconImage:iconImageColor:text:font:textColor:fillColor:strokeColor:cornerRadius:inset:", a3, a3 + 2.0, a3);
}

+ (uint64_t)pu_imageWithText:()PhotosUI font:textColor:fillColor:strokeColor:cornerRadius:
{
  return objc_msgSend(a1, "pu_imageWithIconImage:iconImageColor:text:font:textColor:fillColor:strokeColor:cornerRadius:", 0, 0, a3, a4, a5, a6, a7);
}

+ (id)pu_imageFromView:()PhotosUI isOpaque:
{
  id v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  void *v9;
  CGSize v11;

  v5 = a3;
  objc_msgSend(v5, "bounds");
  v11.width = v6;
  v11.height = v7;
  UIGraphicsBeginImageContextWithOptions(v11, a4, 0.0);
  objc_msgSend(v5, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "renderInContext:", UIGraphicsGetCurrentContext());
  UIGraphicsGetImageFromCurrentImageContext();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v9;
}

+ (id)pu_centeredImage:()PhotosUI withBackgroundColor:size:
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  double v19;
  double v20;

  v9 = a5;
  v10 = a6;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", a1, a2);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__UIImage_PhotosUI__pu_centeredImage_withBackgroundColor_size___block_invoke;
  v16[3] = &unk_1E58AB8B8;
  v19 = a1;
  v20 = a2;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v10;
  objc_msgSend(v11, "imageWithActions:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)pu_PhotosUIImageNamed:()PhotosUI
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "pu_PhotosUIFrameworkBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
