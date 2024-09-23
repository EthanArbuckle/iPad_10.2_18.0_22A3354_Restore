@implementation UIKeyboardMotionSupport

- (BOOL)_matchingOptions:(id)a3
{
  return a3 == 0;
}

- (UIScreen)_intendedScreen
{
  return self->_screen;
}

- (id)_initWithScreen:(id)a3 options:(id)a4
{
  id v7;
  UIKeyboardMotionSupport *v8;
  UIKeyboardMotionSupport *v9;
  UIKeyboardMotionSupport *v10;
  objc_super v12;

  v7 = a3;
  if (a4)
  {
    v8 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIKeyboardMotionSupport;
    v9 = -[UIKeyboardMotionSupport init](&v12, sel_init);
    v10 = v9;
    if (v9)
      objc_storeStrong((id *)&v9->_screen, a3);
    self = v10;
    v8 = self;
  }

  return v8;
}

+ (id)supportForScreen:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Only subclasses of UIKeyboardMotionSupport should be instantiated"));
  +[_UIObjectPerScreen objectOfClass:forScreen:withOptions:createIfNecessary:](_UIObjectPerScreen, "objectOfClass:forScreen:withOptions:createIfNecessary:", a1, v4, 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setMasterController:(id)a3
{
  UISplitKeyboardSource *v4;
  UISplitKeyboardSource *controller;
  UISplitKeyboardSource *v6;
  UISplitKeyboardSource *v7;

  v4 = (UISplitKeyboardSource *)a3;
  controller = self->_controller;
  v7 = v4;
  if (controller == v4)
  {
    -[UIKeyboardMotionSupport _updatedController](self, "_updatedController");
    goto LABEL_7;
  }
  v6 = v4;
  if (controller)
  {
    -[UIKeyboardMotionSupport _disconnectingController:](self, "_disconnectingController:");
    v6 = v7;
  }
  if (v6)
  {
    -[UIKeyboardMotionSupport _connectController:](self, "_connectController:", v6);
LABEL_7:
    v6 = v7;
  }

}

- (void)_connectController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (void)_disconnectingController:(id)a3
{
  UISplitKeyboardSource *controller;

  controller = self->_controller;
  self->_controller = 0;

}

+ (id)supportForUIScene:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Only subclasses of UIKeyboardMotionSupport should be instantiated"));
  +[_UIObjectPerCanvas objectOfClass:forCanvas:withOptions:createIfNecessary:](_UIObjectPerCanvas, "objectOfClass:forCanvas:withOptions:createIfNecessary:", a1, v4, 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_initWithCanvas:(id)a3 options:(id)a4
{
  id v7;
  UIKeyboardMotionSupport *v8;
  UIKeyboardMotionSupport *v9;
  UIKeyboardMotionSupport *v10;
  objc_super v12;

  v7 = a3;
  if (a4)
  {
    v8 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIKeyboardMotionSupport;
    v9 = -[UIKeyboardMotionSupport init](&v12, sel_init);
    v10 = v9;
    if (v9)
      objc_storeStrong((id *)&v9->_canvas, a3);
    self = v10;
    v8 = self;
  }

  return v8;
}

- (NSDictionary)_options
{
  return 0;
}

- (id)_intendedCanvas
{
  return self->_canvas;
}

- (UISplitKeyboardSource)masterController
{
  return self->_controller;
}

- (void)translateToPlacement:(id)a3 quietly:(BOOL)a4 animated:(BOOL)a5
{
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  BOOL v31;
  BOOL v32;
  BOOL v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = -[UIKeyboardMotionSupport generateSplitNotificationForNewPlacement:](self, "generateSplitNotificationForNewPlacement:", v8);
  if (v8)
  {
    -[UISplitKeyboardSource placement](self->_controller, "placement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assistantView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v34[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboardImpl normalizedPersistentOffset](UIKeyboardImpl, "normalizedPersistentOffset");
      v14 = v13;
      v16 = v15;
      +[UIPeripheralHost floatingChromeBuffer](UIPeripheralHost, "floatingChromeBuffer");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
      +[UIKeyboardImpl floatingWidth](UIKeyboardImpl, "floatingWidth");
      +[UIInputViewSetPlacementFloating placementWithUndockedOffset:chromeBuffer:floatingWidth:](UIInputViewSetPlacementFloating, "placementWithUndockedOffset:chromeBuffer:floatingWidth:", v14, v16, v18, v20, v22, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "setSubPlacements:", v12);
      v8 = v26;
    }
  }
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __65__UIKeyboardMotionSupport_translateToPlacement_quietly_animated___block_invoke;
  v29[3] = &unk_1E16D74A8;
  v30 = v8;
  v31 = a4;
  v32 = a5;
  v33 = v9;
  v28 = v8;
  objc_msgSend(v27, "performOnLocalDistributedControllers:", v29);

}

uint64_t __65__UIKeyboardMotionSupport_translateToPlacement_quietly_animated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPlacement:quietly:animated:generateSplitNotification:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41), *(unsigned __int8 *)(a1 + 42));
}

- (void)translateToPlacement:(id)a3 animated:(BOOL)a4
{
  -[UIKeyboardMotionSupport translateToPlacement:quietly:animated:](self, "translateToPlacement:quietly:animated:", a3, 0, a4);
}

- (BOOL)generateSplitNotificationForNewPlacement:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_canvas, 0);
  objc_storeStrong((id *)&self->_screen, 0);
}

@end
