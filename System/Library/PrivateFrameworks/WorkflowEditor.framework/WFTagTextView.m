@implementation WFTagTextView

- (WFTagTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  WFTagTextView *v4;
  WFTagTextView *v5;
  void *v6;
  WFTagTextView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFTagTextView;
  v4 = -[WFTagTextView initWithFrame:textContainer:](&v9, sel_initWithFrame_textContainer_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[WFTagTextView setScrollEnabled:](v4, "setScrollEnabled:", 1);
    -[WFTagTextView setShowsHorizontalScrollIndicator:](v5, "setShowsHorizontalScrollIndicator:", 1);
    -[WFTagTextView setShowsVerticalScrollIndicator:](v5, "setShowsVerticalScrollIndicator:", 0);
    -[WFTagTextView setScrollsToTop:](v5, "setScrollsToTop:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel_textDidChange_, *MEMORY[0x24BEBE988], v5);

    v7 = v5;
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE988], self);

  v4.receiver = self;
  v4.super_class = (Class)WFTagTextView;
  -[WFTagTextView dealloc](&v4, sel_dealloc);
}

- (void)setPlaceholder:(id)a3
{
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BEBB498];
  v5 = (__CFString *)a3;
  objc_msgSend(v4, "defaultParagraphStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setAlignment:", -[WFTagTextView textAlignment](self, "textAlignment"));
  v8 = objc_alloc(MEMORY[0x24BDD1458]);
  if (v5)
    v9 = v5;
  else
    v9 = &stru_24EE26238;
  v16[0] = *MEMORY[0x24BEBB368];
  objc_msgSend(MEMORY[0x24BEBD4B8], "placeholderTextColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BEBB3A8];
  v17[0] = v10;
  v17[1] = v7;
  v12 = *MEMORY[0x24BEBB360];
  v16[1] = v11;
  v16[2] = v12;
  -[WFTagTextView font](self, "font");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v8, "initWithString:attributes:", v9, v14);

  -[WFTagTextView setAttributedPlaceholder:](self, "setAttributedPlaceholder:", v15);
  -[WFTagTextView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setTextAlignment:(int64_t)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFTagTextView;
  -[WFTagTextView setTextAlignment:](&v6, sel_setTextAlignment_, a3);
  -[WFTagTextView placeholder](self, "placeholder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFTagTextView placeholder](self, "placeholder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTagTextView setPlaceholder:](self, "setPlaceholder:", v5);

  }
}

- (void)setFont:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFTagTextView;
  -[WFTagTextView setFont:](&v6, sel_setFont_, a3);
  -[WFTagTextView placeholder](self, "placeholder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFTagTextView placeholder](self, "placeholder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTagTextView setPlaceholder:](self, "setPlaceholder:", v5);

  }
}

- (NSString)placeholder
{
  void *v2;
  void *v3;

  -[WFTagTextView attributedPlaceholder](self, "attributedPlaceholder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)updateTextContainerInsets
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  __int16 v8;

  v8 = -4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTagTextView attributedText](self, "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeOfString:options:", v3, 0);

  v7 = 8.0;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    v7 = 12.0;
  -[WFTagTextView setTextContainerInset:](self, "setTextContainerInset:", v7, 0.0, 8.0, 0.0);

}

- (void)setAttributedText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFTagTextView;
  -[WFTagTextView setAttributedText:](&v4, sel_setAttributedText_, a3);
  -[WFTagTextView updateTextContainerInsets](self, "updateTextContainerInsets");
}

- (void)setText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFTagTextView;
  -[WFTagTextView setText:](&v4, sel_setText_, a3);
  -[WFTagTextView updateTextContainerInsets](self, "updateTextContainerInsets");
}

- (void)updateTextAttachments
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];

  -[WFTagTextView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BEBB318];
  -[WFTagTextView textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__WFTagTextView_updateTextAttachments__block_invoke;
  v7[3] = &unk_24EE24E40;
  v7[4] = self;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v6, 0, v7);

}

- (void)cut:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  objc_super v13;

  v4 = a3;
  -[WFTagTextView attributedText](self, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFTagTextView selectedRange](self, "selectedRange");
  objc_msgSend(v5, "attributedSubstringFromRange:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  WFSerializedTagStringFromAttributedText(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "length"))
  {
    v13.receiver = self;
    v13.super_class = (Class)WFTagTextView;
    -[WFTagTextView cut:](&v13, sel_cut_, v4);
    goto LABEL_5;
  }
  -[WFTagTextView copy:](self, "copy:", v4);

  -[WFTagTextView deleteBackward](self, "deleteBackward");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", *MEMORY[0x24BEBE988], self);

  -[WFTagTextView delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[WFTagTextView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textViewDidChange:", self);
LABEL_5:

  }
}

- (void)copy:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFTagTextView attributedText](self, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFTagTextView selectedRange](self, "selectedRange");
  objc_msgSend(v5, "attributedSubstringFromRange:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  WFSerializedTagStringFromAttributedText(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend((id)*MEMORY[0x24BDF8620], "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v10;
    +[WFValueTextAttachment humanReadableStringFromValueTextAttributedString:](WFTagTextAttachment, "humanReadableStringFromValueTextAttributedString:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = CFSTR("is.workflow.my.tagfield");
    v18[0] = v11;
    v18[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD7E8], "generalPasteboard");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setItems:", v14);

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)WFTagTextView;
    -[WFTagTextView copy:](&v15, sel_copy_, v4);
  }

}

- (void)paste:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  objc_super v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BEBD7E8], "generalPasteboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = CFSTR("is.workflow.my.tagfield");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsPasteboardTypes:", v6);

  if (v7)
  {
    v8 = -[WFTagTextView selectedRange](self, "selectedRange");
    -[WFTagTextView textStorage](self, "textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v8 >= v10)
    {
      -[WFTagTextView typingAttributes](self, "typingAttributes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "mutableCopy");
    }
    else
    {
      -[WFTagTextView textStorage](self, "textStorage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "attributesAtIndex:effectiveRange:", -[WFTagTextView selectedRange](self, "selectedRange"), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "mutableCopy");

    }
    objc_msgSend(v13, "removeObjectForKey:", *MEMORY[0x24BEBB318]);
    objc_msgSend(MEMORY[0x24BEBD7E8], "generalPasteboard");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dataForPasteboardType:", CFSTR("is.workflow.my.tagfield"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v15, 4);
    WFAttributedTextFromSerializedTagString(v16, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTagTextView textStorage](self, "textStorage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[WFTagTextView selectedRange](self, "selectedRange");
    objc_msgSend(v18, "replaceCharactersInRange:withAttributedString:", v19, v20, v17);

    -[WFTagTextView setSelectedRange:](self, "setSelectedRange:", -[WFTagTextView selectedRange](self, "selectedRange") + objc_msgSend(v17, "length"), 0);
    -[WFTagTextView updateTextAttachments](self, "updateTextAttachments");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "postNotificationName:object:", *MEMORY[0x24BEBE988], self);

    -[WFTagTextView delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0)
    {
      -[WFTagTextView delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "textViewDidChange:", self);

    }
    -[WFTagTextView delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_opt_respondsToSelector();

    if ((v26 & 1) != 0)
    {
      -[WFTagTextView delegate](self, "delegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "textViewDidChangeSelection:", self);

    }
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)WFTagTextView;
    -[WFTagTextView paste:](&v28, sel_paste_, v4);
  }

}

void __38__WFTagTextView_updateTextAttachments__block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSRange v13;
  NSRange v14;

  v12 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "textStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributesAtIndex:effectiveRange:", a3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(*(id *)(a1 + 32), "tintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, *MEMORY[0x24BEBB368]);

    objc_msgSend(v12, "setAttributes:", v9);
    v13.location = objc_msgSend(*(id *)(a1 + 32), "selectedRange");
    v14.location = a3;
    v14.length = a4;
    objc_msgSend(v12, "setSelected:", NSIntersectionRange(v13, v14).length == a4);
    if (objc_msgSend(v12, "requiresRedraw"))
    {
      objc_msgSend(*(id *)(a1 + 32), "textStorage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "edited:range:changeInLength:", 1, a3, a4, 0);

    }
  }

}

@end
