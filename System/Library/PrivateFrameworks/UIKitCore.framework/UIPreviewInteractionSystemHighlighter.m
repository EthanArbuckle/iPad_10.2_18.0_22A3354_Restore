@implementation UIPreviewInteractionSystemHighlighter

void __122___UIPreviewInteractionSystemHighlighter_highlightShouldBeginInContainerView_presentationContainerView_previewingContext___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "initialSnapshotView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

@end
