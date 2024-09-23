@implementation NSError

void __46__NSError_WebKitExtras___registerWebKitErrors__block_invoke()
{
  uint64_t v0;
  CFTypeRef v1;
  CFTypeRef v2;
  CFTypeRef v3;
  CFTypeRef v4;
  CFTypeRef v5;
  CFTypeRef v6;
  CFTypeRef v7;
  CFTypeRef v8;
  CFTypeRef v9;
  CFTypeRef v10;
  void *v11;
  void *v12;

  v0 = MEMORY[0x1D82A8E64]();
  v11 = (void *)MEMORY[0x1E0C99D80];
  v12 = (void *)v0;
  v1 = WebLocalizedStringInternal("Content with specified MIME type can’t be shown");
  v2 = WebLocalizedStringInternal("The URL can’t be shown");
  v3 = WebLocalizedStringInternal("Frame load interrupted");
  v4 = WebLocalizedStringInternal("Not allowed to use restricted network port");
  v5 = WebLocalizedStringInternal("The URL was blocked by a content filter");
  v6 = WebLocalizedStringInternal("The plug-in can’t be found");
  v7 = WebLocalizedStringInternal("The plug-in can’t be loaded");
  v8 = WebLocalizedStringInternal("Java is unavailable");
  v9 = WebLocalizedStringInternal("Plug-in cancelled");
  v10 = WebLocalizedStringInternal("Plug-in handled load");
  objc_msgSend(MEMORY[0x1E0CB35C8], "_webkit_addErrorsWithCodesAndDescriptions:inDomain:", objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v1, &unk_1E9D95920, v2, &unk_1E9D95938, v3, &unk_1E9D95950, v4, &unk_1E9D95968, v5, &unk_1E9D95980, v6, &unk_1E9D95998, v7, &unk_1E9D959B0,
      v8,
      &unk_1E9D959C8,
      v9,
      &unk_1E9D959E0,
      v10,
      &unk_1E9D959F8,
      WebLocalizedStringInternal("The current location cannot be found."),
      &unk_1E9D95A10,
      0),
    WebKitErrorDomain);
  objc_autoreleasePoolPop(v12);
}

@end
