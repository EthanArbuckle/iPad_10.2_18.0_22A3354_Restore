@implementation _UITabBarSettings

- (BOOL)showAlignmentGuides
{
  return *(&self->super.__isObservingChildren + 2);
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UITabBarSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[_UITabBarSettings setHighlightSystemItems:](self, "setHighlightSystemItems:", 0);
  -[_UITabBarSettings setShowAlignmentGuides:](self, "setShowAlignmentGuides:", 0);
}

- (void)setShowAlignmentGuides:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 2) = a3;
}

- (void)setHighlightSystemItems:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 1) = a3;
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Highlight System Items"), CFSTR("highlightSystemItems"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Image Alignment Guides"), CFSTR("showAlignmentGuides"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:action:", CFSTR("Restore Defaults"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D83078];
  v17[0] = v2;
  v17[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionWithRows:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v10 = (void *)MEMORY[0x1E0D83078];
  v16 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionWithRows:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "moduleWithTitle:contents:", 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)highlightSystemItems
{
  return *(&self->super.__isObservingChildren + 1);
}

@end
