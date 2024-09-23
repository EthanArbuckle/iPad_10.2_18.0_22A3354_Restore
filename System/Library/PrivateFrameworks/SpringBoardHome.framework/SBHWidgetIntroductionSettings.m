@implementation SBHWidgetIntroductionSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHWidgetIntroductionSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBHWidgetIntroductionSettings setShowWidgetIntroConvenienceControl:](self, "setShowWidgetIntroConvenienceControl:", 1);
  -[SBHWidgetIntroductionSettings setEditButtonAsUndo:](self, "setEditButtonAsUndo:", 0);
  -[SBHWidgetIntroductionSettings setSimpleBottomSnaking:](self, "setSimpleBottomSnaking:", 1);
  -[SBHWidgetIntroductionSettings setBumpLeastUsedApps:](self, "setBumpLeastUsedApps:", 1);
  -[SBHWidgetIntroductionSettings setShowXLTVWidget:](self, "setShowXLTVWidget:", 0);
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
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Widget Introduction"), CFSTR("showWidgetIntroConvenienceControl"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v2;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Edit Button As Undo"), CFSTR("editButtonAsUndo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v4, CFSTR("Widget Introduction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Simple Bottom Snaking"), CFSTR("simpleBottomSnaking"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Bump Least Used Apps"), CFSTR("bumpLeastUsedApps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v8, CFSTR("Icon Overflow"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99DE8];
  v21[0] = v5;
  v21[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Extra Large TV Widget"), CFSTR("showXLTVWidget"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v14, CFSTR("TV Widget"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "userInterfaceIdiom");

  if ((v17 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    objc_msgSend(v12, "addObject:", v15);
  objc_msgSend(MEMORY[0x1E0D83078], "moduleWithTitle:contents:", CFSTR("Widget Introduction"), v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)showWidgetIntroConvenienceControl
{
  return *(&self->super.__isObservingChildren + 1);
}

- (void)setShowWidgetIntroConvenienceControl:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 1) = a3;
}

- (BOOL)editButtonAsUndo
{
  return *(&self->super.__isObservingChildren + 2);
}

- (void)setEditButtonAsUndo:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 2) = a3;
}

- (BOOL)simpleBottomSnaking
{
  return *(&self->super.__isObservingChildren + 3);
}

- (void)setSimpleBottomSnaking:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 3) = a3;
}

- (BOOL)bumpLeastUsedApps
{
  return *(&self->super.__isObservingChildren + 4);
}

- (void)setBumpLeastUsedApps:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 4) = a3;
}

- (BOOL)showXLTVWidget
{
  return *(&self->super.__isObservingChildren + 5);
}

- (void)setShowXLTVWidget:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 5) = a3;
}

@end
