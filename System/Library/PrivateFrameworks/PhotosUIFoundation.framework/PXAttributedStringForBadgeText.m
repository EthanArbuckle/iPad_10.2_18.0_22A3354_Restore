@implementation PXAttributedStringForBadgeText

void __PXAttributedStringForBadgeText_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[2];
  uint64_t v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBB498], "defaultParagraphStyle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "mutableCopy");
  v2 = (void *)PXAttributedStringForBadgeText_paragraphStyle;
  PXAttributedStringForBadgeText_paragraphStyle = v1;

  objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 12.0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)PXAttributedStringForBadgeText_fontAttributeName;
  PXAttributedStringForBadgeText_fontAttributeName = v3;

  objc_storeStrong((id *)&PXAttributedStringForBadgeText_miniFontAttributeName, (id)PXAttributedStringForBadgeText_fontAttributeName);
  v5 = *MEMORY[0x24BEBB360];
  v18[0] = PXAttributedStringForBadgeText_fontAttributeName;
  v6 = *MEMORY[0x24BEBB368];
  v16[0] = v5;
  v16[1] = v6;
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x24BEBB3A8];
  v8 = v17;
  v18[1] = v7;
  v18[2] = PXAttributedStringForBadgeText_paragraphStyle;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v16, 3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)PXAttributedStringForBadgeText_defaultAttributes;
  PXAttributedStringForBadgeText_defaultAttributes = v9;

  v15[0] = PXAttributedStringForBadgeText_miniFontAttributeName;
  v14[0] = v5;
  v14[1] = v6;
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  v15[1] = v11;
  v15[2] = PXAttributedStringForBadgeText_paragraphStyle;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)PXAttributedStringForBadgeText_miniAttributes;
  PXAttributedStringForBadgeText_miniAttributes = v12;

}

@end
