@implementation WFSlotTemplateTextStorage

- (WFSlotTemplateTextStorage)init
{
  WFSlotTemplateTextStorage *v2;
  NSTextStorage *v3;
  NSTextStorage *textStorage;
  NSMutableSet *v5;
  NSMutableSet *mutableHighlightedSlots;
  NSMutableSet *v7;
  NSMutableSet *mutableSelectedSlots;
  NSMutableSet *v9;
  NSMutableSet *mutableTypingSlots;
  WFSlotTemplateTextStorage *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WFSlotTemplateTextStorage;
  v2 = -[WFSlotTemplateTextStorage init](&v13, sel_init);
  if (v2)
  {
    v3 = (NSTextStorage *)objc_alloc_init(MEMORY[0x24BEBB508]);
    textStorage = v2->_textStorage;
    v2->_textStorage = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    mutableHighlightedSlots = v2->_mutableHighlightedSlots;
    v2->_mutableHighlightedSlots = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    mutableSelectedSlots = v2->_mutableSelectedSlots;
    v2->_mutableSelectedSlots = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    mutableTypingSlots = v2->_mutableTypingSlots;
    v2->_mutableTypingSlots = v9;

    v2->_contentsTextAlignment = 4;
    v11 = v2;
  }

  return v2;
}

- (id)string
{
  void *v2;
  void *v3;

  -[WFSlotTemplateTextStorage textStorage](self, "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  void *v6;
  void *v7;

  -[WFSlotTemplateTextStorage textStorage](self, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributesAtIndex:effectiveRange:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  uint64_t v9;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  -[WFSlotTemplateTextStorage textStorage](self, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replaceCharactersInRange:withString:", location, length, v7);

  v9 = objc_msgSend(v7, "length");
  -[WFSlotTemplateTextStorage edited:range:changeInLength:](self, "edited:range:changeInLength:", 2, location, length, v9 - length);
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[WFSlotTemplateTextStorage textStorage](self, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttributes:range:", v7, location, length);

  -[WFSlotTemplateTextStorage edited:range:changeInLength:](self, "edited:range:changeInLength:", 1, location, length, 0);
}

- (void)beginEditing
{
  objc_super v3;

  -[WFSlotTemplateTextStorage setEditingLevel:](self, "setEditingLevel:", -[WFSlotTemplateTextStorage editingLevel](self, "editingLevel") + 1);
  v3.receiver = self;
  v3.super_class = (Class)WFSlotTemplateTextStorage;
  -[WFSlotTemplateTextStorage beginEditing](&v3, sel_beginEditing);
}

- (void)endEditing
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFSlotTemplateTextStorage;
  -[WFSlotTemplateTextStorage endEditing](&v4, sel_endEditing);
  if (-[WFSlotTemplateTextStorage editingLevel](self, "editingLevel"))
  {
    -[WFSlotTemplateTextStorage setEditingLevel:](self, "setEditingLevel:", -[WFSlotTemplateTextStorage editingLevel](self, "editingLevel") - 1);
    if (!-[WFSlotTemplateTextStorage editingLevel](self, "editingLevel"))
    {
      -[WFSlotTemplateTextStorage delegate](self, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v3, "slotTemplateStorageDidInvalidateDisplay:", self);

    }
  }
}

- (UIFont)font
{
  UIFont *font;
  UIFont *v4;
  UIFont *v5;

  font = self->_font;
  if (!font)
  {
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v5 = self->_font;
    self->_font = v4;

    font = self->_font;
  }
  return font;
}

- (UIFont)unpopulatedFont
{
  UIFont *unpopulatedFont;

  unpopulatedFont = self->_unpopulatedFont;
  if (unpopulatedFont)
    return unpopulatedFont;
  -[WFSlotTemplateTextStorage font](self, "font");
  return (UIFont *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIColor)textColor
{
  UIColor *textColor;
  UIColor *v4;
  UIColor *v5;

  textColor = self->_textColor;
  if (!textColor)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "wf_labelColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_textColor;
    self->_textColor = v4;

    textColor = self->_textColor;
  }
  return textColor;
}

- (UIColor)tintColor
{
  UIColor *tintColor;
  UIColor *v4;
  UIColor *v5;

  tintColor = self->_tintColor;
  if (!tintColor)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "wf_systemBlueColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_tintColor;
    self->_tintColor = v4;

    tintColor = self->_tintColor;
  }
  return tintColor;
}

- (NSParagraphStyle)paragraphStyle
{
  NSParagraphStyle *paragraphStyle;
  NSParagraphStyle *v4;
  NSParagraphStyle *v5;

  paragraphStyle = self->_paragraphStyle;
  if (!paragraphStyle)
  {
    objc_msgSend(MEMORY[0x24BEBB498], "defaultParagraphStyle");
    v4 = (NSParagraphStyle *)objc_claimAutoreleasedReturnValue();
    v5 = self->_paragraphStyle;
    self->_paragraphStyle = v4;

    paragraphStyle = self->_paragraphStyle;
  }
  return paragraphStyle;
}

- (void)setFont:(id)a3
{
  UIFont *v4;
  void *v5;
  char v6;
  UIFont *font;

  v4 = (UIFont *)a3;
  -[WFSlotTemplateTextStorage font](self, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIFont isEqual:](v4, "isEqual:", v5);

  font = self->_font;
  self->_font = v4;

  if ((v6 & 1) == 0)
    -[WFSlotTemplateTextStorage regenerateEntireAttributedString](self, "regenerateEntireAttributedString");
}

- (void)setUnpopulatedFont:(id)a3
{
  void *v5;
  char v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];

  v8 = a3;
  -[WFSlotTemplateTextStorage unpopulatedFont](self, "unpopulatedFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "isEqual:", v5);

  objc_storeStrong((id *)&self->_unpopulatedFont, a3);
  if ((v6 & 1) == 0)
  {
    v7 = -[WFSlotTemplateTextStorage length](self, "length");
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __48__WFSlotTemplateTextStorage_setUnpopulatedFont___block_invoke;
    v9[3] = &unk_24EE25748;
    v9[4] = self;
    -[WFSlotTemplateTextStorage enumerateAttribute:inRange:options:usingBlock:](self, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("WFSlot"), 0, v7, 0, v9);
  }

}

- (void)setTextColor:(id)a3
{
  UIColor *v4;
  void *v5;
  char v6;
  UIColor *textColor;
  uint64_t v8;
  id v9;

  v4 = (UIColor *)a3;
  -[WFSlotTemplateTextStorage textColor](self, "textColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIColor isEqual:](v4, "isEqual:", v5);

  textColor = self->_textColor;
  self->_textColor = v4;

  if ((v6 & 1) == 0)
  {
    v8 = *MEMORY[0x24BEBB368];
    -[WFSlotTemplateTextStorage textColor](self, "textColor");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[WFSlotTemplateTextStorage replaceAttributeInInanimateText:value:](self, "replaceAttributeInInanimateText:value:", v8, v9);

  }
}

- (void)setTintColor:(id)a3
{
  UIColor *v4;
  void *v5;
  char v6;
  UIColor *tintColor;

  v4 = (UIColor *)a3;
  -[WFSlotTemplateTextStorage tintColor](self, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIColor isEqual:](v4, "isEqual:", v5);

  tintColor = self->_tintColor;
  self->_tintColor = v4;

  if ((v6 & 1) == 0)
    -[WFSlotTemplateTextStorage updateColorsForAllSlots](self, "updateColorsForAllSlots");
}

- (void)setParagraphStyle:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSParagraphStyle *v7;
  NSParagraphStyle *paragraphStyle;

  v4 = a3;
  -[WFSlotTemplateTextStorage paragraphStyle](self, "paragraphStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  v7 = (NSParagraphStyle *)objc_msgSend(v4, "copy");
  paragraphStyle = self->_paragraphStyle;
  self->_paragraphStyle = v7;

  if ((v6 & 1) == 0)
    -[WFSlotTemplateTextStorage regenerateEntireAttributedString](self, "regenerateEntireAttributedString");
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[WFSlotTemplateTextStorage updateColorsForAllSlots](self, "updateColorsForAllSlots");
  }
}

- (void)setDisclosureAttachment:(id)a3
{
  NSTextAttachment *v5;
  NSTextAttachment *v6;

  v5 = (NSTextAttachment *)a3;
  if (self->_disclosureAttachment != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_disclosureAttachment, a3);
    -[WFSlotTemplateTextStorage regenerateEntireAttributedString](self, "regenerateEntireAttributedString");
    v5 = v6;
  }

}

- (void)setOutputButtonAttachment:(id)a3
{
  NSTextAttachment *v5;
  NSTextAttachment *v6;

  v5 = (NSTextAttachment *)a3;
  if (self->_outputButtonAttachment != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_outputButtonAttachment, a3);
    -[WFSlotTemplateTextStorage regenerateEntireAttributedString](self, "regenerateEntireAttributedString");
    v5 = v6;
  }

}

- (UIColor)disabledSlotTitleColor
{
  UIColor *disabledSlotTitleColor;
  UIColor *v4;
  UIColor *v5;

  disabledSlotTitleColor = self->_disabledSlotTitleColor;
  if (!disabledSlotTitleColor)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "wf_labelColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_disabledSlotTitleColor;
    self->_disabledSlotTitleColor = v4;

    disabledSlotTitleColor = self->_disabledSlotTitleColor;
  }
  return disabledSlotTitleColor;
}

- (UIColor)disabledSlotBackgroundColor
{
  UIColor *disabledSlotBackgroundColor;
  UIColor *v4;
  UIColor *v5;

  disabledSlotBackgroundColor = self->_disabledSlotBackgroundColor;
  if (!disabledSlotBackgroundColor)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "wf_tertiarySystemGroupedBackgroundColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_disabledSlotBackgroundColor;
    self->_disabledSlotBackgroundColor = v4;

    disabledSlotBackgroundColor = self->_disabledSlotBackgroundColor;
  }
  return disabledSlotBackgroundColor;
}

- (void)setDisabledSlotTitleColor:(id)a3 backgroundColor:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_disabledSlotTitleColor, a3);
  objc_storeStrong((id *)&self->_disabledSlotBackgroundColor, a4);
  if (-[WFSlotTemplateTextStorage isEnabled](self, "isEnabled"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[WFSlotTemplateTextStorage contents](self, "contents", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = v14;
            if ((objc_msgSend(v15, "isEnabled") & 1) == 0)
              -[WFSlotTemplateTextStorage updateColorsForSlot:](self, "updateColorsForSlot:", v15);

          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
  else
  {
    -[WFSlotTemplateTextStorage updateColorsForAllSlots](self, "updateColorsForAllSlots");
  }

}

- (void)setContents:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "conformsToProtocol:", &unk_2558BA508) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSlotTemplateTextStorage.m"), 231, CFSTR("The contents array may only contain NSString and WFSlotTemplateSlot objects."));

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  if (v5)
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", v5, 1);
  else
    v11 = 0;
  objc_storeStrong((id *)&self->_contents, v11);
  if (v5)

  -[WFSlotTemplateTextStorage mutableHighlightedSlots](self, "mutableHighlightedSlots");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  -[WFSlotTemplateTextStorage mutableSelectedSlots](self, "mutableSelectedSlots");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

  -[WFSlotTemplateTextStorage mutableTypingSlots](self, "mutableTypingSlots");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeAllObjects");

  -[WFSlotTemplateTextStorage regenerateEntireAttributedString](self, "regenerateEntireAttributedString");
}

- (NSSet)highlightedSlots
{
  void *v2;
  void *v3;

  -[WFSlotTemplateTextStorage mutableHighlightedSlots](self, "mutableHighlightedSlots");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSSet *)v3;
}

- (void)didHighlightSlot:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSlotTemplateTextStorage.m"), 248, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("slot"));

  }
  -[WFSlotTemplateTextStorage contents](self, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v10);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSlotTemplateTextStorage.m"), 249, CFSTR("Slot must be a member of the contents array"));

  }
  -[WFSlotTemplateTextStorage mutableHighlightedSlots](self, "mutableHighlightedSlots");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v10);

  -[WFSlotTemplateTextStorage updateColorsForSlot:](self, "updateColorsForSlot:", v10);
}

- (void)didUnhighlightSlot:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSlotTemplateTextStorage.m"), 255, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("slot"));

  }
  -[WFSlotTemplateTextStorage contents](self, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v10);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSlotTemplateTextStorage.m"), 256, CFSTR("Slot must be a member of the contents array"));

  }
  -[WFSlotTemplateTextStorage mutableHighlightedSlots](self, "mutableHighlightedSlots");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v10);

  -[WFSlotTemplateTextStorage updateColorsForSlot:](self, "updateColorsForSlot:", v10);
}

- (NSSet)selectedSlots
{
  void *v2;
  void *v3;

  -[WFSlotTemplateTextStorage mutableSelectedSlots](self, "mutableSelectedSlots");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSSet *)v3;
}

- (void)didSelectSlot:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSlotTemplateTextStorage.m"), 268, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("slot"));

  }
  -[WFSlotTemplateTextStorage contents](self, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v10);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSlotTemplateTextStorage.m"), 269, CFSTR("Slot must be a member of the contents array"));

  }
  -[WFSlotTemplateTextStorage mutableSelectedSlots](self, "mutableSelectedSlots");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v10);

  -[WFSlotTemplateTextStorage updateColorsForSlot:](self, "updateColorsForSlot:", v10);
}

- (void)didDeselectSlot:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSlotTemplateTextStorage.m"), 275, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("slot"));

  }
  -[WFSlotTemplateTextStorage contents](self, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v10);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSlotTemplateTextStorage.m"), 276, CFSTR("Slot must be a member of the contents array"));

  }
  -[WFSlotTemplateTextStorage mutableSelectedSlots](self, "mutableSelectedSlots");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v10);

  -[WFSlotTemplateTextStorage updateColorsForSlot:](self, "updateColorsForSlot:", v10);
}

- (NSSet)typingSlots
{
  void *v2;
  void *v3;

  -[WFSlotTemplateTextStorage mutableTypingSlots](self, "mutableTypingSlots");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSSet *)v3;
}

- (void)didBeginTypingInSlot:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSlotTemplateTextStorage.m"), 288, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("slot"));

  }
  -[WFSlotTemplateTextStorage contents](self, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v10);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSlotTemplateTextStorage.m"), 289, CFSTR("Slot must be a member of the contents array"));

  }
  -[WFSlotTemplateTextStorage mutableTypingSlots](self, "mutableTypingSlots");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v10);

  -[WFSlotTemplateTextStorage updateColorsForSlot:](self, "updateColorsForSlot:", v10);
}

- (void)didEndTypingInSlot:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSlotTemplateTextStorage.m"), 295, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("slot"));

  }
  -[WFSlotTemplateTextStorage contents](self, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v10);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSlotTemplateTextStorage.m"), 296, CFSTR("Slot must be a member of the contents array"));

  }
  -[WFSlotTemplateTextStorage mutableTypingSlots](self, "mutableTypingSlots");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v10);

  -[WFSlotTemplateTextStorage updateColorsForSlot:](self, "updateColorsForSlot:", v10);
}

- (BOOL)slotContainsStrongRTL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  char v10;

  v3 = a3;
  objc_msgSend(v3, "contentAttributedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(v3, "localizedPlaceholder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(v3, "localizedName");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

    v5 = v9;
  }
  v10 = objc_msgSend(v5, "wf_hasStrongRTLCharacter");

  return v10;
}

- (void)regenerateEntireAttributedString
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t v9;
  void *v10;
  id v11;
  id v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  int64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDD1688]);
  v34[0] = *MEMORY[0x24BEBB368];
  -[WFSlotTemplateTextStorage textColor](self, "textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v4;
  v34[1] = *MEMORY[0x24BEBB360];
  -[WFSlotTemplateTextStorage font](self, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFSlotTemplateTextStorage contents](self, "contents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateTextStorage stringForSlotSpacingOpportunity:](self, "stringForSlotSpacingOpportunity:", 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if (objc_msgSend(v7, "count"))
  {
    v9 = 0;
    v32 = v6;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v10;
        v13 = -[WFSlotTemplateTextStorage slotContainsStrongRTL:](self, "slotContainsStrongRTL:", v12);
        if (v9)
        {
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v33);
          objc_msgSend(v3, "appendAttributedString:", v14);

          v6 = v32;
        }
        v8 |= v13;
        -[WFSlotTemplateTextStorage attributedStringForSlot:isRTL:](self, "attributedStringForSlot:isRTL:", v12, v8 & 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendAttributedString:", v15);
        if (v9 < objc_msgSend(v7, "count") - 1)
        {
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v33);
          objc_msgSend(v3, "appendAttributedString:", v16);

          v6 = v32;
        }

        goto LABEL_11;
      }
LABEL_12:

      if (++v9 >= objc_msgSend(v7, "count"))
        goto LABEL_13;
    }
    v11 = v10;
    v8 |= objc_msgSend(v11, "wf_hasStrongRTLCharacter");
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v11, v6);

    objc_msgSend(v3, "appendAttributedString:", v12);
LABEL_11:

    goto LABEL_12;
  }
LABEL_13:
  -[WFSlotTemplateTextStorage disclosureAttachment](self, "disclosureAttachment");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = objc_alloc(MEMORY[0x24BDD1458]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), 160);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithString:", v19);

    objc_msgSend(v3, "appendAttributedString:", v20);
    objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendAttributedString:", v21);

  }
  -[WFSlotTemplateTextStorage outputButtonAttachment](self, "outputButtonAttachment");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = objc_alloc(MEMORY[0x24BDD1458]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), 160);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithString:", v24);

    objc_msgSend(v3, "appendAttributedString:", v25);
    objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendAttributedString:", v26);

  }
  v27 = 2;
  if ((v8 & 1) == 0)
    v27 = 0;
  self->_contentsTextAlignment = v27;
  -[WFSlotTemplateTextStorage paragraphStyle](self, "paragraphStyle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "alignment");

  if (v29 == 4)
  {
    -[WFSlotTemplateTextStorage paragraphStyle](self, "paragraphStyle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "mutableCopy");

    objc_msgSend(v31, "setAlignment:", self->_contentsTextAlignment);
    objc_msgSend(v3, "addAttribute:value:range:", *MEMORY[0x24BEBB3A8], v31, 0, objc_msgSend(v3, "length"));

  }
  -[WFSlotTemplateTextStorage setAttributedString:](self, "setAttributedString:", v3);

}

- (void)replaceAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5
{
  if (a4)
    -[WFSlotTemplateTextStorage addAttribute:value:range:](self, "addAttribute:value:range:", a3, a4, a5.location, a5.length);
  else
    -[WFSlotTemplateTextStorage removeAttribute:range:](self, "removeAttribute:range:", a3, a5.location, a5.length);
}

- (void)replaceAttributeInInanimateText:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[WFSlotTemplateTextStorage beginEditing](self, "beginEditing");
  v8 = -[WFSlotTemplateTextStorage length](self, "length");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __67__WFSlotTemplateTextStorage_replaceAttributeInInanimateText_value___block_invoke;
  v11[3] = &unk_24EE24B28;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[WFSlotTemplateTextStorage enumerateAttributesInRange:options:usingBlock:](self, "enumerateAttributesInRange:options:usingBlock:", 0, v8, 0, v11);
  -[WFSlotTemplateTextStorage endEditing](self, "endEditing");

}

- (id)attributedStringForSlot:(id)a3 isRTL:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[5];
  _QWORD v41[3];
  _QWORD v42[4];

  v4 = a4;
  v42[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDD1688]);
  -[WFSlotTemplateTextStorage stringForSlotSpacingOpportunity:](self, "stringForSlotSpacingOpportunity:", 1);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v8);
  objc_msgSend(v7, "appendAttributedString:", v9);

  v10 = objc_alloc(MEMORY[0x24BDD1458]);
  v11 = 8295;
  if (!v4)
    v11 = 8296;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "initWithString:", v12);

  v36 = (void *)v13;
  objc_msgSend(v7, "appendAttributedString:", v13);
  objc_msgSend(v6, "contentAttributedString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "length"))
  {
    v15 = *MEMORY[0x24BEBB318];
    v16 = objc_msgSend(v14, "length");
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __59__WFSlotTemplateTextStorage_attributedStringForSlot_isRTL___block_invoke;
    v40[3] = &unk_24EE25268;
    v40[4] = self;
    objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v15, 0, v16, 0, v40);
    goto LABEL_10;
  }
  objc_msgSend(v6, "localizedPlaceholder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (v18)
  {
    v19 = objc_alloc(MEMORY[0x24BDD1458]);
    objc_msgSend(v6, "localizedPlaceholder");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "localizedName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "length");

    if (!v22)
      goto LABEL_10;
    v19 = objc_alloc(MEMORY[0x24BDD1458]);
    objc_msgSend(v6, "localizedName");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v20;
  v24 = objc_msgSend(v19, "initWithString:", v20);

  v14 = (void *)v24;
LABEL_10:
  if (objc_msgSend(v14, "length"))
    objc_msgSend(v7, "appendAttributedString:", v14);
  v25 = objc_alloc(MEMORY[0x24BDD1458]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), 8297);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v25, "initWithString:", v26);

  objc_msgSend(v7, "appendAttributedString:", v27);
  v37 = (void *)v8;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v8);
  objc_msgSend(v7, "appendAttributedString:", v28);

  v38 = 0;
  v39 = 0;
  -[WFSlotTemplateTextStorage getColorsForSlot:titleColor:backgroundColor:](self, "getColorsForSlot:titleColor:backgroundColor:", v6, &v39, &v38);
  v29 = v39;
  v30 = v38;
  v41[0] = *MEMORY[0x24BEBB360];
  if (objc_msgSend(v6, "isPopulated"))
    -[WFSlotTemplateTextStorage font](self, "font");
  else
    -[WFSlotTemplateTextStorage unpopulatedFont](self, "unpopulatedFont");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v31;
  v41[1] = *MEMORY[0x24BEBB3A8];
  -[WFSlotTemplateTextStorage paragraphStyle](self, "paragraphStyle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = CFSTR("WFSlot");
  v42[1] = v32;
  v42[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "mutableCopy");

  if (v29)
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v29, *MEMORY[0x24BEBB368]);
  if (v30)
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v30, *MEMORY[0x24BEBB320]);
  objc_msgSend(v7, "addAttributes:range:", v34, 0, objc_msgSend(v7, "length"));

  return v7;
}

- (void)getColorsForSlot:(id)a3 titleColor:(id *)a4 backgroundColor:(id *)a5
{
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  char v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;

  v22 = a3;
  -[WFSlotTemplateTextStorage highlightedSlots](self, "highlightedSlots");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v22);

  -[WFSlotTemplateTextStorage selectedSlots](self, "selectedSlots");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v22);

  -[WFSlotTemplateTextStorage typingSlots](self, "typingSlots");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v22);

  if (-[WFSlotTemplateTextStorage isEnabled](self, "isEnabled"))
    v14 = objc_msgSend(v22, "isEnabled");
  else
    v14 = 0;
  v15 = objc_msgSend(v22, "isInvalid");
  -[WFSlotTemplateTextStorage tintColor](self, "tintColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v13 & 1) == 0)
  {
    if (v11)
    {
      if ((v15 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BEBD4B8], "wf_slotTemplateSlotErrorSelectedTitleColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBD4B8], "wf_slotTemplateSlotErrorSelectedBackgroundColor");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEBD4B8], "wf_slotTemplateSlotSelectedTitleColorWithTintColor:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBD4B8], "wf_slotTemplateSlotSelectedBackgroundColorWithTintColor:", v16);
      }
    }
    else
    {
      if ((v14 & 1) == 0)
      {
        -[WFSlotTemplateTextStorage disabledSlotTitleColor](self, "disabledSlotTitleColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFSlotTemplateTextStorage disabledSlotBackgroundColor](self, "disabledSlotBackgroundColor");
        v20 = objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      if (v9)
      {
        if ((v15 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BEBD4B8], "wf_slotTemplateSlotErrorHighlightedTitleColor");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BEBD4B8], "wf_slotTemplateSlotErrorHighlightedBackgroundColor");
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEBD4B8], "wf_slotTemplateSlotHighlightedTitleColorWithTintColor:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BEBD4B8], "wf_slotTemplateSlotHighlightedBackgroundColorWithTintColor:", v16);
        }
      }
      else if ((v15 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BEBD4B8], "wf_slotTemplateSlotErrorTitleColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBD4B8], "wf_slotTemplateSlotErrorBackgroundColor");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEBD4B8], "wf_slotTemplateSlotTitleColorWithTintColor:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBD4B8], "wf_slotTemplateSlotBackgroundColorWithTintColor:", v16);
      }
    }
    v20 = objc_claimAutoreleasedReturnValue();
LABEL_21:
    v18 = (void *)v20;
    if ((objc_msgSend(v22, "isPopulated") & 1) != 0)
      goto LABEL_24;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "wf_slotTemplateSlotTypingTitleColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "wf_slotTemplateSlotTypingBackgroundColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v22, "isPopulated") & 1) == 0)
  {
LABEL_22:
    objc_msgSend(v17, "colorWithAlphaComponent:", 0.4);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v19 = objc_claimAutoreleasedReturnValue();
LABEL_23:
  v21 = (void *)v19;

  v17 = v21;
LABEL_24:
  if (a4)
    *a4 = objc_retainAutorelease(v17);
  if (a5)
    *a5 = objc_retainAutorelease(v18);

}

- (void)updateColorsForSlot:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = -[WFSlotTemplateTextStorage characterRangeForSlot:includingInsideSpacingOpportunities:](self, "characterRangeForSlot:includingInsideSpacingOpportunities:");
  v7 = v6;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSlotTemplateTextStorage.m"), 517, CFSTR("Tried to update colors for a slot that doesn't exist"));

  }
  -[WFSlotTemplateTextStorage _updateColorsForSlot:inRange:](self, "_updateColorsForSlot:inRange:", v9, v5, v7);

}

- (void)updateColorsForAllSlots
{
  uint64_t v3;
  _QWORD v4[5];

  -[WFSlotTemplateTextStorage beginEditing](self, "beginEditing");
  v3 = -[WFSlotTemplateTextStorage length](self, "length");
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__WFSlotTemplateTextStorage_updateColorsForAllSlots__block_invoke;
  v4[3] = &unk_24EE25748;
  v4[4] = self;
  -[WFSlotTemplateTextStorage enumerateAttribute:inRange:options:usingBlock:](self, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("WFSlot"), 0, v3, 0, v4);
  -[WFSlotTemplateTextStorage endEditing](self, "endEditing");
}

- (void)_updateColorsForSlot:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  length = a4.length;
  location = a4.location;
  v10 = 0;
  v11 = 0;
  -[WFSlotTemplateTextStorage getColorsForSlot:titleColor:backgroundColor:](self, "getColorsForSlot:titleColor:backgroundColor:", a3, &v11, &v10);
  v7 = v11;
  v8 = v10;
  v9 = v7;
  -[WFSlotTemplateTextStorage beginEditing](self, "beginEditing");
  -[WFSlotTemplateTextStorage replaceAttribute:value:range:](self, "replaceAttribute:value:range:", *MEMORY[0x24BEBB320], v8, location, length);
  -[WFSlotTemplateTextStorage replaceAttribute:value:range:](self, "replaceAttribute:value:range:", *MEMORY[0x24BEBB368], v9, location, length);

  -[WFSlotTemplateTextStorage endEditing](self, "endEditing");
}

- (id)stringForSlotSpacingOpportunity:(unint64_t)a3
{
  uint64_t v3;

  if (a3 == 1)
  {
    v3 = 145;
  }
  else
  {
    if (a3 != 2)
      return 0;
    v3 = 146;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)slotSpacingOpportunityAtCharacterIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;

  -[WFSlotTemplateTextStorage string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 1;
  objc_msgSend(v5, "substringWithRange:", a3, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFSlotTemplateTextStorage stringForSlotSpacingOpportunity:](self, "stringForSlotSpacingOpportunity:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    -[WFSlotTemplateTextStorage stringForSlotSpacingOpportunity:](self, "stringForSlotSpacingOpportunity:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "isEqualToString:", v10);

    if (v11)
      v6 = 2;
    else
      v6 = 0;
  }

  return v6;
}

- (_NSRange)characterRangeForSlot:(id)a3 includingInsideSpacingOpportunities:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t *v10;
  NSUInteger v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  _NSRange result;

  v4 = a4;
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSlotTemplateTextStorage.m"), 566, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("slotToFind"));

  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x3010000000;
  v22 = &unk_226909C59;
  v23 = xmmword_2268AB340;
  v8 = -[WFSlotTemplateTextStorage length](self, "length");
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __87__WFSlotTemplateTextStorage_characterRangeForSlot_includingInsideSpacingOpportunities___block_invoke;
  v16[3] = &unk_24EE24B50;
  v9 = v7;
  v17 = v9;
  v18 = &v19;
  -[WFSlotTemplateTextStorage enumerateAttribute:inRange:options:usingBlock:](self, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("WFSlot"), 0, v8, 0, v16);
  v10 = v20;
  v11 = v20[4];
  if (v4)
  {
    v12 = v20[5];
  }
  else
  {
    v11 += 2;
    v12 = v20[5] - 4;
    v20[4] = v11;
    v10[5] = v12;
  }

  _Block_object_dispose(&v19, 8);
  v13 = v11;
  v14 = v12;
  result.length = v14;
  result.location = v13;
  return result;
}

- (id)slotAtCharacterIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4 effectiveContentRange:(_NSRange *)a5
{
  void *v9;
  int64x2_t v11;

  v9 = (void *)-[WFSlotTemplateTextStorage length](self, "length");
  if (v9)
  {
    if (-[WFSlotTemplateTextStorage length](self, "length") - 1 < a3)
      return 0;
    v11 = (int64x2_t)xmmword_2268AB430;
    -[WFSlotTemplateTextStorage attribute:atIndex:longestEffectiveRange:inRange:](self, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("WFSlot"), a3, &v11, 0, -[WFSlotTemplateTextStorage length](self, "length"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (a4)
        *a4 = (_NSRange)v11;
      if (a5)
        *(int64x2_t *)a5 = vaddq_s64(v11, (int64x2_t)xmmword_2268AB350);
    }
  }
  return v9;
}

- (void)enumerateContentInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __64__WFSlotTemplateTextStorage_enumerateContentInRange_usingBlock___block_invoke;
  v9[3] = &unk_24EE24B78;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  -[WFSlotTemplateTextStorage enumerateAttribute:inRange:options:usingBlock:](self, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("WFSlot"), location, length, 0, v9);

}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSArray)contents
{
  return self->_contents;
}

- (int64_t)contentsTextAlignment
{
  return self->_contentsTextAlignment;
}

- (NSTextAttachment)disclosureAttachment
{
  return self->_disclosureAttachment;
}

- (NSTextAttachment)outputButtonAttachment
{
  return self->_outputButtonAttachment;
}

- (NSTextStorage)textStorage
{
  return self->_textStorage;
}

- (NSMutableSet)mutableHighlightedSlots
{
  return self->_mutableHighlightedSlots;
}

- (NSMutableSet)mutableSelectedSlots
{
  return self->_mutableSelectedSlots;
}

- (NSMutableSet)mutableTypingSlots
{
  return self->_mutableTypingSlots;
}

- (unint64_t)editingLevel
{
  return self->_editingLevel;
}

- (void)setEditingLevel:(unint64_t)a3
{
  self->_editingLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableTypingSlots, 0);
  objc_storeStrong((id *)&self->_mutableSelectedSlots, 0);
  objc_storeStrong((id *)&self->_mutableHighlightedSlots, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong((id *)&self->_outputButtonAttachment, 0);
  objc_storeStrong((id *)&self->_disclosureAttachment, 0);
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_disabledSlotBackgroundColor, 0);
  objc_storeStrong((id *)&self->_disabledSlotTitleColor, 0);
  objc_storeStrong((id *)&self->_paragraphStyle, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_unpopulatedFont, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

void __64__WFSlotTemplateTextStorage_enumerateContentInRange_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  if (v17)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (a4)
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "slotSpacingOpportunityAtCharacterIndex:", a3);
    v10 = objc_msgSend(*(id *)(a1 + 32), "slotSpacingOpportunityAtCharacterIndex:", a4 + a3 - 1);
    v11 = a4 - (v9 != 0);
    v12 = v10 != 0;
    v13 = v11 - v12;
    if (v11 != v12)
    {
      if (v9)
        ++a3;
      v14 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:", a3, v11 - v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "string");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t))(v14 + 16))(v14, v16, a3, v13, a5);

    }
  }

}

uint64_t __87__WFSlotTemplateTextStorage_characterRangeForSlot_includingInsideSpacingOpportunities___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;
  uint64_t v10;

  result = objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v10 + 32) = a3;
    *(_QWORD *)(v10 + 40) = a4;
    *a5 = 1;
  }
  return result;
}

uint64_t __52__WFSlotTemplateTextStorage_updateColorsForAllSlots__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_updateColorsForSlot:inRange:", a2, a3, a4);
  return result;
}

void __59__WFSlotTemplateTextStorage_attributedStringForSlot_isRTL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  id v17;

  v3 = a2;
  if (v3)
  {
    v17 = v3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = *(void **)(a1 + 32);
    if ((isKindOfClass & 1) != 0)
    {
      v6 = v17;
      objc_msgSend(v5, "font");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFontForAlignment:", v7);
    }
    else
    {
      objc_msgSend(v5, "font");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "capHeight");
      v9 = v8;
      objc_msgSend(v17, "image");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "size");
      v11 = (v9 - v10) * 0.5;
      objc_msgSend(v17, "image");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "size");
      v14 = v13;
      objc_msgSend(v17, "image");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "size");
      objc_msgSend(v17, "setBounds:", 0.0, v11, v14, v16);

    }
    v3 = v17;
  }

}

void __67__WFSlotTemplateTextStorage_replaceAttributeInInanimateText_value___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;

  objc_msgSend(a2, "objectForKey:", CFSTR("WFSlot"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    objc_msgSend(*(id *)(a1 + 32), "replaceAttribute:value:range:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a3, a4);
}

void __48__WFSlotTemplateTextStorage_setUnpopulatedFont___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  id v9;

  if ((objc_msgSend(a2, "isPopulated") & 1) == 0)
  {
    v7 = *(void **)(a1 + 32);
    v8 = *MEMORY[0x24BEBB360];
    objc_msgSend(v7, "unpopulatedFont");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAttribute:value:range:", v8, v9, a3, a4);

  }
}

@end
