@implementation WebDefaultUIDelegate

+ (id)sharedUIDelegate
{
  id result;

  if (_MergedGlobals_13 == 1)
    return (id)qword_1ECEC9858;
  result = objc_alloc_init(WebDefaultUIDelegate);
  qword_1ECEC9858 = (uint64_t)result;
  _MergedGlobals_13 = 1;
  return result;
}

- (id)webView:(id)a3 createWebViewWithRequest:(id)a4 windowFeatures:(id)a5
{
  objc_msgSend(a3, "UIDelegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return 0;
  objc_msgSend(a3, "UIDelegate");
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  else
    return (id)objc_msgSend((id)objc_msgSend(a3, "UIDelegate"), "webView:createWebViewWithRequest:", a3, a4);
}

- (id)webView:(id)a3 createWebViewWithRequest:(id)a4 userGesture:(BOOL)a5
{
  return 0;
}

- (id)webViewFirstResponder:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(a3, "window"), "firstResponder");
}

- (void)webView:(id)a3 makeFirstResponder:(id)a4
{
  objc_msgSend((id)objc_msgSend(a3, "window"), "makeFirstResponder:", a4);
}

- (id)webViewStatusText:(id)a3
{
  return 0;
}

- (BOOL)webViewAreToolbarsVisible:(id)a3
{
  return 0;
}

- (BOOL)webViewIsStatusBarVisible:(id)a3
{
  return 0;
}

- (BOOL)webViewIsResizable:(id)a3
{
  return 0;
}

- (CGRect)webViewFrame:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v3 = (void *)objc_msgSend(a3, "window");
  if (v3)
  {
    objc_msgSend(v3, "frame");
  }
  else
  {
    v4 = *MEMORY[0x1E0CB3438];
    v5 = *(double *)(MEMORY[0x1E0CB3438] + 8);
    v6 = *(double *)(MEMORY[0x1E0CB3438] + 16);
    v7 = *(double *)(MEMORY[0x1E0CB3438] + 24);
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (BOOL)webView:(id)a3 runJavaScriptConfirmPanelWithMessage:(id)a4 initiatedByFrame:(id)a5
{
  return 0;
}

- (id)webView:(id)a3 runJavaScriptTextInputPanelWithPrompt:(id)a4 defaultText:(id)a5 initiatedByFrame:(id)a6
{
  return 0;
}

- (unint64_t)webView:(id)a3 dragDestinationActionMaskForSession:(id)a4
{
  return 4294967291;
}

@end
