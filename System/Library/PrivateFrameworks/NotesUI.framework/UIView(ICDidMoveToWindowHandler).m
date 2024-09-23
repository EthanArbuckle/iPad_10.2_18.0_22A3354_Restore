@implementation UIView(ICDidMoveToWindowHandler)

- (void)ic_addDidMoveToWindowHandler:()ICDidMoveToWindowHandler
{
  id v4;
  void *v5;
  ICDidMoveToWindowSpy *v6;
  ICDidMoveToWindowSpy *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  objc_getAssociatedObject(a1, (const void *)ICDidMoveToWindowSpyKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[UIView(ICDidMoveToWindowHandler) ic_addDidMoveToWindowHandler:]", 1, 0, CFSTR("ICDidMoveToWindowSpyKey is already set"));
  }
  else
  {
    v6 = [ICDidMoveToWindowSpy alloc];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__UIView_ICDidMoveToWindowHandler__ic_addDidMoveToWindowHandler___block_invoke;
    v8[3] = &unk_1E5C1F6F0;
    v9 = v4;
    v7 = -[ICDidMoveToWindowSpy initWithOwner:handler:](v6, "initWithOwner:handler:", a1, v8);
    -[ICDidMoveToWindowSpy setHidden:](v7, "setHidden:", 1);
    objc_msgSend(a1, "addSubview:", v7);
    objc_setAssociatedObject(a1, (const void *)ICDidMoveToWindowSpyKey, v7, (void *)1);

  }
}

@end
