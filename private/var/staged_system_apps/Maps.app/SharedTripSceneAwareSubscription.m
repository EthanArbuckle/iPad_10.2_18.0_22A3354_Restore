@implementation SharedTripSceneAwareSubscription

- (SharedTripSceneAwareSubscription)initWithTripIdentifier:(id)a3 scene:(id)a4
{
  id v6;
  id v7;
  SharedTripSceneAwareSubscription *v8;
  NSString *v9;
  NSString *tripIdentifier;
  id v11;
  void *v12;
  id WeakRetained;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SharedTripSceneAwareSubscription;
  v8 = -[SharedTripSceneAwareSubscription init](&v21, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    tripIdentifier = v8->_tripIdentifier;
    v8->_tripIdentifier = v9;

    v11 = objc_storeWeak((id *)&v8->_scene, v7);
    -[SharedTripSceneAwareSubscription _updateForSceneState:](v8, "_updateForSceneState:", objc_msgSend(v7, "activationState"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    WeakRetained = objc_loadWeakRetained((id *)&v8->_scene);
    objc_msgSend(v12, "addObserver:selector:name:object:", v8, "_unsubscribeIfNecessary:", UISceneWillDeactivateNotification, WeakRetained);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v15 = objc_loadWeakRetained((id *)&v8->_scene);
    objc_msgSend(v14, "addObserver:selector:name:object:", v8, "_unsubscribeIfNecessary:", UISceneDidEnterBackgroundNotification, v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v17 = objc_loadWeakRetained((id *)&v8->_scene);
    objc_msgSend(v16, "addObserver:selector:name:object:", v8, "_subscribeIfNecessary:", UISceneDidActivateNotification, v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v19 = objc_loadWeakRetained((id *)&v8->_scene);
    objc_msgSend(v18, "addObserver:selector:name:object:", v8, "_subscribeIfNecessary:", UISceneWillEnterForegroundNotification, v19);

  }
  return v8;
}

- (void)_unsubscribeIfNecessary:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  SharedTripSceneAwareSubscription *v7;
  SharedTripSceneAwareSubscription *v8;
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
  void *v20;
  __int16 v21;
  void *v22;

  v4 = a3;
  v5 = sub_10043237C();
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
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSceneAwareSubscription performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
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
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
    *(_DWORD *)buf = 138543874;
    v18 = v14;
    v19 = 2114;
    v20 = v15;
    v21 = 2114;
    v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Scene deactivating with %{public}@: %{public}@", buf, 0x20u);

  }
  -[SharedTripSceneAwareSubscription _updateForSceneState:](self, "_updateForSceneState:", 2);

}

- (void)_subscribeIfNecessary:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  SharedTripSceneAwareSubscription *v7;
  SharedTripSceneAwareSubscription *v8;
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
  void *v20;
  __int16 v21;
  void *v22;

  v4 = a3;
  v5 = sub_10043237C();
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
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSceneAwareSubscription performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
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
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
    *(_DWORD *)buf = 138543874;
    v18 = v14;
    v19 = 2114;
    v20 = v15;
    v21 = 2114;
    v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Scene activating with %{public}@: %{public}@", buf, 0x20u);

  }
  -[SharedTripSceneAwareSubscription _updateForSceneState:](self, "_updateForSceneState:", 0);

}

- (void)_updateForSceneState:(int64_t)a3
{
  id v5;
  NSObject *v6;
  SharedTripSceneAwareSubscription *v7;
  id *p_isa;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  const char *v15;
  id WeakRetained;
  void *v17;
  const __CFString *v18;
  uint8_t buf[4];
  __CFString *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  const __CFString *v26;

  v5 = sub_10043237C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    goto LABEL_17;
  v7 = self;
  p_isa = (id *)&v7->super.isa;
  if (!v7)
  {
    v14 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v9 = (objc_class *)objc_opt_class(v7);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if ((objc_opt_respondsToSelector(p_isa, "accessibilityIdentifier") & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "performSelector:", "accessibilityIdentifier"));
    v13 = v12;
    if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
    {
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, p_isa, v13));

      goto LABEL_8;
    }

  }
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, p_isa));
LABEL_8:

LABEL_10:
  if ((unint64_t)a3 >= 2)
    v15 = "inactive";
  else
    v15 = "active";
  WeakRetained = objc_loadWeakRetained(p_isa + 2);
  v17 = WeakRetained;
  if ((unint64_t)(a3 + 1) > 3)
    v18 = CFSTR("unknown");
  else
    v18 = *(&off_1011E2998 + a3 + 1);
  *(_DWORD *)buf = 138544130;
  v20 = v14;
  v21 = 2080;
  v22 = v15;
  v23 = 2114;
  v24 = WeakRetained;
  v25 = 2114;
  v26 = v18;
  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Will set %s for scene state %{public}@: %{public}@", buf, 0x2Au);

LABEL_17:
  -[SharedTripSceneAwareSubscription _setIsActive:](self, "_setIsActive:", (unint64_t)a3 < 2);
}

- (void)_setIsActive:(BOOL)a3
{
  id WeakRetained;
  id v5;
  NSObject *v6;
  SharedTripSceneAwareSubscription *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *tripIdentifier;
  NSString *v15;
  void *v16;
  NSObject *token;
  id v18;
  NSObject *v19;
  SharedTripSceneAwareSubscription *v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSString *v27;
  id v28;
  SharedTripSceneAwareSubscription *v29;
  objc_class *v30;
  NSString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSString *v37;
  id v38;
  void *v39;
  objc_class *v40;
  NSString *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  _QWORD v46[4];
  NSObject *v47;
  id v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  NSString *v52;
  __int16 v53;
  __CFString *v54;

  if (self->_active != a3)
  {
    self->_active = a3;
    if (!a3)
      goto LABEL_15;
    if (self->_tripIdentifier)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

      if (WeakRetained)
      {
        if (self->_active)
        {
          if (self->_token)
            return;
          v5 = sub_10043237C();
          v6 = objc_claimAutoreleasedReturnValue(v5);
          if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
            goto LABEL_14;
          v7 = self;
          v8 = (objc_class *)objc_opt_class(v7);
          v9 = NSStringFromClass(v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
          if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSceneAwareSubscription performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
            v12 = v11;
            if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
            {
              v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

              goto LABEL_13;
            }

          }
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_13:

          tripIdentifier = self->_tripIdentifier;
          *(_DWORD *)buf = 138543618;
          v50 = v13;
          v51 = 2114;
          v52 = tripIdentifier;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Acquiring token for trip %{public}@", buf, 0x16u);

LABEL_14:
          v15 = self->_tripIdentifier;
          objc_initWeak((id *)buf, self);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
          v46[0] = _NSConcreteStackBlock;
          v46[1] = 3221225472;
          v46[2] = sub_100B0A5FC;
          v46[3] = &unk_1011B03E0;
          objc_copyWeak(&v48, (id *)buf);
          token = v15;
          v47 = token;
          objc_msgSend(v16, "subscribeToSharedTripUpdatesWithIdentifier:completion:", token, v46);

          objc_destroyWeak(&v48);
          objc_destroyWeak((id *)buf);
LABEL_39:

          return;
        }
LABEL_15:
        if (!self->_token)
          return;
        v18 = sub_10043237C();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          goto LABEL_23;
        v20 = self;
        v21 = (objc_class *)objc_opt_class(v20);
        v22 = NSStringFromClass(v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        if ((objc_opt_respondsToSelector(v20, "accessibilityIdentifier") & 1) != 0)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSceneAwareSubscription performSelector:](v20, "performSelector:", "accessibilityIdentifier"));
          v25 = v24;
          if (v24 && !objc_msgSend(v24, "isEqualToString:", v23))
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v23, v20, v25));

            goto LABEL_22;
          }

        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v23, v20));
LABEL_22:

        v27 = v20->_tripIdentifier;
        *(_DWORD *)buf = 138543618;
        v50 = v26;
        v51 = 2114;
        v52 = v27;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}@] Removing token for trip %{public}@", buf, 0x16u);

LABEL_23:
        token = self->_token;
        self->_token = 0;
        goto LABEL_39;
      }
    }
    v28 = sub_10043237C();
    token = objc_claimAutoreleasedReturnValue(v28);
    if (!os_log_type_enabled(token, OS_LOG_TYPE_FAULT))
      goto LABEL_39;
    v29 = self;
    v30 = (objc_class *)objc_opt_class(v29);
    v31 = NSStringFromClass(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    if ((objc_opt_respondsToSelector(v29, "accessibilityIdentifier") & 1) != 0)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSceneAwareSubscription performSelector:](v29, "performSelector:", "accessibilityIdentifier"));
      v34 = v33;
      if (v33 && !objc_msgSend(v33, "isEqualToString:", v32))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v32, v29, v34));

LABEL_30:
        v36 = v35;
        v37 = self->_tripIdentifier;
        v38 = objc_loadWeakRetained((id *)&v29->_scene);
        v39 = v38;
        if (!v38)
        {
          v45 = CFSTR("<nil>");
          goto LABEL_38;
        }
        v40 = (objc_class *)objc_opt_class(v38);
        v41 = NSStringFromClass(v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        if ((objc_opt_respondsToSelector(v39, "accessibilityIdentifier") & 1) != 0)
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "performSelector:", "accessibilityIdentifier"));
          v44 = v43;
          if (v43 && !objc_msgSend(v43, "isEqualToString:", v42))
          {
            v45 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v42, v39, v44));

            goto LABEL_36;
          }

        }
        v45 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v42, v39));
LABEL_36:

LABEL_38:
        *(_DWORD *)buf = 138543874;
        v50 = v36;
        v51 = 2114;
        v52 = v37;
        v53 = 2114;
        v54 = v45;
        _os_log_impl((void *)&_mh_execute_header, token, OS_LOG_TYPE_FAULT, "[%{public}@] Cannot activate because no trip ID %{public}@ or scene %{public}@", buf, 0x20u);

        goto LABEL_39;
      }

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v32, v29));
    goto LABEL_30;
  }
}

- (BOOL)_isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_token, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_tripIdentifier, 0);
}

@end
