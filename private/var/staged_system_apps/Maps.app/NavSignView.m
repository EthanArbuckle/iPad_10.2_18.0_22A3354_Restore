@implementation NavSignView

- (NavSignView)initWithFrame:(CGRect)a3
{
  NavSignView *v3;
  NavSignView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NavSignView;
  v3 = -[NavSignView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[NavSignView _maps_commonInit](v3, "_maps_commonInit");
  return v4;
}

- (NavSignView)initWithCoder:(id)a3
{
  NavSignView *v3;
  NavSignView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NavSignView;
  v3 = -[NavSignView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[NavSignView _maps_commonInit](v3, "_maps_commonInit");
  return v4;
}

- (void)_maps_commonInit
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView _defaultSignLayoutDelegate](self, "_defaultSignLayoutDelegate"));
  objc_storeWeak((id *)&self->_signLayoutDelegate, v3);

  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[NavSignView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v6);

  -[NavSignView _setupSubviews](self, "_setupSubviews");
  -[NavSignView _configureLabels](self, "_configureLabels");
  -[NavSignView _setupConstraints](self, "_setupConstraints");
}

- (id)accessibilityIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self);
  return NSStringFromClass(v2);
}

- (void)clearContent
{
  void *v3;
  id v4;

  -[NavSignView setDimmed:](self, "setDimmed:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  objc_msgSend(v3, "setTextAlternatives:", 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  objc_msgSend(v4, "setTextAlternatives:", 0);

}

- (void)refreshSign
{
  -[NavSignView _updateLabelText](self, "_updateLabelText");
  -[NavSignView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDimmed:(BOOL)a3
{
  double v3;

  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    v3 = 0.400000006;
    if (!a3)
      v3 = 1.0;
    -[NavSignView setAlpha:](self, "setAlpha:", v3);
  }
}

- (BOOL)hasMajorText
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textAlternatives"));
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)hasMinorText
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textAlternatives"));
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)hasText
{
  if (-[NavSignView hasMajorText](self, "hasMajorText"))
    return 1;
  else
    return -[NavSignView hasMinorText](self, "hasMinorText");
}

- (BOOL)hasOnlySingleLineText
{
  BOOL v3;
  void *v4;
  void *v5;

  if (!-[NavSignView hasMajorText](self, "hasMajorText"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
LABEL_6:
    v5 = v4;
    v3 = objc_msgSend(v4, "lineCount") == (id)1;

    return v3;
  }
  if (!-[NavSignView hasMinorText](self, "hasMinorText"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
    goto LABEL_6;
  }
  return 0;
}

- (void)setSignLayoutDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[GroupAnimation animation](GroupAnimation, "animation"));
  objc_msgSend(v5, "setAnimated:", 0);
  -[NavSignView setSignLayoutDelegate:withAnimation:](self, "setSignLayoutDelegate:withAnimation:", v4, v5);

  objc_msgSend(v5, "runWithDefaultOptions");
}

- (void)setSignLayoutDelegate:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  _QWORD v9[5];

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_signLayoutDelegate);

  if (WeakRetained != v6)
  {
    objc_storeWeak((id *)&self->_signLayoutDelegate, v6);
    -[NavSignView _configureLabels](self, "_configureLabels");
    -[NavSignView _updateLabelText](self, "_updateLabelText");
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1009E20C0;
    v9[3] = &unk_1011AC860;
    v9[4] = self;
    objc_msgSend(v7, "addAnimations:completion:", v9, 0);
  }

}

- (double)maxHeight
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView maxSignHeightConstraint](self, "maxSignHeightConstraint"));
  objc_msgSend(v2, "constant");
  v4 = v3;

  return v4;
}

- (void)setMaxHeight:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NavSignView maxSignHeightConstraint](self, "maxSignHeightConstraint"));
  objc_msgSend(v4, "setConstant:", a3);

}

- (void)setUsePersistentDisplay:(BOOL)a3
{
  if (self->_usePersistentDisplay != a3)
  {
    self->_usePersistentDisplay = a3;
    -[NavSignView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)updateTheme
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NavSignView;
  -[MapsThemeView updateTheme](&v9, "updateTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView theme](self, "theme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "navSignMajorTextColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView theme](self, "theme"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navSignMinorTextColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  objc_msgSend(v8, "setTextColor:", v7);

}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _OWORD v22[3];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _OWORD v27[3];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  objc_super v36;
  _BYTE v37[128];
  _BYTE v38[128];

  -[NavSignView _updateConstraints](self, "_updateConstraints");
  v36.receiver = self;
  v36.super_class = (Class)NavSignView;
  -[NavSignView layoutSubviews](&v36, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  objc_msgSend(v3, "updateLabelIfNeeded");

  v4 = objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  objc_msgSend((id)v4, "updateLabelIfNeeded");

  v35.receiver = self;
  v35.super_class = (Class)NavSignView;
  -[NavSignView layoutSubviews](&v35, "layoutSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  LOBYTE(v4) = objc_opt_respondsToSelector(v5, "navSignView:transformForSubview:");

  if ((v4 & 1) != 0)
  {
    v33 = 0uLL;
    v34 = 0uLL;
    v31 = 0uLL;
    v32 = 0uLL;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView subviews](self, "subviews"));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
          v13 = v12;
          if (v12)
          {
            objc_msgSend(v12, "navSignView:transformForSubview:", self, v11);
          }
          else
          {
            v29 = 0u;
            v30 = 0u;
            v28 = 0u;
          }
          v27[0] = v28;
          v27[1] = v29;
          v27[2] = v30;
          objc_msgSend(v11, "setTransform:", v27);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      }
      while (v8);
    }
  }
  else
  {
    v25 = 0uLL;
    v26 = 0uLL;
    v23 = 0uLL;
    v24 = 0uLL;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView subviews](self, "subviews"));
    v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      v20 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v21 = *(_OWORD *)&CGAffineTransformIdentity.a;
      v19 = *(_OWORD *)&CGAffineTransformIdentity.tx;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v6);
          v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j);
          v22[0] = v21;
          v22[1] = v20;
          v22[2] = v19;
          objc_msgSend(v18, "setTransform:", v22, v19, v20, v21);
        }
        v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
      }
      while (v15);
    }
  }

}

- (NavSignLayoutDelegate)_defaultSignLayoutDelegate
{
  return 0;
}

- (void)_setupSubviews
{
  NavSignLabel *v3;
  double y;
  double width;
  double height;
  NavSignLabel *v7;
  NavSignLabel *majorLabel;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  NavSignLabel *v16;
  NavSignLabel *minorLabel;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  id v25;

  v3 = [NavSignLabel alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = -[NavSignLabel initWithFrame:](v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  majorLabel = self->_majorLabel;
  self->_majorLabel = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  LODWORD(v11) = 1148846080;
  objc_msgSend(v10, "setContentCompressionResistancePriority:forAxis:", 1, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  LODWORD(v13) = 1148846080;
  objc_msgSend(v12, "setContentHuggingPriority:forAxis:", 1, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  objc_msgSend(v14, "setDelegate:", self);

  -[NavSignLabel setAccessibilityIdentifier:](self->_majorLabel, "setAccessibilityIdentifier:", CFSTR("MajorLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  -[NavSignView addSubview:](self, "addSubview:", v15);

  v16 = -[NavSignLabel initWithFrame:]([NavSignLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  minorLabel = self->_minorLabel;
  self->_minorLabel = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  LODWORD(v20) = 1148829696;
  objc_msgSend(v19, "setContentCompressionResistancePriority:forAxis:", 1, v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  LODWORD(v22) = 1148846080;
  objc_msgSend(v21, "setContentHuggingPriority:forAxis:", 1, v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  objc_msgSend(v23, "setLineBreakMode:", 4);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  objc_msgSend(v24, "setDelegate:", self);

  -[NavSignLabel setAccessibilityIdentifier:](self->_minorLabel, "setAccessibilityIdentifier:", CFSTR("MinorLabel"));
  v25 = (id)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  -[NavSignView addSubview:](self, "addSubview:", v25);

}

- (void)_setupConstraints
{
  NSDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *minSignHeightConstraint;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *maxSignHeightConstraint;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSLayoutConstraint *v21;
  NSLayoutConstraint *majorLabelLeadingMarginConstraint;
  void *v23;
  void *v24;
  void *v25;
  NSLayoutConstraint *v26;
  NSLayoutConstraint *majorLabelTrailingMarginConstraint;
  void *v28;
  void *v29;
  void *v30;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *minorLabelLeadingMarginConstraint;
  void *v33;
  void *v34;
  void *v35;
  NSLayoutConstraint *v36;
  NSLayoutConstraint *minorLabelTrailingMarginConstraint;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSLayoutConstraint *v42;
  NSLayoutConstraint *minorToMajorLabelLeadingAlignmentConstraint;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSLayoutConstraint *v48;
  NSLayoutConstraint *minorToMajorLabelTrailingAlignmentConstraint;
  void *v50;
  void *v51;
  void *v52;
  NSLayoutConstraint *v53;
  NSLayoutConstraint *majorLabelBaselineToTopConstraint;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  NSLayoutConstraint *v59;
  NSLayoutConstraint *minorLabelBaselineToTopConstraint;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSLayoutConstraint *v66;
  NSLayoutConstraint *minorToMajorLabelBaselineConstraint;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  NSLayoutConstraint *v72;
  NSLayoutConstraint *bottomToMajorLabelBaselineConstraint;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  NSLayoutConstraint *v78;
  NSLayoutConstraint *bottomToMinorLabelBaselineConstraint;
  double v80;
  _QWORD v81[2];

  v3 = _NSDictionaryOfVariableBindings(CFSTR("_majorLabel, _minorLabel"), self->_majorLabel, self->_minorLabel, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=0)-[_majorLabel]-(>=0)-[_minorLabel]-(>=0)-|"), 0, 0, v4));
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(>=0)-[_majorLabel]-(>=0)-|"), 0, 0, v4));
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(>=0)-[_minorLabel]-(>=0)-|"), 0, 0, v4));
  objc_msgSend(v5, "addObjectsFromArray:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView heightAnchor](self, "heightAnchor"));
  v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintGreaterThanOrEqualToConstant:", 0.0));
  minSignHeightConstraint = self->_minSignHeightConstraint;
  self->_minSignHeightConstraint = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView heightAnchor](self, "heightAnchor"));
  -[NavSignView _maps_maxConstraintConstantForAxis:](self, "_maps_maxConstraintConstantForAxis:", 0);
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintLessThanOrEqualToConstant:"));
  maxSignHeightConstraint = self->_maxSignHeightConstraint;
  self->_maxSignHeightConstraint = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minSignHeightConstraint](self, "minSignHeightConstraint"));
  v81[0] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView maxSignHeightConstraint](self, "maxSignHeightConstraint"));
  v81[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v81, 2));
  objc_msgSend(v5, "addObjectsFromArray:", v17);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView leadingAnchor](self, "leadingAnchor"));
  v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
  majorLabelLeadingMarginConstraint = self->_majorLabelLeadingMarginConstraint;
  self->_majorLabelLeadingMarginConstraint = v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView trailingAnchor](self, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v26 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v25));
  majorLabelTrailingMarginConstraint = self->_majorLabelTrailingMarginConstraint;
  self->_majorLabelTrailingMarginConstraint = v26;

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView leadingAnchor](self, "leadingAnchor"));
  v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v30));
  minorLabelLeadingMarginConstraint = self->_minorLabelLeadingMarginConstraint;
  self->_minorLabelLeadingMarginConstraint = v31;

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView trailingAnchor](self, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "trailingAnchor"));
  v36 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v35));
  minorLabelTrailingMarginConstraint = self->_minorLabelTrailingMarginConstraint;
  self->_minorLabelTrailingMarginConstraint = v36;

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "leadingAnchor"));
  v42 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v41));
  minorToMajorLabelLeadingAlignmentConstraint = self->_minorToMajorLabelLeadingAlignmentConstraint;
  self->_minorToMajorLabelLeadingAlignmentConstraint = v42;

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "trailingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "trailingAnchor"));
  v48 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v47));
  minorToMajorLabelTrailingAlignmentConstraint = self->_minorToMajorLabelTrailingAlignmentConstraint;
  self->_minorToMajorLabelTrailingAlignmentConstraint = v48;

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "firstBaselineAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView topAnchor](self, "topAnchor"));
  v53 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v52));
  majorLabelBaselineToTopConstraint = self->_majorLabelBaselineToTopConstraint;
  self->_majorLabelBaselineToTopConstraint = v53;

  LODWORD(v55) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_majorLabelBaselineToTopConstraint, "setPriority:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "firstBaselineAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView topAnchor](self, "topAnchor"));
  v59 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v58));
  minorLabelBaselineToTopConstraint = self->_minorLabelBaselineToTopConstraint;
  self->_minorLabelBaselineToTopConstraint = v59;

  LODWORD(v61) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_minorLabelBaselineToTopConstraint, "setPriority:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "firstBaselineAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "lastBaselineAnchor"));
  v66 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v65));
  minorToMajorLabelBaselineConstraint = self->_minorToMajorLabelBaselineConstraint;
  self->_minorToMajorLabelBaselineConstraint = v66;

  LODWORD(v68) = 1148813312;
  -[NSLayoutConstraint setPriority:](self->_minorToMajorLabelBaselineConstraint, "setPriority:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView bottomAnchor](self, "bottomAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "lastBaselineAnchor"));
  v72 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v71));
  bottomToMajorLabelBaselineConstraint = self->_bottomToMajorLabelBaselineConstraint;
  self->_bottomToMajorLabelBaselineConstraint = v72;

  LODWORD(v74) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_bottomToMajorLabelBaselineConstraint, "setPriority:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView bottomAnchor](self, "bottomAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "lastBaselineAnchor"));
  v78 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v77));
  bottomToMinorLabelBaselineConstraint = self->_bottomToMinorLabelBaselineConstraint;
  self->_bottomToMinorLabelBaselineConstraint = v78;

  LODWORD(v80) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_bottomToMinorLabelBaselineConstraint, "setPriority:", v80);

}

- (void)_updateConstraints
{
  _BOOL8 v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  LayoutConstraintActivationHelper *v63;

  v3 = -[NavSignView hasMajorText](self, "hasMajorText");
  v4 = -[NavSignView hasMinorText](self, "hasMinorText");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  objc_msgSend(v5, "setHidden:", v3 ^ 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  objc_msgSend(v6, "setHidden:", v4 ^ 1);

  -[NavSignView _configureLabels](self, "_configureLabels");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  objc_msgSend(v7, "minimumHeightForSign:", self);
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minSignHeightConstraint](self, "minSignHeightConstraint"));
  objc_msgSend(v10, "setConstant:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  objc_msgSend(v11, "navSignView:textLeadingMarginForMajorText:", self, 1);
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  objc_msgSend(v14, "navSignView:textLeadingMarginForMajorText:", self, 0);
  v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  objc_msgSend(v17, "navSignView:textTrailingMarginForMajorText:", self, 1);
  v19 = v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  objc_msgSend(v20, "navSignView:textTrailingMarginForMajorText:", self, 0);
  v22 = v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabelLeadingMarginConstraint](self, "majorLabelLeadingMarginConstraint"));
  objc_msgSend(v23, "setConstant:", v13);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabelLeadingMarginConstraint](self, "minorLabelLeadingMarginConstraint"));
  objc_msgSend(v24, "setConstant:", v16);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabelTrailingMarginConstraint](self, "majorLabelTrailingMarginConstraint"));
  objc_msgSend(v25, "setConstant:", v19);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabelTrailingMarginConstraint](self, "minorLabelTrailingMarginConstraint"));
  objc_msgSend(v26, "setConstant:", v22);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  objc_msgSend(v27, "textTopMarginForSign:", self);
  v29 = round(v28);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabelBaselineToTopConstraint](self, "majorLabelBaselineToTopConstraint"));
  objc_msgSend(v30, "setConstant:", v29);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabelBaselineToTopConstraint](self, "minorLabelBaselineToTopConstraint"));
  objc_msgSend(v31, "setConstant:", v29);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  objc_msgSend(v32, "textBottomMarginForSign:", self);
  v34 = round(v33);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView bottomToMajorLabelBaselineConstraint](self, "bottomToMajorLabelBaselineConstraint"));
  objc_msgSend(v35, "setConstant:", v34);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView bottomToMinorLabelBaselineConstraint](self, "bottomToMinorLabelBaselineConstraint"));
  objc_msgSend(v36, "setConstant:", v34);

  -[NavSignView _calculateInterLabelConstraintConstant](self, "_calculateInterLabelConstraintConstant");
  v38 = v37;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorToMajorLabelBaselineConstraint](self, "minorToMajorLabelBaselineConstraint"));
  objc_msgSend(v39, "setConstant:", v38);

  v63 = objc_alloc_init(LayoutConstraintActivationHelper);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  v41 = objc_msgSend(v40, "navSignView:shouldAlignToLeadingForMajorText:", self, 1);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  v43 = objc_msgSend(v42, "navSignView:shouldAlignToLeadingForMajorText:", self, 0);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  v45 = objc_msgSend(v44, "navSignView:shouldAlignToTrailingForMajorText:", self, 1);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  v47 = objc_msgSend(v46, "navSignView:shouldAlignToTrailingForMajorText:", self, 0);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  v49 = objc_msgSend(v48, "shouldAlignMinorToMajorLabelLeadingForSign:", self);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  v51 = objc_msgSend(v50, "shouldAlignMinorToMajorLabelTrailingForSign:", self);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabelLeadingMarginConstraint](self, "majorLabelLeadingMarginConstraint"));
  -[LayoutConstraintActivationHelper scheduleConstraint:activate:](v63, "scheduleConstraint:activate:", v52, v41);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabelLeadingMarginConstraint](self, "minorLabelLeadingMarginConstraint"));
  -[LayoutConstraintActivationHelper scheduleConstraint:activate:](v63, "scheduleConstraint:activate:", v53, v43);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabelTrailingMarginConstraint](self, "majorLabelTrailingMarginConstraint"));
  -[LayoutConstraintActivationHelper scheduleConstraint:activate:](v63, "scheduleConstraint:activate:", v54, v45);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabelTrailingMarginConstraint](self, "minorLabelTrailingMarginConstraint"));
  -[LayoutConstraintActivationHelper scheduleConstraint:activate:](v63, "scheduleConstraint:activate:", v55, v47);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorToMajorLabelLeadingAlignmentConstraint](self, "minorToMajorLabelLeadingAlignmentConstraint"));
  -[LayoutConstraintActivationHelper scheduleConstraint:activate:](v63, "scheduleConstraint:activate:", v56, v49);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorToMajorLabelTrailingAlignmentConstraint](self, "minorToMajorLabelTrailingAlignmentConstraint"));
  -[LayoutConstraintActivationHelper scheduleConstraint:activate:](v63, "scheduleConstraint:activate:", v57, v51);

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabelBaselineToTopConstraint](self, "majorLabelBaselineToTopConstraint"));
  -[LayoutConstraintActivationHelper scheduleConstraint:activate:](v63, "scheduleConstraint:activate:", v58, v3);

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabelBaselineToTopConstraint](self, "minorLabelBaselineToTopConstraint"));
  -[LayoutConstraintActivationHelper scheduleConstraint:activate:](v63, "scheduleConstraint:activate:", v59, !v3 & v4);

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorToMajorLabelBaselineConstraint](self, "minorToMajorLabelBaselineConstraint"));
  -[LayoutConstraintActivationHelper scheduleConstraint:activate:](v63, "scheduleConstraint:activate:", v60, v4 & v3);

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView bottomToMinorLabelBaselineConstraint](self, "bottomToMinorLabelBaselineConstraint"));
  -[LayoutConstraintActivationHelper scheduleConstraint:activate:](v63, "scheduleConstraint:activate:", v61, v4);

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView bottomToMajorLabelBaselineConstraint](self, "bottomToMajorLabelBaselineConstraint"));
  -[LayoutConstraintActivationHelper scheduleConstraint:activate:](v63, "scheduleConstraint:activate:", v62, !v4 & v3);

  -[LayoutConstraintActivationHelper commitPendingConstraints](v63, "commitPendingConstraints");
}

- (TextFirstLineCharacterRangeFinder)firstLineCharacterRangeFinder
{
  TextFirstLineCharacterRangeFinder *firstLineCharacterRangeFinder;
  TextFirstLineCharacterRangeFinder *v4;
  TextFirstLineCharacterRangeFinder *v5;

  firstLineCharacterRangeFinder = self->_firstLineCharacterRangeFinder;
  if (!firstLineCharacterRangeFinder)
  {
    v4 = objc_alloc_init(TextFirstLineCharacterRangeFinder);
    v5 = self->_firstLineCharacterRangeFinder;
    self->_firstLineCharacterRangeFinder = v4;

    firstLineCharacterRangeFinder = self->_firstLineCharacterRangeFinder;
  }
  return firstLineCharacterRangeFinder;
}

- (void)_configureLabels
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
  id v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));

  if (v3)
  {
    v29 = (id)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
    objc_msgSend(v29, "setTextAlignment:", objc_msgSend(v4, "navSignView:textAlignmentForMajorText:", self, 1));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navSignView:preferredFontForMajorText:", self, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_mapkit_fontByAddingFeaturesForTabularFigures"));
    objc_msgSend(v29, "setPreferredFont:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navSignView:alternateFontForMajorText:", self, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_mapkit_fontByAddingFeaturesForTabularFigures"));
    objc_msgSend(v29, "setAlternateFont:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
    objc_msgSend(v11, "navSignView:alternateFontLineSpacingForMajorText:", self, 1);
    objc_msgSend(v29, "setAlternateFontLineSpacing:");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
    objc_msgSend(v29, "setMaxNumberOfLinesWithPreferredFont:", objc_msgSend(v12, "navSignView:maxNumberOfLinesWithPreferredFontForMajorText:", self, 1));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
    objc_msgSend(v29, "setMaxNumberOfLinesWithLongestAlternative:", objc_msgSend(v13, "navSignView:maxNumberOfLinesWithLongestAlternativeForMajorText:", self, 1));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
    objc_msgSend(v29, "setMaxNumberOfTotalLines:", objc_msgSend(v14, "navSignView:maxNumberOfTotalLinesForMajorText:", self, 1));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
    objc_msgSend(v29, "setInlineShieldSize:", objc_msgSend(v15, "navSignView:inlineShieldSizeForMajorText:", self, 1));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
    objc_msgSend(v16, "setTextAlignment:", objc_msgSend(v17, "navSignView:textAlignmentForMajorText:", self, 0));

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "navSignView:preferredFontForMajorText:", self, 0));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_mapkit_fontByAddingFeaturesForTabularFigures"));
    objc_msgSend(v16, "setPreferredFont:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "navSignView:alternateFontForMajorText:", self, 0));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "_mapkit_fontByAddingFeaturesForTabularFigures"));
    objc_msgSend(v16, "setAlternateFont:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
    objc_msgSend(v24, "navSignView:alternateFontLineSpacingForMajorText:", self, 0);
    objc_msgSend(v16, "setAlternateFontLineSpacing:");

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
    objc_msgSend(v16, "setMaxNumberOfLinesWithPreferredFont:", objc_msgSend(v25, "navSignView:maxNumberOfLinesWithPreferredFontForMajorText:", self, 0));

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
    objc_msgSend(v16, "setMaxNumberOfLinesWithLongestAlternative:", objc_msgSend(v26, "navSignView:maxNumberOfLinesWithLongestAlternativeForMajorText:", self, 0));

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
    objc_msgSend(v16, "setMaxNumberOfTotalLines:", objc_msgSend(v27, "navSignView:maxNumberOfTotalLinesForMajorText:", self, 0));

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
    objc_msgSend(v16, "setInlineShieldSize:", objc_msgSend(v28, "navSignView:inlineShieldSizeForMajorText:", self, 0));

  }
}

- (double)_calculateInterLabelConstraintConstant
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  NavSignView *v36;
  uint64_t v37;
  _QWORD v39[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  objc_msgSend(v3, "baselineMarginBetweenLabelsForSign:", self);
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView firstLineCharacterRangeFinder](self, "firstLineCharacterRangeFinder"));
  objc_msgSend(v11, "setTextSize:", v8, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "attributedText"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView firstLineCharacterRangeFinder](self, "firstLineCharacterRangeFinder"));
  v15 = objc_msgSend(v14, "firstLineCharacterRangeInText:", v13);
  v17 = v16;

  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = sub_1009E39B8;
  v44 = sub_1009E39C8;
  v45 = 0;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1009E39D0;
  v39[3] = &unk_1011D98F8;
  v39[4] = &v40;
  objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", NSAttachmentAttributeName, v15, v17, 0, v39);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v41[5], "image"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
    if (objc_msgSend(v19, "shouldUseAlternateFont"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "alternateFont"));
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "preferredFont"));
    }
    v22 = (void *)v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v41[5], "image"));
    objc_msgSend(v23, "size");
    v25 = v24;
    objc_msgSend(v22, "lineHeight");
    v27 = v26;

    if (v25 > v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
      objc_msgSend(v28, "labelBaselineToInlineShieldTopForSign:", self);
      v30 = v29;

      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v41[5], "image"));
      objc_msgSend(v31, "size");
      v33 = v32;
      objc_msgSend((id)v41[5], "bounds");
      v35 = v30 + v33 + v34;
      v36 = self;
      v5 = UIRoundToViewScale(v36, v37, v35);

    }
  }
  _Block_object_dispose(&v40, 8);

  return v5;
}

- (NavContainerLayoutDelegate)containerLayoutDelegate
{
  return (NavContainerLayoutDelegate *)objc_loadWeakRetained((id *)&self->_containerLayoutDelegate);
}

- (void)setContainerLayoutDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_containerLayoutDelegate, a3);
}

- (NavSignLayoutDelegate)signLayoutDelegate
{
  return (NavSignLayoutDelegate *)objc_loadWeakRetained((id *)&self->_signLayoutDelegate);
}

- (NavSignViewAnalyticsDelegate)analyticsDelegate
{
  return (NavSignViewAnalyticsDelegate *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (void)setAnalyticsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsDelegate, a3);
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (NavSignLabel)majorLabel
{
  return self->_majorLabel;
}

- (NavSignLabel)minorLabel
{
  return self->_minorLabel;
}

- (BOOL)usePersistentDisplay
{
  return self->_usePersistentDisplay;
}

- (BOOL)highlightedLanesNotInVisibleRange
{
  return self->_highlightedLanesNotInVisibleRange;
}

- (NSLayoutConstraint)minSignHeightConstraint
{
  return self->_minSignHeightConstraint;
}

- (NSLayoutConstraint)maxSignHeightConstraint
{
  return self->_maxSignHeightConstraint;
}

- (NSLayoutConstraint)majorLabelLeadingMarginConstraint
{
  return self->_majorLabelLeadingMarginConstraint;
}

- (NSLayoutConstraint)majorLabelTrailingMarginConstraint
{
  return self->_majorLabelTrailingMarginConstraint;
}

- (NSLayoutConstraint)minorLabelLeadingMarginConstraint
{
  return self->_minorLabelLeadingMarginConstraint;
}

- (NSLayoutConstraint)minorLabelTrailingMarginConstraint
{
  return self->_minorLabelTrailingMarginConstraint;
}

- (NSLayoutConstraint)minorToMajorLabelLeadingAlignmentConstraint
{
  return self->_minorToMajorLabelLeadingAlignmentConstraint;
}

- (NSLayoutConstraint)minorToMajorLabelTrailingAlignmentConstraint
{
  return self->_minorToMajorLabelTrailingAlignmentConstraint;
}

- (NSLayoutConstraint)majorLabelBaselineToTopConstraint
{
  return self->_majorLabelBaselineToTopConstraint;
}

- (NSLayoutConstraint)minorLabelBaselineToTopConstraint
{
  return self->_minorLabelBaselineToTopConstraint;
}

- (NSLayoutConstraint)minorToMajorLabelBaselineConstraint
{
  return self->_minorToMajorLabelBaselineConstraint;
}

- (NSLayoutConstraint)bottomToMajorLabelBaselineConstraint
{
  return self->_bottomToMajorLabelBaselineConstraint;
}

- (NSLayoutConstraint)bottomToMinorLabelBaselineConstraint
{
  return self->_bottomToMinorLabelBaselineConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomToMinorLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_bottomToMajorLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_minorToMajorLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_minorLabelBaselineToTopConstraint, 0);
  objc_storeStrong((id *)&self->_majorLabelBaselineToTopConstraint, 0);
  objc_storeStrong((id *)&self->_minorToMajorLabelTrailingAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_minorToMajorLabelLeadingAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_minorLabelTrailingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_minorLabelLeadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_majorLabelTrailingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_majorLabelLeadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_maxSignHeightConstraint, 0);
  objc_storeStrong((id *)&self->_minSignHeightConstraint, 0);
  objc_storeStrong((id *)&self->_minorLabel, 0);
  objc_storeStrong((id *)&self->_majorLabel, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_destroyWeak((id *)&self->_signLayoutDelegate);
  objc_destroyWeak((id *)&self->_containerLayoutDelegate);
  objc_storeStrong((id *)&self->_firstLineCharacterRangeFinder, 0);
}

- (NavMessageSignView)messageSign
{
  NavSignView *v2;
  uint64_t v3;
  NavSignView *v4;
  NavMessageSignView *v5;

  v2 = self;
  v3 = objc_opt_class(NavMessageSignView);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (NavManeuverSignView)maneuverSign
{
  NavSignView *v2;
  uint64_t v3;
  NavSignView *v4;
  NavManeuverSignView *v5;

  v2 = self;
  v3 = objc_opt_class(NavManeuverSignView);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (NavPrimaryDrivingSignView)primaryDrivingSign
{
  NavSignView *v2;
  uint64_t v3;
  NavSignView *v4;
  NavPrimaryDrivingSignView *v5;

  v2 = self;
  v3 = objc_opt_class(NavPrimaryDrivingSignView);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (NavSecondaryDrivingSignView)secondaryDrivingSign
{
  NavSignView *v2;
  uint64_t v3;
  NavSignView *v4;
  NavSecondaryDrivingSignView *v5;

  v2 = self;
  v3 = objc_opt_class(NavSecondaryDrivingSignView);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (BOOL)isMessageSign
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView messageSign](self, "messageSign"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isManeuverSign
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView maneuverSign](self, "maneuverSign"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isPrimaryDrivingSign
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView primaryDrivingSign](self, "primaryDrivingSign"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isSecondaryDrivingSign
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView secondaryDrivingSign](self, "secondaryDrivingSign"));
  v3 = v2 != 0;

  return v3;
}

@end
