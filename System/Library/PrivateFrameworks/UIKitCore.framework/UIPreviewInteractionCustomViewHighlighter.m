@implementation UIPreviewInteractionCustomViewHighlighter

uint64_t __126___UIPreviewInteractionCustomViewHighlighter_highlightShouldBeginInContainerView_presentationContainerView_previewingContext___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

@end
