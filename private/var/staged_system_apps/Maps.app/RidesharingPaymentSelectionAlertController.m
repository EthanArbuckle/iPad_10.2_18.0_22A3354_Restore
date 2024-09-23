@implementation RidesharingPaymentSelectionAlertController

+ (id)ridesharingPaymentSelectionAlertControllerWithRequestRideStatus:(id)a3 requestRideOptionProxy:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
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
  id obj;
  uint64_t v37;
  NSMutableArray *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *i;
  void *v53;
  id v54;
  ExtensionsPayView *v55;
  _QWORD v56[5];
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id location;
  _QWORD v63[5];
  _BYTE v64[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "paymentSelectionTitle"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:", v8, 0, 0));

  v10 = *(void **)(v9 + 8);
  *(_QWORD *)(v9 + 8) = v6;

  objc_storeWeak((id *)(v9 + 16), v7);
  v11 = (id)v9;
  v38 = objc_opt_new(NSMutableArray);
  v39 = v11;
  objc_initWeak(&location, v11);
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "requestRideStatus"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rideOption"));
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "paymentMethods"));

  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  if (v40)
  {
    v37 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v40; i = (char *)i + 1)
      {
        if (*(_QWORD *)v59 != v37)
          objc_enumerationMutation(obj);
        v53 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
        v54 = objc_alloc_init((Class)UIViewController);
        v55 = objc_alloc_init(ExtensionsPayView);
        -[ExtensionsPayView setTopHairlineHidden:](v55, "setTopHairlineHidden:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPayView changePaymentMethodButton](v55, "changePaymentMethodButton"));
        objc_msgSend(v14, "setHidden:", 1);

        -[ExtensionsPayView setTranslatesAutoresizingMaskIntoConstraints:](v55, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "view"));
        objc_msgSend(v15, "addSubview:", v55);

        v51 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPayView changePaymentMethodButton](v55, "changePaymentMethodButton"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "widthAnchor"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToConstant:", 0.0));
        v63[0] = v49;
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPayView topAnchor](v55, "topAnchor"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "view"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "topAnchor"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
        v63[1] = v45;
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPayView bottomAnchor](v55, "bottomAnchor"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "view"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "bottomAnchor"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
        v63[2] = v41;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPayView leadingAnchor](v55, "leadingAnchor"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "view"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
        v63[3] = v19;
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsPayView trailingAnchor](v55, "trailingAnchor"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "view"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "layoutMarginsGuide"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v23));
        v63[4] = v24;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v63, 5));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);

        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "title"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "subtitle"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "icon"));
        -[ExtensionsPayView configureForTitle:subtitle:image:](v55, "configureForTitle:subtitle:image:", v26, v27, v28);

        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472;
        v56[2] = sub_100885AA0;
        v56[3] = &unk_1011D9DC8;
        objc_copyWeak(&v57, &location);
        v56[4] = v53;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction _actionWithContentViewController:style:handler:](UIAlertAction, "_actionWithContentViewController:style:handler:", v54, 0, v56));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "requestRideStatus"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "paymentMethod"));
        objc_msgSend(v29, "_setChecked:", v53 == v31);

        -[NSMutableArray addObject:](v38, "addObject:", v29);
        objc_destroyWeak(&v57);

      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    }
    while (v40);
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("localized string not found"), 0));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v33, 1, 0));
  -[NSMutableArray addObject:](v38, "addObject:", v34);

  objc_msgSend(v39, "_setActions:", v38);
  objc_destroyWeak(&location);

  return v39;
}

- (RideBookingRequestRideStatus)requestRideStatus
{
  return self->_requestRideStatus;
}

- (void)setRequestRideStatus:(id)a3
{
  objc_storeStrong((id *)&self->_requestRideStatus, a3);
}

- (RideBookingRequestRideOptionProxy)requestRideOptionProxy
{
  return (RideBookingRequestRideOptionProxy *)objc_loadWeakRetained((id *)&self->_requestRideOptionProxy);
}

- (void)setRequestRideOptionProxy:(id)a3
{
  objc_storeWeak((id *)&self->_requestRideOptionProxy, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_requestRideOptionProxy);
  objc_storeStrong((id *)&self->_requestRideStatus, 0);
}

@end
