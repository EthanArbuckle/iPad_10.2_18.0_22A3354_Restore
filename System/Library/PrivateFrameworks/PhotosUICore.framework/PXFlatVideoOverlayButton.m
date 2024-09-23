@implementation PXFlatVideoOverlayButton

- (PXFlatVideoOverlayButton)initWithConfiguration:(id)a3
{
  id v5;
  PXFlatVideoOverlayButton *v6;
  PXFlatVideoOverlayButton *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXFlatVideoOverlayButton;
  v6 = -[PXFlatVideoOverlayButton initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_overlayConfiguration, a3);
    if (objc_msgSend(v5, "style") == 5)
    {
      objc_msgSend(MEMORY[0x1E0DC3520], "borderedButtonConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("play.fill"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setImage:", v9);

      objc_msgSend(v5, "localizedTitle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v10);

      -[PXFlatVideoOverlayButton setConfiguration:](v7, "setConfiguration:", v8);
    }
    else
    {
      if (objc_msgSend(v5, "style") == 3)
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("play.fill"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 44.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "imageWithSymbolConfiguration:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "imageWithRenderingMode:", 2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        -[PXFlatVideoOverlayButton setImage:forState:](v7, "setImage:forState:", v8, 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "px_playOverlayImage:", 3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXFlatVideoOverlayButton setImage:forState:](v7, "setImage:forState:", v14, 0);

        objc_msgSend(MEMORY[0x1E0DC3870], "px_playOverlayImage:", 4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[PXFlatVideoOverlayButton setImage:forState:](v7, "setImage:forState:", v8, 1);
    }

    -[PXFlatVideoOverlayButton sizeToFit](v7, "sizeToFit");
    -[PXFlatVideoOverlayButton setDeliversTouchesForGesturesToSuperview:](v7, "setDeliversTouchesForGesturesToSuperview:", 0);
    -[PXFlatVideoOverlayButton addTarget:action:forControlEvents:](v7, "addTarget:action:forControlEvents:", v7, sel__handleTap_, 64);
  }

  return v7;
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  objc_storeWeak(&self->_target, a3);
  self->_action = a4;
}

- (void)_handleTap:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained(&self->_target);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained(&self->_target);
    objc_msgSend(v6, "performSelector:withObject:", self->_action, v7);

  }
}

- (void)setShowAsPause:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (self->_showAsPause != a3)
  {
    v3 = a3;
    self->_showAsPause = a3;
    if (a3 && !-[PXFlatVideoOverlayButton _didConfigureForPause](self, "_didConfigureForPause"))
    {
      if (-[PXVideoOverlayButtonConfiguration style](self->_overlayConfiguration, "style") == 3)
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("pause.fill"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 44.0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "imageWithSymbolConfiguration:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "imageWithRenderingMode:", 2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        -[PXFlatVideoOverlayButton setImage:forState:](self, "setImage:forState:", v8, 4);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "px_playOverlayImage:", 7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXFlatVideoOverlayButton setImage:forState:](self, "setImage:forState:", v9, 4);

        objc_msgSend(MEMORY[0x1E0DC3870], "px_playOverlayImage:", 8);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[PXFlatVideoOverlayButton setImage:forState:](self, "setImage:forState:", v8, 5);

      -[PXFlatVideoOverlayButton _setDidConfigureForPause:](self, "_setDidConfigureForPause:", 1);
    }
    -[PXFlatVideoOverlayButton setSelected:](self, "setSelected:", v3);
  }
}

- (BOOL)showAsPause
{
  return self->_showAsPause;
}

- (BOOL)_didConfigureForPause
{
  return self->__didConfigureForPause;
}

- (void)_setDidConfigureForPause:(BOOL)a3
{
  self->__didConfigureForPause = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_overlayConfiguration, 0);
}

@end
