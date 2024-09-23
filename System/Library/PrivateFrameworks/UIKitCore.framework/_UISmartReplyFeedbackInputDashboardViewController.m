@implementation _UISmartReplyFeedbackInputDashboardViewController

- (_UISmartReplyFeedbackInputDashboardViewController)init
{
  _UISmartReplyFeedbackInputDashboardViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UISmartReplyFeedbackInputDashboardViewController;
  v2 = -[UIViewController init](&v10, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    -[_UISmartReplyFeedbackInputDashboardViewController makeFeedbackLabelWithText:](v2, "makeFeedbackLabelWithText:", CFSTR("Share Feedback"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISmartReplyFeedbackInputDashboardViewController setFeedbackLabel:](v2, "setFeedbackLabel:", v3);

    +[UIAction actionWithHandler:](UIAction, "actionWithHandler:", &__block_literal_global_506);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISmartReplyFeedbackInputDashboardViewController makeButtonWithSystemImageNamed:action:](v2, "makeButtonWithSystemImageNamed:action:", CFSTR("hand.thumbsdown"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISmartReplyFeedbackInputDashboardViewController setThumbsDownButton:](v2, "setThumbsDownButton:", v5);

    +[UIAction actionWithHandler:](UIAction, "actionWithHandler:", &__block_literal_global_7_9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISmartReplyFeedbackInputDashboardViewController makeButtonWithSystemImageNamed:action:](v2, "makeButtonWithSystemImageNamed:action:", CFSTR("hand.thumbsup"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISmartReplyFeedbackInputDashboardViewController setThumbsUpButton:](v2, "setThumbsUpButton:", v7);

    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)viewDidLoad
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
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
  objc_super v54;
  _QWORD v55[10];

  v55[8] = *MEMORY[0x1E0C80C00];
  v54.receiver = self;
  v54.super_class = (Class)_UISmartReplyFeedbackInputDashboardViewController;
  -[UIViewController viewDidLoad](&v54, sel_viewDidLoad);
  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISmartReplyFeedbackInputDashboardViewController thumbsDownButton](self, "thumbsDownButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[UIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISmartReplyFeedbackInputDashboardViewController feedbackLabel](self, "feedbackLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[UIViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISmartReplyFeedbackInputDashboardViewController thumbsUpButton](self, "thumbsUpButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[_UISmartReplyFeedbackInputDashboardViewController thumbsDownButton](self, "thumbsDownButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[_UISmartReplyFeedbackInputDashboardViewController feedbackLabel](self, "feedbackLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[_UISmartReplyFeedbackInputDashboardViewController thumbsUpButton](self, "thumbsUpButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISmartReplyFeedbackInputDashboardViewController feedbackLabel](self, "feedbackLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "centerYAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "centerYAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v48;
  -[_UISmartReplyFeedbackInputDashboardViewController feedbackLabel](self, "feedbackLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "centerXAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "centerXAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v43;
  -[_UISmartReplyFeedbackInputDashboardViewController thumbsUpButton](self, "thumbsUpButton");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISmartReplyFeedbackInputDashboardViewController feedbackLabel](self, "feedbackLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, -0.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v38;
  -[_UISmartReplyFeedbackInputDashboardViewController thumbsUpButton](self, "thumbsUpButton");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "centerYAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISmartReplyFeedbackInputDashboardViewController feedbackLabel](self, "feedbackLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "centerYAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v33;
  -[_UISmartReplyFeedbackInputDashboardViewController thumbsUpButton](self, "thumbsUpButton");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "heightAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "heightAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v28;
  -[_UISmartReplyFeedbackInputDashboardViewController thumbsDownButton](self, "thumbsDownButton");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISmartReplyFeedbackInputDashboardViewController feedbackLabel](self, "feedbackLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, 0.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v23;
  -[_UISmartReplyFeedbackInputDashboardViewController thumbsDownButton](self, "thumbsDownButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "centerYAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISmartReplyFeedbackInputDashboardViewController feedbackLabel](self, "feedbackLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "centerYAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v55[6] = v15;
  -[_UISmartReplyFeedbackInputDashboardViewController thumbsDownButton](self, "thumbsDownButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "heightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "heightAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v55[7] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "addObjectsFromArray:", v21);

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v53);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UISmartReplyFeedbackInputDashboardViewController;
  -[UIViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportSmartReplyFeedbackUIWasPresented");

  UIFeedbackServiceLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_INFO, "_UISmartReplyFeedbackInputDashboardViewController viewDidAppear", v5, 2u);
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  NSObject *v3;
  uint8_t v4[16];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UISmartReplyFeedbackInputDashboardViewController;
  -[UIViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  UIFeedbackServiceLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_INFO, "_UISmartReplyFeedbackInputDashboardViewController viewDidDisappear", v4, 2u);
  }

}

- (id)makeFeedbackLabelWithText:(id)a3
{
  id v3;
  UILabel *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(UILabel);
  objc_msgSend(off_1E167A828, "systemFontOfSize:", 16.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v4, "setFont:", v5);

  -[UILabel setText:](v4, "setText:", v3);
  +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v4, "setTextColor:", v6);

  -[UILabel setTextAlignment:](v4, "setTextAlignment:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](v4, "setAdjustsFontSizeToFitWidth:", 1);
  return v4;
}

- (id)makeButtonWithSystemImageNamed:(id)a3 action:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleBody"), -1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 4, 20.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationByApplyingConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentInsets:", 5.0, 20.0, 5.0, 20.0);
  objc_msgSend(v11, "setImage:", v10);
  +[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4
{
  return 1;
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  return -1.0;
}

- (UILabel)feedbackLabel
{
  return self->_feedbackLabel;
}

- (void)setFeedbackLabel:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackLabel, a3);
}

- (UIButton)thumbsDownButton
{
  return self->_thumbsDownButton;
}

- (void)setThumbsDownButton:(id)a3
{
  objc_storeStrong((id *)&self->_thumbsDownButton, a3);
}

- (UIButton)thumbsUpButton
{
  return self->_thumbsUpButton;
}

- (void)setThumbsUpButton:(id)a3
{
  objc_storeStrong((id *)&self->_thumbsUpButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbsUpButton, 0);
  objc_storeStrong((id *)&self->_thumbsDownButton, 0);
  objc_storeStrong((id *)&self->_feedbackLabel, 0);
  objc_storeStrong((id *)&self->customView, 0);
}

@end
