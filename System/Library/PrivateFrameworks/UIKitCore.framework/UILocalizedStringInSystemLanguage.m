@implementation UILocalizedStringInSystemLanguage

void ___UILocalizedStringInSystemLanguage_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  _UIKitBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _UIPreferredSystemLanguageForBundle(v0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    _UIKitBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "preferredLocalizations");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", v11);

    if ((v4 & 1) == 0)
    {
      _UIKitBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pathForResource:ofType:", v11, CFSTR("lproj"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v6, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v6);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)qword_1EDDC8388;
        qword_1EDDC8388 = v7;

      }
    }
  }
  if (!qword_1EDDC8388)
  {
    _UIKitBundle();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)qword_1EDDC8388;
    qword_1EDDC8388 = v9;

  }
}

@end
