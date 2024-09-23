@implementation UITextIndirectKeyboardInteraction

- (UITextIndirectKeyboardInteraction)initWithView:(id)a3
{
  id v4;
  UITextIndirectKeyboardInteraction *v5;
  UITextIndirectKeyboardInteraction *v6;
  void *v7;
  void *v8;
  UITextIndirectEditableInteraction *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UITextIndirectKeyboardInteraction;
  v5 = -[UITextInteraction init](&v11, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    +[_UIKeyboardBasedTextSelectionGestureController sharedInstance](_UIKeyboardBasedTextSelectionGestureController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTwoFingerTextSelectionInteractionsToView:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[UITextInteraction addChild:](v6, "addChild:", v8);
    v9 = -[UITextIndirectEditableInteraction initWithView:]([UITextIndirectEditableInteraction alloc], "initWithView:", v4);
    -[UITextInteraction addChild:](v6, "addChild:", v9);

  }
  return v6;
}

- (void)setDisableTouchesForGestures:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  self->_disableTouchesForGestures = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[UITextInteraction gesturesForFailureRequirements](self, "gesturesForFailureRequirements", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    v8 = !v3;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setEnabled:", v8);
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (BOOL)disableTouchesForGestures
{
  return self->_disableTouchesForGestures;
}

@end
