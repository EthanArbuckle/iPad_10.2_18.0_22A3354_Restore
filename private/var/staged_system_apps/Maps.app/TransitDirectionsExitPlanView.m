@implementation TransitDirectionsExitPlanView

- (TransitDirectionsExitPlanView)initWithFrame:(CGRect)a3
{
  TransitDirectionsExitPlanView *v3;
  TransitDirectionsExitPlanView *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TransitDirectionsExitPlanView;
  v3 = -[TransitDirectionsBoardingInfoStackView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[TransitDirectionsExitPlanView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    v4->_maximumNumberOfVisibleCars = 3;
  }
  return v4;
}

- (id)topView
{
  UIStackView *carStackView;
  UIStackView *v4;
  UIStackView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  carStackView = self->_carStackView;
  if (!carStackView)
  {
    v4 = (UIStackView *)objc_msgSend(objc_alloc((Class)UIStackView), "initWithArrangedSubviews:", &__NSArray0__struct);
    v5 = self->_carStackView;
    self->_carStackView = v4;

    -[UIStackView setAccessibilityIdentifier:](self->_carStackView, "setAccessibilityIdentifier:", CFSTR("CarStackView"));
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_carStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](self->_carStackView, "setAxis:", 0);
    -[UIStackView setDistribution:](self->_carStackView, "setDistribution:", 0);
    -[UIStackView setAlignment:](self->_carStackView, "setAlignment:", 0);
    -[UIStackView setSpacing:](self->_carStackView, "setSpacing:", 2.0);
    LODWORD(v6) = 1148846080;
    -[UIStackView setContentHuggingPriority:forAxis:](self->_carStackView, "setContentHuggingPriority:forAxis:", 0, v6);
    LODWORD(v7) = 1148846080;
    -[UIStackView setContentHuggingPriority:forAxis:](self->_carStackView, "setContentHuggingPriority:forAxis:", 1, v7);
    LODWORD(v8) = 1148846080;
    -[UIStackView setContentCompressionResistancePriority:forAxis:](self->_carStackView, "setContentCompressionResistancePriority:forAxis:", 0, v8);
    LODWORD(v9) = 1148846080;
    -[UIStackView setContentCompressionResistancePriority:forAxis:](self->_carStackView, "setContentCompressionResistancePriority:forAxis:", 1, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView heightAnchor](self->_carStackView, "heightAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToConstant:", 20.0));
    objc_msgSend(v11, "setActive:", 1);

    -[TransitDirectionsExitPlanView addSubview:](self, "addSubview:", self->_carStackView);
    carStackView = self->_carStackView;
  }
  return carStackView;
}

- (id)bottomView
{
  MKMultiPartLabel *label;
  MKMultiPartLabel *v4;
  MKMultiPartLabel *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  label = self->_label;
  if (!label)
  {
    v4 = (MKMultiPartLabel *)objc_msgSend(objc_alloc((Class)MKMultiPartLabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_label;
    self->_label = v4;

    -[MKMultiPartLabel setAccessibilityIdentifier:](self->_label, "setAccessibilityIdentifier:", CFSTR("Label"));
    -[MKMultiPartLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[MKMultiPartLabel setTextColor:](self->_label, "setTextColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
    -[MKMultiPartLabel setFont:](self->_label, "setFont:", v7);

    -[MKMultiPartLabel setTextInset:](self->_label, "setTextInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    -[MKMultiPartLabel setLineBreakMode:](self->_label, "setLineBreakMode:", 0);
    -[MKMultiPartLabel setNumberOfLines:](self->_label, "setNumberOfLines:", 2);
    -[MKMultiPartLabel setUserInteractionEnabled:](self->_label, "setUserInteractionEnabled:", 0);
    LODWORD(v8) = 1148846080;
    -[MKMultiPartLabel setContentCompressionResistancePriority:forAxis:](self->_label, "setContentCompressionResistancePriority:forAxis:", 1, v8);
    LODWORD(v9) = 1148829696;
    -[MKMultiPartLabel setContentCompressionResistancePriority:forAxis:](self->_label, "setContentCompressionResistancePriority:forAxis:", 0, v9);
    LODWORD(v10) = 1148846080;
    -[MKMultiPartLabel setContentHuggingPriority:forAxis:](self->_label, "setContentHuggingPriority:forAxis:", 1, v10);
    LODWORD(v11) = 1112014848;
    -[MKMultiPartLabel setContentHuggingPriority:forAxis:](self->_label, "setContentHuggingPriority:forAxis:", 0, v11);
    -[TransitDirectionsExitPlanView addSubview:](self, "addSubview:", self->_label);
    label = self->_label;
  }
  return label;
}

- (void)setText:(id)a3
{
  id v5;
  GEOComposedString *text;
  unint64_t v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSAttributedStringKey v15;
  void *v16;

  v5 = a3;
  text = self->_text;
  v7 = (unint64_t)v5;
  v8 = text;
  if (v7 | (unint64_t)v8)
  {
    v9 = v8;
    v10 = objc_msgSend((id)v7, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_text, a3);
      if (v7)
      {
        v11 = objc_msgSend(objc_alloc((Class)MKServerFormattedString), "initWithComposedString:", v7);
        v15 = NSFontAttributeName;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MKMultiPartLabel font](self->_label, "font"));
        v16 = v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "multiPartAttributedStringWithAttributes:", v13));
        -[MKMultiPartLabel setMultiPartString:](self->_label, "setMultiPartString:", v14);

      }
      else
      {
        -[MKMultiPartLabel setMultiPartString:](self->_label, "setMultiPartString:", 0);
      }
    }
  }

}

- (void)setNumberOfCars:(unint64_t)a3
{
  if (self->_numberOfCars != a3)
  {
    self->_numberOfCars = a3;
    -[TransitDirectionsExitPlanView _updateCars](self, "_updateCars");
  }
}

- (void)setMaximumNumberOfVisibleCars:(unint64_t)a3
{
  if (self->_maximumNumberOfVisibleCars != a3)
  {
    self->_maximumNumberOfVisibleCars = a3;
    -[TransitDirectionsExitPlanView _updateCars](self, "_updateCars");
  }
}

- (void)setIndexSetOfSuggestedCars:(id)a3
{
  id v4;
  NSIndexSet *indexSetOfSuggestedCars;
  id v6;
  unsigned __int8 v7;
  NSIndexSet *v8;
  NSIndexSet *v9;
  unint64_t v10;

  v4 = a3;
  indexSetOfSuggestedCars = self->_indexSetOfSuggestedCars;
  v10 = (unint64_t)v4;
  v6 = indexSetOfSuggestedCars;
  if (v10 | (unint64_t)v6)
  {
    v7 = objc_msgSend((id)v10, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      v8 = (NSIndexSet *)objc_msgSend((id)v10, "copy");
      v9 = self->_indexSetOfSuggestedCars;
      self->_indexSetOfSuggestedCars = v8;

      -[TransitDirectionsExitPlanView _updateSuggestedCarTinting](self, "_updateSuggestedCarTinting");
    }
  }

}

- (NSIndexSet)indexSetOfSuggestedCars
{
  NSIndexSet *indexSetOfSuggestedCars;
  NSIndexSet *v4;
  NSIndexSet *v5;

  indexSetOfSuggestedCars = self->_indexSetOfSuggestedCars;
  if (!indexSetOfSuggestedCars)
  {
    v4 = (NSIndexSet *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSet](NSIndexSet, "indexSet"));
    v5 = self->_indexSetOfSuggestedCars;
    self->_indexSetOfSuggestedCars = v4;

    indexSetOfSuggestedCars = self->_indexSetOfSuggestedCars;
  }
  return indexSetOfSuggestedCars;
}

- (void)_updateCars
{
  id v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double y;
  double width;
  double height;
  AutolayoutImageView *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSArray *v26;
  NSArray *cars;
  TransitDirectionsExitPlanView *v28;
  id v29;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = -[TransitDirectionsExitPlanView numberOfCars](self, "numberOfCars");
  if (v5 >= -[TransitDirectionsExitPlanView maximumNumberOfVisibleCars](self, "maximumNumberOfVisibleCars"))
    v6 = -[TransitDirectionsExitPlanView maximumNumberOfVisibleCars](self, "maximumNumberOfVisibleCars");
  else
    v6 = -[TransitDirectionsExitPlanView numberOfCars](self, "numberOfCars");
  v7 = v6;
  if (!v6)
    goto LABEL_19;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("transit-exitplan-front")));
  v28 = self;
  if (v7 == 1)
  {
    v9 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("transit-exitplan-rear")));
    if (v7 >= 3)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("transit-exitplan-middle")));
      goto LABEL_10;
    }
  }
  v10 = 0;
LABEL_10:
  v11 = 0;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  do
  {
    v15 = -[AutolayoutImageView initWithFrame:]([AutolayoutImageView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    LODWORD(v16) = 1148846080;
    -[AutolayoutImageView setContentHuggingPriority:forAxis:](v15, "setContentHuggingPriority:forAxis:", 0, v16);
    LODWORD(v17) = 1148846080;
    -[AutolayoutImageView setContentHuggingPriority:forAxis:](v15, "setContentHuggingPriority:forAxis:", 1, v17);
    LODWORD(v18) = 1148846080;
    -[AutolayoutImageView setContentCompressionResistancePriority:forAxis:](v15, "setContentCompressionResistancePriority:forAxis:", 0, v18);
    LODWORD(v19) = 1148846080;
    -[AutolayoutImageView setContentCompressionResistancePriority:forAxis:](v15, "setContentCompressionResistancePriority:forAxis:", 1, v19);
    if (v7 - 1 == v11)
      v20 = v9;
    else
      v20 = v10;
    if (v11)
      v21 = v20;
    else
      v21 = v8;
    -[AutolayoutImageView setImage:](v15, "setImage:", v21, v28);
    objc_msgSend(v3, "addObject:", v15);
    objc_msgSend(v4, "addObject:", v15);

    ++v11;
  }
  while (v7 != v11);

  self = v28;
LABEL_19:
  v29 = v3;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsExitPlanView traitCollection](self, "traitCollection"));
  v23 = objc_msgSend(v22, "layoutDirection");

  v24 = v29;
  if (!v23)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "reverseObjectEnumerator"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "allObjects"));

  }
  v26 = (NSArray *)objc_msgSend(v4, "copy");
  cars = self->_cars;
  self->_cars = v26;

  -[UIStackView _maps_setArrangedSubviews:](self->_carStackView, "_maps_setArrangedSubviews:", v24);
  -[TransitDirectionsExitPlanView _updateSuggestedCarTinting](self, "_updateSuggestedCarTinting");

}

- (void)_updateSuggestedCarTinting
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (-[NSArray count](self->_cars, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = self->_cars;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray3Color](UIColor, "systemGray3Color"));
          objc_msgSend(v8, "setTintColor:", v9);

          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsExitPlanView indexSetOfSuggestedCars](self, "indexSetOfSuggestedCars"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100991E34;
    v11[3] = &unk_1011B1E88;
    v11[4] = self;
    objc_msgSend(v10, "enumerateIndexesUsingBlock:", v11);

  }
}

- (unint64_t)_visibleCarIndexForCar:(unint64_t)a3
{
  NSUInteger v5;
  unint64_t v6;

  v5 = -[NSArray count](self->_cars, "count");
  if (!v5)
    return 0x7FFFFFFFFFFFFFFFLL;
  if (!a3)
    return 0;
  v6 = v5;
  if ((char *)-[TransitDirectionsExitPlanView numberOfCars](self, "numberOfCars") - 1 == (_BYTE *)a3)
    return v6 - 1;
  else
    return vcvtas_u32_f32((float)((float)a3 / (float)-[TransitDirectionsExitPlanView numberOfCars](self, "numberOfCars")) * (float)v6);
}

- (unint64_t)maximumNumberOfVisibleCars
{
  return self->_maximumNumberOfVisibleCars;
}

- (GEOComposedString)text
{
  return self->_text;
}

- (unint64_t)numberOfCars
{
  return self->_numberOfCars;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_indexSetOfSuggestedCars, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_cars, 0);
  objc_storeStrong((id *)&self->_carStackView, 0);
}

@end
