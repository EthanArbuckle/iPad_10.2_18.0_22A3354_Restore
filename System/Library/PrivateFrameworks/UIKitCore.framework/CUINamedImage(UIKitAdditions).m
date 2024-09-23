@implementation CUINamedImage(UIKitAdditions)

- (id)configuration
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  void *v13;

  objc_msgSend(a1, "baseKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __46__CUINamedImage_UIKitAdditions__configuration__block_invoke;
  v11 = &unk_1E16CB090;
  v12 = v2;
  v13 = a1;
  v3 = v2;
  +[UITraitCollection traitCollectionWithTraits:](UITraitCollection, "traitCollectionWithTraits:", &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v4 = (void *)objc_msgSend(v4, "imageConfiguration", v8, v9, v10, v11, v12, v13);
  v6 = v4;

  return v6;
}

- (_DWORD)UIImageWithAsset:()UIKitAdditions configuration:flippedHorizontally:optionalVectorImage:
{
  id v10;
  id v11;
  id v12;
  int v13;
  uint64_t v14;
  double v15;
  _UIImageCUIVectorImageContent *v16;
  uint64_t v17;
  _UIImageCGImageContent *v18;
  _UIImageCGImageContent *v19;
  _DWORD *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;

  v10 = a3;
  v11 = a6;
  v12 = a4;
  v13 = objc_msgSend(a1, "exifOrientation");
  if ((unint64_t)(v13 - 1) >= 8)
    v14 = 0;
  else
    v14 = (0x27365140u >> (4 * v13 - 4)) & 7;
  objc_msgSend(a1, "scale");
  if (v11)
  {
    v16 = [_UIImageCUIVectorImageContent alloc];
    v17 = objc_msgSend(a1, "image");
    objc_msgSend(a1, "scale");
    v18 = -[_UIImageCUIVectorImageContent initWithCGImage:CUIVectorImage:scale:](v16, "initWithCGImage:CUIVectorImage:scale:", v17, v11);
  }
  else
  {
    v18 = -[_UIImageCGImageContent initWithCGImage:scale:]([_UIImageCGImageContent alloc], "initWithCGImage:scale:", objc_msgSend(a1, "image"), v15);
  }
  v19 = v18;
  v20 = -[UIImage _initWithContent:orientation:]([UIImage alloc], "_initWithContent:orientation:", v18, v14);
  objc_msgSend(v20, "_setConfiguration:", v12);

  if (a5)
  {
    objc_msgSend(v20, "_horizontallyFlipImageOrientation");
    v20[26] |= 0x20u;
  }
  if (objc_msgSend(a1, "hasSliceInformation"))
  {
    objc_msgSend(a1, "edgeInsets");
    objc_msgSend(v20, "resizableImageWithCapInsets:resizingMode:", objc_msgSend(a1, "resizingMode") != 0, v21, v22, v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();

    v20 = (_DWORD *)v25;
  }
  if (v10)
  {
    objc_msgSend(v20, "_setNamed:", 1);
    objc_msgSend(v20, "_setImageAsset:", v10);
  }
  objc_msgSend(a1, "alignmentEdgeInsets");
  if (v29 != 0.0 || v26 != 0.0 || v28 != 0.0 || v27 != 0.0)
    objc_msgSend(v20, "_setAlignmentRectInsets:");
  v30 = objc_msgSend(a1, "templateRenderingMode");
  if (v30 == 1)
  {
    v31 = 2;
    goto LABEL_23;
  }
  if (!v30 && dyld_program_sdk_at_least())
  {
    v31 = 1;
LABEL_23:
    objc_msgSend(v20, "_setRenderingMode:", v31);
  }

  return v20;
}

@end
