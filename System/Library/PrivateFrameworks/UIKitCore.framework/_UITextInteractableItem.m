@implementation _UITextInteractableItem

- (CGRect)bounds
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[_UITextInteractableItem _solverWithUnifyRects:](self, "_solverWithUnifyRects:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "boundingRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (NSArray)rects
{
  void *v2;
  void *v3;

  -[_UITextInteractableItem _solverWithUnifyRects:](self, "_solverWithUnifyRects:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (_UITextInteractableItem)initWithRange:(id)a3 view:(id)a4 location:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  id v10;
  id v11;
  _UITextInteractableItem *v12;
  _UITextInteractableItem *v13;
  objc_super v15;

  y = a5.y;
  x = a5.x;
  v10 = a3;
  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UITextInteractableItem;
  v12 = -[_UITextInteractableItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_range, a3);
    objc_storeWeak((id *)&v13->_textItemInteractingView, v11);
    v13->_location.x = x;
    v13->_location.y = y;
  }

  return v13;
}

+ (id)itemForLink:(id)a3 range:(id)a4 textItemInteractingView:(id)a5 location:(CGPoint)a6
{
  double y;
  double x;
  id v10;
  id v11;
  id v12;
  void *v13;
  _UITextInteractableLinkItem *v14;
  void *v15;

  y = a6.y;
  x = a6.x;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "_textInteractableItemCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "itemForLink:range:", v10, v11);
  v14 = (_UITextInteractableLinkItem *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v14 = -[_UITextInteractableItem initWithRange:view:location:]([_UITextInteractableLinkItem alloc], "initWithRange:view:location:", v11, v12, x, y);
    -[_UITextInteractableLinkItem setLink:](v14, "setLink:", v10);
    +[_UITextLinkInteractionHandler handlerForItem:textContentView:](_UITextLinkInteractionHandler, "handlerForItem:textContentView:", v14, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextInteractableItem setItemHandler:](v14, "setItemHandler:", v15);

  }
  return v14;
}

+ (id)itemForAttachment:(id)a3 range:(id)a4 textItemInteractingView:(id)a5 location:(CGPoint)a6
{
  double y;
  double x;
  id v10;
  id v11;
  id v12;
  void *v13;
  _UITextInteractableAttachmentItem *v14;
  _UITextAttachmentInteractionHandler *v15;

  y = a6.y;
  x = a6.x;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "_textInteractableItemCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "itemForAttachment:range:", v10, v11);
  v14 = (_UITextInteractableAttachmentItem *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v14 = -[_UITextInteractableItem initWithRange:view:location:]([_UITextInteractableAttachmentItem alloc], "initWithRange:view:location:", v11, v12, x, y);
    -[_UITextInteractableAttachmentItem setAttachment:](v14, "setAttachment:", v10);
    v15 = -[_UITextAttachmentInteractionHandler initWithAttachmentItem:textContentView:]([_UITextAttachmentInteractionHandler alloc], "initWithAttachmentItem:textContentView:", v14, v12);
    -[_UITextInteractableItem setItemHandler:](v14, "setItemHandler:", v15);

  }
  return v14;
}

+ (id)customItemWithTag:(id)a3 range:(id)a4 textItemInteractingView:(id)a5 location:(CGPoint)a6
{
  double y;
  double x;
  id v10;
  id v11;
  id v12;
  void *v13;
  _UITextInteractableTagItem *v14;
  _UITextItemInteractionHandler *v15;

  y = a6.y;
  x = a6.x;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "_textInteractableItemCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "itemForTag:range:", v10, v11);
  v14 = (_UITextInteractableTagItem *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v14 = -[_UITextInteractableItem initWithRange:view:location:]([_UITextInteractableTagItem alloc], "initWithRange:view:location:", v11, v12, x, y);
    -[_UITextInteractableTagItem setTag:](v14, "setTag:", v10);
    v15 = -[_UITextItemInteractionHandler initWithItem:textContentView:]([_UITextItemInteractionHandler alloc], "initWithItem:textContentView:", v14, v12);
    -[_UITextInteractableItem setItemHandler:](v14, "setItemHandler:", v15);

  }
  return v14;
}

- (BOOL)isLinkItem
{
  return 0;
}

- (BOOL)isAttachmentItem
{
  return 0;
}

- (BOOL)isTagItem
{
  return 0;
}

- (id)itemRepresentationWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  UITextItem *representedTextItem;
  uint64_t v7;
  BOOL v8;
  UITextItem *v9;
  UITextItem *v10;

  length = a3.length;
  location = a3.location;
  representedTextItem = self->_representedTextItem;
  if (!representedTextItem
    || (-[UITextItem range](representedTextItem, "range") == a3.location ? (v8 = v7 == length) : (v8 = 0), !v8))
  {
    -[_UITextInteractableItem _itemRepresentationWithRange:](self, "_itemRepresentationWithRange:", location, length);
    v9 = (UITextItem *)objc_claimAutoreleasedReturnValue();
    v10 = self->_representedTextItem;
    self->_representedTextItem = v9;

  }
  return self->_representedTextItem;
}

- (id)_itemRepresentationWithRange:(_NSRange)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.location, a3.length);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextInteractableItem.m"), 183, CFSTR("itemRepresentation needs to be implemented by the subclass"));

  return 0;
}

- (id)preparedPrimaryActionWithDefaultAction:(id)a3
{
  UIAction *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  char v10;
  void *v11;
  UIAction *v12;
  UIAction *primaryAction;
  BOOL v14;
  UIAction *v15;
  UIAction *v16;

  v4 = (UIAction *)a3;
  +[UIAction textInteractableItemDefaultAction](UIAction, "textInteractableItemDefaultAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_requested & 1) == 0)
  {
    *(_BYTE *)&self->_requested |= 1u;
    -[_UITextInteractableItem textItemInteractingView](self, "textItemInteractingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_textInteractableItemCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addItem:", self);

    WeakRetained = objc_loadWeakRetained((id *)&self->_textItemInteractingView);
    objc_msgSend(WeakRetained, "_primaryActionForTextInteractableItem:defaultAction:", self, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "isEqual:", v5);
    v11 = v5;
    if ((v10 & 1) != 0 || (v11 = v9) != 0)
    {
      v12 = v11;
      primaryAction = self->_primaryAction;
      self->_primaryAction = v12;

    }
  }
  v14 = -[UIAction isEqual:](self->_primaryAction, "isEqual:", v5);
  v15 = v4;
  if (!v14)
    v15 = self->_primaryAction;
  v16 = v15;

  return v16;
}

- (void)prepareMenuConfigurationWithDefaultMenu:(id)a3
{
  id v4;
  id WeakRetained;
  UITextItemMenuConfiguration *v6;
  UITextItemMenuConfiguration *preparedMenuConfiguration;
  id v8;

  v4 = a3;
  if ((*(_BYTE *)&self->_requested & 2) == 0)
  {
    *(_BYTE *)&self->_requested |= 2u;
    if (!v4)
    {
      +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", MEMORY[0x1E0C9AA60]);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_textItemInteractingView);
    objc_msgSend(WeakRetained, "_menuConfigurationForTextInteractableItem:defaultMenu:", self, v8);
    v6 = (UITextItemMenuConfiguration *)objc_claimAutoreleasedReturnValue();

    preparedMenuConfiguration = self->_preparedMenuConfiguration;
    self->_preparedMenuConfiguration = v6;

    v4 = v8;
  }

}

- (BOOL)showsMenuPreview
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[_UITextInteractableItem preparedMenuConfiguration](self, "preparedMenuConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "_previewView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = 1;
    else
      v6 = -[_UITextInteractableItem _showsPreviewByDefault](self, "_showsPreviewByDefault");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_showsPreviewByDefault
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  _UITextInteractableItem *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v4 = (_UITextInteractableItem *)a3;
  if (v4 == self)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    if (-[_UITextInteractableItem isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      -[_UITextInteractableItem textItemInteractingView](v4, "textItemInteractingView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextInteractableItem textItemInteractingView](self, "textItemInteractingView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      v8 = v6;
      v9 = v8;
      if (v7 == v8)
      {

      }
      else
      {
        LOBYTE(v10) = 0;
        v11 = v8;
        v12 = v7;
        if (!v7 || !v8)
        {
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        v10 = objc_msgSend(v7, "isEqual:", v8);

        if (!v10)
          goto LABEL_18;
      }
      -[_UITextInteractableItem range](v4, "range");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextInteractableItem range](self, "range");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v13;
      v15 = v14;
      v11 = v15;
      if (v12 == v15)
      {
        LOBYTE(v10) = 1;
      }
      else
      {
        LOBYTE(v10) = 0;
        if (v12 && v15)
          LOBYTE(v10) = objc_msgSend(v12, "isEqual:", v15);
      }

      goto LABEL_17;
    }
    LOBYTE(v10) = 0;
  }
LABEL_19:

  return v10;
}

- (int64_t)preferredMenuExpression
{
  return -[UITextItemMenuConfiguration preferredExpression](self->_preparedMenuConfiguration, "preferredExpression");
}

- (id)contextMenuConfiguration
{
  void *v3;
  void *v4;

  -[_UITextInteractableItem itemHandler](self, "itemHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextMenuConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[_UITextInteractableItem _warnForInvalidAction](self, "_warnForInvalidAction");
  return v4;
}

- (void)_warnForInvalidAction
{
  UINotificationFeedbackGenerator *feedbackGenerator;
  UINotificationFeedbackGenerator *v4;
  UINotificationFeedbackGenerator *v5;

  feedbackGenerator = self->_feedbackGenerator;
  if (!feedbackGenerator)
  {
    v4 = objc_alloc_init(UINotificationFeedbackGenerator);
    v5 = self->_feedbackGenerator;
    self->_feedbackGenerator = v4;

    feedbackGenerator = self->_feedbackGenerator;
  }
  -[UINotificationFeedbackGenerator notificationOccurred:](feedbackGenerator, "notificationOccurred:", 1);
}

- (_QWORD)_defaultAction
{
  _QWORD *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[13];
    if (!v2)
    {
      objc_msgSend(a1, "itemHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "primaryAction");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v1[13];
      v1[13] = v4;

      v2 = (void *)v1[13];
    }
    a1 = v2;
  }
  return a1;
}

- (BOOL)canInvokeDefaultAction
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;

  -[_UITextInteractableItem textItemInteractingView](self, "textItemInteractingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[_UITextInteractableItem textItemInteractingView](self, "textItemInteractingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_delegatesAllowingTextItemInteractions");

    if ((v6 & 1) != 0)
      return 1;
  }
  -[_UITextInteractableItem _defaultAction](self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8 != 0;

  return v7;
}

- (void)invokeDefaultAction
{
  void *v3;
  dispatch_time_t v4;
  _QWORD block[5];

  -[_UITextInteractableItem _defaultAction](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UITextInteractableItem _allowInteraction:](self, "_allowInteraction:", 0) && v3)
  {
    if (-[_UITextInteractableItem _allowHighlight](self, "_allowHighlight")
      && !-[_UITextInteractableItem _actionPresentsMenu:](self, "_actionPresentsMenu:", v3))
    {
      -[_UITextInteractableItem highlight](self, "highlight");
      objc_msgSend(v3, "performWithSender:target:", 0, 0);
      v4 = dispatch_time(0, 100000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __46___UITextInteractableItem_invokeDefaultAction__block_invoke;
      block[3] = &unk_1E16B1B28;
      block[4] = self;
      dispatch_after(v4, MEMORY[0x1E0C80D38], block);
    }
    else
    {
      objc_msgSend(v3, "performWithSender:target:", 0, 0);
    }
  }

}

- (BOOL)hasPrimaryAction
{
  void *v3;
  _BOOL4 v4;

  -[_UITextInteractableItem _defaultAction](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = !-[_UITextInteractableItem _actionPresentsMenu:](self, "_actionPresentsMenu:", v3);
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (BOOL)defaultActionPresentsMenu
{
  void *v3;
  BOOL v4;

  -[_UITextInteractableItem _defaultAction](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[_UITextInteractableItem _actionPresentsMenu:](self, "_actionPresentsMenu:", v3);
  else
    v4 = 0;

  return v4;
}

- (BOOL)_actionPresentsMenu:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", 0x1E16F12A0);

  return v4;
}

- (BOOL)_allowInteraction:(int64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  char v8;

  if (a3)
  {
    -[_UITextInteractableItem textItemInteractingView](self, "textItemInteractingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_allowsLinkPreviewInteractionInViewServices");

    if (!v6)
      return 0;
  }
  -[_UITextInteractableItem textItemInteractingView](self, "textItemInteractingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_allowInteraction:forTextInteractableItem:", a3, self);

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[_UITextInteractableItem unhighlight](self, "unhighlight");
  v3.receiver = self;
  v3.super_class = (Class)_UITextInteractableItem;
  -[_UITextInteractableItem dealloc](&v3, sel_dealloc);
}

- (BOOL)_allowHighlight
{
  void *v3;
  char v4;

  -[_UITextInteractableItem textItemInteractingView](self, "textItemInteractingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "_allowHighlightForTextInteractableItem:", self);
  else
    v4 = 1;

  return v4;
}

- (void)highlight
{
  void *v3;
  _UITextItemHighlightView *v4;
  _UITextItemHighlightView *v5;
  _UITextItemHighlightView *v6;
  void *v7;
  void *v8;
  void *v9;
  _UIInvalidatable *v10;
  _UIInvalidatable *selectionHiddenAssertion;
  id v12;

  -[_UITextInteractableItem textItemInteractingView](self, "textItemInteractingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v12 = v3;
    v4 = self->_highlightView;
    if (!self->_highlightView)
    {
      v5 = [_UITextItemHighlightView alloc];
      v6 = -[_UITextItemHighlightView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

      -[_UITextItemHighlightView setCornerRadius:](v6, "setCornerRadius:", 5.0);
      -[_UITextItemHighlightView setHorizontalPadding:](v6, "setHorizontalPadding:", 4.0);
      objc_msgSend(v12, "textInputView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", v6);

      objc_storeStrong((id *)&self->_highlightView, v6);
      v4 = v6;
    }
    -[_UITextInteractableItem rects](self, "rects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextItemHighlightView setTextLineRects:](v4, "setTextLineRects:", v8);

    -[UIView setNeedsDisplay](v4, "setNeedsDisplay");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v12, "_selectionDisplayInteraction");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_obtainSelectionUIHiddenAssertionForReason:animated:", CFSTR("Link Interaction"), 0);
      v10 = (_UIInvalidatable *)objc_claimAutoreleasedReturnValue();
      selectionHiddenAssertion = self->_selectionHiddenAssertion;
      self->_selectionHiddenAssertion = v10;

    }
    v3 = v12;
  }

}

- (void)unhighlight
{
  _UITextItemHighlightView *highlightView;
  _UITextItemHighlightView *v4;
  _UIInvalidatable *selectionHiddenAssertion;

  highlightView = self->_highlightView;
  if (highlightView)
  {
    -[UIView removeFromSuperview](highlightView, "removeFromSuperview");
    v4 = self->_highlightView;
    self->_highlightView = 0;

    -[_UIInvalidatable _invalidate](self->_selectionHiddenAssertion, "_invalidate");
    selectionHiddenAssertion = self->_selectionHiddenAssertion;
    self->_selectionHiddenAssertion = 0;

  }
}

- (id)_solverWithUnifyRects:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _UIBoundingTextRectsSolver *v7;
  void *v8;
  _UIBoundingTextRectsSolver *v9;

  v3 = a3;
  -[_UITextInteractableItem textItemInteractingView](self, "textItemInteractingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [_UIBoundingTextRectsSolver alloc];
  -[_UITextInteractableItem range](self, "range");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_UIBoundingTextRectsSolver initWithTextContainer:range:unifyRects:](v7, "initWithTextContainer:range:unifyRects:", v6, v8, v3);

  return v9;
}

- (UITextRange)range
{
  return self->_range;
}

- (CGPoint)location
{
  double x;
  double y;
  CGPoint result;

  x = self->_location.x;
  y = self->_location.y;
  result.y = y;
  result.x = x;
  return result;
}

- (UITextItem)representedTextItem
{
  return self->_representedTextItem;
}

- (_UITextItemInteractionHandler)itemHandler
{
  return self->_itemHandler;
}

- (void)setItemHandler:(id)a3
{
  objc_storeStrong((id *)&self->_itemHandler, a3);
}

- (_UITextItemInteracting)textItemInteractingView
{
  return (_UITextItemInteracting *)objc_loadWeakRetained((id *)&self->_textItemInteractingView);
}

- (UITextItemMenuConfiguration)preparedMenuConfiguration
{
  return self->_preparedMenuConfiguration;
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return (UIContextMenuInteraction *)objc_loadWeakRetained((id *)&self->_contextMenuInteraction);
}

- (void)setContextMenuInteraction:(id)a3
{
  objc_storeWeak((id *)&self->_contextMenuInteraction, a3);
}

- (UIEditMenuInteraction)editMenuInteraction
{
  return (UIEditMenuInteraction *)objc_loadWeakRetained((id *)&self->_editMenuInteraction);
}

- (void)setEditMenuInteraction:(id)a3
{
  objc_storeWeak((id *)&self->_editMenuInteraction, a3);
}

- (_UITextContent)textContent
{
  return (_UITextContent *)objc_loadWeakRetained((id *)&self->_textContent);
}

- (void)setTextContent:(id)a3
{
  objc_storeWeak((id *)&self->_textContent, a3);
}

- (_UITextItemHighlightView)highlightView
{
  return self->_highlightView;
}

- (UIAction)defaultAction
{
  return self->_defaultAction;
}

- (UINotificationFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_destroyWeak((id *)&self->_textContent);
  objc_destroyWeak((id *)&self->_editMenuInteraction);
  objc_destroyWeak((id *)&self->_contextMenuInteraction);
  objc_storeStrong((id *)&self->_preparedMenuConfiguration, 0);
  objc_destroyWeak((id *)&self->_textItemInteractingView);
  objc_storeStrong((id *)&self->_itemHandler, 0);
  objc_storeStrong((id *)&self->_representedTextItem, 0);
  objc_storeStrong((id *)&self->_range, 0);
  objc_storeStrong((id *)&self->_selectionHiddenAssertion, 0);
  objc_storeStrong((id *)&self->_primaryAction, 0);
}

@end
