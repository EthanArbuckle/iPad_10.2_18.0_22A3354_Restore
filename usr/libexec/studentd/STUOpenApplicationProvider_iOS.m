@implementation STUOpenApplicationProvider_iOS

- (void)dealloc
{
  objc_super v3;

  -[STUOpenApplicationProvider_iOS endUpdating](self, "endUpdating");
  v3.receiver = self;
  v3.super_class = (Class)STUOpenApplicationProvider_iOS;
  -[STUOpenApplicationProvider_iOS dealloc](&v3, "dealloc");
}

- (STUOpenApplicationProvider_iOS)init
{
  STUOpenApplicationProvider_iOS *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *layoutMonitorsByIdentity;
  NSArray *allOpenBundleIDs;
  STUPrimaryApplicationProvider_iOS *v6;
  STUPrimaryApplicationProvider_iOS *concretePrimaryAppProvider;
  STUSecondaryApplicationProvider_iOS *v8;
  STUSecondaryApplicationProvider_iOS *concreteSecondaryAppProvider;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)STUOpenApplicationProvider_iOS;
  v2 = -[STUOpenApplicationProvider_iOS init](&v11, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    layoutMonitorsByIdentity = v2->_layoutMonitorsByIdentity;
    v2->_layoutMonitorsByIdentity = v3;

    allOpenBundleIDs = v2->_allOpenBundleIDs;
    v2->_allOpenBundleIDs = (NSArray *)&__NSArray0__struct;

    v6 = objc_opt_new(STUPrimaryApplicationProvider_iOS);
    concretePrimaryAppProvider = v2->_concretePrimaryAppProvider;
    v2->_concretePrimaryAppProvider = v6;

    v8 = objc_opt_new(STUSecondaryApplicationProvider_iOS);
    concreteSecondaryAppProvider = v2->_concreteSecondaryAppProvider;
    v2->_concreteSecondaryAppProvider = v8;

  }
  return v2;
}

- (id)key
{
  return CRKDeviceAllOpenApplicationsKey;
}

- (void)beginUpdating
{
  FBSDisplayMonitor *v3;
  void *v4;
  void *v5;
  void *v6;

  if (!-[STUOpenApplicationProvider_iOS isObserving](self, "isObserving"))
  {
    v3 = objc_opt_new(FBSDisplayMonitor);
    -[STUOpenApplicationProvider_iOS setDisplayMonitor:](self, "setDisplayMonitor:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenApplicationProvider_iOS displayMonitor](self, "displayMonitor"));
    objc_msgSend(v4, "addObserver:", self);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenApplicationProvider_iOS displayMonitor](self, "displayMonitor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainIdentity"));
    -[STUOpenApplicationProvider_iOS didConnectIdentity:](self, "didConnectIdentity:", v6);

    -[STUOpenApplicationProvider_iOS setObserving:](self, "setObserving:", 1);
  }
}

- (void)endUpdating
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (-[STUOpenApplicationProvider_iOS isObserving](self, "isObserving"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenApplicationProvider_iOS displayMonitor](self, "displayMonitor"));
    objc_msgSend(v3, "removeObserver:", self);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenApplicationProvider_iOS displayMonitor](self, "displayMonitor"));
    objc_msgSend(v4, "invalidate");

    -[STUOpenApplicationProvider_iOS setDisplayMonitor:](self, "setDisplayMonitor:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenApplicationProvider_iOS layoutMonitorsByIdentity](self, "layoutMonitorsByIdentity", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          -[STUOpenApplicationProvider_iOS tearDownLayoutMonitor:](self, "tearDownLayoutMonitor:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10));
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenApplicationProvider_iOS layoutMonitorsByIdentity](self, "layoutMonitorsByIdentity"));
    objc_msgSend(v11, "removeAllObjects");

    -[STUOpenApplicationProvider_iOS setObserving:](self, "setObserving:", 0);
  }
}

- (void)monitor:(id)a3 forIdentity:(id)a4 didUpdateLayout:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenApplicationProvider_iOS layoutMonitorsByIdentity](self, "layoutMonitorsByIdentity"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

  if (v11 == v12)
  {
    objc_msgSend(v12, "setStu_currentLayout:", v8);
    -[STUOpenApplicationProvider_iOS collectBundleIdentifiers](self, "collectBundleIdentifiers");
  }

}

- (void)collectBundleIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenApplicationProvider_iOS layoutMonitorsByIdentity](self, "layoutMonitorsByIdentity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crk_mapUsingBlock:", &stru_1000CA680));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
  -[STUOpenApplicationProvider_iOS collectBundleIdentifiersFromLayouts:](self, "collectBundleIdentifiersFromLayouts:", v5);

}

- (void)collectBundleIdentifiersFromLayouts:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentUser"));
  v6 = objc_msgSend(v5, "isLoginUser");

  if (v6)
  {
    -[STUOpenApplicationProvider_iOS updateWithBundleIdentifiers:](self, "updateWithBundleIdentifiers:", &off_1000D4260);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[STUDisplayLayoutReader bundleIdentifiersInLayouts:](STUDisplayLayoutReader, "bundleIdentifiersInLayouts:", v10));
    v8 = CRKSpringBoardBundleIdentifier;
    if (objc_msgSend(v7, "containsObject:", CRKSpringBoardBundleIdentifier)
      && (unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crk_arrayByRemovingObject:", v8));

      v7 = (void *)v9;
    }
    -[STUOpenApplicationProvider_iOS updateWithBundleIdentifiers:](self, "updateWithBundleIdentifiers:", v7);

  }
}

- (void)updateWithBundleIdentifiers:(id)a3
{
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;
  unint64_t v7;

  v7 = (unint64_t)a3;
  v4 = objc_claimAutoreleasedReturnValue(-[STUOpenApplicationProvider_iOS allOpenBundleIDs](self, "allOpenBundleIDs"));
  if (v7 | v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenApplicationProvider_iOS allOpenBundleIDs](self, "allOpenBundleIDs"));
    v6 = objc_msgSend(v5, "isEqual:", v7);

    if ((v6 & 1) == 0)
      -[STUOpenApplicationProvider_iOS setAllOpenBundleIDs:](self, "setAllOpenBundleIDs:", v7);
  }
  -[STUOpenApplicationProvider_iOS updateDeprecatedPropertyProvidersWithBundleIdentifiers:](self, "updateDeprecatedPropertyProvidersWithBundleIdentifiers:", v7);

}

- (void)updateDeprecatedPropertyProvidersWithBundleIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crk_optionalObjectAtIndex:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crk_optionalObjectAtIndex:", 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenApplicationProvider_iOS concretePrimaryAppProvider](self, "concretePrimaryAppProvider"));
  objc_msgSend(v6, "updateWithBundleIdentifier:", v8);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenApplicationProvider_iOS concreteSecondaryAppProvider](self, "concreteSecondaryAppProvider"));
  objc_msgSend(v7, "updateWithBundleIdentifier:", v5);

}

- (void)didConnectIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenApplicationProvider_iOS layoutMonitorsByIdentity](self, "layoutMonitorsByIdentity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (v6)
  {
    v7 = sub_10002C0C8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10007B8C8((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);

    -[STUOpenApplicationProvider_iOS tearDownLayoutMonitor:](self, "tearDownLayoutMonitor:", v6);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenApplicationProvider_iOS makeLayoutMonitorForIdentity:](self, "makeLayoutMonitorForIdentity:", v4));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenApplicationProvider_iOS layoutMonitorsByIdentity](self, "layoutMonitorsByIdentity"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v4);

}

- (id)makeLayoutMonitorForIdentity:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenApplicationProvider_iOS makeLayoutMonitorConfigurationForIdentity:](self, "makeLayoutMonitorConfigurationForIdentity:", v4));
  objc_msgSend(v5, "setNeedsUserInteractivePriority:", 1);
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002C218;
  v9[3] = &unk_1000CA6D0;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "setTransitionHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitor monitorWithConfiguration:](FBSDisplayLayoutMonitor, "monitorWithConfiguration:", v5));

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

- (id)makeLayoutMonitorConfigurationForIdentity:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "isMainDisplay"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor](FBSDisplayLayoutMonitorConfiguration, "configurationForDefaultMainDisplayMonitor"));
  }
  else
  {
    v5 = SBSCreateLayoutServiceEndpointForExternalDisplay(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitorConfiguration configurationWithEndpoint:](FBSDisplayLayoutMonitorConfiguration, "configurationWithEndpoint:", v6));

  }
  return v4;
}

- (void)tearDownLayoutMonitor:(id)a3
{
  objc_msgSend(a3, "invalidate");
}

+ (id)keyPathsForValuesAffectingValue
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("allOpenBundleIDs"), 0);
}

- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSString *v11;
  void *v12;
  id v13;

  v13 = a4;
  v8 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenApplicationProvider_iOS.m"), 219, CFSTR("%@ must be called from the main thread"), v12);

  }
  v9 = (id)objc_claimAutoreleasedReturnValue(-[STUOpenApplicationProvider_iOS displayMonitor](self, "displayMonitor"));

  if (v9 == v8)
    -[STUOpenApplicationProvider_iOS didConnectIdentity:](self, "didConnectIdentity:", v13);

}

- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSString *v22;
  void *v23;

  v7 = a4;
  v8 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v22 = NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenApplicationProvider_iOS.m"), 230, CFSTR("%@ must be called from the main thread"), v23);

  }
  v9 = (id)objc_claimAutoreleasedReturnValue(-[STUOpenApplicationProvider_iOS displayMonitor](self, "displayMonitor"));

  if (v9 == v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenApplicationProvider_iOS layoutMonitorsByIdentity](self, "layoutMonitorsByIdentity"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v7));

    if (v11)
    {
      -[STUOpenApplicationProvider_iOS tearDownLayoutMonitor:](self, "tearDownLayoutMonitor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenApplicationProvider_iOS layoutMonitorsByIdentity](self, "layoutMonitorsByIdentity"));
      objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v7);

      -[STUOpenApplicationProvider_iOS collectBundleIdentifiers](self, "collectBundleIdentifiers");
    }
    else
    {
      v13 = sub_10002C0C8();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10007B930((uint64_t)v7, v14, v15, v16, v17, v18, v19, v20);

    }
  }

}

- (BOOL)isObserving
{
  return self->_observing;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (FBSDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setDisplayMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_displayMonitor, a3);
}

- (NSMutableDictionary)layoutMonitorsByIdentity
{
  return self->_layoutMonitorsByIdentity;
}

- (NSArray)allOpenBundleIDs
{
  return self->_allOpenBundleIDs;
}

- (void)setAllOpenBundleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (STUPrimaryApplicationProvider_iOS)concretePrimaryAppProvider
{
  return self->_concretePrimaryAppProvider;
}

- (STUSecondaryApplicationProvider_iOS)concreteSecondaryAppProvider
{
  return self->_concreteSecondaryAppProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concreteSecondaryAppProvider, 0);
  objc_storeStrong((id *)&self->_concretePrimaryAppProvider, 0);
  objc_storeStrong((id *)&self->_allOpenBundleIDs, 0);
  objc_storeStrong((id *)&self->_layoutMonitorsByIdentity, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
}

@end
