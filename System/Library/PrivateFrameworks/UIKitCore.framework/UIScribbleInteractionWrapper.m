@implementation UIScribbleInteractionWrapper

- (UIScribbleInteractionWrapper)initWithCustomScribbleInteraction:(id)a3 indirectScribbleInteraction:(id)a4
{
  id v6;
  id v7;
  UIScribbleInteractionWrapper *v8;
  UIScribbleInteractionWrapper *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UIScribbleInteractionWrapper;
  v8 = -[UIScribbleInteractionWrapper init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_scribbleInteraction, v6);
    objc_storeWeak((id *)&v9->_indirectInteraction, v7);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  id WeakRetained;
  id v7;
  BOOL v8;
  id v9;
  id v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (id *)v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleInteraction);
    v7 = objc_loadWeakRetained(v5 + 1);
    if (WeakRetained == v7)
    {
      v9 = objc_loadWeakRetained((id *)&self->_indirectInteraction);
      v10 = objc_loadWeakRetained(v5 + 2);
      v8 = v9 == v10;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  void *v3;
  id WeakRetained;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIScribbleInteractionWrapper;
  -[UIScribbleInteractionWrapper description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleInteraction);
  v5 = objc_loadWeakRetained((id *)&self->_indirectInteraction);
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@, %@"), WeakRetained, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (UIView)view
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleInteraction);
  v4 = objc_loadWeakRetained((id *)&self->_indirectInteraction);
  v5 = v4;
  if (WeakRetained)
    v4 = WeakRetained;
  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v6;
}

- (UIInteraction)interaction
{
  id WeakRetained;
  id v4;
  void *v5;
  UIInteraction *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleInteraction);
  v4 = objc_loadWeakRetained((id *)&self->_indirectInteraction);
  v5 = v4;
  if (WeakRetained)
    v4 = WeakRetained;
  v6 = (UIInteraction *)v4;

  return v6;
}

- (BOOL)supportsShouldBegin
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleInteraction);
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (CGRect)frameForElement:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id WeakRetained;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v4 = a3;
  v5 = *MEMORY[0x1E0C9D628];
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  WeakRetained = objc_loadWeakRetained((id *)&self->_indirectInteraction);
  objc_msgSend(WeakRetained, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v4 && WeakRetained)
  {
    objc_msgSend(v10, "indirectScribbleInteraction:frameForElement:", WeakRetained, v4);
    v5 = v12;
    v6 = v13;
    v7 = v14;
    v8 = v15;
  }

  v16 = v5;
  v17 = v6;
  v18 = v7;
  v19 = v8;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)beginSuppressingPlaceholderForElement:(id)a3
{
  return 0;
}

- (BOOL)focusWillTransformElement:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  char v7;
  BOOL v8;

  v4 = a3;
  if (!v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleInteraction);
    objc_msgSend(WeakRetained, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "scribbleInteractionShouldDelayFocus:", WeakRetained);
      goto LABEL_6;
    }
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_indirectInteraction);
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_7;
  v7 = objc_msgSend(v6, "indirectScribbleInteraction:shouldDelayFocusForElement:", WeakRetained, v4);
LABEL_6:
  v8 = v7;
LABEL_8:

  return v8;
}

- (BOOL)shouldBeginAtLocation:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;
  void *v6;
  char v7;

  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleInteraction);
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "scribbleInteraction:shouldBeginAtLocation:", WeakRetained, x, y);
  else
    v7 = 1;

  return v7;
}

- (void)willBeginWritingInElement:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_indirectInteraction);
    objc_msgSend(WeakRetained, "_setHandlingWritingCount:", objc_msgSend(WeakRetained, "_handlingWritingCount") + 1);
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "indirectScribbleInteraction:willBeginWritingInElement:", WeakRetained, v8);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleInteraction);
    objc_msgSend(WeakRetained, "_setHandlingWriting:", 1);
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "scribbleInteractionWillBeginWriting:", WeakRetained);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScribbleInteractionWrapper view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("_UIScribbleWillBeginWriting"), v7);

}

- (void)didFinishWritingInElement:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_indirectInteraction);
    objc_msgSend(WeakRetained, "_setHandlingWritingCount:", objc_msgSend(WeakRetained, "_handlingWritingCount") - 1);
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "indirectScribbleInteraction:didFinishWritingInElement:", WeakRetained, v6);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleInteraction);
    objc_msgSend(WeakRetained, "_setHandlingWriting:", 0);
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "scribbleInteractionDidFinishWriting:", WeakRetained);
  }

}

- (void)requestElementsInRect:(CGRect)a3 completion:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id WeakRetained;
  void *v11;
  _QWORD v12[4];
  id v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_indirectInteraction);
  objc_msgSend(WeakRetained, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__UIScribbleInteractionWrapper_requestElementsInRect_completion___block_invoke;
    v12[3] = &unk_1E16BB9F0;
    v13 = v9;
    objc_msgSend(v11, "indirectScribbleInteraction:requestElementsInRect:completion:", WeakRetained, v12, x, y, width, height);

  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD, uint64_t))v9 + 2))(v9, MEMORY[0x1E0C9AA60], 0x7FFFFFFFFFFFFFFFLL);
  }

}

void __65__UIScribbleInteractionWrapper_requestElementsInRect_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__UIScribbleInteractionWrapper_requestElementsInRect_completion___block_invoke_2;
  v6[3] = &unk_1E16B2F48;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __65__UIScribbleInteractionWrapper_requestElementsInRect_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0x7FFFFFFFFFFFFFFFLL);
}

- (void)focusElement:(id)a3 initialFocusSelectionReferencePoint:(CGPoint)a4 completion:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  _QWORD v13[4];
  id v14;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_indirectInteraction);
  objc_msgSend(WeakRetained, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __92__UIScribbleInteractionWrapper_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke;
    v13[3] = &unk_1E16DABA0;
    v14 = v10;
    objc_msgSend(v12, "indirectScribbleInteraction:focusElementIfNeeded:referencePoint:completion:", WeakRetained, v9, v13, x, y);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

uint64_t __92__UIScribbleInteractionWrapper_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (UIEdgeInsets)hitToleranceInsetsWithDefaultInsets:(UIEdgeInsets)a3 element:(id)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  id WeakRetained;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIEdgeInsets result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleInteraction);
  v11 = objc_loadWeakRetained((id *)&self->_indirectInteraction);
  v12 = v11;
  if (v9 && v11)
  {
    objc_msgSend(v11, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v13, "_indirectScribbleInteraction:hitToleranceInsetsForElement:defaultInsets:", v12, v9, top, left, bottom, right);
LABEL_8:
      top = v14;
      left = v15;
      bottom = v16;
      right = v17;
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v13, "_scribbleInteraction:hitToleranceInsetsWithDefaultInsets:", WeakRetained, top, left, bottom, right);
      goto LABEL_8;
    }
LABEL_9:

  }
  v18 = top;
  v19 = left;
  v20 = bottom;
  v21 = right;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (BOOL)isElementContainer
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_indirectInteraction);
  v3 = WeakRetained != 0;

  return v3;
}

- (BOOL)supportsIsElementInFrontOfElement
{
  return 0;
}

- (BOOL)isElement:(id)a3 inFrontOf:(id)a4
{
  return 0;
}

- (id)suggestedStrokeColorForElement:(id)a3
{
  return 0;
}

- (BOOL)supportsIsElementFocused
{
  return 1;
}

- (BOOL)isElementFocused:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  char v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_indirectInteraction);
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "indirectScribbleInteraction:isElementFocused:", WeakRetained, v4);
  else
    v7 = 0;

  return v7;
}

- (BOOL)shouldDisableInputAssistant
{
  id WeakRetained;
  id v4;
  void *v5;
  char v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleInteraction);
  v4 = objc_loadWeakRetained((id *)&self->_indirectInteraction);
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = objc_msgSend(v5, "_scribbleInteractionShouldDisableInputAssistant:", WeakRetained);
    else
      v6 = 0;

    if ((v6 & 1) != 0)
      goto LABEL_12;
  }
  else
  {
    v6 = 0;
  }
  if (v4)
  {
    objc_msgSend(v4, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = objc_msgSend(v7, "_indirectScribbleInteractionShouldDisableInputAssistant:", v4);
    else
      v6 = 0;

  }
LABEL_12:

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_indirectInteraction);
  objc_destroyWeak((id *)&self->_scribbleInteraction);
}

@end
