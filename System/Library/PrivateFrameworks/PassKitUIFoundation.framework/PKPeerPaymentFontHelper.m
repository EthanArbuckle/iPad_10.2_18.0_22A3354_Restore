@implementation PKPeerPaymentFontHelper

+ (id)chiseledCashFontDescriptor
{
  if (chiseledCashFontDescriptor_onceToken != -1)
    dispatch_once(&chiseledCashFontDescriptor_onceToken, &__block_literal_global);
  return (id)chiseledCashFontDescriptor_descriptorWithPalette;
}

void __53__PKPeerPaymentFontHelper_chiseledCashFontDescriptor__block_invoke()
{
  void *v0;
  const __CFURL *v1;
  const __CFArray *FontDescriptorsFromURL;
  const __CFArray *v3;
  const __CTFontDescriptor *ValueAtIndex;
  const __CFDictionary *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  PKPassKitUIFoundationBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("SFCash-Chiseled"), CFSTR("otf"));
  v1 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    FontDescriptorsFromURL = CTFontManagerCreateFontDescriptorsFromURL(v1);
    if (FontDescriptorsFromURL)
    {
      v3 = FontDescriptorsFromURL;
      if (CFArrayGetCount(FontDescriptorsFromURL) >= 1)
      {
        ValueAtIndex = (const __CTFontDescriptor *)CFArrayGetValueAtIndex(v3, 0);
        v8 = *MEMORY[0x24BDC4D90];
        v9[0] = &unk_24D0A9C20;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
        v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CTFontDescriptorCreateCopyWithAttributes(ValueAtIndex, v5);
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = (void *)chiseledCashFontDescriptor_descriptorWithPalette;
        chiseledCashFontDescriptor_descriptorWithPalette = v6;

      }
      CFRelease(v3);
    }
  }

}

@end
