@implementation UIScrollView(Workflow)

- (uint64_t)wf_scrollToTopAnimated:()Workflow
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (a3 && (objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a1, "_scrollToTopIfPossible:", 1);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_opt_respondsToSelector() & 1) == 0
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    return 0;
  }
  objc_msgSend(a1, "_effectiveContentInset");
  v6 = v5;
  objc_msgSend(a1, "_firstPageOffset");
  v8 = v7 - v6;
  objc_msgSend(a1, "_revealableContentPadding");
  objc_msgSend(a1, "setContentOffset:", 0.0, v8 - v9);
  return 1;
}

@end
