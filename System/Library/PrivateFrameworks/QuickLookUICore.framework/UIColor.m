@implementation UIColor

void __50__UIColor__QLUtilities___ql_markupBackgroundColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v0;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.909803922, 0.909803922, 0.909803922, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA478], "_dynamicColorWithColorsByTraitCollection:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_ql_markupBackgroundColor_markupBackgroundColor;
  _ql_markupBackgroundColor_markupBackgroundColor = v5;

}

@end
