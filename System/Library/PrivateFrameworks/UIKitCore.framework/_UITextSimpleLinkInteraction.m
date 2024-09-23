@implementation _UITextSimpleLinkInteraction

- (_UITextSimpleLinkInteraction)initWithShouldProxyContextMenuDelegate:(BOOL)a3
{
  _UITextSimpleLinkInteraction *v4;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *linkTap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UITextSimpleLinkInteraction;
  v4 = -[UITextInteraction init](&v8, sel_init);
  if (v4)
  {
    v5 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", v4, sel_linkTapped_);
    linkTap = v4->_linkTap;
    v4->_linkTap = v5;

    -[UITapGestureRecognizer setNumberOfTouchesRequired:](v4->_linkTap, "setNumberOfTouchesRequired:", 1);
    -[UITapGestureRecognizer setNumberOfTapsRequired:](v4->_linkTap, "setNumberOfTapsRequired:", 1);
    -[UITapGestureRecognizer setAllowableMovement:](v4->_linkTap, "setAllowableMovement:", 10.0);
    -[UIGestureRecognizer setDelaysTouchesEnded:](v4->_linkTap, "setDelaysTouchesEnded:", 0);
    -[UITextInteraction addGestureRecognizer:withName:](v4, "addGestureRecognizer:withName:", v4->_linkTap, 0x1E17788C0);
    v4->_shouldProxyContextMenuDelegate = a3;
  }
  return v4;
}

- (BOOL)shouldProxyContextMenuDelegate
{
  return self->_shouldProxyContextMenuDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_highlightedItem, 0);
  objc_storeStrong((id *)&self->_highlighter, 0);
  objc_storeStrong((id *)&self->_linkTap, 0);
}

- (id)contextMenuDelegateProxy
{
  return 0;
}

- (id)editMenuInteraction
{
  return 0;
}

- (id)gesturesForFailureRequirements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_linkTap;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)itemInteractableView
{
  void *v2;
  id v3;

  -[UITextInteraction view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EDFC7CA0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)textLinkInteractableView
{
  void *v2;
  id v3;

  -[UITextInteraction view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE0300B0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (void)_removeInteractableItemFromCache:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_UITextSimpleLinkInteraction itemInteractableView](self, "itemInteractableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_textInteractableItemCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItem:", v4);

}

- (void)linkTapped:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;

  v10 = a3;
  if (-[_UITextSimpleLinkInteraction _allowItemInteractions](self, "_allowItemInteractions"))
  {
    -[_UITextSimpleLinkInteraction itemInteractableView](self, "itemInteractableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v10, "locationInView:", v4);
      if (v10)
        v5 = v10[23];
      else
        v5 = 0;
      objc_msgSend(v4, "_textInteractableItemAtPoint:precision:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextSimpleLinkInteraction contextMenuInteraction](self, "contextMenuInteraction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7
        || (-[UITextInteraction assistantDelegate](self, "assistantDelegate"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v8, "contextMenuInteraction"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v8,
            v7))
      {
        objc_msgSend(v6, "setContextMenuInteraction:", v7);

      }
      -[_UITextSimpleLinkInteraction editMenuInteraction](self, "editMenuInteraction");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        objc_msgSend(v6, "setEditMenuInteraction:", v9);
      self->_presentingFromSimpleTap = 1;
      objc_msgSend(v6, "invokeDefaultAction");
      self->_presentingFromSimpleTap = 0;
      if ((objc_msgSend(v6, "defaultActionPresentsMenu") & 1) == 0)
        -[_UITextSimpleLinkInteraction _removeInteractableItemFromCache:](self, "_removeInteractableItemFromCache:", v6);

    }
    else
    {
      -[UITextInteraction linkInteractionSession](self, "linkInteractionSession");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "tapOnLinkWithGesture:", v10);
    }

  }
}

- (void)highlight:(id)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void (**v10)(void);
  id v11;
  void (**v12)(void);
  id v13;
  void *v14;
  void (**v15)(void);
  void *v16;
  void (**v17)(void);
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  _UITextSimpleLinkInteraction *v23;
  _QWORD v24[5];
  id v25;
  _QWORD aBlock[4];
  id v27;
  _UITextSimpleLinkInteraction *v28;

  v4 = a3;
  if (-[_UITextSimpleLinkInteraction _allowItemInteractions](self, "_allowItemInteractions"))
  {
    -[_UITextSimpleLinkInteraction itemInteractableView](self, "itemInteractableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v5);
    if (v5)
    {
      if (v4)
        v6 = v4[23];
      else
        v6 = 0;
      objc_msgSend(v5, "_textInteractableItemAtPoint:precision:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __42___UITextSimpleLinkInteraction_highlight___block_invoke;
      aBlock[3] = &unk_1E16B1B50;
      v9 = v7;
      v27 = v9;
      v28 = self;
      v10 = (void (**)(void))_Block_copy(aBlock);
      v24[0] = v8;
      v24[1] = 3221225472;
      v24[2] = __42___UITextSimpleLinkInteraction_highlight___block_invoke_2;
      v24[3] = &unk_1E16B1B50;
      v24[4] = self;
      v11 = v9;
      v25 = v11;
      v12 = (void (**)(void))_Block_copy(v24);
      v18 = v8;
      v19 = 3221225472;
      v20 = __42___UITextSimpleLinkInteraction_highlight___block_invoke_3;
      v21 = &unk_1E16B1B50;
      v22 = v11;
      v23 = self;
      v13 = v11;
      v14 = _Block_copy(&v18);
      v15 = (void (**)(void))_Block_copy(v14);

    }
    else
    {
      -[UITextInteraction linkInteractionSession](self, "linkInteractionSession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        v14 = &__block_literal_global_337;
      else
        v14 = 0;
      if (v16)
        v15 = (void (**)(void))&__block_literal_global_338_1;
      else
        v15 = 0;
      if (v16)
        v12 = (void (**)(void))&__block_literal_global_336;
      else
        v12 = 0;
      if (v16)
        v10 = (void (**)(void))&__block_literal_global_553;
      else
        v10 = 0;

    }
    switch(objc_msgSend(v4, "state", v18, v19, v20, v21))
    {
      case 1:
        v17 = v10;
        if (v10)
          goto LABEL_21;
        break;
      case 2:
        v17 = v12;
        if (v12)
          goto LABEL_21;
        break;
      case 3:
      case 4:
        v17 = v15;
        if (v15)
          goto LABEL_21;
        break;
      case 5:
        v17 = (void (**)(void))v14;
        if (v14)
LABEL_21:
          v17[2]();
        break;
      default:
        break;
    }

  }
}

- (BOOL)interaction_gestureRecognizerShouldBegin:(id)a3
{
  UITapGestureRecognizer *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unint64_t inputPrecision;
  BOOL v11;
  objc_super v13;

  v4 = (UITapGestureRecognizer *)a3;
  v13.receiver = self;
  v13.super_class = (Class)_UITextSimpleLinkInteraction;
  if (-[UITextInteraction interaction_gestureRecognizerShouldBegin:](&v13, sel_interaction_gestureRecognizerShouldBegin_, v4)&& -[_UITextSimpleLinkInteraction _allowItemInteractions](self, "_allowItemInteractions"))
  {
    -[UIGestureRecognizer view](v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITapGestureRecognizer locationInView:](v4, "locationInView:", v5);
    v7 = v6;
    v9 = v8;

    if (v4)
      inputPrecision = v4->super._inputPrecision;
    else
      inputPrecision = 0;
    v11 = -[_UITextSimpleLinkInteraction _beginInteractionSessionForLinkAtPoint:asTap:precision:](self, "_beginInteractionSessionForLinkAtPoint:asTap:precision:", self->_linkTap == v4, inputPrecision, v7, v9);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)interaction_gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UITapGestureRecognizer *v6;
  _QWORD *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  BOOL v14;
  objc_super v16;

  v6 = (UITapGestureRecognizer *)a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_UITextSimpleLinkInteraction;
  if (-[UITextInteraction interaction_gestureRecognizer:shouldReceiveTouch:](&v16, sel_interaction_gestureRecognizer_shouldReceiveTouch_, v6, v7)&& -[_UITextSimpleLinkInteraction _allowItemInteractions](self, "_allowItemInteractions"))
  {
    -[UIGestureRecognizer view](v6, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", v8);
    v10 = v9;
    v12 = v11;

    if (v7)
      v13 = v7[6];
    else
      v13 = 0;
    v14 = -[_UITextSimpleLinkInteraction _canBeginInteractionSessionForLinkAtPoint:asTap:precision:](self, "_canBeginInteractionSessionForLinkAtPoint:asTap:precision:", self->_linkTap == v6, v13, v10, v12);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = v6;
  if (self->_linkTap == a3)
  {
    objc_msgSend(v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", 0x1E1778880) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(v7, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "isEqualToString:", 0x1E17788A0);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  void *v4;
  unint64_t inputPrecision;
  void *v7;
  UITapGestureRecognizer *v8;

  v8 = (UITapGestureRecognizer *)a3;
  -[_UITextSimpleLinkInteraction itemInteractableView](self, "itemInteractableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_linkTap == v8 && v4 != 0)
  {
    -[UITapGestureRecognizer locationInView:](v8, "locationInView:", v4);
    if (v8)
      inputPrecision = v8->super._inputPrecision;
    else
      inputPrecision = 0;
    objc_msgSend(v4, "_textInteractableItemAtPoint:precision:", inputPrecision);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextSimpleLinkInteraction _removeInteractableItemFromCache:](self, "_removeInteractableItemFromCache:", v7);

  }
}

- (BOOL)_canBeginInteractionSessionForLinkAtPoint:(CGPoint)a3 asTap:(BOOL)a4 precision:(unint64_t)a5
{
  _BOOL4 v6;
  double y;
  double x;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  char v16;

  v6 = a4;
  y = a3.y;
  x = a3.x;
  -[_UITextSimpleLinkInteraction itemInteractableView](self, "itemInteractableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "_textInteractableItemAtPoint:precision:", a5, x, y);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v12 != 0;
    if (v12 && v6)
      v14 = objc_msgSend(v12, "canInvokeDefaultAction");
    if (v13 && (v14 & 1) == 0)
      -[_UITextSimpleLinkInteraction _removeInteractableItemFromCache:](self, "_removeInteractableItemFromCache:", v13);

  }
  else
  {
    v14 = 0;
  }
  -[_UITextSimpleLinkInteraction textLinkInteractableView](self, "textLinkInteractableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 | objc_msgSend(v15, "willInteractWithLinkAtPoint:", x, y);

  return v16;
}

- (BOOL)_beginInteractionSessionForLinkAtPoint:(CGPoint)a3 asTap:(BOOL)a4 precision:(unint64_t)a5
{
  _BOOL4 v6;
  double y;
  double x;
  _UITextLinkInteractionSession *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v6 = a4;
  y = a3.y;
  x = a3.x;
  v10 = -[_UITextLinkInteractionSession initWithTextItemInteraction:]([_UITextLinkInteractionSession alloc], "initWithTextItemInteraction:", self);
  -[_UITextSimpleLinkInteraction itemInteractableView](self, "itemInteractableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "_textInteractableItemAtPoint:precision:", a5, x, y);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v13 != 0;
    if (v13 && v6)
      v15 = objc_msgSend(v13, "canInvokeDefaultAction");
  }
  else
  {
    if (!v10 || !-[_UITextLinkInteractionSession canInteractWithLinkAtPoint:](v10, "canInteractWithLinkAtPoint:", x, y))
    {
      v15 = 0;
      goto LABEL_10;
    }
    -[UITextInteraction cancelLinkInteractionSession](self, "cancelLinkInteractionSession");
    -[UITextInteraction root](self, "root");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setLinkInteractionSession:", v10);
    v15 = 1;
  }

LABEL_10:
  return v15;
}

- (BOOL)_allowItemInteractions
{
  void *v3;
  BOOL v4;
  BOOL v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  objc_super v15;

  -[UITextInteraction view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[UITextItemInteractionInteraction mightResponderHaveTextItemInteractions:](UITextItemInteractionInteraction, "mightResponderHaveTextItemInteractions:", v3);

  if (!v4)
  {
    -[UITextInteraction assistantDelegate](self, "assistantDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeSelection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "selectedRange");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v7, "selectedRange");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "_isCaret") & 1) != 0)
      {
        -[UITextInteraction assistantDelegate](self, "assistantDelegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_editMenuAssistant");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "_editMenuIsVisible");

        if (!v13)
          goto LABEL_6;
      }
      else
      {

      }
      v15.receiver = self;
      v15.super_class = (Class)_UITextSimpleLinkInteraction;
      v5 = -[UITextItemInteractionInteraction _allowItemInteractions](&v15, sel__allowItemInteractions);
      goto LABEL_9;
    }
LABEL_6:
    v5 = 1;
LABEL_9:

    return v5;
  }
  return 1;
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void)setContextMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_contextMenuInteraction, a3);
}

@end
