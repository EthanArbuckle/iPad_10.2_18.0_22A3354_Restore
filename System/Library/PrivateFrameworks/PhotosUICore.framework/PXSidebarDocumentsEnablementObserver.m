@implementation PXSidebarDocumentsEnablementObserver

- (PXSidebarDocumentsEnablementObserver)initWithPhotoLibrary:(id)a3
{
  PXSidebarDocumentsEnablementObserver *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXSidebarDocumentsEnablementObserver;
  v3 = -[PXSidebarDocumentsEnablementObserver init](&v6, sel_init, a3);
  if (v3)
  {
    +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addDeferredKeyObserver:", v3);

    -[PXSidebarDocumentsEnablementObserver _updateEnabled](v3, "_updateEnabled");
  }
  return v3;
}

- (PXSidebarDocumentsEnablementObserver)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSidebarDocumentsEnablementObserver.m"), 33, CFSTR("%s is not available as initializer"), "-[PXSidebarDocumentsEnablementObserver init]");

  abort();
}

- (void)_updateEnabled
{
  -[PXSidebarDocumentsEnablementObserver setEnabled:](self, "setEnabled:", +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"));
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;

  v10 = a4;
  v6 = a3;
  +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    NSStringFromSelector(sel_internal_wantsLemonadeUI);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "isEqualToString:", v8);

    if (v9)
      -[PXSidebarDocumentsEnablementObserver _updateEnabled](self, "_updateEnabled");
  }

}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end
