@implementation SXComponentInteractionManager

- (SXComponentInteractionManager)initWithInteractionHandlerManager:(id)a3 viewport:(id)a4
{
  id v7;
  id v8;
  SXComponentInteractionManager *v9;
  SXComponentInteractionManager *v10;
  uint64_t v11;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v13;
  uint64_t v14;
  UILongPressGestureRecognizer *longPressGestureRecognizer;
  void *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SXComponentInteractionManager;
  v9 = -[SXComponentInteractionManager init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_interactionHandlerManager, a3);
    objc_storeStrong((id *)&v10->_viewport, a4);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v10, sel_handleTapGesture_);
    tapGestureRecognizer = v10->_tapGestureRecognizer;
    v10->_tapGestureRecognizer = (UITapGestureRecognizer *)v11;

    -[UITapGestureRecognizer setCancelsTouchesInView:](v10->_tapGestureRecognizer, "setCancelsTouchesInView:", 0);
    objc_msgSend(v8, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addGestureRecognizer:", v10->_tapGestureRecognizer);

    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", v10, sel_handleLongPressGesture_);
    longPressGestureRecognizer = v10->_longPressGestureRecognizer;
    v10->_longPressGestureRecognizer = (UILongPressGestureRecognizer *)v14;

    -[UILongPressGestureRecognizer setCancelsTouchesInView:](v10->_longPressGestureRecognizer, "setCancelsTouchesInView:", 0);
    -[UILongPressGestureRecognizer setMinimumPressDuration:](v10->_longPressGestureRecognizer, "setMinimumPressDuration:", 0.07);
    -[UILongPressGestureRecognizer setDelegate:](v10->_longPressGestureRecognizer, "setDelegate:", v10);
    objc_msgSend(v8, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addGestureRecognizer:", v10->_longPressGestureRecognizer);

    -[UITapGestureRecognizer requireGestureRecognizerToFail:](v10->_tapGestureRecognizer, "requireGestureRecognizerToFail:", v10->_longPressGestureRecognizer);
  }

  return v10;
}

- (BOOL)hasInteractionForLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  BOOL v7;

  y = a3.y;
  x = a3.x;
  -[SXComponentInteractionManager interactionHandlerManager](self, "interactionHandlerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentViewForLocation:", x, y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (id)previewViewControllerForLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id *v17;
  SXComponentInteractionPreviewContext *v18;
  void *v19;
  SXComponentInteractionPreviewContext *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  y = a3.y;
  x = a3.x;
  v27 = *MEMORY[0x24BDAC8D0];
  -[SXComponentInteractionManager interactionHandlerManager](self, "interactionHandlerManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentViewForLocation:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXComponentInteractionManager cancelInteractionForComponentView:](self, "cancelInteractionForComponentView:", v7);
  -[SXComponentInteractionManager animateHighlight:forComponentView:](self, "animateHighlight:forComponentView:", 0, v7);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[SXComponentInteractionManager interactionHandlerManager](self, "interactionHandlerManager", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "interactionsForComponentView:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "handlesType:", 8))
        {
          v10 = v13;
          goto LABEL_11;
        }
      }
      v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(v10, "handler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v14, "previewViewController"), (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v16 = v15;
    v17 = -[SXComponentInteractionPreview initWithInteraction:viewController:]((id *)[SXComponentInteractionPreview alloc], v10, v15);
    -[SXComponentInteractionManager setCurrentPreview:](self, "setCurrentPreview:", v17);

    v18 = [SXComponentInteractionPreviewContext alloc];
    objc_msgSend(v10, "componentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "absoluteFrame");
    v20 = -[SXComponentInteractionPreviewContext initWithViewController:sourceRect:](v18, "initWithViewController:sourceRect:", v16);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)commitViewController:(id)a3
{
  uint64_t v4;
  void *v5;
  id *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (v11)
  {
    -[SXComponentInteractionManager currentPreview](self, "currentPreview");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[SXComponentInteractionManager currentPreview](self, "currentPreview");
      v6 = (id *)objc_claimAutoreleasedReturnValue();
      -[SXComponentInteractionPreview viewController](v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 == v11)
      {
        -[SXComponentInteractionManager currentPreview](self, "currentPreview");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXFullscreenCaption text]((uint64_t)v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "commitViewController:", v11);
        -[SXComponentInteractionManager setCurrentPreview:](self, "setCurrentPreview:", 0);

      }
    }
  }

}

- (void)handleTapGesture:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v4 = objc_msgSend(v24, "state") == 3;
  v5 = v24;
  if (v4)
  {
    objc_msgSend(v24, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "locationInView:", v7);
    v9 = v8;
    v11 = v10;

    objc_msgSend(v24, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "convertPoint:toView:", v14, v9, v11);
    v16 = v15;
    v18 = v17;

    -[SXComponentInteractionManager interactionHandlerManager](self, "interactionHandlerManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "componentViewForLocation:", v16, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[SXComponentInteractionManager interactionHandlerManager](self, "interactionHandlerManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "interactionsForComponentView:type:", v20, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      -[SXComponentInteractionManager handleInteraction:withType:](self, "handleInteraction:withType:", v23, 2);
      -[SXComponentInteractionManager toggleHighlightForComponentView:](self, "toggleHighlightForComponentView:", v20);
    }

    v5 = v24;
  }

}

- (BOOL)accessibilityShouldHandleInteractionForComponentView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SXComponentInteractionManager interactionHandlerManager](self, "interactionHandlerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interactionsForComponentView:type:", v4, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SXComponentInteractionManager handleInteraction:withType:](self, "handleInteraction:withType:", v7, 2);
    -[SXComponentInteractionManager animateHighlight:forComponentView:](self, "animateHighlight:forComponentView:", 0, v4);
  }

  return v7 != 0;
}

- (void)handleLongPressGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  _QWORD v34[5];
  id v35;
  id v36;

  v4 = a3;
  -[SXComponentInteractionManager tapGestureRecognizer](self, "tapGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  objc_msgSend(v4, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertPoint:toView:", v14, v9, v11);
  v16 = v15;
  v18 = v17;

  -[SXComponentInteractionManager interactionHandlerManager](self, "interactionHandlerManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "componentViewForLocation:", v16, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXComponentInteractionManager interactionHandlerManager](self, "interactionHandlerManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "interactionsForComponentView:type:", v20, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "firstObject");
  v23 = objc_claimAutoreleasedReturnValue();

  -[SXComponentInteractionManager interactionHandlerManager](self, "interactionHandlerManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "interactionsForComponentView:type:", v20, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "firstObject");
  v26 = objc_claimAutoreleasedReturnValue();

  if (!v20 || !(v23 | v26))
  {
    objc_msgSend(v4, "cancel");
    goto LABEL_31;
  }
  if (objc_msgSend(v4, "state") == 1)
  {
    -[SXComponentInteractionManager setCurrentComponentView:](self, "setCurrentComponentView:", v20);
    -[SXComponentInteractionManager animateHighlight:forComponentView:](self, "animateHighlight:forComponentView:", 1, v20);
    -[SXComponentInteractionManager setLongPressStartLocation:](self, "setLongPressStartLocation:", v9, v11);
  }
  else if (objc_msgSend(v4, "state") == 2 || objc_msgSend(v4, "state") == 3)
  {
    -[SXComponentInteractionManager currentComponentView](self, "currentComponentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27 != v20)
    {
      -[SXComponentInteractionManager cancelInteractionForComponentView:](self, "cancelInteractionForComponentView:", v20);
      -[SXComponentInteractionManager animateHighlight:forComponentView:](self, "animateHighlight:forComponentView:", 0, v20);
      goto LABEL_31;
    }
  }
  if (objc_msgSend(v4, "state") == 1)
  {
    if (v23)
    {
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __56__SXComponentInteractionManager_handleLongPressGesture___block_invoke;
      v34[3] = &unk_24D687430;
      v34[4] = self;
      v35 = (id)v23;
      v36 = v20;
      +[SXDelayed execute:delay:](SXDelayed, "execute:delay:", v34, 1.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentInteractionManager setLongPressDelay:](self, "setLongPressDelay:", v28);

    }
    goto LABEL_27;
  }
  if (objc_msgSend(v4, "state") == 2)
  {
    -[SXComponentInteractionManager longPressStartLocation](self, "longPressStartLocation");
    v30 = v29 - v9;
    if (v30 < 0.0)
      v30 = -v30;
    if (v30 <= 10.0)
    {
      -[SXComponentInteractionManager longPressStartLocation](self, "longPressStartLocation");
      v32 = v31 - v11;
      v33 = -(v31 - v11);
      if (v32 < 0.0)
        v32 = v33;
      if (v32 <= 10.0)
        goto LABEL_27;
    }
    goto LABEL_25;
  }
  if (objc_msgSend(v4, "state") == 3)
  {
    -[SXComponentInteractionManager handleInteraction:withType:](self, "handleInteraction:withType:", v26, 2);
LABEL_26:
    -[SXComponentInteractionManager animateHighlight:forComponentView:](self, "animateHighlight:forComponentView:", 0, v20);
    goto LABEL_27;
  }
  if (objc_msgSend(v4, "state") == 4 || objc_msgSend(v4, "state") == 5)
  {
LABEL_25:
    -[SXComponentInteractionManager cancelInteractionForComponentView:](self, "cancelInteractionForComponentView:", v20);
    goto LABEL_26;
  }
LABEL_27:
  if (objc_msgSend(v4, "state") == 3 || objc_msgSend(v4, "state") == 4 || objc_msgSend(v4, "state") == 5)
    -[SXComponentInteractionManager setLongPressStartLocation:](self, "setLongPressStartLocation:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
LABEL_31:

}

uint64_t __56__SXComponentInteractionManager_handleLongPressGesture___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "handleInteraction:withType:", *(_QWORD *)(a1 + 40), 4);
  return objc_msgSend(*(id *)(a1 + 32), "animateHighlight:forComponentView:", 0, *(_QWORD *)(a1 + 48));
}

- (void)handleInteraction:(id)a3 withType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  objc_msgSend(v6, "handler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentFrame");
  objc_msgSend(v7, "handleInteractionType:sourceView:sourceRect:", a4, v8);

  objc_msgSend(v6, "componentView");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[SXComponentInteractionManager cancelInteractionForComponentView:](self, "cancelInteractionForComponentView:", v10);
}

- (void)cancelInteractionForComponentView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[SXComponentInteractionManager currentComponentView](self, "currentComponentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[SXComponentInteractionManager longPressDelay](self, "longPressDelay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancel");

    -[SXComponentInteractionManager tapGestureRecognizer](self, "tapGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancel");

    -[SXComponentInteractionManager longPressGestureRecognizer](self, "longPressGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancel");

  }
  -[SXComponentInteractionManager setCurrentComponentView:](self, "setCurrentComponentView:", 0);
}

- (void)animateHighlight:(BOOL)a3 forComponentView:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BDF6F90];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__SXComponentInteractionManager_animateHighlight_forComponentView___block_invoke;
  v9[3] = &unk_24D68BCA8;
  v11 = a3;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 2, v9, 0, 0.1, 0.0);

}

uint64_t __67__SXComponentInteractionManager_animateHighlight_forComponentView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateHighlight:forComponentView:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)toggleHighlightForComponentView:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SXComponentInteractionManager animateHighlight:forComponentView:](self, "animateHighlight:forComponentView:", 1, v4);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__SXComponentInteractionManager_toggleHighlightForComponentView___block_invoke;
  v7[3] = &unk_24D687408;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  v6 = +[SXDelayed execute:delay:](SXDelayed, "execute:delay:", v7, 0.2);

}

uint64_t __65__SXComponentInteractionManager_toggleHighlightForComponentView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animateHighlight:forComponentView:", 0, *(_QWORD *)(a1 + 40));
}

- (void)updateHighlight:(BOOL)a3 forComponentView:(id)a4
{
  objc_msgSend(a4, "setHighlighted:", a3);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  CGPoint v14;
  CGRect v15;

  v6 = a4;
  objc_msgSend(a3, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  -[SXComponentInteractionManager viewport](self, "viewport");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dynamicBounds");
  v14.x = v9;
  v14.y = v11;
  LOBYTE(self) = CGRectContainsPoint(v15, v14);

  return (char)self;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;

  -[SXComponentInteractionManager viewport](self, "viewport", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "panGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "state") == 1)
  {
    v7 = 0;
  }
  else
  {
    -[SXComponentInteractionManager viewport](self, "viewport");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "panGestureRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "state") != 2;

  }
  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (SXComponentInteractionHandlerManager)interactionHandlerManager
{
  return self->_interactionHandlerManager;
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (BOOL)wantsPointyHand
{
  return self->_wantsPointyHand;
}

- (void)setWantsPointyHand:(BOOL)a3
{
  self->_wantsPointyHand = a3;
}

- (SXDelayed)longPressDelay
{
  return self->_longPressDelay;
}

- (void)setLongPressDelay:(id)a3
{
  objc_storeStrong((id *)&self->_longPressDelay, a3);
}

- (CGPoint)longPressStartLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_longPressStartLocation.x;
  y = self->_longPressStartLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLongPressStartLocation:(CGPoint)a3
{
  self->_longPressStartLocation = a3;
}

- (SXComponentInteractionPreview)currentPreview
{
  return self->_currentPreview;
}

- (void)setCurrentPreview:(id)a3
{
  objc_storeStrong((id *)&self->_currentPreview, a3);
}

- (SXComponentView)currentComponentView
{
  return self->_currentComponentView;
}

- (void)setCurrentComponentView:(id)a3
{
  objc_storeStrong((id *)&self->_currentComponentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentComponentView, 0);
  objc_storeStrong((id *)&self->_currentPreview, 0);
  objc_storeStrong((id *)&self->_longPressDelay, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
  objc_storeStrong((id *)&self->_interactionHandlerManager, 0);
}

@end
