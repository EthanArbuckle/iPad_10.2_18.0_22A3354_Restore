@implementation SBFloatyFolderController

- (BOOL)isPresentingIconLocation:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("SBIconLocationFolder"));
}

+ (Class)configurationClass
{
  return (Class)objc_opt_self();
}

+ (id)iconLocation
{
  return CFSTR("SBIconLocationFolder");
}

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("SBIconLocationFolder")))
  {
    -[SBFolderController currentIconListView](self, "currentIconListView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "directlyContainsIcon:", v6);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6;
  void *v7;
  char v8;

  v6 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("SBIconLocationFolder")))
  {
    -[SBFolderController folderView](self, "folderView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isDescendantOfView:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)backgroundEffect
{
  void *v2;
  unint64_t v3;

  -[SBFloatyFolderController floatyFolderView](self, "floatyFolderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "backgroundEffect");

  return v3;
}

- (void)setBackgroundEffect:(unint64_t)a3
{
  id v4;

  -[SBFloatyFolderController floatyFolderView](self, "floatyFolderView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundEffect:", a3);

}

- (id)presentedIconLocations
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("SBIconLocationFolder"));
}

- (void)folderView:(id)a3 didBeginEditingTitle:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "folderController:didBeginEditingTitle:", self, v6);

}

- (void)folderView:(id)a3 didEndEditingTitle:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "folderController:didEndEditingTitle:", self, v6);

}

@end
