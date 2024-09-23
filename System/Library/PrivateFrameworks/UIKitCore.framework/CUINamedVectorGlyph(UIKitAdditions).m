@implementation CUINamedVectorGlyph(UIKitAdditions)

- (_DWORD)UIImageWithAsset:()UIKitAdditions configuration:flippedHorizontally:
{
  id v8;
  id v9;
  _UIImageCUIVectorGlyphContent *v10;
  _UIImageCUIVectorGlyphContent *v11;
  _DWORD *v12;

  v8 = a3;
  v9 = a4;
  v10 = [_UIImageCUIVectorGlyphContent alloc];
  objc_msgSend(a1, "scale");
  v11 = -[_UIImageCUIVectorGlyphContent initWithCUIVectorGlyph:scale:](v10, "initWithCUIVectorGlyph:scale:", a1);
  v12 = -[UIImage _initWithContent:orientation:]([UIImage alloc], "_initWithContent:orientation:", v11, 0);
  objc_msgSend(v12, "_setRenderingMode:", 0);
  objc_msgSend(v12, "_setConfiguration:", v9);

  if (a5)
  {
    objc_msgSend(v12, "_horizontallyFlipImageOrientation");
    v12[26] |= 0x20u;
  }
  if (v8)
  {
    objc_msgSend(v12, "_setNamed:", 1);
    objc_msgSend(v12, "_setImageAsset:", v8);
  }
  objc_msgSend(v12, "_setSymbolMetricsFromNamedVectorGlyph:", a1);

  return v12;
}

- (id)configuration
{
  void *v1;
  void *v2;
  id v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__CUINamedVectorGlyph_UIKitAdditions__configuration__block_invoke;
  v5[3] = &unk_1E16CB068;
  v5[4] = a1;
  +[UITraitCollection traitCollectionWithTraits:](UITraitCollection, "traitCollectionWithTraits:", v5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v1 = (void *)objc_msgSend(v1, "imageConfiguration");
  v3 = v1;

  return v3;
}

@end
