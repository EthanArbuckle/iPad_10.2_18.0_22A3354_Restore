@implementation UIButton(PhotosUI)

- (uint64_t)pu_setRTLAwareContentEdgeInsets:()PhotosUI
{
  uint64_t v10;
  double v11;
  double v12;

  v10 = objc_msgSend(MEMORY[0x1E0C99DC8], "pu_currentCharacterDirection");
  if (v10 == 2)
    v11 = a5;
  else
    v11 = a3;
  if (v10 == 2)
    v12 = a3;
  else
    v12 = a5;
  return objc_msgSend(a1, "setContentEdgeInsets:", a2, v11, a4, v12);
}

- (void)pu_setTitle:()PhotosUI andAccessibilityTitle:withFallback:forState:
{
  id v10;
  void (**v11)(_QWORD);
  void (**v12)(_QWORD);
  void *v13;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (pu_setTitle_andAccessibilityTitle_withFallback_forState__onceToken == -1)
  {
    if (!v11)
      goto LABEL_5;
  }
  else
  {
    dispatch_once(&pu_setTitle_andAccessibilityTitle_withFallback_forState__onceToken, &__block_literal_global_105280);
    if (!v12)
      goto LABEL_5;
  }
  if (!objc_msgSend(v14, "length") || pu_setTitle_andAccessibilityTitle_withFallback_forState__forceFallback)
  {
    v12[2](v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setImage:forState:", v13, a6);

    v14 = 0;
    goto LABEL_7;
  }
LABEL_5:
  objc_msgSend(a1, "setImage:forState:", 0, a6);
LABEL_7:
  objc_msgSend(a1, "setTitle:forState:", v14, a6);
  objc_msgSend(a1, "setAccessibilityLabel:", v10);

}

- (void)pu_sendActionForControlEventsWithHighlightTimeout:()PhotosUI
{
  dispatch_time_t v2;
  _QWORD block[5];

  objc_msgSend(a1, "sendActionsForControlEvents:");
  objc_msgSend(a1, "setHighlighted:", 1);
  v2 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__UIButton_PhotosUI__pu_sendActionForControlEventsWithHighlightTimeout___block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = a1;
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
}

@end
