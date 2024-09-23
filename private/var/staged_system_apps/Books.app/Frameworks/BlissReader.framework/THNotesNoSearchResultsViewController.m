@implementation THNotesNoSearchResultsViewController

- (THNotesNoSearchResultsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  objc_super v8;

  v6 = THBundle();
  v8.receiver = self;
  v8.super_class = (Class)THNotesNoSearchResultsViewController;
  return -[THNotesNoSearchResultsViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", a3, v6);
}

- (void)p_releaseOutlets
{
  -[THNotesNoSearchResultContainerView setSizeProvider:](self->mNoResultsView, "setSizeProvider:", 0);
  -[THNotesNoSearchResultContainerView setSizeProvider:](self->mFirstLaunchView, "setSizeProvider:", 0);
  -[THNotesNoSearchResultContainerView setSizeProvider:](self->mInstructionsView, "setSizeProvider:", 0);

  self->mNoResultsView = 0;
  self->mNoResultsViewHeader = 0;

  self->mPercentFoundLabel = 0;
  self->mFirstLaunchView = 0;

  self->mFirstLaunchViewHeader = 0;
  self->mStepOneLabel = 0;

  self->mStepTwoLabel = 0;
  self->mStepThreeLabel = 0;

  self->mFooterLabel = 0;
  self->mNoteIcon = 0;

  self->mInlineNoteIcon = 0;
  self->mInstructionsView = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[THNotesNoSearchResultsViewController p_releaseOutlets](self, "p_releaseOutlets");
  v3.receiver = self;
  v3.super_class = (Class)THNotesNoSearchResultsViewController;
  -[THNotesNoSearchResultsViewController dealloc](&v3, "dealloc");
}

- (void)viewDidLoad
{
  THNotesNoSearchResultContainerView *mFirstLaunchView;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  UILabel *mPercentFoundLabel;
  UILabel *mStepOneLabel;
  UILabel *mStepThreeLabel;
  NSArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  _QWORD v27[7];
  _BYTE v28[128];
  _QWORD v29[3];

  v25.receiver = self;
  v25.super_class = (Class)THNotesNoSearchResultsViewController;
  -[THNotesNoSearchResultsViewController viewDidLoad](&v25, "viewDidLoad");
  -[THNotesNoSearchResultContainerView setSizeProvider:](self->mNoResultsView, "setSizeProvider:", self);
  -[THNotesNoSearchResultContainerView setSizeProvider:](self->mFirstLaunchView, "setSizeProvider:", self);
  -[THNotesNoSearchResultContainerView setSizeProvider:](self->mInstructionsView, "setSizeProvider:", self);
  objc_msgSend(-[THNotesNoSearchResultsViewController view](self, "view"), "bounds");
  -[UILabel bounds](self->mFirstLaunchViewHeader, "bounds");
  -[UILabel setBounds:](self->mFirstLaunchViewHeader, "setBounds:", 0.0);
  -[THNotesNoSearchResultsViewController setChapterIndex:](self, "setChapterIndex:", self->mChapterIndex);
  -[THNotesNoSearchResultsViewController setResults:](self, "setResults:", self->mResults);
  -[THNotesNoSearchResultsViewController setFooterType:](self, "setFooterType:", self->mFooterType);
  -[UILabel setText:](self->mStepOneLabel, "setText:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("1. Tap and hold a word. Start dragging your finger to highlight text."), &stru_43D7D8, 0));
  -[UILabel setText:](self->mStepTwoLabel, "setText:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("2. You can extend your highlight to include an entire passage."), &stru_43D7D8, 0));
  -[UILabel setText:](self->mStepThreeLabel, "setText:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("3. To add a note, tap the highlight and select the Note icon."), &stru_43D7D8, 0));
  objc_msgSend(-[THNotesNoSearchResultsViewController view](self, "view"), "setBackgroundColor:", +[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  mFirstLaunchView = self->mFirstLaunchView;
  v29[0] = self->mNoResultsView;
  v29[1] = mFirstLaunchView;
  v29[2] = self->mInstructionsView;
  v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 3);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "setBackgroundColor:", +[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    }
    while (v6);
  }
  mPercentFoundLabel = self->mPercentFoundLabel;
  v27[0] = self->mNoResultsViewHeader;
  v27[1] = mPercentFoundLabel;
  mStepOneLabel = self->mStepOneLabel;
  v27[2] = self->mFirstLaunchViewHeader;
  v27[3] = mStepOneLabel;
  mStepThreeLabel = self->mStepThreeLabel;
  v27[4] = self->mStepTwoLabel;
  v27[5] = mStepThreeLabel;
  v27[6] = self->mFooterLabel;
  v12 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 7);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)j), "setTextColor:", +[UIColor bc_booksSecondaryLabelColor](UIColor, "bc_booksSecondaryLabelColor"));
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
    }
    while (v14);
  }
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THNotesNoSearchResultsViewController;
  -[THNotesNoSearchResultsViewController viewWillLayoutSubviews](&v3, "viewWillLayoutSubviews");
  -[THNotesNoSearchResultsViewController p_prepForFirstLaunchViewLayout](self, "p_prepForFirstLaunchViewLayout");
}

- (BOOL)p_shouldShowNoteIcon
{
  double v2;

  objc_msgSend(-[THNotesNoSearchResultsViewController view](self, "view"), "bounds");
  return v2 > 524.0;
}

- (void)p_updateNoteIconVisibility
{
  unsigned int v3;
  double v4;

  v3 = -[THNotesNoSearchResultsViewController p_shouldShowNoteIcon](self, "p_shouldShowNoteIcon");
  -[UIImageView setHidden:](self->mNoteIcon, "setHidden:", v3 ^ 1);
  v4 = 158.0;
  if (!v3)
    v4 = 0.0;
  -[THNotesNoSearchResultsViewController p_setConstraint:onView:toValue:](self, "p_setConstraint:onView:toValue:", CFSTR("FirstLaunchViewHeaderVerticalSpace"), self->mFirstLaunchViewHeader, v4);
}

- (id)p_findConstraint:(id)a3 onView:(id)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (!a4)
    return 0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(a4, "constraints", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
LABEL_4:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
      if ((objc_msgSend(objc_msgSend(v12, "identifier"), "isEqualToString:", a3) & 1) != 0)
        break;
      if (v9 == (id)++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          goto LABEL_4;
        return -[THNotesNoSearchResultsViewController p_findConstraint:onView:](self, "p_findConstraint:onView:", a3, objc_msgSend(a4, "superview"));
      }
    }
    if (v12)
      return v12;
  }
  return -[THNotesNoSearchResultsViewController p_findConstraint:onView:](self, "p_findConstraint:onView:", a3, objc_msgSend(a4, "superview"));
}

- (void)p_setConstraint:(id)a3 onView:(id)a4 toValue:(double)a5
{
  id v7;

  v7 = -[THNotesNoSearchResultsViewController p_findConstraint:onView:](self, "p_findConstraint:onView:", a3, a4);
  if (!v7)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesNoSearchResultsViewController p_setConstraint:onView:toValue:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesNoSearchResultsViewController.m"), 224, CFSTR("Constraint not found: %@"), a3);
  objc_msgSend(v7, "setConstant:", a5);
}

- (double)p_getConstraint:(id)a3 onView:(id)a4
{
  id v5;
  double result;

  v5 = -[THNotesNoSearchResultsViewController p_findConstraint:onView:](self, "p_findConstraint:onView:", a3, a4);
  if (!v5)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesNoSearchResultsViewController p_getConstraint:onView:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesNoSearchResultsViewController.m"), 231, CFSTR("Constraint not found: %@"), a3);
  objc_msgSend(v5, "constant");
  return result;
}

- (void)p_prepForFirstLaunchViewLayout
{
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v11;

  objc_msgSend(-[THNotesNoSearchResultsViewController view](self, "view"), "bounds");
  v3 = CGRectGetWidth(v11) + -20.0;
  -[UIImage size](-[UIImageView image](self->mInlineNoteIcon, "image"), "size");
  v5 = v4 + 0.0;
  -[UILabel setPreferredMaxLayoutWidth:](self->mStepOneLabel, "setPreferredMaxLayoutWidth:", v3);
  -[UILabel setPreferredMaxLayoutWidth:](self->mStepTwoLabel, "setPreferredMaxLayoutWidth:", v3);
  -[UILabel setPreferredMaxLayoutWidth:](self->mStepThreeLabel, "setPreferredMaxLayoutWidth:", v3 - v5);
  -[UILabel intrinsicContentSize](self->mStepOneLabel, "intrinsicContentSize");
  v7 = v6;
  self->mInstructionsViewWidth = v6;
  -[UILabel intrinsicContentSize](self->mStepTwoLabel, "intrinsicContentSize");
  if (v7 < v8)
    v7 = v8;
  self->mInstructionsViewWidth = v7;
  -[UILabel intrinsicContentSize](self->mStepThreeLabel, "intrinsicContentSize");
  v10 = v5 + v9;
  if (v7 >= v10)
    v10 = v7;
  self->mInstructionsViewWidth = v10;
  -[UILabel setPreferredMaxLayoutWidth:](self->mStepOneLabel, "setPreferredMaxLayoutWidth:");
  -[UILabel setPreferredMaxLayoutWidth:](self->mStepTwoLabel, "setPreferredMaxLayoutWidth:", self->mInstructionsViewWidth);
  -[UILabel setPreferredMaxLayoutWidth:](self->mStepThreeLabel, "setPreferredMaxLayoutWidth:", self->mInstructionsViewWidth - v5);
  -[THNotesNoSearchResultContainerView invalidateIntrinsicContentSize](self->mInstructionsView, "invalidateIntrinsicContentSize");
  -[THNotesNoSearchResultContainerView invalidateIntrinsicContentSize](self->mFirstLaunchView, "invalidateIntrinsicContentSize");
  -[THNotesNoSearchResultsViewController p_updateNoteIconVisibility](self, "p_updateNoteIconVisibility");
}

- (void)setChapterIndex:(unint64_t)a3
{
  int mMessageType;
  void *v5;
  const __CFString *v6;

  self->mChapterIndex = a3;
  mMessageType = self->mMessageType;
  v5 = (void *)THBundle();
  if (mMessageType == 1)
    v6 = CFSTR("No Highlights or Notes in this Chapter");
  else
    v6 = CFSTR("No Results");
  -[UILabel setText:](self->mNoResultsViewHeader, "setText:", objc_msgSend(v5, "localizedStringForKey:value:table:", v6, &stru_43D7D8, 0));
}

- (void)setResults:(unint64_t)a3
{
  int mMessageType;
  UILabel *mPercentFoundLabel;
  void *v7;
  const __CFString *v8;
  NSString *v9;

  self->mResults = a3;
  mMessageType = self->mMessageType;
  mPercentFoundLabel = self->mPercentFoundLabel;
  if (mMessageType == 1)
  {
    -[UILabel setHidden:](mPercentFoundLabel, "setHidden:", 1);
    return;
  }
  -[UILabel setHidden:](mPercentFoundLabel, "setHidden:", 0);
  if (a3)
  {
    if (self->mResults != 1)
    {
      v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("%lu results found total"), &stru_43D7D8, 0), self->mResults);
      goto LABEL_9;
    }
    v7 = (void *)THBundle();
    v8 = CFSTR("1 result found total");
  }
  else
  {
    v7 = (void *)THBundle();
    v8 = CFSTR("No results found total");
  }
  v9 = (NSString *)objc_msgSend(v7, "localizedStringForKey:value:table:", v8, &stru_43D7D8, 0);
LABEL_9:
  -[UILabel setText:](self->mPercentFoundLabel, "setText:", v9);
}

- (void)setFooterType:(int)a3
{
  self->mFooterType = a3;
  if (a3 == 1)
  {
    -[UILabel setHidden:](self->mFooterLabel, "setHidden:");
  }
  else if (a3)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesNoSearchResultsViewController setFooterType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesNoSearchResultsViewController.m"), 308, CFSTR("Unknown No Results footer type: %d"), *(_QWORD *)&a3);
  }
  else
  {
    -[UILabel setHidden:](self->mFooterLabel, "setHidden:", 0);
    -[UILabel setText:](self->mFooterLabel, "setText:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Tap the Study Cards button to view this chapter’s glossary terms."), &stru_43D7D8, 0));
  }
}

- (void)setMessageType:(int)a3
{
  self->mMessageType = a3;
  if (a3 >= 2)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesNoSearchResultsViewController setMessageType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesNoSearchResultsViewController.m"), 322, CFSTR("Unknown No Results message type: %d"), *(_QWORD *)&a3);
}

- (CGSize)sizeForContainerView:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  char *v12;
  double v13;
  id v14;
  CGFloat mInstructionsViewWidth;
  double v16;
  double v17;
  double v18;
  const __CFString *v19;
  int *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  CGSize result;

  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = objc_msgSend(a3, "subviews", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    v9 = 0.0;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v10);
        v12 = (char *)objc_msgSend(v11, "tag");
        if ((unint64_t)(v12 - 3) < 7
          || v12 == (_BYTE *)&dword_0 + 1
          && -[THNotesNoSearchResultsViewController p_shouldShowNoteIcon](self, "p_shouldShowNoteIcon"))
        {
          objc_msgSend(v11, "intrinsicContentSize");
          v9 = v9 + v13;
        }
        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v7 = v14;
    }
    while (v14);
  }
  else
  {
    v9 = 0.0;
  }
  mInstructionsViewWidth = UIViewNoIntrinsicMetric;
  if (self->mNoResultsView == a3)
  {
    -[THNotesNoSearchResultsViewController p_getConstraint:onView:](self, "p_getConstraint:onView:", CFSTR("NoResultsViewHeaderVerticalSpace"), self->mNoResultsViewHeader);
    v9 = v9 + v21;
    v19 = CFSTR("NoResultsViewPercentFoundVerticalSpace");
    v20 = &OBJC_IVAR___THNotesNoSearchResultsViewController_mPercentFoundLabel;
    goto LABEL_24;
  }
  if (self->mFirstLaunchView == a3)
  {
    if (-[THNotesNoSearchResultsViewController p_shouldShowNoteIcon](self, "p_shouldShowNoteIcon"))
    {
      -[THNotesNoSearchResultsViewController p_getConstraint:onView:](self, "p_getConstraint:onView:", CFSTR("FirstLaunchViewHeaderVerticalSpace"), self->mFirstLaunchViewHeader);
      v23 = v22;
      -[UIImage size](-[UIImageView image](self->mNoteIcon, "image"), "size");
      v9 = v9 + v23 - v24;
    }
    v19 = CFSTR("FirstLaunchViewInstructionsViewVerticalSpace");
    v20 = &OBJC_IVAR___THNotesNoSearchResultsViewController_mInstructionsView;
    goto LABEL_24;
  }
  if (self->mInstructionsView == a3)
  {
    mInstructionsViewWidth = self->mInstructionsViewWidth;
    -[THNotesNoSearchResultsViewController p_getConstraint:onView:](self, "p_getConstraint:onView:", CFSTR("FirstLaunchViewStepOneVerticalSpace"), self->mStepOneLabel);
    v17 = v9 + v16;
    -[THNotesNoSearchResultsViewController p_getConstraint:onView:](self, "p_getConstraint:onView:", CFSTR("FirstLaunchViewStepTwoVerticalSpace"), self->mStepTwoLabel);
    v9 = v17 + v18;
    v19 = CFSTR("FirstLaunchViewStepThreeVerticalSpace");
    v20 = &OBJC_IVAR___THNotesNoSearchResultsViewController_mStepThreeLabel;
LABEL_24:
    -[THNotesNoSearchResultsViewController p_getConstraint:onView:](self, "p_getConstraint:onView:", v19, *(Class *)((char *)&self->super.super.super.isa + *v20));
    v9 = v9 + v25;
  }
  v26 = mInstructionsViewWidth;
  v27 = v9;
  result.height = v27;
  result.width = v26;
  return result;
}

- (UIView)noResultsView
{
  return &self->mNoResultsView->super;
}

- (UIView)firstLaunchView
{
  return &self->mFirstLaunchView->super;
}

- (unint64_t)chapterIndex
{
  return self->mChapterIndex;
}

- (unint64_t)results
{
  return self->mResults;
}

- (int)footerType
{
  return self->mFooterType;
}

- (int)messageType
{
  return self->mMessageType;
}

@end
