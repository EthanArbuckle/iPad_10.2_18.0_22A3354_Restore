@implementation EVOnboardingVehicleAddedViewController

- (EVOnboardingVehicleAddedViewController)initWithVehicle:(id)a3 isLastPresentedController:(BOOL)a4 delegate:(id)a5
{
  id v9;
  id v10;
  EVOnboardingVehicleAddedViewController *v11;
  EVOnboardingVehicleAddedViewController *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EVOnboardingVehicleAddedViewController;
  v11 = -[EVOnboardingBaseViewController initWithDelegate:](&v14, "initWithDelegate:", v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_vehicle, a3);
    v12->_isLastPresentedController = a4;
    objc_storeWeak((id *)&v12->_delegate, v10);
  }

  return v12;
}

- (id)obViewController
{
  void *v3;
  uint64_t v4;
  EVOnboardingVehicleAddedViewController *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  PersonalizedImageView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  EVOnboardingVehicleAddedViewController *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[EV Onboarding] Vehicle added title"), CFSTR("localized string not found"), 0));

  v5 = self;
  v46 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle combinedDisplayName](self->_vehicle, "combinedDisplayName"));
  v52 = (void *)v4;
  v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[EV Onboarding] Vehicle added subtitle"), CFSTR("localized string not found"), 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle combinedDisplayName](v5->_vehicle, "combinedDisplayName"));
  v50 = (void *)v9;
  v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10));

  v51 = (void *)v7;
  v49 = (void *)v11;
  v42 = objc_msgSend(objc_alloc((Class)OBWelcomeController), "initWithTitle:detailText:icon:", v7, v11, 0);
  objc_msgSend(v42, "setModalPresentationStyle:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("bolt.car.fill")));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageWithoutBaseline"));

  v48 = (void *)v13;
  v14 = -[PersonalizedImageView initWithMainImage:mainImageSize:userImageDiameter:userImageExtensionPastMainImage:]([PersonalizedImageView alloc], "initWithMainImage:mainImageSize:userImageDiameter:userImageExtensionPastMainImage:", v13, 135.0, 100.0, 48.0, 3.0);
  -[PersonalizedImageView setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "headerView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "customIconContainerView"));

  objc_msgSend(v16, "addSubview:", v14);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedImageView topAnchor](v14, "topAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintGreaterThanOrEqualToAnchor:", v44));
  v53[0] = v43;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedImageView leadingAnchor](v14, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintGreaterThanOrEqualToAnchor:", v40));
  v53[1] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedImageView trailingAnchor](v14, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintLessThanOrEqualToAnchor:", v37));
  v53[2] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedImageView bottomAnchor](v14, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintLessThanOrEqualToAnchor:", v17));
  v53[3] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedImageView centerXAnchor](v14, "centerXAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerXAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
  v53[4] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedImageView centerYAnchor](v14, "centerYAnchor"));
  v47 = v16;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerYAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
  v53[5] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v53, 6));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "headerView"));
  objc_msgSend(v26, "setTitleTrailingSymbol:", CFSTR("checkmark"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
  v28 = v27;
  if (v46->_isLastPresentedController)
  {
    objc_msgSend(v27, "addTarget:action:forControlEvents:");
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v30 = v29;
    v31 = CFSTR("[EV Onboarding] Done button");
  }
  else
  {
    objc_msgSend(v27, "addTarget:action:forControlEvents:");
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v30 = v29;
    v31 = CFSTR("[EV Onboarding] Next button");
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", v31, CFSTR("localized string not found"), 0));
  objc_msgSend(v28, "setTitle:forState:", v32, 0);

  objc_msgSend(v28, "setAccessibilityIdentifier:", CFSTR("ConnectButton"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "buttonTray"));
  objc_msgSend(v33, "addButton:", v28);

  return v42;
}

- (void)_donePressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "vehicleAddedViewControllerDidSelectDone:", self);

}

- (void)_nextPressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "vehicleAddedViewControllerDidSelectNext:", self);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vehicle, 0);
}

@end
