@implementation UILabel(PXAnimatedCounter)

- (double)boundingRectForCharacterRange:()PXAnimatedCounter
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v18;
  uint64_t v19;

  v7 = objc_alloc(MEMORY[0x1E0DC1320]);
  objc_msgSend(a1, "attributedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithAttributedString:", v8);

  v10 = objc_alloc_init(MEMORY[0x1E0DC1280]);
  objc_msgSend(v9, "addLayoutManager:", v10);
  v11 = objc_alloc(MEMORY[0x1E0DC12C0]);
  objc_msgSend(a1, "bounds");
  v14 = (void *)objc_msgSend(v11, "initWithSize:", v12, v13);
  objc_msgSend(v14, "setLineFragmentPadding:", 0.0);
  objc_msgSend(v10, "addTextContainer:", v14);
  v18 = 0;
  v19 = 0;
  objc_msgSend(v10, "characterRangeForGlyphRange:actualGlyphRange:", a3, a4, &v18);
  objc_msgSend(v10, "boundingRectForGlyphRange:inTextContainer:", v18, v19, v14);
  v16 = v15;

  return v16;
}

@end
