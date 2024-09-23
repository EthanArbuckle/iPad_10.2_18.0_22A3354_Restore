@implementation PhotoCreditDataSource

+ (void)registerCellsInCollectionView:(id)a3
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___PhotoCreditDataSource;
  v3 = a3;
  objc_msgSendSuper2(&v8, "registerCellsInCollectionView:", v3);
  v4 = objc_opt_class(UserProfileSectionFooterView);
  v5 = (objc_class *)objc_opt_class(UserProfileSectionFooterView);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v4, UICollectionElementKindSectionFooter, v7, v8.receiver, v8.super_class);

}

- (PhotoCreditDataSource)init
{
  PhotoCreditDataSource *v2;
  PhotoCreditDataSource *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PhotoCreditDataSource;
  v2 = -[PhotoCreditDataSource init](&v5, "init");
  v3 = v2;
  if (v2)
    -[PhotoCreditDataSource fetchPhotoCreditPreferences](v2, "fetchPhotoCreditPreferences");
  return v3;
}

- (void)fetchPhotoCreditPreferences
{
  void *v3;
  _QWORD v4[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPhotoAttributionPreferencesManager sharedManager](UGCPhotoAttributionPreferencesManager, "sharedManager"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1003FD554;
  v4[3] = &unk_1011B5260;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  objc_msgSend(v3, "photoAttributionPreferencesWithCompletion:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)updatePhotoCreditPreferencesWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  void *v7;
  void *v9;
  _BOOL8 photoCredit;
  NSString *photoCreditName;
  _QWORD v12[4];
  void (**v13)(_QWORD, _QWORD);

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (self->_didChangeAttributionPreferences)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[PhotoCreditDataSource _photoCreditNameValidationErrorMessage](self, "_photoCreditNameValidationErrorMessage"));
    v7 = (void *)v6;
    if (!self->_photoCredit || v6 == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPhotoAttributionPreferencesManager sharedManager](UGCPhotoAttributionPreferencesManager, "sharedManager"));
      photoCredit = self->_photoCredit;
      photoCreditName = self->_photoCreditName;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1003FD8C8;
      v12[3] = &unk_1011B4AC8;
      v13 = v5;
      objc_msgSend(v9, "updatePhotoAttributionPreferencesAttributePhotos:attributionName:completion:", photoCredit, photoCreditName, v12);

    }
    else
    {
      v5[2](v5, v6);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (id)_photoCreditNameValidationErrorMessage
{
  unint64_t Integer;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  Integer = GEOConfigGetInteger(MapsConfig_UGCPhotoCreditNicknameMinimumLength, off_1014B4998);
  v4 = GEOConfigGetInteger(MapsConfig_UGCPhotoCreditNicknameMaximumLength, off_1014B49A8);
  if (-[NSString length](self->_photoCreditName, "length") >= Integer
    && -[NSString length](self->_photoCreditName, "length") <= v4)
  {
    v11 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", Integer));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v5, 0));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v7, 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[Photo Credit] Photo Credit name too short or long"), CFSTR("localized string not found"), 0));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v6, v8));
  }
  return v11;
}

- (void)prepareContent
{
  _QWORD v3[5];
  id v4;
  id location;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PhotoCreditDataSource;
  -[PreferenceValuesDataSource prepareContent](&v6, "prepareContent");
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1003FDC94;
  v3[3] = &unk_1011B4F90;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  -[PreferenceValuesDataSource addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (double)footerHeightForCollectionView:(id)a3
{
  double v4;
  double v5;
  double height;
  UserProfileSectionFooterView *v7;
  UserProfileSectionFooterViewModel *v8;
  id v9;
  void *v10;
  id v11;
  UserProfileSectionFooterViewModel *v12;
  double v13;
  double v14;
  double v15;
  double v16;

  objc_msgSend(a3, "frame");
  v5 = v4 + -32.0;
  height = UILayoutFittingExpandedSize.height;
  v7 = -[MapsThemeCollectionReusableView initWithFrame:]([UserProfileSectionFooterView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v8 = [UserProfileSectionFooterViewModel alloc];
  v9 = objc_alloc((Class)NSAttributedString);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PhotoCreditDataSource _footerText](self, "_footerText"));
  v11 = objc_msgSend(v9, "initWithString:", v10);
  v12 = -[UserProfileSectionFooterViewModel initWithContentString:](v8, "initWithContentString:", v11);

  -[UserProfileSectionFooterView configureWithViewModel:](v7, "configureWithViewModel:", v12);
  LODWORD(v13) = 1148846080;
  LODWORD(v14) = 1132068864;
  -[UserProfileSectionFooterView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v7, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v5, height, v13, v14);
  v16 = v15;

  return v16;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  unsigned int v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  PhotoCreditDataSource *v36;
  _QWORD v37[2];
  _QWORD v38[2];

  v8 = a3;
  v9 = a5;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1003FE5FC;
  v33[3] = &unk_1011B5000;
  v10 = v8;
  v34 = v10;
  v11 = v9;
  v35 = v11;
  v36 = self;
  v12 = a4;
  v13 = objc_retainBlock(v33);
  v14 = objc_msgSend(v12, "isEqualToString:", UICollectionElementKindSectionFooter);

  if (v14)
  {
    v15 = objc_alloc_init((Class)NSMutableParagraphStyle);
    objc_msgSend(v15, "setLineBreakMode:", 0);
    v37[0] = NSParagraphStyleAttributeName;
    v37[1] = NSForegroundColorAttributeName;
    v38[0] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v38[1] = v16;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 2));

    v17 = objc_alloc((Class)NSMutableAttributedString);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PhotoCreditDataSource _footerText](self, "_footerText"));
    v19 = objc_msgSend(v17, "initWithString:attributes:", v18, v32);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PhotoCreditDataSource _footerText](self, "_footerText"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PhotoCreditDataSource _footerLinkText](self, "_footerLinkText"));
    v22 = objc_msgSend(v20, "rangeOfString:", v21);
    v23 = v10;
    v25 = v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    v27 = v25;
    v10 = v23;
    objc_msgSend(v19, "addAttribute:value:range:", NSForegroundColorAttributeName, v26, v22, v27);

    v28 = ((uint64_t (*)(_QWORD *, id, uint64_t))v13[2])(v13, v19, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

  }
  else
  {
    v30 = ((uint64_t (*)(_QWORD *, _QWORD, _QWORD))v13[2])(v13, 0, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v30);
  }

  return v29;
}

- (void)privacyTextTapped
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[PhotoCreditDataSource privacyDelegate](self, "privacyDelegate"));
  objc_msgSend(v2, "didTapOnPrivacyText");

}

- (BOOL)photoCreditTextFieldDoesContainText
{
  return -[NSString length](self->_photoCreditName, "length") != 0;
}

- (void)_photoCreditDidUpdate
{
  _BOOL8 v3;
  id v4;

  v3 = -[PhotoCreditDataSource photoCreditTextFieldDoesContainText](self, "photoCreditTextFieldDoesContainText");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[PhotoCreditDataSource photoCreditChangesDelegate](self, "photoCreditChangesDelegate"));
  objc_msgSend(v4, "updateAppearanceForPhotoCredit:photoCreditNameExists:", self->_photoCredit, v3);

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PhotoCreditDataSource;
  v4 = -[PreferenceValuesDataSource collectionView:cellForItemAtIndexPath:](&v9, "collectionView:cellForItemAtIndexPath:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listGroupedCellConfiguration](UIBackgroundConfiguration, "listGroupedCellConfiguration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "backgroundColor"));
  objc_msgSend(v5, "setBackgroundColor:", v7);

  return v5;
}

- (id)_footerText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[Photo Credit] Footer string."), CFSTR("localized string not found"), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhotoCreditDataSource _footerLinkText](self, "_footerLinkText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5));

  return v6;
}

- (id)_footerLinkText
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc((Class)NSString);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[Photo Credit] Terms"), CFSTR("localized string not found"), 0));
  v5 = objc_msgSend(v2, "initWithString:", v4);

  return v5;
}

- (PhotoCreditChangesDelegate)photoCreditChangesDelegate
{
  return (PhotoCreditChangesDelegate *)objc_loadWeakRetained((id *)&self->_photoCreditChangesDelegate);
}

- (void)setPhotoCreditChangesDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_photoCreditChangesDelegate, a3);
}

- (SupplementaryElementsDataSourceDelegate)privacyDelegate
{
  return (SupplementaryElementsDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_privacyDelegate);
}

- (void)setPrivacyDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_privacyDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_privacyDelegate);
  objc_destroyWeak((id *)&self->_photoCreditChangesDelegate);
  objc_storeStrong((id *)&self->_photoCreditName, 0);
}

@end
