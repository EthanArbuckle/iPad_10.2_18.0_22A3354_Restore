@implementation SBHIconGridSizeClassDomain

void __68__SBHIconGridSizeClassDomain_PRWidgetGridUtilities__pr_widgetDomain__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  _QWORD v12[4];
  _QWORD v13[4];
  _QWORD v14[4];
  _QWORD v15[2];
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0DAA480]);
  v19[0] = CFSTR("PRIconGridSizeClassCircular");
  v2 = *MEMORY[0x1E0DAA798];
  v15[0] = *MEMORY[0x1E0DAA790];
  v1 = v15[0];
  v15[1] = v2;
  v18[0] = CFSTR("circular");
  v18[1] = CFSTR("C");
  v4 = *MEMORY[0x1E0DAA788];
  v16 = *MEMORY[0x1E0DAA780];
  v3 = v16;
  v17 = v4;
  v18[2] = CFSTR("small");
  v18[3] = &unk_1E21DCF38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v15, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v5;
  v19[1] = CFSTR("PRIconGridSizeClassRectangular");
  v13[0] = v1;
  v13[1] = v2;
  v14[0] = CFSTR("rectangular");
  v14[1] = CFSTR("R");
  v13[2] = v3;
  v13[3] = v4;
  v14[2] = CFSTR("medium");
  v14[3] = &unk_1E21DCF50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  v19[2] = CFSTR("PRIconGridSizeClassSystemSmall");
  v11[0] = v1;
  v11[1] = v2;
  v12[0] = CFSTR("system small");
  v12[1] = CFSTR("S");
  v11[2] = v3;
  v11[3] = v4;
  v12[2] = CFSTR("large");
  v12[3] = &unk_1E21DCF68;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v0, "initWithGridSizeClasses:", v8);
  v10 = (void *)pr_widgetDomain_domain;
  pr_widgetDomain_domain = v9;

}

@end
