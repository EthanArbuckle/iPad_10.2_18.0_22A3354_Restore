@implementation _SBHomeScreenFolderDelegate

- (_SBHomeScreenFolderDelegate)initWithForwardingTarget:(id)a3
{
  id v5;
  _SBHomeScreenFolderDelegate *v6;
  _SBHomeScreenFolderDelegate *v7;
  _SBHomeScreenFolderDelegate *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)_SBHomeScreenFolderDelegate;
    v6 = -[_SBHomeScreenFolderDelegate init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_forwardingTarget, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  objc_super v6;

  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    return self->_forwardingTarget;
  v6.receiver = self;
  v6.super_class = (Class)_SBHomeScreenFolderDelegate;
  -[_SBHomeScreenFolderDelegate forwardingTargetForSelector:](&v6, sel_forwardingTargetForSelector_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SBHomeScreenFolderDelegate;
  if (-[_SBHomeScreenFolderDelegate respondsToSelector:](&v5, sel_respondsToSelector_))
    v3 = 1;
  else
    v3 = objc_opt_respondsToSelector();
  return v3 & 1;
}

- (id)backgroundViewForDockForRootFolderController:(id)a3
{
  SBWallpaperEffectView *v3;
  uint64_t v4;
  void *v5;
  double v6;
  void *v7;

  switch(-[_SBHomeScreenFolderDelegate dockStyle](self, "dockStyle", a3))
  {
    case 0:
      v3 = -[SBWallpaperEffectView initWithWallpaperVariant:]([SBWallpaperEffectView alloc], "initWithWallpaperVariant:", 1);
      -[SBWallpaperEffectView setClipsToBounds:](v3, "setClipsToBounds:", 1);
      -[PBUIWallpaperEffectViewBase setStyle:](v3, "setStyle:", 28);
      return v3;
    case 1:
      v3 = (SBWallpaperEffectView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithDynamicProvider:", &__block_literal_global_288);
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      v3 = (SBWallpaperEffectView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
      v5 = (void *)MEMORY[0x1E0CEA478];
      v6 = 0.8;
      goto LABEL_7;
    case 3:
      v3 = (SBWallpaperEffectView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
      v5 = (void *)MEMORY[0x1E0CEA478];
      v6 = 0.2;
LABEL_7:
      objc_msgSend(v5, "colorWithWhite:alpha:", v6, 0.6);
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v7 = (void *)v4;
      -[SBWallpaperEffectView setBackgroundColor:](v3, "setBackgroundColor:", v4);

      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (SBFolderControllerDelegate)forwardingTarget
{
  return self->_forwardingTarget;
}

- (void)setForwardingTarget:(id)a3
{
  objc_storeStrong((id *)&self->_forwardingTarget, a3);
}

- (int64_t)dockStyle
{
  return self->_dockStyle;
}

- (void)setDockStyle:(int64_t)a3
{
  self->_dockStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forwardingTarget, 0);
}

@end
