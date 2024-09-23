@implementation SBHCredenzaSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHCredenzaSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBHCredenzaSettings setShouldPinLibraryList:](self, "setShouldPinLibraryList:", 0);
}

+ (id)settingsControllerModule
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:action:", CFSTR("Restore Defaults"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v6, CFSTR("Restore Defaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v7);
  objc_msgSend((id)objc_opt_class(), "addAppLibrarySectionsIfNeededToSection:", v2);
  objc_msgSend(MEMORY[0x1E0D83078], "moduleWithTitle:contents:", 0, v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)addAppLibrarySectionsIfNeededToSection:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  if (v3)
  {
    v7 = v3;
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (SBHFeatureEnabled(0))
    {
      objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Pin Library List"), CFSTR("shouldPinLibraryList"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v5);

    }
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v4, CFSTR("App Library"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v6);

    }
    v3 = v7;
  }

}

- (BOOL)shouldPinLibraryList
{
  return *(&self->super.__isObservingChildren + 1);
}

- (void)setShouldPinLibraryList:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 1) = a3;
}

@end
