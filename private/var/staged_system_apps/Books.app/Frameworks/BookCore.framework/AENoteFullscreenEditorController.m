@implementation AENoteFullscreenEditorController

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[AENoteFullscreenEditorController releaseViews](self, "releaseViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIKeyboardWillShowNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, UIKeyboardWillHideNotification, 0);

  v5.receiver = self;
  v5.super_class = (Class)AENoteFullscreenEditorController;
  -[IMViewController dealloc](&v5, "dealloc");
}

- (void)releaseViews
{
  UIToolbar *toolbar;
  AEHighlightedTextLabel *highlightedTextLabel;
  AENoteFullscreenEditorController *v5;
  UIScrollView *scrollView;
  AENoteFullscreenEditorController *v7;
  UITextView *textView;
  IMPassthroughView *dimmingOverlayView;
  objc_super v10;

  toolbar = self->_toolbar;
  self->_toolbar = 0;

  highlightedTextLabel = self->_highlightedTextLabel;
  self->_highlightedTextLabel = 0;

  v5 = (AENoteFullscreenEditorController *)objc_claimAutoreleasedReturnValue(-[UIScrollView delegate](self->_scrollView, "delegate"));
  if (v5 == self)
    -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", 0);
  scrollView = self->_scrollView;
  self->_scrollView = 0;

  v7 = (AENoteFullscreenEditorController *)objc_claimAutoreleasedReturnValue(-[UITextView delegate](self->_textView, "delegate"));
  if (v7 == self)
    -[UITextView setDelegate:](self->_textView, "setDelegate:", 0);
  textView = self->_textView;
  self->_textView = 0;

  dimmingOverlayView = self->_dimmingOverlayView;
  self->_dimmingOverlayView = 0;

  v10.receiver = self;
  v10.super_class = (Class)AENoteFullscreenEditorController;
  -[IMViewController releaseViews](&v10, "releaseViews");
}

- (void)hide
{
  -[AENoteFullscreenEditorController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  IMPassthroughView *v6;
  void *v7;
  IMPassthroughView *v8;
  IMPassthroughView *dimmingOverlayView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AENoteFullscreenEditorController;
  -[IMViewController viewWillAppear:](&v17, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "keyboardWillShow:", UIKeyboardWillShowNotification, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "keyboardWillHide:", UIKeyboardWillHideNotification, 0);

  -[AENoteFullscreenEditorController updateScrollViewContent](self, "updateScrollViewContent");
  if (-[AENoteFullscreenEditorController shouldDim](self, "shouldDim"))
  {
    v6 = [IMPassthroughView alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController view](self, "view"));
    objc_msgSend(v7, "bounds");
    v8 = -[IMPassthroughView initWithFrame:](v6, "initWithFrame:");
    dimmingOverlayView = self->_dimmingOverlayView;
    self->_dimmingOverlayView = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController dimmingOverlayView](self, "dimmingOverlayView"));
    objc_msgSend(v10, "setAutoresizingMask:", 18);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.2));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController dimmingOverlayView](self, "dimmingOverlayView"));
    objc_msgSend(v12, "setBackgroundColor:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController dimmingOverlayView](self, "dimmingOverlayView"));
    objc_msgSend(v13, "setAcceptsHits:", 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController view](self, "view"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController dimmingOverlayView](self, "dimmingOverlayView"));
    objc_msgSend(v14, "addSubview:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v16, "willShowAnnotationEditor:") & 1) != 0)
    objc_msgSend(v16, "willShowAnnotationEditor:", self);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v5, "didShowAnnotationEditor:") & 1) != 0)
    objc_msgSend(v5, "didShowAnnotationEditor:", self);
  v7.receiver = self;
  v7.super_class = (Class)AENoteFullscreenEditorController;
  -[AENoteFullscreenEditorController viewDidAppear:](&v7, "viewDidAppear:", v3);
  if (-[AENoteFullscreenEditorController editsOnLaunch](self, "editsOnLaunch"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView"));
    objc_msgSend(v6, "becomeFirstResponder");

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AENoteFullscreenEditorController;
  -[AENoteFullscreenEditorController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  -[UITextView resignFirstResponder](self->_textView, "resignFirstResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "willHideAnnotationEditor:") & 1) != 0)
    objc_msgSend(v4, "willHideAnnotationEditor:", self);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v5, "didHideAnnotationEditor:") & 1) != 0)
    objc_msgSend(v5, "didHideAnnotationEditor:", self);
  v8.receiver = self;
  v8.super_class = (Class)AENoteFullscreenEditorController;
  -[IMViewController viewDidDisappear:](&v8, "viewDidDisappear:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, UIKeyboardWillShowNotification, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "removeObserver:name:object:", self, UIKeyboardWillHideNotification, 0);

}

- (unint64_t)supportedInterfaceOrientations
{
  return 26;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)AENoteFullscreenEditorController;
  v7 = a4;
  -[IMViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_11F198;
  v8[3] = &unk_28B8F0;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

- (void)_setupToolbarForMacCatalyst:(BOOL)a3
{
  id v4;
  double y;
  double width;
  double height;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  UILabel *dateLabel;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  UILabel *v59;
  AENoteFullscreenEditorController *v61;
  void *v62;
  _QWORD v63[7];

  v4 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v9 = IMCommonCoreBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Note_Editor_Title"), CFSTR("Note"), CFSTR("BCCommonCoreLocalizable")));
  objc_msgSend(v8, "setText:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleHeadline));
  objc_msgSend(v8, "setFont:", v12);

  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "sizeToFit");
  v13 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController annotation](self, "annotation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "annotationModificationDate"));
  v61 = self;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController annotation](self, "annotation"));
  v17 = v16;
  if (v15)
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "annotationModificationDate"));
  else
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "annotationCreationDate"));
  v19 = (void *)v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate mailLikeDescriptionFromDate:](NSDate, "mailLikeDescriptionFromDate:", v19));
  -[UILabel setText:](v13, "setText:", v20);

  v58 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate accessibleMailLikeDescriptionFromDate:](NSDate, "accessibleMailLikeDescriptionFromDate:", v19));
  -[UILabel setAccessibilityLabel:](v13, "setAccessibilityLabel:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleHeadline));
  -[UILabel setFont:](v13, "setFont:", v22);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel sizeToFit](v13, "sizeToFit");
  v23 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v23, "addSubview:", v8);
  objc_msgSend(v23, "addSubview:", v13);
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layoutMarginsGuide"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "leadingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v55));
  v63[0] = v54;
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "safeAreaLayoutGuide"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "topAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v51));
  v63[1] = v50;
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "safeAreaLayoutGuide"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "bottomAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v47));
  v63[2] = v46;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v13, "leadingAnchor"));
  v62 = v8;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, 5.0));
  v63[3] = v43;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v13, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layoutMarginsGuide"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "trailingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
  v63[4] = v39;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v13, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "safeAreaLayoutGuide"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));
  v63[5] = v27;
  v59 = v13;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v13, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "safeAreaLayoutGuide"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v30));
  v63[6] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v63, 7));
  objc_msgSend(v23, "addConstraints:", v32);

  v33 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", v23);
  v34 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v33, v34, 0));
  if (!a3)
  {
    v36 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, v61, "doneButtonPressed:");
    objc_msgSend(v35, "addObject:", v36);

  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController toolbar](v61, "toolbar"));
  objc_msgSend(v37, "setItems:", v35);

  dateLabel = v61->_dateLabel;
  v61->_dateLabel = v59;

}

- (AENoteFullscreenEditorController)initWithNibName:(id)a3 bundle:(id)a4
{
  AENoteFullscreenEditorController *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AENoteFullscreenEditorController;
  v4 = -[IMViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v6 = -[AENoteFullscreenEditorController registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v5, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v4;
}

- (void)viewDidLoad
{
  uint64_t v3;
  id v4;
  void *v5;
  UIScrollView *v6;
  UIScrollView *scrollView;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  AEHighlightedTextLabel *v29;
  double y;
  double width;
  double height;
  AEHighlightedTextLabel *v33;
  AEHighlightedTextLabel *highlightedTextLabel;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  UIView *v41;
  UIView *highlightColorBar;
  UITextView *v43;
  UITextView *textView;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  UIToolbar *v67;
  UIToolbar *toolbar;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  objc_super v118;
  _QWORD v119[10];
  void *v120;

  v118.receiver = self;
  v118.super_class = (Class)AENoteFullscreenEditorController;
  -[AENoteFullscreenEditorController viewDidLoad](&v118, "viewDidLoad");
  v3 = objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController highlightedTextFont](self, "highlightedTextFont"));
  if (!v3)
    v3 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
  v117 = (void *)v3;
  v4 = objc_alloc((Class)UIScrollView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController view](self, "view"));
  objc_msgSend(v5, "bounds");
  v6 = (UIScrollView *)objc_msgSend(v4, "initWithFrame:");
  scrollView = self->_scrollView;
  self->_scrollView = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController scrollView](self, "scrollView"));
  objc_msgSend(v8, "setDelegate:", self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController scrollView](self, "scrollView"));
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController scrollView](self, "scrollView"));
  objc_msgSend(v10, "setOpaque:", 1);

  -[AENoteFullscreenEditorController scrollViewScrollerInsets](self, "scrollViewScrollerInsets");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController scrollView](self, "scrollView"));
  objc_msgSend(v19, "setScrollIndicatorInsets:", v12, v14, v16, v18);

  -[AENoteFullscreenEditorController scrollViewScrollerInsets](self, "scrollViewScrollerInsets");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController scrollView](self, "scrollView"));
  objc_msgSend(v28, "setContentInset:", v21, v23, v25, v27);

  v29 = [AEHighlightedTextLabel alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v33 = -[AEHighlightedTextLabel initWithFrame:generateHighlight:generateHighlightAsynchronously:](v29, "initWithFrame:generateHighlight:generateHighlightAsynchronously:", 0, 0, CGRectZero.origin.x, y, width, height);
  highlightedTextLabel = self->_highlightedTextLabel;
  self->_highlightedTextLabel = v33;

  -[AEHighlightedTextLabel setUseSelectedText:](self->_highlightedTextLabel, "setUseSelectedText:", 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController highlightedTextLabel](self, "highlightedTextLabel"));
  objc_msgSend(v35, "setAutoresizingMask:", 34);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController annotation](self, "annotation"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController highlightedTextLabel](self, "highlightedTextLabel"));
  objc_msgSend(v37, "setAnnotation:", v36);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController highlightedTextLabel](self, "highlightedTextLabel"));
  objc_msgSend(v38, "setFont:", v3);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController highlightedTextLabel](self, "highlightedTextLabel"));
  objc_msgSend(v39, "setOpaque:", 1);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController highlightedTextLabel](self, "highlightedTextLabel"));
  objc_msgSend(v40, "setNumberOfLines:", 3);

  v41 = (UIView *)objc_alloc_init((Class)UIView);
  highlightColorBar = self->_highlightColorBar;
  self->_highlightColorBar = v41;

  v43 = (UITextView *)objc_alloc_init((Class)UITextView);
  textView = self->_textView;
  self->_textView = v43;

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView"));
  objc_msgSend(v45, "setAutoresizingMask:", 18);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView"));
  objc_msgSend(v46, "setScrollEnabled:", 0);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView"));
  objc_msgSend(v47, "setDelegate:", self);

  v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 15.0));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView"));
  objc_msgSend(v49, "setFont:", v48);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "layoutManager"));
  objc_msgSend(v51, "setDelegate:", self);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController annotation](self, "annotation"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "annotationNote"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView"));
  objc_msgSend(v54, "setText:", v53);

  v55 = IMCommonCoreBundle();
  v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("Note_Editor_Placeholder"), CFSTR("Add a note…"), CFSTR("BCCommonCoreLocalizable")));

  v57 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v116);
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView"));
  objc_msgSend(v58, "setAttributedPlaceholder:", v57);

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController scrollView](self, "scrollView"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView"));
  objc_msgSend(v59, "addSubview:", v60);

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController scrollView](self, "scrollView"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController highlightColorBar](self, "highlightColorBar"));
  objc_msgSend(v61, "addSubview:", v62);

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController scrollView](self, "scrollView"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController highlightedTextLabel](self, "highlightedTextLabel"));
  objc_msgSend(v63, "addSubview:", v64);

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController view](self, "view"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController scrollView](self, "scrollView"));
  objc_msgSend(v65, "addSubview:", v66);

  v67 = (UIToolbar *)objc_msgSend(objc_alloc((Class)UIToolbar), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  toolbar = self->_toolbar;
  self->_toolbar = v67;

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController toolbar](self, "toolbar"));
  objc_msgSend(v69, "sizeToFit");

  -[UIToolbar setTranslatesAutoresizingMaskIntoConstraints:](self->_toolbar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController toolbar](self, "toolbar"));
  objc_msgSend(v70, "setTranslucent:", 0);

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController toolbar](self, "toolbar"));
  objc_msgSend(v71, "setDelegate:", self);

  -[AENoteFullscreenEditorController _setupToolbarForMacCatalyst:](self, "_setupToolbarForMacCatalyst:", 0);
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController view](self, "view"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController toolbar](self, "toolbar"));
  objc_msgSend(v72, "addSubview:", v73);

  v74 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v74, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v72, "addSubview:", v74);
  objc_msgSend(v74, "setHidden:", 1);
  v75 = v74;
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "heightAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToConstant:", 0.0));
  v120 = v77;
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v120, 1));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v78);

  v115 = (void *)objc_claimAutoreleasedReturnValue(-[UIToolbar leftAnchor](self->_toolbar, "leftAnchor"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "leftAnchor"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "constraintEqualToAnchor:", v114));
  v119[0] = v113;
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[UIToolbar rightAnchor](self->_toolbar, "rightAnchor"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "rightAnchor"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "constraintEqualToAnchor:", v111));
  v119[1] = v110;
  v108 = (void *)objc_claimAutoreleasedReturnValue(-[UIToolbar topAnchor](self->_toolbar, "topAnchor"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "safeAreaLayoutGuide"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "topAnchor"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "constraintEqualToAnchor:", v107));
  v119[2] = v106;
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "safeAreaLayoutGuide"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "leadingAnchor"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToAnchor:", v103));
  v119[3] = v102;
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "safeAreaLayoutGuide"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "trailingAnchor"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintEqualToAnchor:", v99));
  v119[4] = v96;
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](self->_scrollView, "topAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[UIToolbar bottomAnchor](self->_toolbar, "bottomAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "constraintEqualToAnchor:", v94));
  v119[5] = v93;
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor"));
  v79 = v75;
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "topAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintEqualToAnchor:", v91));
  v119[6] = v90;
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "leadingAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "leadingAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "constraintEqualToAnchor:", v80));
  v119[7] = v81;
  v98 = v79;
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "trailingAnchor"));
  v97 = v72;
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "trailingAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToAnchor:", v83));
  v119[8] = v84;
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "bottomAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "bottomAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:", v86));
  v119[9] = v87;
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v119, 10));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v88);

  -[AENoteFullscreenEditorController updateScrollViewContent](self, "updateScrollViewContent");
  -[AENoteFullscreenEditorController _updateColors](self, "_updateColors");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AENoteFullscreenEditorController;
  -[AENoteFullscreenEditorController viewDidLayoutSubviews](&v13, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController toolbar](self, "toolbar"));
  objc_msgSend(v3, "sizeToFit");

  -[AENoteFullscreenEditorController updateScrollViewContent](self, "updateScrollViewContent");
  -[AENoteFullscreenEditorController scrollViewScrollerInsets](self, "scrollViewScrollerInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController scrollView](self, "scrollView"));
  objc_msgSend(v12, "setContentInset:", v5, v7, v9, v11);

}

- (id)keyCommands
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AENoteFullscreenEditorController;
  v2 = -[AENoteFullscreenEditorController keyCommands](&v10, "keyCommands");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", &stru_296430, 0, "doneButtonPressed:", CFSTR("\r"), 0x100000, 0));
  objc_msgSend(v7, "addObject:", v8);

  return v7;
}

- (void)setTheme:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AENoteFullscreenEditorController;
  -[IMViewController setTheme:](&v4, "setTheme:", a3);
  -[AENoteFullscreenEditorController _updateColors](self, "_updateColors");
}

- (void)_updateColors
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = (id)objc_claimAutoreleasedReturnValue(-[IMViewController themePage](self, "themePage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController annotation](self, "annotation"));
  v4 = objc_msgSend(v3, "annotationStyle");
  v5 = objc_msgSend(v27, "annotationPageTheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController annotation](self, "annotation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme themeForAnnotationStyle:pageTheme:isUnderline:](AEAnnotationTheme, "themeForAnnotationStyle:pageTheme:isUnderline:", v4, v5, objc_msgSend(v6, "annotationIsUnderline")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "backgroundColorForTraitEnvironment:", self));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController viewIfLoaded](self, "viewIfLoaded"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "keyColor"));
  objc_msgSend(v9, "setTintColor:", v10);

  objc_msgSend(v9, "setBackgroundColor:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController scrollView](self, "scrollView"));
  objc_msgSend(v11, "setBackgroundColor:", v8);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "primaryTextColor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController highlightedTextLabel](self, "highlightedTextLabel"));
  objc_msgSend(v13, "setTextColor:", v12);
  objc_msgSend(v13, "setShouldInvertContent:", objc_msgSend(v27, "shouldInvertContent"));
  objc_msgSend(v13, "setAnnotationBlendMode:", objc_msgSend(v27, "annotationBlendMode"));
  objc_msgSend(v13, "setHighlightedAnnotationBlendMode:", objc_msgSend(v27, "highlightedAnnotationBlendMode"));
  objc_msgSend(v13, "setPageTheme:", objc_msgSend(v27, "annotationPageTheme"));
  objc_msgSend(v13, "setBackgroundColor:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView"));
  objc_msgSend(v14, "setBackgroundColor:", v8);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView"));
  objc_msgSend(v15, "setTextColor:", v12);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "notesSidebarBarColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewController theme](self, "theme"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bkaxAdjustedForIncreaseContrastAdjustingDarker:", objc_msgSend(v17, "shouldInvertContent") ^ 1));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController highlightColorBar](self, "highlightColorBar"));
  objc_msgSend(v19, "setBackgroundColor:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController toolbar](self, "toolbar"));
  objc_msgSend(v20, "setBarTintColor:", v8);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection"));
  v22 = (char *)objc_msgSend(v21, "accessibilityContrast");

  if (v22 == (_BYTE *)&dword_0 + 1)
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "primaryTextColor"));
  else
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "secondaryTextColor"));
  v24 = (void *)v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController dateLabel](self, "dateLabel"));
  objc_msgSend(v25, "setTextColor:", v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView"));
  objc_msgSend(v27, "stylizeKeyboard:", v26);

}

- (int64_t)positionForBar:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController toolbar](self, "toolbar"));

  if (v5 == v4)
    return 3;
  else
    return 0;
}

- (double)layoutManager:(id)a3 lineSpacingAfterGlyphAtIndex:(unint64_t)a4 withProposedLineFragmentRect:(CGRect)a5
{
  return 5.0;
}

- (void)doneButtonPressed:(id)a3
{
  -[AENoteFullscreenEditorController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &stru_291998);
}

- (void)textViewDidChangeSelection:(id)a3
{
  -[AENoteFullscreenEditorController p_revealTextViewCursorAnimated:](self, "p_revealTextViewCursorAnimated:", 1);
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController annotation](self, "annotation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));

  objc_msgSend(v7, "editorController:editedAnnotation:toText:", self, v5, v6);
}

- (void)textViewDidChange:(id)a3
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
  void *v14;
  double v15;
  double v16;
  void *v17;
  float v18;
  float v19;
  _QWORD v20[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView", a3));
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView"));
  objc_msgSend(v13, "sizeToFit");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView"));
  objc_msgSend(v14, "frame");
  v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView"));
  objc_msgSend(v17, "setFrame:", v6, v8, v10, v12);

  v18 = v12;
  v19 = v16;
  if (vabds_f32(v18, v19) >= 0.01)
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[AENoteFullscreenEditorController updateScrollViewContent](self, "updateScrollViewContent");
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_120A08;
    v20[3] = &unk_28B960;
    v20[4] = self;
    +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v20);
    +[CATransaction commit](CATransaction, "commit");
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView", a3));
  objc_msgSend(v3, "resignFirstResponder");

}

- (void)keyboardWillShow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  _QWORD v52[5];
  _QWORD v53[9];
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v4 = a3;
  if (!-[AENoteFullscreenEditorController keyboardVisible](self, "keyboardVisible"))
  {
    -[AENoteFullscreenEditorController setKeyboardVisible:](self, "setKeyboardVisible:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", UIKeyboardFrameEndUserInfoKey));
    objc_msgSend(v6, "CGRectValue");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController view](self, "view"));
    objc_msgSend(v15, "convertRect:fromView:", 0, v8, v10, v12, v14);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "valueForKey:", UIKeyboardAnimationCurveUserInfoKey));
    v26 = objc_msgSend(v25, "integerValue");

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "valueForKey:", UIKeyboardAnimationDurationUserInfoKey));
    objc_msgSend(v28, "doubleValue");
    v51 = v29;

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController scrollView](self, "scrollView"));
    objc_msgSend(v30, "frame");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;

    v54.origin.x = v32;
    v54.origin.y = v34;
    v54.size.width = v36;
    v54.size.height = v38;
    v57.origin.x = v17;
    v57.origin.y = v19;
    v57.size.width = v21;
    v57.size.height = v23;
    v55 = CGRectIntersection(v54, v57);
    x = v55.origin.x;
    y = v55.origin.y;
    width = v55.size.width;
    height = v55.size.height;
    -[AENoteFullscreenEditorController scrollViewScrollerInsets](self, "scrollViewScrollerInsets");
    v44 = v43;
    v46 = v45;
    v48 = v47;
    v50 = v49;
    v56.origin.x = x;
    v56.origin.y = y;
    v56.size.width = width;
    v56.size.height = height;
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_120CAC;
    v53[3] = &unk_2919C0;
    v53[4] = self;
    v53[5] = v44;
    v53[6] = v46;
    *(double *)&v53[7] = v48 + CGRectGetHeight(v56);
    v53[8] = v50;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_120D40;
    v52[3] = &unk_28D678;
    v52[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", (_QWORD)v26 << 16, v53, v52, v51, 0.0);
  }

}

- (void)keyboardWillHide:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[9];

  v4 = a3;
  if (-[AENoteFullscreenEditorController keyboardVisible](self, "keyboardVisible"))
  {
    -[AENoteFullscreenEditorController setKeyboardVisible:](self, "setKeyboardVisible:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", UIKeyboardAnimationCurveUserInfoKey));
    v7 = objc_msgSend(v6, "integerValue");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", UIKeyboardAnimationDurationUserInfoKey));
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    -[AENoteFullscreenEditorController scrollViewScrollerInsets](self, "scrollViewScrollerInsets");
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_120E9C;
    v17[3] = &unk_2919C0;
    v17[4] = self;
    v17[5] = v12;
    v17[6] = v13;
    v17[7] = v14;
    v17[8] = v15;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_120F30;
    v16[3] = &unk_28D678;
    v16[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", (_QWORD)v7 << 16, v17, v16, v11, 0.0);
  }

}

- (void)updateScrollViewContent
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;

  -[AENoteFullscreenEditorController highlightedTextLabelFrame](self, "highlightedTextLabelFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController highlightedTextLabel](self, "highlightedTextLabel"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[AENoteFullscreenEditorController highlightColorBarFrame](self, "highlightColorBarFrame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController highlightColorBar](self, "highlightColorBar"));
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  -[AENoteFullscreenEditorController updateTextViewFrame](self, "updateTextViewFrame");
  -[AENoteFullscreenEditorController scrollViewContentSize](self, "scrollViewContentSize");
  v22 = v21;
  v24 = v23;
  v25 = (id)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController scrollView](self, "scrollView"));
  objc_msgSend(v25, "setContentSize:", v22, v24);

}

- (UIEdgeInsets)scrollViewScrollerInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[AENoteFullscreenEditorController contentInsets](self, "contentInsets");
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGRect)highlightedTextLabelFrame
{
  CGFloat height;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double Width;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect v34;
  CGRect v35;
  CGRect result;

  height = CGRectZero.size.height;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController scrollView](self, "scrollView"));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[AENoteFullscreenEditorController contentInsets](self, "contentInsets");
  v14 = v13;
  v16 = v15 + 4.0 + 10.0;
  v34.origin.x = v6;
  v34.origin.y = v8;
  v34.size.width = v10;
  v34.size.height = v12;
  v17 = CGRectGetWidth(v34) - v16 - v14;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController bc_windowForViewController](self, "bc_windowForViewController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "windowScene"));
  if ((char *)objc_msgSend(v19, "interfaceOrientation") - 1 >= (_BYTE *)&dword_0 + 2)
    v20 = 13.0;
  else
    v20 = 20.0;

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController highlightedTextLabel](self, "highlightedTextLabel"));
  v22 = (void *)objc_opt_class(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController annotation](self, "annotation"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController highlightedTextLabel](self, "highlightedTextLabel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "font"));
  v35.origin.x = v16;
  v35.origin.y = v20;
  v35.size.width = v17;
  v35.size.height = height;
  Width = CGRectGetWidth(v35);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController highlightedTextLabel](self, "highlightedTextLabel"));
  objc_msgSend(v22, "sizeForAnnotation:font:width:numberOfLines:useSelectedText:", v23, v25, objc_msgSend(v27, "numberOfLines"), 1, Width);
  v29 = v28;

  v30 = v16;
  v31 = v20;
  v32 = v17;
  v33 = v29;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (CGRect)highlightColorBarFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController highlightedTextLabel](self, "highlightedTextLabel"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  -[AENoteFullscreenEditorController contentInsets](self, "contentInsets");
  v9 = v8;
  v10 = 4.0;
  v11 = v5;
  v12 = v7;
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v11;
  result.origin.x = v9;
  return result;
}

- (UIEdgeInsets)contentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 16.0;
  v4 = 15.0;
  v5 = 16.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)updateTextViewFrame
{
  double v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  double Height;
  double v34;
  double v35;
  id v36;
  id v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  -[AENoteFullscreenEditorController contentInsets](self, "contentInsets");
  v35 = v3;
  v36 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController highlightedTextLabel](self, "highlightedTextLabel"));
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController scrollView](self, "scrollView"));
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v34 = v7 + -5.0;
  v38.origin.x = v7;
  v38.origin.y = v9;
  v38.size.width = v11;
  v38.size.height = v13;
  v23 = CGRectGetMaxY(v38) + 6.0;
  v39.origin.x = v16;
  v39.origin.y = v18;
  v39.size.width = v20;
  v39.size.height = v22;
  v24 = CGRectGetHeight(v39) - v23;
  -[AENoteFullscreenEditorController scrollViewScrollerInsets](self, "scrollViewScrollerInsets");
  v26 = v24 - v25;
  -[AENoteFullscreenEditorController scrollViewScrollerInsets](self, "scrollViewScrollerInsets");
  v28 = v26 - v27 - v35;
  v40.origin.x = v16;
  v40.origin.y = v18;
  v40.size.width = v20;
  v40.size.height = v22;
  v29 = CGRectGetWidth(v40) - v34 - *(double *)&v36;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView"));
  objc_msgSend(v30, "setFrame:", v34, v23, v29, v28);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView"));
  objc_msgSend(v31, "sizeToFit");

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView"));
  objc_msgSend(v32, "frame");
  Height = CGRectGetHeight(v41);

  if (v28 >= Height)
    Height = v28;
  v37 = (id)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView"));
  objc_msgSend(v37, "setFrame:", v34, v23, v29, Height);

}

- (CGSize)scrollViewContentSize
{
  void *v3;
  CGFloat MaxY;
  void *v5;
  double Width;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;
  CGRect v16;
  CGRect v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView"));
  objc_msgSend(v3, "frame");
  MaxY = CGRectGetMaxY(v16);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController view](self, "view"));
  objc_msgSend(v5, "bounds");
  Width = CGRectGetWidth(v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController view](self, "view"));
  objc_msgSend(v7, "safeAreaInsets");
  v9 = Width - v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController view](self, "view"));
  objc_msgSend(v10, "safeAreaInsets");
  v12 = v9 - v11;

  v13 = v12;
  v14 = MaxY;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)p_ensureTextViewLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textContainer"));
  objc_msgSend(v4, "ensureLayoutForTextContainer:", v6);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView"));
  objc_msgSend(v7, "layoutIfNeeded");

}

- (void)p_revealTextViewCursorAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
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
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  id v29;

  v3 = a3;
  v29 = (id)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController textView](self, "textView"));
  if (objc_msgSend(v29, "isFirstResponder"))
  {
    objc_msgSend(v29, "selectedRange");
    if (!v5)
    {
      -[AENoteFullscreenEditorController p_ensureTextViewLayout](self, "p_ensureTextViewLayout");
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "selectedTextRange"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "start"));
      objc_msgSend(v29, "caretRectForPosition:", v7);
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "font"));
      objc_msgSend(v16, "lineHeight");
      v18 = v15 + v17;

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController scrollView](self, "scrollView"));
      objc_msgSend(v19, "convertRect:fromView:", v29, v9, v11, v13, v18);
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorController scrollView](self, "scrollView"));
      objc_msgSend(v28, "scrollRectToVisible:animated:", v3, v21, v23, v25, v27);

    }
  }

}

- (AEAnnotation)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
  objc_storeStrong((id *)&self->_annotation, a3);
}

- (AEAnnotationTheme)annotationTheme
{
  return self->_annotationTheme;
}

- (void)setAnnotationTheme:(id)a3
{
  objc_storeStrong((id *)&self->_annotationTheme, a3);
}

- (AEAnnotationEditorDelegate)delegate
{
  return (AEAnnotationEditorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIFont)highlightedTextFont
{
  return self->_highlightedTextFont;
}

- (void)setHighlightedTextFont:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedTextFont, a3);
}

- (BOOL)editsOnLaunch
{
  return self->_editsOnLaunch;
}

- (void)setEditsOnLaunch:(BOOL)a3
{
  self->_editsOnLaunch = a3;
}

- (BOOL)shouldDim
{
  return self->_shouldDim;
}

- (void)setShouldDim:(BOOL)a3
{
  self->_shouldDim = a3;
}

- (IMPassthroughView)dimmingOverlayView
{
  return self->_dimmingOverlayView;
}

- (void)setDimmingOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingOverlayView, a3);
}

- (AEHighlightedTextLabel)highlightedTextLabel
{
  return self->_highlightedTextLabel;
}

- (void)setHighlightedTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedTextLabel, a3);
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (UIView)highlightColorBar
{
  return self->_highlightColorBar;
}

- (void)setHighlightColorBar:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColorBar, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (BOOL)keyboardVisible
{
  return self->_keyboardVisible;
}

- (void)setKeyboardVisible:(BOOL)a3
{
  self->_keyboardVisible = a3;
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (void)setToolbar:(id)a3
{
  objc_storeStrong((id *)&self->_toolbar, a3);
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dateLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_highlightColorBar, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_highlightedTextLabel, 0);
  objc_storeStrong((id *)&self->_dimmingOverlayView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_annotationTheme, 0);
  objc_storeStrong((id *)&self->_highlightedTextFont, 0);
  objc_storeStrong((id *)&self->_annotation, 0);
}

@end
