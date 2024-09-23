@implementation MapsBannerContentView

- (void)setCenterBodyContent:(BOOL)a3
{
  if (self->_centerBodyContent != a3)
  {
    self->_centerBodyContent = a3;
    -[MapsBannerContentView _updateContent](self, "_updateContent");
  }
}

- (void)setContent:(id)a3
{
  MapsBannerContent *v4;
  UIStackView *vStack;
  UIStackView *v6;
  UIStackView *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  UIStackView *v19;
  void *v20;
  UIStackView *v21;
  void *v22;
  void *v23;
  UIStackView *v24;
  void *v25;
  MapsBannerContent *content;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v4 = (MapsBannerContent *)a3;
  vStack = self->_vStack;
  if (!vStack)
  {
    v6 = (UIStackView *)objc_claimAutoreleasedReturnValue(+[UIStackView _maps_VStack](UIStackView, "_maps_VStack"));
    v7 = self->_vStack;
    self->_vStack = v6;

    -[UIStackView setAccessibilityIdentifier:](self->_vStack, "setAccessibilityIdentifier:", CFSTR("MainVerticalStack"));
    -[MapsBannerContentView addSubview:](self, "addSubview:", self->_vStack);
    LODWORD(v8) = 1148846080;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView _maps_constraintsEqualToEdgesOfView:priority:](self->_vStack, "_maps_constraintsEqualToEdgesOfView:priority:", self, v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v10);

    vStack = self->_vStack;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerContentView content](self, "content", 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allViews"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView _maps_deepArrangedSubviewsExcluding:](vStack, "_maps_deepArrangedSubviewsExcluding:", v12));

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v17), "removeFromSuperview");
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v15);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerContent headerView](v4, "headerView"));
  if (v18)
  {
    v19 = self->_vStack;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerContent headerView](v4, "headerView"));
    -[UIStackView _maps_addArrangedContentHuggingSubview:padding:](v19, "_maps_addArrangedContentHuggingSubview:padding:", v20, 0.0, 12.0);

  }
  v21 = self->_vStack;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerContentView _bodyView:](self, "_bodyView:", v4));
  -[UIStackView _maps_addArrangedContentHuggingSubview:padding:](v21, "_maps_addArrangedContentHuggingSubview:padding:", v22, 0.0, 5.0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerContent footerView](v4, "footerView"));
  if (v23)
  {
    v24 = self->_vStack;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerContent footerView](v4, "footerView"));
    -[UIStackView _maps_addArrangedContentHuggingSubview:padding:](v24, "_maps_addArrangedContentHuggingSubview:padding:", v25, 11.0, 0.0);

  }
  content = self->_content;
  self->_content = v4;

}

- (void)_updateContent
{
  -[MapsBannerContentView setContent:](self, "setContent:", self->_content);
}

- (id)_bodyView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  double v21;
  BannerContentVisibilityProxyView *v22;
  void *v23;
  uint64_t v24;
  char isKindOfClass;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  BannerContentVisibilityProxyView *v31;
  void *v32;
  void *v33;
  BannerContentVisibilityProxyView *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
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
  MapsBannerContentView *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  _BYTE v59[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIStackView _maps_HStack](UIStackView, "_maps_HStack"));
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("BodyViewHorizontalStack"));
  objc_msgSend(v5, "setAlignment:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iconView"));

  if (v6)
  {
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iconView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraints"));

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    v10 = 0.0;
    if (v9)
    {
      v11 = v9;
      v12 = *(_QWORD *)v55;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v55 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstItem"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iconView"));
          if (v15 == v16
            && objc_msgSend(v14, "firstAttribute") == (id)8
            && !objc_msgSend(v14, "relation")
            && !objc_msgSend(v14, "secondAttribute"))
          {
            objc_msgSend(v14, "constant");
            v18 = v17;

            if (v18 > 0.0)
            {
              objc_msgSend(v14, "constant");
              v10 = v21;
              goto LABEL_19;
            }
          }
          else
          {

          }
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v19 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
        v11 = v19;
      }
      while (v19);
    }
LABEL_19:

    v22 = (BannerContentVisibilityProxyView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iconView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingTopView"));
    v24 = objc_opt_class(UILabel);
    isKindOfClass = objc_opt_isKindOfClass(v23, v24);

    v20 = 0;
    if ((isKindOfClass & 1) != 0 && v10 > 0.0)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingTopView"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "font"));
      objc_msgSend(v52, "ascender");
      v27 = v26;
      objc_msgSend(v52, "lineHeight");
      v30 = UIRoundToViewScale(self, v29, v10 * (v27 / v28)) + -3.0;
      v31 = -[BannerContentVisibilityProxyView initWithFrame:]([BannerContentVisibilityProxyView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      -[BannerContentVisibilityProxyView setAccessibilityIdentifier:](v31, "setAccessibilityIdentifier:", CFSTR("IconProxyView"));
      -[BannerContentVisibilityProxyView setTranslatesAutoresizingMaskIntoConstraints:](v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iconView"));
      -[BannerContentVisibilityProxyView setVisibilityModel:](v31, "setVisibilityModel:", v32);

      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iconView"));
      -[BannerContentVisibilityProxyView addSubview:](v31, "addSubview:", v33);

      v34 = v31;
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[BannerContentVisibilityProxyView widthAnchor](v34, "widthAnchor"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iconView"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "widthAnchor"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
      v58[0] = v48;
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[BannerContentVisibilityProxyView heightAnchor](v34, "heightAnchor"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToConstant:", 0.0));
      v58[1] = v46;
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iconView"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "centerXAnchor"));
      v53 = self;
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[BannerContentVisibilityProxyView centerXAnchor](v34, "centerXAnchor"));

      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v35));
      v58[2] = v36;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iconView"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "topAnchor"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "firstBaselineAnchor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, -v30));
      v58[3] = v40;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v58, 4));

      self = v53;
      v22 = v34;
    }
    -[BannerContentVisibilityProxyView setAccessibilityIdentifier:](v22, "setAccessibilityIdentifier:", CFSTR("IconRepresentationView"));
    objc_msgSend(v5, "_maps_addArrangedContentHuggingSubview:padding:", v22, 2.0, 8.0);

  }
  else
  {
    v20 = 0;
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerContentView _bodyContentView:](self, "_bodyContentView:", v4));
  objc_msgSend(v5, "_maps_addArrangedExpandingSubview:padding:", v41, 2.0, 2.0);

  if (v20)
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);

  return v5;
}

- (id)_bodyContentView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIStackView _maps_VStack](UIStackView, "_maps_VStack"));
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("BodyContentVerticalStack"));
  if (-[MapsBannerContentView centerBodyContent](self, "centerBodyContent"))
    v6 = 3;
  else
    v6 = 1;
  objc_msgSend(v5, "setAlignment:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerContentView _topView:](self, "_topView:", v4));
  objc_msgSend(v5, "_maps_addArrangedExpandingSubview:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingTopView"));

  if (v8)
  {
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "widthAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "widthAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
    objc_msgSend(v11, "setActive:", 1);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomView"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomView"));
    objc_msgSend(v5, "_maps_addArrangedContentHuggingSubview:padding:", v13, 2.0, 0.0);

  }
  return v5;
}

- (id)_topView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIStackView _maps_HStack](UIStackView, "_maps_HStack"));
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("TopViewHorizontalStack"));
  objc_msgSend(v4, "setAlignment:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingTopView"));
  objc_msgSend(v4, "_maps_addArrangedExpandingSubview:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIStackView _maps_Spacer:](UIStackView, "_maps_Spacer:", 0.0));
  objc_msgSend(v4, "_maps_addArrangedContentHuggingSubview:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingTopView"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingTopView"));
    objc_msgSend(v4, "_maps_addArrangedContentHuggingSubview:padding:", v8, 30.0, 0.0);

  }
  return v4;
}

- (id)accessibilityIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self);
  return NSStringFromClass(v2);
}

- (BOOL)centerBodyContent
{
  return self->_centerBodyContent;
}

- (MapsBannerContent)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_vStack, 0);
}

@end
