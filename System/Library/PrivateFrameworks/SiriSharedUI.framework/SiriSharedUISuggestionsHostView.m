@implementation SiriSharedUISuggestionsHostView

- (SiriSharedUISuggestionsHostView)initWithSuggestionsView:(id)a3
{
  id v4;
  SiriSharedUISuggestionsHostView *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SiriSharedUISuggestionsHostView;
  v5 = -[SiriSharedUISuggestionsHostView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
  {
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v6);

    -[SiriSharedUISuggestionsHostView setSuggestionsView:](v5, "setSuggestionsView:", v4);
    -[SiriSharedUISuggestionsHostView addSubview:](v5, "addSubview:", v4);
    -[SiriSharedUISuggestionsHostView _configureConstraints](v5, "_configureConstraints");
  }

  return v5;
}

- (void)_configureConstraints
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
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v13 = (void *)MEMORY[0x1E0CB3718];
  -[SiriSharedUISuggestionsHostView leadingAnchor](self, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUISuggestionsHostView suggestionsView](self, "suggestionsView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v17;
  -[SiriSharedUISuggestionsHostView trailingAnchor](self, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUISuggestionsHostView suggestionsView](self, "suggestionsView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v3;
  -[SiriSharedUISuggestionsHostView topAnchor](self, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUISuggestionsHostView suggestionsView](self, "suggestionsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v7;
  -[SiriSharedUISuggestionsHostView bottomAnchor](self, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUISuggestionsHostView suggestionsView](self, "suggestionsView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v12);

}

- (id)preferredAccessibilityElementToFocus
{
  return 0;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[SiriSharedUISuggestionsHostView suggestionsView](self, "suggestionsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;

  -[SiriSharedUISuggestionsHostView stackContainerDelegate](self, "stackContainerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stackableContentMaximumContainerWidth");
  v8 = v7;

  v9 = v8;
  v10 = v5;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)invalidateIntrinsicContentSize
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriSharedUISuggestionsHostView;
  -[SiriSharedUISuggestionsHostView invalidateIntrinsicContentSize](&v4, sel_invalidateIntrinsicContentSize);
  -[SiriSharedUISuggestionsHostView stackContainerDelegate](self, "stackContainerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUISuggestionsHostView intrinsicContentSize](self, "intrinsicContentSize");
  objc_msgSend(v3, "stackableContentWillUpdateLayout:withUpdatedContentSize:animated:", self, 1);

}

- (int64_t)attachmentType
{
  return self->attachmentType;
}

- (void)setAttachmentType:(int64_t)a3
{
  self->attachmentType = a3;
}

- (SiriSharedUIViewStackConstraints)stackConstraints
{
  return self->stackConstraints;
}

- (void)setStackConstraints:(id)a3
{
  objc_storeStrong((id *)&self->stackConstraints, a3);
}

- (SiriSharedUIStackableContentDelegate)stackContainerDelegate
{
  return (SiriSharedUIStackableContentDelegate *)objc_loadWeakRetained((id *)&self->stackContainerDelegate);
}

- (void)setStackContainerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->stackContainerDelegate, a3);
}

- (double)attachmentYOffset
{
  return self->attachmentYOffset;
}

- (void)setAttachmentYOffset:(double)a3
{
  self->attachmentYOffset = a3;
}

- (SiriSharedUIAnimationContext)animationContextForFrameAndLayoutUpdate
{
  return self->animationContextForFrameAndLayoutUpdate;
}

- (void)setAnimationContextForFrameAndLayoutUpdate:(id)a3
{
  objc_storeStrong((id *)&self->animationContextForFrameAndLayoutUpdate, a3);
}

- (UIView)suggestionsView
{
  return self->_suggestionsView;
}

- (void)setSuggestionsView:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsView, 0);
  objc_storeStrong((id *)&self->animationContextForFrameAndLayoutUpdate, 0);
  objc_destroyWeak((id *)&self->stackContainerDelegate);
  objc_storeStrong((id *)&self->stackConstraints, 0);
}

@end
