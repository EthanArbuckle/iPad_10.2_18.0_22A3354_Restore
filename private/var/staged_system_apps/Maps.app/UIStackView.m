@implementation UIStackView

- (void)_maps_setArrangedSubviews:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self, "arrangedSubviews"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v5));

  objc_msgSend(v6, "removeObjectsInArray:", v4);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        -[UIStackView _maps_removeArrangedSubview:](self, "_maps_removeArrangedSubview:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v9);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)j);
        -[UIStackView removeArrangedSubview:](self, "removeArrangedSubview:", v17, (_QWORD)v18);
        -[UIStackView addArrangedSubview:](self, "addArrangedSubview:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

}

- (void)_maps_setArrangedSubviews:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void **v19;
  uint64_t v20;
  id (*v21)(uint64_t);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  UIStackView *v28;
  _QWORD v29[4];
  id v30;
  UIStackView *v31;

  v8 = a5;
  v9 = a3;
  if (a4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self, "arrangedSubviews"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "differenceFromArray:", v10));

    if (objc_msgSend(v11, "hasChanges"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[GroupAnimation animation](GroupAnimation, "animation"));
      objc_msgSend(v12, "setDuration:", UINavigationControllerHideShowBarDuration);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "removals"));
      v14 = objc_msgSend(v13, "count");

      if (v14)
      {
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_1002A8010;
        v29[3] = &unk_1011AC8B0;
        v30 = v11;
        v31 = self;
        objc_msgSend(v12, "addAnimations:", v29);

      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[GroupAnimation animation](GroupAnimation, "animation"));
      objc_msgSend(v15, "setDuration:", UINavigationControllerHideShowBarDuration);
      objc_msgSend(v15, "setPreventsAnimationDuringPreparation:", 1);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1002A8138;
      v26[3] = &unk_1011AC8B0;
      v9 = v11;
      v27 = v9;
      v28 = self;
      objc_msgSend(v15, "addPreparation:", v26);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "insertions"));
      v17 = objc_msgSend(v16, "count");

      if (v17)
      {
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1002A8338;
        v24[3] = &unk_1011AC860;
        v25 = v9;
        objc_msgSend(v15, "addAnimations:", v24);

      }
      if (v8)
        objc_msgSend(v15, "addCompletion:", v8);
      v19 = _NSConcreteStackBlock;
      v20 = 3221225472;
      v21 = sub_1002A8444;
      v22 = &unk_1011AE8F8;
      v23 = v15;
      v18 = v15;
      objc_msgSend(v12, "addCompletion:", &v19);
      objc_msgSend(v12, "runWithCurrentOptions", v19, v20, v21, v22);

    }
    else
    {
      v9 = v11;
    }
  }
  else
  {
    -[UIStackView _maps_setArrangedSubviews:](self, "_maps_setArrangedSubviews:", v9);
  }

}

- (void)_maps_removeArrangedSubview:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView subviews](self, "subviews"));
    v5 = objc_msgSend(v4, "containsObject:", v6);

    if (v5)
    {
      -[UIStackView removeArrangedSubview:](self, "removeArrangedSubview:", v6);
      objc_msgSend(v6, "removeFromSuperview");
    }
  }

}

+ (id)_maps_StackWithAxis:(int64_t)a3
{
  id v4;

  v4 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "setDistribution:", 0);
  objc_msgSend(v4, "setAlignment:", 0);
  objc_msgSend(v4, "setAxis:", a3);
  return v4;
}

+ (id)_maps_VStack
{
  return +[UIStackView _maps_StackWithAxis:](UIStackView, "_maps_StackWithAxis:", 1);
}

+ (id)_maps_HStack
{
  return +[UIStackView _maps_StackWithAxis:](UIStackView, "_maps_StackWithAxis:", 0);
}

+ (id)_maps_Spacer:(double)a3 visibilityModel:(id)a4
{
  id v5;
  BannerContentSpacerView *v6;

  v5 = a4;
  v6 = -[BannerContentSpacerView initWithFrame:]([BannerContentSpacerView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[BannerContentSpacerView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BannerContentSpacerView setMinLength:](v6, "setMinLength:", a3);
  -[BannerContentVisibilityProxyView setVisibilityModel:](v6, "setVisibilityModel:", v5);

  return v6;
}

+ (id)_maps_Spacer:(double)a3
{
  return objc_msgSend(a1, "_maps_Spacer:visibilityModel:", 0, a3);
}

- (void)_configureSpacerIfNeeded:(id)a3 layoutPriority:(unint64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "axis") == (id)-1)
  {
    objc_msgSend(v10, "setAxis:", -[UIStackView axis](self, "axis"));
    if ((id)-[UIStackView axis](self, "axis") == (id)1)
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "heightAnchor"));
    else
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "widthAnchor"));
    v7 = (void *)v6;
    if (a4 == 1)
    {
      objc_msgSend(v10, "minLength");
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintGreaterThanOrEqualToConstant:"));
    }
    else
    {
      if (a4)
      {
LABEL_10:

        goto LABEL_11;
      }
      objc_msgSend(v10, "minLength");
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToConstant:"));
    }
    v9 = v8;
    objc_msgSend(v8, "setActive:", 1);

    goto LABEL_10;
  }
LABEL_11:

}

- (void)_addArrangedSubview:(id)a3 layoutPriority:(unint64_t)a4
{
  uint64_t v6;
  float v7;
  float v8;
  UILayoutConstraintAxis v9;
  double v10;
  float v11;
  float v12;
  UILayoutConstraintAxis v13;
  double v14;
  id v15;

  v15 = a3;
  v6 = objc_opt_class(BannerContentSpacerView);
  if ((objc_opt_isKindOfClass(v15, v6) & 1) != 0)
    -[UIStackView _configureSpacerIfNeeded:layoutPriority:](self, "_configureSpacerIfNeeded:layoutPriority:", v15, a4);
  if (a4 == 1)
  {
    v8 = 250.0;
  }
  else
  {
    if (a4)
      goto LABEL_10;
    objc_msgSend(v15, "contentHuggingPriorityForAxis:", -[UIStackView axis](self, "axis"));
    if (v7 >= 750.0)
      v8 = v7;
    else
      v8 = 750.0;
  }
  v9 = -[UIStackView axis](self, "axis");
  *(float *)&v10 = v8;
  objc_msgSend(v15, "setContentHuggingPriority:forAxis:", v9, v10);
LABEL_10:
  objc_msgSend(v15, "contentCompressionResistancePriorityForAxis:", -[UIStackView axis](self, "axis"));
  if (v11 >= 750.0)
    v12 = v11;
  else
    v12 = 750.0;
  v13 = -[UIStackView axis](self, "axis");
  *(float *)&v14 = v12;
  objc_msgSend(v15, "setContentCompressionResistancePriority:forAxis:", v13, v14);
  -[UIStackView addArrangedSubview:](self, "addArrangedSubview:", v15);

}

- (void)_maps_addArrangedContentHuggingSubview:(id)a3
{
  -[UIStackView _addArrangedSubview:layoutPriority:](self, "_addArrangedSubview:layoutPriority:", a3, 0);
}

- (void)_maps_addArrangedExpandingSubview:(id)a3
{
  -[UIStackView _addArrangedSubview:layoutPriority:](self, "_addArrangedSubview:layoutPriority:", a3, 1);
}

- (void)_addArrangedSubview:(id)a3 layoutPriority:(unint64_t)a4 padding:(BannerContentPadding)a5
{
  double var1;
  double var0;
  void *v9;
  void *v10;
  id v11;

  var1 = a5.var1;
  var0 = a5.var0;
  v11 = a3;
  if (var0 != 0.0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIStackView _maps_Spacer:visibilityModel:](UIStackView, "_maps_Spacer:visibilityModel:", v11, var0));
    -[UIStackView _maps_addArrangedContentHuggingSubview:](self, "_maps_addArrangedContentHuggingSubview:", v9);

  }
  -[UIStackView _addArrangedSubview:layoutPriority:](self, "_addArrangedSubview:layoutPriority:", v11, a4);
  if (var1 != 0.0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIStackView _maps_Spacer:visibilityModel:](UIStackView, "_maps_Spacer:visibilityModel:", v11, var1));
    -[UIStackView _maps_addArrangedContentHuggingSubview:](self, "_maps_addArrangedContentHuggingSubview:", v10);

  }
}

- (void)_maps_addArrangedContentHuggingSubview:(id)a3 padding:(BannerContentPadding)a4
{
  -[UIStackView _addArrangedSubview:layoutPriority:padding:](self, "_addArrangedSubview:layoutPriority:padding:", a3, 0, a4.var0, a4.var1);
}

- (void)_maps_addArrangedExpandingSubview:(id)a3 padding:(BannerContentPadding)a4
{
  -[UIStackView _addArrangedSubview:layoutPriority:padding:](self, "_addArrangedSubview:layoutPriority:padding:", a3, 1, a4.var0, a4.var1);
}

- (id)_maps_deepArrangedSubviews
{
  return -[UIStackView _maps_deepArrangedSubviewsExcluding:](self, "_maps_deepArrangedSubviewsExcluding:", 0);
}

- (id)_maps_deepArrangedSubviewsExcluding:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self, "arrangedSubviews", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v10);
        v12 = objc_opt_class(UIStackView);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0
          && (objc_msgSend(v4, "containsObject:", v11) & 1) == 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_maps_deepArrangedSubviews"));
          objc_msgSend(v5, "addObjectsFromArray:", v13);

        }
        objc_msgSend(v5, "addObject:", v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = objc_msgSend(v5, "copy");
  return v14;
}

@end
