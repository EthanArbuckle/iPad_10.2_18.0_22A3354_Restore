@implementation SARSearchResultTableViewCell

- (SARSearchResultTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SARSearchResultTableViewCell *v4;
  SARSearchResultTableViewCell *v5;
  void *v6;
  id v7;
  uint64_t v8;
  char IsEnabled_Maps182;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SARSearchResultTableViewCell *v18;
  void *v19;
  void *v20;
  void *v21;
  NUIContainerStackView *containerStackView;
  void *v23;
  int IsEnabled_DrivingMultiWaypointRoutes;
  uint64_t v25;
  BackgroundColorButton *actionButton;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NUIContainerStackView *v46;
  _QWORD v48[4];
  SARSearchResultTableViewCell *v49;
  objc_super v50;

  v50.receiver = self;
  v50.super_class = (Class)SARSearchResultTableViewCell;
  v4 = -[_SearchResultTableViewCell initWithStyle:reuseIdentifier:](&v50, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SARSearchResultTableViewCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("SARSearchResultTableViewCell"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v7 = objc_msgSend(v6, "navigationTransportType");
    switch((int)v7)
    {
      case 1:
      case 6:

        goto LABEL_9;
      case 2:
        IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182(v7);
        goto LABEL_6;
      case 3:
        IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420(v7);
LABEL_6:
        v10 = IsEnabled_Maps182;

        if ((v10 & 1) != 0)
          goto LABEL_7;
        goto LABEL_9;
      default:
        IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v7, v8);

        if (IsEnabled_DrivingMultiWaypointRoutes)
        {
LABEL_7:
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
          objc_msgSend(v11, "setImagePlacement:", 1);
          objc_msgSend(v11, "setButtonSize:", 3);
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "background"));
          objc_msgSend(v13, "setBackgroundColor:", v12);

          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "background"));
          objc_msgSend(v14, "setCornerRadius:", 13.0);

          v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("plus.circle.fill")));
          objc_msgSend(v11, "setImage:", v15);

          objc_msgSend(v11, "setImagePadding:", 6.0);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("ADD_STOP"), CFSTR("localized string not found"), 0));
          objc_msgSend(v11, "setTitle:", v17);

          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_10083D01C;
          v48[3] = &unk_1011AFCC0;
          v18 = v5;
          v49 = v18;
          objc_msgSend(v11, "setTitleTextAttributesTransformer:", v48);
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v11, 0));
          -[SARSearchResultTableViewCell setAddStopButton:](v18, "setAddStopButton:", v19);

          v20 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell addStopButton](v18, "addStopButton"));
          objc_msgSend(v20, "setAccessibilityIdentifier:", CFSTR("SARAddStopButton"));

          v21 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell addStopButton](v18, "addStopButton"));
          objc_msgSend(v21, "addTarget:action:forControlEvents:", v18, "_buttonAction", 0x2000);

          containerStackView = v18->super._containerStackView;
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell addStopButton](v18, "addStopButton"));
          -[NUIContainerStackView addArrangedSubview:](containerStackView, "addArrangedSubview:", v23);

        }
        else
        {
LABEL_9:
          v25 = objc_claimAutoreleasedReturnValue(+[BackgroundColorButton buttonWithType:](BackgroundColorButton, "buttonWithType:", 0));
          actionButton = v5->_actionButton;
          v5->_actionButton = (BackgroundColorButton *)v25;

          -[BackgroundColorButton setMinimumLayoutSize:](v5->_actionButton, "setMinimumLayoutSize:", 64.0, 64.0);
          -[BackgroundColorButton setMaximumLayoutSize:](v5->_actionButton, "setMaximumLayoutSize:", 64.0, 64.0);
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell actionButton](v5, "actionButton"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "layer"));
          objc_msgSend(v28, "setCornerRadius:", 12.0);

          v29 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell actionButton](v5, "actionButton"));
          objc_msgSend(v29, "setClipsToBounds:", 1);

          v30 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell actionButton](v5, "actionButton"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "titleLabel"));
          objc_msgSend(v31, "setAdjustsFontSizeToFitWidth:", 1);

          v32 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell actionButton](v5, "actionButton"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "titleLabel"));
          objc_msgSend(v33, "setMinimumScaleFactor:", 0.5);

          v34 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell actionButton](v5, "actionButton"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "titleLabel"));
          objc_msgSend(v35, "setBaselineAdjustment:", 1);

          v36 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell actionButton](v5, "actionButton"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "titleLabel"));
          objc_msgSend(v37, "setAllowsDefaultTighteningForTruncation:", 1);

          v38 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell actionButton](v5, "actionButton"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "titleLabel"));
          +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v39, &stru_1011E7BB8);

          v40 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell actionButton](v5, "actionButton"));
          objc_msgSend(v40, "setContentEdgeInsets:", 0.0, 6.0, 0.0, 6.0);

          v41 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell actionButton](v5, "actionButton"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("GO_SAR"), CFSTR("localized string not found"), 0));
          objc_msgSend(v41, "setTitle:forState:", v43, 0);

          v44 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell actionButton](v5, "actionButton"));
          objc_msgSend(v44, "addTarget:action:forControlEvents:", v5, "_buttonAction", 0x2000);

          v45 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell actionButton](v5, "actionButton"));
          objc_msgSend(v45, "setAccessibilityIdentifier:", CFSTR("SARGoButton"));

          v46 = v5->super._containerStackView;
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell actionButton](v5, "actionButton"));
          -[NUIContainerStackView addArrangedSubview:](v46, "addArrangedSubview:", v11);
        }

        break;
    }
  }
  return v5;
}

- (void)didUpdateMapItem
{
  id v3;
  uint64_t v4;
  uint64_t IsEnabled_DrivingMultiWaypointRoutes;
  uint64_t IsEnabled_Maps420;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SARSearchResultTableViewCell;
  v3 = -[_SearchResultTableViewCell didUpdateMapItem](&v17, "didUpdateMapItem");
  IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v3, v4);
  if ((IsEnabled_DrivingMultiWaypointRoutes & 1) != 0
    || (IsEnabled_Maps420 = MapsFeature_IsEnabled_Maps420(IsEnabled_DrivingMultiWaypointRoutes),
        (IsEnabled_Maps420 & 1) != 0)
    || MapsFeature_IsEnabled_Maps182(IsEnabled_Maps420))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_detourInfo"));
    if (v8)
    {

    }
    else
    {
      -[SARSearchResultTableViewCell travelTime](self, "travelTime");
      v10 = v9;

      if (v10 != 0.0)
        return;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell addStopButton](self, "addStopButton"));
      objc_msgSend(v11, "setEnabled:", 0);

      v12 = objc_alloc((Class)MKETAProvider);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));
      v14 = objc_msgSend(v12, "initWithMapItem:", v13);
      -[SARSearchResultTableViewCell setEtaProvider:](self, "setEtaProvider:", v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell etaProvider](self, "etaProvider"));
      objc_msgSend(v15, "setAllowsDistantETA:", 1);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell etaProvider](self, "etaProvider"));
      objc_msgSend(v16, "addObserver:", self);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell etaProvider](self, "etaProvider"));
      objc_msgSend(v7, "start");
    }

  }
}

- (id)attributedTitleString
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t IsEnabled_DrivingMultiWaypointRoutes;
  uint64_t IsEnabled_Maps420;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v13;
  NSAttributedStringKey v14;
  void *v15;

  v13.receiver = self;
  v13.super_class = (Class)SARSearchResultTableViewCell;
  v2 = -[_SearchResultTableViewCell attributedTitleString](&v13, "attributedTitleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v3, v4);
  if (((IsEnabled_DrivingMultiWaypointRoutes & 1) != 0
     || (IsEnabled_Maps420 = MapsFeature_IsEnabled_Maps420(IsEnabled_DrivingMultiWaypointRoutes),
         (IsEnabled_Maps420 & 1) != 0)
     || MapsFeature_IsEnabled_Maps182(IsEnabled_Maps420))
    && v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system20Bold](UIFont, "system20Bold"));
    v8 = objc_alloc((Class)NSAttributedString);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "string"));
    v14 = NSFontAttributeName;
    v15 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    v11 = objc_msgSend(v8, "initWithString:attributes:", v9, v10);

  }
  else
  {
    v11 = v3;
  }

  return v11;
}

- (void)ETAProviderUpdated:(id)a3
{
  id v4;
  double v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  objc_msgSend(v4, "etaTravelTime");
  if (v5 != 0.0)
  {
    objc_msgSend(v4, "etaTravelTime");
    -[SARSearchResultTableViewCell setTravelTime:](self, "setTravelTime:");
    v7.receiver = self;
    v7.super_class = (Class)SARSearchResultTableViewCell;
    -[_SearchResultTableViewCell updateContent](&v7, "updateContent");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell addStopButton](self, "addStopButton"));
    objc_msgSend(v6, "setEnabled:", 1);

  }
}

- (id)titleFont
{
  return +[UIFont system20Semibold](UIFont, "system20Semibold");
}

- (id)titleRegularFont
{
  return +[UIFont system20](UIFont, "system20");
}

- (double)trailingMargin
{
  return 16.0;
}

- (void)setupPlaceContextContent:(id)a3
{
  NUIContainerStackView *labelStackView;
  objc_super v4;

  labelStackView = self->super._labelStackView;
  v4.receiver = self;
  v4.super_class = (Class)SARSearchResultTableViewCell;
  -[_SearchResultTableViewCell setupPlaceContextContent:inStackView:](&v4, "setupPlaceContextContent:inStackView:", a3, labelStackView);
}

- (void)updateTheme
{
  void *v3;
  id v4;
  uint64_t v5;
  char IsEnabled_Maps182;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SARSearchResultTableViewCell;
  -[_SearchResultTableViewCell updateTheme](&v17, "updateTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v4 = objc_msgSend(v3, "navigationTransportType");
  switch((int)v4)
  {
    case 1:
    case 6:

      goto LABEL_7;
    case 2:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182(v4);
      break;
    case 3:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420(v4);
      break;
    default:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v4, v5);
      break;
  }
  v7 = IsEnabled_Maps182;

  if ((v7 & 1) == 0)
  {
LABEL_7:
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell theme](self, "theme"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell actionButton](self, "actionButton"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "greenButtonBackgroundColor:", 0));
    objc_msgSend(v9, "setBackgroundColor:forState:", v10, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell actionButton](self, "actionButton"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "greenButtonBackgroundColor:", 1));
    objc_msgSend(v11, "setBackgroundColor:forState:", v12, 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell actionButton](self, "actionButton"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "greenButtonTitleColor:", 0));
    objc_msgSend(v13, "setTitleColor:forState:", v14, 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell actionButton](self, "actionButton"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "greenButtonTitleColor:", 1));
    objc_msgSend(v15, "setTitleColor:forState:", v16, 1);

  }
}

- (id)attributedFirstPartDetailString
{
  uint64_t IsEnabled_DrivingMultiWaypointRoutes;
  uint64_t IsEnabled_Maps420;
  void *v5;
  __CFString *v6;
  id v7;
  const __CFString *v8;
  id v9;
  uint64_t v10;
  id v11;

  IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(self, a2);
  if (((IsEnabled_DrivingMultiWaypointRoutes & 1) != 0
     || (IsEnabled_Maps420 = MapsFeature_IsEnabled_Maps420(IsEnabled_DrivingMultiWaypointRoutes),
         (IsEnabled_Maps420 & 1) != 0)
     || MapsFeature_IsEnabled_Maps182(IsEnabled_Maps420))
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem")),
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_distanceStringFromDetourInformation")),
        v5,
        v6))
  {
    v7 = objc_alloc((Class)NSAttributedString);
    v8 = v6;
  }
  else
  {
    v9 = objc_alloc((Class)NSAttributedString);
    v10 = objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell distanceString](self, "distanceString"));
    v6 = (__CFString *)v10;
    if (v10)
      v8 = (const __CFString *)v10;
    else
      v8 = &stru_1011EB268;
    v7 = v9;
  }
  v11 = objc_msgSend(v7, "initWithString:", v8);

  return v11;
}

- (id)attributedSecondPartDetailString
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  char IsEnabled_Maps182;
  char v13;
  id v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  id v18;
  int IsEnabled_DrivingMultiWaypointRoutes;
  id v20;
  const __CFString *v21;
  void *v22;
  _QWORD v24[2];
  _QWORD v25[2];
  NSAttributedStringKey v26;
  void *v27;

  self->super._onlyDistanceOrEmpty = 0;
  -[SARSearchResultTableViewCell travelTime](self, "travelTime");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));
  v6 = v5;
  if (v4 == 0.0)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_detourTextForIdiom:", 0));
  }
  else
  {
    -[SARSearchResultTableViewCell travelTime](self, "travelTime");
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_maps_detourTextForIdiom:travelTime:", 0));
  }
  v8 = (__CFString *)v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v10 = objc_msgSend(v9, "navigationTransportType");
  switch((int)v10)
  {
    case 1:
    case 6:

      goto LABEL_14;
    case 2:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182(v10);
      goto LABEL_8;
    case 3:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420(v10);
LABEL_8:
      v13 = IsEnabled_Maps182;

      if ((v13 & 1) != 0)
        goto LABEL_9;
      goto LABEL_14;
    default:
      IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v10, v11);

      if (IsEnabled_DrivingMultiWaypointRoutes)
      {
LABEL_9:
        v14 = objc_alloc((Class)NSAttributedString);
        if (v8)
          v15 = v8;
        else
          v15 = &stru_1011EB268;
        v26 = NSFontAttributeName;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
        v27 = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
        v18 = objc_msgSend(v14, "initWithString:attributes:", v15, v17);
      }
      else
      {
LABEL_14:
        v20 = objc_alloc((Class)NSAttributedString);
        if (v8)
          v21 = v8;
        else
          v21 = &stru_1011EB268;
        v24[0] = NSForegroundColorAttributeName;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
        v25[0] = v16;
        v24[1] = NSFontAttributeName;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15Bold](UIFont, "system15Bold"));
        v25[1] = v17;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2));
        v18 = objc_msgSend(v20, "initWithString:attributes:", v21, v22);

      }
      return v18;
  }
}

- (void)_buttonAction
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "searchResultTableViewCellDidTapActionButton:");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell delegate](self, "delegate"));
    objc_msgSend(v5, "searchResultTableViewCellDidTapActionButton:", self);

  }
}

- (void)prepareForReuse
{
  id v3;
  uint64_t v4;
  uint64_t IsEnabled_DrivingMultiWaypointRoutes;
  uint64_t IsEnabled_Maps420;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SARSearchResultTableViewCell;
  v3 = -[_SearchResultTableViewCell prepareForReuse](&v9, "prepareForReuse");
  IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v3, v4);
  if ((IsEnabled_DrivingMultiWaypointRoutes & 1) != 0
    || (IsEnabled_Maps420 = MapsFeature_IsEnabled_Maps420(IsEnabled_DrivingMultiWaypointRoutes),
        (IsEnabled_Maps420 & 1) != 0)
    || MapsFeature_IsEnabled_Maps182(IsEnabled_Maps420))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell etaProvider](self, "etaProvider"));
    objc_msgSend(v7, "cancel");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SARSearchResultTableViewCell etaProvider](self, "etaProvider"));
    objc_msgSend(v8, "removeObserver:", self);

    -[SARSearchResultTableViewCell setEtaProvider:](self, "setEtaProvider:", 0);
  }
}

- (SARSearchResultTableViewCellDelegate)delegate
{
  return (SARSearchResultTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BackgroundColorButton)actionButton
{
  return self->_actionButton;
}

- (MKETAProvider)etaProvider
{
  return self->_etaProvider;
}

- (void)setEtaProvider:(id)a3
{
  objc_storeStrong((id *)&self->_etaProvider, a3);
}

- (double)travelTime
{
  return self->_travelTime;
}

- (void)setTravelTime:(double)a3
{
  self->_travelTime = a3;
}

- (UIButton)addStopButton
{
  return self->_addStopButton;
}

- (void)setAddStopButton:(id)a3
{
  objc_storeStrong((id *)&self->_addStopButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addStopButton, 0);
  objc_storeStrong((id *)&self->_etaProvider, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
