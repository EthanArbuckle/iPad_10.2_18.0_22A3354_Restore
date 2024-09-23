@implementation WFSlotTemplateTypingTextView

- (WFSlotTemplateTypingTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  WFSlotTemplateTypingTextView *v4;
  WFSlotTemplateTypingTextView *v5;
  WFSlotTemplateTypingTextView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFSlotTemplateTypingTextView;
  v4 = -[WFSlotTemplateTypingTextView initWithFrame:textContainer:](&v8, sel_initWithFrame_textContainer_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
    v6 = v4;

  return v5;
}

- (CGRect)caretRectForPosition:(id)a3
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)WFSlotTemplateTypingTextView;
  -[WFSlotTemplateTypingTextView caretRectForPosition:](&v3, sel_caretRectForPosition_, a3);
  return CGRectInset(v4, 0.0, 5.0);
}

- (id)selectionRectsForRange:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFSlotTemplateTypingTextView;
  -[WFSlotTemplateTypingTextView selectionRectsForRange:](&v6, sel_selectionRectsForRange_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_map:", &__block_literal_global_2439);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)deleteBackward
{
  void *v3;
  char v4;
  void *v5;
  objc_super v6;

  -[WFSlotTemplateTypingTextView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFSlotTemplateTypingTextView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "slotTemplateTypingTextViewDidDelete:", self);

  }
  v6.receiver = self;
  v6.super_class = (Class)WFSlotTemplateTypingTextView;
  -[WFSlotTemplateTypingTextView deleteBackward](&v6, sel_deleteBackward);
}

- (void)insertText:(id)a3
{
  id v4;
  void *v5;
  int v6;
  objc_super v7;

  v4 = a3;
  if (-[WFSlotTemplateTypingTextView clearsZeroWhenTyping](self, "clearsZeroWhenTyping"))
  {
    -[WFSlotTemplateTypingTextView text](self, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("0"));

    if (v6)
      -[WFSlotTemplateTypingTextView deleteBackward](self, "deleteBackward");
  }
  -[WFSlotTemplateTypingTextView wf_applyEmojiOverrideFont](self, "wf_applyEmojiOverrideFont");
  v7.receiver = self;
  v7.super_class = (Class)WFSlotTemplateTypingTextView;
  -[WFSlotTemplateTypingTextView insertText:](&v7, sel_insertText_, v4);

  -[WFSlotTemplateTypingTextView wf_applyEmojiOverrideFont](self, "wf_applyEmojiOverrideFont");
}

- (void)wf_replaceRange:(_NSRange)a3 withAttributedText:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  id v8;
  void *v9;
  unint64_t v10;
  NSUInteger v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  length = a3.length;
  location = a3.location;
  v7 = a3.location + a3.length;
  v8 = a4;
  -[WFSlotTemplateTypingTextView attributedText](self, "attributedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  v11 = length;
  if (v7 > v10)
  {
    -[WFSlotTemplateTypingTextView attributedText](self, "attributedText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "length") - location;

  }
  -[WFSlotTemplateTypingTextView undoManager](self, "undoManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "prepareWithInvocationTarget:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v8, "length");
  -[WFSlotTemplateTypingTextView attributedText](self, "attributedText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "attributedSubstringFromRange:", location, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "wf_replaceRange:withAttributedText:", location, v15, v17);

  v23 = (id)objc_msgSend(v8, "mutableCopy");
  -[WFSlotTemplateTypingTextView typingAttributes](self, "typingAttributes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addAttributes:range:", v18, 0, objc_msgSend(v8, "length"));

  -[WFSlotTemplateTypingTextView textStorage](self, "textStorage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "replaceCharactersInRange:withAttributedString:", location, length, v23);

  v20 = objc_msgSend(v8, "length");
  -[WFSlotTemplateTypingTextView setSelectedRange:](self, "setSelectedRange:", v20 + location, 0);
  -[WFSlotTemplateTypingTextView delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v21, "textViewDidChange:", self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "postNotificationName:object:", *MEMORY[0x24BEBE988], self);

}

- (void)cut:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  WFSlotTemplateTypingTextView *v11;

  v4 = a3;
  -[WFSlotTemplateTypingTextView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WFSlotTemplateTypingTextView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __36__WFSlotTemplateTypingTextView_cut___block_invoke;
    v9[3] = &unk_24EE252E0;
    v10 = v4;
    v11 = self;
    objc_msgSend(v7, "slotTemplateTypingTextViewDidCut:withOriginalBlock:", self, v9);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFSlotTemplateTypingTextView;
    -[WFSlotTemplateTypingTextView cut:](&v8, sel_cut_, v4);
  }

}

- (void)copy:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  WFSlotTemplateTypingTextView *v11;

  v4 = a3;
  -[WFSlotTemplateTypingTextView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WFSlotTemplateTypingTextView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __37__WFSlotTemplateTypingTextView_copy___block_invoke;
    v9[3] = &unk_24EE252E0;
    v10 = v4;
    v11 = self;
    objc_msgSend(v7, "slotTemplateTypingTextViewDidCopy:withOriginalBlock:", self, v9);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFSlotTemplateTypingTextView;
    -[WFSlotTemplateTypingTextView copy:](&v8, sel_copy_, v4);
  }

}

- (void)paste:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  WFSlotTemplateTypingTextView *v11;

  v4 = a3;
  -[WFSlotTemplateTypingTextView wf_applyEmojiOverrideFont](self, "wf_applyEmojiOverrideFont");
  -[WFSlotTemplateTypingTextView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WFSlotTemplateTypingTextView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __38__WFSlotTemplateTypingTextView_paste___block_invoke;
    v9[3] = &unk_24EE252E0;
    v10 = v4;
    v11 = self;
    objc_msgSend(v7, "slotTemplateTypingTextViewDidPaste:withOriginalBlock:", self, v9);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFSlotTemplateTypingTextView;
    -[WFSlotTemplateTypingTextView paste:](&v8, sel_paste_, v4);
  }
  -[WFSlotTemplateTypingTextView wf_applyEmojiOverrideFont](self, "wf_applyEmojiOverrideFont");

}

- (void)wf_applyEmojiOverrideFont
{
  void *v3;
  void *v4;
  id v5;

  -[WFSlotTemplateTypingTextView emojiOverrideFont](self, "emojiOverrideFont");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[WFSlotTemplateTypingTextView typingAttributes](self, "typingAttributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    objc_msgSend(v4, "setValue:forKey:", v5, *MEMORY[0x24BEBB360]);
    -[WFSlotTemplateTypingTextView setTypingAttributes:](self, "setTypingAttributes:", v4);

  }
}

- (CGRect)accessibilityFrame
{
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
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[WFSlotTemplateTypingTextView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[WFSlotTemplateTypingTextView textContainerInset](self, "textContainerInset");
  -[WFSlotTemplateTypingTextView convertRect:toView:](self, "convertRect:toView:", 0, v4 + v14, v6 + v11, v8 - (v14 + v12), v10 - (v11 + v13));
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (BOOL)clearsZeroWhenTyping
{
  return self->_clearsZeroWhenTyping;
}

- (void)setClearsZeroWhenTyping:(BOOL)a3
{
  self->_clearsZeroWhenTyping = a3;
}

- (UIFont)emojiOverrideFont
{
  return self->_emojiOverrideFont;
}

- (void)setEmojiOverrideFont:(id)a3
{
  objc_storeStrong((id *)&self->_emojiOverrideFont, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiOverrideFont, 0);
}

id __38__WFSlotTemplateTypingTextView_paste___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)WFSlotTemplateTypingTextView;
  return objc_msgSendSuper2(&v3, sel_paste_, v1);
}

id __37__WFSlotTemplateTypingTextView_copy___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)WFSlotTemplateTypingTextView;
  return objc_msgSendSuper2(&v3, sel_copy_, v1);
}

id __36__WFSlotTemplateTypingTextView_cut___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)WFSlotTemplateTypingTextView;
  return objc_msgSendSuper2(&v3, sel_cut_, v1);
}

uint64_t __55__WFSlotTemplateTypingTextView_selectionRectsForRange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wf_selectionRectByInsetting:", 3.0, 0.0, 3.0, 0.0);
}

@end
