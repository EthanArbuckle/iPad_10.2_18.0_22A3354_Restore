@implementation SXTextTangierCanvasViewController

- (void)loadView
{
  SXCanvasView *v3;

  v3 = objc_alloc_init(SXCanvasView);
  -[SXTextTangierCanvasViewController setView:](self, "setView:", v3);

}

- (id)actionForHyperlink:(id)a3 inRep:(id)a4 gesture:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  -[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  TSUDynamicCast();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  TSUProtocolCast();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "unscaledLocationForICC:", v12);
  v16 = v15;
  v18 = v17;
  objc_msgSend(v10, "gestureKind");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)*MEMORY[0x24BEB3BD0];
  v21 = v19 == (void *)*MEMORY[0x24BEB3BD0];

  if ((objc_msgSend(v10, "isDone") & 1) != 0 || v19 == v20 && objc_msgSend(v10, "gestureState") == 1)
  {
    objc_msgSend(v10, "gestureKind");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)*MEMORY[0x24BEB3BC8];

    if (v22 == v23)
    {
      v24 = &__block_literal_global_290_0;
    }
    else
    {
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __70__SXTextTangierCanvasViewController_actionForHyperlink_inRep_gesture___block_invoke_3;
      v27[3] = &unk_24D689CD8;
      v28 = v14;
      v29 = v9;
      v30 = v12;
      v31 = v8;
      v32 = v16;
      v33 = v18;
      v34 = v21;
      v24 = (void *)MEMORY[0x219A070A8](v27);

    }
  }
  else
  {
    v24 = &__block_literal_global_26;
  }
  objc_msgSend(MEMORY[0x24BEB3B20], "hyperlinkActionWithHyperlink:inRep:action:", v8, v9, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setPerformImmediately:", 1);
  if (objc_msgSend(v10, "gestureState") == 2)
  {

    v25 = 0;
  }

  return v25;
}

void __70__SXTextTangierCanvasViewController_actionForHyperlink_inRep_gesture___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x24BEB3B30], "sharedHyperlinkUIController");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "endUISession");

}

void __70__SXTextTangierCanvasViewController_actionForHyperlink_inRep_gesture___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "info");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    TSUProtocolCast();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(void **)(a1 + 56);
    v7 = objc_msgSend(v6, "range");
    objc_msgSend(v4, "interactiveCanvasController:interactedWithHyperlink:info:range:touchPoint:touchAndHold:", v5, v6, v3, v7, v8, *(unsigned __int8 *)(a1 + 80), *(double *)(a1 + 64), *(double *)(a1 + 72));

  }
  objc_msgSend(MEMORY[0x24BEB3B30], "sharedHyperlinkUIController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endUISession");

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a4;
  if (sel_delete_ != a3
    && (sel_selectAll_ != a3
     || -[SXTextTangierCanvasViewController selectAllEnabled](self, "selectAllEnabled")
     && -[SXTextTangierCanvasViewController selectionEnabled](self, "selectionEnabled")))
  {
    v9.receiver = self;
    v9.super_class = (Class)SXTextTangierCanvasViewController;
    v7 = -[TSDiOSCanvasViewController canPerformAction:withSender:](&v9, sel_canPerformAction_withSender_, a3, v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)selectAll:(id)a3
{
  id v4;
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
  int v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[SXTextTangierCanvasViewController selectionEnabled](self, "selectionEnabled")
    && -[SXTextTangierCanvasViewController selectAllEnabled](self, "selectAllEnabled"))
  {
    -[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "infosToDisplay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v21 = v4;
      v10 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v12, "storage");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "flowName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("body"));

          if (v15)
          {
            v16 = v12;
            goto LABEL_13;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v9)
          continue;
        break;
      }
      v16 = 0;
LABEL_13:
      v4 = v21;
    }
    else
    {
      v16 = 0;
    }

    -[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v17, "beginEditingRepForInfo:", v16);

    -[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "textInputResponder");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "selectAll:", v4);

  }
}

- (BOOL)interactionShouldBegin:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  objc_super v15;
  objc_super v16;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  TSUProtocolCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (-[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v10, "interactiveCanvasController:shouldBeginInteraction:atPoint:", v11, v7, x, y),
        v11,
        !v12))
  {
    v13 = 0;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)SXTextTangierCanvasViewController;
    if (-[TSDiOSCanvasViewController respondsToSelector:](&v16, sel_respondsToSelector_, sel_interactionShouldBegin_atPoint_))
    {
      v15.receiver = self;
      v15.super_class = (Class)SXTextTangierCanvasViewController;
      v13 = -[TSWPiOSCanvasViewController interactionShouldBegin:atPoint:](&v15, sel_interactionShouldBegin_atPoint_, v7, x, y);
    }
    else
    {
      v13 = 1;
    }
  }

  return v13;
}

- (void)interactionDidEnd:(id)a3
{
  void *v3;
  id v4;

  -[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textInputResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  if (NSSelectorFromString(CFSTR("_accessibilitySpeak:")) == a3
    || NSSelectorFromString(CFSTR("_accessibilityPauseSpeaking:")) == a3)
  {
    -[TSWPiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textInputResponder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "targetForAction:withSender:", a3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (NSSelectorFromString(CFSTR("delete:")) == a3)
  {
    v7 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SXTextTangierCanvasViewController;
    -[SXTextTangierCanvasViewController targetForAction:withSender:](&v11, sel_targetForAction_withSender_, a3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[TSWPiOSCanvasViewController cancelDelayedTapAction](self, "cancelDelayedTapAction");
  v3.receiver = self;
  v3.super_class = (Class)SXTextTangierCanvasViewController;
  -[TSWPiOSCanvasViewController dealloc](&v3, sel_dealloc);
}

- (int64_t)overrideUserInterfaceStyle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[SXTextTangierCanvasViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");

  return v6;
}

- (BOOL)selectionEnabled
{
  return self->_selectionEnabled;
}

- (void)setSelectionEnabled:(BOOL)a3
{
  self->_selectionEnabled = a3;
}

- (BOOL)selectAllEnabled
{
  return self->_selectAllEnabled;
}

- (void)setSelectAllEnabled:(BOOL)a3
{
  self->_selectAllEnabled = a3;
}

@end
