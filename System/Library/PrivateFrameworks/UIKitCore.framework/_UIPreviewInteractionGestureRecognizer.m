@implementation _UIPreviewInteractionGestureRecognizer

- (void)recognize
{
  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
    -[UIGestureRecognizer setState:](self, "setState:", 3);
}

- (void)cancel
{
  UIGestureRecognizerState v3;

  v3 = -[UIGestureRecognizer state](self, "state");
  if ((unint64_t)v3 <= UIGestureRecognizerStateChanged)
    -[UIGestureRecognizer setState:](self, "setState:", qword_186681E88[v3]);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[UIGestureRecognizer _allActiveTouches](self, "_allActiveTouches", a3, a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9), "phase") < 3)
        {

          return;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[_UIPreviewInteractionGestureRecognizer cancel](self, "cancel");
}

- (void)setDelegate:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIPreviewInteractionGestureRecognizer;
    -[UIGestureRecognizer setDelegate:](&v5, sel_setDelegate_, v4);
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("You cannot change the delegate of the UIViewControllerPreviewing failure relationship gesture recognizer"));
  }

}

@end
