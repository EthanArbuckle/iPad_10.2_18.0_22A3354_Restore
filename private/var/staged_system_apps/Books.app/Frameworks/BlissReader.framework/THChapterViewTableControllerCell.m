@implementation THChapterViewTableControllerCell

- (void)updateConstraints
{
  id v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = +[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled");
  v4 = -[THChapterViewTableControllerCell usingLargerTextConstraints](self, "usingLargerTextConstraints");
  if ((_DWORD)v3)
  {
    if ((v4 & 1) == 0)
    {
      -[THChapterViewTableControllerCell updateLabels](self, "updateLabels");
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewTableControllerCell regularTextConstraints](self, "regularTextConstraints"));
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v5);

      v6 = objc_claimAutoreleasedReturnValue(-[THChapterViewTableControllerCell largerTextConstraints](self, "largerTextConstraints"));
LABEL_6:
      v8 = (void *)v6;
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v6);

    }
  }
  else if (v4)
  {
    -[THChapterViewTableControllerCell updateLabels](self, "updateLabels");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewTableControllerCell largerTextConstraints](self, "largerTextConstraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v7);

    v6 = objc_claimAutoreleasedReturnValue(-[THChapterViewTableControllerCell regularTextConstraints](self, "regularTextConstraints"));
    goto LABEL_6;
  }
  -[THChapterViewTableControllerCell setUsingLargerTextConstraints:](self, "setUsingLargerTextConstraints:", v3);
  v9.receiver = self;
  v9.super_class = (Class)THChapterViewTableControllerCell;
  -[THChapterViewTableControllerCell updateConstraints](&v9, "updateConstraints");
}

- (void)updateLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  UILabel *titleLabel;
  void *v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[3];
  _BYTE v25[128];
  CGRect v26;

  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewTableControllerCell sectionLabel](self, "sectionLabel", 0));
  v24[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewTableControllerCell titleLabel](self, "titleLabel"));
  v24[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewTableControllerCell pageLabel](self, "pageLabel"));
  v24[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 3));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor"));
        objc_msgSend(v11, "setTextColor:", v12);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewTableControllerCell contentView](self, "contentView"));
  objc_msgSend(v14, "setBackgroundColor:", v13);

  v15 = +[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled");
  titleLabel = self->_titleLabel;
  if (v15)
  {
    -[UILabel setNumberOfLines:](titleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 0);
    -[UILabel frame](self->_titleLabel, "frame");
    -[UILabel setPreferredMaxLayoutWidth:](self->_titleLabel, "setPreferredMaxLayoutWidth:", CGRectGetWidth(v26));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewTableControllerCell pageLabel](self, "pageLabel"));
    v18 = v17;
    v19 = 4;
  }
  else
  {
    -[UILabel setNumberOfLines:](titleLabel, "setNumberOfLines:", 1);
    -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 5);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewTableControllerCell pageLabel](self, "pageLabel"));
    v18 = v17;
    v19 = 2;
  }
  objc_msgSend(v17, "setTextAlignment:", v19);

  -[THChapterViewTableControllerCell layoutIfNeeded](self, "layoutIfNeeded");
}

- (id)regularTextConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[7];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewTableControllerCell sectionLabelBaselineConstraint](self, "sectionLabelBaselineConstraint"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewTableControllerCell pageLabelBaselineToTitleLabelConstraint](self, "pageLabelBaselineToTitleLabelConstraint", v3));
  v12[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewTableControllerCell titleLabelBaselineToSectionLabelConstraint](self, "titleLabelBaselineToSectionLabelConstraint"));
  v12[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewTableControllerCell titleLabelBaselineToPageLabelConstraint](self, "titleLabelBaselineToPageLabelConstraint"));
  v12[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewTableControllerCell titleLabelLeadingConstraint](self, "titleLabelLeadingConstraint"));
  v12[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewTableControllerCell titleLabelTrailingConstraint](self, "titleLabelTrailingConstraint"));
  v12[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewTableControllerCell pageLabelTrailingConstraint](self, "pageLabelTrailingConstraint"));
  v12[6] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 7));

  return v10;
}

- (id)largerTextConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSDictionary *v7;
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
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewTableControllerCell cachedLargerTextConstraints](self, "cachedLargerTextConstraints"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewTableControllerCell sectionLabel](self, "sectionLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewTableControllerCell titleLabel](self, "titleLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewTableControllerCell pageLabel](self, "pageLabel"));
    v7 = _NSDictionaryOfVariableBindings(CFSTR("sectionLabel, titleLabel, pageLabel"), v4, v5, v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[sectionLabel]-(2)-[titleLabel(>=20)]-(2)-[pageLabel]-|"), 0, 0, v8));
    objc_msgSend(v9, "addObjectsFromArray:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 4, 0, v6, 3, 1.0, 0.0));
    objc_msgSend(v9, "addObject:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 3, 0, v4, 4, 1.0, 0.0));
    objc_msgSend(v9, "addObject:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 5, 0, v4, 5, 1.0, 0.0));
    objc_msgSend(v9, "addObject:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 5, 0, v4, 5, 1.0, 0.0));
    objc_msgSend(v9, "addObject:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 6, 0, self, 6, 1.0, -10.0));
    objc_msgSend(v9, "addObject:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 6, 0, self, 6, 1.0, -10.0));
    objc_msgSend(v9, "addObject:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 6, 0, self, 6, 1.0, -10.0));
    objc_msgSend(v9, "addObject:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 4, 0, self, 4, 1.0, -12.0));
    objc_msgSend(v9, "addObject:", v18);

    v19 = objc_msgSend(v9, "copy");
    -[THChapterViewTableControllerCell setCachedLargerTextConstraints:](self, "setCachedLargerTextConstraints:", v19);

  }
  return -[THChapterViewTableControllerCell cachedLargerTextConstraints](self, "cachedLargerTextConstraints");
}

- (UILabel)sectionLabel
{
  return self->_sectionLabel;
}

- (void)setSectionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_sectionLabel, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)pageLabel
{
  return self->_pageLabel;
}

- (void)setPageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_pageLabel, a3);
}

- (BOOL)usingLargerTextConstraints
{
  return self->_usingLargerTextConstraints;
}

- (void)setUsingLargerTextConstraints:(BOOL)a3
{
  self->_usingLargerTextConstraints = a3;
}

- (NSArray)cachedLargerTextConstraints
{
  return self->_cachedLargerTextConstraints;
}

- (void)setCachedLargerTextConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_cachedLargerTextConstraints, a3);
}

- (NSLayoutConstraint)sectionLabelBaselineConstraint
{
  return self->_sectionLabelBaselineConstraint;
}

- (void)setSectionLabelBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_sectionLabelBaselineConstraint, a3);
}

- (NSLayoutConstraint)pageLabelBaselineToTitleLabelConstraint
{
  return self->_pageLabelBaselineToTitleLabelConstraint;
}

- (void)setPageLabelBaselineToTitleLabelConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_pageLabelBaselineToTitleLabelConstraint, a3);
}

- (NSLayoutConstraint)titleLabelBaselineToSectionLabelConstraint
{
  return self->_titleLabelBaselineToSectionLabelConstraint;
}

- (void)setTitleLabelBaselineToSectionLabelConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelBaselineToSectionLabelConstraint, a3);
}

- (NSLayoutConstraint)titleLabelBaselineToPageLabelConstraint
{
  return self->_titleLabelBaselineToPageLabelConstraint;
}

- (void)setTitleLabelBaselineToPageLabelConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelBaselineToPageLabelConstraint, a3);
}

- (NSLayoutConstraint)titleLabelLeadingConstraint
{
  return self->_titleLabelLeadingConstraint;
}

- (void)setTitleLabelLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelLeadingConstraint, a3);
}

- (NSLayoutConstraint)titleLabelTrailingConstraint
{
  return self->_titleLabelTrailingConstraint;
}

- (void)setTitleLabelTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelTrailingConstraint, a3);
}

- (NSLayoutConstraint)pageLabelTrailingConstraint
{
  return self->_pageLabelTrailingConstraint;
}

- (void)setPageLabelTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_pageLabelTrailingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelBaselineToPageLabelConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelBaselineToSectionLabelConstraint, 0);
  objc_storeStrong((id *)&self->_pageLabelBaselineToTitleLabelConstraint, 0);
  objc_storeStrong((id *)&self->_sectionLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_cachedLargerTextConstraints, 0);
  objc_storeStrong((id *)&self->_pageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_sectionLabel, 0);
}

@end
