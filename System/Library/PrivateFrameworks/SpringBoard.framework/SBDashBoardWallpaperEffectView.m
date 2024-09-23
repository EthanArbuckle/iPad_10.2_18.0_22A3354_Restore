@implementation SBDashBoardWallpaperEffectView

- (SBDashBoardWallpaperEffectView)initWithWallpaperVariant:(int64_t)a3 transformOptions:(unint64_t)a4
{
  SBDashBoardWallpaperEffectView *v4;
  id v5;
  uint64_t v6;
  SBUIBackgroundView *backgroundView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBDashBoardWallpaperEffectView;
  v4 = -[SBWallpaperEffectView initWithWallpaperVariant:transformOptions:](&v9, sel_initWithWallpaperVariant_transformOptions_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DAC270]);
    -[SBDashBoardWallpaperEffectView bounds](v4, "bounds");
    v6 = objc_msgSend(v5, "initWithFrame:");
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (SBUIBackgroundView *)v6;

    -[SBDashBoardWallpaperEffectView addSubview:](v4, "addSubview:", v4->_backgroundView);
  }
  return v4;
}

- (void)didAddSubview:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardWallpaperEffectView;
  -[SBDashBoardWallpaperEffectView didAddSubview:](&v4, sel_didAddSubview_, a3);
  -[SBDashBoardWallpaperEffectView bringSubviewToFront:](self, "bringSubviewToFront:", self->_backgroundView);
}

- (void)layoutSubviews
{
  SBUIBackgroundView *backgroundView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardWallpaperEffectView;
  -[PBUIWallpaperEffectViewBase layoutSubviews](&v4, sel_layoutSubviews);
  backgroundView = self->_backgroundView;
  -[SBDashBoardWallpaperEffectView bounds](self, "bounds");
  -[SBUIBackgroundView setFrame:](backgroundView, "setFrame:");
}

- (void)setBackgroundStyle:(int64_t)a3
{
  -[SBUIBackgroundView setBackgroundStyle:](self->_backgroundView, "setBackgroundStyle:", a3);
}

- (void)setCoverSheetWallpaperStyle:(int64_t)a3
{
  uint64_t v3;

  if (a3 == 1)
    v3 = 10;
  else
    v3 = 0;
  -[PBUIWallpaperEffectViewBase setStyle:](self, "setStyle:", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
