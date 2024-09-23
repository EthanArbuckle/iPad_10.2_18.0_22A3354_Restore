@implementation _PBUIWallpaperViewControllerAssertion

- (_PBUIWallpaperViewControllerAssertion)initWithWallpaperViewController:(id)a3 type:(int64_t)a4 reason:(id)a5
{
  id v8;
  id v9;
  _PBUIWallpaperViewControllerAssertion *v10;
  _PBUIWallpaperViewControllerAssertion *v11;
  uint64_t v12;
  NSString *reason;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_PBUIWallpaperViewControllerAssertion;
  v10 = -[_PBUIWallpaperViewControllerAssertion init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_wallpaperViewController, v8);
    v11->_type = a4;
    v12 = objc_msgSend(v9, "copy");
    reason = v11->_reason;
    v11->_reason = (NSString *)v12;

  }
  return v11;
}

- (void)invalidate
{
  id v3;

  if (!-[_PBUIWallpaperViewControllerAssertion isInvalidated](self, "isInvalidated"))
  {
    -[_PBUIWallpaperViewControllerAssertion setInvalidated:](self, "setInvalidated:", 1);
    -[_PBUIWallpaperViewControllerAssertion wallpaperViewController](self, "wallpaperViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_invalidateWallpaperAssertion:", self);

  }
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!-[_PBUIWallpaperViewControllerAssertion isInvalidated](self, "isInvalidated"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBUIWallpaperViewController.m"), 2074, CFSTR("Wallpaper assertion type %ld \"%@\" was not invalidated before dealloc!"), self->_type, self->_reason);

  }
  -[_PBUIWallpaperViewControllerAssertion invalidate](self, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)_PBUIWallpaperViewControllerAssertion;
  -[_PBUIWallpaperViewControllerAssertion dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)-[_PBUIWallpaperViewControllerAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_PBUIWallpaperViewControllerAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_PBUIWallpaperViewControllerAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  -[_PBUIWallpaperViewControllerAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PBUIWallpaperViewControllerAssertion wallpaperViewController](self, "wallpaperViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendPointer:withName:", v5, CFSTR("wallpaperViewController"));

  v7 = (id)objc_msgSend(v4, "appendInteger:withName:", -[_PBUIWallpaperViewControllerAssertion type](self, "type"), CFSTR("type"));
  -[_PBUIWallpaperViewControllerAssertion reason](self, "reason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "appendObject:withName:", v8, CFSTR("reason"));

  v10 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[_PBUIWallpaperViewControllerAssertion isInvalidated](self, "isInvalidated"), CFSTR("isInvalidated"), 1);
  return v4;
}

- (PBUIWallpaperViewController)wallpaperViewController
{
  return (PBUIWallpaperViewController *)objc_loadWeakRetained((id *)&self->_wallpaperViewController);
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_wallpaperViewController);
}

@end
