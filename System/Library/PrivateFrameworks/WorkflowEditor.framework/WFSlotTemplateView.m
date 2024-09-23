@implementation WFSlotTemplateView

- (WFSlotTemplateView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  WFSlotTemplateView *v5;
  WFSlotTemplateView *v6;
  void *v7;
  NSTextContainer *v8;
  NSTextContainer *textContainer;
  NSTextContainer *v10;
  WFSlotTemplateLayoutManager *v11;
  WFSlotTemplateLayoutManager *layoutManager;
  WFSlotTemplateLayoutManager *v13;
  WFSlotTemplateTextStorage *v14;
  WFSlotTemplateTextStorage *textStorage;
  WFSlotTemplateTextStorage *v16;
  uint64_t v17;
  NSMutableDictionary *cachedHeightsByWidths;
  WFSlotTemplateView *v19;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  v21.receiver = self;
  v21.super_class = (Class)WFSlotTemplateView;
  v5 = -[WFSlotTemplateView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  v6 = v5;
  if (v5)
  {
    -[WFSlotTemplateView setContextMenuInteractionEnabled:](v5, "setContextMenuInteractionEnabled:", 1);
    -[WFSlotTemplateView setShowsMenuAsPrimaryAction:](v6, "setShowsMenuAsPrimaryAction:", 1);
    -[WFSlotTemplateView setEnabled:](v6, "setEnabled:", 1);
    -[WFSlotTemplateView setContentMode:](v6, "setContentMode:", 5);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSlotTemplateView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    v8 = (NSTextContainer *)objc_msgSend(objc_alloc(MEMORY[0x24BEBB4C0]), "initWithSize:", width, height);
    textContainer = v6->_textContainer;
    v6->_textContainer = v8;
    v10 = v8;

    v11 = objc_alloc_init(WFSlotTemplateLayoutManager);
    -[WFSlotTemplateLayoutManager addTextContainer:](v11, "addTextContainer:", v10);
    -[WFSlotTemplateLayoutManager wf_setControlView:](v11, "wf_setControlView:", v6);
    layoutManager = v6->_layoutManager;
    v6->_layoutManager = v11;
    v13 = v11;

    v14 = objc_alloc_init(WFSlotTemplateTextStorage);
    -[WFSlotTemplateTextStorage setDelegate:](v14, "setDelegate:", v6);
    -[WFSlotTemplateTextStorage addLayoutManager:](v14, "addLayoutManager:", v13);
    textStorage = v6->_textStorage;
    v6->_textStorage = v14;
    v16 = v14;

    -[WFSlotTemplateView updateTintColorInTextStorage](v6, "updateTintColorInTextStorage");
    -[WFSlotTemplateView setTextAlignment:](v6, "setTextAlignment:", 4);
    v17 = objc_opt_new();
    cachedHeightsByWidths = v6->_cachedHeightsByWidths;
    v6->_cachedHeightsByWidths = (NSMutableDictionary *)v17;

    v19 = v6;
  }

  return v6;
}

- (void)setupTextEntry
{
  id v3;
  double v4;
  double v5;
  NSTextContainer *v6;
  NSTextContainer *typingTextContainer;
  NSTextContainer *v8;
  WFSlotTemplateLayoutManager *v9;
  WFSlotTemplateLayoutManager *typingLayoutManager;
  WFSlotTemplateLayoutManager *v11;
  WFSlotTemplateTextStorage *v12;
  WFSlotTemplateTextStorage *typingTextStorage;
  WFSlotTemplateTextStorage *v14;
  WFSlotTemplateTypingTextView *v15;
  WFSlotTemplateTypingTextView *v16;
  void *v17;
  WFSlotTemplateTypingTextView *typingTextView;
  WFSlotTemplateTypingTextView *v19;
  id v20;
  WFTextAttachmentInteraction *typingAttachmentInteraction;

  v3 = objc_alloc(MEMORY[0x24BEBB4C0]);
  -[WFSlotTemplateView frame](self, "frame");
  v6 = (NSTextContainer *)objc_msgSend(v3, "initWithSize:", v4, v5);
  -[NSTextContainer lineFragmentPadding](self->_textContainer, "lineFragmentPadding");
  -[NSTextContainer setLineFragmentPadding:](v6, "setLineFragmentPadding:");
  typingTextContainer = self->_typingTextContainer;
  self->_typingTextContainer = v6;
  v8 = v6;

  v9 = objc_alloc_init(WFSlotTemplateLayoutManager);
  -[WFSlotTemplateLayoutManager setIsLayoutManagerForTextView:](v9, "setIsLayoutManagerForTextView:", 1);
  -[WFSlotTemplateLayoutManager addTextContainer:](v9, "addTextContainer:", v8);
  typingLayoutManager = self->_typingLayoutManager;
  self->_typingLayoutManager = v9;
  v11 = v9;

  v12 = objc_alloc_init(WFSlotTemplateTextStorage);
  -[WFSlotTemplateTextStorage addLayoutManager:](v12, "addLayoutManager:", v11);
  typingTextStorage = self->_typingTextStorage;
  self->_typingTextStorage = v12;
  v14 = v12;

  v15 = [WFSlotTemplateTypingTextView alloc];
  -[WFSlotTemplateView bounds](self, "bounds");
  v16 = -[WFSlotTemplateTypingTextView initWithFrame:textContainer:](v15, "initWithFrame:textContainer:", v8);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateTypingTextView setBackgroundColor:](v16, "setBackgroundColor:", v17);

  -[WFSlotTemplateTypingTextView setAutoresizingMask:](v16, "setAutoresizingMask:", 18);
  -[WFSlotTemplateTypingTextView setScrollEnabled:](v16, "setScrollEnabled:", 0);
  -[WFSlotTemplateTypingTextView setScrollsToTop:](v16, "setScrollsToTop:", 0);
  -[WFSlotTemplateTypingTextView setDelegate:](v16, "setDelegate:", self);
  -[WFSlotTemplateTypingTextView setHidden:](v16, "setHidden:", 1);
  -[WFSlotTemplateView insertSubview:atIndex:](self, "insertSubview:atIndex:", v16, 0);
  typingTextView = self->_typingTextView;
  self->_typingTextView = v16;
  v19 = v16;

  -[WFSlotTemplateLayoutManager wf_setControlView:](v11, "wf_setControlView:", v19);
  v20 = objc_alloc_init(MEMORY[0x24BEC5188]);
  objc_msgSend(v20, "setDelegate:", self);
  objc_msgSend(v20, "setTextContainer:", v8);
  -[WFSlotTemplateTypingTextView addInteraction:](v19, "addInteraction:", v20);
  typingAttachmentInteraction = self->_typingAttachmentInteraction;
  self->_typingAttachmentInteraction = (WFTextAttachmentInteraction *)v20;

  -[WFSlotTemplateView updateTypingFont](self, "updateTypingFont");
  -[WFSlotTemplateView updateTypingUnpopulatedFont](self, "updateTypingUnpopulatedFont");
  -[WFSlotTemplateView updateTypingParagraphStyle](self, "updateTypingParagraphStyle");
}

- (UIFont)font
{
  void *v2;
  void *v3;

  -[WFSlotTemplateView textStorage](self, "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIFont)unpopulatedFont
{
  void *v2;
  void *v3;

  -[WFSlotTemplateView textStorage](self, "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unpopulatedFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIColor)textColor
{
  void *v2;
  void *v3;

  -[WFSlotTemplateView textStorage](self, "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (int64_t)textAlignment
{
  void *v2;
  int64_t v3;

  -[WFSlotTemplateView paragraphStyle](self, "paragraphStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "alignment");

  return v3;
}

- (void)setTextAlignment:(int64_t)a3
{
  id v5;

  if (-[WFSlotTemplateView textAlignment](self, "textAlignment") != a3)
  {
    objc_msgSend((id)objc_opt_class(), "paragraphStyleWithAlignment:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[WFSlotTemplateView setParagraphStyle:](self, "setParagraphStyle:", v5);

  }
}

- (NSParagraphStyle)paragraphStyle
{
  void *v2;
  void *v3;

  -[WFSlotTemplateView textStorage](self, "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paragraphStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSParagraphStyle *)v3;
}

- (void)setParagraphStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  void *v9;
  id v10;

  v4 = a3;
  -[WFSlotTemplateView textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paragraphStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  v7 = v6;
  if (v7 == v10)
  {

  }
  else
  {
    if (v10 && v7)
    {
      v8 = objc_msgSend(v10, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[WFSlotTemplateView textStorage](self, "textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setParagraphStyle:", v10);

    -[WFSlotTemplateView updateTypingParagraphStyle](self, "updateTypingParagraphStyle");
  }
LABEL_9:

}

- (void)setFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  void *v9;
  id v10;

  v4 = a3;
  -[WFSlotTemplateView textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  v7 = v6;
  if (v7 == v10)
  {

  }
  else
  {
    if (v10 && v7)
    {
      v8 = objc_msgSend(v10, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[WFSlotTemplateView textStorage](self, "textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v10);

    -[WFSlotTemplateView updateTypingFont](self, "updateTypingFont");
    -[WFSlotTemplateView updateVariableAttachmentAppearanceInContents](self, "updateVariableAttachmentAppearanceInContents");
  }
LABEL_9:

}

- (void)updateTypingFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[WFSlotTemplateView font](self, "font");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView typingTextStorage](self, "typingTextStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v9);

  -[WFSlotTemplateView typingTextView](self, "typingTextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typingAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setObject:forKey:", v9, *MEMORY[0x24BEBB360]);
  -[WFSlotTemplateView typingTextView](self, "typingTextView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTypingAttributes:", v6);

  -[WFSlotTemplateView typingTextView](self, "typingTextView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEmojiOverrideFont:", v9);

}

- (void)updateVariableAttachmentAppearanceInContents
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];

  -[WFSlotTemplateView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginEditing");

  -[WFSlotTemplateView textStorage](self, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BEBB318];
  -[WFSlotTemplateView textStorage](self, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__WFSlotTemplateView_updateVariableAttachmentAppearanceInContents__block_invoke;
  v9[3] = &unk_24EE25268;
  v9[4] = self;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v7, 0, v9);

  -[WFSlotTemplateView textStorage](self, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endEditing");

}

- (void)setUnpopulatedFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  void *v9;
  id v10;

  v4 = a3;
  -[WFSlotTemplateView textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unpopulatedFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  v7 = v6;
  if (v7 == v10)
  {

  }
  else
  {
    if (v10 && v7)
    {
      v8 = objc_msgSend(v10, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[WFSlotTemplateView textStorage](self, "textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUnpopulatedFont:", v10);

    -[WFSlotTemplateView updateTypingUnpopulatedFont](self, "updateTypingUnpopulatedFont");
  }
LABEL_9:

}

- (void)updateTypingUnpopulatedFont
{
  void *v3;
  id v4;

  -[WFSlotTemplateView unpopulatedFont](self, "unpopulatedFont");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView typingTextStorage](self, "typingTextStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUnpopulatedFont:", v4);

}

- (void)setTextColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  void *v9;
  id v10;

  v4 = a3;
  -[WFSlotTemplateView textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  v7 = v6;
  if (v7 == v10)
  {

  }
  else
  {
    if (v10 && v7)
    {
      v8 = objc_msgSend(v10, "isEqual:", v7);

      v9 = v10;
      if ((v8 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
    -[WFSlotTemplateView textStorage](self, "textStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v10);
  }

  v9 = v10;
LABEL_10:

}

- (void)updateTypingParagraphStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[WFSlotTemplateView paragraphStyle](self, "paragraphStyle");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView typingTextStorage](self, "typingTextStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setParagraphStyle:", v9);

  -[WFSlotTemplateView typingTextView](self, "typingTextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typingAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[WFSlotTemplateView typingParagraphStyleForParagraphStyle:](self, "typingParagraphStyleForParagraphStyle:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, *MEMORY[0x24BEBB3A8]);

  -[WFSlotTemplateView typingTextView](self, "typingTextView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTypingAttributes:", v6);

}

- (id)typingParagraphStyleForParagraphStyle:(id)a3
{
  void *v3;
  void *v4;

  -[WFSlotTemplateView paragraphStyle](self, "paragraphStyle", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setAlignment:", 4);
  return v4;
}

- (void)setHorizontalPadding:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (self->_horizontalPadding != a3)
  {
    self->_horizontalPadding = a3;
    -[WFSlotTemplateView textContainer](self, "textContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLineFragmentPadding:", a3);

    -[WFSlotTemplateView typingTextView](self, "typingTextView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLineFragmentPadding:", a3);

    -[WFSlotTemplateView updateTypingTextContainerSize](self, "updateTypingTextContainerSize");
    -[WFSlotTemplateView updateAccessibilityElements](self, "updateAccessibilityElements");
    -[WFSlotTemplateView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[WFSlotTemplateView typingSlotIdentifier](self, "typingSlotIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[WFSlotTemplateView typingSlotIdentifier](self, "typingSlotIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFSlotTemplateView slotWithIdentifier:](self, "slotWithIdentifier:", v9);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      v10 = v11;
      if (v11)
      {
        -[WFSlotTemplateView positionTypingAboveSlot:](self, "positionTypingAboveSlot:", v11);
        v10 = v11;
      }

    }
  }
}

- (UIColor)disabledSlotTitleColor
{
  void *v2;
  void *v3;

  -[WFSlotTemplateView textStorage](self, "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disabledSlotTitleColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (UIColor)disabledSlotBackgroundColor
{
  void *v2;
  void *v3;

  -[WFSlotTemplateView textStorage](self, "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disabledSlotBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setDisabledSlotTitleColor:(id)a3 backgroundColor:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD aBlock[5];
  id v15;
  id v16;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__WFSlotTemplateView_setDisabledSlotTitleColor_backgroundColor_animated___block_invoke;
  aBlock[3] = &unk_24EE25290;
  aBlock[4] = self;
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  v12 = _Block_copy(aBlock);
  v13 = v12;
  if (v5)
    -[WFSlotTemplateView performFadeTransition:](self, "performFadeTransition:", v12);
  else
    (*((void (**)(void *))v12 + 2))(v12);

}

- (BOOL)extendSlotBackgroundOffEdges
{
  void *v2;
  char v3;

  -[WFSlotTemplateView layoutManager](self, "layoutManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "extendSlotBackgroundOffEdges");

  return v3;
}

- (void)setExtendSlotBackgroundOffEdges:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[WFSlotTemplateView extendSlotBackgroundOffEdges](self, "extendSlotBackgroundOffEdges") != a3)
  {
    -[WFSlotTemplateView layoutManager](self, "layoutManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExtendSlotBackgroundOffEdges:", v3);

    -[WFSlotTemplateView invalidateDisplay](self, "invalidateDisplay");
  }
}

- (void)setExclusionRects:(id)a3
{
  id v4;
  NSArray *exclusionRects;
  NSArray *v6;
  BOOL v7;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;

  v4 = a3;
  exclusionRects = self->_exclusionRects;
  v10 = (NSArray *)v4;
  v6 = exclusionRects;
  if (v6 == v10)
  {

  }
  else
  {
    if (v10 && v6)
    {
      v7 = -[NSArray isEqualToArray:](v10, "isEqualToArray:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSArray *)-[NSArray copy](v10, "copy");
    v9 = self->_exclusionRects;
    self->_exclusionRects = v8;

    -[WFSlotTemplateView invalidateDisplay](self, "invalidateDisplay");
    -[WFSlotTemplateView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[WFSlotTemplateView bounds](self, "bounds");
    -[WFSlotTemplateView updateExclusionRectsWithBounds:](self, "updateExclusionRectsWithBounds:");
  }
LABEL_9:

}

- (void)updateExclusionRectsWithBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[9];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[WFSlotTemplateView exclusionRects](self, "exclusionRects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __53__WFSlotTemplateView_updateExclusionRectsWithBounds___block_invoke;
  v14[3] = &unk_24EE252B8;
  v14[4] = self;
  *(CGFloat *)&v14[5] = x;
  *(CGFloat *)&v14[6] = y;
  *(CGFloat *)&v14[7] = width;
  *(CGFloat *)&v14[8] = height;
  objc_msgSend(v8, "if_map:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView textContainer](self, "textContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setExclusionPaths:", v9);

  -[WFSlotTemplateView typingSlotIdentifier](self, "typingSlotIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WFSlotTemplateView typingSlotIdentifier](self, "typingSlotIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSlotTemplateView slotWithIdentifier:](self, "slotWithIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      -[WFSlotTemplateView positionTypingAboveSlot:](self, "positionTypingAboveSlot:", v13);

  }
}

- (void)setShowsDisclosureArrow:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  WFSlotTemplateView *v20;
  id v21;

  if (self->_showsDisclosureArrow != a3)
  {
    v3 = a3;
    self->_showsDisclosureArrow = a3;
    if (a3)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBB4B8]), "initWithData:ofType:", 0, 0);
      objc_msgSend(v5, "setBounds:", 0.0, 0.0, 27.0, 20.0);
      v6 = (void *)objc_opt_new();
      objc_msgSend(v5, "setImage:", v6);

    }
    else
    {
      v5 = 0;
    }
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __46__WFSlotTemplateView_setShowsDisclosureArrow___block_invoke;
    v19 = &unk_24EE252E0;
    v20 = self;
    v7 = v5;
    v21 = v7;
    -[WFSlotTemplateView performFadeTransition:](self, "performFadeTransition:", &v16);
    if (v3)
    {
      -[WFSlotTemplateView traitCollection](self, "traitCollection", v16, v17, v18, v19, v20);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "layoutDirection");

      if (v9 == 1)
        v10 = CFSTR("chevron.left.circle");
      else
        v10 = CFSTR("chevron.right.circle");
      objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 16.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "imageWithConfiguration:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBD430], "systemButtonWithImage:target:action:", v13, self, sel_didTapDisclosureArrow);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFSlotTemplateView addSubview:](self, "addSubview:", v14);
      -[WFSlotTemplateView setDisclosureButton:](self, "setDisclosureButton:", v14);
      -[WFSlotTemplateView updateDisclosureButtonPosition](self, "updateDisclosureButtonPosition");

    }
    else
    {
      -[WFSlotTemplateView disclosureButton](self, "disclosureButton", v16, v17, v18, v19, v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeFromSuperview");

      -[WFSlotTemplateView setDisclosureButton:](self, "setDisclosureButton:", 0);
    }

  }
}

- (void)setDisclosureArrowIsOpen:(BOOL)a3
{
  if (self->_disclosureArrowIsOpen != a3)
  {
    self->_disclosureArrowIsOpen = a3;
    -[WFSlotTemplateView updateDisclosureButtonTransformAnimated:](self, "updateDisclosureButtonTransformAnimated:", 1);
  }
}

- (void)didTapDisclosureArrow
{
  _BOOL4 disclosureArrowIsOpen;
  void *v4;
  char v5;
  id v6;

  disclosureArrowIsOpen = self->_disclosureArrowIsOpen;
  self->_disclosureArrowIsOpen = !disclosureArrowIsOpen;
  -[WFSlotTemplateView updateDisclosureButtonTransformAnimated:](self, "updateDisclosureButtonTransformAnimated:", 1);
  -[WFSlotTemplateView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFSlotTemplateView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "slotTemplateView:disclosureArrowDidChange:", self, !disclosureArrowIsOpen);

  }
}

- (void)updateDisclosureButtonPosition
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  -[WFSlotTemplateView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") - 1;

  -[WFSlotTemplateView layoutManager](self, "layoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "glyphRangeForCharacterRange:actualCharacterRange:", v4, 1, 0);
  v8 = v7;

  -[WFSlotTemplateView layoutManager](self, "layoutManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView textContainer](self, "textContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__WFSlotTemplateView_updateDisclosureButtonPosition__block_invoke;
  v11[3] = &unk_24EE256F8;
  v11[4] = self;
  objc_msgSend(v9, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", v6, v8, 0x7FFFFFFFFFFFFFFFLL, 0, v10, v11);

}

- (void)updateDisclosureButtonTransformAnimated:(BOOL)a3
{
  double v3;
  _QWORD v4[5];

  v3 = 0.200000003;
  if (!a3)
    v3 = 0.0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62__WFSlotTemplateView_updateDisclosureButtonTransformAnimated___block_invoke;
  v4[3] = &unk_24EE25C70;
  v4[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v4, v3);
}

- (void)setShowsOutputButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  WFSlotTemplateView *v17;
  id v18;

  if (self->_showsOutputButton != a3)
  {
    v3 = a3;
    self->_showsOutputButton = a3;
    if (a3)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBB4B8]), "initWithData:ofType:", 0, 0);
      objc_msgSend(v5, "setBounds:", 0.0, 0.0, 27.0, 20.0);
      v6 = (void *)objc_opt_new();
      objc_msgSend(v5, "setImage:", v6);

    }
    else
    {
      v5 = 0;
    }
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __43__WFSlotTemplateView_setShowsOutputButton___block_invoke;
    v16 = &unk_24EE252E0;
    v17 = self;
    v7 = v5;
    v18 = v7;
    -[WFSlotTemplateView performFadeTransition:](self, "performFadeTransition:", &v13);
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("eye"), v13, v14, v15, v16, v17);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 16.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageWithConfiguration:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBD430], "systemButtonWithImage:target:action:", v10, self, sel_didTapOutputButton);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFSlotTemplateView addSubview:](self, "addSubview:", v11);
      -[WFSlotTemplateView setOutputButton:](self, "setOutputButton:", v11);
      -[WFSlotTemplateView updateOutputButtonPosition](self, "updateOutputButtonPosition");

    }
    else
    {
      -[WFSlotTemplateView outputButton](self, "outputButton", v13, v14, v15, v16, v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeFromSuperview");

      -[WFSlotTemplateView setOutputButton:](self, "setOutputButton:", 0);
    }

  }
}

- (void)setOutputButtonIsOpen:(BOOL)a3
{
  if (self->_outputButtonIsOpen != a3)
  {
    self->_outputButtonIsOpen = a3;
    -[WFSlotTemplateView updateOutputButtonTransformAnimated:](self, "updateOutputButtonTransformAnimated:", 0);
  }
}

- (void)didTapOutputButton
{
  _BOOL4 outputButtonIsOpen;
  void *v4;
  char v5;
  id v6;

  outputButtonIsOpen = self->_outputButtonIsOpen;
  self->_outputButtonIsOpen = !outputButtonIsOpen;
  -[WFSlotTemplateView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFSlotTemplateView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "slotTemplateView:outputButtonDidChange:", self, !outputButtonIsOpen);

  }
}

- (void)updateOutputButtonPosition
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  -[WFSlotTemplateView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") - 1;

  -[WFSlotTemplateView layoutManager](self, "layoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "glyphRangeForCharacterRange:actualCharacterRange:", v4, 1, 0);
  v8 = v7;

  -[WFSlotTemplateView layoutManager](self, "layoutManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView textContainer](self, "textContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __48__WFSlotTemplateView_updateOutputButtonPosition__block_invoke;
  v11[3] = &unk_24EE256F8;
  v11[4] = self;
  objc_msgSend(v9, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", v6, v8, 0x7FFFFFFFFFFFFFFFLL, 0, v10, v11);

}

- (void)updateOutputButtonTransformAnimated:(BOOL)a3
{
  double v3;
  _QWORD v4[5];

  v3 = 0.200000003;
  if (!a3)
    v3 = 0.0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__WFSlotTemplateView_updateOutputButtonTransformAnimated___block_invoke;
  v4[3] = &unk_24EE25C70;
  v4[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v4, v3);
}

- (void)invalidateDisplay
{
  -[WFSlotTemplateView setNeedsDisplay](self, "setNeedsDisplay");
  -[WFSlotTemplateView updateDisclosureButtonPosition](self, "updateDisclosureButtonPosition");
  -[WFSlotTemplateView updateOutputButtonPosition](self, "updateOutputButtonPosition");
}

- (void)invalidateIntrinsicContentSize
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFSlotTemplateView;
  -[WFSlotTemplateView invalidateIntrinsicContentSize](&v4, sel_invalidateIntrinsicContentSize);
  -[WFSlotTemplateView cachedHeightsByWidths](self, "cachedHeightsByWidths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

- (void)setContents:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  char v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  WFSlotTemplateView *v32;
  NSObject *v33;
  uint8_t buf[16];

  v4 = a4;
  v6 = a3;
  getWFEditorLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  getWFEditorLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_226666000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SlotTemplateSetContents", ", buf, 2u);
  }

  -[WFSlotTemplateView textStorage](self, "textStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6;
  v14 = v12;
  if (v14 != v13)
  {
    v15 = v14;
    if (v13 && v14)
    {
      v16 = -[NSObject isEqualToArray:](v13, "isEqualToArray:", v14);

      if ((v16 & 1) != 0)
        goto LABEL_29;
    }
    else
    {

    }
    -[WFSlotTemplateView selectedSlotIdentifier](self, "selectedSlotIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSlotTemplateView highlightedSlotIdentifier](self, "highlightedSlotIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSlotTemplateView textStorage](self, "textStorage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "beginEditing");

    if (v4)
    {
      v28 = MEMORY[0x24BDAC760];
      v29 = 3221225472;
      v30 = __43__WFSlotTemplateView_setContents_animated___block_invoke;
      v31 = &unk_24EE252E0;
      v32 = self;
      v33 = v13;
      -[WFSlotTemplateView performFadeTransition:](self, "performFadeTransition:", &v28);

      if (!v11)
      {
LABEL_17:
        if (v19)
        {
          -[WFSlotTemplateView slotWithIdentifier:](self, "slotWithIdentifier:", v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
            -[WFSlotTemplateView highlightSlotWithIdentifier:](self, "highlightSlotWithIdentifier:", v19);
        }
        -[WFSlotTemplateView updateVariableAttachmentAppearanceInContents](self, "updateVariableAttachmentAppearanceInContents", v28, v29, v30, v31, v32);
        -[WFSlotTemplateView textStorage](self, "textStorage");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "endEditing");

        -[WFSlotTemplateView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
        -[WFSlotTemplateView typingSlotIdentifier](self, "typingSlotIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          -[WFSlotTemplateView slotWithIdentifier:](self, "slotWithIdentifier:", v18);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            -[WFSlotTemplateView updateTypingTextContents:](self, "updateTypingTextContents:", v18);
            -[WFSlotTemplateView textStorage](self, "textStorage");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "didBeginTypingInSlot:", v25);

            -[WFSlotTemplateView positionTypingAboveSlot:](self, "positionTypingAboveSlot:", v25);
          }
          else
          {
            -[WFSlotTemplateView endTyping](self, "endTyping");
          }

        }
        getWFEditorLogObject();
        v27 = objc_claimAutoreleasedReturnValue();
        v17 = v27;
        if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_226666000, v17, OS_SIGNPOST_INTERVAL_END, v8, "SlotTemplateSetContents", ", buf, 2u);
        }
        goto LABEL_28;
      }
    }
    else
    {
      -[WFSlotTemplateView textStorage](self, "textStorage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setContents:", v13);

      if (!v11)
        goto LABEL_17;
    }
    -[WFSlotTemplateView slotWithIdentifier:](self, "slotWithIdentifier:", v11, v28, v29, v30, v31, v32);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      -[WFSlotTemplateView selectSlotWithIdentifier:](self, "selectSlotWithIdentifier:", v11);
    goto LABEL_17;
  }
  v17 = v13;
  v18 = v13;
  v19 = v13;
LABEL_28:

LABEL_29:
}

- (id)slotWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[WFSlotTemplateView textStorage](self, "textStorage", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
          objc_msgSend(v12, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqual:", v4);

          if ((v14 & 1) != 0)
            goto LABEL_12;

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (id)slotAfterSlotIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[WFSlotTemplateView textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "reverseObjectEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSlotTemplateView slotIdentifierBeforeSlot:inContents:](self, "slotIdentifierBeforeSlot:inContents:", v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "if_objectsOfClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
  }

  return v9;
}

- (id)slotBeforeSlotIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[WFSlotTemplateView textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "objectEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSlotTemplateView slotIdentifierBeforeSlot:inContents:](self, "slotIdentifierBeforeSlot:inContents:", v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "if_objectsOfClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
  }

  return v9;
}

- (id)slotIdentifierBeforeSlot:(id)a3 inContents:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  void *v13;
  char v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = a4;
  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  v8 = 0;
  if (v7)
  {
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
          objc_msgSend(v12, "identifier", (_QWORD)v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqual:", v5);

          if ((v14 & 1) != 0)
          {
            v8 = v8;

            v7 = v8;
            goto LABEL_13;
          }
          objc_msgSend(v12, "identifier");
          v15 = objc_claimAutoreleasedReturnValue();

          v8 = (id)v15;
        }
      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

  return v7;
}

- (id)highlightedSlot
{
  void *v2;
  void *v3;
  void *v4;

  -[WFSlotTemplateView textStorage](self, "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlightedSlots");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)highlightedSlotIdentifier
{
  void *v2;
  void *v3;

  -[WFSlotTemplateView highlightedSlot](self, "highlightedSlot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)highlightSlotWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  _QWORD v8[5];
  id v9;
  id v10;

  -[WFSlotTemplateView slotWithIdentifier:](self, "slotWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[WFSlotTemplateView textStorage](self, "textStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "highlightedSlots");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

    if ((v7 & 1) == 0)
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __50__WFSlotTemplateView_highlightSlotWithIdentifier___block_invoke;
      v8[3] = &unk_24EE25290;
      v8[4] = self;
      v9 = v5;
      v10 = v4;
      -[WFSlotTemplateView performFadeTransition:](self, "performFadeTransition:", v8);

    }
  }

}

- (void)unhighlightSlot
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  -[WFSlotTemplateView highlightedSlot](self, "highlightedSlot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __37__WFSlotTemplateView_unhighlightSlot__block_invoke;
    v5[3] = &unk_24EE252E0;
    v5[4] = self;
    v6 = v3;
    -[WFSlotTemplateView performFadeTransition:](self, "performFadeTransition:", v5);

  }
}

- (id)selectedSlot
{
  void *v2;
  void *v3;
  void *v4;

  -[WFSlotTemplateView textStorage](self, "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedSlots");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (WFSlotIdentifier)selectedSlotIdentifier
{
  void *v2;
  void *v3;

  -[WFSlotTemplateView selectedSlot](self, "selectedSlot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFSlotIdentifier *)v3;
}

- (void)selectSlotWithIdentifier:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;

  -[WFSlotTemplateView slotWithIdentifier:](self, "slotWithIdentifier:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSlotTemplateView.m"), 723, CFSTR("Must be slot with that identifier"));

    v5 = 0;
  }
  -[WFSlotTemplateView _selectSlot:notifyDelegate:](self, "_selectSlot:notifyDelegate:", v5, 0);

}

- (void)_selectSlot:(id)a3 notifyDelegate:(BOOL)a4
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  WFSlotTemplateView *v15;
  BOOL v16;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSlotTemplateView.m"), 728, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("slot"));

  }
  -[WFSlotTemplateView textStorage](self, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectedSlots");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v7);

  if ((v10 & 1) == 0)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __49__WFSlotTemplateView__selectSlot_notifyDelegate___block_invoke;
    v12[3] = &unk_24EE25308;
    v13 = v7;
    v14 = v8;
    v15 = self;
    v16 = a4;
    -[WFSlotTemplateView _deselectSlotAndNotifyDelegate:completionHandler:](self, "_deselectSlotAndNotifyDelegate:completionHandler:", 1, v12);

  }
}

- (void)deselectSlot
{
  -[WFSlotTemplateView _deselectSlotAndNotifyDelegate:completionHandler:](self, "_deselectSlotAndNotifyDelegate:completionHandler:", 0, 0);
}

- (void)_deselectSlotAndNotifyDelegate:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  WFSlotTemplateView *v16;
  id v17;

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  -[WFSlotTemplateView selectedSlot](self, "selectedSlot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __71__WFSlotTemplateView__deselectSlotAndNotifyDelegate_completionHandler___block_invoke;
    v15 = &unk_24EE252E0;
    v16 = self;
    v9 = v7;
    v17 = v9;
    -[WFSlotTemplateView performFadeTransition:](self, "performFadeTransition:", &v12);
    -[WFSlotTemplateView accessibilityShiftFocusBackToView](self, "accessibilityShiftFocusBackToView", v12, v13, v14, v15, v16);
    -[WFSlotTemplateView delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "slotTemplateView:didDeselectSlotWithIdentifier:completionHandler:", self, v11, v6);

    }
    else if (v6)
    {
      v6[2](v6);
    }

  }
  else if (v6)
  {
    v6[2](v6);
  }

}

- (id)configureMenuAtLocation:(CGPoint)a3 wasTriggeredByTap:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  _QWORD block[5];
  id v22;
  id v23;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[WFSlotTemplateView slotAtPoint:](self, "slotAtPoint:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v4)
    {
      -[WFSlotTemplateView attachmentAtPoint:characterRange:](self, "attachmentAtPoint:characterRange:", 0, x, y);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v8, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[WFSlotTemplateView shouldRecognizeTapOnTextAttachment:inSlotWithIdentifier:](self, "shouldRecognizeTapOnTextAttachment:inSlotWithIdentifier:", v9, v10);

        if (v11)
        {
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __64__WFSlotTemplateView_configureMenuAtLocation_wasTriggeredByTap___block_invoke;
          block[3] = &unk_24EE25290;
          block[4] = self;
          v22 = v9;
          v23 = v8;
          v12 = v9;
          dispatch_async(MEMORY[0x24BDAC9B8], block);

          v13 = 0;
LABEL_14:

          goto LABEL_15;
        }
      }

    }
    v14 = !v4;
    -[WFSlotTemplateView delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "slotTemplateView:menuForSlotIdentifier:style:", self, v16, !v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 || v13)
    {
      if (v13)
      {
        objc_msgSend(v8, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFSlotTemplateView highlightSlotWithIdentifier:](self, "highlightSlotWithIdentifier:", v17);

      }
      v12 = v13;
      v13 = v12;
    }
    else
    {
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __64__WFSlotTemplateView_configureMenuAtLocation_wasTriggeredByTap___block_invoke_2;
      v19[3] = &unk_24EE252E0;
      v19[4] = self;
      v20 = v8;
      dispatch_async(MEMORY[0x24BDAC9B8], v19);

      v12 = 0;
    }
    goto LABEL_14;
  }
  v13 = 0;
LABEL_15:

  return v13;
}

- (void)menuWillPresent
{
  -[WFSlotTemplateView setMenuIsPresented:](self, "setMenuIsPresented:", 1);
}

- (void)presentedMenuDidDismiss
{
  void *v3;
  char v4;
  id v5;

  -[WFSlotTemplateView setMenuIsPresented:](self, "setMenuIsPresented:", 0);
  -[WFSlotTemplateView unhighlightSlot](self, "unhighlightSlot");
  -[WFSlotTemplateView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFSlotTemplateView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "menuDidDismissInSlotTemplateView:", self);

  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[WFSlotTemplateView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)WFSlotTemplateView;
  -[WFSlotTemplateView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height)
  {
    -[WFSlotTemplateView invalidateDisplay](self, "invalidateDisplay");
    -[WFSlotTemplateView bounds](self, "bounds");
    -[WFSlotTemplateView updateExclusionRectsWithBounds:](self, "updateExclusionRectsWithBounds:");
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[WFSlotTemplateView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)WFSlotTemplateView;
  -[WFSlotTemplateView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (v9 != width || v11 != height)
  {
    -[WFSlotTemplateView invalidateDisplay](self, "invalidateDisplay");
    -[WFSlotTemplateView bounds](self, "bounds");
    -[WFSlotTemplateView updateExclusionRectsWithBounds:](self, "updateExclusionRectsWithBounds:");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFSlotTemplateView;
  -[WFSlotTemplateView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[WFSlotTemplateView bounds](self, "bounds");
  -[WFSlotTemplateView updateExclusionRectsWithBounds:](self, "updateExclusionRectsWithBounds:");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)WFSlotTemplateView;
  -[WFSlotTemplateView layoutSubviews](&v18, sel_layoutSubviews);
  -[WFSlotTemplateView bounds](self, "bounds");
  v4 = v3;
  -[WFSlotTemplateView textContainer](self, "textContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSize:", v4, 1.79769313e308);

  -[WFSlotTemplateView updateTypingTextContainerSize](self, "updateTypingTextContainerSize");
  -[WFSlotTemplateView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[WFSlotTemplateView typingTextView](self, "typingTextView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  -[WFSlotTemplateView typingSlotIdentifier](self, "typingSlotIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[WFSlotTemplateView typingSlotIdentifier](self, "typingSlotIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSlotTemplateView slotWithIdentifier:](self, "slotWithIdentifier:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      -[WFSlotTemplateView positionTypingAboveSlot:](self, "positionTypingAboveSlot:", v17);

  }
  -[WFSlotTemplateView updateAccessibilityElements](self, "updateAccessibilityElements");
  -[WFSlotTemplateView updateDisclosureButtonPosition](self, "updateDisclosureButtonPosition");
  -[WFSlotTemplateView updateOutputButtonPosition](self, "updateOutputButtonPosition");
}

- (void)updateTypingTextContainerSize
{
  double v3;
  double v4;
  id v5;

  -[WFSlotTemplateView bounds](self, "bounds");
  v4 = v3;
  -[WFSlotTemplateView typingTextContainer](self, "typingTextContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSize:", v4, 1.79769313e308);

}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)WFSlotTemplateView;
  -[WFSlotTemplateView drawRect:](&v19, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[WFSlotTemplateView layoutManager](self, "layoutManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[WFSlotTemplateView textContainer](self, "textContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "glyphRangeForBoundingRect:inTextContainer:", v13, v6, v8, v10, v12);
  v16 = v15;

  -[WFSlotTemplateView layoutManager](self, "layoutManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView bounds](self, "bounds");
  objc_msgSend(v17, "drawBackgroundForGlyphRange:atPoint:", v14, v16);

  -[WFSlotTemplateView layoutManager](self, "layoutManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView bounds](self, "bounds");
  objc_msgSend(v18, "drawGlyphsForGlyphRange:atPoint:", v14, v16);

}

- (void)performFadeTransition:(id)a3
{
  objc_msgSend(MEMORY[0x24BEBDB00], "transitionWithView:duration:options:animations:completion:", self, 5242880, a3, 0, 0.0700000003);
}

- (void)handleTouchWithPhase:(unint64_t)a3 atLocation:(CGPoint)a4
{
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  void *v11;
  BOOL v12;
  void *v13;

  -[WFSlotTemplateView slotAtPoint:](self, "slotAtPoint:", a4.x, a4.y);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView typingSlotIdentifier](self, "typingSlotIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  v9 = v13;
  if ((v8 & 1) != 0)
    goto LABEL_15;
  if (a3 == 1)
  {
    if (v13 && objc_msgSend(v13, "isEnabled"))
    {
      objc_msgSend(v13, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFSlotTemplateView highlightSlotWithIdentifier:](self, "highlightSlotWithIdentifier:", v11);
      goto LABEL_10;
    }
    goto LABEL_13;
  }
  if (a3)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2)
      goto LABEL_15;
    v12 = -[WFSlotTemplateView menuIsPresented](self, "menuIsPresented");
    v9 = v13;
    if (v12)
      goto LABEL_15;
LABEL_13:
    -[WFSlotTemplateView unhighlightSlot](self, "unhighlightSlot");
    goto LABEL_14;
  }
  if (v13)
  {
    v10 = objc_msgSend(v13, "isEnabled");
    v9 = v13;
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFSlotTemplateView setTouchDownTimestamp:](self, "setTouchDownTimestamp:", v11);
LABEL_10:

LABEL_14:
      v9 = v13;
    }
  }
LABEL_15:

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD *v26;
  _QWORD v28[4];
  id v29;
  _QWORD block[5];
  _QWORD v31[5];
  objc_super v32;

  y = a4.y;
  x = a4.x;
  objc_msgSend(MEMORY[0x24BDBCE60], "date", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView touchDownTimestamp](self, "touchDownTimestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  -[WFSlotTemplateView touchDownTimestamp](self, "touchDownTimestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10 < 0.140000001 || v11 == 0;

  -[WFSlotTemplateView setTouchDownTimestamp:](self, "setTouchDownTimestamp:", 0);
  v32.receiver = self;
  v32.super_class = (Class)WFSlotTemplateView;
  -[WFSlotTemplateView hitTest:withEvent:](&v32, sel_hitTest_withEvent_, 0, x, y);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView disclosureButton](self, "disclosureButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 == v15)
  {
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __76__WFSlotTemplateView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
    v31[3] = &unk_24EE25C70;
    v31[4] = self;
    v25 = MEMORY[0x24BDAC9B8];
    v26 = v31;
LABEL_16:
    dispatch_async(v25, v26);
    v23 = 0;
    goto LABEL_19;
  }
  -[WFSlotTemplateView outputButton](self, "outputButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 == v16)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__WFSlotTemplateView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
    block[3] = &unk_24EE25C70;
    block[4] = self;
    v25 = MEMORY[0x24BDAC9B8];
    v26 = block;
    goto LABEL_16;
  }
  -[WFSlotTemplateView slotAtPoint:](self, "slotAtPoint:", x, y);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[WFSlotTemplateView configureMenuAtLocation:wasTriggeredByTap:](self, "configureMenuAtLocation:wasTriggeredByTap:", v13, x, y);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "shouldDisplayInFixedOrder");
    v20 = (void *)MEMORY[0x24BEBD4F8];
    objc_msgSend(v17, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __76__WFSlotTemplateView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3;
    v28[3] = &unk_24EE25330;
    v29 = v18;
    v22 = v18;
    objc_msgSend(v20, "configurationWithIdentifier:previewProvider:actionProvider:", v21, 0, v28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      v24 = 2;
    else
      v24 = 1;
    objc_msgSend(v23, "setPreferredMenuElementOrder:", v24);

  }
  else
  {
    v23 = 0;
  }

LABEL_19:
  return v23;
}

- (BOOL)shouldPresentMenuAboveView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;

  -[WFSlotTemplateView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[WFSlotTemplateView window](self, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView convertRect:toView:](self, "convertRect:toView:", v11, v4, v6, v8, v10);
  v13 = v12;

  -[WFSlotTemplateView window](self, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  LOBYTE(v11) = v13 > v15 * 0.5;

  return (char)v11;
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGPoint result;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView slotWithIdentifier:](self, "slotWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSlotTemplateView slotWithIdentifier:](self, "slotWithIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSlotTemplateView sourceRectForSlot:](self, "sourceRectForSlot:", v8);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    -[WFSlotTemplateView window](self, "window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSlotTemplateView convertRect:toView:](self, "convertRect:toView:", v17, v10, v12, v14, v16);
    v19 = v14 * 0.5 + v18;
    objc_msgSend(v17, "frame");
    if (v19 >= v20 * 0.5)
    {
      v10 = v10 + v14;
      objc_msgSend(v17, "frame");
      v29 = (v28 + 250.0) * 0.5;
      -[WFSlotTemplateView convertPoint:toView:](self, "convertPoint:toView:", v17, v10, 0.0);
      if (v30 < v29)
      {
        objc_msgSend(v17, "convertPoint:toView:", self, v29, 0.0);
        v25 = -16.0;
        goto LABEL_8;
      }
      v31 = -12.0;
    }
    else
    {
      objc_msgSend(v17, "frame");
      v22 = (v21 + -250.0) * 0.5;
      -[WFSlotTemplateView convertPoint:toView:](self, "convertPoint:toView:", v17, v10, 0.0);
      if (v23 > v22)
      {
        objc_msgSend(v17, "convertPoint:toView:", self, v22, 0.0);
        v25 = 16.0;
LABEL_8:
        v27 = v24 + v25;
        goto LABEL_12;
      }
      v31 = 12.0;
    }
    v27 = v10 + v31;
LABEL_12:
    if (-[WFSlotTemplateView shouldPresentMenuAboveView](self, "shouldPresentMenuAboveView"))
    {
      -[WFSlotTemplateView frame](self, "frame");
      if (v12 < v32 * 0.5)
      {
        v33 = -4.0;
LABEL_17:
        v26 = v12 + v33;
LABEL_21:

        goto LABEL_22;
      }
      -[WFSlotTemplateView frame](self, "frame");
      v36 = v35 * 0.5;
      v37 = -2.0;
    }
    else
    {
      v12 = v12 + v16;
      -[WFSlotTemplateView frame](self, "frame");
      if (v12 > v34 * 0.5)
      {
        v33 = 4.0;
        goto LABEL_17;
      }
      -[WFSlotTemplateView frame](self, "frame");
      v36 = v38 * 0.5;
      v37 = 2.0;
    }
    v26 = v36 + v37;
    goto LABEL_21;
  }
  v27 = *MEMORY[0x24BDBEFB0];
  v26 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
LABEL_22:

  v39 = v27;
  v40 = v26;
  result.y = v40;
  result.x = v39;
  return result;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_super v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[WFSlotTemplateView menuWillPresent](self, "menuWillPresent");
  v11.receiver = self;
  v11.super_class = (Class)WFSlotTemplateView;
  -[WFSlotTemplateView contextMenuInteraction:willDisplayMenuForConfiguration:animator:](&v11, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_, v10, v9, v8);

}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  objc_super v13;

  v8 = (void *)MEMORY[0x24BDD16D0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:", CFSTR("WFSlotContextMenuInteractionWillEndNotification"), 0);

  -[WFSlotTemplateView presentedMenuDidDismiss](self, "presentedMenuDidDismiss");
  v13.receiver = self;
  v13.super_class = (Class)WFSlotTemplateView;
  -[WFSlotTemplateView contextMenuInteraction:willEndForConfiguration:animator:](&v13, sel_contextMenuInteraction_willEndForConfiguration_animator_, v11, v10, v9);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  WFSlotTemplateView *v16;
  id v17;
  _QWORD v19[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  objc_super v24;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)WFSlotTemplateView;
  -[WFSlotTemplateView hitTest:withEvent:](&v24, sel_hitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView disclosureButton](self, "disclosureButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v9)
  {
    -[WFSlotTemplateView outputButton](self, "outputButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != v10)
    {
      -[WFSlotTemplateView typingTextView](self, "typingTextView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v11)
      {
        -[WFSlotTemplateView typingSlotIdentifier](self, "typingSlotIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[WFSlotTemplateView typingSlotIdentifier](self, "typingSlotIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFSlotTemplateView slotWithIdentifier:](self, "slotWithIdentifier:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 0;
          v21 = &v20;
          v22 = 0x2020000000;
          v23 = 0;
          if (!v13)
            goto LABEL_10;
          -[WFSlotTemplateView layoutManager](self, "layoutManager");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = MEMORY[0x24BDAC760];
          v19[1] = 3221225472;
          v19[2] = __40__WFSlotTemplateView_hitTest_withEvent___block_invoke;
          v19[3] = &unk_24EE25358;
          *(double *)&v19[5] = x;
          *(double *)&v19[6] = y;
          v19[4] = &v20;
          objc_msgSend(v15, "enumerateEnclosingRectsForSlot:includeInsideSpacing:insetForBackground:usingBlock:", v13, 1, 0, v19);

          if (!*((_BYTE *)v21 + 24))
          {
LABEL_10:
            v16 = self;

            v8 = v16;
          }
          _Block_object_dispose(&v20, 8);
          goto LABEL_12;
        }
      }
      else
      {

      }
      -[WFSlotTemplateView slotAtPoint:](self, "slotAtPoint:", x, y);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
LABEL_13:

        goto LABEL_14;
      }
      v13 = v8;
      v8 = 0;
LABEL_12:

      goto LABEL_13;
    }
  }
LABEL_14:
  v17 = v8;

  return v17;
}

- (void)handleTouch:(id)a3 withPhase:(unint64_t)a4
{
  objc_msgSend(a3, "locationInView:", self);
  -[WFSlotTemplateView handleTouchWithPhase:atLocation:](self, "handleTouchWithPhase:atLocation:", a4);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFSlotTemplateView;
  v6 = a3;
  -[WFSlotTemplateView touchesBegan:withEvent:](&v8, sel_touchesBegan_withEvent_, v6, a4);
  objc_msgSend(v6, "anyObject", v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFSlotTemplateView handleTouch:withPhase:](self, "handleTouch:withPhase:", v7, 0);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFSlotTemplateView;
  v6 = a3;
  -[WFSlotTemplateView touchesMoved:withEvent:](&v8, sel_touchesMoved_withEvent_, v6, a4);
  objc_msgSend(v6, "anyObject", v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFSlotTemplateView handleTouch:withPhase:](self, "handleTouch:withPhase:", v7, 1);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFSlotTemplateView;
  v6 = a3;
  -[WFSlotTemplateView touchesEnded:withEvent:](&v8, sel_touchesEnded_withEvent_, v6, a4);
  objc_msgSend(v6, "anyObject", v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFSlotTemplateView handleTouch:withPhase:](self, "handleTouch:withPhase:", v7, 2);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFSlotTemplateView;
  v6 = a3;
  -[WFSlotTemplateView touchesCancelled:withEvent:](&v8, sel_touchesCancelled_withEvent_, v6, a4);
  objc_msgSend(v6, "anyObject", v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFSlotTemplateView handleTouch:withPhase:](self, "handleTouch:withPhase:", v7, 3);
}

- (id)attachmentAtPoint:(CGPoint)a3 characterRange:(_NSRange *)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  NSUInteger v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGPoint v29;
  CGRect v30;

  y = a3.y;
  x = a3.x;
  -[WFSlotTemplateView layoutManager](self, "layoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView textContainer](self, "textContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v9, 0, x, y);

  -[WFSlotTemplateView layoutManager](self, "layoutManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView textContainer](self, "textContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "glyphIndexForPoint:inTextContainer:", v12, x, y);

  -[WFSlotTemplateView textStorage](self, "textStorage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  v16 = 0;
  if (v10 < v15)
  {
    -[WFSlotTemplateView textStorage](self, "textStorage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BEBB318], v10, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_6;
    -[WFSlotTemplateView layoutManager](self, "layoutManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSlotTemplateView textContainer](self, "textContainer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "boundingRectForGlyphRange:inTextContainer:", v13, 1, v19);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    v30.origin.x = v21;
    v30.origin.y = v23;
    v30.size.width = v25;
    v30.size.height = v27;
    v29.x = x;
    v29.y = y;
    if (CGRectContainsPoint(v30, v29))
    {
      if (a4)
      {
        a4->location = v10;
        a4->length = 1;
      }
    }
    else
    {
LABEL_6:

      v16 = 0;
    }
  }
  return v16;
}

- (id)slotAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;

  y = a3.y;
  x = a3.x;
  -[WFSlotTemplateView layoutManager](self, "layoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView textContainer](self, "textContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v7, 0, x, y);

  v24 = 0;
  v25 = 0;
  -[WFSlotTemplateView textStorage](self, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "slotAtCharacterIndex:effectiveRange:effectiveContentRange:", v8, &v24, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    -[WFSlotTemplateView layoutManager](self, "layoutManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "glyphRangeForCharacterRange:actualCharacterRange:", v24, v25, 0);
    v14 = v13;

    -[WFSlotTemplateView layoutManager](self, "layoutManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __34__WFSlotTemplateView_slotAtPoint___block_invoke;
    v19[3] = &unk_24EE25358;
    *(double *)&v19[5] = x;
    *(double *)&v19[6] = y;
    v19[4] = &v20;
    objc_msgSend(v15, "enumerateInsetEnclosingRectsForGlyphRange:usingBlock:", v12, v14, v19);

    if (*((_BYTE *)v21 + 24))
      v16 = v10;
    else
      v16 = 0;
    v17 = v16;
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (CGRect)sourceRectForSlotWithIdentifier:(id)a3
{
  id v5;
  void *v6;
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
  void *v19;
  CGRect result;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSlotTemplateView.m"), 1283, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("slotIdentifier"));

  }
  -[WFSlotTemplateView slotWithIdentifier:](self, "slotWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView sourceRectForSlot:](self, "sourceRectForSlot:", v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)sourceRectForSlot:(id)a3
{
  id v5;
  __int128 v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  _QWORD v17[5];
  uint64_t v18;
  double *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  CGRect result;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSlotTemplateView.m"), 1289, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("slot"));

  }
  v18 = 0;
  v19 = (double *)&v18;
  v20 = 0x4010000000;
  v21 = &unk_226909C59;
  v6 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
  v22 = *MEMORY[0x24BDBF090];
  v23 = v6;
  -[WFSlotTemplateView layoutManager](self, "layoutManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __40__WFSlotTemplateView_sourceRectForSlot___block_invoke;
  v17[3] = &unk_24EE25380;
  v17[4] = &v18;
  objc_msgSend(v7, "enumerateEnclosingRectsForSlot:includeInsideSpacing:insetForBackground:usingBlock:", v5, 1, 1, v17);

  v8 = v19[4];
  v9 = v19[5];
  v10 = v19[6];
  v11 = v19[7];
  _Block_object_dispose(&v18, 8);

  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)updateTintColorInTextStorage
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __50__WFSlotTemplateView_updateTintColorInTextStorage__block_invoke;
  v2[3] = &unk_24EE25C70;
  v2[4] = self;
  -[WFSlotTemplateView performFadeTransition:](self, "performFadeTransition:", v2);
}

- (void)tintColorDidChange
{
  void *v3;
  char v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFSlotTemplateView;
  -[WFSlotTemplateView tintColorDidChange](&v6, sel_tintColorDidChange);
  -[WFSlotTemplateView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFSlotTemplateView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "slotTemplateViewTintColorDidChange:", self);

  }
  -[WFSlotTemplateView updateTintColorInTextStorage](self, "updateTintColorInTextStorage");
}

- (void)slotTemplateStorageDidInvalidateDisplay:(id)a3
{
  -[WFSlotTemplateView invalidateDisplay](self, "invalidateDisplay", a3);
  -[WFSlotTemplateView updateAccessibilityElements](self, "updateAccessibilityElements");
}

- (void)slotTemplateTypingTextViewDidDelete:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  -[WFSlotTemplateView selectedSlot](self, "selectedSlot", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPopulated");

  if ((v5 & 1) == 0)
  {
    -[WFSlotTemplateView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[WFSlotTemplateView delegate](self, "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[WFSlotTemplateView selectedSlotIdentifier](self, "selectedSlotIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "slotTemplateView:deletePressedOnSlotWithIdentifier:allowResettingValue:", self, v8, 0);

    }
  }
}

- (void)slotTemplateTypingTextViewDidCut:(id)a3 withOriginalBlock:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void (**v8)(void);

  v8 = (void (**)(void))a4;
  -[WFSlotTemplateView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WFSlotTemplateView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "slotTemplateView:typingDidCutWithOriginalBlock:", self, v8);

  }
  else
  {
    v8[2]();
  }

}

- (void)slotTemplateTypingTextViewDidCopy:(id)a3 withOriginalBlock:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void (**v8)(void);

  v8 = (void (**)(void))a4;
  -[WFSlotTemplateView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WFSlotTemplateView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "slotTemplateView:typingDidCopyWithOriginalBlock:", self, v8);

  }
  else
  {
    v8[2]();
  }

}

- (void)slotTemplateTypingTextViewDidPaste:(id)a3 withOriginalBlock:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void (**v8)(void);

  v8 = (void (**)(void))a4;
  -[WFSlotTemplateView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WFSlotTemplateView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "slotTemplateView:typingDidPasteWithOriginalBlock:", self, v8);

  }
  else
  {
    v8[2]();
  }

}

- (void)slotTemplateTypingTextViewDidTabForwards:(id)a3 withOriginalBlock:(id)a4
{
  void (**v5)(_QWORD);
  void *v6;
  _QWORD v7[5];
  id v8;

  v5 = (void (**)(_QWORD))a4;
  -[WFSlotTemplateView typingSlotIdentifier](self, "typingSlotIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && !-[WFSlotTemplateView typingAllowsMultipleLines](self, "typingAllowsMultipleLines"))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __81__WFSlotTemplateView_slotTemplateTypingTextViewDidTabForwards_withOriginalBlock___block_invoke;
    v7[3] = &unk_24EE252E0;
    v7[4] = self;
    v8 = v6;
    -[WFSlotTemplateView _deselectSlotAndNotifyDelegate:completionHandler:](self, "_deselectSlotAndNotifyDelegate:completionHandler:", 1, v7);

  }
  else
  {
    v5[2](v5);
  }

}

- (void)slotTemplateTypingTextViewDidTabBackwards:(id)a3 withOriginalBlock:(id)a4
{
  void (**v5)(_QWORD);
  void *v6;
  _QWORD v7[5];
  id v8;

  v5 = (void (**)(_QWORD))a4;
  -[WFSlotTemplateView typingSlotIdentifier](self, "typingSlotIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && !-[WFSlotTemplateView typingAllowsMultipleLines](self, "typingAllowsMultipleLines"))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __82__WFSlotTemplateView_slotTemplateTypingTextViewDidTabBackwards_withOriginalBlock___block_invoke;
    v7[3] = &unk_24EE252E0;
    v7[4] = self;
    v8 = v6;
    -[WFSlotTemplateView _deselectSlotAndNotifyDelegate:completionHandler:](self, "_deselectSlotAndNotifyDelegate:completionHandler:", 1, v7);

  }
  else
  {
    v5[2](v5);
  }

}

- (BOOL)shouldRecognizeTapOnTextAttachment:(id)a3 inSlotWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  v7 = a4;
  -[WFSlotTemplateView slotWithIdentifier:](self, "slotWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WFSlotTemplateView isEnabled](self, "isEnabled") && objc_msgSend(v8, "isEnabled"))
  {
    -[WFSlotTemplateView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = objc_msgSend(v9, "slotTemplateView:shouldTapTextAttachment:inSlotWithIdentifier:", self, v6, v7);
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)didTapTextAttachment:(id)a3 inSlotWithIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[WFSlotTemplateView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "slotTemplateView:didTapTextAttachment:inSlotWithIdentifier:", self, v8, v6);

}

- (id)slotIdentifierForAttachmentInteraction:(id)a3 characterRange:(_NSRange)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  -[WFSlotTemplateView typingAttachmentInteraction](self, "typingAttachmentInteraction");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    -[WFSlotTemplateView typingSlotIdentifier](self, "typingSlotIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)textAttachmentInteraction:(id)a3 shouldRecognizeTapOnTextAttachment:(id)a4 inCharacterRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  BOOL v11;

  length = a5.length;
  location = a5.location;
  v9 = a4;
  -[WFSlotTemplateView slotIdentifierForAttachmentInteraction:characterRange:](self, "slotIdentifierForAttachmentInteraction:characterRange:", a3, location, length);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = -[WFSlotTemplateView shouldRecognizeTapOnTextAttachment:inSlotWithIdentifier:](self, "shouldRecognizeTapOnTextAttachment:inSlotWithIdentifier:", v9, v10);
  else
    v11 = 0;

  return v11;
}

- (void)textAttachmentInteraction:(id)a3 didTapTextAttachment:(id)a4 inCharacterRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v9;
  id v10;

  length = a5.length;
  location = a5.location;
  v10 = a4;
  -[WFSlotTemplateView slotIdentifierForAttachmentInteraction:characterRange:](self, "slotIdentifierForAttachmentInteraction:characterRange:", a3, location, length);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[WFSlotTemplateView didTapTextAttachment:inSlotWithIdentifier:](self, "didTapTextAttachment:inSlotWithIdentifier:", v10, v9);

}

- (double)heightForWidth:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  uint8_t v23[16];
  uint8_t buf[16];

  -[WFSlotTemplateView cachedHeightsByWidths](self, "cachedHeightsByWidths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "doubleValue");
    v9 = v8;
  }
  else
  {
    getWFEditorLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_signpost_id_generate(v10);

    getWFEditorLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_226666000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SlotTemplateCalculateSize", ", buf, 2u);
    }

    -[WFSlotTemplateView textContainer](self, "textContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSlotTemplateView layoutManager](self, "layoutManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSlotTemplateView bounds](self, "bounds");
    -[WFSlotTemplateView updateExclusionRectsWithBounds:](self, "updateExclusionRectsWithBounds:");
    objc_msgSend(v15, "wf_calculateIntrinsicHeightForWidth:textContainer:", v14, a3);
    v9 = v16;
    -[WFSlotTemplateView bounds](self, "bounds");
    -[WFSlotTemplateView updateExclusionRectsWithBounds:](self, "updateExclusionRectsWithBounds:");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSlotTemplateView cachedHeightsByWidths](self, "cachedHeightsByWidths");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19);

    getWFEditorLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_226666000, v21, OS_SIGNPOST_INTERVAL_END, v11, "SlotTemplateCalculateSize", ", v23, 2u);
    }

  }
  return v9;
}

- (void)updateTypingTextContents:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  -[WFSlotTemplateView slotWithIdentifier:](self, "slotWithIdentifier:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSlotTemplateView.m"), 1568, CFSTR("Must be slot with that identifier"));

  }
  -[WFSlotTemplateView typingTextView](self, "typingTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView typingTextStorage](self, "typingTextStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentAttributedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqualToString:", v10);

  if ((v11 & 1) == 0)
  {
    -[WFSlotTemplateView textColor](self, "textColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v12);

    v26[0] = *MEMORY[0x24BEBB360];
    -[WFSlotTemplateView font](self, "font");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v13;
    v26[1] = *MEMORY[0x24BEBB368];
    objc_msgSend(v7, "textColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v14;
    v26[2] = *MEMORY[0x24BEBB3A8];
    -[WFSlotTemplateView paragraphStyle](self, "paragraphStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSlotTemplateView typingParagraphStyleForParagraphStyle:](self, "typingParagraphStyleForParagraphStyle:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTypingAttributes:", v17);

    -[WFSlotTemplateView font](self, "font");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEmojiOverrideFont:", v18);

    objc_msgSend(v5, "contentAttributedString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");
    v21 = v20;
    if (v20)
      v22 = v20;
    else
      v22 = (id)objc_opt_new();
    v23 = v22;

    objc_msgSend(v6, "typingAttributes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addAttributes:range:", v24, 0, objc_msgSend(v23, "length"));

    objc_msgSend(v7, "setAttributedString:", v23);
  }

}

- (void)beginTypingInSlotWithIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  WFSlotIdentifier *v8;
  WFSlotIdentifier *typingSlotIdentifier;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;

  v5 = a3;
  -[WFSlotTemplateView slotWithIdentifier:](self, "slotWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSlotTemplateView.m"), 1594, CFSTR("Must be slot with that identifier"));

  }
  -[WFSlotTemplateView typingTextView](self, "typingTextView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    -[WFSlotTemplateView setupTextEntry](self, "setupTextEntry");
  v8 = (WFSlotIdentifier *)objc_msgSend(v5, "copy");
  typingSlotIdentifier = self->_typingSlotIdentifier;
  self->_typingSlotIdentifier = v8;

  -[WFSlotTemplateView typingTextView](self, "typingTextView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView typingTextStorage](self, "typingTextStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView resetTextView](self, "resetTextView");
  -[WFSlotTemplateView updateTypingTextContents:](self, "updateTypingTextContents:", v5);
  -[WFSlotTemplateView positionTypingAboveSlot:](self, "positionTypingAboveSlot:", v6);
  objc_msgSend(v10, "setReturnKeyType:", 9);
  -[WFSlotTemplateView setTypingAllowsMultipleLines:](self, "setTypingAllowsMultipleLines:", 0);
  -[WFSlotTemplateView delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v17 = 0;
    objc_msgSend(v12, "slotTemplateView:willBeginTypingInSlotWithIdentifier:usingTextEntry:allowMultipleLines:", self, v5, v10, &v17);
    if (v17)
    {
      objc_msgSend(v10, "setReturnKeyType:", 0);
      -[WFSlotTemplateView setTypingAllowsMultipleLines:](self, "setTypingAllowsMultipleLines:", 1);
    }
  }
  -[WFSlotTemplateView textStorage](self, "textStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "didBeginTypingInSlot:", v6);

  objc_msgSend(v10, "setHidden:", 0);
  objc_msgSend(v10, "becomeFirstResponder");
  if (objc_msgSend(v6, "userInputInsertionIndex") == -1)
    v14 = objc_msgSend(v11, "length");
  else
    v14 = objc_msgSend(v6, "userInputInsertionIndex");
  objc_msgSend(v10, "setSelectedRange:", v14, 0);
  -[WFSlotTemplateView layoutManager](self, "layoutManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView setLastLayoutManagerLineCount:](self, "setLastLayoutManagerLineCount:", objc_msgSend(v15, "numberOfLaidLines"));

}

- (void)positionTypingAboveSlot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  _QWORD v14[5];
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[3];
  char v19;
  _QWORD v20[4];

  v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v5 = (void *)objc_opt_new();
  -[WFSlotTemplateView layoutManager](self, "layoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __46__WFSlotTemplateView_positionTypingAboveSlot___block_invoke;
  v14[3] = &unk_24EE253A8;
  v16 = v18;
  v17 = v20;
  v14[4] = self;
  v8 = v5;
  v15 = v8;
  objc_msgSend(v6, "enumerateEnclosingRectsForSlot:includeInsideSpacing:insetForBackground:usingBlock:", v4, 0, 0, v14);

  v9 = (void *)MEMORY[0x24BEBDB00];
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __46__WFSlotTemplateView_positionTypingAboveSlot___block_invoke_2;
  v11[3] = &unk_24EE253D0;
  v11[4] = self;
  v10 = v8;
  v12 = v10;
  v13 = v20;
  objc_msgSend(v9, "performWithoutAnimation:", v11);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);

}

- (void)endTyping
{
  void *v3;
  int v4;
  id v5;

  -[WFSlotTemplateView typingTextView](self, "typingTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFirstResponder");

  if (v4)
  {
    -[WFSlotTemplateView typingTextView](self, "typingTextView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resignFirstResponder");

  }
  else
  {
    -[WFSlotTemplateView typingTextViewDidEndEditing](self, "typingTextViewDidEndEditing");
  }
}

- (void)resetTextView
{
  id v2;

  -[WFSlotTemplateView typingTextView](self, "typingTextView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClearsZeroWhenTyping:", 0);
  objc_msgSend(v2, "setAttributedText:", 0);
  objc_msgSend(v2, "setInputView:", 0);
  objc_msgSend(v2, "setInputAccessoryView:", 0);
  objc_msgSend(v2, "setAutocapitalizationType:", 2);
  objc_msgSend(v2, "setAutocorrectionType:", 0);
  objc_msgSend(v2, "setSpellCheckingType:", 0);
  objc_msgSend(v2, "setSmartQuotesType:", 0);
  objc_msgSend(v2, "setSmartDashesType:", 0);
  objc_msgSend(v2, "setSmartInsertDeleteType:", 0);
  objc_msgSend(v2, "setKeyboardType:", 0);
  objc_msgSend(v2, "setKeyboardAppearance:", 0);
  objc_msgSend(v2, "setReturnKeyType:", 0);
  objc_msgSend(v2, "setEnablesReturnKeyAutomatically:", 0);
  objc_msgSend(v2, "setSecureTextEntry:", 0);
  objc_msgSend(v2, "setTextContentType:", 0);
  objc_msgSend(v2, "setPasswordRules:", 0);

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  char v18;
  void *v19;
  void *v20;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "rangeOfCharacterFromSet:", v11);

  if (v12 == 0x7FFFFFFFFFFFFFFFLL || -[WFSlotTemplateView typingAllowsMultipleLines](self, "typingAllowsMultipleLines"))
  {
    -[WFSlotTemplateView delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "attributedText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "mutableCopy");
      v16 = v15;
      if (v15)
        v17 = v15;
      else
        v17 = (id)objc_opt_new();
      v19 = v17;

      objc_msgSend(v19, "replaceCharactersInRange:withString:", location, length, v10);
      -[WFSlotTemplateView typingSlotIdentifier](self, "typingSlotIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v13, "slotTemplateView:shouldChangeText:forSlotWithIdentifier:", self, v19, v20);

    }
    else
    {
      v18 = 1;
    }

  }
  else
  {
    objc_msgSend(v9, "resignFirstResponder");
    v18 = 0;
  }

  return v18;
}

- (void)typingTextViewDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[WFSlotTemplateView typingTextView](self, "typingTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView typingSlotIdentifier](self, "typingSlotIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[WFSlotTemplateView slotWithIdentifier:](self, "slotWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v7, "setContentAttributedString:", v4);
    -[WFSlotTemplateView textStorage](self, "textStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "replaceObjectAtIndex:withObject:", objc_msgSend(v10, "indexOfObject:", v6), v7);
    -[WFSlotTemplateView setContents:animated:](self, "setContents:animated:", v10, 0);
    -[WFSlotTemplateView delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v11, "slotTemplateView:didChangeText:forSlotWithIdentifier:", self, v4, v5);
    -[WFSlotTemplateView layoutManager](self, "layoutManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "numberOfLaidLines");

    if (v13 != -[WFSlotTemplateView lastLayoutManagerLineCount](self, "lastLayoutManagerLineCount"))
    {
      -[WFSlotTemplateView setLastLayoutManagerLineCount:](self, "setLastLayoutManagerLineCount:", v13);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v11, "slotTemplateViewDidInvalidateSize:", self);
    }

  }
  else
  {
    getWFGeneralLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      v15 = 136315138;
      v16 = "-[WFSlotTemplateView typingTextViewDidChange]";
      _os_log_impl(&dword_226666000, v14, OS_LOG_TYPE_FAULT, "%s Received text view change notification while there is no slot with an active typing session.", (uint8_t *)&v15, 0xCu);
    }

  }
}

- (void)typingTextViewDidEndEditing
{
  void *v3;
  WFSlotIdentifier *typingSlotIdentifier;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[WFSlotTemplateView typingTextView](self, "typingTextView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView typingSlotIdentifier](self, "typingSlotIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  typingSlotIdentifier = self->_typingSlotIdentifier;
  self->_typingSlotIdentifier = 0;

  objc_msgSend(v8, "setHidden:", 1);
  -[WFSlotTemplateView resetTextView](self, "resetTextView");
  -[WFSlotTemplateView slotWithIdentifier:](self, "slotWithIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[WFSlotTemplateView textStorage](self, "textStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didEndTypingInSlot:", v5);

  }
  -[WFSlotTemplateView updateAccessibilityElements](self, "updateAccessibilityElements");
  -[WFSlotTemplateView accessibilityShiftFocusBackToView](self, "accessibilityShiftFocusBackToView");
  -[WFSlotTemplateView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "slotTemplateView:didEndTypingInSlotWithIdentifier:", self, v3);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (NSArray)accessibilityElements
{
  NSArray *accessibilityElements;

  accessibilityElements = self->_accessibilityElements;
  if (!accessibilityElements)
  {
    -[WFSlotTemplateView updateAccessibilityElements](self, "updateAccessibilityElements");
    accessibilityElements = self->_accessibilityElements;
  }
  return accessibilityElements;
}

- (int64_t)accessibilityElementCount
{
  void *v2;
  int64_t v3;

  -[WFSlotTemplateView accessibilityElements](self, "accessibilityElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[WFSlotTemplateView accessibilityElements](self, "accessibilityElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateAccessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  WFSlotTemplateView *v14;
  id v15;
  id v16;
  id v17;
  CGRect v18;

  -[WFSlotTemplateView frame](self, "frame");
  if (CGRectEqualToRect(v18, *MEMORY[0x24BDBF090]))
  {
    -[WFSlotTemplateView setAccessibilityElements:](self, "setAccessibilityElements:", 0);
  }
  else
  {
    -[WFSlotTemplateView textStorage](self, "textStorage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSlotTemplateView layoutManager](self, "layoutManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "selectedSlots");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_new();
    v7 = objc_msgSend(v3, "length");
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __49__WFSlotTemplateView_updateAccessibilityElements__block_invoke;
    v12[3] = &unk_24EE25420;
    v13 = v4;
    v14 = self;
    v15 = v6;
    v16 = v3;
    v17 = v5;
    v8 = v5;
    v9 = v3;
    v10 = v6;
    v11 = v4;
    objc_msgSend(v9, "enumerateContentInRange:usingBlock:", 0, v7, v12);
    -[WFSlotTemplateView setAccessibilityElements:](self, "setAccessibilityElements:", v10);

  }
}

- (void)accessibilityShiftFocusBackToView
{
  UIAccessibilityPostNotification(*MEMORY[0x24BEBDE88], self);
}

- (BOOL)startEditingHighlightedSlot
{
  void *v3;
  void *v4;
  _QWORD v6[5];
  id v7;

  -[WFSlotTemplateView highlightedSlot](self, "highlightedSlot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __49__WFSlotTemplateView_startEditingHighlightedSlot__block_invoke;
    v6[3] = &unk_24EE252E0;
    v6[4] = self;
    v7 = v3;
    -[WFSlotTemplateView _deselectSlotAndNotifyDelegate:completionHandler:](self, "_deselectSlotAndNotifyDelegate:completionHandler:", 1, v6);

  }
  return v4 != 0;
}

- (WFSlotTemplateViewDelegate)delegate
{
  return (WFSlotTemplateViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)horizontalPadding
{
  return self->_horizontalPadding;
}

- (NSArray)exclusionRects
{
  return self->_exclusionRects;
}

- (BOOL)showsDisclosureArrow
{
  return self->_showsDisclosureArrow;
}

- (BOOL)disclosureArrowIsOpen
{
  return self->_disclosureArrowIsOpen;
}

- (BOOL)showsOutputButton
{
  return self->_showsOutputButton;
}

- (BOOL)outputButtonIsOpen
{
  return self->_outputButtonIsOpen;
}

- (WFSlotIdentifier)typingSlotIdentifier
{
  return self->_typingSlotIdentifier;
}

- (NSTextContainer)textContainer
{
  return self->_textContainer;
}

- (void)setTextContainer:(id)a3
{
  objc_storeStrong((id *)&self->_textContainer, a3);
}

- (WFSlotTemplateTextStorage)textStorage
{
  return self->_textStorage;
}

- (void)setTextStorage:(id)a3
{
  objc_storeStrong((id *)&self->_textStorage, a3);
}

- (WFSlotTemplateLayoutManager)layoutManager
{
  return self->_layoutManager;
}

- (void)setLayoutManager:(id)a3
{
  objc_storeStrong((id *)&self->_layoutManager, a3);
}

- (WFTextAttachmentInteraction)typingAttachmentInteraction
{
  return self->_typingAttachmentInteraction;
}

- (void)setTypingAttachmentInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_typingAttachmentInteraction, a3);
}

- (UIButton)disclosureButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_disclosureButton);
}

- (void)setDisclosureButton:(id)a3
{
  objc_storeWeak((id *)&self->_disclosureButton, a3);
}

- (UIButton)outputButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_outputButton);
}

- (void)setOutputButton:(id)a3
{
  objc_storeWeak((id *)&self->_outputButton, a3);
}

- (WFSlotTemplateTypingTextView)typingTextView
{
  return self->_typingTextView;
}

- (void)setTypingTextView:(id)a3
{
  objc_storeStrong((id *)&self->_typingTextView, a3);
}

- (NSTextContainer)typingTextContainer
{
  return self->_typingTextContainer;
}

- (void)setTypingTextContainer:(id)a3
{
  objc_storeStrong((id *)&self->_typingTextContainer, a3);
}

- (WFSlotTemplateLayoutManager)typingLayoutManager
{
  return self->_typingLayoutManager;
}

- (void)setTypingLayoutManager:(id)a3
{
  objc_storeStrong((id *)&self->_typingLayoutManager, a3);
}

- (WFSlotTemplateTextStorage)typingTextStorage
{
  return self->_typingTextStorage;
}

- (void)setTypingTextStorage:(id)a3
{
  objc_storeStrong((id *)&self->_typingTextStorage, a3);
}

- (BOOL)typingAllowsMultipleLines
{
  return self->_typingAllowsMultipleLines;
}

- (void)setTypingAllowsMultipleLines:(BOOL)a3
{
  self->_typingAllowsMultipleLines = a3;
}

- (unint64_t)lastLayoutManagerLineCount
{
  return self->_lastLayoutManagerLineCount;
}

- (void)setLastLayoutManagerLineCount:(unint64_t)a3
{
  self->_lastLayoutManagerLineCount = a3;
}

- (void)setAccessibilityElements:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityElements, a3);
}

- (NSMutableDictionary)cachedHeightsByWidths
{
  return self->_cachedHeightsByWidths;
}

- (NSDate)touchDownTimestamp
{
  return self->_touchDownTimestamp;
}

- (void)setTouchDownTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_touchDownTimestamp, a3);
}

- (BOOL)menuIsPresented
{
  return self->_menuIsPresented;
}

- (void)setMenuIsPresented:(BOOL)a3
{
  self->_menuIsPresented = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchDownTimestamp, 0);
  objc_storeStrong((id *)&self->_cachedHeightsByWidths, 0);
  objc_storeStrong((id *)&self->_accessibilityElements, 0);
  objc_storeStrong((id *)&self->_typingTextStorage, 0);
  objc_storeStrong((id *)&self->_typingLayoutManager, 0);
  objc_storeStrong((id *)&self->_typingTextContainer, 0);
  objc_storeStrong((id *)&self->_typingTextView, 0);
  objc_destroyWeak((id *)&self->_outputButton);
  objc_destroyWeak((id *)&self->_disclosureButton);
  objc_storeStrong((id *)&self->_typingAttachmentInteraction, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_typingSlotIdentifier, 0);
  objc_storeStrong((id *)&self->_exclusionRects, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __49__WFSlotTemplateView_startEditingHighlightedSlot__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_selectSlot:notifyDelegate:", *(_QWORD *)(a1 + 40), 1);
}

void __49__WFSlotTemplateView_updateAccessibilityElements__block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, void *, uint64_t, uint64_t);
  void *v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[5];
  uint64_t v43;
  double *v44;
  uint64_t v45;
  void *v46;
  __int128 v47;
  __int128 v48;

  v7 = a2;
  v43 = 0;
  v44 = (double *)&v43;
  v46 = &unk_226909C59;
  v45 = 0x4010000000;
  v8 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
  v47 = *MEMORY[0x24BDBF090];
  v48 = v8;
  v9 = objc_msgSend(a1[4], "glyphRangeForCharacterRange:actualCharacterRange:", a3, a4, 0);
  v10 = MEMORY[0x24BDAC760];
  v11 = a1[4];
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __49__WFSlotTemplateView_updateAccessibilityElements__block_invoke_2;
  v42[3] = &unk_24EE25380;
  v42[4] = &v43;
  objc_msgSend(v11, "enumerateInsetEnclosingRectsForGlyphRange:usingBlock:", v9, v12, v42);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v7;
    objc_msgSend(a1[5], "typingSlotIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (v16)
    {
      v17 = a1[6];
      objc_msgSend(a1[5], "typingTextView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v18);
LABEL_19:

      goto LABEL_20;
    }
    v24 = (void *)objc_opt_new();
    objc_msgSend(a1[7], "attributedSubstringFromRange:", a3, a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "length");
    v27 = *MEMORY[0x24BEBB318];
    v35 = v10;
    v36 = 3221225472;
    v37 = __49__WFSlotTemplateView_updateAccessibilityElements__block_invoke_3;
    v38 = &unk_24EE253F8;
    v39 = a1[5];
    v28 = v24;
    v40 = v28;
    v29 = v25;
    v41 = v29;
    objc_msgSend(v29, "enumerateAttribute:inRange:options:usingBlock:", v27, 0, v26, 0, &v35);
    if (objc_msgSend(a1[5], "isEnabled", v35, v36, v37, v38, v39)
      && objc_msgSend(v13, "isEnabled"))
    {
      v21 = objc_msgSend(a1[8], "containsObject:", v13);
      v20 = 0;
    }
    else
    {
      v21 = 0;
      v20 = 1;
    }
    v23 = *MEMORY[0x24BEBDF00];
    v30 = v41;
    v31 = v28;

    v13 = v31;
LABEL_14:
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD380]), "initWithAccessibilityContainer:", a1[5]);
    objc_msgSend(v18, "setIsAccessibilityElement:", 1);
    objc_msgSend(v18, "setAccessibilityFrameInContainerSpace:", v44[4], v44[5], v44[6], v44[7]);
    objc_msgSend(v18, "setAccessibilityLabel:", v13);
    v32 = *MEMORY[0x24BEBDF30];
    if (!v21)
      v32 = 0;
    v33 = v32 | v23;
    v34 = *MEMORY[0x24BEBDF20];
    if (!v20)
      v34 = 0;
    objc_msgSend(v18, "setAccessibilityTraits:", v33 | v34);
    objc_msgSend(a1[6], "addObject:", v18);
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = 0;
    v21 = 0;
    v13 = 0;
    v22 = (uint64_t *)MEMORY[0x24BEBDF18];
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v19);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "length"))
  {
    v20 = 0;
    v21 = 0;
    v22 = (uint64_t *)MEMORY[0x24BEBDF40];
LABEL_8:
    v23 = *v22;
    goto LABEL_14;
  }
LABEL_20:

  _Block_object_dispose(&v43, 8);
}

uint64_t __49__WFSlotTemplateView_updateAccessibilityElements__block_invoke_2(uint64_t result, _BYTE *a2, double a3, double a4, double a5, double a6)
{
  double *v6;

  v6 = *(double **)(*(_QWORD *)(result + 32) + 8);
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = a5;
  v6[7] = a6;
  *a2 = 1;
  return result;
}

void __49__WFSlotTemplateView_updateAccessibilityElements__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v7 = a2;
  v17 = v7;
  if (!v7)
  {
    v15 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "attributedSubstringFromRange:", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendString:", v16);

    goto LABEL_8;
  }
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "textStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "disclosureAttachment");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 == v17)
    {

      goto LABEL_8;
    }
    objc_msgSend(*(id *)(a1 + 32), "textStorage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "outputButtonAttachment");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v9 = v17;
    if (v13 != v17)
    {
      v14 = *(void **)(a1 + 40);
      objc_msgSend(v17, "accessibilityLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "appendString:", v8);
LABEL_8:

      v9 = v17;
    }
  }

}

void __46__WFSlotTemplateView_positionTypingAboveSlot___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double MinY;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  CGRect v20;
  CGRect v21;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = CGRectGetMinY(*(CGRect *)&a2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  v20.origin.x = a2;
  v20.origin.y = a3;
  v20.size.width = a4;
  v20.size.height = a5;
  MinY = CGRectGetMinY(v20);
  v21.origin.x = a2;
  v21.origin.y = a3;
  v21.size.width = a4;
  v21.size.height = a5;
  v11 = (MinY + CGRectGetMaxY(v21)) * 0.5 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v12 = a2 + a4;
  objc_msgSend(*(id *)(a1 + 32), "typingTextContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "size");
  v15 = v14 - v12;

  v16 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRect:", 0.0, v11, a2, 5.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v17);

  v18 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRect:", v12, v11, v15, 5.0);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v19);

}

void __46__WFSlotTemplateView_positionTypingAboveSlot___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "typingTextContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExclusionPaths:", v2);

  v4 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "typingTextView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextContainerInset:", v4, 0.0, 0.0, 0.0);

}

void __82__WFSlotTemplateView_slotTemplateTypingTextViewDidTabBackwards_withOriginalBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "slotBeforeSlotIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "highlightSlotWithIdentifier:", v2);
    v2 = v3;
  }

}

void __81__WFSlotTemplateView_slotTemplateTypingTextViewDidTabForwards_withOriginalBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "slotAfterSlotIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "highlightSlotWithIdentifier:", v2);
    v2 = v3;
  }

}

void __50__WFSlotTemplateView_updateTintColorInTextStorage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = objc_msgSend(*(id *)(a1 + 32), "tintAdjustmentMode");
  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginEditing");

  v4 = objc_msgSend(*(id *)(a1 + 32), "isEnabled");
  if (v2 == 2)
    v5 = 0;
  else
    v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v5);

  objc_msgSend(*(id *)(a1 + 32), "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v7);

  objc_msgSend(*(id *)(a1 + 32), "updateVariableAttachmentAppearanceInContents");
  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endEditing");

}

uint64_t __40__WFSlotTemplateView_sourceRectForSlot___block_invoke(uint64_t result, _BYTE *a2, double a3, double a4, double a5, double a6)
{
  double *v6;

  v6 = *(double **)(*(_QWORD *)(result + 32) + 8);
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = a5;
  v6[7] = a6;
  *a2 = 1;
  return result;
}

BOOL __34__WFSlotTemplateView_slotAtPoint___block_invoke(uint64_t a1, _BYTE *a2, double a3, double a4, double a5, double a6)
{
  _BOOL8 result;

  result = CGRectContainsPoint(*(CGRect *)&a3, *(CGPoint *)(a1 + 40));
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a2 = 1;
  }
  return result;
}

BOOL __40__WFSlotTemplateView_hitTest_withEvent___block_invoke(uint64_t a1, _BYTE *a2, double a3, double a4, double a5, double a6)
{
  _BOOL8 result;

  result = CGRectContainsPoint(*(CGRect *)&a3, *(CGPoint *)(a1 + 40));
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a2 = 1;
  }
  return result;
}

uint64_t __76__WFSlotTemplateView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didTapDisclosureArrow");
}

uint64_t __76__WFSlotTemplateView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didTapOutputButton");
}

uint64_t __76__WFSlotTemplateView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "platformMenu");
}

void __64__WFSlotTemplateView_configureMenuAtLocation_wasTriggeredByTap___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didTapTextAttachment:inSlotWithIdentifier:", v2, v3);

}

uint64_t __64__WFSlotTemplateView_configureMenuAtLocation_wasTriggeredByTap___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_selectSlot:notifyDelegate:", *(_QWORD *)(a1 + 40), 1);
}

void __71__WFSlotTemplateView__deselectSlotAndNotifyDelegate_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didDeselectSlot:", *(_QWORD *)(a1 + 40));

}

void __49__WFSlotTemplateView__selectSlot_notifyDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "contents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 32));

  if ((v3 & 1) != 0)
    goto LABEL_3;
  v4 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "slotWithIdentifier:", v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v11 = (id)v6;
  if (v6)
  {
LABEL_3:
    objc_msgSend(*(id *)(a1 + 48), "textStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didSelectSlot:", v11);

    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 56))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v9 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v11, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "slotTemplateView:didSelectSlotWithIdentifier:", v9, v10);

      }
    }

  }
}

uint64_t __37__WFSlotTemplateView_unhighlightSlot__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didUnhighlightSlot:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "updateVariableAttachmentAppearanceInContents");
}

uint64_t __50__WFSlotTemplateView_highlightSlotWithIdentifier___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "unhighlightSlot");
  objc_msgSend(*(id *)(a1 + 40), "didHighlightSlot:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "updateVariableAttachmentAppearanceInContents");
}

void __43__WFSlotTemplateView_setContents_animated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContents:", v1);

}

void __58__WFSlotTemplateView_updateOutputButtonTransformAnimated___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  void *v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "outputButtonIsOpen"))
    v2 = CFSTR("eye.fill");
  else
    v2 = CFSTR("eye");
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "outputButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:forState:", v4, 0);

}

uint64_t __48__WFSlotTemplateView_updateOutputButtonPosition__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;

  objc_msgSend(*(id *)(a1 + 32), "outputButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "intrinsicContentSize");
  v11 = v10;
  v13 = v12;

  objc_msgSend(*(id *)(a1 + 32), "outputButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", a2 + 7.0, a3 + (a5 - v13) * 0.5, v11, v13);

  return objc_msgSend(*(id *)(a1 + 32), "updateOutputButtonTransformAnimated:", 0);
}

void __43__WFSlotTemplateView_setShowsOutputButton___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setOutputButtonAttachment:", v1);

}

void __62__WFSlotTemplateView_updateDisclosureButtonTransformAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL4 v3;
  double v4;
  int v5;
  double v6;
  void *v7;
  CGAffineTransform v8;
  CGAffineTransform v9;

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "layoutDirection") == 1;

  v4 = dbl_2268AB3C0[v3];
  v5 = objc_msgSend(*(id *)(a1 + 32), "disclosureArrowIsOpen");
  v6 = 0.0;
  if (v5)
    v6 = v4;
  CGAffineTransformMakeRotation(&v9, v6);
  objc_msgSend(*(id *)(a1 + 32), "disclosureButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  objc_msgSend(v7, "setTransform:", &v8);

}

uint64_t __52__WFSlotTemplateView_updateDisclosureButtonPosition__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  v9 = 0.0;
  if (objc_msgSend(*(id *)(a1 + 32), "showsOutputButton"))
  {
    objc_msgSend(*(id *)(a1 + 32), "outputButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "intrinsicContentSize");
    v9 = v11 + 7.0;

  }
  objc_msgSend(*(id *)(a1 + 32), "disclosureButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "intrinsicContentSize");
  v14 = v13;
  v16 = v15;

  objc_msgSend(*(id *)(a1 + 32), "disclosureButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", a2 + 7.0 + v9, a3 + (a5 - v16) * 0.5, v14, v16);

  return objc_msgSend(*(id *)(a1 + 32), "updateDisclosureButtonTransformAnimated:", 0);
}

void __46__WFSlotTemplateView_setShowsDisclosureArrow___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDisclosureAttachment:", v1);

}

uint64_t __53__WFSlotTemplateView_updateExclusionRectsWithBounds___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "layoutDirection") == 1;

  v7 = (void *)MEMORY[0x24BEBD420];
  objc_msgSend(v4, "resolvedRectWithViewBounds:inRTL:", v6, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  return objc_msgSend(v7, "bezierPathWithRect:", v9, v11, v13, v15);
}

void __73__WFSlotTemplateView_setDisabledSlotTitleColor_backgroundColor_animated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDisabledSlotTitleColor:backgroundColor:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __66__WFSlotTemplateView_updateVariableAttachmentAppearanceInContents__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v13[5];

  v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  objc_msgSend(*(id *)(a1 + 32), "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v7);

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66__WFSlotTemplateView_updateVariableAttachmentAppearanceInContents__block_invoke_2;
  v13[3] = &unk_24EE25C70;
  v13[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "setFixUpBlock:", v13);
  objc_msgSend(v5, "containingSlotIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "slotWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "standaloneTextAttachment"))
    {
      objc_msgSend(*(id *)(a1 + 32), "highlightedSlotIdentifier");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = v8;
      if (v10 == v11)
      {
        v12 = 1;
      }
      else if (v10)
      {
        v12 = objc_msgSend(v10, "isEqual:", v11);
      }
      else
      {
        v12 = 0;
      }

      objc_msgSend(v5, "setHighlighted:", v12);
    }
    else
    {
      objc_msgSend(v5, "setHighlighted:", 0);
    }

  }
  else
  {
    objc_msgSend(v5, "setHighlighted:", 0);
  }

}

void __66__WFSlotTemplateView_updateVariableAttachmentAppearanceInContents__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginEditing");

  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEditing");

}

+ (id)paragraphStyleWithAlignment:(int64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BEBB498], "defaultParagraphStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setLineHeightMultiple:", 1.29999995);
  objc_msgSend(v5, "setAlignment:", a3);
  return v5;
}

+ (double)heightForWidth:(double)a3 withContents:(id)a4 horizontalPadding:(double)a5 font:(id)a6 unpopulatedFont:(id)a7 alignment:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  WFSlotTemplateTextStorage *v18;
  WFSlotTemplateLayoutManager *v19;
  void *v20;
  double v21;
  CGFloat v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double height;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v14 = a7;
  v15 = a6;
  v16 = a4;
  objc_msgSend(a1, "paragraphStyleWithAlignment:", a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc_init(WFSlotTemplateTextStorage);
  -[WFSlotTemplateTextStorage setFont:](v18, "setFont:", v15);

  -[WFSlotTemplateTextStorage setUnpopulatedFont:](v18, "setUnpopulatedFont:", v14);
  -[WFSlotTemplateTextStorage setParagraphStyle:](v18, "setParagraphStyle:", v17);
  -[WFSlotTemplateTextStorage setContents:](v18, "setContents:", v16);

  v19 = objc_alloc_init(WFSlotTemplateLayoutManager);
  -[WFSlotTemplateTextStorage addLayoutManager:](v18, "addLayoutManager:", v19);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBB4C0]), "initWithSize:", a3, 1.79769313e308);
  objc_msgSend(v20, "setLineFragmentPadding:", a5);
  -[WFSlotTemplateLayoutManager addTextContainer:](v19, "addTextContainer:", v20);
  -[WFSlotTemplateLayoutManager ensureLayoutForTextContainer:](v19, "ensureLayoutForTextContainer:", v20);
  -[WFSlotTemplateLayoutManager usedRectForTextContainer:](v19, "usedRectForTextContainer:", v20);
  v22 = v21;
  v23 = -[WFSlotTemplateLayoutManager glyphRangeForTextContainer:](v19, "glyphRangeForTextContainer:", v20);
  -[WFSlotTemplateLayoutManager boundingRectForGlyphRange:inTextContainer:](v19, "boundingRectForGlyphRange:inTextContainer:", v23, v24, v20);
  v29.size.height = v26 - v25;
  v29.origin.x = 0.0;
  v29.origin.y = 0.0;
  v32.origin.x = 0.0;
  v32.origin.y = 0.0;
  v29.size.width = v22;
  v32.size.width = a3;
  v32.size.height = 1.79769313e308;
  v30 = CGRectIntersection(v29, v32);
  v31 = CGRectIntegral(v30);
  height = v31.size.height;

  return height;
}

@end
