@implementation CACSpokenCommand

- (id)_elementActionManager
{
  if (_elementActionManager_onceToken != -1)
    dispatch_once(&_elementActionManager_onceToken, &__block_literal_global);
  return (id)_elementActionManager_sElementActionManager;
}

void __67__CACSpokenCommand_CACSpokenCommandGestures___elementActionManager__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x24BDFFA58]);
  +[CACAXDragManager sharedManager](CACAXDragManager, "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithDragManager:", v3);
  v2 = (void *)_elementActionManager_sElementActionManager;
  _elementActionManager_sElementActionManager = v1;

}

- (void)_handleGestureWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__CACSpokenCommand_CACSpokenCommandGestures___handleGestureWithBlock___block_invoke;
  v6[3] = &unk_24F2AA9B8;
  v7 = v4;
  v5 = v4;
  -[CACSpokenCommand handleLabeledElementFromNameOrNumberWithBlock:](self, "handleLabeledElementFromNameOrNumberWithBlock:", v6);

}

void __70__CACSpokenCommand_CACSpokenCommandGestures___handleGestureWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __70__CACSpokenCommand_CACSpokenCommandGestures___handleGestureWithBlock___block_invoke_2;
  v5[3] = &unk_24F2AA990;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

uint64_t __70__CACSpokenCommand_CACSpokenCommandGestures___handleGestureWithBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  objc_msgSend(*(id *)(a1 + 32), "element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "element");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visibleFrame");
    AX_CGRectGetCenter();
    v6 = v5;
    v8 = v7;

  }
  else
  {
    objc_msgSend(v3, "rectangle");
    AX_CGRectGetCenter();
    v6 = v9;
    v8 = v10;
  }
  return (*(uint64_t (**)(_QWORD, uint64_t, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "displayID"), v6, v8);
}

- (void)_handleTwoPointGestureWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __78__CACSpokenCommand_CACSpokenCommandGestures___handleTwoPointGestureWithBlock___block_invoke;
  v6[3] = &unk_24F2AAA08;
  v7 = v4;
  v5 = v4;
  -[CACSpokenCommand handleLabeledElementsFromTwoNumbersWithBlock:](self, "handleLabeledElementsFromTwoNumbersWithBlock:", v6);

}

void __78__CACSpokenCommand_CACSpokenCommandGestures___handleTwoPointGestureWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__CACSpokenCommand_CACSpokenCommandGestures___handleTwoPointGestureWithBlock___block_invoke_2;
  block[3] = &unk_24F2AA9E0;
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 32);
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __78__CACSpokenCommand_CACSpokenCommandGestures___handleTwoPointGestureWithBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  objc_msgSend(*(id *)(a1 + 32), "element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "element");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visibleFrame");
    AX_CGRectGetCenter();
    v6 = v5;
    v8 = v7;

  }
  else
  {
    objc_msgSend(v3, "rectangle");
    AX_CGRectGetCenter();
    v6 = v9;
    v8 = v10;
  }
  objc_msgSend(*(id *)(a1 + 40), "element");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *(void **)(a1 + 40);
  if (v11)
  {
    objc_msgSend(v12, "element");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "visibleFrame");
    AX_CGRectGetCenter();
    v15 = v14;
    v17 = v16;

  }
  else
  {
    objc_msgSend(v12, "rectangle");
    AX_CGRectGetCenter();
    v15 = v18;
    v17 = v19;
  }
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, double, double, double, double))(*(_QWORD *)(a1 + 48)
                                                                                             + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "displayID"), objc_msgSend(*(id *)(a1 + 40), "displayID"), v6, v8, v15, v17);
}

- (void)zoomIn
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_180);
}

void __52__CACSpokenCommand_CACSpokenCommandGestures__zoomIn__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performPinchOutGestureAtPoint:", a1, a2);

}

- (void)zoomOut
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_182);
}

void __53__CACSpokenCommand_CACSpokenCommandGestures__zoomOut__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performPinchInGestureAtPoint:", a1, a2);

}

- (void)rotateRight
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_183);
}

void __57__CACSpokenCommand_CACSpokenCommandGestures__rotateRight__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performRotateRightGestureAtPoint:", a1, a2);

}

- (void)rotateLeft
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_184);
}

void __56__CACSpokenCommand_CACSpokenCommandGestures__rotateLeft__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performRotateLeftGestureAtPoint:", a1, a2);

}

- (void)swipeUp
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  +[CACSpokenCommandGestureManager allManagers](CACSpokenCommandGestureManager, "allManagers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "isIn3DTouchGesture"))
        {
          objc_msgSend(v8, "reveal3DTouchActions");

          return;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }

  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_185);
}

void __53__CACSpokenCommand_CACSpokenCommandGestures__swipeUp__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 2, 1, 1, a1, a2);

}

- (void)swipeDown
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_186);
}

void __55__CACSpokenCommand_CACSpokenCommandGestures__swipeDown__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 3, 1, 1, a1, a2);

}

- (void)swipeLeft
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_187);
}

void __55__CACSpokenCommand_CACSpokenCommandGestures__swipeLeft__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 0, 1, 1, a1, a2);

}

- (void)swipeRight
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_188);
}

void __56__CACSpokenCommand_CACSpokenCommandGestures__swipeRight__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 1, 1, 1, a1, a2);

}

- (void)panUp
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_189);
}

void __51__CACSpokenCommand_CACSpokenCommandGestures__panUp__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 2, 0, 1, a1, a2);

}

- (void)panDown
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_190);
}

void __53__CACSpokenCommand_CACSpokenCommandGestures__panDown__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 3, 0, 1, a1, a2);

}

- (void)panLeft
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_191);
}

void __53__CACSpokenCommand_CACSpokenCommandGestures__panLeft__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 0, 0, 1, a1, a2);

}

- (void)panRight
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_192);
}

void __54__CACSpokenCommand_CACSpokenCommandGestures__panRight__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 1, 0, 1, a1, a2);

}

- (void)twoFingerSwipeUp
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_193);
}

void __62__CACSpokenCommand_CACSpokenCommandGestures__twoFingerSwipeUp__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 2, 1, 2, a1, a2);

}

- (void)twoFingerSwipeDown
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_194);
}

void __64__CACSpokenCommand_CACSpokenCommandGestures__twoFingerSwipeDown__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 3, 1, 2, a1, a2);

}

- (void)twoFingerSwipeLeft
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_195);
}

void __64__CACSpokenCommand_CACSpokenCommandGestures__twoFingerSwipeLeft__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 0, 1, 2, a1, a2);

}

- (void)twoFingerSwipeRight
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_196);
}

void __65__CACSpokenCommand_CACSpokenCommandGestures__twoFingerSwipeRight__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 1, 1, 2, a1, a2);

}

- (void)twoFingerPanUp
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_197);
}

void __60__CACSpokenCommand_CACSpokenCommandGestures__twoFingerPanUp__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 2, 0, 2, a1, a2);

}

- (void)twoFingerPanDown
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_198);
}

void __62__CACSpokenCommand_CACSpokenCommandGestures__twoFingerPanDown__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 3, 0, 2, a1, a2);

}

- (void)twoFingerPanLeft
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_199);
}

void __62__CACSpokenCommand_CACSpokenCommandGestures__twoFingerPanLeft__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 0, 0, 2, a1, a2);

}

- (void)twoFingerPanRight
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_200);
}

void __63__CACSpokenCommand_CACSpokenCommandGestures__twoFingerPanRight__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 1, 0, 2, a1, a2);

}

- (void)doubleTap
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_201);
}

void __55__CACSpokenCommand_CACSpokenCommandGestures__doubleTap__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performDoubleTapAtPoint:numberOfFingers:", 1, a1, a2);

}

- (void)twoFingerDoubleTap
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_202);
}

void __64__CACSpokenCommand_CACSpokenCommandGestures__twoFingerDoubleTap__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performDoubleTapAtPoint:numberOfFingers:", 2, a1, a2);

}

- (void)tap
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_203);
}

void __49__CACSpokenCommand_CACSpokenCommandGestures__tap__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performTapAtPoint:numberOfFingers:", 1, a1, a2);

}

- (void)twoFingerTap
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_204);
}

void __58__CACSpokenCommand_CACSpokenCommandGestures__twoFingerTap__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performTapAtPoint:numberOfFingers:", 2, a1, a2);

}

- (id)_dragActionForLabeledElement:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "element");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACSpokenCommand _axActionOfType:forElement:](self, "_axActionOfType:forElement:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_dropActionForLabeledElement:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "element");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACSpokenCommand _axActionOfType:forElement:](self, "_axActionOfType:forElement:", 2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_axActionOfType:(int64_t)a3 forElement:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[5];

  if (!a4)
    return 0;
  v6 = a4;
  -[CACSpokenCommand _elementActionManager](self, "_elementActionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionsForElement:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count")
    && (v12[0] = MEMORY[0x24BDAC760],
        v12[1] = 3221225472,
        v12[2] = __73__CACSpokenCommand_CACSpokenCommandGestures___axActionOfType_forElement___block_invoke,
        v12[3] = &__block_descriptor_40_e32_B32__0__AXElementAction_8Q16_B24l,
        v12[4] = a3,
        v9 = objc_msgSend(v8, "indexOfObjectPassingTest:", v12),
        v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

BOOL __73__CACSpokenCommand_CACSpokenCommandGestures___axActionOfType_forElement___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == *(_QWORD *)(a1 + 32);
}

- (BOOL)_startDragForLabeledElement:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  -[CACSpokenCommand _dragActionForLabeledElement:](self, "_dragActionForLabeledElement:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CACSpokenCommand _elementActionManager](self, "_elementActionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "performAction:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_endDragForLabeledElement:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  -[CACSpokenCommand _dropActionForLabeledElement:](self, "_dropActionForLabeledElement:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CACSpokenCommand _elementActionManager](self, "_elementActionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "performAction:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)startDrag
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __55__CACSpokenCommand_CACSpokenCommandGestures__startDrag__block_invoke;
  v2[3] = &unk_24F2AADB8;
  v2[4] = self;
  -[CACSpokenCommand handleLabeledElementFromNameOrNumberWithBlock:](self, "handleLabeledElementFromNameOrNumberWithBlock:", v2);
}

void __55__CACSpokenCommand_CACSpokenCommandGestures__startDrag__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_dragActionForLabeledElement:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __55__CACSpokenCommand_CACSpokenCommandGestures__startDrag__block_invoke_2;
    v5[3] = &unk_24F2AAD70;
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleGestureWithBlock:", &__block_literal_global_206);
  }

}

uint64_t __55__CACSpokenCommand_CACSpokenCommandGestures__startDrag__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startDragForLabeledElement:", *(_QWORD *)(a1 + 40));
}

void __55__CACSpokenCommand_CACSpokenCommandGestures__startDrag__block_invoke_3(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDragAtPoint:", a1, a2);

}

- (void)startHoldAndDrag
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_207);
}

void __62__CACSpokenCommand_CACSpokenCommandGestures__startHoldAndDrag__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startHoldAndDragAtPoint:", a1, a2);

}

- (void)endDrag
{
  void *v3;
  int v4;
  _QWORD v5[5];

  +[CACAXDragManager sharedManager](CACAXDragManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDragActive");

  if (v4)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __53__CACSpokenCommand_CACSpokenCommandGestures__endDrag__block_invoke;
    v5[3] = &unk_24F2AADB8;
    v5[4] = self;
    -[CACSpokenCommand handleLabeledElementFromNameOrNumberWithBlock:](self, "handleLabeledElementFromNameOrNumberWithBlock:", v5);
  }
  else
  {
    -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_210);
  }
}

void __53__CACSpokenCommand_CACSpokenCommandGestures__endDrag__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_dropActionForLabeledElement:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __53__CACSpokenCommand_CACSpokenCommandGestures__endDrag__block_invoke_2;
    v5[3] = &unk_24F2AAD70;
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleGestureWithBlock:", &__block_literal_global_208);
  }

}

uint64_t __53__CACSpokenCommand_CACSpokenCommandGestures__endDrag__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endDragForLabeledElement:", *(_QWORD *)(a1 + 40));
}

void __53__CACSpokenCommand_CACSpokenCommandGestures__endDrag__block_invoke_3(double a1, double a2)
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __53__CACSpokenCommand_CACSpokenCommandGestures__endDrag__block_invoke_4;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  *(double *)&v2[4] = a1;
  *(double *)&v2[5] = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
}

void __53__CACSpokenCommand_CACSpokenCommandGestures__endDrag__block_invoke_4(uint64_t a1)
{
  id v2;

  +[CACAXDragManager sharedManager](CACAXDragManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moveToAndDropAtPoint:", *(double *)(a1 + 32), *(double *)(a1 + 40));

}

void __53__CACSpokenCommand_CACSpokenCommandGestures__endDrag__block_invoke_5(double a1, double a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  int v8;
  NSObject *v9;
  id v10;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isInGesture");

  if (v8)
  {
    +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDragAtPoint:", a1, a2);

  }
  else
  {
    CACLogGeneral();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __53__CACSpokenCommand_CACSpokenCommandGestures__endDrag__block_invoke_5_cold_1(v9);

  }
}

- (void)dragFromPointToPoint
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __66__CACSpokenCommand_CACSpokenCommandGestures__dragFromPointToPoint__block_invoke;
  v2[3] = &unk_24F2AAEE8;
  v2[4] = self;
  -[CACSpokenCommand handleLabeledElementsFromTwoNumbersWithBlock:](self, "handleLabeledElementsFromTwoNumbersWithBlock:", v2);
}

void __66__CACSpokenCommand_CACSpokenCommandGestures__dragFromPointToPoint__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD block[5];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_dragActionForLabeledElement:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__CACSpokenCommand_CACSpokenCommandGestures__dragFromPointToPoint__block_invoke_2;
    block[3] = &unk_24F2AAEA0;
    block[4] = *(_QWORD *)(a1 + 32);
    v9 = v5;
    v10 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleTwoPointGestureWithBlock:", &__block_literal_global_213);
  }

}

void __66__CACSpokenCommand_CACSpokenCommandGestures__dragFromPointToPoint__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD v3[5];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_startDragForLabeledElement:", *(_QWORD *)(a1 + 40));
  v2 = dispatch_time(0, 1000000000);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __66__CACSpokenCommand_CACSpokenCommandGestures__dragFromPointToPoint__block_invoke_3;
  v3[3] = &unk_24F2AAD70;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 48);
  dispatch_after(v2, MEMORY[0x24BDAC9B8], v3);

}

void __66__CACSpokenCommand_CACSpokenCommandGestures__dragFromPointToPoint__block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  +[CACAXDragManager sharedManager](CACAXDragManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDragActive");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_dropActionForLabeledElement:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __66__CACSpokenCommand_CACSpokenCommandGestures__dragFromPointToPoint__block_invoke_4;
      v6[3] = &unk_24F2AAD70;
      v5 = *(void **)(a1 + 40);
      v6[4] = *(_QWORD *)(a1 + 32);
      v7 = v5;
      dispatch_async(MEMORY[0x24BDAC9B8], v6);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_handleTwoPointGestureWithBlock:", &__block_literal_global_212);
    }

  }
}

uint64_t __66__CACSpokenCommand_CACSpokenCommandGestures__dragFromPointToPoint__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endDragForLabeledElement:", *(_QWORD *)(a1 + 40));
}

void __66__CACSpokenCommand_CACSpokenCommandGestures__dragFromPointToPoint__block_invoke_5(double a1, double a2, double a3, double a4)
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __66__CACSpokenCommand_CACSpokenCommandGestures__dragFromPointToPoint__block_invoke_6;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  *(double *)&v4[4] = a3;
  *(double *)&v4[5] = a4;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);
}

void __66__CACSpokenCommand_CACSpokenCommandGestures__dragFromPointToPoint__block_invoke_6(uint64_t a1)
{
  id v2;

  +[CACAXDragManager sharedManager](CACAXDragManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moveToAndDropAtPoint:", *(double *)(a1 + 32), *(double *)(a1 + 40));

}

void __66__CACSpokenCommand_CACSpokenCommandGestures__dragFromPointToPoint__block_invoke_7(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6)
{
  void *v11;
  void *v12;
  int v13;
  id v14;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startDragAtPoint:", a1, a2);

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isInGesture");

  if (v13)
  {
    +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a6);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endDragAtPoint:", a3, a4);

  }
}

- (void)cancelGesture
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  +[CACSpokenCommandGestureManager allManagers](CACSpokenCommandGestureManager, "allManagers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6++), "resetState");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  +[CACAXDragManager sharedManager](CACAXDragManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isDragActive");

  if (v8)
    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_214);
}

void __59__CACSpokenCommand_CACSpokenCommandGestures__cancelGesture__block_invoke()
{
  id v0;

  +[CACAXDragManager sharedManager](CACAXDragManager, "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "cancelDrag");

}

- (void)longPress
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_215);
}

void __55__CACSpokenCommand_CACSpokenCommandGestures__longPress__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performLongPressAtPoint:numberOfFingers:", 1, a1, a2);

}

- (void)twoFingerLongPress
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_216);
}

void __64__CACSpokenCommand_CACSpokenCommandGestures__twoFingerLongPress__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performLongPressAtPoint:numberOfFingers:", 2, a1, a2);

}

- (void)start3DTouch
{
  -[CACSpokenCommand _handleGestureWithBlock:](self, "_handleGestureWithBlock:", &__block_literal_global_217);
}

void __58__CACSpokenCommand_CACSpokenCommandGestures__start3DTouch__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  id v7;

  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE00680], "forceTouchGestureAtPoint:", a1, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performGesture:", v6);

}

- (void)_postKeyboardEventsForModifierFlags:(unsigned int)a3 isKeyDown:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int v14;
  void *v15;
  unsigned __int16 v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _QWORD v24[5];
  _QWORD v25[7];

  v4 = a4;
  v25[5] = *MEMORY[0x24BDAC8D0];
  v24[0] = &unk_24F2CE8C0;
  v24[1] = &unk_24F2CE8F0;
  v25[0] = &unk_24F2CE8D8;
  v25[1] = &unk_24F2CE908;
  v24[2] = &unk_24F2CE920;
  v24[3] = &unk_24F2CE950;
  v25[2] = &unk_24F2CE938;
  v25[3] = &unk_24F2CE968;
  v24[4] = &unk_24F2CE980;
  v25[4] = &unk_24F2CE998;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v6, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      if (v4)
        LODWORD(v10) = 0;
      else
        LODWORD(v10) = a3;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "unsignedIntValue");
          objc_msgSend(v7, "objectForKey:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "unsignedIntValue");

          if ((v14 & a3) != 0)
          {
            if (v4)
              v10 = v14 | v10;
            else
              v10 = v10 & ~v14;
            -[CACSpokenCommand postKeyboardEventWithKeyCode:modifierFlags:isKeyDown:](self, "postKeyboardEventWithKeyCode:modifierFlags:isKeyDown:", v16, v10, v4);
          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

  }
}

- (void)postKeyboardEventWithKeyCode:(unsigned __int16)a3 modifierFlags:(unsigned int)a4 isKeyDown:(BOOL)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)&a4;
  v6 = a3;
  if (a5)
    v7 = 10;
  else
    v7 = 11;
  objc_msgSend(MEMORY[0x24BE00630], "keyRepresentationWithType:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keyInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setKeyCode:", v6);
  objc_msgSend(v8, "setModifierState:", v5);
  objc_msgSend(v8, "setUnmodifiedInput:", &stru_24F2ADCC8);
  objc_msgSend(v8, "setModifiedInput:", &stru_24F2ADCC8);
  objc_msgSend(MEMORY[0x24BE005C0], "server");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postEvent:systemEvent:", v10, 0);

  usleep(0x3E8u);
}

- (void)pressKeyboardKey
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unsigned __int16 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BEAFF00]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasPrefix:", CFSTR("KeyboardKeyName.")))
        {
          +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setRecognizedCommandIdentifier:", v10);

          objc_msgSend(v4, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  v13 = -[CACSpokenCommand _getModifierFlag](self, "_getModifierFlag");
  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BEAFF10]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", kCACCommandParameterText);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = (int)objc_msgSend(v16, "intValue");
  else
    v17 = 1;
  objc_msgSend(v11, "objectForKey:", kCACCommandParameterHIDKeyCode);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18 && v17 >= 1)
  {
    v19 = v17;
    do
    {
      objc_msgSend(v11, "objectForKey:", kCACCommandParameterHIDKeyCode);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "integerValue");

      if ((_DWORD)v13)
      {
        -[CACSpokenCommand _postKeyboardEventsForModifierFlags:isKeyDown:](self, "_postKeyboardEventsForModifierFlags:isKeyDown:", v13, 1);
        -[CACSpokenCommand postKeyboardEventWithKeyCode:modifierFlags:isKeyDown:](self, "postKeyboardEventWithKeyCode:modifierFlags:isKeyDown:", v21, v13, 1);
        -[CACSpokenCommand postKeyboardEventWithKeyCode:modifierFlags:isKeyDown:](self, "postKeyboardEventWithKeyCode:modifierFlags:isKeyDown:", v21, v13, 0);
        -[CACSpokenCommand _postKeyboardEventsForModifierFlags:isKeyDown:](self, "_postKeyboardEventsForModifierFlags:isKeyDown:", v13, 0);
      }
      else
      {
        -[CACSpokenCommand postKeyboardEventWithKeyCode:modifierFlags:isKeyDown:](self, "postKeyboardEventWithKeyCode:modifierFlags:isKeyDown:", v21, 0, 1);
        -[CACSpokenCommand postKeyboardEventWithKeyCode:modifierFlags:isKeyDown:](self, "postKeyboardEventWithKeyCode:modifierFlags:isKeyDown:", v21, 0, 0);
      }
      if ((unint64_t)v17 >= 2)
        usleep(0xC350u);
      --v19;
    }
    while (v19);
  }

}

- (unsigned)_getModifierFlag
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id obj;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BEAFF08]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", kCACCommandParameterTextSequence);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "objectForKey:", kCACCommandParameterBuiltInIdentifier);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v6, "appendString:", v12);
          objc_msgSend(v6, "appendString:", CFSTR(","));
        }
        if ((objc_msgSend(v12, "hasPrefix:", CFSTR("ModifierKeyName.")) & 1) != 0
          || objc_msgSend(v12, "hasPrefix:", CFSTR("ClickModifierName.")))
        {
          objc_msgSend(v21, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", kCACCommandParameterAXModifierFlag);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "unsignedIntegerValue");

          v9 |= v15;
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "mutableCopy");

    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setRecognizedCommandIdentifier:", v17);

    v6 = (id)v17;
  }

  return v9;
}

- (void)voSelect
{
  -[CACSpokenCommand handleLabeledElementFromNameOrNumberWithBlock:](self, "handleLabeledElementFromNameOrNumberWithBlock:", &__block_literal_global_8);
}

void __39__CACSpokenCommand_VoiceOver__voSelect__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  UIAccessibilityNotifications v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *MEMORY[0x24BEBB030];
    objc_msgSend(v6, "element");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uiElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v3, (id)objc_msgSend(v5, "axElement"));

  }
}

- (void)voSelectFirstItem
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00770], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerCommand:", 10);

}

- (void)voSelectLastItem
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00770], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerCommand:", 11);

}

- (void)voSelectNextApp
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00770], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerCommand:", 36);

}

- (void)voSelectPreviousApp
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00770], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerCommand:", 37);

}

- (void)voToggleScreenCurtain
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00770], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerCommand:", 2);

}

- (void)voStopSpeaking
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00770], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerCommand:", 20);

}

- (void)voShowItemChooser
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00770], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerCommand:", 18);

}

- (void)voSelectStatusBar
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00770], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerCommand:", 12);

}

- (void)voSpeakSummary
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00770], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerCommand:", 7);

}

- (void)voMagicTap
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00770], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerCommand:", 28);

}

- (void)voActivate
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00770], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerCommand:", 19);

}

- (void)voSelectNextItem
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00770], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerCommand:", 9);

}

- (void)voSelectPreviousItem
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00770], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerCommand:", 8);

}

- (void)voSelectNextRotor
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00770], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerCommand:", 14);

}

- (void)voSelectPreviousRotor
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00770], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerCommand:", 15);

}

- (void)voSelectNextRotorOption
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00770], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerCommand:", 17);

}

- (void)voSelectPreviousRotorOption
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00770], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerCommand:", 16);

}

- (void)voReadAll
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00770], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerCommand:", 38);

}

+ (double)defaultDelayBetweenCommands
{
  return 0.75;
}

+ (id)stringFromContextEvaluationDictionary:(id)a3 isCustom:(BOOL)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  _BOOL4 v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v19 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v4, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v4, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "description");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@_%@"), v10, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v14);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  if (!objc_msgSend(v5, "count"))
  {
    if (v19)
      v15 = CFSTR("CustomDefaultRecognizer");
    else
      v15 = CFSTR("DefaultRecognizer");
    objc_msgSend(v5, "addObject:", v15);
  }
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "componentsJoinedByString:", CFSTR("_"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)attributedStringFromRecognizedCommandParameters:(id)a3 variantOverrides:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v37;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v39 = a4;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "objectForKey:", kCACCommandParameterTextSequence);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v37 = v7;
    v38 = v5;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (!v9)
      goto LABEL_29;
    v10 = v9;
    v11 = *(_QWORD *)v41;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKey:", kCACCommandParameterBuiltInIdentifier);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", kCACCommandParameterText);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v14)
        {
          objc_msgSend(v39, "objectForKey:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v18 = v17;

              v16 = v18;
LABEL_22:
              if (objc_msgSend(v6, "length"))
              {
                +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "doesCurrentLanguageSupportInterWordSpaces");

                if (v27)
                {
                  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR(" "));
                  objc_msgSend(v6, "appendAttributedString:", v28);

                }
              }
              v29 = objc_alloc(MEMORY[0x24BDD1458]);
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\x1B‘%@’"), v16);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = (void *)objc_msgSend(v29, "initWithString:attributes:", v30, 0);
              objc_msgSend(v6, "appendAttributedString:", v31);

              goto LABEL_26;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v22 = objc_msgSend(v17, "BOOLValue");
              objc_msgSend(v38, "objectForKey:", kCACCommandParameterTextVariants);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v23;
              if (v22 && objc_msgSend(v23, "count") > (unint64_t)v22)
              {
                objc_msgSend(v24, "objectAtIndex:", v22);
                v25 = objc_claimAutoreleasedReturnValue();

                v16 = (void *)v25;
              }

            }
          }
          if (v16)
            goto LABEL_22;
        }
        else
        {
          if (!v15)
            goto LABEL_27;
          if (objc_msgSend(v6, "length"))
          {
            +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "doesCurrentLanguageSupportInterWordSpaces");

            if (v20)
            {
              v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", CFSTR(" "), 0);
              objc_msgSend(v6, "appendAttributedString:", v21);

            }
          }
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v16, 0);
          objc_msgSend(v6, "appendAttributedString:", v17);
        }
LABEL_26:

LABEL_27:
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (!v10)
      {
LABEL_29:

        v7 = v37;
        v5 = v38;
        goto LABEL_32;
      }
    }
  }
  objc_msgSend(v5, "objectForKey:", kCACCommandParameterText);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    v33 = objc_alloc(MEMORY[0x24BDD1688]);
    objc_msgSend(v5, "objectForKey:", kCACCommandParameterText);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "initWithString:", v34);

    v6 = (void *)v35;
  }
LABEL_32:

  return v6;
}

+ (void)displayRecognizedMessageUsingAttributedString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  void **v11;
  NSObject *v12;
  void *v13;
  char v14;
  dispatch_semaphore_t v15;
  void *v16;
  void *v17;
  dispatch_time_t v18;
  NSObject *v19;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  _QWORD block[4];
  id v25;

  v3 = a3;
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "playSoundUponRecognition"))
  {

LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLForResource:withExtension:", CFSTR("DefaultRecognitionSound"), CFSTR("aiff"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "carPlayConnected");

    if (v10)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __66__CACSpokenCommand_displayRecognizedMessageUsingAttributedString___block_invoke;
      block[3] = &unk_24F2AA860;
      v11 = &v25;
      v25 = v4;
      if (displayRecognizedMessageUsingAttributedString__recSoundInit != -1)
        dispatch_once(&displayRecognizedMessageUsingAttributedString__recSoundInit, block);
      AudioServicesPlaySystemSoundWithOptions();
    }
    else
    {
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __66__CACSpokenCommand_displayRecognizedMessageUsingAttributedString___block_invoke_3;
      v22[3] = &unk_24F2AA860;
      v11 = &v23;
      v23 = v4;
      if (displayRecognizedMessageUsingAttributedString__recSoundInit_321 != -1)
        dispatch_once(&displayRecognizedMessageUsingAttributedString__recSoundInit_321, v22);
      if (displayRecognizedMessageUsingAttributedString__gRecognizedAudioPlayer)
        objc_msgSend((id)displayRecognizedMessageUsingAttributedString__gRecognizedAudioPlayer, "play");
    }
    v5 = *v11;
    goto LABEL_14;
  }
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "carPlayConnected"))
  {
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "carPlayConnectedWirelessly");

    if ((v7 & 1) != 0)
      goto LABEL_15;
    goto LABEL_5;
  }
LABEL_14:

LABEL_15:
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject showTextResponseUponRecognition](v12, "showTextResponseUponRecognition"))
  {
LABEL_22:

    goto LABEL_23;
  }
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "carPlayConnected");

  if ((v14 & 1) == 0)
  {
    v15 = dispatch_semaphore_create(0);
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __66__CACSpokenCommand_displayRecognizedMessageUsingAttributedString___block_invoke_4;
    v20[3] = &unk_24F2AA860;
    v12 = v15;
    v21 = v12;
    objc_msgSend(v16, "displayMessageString:type:announcementCompletion:", v17, 2, v20);

    v18 = dispatch_time(0, 15000000000);
    if (dispatch_semaphore_wait(v12, v18))
    {
      CACLogAccessibility();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        +[CACSpokenCommand displayRecognizedMessageUsingAttributedString:].cold.1(v3, v19);

    }
    goto LABEL_22;
  }
LABEL_23:

}

void __66__CACSpokenCommand_displayRecognizedMessageUsingAttributedString___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BDB6D20], 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  AudioServicesCreateSystemSoundIDWithOptions();
  v1 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1111);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDB6D30];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithObjectsAndKeys:", v2, v3, v4, *MEMORY[0x24BDB6D38], 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)displayRecognizedMessageUsingAttributedString__playSSOptions;
  displayRecognizedMessageUsingAttributedString__playSSOptions = v5;

}

void __66__CACSpokenCommand_displayRecognizedMessageUsingAttributedString___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDB1848]), "initWithContentsOfURL:error:", *(_QWORD *)(a1 + 32), 0);
  v2 = (void *)displayRecognizedMessageUsingAttributedString__gRecognizedAudioPlayer;
  displayRecognizedMessageUsingAttributedString__gRecognizedAudioPlayer = v1;

  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCategory:error:", *MEMORY[0x24BDB1598], 0);

}

intptr_t __66__CACSpokenCommand_displayRecognizedMessageUsingAttributedString___block_invoke_4(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)languageModelFromCommandDictionary:(id)a3 tokenResolution:(id)a4 containsBuiltInIdentifier:(BOOL *)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  CACLanguageModel *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  CACLanguageModel *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BEAFF80]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (!v12)
  {
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BEAFF88]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByTrimmingCharactersInSet:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v23, "length")
      || (objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BEAFF70]),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v25 = objc_msgSend(v24, "count"),
          v24,
          v25))
    {
      v26 = [CACLanguageModel alloc];
      objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BEAFF78]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BEAFF68]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[CACLanguageModel initWithText:identifier:attributes:](v26, "initWithText:identifier:attributes:", v23, v27, v28);

      if (v15)
      {
        v36 = v16;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v37 = v9;
        objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BEAFF70]);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v31; ++i)
            {
              if (*(_QWORD *)v39 != v32)
                objc_enumerationMutation(v29);
              +[CACSpokenCommand languageModelFromCommandDictionary:tokenResolution:containsBuiltInIdentifier:error:](CACSpokenCommand, "languageModelFromCommandDictionary:tokenResolution:containsBuiltInIdentifier:error:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i), v10, a5, a6);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              if (v34)
                -[CACLanguageModel addChildLanguageModel:](v15, "addChildLanguageModel:", v34);

            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          }
          while (v31);
        }

        v16 = v36;
        v9 = v37;
      }
    }
    else
    {
      v15 = 0;
    }

    goto LABEL_31;
  }
  if (a5)
    *a5 = 1;
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BEAFF78]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "languageModelForBuiltInLMIdentifier:", v14);
  v15 = (CACLanguageModel *)objc_claimAutoreleasedReturnValue();

  if (v10 && !objc_msgSend(v10, "count"))
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    -[CACLanguageModel children](v15, "children");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v43 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "text");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            objc_msgSend(v10, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v18);
    }
LABEL_31:

  }
  return v15;
}

- (CACSpokenCommand)initWithProperties:(id)a3
{
  id v4;
  CACSpokenCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  BOOL v25;
  CACSpokenCommand *v26;
  NSObject *v28;
  NSString *identifier;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  uint8_t buf[4];
  NSString *v37;
  __int16 v38;
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CACSpokenCommand;
  v5 = -[CACSpokenCommand init](&v35, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    -[CACSpokenCommand setContextEvaluation:](v5, "setContextEvaluation:", v6);

    if (v4)
    {
      objc_msgSend(v4, "objectForKey:", kCACCommandPropertyIdentifier);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CACSpokenCommand setIdentifier:](v5, "setIdentifier:", v7);

      objc_msgSend(v4, "objectForKey:", kCACCommandPropertyStrings);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CACSpokenCommand setStrings:](v5, "setStrings:", v8);

      objc_msgSend(v4, "objectForKey:", CFSTR("ActionMethod"));
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
        -[CACSpokenCommand setAction:](v5, "setAction:", NSSelectorFromString(v9));
      objc_msgSend(v4, "objectForKey:", CFSTR("ContextEvaluation"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[CACSpokenCommand contextEvaluation](v5, "contextEvaluation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v4;
        objc_msgSend(v4, "objectForKey:", CFSTR("ContextEvaluation"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addEntriesFromDictionary:", v13);

        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        -[CACSpokenCommand contextEvaluation](v5, "contextEvaluation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "allKeys");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v32;
          while (2)
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v32 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
              +[CACSpokenCommandManager hardwareEvaluatorKeys](CACSpokenCommandManager, "hardwareEvaluatorKeys");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "containsObject:", v20);

              if (v22)
              {
                -[CACSpokenCommand contextEvaluation](v5, "contextEvaluation");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "objectForKey:", v20);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = +[CACSpokenCommandManager doesEvaluatorKey:matchValue:](CACSpokenCommandManager, "doesEvaluatorKey:matchValue:", v20, v24);

                if (!v25)
                {
                  CACLogAccessibility();
                  v28 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                  {
                    identifier = v5->_identifier;
                    *(_DWORD *)buf = 138412546;
                    v37 = identifier;
                    v38 = 2112;
                    v39 = v20;
                    _os_log_impl(&dword_229A40000, v28, OS_LOG_TYPE_INFO, "Removing command %@ for failing evaluator %@", buf, 0x16u);
                  }

                  v26 = 0;
                  v4 = v30;
                  goto LABEL_18;
                }
              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
            if (v17)
              continue;
            break;
          }
        }

        v4 = v30;
      }

    }
  }
  v26 = v5;
LABEL_18:

  return v26;
}

- (CACSpokenCommand)initWithSpokenCommand:(id)a3
{
  id v4;
  CACSpokenCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CACLanguageModel *languageModelCache;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CACSpokenCommand;
  v5 = -[CACSpokenCommand init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACSpokenCommand setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "strings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACSpokenCommand setStrings:](v5, "setStrings:", v7);

    -[CACSpokenCommand setAction:](v5, "setAction:", objc_msgSend(v4, "action"));
    objc_msgSend(v4, "commandRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACSpokenCommand setCommandRecognizer:](v5, "setCommandRecognizer:", v8);

    objc_msgSend(v4, "recognizedParameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACSpokenCommand setRecognizedParameters:](v5, "setRecognizedParameters:", v9);

    objc_msgSend(v4, "contextEvaluation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACSpokenCommand setContextEvaluation:](v5, "setContextEvaluation:", v10);

    objc_msgSend(v4, "languageModelCache");
    v11 = objc_claimAutoreleasedReturnValue();
    languageModelCache = v5->_languageModelCache;
    v5->_languageModelCache = (CACLanguageModel *)v11;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSpokenCommand:", self);
}

- (CACLanguageModel)languageModel
{
  CACSpokenCommand *v2;
  CACLanguageModel *languageModelCache;
  CACLanguageModel *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CACLanguageModel *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  CACLanguageModel *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  CACLanguageModel *v18;
  CACLanguageModel *v19;
  CACLanguageModel *v20;
  uint64_t v21;
  void *v22;
  CACLanguageModel *v23;
  uint64_t v24;
  NSArray *strings;
  NSArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  NSArray *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  CACSpokenCommand *v55;
  void *v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  char v63;
  id v64;
  _BYTE v65[128];
  uint64_t v66;

  v2 = self;
  v66 = *MEMORY[0x24BDAC8D0];
  languageModelCache = self->_languageModelCache;
  if (!languageModelCache)
  {
    v4 = [CACLanguageModel alloc];
    -[CACSpokenCommand identifier](v2, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v2->_identifier, kCACLanguageModelAttributeCommandIdentifier, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CACLanguageModel initWithText:identifier:attributes:](v4, "initWithText:identifier:attributes:", &stru_24F2ADCC8, v5, v6);
    v8 = v2->_languageModelCache;
    v2->_languageModelCache = (CACLanguageModel *)v7;

    -[CACSpokenCommand identifier](v2, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v9, "isEqualToString:", CFSTR("System.IgnoreSiriKeywordAndOptionalPhrase"));

    if ((_DWORD)v5)
    {
      objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bestLocaleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedTriggerPhraseForLanguageCode:", v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!-[__CFString length](v13, "length"))
      {

        v13 = CFSTR("Hey Siri");
      }
      v14 = [CACLanguageModel alloc];
      -[CACSpokenCommand identifier](v2, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *MEMORY[0x24BDBD270];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", *MEMORY[0x24BDBD270], *MEMORY[0x24BEAFF60], 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[CACLanguageModel initWithText:identifier:attributes:](v14, "initWithText:identifier:attributes:", &stru_24F2ADCC8, v15, v17);

      v19 = -[CACLanguageModel initWithText:identifier:attributes:]([CACLanguageModel alloc], "initWithText:identifier:attributes:", v13, 0, 0);
      v20 = [CACLanguageModel alloc];
      v21 = *MEMORY[0x24BEAFEF0];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v16, *MEMORY[0x24BEAFF58], 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[CACLanguageModel initWithText:identifier:attributes:](v20, "initWithText:identifier:attributes:", &stru_24F2ADCC8, v21, v22);

      -[CACLanguageModel addChildLanguageModel:](v18, "addChildLanguageModel:", v19);
      -[CACLanguageModel addChildLanguageModel:](v18, "addChildLanguageModel:", v23);
      -[CACLanguageModel addChildLanguageModel:](v2->_languageModelCache, "addChildLanguageModel:", v18);
      v24 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", &stru_24F2ADCC8, 0);
      strings = v2->_strings;
      v2->_strings = (NSArray *)v24;

    }
    else if (-[CACSpokenCommand isCustomCommand](v2, "isCustomCommand"))
    {
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v55 = v2;
      v26 = v2->_strings;
      v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v59 != v29)
              objc_enumerationMutation(v26);
            v31 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
            v57 = 0;
            objc_msgSend(MEMORY[0x24BEAFED0], "languageModelDictionaryFromCommandText:parsingErrorString:", v31, &v57);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v57;
            v34 = 0;
            if (!objc_msgSend(v33, "length"))
            {
              +[CACSpokenCommand languageModelFromCommandDictionary:tokenResolution:containsBuiltInIdentifier:error:](CACSpokenCommand, "languageModelFromCommandDictionary:tokenResolution:containsBuiltInIdentifier:error:", v32, 0, 0, 0);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
            }
            if (objc_msgSend(v33, "length"))
              NSLog(CFSTR("Error creating language model from text: '%@', %@"), v31, v33);
            else
              -[CACLanguageModel addChildLanguageModel:](v55->_languageModelCache, "addChildLanguageModel:", v34);

          }
          v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
        }
        while (v28);
      }

      v2 = v55;
    }
    else
    {
      +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "bestLocaleIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEAFED8], "sharedSpokenCommandUtilities");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "commandStringsTableForLocaleIdentifier:", v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      -[CACSpokenCommand identifier](v2, "identifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEAFED0], "activeTargetTypes");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 0;
      objc_msgSend(v38, "languageModelDictionaryForCommandIdentifier:targetTypes:parsingErrorString:", v39, v40, &v64);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v64;

      if (!v2->_strings)
      {
        objc_msgSend(v35, "builtInCommandsStringsTableForLocaleIdentifier:", v36);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "spokenStringPermutationsOfLanguageModelDictionary:stringsTable:", v41, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v44, "count"))
        {
          v45 = objc_alloc(MEMORY[0x24BDBCE30]);
          objc_msgSend(v44, "firstObject");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v45, "initWithObjects:", v46, 0);
          v48 = v2->_strings;
          v2->_strings = (NSArray *)v47;

        }
        else
        {
          v46 = v2->_strings;
          v2->_strings = 0;
        }

      }
      if (v41 && !objc_msgSend(v42, "length"))
      {
        v49 = (void *)objc_opt_new();
        v63 = 0;
        v62 = 0;
        +[CACSpokenCommand languageModelFromCommandDictionary:tokenResolution:containsBuiltInIdentifier:error:](CACSpokenCommand, "languageModelFromCommandDictionary:tokenResolution:containsBuiltInIdentifier:error:", v41, v49, &v63, &v62);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v62;
        if (v50)
        {
          -[CACSpokenCommand identifier](v2, "identifier");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "localizedDescription");
          v56 = v51;
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("Error creating language model for command: %@, %@"), v52, v53);

          v51 = v56;
        }
        else
        {
          -[CACLanguageModel addChildLanguageModel:](v2->_languageModelCache, "addChildLanguageModel:", v51);
        }

      }
      else
      {
        -[CACSpokenCommand identifier](v2, "identifier");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("Error creating language model for command: %@, %@"), v49, v42);
        v50 = 0;
      }

    }
    languageModelCache = v2->_languageModelCache;
  }
  return languageModelCache;
}

- (BOOL)isListening
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_commandRecognizer);
  v3 = objc_msgSend(WeakRetained, "isListening");

  return v3;
}

- (BOOL)isExectuting
{
  return self->_exectutionStartTime != 0.0;
}

- (void)setExecuting:(BOOL)a3
{
  double v4;
  void (**executionCompletionBlock)(id, CACSpokenCommand *);
  id v6;
  id v7;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    self->_exectutionStartTime = v4;
  }
  else
  {
    self->_exectutionStartTime = 0.0;
    self->_executionCompletionDeterminedManually = 0;
    executionCompletionBlock = (void (**)(id, CACSpokenCommand *))self->_executionCompletionBlock;
    if (executionCompletionBlock)
    {
      executionCompletionBlock[2](executionCompletionBlock, self);
      v6 = self->_executionCompletionBlock;
    }
    else
    {
      v6 = 0;
    }
    self->_executionCompletionBlock = 0;

    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didFinishExecutingSpokenCommand:", self);

  }
}

- (BOOL)isCompletionDeterminedManually
{
  return self->_executionCompletionDeterminedManually;
}

- (void)setCompletionDeterminedManually:(BOOL)a3
{
  self->_executionCompletionDeterminedManually = a3;
}

- (void)setCompletionBlock:(id)a3
{
  void *v4;
  id executionCompletionBlock;

  v4 = (void *)MEMORY[0x22E2D5D40](a3, a2);
  executionCompletionBlock = self->_executionCompletionBlock;
  self->_executionCompletionBlock = v4;

}

- (void)performAction
{
  NSObject *v3;
  uint64_t *v4;
  const char *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  _BOOL8 v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  dispatch_time_t v40;
  void *v41;
  CACSpokenCommand *v42;
  CACSpokenCommand *v43;
  SEL action;
  CACSpokenCommand *v45;
  void *v46;
  char v47;
  void *v48;
  BOOL v49;
  id WeakRetained;
  char v51;
  void *v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  NSString *identifier;
  void *v61;
  void *v62;
  char v63;
  _QWORD block[5];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t v69[128];
  uint8_t buf[4];
  const char *v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  RXSignpostLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = &qword_229AD4000;
  if (os_signpost_enabled(v3))
  {
    v5 = -[NSString UTF8String](self->_identifier, "UTF8String");
    *(_DWORD *)buf = 136315138;
    v71 = v5;
    _os_signpost_emit_with_name_impl(&dword_229A40000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CAC, CmdRec: Performing action.", "%s", buf, 0xCu);
  }

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hideDictationRecognizerModeOverlayNow");

  -[CACSpokenCommand identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("Dictation."));

  if (!v8)
  {
    +[CACSpokenCommandGestureManager defaultGestureManager](CACSpokenCommandGestureManager, "defaultGestureManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "defaultPortraitUpPointForGestures");
    objc_msgSend(v14, "setDefaultPortraitUpPointForGestures:");

    if (!-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("VoiceOver.StopSpeaking")))
    {
      -[CACSpokenCommand contextEvaluation](self, "contextEvaluation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", kCACCommandContextDeferRecognizedStringDisplay);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "BOOLValue");

      if ((v18 & 1) == 0)
      {
        -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[CACSpokenCommand attributedStringFromRecognizedCommandParameters:variantOverrides:](CACSpokenCommand, "attributedStringFromRecognizedCommandParameters:variantOverrides:", v19, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[CACSpokenCommand displayRecognizedMessageUsingAttributedString:](CACSpokenCommand, "displayRecognizedMessageUsingAttributedString:", v20);

      }
    }
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isActiveOverlayType:", CFSTR("NumberedGrid"));

    if (v22)
    {
      v4 = &qword_229AD4000;
      if (!-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("System.ShowGrid"))
        && !-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("System.HideGrid"))
        && !-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("System.OverlayChooseLabel"))
        && !-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("System.OverlayChooseLabelWithoutPrefix")))
      {
        +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "cancelAnyTransientOverlay");

      }
      +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "resetGridIdleTimer");
      goto LABEL_41;
    }
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isActiveOverlayType:", CFSTR("NumberedElements"));

    if (v26)
    {
      if (!-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("System.ShowLabels")))
      {
        v4 = &qword_229AD4000;
        if (-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("System.HideLabels")))
          goto LABEL_42;
        if (-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("System.GoHome")))
        {
          +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setNextFetchDelayFactor:", 8.0);

        }
        +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("System.OverlayChooseLabel"))
           || -[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("System.OverlayChooseLabelWithoutPrefix"))|| -[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("System.OverlayChooseAllLabels"));
        objc_msgSend(v28, "setShouldPreserveDisambiguationHandler:", v29);

        +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "cancelAnyTransientOverlay");

        +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setShouldPreserveDisambiguationHandler:", 0);
LABEL_41:

        goto LABEL_42;
      }
      goto LABEL_26;
    }
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isActiveOverlayType:", CFSTR("NamedElements"));

    if (v31)
    {
      if (!-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("System.ShowElementNames")))
      {
        v4 = &qword_229AD4000;
        if (-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("System.HideElementNames")))
          goto LABEL_42;
        +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "cancelAnyTransientOverlay");
        goto LABEL_41;
      }
LABEL_26:
      v4 = &qword_229AD4000;
      goto LABEL_42;
    }
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v32, "isActiveOverlayType:", CFSTR("NumberedWords")) & 1) != 0)
      goto LABEL_34;
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v33, "isActiveOverlayType:", CFSTR("NumberedLines")) & 1) != 0)
    {
LABEL_33:

LABEL_34:
LABEL_35:
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "cancelAnyTransientOverlay");
      goto LABEL_36;
    }
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v34, "isActiveOverlayType:", CFSTR("NumberedCharacters")) & 1) != 0)
    {
LABEL_32:

      goto LABEL_33;
    }
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v35, "isActiveOverlayType:", CFSTR("NumberedSentences")) & 1) != 0)
    {

      goto LABEL_32;
    }
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "isActiveOverlayType:", CFSTR("NumberedParagraphs"));

    if ((v63 & 1) != 0)
      goto LABEL_35;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    +[CACSpokenCommandGestureManager allManagers](CACSpokenCommandGestureManager, "allManagers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    if (!v55)
      goto LABEL_36;
    v56 = v55;
    v57 = *(_QWORD *)v66;
LABEL_71:
    v58 = 0;
    while (1)
    {
      if (*(_QWORD *)v66 != v57)
        objc_enumerationMutation(v24);
      v59 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v58);
      if (objc_msgSend(v59, "isInDragGesture"))
        break;
      if (objc_msgSend(v59, "isIn3DTouchGesture"))
      {
        identifier = self->_identifier;
        v61 = &unk_24F2CF4E8;
LABEL_78:
        if ((objc_msgSend(v61, "containsObject:", identifier) & 1) == 0)
          objc_msgSend(v59, "resetState");
      }
      if (v56 == ++v58)
      {
        v56 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
        if (!v56)
        {
LABEL_36:
          v4 = &qword_229AD4000;
          goto LABEL_41;
        }
        goto LABEL_71;
      }
    }
    identifier = self->_identifier;
    v61 = &unk_24F2CF4D0;
    goto LABEL_78;
  }
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "disambiguationHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "labeledElements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textMarkerRange");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_43;
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cancelAnyTransientOverlay");
LABEL_42:

LABEL_43:
  +[CACRecordedUserActionManager sharedManager](CACRecordedUserActionManager, "sharedManager");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v37, "isRecording"))
  {
    if (-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("System.LockScreen"))
      || -[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("Accessibility.DisableCommandAndControl")))
    {

LABEL_47:
      +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommandRecording.Warning.StoppedBecauseOfCommandIdentifier"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "displayMessageString:type:", v39, 0);

      v40 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __33__CACSpokenCommand_performAction__block_invoke;
      block[3] = &unk_24F2AA860;
      block[4] = self;
      dispatch_after(v40, MEMORY[0x24BDAC9B8], block);
      goto LABEL_63;
    }
    v49 = -[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("System.SleepListening"));

    if (v49)
      goto LABEL_47;
  }
  else
  {

  }
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "focusedElement");
  v42 = (CACSpokenCommand *)objc_claimAutoreleasedReturnValue();

  -[CACSpokenCommand setExecuting:](self, "setExecuting:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v43 = self;
    action = self->_action;
    v45 = v42;
LABEL_53:
    -[CACSpokenCommand performSelector:withObject:](v43, "performSelector:withObject:", action, v45);
    goto LABEL_62;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    action = self->_action;
    v43 = v42;
    v45 = self;
    goto LABEL_53;
  }
  objc_msgSend(MEMORY[0x24BDFEA68], "systemWideElement");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_opt_respondsToSelector();

  if ((v47 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDFEA68], "systemWideElement");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_commandRecognizer);
    v51 = objc_opt_respondsToSelector();

    if ((v51 & 1) == 0)
    {
      -[CACSpokenCommand handleSpokenCommand:](self, "handleSpokenCommand:", 0);
      goto LABEL_62;
    }
    v48 = objc_loadWeakRetained((id *)&self->_commandRecognizer);
  }
  v52 = v48;
  objc_msgSend(v48, "performSelector:withObject:", self->_action, self);

LABEL_62:
LABEL_63:
  if (!self->_executionCompletionDeterminedManually)
    -[CACSpokenCommand setExecuting:](self, "setExecuting:", 0);
  RXSignpostLog();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v53))
  {
    v54 = -[NSString UTF8String](self->_identifier, "UTF8String");
    *(_DWORD *)buf = v4[31];
    v71 = v54;
    _os_signpost_emit_with_name_impl(&dword_229A40000, v53, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CAC, CmdRec: Performing action.", "%s", buf, 0xCu);
  }

}

uint64_t __33__CACSpokenCommand_performAction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopRecordingUserActions");
}

- (void)openApplication
{
  void *v3;
  void *v4;
  char v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("Text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("Show"));
  v6 = (_QWORD *)MEMORY[0x24BEAFF30];
  if ((v5 & 1) != 0)
  {
    -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("Text"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Numbers"));

    if (v10)
    {
      -[CACSpokenCommand alwaysShowOverlayNumbers](self, "alwaysShowOverlayNumbers");
      return;
    }
  }
  else
  {

  }
  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", *v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", kCACCommandParameterMatchingApps);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v17, "count") == 1;
  v14 = v17;
  if (v13)
  {
    objc_msgSend(v17, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", kCACCommandParameterAppIdentifier);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      +[CACApplicationUtilities launchApplicationWithIdentifier:](CACApplicationUtilities, "launchApplicationWithIdentifier:", v16);

    v14 = v17;
  }

}

- (void)closeApplication
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_229A40000, v0, v1, "Close Application", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)closeFrontApplication
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_229A40000, v0, v1, "Close Front Application", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_didShowOverlayWithHintIdentifier:(id)a3 hint:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "userHintsFeatures") & 2) == 0)
  {

LABEL_5:
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "speakVoiceOverDescriptionForActiveOverlayIfNeeded");
    goto LABEL_6;
  }
  +[CACUserHintsManager sharedManager](CACUserHintsManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldDisplayUserHintAfterRegisteringIdentifier:", v10);

  if (!v8)
    goto LABEL_5;
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayMessageString:type:announcementCompletion:", v5, 0, &__block_literal_global_418);
LABEL_6:

}

void __59__CACSpokenCommand__didShowOverlayWithHintIdentifier_hint___block_invoke()
{
  id v0;

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "speakVoiceOverDescriptionForActiveOverlayIfNeeded");

}

- (BOOL)_handleDisambiguationIfNeededWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  CACDisambiguationHandler *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  void *v27;
  CACSpokenCommand *v28;

  v4 = a3;
  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BEAFF50]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", kCACCommandParameterLabeledElementForDisambiguation);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "carPlayConnected");
  if (v7)
    v10 = v9;
  else
    v10 = 1;

  if ((v10 & 1) == 0)
  {
    v28 = self;
    objc_msgSend(v6, "objectForKey:", kCACCommandParameterText);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11 || !objc_msgSend(v11, "length"))
    {
      objc_msgSend(v7, "label");
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v13;
    }
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "labeledElementsFromScreenWithTitle:", v12);
    v15 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v15;
    v16 = -[CACDisambiguationHandler initWithLabeledElements:]([CACDisambiguationHandler alloc], "initWithLabeledElements:", v15);
    -[CACDisambiguationHandler setChosenLabeledElementHandler:](v16, "setChosenLabeledElementHandler:", v4);
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDisambiguationHandler:", v16);

    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "startShowingTransientOverlayForType:", CFSTR("NumberedElements"));

    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "isEnabledForCommandIdentifier:", CFSTR("System.OverlayChooseLabelWithoutPrefix")) & 1) != 0)
    {
      +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("InfoMessage.DisambiguationPrompt"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = (void *)MEMORY[0x24BDD17C8];
      +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("InfoMessage.DisambiguationPromptWithCommandAsArgument"));
      v26 = v4;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "primaryStringForCommandIdentifier:", CFSTR("System.OverlayChooseLabel"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithValidatedFormat:validFormatSpecifiers:error:", v22, CFSTR("%@"), 0, v24);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v26;
    }

    -[CACSpokenCommand _didShowOverlayWithHintIdentifier:hint:](v28, "_didShowOverlayWithHintIdentifier:hint:", CFSTR("DisambiguationPrompt"), v20);
  }

  return v10 ^ 1;
}

- (void)activateScreenItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  _QWORD v14[4];
  id v15;
  _QWORD block[4];
  id v17;

  if (!-[CACSpokenCommand _handleDisambiguationIfNeededWithBlock:](self, "_handleDisambiguationIfNeededWithBlock:", 0))
  {
    -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BEAFF50]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKey:", kCACCommandParameterText);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "labeledElementsFromScreenWithTitle:", v5);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "element");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_opt_respondsToSelector();

        if ((v11 & 1) != 0)
        {
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __38__CACSpokenCommand_activateScreenItem__block_invoke;
          block[3] = &unk_24F2AA860;
          v9 = v9;
          v17 = v9;
          dispatch_async(MEMORY[0x24BDAC9B8], block);

        }
      }
    }
    else
    {
      objc_msgSend(v4, "objectForKey:", kCACCommandParameterLabeledElement);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "element");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) == 0)
      {
LABEL_9:

        return;
      }
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __38__CACSpokenCommand_activateScreenItem__block_invoke_2;
      v14[3] = &unk_24F2AA860;
      v7 = v7;
      v15 = v7;
      dispatch_async(MEMORY[0x24BDAC9B8], v14);
      v9 = v15;
    }

    goto LABEL_9;
  }
}

void __38__CACSpokenCommand_activateScreenItem__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "element");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cacActivate");

}

void __38__CACSpokenCommand_activateScreenItem__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "element");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cacActivate");

}

- (void)handleLabeledElementFromNameOrNumberWithBlock:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a3;
  if (!-[CACSpokenCommand _handleDisambiguationIfNeededWithBlock:](self, "_handleDisambiguationIfNeededWithBlock:"))
  {
    -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEAFF50]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", kCACCommandParameterLabeledElement);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BEAFF20]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", kCACCommandParameterLabeledElement);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v9[2](v9, v6);

  }
}

- (void)handleLabeledElementsFromTwoNumbersWithBlock:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BEAFF20]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", kCACCommandParameterLabeledElement);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BEAFF28]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", kCACCommandParameterLabeledElement);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, void *))a3 + 2))(v5, v7, v10);

}

- (void)incrementItem
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];

  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BEAFF10]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", kCACCommandParameterText);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = (int)objc_msgSend(v5, "intValue");
  else
    v6 = 1;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__CACSpokenCommand_incrementItem__block_invoke;
  v7[3] = &__block_descriptor_40_e27_v16__0__CACLabeledElement_8l;
  v7[4] = v6;
  -[CACSpokenCommand handleLabeledElementFromNameOrNumberWithBlock:](self, "handleLabeledElementFromNameOrNumberWithBlock:", v7);

}

void __33__CACSpokenCommand_incrementItem__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "element");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performAction:withValue:", 2004, v3);

}

- (void)decrementItem
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];

  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BEAFF10]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", kCACCommandParameterText);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = (int)objc_msgSend(v5, "intValue");
  else
    v6 = 1;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__CACSpokenCommand_decrementItem__block_invoke;
  v7[3] = &__block_descriptor_40_e27_v16__0__CACLabeledElement_8l;
  v7[4] = v6;
  -[CACSpokenCommand handleLabeledElementFromNameOrNumberWithBlock:](self, "handleLabeledElementFromNameOrNumberWithBlock:", v7);

}

void __33__CACSpokenCommand_decrementItem__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "element");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performAction:withValue:", 2005, v3);

}

- (void)showVocabulary
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_435);
}

void __34__CACSpokenCommand_showVocabulary__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performSelector:withObject:afterDelay:", sel_openCommandAndControlVocabulary, 0, 0.0);

}

- (void)showTraining
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  CACLogAccessibility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_229A40000, v2, OS_LOG_TYPE_INFO, "Opening Voice Control training.", v4, 2u);
  }

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "launchOnboardingViewService:", CFSTR("voicecontrol"));

}

- (void)showCommands
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_440);
}

void __32__CACSpokenCommand_showCommands__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performSelector:withObject:afterDelay:", sel_openCommandAndControlCommands, 0, 0.0);

}

- (void)showActiveCommands
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id obj;
  void *v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeCommandIdentifiers");
  v3 = objc_claimAutoreleasedReturnValue();

  +[CACUserHintsManager sharedManager](CACUserHintsManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)v3;
  objc_msgSend(v4, "suggestedCommandIdentifiersFromActiveCommandIdentifiers:maximumCount:", v3, 10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bestLocaleIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEAFED8], "sharedSpokenCommandUtilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commandStringsTableForLocaleIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)v7;
  objc_msgSend(v10, "builtInCommandsStringsTableForLocaleIdentifier:", v7);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v5;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v11)
  {
    v12 = v11;
    v33 = *(_QWORD *)v36;
    v13 = 0x24BDD1000uLL;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v36 != v33)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v14);
        objc_msgSend(MEMORY[0x24BEAFED0], "activeTargetTypes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "descriptionStringForCommandIdentifier:descriptionType:targetTypes:", v15, CFSTR("SUMM"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_msgSend(v17, "length");
        v19 = objc_alloc(MEMORY[0x24BDD1688]);
        if (v18)
        {
          v20 = (void *)objc_msgSend(v19, "initWithString:", v17);
          objc_msgSend(v9, "resolveReferencesInMutableAttributedString:stringsTable:", v20, v32);
        }
        else
        {
          v20 = (void *)objc_msgSend(v19, "initWithString:", &stru_24F2ADCC8);
        }
        v21 = *(void **)(v13 + 1992);
        +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "primaryStringForCommandIdentifier:", v15);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("“%@”"), v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "string");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "length"))
        {
          objc_msgSend(*(id *)(v13 + 1992), "stringWithFormat:", CFSTR("%@"), v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v26 = 0;
        }
        +[CACOnboardingFeature featureWithTitleText:helperText:imageBundleName:](CACOnboardingFeature, "featureWithTitleText:helperText:imageBundleName:", v24, v26, CFSTR("onboarding-gestures"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObject:", v27);

        ++v14;
        v13 = 0x24BDD1000;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v12);
  }

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "showContextCluesViewWithCommands:", v34);

}

- (void)showNumberedElements
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisambiguationHandler:", 0);

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alwaysShowOverlayType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("NumberedElements"));

  if (v6)
  {
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 0;
  }
  else
  {
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "alwaysShowOverlayType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("NumberedGrid"));

    if (v12)
    {
      +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "hideAnyNonInteractiveOverlay");

    }
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("NumberedElements");
  }
  objc_msgSend(v7, "startShowingTransientOverlayForType:", v9);

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEnabledForCommandIdentifier:", CFSTR("System.OverlayChooseLabelWithoutPrefix")) & 1) != 0)
  {
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("InfoMessage.ShowNumbersPrompt"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("InfoMessage.ShowNumbersPromptWithCommandAsArgument"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "primaryStringForCommandIdentifier:", CFSTR("System.OverlayChooseLabel"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithValidatedFormat:validFormatSpecifiers:error:", v16, CFSTR("%@"), 0, v18);
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[CACSpokenCommand _didShowOverlayWithHintIdentifier:hint:](self, "_didShowOverlayWithHintIdentifier:hint:", CFSTR("ShowNumbersPrompt"), v19);

}

- (void)hideNumberedElements
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alwaysShowOverlayType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("NumberedElements"));

  if (v4)
  {
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlwaysShowOverlayType:", CFSTR("None"));

  }
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transientOverlayType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("NumberedElements"));

  if (v8)
  {
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTransientOverlayType:", 0);

  }
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hideAnyOverlayAnimated:includeInteractiveOverlays:", 1, 0);

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "refreshOverlays");

}

- (void)alwaysShowOverlayNumbers
{
  void *v3;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlwaysShowOverlayType:", CFSTR("NumberedElements"));

  -[CACSpokenCommand showNumberedElements](self, "showNumberedElements");
}

- (void)showNumberedWords
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_456);
}

void __37__CACSpokenCommand_showNumberedWords__block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  void *v3;
  id v4;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "alwaysShowOverlayType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("NumberedGrid"));

  if (v2)
  {
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hideAnyNonInteractiveOverlay");

  }
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startShowingTransientOverlayForType:", CFSTR("NumberedWords"));

}

- (void)showNumberedLines
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_457);
}

void __37__CACSpokenCommand_showNumberedLines__block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  void *v3;
  id v4;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "alwaysShowOverlayType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("NumberedGrid"));

  if (v2)
  {
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hideAnyNonInteractiveOverlay");

  }
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startShowingTransientOverlayForType:", CFSTR("NumberedLines"));

}

- (void)showNumberedCharacters
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_458);
}

void __42__CACSpokenCommand_showNumberedCharacters__block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  void *v3;
  id v4;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "alwaysShowOverlayType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("NumberedGrid"));

  if (v2)
  {
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hideAnyNonInteractiveOverlay");

  }
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startShowingTransientOverlayForType:", CFSTR("NumberedCharacters"));

}

- (void)showNumberedParagraphs
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_459);
}

void __42__CACSpokenCommand_showNumberedParagraphs__block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  void *v3;
  id v4;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "alwaysShowOverlayType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("NumberedGrid"));

  if (v2)
  {
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hideAnyNonInteractiveOverlay");

  }
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startShowingTransientOverlayForType:", CFSTR("NumberedParagraphs"));

}

- (void)showNumberedSentences
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_460);
}

void __41__CACSpokenCommand_showNumberedSentences__block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  void *v3;
  id v4;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "alwaysShowOverlayType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("NumberedGrid"));

  if (v2)
  {
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hideAnyNonInteractiveOverlay");

  }
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startShowingTransientOverlayForType:", CFSTR("NumberedSentences"));

}

- (void)showNumberedGrid
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__CACSpokenCommand_showNumberedGrid__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __36__CACSpokenCommand_showNumberedGrid__block_invoke(uint64_t a1)
{
  void *v2;

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateGridLayoutFromPreferences");

  return objc_msgSend(*(id *)(a1 + 32), "_displayNumberedGridAtCurrentNumberOfColumnsAndRows");
}

- (void)_displayNumberedGridAtCurrentNumberOfColumnsAndRows
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alwaysShowOverlayType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("NumberedGrid"));

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "startShowingTransientOverlayForType:", 0);

    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resetGrid");
  }
  else
  {
    objc_msgSend(v5, "startShowingTransientOverlayForType:", CFSTR("NumberedGrid"));
  }

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "userHintsFeatures") & 2) != 0)
  {
    +[CACUserHintsManager sharedManager](CACUserHintsManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldDisplayUserHintAfterRegisteringIdentifier:", CFSTR("ShowGridPrompt"));

    if (!v8)
      return;
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("InfoMessage.ShowGridPrompt"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayMessageString:type:", v9, 0);

  }
}

- (void)hideNumberedGrid
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alwaysShowOverlayType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("NumberedGrid"));

  if (v4)
  {
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlwaysShowOverlayType:", CFSTR("None"));

  }
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transientOverlayType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("NumberedGrid"));

  if (v8)
  {
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTransientOverlayType:", 0);

  }
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hideAnyOverlayAnimated:includeInteractiveOverlays:", 1, 0);

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "refreshOverlays");

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "forceSynchronizeRecognizersForBuiltInLMIdentifier:", *MEMORY[0x24BEAFF50]);

}

- (void)alwaysShowOverlayGrid
{
  void *v3;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlwaysShowOverlayType:", CFSTR("NumberedGrid"));

  -[CACSpokenCommand showNumberedGrid](self, "showNumberedGrid");
}

- (void)alwaysShowOverlayGridWithNumberOfColumns
{
  void *v3;
  BOOL v4;
  _QWORD block[4];
  BOOL v6;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlwaysShowOverlayType:", CFSTR("NumberedGrid"));

  v4 = -[CACSpokenCommand _updateGridWithNumberOfColumnsAndRows:](self, "_updateGridWithNumberOfColumnsAndRows:", 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CACSpokenCommand_alwaysShowOverlayGridWithNumberOfColumns__block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __60__CACSpokenCommand_alwaysShowOverlayGridWithNumberOfColumns__block_invoke(uint64_t a1)
{
  id v2;

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updatePreferencesFromCurrentGridLayoutForRows:forColumns:", *(unsigned __int8 *)(a1 + 32), 1);

}

- (void)alwaysShowOverlayGridWithNumberOfRows
{
  void *v3;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlwaysShowOverlayType:", CFSTR("NumberedGrid"));

  -[CACSpokenCommand _updateGridWithNumberOfRows:](self, "_updateGridWithNumberOfRows:", 0);
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_466);
}

void __57__CACSpokenCommand_alwaysShowOverlayGridWithNumberOfRows__block_invoke()
{
  id v0;

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "updatePreferencesFromCurrentGridLayoutForRows:forColumns:", 1, 0);

}

- (void)showElementNames
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alwaysShowOverlayType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("NamedElements"));

  if (v5)
  {
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0;
  }
  else
  {
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activeOverlayType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("NumberedGrid"));

    if (v11)
    {
      +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "hideAnyNonInteractiveOverlay");

    }
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("NamedElements");
  }
  objc_msgSend(v6, "startShowingTransientOverlayForType:", v8);

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEnabledForCommandIdentifier:", CFSTR("System.PressItemWithoutPrefix")) & 1) != 0)
  {
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("InfoMessage.ShowNamesPrompt"));
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("InfoMessage.ShowNamesPromptWithCommandAsArgument"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "primaryStringForCommandIdentifier:", CFSTR("System.PressItem"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithValidatedFormat:validFormatSpecifiers:error:", v15, CFSTR("%@"), 0, v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[CACSpokenCommand _didShowOverlayWithHintIdentifier:hint:](self, "_didShowOverlayWithHintIdentifier:hint:", CFSTR("ShowNamesPrompt"), v18);

}

- (void)hideElementNames
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alwaysShowOverlayType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("NamedElements"));

  if (v4)
  {
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlwaysShowOverlayType:", CFSTR("None"));

  }
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transientOverlayType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("NamedElements"));

  if (v8)
  {
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTransientOverlayType:", 0);

  }
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hideAnyOverlayAnimated:includeInteractiveOverlays:", 1, 0);

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "refreshOverlays");

}

- (void)alwaysShowOverlayNames
{
  void *v3;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlwaysShowOverlayType:", CFSTR("NamedElements"));

  -[CACSpokenCommand showElementNames](self, "showElementNames");
}

- (void)showGridWithNumberOfColumns
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__CACSpokenCommand_showGridWithNumberOfColumns__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __47__CACSpokenCommand_showGridWithNumberOfColumns__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateGridWithNumberOfColumnsAndRows:", 1);
}

- (BOOL)_updateGridWithNumberOfColumnsAndRows:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;

  v3 = a3;
  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BEAFF10]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", kCACCommandParameterText);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "integerValue");
    -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BEAFF18]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", kCACCommandParameterText);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "integerValue");
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateGridLayoutWithNumberOfRows:numberOfColumns:shouldPreferRows:", v12, v8, 0);

    if (v3)
      -[CACSpokenCommand _displayNumberedGridAtCurrentNumberOfColumnsAndRows](self, "_displayNumberedGridAtCurrentNumberOfColumnsAndRows");
    v14 = objc_msgSend(v11, "length") != 0;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_updateGridWithNumberOfRows:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = a3;
  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BEAFF10]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", kCACCommandParameterText);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v10;
  if (v10)
  {
    v8 = objc_msgSend(v10, "integerValue");
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateGridLayoutWithNumberOfRows:numberOfColumns:shouldPreferRows:", v8, 0, 1);

    v7 = v10;
    if (v3)
    {
      -[CACSpokenCommand _displayNumberedGridAtCurrentNumberOfColumnsAndRows](self, "_displayNumberedGridAtCurrentNumberOfColumnsAndRows");
      v7 = v10;
    }
  }

}

- (void)chooseOverlayItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BEAFF20]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", kCACCommandParameterLabeledElement);
  v27 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "element");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "disambiguationHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "textMarkerRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = v7 == 0;
    else
      v10 = 0;
    if (v10)
    {
      objc_msgSend(v8, "startMarker");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "startMarker");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[CACTextMarkerRange markerRangeWithStartMarker:endMarker:](CACTextMarkerRange, "markerRangeWithStartMarker:endMarker:", v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "cacSetTextSelectionToCACTextMarkerRange:", v25);
      +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "refreshOverlays");

    }
    else
    {
      -[CACSpokenCommand pressOverlayItem](self, "pressOverlayItem");
    }

  }
  else
  {
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "rectangle");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    objc_msgSend(v27, "label");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v11, "updateGridWithPortraitUpRect:gridContainingLabel:", v20, v13, v15, v17, v19);

    if ((v21 & 1) == 0)
    {
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "cancelAnyTransientOverlay");

      -[CACSpokenCommand pressOverlayItem](self, "pressOverlayItem");
    }
  }

}

- (void)pressOverlayItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  _QWORD block[4];
  id v16;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disambiguationHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelAnyTransientOverlay");

  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BEAFF20]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", kCACCommandParameterLabeledElement);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "handleChosenLabeledElement:", v8);
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDisambiguationHandler:", 0);
  }
  else
  {
    objc_msgSend(v8, "element");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __36__CACSpokenCommand_pressOverlayItem__block_invoke;
      block[3] = &unk_24F2AA860;
      v16 = v9;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
    else
    {
      -[CACSpokenCommand tap](self, "tap");
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isActiveOverlayType:", CFSTR("NumberedGrid"));

      if (v11)
      {
        +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "updateGridLayoutFromPreferences");

        if (v13)
        {
          +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "resetGrid");

        }
      }
    }
  }

}

uint64_t __36__CACSpokenCommand_pressOverlayItem__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cacActivate");
}

- (void)chooseAllOverlayItems
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disambiguationHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "chosenLabeledElementHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v3, "labeledElements");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count") - 1;
      if (v6 >= 0)
      {
        v7 = MEMORY[0x24BDAC760];
        v8 = MEMORY[0x24BDAC9B8];
        do
        {
          +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "cancelAnyTransientOverlay");

          block[0] = v7;
          block[1] = 3221225472;
          block[2] = __41__CACSpokenCommand_chooseAllOverlayItems__block_invoke;
          block[3] = &unk_24F2AB6B8;
          v12 = v3;
          v13 = v5;
          v14 = v6;
          dispatch_async(v8, block);
          usleep(0x7A120u);

          --v6;
        }
        while (v6 != -1);
      }
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDisambiguationHandler:", 0);

    }
  }

}

void __41__CACSpokenCommand_chooseAllOverlayItems__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleChosenLabeledElement:", v2);

}

- (void)handleSleepListening
{
  id v2;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enterSleepInteractionLevel");

}

- (void)handleWakeListening
{
  id v2;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exitSleepInteractionLevel");

}

- (void)disableCommandAndControl
{
  dispatch_time_t v2;

  v2 = dispatch_time(0, 1500000000);
  dispatch_after(v2, MEMORY[0x24BDAC9B8], &__block_literal_global_478);
}

void __44__CACSpokenCommand_disableCommandAndControl__block_invoke()
{
  id v0;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setCommandAndControlEnabled:", 0);

}

- (void)sleepCarPlay
{
  -[CACSpokenCommand handleWakeListening](self, "handleWakeListening");
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_479);
}

void __32__CACSpokenCommand_sleepCarPlay__block_invoke()
{
  id v0;

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "carPlayDidConnect:", 0);

}

- (void)wakeCarPlay
{
  -[CACSpokenCommand handleWakeListening](self, "handleWakeListening");
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_480);
}

void __31__CACSpokenCommand_wakeCarPlay__block_invoke()
{
  id v0;

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "carPlayDidConnect:", 1);

}

- (void)startDictationMode
{
  id v2;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDictationRecognizerMode:", 0);

}

- (void)startCommandMode
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDictationRecognizerMode:", 1);

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dictationRecognizerMode");

  if (v4)
  {
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("InfoMessage.ExitingDictationMode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayMessageString:type:", v5, 0);

  }
}

- (void)startSpellingMode
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDictationRecognizerMode:", 3);

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dictationRecognizerMode");

  if (v4)
  {
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("InfoMessage.ExitingDictationMode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayMessageString:type:", v5, 0);

  }
}

- (void)startNumberMode
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDictationRecognizerMode:", 2);

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dictationRecognizerMode");

  if (v4)
  {
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("InfoMessage.ExitingDictationMode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayMessageString:type:", v5, 0);

  }
}

- (void)goBack
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD block[4];
  void *v17;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "labeledElementsFromScreenWithTrait:", *MEMORY[0x24BDFEE58]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "count"))
  {
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("SafariBackButtonLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "labeledElementsFromScreenWithTitle:", v9);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "element");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __26__CACSpokenCommand_goBack__block_invoke_2;
      v15[3] = &unk_24F2AA860;
      v15[4] = v11;
      v7 = v11;
      v12 = (id *)v15;
    }
    else
    {
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "screenElementsForEscape");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v7, "count"))
        goto LABEL_8;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __26__CACSpokenCommand_goBack__block_invoke_3;
      v14[3] = &unk_24F2AA860;
      v7 = v7;
      v14[4] = v7;
      v12 = (id *)v14;
    }
    dispatch_async(MEMORY[0x24BDAC9B8], v12);

    goto LABEL_8;
  }
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "element");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__CACSpokenCommand_goBack__block_invoke;
  block[3] = &unk_24F2AA860;
  v17 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  v7 = v17;
LABEL_8:

}

uint64_t __26__CACSpokenCommand_goBack__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cacActivate");
}

uint64_t __26__CACSpokenCommand_goBack__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cacActivate");
}

void __26__CACSpokenCommand_goBack__block_invoke_3(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v7 != v4)
        objc_enumerationMutation(v1);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5), "cacPerformExcapeAction", (_QWORD)v6) & 1) != 0)
        break;
      if (v3 == ++v5)
      {
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
        if (v3)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)showAccessibilityActions
{
  -[CACSpokenCommand handleLabeledElementFromNameOrNumberWithBlock:](self, "handleLabeledElementFromNameOrNumberWithBlock:", &__block_literal_global_485);
}

void __44__CACSpokenCommand_showAccessibilityActions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v2 = a2;
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "element");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rectangle");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend(v12, "showElementActionsForElement:usingPortraitUpRect:", v3, v5, v7, v9, v11);
}

- (void)showVirtualKeyboard
{
  void *v2;
  void *v3;
  id v4;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusedElement");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v4;
  if (v4)
  {
    objc_msgSend(v4, "performAction:", 2066);
    v3 = v4;
  }

}

- (void)hideVirtualKeyboard
{
  void *v2;
  void *v3;
  id v4;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusedElement");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v4;
  if (v4)
  {
    objc_msgSend(v4, "performAction:", 2067);
    v3 = v4;
  }

}

- (void)createCustomCommand
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusedElement");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (!v12 || ((v3 = objc_msgSend(v12, "selectedTextRange"), v3 != 0x7FFFFFFF) ? (v5 = v4 == 0) : (v5 = 1), v5))
  {
    v6 = 0;
  }
  else
  {
    v7 = v3;
    v8 = v4;
    objc_msgSend(v12, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "substringWithRange:", v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "length"))
      v6 = v10;
    else
      v6 = 0;

  }
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "showCustomCommandEditorWithTextToInsert:", v6);

}

- (void)repeatPreviousCommand
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v3 = 1;
  -[CACSpokenCommand setCompletionDeterminedManually:](self, "setCompletionDeterminedManually:", 1);
  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEAFF10]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", kCACCommandParameterText);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v3 = (int)objc_msgSend(v6, "intValue");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__CACSpokenCommand_repeatPreviousCommand__block_invoke;
  v8[3] = &unk_24F2AB760;
  v8[4] = self;
  objc_msgSend(v7, "beginExecutingRepeatingSpokenCommandNumberOfTimes:completionBlock:", v3, v8);

}

void __41__CACSpokenCommand_repeatPreviousCommand__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setExecuting:", 0);
  if (objc_msgSend(v7, "code"))
  {
    objc_msgSend(v7, "localizedDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");

    if (v4)
    {
      +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "displayMessageString:type:", v6, 1);

    }
  }

}

- (void)startRecordingGesture
{
  void *v2;
  id v3;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startRecordingGesture");

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateStatusIndicatorView");

}

- (void)stopRecordingGesture
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopRecordingGesture");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v9, "numberOfEvents");
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "showCustomCommandEditorWithGesture:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CustomCommand.Error.RecordedEmptyGesture"), &stru_24F2ADCC8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayMessageString:type:", v7, 1);

  }
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateStatusIndicatorView");

}

- (void)startRecordingUserActions
{
  void *v2;
  id v3;

  +[CACRecordedUserActionManager sharedManager](CACRecordedUserActionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startRecordingUserActions");

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateStatusIndicatorView");

}

- (void)stopRecordingUserActions
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[CACRecordedUserActionManager sharedManager](CACRecordedUserActionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRecording");

  if (v3)
  {
    +[CACRecordedUserActionManager sharedManager](CACRecordedUserActionManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopRecordingUserActions");

    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateStatusIndicatorView");

    +[CACRecordedUserActionManager sharedManager](CACRecordedUserActionManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordedUserActionFlow");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "showCustomCommandEditorWithRecordedUserActionFlow:", v8);

  }
}

- (void)searchSpotlight
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_229A40000, v0, v1, "Search Spotlight 1. Reveal Spotlight.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

uint64_t __35__CACSpokenCommand_searchSpotlight__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasAnyTraits:", *MEMORY[0x24BDFEE60]);

  return v3;
}

void __35__CACSpokenCommand_searchSpotlight__block_invoke_497(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  CACTextEditingProvider *v12;
  void *v13;
  NSObject *v14;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusedElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  CACLogDictationCommands();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __35__CACSpokenCommand_searchSpotlight__block_invoke_497_cold_6(v3, v4);

  if (v3)
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if ((v6 & 1) != 0)
    {
      CACLogDictationCommands();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __35__CACSpokenCommand_searchSpotlight__block_invoke_497_cold_2();
    }
    else
    {
      objc_msgSend(v3, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");

      CACLogDictationCommands();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
      if (v9)
      {
        if (v11)
          __35__CACSpokenCommand_searchSpotlight__block_invoke_497_cold_5();

        v12 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", *(_QWORD *)(a1 + 40), v3);
        -[CACTextEditingProvider textEditingEngine](v12, "textEditingEngine");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "deleteAll");

        usleep(0x61A80u);
      }
      else
      {
        if (v11)
          __35__CACSpokenCommand_searchSpotlight__block_invoke_497_cold_4();

      }
      CACLogDictationCommands();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __35__CACSpokenCommand_searchSpotlight__block_invoke_497_cold_3();

      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v7 = objc_claimAutoreleasedReturnValue();
      -[NSObject enterDictatedString:](v7, "enterDictatedString:", *(_QWORD *)(a1 + 32));
    }
  }
  else
  {
    CACLogDictationCommands();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __35__CACSpokenCommand_searchSpotlight__block_invoke_497_cold_1();
  }

  objc_msgSend(*(id *)(a1 + 40), "setExecuting:", 0);
}

- (void)hideSearch
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleSpotlight");

}

- (void)enableAttentionAwareness
{
  void *v2;
  id v3;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSleepOnAttentionLost:", 1);

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWakeOnAttentionGained:", 1);

}

- (void)disableAttentionAwareness
{
  void *v2;
  id v3;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSleepOnAttentionLost:", 0);

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWakeOnAttentionGained:", 0);

}

- (void)searchWeb
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BEAFEF0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", kCACCommandParameterText);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length"))
  {
    v4 = (void *)MEMORY[0x24BDBCF48];
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("x-web-search://?%@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "openURL:options:completionHandler:", v9, MEMORY[0x24BDBD1B8], 0);

  }
}

- (void)hangUp
{
  NSObject *v2;
  void *v3;
  id v4;
  _QWORD block[4];
  id v6;

  v2 = dispatch_queue_create("com.apple.speech.CallCenterQueue", 0);
  objc_msgSend(MEMORY[0x24BEB4938], "callCenterWithQueue:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__CACSpokenCommand_hangUp__block_invoke;
  block[3] = &unk_24F2AA860;
  v6 = v3;
  v4 = v3;
  dispatch_async(v2, block);

}

void __26__CACSpokenCommand_hangUp__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "incomingCall");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2 || (objc_msgSend(*(id *)(a1 + 32), "incomingVideoCall"), (v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = (id)v2;
    objc_msgSend(*(id *)(a1 + 32), "disconnectCall:withReason:", v2, 2);

  }
  else if (objc_msgSend(*(id *)(a1 + 32), "hasCurrentCalls"))
  {
    objc_msgSend(*(id *)(a1 + 32), "disconnectCurrentCallAndActivateHeld");
  }
}

- (BOOL)isCustomCommand
{
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CACSpokenCommand identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACSpokenCommand strings](self, "strings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %@, Rec Params: %@"), v4, v5, self->_recognizedParameters);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)strings
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStrings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (NSDictionary)recognizedParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRecognizedParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CACCommandRecognizer)commandRecognizer
{
  return (CACCommandRecognizer *)objc_loadWeakRetained((id *)&self->_commandRecognizer);
}

- (void)setCommandRecognizer:(id)a3
{
  objc_storeWeak((id *)&self->_commandRecognizer, a3);
}

- (NSMutableDictionary)contextEvaluation
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setContextEvaluation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)executedIndirectly
{
  return self->_executedIndirectly;
}

- (void)setExecutedIndirectly:(BOOL)a3
{
  self->_executedIndirectly = a3;
}

- (CACLanguageModel)languageModelCache
{
  return (CACLanguageModel *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_executionCompletionBlock, 0);
  objc_storeStrong((id *)&self->_contextEvaluation, 0);
  objc_destroyWeak((id *)&self->_commandRecognizer);
  objc_storeStrong((id *)&self->_languageModelCache, 0);
  objc_storeStrong((id *)&self->_recognizedParameters, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_strings, 0);
}

- (void)_scrollWithCount:(unint64_t)a3 forAction:(int)a4
{
  _QWORD block[6];
  int v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__CACSpokenCommand_CACSpokenCommandScrolling___scrollWithCount_forAction___block_invoke;
  block[3] = &unk_24F2AB938;
  block[4] = self;
  block[5] = a3;
  v5 = a4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __74__CACSpokenCommand_CACSpokenCommandScrolling___scrollWithCount_forAction___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 40);
  if (v1)
  {
    v2 = result;
    do
    {
      result = objc_msgSend(*(id *)(v2 + 32), "_performScrollingAction:", *(unsigned int *)(v2 + 48));
      if (!(_DWORD)result)
        break;
      --v1;
      result = usleep(0x186A0u);
    }
    while (v1);
  }
  return result;
}

- (void)scrollPageUp
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CACSpokenCommand_CACSpokenCommandScrolling__scrollPageUp__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __59__CACSpokenCommand_CACSpokenCommandScrolling__scrollPageUp__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_performScrollingAction:", 2007);
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_performScrollingAction:", 2020);
  return result;
}

- (void)scrollPageDown
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__CACSpokenCommand_CACSpokenCommandScrolling__scrollPageDown__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __61__CACSpokenCommand_CACSpokenCommandScrolling__scrollPageDown__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_performScrollingAction:", 2006);
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_performScrollingAction:", 2019);
  return result;
}

- (void)scrollToTop
{
  if (!-[CACSpokenCommand _performUncheckedScrollAction:forScrollAreaSupportingAction:](self, "_performUncheckedScrollAction:forScrollAreaSupportingAction:", 2068, 2007))-[CACSpokenCommand _scrollWithCount:forAction:](self, "_scrollWithCount:forAction:", 6, 2007);
}

- (void)scrollToBottom
{
  if (!-[CACSpokenCommand _performUncheckedScrollAction:forScrollAreaSupportingAction:](self, "_performUncheckedScrollAction:forScrollAreaSupportingAction:", 2069, 2006))-[CACSpokenCommand _scrollWithCount:forAction:](self, "_scrollWithCount:forAction:", 24, 2006);
}

- (BOOL)scrollToLandmark
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  BOOL v22;
  void *v23;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BEAFF50]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", kCACCommandParameterText);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "labeledElementsFromScreenWithTrait:", *MEMORY[0x24BDFEFF8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    v25 = *(_QWORD *)v32;
    v26 = v3;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v12, "element", v25);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uiElement");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "arrayWithAXAttribute:", 2239);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v28;
          while (2)
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v28 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
              if (!objc_msgSend(v21, "compare:options:", v4, 129))
              {
                objc_msgSend(v12, "element");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "performAction:withValue:", 2022, v21);

                v22 = 1;
                v3 = v26;
                goto LABEL_19;
              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            if (v18)
              continue;
            break;
          }
        }

        v10 = v25;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      v22 = 0;
      v3 = v26;
    }
    while (v9);
  }
  else
  {
    v22 = 0;
  }
LABEL_19:

  return v22;
}

- (void)scrollPageLeft
{
  -[CACSpokenCommand _scrollWithCount:forAction:](self, "_scrollWithCount:forAction:", 1, 2008);
}

- (void)scrollPageRight
{
  -[CACSpokenCommand _scrollWithCount:forAction:](self, "_scrollWithCount:forAction:", 1, 2009);
}

- (void)scrollToLeftEdge
{
  -[CACSpokenCommand _scrollWithCount:forAction:](self, "_scrollWithCount:forAction:", 4, 2008);
}

- (void)scrollToRightEdge
{
  -[CACSpokenCommand _scrollWithCount:forAction:](self, "_scrollWithCount:forAction:", 4, 2009);
}

- (id)_scrollAncestorsFromTopLevelElementsForAction:(int)a3 categorizedElements:(id *)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v4 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x24BDAC8D0];
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screenElementsForScrolling");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v14, "supportsAction:", v4))
        {
          v15 = objc_msgSend(v14, "scrollAncestorForScrollAction:", v4);
          if (v15)
          {
            v16 = v15;
            v17 = objc_msgSend(v7, "indexOfObject:", v15);
            if (v17 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v17 = objc_msgSend(v7, "count");
              objc_msgSend(v7, "addObject:", v16);
            }
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "objectForKey:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v19)
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKey:", v19, v18);
            }
            objc_msgSend(v19, "addObject:", v14);

          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  if (a4)
    *a4 = objc_retainAutorelease(v8);
  objc_msgSend(v7, "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (BOOL)_performUncheckedScrollAction:(int)a3 forScrollAreaSupportingAction:(int)a4
{
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  v5 = -[CACSpokenCommand _scrollAncestorsFromTopLevelElementsForAction:categorizedElements:](self, "_scrollAncestorsFromTopLevelElementsForAction:categorizedElements:", *(_QWORD *)&a4, &v19);
  v6 = v19;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v6, "allValues", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "lastObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "performAction:", v4);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v9);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_performScrollingAction:(int)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  NSObject *v18;
  id v20;
  id obj;
  uint8_t buf[16];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v3 = *(_QWORD *)&a3;
  v34 = *MEMORY[0x24BDAC8D0];
  v31 = 0;
  v4 = -[CACSpokenCommand _scrollAncestorsFromTopLevelElementsForAction:categorizedElements:](self, "_scrollAncestorsFromTopLevelElementsForAction:categorizedElements:", *(_QWORD *)&a3, &v31);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v20 = v31;
  objc_msgSend(v20, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v10, "reverseObjectEnumerator");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v24;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v24 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
              if (objc_msgSend(v16, "supportsAction:", v3)
                && objc_msgSend(v16, "performAction:", v3))
              {
                objc_msgSend(v10, "lastObject");
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                if (v16 != v17)
                {
                  CACLogElementEvaluation();
                  v18 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_229A40000, v18, OS_LOG_TYPE_DEFAULT, "Reproduced rdar://132435403.  Fell back to alternate element for scrolling.", buf, 2u);
                  }

                }
                v7 = 1;
                goto LABEL_21;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
            if (v13)
              continue;
            break;
          }
          v7 = 0;
        }
LABEL_21:

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7 & 1;
}

- (void)enableAssistiveTouch
{
  if (!_AXSAssistiveTouchEnabled())
  {
    _AXSAssistiveTouchSetEnabled();
    _AXSAssistiveTouchSetUIEnabled();
  }
}

- (void)disableAssistiveTouch
{
  if (_AXSAssistiveTouchEnabled())
  {
    _AXSAssistiveTouchSetEnabled();
    _AXSAssistiveTouchSetUIEnabled();
  }
}

- (void)enableClassicInvertColors
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "classicInvertColors");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClassicInvertColors:", 1);

  }
}

- (void)disableClassicInvertColors
{
  void *v2;
  int v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "classicInvertColors");

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClassicInvertColors:", 0);

  }
}

- (void)enableSmartInvertColors
{
  if (!_AXSInvertColorsEnabled())
    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_17);
}

uint64_t __74__CACSpokenCommand_CACSpokenCommandAccessibility__enableSmartInvertColors__block_invoke()
{
  void *v0;
  int v1;
  void *v2;
  double Current;
  void *v4;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "classicInvertColors");

  if (v1)
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setClassicInvertColors:", 0);

  }
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastSmartInvertColorsEnablement:", Current);

  return _AXSInvertColorsSetEnabled();
}

- (void)disableSmartInvertColors
{
  if (_AXSInvertColorsEnabled())
    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_176);
}

uint64_t __75__CACSpokenCommand_CACSpokenCommandAccessibility__disableSmartInvertColors__block_invoke()
{
  void *v0;
  int v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "classicInvertColors");

  if (v1)
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setClassicInvertColors:", 0);

  }
  return _AXSInvertColorsSetEnabled();
}

- (void)enableColorFilters
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x24BE005C0], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsAccessibilityDisplayFilters");

  if (v3)
  {
    if (!MADisplayFilterPrefGetCategoryEnabled())
      MADisplayFilterPrefSetCategoryEnabled();
  }
  else if (!_AXSGrayscaleEnabled())
  {
    _AXSGrayscaleSetEnabled();
  }
}

- (void)disableColorFilters
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x24BE005C0], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsAccessibilityDisplayFilters");

  if (v3)
  {
    if (MADisplayFilterPrefGetCategoryEnabled())
      MADisplayFilterPrefSetCategoryEnabled();
  }
  else if (_AXSGrayscaleEnabled())
  {
    _AXSGrayscaleSetEnabled();
  }
}

- (void)enableReduceWhitePoint
{
  if (!_AXSReduceWhitePointEnabled())
    _AXSSetReduceWhitePointEnabled();
}

- (void)disableReduceWhitePoint
{
  if (_AXSReduceWhitePointEnabled())
    _AXSSetReduceWhitePointEnabled();
}

- (void)enableSwitchControl
{
  if (!_AXSAssistiveTouchScannerEnabled())
    _AXSAssistiveTouchScannerSetEnabled();
}

- (void)disableSwitchControl
{
  if (_AXSAssistiveTouchScannerEnabled())
    _AXSAssistiveTouchScannerSetEnabled();
}

- (void)enableVoiceOver
{
  if (!_AXSVoiceOverTouchEnabled())
  {
    if (!_AXSVoiceOverTouchUsageConfirmed())
      _AXSVoiceOverTouchSetUsageConfirmed();
    if (_AXSCanDisableApplicationAccessibility())
      _AXSApplicationAccessibilitySetEnabled();
    _AXSVoiceOverTouchSetEnabled();
    _AXSVoiceOverTouchSetUIEnabled();
  }
}

- (void)disableVoiceOver
{
  if (_AXSVoiceOverTouchEnabled())
  {
    if (!_AXSVoiceOverTouchUsageConfirmed())
      _AXSVoiceOverTouchSetUsageConfirmed();
    _AXSVoiceOverTouchSetEnabled();
    _AXSVoiceOverTouchSetUIEnabled();
  }
}

- (void)enableWatchMirroring
{
  if (!_AXSTwiceRemoteScreenEnabled())
    _AXSTwiceRemoteScreenSetEnabled();
}

- (void)disableWatchMirroring
{
  if (_AXSTwiceRemoteScreenEnabled())
    _AXSTwiceRemoteScreenSetEnabled();
}

- (void)enableWatchRemoteControl
{
  if (!_AXSWatchControlEnabled())
    _AXSWatchControlSetEnabled();
}

- (void)disableWatchRemoteControl
{
  if (_AXSWatchControlEnabled())
    _AXSWatchControlSetEnabled();
}

- (void)enableZoom
{
  if (!_AXSZoomTouchEnabled())
    _AXSZoomTouchSetEnabled();
}

- (void)disableZoom
{
  if (_AXSZoomTouchEnabled())
    _AXSZoomTouchSetEnabled();
}

- (void)enableFullKeyboardAccess
{
  if (!_AXSFullKeyboardAccessEnabled())
    _AXSFullKeyboardAccessSetEnabled();
}

- (void)disableFullKeyboardAccess
{
  if (_AXSFullKeyboardAccessEnabled())
    _AXSFullKeyboardAccessSetEnabled();
}

- (BOOL)isRestrictedForAAC
{
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE005C0], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isRestrictedForAAC") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v4 = (void *)objc_opt_new();
    v3 = objc_msgSend(v4, "isActive");

  }
  return v3;
}

- (void)activateSiri
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BEAFEF0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", kCACCommandParameterText);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    v4 = (void *)activateSiri_sAssistantServicesConnection;
    if (!activateSiri_sAssistantServicesConnection)
    {
      v5 = objc_opt_new();
      v6 = (void *)activateSiri_sAssistantServicesConnection;
      activateSiri_sAssistantServicesConnection = v5;

      v4 = (void *)activateSiri_sAssistantServicesConnection;
    }
    objc_msgSend(v4, "startUIRequestWithText:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activateSiri");

  }
}

- (void)activateHomeButton
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_37);
}

void __64__CACSpokenCommand_CACSpokenCommandHardware__activateHomeButton__block_invoke()
{
  void *v0;
  int v1;
  void *v2;
  int v3;
  id v4;

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "carPlayConnected");

  if (v1)
  {
    objc_msgSend(MEMORY[0x24BE38490], "dashboardService");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openApplication:withOptions:completion:", CFSTR("com.apple.CarPlayApp"), 0, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE006F0], "server");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "dismissBuddyIfNecessary");

    if ((v3 & 1) != 0)
      return;
    objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activateHomeButton");
  }

}

- (void)armApplePay
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "armApplePay");

}

- (void)toggleDock
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleDock");

}

- (void)activateAppLibrary
{
  void *v2;
  char v3;
  void *v4;
  dispatch_time_t v5;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isShowingHomescreen");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activateHomeButton");

  }
  v5 = dispatch_time(0, 500000000);
  dispatch_after(v5, MEMORY[0x24BDAC9B8], &__block_literal_global_182_0);
}

void __64__CACSpokenCommand_CACSpokenCommandHardware__activateAppLibrary__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "toggleAppLibrary");

}

- (void)activateAppSwitcher
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleAppSwitcher");

}

- (void)activateLockButton
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activateLockButton");

}

- (void)toggleRingerSwitchOn
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleRingerSwitch:", 1);

}

- (void)toggleRingerSwitchOff
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleRingerSwitch:", 0);

}

- (void)toggleMute
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleMute");

}

- (void)decreaseVolume
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "decreaseVolume");

}

- (void)increaseVolume
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "increaseVolume");

}

- (void)activateSpotlight
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "revealSpotlight");

}

- (void)activateTripleClick
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activateTripleClick");

}

- (void)takeScreenshot
{
  void *v3;
  dispatch_time_t v4;
  _QWORD block[5];

  -[CACSpokenCommand setCompletionDeterminedManually:](self, "setCompletionDeterminedManually:", 1);
  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "takeScreenshot");

  v4 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CACSpokenCommand_CACSpokenCommandHardware__takeScreenshot__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
}

uint64_t __60__CACSpokenCommand_CACSpokenCommandHardware__takeScreenshot__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "contextEvaluation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", kCACCommandContextDeferRecognizedStringDisplay);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "recognizedParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CACSpokenCommand attributedStringFromRecognizedCommandParameters:variantOverrides:](CACSpokenCommand, "attributedStringFromRecognizedCommandParameters:variantOverrides:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CACSpokenCommand displayRecognizedMessageUsingAttributedString:](CACSpokenCommand, "displayRecognizedMessageUsingAttributedString:", v6);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setExecuting:", 0);
}

- (void)activateControlCenter
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleControlCenter");

}

- (void)hideControlCenter
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleControlCenter");

}

- (void)activateNotificationCenter
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleNotificationCenter");

}

- (void)hideNotificationCenter
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleNotificationCenter");

}

- (void)lockScreen
{
  dispatch_time_t v2;

  v2 = dispatch_time(0, 1000000000);
  dispatch_after(v2, MEMORY[0x24BDAC9B8], &__block_literal_global_184_0);
}

void __56__CACSpokenCommand_CACSpokenCommandHardware__lockScreen__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "activateLockButton");

}

- (void)rotateToPortrait
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "orientation");

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 == 5)
    objc_msgSend(v4, "rotateUpsideDown");
  else
    objc_msgSend(v4, "rotatePortrait");

}

- (void)rotateToLandscape
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "orientation");

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 == 3)
    objc_msgSend(v4, "rotateRight");
  else
    objc_msgSend(v4, "rotateLeft");

}

- (void)tripleClick
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activateTripleClick");

}

- (void)shake
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shake");

}

- (void)increaseZoomLevel
{
  void *v2;
  double v3;
  double v4;
  id v5;

  objc_msgSend(MEMORY[0x24BEC64E8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoomLevel");
  v4 = v3;

  objc_msgSend(MEMORY[0x24BEC64E8], "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setZoomLevel:", v4 * 1.2);

}

- (void)decreaseZoomLevel
{
  void *v2;
  double v3;
  double v4;
  id v5;

  objc_msgSend(MEMORY[0x24BEC64E8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoomLevel");
  v4 = v3;

  objc_msgSend(MEMORY[0x24BEC64E8], "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setZoomLevel:", v4 / 1.2);

}

- (void)minimizeZoomLevel
{
  id v2;

  objc_msgSend(MEMORY[0x24BEC64E8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setZoomLevel:", 1.0);

}

- (void)maximizeZoomLevel
{
  void *v2;
  double v3;
  double v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoomPreferredMaximumZoomScale");
  v4 = v3;

  objc_msgSend(MEMORY[0x24BEC64E8], "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setZoomLevel:", v4);

}

- (void)panZoomLeft
{
  id v2;

  objc_msgSend(MEMORY[0x24BEC64E8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "panLeft");

}

- (void)panZoomRight
{
  id v2;

  objc_msgSend(MEMORY[0x24BEC64E8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "panRight");

}

- (void)panZoomUp
{
  id v2;

  objc_msgSend(MEMORY[0x24BEC64E8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "panUp");

}

- (void)panZoomDown
{
  id v2;

  objc_msgSend(MEMORY[0x24BEC64E8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "panDown");

}

- (void)activateSpeakScreen
{
  id v2;

  objc_msgSend(MEMORY[0x24BEAFE90], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "speakThisWithOptions:errorHandler:", 12, &__block_literal_global_190_0);

}

void __65__CACSpokenCommand_CACSpokenCommandHardware__activateSpeakScreen__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CACLogDictationCommands();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __65__CACSpokenCommand_CACSpokenCommandHardware__activateSpeakScreen__block_invoke_cold_1((uint64_t)v2, v3);

}

- (void)activateSOS
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activateSOSMode");

}

- (void)activateDock
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleDock");

}

- (void)activateApplePay
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "armApplePay");

}

- (void)systemPressCameraButton
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pressCameraButton");

  }
}

- (void)systemLightPressCameraButton
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lightPressCameraButton");

  }
}

- (void)systemDoubleLightPressCameraButton
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleLightPressCameraButton");

  }
}

- (void)activateSysdiagnose
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performSysdiagnoseWithStatusUpdateHandler:", &__block_literal_global_196_0);

}

void __65__CACSpokenCommand_CACSpokenCommandHardware__activateSysdiagnose__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD block[4];
  id v5;

  v2 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__CACSpokenCommand_CACSpokenCommandHardware__activateSysdiagnose__block_invoke_2;
  block[3] = &unk_24F2AA860;
  v5 = v2;
  v3 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __65__CACSpokenCommand_CACSpokenCommandHardware__activateSysdiagnose__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  CACLogAccessibility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_229A40000, v2, OS_LOG_TYPE_INFO, "sysdiagnose status: %@", (uint8_t *)&v7, 0xCu);
  }

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "carPlayConnected");

  if ((v5 & 1) == 0)
  {
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayMessageString:type:", *(_QWORD *)(a1 + 32), 0);

  }
}

- (void)reboot
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rebootDevice");

}

- (void)selectCurrentCharacter:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectCurrentCharacter");

}

- (void)selectPreviousCharacter:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectPreviousCharacterWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)selectNextCharacter:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectNextCharacterWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)selectCurrentWord:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectCurrentWord");

}

- (void)selectPreviousWord:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectPreviousWordWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)selectNextWord:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectNextWordWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)selectCurrentSentence:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectCurrentSentence");

}

- (void)selectPreviousSentence:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectPreviousSentenceWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)selectNextSentence:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectNextSentenceWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)selectCurrentParagraph:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectCurrentParagraph");

}

- (void)selectPreviousParagraph:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectPreviousParagraphWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)selectNextParagraph:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectNextParagraphWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)selectCurrentLine:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectCurrentLine");

}

- (void)selectPreviousLine:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectPreviousLineWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)selectNextLine:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectNextLineWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)extendSelectionToEnd:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendSelectionToEnd");

}

- (void)extendSelectionToBeginning:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendSelectionToBeginning");

}

- (void)extendSelectionForwardCharactersUsingCardinalNumber:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendSelectionForwardCharactersWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)extendSelectionBackwardCharactersUsingCardinalNumber:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendSelectionBackwardCharactersWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)extendSelectionForwardWordsUsingCardinalNumber:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendSelectionForwardWordsWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)extendSelectionBackwardWordsUsingCardinalNumber:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendSelectionBackwardWordsWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)extendSelectionForwardSentencesUsingCardinalNumber:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendSelectionForwardSentencesWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)extendSelectionBackwardSentencesUsingCardinalNumber:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendSelectionBackwardSentencesWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)extendSelectionForwardParagraphsUsingCardinalNumber:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendSelectionForwardParagraphsWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)extendSelectionBackwardParagraphsUsingCardinalNumber:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendSelectionBackwardParagraphsWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)extendSelectionForwardLinesUsingCardinalNumber:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendSelectionForwardLinesWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)extendSelectionBackwardLinesUsingCardinalNumber:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendSelectionBackwardLinesWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)selectPhrase:(id)a3
{
  id v4;
  CACTextEditingProvider *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v4 = a3;
  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v5, "textEditingEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BEAFEF0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BEAFF48]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BEAFEF8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BEAFF38]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACSpokenCommand contextEvaluation](self, "contextEvaluation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", kCACCommandContextDeferRecognizedStringDisplay);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "BOOLValue"))
    v13 = v15;
  else
    v13 = 0;
  -[CACSpokenCommand identifier](self, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectFromPhraseVariants:insertionString:recognizedParameters:commandIdentifer:", v8, v10, v13, v14);

}

- (void)selectPhraseThroughPhrase:(id)a3
{
  id v4;
  CACTextEditingProvider *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v4 = a3;
  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v5, "textEditingEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", *MEMORY[0x24BEAFEF0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (_QWORD *)MEMORY[0x24BEAFF48];
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BEAFF48]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", *MEMORY[0x24BEAFEF8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", *v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACSpokenCommand contextEvaluation](self, "contextEvaluation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", kCACCommandContextDeferRecognizedStringDisplay);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "BOOLValue"))
    v14 = v16;
  else
    v14 = 0;
  -[CACSpokenCommand identifier](self, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectFromPhraseVariants:throughPhraseVariants:recognizedParameters:commandIdentifer:", v9, v11, v14, v15);

}

- (void)selectNext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedNextSpokenCommand");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v10, "recognizedParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEntriesFromDictionary:", v6);

    -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", kCACCommandParameterText);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v8, kCACCommandParameterText);

    objc_msgSend(v10, "setRecognizedParameters:", v5);
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleRecognizedCommand:", v10);
  }
  else
  {
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("ErrorMessage.NextNotFound"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayMessageString:type:", v5, 1);
  }

}

- (void)selectPrevious:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedPreviousSpokenCommand");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v10, "recognizedParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEntriesFromDictionary:", v6);

    -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", kCACCommandParameterText);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v8, kCACCommandParameterText);

    objc_msgSend(v10, "setRecognizedParameters:", v5);
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleRecognizedCommand:", v10);
  }
  else
  {
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("ErrorMessage.PreviousNotFound"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayMessageString:type:", v5, 1);
  }

}

- (void)selectAll:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  id *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  objc_msgSend(v4, "cacTextSelectionCACTextMarkerRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacStringForCACTextMarkerRange:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    -[CACSpokenCommand goToStartOfDocument:](self, "goToStartOfDocument:", v4);
    v7 = dispatch_time(0, 250000000);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __59__CACSpokenCommand_CACSpokenCommandTextEditing__selectAll___block_invoke_2;
    v11[3] = &unk_24F2AA860;
    v8 = &v12;
    v12 = v4;
    v9 = v4;
    dispatch_after(v7, MEMORY[0x24BDAC9B8], v11);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__CACSpokenCommand_CACSpokenCommandTextEditing__selectAll___block_invoke;
    block[3] = &unk_24F2AA860;
    v8 = &v14;
    v14 = v4;
    v10 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

uint64_t __59__CACSpokenCommand_CACSpokenCommandTextEditing__selectAll___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cacPerformTextSelectAll");
}

uint64_t __59__CACSpokenCommand_CACSpokenCommandTextEditing__selectAll___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cacPerformTextSelectAll");
}

- (void)selectPreviousTextInsertion:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "selectedTextRange");
  if (!v4)
  {
    v5 = -[CACSpokenCommand _rangeFromPreviousTextInsertionForAXElement:](self, "_rangeFromPreviousTextInsertionForAXElement:", v7);
    if (v6)
      objc_msgSend(v7, "cacSetTextSelectionToRange:", v5, v6);
  }

}

- (void)unselect:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moveToStartOfSelection");

}

- (void)moveUp:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "cacTextSelectionCACTextMarkerRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "nsRange");

  objc_msgSend(v3, "uiElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  v13[2] = &unk_24F2CEBC0;
  objc_msgSend(v6, "objectWithAXAttribute:parameter:", 94015, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 3));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v9, "unsignedIntegerValue") != 0x7FFFFFFF)
  {
    +[CACTextMarkerRange markerRangeWithNSRange:](CACTextMarkerRange, "markerRangeWithNSRange:", objc_msgSend(v9, "unsignedIntegerValue"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cacSetTextSelectionToCACTextMarkerRange:", v11);
  }
  else
  {
    objc_msgSend(v3, "uiElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectWithAXAttribute:", 2011);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDFEA90], "uiElementWithAXElement:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "performAXAction:withValue:", 2012, *MEMORY[0x24BDFF058]);

  }
}

- (void)moveDown:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "cacTextSelectionCACTextMarkerRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "nsRange");
  v7 = v6;

  objc_msgSend(v3, "uiElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5 + v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  v15[2] = &unk_24F2CEBC0;
  objc_msgSend(v8, "objectWithAXAttribute:parameter:", 94015, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && objc_msgSend(v11, "unsignedIntegerValue") != 0x7FFFFFFF)
  {
    +[CACTextMarkerRange markerRangeWithNSRange:](CACTextMarkerRange, "markerRangeWithNSRange:", objc_msgSend(v11, "unsignedIntegerValue"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cacSetTextSelectionToCACTextMarkerRange:", v13);
  }
  else
  {
    objc_msgSend(v3, "uiElement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectWithAXAttribute:", 2011);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDFEA90], "uiElementWithAXElement:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "performAXAction:withValue:", 2012, *MEMORY[0x24BDFF050]);

  }
}

- (void)goToStartOfSelection:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moveToStartOfSelection");

}

- (void)goToEndOfSelection:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moveToEndOfSelection");

}

- (void)goToStartOfWord:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moveToStartOfWordWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)goToEndOfWord:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moveToEndOfWordWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)goToStartOfSentence:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moveToStartOfSentenceWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)goToEndOfSentence:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moveToEndOfSentenceWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)goToStartOfParagraph:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moveToStartOfParagraphWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)goToEndOfParagraph:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moveToEndOfParagraphWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)goToStartOfLine:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moveToStartOfLineWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)goToEndOfLine:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moveToEndOfLineWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)goToStartOfDocument:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moveToStartOfTextArea");

}

- (void)goToEndOfDocument:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moveToEndOfTextArea");

}

- (void)moveForwardCharactersUsingCardinalNumber:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moveForwardCharactersWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)moveBackwardCharactersUsingCardinalNumber:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moveBackwardCharactersWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)moveForwardWordsUsingCardinalNumber:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moveForwardWordsWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)moveBackwardWordsUsingCardinalNumber:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moveBackwardWordsWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)moveForwardSentencesUsingCardinalNumber:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moveForwardSentencesWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)moveBackwardSentencesUsingCardinalNumber:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moveBackwardSentencesWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)moveForwardParagraphsUsingCardinalNumber:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moveForwardParagraphsWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)moveBackwardParagraphsUsingCardinalNumber:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moveBackwardParagraphsWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)moveForwardLinesUsingCardinalNumber:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moveForwardLinesWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)moveBackwardLinesUsingCardinalNumber:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moveBackwardLinesWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)deleteCurrentCharacter:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteCurrentCharacter");

}

- (void)deletePreviousCharacter:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deletePreviousCharacterWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)deleteNextCharacter:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteNextCharacterWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)deleteCurrentWord:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteCurrentWord");

}

- (void)deletePreviousWord:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deletePreviousWordWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)deleteNextWord:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteNextWordWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)deleteCurrentSentence:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteCurrentSentence");

}

- (void)deletePreviousSentence:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deletePreviousSentenceWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)deleteNextSentence:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteNextSentenceWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)deleteCurrentParagraph:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteCurrentParagraph");

}

- (void)deletePreviousParagraph:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deletePreviousParagraphWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)deleteNextParagraph:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteNextParagraphWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)deleteCurrentLine:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteCurrentLine");

}

- (void)deletePreviousLine:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deletePreviousLineWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)deleteNextLine:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteNextLineWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));

}

- (void)deleteAll:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteAll");

}

- (void)delete:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteSelection");

}

- (void)surroundSelectionWithPunctuation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CACTextEditingProvider *v7;

  v4 = a3;
  v7 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v7, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACSpokenCommand identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "surroundSelectionWithPunctuationForCommandIdentifier:", v6);

}

- (void)applyFormat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CACTextEditingProvider *v7;

  v4 = a3;
  v7 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v7, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACSpokenCommand identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyFormatWithCommandIdentifier:", v6);

}

- (void)pasteboardPaste:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pasteboardPaste");

}

- (void)pasteboardCopy:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pasteboardCopy");

}

- (void)pasteboardCut:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pasteboardCut");

}

- (void)correctSelection:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "correctSelection");

}

- (void)addSelectionToVocabulary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cacTextSelectionCACTextMarkerRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cacStringForCACTextMarkerRange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addVocabularyEntryWithString:", v5);
}

- (void)_activateKeyboardReturnKey:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CACSpokenCommand *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __76__CACSpokenCommand_CACSpokenCommandTextEditing___activateKeyboardReturnKey___block_invoke;
  v6[3] = &unk_24F2AAD70;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __76__CACSpokenCommand_CACSpokenCommandTextEditing___activateKeyboardReturnKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if ((AXUIKeyboardIsOOP() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDFEA68], "systemWideElement");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "uiElement");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "uiElementsWithAttribute:", 1011);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v4, "performAXAction:", 2054) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "postKeyboardEventWithKeyCode:modifierFlags:isKeyDown:", 40, 0, 1);
      objc_msgSend(*(id *)(a1 + 40), "postKeyboardEventWithKeyCode:modifierFlags:isKeyDown:", 40, 0, 0);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "uiElement");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performAXAction:", 2054);
  }

}

- (void)insertDate:(id)a3
{
  void *v3;
  const __CFLocale *v4;
  CFDateFormatterRef v5;
  __CFDateFormatter *v6;
  CFAbsoluteTime Current;
  __CFString *StringWithAbsoluteTime;
  _QWORD block[4];
  __CFString *v10;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFLocaleCreate(0, (CFLocaleIdentifier)objc_msgSend(v3, "bestLocaleIdentifier"));

  if (v4)
  {
    v5 = CFDateFormatterCreate(0, v4, kCFDateFormatterFullStyle, kCFDateFormatterNoStyle);
    if (v5)
    {
      v6 = v5;
      Current = CFAbsoluteTimeGetCurrent();
      StringWithAbsoluteTime = (__CFString *)CFDateFormatterCreateStringWithAbsoluteTime(0, v6, Current);
      if (-[__CFString length](StringWithAbsoluteTime, "length"))
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __60__CACSpokenCommand_CACSpokenCommandTextEditing__insertDate___block_invoke;
        block[3] = &unk_24F2AA860;
        v10 = StringWithAbsoluteTime;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

      }
      CFRelease(v6);

    }
    CFRelease(v4);
  }
}

void __60__CACSpokenCommand_CACSpokenCommandTextEditing__insertDate___block_invoke(uint64_t a1)
{
  id v2;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertDictatedString:", *(_QWORD *)(a1 + 32));

}

- (void)insertEmoji:(id)a3
{
  void *v4;
  _QWORD *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD block[4];
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v23 = a3;
  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (_QWORD *)MEMORY[0x24BEAFEF0];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEAFEF0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", kCACCommandParameterText);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v24, "length"))
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = 0;
    v7 = objc_alloc_init(MEMORY[0x24BDD1688]);
    +[CACEmojiManager sharedManager](CACEmojiManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __61__CACSpokenCommand_CACSpokenCommandTextEditing__insertEmoji___block_invoke;
    v34[3] = &unk_24F2AD0A8;
    v36 = &v37;
    v10 = v7;
    v35 = v10;
    objc_msgSend(v8, "enumerateEmojisInText:skinToneFilter:usingBlock:", v24, 0, v34);

    if (*((_BYTE *)v38 + 24))
      goto LABEL_12;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", *v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", kCACCommandParameterTextVariants);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v31;
LABEL_5:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v16);
        +[CACEmojiManager sharedManager](CACEmojiManager, "sharedManager");
        v18 = objc_claimAutoreleasedReturnValue();
        v27[0] = v9;
        v27[1] = 3221225472;
        v27[2] = __61__CACSpokenCommand_CACSpokenCommandTextEditing__insertEmoji___block_invoke_2;
        v27[3] = &unk_24F2AD0A8;
        v29 = &v37;
        v28 = v10;
        objc_msgSend((id)v18, "enumerateEmojisInText:skinToneFilter:usingBlock:", v17, 0, v27);

        LOBYTE(v18) = *((_BYTE *)v38 + 24) == 0;
        if ((v18 & 1) == 0)
          break;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
          if (v14)
            goto LABEL_5;
          break;
        }
      }
    }

    if (*((_BYTE *)v38 + 24))
    {
LABEL_12:
      block[0] = v9;
      block[1] = 3221225472;
      block[2] = __61__CACSpokenCommand_CACSpokenCommandTextEditing__insertEmoji___block_invoke_3;
      block[3] = &unk_24F2AA860;
      v26 = v10;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      v19 = v26;
    }
    else
    {
      v20 = (void *)MEMORY[0x24BDD17C8];
      +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("ErrorMessage.NamedEmojiNotFound"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithValidatedFormat:validFormatSpecifiers:error:", v21, CFSTR("%@"), 0, v24);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "displayMessageString:type:", v19, 1);

    }
    _Block_object_dispose(&v37, 8);
  }

}

void __61__CACSpokenCommand_CACSpokenCommandTextEditing__insertEmoji___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v4 = objc_alloc(MEMORY[0x24BDD1688]);
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") <= 1)
  {
    v8 = (void *)objc_msgSend(v4, "initWithString:attributes:", v5, 0);
  }
  else
  {
    v9 = CFSTR("AXTextAlternatives");
    objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v4, "initWithString:attributes:", v5, v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", v8);

}

void __61__CACSpokenCommand_CACSpokenCommandTextEditing__insertEmoji___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v4 = objc_alloc(MEMORY[0x24BDD1688]);
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") <= 1)
  {
    v8 = (void *)objc_msgSend(v4, "initWithString:attributes:", v5, 0);
  }
  else
  {
    v9 = CFSTR("AXTextAlternatives");
    objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v4, "initWithString:attributes:", v5, v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", v8);

}

void __61__CACSpokenCommand_CACSpokenCommandTextEditing__insertEmoji___block_invoke_3(uint64_t a1)
{
  id v2;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertDictatedAttributedString:", *(_QWORD *)(a1 + 32));

}

- (int64_t)_textSegmentCardinalNumberStart
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BEAFF20]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", kCACCommandParameterText);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "integerValue");
  return v5;
}

- (int64_t)_textSegmentCardinalNumberEnd
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BEAFF28]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", kCACCommandParameterText);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "integerValue");
  return v5;
}

- (id)_markerRangeForTextSegment
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber");
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "labeledTextSegmentElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 < 1)
  {
    v14 = 0;
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = v5;
      v16 = v4;
      v7 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v9, "numberedLabel", v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v2);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringValue");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v10, "isEqualToString:", v12);

          if ((v13 & 1) != 0)
          {
            objc_msgSend(v9, "textMarkerRange");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v6)
          continue;
        break;
      }
      v14 = 0;
LABEL_12:
      v4 = v16;
    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

- (id)_markerRangeForTextSegmentRange
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  CACTextMarkerRange *v7;
  id v8;
  uint64_t v9;
  CACTextMarkerRange *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  CACTextMarkerRange *v24;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  void *v30;
  void *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = -[CACSpokenCommand _textSegmentCardinalNumberStart](self, "_textSegmentCardinalNumberStart");
  v4 = -[CACSpokenCommand _textSegmentCardinalNumberEnd](self, "_textSegmentCardinalNumberEnd");
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "labeledTextSegmentElements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  v32 = v3;
  if (v3 >= 1 && v4 >= 1)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v8 = v6;
    v7 = (CACTextMarkerRange *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v7)
    {
      obj = v8;
      v30 = 0;
      v31 = 0;
      v9 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v7; i = (CACTextMarkerRange *)((char *)i + 1))
        {
          if (*(_QWORD *)v34 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v11, "numberedLabel");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v32);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringValue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v12, "isEqualToString:", v14);

          if (v15)
          {
            v16 = v11;

            v30 = v16;
          }
          objc_msgSend(v11, "numberedLabel");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringValue");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v17, "isEqualToString:", v19);

          if (v20)
          {
            v21 = v11;

            v31 = v21;
          }
        }
        v7 = (CACTextMarkerRange *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v7);

      v22 = v30;
      if (!v30)
      {
        v23 = v31;
        goto LABEL_19;
      }
      v23 = v31;
      if (!v31)
      {
LABEL_19:

        goto LABEL_20;
      }
      v24 = [CACTextMarkerRange alloc];
      objc_msgSend(v30, "textMarkerRange");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "startMarker");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "textMarkerRange");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "endMarker");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[CACTextMarkerRange initWithStartMarker:endMarker:](v24, "initWithStartMarker:endMarker:", v25, v27);

      v23 = v31;
    }
    else
    {
      v23 = 0;
      v22 = 0;
    }

    goto LABEL_19;
  }
LABEL_20:

  return v7;
}

- (BOOL)_performActionOnTextSegment:(id)a3
{
  void (**v4)(id, void *);
  void *v5;

  v4 = (void (**)(id, void *))a3;
  -[CACSpokenCommand _markerRangeForTextSegment](self, "_markerRangeForTextSegment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v4[2](v4, v5);

  return v5 != 0;
}

- (BOOL)_performActionOnTextSegmentRange:(id)a3
{
  void (**v4)(id, void *);
  void *v5;

  v4 = (void (**)(id, void *))a3;
  -[CACSpokenCommand _markerRangeForTextSegmentRange](self, "_markerRangeForTextSegmentRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v4[2](v4, v5);

  return v5 != 0;
}

- (void)deleteTextSegment:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__CACSpokenCommand_CACSpokenCommandTextEditing__deleteTextSegment___block_invoke;
  v6[3] = &unk_24F2AD0D0;
  v7 = v4;
  v5 = v4;
  -[CACSpokenCommand _performActionOnTextSegment:](self, "_performActionOnTextSegment:", v6);

}

uint64_t __67__CACSpokenCommand_CACSpokenCommandTextEditing__deleteTextSegment___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteTextAtTextMarkerRange:", a2);
}

- (void)deleteTextSegmentRange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __72__CACSpokenCommand_CACSpokenCommandTextEditing__deleteTextSegmentRange___block_invoke;
  v6[3] = &unk_24F2AD0D0;
  v7 = v4;
  v5 = v4;
  -[CACSpokenCommand _performActionOnTextSegmentRange:](self, "_performActionOnTextSegmentRange:", v6);

}

uint64_t __72__CACSpokenCommand_CACSpokenCommandTextEditing__deleteTextSegmentRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteTextAtTextMarkerRange:", a2);
}

- (void)correctTextSegment:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  -[CACSpokenCommand selectTextSegment:](self, "selectTextSegment:", v4);
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "correctSelection");

}

- (void)correctTextSegmentRange:(id)a3
{
  id v4;
  void *v5;
  CACTextEditingProvider *v6;

  v4 = a3;
  -[CACSpokenCommand selectTextSegmentRange:](self, "selectTextSegmentRange:", v4);
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v4);

  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "correctSelection");

}

- (void)selectTextSegment:(id)a3
{
  -[CACSpokenCommand selectTextSegment:postAction:](self, "selectTextSegment:postAction:", a3, &__block_literal_global_39);
}

- (void)selectTextSegment:(id)a3 postAction:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __78__CACSpokenCommand_CACSpokenCommandTextEditing__selectTextSegment_postAction___block_invoke;
  v10[3] = &unk_24F2AD138;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[CACSpokenCommand _performActionOnTextSegment:](self, "_performActionOnTextSegment:", v10);

}

uint64_t __78__CACSpokenCommand_CACSpokenCommandTextEditing__selectTextSegment_postAction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v4, "nsRange");
  objc_msgSend(v3, "cacSetTextSelectionToRange:", v5, v6);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = objc_msgSend(v4, "nsRange");
  v10 = v9;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, v8, v10);
}

- (void)selectTextSegmentRange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __72__CACSpokenCommand_CACSpokenCommandTextEditing__selectTextSegmentRange___block_invoke;
  v6[3] = &unk_24F2AD0D0;
  v7 = v4;
  v5 = v4;
  -[CACSpokenCommand _performActionOnTextSegmentRange:](self, "_performActionOnTextSegmentRange:", v6);

}

uint64_t __72__CACSpokenCommand_CACSpokenCommandTextEditing__selectTextSegmentRange___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(a2, "nsRange");
  return objc_msgSend(v2, "cacSetTextSelectionToRange:", v3, v4);
}

- (void)selectTextSegmentRange:(id)a3 postAction:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __83__CACSpokenCommand_CACSpokenCommandTextEditing__selectTextSegmentRange_postAction___block_invoke;
  v10[3] = &unk_24F2AD138;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[CACSpokenCommand _performActionOnTextSegmentRange:](self, "_performActionOnTextSegmentRange:", v10);

}

uint64_t __83__CACSpokenCommand_CACSpokenCommandTextEditing__selectTextSegmentRange_postAction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v4, "nsRange");
  objc_msgSend(v3, "cacSetTextSelectionToRange:", v5, v6);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = objc_msgSend(v4, "nsRange");
  v10 = v9;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, v8, v10);
}

- (void)_selectTextSegment:(id)a3 insertionString:(id)a4 commandIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  CACSpokenCommand *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __102__CACSpokenCommand_CACSpokenCommandTextEditing___selectTextSegment_insertionString_commandIdentifier___block_invoke;
  v14[3] = &unk_24F2AD160;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v18 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[CACSpokenCommand _performActionOnTextSegment:](self, "_performActionOnTextSegment:", v14);

}

void __102__CACSpokenCommand_CACSpokenCommandTextEditing___selectTextSegment_insertionString_commandIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  CACTextEditingProvider *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  dispatch_time_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "nsRange");
  objc_msgSend(v4, "substringWithRange:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
  {
    v8 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    -[CACTextEditingProvider textEditingEngine](v8, "textEditingEngine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "recognizedParameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectFromRange:insertionString:commandIdentifier:recognizedParamaters:", v3, v11, v10, v12);

  }
  v13 = dispatch_time(0, 300000000);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __102__CACSpokenCommand_CACSpokenCommandTextEditing___selectTextSegment_insertionString_commandIdentifier___block_invoke_2;
  v15[3] = &unk_24F2AAD70;
  v16 = *(id *)(a1 + 32);
  v17 = v3;
  v14 = v3;
  dispatch_after(v13, MEMORY[0x24BDAC9B8], v15);

}

uint64_t __102__CACSpokenCommand_CACSpokenCommandTextEditing___selectTextSegment_insertionString_commandIdentifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cacSetTextSelectionToRange:", objc_msgSend(*(id *)(a1 + 40), "nsRange"), 0);
}

- (void)_selectTextSegmentRange:(id)a3 insertionString:(id)a4 commandIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  CACSpokenCommand *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __107__CACSpokenCommand_CACSpokenCommandTextEditing___selectTextSegmentRange_insertionString_commandIdentifier___block_invoke;
  v14[3] = &unk_24F2AD160;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v18 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[CACSpokenCommand _performActionOnTextSegmentRange:](self, "_performActionOnTextSegmentRange:", v14);

}

void __107__CACSpokenCommand_CACSpokenCommandTextEditing___selectTextSegmentRange_insertionString_commandIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  CACTextEditingProvider *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  dispatch_time_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "nsRange");
  objc_msgSend(v4, "substringWithRange:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
  {
    v8 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    -[CACTextEditingProvider textEditingEngine](v8, "textEditingEngine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "recognizedParameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectFromRange:insertionString:commandIdentifier:recognizedParamaters:", v3, v11, v10, v12);

  }
  v13 = dispatch_time(0, 300000000);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __107__CACSpokenCommand_CACSpokenCommandTextEditing___selectTextSegmentRange_insertionString_commandIdentifier___block_invoke_2;
  v15[3] = &unk_24F2AAD70;
  v16 = *(id *)(a1 + 32);
  v17 = v3;
  v14 = v3;
  dispatch_after(v13, MEMORY[0x24BDAC9B8], v15);

}

uint64_t __107__CACSpokenCommand_CACSpokenCommandTextEditing___selectTextSegmentRange_insertionString_commandIdentifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cacSetTextSelectionToRange:", objc_msgSend(*(id *)(a1 + 40), "nsRange"), 0);
}

- (void)insertPhraseAfterTextSegment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BEAFEF0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", kCACCommandParameterText);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CACSpokenCommand _selectTextSegment:insertionString:commandIdentifier:](self, "_selectTextSegment:insertionString:commandIdentifier:", v4, v7, CFSTR("Text.InsertPhraseAfterPhrase"));
}

- (void)insertPhraseBeforeTextSegment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BEAFEF0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", kCACCommandParameterText);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CACSpokenCommand _selectTextSegment:insertionString:commandIdentifier:](self, "_selectTextSegment:insertionString:commandIdentifier:", v4, v7, CFSTR("Text.InsertPhraseBeforePhrase"));
}

- (void)changeTextSegment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  CACSpokenCommand *v12;
  id v13;

  v4 = a3;
  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BEAFEF0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", kCACCommandParameterText);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __67__CACSpokenCommand_CACSpokenCommandTextEditing__changeTextSegment___block_invoke;
  v10[3] = &unk_24F2AD188;
  v11 = v4;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v4;
  -[CACSpokenCommand _performActionOnTextSegment:](self, "_performActionOnTextSegment:", v10);

}

void __67__CACSpokenCommand_CACSpokenCommandTextEditing__changeTextSegment___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  CACTextEditingProvider *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v11, "nsRange");
  objc_msgSend(v3, "substringWithRange:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    v7 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    -[CACTextEditingProvider textEditingEngine](v7, "textEditingEngine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "recognizedParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectFromRange:insertionString:commandIdentifier:recognizedParamaters:", v11, v9, CFSTR("Text.ChangePhrase"), v10);

  }
}

- (void)changeTextSegmentRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BEAFEF0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", kCACCommandParameterText);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CACSpokenCommand _selectTextSegmentRange:insertionString:commandIdentifier:](self, "_selectTextSegmentRange:insertionString:commandIdentifier:", v4, v7, CFSTR("Text.ChangePhrase"));
}

- (void)capitalizeTextSegment:(id)a3
{
  -[CACSpokenCommand _selectTextSegment:insertionString:commandIdentifier:](self, "_selectTextSegment:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.CapitalizePhrase"));
}

- (void)capitalizeTextSegmentRange:(id)a3
{
  -[CACSpokenCommand _selectTextSegmentRange:insertionString:commandIdentifier:](self, "_selectTextSegmentRange:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.CapitalizePhrase"));
}

- (void)lowercaseTextSegment:(id)a3
{
  -[CACSpokenCommand _selectTextSegment:insertionString:commandIdentifier:](self, "_selectTextSegment:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.LowercasePhrase"));
}

- (void)lowercaseTextSegmentRange:(id)a3
{
  -[CACSpokenCommand _selectTextSegmentRange:insertionString:commandIdentifier:](self, "_selectTextSegmentRange:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.LowercasePhrase"));
}

- (void)uppercaseTextSegment:(id)a3
{
  -[CACSpokenCommand _selectTextSegment:insertionString:commandIdentifier:](self, "_selectTextSegment:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.UppercasePhrase"));
}

- (void)uppercaseTextSegmentRange:(id)a3
{
  -[CACSpokenCommand _selectTextSegmentRange:insertionString:commandIdentifier:](self, "_selectTextSegmentRange:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.UppercasePhrase"));
}

- (void)boldTextSegment:(id)a3
{
  -[CACSpokenCommand _selectTextSegment:insertionString:commandIdentifier:](self, "_selectTextSegment:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.FormatBoldPhrase"));
}

- (void)boldTextSegmentRange:(id)a3
{
  -[CACSpokenCommand _selectTextSegmentRange:insertionString:commandIdentifier:](self, "_selectTextSegmentRange:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.FormatBoldPhrase"));
}

- (void)italicizeTextSegment:(id)a3
{
  -[CACSpokenCommand _selectTextSegment:insertionString:commandIdentifier:](self, "_selectTextSegment:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.FormatItalicPhrase"));
}

- (void)italicizeTextSegmentRange:(id)a3
{
  -[CACSpokenCommand _selectTextSegmentRange:insertionString:commandIdentifier:](self, "_selectTextSegmentRange:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.FormatItalicPhrase"));
}

- (void)underlineTextSegment:(id)a3
{
  -[CACSpokenCommand _selectTextSegment:insertionString:commandIdentifier:](self, "_selectTextSegment:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.FormatUnderlinePhrase"));
}

- (void)underlineTextSegmentRange:(id)a3
{
  -[CACSpokenCommand _selectTextSegmentRange:insertionString:commandIdentifier:](self, "_selectTextSegmentRange:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.FormatUnderlinePhrase"));
}

- (void)putDoubleQuotesAroundTextSegment:(id)a3
{
  -[CACSpokenCommand _selectTextSegment:insertionString:commandIdentifier:](self, "_selectTextSegment:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.PutDoubleQuotesAroundPhrase"));
}

- (void)putDoubleQuotesAroundTextSegmentRange:(id)a3
{
  -[CACSpokenCommand _selectTextSegmentRange:insertionString:commandIdentifier:](self, "_selectTextSegmentRange:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.PutDoubleQuotesAroundPhrase"));
}

- (void)putDoubleCurlyQuotesAroundTextSegment:(id)a3
{
  -[CACSpokenCommand _selectTextSegment:insertionString:commandIdentifier:](self, "_selectTextSegment:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.PutDoubleCurlyQuotesAroundPhrase"));
}

- (void)putDoubleCurlyQuotesAroundTextSegmentRange:(id)a3
{
  -[CACSpokenCommand _selectTextSegmentRange:insertionString:commandIdentifier:](self, "_selectTextSegmentRange:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.PutDoubleCurlyQuotesAroundPhrase"));
}

- (void)putSingleQuotesAroundTextSegment:(id)a3
{
  -[CACSpokenCommand _selectTextSegment:insertionString:commandIdentifier:](self, "_selectTextSegment:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.PutSingleQuotesAroundPhrase"));
}

- (void)putSingleQuotesAroundTextSegmentRange:(id)a3
{
  -[CACSpokenCommand _selectTextSegmentRange:insertionString:commandIdentifier:](self, "_selectTextSegmentRange:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.PutSingleQuotesAroundPhrase"));
}

- (void)putSingleCurlyQuotesAroundTextSegment:(id)a3
{
  -[CACSpokenCommand _selectTextSegment:insertionString:commandIdentifier:](self, "_selectTextSegment:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.PutSingleCurlyQuotesAroundPhrase"));
}

- (void)putSingleCurlyQuotesAroundTextSegmentRange:(id)a3
{
  -[CACSpokenCommand _selectTextSegmentRange:insertionString:commandIdentifier:](self, "_selectTextSegmentRange:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.PutSingleCurlyQuotesAroundPhrase"));
}

- (void)putParenthesesAroundTextSegment:(id)a3
{
  -[CACSpokenCommand _selectTextSegment:insertionString:commandIdentifier:](self, "_selectTextSegment:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.PutParenthesesAroundPhrase"));
}

- (void)putParenthesesAroundTextSegmentRange:(id)a3
{
  -[CACSpokenCommand _selectTextSegmentRange:insertionString:commandIdentifier:](self, "_selectTextSegmentRange:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.PutParenthesesAroundPhrase"));
}

- (void)putSquareBracketsAroundTextSegment:(id)a3
{
  -[CACSpokenCommand _selectTextSegment:insertionString:commandIdentifier:](self, "_selectTextSegment:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.PutSquareBracketsAroundPhrase"));
}

- (void)putSquareBracketsAroundTextSegmentRange:(id)a3
{
  -[CACSpokenCommand _selectTextSegmentRange:insertionString:commandIdentifier:](self, "_selectTextSegmentRange:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.PutSquareBracketsAroundPhrase"));
}

- (void)putCurlyBracesAroundTextSegment:(id)a3
{
  -[CACSpokenCommand _selectTextSegment:insertionString:commandIdentifier:](self, "_selectTextSegment:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.PutCurlyBracesAroundPhrase"));
}

- (void)putCurlyBracesAroundTextSegmentRange:(id)a3
{
  -[CACSpokenCommand _selectTextSegmentRange:insertionString:commandIdentifier:](self, "_selectTextSegmentRange:insertionString:commandIdentifier:", a3, 0, CFSTR("Text.PutCurlyBracesAroundPhrase"));
}

- (void)moveToEndOfTextSegment:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __72__CACSpokenCommand_CACSpokenCommandTextEditing__moveToEndOfTextSegment___block_invoke;
  v6[3] = &unk_24F2AD0D0;
  v7 = v4;
  v5 = v4;
  -[CACSpokenCommand _performActionOnTextSegment:](self, "_performActionOnTextSegment:", v6);

}

uint64_t __72__CACSpokenCommand_CACSpokenCommandTextEditing__moveToEndOfTextSegment___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(a2, "nsRange");
  return objc_msgSend(v2, "cacSetTextSelectionToRange:", v3 + v4, 0);
}

- (void)moveToStartOfTextSegment:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74__CACSpokenCommand_CACSpokenCommandTextEditing__moveToStartOfTextSegment___block_invoke;
  v6[3] = &unk_24F2AD0D0;
  v7 = v4;
  v5 = v4;
  -[CACSpokenCommand _performActionOnTextSegment:](self, "_performActionOnTextSegment:", v6);

}

uint64_t __74__CACSpokenCommand_CACSpokenCommandTextEditing__moveToStartOfTextSegment___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cacSetTextSelectionToRange:", objc_msgSend(a2, "nsRange"), 0);
}

- (void)extendSeletionToTextSegment:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __77__CACSpokenCommand_CACSpokenCommandTextEditing__extendSeletionToTextSegment___block_invoke;
  v6[3] = &unk_24F2AD0D0;
  v7 = v4;
  v5 = v4;
  -[CACSpokenCommand _performActionOnTextSegmentRange:](self, "_performActionOnTextSegmentRange:", v6);

}

uint64_t __77__CACSpokenCommand_CACSpokenCommandTextEditing__extendSeletionToTextSegment___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  void *v8;
  NSUInteger v9;
  NSRange v10;
  NSRange v12;
  NSRange v13;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "selectedTextRange");
  v7 = v6;
  v8 = *(void **)(a1 + 32);
  v9 = objc_msgSend(v4, "nsRange");

  v12.location = v5;
  v12.length = v7;
  v13.location = v9;
  v13.length = 0;
  v10 = NSUnionRange(v12, v13);
  return objc_msgSend(v8, "cacSetTextSelectionToRange:", v10.location, v10.length);
}

- (void)cutTextSegment:(id)a3
{
  id v4;
  id v5;
  CACTextEditingProvider *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__CACSpokenCommand_CACSpokenCommandTextEditing__cutTextSegment___block_invoke;
  v8[3] = &unk_24F2AD1D8;
  v9 = v4;
  v5 = v4;
  -[CACSpokenCommand selectTextSegment:postAction:](self, "selectTextSegment:postAction:", v5, v8);
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v5);
  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pasteboardCut");

}

void __64__CACSpokenCommand_CACSpokenCommandTextEditing__cutTextSegment___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  dispatch_time_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  uint64_t v10;

  v6 = dispatch_time(0, 126000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__CACSpokenCommand_CACSpokenCommandTextEditing__cutTextSegment___block_invoke_2;
  block[3] = &unk_24F2AD1B0;
  v8 = *(id *)(a1 + 32);
  v9 = a2;
  v10 = a3;
  dispatch_after(v6, MEMORY[0x24BDAC9B8], block);

}

uint64_t __64__CACSpokenCommand_CACSpokenCommandTextEditing__cutTextSegment___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cacSetTextSelectionToRange:", *(_QWORD *)(a1 + 40), 0);
}

- (void)cutTextSegmentRange:(id)a3
{
  id v4;
  id v5;
  CACTextEditingProvider *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__CACSpokenCommand_CACSpokenCommandTextEditing__cutTextSegmentRange___block_invoke;
  v8[3] = &unk_24F2AD1D8;
  v9 = v4;
  v5 = v4;
  -[CACSpokenCommand selectTextSegmentRange:postAction:](self, "selectTextSegmentRange:postAction:", v5, v8);
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v5);
  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pasteboardCut");

}

void __69__CACSpokenCommand_CACSpokenCommandTextEditing__cutTextSegmentRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  dispatch_time_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  uint64_t v10;

  v6 = dispatch_time(0, 126000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__CACSpokenCommand_CACSpokenCommandTextEditing__cutTextSegmentRange___block_invoke_2;
  block[3] = &unk_24F2AD1B0;
  v8 = *(id *)(a1 + 32);
  v9 = a2;
  v10 = a3;
  dispatch_after(v6, MEMORY[0x24BDAC9B8], block);

}

uint64_t __69__CACSpokenCommand_CACSpokenCommandTextEditing__cutTextSegmentRange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cacSetTextSelectionToRange:", *(_QWORD *)(a1 + 40), 0);
}

- (void)copyTextSegment:(id)a3
{
  id v4;
  id v5;
  CACTextEditingProvider *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__CACSpokenCommand_CACSpokenCommandTextEditing__copyTextSegment___block_invoke;
  v8[3] = &unk_24F2AD1D8;
  v9 = v4;
  v5 = v4;
  -[CACSpokenCommand selectTextSegment:postAction:](self, "selectTextSegment:postAction:", v5, v8);
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v5);
  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pasteboardCopy");

}

void __65__CACSpokenCommand_CACSpokenCommandTextEditing__copyTextSegment___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  dispatch_time_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  uint64_t v10;

  v6 = dispatch_time(0, 126000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__CACSpokenCommand_CACSpokenCommandTextEditing__copyTextSegment___block_invoke_2;
  block[3] = &unk_24F2AD1B0;
  v8 = *(id *)(a1 + 32);
  v9 = a2;
  v10 = a3;
  dispatch_after(v6, MEMORY[0x24BDAC9B8], block);

}

uint64_t __65__CACSpokenCommand_CACSpokenCommandTextEditing__copyTextSegment___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cacSetTextSelectionToRange:", *(_QWORD *)(a1 + 40), 0);
}

- (void)copyTextSegmentRange:(id)a3
{
  id v4;
  id v5;
  CACTextEditingProvider *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__CACSpokenCommand_CACSpokenCommandTextEditing__copyTextSegmentRange___block_invoke;
  v8[3] = &unk_24F2AD1D8;
  v9 = v4;
  v5 = v4;
  -[CACSpokenCommand selectTextSegmentRange:postAction:](self, "selectTextSegmentRange:postAction:", v5, v8);
  v6 = -[CACTextEditingProvider initWithSpokenCommand:axElement:]([CACTextEditingProvider alloc], "initWithSpokenCommand:axElement:", self, v5);
  -[CACTextEditingProvider textEditingEngine](v6, "textEditingEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pasteboardCopy");

}

void __70__CACSpokenCommand_CACSpokenCommandTextEditing__copyTextSegmentRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  dispatch_time_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  uint64_t v10;

  v6 = dispatch_time(0, 126000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__CACSpokenCommand_CACSpokenCommandTextEditing__copyTextSegmentRange___block_invoke_2;
  block[3] = &unk_24F2AD1B0;
  v8 = *(id *)(a1 + 32);
  v9 = a2;
  v10 = a3;
  dispatch_after(v6, MEMORY[0x24BDAC9B8], block);

}

uint64_t __70__CACSpokenCommand_CACSpokenCommandTextEditing__copyTextSegmentRange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cacSetTextSelectionToRange:", *(_QWORD *)(a1 + 40), 0);
}

- (id)_strippedPhraseStringsFromStrings:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v9 = objc_msgSend(&unk_24F2CF608, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (!v9)
          goto LABEL_17;
        v10 = v9;
        v11 = 0;
        v12 = *(_QWORD *)v22;
        do
        {
          for (j = 0; j != v10; ++j)
          {
            if (*(_QWORD *)v22 != v12)
              objc_enumerationMutation(&unk_24F2CF608);
            v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
            if (objc_msgSend(v8, "hasPrefix:", v14))
              v11 = objc_msgSend(v14, "length");
          }
          v10 = objc_msgSend(&unk_24F2CF608, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        }
        while (v10);
        if (v11)
        {
          objc_msgSend(v8, "substringFromIndex:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v16);

        }
        else
        {
LABEL_17:
          objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v15);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v5);
  }

  return v20;
}

- (_NSRange)_rangeFromPreviousTextInsertionForAXElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  v3 = a3;
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousTextInsertionSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "axElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "isEqual:", v6);

  if (v7)
  {
    v8 = objc_msgSend(v5, "insertedRange");
    v10 = v9;
  }
  else
  {
    v10 = 0;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v11 = v8;
  v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

- (id)_nBestListFromPreviousTextInsertionForAXElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousTextInsertionSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "insertedCategoryID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "isEqual:", v7);

  if (v8)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v5, "recognizedParams");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", kCACCommandParameterTextSequence);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    v10 = (void *)v13;
    if (v13)
    {
      v20 = v3;
      v14 = *(_QWORD *)v22;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v15);
          objc_msgSend(v16, "objectForKey:", kCACCommandParameterBuiltInIdentifier);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", v6);

          if (v18)
          {
            objc_msgSend(v16, "objectForKey:", kCACCommandParameterTextVariants);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_17;
          }
          v15 = (char *)v15 + 1;
        }
        while (v10 != v15);
        v10 = (void *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v10)
          continue;
        break;
      }
LABEL_17:
      v3 = v20;
    }

  }
  return v10;
}

- (int64_t)_textSegmentCardinalNumber
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BEAFF40]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", kCACCommandParameterText);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_3;
  -[CACSpokenCommand recognizedParameters](self, "recognizedParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BEAFF20]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", kCACCommandParameterText);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 1;
LABEL_3:
  v8 = (int)objc_msgSend(v5, "intValue");

  return v8;
}

void __53__CACSpokenCommand_CACSpokenCommandGestures__endDrag__block_invoke_5_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_229A40000, log, OS_LOG_TYPE_ERROR, "Attempted to end drag, but was neither in a drag gesture nor in a drag and drop session.", v1, 2u);
}

+ (void)displayRecognizedMessageUsingAttributedString:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_229A40000, a2, OS_LOG_TYPE_ERROR, "Did not receive a completion callback within the timeout for VoiceOver announcement: %@", v4, 0xCu);

}

void __35__CACSpokenCommand_searchSpotlight__block_invoke_497_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_229A40000, v0, v1, "Search Spotlight 6.5. Failed to find focus.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __35__CACSpokenCommand_searchSpotlight__block_invoke_497_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_229A40000, v0, v1, "Search Spotlight 6.4. Search phrase already entered.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __35__CACSpokenCommand_searchSpotlight__block_invoke_497_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_229A40000, v0, v1, "Search Spotlight 6.3. Entering dictated text.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __35__CACSpokenCommand_searchSpotlight__block_invoke_497_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_229A40000, v0, v1, "Search Spotlight 6.2. Already empty.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __35__CACSpokenCommand_searchSpotlight__block_invoke_497_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_229A40000, v0, v1, "Search Spotlight 6.1. Has existing text. Deleting all.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __35__CACSpokenCommand_searchSpotlight__block_invoke_497_cold_6(void *a1, NSObject *a2)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = objc_msgSend(a1, "hasTextEntry");
  _os_log_debug_impl(&dword_229A40000, a2, OS_LOG_TYPE_DEBUG, "Search Spotlight 6. Trying to input text. hasTextEntry: %d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_1();
}

void __65__CACSpokenCommand_CACSpokenCommandHardware__activateSpeakScreen__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_229A40000, a2, OS_LOG_TYPE_ERROR, "Failed to activate Speak Screen: %@", (uint8_t *)&v2, 0xCu);
}

@end
