@implementation RAPReportComposerTwoLineSnippetTableViewCell

- (RAPReportComposerTwoLineSnippetTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RAPReportComposerTwoLineSnippetTableViewCell *v4;
  RAPReportComposerTwoLineSnippetTableViewCell *v5;
  UILabel *v6;
  UILabel *firstLineLabel;
  void *v8;
  double v9;
  UILabel *v10;
  UILabel *secondLineLabel;
  void *v12;
  double v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)RAPReportComposerTwoLineSnippetTableViewCell;
  v4 = -[RAPReportComposerTwoLineSnippetTableViewCell initWithStyle:reuseIdentifier:](&v15, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[RAPReportComposerTwoLineSnippetTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v6 = (UILabel *)objc_alloc_init((Class)UILabel);
    firstLineLabel = v5->_firstLineLabel;
    v5->_firstLineLabel = v6;

    -[UILabel setNumberOfLines:](v5->_firstLineLabel, "setNumberOfLines:", 3);
    -[UILabel setLineBreakMode:](v5->_firstLineLabel, "setLineBreakMode:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerTwoLineSnippetTableViewCell contentView](v5, "contentView"));
    objc_msgSend(v8, "addSubview:", v5->_firstLineLabel);

    LODWORD(v9) = 1148829696;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_firstLineLabel, "setContentCompressionResistancePriority:forAxis:", 1, v9);
    v10 = (UILabel *)objc_alloc_init((Class)UILabel);
    secondLineLabel = v5->_secondLineLabel;
    v5->_secondLineLabel = v10;

    -[UILabel setNumberOfLines:](v5->_secondLineLabel, "setNumberOfLines:", 3);
    -[UILabel setLineBreakMode:](v5->_secondLineLabel, "setLineBreakMode:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerTwoLineSnippetTableViewCell contentView](v5, "contentView"));
    objc_msgSend(v12, "addSubview:", v5->_secondLineLabel);

    LODWORD(v13) = 1148829696;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_secondLineLabel, "setContentCompressionResistancePriority:forAxis:", 1, v13);
    -[RAPReportComposerTwoLineSnippetTableViewCell _recreateConstraints](v5, "_recreateConstraints");
  }
  return v5;
}

- (void)setThirdLineAccessoryView:(id)a3
{
  UIView *v5;
  UIView **p_thirdLineAccessoryView;
  UIView *thirdLineAccessoryView;
  void *v8;
  double v9;
  UIView *v10;

  v5 = (UIView *)a3;
  p_thirdLineAccessoryView = &self->_thirdLineAccessoryView;
  thirdLineAccessoryView = self->_thirdLineAccessoryView;
  if (thirdLineAccessoryView != v5)
  {
    v10 = v5;
    -[UIView removeFromSuperview](thirdLineAccessoryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_thirdLineAccessoryView, a3);
    if (*p_thirdLineAccessoryView)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerTwoLineSnippetTableViewCell contentView](self, "contentView"));
      objc_msgSend(v8, "addSubview:", *p_thirdLineAccessoryView);

      LODWORD(v9) = 1148829696;
      -[UIView setContentCompressionResistancePriority:forAxis:](*p_thirdLineAccessoryView, "setContentCompressionResistancePriority:forAxis:", 1, v9);
    }
    -[RAPReportComposerTwoLineSnippetTableViewCell _recreateConstraints](self, "_recreateConstraints");
    v5 = v10;
  }

}

- (void)_recreateConstraints
{
  uint64_t v3;
  UILabel *v4;
  UILabel *firstLineLabel;
  NSDictionary *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSArray *v29;
  NSArray *leftMarginConstraints;
  NSArray *v31;
  NSArray *rightMarginConstraints;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *j;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  UILabel *v43;
  UILabel *secondLineLabel;
  void *v45;
  void *v46;
  uint64_t v47;
  NSLayoutConstraint *collapsibleFirstSecondLineMargin;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  void *m;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  void *k;
  void *v65;
  void *v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  void *n;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  UILabel *v76;
  void *v77;
  id v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  void *ii;
  void *v83;
  void *v84;
  void *v85;
  NSArray *v86;
  NSArray *allConstraints;
  UILabel *v88;
  id v89;
  void *v90;
  void *v91;
  id obj;
  UILabel *obja;
  id v94;
  id v95;
  RAPReportComposerTwoLineSnippetTableViewCell *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _BYTE v105[128];
  _BYTE v106[128];

  if (self->_allConstraints)
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  v3 = objc_claimAutoreleasedReturnValue(-[RAPReportComposerTwoLineSnippetTableViewCell thirdLineAccessoryView](self, "thirdLineAccessoryView"));
  v4 = (UILabel *)v3;
  firstLineLabel = self->_firstLineLabel;
  if (v3)
    v6 = _NSDictionaryOfVariableBindings(CFSTR("_firstLineLabel, _secondLineLabel, accessoryView"), firstLineLabel, self->_secondLineLabel, v3, 0);
  else
    v6 = _NSDictionaryOfVariableBindings(CFSTR("_firstLineLabel, _secondLineLabel"), firstLineLabel, self->_secondLineLabel, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  +[TransitArtworkListView transitArtworkListHeight](TransitArtworkListView, "transitArtworkListHeight");
  v15 = sub_1002A8AFC(CFSTR("topBottomMargin, lineMargin, artworkListHeight"), 10.0, v8, v9, v10, v11, v12, v13, v14, 0x4014000000000000);
  v90 = (void *)objc_claimAutoreleasedReturnValue(v15);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_firstLineLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v96 = self;
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_secondLineLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v88 = v4;
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v89 = objc_alloc_init((Class)NSMutableArray);
  v95 = objc_alloc_init((Class)NSMutableArray);
  v94 = objc_alloc_init((Class)NSMutableArray);
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v91 = v7;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectEnumerator"));
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v98;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v98 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)i);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerTwoLineSnippetTableViewCell contentView](v96, "contentView"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));

        objc_msgSend(v24, "setIdentifier:", CFSTR("Left margin"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerTwoLineSnippetTableViewCell contentView](v96, "contentView"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v27));

        objc_msgSend(v28, "setIdentifier:", CFSTR("Right margin"));
        objc_msgSend(v95, "addObject:", v24);
        objc_msgSend(v94, "addObject:", v28);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
    }
    while (v17);
  }

  v29 = (NSArray *)objc_msgSend(v95, "copy");
  leftMarginConstraints = v96->_leftMarginConstraints;
  v96->_leftMarginConstraints = v29;

  v31 = (NSArray *)objc_msgSend(v94, "copy");
  rightMarginConstraints = v96->_rightMarginConstraints;
  v96->_rightMarginConstraints = v31;

  -[RAPReportComposerTwoLineSnippetTableViewCell _updateLeftRightConstraints](v96, "_updateLeftRightConstraints");
  objc_msgSend(v89, "addObjectsFromArray:", v96->_leftMarginConstraints);
  objc_msgSend(v89, "addObjectsFromArray:", v96->_rightMarginConstraints);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-topBottomMargin-[_firstLineLabel]"), 0, v90, v91));
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
  if (v34)
  {
    v35 = v34;
    v36 = 0;
    v37 = *(_QWORD *)v102;
    do
    {
      for (j = 0; j != v35; j = (char *)j + 1)
      {
        if (*(_QWORD *)v102 != v37)
          objc_enumerationMutation(v33);
        v39 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * (_QWORD)j);
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%lu)"), CFSTR("Top stacking"), (char *)j + v36));
        objc_msgSend(v39, "setIdentifier:", v40);

      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
      v36 += (uint64_t)j;
    }
    while (v35);
  }
  objc_msgSend(v89, "addObjectsFromArray:", v33);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](v96->_secondLineLabel, "text"));
  if (objc_msgSend(v41, "length"))
  {

    v42 = 1;
    v43 = v88;
LABEL_22:
    secondLineLabel = v96->_secondLineLabel;
    goto LABEL_23;
  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel attributedText](v96->_secondLineLabel, "attributedText"));
  v58 = objc_msgSend(v57, "length");
  v42 = v58 != 0;

  v43 = v88;
  if (!v88 || v58)
    goto LABEL_22;
  v42 = 0;
  secondLineLabel = v88;
LABEL_23:
  obja = secondLineLabel;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](obja, "topAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v96->_firstLineLabel, "bottomAnchor"));
  v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v46));
  collapsibleFirstSecondLineMargin = v96->_collapsibleFirstSecondLineMargin;
  v96->_collapsibleFirstSecondLineMargin = (NSLayoutConstraint *)v47;

  -[NSLayoutConstraint setIdentifier:](v96->_collapsibleFirstSecondLineMargin, "setIdentifier:", CFSTR("Collapsible first-second line margin"));
  objc_msgSend(v89, "addObject:", v96->_collapsibleFirstSecondLineMargin);
  if (!v43)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_secondLineLabel]-topBottomMargin-|"), 0, v90, v91));
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
    if (v60)
    {
      v61 = v60;
      v62 = 0;
      v63 = *(_QWORD *)v102;
      do
      {
        for (k = 0; k != v61; k = (char *)k + 1)
        {
          if (*(_QWORD *)v102 != v63)
            objc_enumerationMutation(v59);
          v65 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * (_QWORD)k);
          v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%lu)"), CFSTR("Bottom stacking (with _secondLineLabel, without accessory)"), (char *)k + v62));
          objc_msgSend(v65, "setIdentifier:", v66);

        }
        v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
        v62 += (uint64_t)k;
      }
      while (v61);
    }
    goto LABEL_59;
  }
  if (v42)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_secondLineLabel]-lineMargin-[accessoryView]-topBottomMargin-|"), 0, v90, v91));
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
    if (v50)
    {
      v51 = v50;
      v52 = 0;
      v53 = *(_QWORD *)v102;
      do
      {
        for (m = 0; m != v51; m = (char *)m + 1)
        {
          if (*(_QWORD *)v102 != v53)
            objc_enumerationMutation(v49);
          v55 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * (_QWORD)m);
          v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%lu)"), CFSTR("Bottom stacking (with _secondLineLabel and accessory)"), (char *)m + v52));
          objc_msgSend(v55, "setIdentifier:", v56);

        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
        v52 += (uint64_t)m;
      }
      while (v51);
    }
  }
  else
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[accessoryView]-topBottomMargin-|"), 0, v90, v91));
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v67 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
    if (v67)
    {
      v68 = v67;
      v69 = 0;
      v70 = *(_QWORD *)v102;
      do
      {
        for (n = 0; n != v68; n = (char *)n + 1)
        {
          if (*(_QWORD *)v102 != v70)
            objc_enumerationMutation(v49);
          v72 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * (_QWORD)n);
          v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%lu)"), CFSTR("Bottom stacking (without _secondLineLabel, with accessory)"), (char *)n + v69));
          objc_msgSend(v72, "setIdentifier:", v73);

        }
        v68 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
        v69 += (uint64_t)n;
      }
      while (v68);
    }
  }
  v74 = v89;
  objc_msgSend(v89, "addObjectsFromArray:", v49);

  v75 = objc_opt_class(TransitArtworkListView);
  v76 = v88;
  v77 = v91;
  if ((objc_opt_isKindOfClass(v88, v75) & 1) != 0)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[accessoryView(artworkListHeight@999)]"), 0, v90, v91));
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v78 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
    if (v78)
    {
      v79 = v78;
      v80 = 0;
      v81 = *(_QWORD *)v102;
      do
      {
        for (ii = 0; ii != v79; ii = (char *)ii + 1)
        {
          if (*(_QWORD *)v102 != v81)
            objc_enumerationMutation(v59);
          v83 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * (_QWORD)ii);
          v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%lu)"), CFSTR("Accessory view height"), (char *)ii + v80));
          objc_msgSend(v83, "setIdentifier:", v84);

        }
        v79 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
        v80 += (uint64_t)ii;
      }
      while (v79);
    }
LABEL_59:
    v74 = v89;
    objc_msgSend(v89, "addObjectsFromArray:", v59);

    v76 = v88;
    v77 = v91;
  }
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerTwoLineSnippetTableViewCell contentView](v96, "contentView"));
  objc_msgSend(v85, "addConstraints:", v74);

  v86 = (NSArray *)objc_msgSend(v74, "copy");
  allConstraints = v96->_allConstraints;
  v96->_allConstraints = v86;

}

- (void)_updateLeftRightConstraints
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
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
  id v39;
  NSArray *v40;
  NSArray *leftMarginConstraints;
  NSArray *v42;
  id v43;
  id v44;
  uint64_t v45;
  double v46;
  void *i;
  NSArray *obj;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerTwoLineSnippetTableViewCell contentView](self, "contentView"));
  objc_msgSend(v3, "layoutMargins");
  v5 = v4;
  v7 = v6;

  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSArray count](self->_leftMarginConstraints, "count")));
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = self->_leftMarginConstraints;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v55;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v55 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerTwoLineSnippetTableViewCell imageView](self, "imageView"));
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "image"));
        if (v14)
        {
          v15 = (void *)v14;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "secondItem"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerTwoLineSnippetTableViewCell imageView](self, "imageView"));

          if (v16 == v17)
            goto LABEL_19;
        }
        else
        {

        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerTwoLineSnippetTableViewCell imageView](self, "imageView"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "image"));

        if (v19)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerTwoLineSnippetTableViewCell contentView](self, "contentView"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraints"));
          v22 = objc_msgSend(v21, "containsObject:", v12);

          if (v22)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerTwoLineSnippetTableViewCell contentView](self, "contentView"));
            objc_msgSend(v23, "removeConstraint:", v12);

          }
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstItem"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerTwoLineSnippetTableViewCell imageView](self, "imageView"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27, 15.0));

        }
        else
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "secondItem"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerTwoLineSnippetTableViewCell imageView](self, "imageView"));

          if (v30 != v31)
          {
            objc_msgSend(v12, "setConstant:", v5);
LABEL_19:
            objc_msgSend(v49, "addObject:", v12);
            goto LABEL_20;
          }
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerTwoLineSnippetTableViewCell contentView](self, "contentView"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraints"));
          v22 = objc_msgSend(v33, "containsObject:", v12);

          if (v22)
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerTwoLineSnippetTableViewCell contentView](self, "contentView"));
            objc_msgSend(v34, "removeConstraint:", v12);

          }
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstItem"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "leadingAnchor"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerTwoLineSnippetTableViewCell contentView](self, "contentView"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "leadingAnchor"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v38, v5));

        }
        objc_msgSend(v28, "setIdentifier:", CFSTR("Left margin"));
        if (v22)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerTwoLineSnippetTableViewCell contentView](self, "contentView"));
          objc_msgSend(v29, "addConstraint:", v28);

        }
        objc_msgSend(v49, "addObject:", v28);

LABEL_20:
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v39 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      v9 = v39;
    }
    while (v39);
  }

  v40 = (NSArray *)objc_msgSend(v49, "copy");
  leftMarginConstraints = self->_leftMarginConstraints;
  self->_leftMarginConstraints = v40;

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v42 = self->_rightMarginConstraints;
  v43 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v51;
    v46 = -v7;
    do
    {
      for (i = 0; i != v44; i = (char *)i + 1)
      {
        if (*(_QWORD *)v51 != v45)
          objc_enumerationMutation(v42);
        objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i), "setConstant:", v46);
      }
      v44 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v44);
  }

}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RAPReportComposerTwoLineSnippetTableViewCell;
  -[RAPReportComposerTwoLineSnippetTableViewCell didMoveToSuperview](&v3, "didMoveToSuperview");
  -[RAPReportComposerTwoLineSnippetTableViewCell _updateLeftRightConstraints](self, "_updateLeftRightConstraints");
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RAPReportComposerTwoLineSnippetTableViewCell;
  -[RAPReportComposerTwoLineSnippetTableViewCell layoutMarginsDidChange](&v3, "layoutMarginsDidChange");
  -[RAPReportComposerTwoLineSnippetTableViewCell _updateLeftRightConstraints](self, "_updateLeftRightConstraints");
}

- (NSAttributedString)attributedStringFormat
{
  return 0;
}

- (id)defaultReplacementAttributes
{
  return &__NSDictionary0__struct;
}

- (void)updateTextWithReplacements:(id)a3
{
  void *v4;
  void *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerTwoLineSnippetTableViewCell attributedStringFormat](self, "attributedStringFormat"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "string"));
  v6 = objc_msgSend(v5, "rangeOfString:", CFSTR("\n"));
  v8 = v7;

  if (v6 == (_BYTE *)0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v4;
    v10 = 0;
    if (v9)
      goto LABEL_3;
LABEL_6:
    -[UILabel setAttributedText:](self->_firstLineLabel, "setAttributedText:", 0);
    if (v10)
      goto LABEL_4;
LABEL_7:
    -[UILabel setAttributedText:](self->_secondLineLabel, "setAttributedText:", 0);
    goto LABEL_8;
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributedSubstringFromRange:", 0, v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributedSubstringFromRange:", &v6[v8], (_BYTE *)objc_msgSend(v4, "length") - &v6[v8]));
  if (!v9)
    goto LABEL_6;
LABEL_3:
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerTwoLineSnippetTableViewCell defaultReplacementAttributes](self, "defaultReplacementAttributes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_mapkit_attributedStringByApplyingBindingFormatReplacements:defaultReplacementAttributes:", v15, v11));
  -[UILabel setAttributedText:](self->_firstLineLabel, "setAttributedText:", v12);

  if (!v10)
    goto LABEL_7;
LABEL_4:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerTwoLineSnippetTableViewCell defaultReplacementAttributes](self, "defaultReplacementAttributes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_mapkit_attributedStringByApplyingBindingFormatReplacements:defaultReplacementAttributes:", v15, v13));
  -[UILabel setAttributedText:](self->_secondLineLabel, "setAttributedText:", v14);

LABEL_8:
}

- (double)preferredHeightInTableView:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  objc_msgSend(a3, "bounds");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerTwoLineSnippetTableViewCell contentView](self, "contentView"));
  objc_msgSend(v6, "systemLayoutSizeFittingSize:", v5, 0.0);
  v8 = v7;

  return v8;
}

+ (id)measuringCell
{
  NSString *v3;
  void *v4;
  id v5;

  if (qword_1014D3BF0 != -1)
    dispatch_once(&qword_1014D3BF0, &stru_1011DE790);
  v3 = NSStringFromClass((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D3BE8, "objectForKeyedSubscript:", v4));
  if (!v5)
  {
    v5 = objc_msgSend(objc_alloc((Class)a1), "initWithStyle:reuseIdentifier:", 0, 0);
    objc_msgSend((id)qword_1014D3BE8, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

- (UIView)thirdLineAccessoryView
{
  return self->_thirdLineAccessoryView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thirdLineAccessoryView, 0);
  objc_storeStrong((id *)&self->_allConstraints, 0);
  objc_storeStrong((id *)&self->_collapsibleFirstSecondLineMargin, 0);
  objc_storeStrong((id *)&self->_rightMarginConstraints, 0);
  objc_storeStrong((id *)&self->_leftMarginConstraints, 0);
  objc_storeStrong((id *)&self->_secondLineLabel, 0);
  objc_storeStrong((id *)&self->_firstLineLabel, 0);
}

@end
