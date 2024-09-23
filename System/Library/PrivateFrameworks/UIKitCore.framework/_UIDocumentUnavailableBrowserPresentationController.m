@implementation _UIDocumentUnavailableBrowserPresentationController

- (_UIDocumentUnavailableBrowserPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  _UIDocumentUnavailableBrowserPresentationController *v4;
  _UIDocumentUnavailableBrowserPresentationController *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)_UIDocumentUnavailableBrowserPresentationController;
  v4 = -[UISheetPresentationController initWithPresentedViewController:presentingViewController:](&v10, sel_initWithPresentedViewController_presentingViewController_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UISheetPresentationController setPreferredCornerRadius:](v4, "setPreferredCornerRadius:", 0.0);
    -[_UIDocumentUnavailableBrowserPresentationController setSelectedDetentIdentifier:](v5, "setSelectedDetentIdentifier:", CFSTR("_UIDocumentUnavailableViewBrowserViewControllerMediumDetent"));
    -[UISheetPresentationController setLargestUndimmedDetentIdentifier:](v5, "setLargestUndimmedDetentIdentifier:", CFSTR("com.apple.UIKit.full"));
    +[UISheetPresentationControllerDetent customDetentWithIdentifier:resolver:](UISheetPresentationControllerDetent, "customDetentWithIdentifier:resolver:", CFSTR("_UIDocumentUnavailableViewBrowserViewControllerMediumDetent"), &__block_literal_global_605);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    +[UISheetPresentationControllerDetent _fullDetent](UISheetPresentationControllerDetent, "_fullDetent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISheetPresentationController setDetents:](v5, "setDetents:", v8);

    -[UISheetPresentationController _setShouldScaleDownBehindDescendantSheets:](v5, "_setShouldScaleDownBehindDescendantSheets:", 0);
    -[UISheetPresentationController _setWantsBottomAttached:](v5, "_setWantsBottomAttached:", 1);
    -[UISheetPresentationController _setPreferredShadowOpacity:](v5, "_setPreferredShadowOpacity:", 0.4);
    -[UISheetPresentationController _setShadowRadius:](v5, "_setShadowRadius:", 100.0);
  }
  return v5;
}

- (double)smallestDetentValue
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v9;

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "_detentValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel_smallestDetentValue, a1, CFSTR("_UIDocumentUnavailableBrowserPresentationController.m"), 52, CFSTR("UIKit internal inconsistency: expected sheet detent in browser presentation controller."));

  }
  objc_msgSend(a1, "_detentValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)setSelectedDetentIdentifier:(id)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  objc_super v9;

  -[UISheetPresentationController selectedDetentIdentifier](self, "selectedDetentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)_UIDocumentUnavailableBrowserPresentationController;
  -[UISheetPresentationController setSelectedDetentIdentifier:](&v9, sel_setSelectedDetentIdentifier_, a3);
  -[UISheetPresentationController selectedDetentIdentifier](self, "selectedDetentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("_UIDocumentViewControllerLandingBrowserPresentationControllerDidChangeSelectedDetentIdentifierNotification"), self);

  }
}

- (void)_sendDidChangeSelectedDetentIdentifier
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentUnavailableBrowserPresentationController;
  -[UISheetPresentationController _sendDidChangeSelectedDetentIdentifier](&v4, sel__sendDidChangeSelectedDetentIdentifier);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("_UIDocumentViewControllerLandingBrowserPresentationControllerDidChangeSelectedDetentIdentifierNotification"), self);

}

- (void)_sendDidInvalidateDetentValues
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentUnavailableBrowserPresentationController;
  -[UISheetPresentationController _sendDidInvalidateDetentValues](&v4, sel__sendDidInvalidateDetentValues);
  -[_UIDocumentUnavailableBrowserPresentationController browserDelegate]((id *)&self->super.super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "browserPresentationControllerDidInvalidateSheetDetentValues:", self);

}

- (id)browserDelegate
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 72);
  return WeakRetained;
}

- (void)_sendDidInvalidateUntransformedFrame
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentUnavailableBrowserPresentationController;
  -[UISheetPresentationController _sendDidInvalidateUntransformedFrame](&v4, sel__sendDidInvalidateUntransformedFrame);
  -[_UIDocumentUnavailableBrowserPresentationController browserDelegate]((id *)&self->super.super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "browserPresentationControllerDidInvalidateUntransformedFrame:", self);

}

- (void)_sendPerformLayout
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentUnavailableBrowserPresentationController;
  -[UISheetPresentationController _sendDidInvalidateUntransformedFrame](&v4, sel__sendDidInvalidateUntransformedFrame);
  -[_UIDocumentUnavailableBrowserPresentationController browserDelegate]((id *)&self->super.super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "browserPresentationControllerPerformLayout:", self);

}

- (void)presentationTransitionWillBegin
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentUnavailableBrowserPresentationController;
  -[UISheetPresentationController presentationTransitionWillBegin](&v4, sel_presentationTransitionWillBegin);
  -[_UIDocumentUnavailableBrowserPresentationController browserDelegate]((id *)&self->super.super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "browserPresentationControllerPresentationTransitionWillBegin:", self);

}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentUnavailableBrowserPresentationController;
  -[UISheetPresentationController presentationTransitionDidEnd:](&v5, sel_presentationTransitionDidEnd_, a3);
  -[_UIDocumentUnavailableBrowserPresentationController browserDelegate]((id *)&self->super.super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "browserPresentationControllerPresentationTransitionDidEnd:", self);

}

- (void)dismissalTransitionWillBegin
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentUnavailableBrowserPresentationController;
  -[UISheetPresentationController dismissalTransitionWillBegin](&v4, sel_dismissalTransitionWillBegin);
  -[_UIDocumentUnavailableBrowserPresentationController browserDelegate]((id *)&self->super.super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "browserPresentationControllerDismissalTransitionWillBegin:", self);

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentUnavailableBrowserPresentationController;
  -[UISheetPresentationController dismissalTransitionDidEnd:](&v5, sel_dismissalTransitionDidEnd_, a3);
  -[_UIDocumentUnavailableBrowserPresentationController browserDelegate]((id *)&self->super.super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "browserPresentationControllerDismissalTransitionDidEnd:", self);

}

- (BOOL)shouldPresentInFullscreen
{
  return 0;
}

- (BOOL)_shouldDismiss
{
  return 0;
}

- (BOOL)_shouldDisableInteractionDuringTransitions
{
  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_browserDelegate);
}

@end
