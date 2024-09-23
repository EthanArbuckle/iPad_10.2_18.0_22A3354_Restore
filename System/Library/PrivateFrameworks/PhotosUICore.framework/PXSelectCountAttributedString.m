@implementation PXSelectCountAttributedString

void ___PXSelectCountAttributedString_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "mutableCopy");
  v2 = (void *)_PXSelectCountAttributedString_paragraphStyle;
  _PXSelectCountAttributedString_paragraphStyle = v1;

  v7[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 13.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = *MEMORY[0x1E0DC1178];
  v8[1] = v4;
  v8[2] = _PXSelectCountAttributedString_paragraphStyle;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_PXSelectCountAttributedString_attributes;
  _PXSelectCountAttributedString_attributes = v5;

}

@end
