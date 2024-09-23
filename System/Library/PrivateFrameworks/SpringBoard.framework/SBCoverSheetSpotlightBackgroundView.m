@implementation SBCoverSheetSpotlightBackgroundView

- (SBCoverSheetSpotlightBackgroundView)init
{
  SBCoverSheetSpotlightBackgroundView *v2;
  id v3;
  uint64_t v4;
  SBSearchBackdropView *searchBlurBackdropView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBCoverSheetSpotlightBackgroundView;
  v2 = -[SBCoverSheetSpotlightBackgroundView init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0DAA660]);
    v4 = objc_msgSend(v3, "initWithFrame:style:", 3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    searchBlurBackdropView = v2->_searchBlurBackdropView;
    v2->_searchBlurBackdropView = (SBSearchBackdropView *)v4;

    -[SBSearchBackdropView bs_setHitTestingDisabled:](v2->_searchBlurBackdropView, "bs_setHitTestingDisabled:", 1);
    -[SBSearchBackdropView setAutoresizingMask:](v2->_searchBlurBackdropView, "setAutoresizingMask:", 18);
    -[SBSearchBackdropView prepareForTransitionToBlurred:](v2->_searchBlurBackdropView, "prepareForTransitionToBlurred:", 1);
    -[SBCoverSheetSpotlightBackgroundView addSubview:](v2, "addSubview:", v2->_searchBlurBackdropView);
  }
  return v2;
}

- (double)spotlightBackgroundWeighting
{
  double result;

  -[SBSearchBackdropView transitionProgress](self->_searchBlurBackdropView, "transitionProgress");
  return result;
}

- (void)setSpotlightBackgroundWeighting:(double)a3
{
  -[SBSearchBackdropView setTransitionProgress:](self->_searchBlurBackdropView, "setTransitionProgress:", a3);
}

- (SBSearchBackdropView)searchBlurBackdropView
{
  return self->_searchBlurBackdropView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBlurBackdropView, 0);
}

@end
