@implementation UITextLiveConversionInteraction

- (UITextLiveConversionInteraction)initWithTextInput:(id)a3
{
  id v5;
  UITextLiveConversionInteraction *v6;
  UITextLiveConversionInteraction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UITextLiveConversionInteraction;
  v6 = -[UITextInteraction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_textInput, a3);

  return v7;
}

- (void)willMoveToView:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITextLiveConversionInteraction;
  -[UITextInteraction willMoveToView:](&v6, sel_willMoveToView_, a3);
  self->_panOffset = 0;
  -[UITextLiveConversionInteraction _liveConversionTapGestureRecognizer](self, "_liveConversionTapGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction addGestureRecognizer:withName:](self, "addGestureRecognizer:withName:", v4, 0x1E1778920);

  -[UITextLiveConversionInteraction _liveConversionPanGestureRecognizer](self, "_liveConversionPanGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction addGestureRecognizer:withName:](self, "addGestureRecognizer:withName:", v5, 0x1E1778940);

}

- (id)_liveConversionTapGestureRecognizer
{
  return -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__tap_);
}

- (id)_liveConversionPanGestureRecognizer
{
  return -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", self, sel__pan_);
}

- (void)_tap:(id)a3
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
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  uint8_t buf[8];
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;
  CGPoint v51;
  CGRect v52;
  CGRect v53;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UITextInput _proxyTextInput](self->_textInput, "_proxyTextInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textInputView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centroid");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v4, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertPoint:fromView:", v12, v9, v11);
  v14 = v13;
  v16 = v15;

  objc_msgSend(v5, "markedTextRange");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v5, "closestPositionToPoint:withinRange:", v17, v14, v16);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectionRectsForRange:", v17);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v46;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v46 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "rect");
          v53 = CGRectInset(v52, -22.0, -22.0);
          v51.x = v14;
          v51.y = v16;
          if (CGRectContainsPoint(v53, v51))
          {
            v42 = v6;

            objc_msgSend(v17, "start");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "selectedTextRange");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "start");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v25, v27);

            objc_msgSend(v17, "start");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v28, v18);

            objc_msgSend(v5, "textRangeFromPosition:toPosition:", v18, v18);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "textInputView");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_opt_respondsToSelector();

            if ((v31 & 1) != 0)
            {
              objc_msgSend(v5, "textInputView");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "performSelector:", sel_attributedSubstringForMarkedRange);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              if (v29 < objc_msgSend(v33, "length"))
              {
                *(_QWORD *)buf = 0;
                v44 = 0;
                v34 = (id)objc_msgSend(v33, "attribute:atIndex:effectiveRange:", off_1EE071DC0, v29, buf);
                if (v44 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  v29 = *(_QWORD *)buf + v44;
                  objc_msgSend(v17, "start");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "positionFromPosition:offset:", v35, v29);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v5, "textRangeFromPosition:toPosition:", v36, v36);
                  v37 = objc_claimAutoreleasedReturnValue();

                  v24 = (void *)v37;
                }
              }
              v38 = v41;

            }
            else
            {
              v38 = v41;
            }
            objc_msgSend(v5, "setSelectedTextRange:", v24, v41);
            if (v29 == v38)
            {
              v6 = v42;
            }
            else
            {
              v6 = v42;
              objc_msgSend(v42, "didChangePhraseBoundary");
            }
            goto LABEL_25;
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        if (v21)
          continue;
        break;
      }
    }

    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "acceptAutocorrectionWithCompletionHandler:", 0);
LABEL_25:

    goto LABEL_26;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "markedTextRange should not be nil", buf, 2u);
    }
LABEL_26:

    goto LABEL_27;
  }
  v39 = _tap____s_category;
  if (!_tap____s_category)
  {
    v39 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v39, (unint64_t *)&_tap____s_category);
  }
  v40 = *(NSObject **)(v39 + 8);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_185066000, v40, OS_LOG_TYPE_ERROR, "markedTextRange should not be nil", buf, 2u);
  }
LABEL_27:

}

- (void)_pan:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  int64_t panOffset;
  id v11;

  v4 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v5);
  v7 = v6;

  -[UITextLiveConversionInteraction pointSize](self, "pointSize");
  v9 = (uint64_t)(v7 / v8);
  panOffset = self->_panOffset;
  if (v9 != panOffset)
  {
    objc_msgSend(v11, "adjustSegmentSize:", v9 - panOffset);
    self->_panOffset = v9;
  }

}

- (double)pointSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;

  -[UITextInput _proxyTextInput](self->_textInput, "_proxyTextInput");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_fontForCaretSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pointSize");
  v5 = v4;

  if (v5 <= 0.0)
  {
    objc_msgSend(off_1E167A828, "systemFontSize");
    v5 = v6;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textInput, 0);
}

@end
