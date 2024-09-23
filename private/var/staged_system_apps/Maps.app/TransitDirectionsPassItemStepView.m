@implementation TransitDirectionsPassItemStepView

- ($29727DC6989B69F22950FCD998EA20D4)_metrics
{
  void *v5;
  id v6;
  void *v7;
  $29727DC6989B69F22950FCD998EA20D4 *result;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  objc_super v16;

  retstr->var6 = 0.0;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v16.receiver = self;
  v16.super_class = (Class)TransitDirectionsPassItemStepView;
  -[$29727DC6989B69F22950FCD998EA20D4 _metrics](&v16, "_metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  v6 = objc_msgSend(v5, "type");

  if (v6 == (id)6)
  {
    retstr->var6 = 0.0;
    *(_OWORD *)&retstr->var2 = 0u;
    *(_OWORD *)&retstr->var4 = 0u;
    *(_OWORD *)&retstr->var0 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsPassItemStepView traitCollection](self, "traitCollection"));
    objc_msgSend(v7, "userInterfaceIdiom");

    retstr->var2 = 8.0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsPassItemStepView traitCollection](self, "traitCollection"));
    if (objc_msgSend(v9, "userInterfaceIdiom") == (id)5)
      v10 = 1.0;
    else
      v10 = 0.0;

    retstr->var0 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView primaryLabel](self, "primaryLabel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "font"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsPassItemStepView traitCollection](self, "traitCollection"));
    if (objc_msgSend(v13, "userInterfaceIdiom") == (id)5)
      v14 = 15.0;
    else
      v14 = 20.0;

    objc_msgSend(v12, "_scaledValueForValue:", v14);
    retstr->var2 = v15;

  }
  return result;
}

- (void)_updateFonts
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  UIFontTextStyle v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  TransitDirectionsPassItemStepView *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;

  if (sub_1002A8AA0(self) == 5)
    v3 = objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  else
    v3 = objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView primaryLabel](self, "primaryLabel"));
  objc_msgSend(v5, "setFont:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsPassItemStepView traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceIdiom");
  v8 = UIFontTextStyleBody;
  if (v7 != (id)5)
    v8 = UIFontTextStyleSubheadline;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fontDescriptor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_mapkit_fontDescriptorByAddingFeaturesForTimeDisplayUseMonospace:", 1));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v12, 0.0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView primaryAccessoryLabel](self, "primaryAccessoryLabel"));
  objc_msgSend(v14, "setFont:", v13);

  v15 = self;
  v22 = (id)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:", UIFontTextStyleSubheadline));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsPassItemStepView traitCollection](v15, "traitCollection"));

  v17 = objc_msgSend(v16, "userInterfaceIdiom");
  if (v17 == (id)5)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "fontDescriptor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_mapkit_fontDescriptorByAddingFeaturesForTimeDisplay"));

    v20 = objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v19, 0.0));
    v22 = (id)v20;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsInstructionsStepView secondaryAccessoryLabel](v15, "secondaryAccessoryLabel"));
  objc_msgSend(v21, "setFont:", v22);

}

- (double)bottomSpacerHeight
{
  void *v2;
  double v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsPassItemStepView traitCollection](self, "traitCollection"));
  if (objc_msgSend(v2, "userInterfaceIdiom") == (id)5)
    v3 = 1.0;
  else
    v3 = 0.0;

  return v3;
}

@end
