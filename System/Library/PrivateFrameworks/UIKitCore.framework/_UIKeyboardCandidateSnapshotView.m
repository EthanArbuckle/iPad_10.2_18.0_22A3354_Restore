@implementation _UIKeyboardCandidateSnapshotView

- (void)drawRect:(CGRect)a3
{
  _QWORD *ContextStack;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v4 = 0;
  else
    v4 = ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextClear();
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidateController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "candidateBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "renderInContext:", v4);
}

@end
