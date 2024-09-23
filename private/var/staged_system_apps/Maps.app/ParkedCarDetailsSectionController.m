@implementation ParkedCarDetailsSectionController

- (ParkedCarDetailsSectionController)initWithParkedCar:(id)a3
{
  ParkedCarDetailsSectionController *v3;
  ParkedCarDetailsSectionController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ParkedCarDetailsSectionController;
  v3 = -[ParkedCarSectionController initWithParkedCar:](&v6, "initWithParkedCar:", a3);
  v4 = v3;
  if (v3)
    -[ParkedCarDetailsSectionController _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  id v3;
  double y;
  double width;
  double height;
  MULabeledValueActionRowView *v7;
  MULabeledValueActionRowView *timestampRowView;
  MULabeledValueActionTextFieldRowView *v9;
  MULabeledValueActionTextFieldRowView *notesRowView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UGCPhotoCarouselController *v16;
  UGCPhotoCarouselController *photoCarouselController;
  id v18;
  UGCPhotoCarouselCell *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  MUPlaceSectionView *v24;
  MUPlaceSectionView *sectionView;
  id v26;

  v26 = objc_alloc_init((Class)NSMutableArray);
  v3 = objc_alloc((Class)MULabeledValueActionRowView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (MULabeledValueActionRowView *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  timestampRowView = self->_timestampRowView;
  self->_timestampRowView = v7;

  -[ParkedCarDetailsSectionController _updateTimestamp](self, "_updateTimestamp");
  objc_msgSend(v26, "addObject:", self->_timestampRowView);
  v9 = (MULabeledValueActionTextFieldRowView *)objc_msgSend(objc_alloc((Class)MULabeledValueActionTextFieldRowView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  notesRowView = self->_notesRowView;
  self->_notesRowView = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Notes [Parked Car]"), CFSTR("localized string not found"), 0));
  -[MULabeledValueActionTextFieldRowView setTitleText:](self->_notesRowView, "setTitleText:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _mapsui_accentColor](UIColor, "_mapsui_accentColor"));
  -[MULabeledValueActionTextFieldRowView setPlaceholderColor:](self->_notesRowView, "setPlaceholderColor:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Add Note [Parked Car]"), CFSTR("localized string not found"), 0));
  -[MULabeledValueActionTextFieldRowView setPlaceholderText:](self->_notesRowView, "setPlaceholderText:", v15);

  objc_msgSend(v26, "addObject:", self->_notesRowView);
  if (-[ParkedCarDetailsSectionController supportsAddingPhotos](self, "supportsAddingPhotos"))
  {
    v16 = -[UGCPhotoCarouselController initWithDelegate:maximumNumberOfPhotos:]([UGCPhotoCarouselController alloc], "initWithDelegate:maximumNumberOfPhotos:", self, 1);
    photoCarouselController = self->_photoCarouselController;
    self->_photoCarouselController = v16;

    v18 = objc_msgSend(objc_alloc((Class)MULabeledValueActionRowView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    v19 = -[UGCPhotoCarouselCell initWithFrame:]([UGCPhotoCarouselCell alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[UGCPhotoCarouselCell setSectionInset:](v19, "setSectionInset:", kMUPlaceSectionVerticalSpacing, kMUPlacePlatterPadding, kMUPlaceSectionVerticalSpacing, kMUPlacePlatterPadding);
    -[UGCPhotoCarouselCell setTranslatesAutoresizingMaskIntoConstraints:](v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UGCPhotoCarouselCell setCarouselController:](v19, "setCarouselController:", self->_photoCarouselController);
    objc_msgSend(v18, "addSubview:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselCell _maps_constraintsForCenteringInView:](v19, "_maps_constraintsForCenteringInView:", v18));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);

    objc_msgSend(v26, "addObject:", v18);
  }
  v21 = objc_msgSend(objc_alloc((Class)MUPlaceVerticalCardContainerView), "initWithShowsSeparators:", 1);
  v22 = objc_msgSend(v26, "copy");
  objc_msgSend(v21, "setRowViews:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarDetailsSectionController sectionHeaderViewModel](self, "sectionHeaderViewModel"));
  v24 = (MUPlaceSectionView *)objc_claimAutoreleasedReturnValue(+[MUPlaceSectionView cardShadowSectionViewForContentView:sectionHeaderViewModel:](MUPlaceSectionView, "cardShadowSectionViewForContentView:sectionHeaderViewModel:", v21, v23));
  sectionView = self->_sectionView;
  self->_sectionView = v24;

}

- (id)sectionHeaderViewModel
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc((Class)MUPlaceSectionHeaderViewModel);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Details [Parked Car]"), CFSTR("localized string not found"), 0));
  v5 = objc_msgSend(v2, "initWithTitleString:", v4);

  return v5;
}

- (BOOL)supportsAddingPhotos
{
  return +[PhotoOptionsPicker supportsSourceType:](PhotoOptionsPicker, "supportsSourceType:", 1);
}

- (BOOL)activateNotesTextField
{
  return -[MULabeledValueActionTextFieldRowView becomeFirstResponder](self->_notesRowView, "becomeFirstResponder");
}

- (BOOL)resignNotesTextField
{
  return -[MULabeledValueActionTextFieldRowView resignFirstResponder](self->_notesRowView, "resignFirstResponder");
}

- (void)updateFromParkedCar
{
  void *v3;
  void *v4;
  void *v5;
  UGCPhotoCarouselController *photoCarouselController;
  void *v7;
  void *v8;
  UGCPhotoCarouselController *v9;
  MULabeledValueActionTextFieldRowView *notesRowView;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarSectionController parkedCar](self, "parkedCar"));

  if (v3)
  {
    -[ParkedCarDetailsSectionController _updateTimestamp](self, "_updateTimestamp");
    -[ParkedCarDetailsSectionController _scheduleTimestampUpdateTimerIfNecessary](self, "_scheduleTimestampUpdateTimerIfNecessary");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarSectionController parkedCar](self, "parkedCar"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "image"));

    photoCarouselController = self->_photoCarouselController;
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarSectionController parkedCar](self, "parkedCar"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "image"));
      -[UGCPhotoCarouselController addImage:forIdentifier:](photoCarouselController, "addImage:forIdentifier:", v8, CFSTR("ParkedCarImageIdentifier"));

      goto LABEL_7;
    }
    v9 = self->_photoCarouselController;
  }
  else
  {
    v9 = self->_photoCarouselController;
  }
  -[UGCPhotoCarouselController removeImageForIdentifier:](v9, "removeImageForIdentifier:", CFSTR("ParkedCarImageIdentifier"));
LABEL_7:
  if ((-[MULabeledValueActionTextFieldRowView isEditing](self->_notesRowView, "isEditing") & 1) == 0)
  {
    notesRowView = self->_notesRowView;
    v12 = (id)objc_claimAutoreleasedReturnValue(-[ParkedCarSectionController parkedCar](self, "parkedCar"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "notes"));
    -[MULabeledValueActionTextFieldRowView setCurrentTextFieldValueIfNeeded:](notesRowView, "setCurrentTextFieldValueIfNeeded:", v11);

  }
}

- (id)sectionView
{
  return self->_sectionView;
}

- (UIImageView)photoImageView
{
  return (UIImageView *)-[UGCPhotoCarouselController visibleImageViewForIdentifier:](self->_photoCarouselController, "visibleImageViewForIdentifier:", CFSTR("ParkedCarImageIdentifier"));
}

- (void)photoCarouselController:(id)a3 requestsRemovingImageForIdentifier:(id)a4 completion:(id)a5
{
  void *v6;
  void (**v7)(id, uint64_t);

  v7 = (void (**)(id, uint64_t))a5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarDetailsSectionController detailsDelegate](self, "detailsDelegate"));
  objc_msgSend(v6, "parkedCarDetailsSectionControllerDidRemovePhoto:", self);

  v7[2](v7, 1);
}

- (void)photoCarouselControllerRequestsAddingNewPhoto:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ParkedCarDetailsSectionController detailsDelegate](self, "detailsDelegate", a3));
  objc_msgSend(v4, "parkedCarDetailsSectionControllerDidTapAddPhotos:", self);

}

- (void)photoCarouselController:(id)a3 didSelectImageWithIdentifier:(id)a4
{
  id v5;

  if (objc_msgSend(a4, "isEqualToString:", CFSTR("ParkedCarImageIdentifier")))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ParkedCarDetailsSectionController detailsDelegate](self, "detailsDelegate"));
    objc_msgSend(v5, "parkedCarDetailsSectionControllerDidTapViewPhoto:", self);

  }
}

- (void)setActive:(BOOL)a3
{
  NSTimer *timestampUpdateTimer;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ParkedCarDetailsSectionController;
  -[ParkedCarDetailsSectionController setActive:](&v5, "setActive:", a3);
  if (-[ParkedCarDetailsSectionController isActive](self, "isActive"))
  {
    -[ParkedCarDetailsSectionController _scheduleTimestampUpdateTimerIfNecessary](self, "_scheduleTimestampUpdateTimerIfNecessary");
  }
  else
  {
    -[NSTimer invalidate](self->_timestampUpdateTimer, "invalidate");
    timestampUpdateTimer = self->_timestampUpdateTimer;
    self->_timestampUpdateTimer = 0;

  }
}

- (void)_scheduleTimestampUpdateTimerIfNecessary
{
  NSTimer *v3;
  NSTimer *timestampUpdateTimer;

  if (-[ParkedCarDetailsSectionController isActive](self, "isActive"))
  {
    if (!self->_timestampUpdateTimer)
    {
      v3 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_updateTimestamp", 0, 1, 30.0));
      timestampUpdateTimer = self->_timestampUpdateTimer;
      self->_timestampUpdateTimer = v3;

    }
  }
}

- (void)_updateTimestamp
{
  NSDateComponentsFormatter *v3;
  NSDateComponentsFormatter *timestampFormatter;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (!self->_timestampFormatter)
  {
    v3 = (NSDateComponentsFormatter *)objc_alloc_init((Class)NSDateComponentsFormatter);
    timestampFormatter = self->_timestampFormatter;
    self->_timestampFormatter = v3;

    -[NSDateComponentsFormatter setUnitsStyle:](self->_timestampFormatter, "setUnitsStyle:", 3);
    -[NSDateComponentsFormatter setAllowedUnits:](self->_timestampFormatter, "setAllowedUnits:", 4220);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarSectionController parkedCar](self, "parkedCar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "date"));
  objc_msgSend(v5, "timeIntervalSinceDate:", v7);
  v9 = v8;

  if (v9 >= 21600.0)
    v10 = 1;
  else
    v10 = 2;
  -[NSDateComponentsFormatter setMaximumUnitCount:](self->_timestampFormatter, "setMaximumUnitCount:", v10);
  v17 = objc_alloc_init((Class)MULabeledValueActionViewModel);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Parked Car Header"), CFSTR("localized string not found"), 0));
  objc_msgSend(v17, "setTitleString:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  if (v9 <= 60.0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Just now [FindMyCar Place Card]"), CFSTR("localized string not found"), 0));
    objc_msgSend(v17, "setValueString:", v14);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("%@ ago [FindMyCar Place Card]"), CFSTR("localized string not found"), 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateComponentsFormatter stringFromTimeInterval:](self->_timestampFormatter, "stringFromTimeInterval:", v9));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15));
    objc_msgSend(v17, "setValueString:", v16);

  }
  -[MULabeledValueActionRowView setViewModel:](self->_timestampRowView, "setViewModel:", v17);

}

- (MULabeledValueActionTextFieldRowViewDelegate)textFieldDelegate
{
  return (MULabeledValueActionTextFieldRowViewDelegate *)-[MULabeledValueActionTextFieldRowView delegate](self->_notesRowView, "delegate");
}

- (void)setTextFieldDelegate:(id)a3
{
  -[MULabeledValueActionTextFieldRowView setDelegate:](self->_notesRowView, "setDelegate:", a3);
}

- (ParkedCarDetailsSectionControllerDelegate)detailsDelegate
{
  return (ParkedCarDetailsSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_detailsDelegate);
}

- (void)setDetailsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_detailsDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_detailsDelegate);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_timestampRowView, 0);
  objc_storeStrong((id *)&self->_timestampUpdateTimer, 0);
  objc_storeStrong((id *)&self->_timestampFormatter, 0);
  objc_storeStrong((id *)&self->_notesRowView, 0);
  objc_storeStrong((id *)&self->_photoCarouselController, 0);
  objc_storeStrong((id *)&self->_carouselCell, 0);
}

@end
