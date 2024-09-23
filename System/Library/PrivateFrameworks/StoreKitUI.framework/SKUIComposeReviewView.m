@implementation SKUIComposeReviewView

- (SKUIComposeReviewView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  char *v5;
  SKUIComposeReviewView *v6;
  __int128 v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SKUIComposeReviewView;
  v5 = -[SKUIComposeReviewView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = (SKUIComposeReviewView *)v5;
  if (v5)
  {
    *((_QWORD *)v5 + 67) = a4;
    v7 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    *(_OWORD *)(v5 + 472) = *MEMORY[0x1E0C9D648];
    *(_OWORD *)(v5 + 488) = v7;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIComposeReviewView setBackgroundColor:](v6, "setBackgroundColor:", v8);

    -[SKUIComposeReviewView _showComposeView](v6, "_showComposeView");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__keyboardVisibilityDidChangeNotification_, *MEMORY[0x1E0DC4E68], 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__keyboardVisibilityDidChangeNotification_, *MEMORY[0x1E0DC4E70], 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__remoteKeyboardVisibilityDidChangeNotification_, CFSTR("SKUIRemoteKeyboardFrameChangedNotification"), 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4E68], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4E70], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SKUIRemoteKeyboardFrameChangedNotification"), 0);
  -[SKUIComposeReviewHeaderView setDelegate:](self->_headerView, "setDelegate:", 0);
  -[SUTextContentView setDelegate:](self->_textContentView, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)SKUIComposeReviewView;
  -[SKUIComposeReviewView dealloc](&v4, sel_dealloc);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  SUTextContentView *textContentView;
  void *v8;
  SUTextContentView *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[SKUIComposeReviewView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v6)
  {
    textContentView = self->_textContentView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUTextContentView setBackgroundColor:](textContentView, "setBackgroundColor:", v8);

    v9 = self->_textContentView;
    -[SKUIComposeReviewView traitCollection](self, "traitCollection");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "userInterfaceStyle") == 2)
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "darkTextColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUTextContentView setTextColor:](v9, "setTextColor:", v10);

  }
}

- (void)layoutSubviews
{
  if ((*((_BYTE *)self + 504) & 1) != 0)
    -[SKUIComposeReviewView _layoutLoadingView](self, "_layoutLoadingView");
  else
    -[SKUIComposeReviewView _layoutComposeView](self, "_layoutComposeView");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  UIScrollView *v6;
  SUTextContentView *textContentView;
  double v8;
  SUTextContentView *v10;
  objc_super v12;

  y = a3.y;
  v12.receiver = self;
  v12.super_class = (Class)SKUIComposeReviewView;
  -[SKUIComposeReviewView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, a4, a3.x);
  v6 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
  textContentView = self->_textContentView;
  -[SUTextContentView frame](textContentView, "frame");
  -[SUTextContentView convertRect:toView:](textContentView, "convertRect:toView:", self->_scrollView);
  if (v6 == self->_scrollView && y > v8)
  {
    v10 = self->_textContentView;

    v6 = (UIScrollView *)v10;
  }
  return v6;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKUIComposeReviewView;
  -[SKUIComposeReviewView setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)copyReview
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)-[SKUIReviewMetadata copy](self->_review, "copy");
  -[SKUIComposeReviewView _body](self, "_body");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBody:", v4);

  -[SKUIComposeReviewView rating](self, "rating");
  objc_msgSend(v3, "setRating:");
  -[SKUIComposeReviewHeaderView title](self->_headerView, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  return v3;
}

- (BOOL)isLoading
{
  return *((_BYTE *)self + 504) & 1;
}

- (BOOL)isValid
{
  SKUIReviewMetadata *review;
  void *v4;
  BOOL v5;

  review = self->_review;
  -[SKUIComposeReviewHeaderView title](self->_headerView, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length") || (v5 = review != 0, self->_currentBodyLength >= 1))
  {
    if (objc_msgSend(v4, "length"))
      v5 = self->_currentBodyLength > 0;
    else
      v5 = 0;
  }

  return v5;
}

- (float)rating
{
  float result;

  -[SKUIComposeReviewHeaderView rating](self->_headerView, "rating");
  return result;
}

- (void)reloadData
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  id WeakRetained;
  id v8;
  id v9;

  -[SKUIReviewMetadata body](self->_review, "body");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (-[SKUIReviewMetadata bodyMaxLength](self->_review, "bodyMaxLength"))
    v3 = -[SKUIReviewMetadata bodyMaxLength](self->_review, "bodyMaxLength");
  else
    v3 = 0x7FFFFFFFFFFFFFFFLL;
  v4 = objc_msgSend(v8, "length");
  self->_currentBodyLength = v4;
  if (v4 <= v3)
  {
    v6 = v8;
  }
  else
  {
    objc_msgSend(v8, "substringToIndex:", v3);
    v5 = objc_claimAutoreleasedReturnValue();

    self->_currentBodyLength = v3;
    v6 = (id)v5;
  }
  v9 = v6;
  -[SUTextContentView setText:](self->_textContentView, "setText:", v6);
  -[SKUIComposeReviewHeaderView setReview:](self->_headerView, "setReview:", self->_review);
  -[SKUIComposeReviewHeaderView sizeToFit](self->_headerView, "sizeToFit");
  -[SKUIComposeReviewView setNeedsLayout](self, "setNeedsLayout");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "composeReviewViewValidityChanged:", self);

}

- (void)setLoading:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)self + 504);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((_BYTE *)self + 504) = v3 & 0xFE | a3;
    if (a3)
      -[SKUIComposeReviewView _showLoadingView](self, "_showLoadingView");
    else
      -[SKUIComposeReviewView _showComposeView](self, "_showComposeView");
  }
}

- (void)setRating:(float)a3
{
  -[SKUIComposeReviewHeaderView setRating:](self->_headerView, "setRating:");
}

- (void)setReview:(id)a3
{
  SKUIReviewMetadata *v5;
  SKUIReviewMetadata *v6;

  v5 = (SKUIReviewMetadata *)a3;
  if (self->_review != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_review, a3);
    v5 = v6;
  }

}

- (void)composeHeaderViewValidityDidChange:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "composeReviewViewValidityChanged:", self);

}

- (void)composeHeaderViewValuesDidChange:(id)a3
{
  SUTextContentView *textContentView;
  void *v5;
  id WeakRetained;

  textContentView = self->_textContentView;
  -[SKUIComposeReviewView _reviewPlaceholder](self, "_reviewPlaceholder", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUTextContentView setPlaceholder:](textContentView, "setPlaceholder:", v5);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "composeReviewViewValidityChanged:", self);

}

- (BOOL)textContentView:(id)a3 shouldChangeSizeForContentSize:(CGSize)a4
{
  return 1;
}

- (BOOL)textContentView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  return -[SKUIComposeReviewView _composeReviewTextViewShouldChangeTextInRange:replacementText:](self, "_composeReviewTextViewShouldChangeTextInRange:replacementText:", a4.location, a4.length, a5);
}

- (BOOL)textContentView:(id)a3 shouldScrollForPendingContentSize:(CGSize)a4
{
  return 0;
}

- (void)textContentViewDidChange:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  id v8;
  CGRect v9;

  v8 = a3;
  objc_msgSend(v8, "rectForScrollToVisible");
  x = v9.origin.x;
  y = v9.origin.y;
  width = v9.size.width;
  height = v9.size.height;
  if (!CGRectIsEmpty(v9))
  {
    objc_msgSend(v8, "convertRect:toView:", self->_scrollView, x, y, width, height);
    -[UIScrollView scrollRectToVisible:animated:](self->_scrollView, "scrollRectToVisible:animated:", 1);
  }

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  return -[SKUIComposeReviewView _composeReviewTextViewShouldChangeTextInRange:replacementText:](self, "_composeReviewTextViewShouldChangeTextInRange:replacementText:", a4.location, a4.length, a5);
}

- (BOOL)_composeReviewTextViewShouldChangeTextInRange:(_NSRange)a3 replacementText:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  int64_t currentBodyLength;
  int64_t v9;
  uint64_t v10;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  if (self->_currentBodyLength <= location + length)
    currentBodyLength = location + length;
  else
    currentBodyLength = self->_currentBodyLength;
  if (-[SKUIReviewMetadata bodyMaxLength](self->_review, "bodyMaxLength"))
    v9 = -[SKUIReviewMetadata bodyMaxLength](self->_review, "bodyMaxLength");
  else
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  v10 = currentBodyLength - length + objc_msgSend(v7, "length");
  if (v10 <= v9)
    -[SKUIComposeReviewView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__delayedUpdateReviewLength, 0, 0.0);

  return v10 <= v9;
}

- (void)_keyboardVisibilityDidChangeNotification:(id)a3
{
  void *v4;
  CGRect *p_keyboardFrame;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGSize v19;
  id v20;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  p_keyboardFrame = &self->_keyboardFrame;
  if (v20)
  {
    objc_msgSend(v20, "CGRectValue");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(MEMORY[0x1E0DC3F98], "keyWindow");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIComposeReviewView convertRect:fromView:](self, "convertRect:fromView:", v14, v7, v9, v11, v13);
    p_keyboardFrame->origin.x = v15;
    self->_keyboardFrame.origin.y = v16;
    self->_keyboardFrame.size.width = v17;
    self->_keyboardFrame.size.height = v18;

  }
  else
  {
    v19 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    p_keyboardFrame->origin = (CGPoint)*MEMORY[0x1E0C9D648];
    self->_keyboardFrame.size = v19;
  }
  if (!-[SKUIComposeReviewView isLoading](self, "isLoading"))
    -[SKUIComposeReviewView _layoutComposeView](self, "_layoutComposeView");

}

- (void)_remoteKeyboardVisibilityDidChangeNotification:(id)a3
{
  void *v4;
  CGRect *p_remoteKeyboardFrame;
  CGSize v6;
  id v7;
  CGRect v8;
  CGRect v9;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SKUIRemoteKeyboardFrame"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  p_remoteKeyboardFrame = &self->_remoteKeyboardFrame;
  if (v7)
  {
    objc_msgSend(v7, "CGRectValue");
    v9 = CGRectIntegral(v8);
    p_remoteKeyboardFrame->origin.x = v9.origin.x;
    self->_remoteKeyboardFrame.origin.y = v9.origin.y;
    self->_remoteKeyboardFrame.size.width = v9.size.width;
    self->_remoteKeyboardFrame.size.height = v9.size.height;
  }
  else
  {
    v6 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    p_remoteKeyboardFrame->origin = (CGPoint)*MEMORY[0x1E0C9D648];
    self->_remoteKeyboardFrame.size = v6;
  }
  if (!-[SKUIComposeReviewView isLoading](self, "isLoading"))
    -[SKUIComposeReviewView _layoutComposeView](self, "_layoutComposeView");

}

- (id)_body
{
  void *v2;
  void *v3;
  void *v4;

  -[SUTextContentView text](self->_textContentView, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_delayedUpdateReviewLength
{
  void *v3;
  id WeakRetained;

  -[SUTextContentView text](self->_textContentView, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_currentBodyLength = objc_msgSend(v3, "length");

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "composeReviewViewValidityChanged:", self);

}

- (BOOL)_isReviewTextOptional
{
  void *v2;
  BOOL v3;

  -[SKUIComposeReviewHeaderView title](self->_headerView, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") == 0;

  return v3;
}

- (void)_layoutComposeView
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
  CGRect *p_remoteKeyboardFrame;
  double height;
  CGFloat width;
  double y;
  CGFloat x;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double MaxY;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  -[SKUIComposeReviewView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SKUIComposeReviewView safeAreaInsets](self, "safeAreaInsets");
  v12 = v11;
  v14 = v13;
  p_remoteKeyboardFrame = &self->_remoteKeyboardFrame;
  if (CGRectEqualToRect(self->_remoteKeyboardFrame, *MEMORY[0x1E0C9D648]))
    p_remoteKeyboardFrame = &self->_keyboardFrame;
  height = p_remoteKeyboardFrame->size.height;
  if (height > 0.00000011920929)
  {
    y = p_remoteKeyboardFrame->origin.y;
    width = p_remoteKeyboardFrame->size.width;
    x = p_remoteKeyboardFrame->origin.x;
    v20 = y;
    v35.origin.x = v4;
    v35.origin.y = v6;
    v35.size.width = v8;
    v35.size.height = v10;
    if (CGRectIntersectsRect(*(CGRect *)(&height - 3), v35))
      v10 = y + -3.0;
  }
  -[UIScrollView frame](self->_scrollView, "frame");
  v36.origin.x = v21;
  v36.origin.y = v22;
  v36.size.width = v23;
  v36.size.height = v24;
  v33.origin.x = v4;
  v33.origin.y = v6;
  v33.size.width = v8;
  v33.size.height = v10;
  if (!CGRectEqualToRect(v33, v36))
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v4, v6, v8, v10);
  -[SKUIComposeReviewHeaderView frame](self->_headerView, "frame");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  -[SKUIComposeReviewHeaderView setFrame:](self->_headerView, "setFrame:");
  v34.origin.x = v26;
  v34.origin.y = v28;
  v34.size.width = v8;
  v34.size.height = v30;
  MaxY = CGRectGetMaxY(v34);
  -[SUTextContentView frame](self->_textContentView, "frame");
  if (v32 < v10 - MaxY)
    v32 = v10 - MaxY;
  -[SUTextContentView setFrame:](self->_textContentView, "setFrame:", v12 + 7.0, MaxY, v8 - v14 - (v12 + 7.0), v32);
}

- (void)_layoutLoadingView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[SKUIComposeReviewView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[SULoadingView frame](self->_loadingView, "frame");
  -[SULoadingView setFrame:](self->_loadingView, "setFrame:", floor((v4 - v7) * 0.5), floor((v6 - v8) * 0.5));
}

- (id)_reviewPlaceholder
{
  void *v2;
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  if (self->_style == 1)
  {
    v2 = 0;
  }
  else
  {
    v3 = -[SKUIComposeReviewView _isReviewTextOptional](self, "_isReviewTextOptional");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
      v6 = CFSTR("REVIEW_PLACEHOLDER");
    else
      v6 = CFSTR("REVIEW_PLACEHOLDER_NOT_OPTIONAL");
    objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E73A9FB0, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (void)_showComposeView
{
  UIScrollView *scrollView;
  UIScrollView *v4;
  UIScrollView *v5;
  UIScrollView *v6;
  void *v7;
  SKUIComposeReviewView *v8;
  SKUIComposeReviewHeaderView *headerView;
  SKUIComposeReviewHeaderView *v10;
  int64_t v11;
  SKUIComposeReviewHeaderView *v12;
  SKUIComposeReviewHeaderView *v13;
  UIScrollView *v14;
  UIScrollView *v15;
  SUTextContentView *textContentView;
  SUTextContentView *v17;
  SUTextContentView *v18;
  SUTextContentView *v19;
  void *v20;
  SUTextContentView *v21;
  void *v22;
  SUTextContentView *v23;
  void *v24;
  SUTextContentView *v25;
  void *v26;
  SUTextContentView *v27;
  void *v28;
  void *v29;
  UIScrollView *v30;
  UIScrollView *v31;
  SUTextContentView *v32;
  SUTextContentView *v33;

  -[SULoadingView removeFromSuperview](self->_loadingView, "removeFromSuperview");
  scrollView = self->_scrollView;
  if (!scrollView)
  {
    v4 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
    v5 = self->_scrollView;
    self->_scrollView = v4;

    -[UIScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", 1);
    v6 = self->_scrollView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView setTopExtensionViewColor:](v6, "setTopExtensionViewColor:", v7);

    scrollView = self->_scrollView;
  }
  -[UIScrollView superview](scrollView, "superview");
  v8 = (SKUIComposeReviewView *)objc_claimAutoreleasedReturnValue();

  if (v8 != self)
    -[SKUIComposeReviewView addSubview:](self, "addSubview:", self->_scrollView);
  headerView = self->_headerView;
  if (!headerView)
  {
    v10 = [SKUIComposeReviewHeaderView alloc];
    v11 = -[SKUIComposeReviewView composeReviewStyle](self, "composeReviewStyle");
    v12 = -[SKUIComposeReviewHeaderView initWithFrame:style:](v10, "initWithFrame:style:", v11, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v13 = self->_headerView;
    self->_headerView = v12;

    -[SKUIComposeReviewHeaderView setDelegate:](self->_headerView, "setDelegate:", self);
    headerView = self->_headerView;
  }
  -[SKUIComposeReviewHeaderView setReview:](headerView, "setReview:", self->_review);
  -[SKUIComposeReviewHeaderView sizeToFit](self->_headerView, "sizeToFit");
  -[SKUIComposeReviewHeaderView superview](self->_headerView, "superview");
  v14 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
  v15 = self->_scrollView;

  if (v14 != v15)
    -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_headerView);
  textContentView = self->_textContentView;
  if (!textContentView)
  {
    v17 = (SUTextContentView *)objc_alloc_init(MEMORY[0x1E0DDC268]);
    v18 = self->_textContentView;
    self->_textContentView = v17;

    -[SUTextContentView setDelegate:](self->_textContentView, "setDelegate:", self);
    v19 = self->_textContentView;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUTextContentView setFont:](v19, "setFont:", v20);

    v21 = self->_textContentView;
    -[SKUIComposeReviewView _reviewPlaceholder](self, "_reviewPlaceholder");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUTextContentView setPlaceholder:](v21, "setPlaceholder:", v22);

    v23 = self->_textContentView;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 13.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUTextContentView setFont:](v23, "setFont:", v24);

    v25 = self->_textContentView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUTextContentView setBackgroundColor:](v25, "setBackgroundColor:", v26);

    v27 = self->_textContentView;
    -[SKUIComposeReviewView traitCollection](self, "traitCollection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "userInterfaceStyle") == 2)
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "darkTextColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUTextContentView setTextColor:](v27, "setTextColor:", v29);

    textContentView = self->_textContentView;
  }
  -[SUTextContentView superview](textContentView, "superview");
  v30 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
  v31 = self->_scrollView;

  if (v30 != v31)
    -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_textContentView);
  -[SKUIComposeReviewHeaderView initialFirstResponder](self->_headerView, "initialFirstResponder");
  v32 = (SUTextContentView *)objc_claimAutoreleasedReturnValue();
  if (!v32)
    v32 = self->_textContentView;
  v33 = v32;
  -[SUTextContentView becomeFirstResponder](v32, "becomeFirstResponder");
  -[SKUIComposeReviewView _layoutComposeView](self, "_layoutComposeView");
  -[SKUIComposeReviewView _updateContentSize](self, "_updateContentSize");

}

- (void)_showLoadingView
{
  SULoadingView *loadingView;
  SULoadingView *v4;
  SULoadingView *v5;
  SKUIComposeReviewView *v6;

  -[UIScrollView removeFromSuperview](self->_scrollView, "removeFromSuperview");
  loadingView = self->_loadingView;
  if (!loadingView)
  {
    v4 = (SULoadingView *)objc_alloc_init(MEMORY[0x1E0DDC210]);
    v5 = self->_loadingView;
    self->_loadingView = v4;

    -[SULoadingView sizeToFit](self->_loadingView, "sizeToFit");
    loadingView = self->_loadingView;
  }
  -[SULoadingView superview](loadingView, "superview");
  v6 = (SKUIComposeReviewView *)objc_claimAutoreleasedReturnValue();

  if (v6 != self)
    -[SKUIComposeReviewView addSubview:](self, "addSubview:", self->_loadingView);
}

- (void)_updateContentSize
{
  double v3;
  double v4;
  CGRect v5;

  -[SKUIComposeReviewHeaderView frame](self->_headerView, "frame");
  v4 = v3;
  -[SUTextContentView frame](self->_textContentView, "frame");
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v4, CGRectGetMaxY(v5));
}

- (int64_t)composeReviewStyle
{
  return self->_style;
}

- (SKUIComposeReviewViewDelegate)delegate
{
  return (SKUIComposeReviewViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textContentViewAlt, 0);
  objc_storeStrong((id *)&self->_textContentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_review, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
