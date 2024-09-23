@implementation NoteWKWebView

- (BOOL)supportsTextReplacement
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;

  -[NoteWKWebView noteHTMLEditorView](self, "noteHTMLEditorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEditable");

  if (v4)
  {
    -[NoteWKWebView noteHTMLEditorView](self, "noteHTMLEditorView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    -[NoteWKWebView noteHTMLEditorView](self, "noteHTMLEditorView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v8, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NoteWKWebView noteHTMLEditorView](self, "noteHTMLEditorView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "noteHTMLEditorViewShouldBeginEditing:isUserInitiated:", v11, 1);
    }
    else
    {
      if ((objc_msgSend(v8, "isEditable") & 1) != 0)
      {
        v12 = 1;
LABEL_9:

        return v12;
      }
      -[NoteWKWebView noteHTMLEditorView](self, "noteHTMLEditorView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "layoutDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NoteWKWebView noteHTMLEditorView](self, "noteHTMLEditorView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isNoteHTMLEditorViewVisible:", v13);

    }
    goto LABEL_9;
  }
  return 0;
}

- (BOOL)becomeFirstResponder
{
  _BOOL4 v3;
  objc_super v5;

  v3 = -[NoteWKWebView canBecomeFirstResponder](self, "canBecomeFirstResponder");
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)NoteWKWebView;
    LOBYTE(v3) = -[NoteWKWebView becomeFirstResponder](&v5, sel_becomeFirstResponder);
  }
  return v3;
}

- (void)toggleBoldface:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NoteWKWebView;
  v4 = a3;
  -[NoteWKWebView toggleBoldface:](&v5, sel_toggleBoldface_, v4);
  -[NoteWKWebView calloutOptionInvoked:sender:](self, "calloutOptionInvoked:sender:", 4, v4, v5.receiver, v5.super_class);

}

- (void)toggleItalics:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NoteWKWebView;
  v4 = a3;
  -[NoteWKWebView toggleItalics:](&v5, sel_toggleItalics_, v4);
  -[NoteWKWebView calloutOptionInvoked:sender:](self, "calloutOptionInvoked:sender:", 5, v4, v5.receiver, v5.super_class);

}

- (void)toggleUnderline:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NoteWKWebView;
  v4 = a3;
  -[NoteWKWebView toggleUnderline:](&v5, sel_toggleUnderline_, v4);
  -[NoteWKWebView calloutOptionInvoked:sender:](self, "calloutOptionInvoked:sender:", 6, v4, v5.receiver, v5.super_class);

}

- (void)select:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[NoteWKWebView calloutOptionInvoked:sender:](self, "calloutOptionInvoked:sender:", 0, v4);
  v5.receiver = self;
  v5.super_class = (Class)NoteWKWebView;
  -[NoteWKWebView select:](&v5, sel_select_, v4);

}

- (void)selectAll:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[NoteWKWebView calloutOptionInvoked:sender:](self, "calloutOptionInvoked:sender:", 1, v4);
  v5.receiver = self;
  v5.super_class = (Class)NoteWKWebView;
  -[NoteWKWebView selectAll:](&v5, sel_selectAll_, v4);

}

- (void)calloutOptionInvoked:(int64_t)a3 sender:(id)a4
{
  id v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;

  v6 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[NoteWKWebView noteHTMLEditorView](self, "noteHTMLEditorView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0)
      return;
    -[NoteWKWebView noteHTMLEditorView](self, "noteHTMLEditorView");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NoteWKWebView noteHTMLEditorView](self, "noteHTMLEditorView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "noteHTMLEditorView:didInvokeFormattingCalloutOption:", v12, a3);
    goto LABEL_7;
  }
  if (!v6)
  {
    -[NoteWKWebView noteHTMLEditorView](self, "noteHTMLEditorView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[NoteWKWebView noteHTMLEditorView](self, "noteHTMLEditorView");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NoteWKWebView noteHTMLEditorView](self, "noteHTMLEditorView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "noteHTMLEditorView:didInvokeStyleFormattingOption:", v12, a3);
LABEL_7:

    }
  }
}

- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NoteWKWebView;
  -[NoteWKWebView findInteraction:didBeginFindSession:](&v6, sel_findInteraction_didBeginFindSession_, a3, a4);
  self->_hasActiveFindSession = 1;
  -[NoteWKWebView noteHTMLEditorView](self, "noteHTMLEditorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWebViewEditability");

}

- (void)findInteraction:(id)a3 didEndFindSession:(id)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NoteWKWebView;
  -[NoteWKWebView findInteraction:didEndFindSession:](&v7, sel_findInteraction_didEndFindSession_, a3, a4);
  if (self->_hasActiveFindSession)
  {
    -[NoteWKWebView noteHTMLEditorView](self, "noteHTMLEditorView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSelectionToEnd");

    self->_hasActiveFindSession = 0;
  }
  -[NoteWKWebView noteHTMLEditorView](self, "noteHTMLEditorView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateWebViewEditability");

}

- (void)strikethrough:(id)a3
{
  id v4;

  v4 = a3;
  -[NoteWKWebView ic_evaluateJavaScript:](self, "ic_evaluateJavaScript:", CFSTR("document.execCommand(\"strikethrough\", false, null)"));
  -[NoteWKWebView calloutOptionInvoked:sender:](self, "calloutOptionInvoked:sender:", 7, v4);

}

- (void)paste:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC3AC0];
  v6 = -[NoteWKWebView _dataOwnerForPaste](self, "_dataOwnerForPaste");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __23__NoteWKWebView_paste___block_invoke;
  v8[3] = &unk_1E5C1D9A8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "_performAsDataOwner:block:", v6, v8);

}

uint64_t __23__NoteWKWebView_paste___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  objc_super v10;

  objc_msgSend(*(id *)(a1 + 32), "noteHTMLEditorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_3;
  objc_msgSend(*(id *)(a1 + 32), "noteHTMLEditorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "noteHTMLEditorView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "noteHTMLEditorViewShouldPaste:", v6);

  if (v7)
  {
LABEL_3:
    v8 = *(_QWORD *)(a1 + 40);
    v10.receiver = *(id *)(a1 + 32);
    v10.super_class = (Class)NoteWKWebView;
    objc_msgSendSuper2(&v10, sel_paste_, v8);
  }
  return objc_msgSend(*(id *)(a1 + 32), "calloutOptionInvoked:sender:", 2, *(_QWORD *)(a1 + 40));
}

- (void)ic_evaluateJavaScript:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__NoteWKWebView_ic_evaluateJavaScript___block_invoke;
  v6[3] = &unk_1E5C20E90;
  v7 = v4;
  v5 = v4;
  -[NoteWKWebView evaluateJavaScript:completionHandler:](self, "evaluateJavaScript:completionHandler:", v5, v6);

}

void __39__NoteWKWebView_ic_evaluateJavaScript___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    v4 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __39__NoteWKWebView_ic_evaluateJavaScript___block_invoke_cold_1();

  }
}

- (NoteHTMLEditorView)noteHTMLEditorView
{
  return (NoteHTMLEditorView *)objc_loadWeakRetained((id *)&self->_noteHTMLEditorView);
}

- (void)setNoteHTMLEditorView:(id)a3
{
  objc_storeWeak((id *)&self->_noteHTMLEditorView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_noteHTMLEditorView);
}

void __39__NoteWKWebView_ic_evaluateJavaScript___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_2_3(&dword_1AC7A1000, v0, v1, "failed to execute JavaScript: %@\nJavaScript error: %@");
  OUTLINED_FUNCTION_2();
}

@end
