@implementation SBHTestWidgetStackIconDescriptor(SBAdditions)

+ (id)defaultStackIconDescriptorForSizeClass:()SBAdditions
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0DAA570];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(MEMORY[0x1E0DAA568], "weatherWidgetIconDescriptorForSizeClass:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithWidgetIconDescriptors:", v7);

  return v8;
}

+ (id)padDefaultLeadingHomescreenLayoutStackWidgetIconDescriptorForSizeClass:()SBAdditions
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0DAA570];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(MEMORY[0x1E0DAA568], "todayNewsWidgetIconDescriptorForSizeClass:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DAA568], "mapsWidgetIconDescriptorForSizeClass:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0DAA568], "relivePhotosWidgetIconDescriptorForSizeClass:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "initWithWidgetIconDescriptors:", v9);

  return v10;
}

+ (id)padDefaultTrailingHomescreenLayoutStackWidgetIconDescriptorForSizeClass:()SBAdditions
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0DAA570];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(MEMORY[0x1E0DAA568], "weatherWidgetIconDescriptorForSizeClass:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DAA568], "remindersWidgetIconDescriptorForSizeClass:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0DAA568], "recentsWidgetIconDescriptorForSizeClass:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "initWithWidgetIconDescriptors:", v9);

  return v10;
}

@end
