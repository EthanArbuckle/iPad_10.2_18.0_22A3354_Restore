@implementation RTIDocumentState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__documentRects, 0);
  objc_storeStrong((id *)&self->_insertionPointColor, 0);
  objc_storeStrong((id *)&self->_autocorrectTextBackgroundColor, 0);
  objc_storeStrong((id *)&self->_autocorrectTextColor, 0);
  objc_storeStrong((id *)&self->_autocorrectBubbleStyling, 0);
  objc_storeStrong((id *)&self->_textCheckingAnnotatedString, 0);
  objc_storeStrong((id *)&self->_documentState, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)encodeWithCoder:(id)a3
{
  RTIDocumentRequest *request;
  TIDocumentState *documentState;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableData *documentRects;
  void *v12;
  NSAttributedString *textCheckingAnnotatedString;
  RTITextStyling *autocorrectBubbleStyling;
  RTIColor *autocorrectTextColor;
  RTIColor *autocorrectTextBackgroundColor;
  RTIColor *insertionPointColor;
  id v18;

  v18 = a3;
  if ((objc_msgSend(v18, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  request = self->_request;
  if (request)
    objc_msgSend(v18, "encodeObject:forKey:", request, CFSTR("docReq"));
  documentState = self->_documentState;
  if (documentState)
    objc_msgSend(v18, "encodeObject:forKey:", documentState, CFSTR("docSt"));
  if (self->_hasText)
    objc_msgSend(v18, "encodeBool:forKey:", 1, CFSTR("docHasText"));
  if (!CGRectIsNull(self->_caretRectInWindow))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", self->_caretRectInWindow.origin.x, self->_caretRectInWindow.origin.y, self->_caretRectInWindow.size.width, self->_caretRectInWindow.size.height);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v6, CFSTR("caretRect"));

  }
  if (!CGRectIsNull(self->_firstSelectionRectInWindow))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", self->_firstSelectionRectInWindow.origin.x, self->_firstSelectionRectInWindow.origin.y, self->_firstSelectionRectInWindow.size.width, self->_firstSelectionRectInWindow.size.height);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v7, CFSTR("firstRect"));

  }
  if (!CGRectIsNull(self->_clientFrameInWindow))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", self->_clientFrameInWindow.origin.x, self->_clientFrameInWindow.origin.y, self->_clientFrameInWindow.size.width, self->_clientFrameInWindow.size.height);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v8, CFSTR("clientFrame"));

  }
  if (!CGRectIsNull(self->_firstSelectionRectInEntitySpace))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", self->_firstSelectionRectInEntitySpace.origin.x, self->_firstSelectionRectInEntitySpace.origin.y, self->_firstSelectionRectInEntitySpace.size.width, self->_firstSelectionRectInEntitySpace.size.height);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v9, CFSTR("firstRectEntitySpace"));

  }
  if (!CGRectIsNull(self->_clientFrameInEntitySpace))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", self->_clientFrameInEntitySpace.origin.x, self->_clientFrameInEntitySpace.origin.y, self->_clientFrameInEntitySpace.size.width, self->_clientFrameInEntitySpace.size.height);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v10, CFSTR("clientFrameEntitySpace"));

  }
  if (self->_scrolling)
    objc_msgSend(v18, "encodeBool:forKey:", 1, CFSTR("scrolling"));
  documentRects = self->__documentRects;
  v12 = v18;
  if (documentRects)
  {
    objc_msgSend(v18, "encodeObject:forKey:", documentRects, CFSTR("docRects"));
    v12 = v18;
  }
  textCheckingAnnotatedString = self->_textCheckingAnnotatedString;
  if (textCheckingAnnotatedString)
  {
    objc_msgSend(v18, "encodeObject:forKey:", textCheckingAnnotatedString, CFSTR("textCheckingAnnotatedString"));
    v12 = v18;
  }
  autocorrectBubbleStyling = self->_autocorrectBubbleStyling;
  if (autocorrectBubbleStyling)
  {
    objc_msgSend(v18, "encodeObject:forKey:", autocorrectBubbleStyling, CFSTR("acBubbleStyling"));
    v12 = v18;
  }
  autocorrectTextColor = self->_autocorrectTextColor;
  if (autocorrectTextColor)
  {
    objc_msgSend(v18, "encodeObject:forKey:", autocorrectTextColor, CFSTR("acTextColor"));
    v12 = v18;
  }
  autocorrectTextBackgroundColor = self->_autocorrectTextBackgroundColor;
  if (autocorrectTextBackgroundColor)
  {
    objc_msgSend(v18, "encodeObject:forKey:", autocorrectTextBackgroundColor, CFSTR("acTextBGColor"));
    v12 = v18;
  }
  insertionPointColor = self->_insertionPointColor;
  if (insertionPointColor)
  {
    objc_msgSend(v18, "encodeObject:forKey:", insertionPointColor, CFSTR("insertionPointColor"));
    v12 = v18;
  }
  objc_msgSend(v12, "encodeBool:forKey:", self->_originatedFromSource, CFSTR("originatedFromSource"));
  if (self->_canSuggestSupplementalItemsForCurrentSelection)
    objc_msgSend(v18, "encodeBool:forKey:", 1, CFSTR("supplementalLexiconForSelection"));

}

- (RTIDocumentState)initWithCoder:(id)a3
{
  id v4;
  RTIDocumentState *v5;
  uint64_t v6;
  RTIDocumentRequest *request;
  uint64_t v8;
  TIDocumentState *documentState;
  void *v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGSize v16;
  void *v17;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGSize v23;
  void *v24;
  void *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGSize v30;
  void *v31;
  void *v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGSize v37;
  void *v38;
  void *v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGSize v44;
  void *v45;
  uint64_t v46;
  NSMutableData *documentRects;
  uint64_t v48;
  NSAttributedString *textCheckingAnnotatedString;
  uint64_t v50;
  RTITextStyling *autocorrectBubbleStyling;
  uint64_t v52;
  RTIColor *autocorrectTextColor;
  uint64_t v54;
  RTIColor *autocorrectTextBackgroundColor;
  char v56;
  uint64_t v57;
  RTIColor *insertionPointColor;
  objc_super v60;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The decoder must allow keyed coding."));
  v60.receiver = self;
  v60.super_class = (Class)RTIDocumentState;
  v5 = -[RTIDocumentState init](&v60, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("docReq"));
    v6 = objc_claimAutoreleasedReturnValue();
    request = v5->_request;
    v5->_request = (RTIDocumentRequest *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("docSt"));
    v8 = objc_claimAutoreleasedReturnValue();
    documentState = v5->_documentState;
    v5->_documentState = (TIDocumentState *)v8;

    v5->_hasText = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("docHasText"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("caretRect"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "rectValue");
      v5->_caretRectInWindow.origin.x = v12;
      v5->_caretRectInWindow.origin.y = v13;
      v5->_caretRectInWindow.size.width = v14;
      v5->_caretRectInWindow.size.height = v15;
    }
    else
    {
      v16 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      v5->_caretRectInWindow.origin = (CGPoint)*MEMORY[0x1E0C9D628];
      v5->_caretRectInWindow.size = v16;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstRect"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "rectValue");
      v5->_firstSelectionRectInWindow.origin.x = v19;
      v5->_firstSelectionRectInWindow.origin.y = v20;
      v5->_firstSelectionRectInWindow.size.width = v21;
      v5->_firstSelectionRectInWindow.size.height = v22;
    }
    else
    {
      v23 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      v5->_firstSelectionRectInWindow.origin = (CGPoint)*MEMORY[0x1E0C9D628];
      v5->_firstSelectionRectInWindow.size = v23;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientFrame"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      objc_msgSend(v24, "rectValue");
      v5->_clientFrameInWindow.origin.x = v26;
      v5->_clientFrameInWindow.origin.y = v27;
      v5->_clientFrameInWindow.size.width = v28;
      v5->_clientFrameInWindow.size.height = v29;
    }
    else
    {
      v30 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      v5->_clientFrameInWindow.origin = (CGPoint)*MEMORY[0x1E0C9D628];
      v5->_clientFrameInWindow.size = v30;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstRectEntitySpace"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
    {
      objc_msgSend(v31, "rectValue");
      v5->_firstSelectionRectInEntitySpace.origin.x = v33;
      v5->_firstSelectionRectInEntitySpace.origin.y = v34;
      v5->_firstSelectionRectInEntitySpace.size.width = v35;
      v5->_firstSelectionRectInEntitySpace.size.height = v36;
    }
    else
    {
      v37 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      v5->_firstSelectionRectInEntitySpace.origin = (CGPoint)*MEMORY[0x1E0C9D628];
      v5->_firstSelectionRectInEntitySpace.size = v37;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientFrameEntitySpace"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v38)
    {
      objc_msgSend(v38, "rectValue");
      v5->_clientFrameInEntitySpace.origin.x = v40;
      v5->_clientFrameInEntitySpace.origin.y = v41;
      v5->_clientFrameInEntitySpace.size.width = v42;
      v5->_clientFrameInEntitySpace.size.height = v43;
    }
    else
    {
      v44 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      v5->_clientFrameInEntitySpace.origin = (CGPoint)*MEMORY[0x1E0C9D628];
      v5->_clientFrameInEntitySpace.size = v44;
    }
    v5->_scrolling = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("scrolling"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("docRects"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "mutableCopy");
    documentRects = v5->__documentRects;
    v5->__documentRects = (NSMutableData *)v46;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textCheckingAnnotatedString"));
    v48 = objc_claimAutoreleasedReturnValue();
    textCheckingAnnotatedString = v5->_textCheckingAnnotatedString;
    v5->_textCheckingAnnotatedString = (NSAttributedString *)v48;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("acBubbleStyling"));
    v50 = objc_claimAutoreleasedReturnValue();
    autocorrectBubbleStyling = v5->_autocorrectBubbleStyling;
    v5->_autocorrectBubbleStyling = (RTITextStyling *)v50;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("acTextColor"));
    v52 = objc_claimAutoreleasedReturnValue();
    autocorrectTextColor = v5->_autocorrectTextColor;
    v5->_autocorrectTextColor = (RTIColor *)v52;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("acTextBGColor"));
    v54 = objc_claimAutoreleasedReturnValue();
    autocorrectTextBackgroundColor = v5->_autocorrectTextBackgroundColor;
    v5->_autocorrectTextBackgroundColor = (RTIColor *)v54;

    v5->_originatedFromSource = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("originatedFromSource"));
    v56 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supplementalLexiconForSelection"));
    v5->_canSuggestSupplementalItemsForCurrentSelection = v56;
    v5->_clearCanSuggestOnNextDocumentState = v56;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("insertionPointColor"));
    v57 = objc_claimAutoreleasedReturnValue();
    insertionPointColor = v5->_insertionPointColor;
    v5->_insertionPointColor = (RTIColor *)v57;

  }
  return v5;
}

- (void)setCanSuggestSupplementalItemsForCurrentSelection:(BOOL)a3
{
  self->_canSuggestSupplementalItemsForCurrentSelection = a3;
}

- (TIDocumentState)documentState
{
  return self->_documentState;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setScrolling:(BOOL)a3
{
  self->_scrolling = a3;
}

- (void)setHasText:(BOOL)a3
{
  self->_hasText = a3;
}

- (void)addTextRect:(CGRect)a3 forCharacterRange:(_NSRange)a4 granularity:(int64_t)a5 isVertical:(BOOL)a6
{
  int v7;
  unsigned int length;
  unsigned int location;
  double height;
  double width;
  double y;
  double x;
  void *v15;
  void *v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;

  v7 = a5;
  length = a4.length;
  location = a4.location;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[RTIDocumentState _documentRects](self, "_documentRects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 640);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTIDocumentState set_documentRects:](self, "set_documentRects:", v16);

  }
  *(float *)&v17 = x;
  *(float *)&v18 = y;
  v23 = __PAIR64__(v18, v17);
  *(float *)&v19 = width;
  *(float *)&v20 = height;
  LODWORD(v24) = v7;
  HIDWORD(v24) = a6;
  -[RTIDocumentState _documentRects](self, "_documentRects", __PAIR64__(length, location), v23, __PAIR64__(v20, v19), v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "appendBytes:length:", &v22, 32);

}

- (NSMutableData)_documentRects
{
  return self->__documentRects;
}

- (void)set_documentRects:(id)a3
{
  objc_storeStrong((id *)&self->__documentRects, a3);
}

- (void)setInsertionPointColor:(id)a3
{
  objc_storeStrong((id *)&self->_insertionPointColor, a3);
}

- (void)setFirstSelectionRectInWindow:(CGRect)a3
{
  self->_firstSelectionRectInWindow = a3;
}

- (void)setClientFrameInWindow:(CGRect)a3
{
  self->_clientFrameInWindow = a3;
}

- (void)setClientFrameInEntitySpace:(CGRect)a3
{
  self->_clientFrameInEntitySpace = a3;
}

- (void)setCaretRectInWindow:(CGRect)a3
{
  self->_caretRectInWindow = a3;
}

- (void)setAutocorrectTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_autocorrectTextColor, a3);
}

- (void)setAutocorrectTextBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_autocorrectTextBackgroundColor, a3);
}

- (void)setAutocorrectBubbleStyling:(id)a3
{
  objc_storeStrong((id *)&self->_autocorrectBubbleStyling, a3);
}

- (void)setDocumentState:(id)a3
{
  objc_storeStrong((id *)&self->_documentState, a3);
  if (self->_clearCanSuggestOnNextDocumentState)
  {
    self->_canSuggestSupplementalItemsForCurrentSelection = 0;
    self->_clearCanSuggestOnNextDocumentState = 0;
  }
}

+ (RTIDocumentState)documentStateWithRequest:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = (void *)v5[2];
  v5[2] = v4;

  return (RTIDocumentState *)v5;
}

- (RTIDocumentState)init
{
  RTIDocumentState *v2;
  RTIDocumentState *v3;
  RTIDocumentRequest *request;
  TIDocumentState *documentState;
  CGPoint v6;
  CGSize v7;
  NSMutableData *documentRects;
  NSAttributedString *textCheckingAnnotatedString;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RTIDocumentState;
  v2 = -[RTIDocumentState init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    request = v2->_request;
    v2->_request = 0;

    documentState = v3->_documentState;
    v3->_documentState = 0;

    v6 = (CGPoint)*MEMORY[0x1E0C9D628];
    v7 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v3->_caretRectInWindow.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v3->_caretRectInWindow.size = v7;
    v3->_firstSelectionRectInWindow.origin = v6;
    v3->_firstSelectionRectInWindow.size = v7;
    v3->_clientFrameInWindow.origin = v6;
    v3->_clientFrameInWindow.size = v7;
    v3->_firstSelectionRectInEntitySpace.origin = v6;
    v3->_firstSelectionRectInEntitySpace.size = v7;
    v3->_clientFrameInEntitySpace.origin = v6;
    v3->_clientFrameInEntitySpace.size = v7;
    documentRects = v3->__documentRects;
    v3->__documentRects = 0;

    textCheckingAnnotatedString = v3->_textCheckingAnnotatedString;
    v3->_textCheckingAnnotatedString = 0;

    v3->_originatedFromSource = 0;
  }
  return v3;
}

- (void)setTextCheckingAnnotatedString:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *textCheckingAnnotatedString;

  +[RTIUtilities _attributedStringWithoutDefaultAttributes:](RTIUtilities, "_attributedStringWithoutDefaultAttributes:", a3);
  v4 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
  textCheckingAnnotatedString = self->_textCheckingAnnotatedString;
  self->_textCheckingAnnotatedString = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  RTIDocumentState *v5;
  RTIDocumentRequest *request;
  uint64_t v7;
  RTIDocumentRequest *v8;
  TIDocumentState *documentState;
  uint64_t v10;
  TIDocumentState *v11;
  NSMutableData *documentRects;
  uint64_t v13;
  NSMutableData *v14;
  NSAttributedString *textCheckingAnnotatedString;
  uint64_t v16;
  NSAttributedString *v17;
  RTITextStyling *autocorrectBubbleStyling;
  uint64_t v19;
  RTITextStyling *v20;
  RTIColor *autocorrectTextColor;
  uint64_t v22;
  RTIColor *v23;
  RTIColor *autocorrectTextBackgroundColor;
  uint64_t v25;
  RTIColor *v26;
  RTIColor *insertionPointColor;
  uint64_t v28;
  RTIColor *v29;
  CGSize size;
  CGSize v31;
  CGSize v32;
  CGSize v33;
  CGSize v34;

  v5 = objc_alloc_init(RTIDocumentState);
  if (v5)
  {
    request = self->_request;
    if (request)
    {
      v7 = -[RTIDocumentRequest copy](request, "copy");
      v8 = v5->_request;
      v5->_request = (RTIDocumentRequest *)v7;

    }
    documentState = self->_documentState;
    if (documentState)
    {
      v10 = -[TIDocumentState copyWithZone:](documentState, "copyWithZone:", a3);
      v11 = v5->_documentState;
      v5->_documentState = (TIDocumentState *)v10;

    }
    if (self->_hasText)
      v5->_hasText = 1;
    documentRects = self->__documentRects;
    if (documentRects)
    {
      v13 = -[NSMutableData copy](documentRects, "copy");
      v14 = v5->__documentRects;
      v5->__documentRects = (NSMutableData *)v13;

    }
    textCheckingAnnotatedString = self->_textCheckingAnnotatedString;
    if (textCheckingAnnotatedString)
    {
      v16 = -[NSAttributedString copy](textCheckingAnnotatedString, "copy");
      v17 = v5->_textCheckingAnnotatedString;
      v5->_textCheckingAnnotatedString = (NSAttributedString *)v16;

    }
    autocorrectBubbleStyling = self->_autocorrectBubbleStyling;
    if (autocorrectBubbleStyling)
    {
      v19 = -[RTITextStyling copy](autocorrectBubbleStyling, "copy");
      v20 = v5->_autocorrectBubbleStyling;
      v5->_autocorrectBubbleStyling = (RTITextStyling *)v19;

    }
    autocorrectTextColor = self->_autocorrectTextColor;
    if (autocorrectTextColor)
    {
      v22 = -[RTIColor copy](autocorrectTextColor, "copy");
      v23 = v5->_autocorrectTextColor;
      v5->_autocorrectTextColor = (RTIColor *)v22;

    }
    autocorrectTextBackgroundColor = self->_autocorrectTextBackgroundColor;
    if (autocorrectTextBackgroundColor)
    {
      v25 = -[RTIColor copy](autocorrectTextBackgroundColor, "copy");
      v26 = v5->_autocorrectTextBackgroundColor;
      v5->_autocorrectTextBackgroundColor = (RTIColor *)v25;

    }
    insertionPointColor = self->_insertionPointColor;
    if (insertionPointColor)
    {
      v28 = -[RTIColor copy](insertionPointColor, "copy");
      v29 = v5->_insertionPointColor;
      v5->_insertionPointColor = (RTIColor *)v28;

    }
    size = self->_caretRectInWindow.size;
    v5->_caretRectInWindow.origin = self->_caretRectInWindow.origin;
    v5->_caretRectInWindow.size = size;
    v31 = self->_firstSelectionRectInWindow.size;
    v5->_firstSelectionRectInWindow.origin = self->_firstSelectionRectInWindow.origin;
    v5->_firstSelectionRectInWindow.size = v31;
    v32 = self->_clientFrameInWindow.size;
    v5->_clientFrameInWindow.origin = self->_clientFrameInWindow.origin;
    v5->_clientFrameInWindow.size = v32;
    v33 = self->_firstSelectionRectInEntitySpace.size;
    v5->_firstSelectionRectInEntitySpace.origin = self->_firstSelectionRectInEntitySpace.origin;
    v5->_firstSelectionRectInEntitySpace.size = v33;
    v34 = self->_clientFrameInEntitySpace.size;
    v5->_clientFrameInEntitySpace.origin = self->_clientFrameInEntitySpace.origin;
    v5->_clientFrameInEntitySpace.size = v34;
    v5->_scrolling = self->_scrolling;
    v5->_originatedFromSource = self->_originatedFromSource;
    v5->_canSuggestSupplementalItemsForCurrentSelection = self->_canSuggestSupplementalItemsForCurrentSelection;
  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableData *documentRects;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RTIDocumentState;
  -[RTIDocumentState description](&v12, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_request)
    objc_msgSend(v4, "appendFormat:", CFSTR("; request = %@"), self->_request);
  if (self->_documentState)
    objc_msgSend(v4, "appendFormat:", CFSTR("; documentState = %@"), self->_documentState);
  if (self->_hasText)
    objc_msgSend(v4, "appendFormat:", CFSTR("; hasText = YES"));
  if (!CGRectIsNull(self->_caretRectInWindow))
  {
    _RTI_NSStringFromCGRect(self->_caretRectInWindow.origin.x, self->_caretRectInWindow.origin.y, self->_caretRectInWindow.size.width, self->_caretRectInWindow.size.height);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("; caretRectInWindow = %@"), v5);

  }
  if (!CGRectIsNull(self->_firstSelectionRectInWindow))
  {
    _RTI_NSStringFromCGRect(self->_firstSelectionRectInWindow.origin.x, self->_firstSelectionRectInWindow.origin.y, self->_firstSelectionRectInWindow.size.width, self->_firstSelectionRectInWindow.size.height);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("; firstSelectionRectInWindow = %@"), v6);

  }
  if (!CGRectIsNull(self->_clientFrameInWindow))
  {
    _RTI_NSStringFromCGRect(self->_clientFrameInWindow.origin.x, self->_clientFrameInWindow.origin.y, self->_clientFrameInWindow.size.width, self->_clientFrameInWindow.size.height);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("; clientFrameInWindow = %@"), v7);

  }
  if (!CGRectIsNull(self->_firstSelectionRectInEntitySpace))
  {
    _RTI_NSStringFromCGRect(self->_firstSelectionRectInEntitySpace.origin.x, self->_firstSelectionRectInEntitySpace.origin.y, self->_firstSelectionRectInEntitySpace.size.width, self->_firstSelectionRectInEntitySpace.size.height);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("; firstSelectionRectInEntitySpace = %@"), v8);

  }
  if (!CGRectIsNull(self->_clientFrameInEntitySpace))
  {
    _RTI_NSStringFromCGRect(self->_clientFrameInEntitySpace.origin.x, self->_clientFrameInEntitySpace.origin.y, self->_clientFrameInEntitySpace.size.width, self->_clientFrameInEntitySpace.size.height);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("; clientFrameInEntitySpace = %@"), v9);

  }
  if (self->_scrolling)
    objc_msgSend(v4, "appendFormat:", CFSTR("; scrolling"));
  documentRects = self->__documentRects;
  if (documentRects)
    objc_msgSend(v4, "appendFormat:", CFSTR("; documentRects = %lu rects"),
      -[NSMutableData length](documentRects, "length") >> 5);
  if (self->_textCheckingAnnotatedString)
    objc_msgSend(v4, "appendFormat:", CFSTR("; textCheckingAnnotatedString = %p"), self->_textCheckingAnnotatedString);
  if (self->_autocorrectBubbleStyling)
    objc_msgSend(v4, "appendFormat:", CFSTR("; autocorrectBubbleStyling = %@"), self->_autocorrectBubbleStyling);
  if (self->_autocorrectTextColor)
    objc_msgSend(v4, "appendFormat:", CFSTR("; autocorrectTextColor = %@"), self->_autocorrectTextColor);
  if (self->_autocorrectTextBackgroundColor)
    objc_msgSend(v4, "appendFormat:", CFSTR("; autocorrectTextBackgroundColor = %@"),
      self->_autocorrectTextBackgroundColor);
  if (self->_originatedFromSource)
    objc_msgSend(v4, "appendString:", CFSTR("; originatedFromSource = YES"));
  if (self->_canSuggestSupplementalItemsForCurrentSelection)
    objc_msgSend(v4, "appendString:", CFSTR("; canSuggestSupplementalItemsForCurrentSelection = YES"));
  if (self->_insertionPointColor)
    objc_msgSend(v4, "appendFormat:", CFSTR("; insertionPointColor = %@"), self->_insertionPointColor);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RTIDocumentState *v4;
  RTIDocumentState *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  _BOOL4 v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  _BOOL4 v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  int v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  int v98;
  _BOOL4 v99;
  _BOOL4 v100;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;

  v4 = (RTIDocumentState *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[RTIDocumentState request](self, "request");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTIDocumentState request](v5, "request");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[RTIDocumentState request](self, "request");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIDocumentState request](v5, "request");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (!v11)
          goto LABEL_41;
      }
      -[RTIDocumentState documentState](self, "documentState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTIDocumentState documentState](v5, "documentState");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v13 == (void *)v14)
      {

      }
      else
      {
        v15 = (void *)v14;
        -[RTIDocumentState documentState](self, "documentState");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIDocumentState documentState](v5, "documentState");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqual:", v17);

        if (!v18)
          goto LABEL_41;
      }
      v19 = -[RTIDocumentState hasText](self, "hasText");
      if (v19 != -[RTIDocumentState hasText](v5, "hasText"))
        goto LABEL_41;
      -[RTIDocumentState caretRectInWindow](self, "caretRectInWindow");
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;
      -[RTIDocumentState caretRectInWindow](v5, "caretRectInWindow");
      v110.origin.x = v28;
      v110.origin.y = v29;
      v110.size.width = v30;
      v110.size.height = v31;
      v106.origin.x = v21;
      v106.origin.y = v23;
      v106.size.width = v25;
      v106.size.height = v27;
      if (!CGRectEqualToRect(v106, v110))
        goto LABEL_41;
      -[RTIDocumentState firstSelectionRectInWindow](self, "firstSelectionRectInWindow");
      v33 = v32;
      v35 = v34;
      v37 = v36;
      v39 = v38;
      -[RTIDocumentState firstSelectionRectInWindow](v5, "firstSelectionRectInWindow");
      v111.origin.x = v40;
      v111.origin.y = v41;
      v111.size.width = v42;
      v111.size.height = v43;
      v107.origin.x = v33;
      v107.origin.y = v35;
      v107.size.width = v37;
      v107.size.height = v39;
      if (!CGRectEqualToRect(v107, v111))
        goto LABEL_41;
      -[RTIDocumentState clientFrameInWindow](self, "clientFrameInWindow");
      v45 = v44;
      v47 = v46;
      v49 = v48;
      v51 = v50;
      -[RTIDocumentState clientFrameInWindow](v5, "clientFrameInWindow");
      v112.origin.x = v52;
      v112.origin.y = v53;
      v112.size.width = v54;
      v112.size.height = v55;
      v108.origin.x = v45;
      v108.origin.y = v47;
      v108.size.width = v49;
      v108.size.height = v51;
      if (!CGRectEqualToRect(v108, v112))
        goto LABEL_41;
      -[RTIDocumentState clientFrameInEntitySpace](self, "clientFrameInEntitySpace");
      v57 = v56;
      v59 = v58;
      v61 = v60;
      v63 = v62;
      -[RTIDocumentState clientFrameInEntitySpace](v5, "clientFrameInEntitySpace");
      v113.origin.x = v64;
      v113.origin.y = v65;
      v113.size.width = v66;
      v113.size.height = v67;
      v109.origin.x = v57;
      v109.origin.y = v59;
      v109.size.width = v61;
      v109.size.height = v63;
      if (!CGRectEqualToRect(v109, v113))
        goto LABEL_41;
      v68 = -[RTIDocumentState scrolling](self, "scrolling");
      if (v68 != -[RTIDocumentState scrolling](v5, "scrolling"))
        goto LABEL_41;
      -[RTIDocumentState _documentRects](self, "_documentRects");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTIDocumentState _documentRects](v5, "_documentRects");
      v70 = objc_claimAutoreleasedReturnValue();
      if (v69 == (void *)v70)
      {

      }
      else
      {
        v71 = (void *)v70;
        -[RTIDocumentState _documentRects](self, "_documentRects");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIDocumentState _documentRects](v5, "_documentRects");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend(v72, "isEqual:", v73);

        if (!v74)
          goto LABEL_41;
      }
      -[RTIDocumentState textCheckingAnnotatedString](self, "textCheckingAnnotatedString");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTIDocumentState textCheckingAnnotatedString](v5, "textCheckingAnnotatedString");
      v76 = objc_claimAutoreleasedReturnValue();
      if (v75 == (void *)v76)
      {

      }
      else
      {
        v77 = (void *)v76;
        -[RTIDocumentState textCheckingAnnotatedString](self, "textCheckingAnnotatedString");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIDocumentState textCheckingAnnotatedString](v5, "textCheckingAnnotatedString");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v78, "isEqual:", v79);

        if (!v80)
          goto LABEL_41;
      }
      -[RTIDocumentState autocorrectBubbleStyling](self, "autocorrectBubbleStyling");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTIDocumentState autocorrectBubbleStyling](v5, "autocorrectBubbleStyling");
      v82 = objc_claimAutoreleasedReturnValue();
      if (v81 == (void *)v82)
      {

      }
      else
      {
        v83 = (void *)v82;
        -[RTIDocumentState autocorrectBubbleStyling](self, "autocorrectBubbleStyling");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIDocumentState autocorrectBubbleStyling](v5, "autocorrectBubbleStyling");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = objc_msgSend(v84, "isEqual:", v85);

        if (!v86)
          goto LABEL_41;
      }
      -[RTIDocumentState autocorrectTextColor](self, "autocorrectTextColor");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTIDocumentState autocorrectTextColor](v5, "autocorrectTextColor");
      v88 = objc_claimAutoreleasedReturnValue();
      if (v87 == (void *)v88)
      {

      }
      else
      {
        v89 = (void *)v88;
        -[RTIDocumentState autocorrectTextColor](self, "autocorrectTextColor");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIDocumentState autocorrectTextColor](v5, "autocorrectTextColor");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = objc_msgSend(v90, "isEqual:", v91);

        if (!v92)
          goto LABEL_41;
      }
      -[RTIDocumentState autocorrectTextBackgroundColor](self, "autocorrectTextBackgroundColor");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTIDocumentState autocorrectTextBackgroundColor](v5, "autocorrectTextBackgroundColor");
      v94 = objc_claimAutoreleasedReturnValue();
      if (v93 == (void *)v94)
      {

      }
      else
      {
        v95 = (void *)v94;
        -[RTIDocumentState autocorrectTextBackgroundColor](self, "autocorrectTextBackgroundColor");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIDocumentState autocorrectTextBackgroundColor](v5, "autocorrectTextBackgroundColor");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = objc_msgSend(v96, "isEqual:", v97);

        if (!v98)
          goto LABEL_41;
      }
      v99 = -[RTIDocumentState originatedFromSource](self, "originatedFromSource");
      if (v99 == -[RTIDocumentState originatedFromSource](v5, "originatedFromSource"))
      {
        v100 = -[RTIDocumentState canSuggestSupplementalItemsForCurrentSelection](self, "canSuggestSupplementalItemsForCurrentSelection");
        if (v100 == -[RTIDocumentState canSuggestSupplementalItemsForCurrentSelection](v5, "canSuggestSupplementalItemsForCurrentSelection"))
        {
          -[RTIDocumentState insertionPointColor](self, "insertionPointColor");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTIDocumentState insertionPointColor](v5, "insertionPointColor");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          if (v102 == v103)
          {
            v12 = 1;
          }
          else
          {
            -[RTIDocumentState insertionPointColor](self, "insertionPointColor");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTIDocumentState insertionPointColor](v5, "insertionPointColor");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v104, "isEqual:", v105);

          }
          goto LABEL_42;
        }
      }
LABEL_41:
      v12 = 0;
LABEL_42:

      goto LABEL_43;
    }
    v12 = 0;
  }
LABEL_43:

  return v12;
}

- (_NSRange)selectionRangeForDocumentStateRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSUInteger v11;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  _NSRange result;

  length = a3.length;
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    location = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    location = a3.location;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = -[TIDocumentState truncatedRangeInSelectedText](self->_documentState, "truncatedRangeInSelectedText");
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = v6;
        v9 = v7;
        -[TIDocumentState contextBeforeInput](self->_documentState, "contextBeforeInput");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "length") + v8;

        if (v11 < location || v11 - location >= length)
        {
          if (v11 < location)
            v13 = v9;
          else
            v13 = 0;
          location += v13;
        }
        else
        {
          length += v9;
        }
      }
    }
  }
  v14 = location;
  v15 = length;
  result.length = v15;
  result.location = v14;
  return result;
}

- (_NSRange)selectedTextRange
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  -[TIDocumentState contextBeforeInput](self->_documentState, "contextBeforeInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  -[TIDocumentState selectedText](self->_documentState, "selectedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  v7 = v4;
  v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

- (void)setSelectedTextRange:(_NSRange)a3
{
  TIDocumentState *documentState;
  TIDocumentState *v5;
  TIDocumentState *v6;
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  id v21;
  NSUInteger v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;

  documentState = self->_documentState;
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[TIDocumentState documentStateAfterCollapsingSelection](documentState, "documentStateAfterCollapsingSelection", 0x7FFFFFFFFFFFFFFFLL, a3.length);
    v5 = (TIDocumentState *)objc_claimAutoreleasedReturnValue();
    v6 = self->_documentState;
    self->_documentState = v5;
  }
  else
  {
    length = a3.length;
    location = a3.location;
    -[TIDocumentState contextBeforeInput](documentState, "contextBeforeInput");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (__CFString *)v9;
    else
      v11 = &stru_1E35C3B60;
    v26 = v11;

    -[TIDocumentState selectedText](self->_documentState, "selectedText");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (__CFString *)v12;
    else
      v14 = &stru_1E35C3B60;
    v15 = v14;

    -[TIDocumentState contextAfterInput](self->_documentState, "contextAfterInput");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = (__CFString *)v16;
    else
      v18 = &stru_1E35C3B60;
    v19 = v18;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v26, v15, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (location >= objc_msgSend(v20, "length"))
    {
      v21 = v20;
      v24 = 0;
      v23 = 0;
    }
    else
    {
      objc_msgSend(v20, "substringToIndex:", location);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v22 = location + length;
      if (location + length <= objc_msgSend(v20, "length"))
      {
        if (length)
        {
          objc_msgSend(v20, "substringWithRange:", location, length);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = 0;
        }
        objc_msgSend(v20, "substringFromIndex:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v20, "substringFromIndex:", location);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0;
      }
    }
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDB78]), "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v21, 0, v23, v24, 0x7FFFFFFFFFFFFFFFLL, 0);
    -[RTIDocumentState setDocumentState:](self, "setDocumentState:", v25);

    v6 = (TIDocumentState *)v26;
  }

}

- (_NSRange)markedTextRange
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  -[TIDocumentState markedText](self->_documentState, "markedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TIDocumentState contextBeforeInput](self->_documentState, "contextBeforeInput");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    -[TIDocumentState markedText](self->_documentState, "markedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

  }
  else
  {
    v7 = 0;
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (_NSRange)deltaForSelectionRange:(_NSRange)a3
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger length;
  uint64_t v6;
  _NSRange result;

  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
    v4 = 0;
  }
  else
  {
    length = a3.length;
    v4 = a3.location - -[RTIDocumentState selectedTextRange](self, "selectedTextRange");
    v3 = length - v6;
  }
  result.length = v3;
  result.location = v4;
  return result;
}

- (RTIRange)deltaRangeForSelection:(_NSRange)a3
{
  int64_t v3;
  int64_t v4;
  NSUInteger length;
  uint64_t v6;
  RTIRange result;

  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
    v4 = 0;
  }
  else
  {
    length = a3.length;
    v4 = a3.location - -[RTIDocumentState selectedTextRange](self, "selectedTextRange");
    v3 = length - v6;
  }
  result.var1 = v3;
  result.var0 = v4;
  return result;
}

- (void)resetTextRects
{
  -[RTIDocumentState set_documentRects:](self, "set_documentRects:", 0);
}

- (void)addTextRect:(CGRect)a3 forCharacterRange:(_NSRange)a4
{
  -[RTIDocumentState addTextRect:forCharacterRange:granularity:isVertical:](self, "addTextRect:forCharacterRange:granularity:isVertical:", a4.location, a4.length, -1, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)addTextRect:(CGRect)a3 forCharacterRange:(_NSRange)a4 granularity:(int64_t)a5
{
  -[RTIDocumentState addTextRect:forCharacterRange:granularity:isVertical:](self, "addTextRect:forCharacterRange:granularity:isVertical:", a4.location, a4.length, a5, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_enumerateDocumentRectsWithOptions:(unint64_t)a3 block:(id)a4
{
  char v4;
  _QWORD *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  __int128 *v11;
  unint64_t v12;
  __int128 v13;
  __int128 v14;
  void (*v15)(_QWORD *, __int128 *, char *);
  BOOL v16;
  unint64_t v17;
  __int128 *v18;
  __int128 v19;
  void (*v20)(_QWORD *, __int128 *, char *);
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;

  v4 = a3;
  v6 = a4;
  if (v6)
  {
    -[RTIDocumentState _documentRects](self, "_documentRects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[RTIDocumentState _documentRects](self, "_documentRects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (unint64_t)(double)((unint64_t)objc_msgSend(v8, "length") >> 5);

      -[RTIDocumentState _documentRects](self, "_documentRects");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = (__int128 *)objc_msgSend(v10, "bytes");

      v26 = 0;
      if ((v4 & 2) != 0)
      {
        v17 = v9 - 1;
        if ((uint64_t)(v9 - 1) >= 0)
        {
          v18 = &v11[2 * v9 - 2];
          do
          {
            v19 = v18[1];
            v24 = *v18;
            v25 = v19;
            v20 = (void (*)(_QWORD *, __int128 *, char *))v6[2];
            v22 = v24;
            v23 = v19;
            v20(v6, &v22, &v26);
            v16 = v17-- != 0;
            v21 = v16;
            if (v26)
              break;
            v18 -= 2;
          }
          while ((v21 & 1) != 0);
        }
      }
      else if (v9)
      {
        v12 = 1;
        do
        {
          v13 = *v11;
          v14 = v11[1];
          v11 += 2;
          v24 = v13;
          v25 = v14;
          v15 = (void (*)(_QWORD *, __int128 *, char *))v6[2];
          v22 = v13;
          v23 = v14;
          v15(v6, &v22, &v26);
          if (v26)
            v16 = 1;
          else
            v16 = v12 >= v9;
          ++v12;
        }
        while (!v16);
      }
    }
  }

}

- (CGRect)firstRectForCharacterRange:(_NSRange)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[RTIDocumentState firstRectForCharacterRange:withGranularity:isVerticalOut:](self, "firstRectForCharacterRange:withGranularity:isVerticalOut:", a3.location, a3.length, -1, 0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)firstRectForCharacterRange:(_NSRange)a3 actualRange:(_NSRange *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[RTIDocumentState firstRectForCharacterRange:withGranularity:isVerticalOut:actualRange:](self, "firstRectForCharacterRange:withGranularity:isVerticalOut:actualRange:", a3.location, a3.length, -1, 0, a4);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)firstRectForCharacterRange:(_NSRange)a3 withGranularity:(int64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[RTIDocumentState firstRectForCharacterRange:withGranularity:isVerticalOut:](self, "firstRectForCharacterRange:withGranularity:isVerticalOut:", a3.location, a3.length, a4, 0);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)firstRectForCharacterRange:(_NSRange)a3 withGranularity:(int64_t)a4 isVerticalOut:(BOOL *)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[RTIDocumentState firstRectForCharacterRange:withGranularity:isVerticalOut:actualRange:](self, "firstRectForCharacterRange:withGranularity:isVerticalOut:actualRange:", a3.location, a3.length, a4, a5, 0);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)firstRectForCharacterRange:(_NSRange)a3 withGranularity:(int64_t)a4 isVerticalOut:(BOOL *)a5 actualRange:(_NSRange *)a6
{
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  float *v17;
  __int128 v18;
  uint64_t v19;
  _NSRange v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  _QWORD v29[7];
  _NSRange v30;
  uint64_t v31;
  float *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  CGRect v47;
  CGRect v48;
  CGRect result;

  v41 = 0;
  v42 = &v41;
  v43 = 0x4010000000;
  v44 = &unk_1991CBFA5;
  v45 = 0u;
  v46 = 0u;
  *(float *)&v8 = *MEMORY[0x1E0C9D628];
  *(float *)&v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  *((_QWORD *)&v45 + 1) = __PAIR64__(v9, v8);
  *(float *)&v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  *(float *)&v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  *(_QWORD *)&v46 = __PAIR64__(v11, v10);
  BYTE12(v46) = 0;
  v31 = 0;
  v32 = (float *)&v31;
  v33 = 0x4010000000;
  v34 = &unk_1991CBFA5;
  v35 = 0;
  v40 = 0;
  v36 = v8;
  v37 = v9;
  v38 = v10;
  v39 = v11;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __89__RTIDocumentState_firstRectForCharacterRange_withGranularity_isVerticalOut_actualRange___block_invoke;
  v29[3] = &unk_1E35C2968;
  v29[6] = a4;
  v30 = a3;
  v29[4] = &v41;
  v29[5] = &v31;
  -[RTIDocumentState _enumerateDocumentRectsWithOptions:block:](self, "_enumerateDocumentRectsWithOptions:block:", 0, v29);
  v12 = v32[10];
  v13 = v32[11];
  v14 = v32[12];
  v15 = v32[13];
  v47.origin.x = v12;
  v47.origin.y = v13;
  v47.size.width = v14;
  v47.size.height = v15;
  if (CGRectIsInfinite(v47)
    || (v48.origin.x = v12, v48.origin.y = v13, v48.size.width = v14, v48.size.height = v15, CGRectIsEmpty(v48)))
  {
    RTILogFacility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[RTIDocumentState firstRectForCharacterRange:withGranularity:isVerticalOut:actualRange:].cold.1(v16);

    v17 = v32;
    v18 = *((_OWORD *)v42 + 3);
    *((_OWORD *)v32 + 2) = *((_OWORD *)v42 + 2);
    *((_OWORD *)v17 + 3) = v18;
    if (a5)
      goto LABEL_6;
  }
  else
  {
    v17 = v32;
    if (a5)
LABEL_6:
      *a5 = *((_BYTE *)v17 + 60);
  }
  if (a6)
  {
    v19 = *((_QWORD *)v17 + 4);
    v20.location = v19;
    v20.length = HIDWORD(v19);
    *a6 = v20;
  }
  v21 = v17[10];
  v22 = v17[11];
  v23 = v17[12];
  v24 = v17[13];
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v41, 8);
  v25 = v21;
  v26 = v22;
  v27 = v23;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

__n128 __89__RTIDocumentState_firstRectForCharacterRange_withGranularity_isVerticalOut_actualRange___block_invoke(_QWORD *a1, unsigned int *a2, _BYTE *a3)
{
  float *v6;
  __n128 result;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  NSRange v11;
  NSRange v12;
  uint64_t v13;
  __int128 v14;
  CGRect v15;

  v6 = *(float **)(a1[4] + 8);
  v15.origin.x = v6[10];
  v15.origin.y = v6[11];
  v15.size.width = v6[12];
  v15.size.height = v6[13];
  if (CGRectIsNull(v15))
  {
    v8 = *(_QWORD *)(a1[4] + 8);
    result = *(__n128 *)a2;
    v9 = *((_OWORD *)a2 + 1);
    *(_OWORD *)(v8 + 32) = *(_OWORD *)a2;
    *(_OWORD *)(v8 + 48) = v9;
  }
  v10 = a1[6];
  if (v10 == -1 || v10 == a2[6])
  {
    v11.location = *a2;
    v12.location = a1[7];
    if (v12.location == v11.location || (v11.length = a2[1], v12.length = a1[8], NSIntersectionRange(v12, v11).length))
    {
      v13 = *(_QWORD *)(a1[5] + 8);
      result = *(__n128 *)a2;
      v14 = *((_OWORD *)a2 + 1);
      *(_OWORD *)(v13 + 32) = *(_OWORD *)a2;
      *(_OWORD *)(v13 + 48) = v14;
      *a3 = 1;
    }
  }
  return result;
}

- (id)rectsForCharacterRange:(_NSRange)a3 withGranularity:(int64_t)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  length = a3.length;
  location = a3.location;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__RTIDocumentState_rectsForCharacterRange_withGranularity___block_invoke;
  v10[3] = &unk_1E35C2990;
  v10[6] = location;
  v10[7] = length;
  v10[4] = &v11;
  v10[5] = a4;
  -[RTIDocumentState _enumerateDocumentRectsWithOptions:block:](self, "_enumerateDocumentRectsWithOptions:block:", 0, v10);
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __59__RTIDocumentState_rectsForCharacterRange_withGranularity___block_invoke(NSRange a1)
{
  float *length;
  NSUInteger location;
  uint64_t v3;
  NSRange v4;
  id v5;

  length = (float *)a1.length;
  location = a1.location;
  v3 = *(_QWORD *)(a1.location + 40);
  if (v3 == -1 || v3 == *(_DWORD *)(a1.length + 24))
  {
    v4.location = *(unsigned int *)a1.length;
    a1.location = *(_QWORD *)(a1.location + 48);
    if (a1.location == v4.location
      || (v4.length = *(unsigned int *)(a1.length + 4),
          a1.length = *(_QWORD *)(location + 56),
          NSIntersectionRange(a1, v4).length))
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", length[2], length[3], length[4], length[5]);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(location + 32) + 8) + 40), "addObject:", v5);

    }
  }
}

- (void)enumerateRectsWithOptions:(unint64_t)a3 range:(_NSRange)a4 granularity:(int64_t)a5 block:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  int64_t v15;
  NSUInteger v16;
  NSUInteger v17;

  length = a4.length;
  location = a4.location;
  v11 = a6;
  if (v11)
  {
    v13[1] = 3221225472;
    v13[2] = __70__RTIDocumentState_enumerateRectsWithOptions_range_granularity_block___block_invoke;
    v13[3] = &unk_1E35C29B8;
    v15 = a5;
    v16 = location;
    v17 = length;
    v12 = v11;
    v13[0] = MEMORY[0x1E0C809B0];
    v14 = v11;
    -[RTIDocumentState _enumerateDocumentRectsWithOptions:block:](self, "_enumerateDocumentRectsWithOptions:block:", a3, v13);

    v11 = v12;
  }

}

NSUInteger __70__RTIDocumentState_enumerateRectsWithOptions_range_granularity_block___block_invoke(NSUInteger result, float *a2)
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSRange v7;
  NSRange v9;
  NSRange v10;

  v3 = result;
  v4 = *(_QWORD *)(result + 40);
  if (v4 == -1 || v4 == *((_DWORD *)a2 + 6))
  {
    v6 = *(unsigned int *)a2;
    v5 = *((unsigned int *)a2 + 1);
    v9.location = *(_QWORD *)(result + 48);
    v9.length = *(_QWORD *)(v3 + 56);
    v10.location = *(unsigned int *)a2;
    v10.length = *((unsigned int *)a2 + 1);
    v7 = NSIntersectionRange(v9, v10);
    result = v7.location;
    if (v7.location == v6 && v7.length == v5)
      return (*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(v3 + 32) + 16))(a2[2], a2[3], a2[4], a2[5]);
  }
  return result;
}

- (unint64_t)characterIndexForPoint:(CGPoint)a3
{
  unint64_t v3;
  _QWORD v5[5];
  CGPoint v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3010000000;
  v10 = &unk_1991CBFA5;
  v11 = xmmword_1991C7CB0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__RTIDocumentState_characterIndexForPoint___block_invoke;
  v5[3] = &unk_1E35C29E0;
  v6 = a3;
  v5[4] = &v7;
  -[RTIDocumentState _enumerateDocumentRectsWithOptions:block:](self, "_enumerateDocumentRectsWithOptions:block:", 0, v5);
  v3 = v8[4];
  _Block_object_dispose(&v7, 8);
  return v3;
}

BOOL __43__RTIDocumentState_characterIndexForPoint___block_invoke(uint64_t a1, float *a2, _BYTE *a3)
{
  _BOOL8 result;
  uint64_t v7;
  CGRect v8;

  v8.origin.x = a2[2];
  v8.origin.y = a2[3];
  v8.size.width = a2[4];
  v8.size.height = a2[5];
  result = CGRectContainsPoint(v8, *(CGPoint *)(a1 + 40));
  if (result)
  {
    v7 = *((unsigned int *)a2 + 1);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = *(unsigned int *)a2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = v7;
    *a3 = 1;
  }
  return result;
}

- (RTIDocumentRequest)request
{
  return self->_request;
}

- (BOOL)hasText
{
  return self->_hasText;
}

- (CGRect)caretRectInWindow
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_caretRectInWindow.origin.x;
  y = self->_caretRectInWindow.origin.y;
  width = self->_caretRectInWindow.size.width;
  height = self->_caretRectInWindow.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)firstSelectionRectInWindow
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_firstSelectionRectInWindow.origin.x;
  y = self->_firstSelectionRectInWindow.origin.y;
  width = self->_firstSelectionRectInWindow.size.width;
  height = self->_firstSelectionRectInWindow.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)clientFrameInWindow
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clientFrameInWindow.origin.x;
  y = self->_clientFrameInWindow.origin.y;
  width = self->_clientFrameInWindow.size.width;
  height = self->_clientFrameInWindow.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)firstSelectionRectInEntitySpace
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_firstSelectionRectInEntitySpace.origin.x;
  y = self->_firstSelectionRectInEntitySpace.origin.y;
  width = self->_firstSelectionRectInEntitySpace.size.width;
  height = self->_firstSelectionRectInEntitySpace.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFirstSelectionRectInEntitySpace:(CGRect)a3
{
  self->_firstSelectionRectInEntitySpace = a3;
}

- (CGRect)clientFrameInEntitySpace
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clientFrameInEntitySpace.origin.x;
  y = self->_clientFrameInEntitySpace.origin.y;
  width = self->_clientFrameInEntitySpace.size.width;
  height = self->_clientFrameInEntitySpace.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)scrolling
{
  return self->_scrolling;
}

- (BOOL)originatedFromSource
{
  return self->_originatedFromSource;
}

- (void)setOriginatedFromSource:(BOOL)a3
{
  self->_originatedFromSource = a3;
}

- (BOOL)canSuggestSupplementalItemsForCurrentSelection
{
  return self->_canSuggestSupplementalItemsForCurrentSelection;
}

- (NSAttributedString)textCheckingAnnotatedString
{
  return self->_textCheckingAnnotatedString;
}

- (RTITextStyling)autocorrectBubbleStyling
{
  return self->_autocorrectBubbleStyling;
}

- (RTIColor)autocorrectTextColor
{
  return self->_autocorrectTextColor;
}

- (RTIColor)autocorrectTextBackgroundColor
{
  return self->_autocorrectTextBackgroundColor;
}

- (RTIColor)insertionPointColor
{
  return self->_insertionPointColor;
}

- (void)firstRectForCharacterRange:(os_log_t)log withGranularity:isVerticalOut:actualRange:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[RTIDocumentState firstRectForCharacterRange:withGranularity:isVerticalOut:actualRange:]";
  _os_log_error_impl(&dword_1991A8000, log, OS_LOG_TYPE_ERROR, "%s  ERROR: We are falling back to the first value. The client is not setting the range correctly.", (uint8_t *)&v1, 0xCu);
}

@end
