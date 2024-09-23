@implementation PPKQuickLookContentEditorViewController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PPKQuickLookContentEditorViewController;
  -[PPKMarkupViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFindInteractionEnabled:", 1);

}

- (BOOL)acceptSingleTouch:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "acceptSingleTouch:", v4);

  return v6;
}

+ (CGSize)suggestedContentSizeForURL:(id)a3
{
  const __CFURL *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  CGImageSourceRef v11;
  CGImageSourceRef v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v4 = (const __CFURL *)a3;
  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v4)
  {
    +[PPKMarkupViewController _contentTypeForURL:](PPKQuickLookContentEditorViewController, "_contentTypeForURL:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "conformsToType:", *MEMORY[0x1E0CEC570]))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD0DB8]), "initWithURL:", v4);
      objc_msgSend(a1, "_suggestedContentSizeForPDF:", v8);
      v5 = v9;
      v6 = v10;

    }
    else if (objc_msgSend(v7, "conformsToType:", *MEMORY[0x1E0CEC520]))
    {
      v11 = CGImageSourceCreateWithURL(v4, 0);
      if (v11)
      {
        v12 = v11;
        objc_msgSend(a1, "_suggestedContentSizeForImageSource:", v11);
        v5 = v13;
        v6 = v14;
        CFRelease(v12);
      }
    }

  }
  v15 = v5;
  v16 = v6;
  result.height = v16;
  result.width = v15;
  return result;
}

+ (CGSize)suggestedContentSizeForData:(id)a3
{
  const __CFData *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  CGImageSourceRef v11;
  CGImageSourceRef v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v4 = (const __CFData *)a3;
  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v4)
  {
    +[PPKMarkupViewController _contentTypeForData:](PPKQuickLookContentEditorViewController, "_contentTypeForData:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "conformsToType:", *MEMORY[0x1E0CEC570]))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD0DB8]), "initWithData:", v4);
      objc_msgSend(a1, "_suggestedContentSizeForPDF:", v8);
      v5 = v9;
      v6 = v10;

    }
    else if (objc_msgSend(v7, "conformsToType:", *MEMORY[0x1E0CEC520]))
    {
      v11 = CGImageSourceCreateWithData(v4, 0);
      if (v11)
      {
        v12 = v11;
        objc_msgSend(a1, "_suggestedContentSizeForImageSource:", v11);
        v5 = v13;
        v6 = v14;
        CFRelease(v12);
      }
    }

  }
  v15 = v5;
  v16 = v6;
  result.height = v16;
  result.width = v15;
  return result;
}

- (BOOL)documentIsLocked
{
  void *v2;
  char v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "documentIsLocked");

  return v3;
}

- (BOOL)canEncryptDocument
{
  void *v2;
  char v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canEncryptDocument");

  return v3;
}

- (void)updateForFullScreen:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateForFullscreen:animated:", v5, v4);

}

- (void)shouldHideMarkupOverlays:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShouldHideMarkupOverlays:animated:", v5, v4);

}

- (BOOL)shouldHighlightTextAndDDAfterNextAnalysis
{
  void *v2;
  char v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldHighlightTextAndODAfterNextAnalysis");

  return v3;
}

- (void)setShouldHighlightTextAndDDAfterNextAnalysis:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldHighlightTextAndODAfterNextAnalysis:", v3);

}

- (BOOL)shouldEnterVisualSearchAfterNextAnalysis
{
  void *v2;
  char v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldEnterVisualSearchAfterNextAnalysis");

  return v3;
}

- (void)setShouldEnterVisualSearchAfterNextAnalysis:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldEnterVisualSearchAfterNextAnalysis:", v3);

}

- (BOOL)shouldUpliftSubjectAfterNextAnalysis
{
  void *v2;
  char v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldUpliftSubjectAfterNextAnalysis");

  return v3;
}

- (void)setShouldUpliftSubjectAfterNextAnalysis:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldUpliftSubjectAfterNextAnalysis:", v3);

}

- (void)infoButtonTapped
{
  id v2;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoButtonTapped");

}

- (void)setupAndStartImageAnalysisIfNeeded
{
  id v2;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setupAndStartImageAnalysisIfNeeded");

}

- (void)stopImageAnalysis
{
  id v2;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopImageAnalysis");

}

- (void)flattenImageForAnalysis
{
  id v2;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flattenImageForAnalysis");

}

- (BOOL)isInteractionActive
{
  void *v2;
  char v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInteractionActive");

  return v3;
}

- (BOOL)hasResultsForVisualSearch
{
  void *v2;
  char v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasResultsForVisualSearch");

  return v3;
}

- (BOOL)isVisualSearchEnabled
{
  void *v2;
  char v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVisualSearchEnabled");

  return v3;
}

- (NSString)infoButtonGlyphName
{
  void *v2;
  void *v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoButtonGlyphName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)filledInfoButtonGlyphName
{
  void *v2;
  void *v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filledInfoButtonGlyphName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)markupContainerViewController:(id)a3 updateChromeWithAnimation:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[PPKMarkupViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "editor:needsToUpdateChromeWithAnimation:", self, v4);

}

- (void)markupContainerViewController:(id)a3 willPresentViewControllerWithAnimation:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[PPKMarkupViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PPKMarkupViewController annotationEditingEnabled](self, "annotationEditingEnabled"))
  {
    -[PPKQuickLookContentEditorViewController setNeedsToRestoreAnnotationEditingMode:](self, "setNeedsToRestoreAnnotationEditingMode:", 1);
    -[PPKMarkupViewController setAnnotationEditingEnabled:](self, "setAnnotationEditingEnabled:", 0);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "editor:willPresentViewControllerWithAnimation:", self, v4);

}

- (void)markupContainerViewController:(id)a3 didDismissViewControllerWithAnimation:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[PPKMarkupViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "editor:didDismissViewControllerWithAnimation:", self, v4);
  if (-[PPKQuickLookContentEditorViewController needsToRestoreAnnotationEditingMode](self, "needsToRestoreAnnotationEditingMode"))
  {
    -[PPKMarkupViewController setAnnotationEditingEnabled:](self, "setAnnotationEditingEnabled:", 1);
    -[PPKQuickLookContentEditorViewController setNeedsToRestoreAnnotationEditingMode:](self, "setNeedsToRestoreAnnotationEditingMode:", 0);
  }

}

- (void)markupContainerViewControllerActiveAnalysisInteractionTypesDidChange:(id)a3
{
  id v4;

  -[PPKMarkupViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "editor:needsToUpdateChromeWithAnimation:", self, 1);

}

- (void)markupContainerViewControllerAvailableAnalysisResultTypesDidChange:(id)a3
{
  id v4;

  -[PPKMarkupViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "editor:needsToUpdateChromeWithAnimation:", self, 1);

}

- (void)markupContainerViewController:(id)a3 thumbnailViewDidCollapse:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;

  v4 = a4;
  -[PPKMarkupViewController delegate](self, "delegate", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v9 = (void *)v6;
    v8 = objc_opt_respondsToSelector();
    v7 = v9;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v9, "editor:needsScreenEdgePanGestureRecognition:", self, !v4);
      v7 = v9;
    }
  }

}

+ (CGSize)_suggestedContentSizeForImageSource:(CGImageSource *)a3
{
  CGImageRef ImageAtIndex;
  CGImageRef v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, 0);
  if (ImageAtIndex)
  {
    v4 = ImageAtIndex;
    CGImageGetSizeAfterOrientation();
    v6 = v5;
    v8 = v7;
    CFRelease(v4);
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D820];
    v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (CGSize)_suggestedContentSizeForPDF:(id)a3
{
  id v3;
  void *v4;
  CGFloat width;
  CGFloat height;
  void *v7;
  double v8;
  double v9;
  CGSize result;
  CGRect BoxRect;

  v3 = a3;
  v4 = v3;
  width = *MEMORY[0x1E0C9D820];
  height = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v3 && objc_msgSend(v3, "pageCount"))
  {
    objc_msgSend(v4, "pageAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    BoxRect = CGPDFPageGetBoxRect((CGPDFPageRef)objc_msgSend(v7, "pageRef"), kCGPDFMediaBox);
    width = BoxRect.size.width;
    height = BoxRect.size.height;

  }
  v8 = width;
  v9 = height;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)markupContainerViewControllerDidChangeContent:(id)a3 enablingMarkup:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;

  v4 = a4;
  -[PPKMarkupViewController delegate](self, "delegate", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v9 = (void *)v6;
    v8 = objc_opt_respondsToSelector();
    v7 = v9;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v9, "editorDidChangeContent:enablingMarkup:", self, v4);
      v7 = v9;
    }
  }

}

- (void)markupContainerViewController:(id)a3 openFormFilling:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;

  v4 = a4;
  -[PPKMarkupViewController delegate](self, "delegate", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v9 = (void *)v6;
    v8 = objc_opt_respondsToSelector();
    v7 = v9;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v9, "editorDidChangeContent:enablingFormFilling:", self, v4);
      v7 = v9;
    }
  }

}

- (void)markupContainerViewController:(id)a3 contentFrameDidChange:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[PPKMarkupViewController delegate](self, "delegate", a3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    v12 = (void *)v9;
    v11 = objc_opt_respondsToSelector();
    v10 = v12;
    if ((v11 & 1) != 0)
    {
      objc_msgSend(v12, "editor:contentFrameDidChange:", self, x, y, width, height);
      v10 = v12;
    }
  }

}

- (void)markupContainerViewController:(id)a3 detectedFormInContent:(BOOL)a4 withAutofill:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;

  v5 = a5;
  v6 = a4;
  -[PPKMarkupViewController delegate](self, "delegate", a3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    v11 = (void *)v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v11, "editor:detectedFormInContent:withAutofill:", self, v6, v5);
LABEL_6:
      v9 = v11;
      goto LABEL_7;
    }
    v10 = objc_opt_respondsToSelector();
    v9 = v11;
    if ((v10 & 1) != 0)
    {
      objc_msgSend(v11, "editor:detectedFormInContent:", self, v6);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (BOOL)shouldAllowEditingContents:(id)a3
{
  unsigned int v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PPKQuickLookContentEditorViewController;
  v4 = -[PPKMarkupViewController shouldAllowEditingContents:](&v9, sel_shouldAllowEditingContents_, a3);
  -[PPKMarkupViewController delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      LOBYTE(v4) = objc_msgSend(v6, "editorShouldAllowEditingContents:", self);
    else
      LOBYTE(v4) = 1;
  }

  return v4;
}

- (void)showBannerWithConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "showBannerViewWith:", v4);

}

- (void)hideBanner
{
  void *v2;
  id v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bannerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

}

- (BOOL)isBannerVisible
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bannerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (UIFindInteraction)findInteraction
{
  void *v2;
  void *v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFindInteraction *)v3;
}

- (void)find:(id)a3
{
  id v3;

  -[PPKQuickLookContentEditorViewController findInteraction](self, "findInteraction", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentFindNavigatorShowingReplace:", 0);

}

- (void)findNext:(id)a3
{
  id v3;

  -[PPKQuickLookContentEditorViewController findInteraction](self, "findInteraction", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "findNext");

}

- (void)findPrevious:(id)a3
{
  id v3;

  -[PPKQuickLookContentEditorViewController findInteraction](self, "findInteraction", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "findPrevious");

}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (PPKQuickLookBannerView)bannerView
{
  return self->_bannerView;
}

- (void)setBannerView:(id)a3
{
  objc_storeStrong((id *)&self->_bannerView, a3);
}

- (BOOL)needsToRestoreAnnotationEditingMode
{
  return self->_needsToRestoreAnnotationEditingMode;
}

- (void)setNeedsToRestoreAnnotationEditingMode:(BOOL)a3
{
  self->_needsToRestoreAnnotationEditingMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerView, 0);
}

@end
