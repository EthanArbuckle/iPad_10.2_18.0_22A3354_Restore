@implementation CarCardsOverlay

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationsByKey](self, "configurationsByKey"));
  objc_msgSend(v3, "removeAllObjects");

  -[CarCardsOverlay setHost:](self, "setHost:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("CarDisplayDidChangeConnectedNotification"), 0);

  v5.receiver = self;
  v5.super_class = (Class)CarCardsOverlay;
  -[CarCardsOverlay dealloc](&v5, "dealloc");
}

- (CarCardsOverlay)initWithCarSceneType:(int64_t)a3
{
  CarCardsOverlay *v4;
  CarCardsOverlay *v5;
  void *v6;
  uint64_t v7;
  NSMutableOrderedSet *configurationKeys;
  uint64_t v9;
  NSMutableDictionary *configurationsByKey;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CarCardsOverlay;
  v4 = -[CarCardsOverlay init](&v13, "init");
  v5 = v4;
  if (v4)
  {
    v4->_carSceneType = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5->_showDebugVisualisation = objc_msgSend(v6, "BOOLForKey:", CFSTR("__internal_CarVisualizeCardContainersDebug"));

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSetWithCapacity:](NSMutableOrderedSet, "orderedSetWithCapacity:", 2));
    configurationKeys = v5->_configurationKeys;
    v5->_configurationKeys = (NSMutableOrderedSet *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    configurationsByKey = v5->_configurationsByKey;
    v5->_configurationsByKey = (NSMutableDictionary *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v5, "_userDefaultsChanged:", NSUserDefaultsDidChangeNotification, 0);

  }
  return v5;
}

- (void)setCardDelegate:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  NSObject *v7;
  CarCardsOverlay *v8;
  CarCardsOverlay *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  id v17;
  void *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  _QWORD v26[5];
  uint8_t buf[4];
  __CFString *v28;
  __int16 v29;
  __CFString *v30;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cardDelegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_cardDelegate, v4);
    v6 = sub_10043333C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_20:

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationsByKey](self, "configurationsByKey"));
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1009FF108;
      v26[3] = &unk_1011DF5B0;
      v26[4] = self;
      objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v26);

      goto LABEL_21;
    }
    v8 = self;
    v9 = v8;
    if (!v8)
    {
      v15 = CFSTR("<nil>");
LABEL_11:

      v16 = v15;
      v17 = v4;
      v18 = v17;
      if (!v17)
      {
        v24 = CFSTR("<nil>");
        goto LABEL_19;
      }
      v19 = (objc_class *)objc_opt_class(v17);
      v20 = NSStringFromClass(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      if ((objc_opt_respondsToSelector(v18, "accessibilityIdentifier") & 1) != 0)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "performSelector:", "accessibilityIdentifier"));
        v23 = v22;
        if (v22 && !objc_msgSend(v22, "isEqualToString:", v21))
        {
          v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v21, v18, v23));

          goto LABEL_17;
        }

      }
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v21, v18));
LABEL_17:

LABEL_19:
      *(_DWORD *)buf = 138543618;
      v28 = v16;
      v29 = 2112;
      v30 = v24;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Card delegate is now %@", buf, 0x16u);

      goto LABEL_20;
    }
    v10 = (objc_class *)objc_opt_class(v8);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_9;
      }

    }
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_9:

    goto LABEL_11;
  }
LABEL_21:

}

- (void)setHost:(id)a3
{
  id WeakRetained;
  id v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_host, obj);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "overlayContentView"));
    -[CarCardsOverlay setContentView:](self, "setContentView:", v6);

  }
}

- (BOOL)isHidden
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_configurationsByKey, "allValues"));
  v3 = objc_msgSend(v2, "indexOfObjectPassingTest:", &stru_1011DF5F0) == (id)0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (void)setHidden:(BOOL)a3
{
  -[CarCardsOverlay setHidden:animated:](self, "setHidden:animated:", a3, 0);
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (a3)
    -[CarCardsOverlay dismissAllCardsAnimated:completion:](self, "dismissAllCardsAnimated:completion:", a4, 0);
  else
    -[CarCardsOverlay presentAllCardsAnimated:completion:](self, "presentAllCardsAnimated:completion:", a4, 0);
}

- (void)_userDefaultsChanged:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;
  _QWORD v7[4];
  char v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", a3));
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("__internal_CarVisualizeCardContainersDebug"));

  if (self->_showDebugVisualisation != v5)
  {
    self->_showDebugVisualisation = v5;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationsByKey](self, "configurationsByKey"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1009FF364;
    v7[3] = &unk_1011DF610;
    v8 = v5;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

  }
}

- (void)setContentView:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  CarCardsOverlay *v12;
  CarCardsOverlay *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  id v21;
  void *v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  NSObject *v36;
  CarCardsOverlay *v37;
  CarCardsOverlay *v38;
  objc_class *v39;
  NSString *v40;
  void *v41;
  void *v42;
  void *v43;
  __CFString *v44;
  __CFString *v45;
  id v46;
  objc_class *v47;
  NSString *v48;
  void *v49;
  void *v50;
  void *v51;
  __CFString *v52;
  uint8_t buf[4];
  __CFString *v54;
  __int16 v55;
  __CFString *v56;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);

  if (WeakRetained == v4)
    goto LABEL_41;
  v6 = objc_loadWeakRetained((id *)&self->_contentView);
  if (v6)
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationsByKey](self, "configurationsByKey"));
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v10 = sub_10043333C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
LABEL_22:

        v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationsByKey](self, "configurationsByKey"));
        objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", &stru_1011DF650);

        v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationsByKey](self, "configurationsByKey"));
        objc_msgSend(v30, "removeAllObjects");

        v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationKeys](self, "configurationKeys"));
        objc_msgSend(v31, "removeAllObjects");

        -[CarCardsOverlay _captureInsetContraintsFromConfigurations](self, "_captureInsetContraintsFromConfigurations");
        goto LABEL_23;
      }
      v12 = self;
      v13 = v12;
      if (!v12)
      {
        v19 = CFSTR("<nil>");
LABEL_13:

        v20 = v19;
        v21 = (id)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay contentView](v13, "contentView"));
        v22 = v21;
        if (!v21)
        {
          v28 = CFSTR("<nil>");
          goto LABEL_21;
        }
        v23 = (objc_class *)objc_opt_class(v21);
        v24 = NSStringFromClass(v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        if ((objc_opt_respondsToSelector(v22, "accessibilityIdentifier") & 1) != 0)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "performSelector:", "accessibilityIdentifier"));
          v27 = v26;
          if (v26 && !objc_msgSend(v26, "isEqualToString:", v25))
          {
            v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v25, v22, v27));

            goto LABEL_19;
          }

        }
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v25, v22));
LABEL_19:

LABEL_21:
        *(_DWORD *)buf = 138543618;
        v54 = v20;
        v55 = 2112;
        v56 = v28;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@] Will uninstall cards from view %@", buf, 0x16u);

        goto LABEL_22;
      }
      v14 = (objc_class *)objc_opt_class(v12);
      v15 = NSStringFromClass(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if ((objc_opt_respondsToSelector(v13, "accessibilityIdentifier") & 1) != 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v13, "performSelector:", "accessibilityIdentifier"));
        v18 = v17;
        if (v17 && !objc_msgSend(v17, "isEqualToString:", v16))
        {
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v16, v13, v18));

          goto LABEL_11;
        }

      }
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v16, v13));
LABEL_11:

      goto LABEL_13;
    }
  }
LABEL_23:
  v32 = objc_storeWeak((id *)&self->_contentView, v4);
  if (v4)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationsByKey](self, "configurationsByKey"));
    v34 = objc_msgSend(v33, "count");

    if (v34)
    {
      v35 = sub_10043333C();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
LABEL_40:

        -[CarCardsOverlay _refreshPinningConstraints](self, "_refreshPinningConstraints");
        goto LABEL_41;
      }
      v37 = self;
      v38 = v37;
      if (!v37)
      {
        v44 = CFSTR("<nil>");
LABEL_34:

        v45 = v44;
        v46 = v4;
        v47 = (objc_class *)objc_opt_class(v46);
        v48 = NSStringFromClass(v47);
        v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
        if ((objc_opt_respondsToSelector(v46, "accessibilityIdentifier") & 1) != 0)
        {
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "performSelector:", "accessibilityIdentifier"));
          v51 = v50;
          if (v50 && !objc_msgSend(v50, "isEqualToString:", v49))
          {
            v52 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v49, v46, v51));

            goto LABEL_39;
          }

        }
        v52 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v49, v46));
LABEL_39:

        *(_DWORD *)buf = 138543618;
        v54 = v45;
        v55 = 2112;
        v56 = v52;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "[%{public}@] Will install cards in view %@", buf, 0x16u);

        goto LABEL_40;
      }
      v39 = (objc_class *)objc_opt_class(v37);
      v40 = NSStringFromClass(v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      if ((objc_opt_respondsToSelector(v38, "accessibilityIdentifier") & 1) != 0)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v38, "performSelector:", "accessibilityIdentifier"));
        v43 = v42;
        if (v42 && !objc_msgSend(v42, "isEqualToString:", v41))
        {
          v44 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v41, v38, v43));

          goto LABEL_32;
        }

      }
      v44 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v41, v38));
LABEL_32:

      goto LABEL_34;
    }
  }
LABEL_41:

}

- (void)_refreshPinningConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay host](self, "host"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay host](self, "host"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutGuideForOverlay:", self));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationsByKey](self, "configurationsByKey"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009FF9DC;
  v10[3] = &unk_1011DF678;
  v11 = v3;
  v12 = v5;
  v7 = v5;
  v8 = v3;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);

  -[CarCardsOverlay _captureInsetContraintsFromConfigurations](self, "_captureInsetContraintsFromConfigurations");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1009FF9EC;
  v9[3] = &unk_1011AC860;
  v9[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v9);

}

- (BOOL)hasCard:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay _configurationForKey:createIfNeeded:](self, "_configurationForKey:createIfNeeded:", a3, 0));
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isCardHidden:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay _configurationForKey:createIfNeeded:](self, "_configurationForKey:createIfNeeded:", a3, 0));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cardView"));
    v6 = objc_msgSend(v5, "isHidden");

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)configureCard:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  CarCardsOverlay *v11;
  CarCardsOverlay *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  CarCardsOverlay *v19;
  CarCardsOverlay *v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  uint8_t buf[4];
  __CFString *v32;
  __int16 v33;
  id v34;

  v6 = a3;
  v7 = a4;
  v8 = sub_10043333C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v7)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
LABEL_20:

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay _configurationForKey:createIfNeeded:](self, "_configurationForKey:createIfNeeded:", v6, 1));
      -[CarCardsOverlay _setCardConfiguration:forKey:](self, "_setCardConfiguration:forKey:", v27, v6);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1009FFE04;
      v28[3] = &unk_1011AECC0;
      v28[4] = self;
      v29 = v27;
      v30 = v7;
      v10 = v27;
      -[CarCardsOverlay performBatchUpdates:animated:completion:](self, "performBatchUpdates:animated:completion:", v28, 0, 0);

      goto LABEL_23;
    }
    v11 = self;
    v12 = v11;
    if (!v11)
    {
      v18 = CFSTR("<nil>");
      goto LABEL_19;
    }
    v13 = (objc_class *)objc_opt_class(v11);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if ((objc_opt_respondsToSelector(v12, "accessibilityIdentifier") & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v12, "performSelector:", "accessibilityIdentifier"));
      v17 = v16;
      if (v16 && !objc_msgSend(v16, "isEqualToString:", v15))
      {
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v15, v12, v17));

        goto LABEL_9;
      }

    }
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v15, v12));
LABEL_9:

LABEL_19:
    *(_DWORD *)buf = 138543618;
    v32 = v18;
    v33 = 2112;
    v34 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] Will configure card %@", buf, 0x16u);

    goto LABEL_20;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v19 = self;
    v20 = v19;
    if (!v19)
    {
      v26 = CFSTR("<nil>");
      goto LABEL_22;
    }
    v21 = (objc_class *)objc_opt_class(v19);
    v22 = NSStringFromClass(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if ((objc_opt_respondsToSelector(v20, "accessibilityIdentifier") & 1) != 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v20, "performSelector:", "accessibilityIdentifier"));
      v25 = v24;
      if (v24 && !objc_msgSend(v24, "isEqualToString:", v23))
      {
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v23, v20, v25));

        goto LABEL_17;
      }

    }
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v23, v20));
LABEL_17:

LABEL_22:
    *(_DWORD *)buf = 138543618;
    v32 = v26;
    v33 = 2112;
    v34 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Tried to configure card %@ without a configuration block, aborting.", buf, 0x16u);

  }
LABEL_23:

}

- (void)insertCard:(id)a3 animated:(BOOL)a4 configurationBlock:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  CarCardsOverlay *v16;
  CarCardsOverlay *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  CarCardsOverlay *v24;
  CarCardsOverlay *v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  uint8_t buf[4];
  __CFString *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  __CFString *v43;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = sub_10043333C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (v11)
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
LABEL_22:

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay _configurationForKey:createIfNeeded:](self, "_configurationForKey:createIfNeeded:", v10, 1));
      -[CarCardsOverlay _setCardConfiguration:forKey:](self, "_setCardConfiguration:forKey:", v34, v10);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100A001E0;
      v35[3] = &unk_1011AECC0;
      v35[4] = self;
      v36 = v34;
      v37 = v11;
      v15 = v34;
      -[CarCardsOverlay performBatchUpdates:animated:completion:](self, "performBatchUpdates:animated:completion:", v35, v8, v12);

      goto LABEL_25;
    }
    v16 = self;
    v17 = v16;
    if (!v16)
    {
      v23 = CFSTR("<nil>");
      goto LABEL_19;
    }
    v18 = (objc_class *)objc_opt_class(v16);
    v19 = NSStringFromClass(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if ((objc_opt_respondsToSelector(v17, "accessibilityIdentifier") & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v17, "performSelector:", "accessibilityIdentifier"));
      v22 = v21;
      if (v21 && !objc_msgSend(v21, "isEqualToString:", v20))
      {
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v20, v17, v22));

        goto LABEL_9;
      }

    }
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v20, v17));
LABEL_9:

LABEL_19:
    v32 = CFSTR("NO");
    if (v8)
      v32 = CFSTR("YES");
    v33 = v32;
    *(_DWORD *)buf = 138543874;
    v39 = v23;
    v40 = 2112;
    v41 = v10;
    v42 = 2112;
    v43 = v33;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}@] Will present card %@ (animated:%@)", buf, 0x20u);

    goto LABEL_22;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v24 = self;
    v25 = v24;
    if (!v24)
    {
      v31 = CFSTR("<nil>");
      goto LABEL_24;
    }
    v26 = (objc_class *)objc_opt_class(v24);
    v27 = NSStringFromClass(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    if ((objc_opt_respondsToSelector(v25, "accessibilityIdentifier") & 1) != 0)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v25, "performSelector:", "accessibilityIdentifier"));
      v30 = v29;
      if (v29 && !objc_msgSend(v29, "isEqualToString:", v28))
      {
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v28, v25, v30));

        goto LABEL_17;
      }

    }
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v28, v25));
LABEL_17:

LABEL_24:
    *(_DWORD *)buf = 138543618;
    v39 = v31;
    v40 = 2112;
    v41 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Tried to insert card %@ without a configuration block, aborting.", buf, 0x16u);

  }
LABEL_25:

}

- (void)presentAllCardsAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  CarCardsOverlay *v11;
  CarCardsOverlay *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  CarCardsOverlay *v30;
  _QWORD v31[5];
  uint8_t buf[4];
  __CFString *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  __CFString *v37;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationsByKey](self, "configurationsByKey"));
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = sub_10043333C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
LABEL_14:

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationKeys](self, "configurationKeys"));
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100A004F8;
      v31[3] = &unk_1011DF6A0;
      v31[4] = self;
      v25 = sub_10039DCD4(v24, v31);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100A00550;
      v28[3] = &unk_1011AC8B0;
      v29 = v26;
      v30 = self;
      v27 = v26;
      -[CarCardsOverlay performBatchUpdates:animated:completion:](self, "performBatchUpdates:animated:completion:", v28, v4, v6);

      goto LABEL_15;
    }
    v11 = self;
    v12 = v11;
    if (!v11)
    {
      v18 = CFSTR("<nil>");
      goto LABEL_11;
    }
    v13 = (objc_class *)objc_opt_class(v11);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if ((objc_opt_respondsToSelector(v12, "accessibilityIdentifier") & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v12, "performSelector:", "accessibilityIdentifier"));
      v17 = v16;
      if (v16 && !objc_msgSend(v16, "isEqualToString:", v15))
      {
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v15, v12, v17));

        goto LABEL_9;
      }

    }
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v15, v12));
LABEL_9:

LABEL_11:
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationsByKey](v12, "configurationsByKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "count")));

    v22 = CFSTR("NO");
    if (v4)
      v22 = CFSTR("YES");
    v23 = v22;
    *(_DWORD *)buf = 138543874;
    v33 = v18;
    v34 = 2112;
    v35 = v21;
    v36 = 2112;
    v37 = v23;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] Will present %@ cards (animated:%@)", buf, 0x20u);

    goto LABEL_14;
  }
LABEL_15:

}

- (void)deleteCard:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  CarCardsOverlay *v13;
  CarCardsOverlay *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  __CFString *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  __CFString *v30;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay _configurationForKey:createIfNeeded:](self, "_configurationForKey:createIfNeeded:", v8, 0));
  if (v10)
  {
    v11 = sub_10043333C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
LABEL_14:

      -[CarCardsOverlay _setCardConfiguration:forKey:](self, "_setCardConfiguration:forKey:", 0, v8);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100A008C4;
      v23[3] = &unk_1011AC8B0;
      v23[4] = self;
      v24 = v10;
      -[CarCardsOverlay performBatchUpdates:animated:completion:](self, "performBatchUpdates:animated:completion:", v23, v6, v9);

      goto LABEL_15;
    }
    v13 = self;
    v14 = v13;
    if (!v13)
    {
      v20 = CFSTR("<nil>");
      goto LABEL_11;
    }
    v15 = (objc_class *)objc_opt_class(v13);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if ((objc_opt_respondsToSelector(v14, "accessibilityIdentifier") & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v14, "performSelector:", "accessibilityIdentifier"));
      v19 = v18;
      if (v18 && !objc_msgSend(v18, "isEqualToString:", v17))
      {
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v17, v14, v19));

        goto LABEL_9;
      }

    }
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v17, v14));
LABEL_9:

LABEL_11:
    v21 = CFSTR("NO");
    if (v6)
      v21 = CFSTR("YES");
    v22 = v21;
    *(_DWORD *)buf = 138543874;
    v26 = v20;
    v27 = 2112;
    v28 = v8;
    v29 = 2112;
    v30 = v22;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}@] Will dismiss card %@ (animated:%@)", buf, 0x20u);

    goto LABEL_14;
  }
LABEL_15:

}

- (void)hideCard:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay _configurationForKey:createIfNeeded:](self, "_configurationForKey:createIfNeeded:", a3, 0));
  v10 = v9;
  if (v9)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100A009B4;
    v11[3] = &unk_1011AC860;
    v12 = v9;
    -[CarCardsOverlay performBatchUpdates:animated:completion:](self, "performBatchUpdates:animated:completion:", v11, v5, v8);

  }
}

- (void)showCard:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay _configurationForKey:createIfNeeded:](self, "_configurationForKey:createIfNeeded:", a3, 0));
  v10 = v9;
  if (v9)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100A00A98;
    v11[3] = &unk_1011AC860;
    v12 = v9;
    -[CarCardsOverlay performBatchUpdates:animated:completion:](self, "performBatchUpdates:animated:completion:", v11, v5, v8);

  }
}

- (void)dismissAllCardsAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  CarCardsOverlay *v11;
  CarCardsOverlay *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  CarCardsOverlay *v31;
  uint8_t buf[4];
  __CFString *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  __CFString *v37;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationsByKey](self, "configurationsByKey"));
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = sub_10043333C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
LABEL_14:

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationsByKey](self, "configurationsByKey"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "allValues"));

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationsByKey](self, "configurationsByKey"));
      objc_msgSend(v26, "removeAllObjects");

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationKeys](self, "configurationKeys"));
      objc_msgSend(v27, "removeAllObjects");

      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100A00DA8;
      v29[3] = &unk_1011AC8B0;
      v30 = v25;
      v31 = self;
      v28 = v25;
      -[CarCardsOverlay performBatchUpdates:animated:completion:](self, "performBatchUpdates:animated:completion:", v29, v4, v6);

      goto LABEL_15;
    }
    v11 = self;
    v12 = v11;
    if (!v11)
    {
      v18 = CFSTR("<nil>");
      goto LABEL_11;
    }
    v13 = (objc_class *)objc_opt_class(v11);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if ((objc_opt_respondsToSelector(v12, "accessibilityIdentifier") & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v12, "performSelector:", "accessibilityIdentifier"));
      v17 = v16;
      if (v16 && !objc_msgSend(v16, "isEqualToString:", v15))
      {
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v15, v12, v17));

        goto LABEL_9;
      }

    }
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v15, v12));
LABEL_9:

LABEL_11:
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationsByKey](v12, "configurationsByKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "count")));

    v22 = CFSTR("NO");
    if (v4)
      v22 = CFSTR("YES");
    v23 = v22;
    *(_DWORD *)buf = 138543874;
    v33 = v18;
    v34 = 2112;
    v35 = v21;
    v36 = 2112;
    v37 = v23;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] Will dismiss %@ cards (animated:%@)", buf, 0x20u);

    goto LABEL_14;
  }
LABEL_15:

}

- (void)performBatchUpdates:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[CarCardsOverlay _performBatchUpdates:withAnimation:animated:completion:](self, "_performBatchUpdates:withAnimation:animated:completion:", a3, 0, a4, a5);
}

- (void)performBatchUpdates:(id)a3 withAnimation:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CarCardsOverlay _performBatchUpdates:withAnimation:animated:completion:](self, "_performBatchUpdates:withAnimation:animated:completion:", v10, v9, objc_msgSend(v9, "isAnimated"), v8);

}

- (void)_performBatchUpdates:(id)a3 withAnimation:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  void (**v10)(_QWORD);
  id v11;
  id v12;
  CarCardsUpdate *pendingUpdates;
  CarCardsUpdate *v14;
  CarCardsUpdate *v15;
  id v16;
  NSObject *v17;
  CarCardsOverlay *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  id v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  void *v26;
  CarCardsUpdate *v27;
  __CFString *v28;
  __CFString *v29;
  unint64_t v30;
  id v31;
  NSObject *v32;
  CarCardsOverlay *v33;
  objc_class *v34;
  NSString *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  _BOOL8 v41;
  void *v42;
  CarCardsUpdate *v43;
  CarCardsUpdate *v44;
  unint64_t v45;
  unint64_t v46;
  id v47;
  NSObject *v48;
  CarCardsOverlay *v49;
  objc_class *v50;
  NSString *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  CarCardsUpdate *v56;
  id v57;
  unint64_t v58;
  _QWORD v59[4];
  id v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  CarCardsUpdate *v64;
  __int16 v65;
  __CFString *v66;

  v7 = a5;
  v10 = (void (**)(_QWORD))a3;
  v11 = a4;
  v12 = a6;
  if (v10)
  {
    pendingUpdates = self->_pendingUpdates;
    if (pendingUpdates)
      goto LABEL_13;
    v14 = objc_alloc_init(CarCardsUpdate);
    v15 = self->_pendingUpdates;
    self->_pendingUpdates = v14;

    -[CarCardsUpdate setDelegate:](self->_pendingUpdates, "setDelegate:", self);
    v16 = sub_10043333C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      pendingUpdates = self->_pendingUpdates;
LABEL_13:
      v30 = -[CarCardsUpdate incrementNestCounter](pendingUpdates, "incrementNestCounter");
      v31 = sub_10043333C();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        goto LABEL_20;
      v58 = v30;
      v33 = self;
      v34 = (objc_class *)objc_opt_class(v33);
      v35 = NSStringFromClass(v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      if ((objc_opt_respondsToSelector(v33, "accessibilityIdentifier") & 1) != 0)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v33, "performSelector:", "accessibilityIdentifier"));
        v38 = v37;
        if (v37 && !objc_msgSend(v37, "isEqualToString:", v36))
        {
          v39 = v12;
          v40 = v11;
          v41 = v7;
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v36, v33, v38));

          goto LABEL_19;
        }

      }
      v39 = v12;
      v40 = v11;
      v41 = v7;
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v36, v33));
LABEL_19:

      v43 = self->_pendingUpdates;
      *(_DWORD *)buf = 138543874;
      v62 = v42;
      v63 = 2048;
      v64 = v43;
      v65 = 2048;
      v66 = (__CFString *)v58;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "[%{public}@] Incrementing batch update %p nest counter to %lu", buf, 0x20u);

      v7 = v41;
      v11 = v40;
      v12 = v39;
LABEL_20:

      v10[2](v10);
      if (v12)
      {
        v44 = self->_pendingUpdates;
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472;
        v59[2] = sub_100A01474;
        v59[3] = &unk_1011DF6C8;
        v60 = v12;
        -[CarCardsUpdate addCompletionBlock:](v44, "addCompletionBlock:", v59);

      }
      v45 = -[CarCardsUpdate decrementNestCounter](self->_pendingUpdates, "decrementNestCounter");
      if (!v45)
      {
        -[CarCardsUpdate setAnimated:](self->_pendingUpdates, "setAnimated:", v7);
        -[CarCardsUpdate setParentAnimation:](self->_pendingUpdates, "setParentAnimation:", v11);
        -[CarCardsOverlay _runNextUpdate](self, "_runNextUpdate");
        goto LABEL_32;
      }
      v46 = v45;
      v47 = sub_10043333C();
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        goto LABEL_30;
      v49 = self;
      v50 = (objc_class *)objc_opt_class(v49);
      v51 = NSStringFromClass(v50);
      v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
      if ((objc_opt_respondsToSelector(v49, "accessibilityIdentifier") & 1) != 0)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v49, "performSelector:", "accessibilityIdentifier"));
        v54 = v53;
        if (v53 && !objc_msgSend(v53, "isEqualToString:", v52))
        {
          v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v52, v49, v54));

          goto LABEL_29;
        }

      }
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v52, v49));
LABEL_29:

      v56 = self->_pendingUpdates;
      *(_DWORD *)buf = 138543874;
      v62 = v55;
      v63 = 2048;
      v64 = v56;
      v65 = 2048;
      v66 = (__CFString *)v46;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "[%{public}@] Will not attempt run update, our updates %p are nested (%lu levels)", buf, 0x20u);

LABEL_30:
      goto LABEL_32;
    }
    v18 = self;
    v19 = (objc_class *)objc_opt_class(v18);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if ((objc_opt_respondsToSelector(v18, "accessibilityIdentifier") & 1) != 0)
    {
      v57 = v12;
      v22 = v11;
      v23 = v7;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v18, "performSelector:", "accessibilityIdentifier"));
      v25 = v24;
      if (v24 && !objc_msgSend(v24, "isEqualToString:", v21))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v21, v18, v25));

        v7 = v23;
        v11 = v22;
        v12 = v57;
        goto LABEL_9;
      }

      v7 = v23;
      v11 = v22;
      v12 = v57;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v21, v18));
LABEL_9:

    v27 = self->_pendingUpdates;
    v28 = CFSTR("NO");
    if (v7)
      v28 = CFSTR("YES");
    v29 = v28;
    *(_DWORD *)buf = 138543874;
    v62 = v26;
    v63 = 2048;
    v64 = v27;
    v65 = 2112;
    v66 = v29;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}@] Creating batch updates %p (animated:%@)", buf, 0x20u);

    goto LABEL_12;
  }
LABEL_32:

}

- (id)_batchedUpdates
{
  return self->_pendingUpdates;
}

- (void)_runNextUpdate
{
  unsigned int v3;
  CarCardsUpdate *runningUpdates;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  CarCardsOverlay *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CarCardsUpdate *pendingUpdates;
  CarCardsUpdate *v16;
  id v17;
  CarCardsOverlay *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CarCardsOverlay *v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CarCardsUpdate *v32;
  CarCardsUpdate *v33;
  CarCardsOverlay *v34;
  objc_class *v35;
  NSString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  CarCardsUpdate *v41;
  CarCardsUpdate *v42;
  id v43;
  CarCardsUpdate *v44;
  CarCardsUpdate *v45;
  id WeakRetained;
  id v47;
  _QWORD v48[5];
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  CarCardsUpdate *v53;
  __int16 v54;
  CarCardsUpdate *v55;

  if (!self->_pendingUpdates)
  {
    v17 = sub_10043333C();
    v6 = objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      goto LABEL_11;
    v18 = self;
    v19 = (objc_class *)objc_opt_class(v18);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if ((objc_opt_respondsToSelector(v18, "accessibilityIdentifier") & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v18, "performSelector:", "accessibilityIdentifier"));
      v23 = v22;
      if (v22 && !objc_msgSend(v22, "isEqualToString:", v21))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v21, v18, v23));

        goto LABEL_18;
      }

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v21, v18));
LABEL_18:

    *(_DWORD *)buf = 138543362;
    v51 = v24;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] No batched updates to run", buf, 0xCu);

    goto LABEL_11;
  }
  v3 = -[CarCardsOverlay _shouldInterruptUpdates:toRunUpdates:](self, "_shouldInterruptUpdates:toRunUpdates:", self->_runningUpdates);
  runningUpdates = self->_runningUpdates;
  v5 = sub_10043333C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (runningUpdates && (v3 & 1) == 0)
  {
    if (!v7)
    {
LABEL_11:

      return;
    }
    v8 = self;
    v9 = (objc_class *)objc_opt_class(v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_10;
      }

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_10:

    pendingUpdates = self->_pendingUpdates;
    v16 = self->_runningUpdates;
    *(_DWORD *)buf = 138543874;
    v51 = v14;
    v52 = 2048;
    v53 = pendingUpdates;
    v54 = 2048;
    v55 = v16;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Will not run next update %p, We're still running the previous one %p and cannot interrupt", buf, 0x20u);

    goto LABEL_11;
  }
  if (!v3)
  {
    if (!v7)
    {
LABEL_36:

      goto LABEL_37;
    }
    v34 = self;
    v35 = (objc_class *)objc_opt_class(v34);
    v36 = NSStringFromClass(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    if ((objc_opt_respondsToSelector(v34, "accessibilityIdentifier") & 1) != 0)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v34, "performSelector:", "accessibilityIdentifier"));
      v39 = v38;
      if (v38 && !objc_msgSend(v38, "isEqualToString:", v37))
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v37, v34, v39));

        goto LABEL_35;
      }

    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v37, v34));
LABEL_35:

    v41 = self->_pendingUpdates;
    *(_DWORD *)buf = 138543618;
    v51 = v40;
    v52 = 2048;
    v53 = v41;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Running next batch updates %p", buf, 0x16u);

    goto LABEL_36;
  }
  if (v7)
  {
    v25 = self;
    v26 = (objc_class *)objc_opt_class(v25);
    v27 = NSStringFromClass(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    if ((objc_opt_respondsToSelector(v25, "accessibilityIdentifier") & 1) != 0)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v25, "performSelector:", "accessibilityIdentifier"));
      v30 = v29;
      if (v29 && !objc_msgSend(v29, "isEqualToString:", v28))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v28, v25, v30));

        goto LABEL_27;
      }

    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v28, v25));
LABEL_27:

    v33 = self->_pendingUpdates;
    v32 = self->_runningUpdates;
    *(_DWORD *)buf = 138543874;
    v51 = v31;
    v52 = 2048;
    v53 = v32;
    v54 = 2048;
    v55 = v33;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Interrupting current updates %p with pending updates %p", buf, 0x20u);

  }
  -[CarCardsOverlay _validatePendingUpdates](self, "_validatePendingUpdates");
LABEL_37:
  v42 = self->_pendingUpdates;
  v43 = objc_initWeak((id *)buf, v42);
  v44 = self->_runningUpdates;
  self->_runningUpdates = v42;

  v45 = self->_pendingUpdates;
  self->_pendingUpdates = 0;

  WeakRetained = objc_loadWeakRetained((id *)buf);
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100A01A30;
  v48[3] = &unk_1011DF6F0;
  v48[4] = self;
  objc_copyWeak(&v49, (id *)buf);
  objc_msgSend(WeakRetained, "addCompletionBlock:", v48);

  v47 = objc_loadWeakRetained((id *)buf);
  objc_msgSend(v47, "run");

  objc_destroyWeak(&v49);
  objc_destroyWeak((id *)buf);
}

- (void)_updateDidComplete:(id)a3
{
  CarCardsUpdate *v4;
  id v5;
  NSObject *v6;
  CarCardsOverlay *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CarCardsUpdate *runningUpdates;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  CarCardsUpdate *v18;

  v4 = (CarCardsUpdate *)a3;
  if (self->_runningUpdates == v4)
  {
    v5 = sub_10043333C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      -[CarCardsOverlay _validatePendingUpdates](self, "_validatePendingUpdates");
      runningUpdates = self->_runningUpdates;
      self->_runningUpdates = 0;

      -[CarCardsOverlay _runNextUpdate](self, "_runNextUpdate");
      goto LABEL_10;
    }
    v7 = self;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_8;
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

    *(_DWORD *)buf = 138543618;
    v16 = v13;
    v17 = 2048;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Running updates %p completed, will check for more updates", buf, 0x16u);

    goto LABEL_9;
  }
LABEL_10:

}

- (BOOL)_shouldInterruptUpdates:(id)a3 toRunUpdates:(id)a4
{
  id v5;
  id v6;
  unsigned int v7;

  v5 = a3;
  v6 = a4;
  if (v5 && objc_msgSend(v5, "isAnimated"))
    v7 = objc_msgSend(v6, "isAnimated") ^ 1;
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (void)_validatePendingUpdates
{
  id v3;
  NSObject *v4;
  CarCardsOverlay *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CarCardsUpdate *v12;
  CarCardsUpdate *runningUpdates;
  CarCardsUpdate *pendingUpdates;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  CarCardsUpdate *v19;
  __int16 v20;
  CarCardsUpdate *v21;

  if (self->_pendingUpdates && self->_runningUpdates)
  {
    v3 = sub_10043333C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
LABEL_10:

      pendingUpdates = self->_pendingUpdates;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100A01E48;
      v15[3] = &unk_1011DF718;
      v15[4] = self;
      -[CarCardsUpdate validateUpdatesUsingBlock:](pendingUpdates, "validateUpdatesUsingBlock:", v15);
      return;
    }
    v5 = self;
    v6 = (objc_class *)objc_opt_class(v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if ((objc_opt_respondsToSelector(v5, "accessibilityIdentifier") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v5, "performSelector:", "accessibilityIdentifier"));
      v10 = v9;
      if (v9 && !objc_msgSend(v9, "isEqualToString:", v8))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v8, v5, v10));

        goto LABEL_9;
      }

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v8, v5));
LABEL_9:

    v12 = self->_pendingUpdates;
    runningUpdates = self->_runningUpdates;
    *(_DWORD *)buf = 138543874;
    v17 = v11;
    v18 = 2048;
    v19 = v12;
    v20 = 2048;
    v21 = runningUpdates;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Validating updates %p given in-flight/completed updates %p", buf, 0x20u);

    goto LABEL_10;
  }
}

- (id)_configurationForKey:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  CarCardConfiguration *v8;
  id WeakRetained;
  void *v10;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationsByKey](self, "configurationsByKey"));
  v8 = (CarCardConfiguration *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

  if (!v8 && v4)
  {
    v8 = (CarCardConfiguration *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate pendingDeletedConfigurationForKey:](self->_pendingUpdates, "pendingDeletedConfigurationForKey:", v6));
    if (!v8)
    {
      v8 = -[CarCardConfiguration initWithKey:carSceneType:]([CarCardConfiguration alloc], "initWithKey:carSceneType:", v6, self->_carSceneType);
      WeakRetained = objc_loadWeakRetained((id *)&self->_cardDelegate);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration cardView](v8, "cardView"));
      objc_msgSend(v10, "setDelegate:", WeakRetained);

      -[CarCardConfiguration _setShowContainerVisualisation:](v8, "_setShowContainerVisualisation:", self->_showDebugVisualisation);
    }
  }

  return v8;
}

- (void)_setCardConfiguration:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationKeys](self, "configurationKeys"));
    if (v9)
    {
      objc_msgSend(v7, "addObject:", v6);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationsByKey](self, "configurationsByKey"));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v6);
    }
    else
    {
      objc_msgSend(v7, "removeObject:", v6);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationsByKey](self, "configurationsByKey"));
      objc_msgSend(v8, "removeObjectForKey:", v6);
    }

  }
}

- (void)_captureInsetContraintsFromConfigurations
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  CarCardsOverlay *v8;
  CarCardsOverlay *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  CarCardsOverlay *v16;
  CarCardsOverlay *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  __CFString *v45;
  __int16 v46;
  id v47;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationsByKey](self, "configurationsByKey"));
  v4 = objc_msgSend(v3, "count");

  v5 = sub_10043333C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (!v4)
  {
    if (!v7)
    {
LABEL_23:

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay host](self, "host"));
      objc_msgSend(v38, "setViewportConstraints:forOverlay:", 0, self);

      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay host](self, "host"));
      objc_msgSend(v39, "setMapInsetsConstraints:forOverlay:", 0, self);

      v31 = (id)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay host](self, "host"));
      objc_msgSend(v31, "setCollisionConstraints:forOverlay:", 0, self);
      goto LABEL_24;
    }
    v16 = self;
    v17 = v16;
    if (!v16)
    {
      v23 = CFSTR("<nil>");
      goto LABEL_22;
    }
    v18 = (objc_class *)objc_opt_class(v16);
    v19 = NSStringFromClass(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if ((objc_opt_respondsToSelector(v17, "accessibilityIdentifier") & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v17, "performSelector:", "accessibilityIdentifier"));
      v22 = v21;
      if (v21 && !objc_msgSend(v21, "isEqualToString:", v20))
      {
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v20, v17, v22));

        goto LABEL_17;
      }

    }
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v20, v17));
LABEL_17:

LABEL_22:
    *(_DWORD *)buf = 138543362;
    v45 = v23;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] No cards from which to capture inset constraints", buf, 0xCu);

    goto LABEL_23;
  }
  if (v7)
  {
    v8 = self;
    v9 = v8;
    if (!v8)
    {
      v15 = CFSTR("<nil>");
      goto LABEL_19;
    }
    v10 = (objc_class *)objc_opt_class(v8);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_9;
      }

    }
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_9:

LABEL_19:
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationsByKey](v9, "configurationsByKey"));
    *(_DWORD *)buf = 138543618;
    v45 = v15;
    v46 = 2048;
    v47 = objc_msgSend(v24, "count");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Capturing inset constraints from %lu cards", buf, 0x16u);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationsByKey](self, "configurationsByKey"));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100A026FC;
  v40[3] = &unk_1011DF740;
  v41 = v25;
  v42 = v26;
  v43 = v27;
  v29 = v27;
  v30 = v26;
  v31 = v25;
  objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v40);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay host](self, "host"));
  v33 = objc_msgSend(v31, "copy");
  objc_msgSend(v32, "setViewportConstraints:forOverlay:", v33, self);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay host](self, "host"));
  v35 = objc_msgSend(v30, "copy");
  objc_msgSend(v34, "setMapInsetsConstraints:forOverlay:", v35, self);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay host](self, "host"));
  v37 = objc_msgSend(v29, "copy");
  objc_msgSend(v36, "setCollisionConstraints:forOverlay:", v37, self);

LABEL_24:
}

- (void)reset
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  CarCardsOverlay *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CarCardsUpdate *runningUpdates;
  CarCardsUpdate *pendingUpdates;
  CarCardsOverlay *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationsByKey](self, "configurationsByKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate pendingDeletedConfigurations](self->_pendingUpdates, "pendingDeletedConfigurations"));
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsUpdate pendingDeletedConfigurations](self->_runningUpdates, "pendingDeletedConfigurations"));
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  v8 = objc_msgSend(v3, "count");
  v9 = sub_10043333C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (!v8)
  {
    if (!v11)
      goto LABEL_17;
    v21 = self;
    v22 = (objc_class *)objc_opt_class(v21);
    v23 = NSStringFromClass(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    if ((objc_opt_respondsToSelector(v21, "accessibilityIdentifier") & 1) != 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v21, "performSelector:", "accessibilityIdentifier"));
      v26 = v25;
      if (v25 && !objc_msgSend(v25, "isEqualToString:", v24))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v24, v21, v26));

        goto LABEL_16;
      }

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v24, v21));
LABEL_16:

    *(_DWORD *)buf = 138543362;
    v29 = v27;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] No cards to reset", buf, 0xCu);

    goto LABEL_17;
  }
  if (v11)
  {
    v12 = self;
    v13 = (objc_class *)objc_opt_class(v12);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if ((objc_opt_respondsToSelector(v12, "accessibilityIdentifier") & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v12, "performSelector:", "accessibilityIdentifier"));
      v17 = v16;
      if (v16 && !objc_msgSend(v16, "isEqualToString:", v15))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v15, v12, v17));

        goto LABEL_8;
      }

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v15, v12));
LABEL_8:

    *(_DWORD *)buf = 138543874;
    v29 = v18;
    v30 = 2048;
    v31 = objc_msgSend(v3, "count");
    v32 = 2112;
    v33 = v3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] Will reset %lu cards: %@", buf, 0x20u);

  }
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &stru_1011DF780);
  runningUpdates = self->_runningUpdates;
  self->_runningUpdates = 0;

  pendingUpdates = self->_pendingUpdates;
  self->_pendingUpdates = 0;

  v10 = objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationsByKey](self, "configurationsByKey"));
  -[NSObject removeAllObjects](v10, "removeAllObjects");
LABEL_17:

}

- (void)cardsUpdate:(id)a3 prepareForUpdate:(unint64_t)a4 withCardConfigurations:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  CarCardsOverlay *v12;
  CarCardsOverlay *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  const __CFString *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  UIAccessibilityNotifications v25;
  void *i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  __CFString *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  id v47;

  v8 = a3;
  v9 = a5;
  v10 = sub_10043333C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    goto LABEL_14;
  v12 = self;
  v13 = v12;
  if (!v12)
  {
    v19 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v14 = (objc_class *)objc_opt_class(v12);
  v15 = NSStringFromClass(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if ((objc_opt_respondsToSelector(v13, "accessibilityIdentifier") & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v13, "performSelector:", "accessibilityIdentifier"));
    v18 = v17;
    if (v17 && !objc_msgSend(v17, "isEqualToString:", v16))
    {
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v16, v13, v18));

      goto LABEL_8;
    }

  }
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v16, v13));
LABEL_8:

LABEL_10:
  if (a4 > 2)
    v20 = CFSTR("unknown");
  else
    v20 = off_1011DF8D8[a4];
  *(_DWORD *)buf = 138544130;
  v41 = v19;
  v42 = 2048;
  v43 = v8;
  v44 = 2112;
  v45 = v20;
  v46 = 2048;
  v47 = objc_msgSend(v9, "count");
  _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@] %p | Will prepare %@ update for %lu card configurations", buf, 0x2Au);

LABEL_14:
  v34 = v8;

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v21 = v9;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v36;
    v25 = UIAccessibilityScreenChangedNotification;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v24)
          objc_enumerationMutation(v21);
        v27 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v27, "_startIgnoringContainerBoundsChanges");
        if (a4 == 2)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay host](self, "host"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "containingViewController"));

          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "content"));
          objc_msgSend(v30, "addChildViewController:", v31);

          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "content"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "view"));
          UIAccessibilityPostNotification(v25, v33);

        }
        else if (!a4)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "content"));
          objc_msgSend(v28, "willMoveToParentViewController:", 0);

          UIAccessibilityPostNotification(v25, 0);
        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v23);
  }

}

- (void)cardsUpdate:(id)a3 applyConfigurations:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  CarCardsOverlay *v10;
  CarCardsOverlay *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  _BYTE v47[128];
  uint8_t v48[128];
  uint8_t buf[4];
  __CFString *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;

  v6 = a3;
  v7 = a4;
  v8 = sub_10043333C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = self;
    v11 = v10;
    if (!v10)
    {
      v17 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v12 = (objc_class *)objc_opt_class(v10);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v11, "performSelector:", "accessibilityIdentifier"));
      v16 = v15;
      if (v15 && !objc_msgSend(v15, "isEqualToString:", v14))
      {
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

        goto LABEL_8;
      }

    }
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543874;
    v50 = v17;
    v51 = 2048;
    v52 = v6;
    v53 = 2048;
    v54 = objc_msgSend(v7, "count");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] %p | Will apply %lu card configurations", buf, 0x20u);

  }
  v37 = v6;

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100A03214;
  v46[3] = &unk_1011DF7A8;
  v46[4] = self;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingComparator:", v46));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay host](self, "host"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay host](self, "host"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "layoutGuideForOverlay:", self));

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v22 = v18;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i), "layoutInHost:withLayoutGuide:", v19, v21);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v24);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v27 = v22;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v29; j = (char *)j + 1)
      {
        if (*(_QWORD *)v39 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend(v32, "staysOnTop"))
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "cardView"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "superview"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "cardView"));
          objc_msgSend(v34, "bringSubviewToFront:", v35);

        }
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v29);
  }

  -[CarCardsOverlay _captureInsetContraintsFromConfigurations](self, "_captureInsetContraintsFromConfigurations");
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay contentView](self, "contentView"));
  objc_msgSend(v36, "setNeedsFocusUpdate");

}

- (void)cardsUpdateWantsLayout:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  CarCardsOverlay *v7;
  CarCardsOverlay *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  __CFString *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  v5 = sub_10043333C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v18 = v14;
    v19 = 2048;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] %p | Wants layout", buf, 0x16u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay contentView](self, "contentView"));
  objc_msgSend(v15, "layoutIfNeeded");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationsByKey](self, "configurationsByKey"));
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", &stru_1011DF7C8);

}

- (void)cardsUpdate:(id)a3 finalizeUpdate:(unint64_t)a4 withCardConfigurations:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  CarCardsOverlay *v12;
  CarCardsOverlay *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  const __CFString *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  __CFString *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  id v43;

  v8 = a3;
  v9 = a5;
  v10 = sub_10043333C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    goto LABEL_14;
  v12 = self;
  v13 = v12;
  if (!v12)
  {
    v19 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v14 = (objc_class *)objc_opt_class(v12);
  v15 = NSStringFromClass(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if ((objc_opt_respondsToSelector(v13, "accessibilityIdentifier") & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay performSelector:](v13, "performSelector:", "accessibilityIdentifier"));
    v18 = v17;
    if (v17 && !objc_msgSend(v17, "isEqualToString:", v16))
    {
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v16, v13, v18));

      goto LABEL_8;
    }

  }
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v16, v13));
LABEL_8:

LABEL_10:
  if (a4 > 2)
    v20 = CFSTR("unknown");
  else
    v20 = off_1011DF8D8[a4];
  *(_DWORD *)buf = 138544130;
  v37 = v19;
  v38 = 2048;
  v39 = v8;
  v40 = 2112;
  v41 = v20;
  v42 = 2048;
  v43 = objc_msgSend(v9, "count");
  _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@] %p | Will finalize %@ update for %lu card configurations", buf, 0x2Au);

LABEL_14:
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v21 = v9;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        if (a4 == 2)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay host](self, "host"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "containingViewController"));

          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "content"));
          objc_msgSend(v30, "didMoveToParentViewController:", v29);

        }
        else if (!a4)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i), "previousContent"));
          objc_msgSend(v27, "removeFromParentViewController");

          objc_msgSend(v26, "setPreviousContent:", 0);
        }
        objc_msgSend(v26, "_stopIgnoringContainerBoundsChanges");
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v23);
  }

}

- (NSArray)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay contentView](self, "contentView"));

  if (!v3)
    return (NSArray *)&__NSArray0__struct;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay contentView](self, "contentView"));
  v7 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));

  return (NSArray *)v5;
}

- (NSArray)focusOrderSubItems
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationsByKey](self, "configurationsByKey"));
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return (NSArray *)&__NSArray0__struct;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardsOverlay configurationsByKey](self, "configurationsByKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingComparator:", &stru_1011DF808));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "cardView", (_QWORD)v18));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "focusOrderSubItems"));
        objc_msgSend(v5, "addObjectsFromArray:", v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v16 = objc_msgSend(v5, "copy");
  return (NSArray *)v16;
}

- (ChromeOverlayHosting)host
{
  return (ChromeOverlayHosting *)objc_loadWeakRetained((id *)&self->_host);
}

- (CarCardViewDelegate)cardDelegate
{
  return (CarCardViewDelegate *)objc_loadWeakRetained((id *)&self->_cardDelegate);
}

- (UIView)contentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_contentView);
}

- (NSMutableOrderedSet)configurationKeys
{
  return self->_configurationKeys;
}

- (void)setConfigurationKeys:(id)a3
{
  objc_storeStrong((id *)&self->_configurationKeys, a3);
}

- (NSMutableDictionary)configurationsByKey
{
  return self->_configurationsByKey;
}

- (void)setConfigurationsByKey:(id)a3
{
  objc_storeStrong((id *)&self->_configurationsByKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationsByKey, 0);
  objc_storeStrong((id *)&self->_configurationKeys, 0);
  objc_destroyWeak((id *)&self->_contentView);
  objc_destroyWeak((id *)&self->_cardDelegate);
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_runningUpdates, 0);
  objc_storeStrong((id *)&self->_pendingUpdates, 0);
}

@end
