@implementation _UITextLayoutFragmentView

- (void)drawRect:(CGRect)a3
{
  _QWORD *ContextStack;
  CGContext *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  _QWORD v19[6];

  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v5 = 0;
  else
    v5 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  -[_UITextLayoutFragmentViewBase layoutFragment](self, "layoutFragment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutFragmentFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[_UITextLayoutFragmentViewBase clipRect](self, "clipRect");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __38___UITextLayoutFragmentView_drawRect___block_invoke;
  v19[3] = &unk_1E16B1888;
  v19[4] = self;
  v19[5] = v5;
  _UITextCanvasDrawWithFadedEdgesInContext(v5, v19, v8, v10, v12, v14, v15, v16, v17, v18);
}

@end
