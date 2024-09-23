@implementation UIKeyboard(IC)

+ (uint64_t)ic_isInFloatingKeyboardMode
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(MEMORY[0x1E0DC3958], "isFloating");
  else
    return 0;
}

+ (uint64_t)ic_isShiftKeyPressed
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "callLayoutIsShiftKeyBeingHeld");

  return v1;
}

+ (void)ic_suppressingShiftStateUpdates:()IC
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "suppressUpdateShiftState"))
  {
    v3[2](v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(v4, "setSuppressUpdateShiftState:", 1);
    v3[2](v3);
    v5 = (void *)MEMORY[0x1E0CD28B0];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __50__UIKeyboard_IC__ic_suppressingShiftStateUpdates___block_invoke;
    v6[3] = &unk_1E5C1D540;
    v7 = v4;
    objc_msgSend(v5, "setCompletionBlock:", v6);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }

}

@end
