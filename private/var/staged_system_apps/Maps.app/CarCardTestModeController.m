@implementation CarCardTestModeController

- (CarCardTestModeController)init
{
  CarCardTestModeController *v2;
  uint64_t v3;
  NSMutableDictionary *cards;
  uint64_t v5;
  NSMutableDictionary *cardToConfigMap;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CarCardTestModeController;
  v2 = -[CarCardTestModeController init](&v9, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    cards = v2->_cards;
    v2->_cards = (NSMutableDictionary *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    cardToConfigMap = v2->_cardToConfigMap;
    v2->_cardToConfigMap = (NSMutableDictionary *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, "_addCardNotification:", CFSTR("__internal_CarCardTestDebug"), 0);

  }
  return v2;
}

- (BOOL)showsMapView
{
  return 1;
}

- (int64_t)autohideBehavior
{
  return 1;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  CarFocusableButton *v8;
  CarFocusableButton *pushButton;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  CarCardTestModeController *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  if (!self->_pushButton)
  {
    v8 = (CarFocusableButton *)objc_claimAutoreleasedReturnValue(+[CarFocusableButton button](CarFocusableButton, "button"));
    pushButton = self->_pushButton;
    self->_pushButton = v8;

    -[CarFocusableButton setTranslatesAutoresizingMaskIntoConstraints:](self->_pushButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton layer](self->_pushButton, "layer"));
    objc_msgSend(v10, "setCornerRadius:", 4.0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
    -[CarFocusableButton setTintColor:](self->_pushButton, "setTintColor:", v11);

    -[CarFocusableButton setTitle:forState:](self->_pushButton, "setTitle:forState:", CFSTR("Push"), 0);
    -[CarFocusableButton setContentEdgeInsets:](self->_pushButton, "setContentEdgeInsets:", 0.0, 4.0, 0.0, 4.0);
    -[CarFocusableButton addTarget:action:forControlEvents:](self->_pushButton, "addTarget:action:forControlEvents:", self, "_push", 64);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewport"));
  objc_msgSend(v12, "addSubview:", self->_pushButton);

  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_100903454;
  v19 = &unk_1011AC8B0;
  v20 = self;
  v21 = v6;
  v13 = v6;
  objc_msgSend(v7, "addAnimations:completion:", &v16, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardTestModeController chromeViewController](self, "chromeViewController", v16, v17, v18, v19, v20));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mapView"));
  objc_msgSend(v15, "setUserTrackingMode:", 1);

}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  -[CarFocusableButton removeFromSuperview](self->_pushButton, "removeFromSuperview", a3, a4);
}

- (id)desiredCards
{
  return -[NSMutableDictionary allKeys](self->_cards, "allKeys");
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  CarCardTestModeController *v13;
  CarCardTestModeController *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  id v21;
  id v22;
  void *v23;
  _OWORD v24[2];
  _OWORD v25[2];
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  char v31;
  __int128 v32;
  __int128 v33;
  _OWORD v34[2];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint8_t buf[4];
  __CFString *v41;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardTestModeController desiredCards](self, "desiredCards"));
  if ((objc_msgSend(v8, "containsObject:", v7) & 1) != 0)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cardToConfigMap, "objectForKeyedSubscript:", v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cards, "objectForKeyedSubscript:", v7));
    objc_msgSend(v6, "setContent:", v10);

    objc_msgSend(v6, "setAccessory:", 0);
    if (v9)
    {
      -[NSObject layout](v9, "layout");
      v12 = (void *)*((_QWORD *)&v35 + 1);
      v11 = (void *)v35;
    }
    else
    {
      v12 = 0;
      v11 = 0;
      v39 = 0;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      memset(v34, 0, sizeof(v34));
      v32 = 0u;
      v33 = 0u;
    }
    v24[0] = v32;
    v24[1] = v33;
    v25[0] = v34[0];
    *(_OWORD *)((char *)v25 + 12) = *(_OWORD *)((char *)v34 + 12);
    v21 = v11;
    v26 = v21;
    v22 = v12;
    v27 = v22;
    v28 = v36;
    v29 = v37;
    v30 = v38;
    v31 = v39;
    if (v6)
    {
      objc_msgSend(v6, "setLayout:", v24);
    }
    else
    {
      v23 = v22;

    }
    objc_msgSend(v6, "setStaysOnTop:", -[NSObject staysOnTop](v9, "staysOnTop"));
    goto LABEL_21;
  }
  if (qword_1014D3970 != -1)
    dispatch_once(&qword_1014D3970, &stru_1011DBA20);
  v9 = (id)qword_1014D3968;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v13 = self;
    v14 = v13;
    if (!v13)
    {
      v20 = CFSTR("<nil>");
      goto LABEL_20;
    }
    v15 = (objc_class *)objc_opt_class(v13);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if ((objc_opt_respondsToSelector(v14, "accessibilityIdentifier") & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardTestModeController performSelector:](v14, "performSelector:", "accessibilityIdentifier"));
      v19 = v18;
      if (v18 && !objc_msgSend(v18, "isEqualToString:", v17))
      {
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v17, v14, v19));

        goto LABEL_13;
      }

    }
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v17, v14));
LABEL_13:

LABEL_20:
    *(_DWORD *)buf = 138543362;
    v41 = v20;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[%{public}@] CarCardTestModeController: tried to configure card key that is not in desired cards.", buf, 0xCu);

  }
LABEL_21:

}

- (void)_addCardNotification:(id)a3
{
  id v4;
  void *v5;
  CarCardTestModeController *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  CarCardTestConfig *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardTestModeController chromeViewController](self, "chromeViewController"));
  v6 = (CarCardTestModeController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topContext"));

  if (v6 == self)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RemoveAll")));
    v9 = objc_msgSend(v8, "BOOLValue");

    if (v9)
    {
      v10 = (CarCardTestConfig *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_cards, "allKeys"));
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v11 = -[CarCardTestConfig countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(_QWORD *)v16 != v13)
              objc_enumerationMutation(v10);
            -[CarCardTestModeController _deleteCardUUID:](self, "_deleteCardUUID:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i));
          }
          v12 = -[CarCardTestConfig countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v12);
      }
    }
    else
    {
      v10 = -[CarCardTestConfig initWithNotification:]([CarCardTestConfig alloc], "initWithNotification:", v4);
      -[CarCardTestModeController _addCardWithConfig:](self, "_addCardWithConfig:", v10);
    }

  }
}

- (void)_addCardWithConfig:(id)a3
{
  id v4;
  CarTestCardViewController *v5;
  void *v6;
  NSMutableArray *v7;
  id v8;
  CarCardStackViewController *v9;
  NSUUID *v10;
  unint64_t i;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v16[3];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  if ((unint64_t)objc_msgSend(v4, "stackCount") > 1)
  {
    v10 = objc_opt_new(NSUUID);
    v8 = (id)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v10, "UUIDString"));

    v7 = objc_opt_new(NSMutableArray);
    for (i = 0; i < (unint64_t)objc_msgSend(v4, "stackCount"); ++i)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardTestModeController _stackedCardWithConfig:stackID:](self, "_stackedCardWithConfig:stackID:", v4, v8));
      -[NSMutableArray addObject:](v7, "addObject:", v12);

    }
    if (v4)
    {
      objc_msgSend(v4, "layout");
      v13 = 3;
      switch((uint64_t)v17)
      {
        case 0:
          if ((unint64_t)(*((_QWORD *)&v17 + 1) - 1) > 7)
            v13 = 3;
          else
            v13 = qword_100E3C680[*((_QWORD *)&v17 + 1) - 1];
          break;
        case 1:
        case 4:
          v13 = v17;
          break;
        case 2:
          v13 = 1;
          break;
        case 8:
          v13 = 4;
          break;
        default:
          break;
      }
    }
    else
    {
      v25 = 0;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v13 = 3;
      v17 = 0u;
      v18 = 0u;
    }
    v14 = (id)v18;

    if ((objc_msgSend(v4, "stackUseCardLayout") & 1) == 0)
    {
      v14 = objc_msgSend(v4, "stackAxis");
      v13 = (uint64_t)objc_msgSend(v4, "stackAlignment");
    }
    v16[0] = v14;
    v16[1] = 0;
    v16[2] = v13;
    v9 = -[CarCardStackViewController initWithCarCardContentControllers:layout:]([CarCardStackViewController alloc], "initWithCarCardContentControllers:layout:", v7, v16);
  }
  else
  {
    v5 = -[CarTestCardViewController initWithConfig:]([CarTestCardViewController alloc], "initWithConfig:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarTestCardViewController cardID](v5, "cardID"));
    v7 = v5;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100903D8C;
    v26[3] = &unk_1011DB9D8;
    objc_copyWeak(&v28, &location);
    v8 = v6;
    v27 = v8;
    -[NSMutableArray setDismissHandler:](v7, "setDismissHandler:", v26);

    objc_destroyWeak(&v28);
    v9 = (CarCardStackViewController *)v7;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cards, "setObject:forKeyedSubscript:", v9, v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cardToConfigMap, "setObject:forKeyedSubscript:", v4, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardTestModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v15, "updateCardsForContext:animated:", self, 1);

  objc_destroyWeak(&location);
}

- (id)_stackedCardWithConfig:(id)a3 stackID:(id)a4
{
  id v6;
  id v7;
  CarTestCardViewController *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = -[CarTestCardViewController initWithConfig:]([CarTestCardViewController alloc], "initWithConfig:", v6);
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100903F18;
  v14[3] = &unk_1011DB9D8;
  objc_copyWeak(&v16, &location);
  v9 = v7;
  v15 = v9;
  -[CarTestCardViewController setDismissHandler:](v8, "setDismissHandler:", v14);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100903F54;
  v12[3] = &unk_1011DBA00;
  v12[4] = self;
  v10 = v9;
  v13 = v10;
  -[CarTestCardViewController setButtonTagHandler:](v8, "setButtonTagHandler:", v12);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v8;
}

- (void)_push
{
  void *v3;
  CarCardTestModeController *v4;

  v4 = objc_alloc_init(CarCardTestModeController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardTestModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v3, "pushContext:animated:completion:", v4, 1, 0);

}

- (void)_deleteCardUUID:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cards, "objectForKeyedSubscript:", v4));
  if (v5)
  {
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1009040D8;
    v8[3] = &unk_1011AC888;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    v6 = objc_retainBlock(v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardTestModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v7, "updateCardsForContext:animated:completion:", self, 1, v6);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

- (void)_handleCardButtonTag:(unint64_t)a3 forStackID:(id)a4 card:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char *v16;
  id v17;

  v17 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cards, "objectForKeyedSubscript:", v17));
  if (v9)
  {
    v10 = objc_opt_class(CarCardStackViewController);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {
      v11 = v9;
      v12 = v11;
      switch(a3)
      {
        case 1uLL:
          objc_msgSend(v11, "removeCardContentController:", v8);
          break;
        case 2uLL:
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cardToConfigMap, "objectForKeyedSubscript:", v17));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardTestModeController _stackedCardWithConfig:stackID:](self, "_stackedCardWithConfig:stackID:", v13, v17));
          objc_msgSend(v12, "addCardContentController:", v14);
          goto LABEL_9;
        case 3uLL:
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cardContentControllers"));
          v16 = (char *)objc_msgSend(v15, "indexOfObject:", v8);
          goto LABEL_8;
        case 4uLL:
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cardContentControllers"));
          v16 = (char *)objc_msgSend(v15, "indexOfObject:", v8) + 1;
LABEL_8:

          v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cardToConfigMap, "objectForKeyedSubscript:", v17));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardTestModeController _stackedCardWithConfig:stackID:](self, "_stackedCardWithConfig:stackID:", v13, v17));
          objc_msgSend(v12, "insertCardContentController:atIndex:", v14, v16);
LABEL_9:

          break;
        default:
          break;
      }

    }
  }

}

- (NSArray)carFocusOrderSequences
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardTestModeController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "itemRepresentingOverlays"));
  v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderSequence sequenceWithItems:options:](CarFocusOrderSequence, "sequenceWithItems:options:", v4, 5));
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  return (NSArray *)v6;
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_pushButton, 0);
  objc_storeStrong((id *)&self->_cardToConfigMap, 0);
  objc_storeStrong((id *)&self->_cards, 0);
}

@end
