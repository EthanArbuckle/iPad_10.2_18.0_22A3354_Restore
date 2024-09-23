@implementation SBScreenFlash

- (SBScreenFlash)initWithScreen:(id)a3
{
  id v5;
  SBScreenFlash *v6;
  SBScreenFlash *v7;
  NSMutableArray *v8;
  NSMutableArray *flashCompletionBlocks;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBScreenFlash;
  v6 = -[SBScreenFlash init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_screen, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    flashCompletionBlocks = v7->_flashCompletionBlocks;
    v7->_flashCompletionBlocks = v8;

  }
  return v7;
}

+ (id)mainScreenFlasher
{
  if (mainScreenFlasher___once != -1)
    dispatch_once(&mainScreenFlasher___once, &__block_literal_global_60);
  return (id)mainScreenFlasher___sharedInstance;
}

void __34__SBScreenFlash_mainScreenFlasher__block_invoke()
{
  SBScreenFlash *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [SBScreenFlash alloc];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[SBScreenFlash initWithScreen:](v0, "initWithScreen:", v3);
  v2 = (void *)mainScreenFlasher___sharedInstance;
  mainScreenFlasher___sharedInstance = v1;

}

- (void)flashWhiteWithCompletion:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CEA478];
  v5 = a3;
  objc_msgSend(v4, "whiteColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBScreenFlash flashColor:withCompletion:](self, "flashColor:withCompletion:", v6, v5);

}

- (void)flashColor:(id)a3 withCompletion:(id)a4
{
  NSMutableArray *flashCompletionBlocks;
  void *v7;
  id v8;

  v8 = a3;
  if (a4)
  {
    flashCompletionBlocks = self->_flashCompletionBlocks;
    v7 = (void *)objc_msgSend(a4, "copy");
    -[NSMutableArray addObject:](flashCompletionBlocks, "addObject:", v7);

  }
  -[SBScreenFlash _orderWindowFrontAndThenOut:withColor:](self, "_orderWindowFrontAndThenOut:withColor:", self, v8);

}

- (void)_createUIWithColor:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  SBSecureWindow *v8;
  UIWindow *flashWindow;
  void *v10;
  UIView *v11;
  UIView *flashView;
  id v13;

  if (!self->_flashWindow)
  {
    v4 = (void *)SBApp;
    v5 = a3;
    objc_msgSend(v4, "windowSceneManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScreen displayIdentity](self->_screen, "displayIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowSceneForDisplayIdentity:", v7);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v8 = -[SBWindow initWithWindowScene:role:debugName:]([SBSecureWindow alloc], "initWithWindowScene:role:debugName:", v13, CFSTR("SBTraitsParticipantRoleScreenFlash"), CFSTR("ScreenFlash"));
    flashWindow = self->_flashWindow;
    self->_flashWindow = &v8->super.super.super;

    -[UIWindow setWindowLevel:](self->_flashWindow, "setWindowLevel:", *MEMORY[0x1E0CEB660]);
    -[UIWindow setUserInteractionEnabled:](self->_flashWindow, "setUserInteractionEnabled:", 0);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB8]), "initWithNibName:bundle:", 0, 0);
    -[UIWindow setRootViewController:](self->_flashWindow, "setRootViewController:", v10);
    objc_msgSend(v10, "view");
    v11 = (UIView *)objc_claimAutoreleasedReturnValue();
    flashView = self->_flashView;
    self->_flashView = v11;

    -[UIView setBackgroundColor:](self->_flashView, "setBackgroundColor:", v5);
  }
}

- (void)_tearDown
{
  UIWindow *flashWindow;
  UIView *flashView;

  -[UIWindow setHidden:](self->_flashWindow, "setHidden:", 1);
  self->_windowVisible = 0;
  flashWindow = self->_flashWindow;
  self->_flashWindow = 0;

  flashView = self->_flashView;
  self->_flashView = 0;

}

- (void)_orderWindowOut:(id)a3
{
  id v4;
  UIView *flashView;
  double v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v4 = a3;
  flashView = self->_flashView;
  if (flashView)
  {
    -[UIView alpha](flashView, "alpha");
    if (v6 != 0.0)
    {
      v7[4] = self;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __33__SBScreenFlash__orderWindowOut___block_invoke;
      v8[3] = &unk_1E8E9DED8;
      v8[4] = self;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __33__SBScreenFlash__orderWindowOut___block_invoke_2;
      v7[3] = &unk_1E8E9E980;
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v8, v7, 1.0);
    }
  }

}

uint64_t __33__SBScreenFlash__orderWindowOut___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setAlpha:", 0.0);
}

void __33__SBScreenFlash__orderWindowOut___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3;
  BOOL v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 24))
    v4 = a2 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    objc_msgSend((id)v3, "_tearDown");
    v3 = *(_QWORD *)(a1 + 32);
  }
  v5 = (void *)objc_msgSend(*(id *)(v3 + 8), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
  if (objc_msgSend(v5, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)_orderWindowFrontAndThenOut:(id)a3 withColor:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__orderWindowOut_, 0);
  if (!self->_windowVisible)
  {
    if (self->_flashWindow)
    {
      -[UIView setAlpha:](self->_flashView, "setAlpha:", 1.0);
      -[UIView setBackgroundColor:](self->_flashView, "setBackgroundColor:", v5);
    }
    else
    {
      -[SBScreenFlash _createUIWithColor:](self, "_createUIWithColor:", v5);
    }
    -[UIWindow _orderFrontWithoutMakingKey](self->_flashWindow, "_orderFrontWithoutMakingKey");
    self->_windowVisible = 1;
  }
  v7[0] = *MEMORY[0x1E0C99860];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBScreenFlash performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__orderWindowOut_, 0, v6, 0.1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flashView, 0);
  objc_storeStrong((id *)&self->_flashWindow, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_flashCompletionBlocks, 0);
}

@end
