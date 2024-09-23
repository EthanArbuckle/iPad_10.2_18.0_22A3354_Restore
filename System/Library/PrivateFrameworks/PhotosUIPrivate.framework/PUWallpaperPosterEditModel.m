@implementation PUWallpaperPosterEditModel

- (PUWallpaperPosterEditModel)initWithEditor:(id)a3
{
  id v5;
  PUWallpaperPosterEditModel *v6;
  NSMutableSet *v7;
  NSMutableSet *idleTimerDisablingReasons;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUWallpaperPosterEditModel;
  v6 = -[PUWallpaperPosterEditModel init](&v10, sel_init);
  if (v6)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    idleTimerDisablingReasons = v6->_idleTimerDisablingReasons;
    v6->_idleTimerDisablingReasons = v7;

    objc_storeStrong((id *)&v6->_editor, a3);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PUWallpaperPosterEditModel;
  -[PUWallpaperPosterEditModel dealloc](&v2, sel_dealloc);
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUWallpaperPosterEditModel;
  -[PUWallpaperPosterEditModel performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v6 = a4;
  -[PUWallpaperPosterEditModel idleTimerDisablingReasons](self, "idleTimerDisablingReasons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
    objc_msgSend(v7, "addObject:", v6);
  else
    objc_msgSend(v7, "removeObject:", v6);

  -[PUWallpaperPosterEditModel setIdleTimerDisabled:](self, "setIdleTimerDisabled:", objc_msgSend(v8, "count") != 0);
}

- (void)setIdleTimerDisabled:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (self->_idleTimerDisabled != a3)
  {
    self->_idleTimerDisabled = a3;
    if (a3)
    {
      -[PUWallpaperPosterEditModel editor](self, "editor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pu_disableIdleTimer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUWallpaperPosterEditModel setIdleTimerAssertion:](self, "setIdleTimerAssertion:", v5);

    }
    else
    {
      -[PUWallpaperPosterEditModel idleTimerAssertion](self, "idleTimerAssertion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "px_invalidate");

      -[PUWallpaperPosterEditModel setIdleTimerAssertion:](self, "setIdleTimerAssertion:", 0);
    }
    -[PUWallpaperPosterEditModel signalChange:](self, "signalChange:", 1);
  }
}

- (BOOL)idleTimerDisabled
{
  return self->_idleTimerDisabled;
}

- (NSMutableSet)idleTimerDisablingReasons
{
  return self->_idleTimerDisablingReasons;
}

- (void)setIdleTimerDisablingReasons:(id)a3
{
  objc_storeStrong((id *)&self->_idleTimerDisablingReasons, a3);
}

- (PUPosterEditor)editor
{
  return self->_editor;
}

- (void)setEditor:(id)a3
{
  objc_storeStrong((id *)&self->_editor, a3);
}

- (PXInvalidatable)idleTimerAssertion
{
  return self->_idleTimerAssertion;
}

- (void)setIdleTimerAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_idleTimerAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimerAssertion, 0);
  objc_storeStrong((id *)&self->_editor, 0);
  objc_storeStrong((id *)&self->_idleTimerDisablingReasons, 0);
}

@end
