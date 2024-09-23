@implementation PXStoryChromeLayoutEdgeHighlightController

- (double)targetAlphaForVisibleState
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[PXStoryChromeLayoutItemController viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewLayoutSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "edgeHighlightAlpha");
  v5 = v4;

  return v5;
}

- (void)animateChangeToTargetAlpha:(double)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];
  objc_super v8;

  if (a3 == 0.0)
  {
    v8.receiver = self;
    v8.super_class = (Class)PXStoryChromeLayoutEdgeHighlightController;
    -[PXStoryChromeLayoutItemController animateChangeToTargetAlpha:](&v8, sel_animateChangeToTargetAlpha_, a3);
  }
  else
  {
    -[PXStoryChromeLayoutItemController alphaAnimator](self, "alphaAnimator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73__PXStoryChromeLayoutEdgeHighlightController_animateChangeToTargetAlpha___block_invoke;
    v7[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
    *(double *)&v7[4] = a3;
    objc_msgSend(v5, "performChangesWithoutAnimation:", v7);

    -[PXStoryChromeLayoutItemController viewModel](self, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performChanges:", &__block_literal_global_182607);

  }
}

uint64_t __73__PXStoryChromeLayoutEdgeHighlightController_animateChangeToTargetAlpha___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(double *)(a1 + 32));
}

uint64_t __73__PXStoryChromeLayoutEdgeHighlightController_animateChangeToTargetAlpha___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEdgeToHighlight:", 0);
}

@end
