@implementation TUISuggestionCandidateCell

- (void)commonInit
{
  id v3;
  UIImageView *v4;
  UIImageView *iconImageView;
  void *v6;
  id v7;
  UILabel *v8;
  UILabel *textLabel;
  void *v10;
  UILayoutGuide *v11;
  UILayoutGuide *paddedContainer;
  void *v13;
  UILayoutGuide *v14;
  UILayoutGuide *centeredContainer;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *topPaddingConstraint;
  void *v22;
  void *v23;
  void *v24;
  NSLayoutConstraint *v25;
  NSLayoutConstraint *leftPaddingConstraint;
  void *v27;
  void *v28;
  void *v29;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *bottomPaddingConstraint;
  void *v32;
  void *v33;
  void *v34;
  NSLayoutConstraint *v35;
  NSLayoutConstraint *rightPaddingConstraint;
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
  NSLayoutConstraint *v51;
  NSLayoutConstraint *paddingBetweenConstraint;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;

  v3 = objc_alloc(MEMORY[0x1E0DC3890]);
  v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  iconImageView = self->_iconImageView;
  self->_iconImageView = v4;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[TUISuggestionCandidateCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_iconImageView);

  v7 = objc_alloc(MEMORY[0x1E0DC3990]);
  -[TUISuggestionCandidateCell bounds](self, "bounds");
  v8 = (UILabel *)objc_msgSend(v7, "initWithFrame:");
  textLabel = self->_textLabel;
  self->_textLabel = v8;

  -[UILabel setTextAlignment:](self->_textLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_textLabel, "setNumberOfLines:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[TUISuggestionCandidateCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_textLabel);

  v11 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
  paddedContainer = self->_paddedContainer;
  self->_paddedContainer = v11;

  -[TUISuggestionCandidateCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addLayoutGuide:", self->_paddedContainer);

  v14 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
  centeredContainer = self->_centeredContainer;
  self->_centeredContainer = v14;

  -[TUISuggestionCandidateCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addLayoutGuide:", self->_centeredContainer);

  -[UILayoutGuide topAnchor](self->_paddedContainer, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISuggestionCandidateCell contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topPaddingConstraint = self->_topPaddingConstraint;
  self->_topPaddingConstraint = v20;

  -[UILayoutGuide leftAnchor](self->_paddedContainer, "leftAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISuggestionCandidateCell contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leftAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v24);
  v25 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  leftPaddingConstraint = self->_leftPaddingConstraint;
  self->_leftPaddingConstraint = v25;

  -[UILayoutGuide bottomAnchor](self->_paddedContainer, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISuggestionCandidateCell contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v29);
  v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  bottomPaddingConstraint = self->_bottomPaddingConstraint;
  self->_bottomPaddingConstraint = v30;

  -[UILayoutGuide rightAnchor](self->_paddedContainer, "rightAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISuggestionCandidateCell contentView](self, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "rightAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v34);
  v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  rightPaddingConstraint = self->_rightPaddingConstraint;
  self->_rightPaddingConstraint = v35;

  -[NSLayoutConstraint setActive:](self->_topPaddingConstraint, "setActive:", 1);
  -[NSLayoutConstraint setActive:](self->_leftPaddingConstraint, "setActive:", 1);
  -[NSLayoutConstraint setActive:](self->_bottomPaddingConstraint, "setActive:", 1);
  -[NSLayoutConstraint setActive:](self->_rightPaddingConstraint, "setActive:", 1);
  -[UILayoutGuide centerXAnchor](self->_centeredContainer, "centerXAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide centerXAnchor](self->_paddedContainer, "centerXAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setActive:", 1);

  -[UILayoutGuide centerYAnchor](self->_centeredContainer, "centerYAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide centerYAnchor](self->_paddedContainer, "centerYAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setActive:", 1);

  -[UIImageView leadingAnchor](self->_iconImageView, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_centeredContainer, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setActive:", 1);

  -[UIImageView centerYAnchor](self->_iconImageView, "centerYAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide centerYAnchor](self->_centeredContainer, "centerYAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setActive:", 1);

  -[UILabel leadingAnchor](self->_textLabel, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView trailingAnchor](self->_iconImageView, "trailingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v50);
  v51 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  paddingBetweenConstraint = self->_paddingBetweenConstraint;
  self->_paddingBetweenConstraint = v51;

  -[NSLayoutConstraint setActive:](self->_paddingBetweenConstraint, "setActive:", 1);
  -[UILabel trailingAnchor](self->_textLabel, "trailingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_centeredContainer, "trailingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setActive:", 1);

  -[UILabel centerYAnchor](self->_textLabel, "centerYAnchor");
  v58 = (id)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide centerYAnchor](self->_centeredContainer, "centerYAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setActive:", 1);

}

- (TUISuggestionCandidateCell)initWithFrame:(CGRect)a3
{
  TUISuggestionCandidateCell *v3;
  TUISuggestionCandidateCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUISuggestionCandidateCell;
  v3 = -[TUICandidateBaseCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TUISuggestionCandidateCell commonInit](v3, "commonInit");
  return v4;
}

- (TUISuggestionCandidateCell)initWithCoder:(id)a3
{
  TUISuggestionCandidateCell *v3;
  TUISuggestionCandidateCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUISuggestionCandidateCell;
  v3 = -[TUISuggestionCandidateCell initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[TUISuggestionCandidateCell commonInit](v3, "commonInit");
  return v4;
}

- (void)setCandidate:(id)a3
{
  TIKeyboardCandidate *v5;
  TIKeyboardCandidate *candidate;
  char v7;
  TIKeyboardCandidate *v8;

  v5 = (TIKeyboardCandidate *)a3;
  candidate = self->_candidate;
  if (candidate != v5)
  {
    v8 = v5;
    v7 = -[TIKeyboardCandidate isEqual:](candidate, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_candidate, a3);
      -[TUISuggestionCandidateCell updateLabel](self, "updateLabel");
      v5 = v8;
    }
  }

}

- (void)setStyle:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v7;

  v4 = a3;
  -[TUICandidateBaseCell style](self, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)TUISuggestionCandidateCell;
    -[TUICandidateBaseCell setStyle:](&v7, sel_setStyle_, v4);
    -[TUISuggestionCandidateCell updateLabel](self, "updateLabel");
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUISuggestionCandidateCell;
  -[TUICandidateBaseCell layoutSubviews](&v3, sel_layoutSubviews);
  -[TUISuggestionCandidateCell updateLabel](self, "updateLabel");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUISuggestionCandidateCell;
  -[TUISuggestionCandidateCell didMoveToWindow](&v3, sel_didMoveToWindow);
  -[TUISuggestionCandidateCell setNeedsLayout](self, "setNeedsLayout");
}

- (id)textSuggestion
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[TUISuggestionCandidateCell candidate](self, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[TUISuggestionCandidateCell candidate](self, "candidate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textSuggestion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)headerText
{
  void *v2;
  void *v3;

  -[TUISuggestionCandidateCell textSuggestion](self, "textSuggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "headerText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bodyText
{
  void *v2;
  void *v3;

  -[TUISuggestionCandidateCell textSuggestion](self, "textSuggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)image
{
  void *v2;
  void *v3;

  -[TUISuggestionCandidateCell textSuggestion](self, "textSuggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateLabel
{
  void *v2;
  __CFString *v3;
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
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  void *v40;
  uint64_t v41;
  BOOL v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  id v67;
  const __CFString *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[3];

  v84[2] = *MEMORY[0x1E0C80C00];
  -[TUICandidateBaseCell style](self, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extraCellPadding");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[TUISuggestionCandidateCell topPaddingConstraint](self, "topPaddingConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setConstant:", v7);

  -[TUISuggestionCandidateCell leftPaddingConstraint](self, "leftPaddingConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setConstant:", v9);

  -[TUISuggestionCandidateCell bottomPaddingConstraint](self, "bottomPaddingConstraint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setConstant:", v11);

  -[TUISuggestionCandidateCell rightPaddingConstraint](self, "rightPaddingConstraint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setConstant:", v13);

  v18 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  -[TUISuggestionCandidateCell headerText](self, "headerText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISuggestionCandidateCell bodyText](self, "bodyText");
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    -[TUISuggestionCandidateCell textLabel](self, "textLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAttributedText:", 0);

    goto LABEL_30;
  }
  v21 = (void *)v20;
  -[TUICandidateBaseCell style](self, "style");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "textColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v25 = v23;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  v27 = v25;

  -[TUISuggestionCandidateCell bounds](self, "bounds");
  v29 = v28 - v9 - v13;
  -[TUICandidateBaseCell style](self, "style");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "minimumCellPadding");
  v32 = v29 + v31 * -2.0;

  v33 = 0x1E0DC3000uLL;
  v34 = 0x1E0C99000;
  if (!v19)
  {
    v37 = *MEMORY[0x1E0DC32A0];
    v38 = *MEMORY[0x1E0DC32A8];
    goto LABEL_20;
  }
  -[TUISuggestionCandidateCell textSuggestion](self, "textSuggestion");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISuggestionCandidateCell candidate](self, "candidate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v35;
  if ((objc_msgSend(v36, "customInfoType") & 0x18) != 0)
  {

LABEL_11:
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "userInterfaceIdiom");

    v42 = (v41 & 0xFFFFFFFFFFFFFFFBLL) == 1;
    v43 = 14.0;
    v44 = 12.0;
    goto LABEL_12;
  }
  v39 = objc_msgSend(v35, "displayStylePlain");

  if ((v39 & 1) != 0)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v77, "userInterfaceIdiom");

  v42 = (v78 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  v43 = 12.0;
  v44 = 11.0;
LABEL_12:
  if (v42)
    v45 = v44;
  else
    v45 = v43;
  -[TUISuggestionCandidateCell window](self, "window", v43);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "interfaceOrientation");

  v37 = *MEMORY[0x1E0DC32A0];
  v83[0] = *MEMORY[0x1E0DC32A0];
  objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:", v45);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = *MEMORY[0x1E0DC32A8];
  v83[1] = *MEMORY[0x1E0DC32A8];
  v84[0] = v47;
  v80 = v27;
  v84[1] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUICandidateBaseCell style](self, "style");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v50 = v18;
    -[TUICandidateBaseCell style](self, "style");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "suggestionCandidateHeaderFontAttributes");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v52)
    {
      v18 = v50;
      v33 = 0x1E0DC3000;
      goto LABEL_19;
    }
    -[TUICandidateBaseCell style](self, "style");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "suggestionCandidateHeaderFontAttributes");
    v53 = objc_claimAutoreleasedReturnValue();

    v48 = (void *)v53;
    v18 = v50;
    v33 = 0x1E0DC3000uLL;
  }

LABEL_19:
  objc_msgSend(v19, "tui_centerTruncatedStringWithAttributes:fittingWidth:", v48, v32);
  v54 = objc_claimAutoreleasedReturnValue();

  v55 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v54, CFSTR("\n"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)objc_msgSend(v55, "initWithString:attributes:", v56, v48);

  objc_msgSend(v18, "appendAttributedString:", v57);
  v19 = (void *)v54;
  v27 = v80;
  v34 = 0x1E0C99000uLL;
LABEL_20:
  objc_msgSend(*(id *)(v33 + 1800), "currentDevice");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "userInterfaceIdiom");

  v60 = 16.0;
  if ((v59 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v60 = 14.0;
  v81[0] = v37;
  objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v81[1] = v38;
  v82[0] = v61;
  v82[1] = v27;
  objc_msgSend(*(id *)(v34 + 3456), "dictionaryWithObjects:forKeys:count:", v82, v81, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUICandidateBaseCell style](self, "style");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v63 = v27;
    -[TUICandidateBaseCell style](self, "style");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "suggestionCandidateBodyFontAttributes");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v65)
    {
      v27 = v63;
      goto LABEL_26;
    }
    -[TUICandidateBaseCell style](self, "style");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "suggestionCandidateBodyFontAttributes");
    v66 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v66;
    v27 = v63;
  }

LABEL_26:
  objc_msgSend(v21, "tui_centerTruncatedStringWithAttributes:fittingWidth:", v2, v32);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v67 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v3)
    v68 = v3;
  else
    v68 = &stru_1E24FC6C0;
  v69 = (void *)objc_msgSend(v67, "initWithString:attributes:", v68, v2);
  objc_msgSend(v18, "appendAttributedString:", v69);
  -[TUISuggestionCandidateCell textLabel](self, "textLabel");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setAttributedText:", v18);

LABEL_30:
  -[TUISuggestionCandidateCell image](self, "image");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISuggestionCandidateCell iconImageView](self, "iconImageView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setImage:", v71);

  -[TUISuggestionCandidateCell textLabel](self, "textLabel");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "text");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (v74)
  {
    -[TUISuggestionCandidateCell iconImageView](self, "iconImageView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "image");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v75 = 10.0;
    else
      v75 = 0.0;
  }
  else
  {
    v75 = 0.0;
  }
  -[TUISuggestionCandidateCell paddingBetweenConstraint](self, "paddingBetweenConstraint");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setConstant:", v75);

  if (v74)
  {

  }
}

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (UILayoutGuide)paddedContainer
{
  return self->_paddedContainer;
}

- (void)setPaddedContainer:(id)a3
{
  objc_storeStrong((id *)&self->_paddedContainer, a3);
}

- (UILayoutGuide)centeredContainer
{
  return self->_centeredContainer;
}

- (void)setCenteredContainer:(id)a3
{
  objc_storeStrong((id *)&self->_centeredContainer, a3);
}

- (NSLayoutConstraint)paddingBetweenConstraint
{
  return self->_paddingBetweenConstraint;
}

- (void)setPaddingBetweenConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_paddingBetweenConstraint, a3);
}

- (NSLayoutConstraint)topPaddingConstraint
{
  return self->_topPaddingConstraint;
}

- (void)setTopPaddingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topPaddingConstraint, a3);
}

- (NSLayoutConstraint)leftPaddingConstraint
{
  return self->_leftPaddingConstraint;
}

- (void)setLeftPaddingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leftPaddingConstraint, a3);
}

- (NSLayoutConstraint)bottomPaddingConstraint
{
  return self->_bottomPaddingConstraint;
}

- (void)setBottomPaddingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomPaddingConstraint, a3);
}

- (NSLayoutConstraint)rightPaddingConstraint
{
  return self->_rightPaddingConstraint;
}

- (void)setRightPaddingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_rightPaddingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_leftPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_topPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_paddingBetweenConstraint, 0);
  objc_storeStrong((id *)&self->_centeredContainer, 0);
  objc_storeStrong((id *)&self->_paddedContainer, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
}

+ (id)reuseIdentifier
{
  return CFSTR("TUISuggestionCandidateCell");
}

@end
