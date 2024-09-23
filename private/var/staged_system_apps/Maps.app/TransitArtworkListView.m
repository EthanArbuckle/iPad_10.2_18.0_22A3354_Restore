@implementation TransitArtworkListView

- (TransitArtworkListView)initWithFrame:(CGRect)a3
{
  TransitArtworkListView *v3;
  TransitArtworkListView *v4;
  TransitArtworkListView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TransitArtworkListView;
  v3 = -[TransitArtworkListView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TransitArtworkListView _commonInit](v3, "_commonInit");
    v5 = v4;
  }

  return v4;
}

- (TransitArtworkListView)initWithCoder:(id)a3
{
  TransitArtworkListView *v3;
  TransitArtworkListView *v4;
  TransitArtworkListView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TransitArtworkListView;
  v3 = -[TransitArtworkListView initWithCoder:](&v7, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
  {
    -[TransitArtworkListView _commonInit](v3, "_commonInit");
    v5 = v4;
  }

  return v4;
}

- (void)_commonInit
{
  -[TransitArtworkListView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  self->_separatorStyle = 0;
  -[TransitArtworkListView setShieldSize:](self, "setShieldSize:", 6);
  -[TransitArtworkListView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("TransitArtworkList"));
}

- ($8502DCEA08BBBE1AB2005217B3838BBD)_metrics
{
  void *v5;
  id v6;
  $8502DCEA08BBBE1AB2005217B3838BBD *result;
  id v8;

  v5 = (void *)objc_opt_class(self);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v8, "userInterfaceIdiom");
  if (v5)
  {
    objc_msgSend(v5, "_metricsForIdiom:", v6);
  }
  else
  {
    *(_OWORD *)&retstr->var4 = 0u;
    *(_OWORD *)&retstr->var6 = 0u;
    *(_OWORD *)&retstr->var0 = 0u;
    *(_OWORD *)&retstr->var2 = 0u;
  }

  return result;
}

+ ($8502DCEA08BBBE1AB2005217B3838BBD)_metricsForIdiom:(SEL)a3
{
  __int128 *v4;
  __int128 v5;
  __int128 v6;

  if (a4 == 4)
  {
    v4 = &xmmword_100E3C3C0;
  }
  else if (a4 == 5)
  {
    v4 = &xmmword_100E3C380;
  }
  else
  {
    v4 = &xmmword_100E3C400;
  }
  v5 = v4[1];
  *(_OWORD *)&retstr->var0 = *v4;
  *(_OWORD *)&retstr->var2 = v5;
  v6 = v4[3];
  *(_OWORD *)&retstr->var4 = v4[2];
  *(_OWORD *)&retstr->var6 = v6;
  return result;
}

- (void)setArtworkData:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_artworkData != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_artworkData, a3);
    -[TransitArtworkListView _updateArtworkImageViewWithArtworks](self, "_updateArtworkImageViewWithArtworks");
    v5 = v6;
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransitArtworkListView;
  -[TransitArtworkListView layoutSubviews](&v6, "layoutSubviews");
  -[TransitArtworkListView bounds](self, "bounds");
  if (self->_lastSize.width != v3 || self->_lastSize.height != v4)
  {
    self->_lastSize.width = v3;
    self->_lastSize.height = v4;
    -[MultilineWrappingListView invalidateIntrinsicContentSize](self->_multilineWrappingStackView, "invalidateIntrinsicContentSize");
    -[TransitArtworkListView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[MultilineWrappingListView intrinsicContentSize](self->_multilineWrappingStackView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setMaxWidth:(double)a3
{
  if (self->_maxWidth != a3)
  {
    self->_maxWidth = a3;
    -[NSLayoutConstraint setConstant:](self->_maxWidthConstraint, "setConstant:", a3);
    -[NSLayoutConstraint setActive:](self->_maxWidthConstraint, "setActive:", a3 > 0.0);
    -[MultilineWrappingListView invalidateIntrinsicContentSize](self->_multilineWrappingStackView, "invalidateIntrinsicContentSize");
    -[TransitArtworkListView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setOverrideTintColor:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  id v9;

  v5 = a3;
  v6 = self->_overrideTintColor;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v9 = (id)v7;
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_overrideTintColor, a3);
      -[TransitArtworkListView _updateTintColor:](self, "_updateTintColor:", v9);
      v7 = (unint64_t)v9;
    }
  }

}

- (void)_updateTintColor:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  uint64_t v12;
  char isKindOfClass;
  NSArray *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  NSArray *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *k;
  id v24;
  id v25;
  uint64_t v26;
  void *m;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];

  v4 = a3;
  if (v4)
  {
    v42 = 0uLL;
    v43 = 0uLL;
    v40 = 0uLL;
    v41 = 0uLL;
    v5 = self->_artworkImageViews;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView traitCollection](self, "traitCollection"));
          if (objc_msgSend(v11, "userInterfaceIdiom") == (id)5)
          {
            v12 = objc_opt_class(MKArtworkLabelView);
            isKindOfClass = objc_opt_isKindOfClass(v10, v12);

            if ((isKindOfClass & 1) != 0)
            {
              objc_msgSend(v10, "setTextColor:", v4);
              continue;
            }
          }
          else
          {

          }
          objc_msgSend(v10, "setTintColor:", v4);
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      }
      while (v7);
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v14 = self->_arrowImageViews;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(_QWORD *)v37 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)j), "setTintColor:", v4);
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      }
      while (v16);
    }
  }
  else
  {
    v34 = 0uLL;
    v35 = 0uLL;
    v32 = 0uLL;
    v33 = 0uLL;
    v19 = self->_artworkImageViews;
    v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v33;
      do
      {
        for (k = 0; k != v21; k = (char *)k + 1)
        {
          if (*(_QWORD *)v33 != v22)
            objc_enumerationMutation(v19);
          -[TransitArtworkListView _updateTintColorForView:](self, "_updateTintColorForView:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)k));
        }
        v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
      }
      while (v21);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = self->_arrowImageViews;
    v24 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v29;
      do
      {
        for (m = 0; m != v25; m = (char *)m + 1)
        {
          if (*(_QWORD *)v29 != v26)
            objc_enumerationMutation(v14);
          -[TransitArtworkListView _updateTintColorForArrowImageView:](self, "_updateTintColorForArrowImageView:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)m), (_QWORD)v28);
        }
        v25 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
      }
      while (v25);
    }
  }

}

- (void)_updateTintColorForView:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v3 = objc_opt_class(MKArtworkImageView);
  if ((objc_opt_isKindOfClass(v7, v3) & 1) != 0
    || (v4 = objc_opt_class(MKArtworkLabelView), (objc_opt_isKindOfClass(v7, v4) & 1) != 0))
  {
    v5 = v7;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    objc_msgSend(v5, "setTintColor:", v6);

  }
}

- (void)_updateTintColorForArrowImageView:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView traitCollection](self, "traitCollection"));
  if (objc_msgSend(v7, "userInterfaceIdiom") == (id)5)
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v6 = (void *)v5;
  objc_msgSend(v4, "setTintColor:", v5);

}

- (void)_updateArtworkImageViewWithArtworks
{
  uint64_t v3;
  id i;
  void *v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *j;
  void *v12;
  id v13;
  void *v14;
  id v15;
  char v16;
  void *k;
  void *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *m;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  double v29;
  double *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  char *v38;
  void *v39;
  NSArray *v40;
  NSArray *artworkImageViews;
  NSArray *v42;
  NSArray *arrowImageViews;
  void *v44;
  unsigned __int8 v45;
  NSArray *obj;
  uint64_t v47;
  id v48;
  int v49;
  char *v50;
  id v51;
  uint64_t v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _OWORD v76[2];
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];

  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v77 = 0u;
  v75 = 0u;
  memset(v76, 0, sizeof(v76));
  -[TransitArtworkListView _metrics](self, "_metrics");
  -[TransitArtworkListView _createNewMultilineShieldView](self, "_createNewMultilineShieldView");
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = self->_artworkData;
  v48 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
  if (!v48)
  {
    v45 = 0;
    goto LABEL_59;
  }
  v45 = 0;
  v3 = 0;
  v47 = *(_QWORD *)v72;
  do
  {
    for (i = 0; i != v48; i = v38 + 1)
    {
      if (*(_QWORD *)v72 != v47)
        objc_enumerationMutation(obj);
      v50 = (char *)i;
      v5 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)i);
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
      if (v7)
      {
        v8 = v7;
        v9 = 0;
        v10 = *(_QWORD *)v68;
        do
        {
          for (j = 0; j != v8; j = (char *)j + 1)
          {
            if (*(_QWORD *)v68 != v10)
              objc_enumerationMutation(v6);
            v9 += (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)j), "count");
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
        }
        while (v8);

        if (v9 > 2)
        {
LABEL_17:
          v14 = 0;
          v49 = 0;
          goto LABEL_19;
        }
      }
      else
      {

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView traitCollection](self, "traitCollection"));
      v13 = objc_msgSend(v12, "userInterfaceIdiom");

      if (v13 == (id)5)
        goto LABEL_17;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView _segmentContainer](self, "_segmentContainer"));
      v49 = 1;
LABEL_19:
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v51 = v6;
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
      v15 = 0;
      if (v53)
      {
        v52 = *(_QWORD *)v64;
        v16 = 1;
        do
        {
          for (k = 0; k != v53; k = (char *)k + 1)
          {
            if (*(_QWORD *)v64 != v52)
              objc_enumerationMutation(v51);
            v18 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)k);
            v59 = 0u;
            v60 = 0u;
            v61 = 0u;
            v62 = 0u;
            v56 = v18;
            v19 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v59, v78, 16);
            if (v19)
            {
              v20 = v19;
              v54 = k;
              v21 = 0;
              v22 = *(_QWORD *)v60;
              do
              {
                for (m = 0; m != v20; m = (char *)m + 1)
                {
                  v24 = v15;
                  if (*(_QWORD *)v60 != v22)
                    objc_enumerationMutation(v56);
                  v25 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)m);
                  if (((-[TransitArtworkListView separatorStyle](self, "separatorStyle") == 0) & v16) == 1
                    && v3 != 0)
                  {
                    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView arrowImage](self, "arrowImage"));

                    if (v27)
                    {
                      v28 = (void *)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView _arrowImageView](self, "_arrowImageView"));
                      -[MultilineWrappingListView addArrangedSubview:](self->_multilineWrappingStackView, "addArrangedSubview:", v28);
                      objc_msgSend(v55, "addObject:", v28);
                      ++v3;

                    }
                  }
                  if (v24)
                  {
                    if (objc_msgSend(v25, "artworkSourceType") == 3)
                    {
                      v29 = *((double *)v76 + 1);
                    }
                    else
                    {
                      v30 = (double *)&v75 + 1;
                      if (v21)
                        v30 = (double *)v76;
                      v29 = *v30;
                    }
                  }
                  else
                  {
                    v29 = *(double *)&v75;
                  }
                  v31 = (void *)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView _addViewForArtwork:inContainer:constraints:previousViewInSegment:leadingSpacing:](self, "_addViewForArtwork:inContainer:constraints:previousViewInSegment:leadingSpacing:", v25, v14, v58, v24, v29));
                  objc_msgSend(v57, "addObject:", v31);
                  v15 = v31;

                  v16 = 0;
                  ++v3;
                  v21 = v15;
                }
                v20 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v59, v78, 16);
                v16 = 0;
                v21 = v15;
              }
              while (v20);

              v16 = 0;
              k = v54;
            }

          }
          v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
        }
        while (v53);
      }

      if (v49)
      {
        v32 = v14;
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "subviews"));
        v34 = objc_msgSend(v33, "count");

        if (v34 && v15)
        {
          -[TransitArtworkListView _configureContainerWithBackgroundIfNeeded:constraints:](self, "_configureContainerWithBackgroundIfNeeded:constraints:", v32, v58);
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v36));
          objc_msgSend(v58, "addObject:", v37);

          -[MultilineWrappingListView addArrangedSubview:](self->_multilineWrappingStackView, "addArrangedSubview:", v32);
          if ((v45 & 1) != 0)
            v45 = 1;
          else
            v45 = objc_msgSend(v32, "showBackground");
        }
        v38 = v50;
      }
      else
      {
        v38 = v50;
        v32 = v14;
      }

    }
    v48 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
  }
  while (v48);
LABEL_59:

  if (objc_msgSend(v57, "count"))
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView _createSizeConstraintsForArtworkViews:](self, "_createSizeConstraintsForArtworkViews:", v57));
    objc_msgSend(v58, "addObjectsFromArray:", v39);

  }
  if ((v45 & 1) != 0)
    -[MultilineWrappingListView setMaxLineHeight:](self->_multilineWrappingStackView, "setMaxLineHeight:", *(double *)&v77);
  v40 = (NSArray *)objc_msgSend(v57, "copy");
  artworkImageViews = self->_artworkImageViews;
  self->_artworkImageViews = v40;

  v42 = (NSArray *)objc_msgSend(v55, "copy");
  arrowImageViews = self->_arrowImageViews;
  self->_arrowImageViews = v42;

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView overrideTintColor](self, "overrideTintColor"));
  -[TransitArtworkListView _updateTintColor:](self, "_updateTintColor:", v44);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v58);
}

- (void)_createNewMultilineShieldView
{
  MultilineWrappingListView *v3;
  MultilineWrappingListView *multilineWrappingStackView;
  float v5;
  MultilineWrappingListView *v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *maxWidthConstraint;
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
  _QWORD v23[4];

  -[MultilineWrappingListView removeFromSuperview](self->_multilineWrappingStackView, "removeFromSuperview");
  -[TransitArtworkListView _metrics](self, "_metrics");
  v3 = -[MultilineWrappingListView initWithFrame:]([MultilineWrappingListView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  multilineWrappingStackView = self->_multilineWrappingStackView;
  self->_multilineWrappingStackView = v3;

  -[MultilineWrappingListView setInterlineSpacing:](self->_multilineWrappingStackView, "setInterlineSpacing:", 0.0);
  -[MultilineWrappingListView setMaxLineHeight:](self->_multilineWrappingStackView, "setMaxLineHeight:", 0.0);
  -[MultilineWrappingListView setHorizontalSpacing:](self->_multilineWrappingStackView, "setHorizontalSpacing:", 0.0);
  -[TransitArtworkListView verticalContentHuggingPriority](self, "verticalContentHuggingPriority");
  if (v5 > 0.0)
  {
    v6 = self->_multilineWrappingStackView;
    -[TransitArtworkListView verticalContentHuggingPriority](self, "verticalContentHuggingPriority");
    -[MultilineWrappingListView setContentHuggingPriority:forAxis:](v6, "setContentHuggingPriority:forAxis:", 1);
  }
  -[MultilineWrappingListView setTranslatesAutoresizingMaskIntoConstraints:](self->_multilineWrappingStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MultilineWrappingListView setAccessibilityIdentifier:](self->_multilineWrappingStackView, "setAccessibilityIdentifier:", CFSTR("MultilineWrappingStackView"));
  -[TransitArtworkListView addSubview:](self, "addSubview:", self->_multilineWrappingStackView);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineWrappingListView widthAnchor](self->_multilineWrappingStackView, "widthAnchor"));
  v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintLessThanOrEqualToConstant:", self->_maxWidth));
  maxWidthConstraint = self->_maxWidthConstraint;
  self->_maxWidthConstraint = v8;

  -[NSLayoutConstraint setActive:](self->_maxWidthConstraint, "setActive:", self->_maxWidth > 0.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineWrappingListView leadingAnchor](self->_multilineWrappingStackView, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView leadingAnchor](self, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v23[0] = v20;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineWrappingListView trailingAnchor](self->_multilineWrappingStackView, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView trailingAnchor](self, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  v23[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineWrappingListView topAnchor](self->_multilineWrappingStackView, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView topAnchor](self, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  v23[2] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineWrappingListView bottomAnchor](self->_multilineWrappingStackView, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView bottomAnchor](self, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
  v23[3] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

}

- (id)_addViewForArtwork:(id)a3 inContainer:(id)a4 constraints:(id)a5 previousViewInSegment:(id)a6 leadingSpacing:(double)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  int v35;
  id v36;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (objc_msgSend(v12, "artworkSourceType") == 3)
  {
    v16 = objc_msgSend(objc_alloc((Class)MKArtworkLabelView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v17 = objc_alloc((Class)GEOComposedString);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textDataSource"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "text"));
    v20 = objc_msgSend(v17, "initWithGeoFormattedString:", v19);

    v21 = objc_msgSend(objc_alloc((Class)MKServerFormattedString), "initWithComposedString:", v20);
    objc_msgSend(v16, "setFormattedString:", v21);
LABEL_3:

    goto LABEL_5;
  }
  v16 = objc_msgSend(objc_alloc((Class)MKArtworkImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v20 = objc_msgSend(objc_alloc((Class)MKSizedTransitArtwork), "initWithArtwork:shieldSize:", v12, -[TransitArtworkListView shieldSize](self, "shieldSize"));
  objc_msgSend(v16, "setImageSource:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "image"));

  if (!v22)
  {
    v34 = sub_100431C0C();
    v21 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v35 = 138412290;
      v36 = v12;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to construct an image for artwork: %@", (uint8_t *)&v35, 0xCu);
    }
    goto LABEL_3;
  }
LABEL_5:

  -[TransitArtworkListView _updateTintColorForView:](self, "_updateTintColorForView:", v16);
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (v13)
  {
    objc_msgSend(v13, "addSubview:", v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
    if (v15)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, a7));
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
    }
    v26 = (void *)v25;

    objc_msgSend(v14, "addObject:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerYAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "centerYAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
    objc_msgSend(v14, "addObject:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintGreaterThanOrEqualToAnchor:", v31));
    objc_msgSend(v14, "addObject:", v32);

  }
  else
  {
    -[MultilineWrappingListView addArrangedSubview:withCustomHorizontalSpacing:](self->_multilineWrappingStackView, "addArrangedSubview:withCustomHorizontalSpacing:", v16, a7);
  }
  objc_msgSend(v16, "setAccessibilityIdentifier:", CFSTR("ArtworkView"));

  return v16;
}

- (id)_segmentContainer
{
  TransitArtworkSegmentContainer *v2;
  objc_class *v3;
  NSString *v4;
  void *v5;

  v2 = -[TransitArtworkSegmentContainer initWithFrame:]([TransitArtworkSegmentContainer alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[TransitArtworkSegmentContainer setClipsToBounds:](v2, "setClipsToBounds:", 0);
  -[TransitArtworkSegmentContainer setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (objc_class *)objc_opt_class(v2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[TransitArtworkSegmentContainer setAccessibilityIdentifier:](v2, "setAccessibilityIdentifier:", v5);

  return v2;
}

- (id)_arrowImageView
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;

  v3 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", 0);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v4) = 1148846080;
  objc_msgSend(v3, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v4);
  LODWORD(v5) = 1148846080;
  objc_msgSend(v3, "_mapkit_setContentHuggingPriority:forAxis:", 1, v5);
  LODWORD(v6) = 1148846080;
  objc_msgSend(v3, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v6);
  LODWORD(v7) = 1148846080;
  objc_msgSend(v3, "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView arrowImage](self, "arrowImage"));
  objc_msgSend(v3, "setImage:", v8);

  -[TransitArtworkListView _updateTintColorForArrowImageView:](self, "_updateTintColorForArrowImageView:", v3);
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("ArrowImageView"));
  return v3;
}

- (UIImage)arrowImage
{
  UIImage *arrowImage;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  UIImage *v8;
  UIImage *v9;

  arrowImage = self->_arrowImage;
  if (!arrowImage)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView traitCollection](self, "traitCollection"));
    if (objc_msgSend(v4, "userInterfaceIdiom") == (id)5)
      v5 = 5.0;
    else
      v5 = 8.0;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrowtriangle.forward.fill")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 2, v5));
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageWithConfiguration:", v7));
    v9 = self->_arrowImage;
    self->_arrowImage = v8;

    arrowImage = self->_arrowImage;
  }
  return arrowImage;
}

- (void)_configureContainerWithBackgroundIfNeeded:(id)a3 constraints:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  double v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subviews"));
  if (!objc_msgSend(v8, "count"))
    goto LABEL_4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subviews"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));
  v11 = objc_opt_class(MKArtworkLabelView);
  isKindOfClass = objc_opt_isKindOfClass(v10, v11);

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "setShowBackground:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
    -[TransitArtworkListView _metrics](self, "_metrics");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToConstant:", v14));
    objc_msgSend(v7, "addObject:", v13);

LABEL_4:
  }

}

- (id)_createSizeConstraintsForArtworkViews:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  __objc2_class **v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unsigned __int8 v26;
  double *v27;
  uint64_t v28;
  char isKindOfClass;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  double *v42;
  id v43;
  void *v44;
  uint64_t v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _BYTE v58[128];

  v4 = a3;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  -[TransitArtworkListView _metrics](self, "_metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v6 = v4;
  v46 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
  if (v46)
  {
    v7 = *(_QWORD *)v48;
    v42 = (double *)&v54 + 1;
    v8 = off_101198000;
    v43 = v6;
    v44 = v5;
    v45 = *(_QWORD *)v48;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v48 != v7)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v9);
        v11 = objc_opt_class(v8[70]);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        {
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "image"));
          if (v12)
          {
            v13 = (void *)v12;
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "image"));
            objc_msgSend(v14, "size");
            v16 = v15;

            if (v16 > 0.0)
            {
              v17 = v10;
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "image"));
              objc_msgSend(v18, "size");
              v20 = v19;
              v22 = v21;

              if (v22 <= 0.0)
                goto LABEL_18;
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "superview"));
              v24 = objc_opt_class(TransitArtworkSegmentContainer);
              if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0)
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "superview"));

                if (v25)
                {
                  v26 = objc_msgSend(v25, "showBackground");
                  v27 = v42;
                  if ((v26 & 1) != 0)
                    goto LABEL_22;
                }
              }
              else
              {

                v25 = 0;
              }
              v27 = (double *)&v53 + 1;
LABEL_22:
              v36 = v20 / v22;
              if (*v27 < v22)
                v22 = *v27;
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "heightAnchor", v42));
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToConstant:", v22));
              v57[0] = v32;
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "widthAnchor"));
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "heightAnchor"));
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:multiplier:", v37, v36));
              v57[1] = v38;
              v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v57, 2));
              v5 = v44;
              objc_msgSend(v44, "addObjectsFromArray:", v39);

              v6 = v43;
              v7 = v45;
              goto LABEL_17;
            }
          }
        }
        v28 = objc_opt_class(v8[70]);
        isKindOfClass = objc_opt_isKindOfClass(v10, v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "heightAnchor"));
        v17 = v30;
        if ((isKindOfClass & 1) != 0)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToConstant:", *((double *)&v53 + 1)));
          v56[0] = v25;
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "widthAnchor"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToConstant:", 0.0));
          v56[1] = v32;
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v56, 2));
          objc_msgSend(v5, "addObjectsFromArray:", v33);
        }
        else
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintLessThanOrEqualToConstant:", *((double *)&v53 + 1)));
          v55[0] = v25;
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "centerYAnchor"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "superview"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "centerYAnchor"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v33));
          v55[1] = v34;
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v55, 2));
          objc_msgSend(v5, "addObjectsFromArray:", v35);

          v7 = v45;
        }
LABEL_17:

        v8 = off_101198000;
LABEL_18:

        v9 = (char *)v9 + 1;
      }
      while (v46 != v9);
      v40 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
      v46 = v40;
    }
    while (v40);
  }

  return v5;
}

- (unint64_t)numberOfLines
{
  return -[MultilineWrappingListView numberOfLines](self->_multilineWrappingStackView, "numberOfLines");
}

- (double)singleLineWidth
{
  double result;

  -[MultilineWrappingListView singleLineWidth](self->_multilineWrappingStackView, "singleLineWidth");
  return result;
}

- (void)setVerticalContentHuggingPriority:(float)a3
{
  if (self->_verticalContentHuggingPriority != a3)
  {
    self->_verticalContentHuggingPriority = a3;
    -[MultilineWrappingListView setContentHuggingPriority:forAxis:](self->_multilineWrappingStackView, "setContentHuggingPriority:forAxis:", 1);
  }
}

- (void)setVerticalContentCompressionResistancePriority:(float)a3
{
  if (self->_verticalContentCompressionResistancePriority != a3)
  {
    self->_verticalContentCompressionResistancePriority = a3;
    -[MultilineWrappingListView setContentCompressionResistancePriority:forAxis:](self->_multilineWrappingStackView, "setContentCompressionResistancePriority:forAxis:", 1);
  }
}

+ (double)transitArtworkListHeight
{
  void *v3;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  objc_msgSend(a1, "_metricsForIdiom:", objc_msgSend(v3, "userInterfaceIdiom"));

  return v5;
}

- (UIImage)incidentBadgeImage
{
  return self->_incidentBadgeImage;
}

- (int64_t)shieldSize
{
  return self->_shieldSize;
}

- (void)setShieldSize:(int64_t)a3
{
  self->_shieldSize = a3;
}

- (unint64_t)separatorStyle
{
  return self->_separatorStyle;
}

- (void)setSeparatorStyle:(unint64_t)a3
{
  self->_separatorStyle = a3;
}

- (NSArray)artworkData
{
  return self->_artworkData;
}

- (UIColor)overrideTintColor
{
  return self->_overrideTintColor;
}

- (float)verticalContentHuggingPriority
{
  return self->_verticalContentHuggingPriority;
}

- (float)verticalContentCompressionResistancePriority
{
  return self->_verticalContentCompressionResistancePriority;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideTintColor, 0);
  objc_storeStrong((id *)&self->_artworkData, 0);
  objc_storeStrong((id *)&self->_incidentBadgeImage, 0);
  objc_storeStrong((id *)&self->_arrowImage, 0);
  objc_storeStrong((id *)&self->_maxWidthConstraint, 0);
  objc_storeStrong((id *)&self->_multilineWrappingStackView, 0);
  objc_storeStrong((id *)&self->_arrowImageViews, 0);
  objc_storeStrong((id *)&self->_artworkImageViews, 0);
}

@end
