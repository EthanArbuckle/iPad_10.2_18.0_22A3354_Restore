@implementation VUIGraphicsImageRenderer

+ (id)imageWithSize:(CGSize)a3 format:(id)a4 cgContextActions:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__VUIGraphicsImageRenderer_imageWithSize_format_cgContextActions___block_invoke;
  v13[3] = &unk_1E9F2C318;
  v14 = v9;
  v10 = v9;
  objc_msgSend(a1, "_imageWithSize:format:actions:", a4, v13, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)formatWithUIImage:(id)a3 preferredFormat:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  if (formatWithUIImage_preferredFormat__onceToken != -1)
    dispatch_once(&formatWithUIImage_preferredFormat__onceToken, &__block_literal_global_16);
  objc_msgSend(MEMORY[0x1E0CEA950], "vui_main");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "vui_scale");
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "_supportsDeepColor");

  if (!v11)
  {
    v12 = 0;
    if (v6)
      goto LABEL_8;
    goto LABEL_10;
  }
  objc_msgSend(v5, "imageRendererFormat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setScale:", v9);
  if (!v12
    || formatWithUIImage_preferredFormat__sOverrideDefault && formatWithUIImage_preferredFormat__sPrefersExtendedRange)
  {
    if (v6)
    {
LABEL_8:
      v13 = v6;
LABEL_11:
      v14 = v13;

      v12 = v14;
      goto LABEL_12;
    }
LABEL_10:
    +[VUIGraphicsImageRenderer preferredFormat](VUIGraphicsImageRenderer, "preferredFormat");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_12:

  return v12;
}

+ (id)formatWithCGImage:(CGImage *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CEA638], "vuiImageWithCGImage:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formatWithUIImage:preferredFormat:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_imageWithSize:(CGSize)a3 format:(id)a4 actions:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  double v15;
  double v16;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__VUIGraphicsImageRenderer__imageWithSize_format_actions___block_invoke;
  v13[3] = &unk_1E9F2C340;
  v15 = width;
  v16 = height;
  v14 = v9;
  v10 = v9;
  objc_msgSend(a1, "imageWithSize:format:actions:", a4, v13, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)imageWithSize:(CGSize)a3 format:(id)a4 actions:(id)a5
{
  double height;
  double width;
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  height = a3.height;
  width = a3.width;
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E0CEA610];
  v10 = a4;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithSize:format:", v10, width, height);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__VUIGraphicsImageRenderer_imageWithSize_format_actions___block_invoke;
  v15[3] = &unk_1E9F2C318;
  v16 = v8;
  v12 = v8;
  objc_msgSend(v11, "imageWithActions:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __57__VUIGraphicsImageRenderer_imageWithSize_format_actions___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  CGContextSetInterpolationQuality((CGContextRef)objc_msgSend(v3, "CGContext"), kCGInterpolationHigh);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __58__VUIGraphicsImageRenderer__imageWithSize_format_actions___block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  id v4;

  v4 = a2;
  v3 = (CGContext *)objc_msgSend(v4, "CGContext");
  CGContextTranslateCTM(v3, 0.0, *(CGFloat *)(a1 + 48));
  CGContextScaleCTM(v3, 1.0, -1.0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __66__VUIGraphicsImageRenderer_imageWithSize_format_cgContextActions___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "CGContext");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__VUIGraphicsImageRenderer_formatWithUIImage_preferredFormat___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  formatWithUIImage_preferredFormat__sPrefersExtendedRange = CFPreferencesGetAppBooleanValue(CFSTR("PrefersExtendedRange"), (CFStringRef)objc_msgSend(v0, "bundleIdentifier"), (Boolean *)&formatWithUIImage_preferredFormat__sOverrideDefault);

}

+ (id)preferredFormat
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA950], "vui_main");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vuiTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA618], "formatForTraitCollection:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)formatWithCGImage:(CGImage *)a3 preferredFormat:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CEA638], "vuiImageWithCGImage:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "formatWithUIImage:preferredFormat:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)formatWithUIImage:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "formatWithUIImage:preferredFormat:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)decodedImage:(id)a3 opaque:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a4;
  v5 = a3;
  if (v5)
  {
    +[VUIGraphicsImageRenderer formatWithUIImage:](VUIGraphicsImageRenderer, "formatWithUIImage:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setScale:", 1.0);
    objc_msgSend(v6, "setOpaque:", v4);
    objc_msgSend(v5, "size");
    v8 = v7;
    v10 = v9;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __48__VUIGraphicsImageRenderer_decodedImage_opaque___block_invoke;
    v13[3] = &unk_1E9F2C388;
    v14 = v5;
    +[VUIGraphicsImageRenderer imageWithSize:format:actions:](VUIGraphicsImageRenderer, "imageWithSize:format:actions:", v6, v13, v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __48__VUIGraphicsImageRenderer_decodedImage_opaque___block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;

  v1 = *(void **)(a1 + 32);
  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v1, "size");
  return objc_msgSend(v1, "drawInRect:", v2, v3, v4, v5);
}

+ (void)SVGImagesWithDataDescriptors:(id)a3 format:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    dispatch_get_global_queue(2, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke;
    v12[3] = &unk_1E9F2C4D0;
    v13 = v8;
    v15 = v10;
    v16 = a1;
    v14 = v9;
    dispatch_async(v11, v12);

  }
}

void __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  double v4;
  double v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  BOOL v31;
  void *v32;
  CGContext *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  _QWORD *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[2];
  uint64_t (*v47)(_QWORD *);
  void *v48;
  void *v49;
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  void *v54;
  id v55;
  id v56;
  uint64_t *v57;
  double v58;
  double v59;
  _QWORD v60[4];
  id v61;
  id v62;
  uint64_t *v63;
  uint64_t v64;
  _QWORD v65[2];
  uint64_t (*v66)(uint64_t);
  void *v67;
  void *v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__0;
  v78 = __Block_byref_object_dispose__0;
  v79 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
  if (v3)
  {
    v44 = *(_QWORD *)v71;
    v4 = *MEMORY[0x1E0C9D820];
    v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v43 = v2;
    do
    {
      v45 = v3;
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v71 != v44)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
        objc_msgSend(v7, "data");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = CGSVGDocumentCreateFromData();
        if (v9)
        {
          CGSVGDocumentGetCanvasSize();
          v11 = v10;
          v13 = v12;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v75[5], "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            objc_msgSend(v15, "CGContext");
            CGContextClear();
            objc_msgSend(v16, "CGContext");
            CGContextDrawSVGDocument();
            objc_msgSend(v16, "currentImage");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v20 = *(void **)(a1 + 56);
            v21 = *(_QWORD *)(a1 + 40);
            v60[0] = MEMORY[0x1E0C809B0];
            v60[1] = 3221225472;
            v60[2] = __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke_2_16;
            v60[3] = &unk_1E9F2C458;
            v63 = &v74;
            v61 = v14;
            v62 = &__block_literal_global_10;
            v64 = v9;
            objc_msgSend(v20, "_imageWithSize:format:actions:", v21, v60, v11, v13);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

          }
          CGSVGDocumentRelease();
          objc_msgSend(v7, "renderSize");
          v23 = v22;
          v25 = v24;
          objc_msgSend(v7, "backgroundSize");
          if (v27 != v4 || v26 != v5)
          {
            objc_msgSend(v7, "backgroundSize");
            v23 = v28;
            v25 = v29;
          }
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v23, v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v25 == v5 && v23 == v4;
          if (v31 || !v17)
          {
            v32 = v16;
            v34 = v17;
          }
          else
          {
            objc_msgSend((id)v75[5], "objectForKey:", v30);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (v32)
            {
              objc_msgSend(v32, "CGContext");
              CGContextClear();
              v33 = (CGContext *)objc_msgSend(v32, "CGContext");
              __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke_3(v23, v25, (uint64_t)v33, v33, v7, v17);
              objc_msgSend(v32, "currentImage");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v35 = *(void **)(a1 + 56);
              v36 = *(_QWORD *)(a1 + 40);
              v52[0] = MEMORY[0x1E0C809B0];
              v52[1] = 3221225472;
              v52[2] = __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke_3_17;
              v52[3] = &unk_1E9F2C480;
              v57 = &v74;
              v37 = v30;
              v56 = &__block_literal_global_12;
              v53 = v37;
              v54 = v7;
              v38 = v17;
              v55 = v38;
              v58 = v23;
              v59 = v25;
              v39 = v36;
              v2 = v43;
              objc_msgSend(v35, "_imageWithSize:format:actions:", v39, v52, v23, v25);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              v32 = 0;
              v17 = v53;
            }

          }
          v46[0] = MEMORY[0x1E0C809B0];
          v46[1] = 3221225472;
          v47 = __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke_4;
          v48 = &unk_1E9F2C4A8;
          v51 = *(id *)(a1 + 48);
          v49 = v7;
          v40 = v34;
          v50 = v40;
          v41 = v46;
          if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
            v47(v41);
          else
            dispatch_async(MEMORY[0x1E0C80D38], v41);

        }
        else
        {
          v65[0] = MEMORY[0x1E0C809B0];
          v65[1] = 3221225472;
          v66 = __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke_14;
          v67 = &unk_1E9F2C430;
          v18 = *(id *)(a1 + 48);
          v68 = v7;
          v69 = v18;
          v19 = v65;
          if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
            v66((uint64_t)v19);
          else
            dispatch_async(MEMORY[0x1E0C80D38], v19);

          v14 = v69;
        }

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
    }
    while (v3);
  }

  v42 = (void *)v75[5];
  v75[5] = 0;

  _Block_object_dispose(&v74, 8);
}

uint64_t __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke_2()
{
  return CGContextDrawSVGDocument();
}

void __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke_3(CGFloat a1, CGFloat a2, uint64_t a3, CGContext *a4, void *a5, void *a6)
{
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGImage *v26;
  id v27;
  CGRect v28;
  CGRect v29;

  v10 = a6;
  v11 = a5;
  objc_msgSend(v10, "size");
  v13 = v12;
  objc_msgSend(v10, "size");
  v15 = v14;
  objc_msgSend(v11, "backgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scaleWithinRenderSize");
  v18 = v17;

  v19 = v15 * (a1 / v13);
  v20 = v13 * (a1 / v13);
  if (v19 > a2)
  {
    v21 = a2 / v19;
    v19 = v19 * (a2 / v19);
    v20 = v20 * v21;
  }
  if (v16)
  {
    CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(objc_retainAutorelease(v16), "CGColor"));
    v28.origin.x = 0.0;
    v28.origin.y = 0.0;
    v28.size.width = a1;
    v28.size.height = a2;
    CGContextFillRect(a4, v28);
  }
  v22 = 1.0;
  if (v18 != 0.0)
    v22 = v18;
  v23 = v22 * v20;
  v24 = v22 * v19;
  v25 = (a2 - v22 * v19) * 0.5;
  v27 = objc_retainAutorelease(v10);
  v26 = (CGImage *)objc_msgSend(v27, "CGImage");
  v29.origin.x = (a1 - v23) * 0.5;
  v29.origin.y = v25;
  v29.size.width = v23;
  v29.size.height = v24;
  CGContextDrawImage(a4, v29, v26);

}

uint64_t __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke_14(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32), 0);
  return result;
}

uint64_t __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke_2_16(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  v4 = a1[4];
  v5 = a2;
  objc_msgSend(v3, "setObject:forKey:", v5, v4);
  v6 = a1[5];
  v7 = objc_msgSend(v5, "CGContext");

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, v7, a1[7]);
}

uint64_t __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke_3_17(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "setObject:forKey:", v5, v4);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = objc_msgSend(v5, "CGContext");

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD, double, double))(v6 + 16))(v6, v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

uint64_t __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke_4(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

@end
