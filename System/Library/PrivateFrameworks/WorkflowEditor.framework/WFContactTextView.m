@implementation WFContactTextView

- (WFContactTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  WFContactTextView *v4;
  WFContactTextView *v5;
  void *v6;
  WFContactTextView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFContactTextView;
  v4 = -[WFContactTextView initWithFrame:textContainer:](&v9, sel_initWithFrame_textContainer_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[WFContactTextView setScrollEnabled:](v4, "setScrollEnabled:", 1);
    -[WFContactTextView setShowsHorizontalScrollIndicator:](v5, "setShowsHorizontalScrollIndicator:", 1);
    -[WFContactTextView setShowsVerticalScrollIndicator:](v5, "setShowsVerticalScrollIndicator:", 0);
    -[WFContactTextView setScrollsToTop:](v5, "setScrollsToTop:", 0);
    -[WFContactTextView updateTextContainerInsets](v5, "updateTextContainerInsets");
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
  v4.super_class = (Class)WFContactTextView;
  -[WFContactTextView dealloc](&v4, sel_dealloc);
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
  -[WFContactTextView attributedText](self, "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeOfString:options:", v3, 0);

  v7 = 8.0;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    v7 = 12.0;
  -[WFContactTextView setTextContainerInset:](self, "setTextContainerInset:", v7, 0.0, 8.0, 0.0);

}

- (void)setAttributedText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFContactTextView;
  -[WFContactTextView setAttributedText:](&v4, sel_setAttributedText_, a3);
  -[WFContactTextView updateTextContainerInsets](self, "updateTextContainerInsets");
}

- (void)setText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFContactTextView;
  -[WFContactTextView setText:](&v4, sel_setText_, a3);
  -[WFContactTextView updateTextContainerInsets](self, "updateTextContainerInsets");
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

  objc_msgSend(v7, "setAlignment:", -[WFContactTextView textAlignment](self, "textAlignment"));
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
  -[WFContactTextView font](self, "font");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v8, "initWithString:attributes:", v9, v14);

  -[WFContactTextView setAttributedPlaceholder:](self, "setAttributedPlaceholder:", v15);
  -[WFContactTextView setNeedsLayout](self, "setNeedsLayout");

}

- (NSString)placeholder
{
  void *v2;
  void *v3;

  -[WFContactTextView attributedPlaceholder](self, "attributedPlaceholder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTextAlignment:(int64_t)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFContactTextView;
  -[WFContactTextView setTextAlignment:](&v6, sel_setTextAlignment_, a3);
  -[WFContactTextView placeholder](self, "placeholder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFContactTextView placeholder](self, "placeholder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContactTextView setPlaceholder:](self, "setPlaceholder:", v5);

  }
}

- (void)setFont:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFContactTextView;
  -[WFContactTextView setFont:](&v6, sel_setFont_, a3);
  -[WFContactTextView placeholder](self, "placeholder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFContactTextView placeholder](self, "placeholder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContactTextView setPlaceholder:](self, "setPlaceholder:", v5);

  }
}

- (id)attributesByAddingTintColorToAttributes:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[WFContactTextView tintColor](self, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, *MEMORY[0x24BEBB368]);

  return v4;
}

- (void)updateTextAttachments
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];

  -[WFContactTextView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BEBB318];
  -[WFContactTextView textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__WFContactTextView_updateTextAttachments__block_invoke;
  v7[3] = &unk_24EE24EE8;
  v7[4] = self;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v6, 0, v7);

}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFContactTextView;
  -[WFContactTextView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[WFContactTextView updateTextAttachments](self, "updateTextAttachments");
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
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  objc_super v15;

  v4 = a3;
  -[WFContactTextView attributedText](self, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFContactTextView selectedRange](self, "selectedRange");
  objc_msgSend(v5, "attributedSubstringFromRange:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  WFContactStateFromAttributedString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
  {
    v15.receiver = self;
    v15.super_class = (Class)WFContactTextView;
    -[WFContactTextView cut:](&v15, sel_cut_, v4);
    goto LABEL_5;
  }
  -[WFContactTextView copy:](self, "copy:", v4);

  -[WFContactTextView deleteBackward](self, "deleteBackward");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:", *MEMORY[0x24BEBE988], self);

  -[WFContactTextView delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[WFContactTextView delegate](self, "delegate");
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
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFContactTextView attributedText](self, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFContactTextView selectedRange](self, "selectedRange");
  objc_msgSend(v5, "attributedSubstringFromRange:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  WFContactStateFromAttributedString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = (void *)MEMORY[0x24BDD1770];
    objc_msgSend(v9, "serializedRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dataWithPropertyList:format:options:error:", v13, 200, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)*MEMORY[0x24BDF8620], "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    +[WFValueTextAttachment humanReadableStringFromValueTextAttributedString:](WFContactTextAttachment, "humanReadableStringFromValueTextAttributedString:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = CFSTR("is.workflow.my.contactfield");
    v23[0] = v16;
    v23[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD7E8], "generalPasteboard");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setItems:", v19);

  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)WFContactTextView;
    -[WFContactTextView copy:](&v20, sel_copy_, v4);
  }

}

- (id)attributesForPasting
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[WFContactTextView selectedRange](self, "selectedRange");
  -[WFContactTextView textStorage](self, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v3 >= v5)
  {
    -[WFContactTextView typingAttributes](self, "typingAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
  }
  else
  {
    -[WFContactTextView textStorage](self, "textStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributesAtIndex:effectiveRange:", -[WFContactTextView selectedRange](self, "selectedRange"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

  }
  objc_msgSend(v8, "removeObjectForKey:", *MEMORY[0x24BEBB318]);
  return v8;
}

- (void)pasteAttributedString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;

  v4 = a3;
  -[WFContactTextView textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFContactTextView selectedRange](self, "selectedRange");
  objc_msgSend(v5, "replaceCharactersInRange:withAttributedString:", v6, v7, v4);

  v8 = -[WFContactTextView selectedRange](self, "selectedRange");
  v9 = objc_msgSend(v4, "length");

  -[WFContactTextView setSelectedRange:](self, "setSelectedRange:", v8 + v9, 0);
  -[WFContactTextView updateTextAttachments](self, "updateTextAttachments");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", *MEMORY[0x24BEBE988], self);

  -[WFContactTextView delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[WFContactTextView delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textViewDidChange:", self);

  }
  -[WFContactTextView delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[WFContactTextView delegate](self, "delegate");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "textViewDidChangeSelection:", self);

  }
}

- (void)paste:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  WFContactTextAttachment *v25;
  void *v26;
  void *v27;
  WFContactTextView *v28;
  objc_super v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _QWORD v35[3];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BEBD7E8], "generalPasteboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = CFSTR("is.workflow.my.contactfield");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsPasteboardTypes:", v6);

  if (v7)
  {
    objc_msgSend(v5, "valueForPasteboardType:", CFSTR("is.workflow.my.contactfield"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v8, 0, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC3BD0]), "initWithSerializedRepresentation:variableProvider:parameter:", v9, 0, 0);
    objc_msgSend(v10, "parameterStates");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContactTextView attributesForPasting](self, "attributesForPasting");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    WFAttributedStringFromContactEntries(v11, v12, -[WFContactTextView allowsTextEntry](self, "allowsTextEntry"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFContactTextView pasteAttributedString:](self, "pasteAttributedString:", v13);
    goto LABEL_16;
  }
  objc_msgSend(v5, "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "containsString:", CFSTR(","))
    || !-[WFContactTextView allowsTextEntry](self, "allowsTextEntry"))
  {

    goto LABEL_15;
  }
  -[WFContactTextView supportedPersonProperties](self, "supportedPersonProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", &unk_24EE469B0);

  if (!v16)
  {
LABEL_15:
    v29.receiver = self;
    v29.super_class = (Class)WFContactTextView;
    -[WFContactTextView paste:](&v29, sel_paste_, v4);
    goto LABEL_16;
  }
  v28 = self;
  v17 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v5, "string");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "componentsSeparatedByString:", CFSTR(","));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        v25 = -[WFValueTextAttachment initWithData:ofType:]([WFContactTextAttachment alloc], "initWithData:ofType:", 0, 0);
        -[WFValueTextAttachment setStringValue:](v25, "setStringValue:", v24);
        objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "appendAttributedString:", v26);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v21);
  }

  -[WFContactTextView attributesForPasting](v28, "attributesForPasting");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAttributes:range:", v27, 0, objc_msgSend(v17, "length"));

  -[WFContactTextView pasteAttributedString:](v28, "pasteAttributedString:", v17);
LABEL_16:

}

- (BOOL)allowsTextEntry
{
  return self->_allowsTextEntry;
}

- (void)setAllowsTextEntry:(BOOL)a3
{
  self->_allowsTextEntry = a3;
}

- (NSSet)supportedPersonProperties
{
  return self->_supportedPersonProperties;
}

- (void)setSupportedPersonProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 2792);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedPersonProperties, 0);
}

void __42__WFContactTextView_updateTextAttachments__block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
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
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "textStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributesAtIndex:effectiveRange:", a3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributesByAddingTintColorToAttributes:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setAttributes:", v10);
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
