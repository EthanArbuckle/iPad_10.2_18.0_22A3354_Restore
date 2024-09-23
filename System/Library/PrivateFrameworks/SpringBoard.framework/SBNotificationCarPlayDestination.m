@implementation SBNotificationCarPlayDestination

- (BOOL)isActive
{
  return -[BNBannerHostMonitorListener isBannerHostAvailable](self->_bannerHostMonitorListener, "isBannerHostAvailable");
}

- (SBNotificationCarPlayDestination)init
{
  SBNotificationCarPlayDestination *v2;
  id v3;
  void *v4;
  uint64_t v5;
  BNBannerHostMonitorListener *bannerHostMonitorListener;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBNotificationCarPlayDestination;
  v2 = -[SBNotificationCarPlayDestination init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D01068]);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.CarPlayApp"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithServiceDomain:authorizedBundleIDs:", CFSTR("com.apple.frontboard"), v4);
    bannerHostMonitorListener = v2->_bannerHostMonitorListener;
    v2->_bannerHostMonitorListener = (BNBannerHostMonitorListener *)v5;

    -[BNBannerHostMonitorListener addObserver:](v2->_bannerHostMonitorListener, "addObserver:", v2);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__callOrFaceTimeStateChanged, CFSTR("SBCallCountChangedNotification"), 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__callOrFaceTimeStateChanged, CFSTR("SBFaceTimeStateChangedNotification"), 0);
    v8 = (_QWORD *)MEMORY[0x1E0D482D0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0D482D0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAttribute:forKey:error:", v9, *MEMORY[0x1E0D48280], 0);

    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__voicePromptStyleChanged_, *v8, 0);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[BSAbsoluteMachTimer invalidate](self->_announceTimeoutTimer, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)SBNotificationCarPlayDestination;
  -[SBNotificationCarPlayDestination dealloc](&v4, sel_dealloc);
}

- (id)keyWindowForScreen:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[SBNotificationCarPlayDestination isActive](self, "isActive"))
  {
    -[SBNotificationCarPlayDestination _carPlayBannerSource](self, "_carPlayBannerSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyWindowForScreen:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isAlertDestination
{
  return 1;
}

- (NSString)identifier
{
  return (NSString *)(id)*MEMORY[0x1E0DC60C0];
}

- (BSServiceConnectionEndpoint)endpoint
{
  return (BSServiceConnectionEndpoint *)objc_msgSend(MEMORY[0x1E0D23170], "dashboardEndpoint");
}

- (void)postNotificationRequest:(id)a3
{
  id v4;

  v4 = a3;
  -[SBNotificationCarPlayDestination _postNotificationRequest:shouldAnnounce:](self, "_postNotificationRequest:shouldAnnounce:", v4, -[SBNotificationCarPlayDestination _shouldAnnounceNotificationRequest:](self, "_shouldAnnounceNotificationRequest:", v4));

}

- (void)_postNotificationRequest:(id)a3 shouldAnnounce:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD block[5];
  id v24;
  id v25;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "alertOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldSuppress");

    if ((v9 & 1) == 0)
    {
      if (-[SBNotificationCarPlayDestination _shouldDeferPostingNotificationRequestForAnnounce:](self, "_shouldDeferPostingNotificationRequestForAnnounce:", v7))
      {
        -[SBNotificationCarPlayDestination _queueNotificationRequestWhileAnnouncing:](self, "_queueNotificationRequestWhileAnnouncing:", v7);
      }
      else
      {
        -[SBNotificationCarPlayDestination _clearNotificationRequestPendingAnnounceDeactivationIfNecessary](self, "_clearNotificationRequestPendingAnnounceDeactivationIfNecessary");
        if (!-[SBNotificationCarPlayDestination _isCurrentlyAnnouncing](self, "_isCurrentlyAnnouncing")
          || (-[SBNotificationCarPlayDestination _notificationRequestCurrentlyAnnouncing](self, "_notificationRequestCurrentlyAnnouncing"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v11 = objc_msgSend(v10, "matchesRequest:", v7), v10, v11))
        {
          -[SBNotificationCarPlayDestination _carPlayBannerSource](self, "_carPlayBannerSource");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 0;
          objc_msgSend(v12, "layoutDescriptionWithError:", &v25);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v25;

          if (v13)
          {
            v15 = -[SBNotificationCarPlayDestination _newPresentableForNotificationRequest:layoutDescription:](self, "_newPresentableForNotificationRequest:layoutDescription:", v7, v13);
            -[SBNotificationCarPlayDestination _carPlayBannerSource](self, "_carPlayBannerSource");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = 0;
            v17 = objc_msgSend(v16, "postPresentable:options:userInfo:error:", v15, 0, 0, &v24);
            v18 = v24;

            if ((v17 & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
                -[SBNotificationCarPlayDestination _postNotificationRequest:shouldAnnounce:].cold.2();
              v19 = -[SBNotificationCarPlayDestination _removePresentable:](self, "_removePresentable:", v15);
            }

          }
          else
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
              -[SBNotificationCarPlayDestination _postNotificationRequest:shouldAnnounce:].cold.1();
            v18 = v14;
          }

        }
        if (v4)
        {
          -[SBNotificationCarPlayDestination _notificationRequestCurrentlyAnnouncing](self, "_notificationRequestCurrentlyAnnouncing");
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)v20;
          if (v20)
            v22 = (void *)v20;
          else
            v22 = v7;
          -[SBNotificationCarPlayDestination _setNotificationRequestCurrentlyAnnouncing:](self, "_setNotificationRequestCurrentlyAnnouncing:", v22);

          -[SBNotificationCarPlayDestination _requestAnnounceForNotificationRequest:](self, "_requestAnnounceForNotificationRequest:", v7);
        }
      }
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__SBNotificationCarPlayDestination__postNotificationRequest_shouldAnnounce___block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

void __76__SBNotificationCarPlayDestination__postNotificationRequest_shouldAnnounce___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "destinationDidBecomeReadyToReceiveNotifications:", *(_QWORD *)(a1 + 32));

}

- (void)modifyNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v4, "carPlayRequestIdentifier", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBNotificationCarPlayDestination _presentablesWithRequestIdentifier:](self, "_presentablesWithRequestIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "updateRequestToInstance:", v5);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    -[SBNotificationCarPlayDestination _modifyNotificationRequest:inStore:](self, "_modifyNotificationRequest:inStore:", v5, self->_notificationRequestsForAnnounce);
    -[SBNotificationCarPlayDestination _modifyNotificationRequest:inStore:](self, "_modifyNotificationRequest:inStore:", v5, self->_notificationRequestsPendingAnnounce);
  }

}

- (void)withdrawNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "carPlayRequestIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBNotificationCarPlayDestination _carPlayBannerSource](self, "_carPlayBannerSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v7, "revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:", v6, CFSTR("SBBannerRevocationReasonCarPlayDestinationExplicitDismissal"), 1, 0, &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;

    if (v8)
    {
      -[SBNotificationCarPlayDestination _cancelAnnounceForNotificationRequest:withReason:deactivateAnnounce:](self, "_cancelAnnounceForNotificationRequest:withReason:deactivateAnnounce:", v5, -[SBNotificationCarPlayDestination _announceDeactivationReasonForBannerRevocationReason:](self, "_announceDeactivationReasonForBannerRevocationReason:", CFSTR("SBBannerRevocationReasonCarPlayDestinationExplicitDismissal")), 0);
      -[SBNotificationCarPlayDestination _withdrawNotificationRequest:inStore:](self, "_withdrawNotificationRequest:inStore:", v5, self->_notificationRequestsPendingAnnounce);
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
    {
      -[SBNotificationCarPlayDestination withdrawNotificationRequest:].cold.1();
    }

  }
}

- (void)bannerHostDidBecomeAvailableForMonitorListener:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D27008], "sharedConfiguration", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "currentCountrySupportsCarIntegration");

  -[CRCarPlayAppPolicyEvaluator setGeoSupported:](self->_appPolicyEvaluator, "setGeoSupported:", v5);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("SBNotificationCarPlayDestinationAvailabilityDidChange"), self);

}

- (void)bannerHostDidBecomeUnavailableForMonitorListener:(id)a3
{
  void *v4;
  NCCarPlayBannerSource *carPlayBannerSource;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("SBNotificationCarPlayDestinationAvailabilityDidChange"), self);

  -[NCCarPlayBannerSource invalidate](self->_carPlayBannerSource, "invalidate");
  carPlayBannerSource = self->_carPlayBannerSource;
  self->_carPlayBannerSource = 0;

}

- (void)presentableWillAppearAsBanner:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v8, "notificationRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBNotificationCarPlayDestination _notificationRequestCurrentlyAnnouncing](self, "_notificationRequestCurrentlyAnnouncing");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "matchesRequest:", v10);

  -[SBNotificationCarPlayDestination delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "destination:willPresentNotificationRequest:suppressAlerts:", self, v9, v11);

  if (-[SBNotificationCarPlayDestination _shouldAnnounceNotificationRequest:](self, "_shouldAnnounceNotificationRequest:", v9)&& (-[NSMutableArray containsObject:](self->_notificationRequestsForAnnounce, "containsObject:", v9) & 1) == 0&& (-[NSMutableArray containsObject:](self->_notificationRequestsPendingAVSession, "containsObject:", v9) & 1) == 0)
  {
    v13 = (void *)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      objc_msgSend(v9, "notificationIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "un_logDigest");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v16;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "CarPlay requesting announce again for notification request %{public}@ on banner presentation", (uint8_t *)&v20, 0xCu);

    }
    -[SBNotificationCarPlayDestination _notificationRequestCurrentlyAnnouncing](self, "_notificationRequestCurrentlyAnnouncing");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (void *)v17;
    else
      v19 = v9;
    -[SBNotificationCarPlayDestination _setNotificationRequestCurrentlyAnnouncing:](self, "_setNotificationRequestCurrentlyAnnouncing:", v19);

    -[SBNotificationCarPlayDestination _requestAnnounceForNotificationRequest:](self, "_requestAnnounceForNotificationRequest:", v9);
  }

}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  v17 = v6;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v17;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  -[SBNotificationCarPlayDestination _removePresentable:](self, "_removePresentable:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "notificationRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D0D390]) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D0D398]) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DC60E8]) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DC60F0]))
  {
    -[SBNotificationCarPlayDestination _ignoreActionForNotificationRequest:](self, "_ignoreActionForNotificationRequest:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      (*(void (**)(uint64_t))(v13 + 16))(v13);

  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SBBannerRevocationReasonCarPlayDestinationUserAction")) & 1) == 0)
    -[SBNotificationCarPlayDestination _cancelAnnounceForNotificationRequest:withReason:deactivateAnnounce:](self, "_cancelAnnounceForNotificationRequest:withReason:deactivateAnnounce:", v12, -[SBNotificationCarPlayDestination _announceDeactivationReasonForBannerRevocationReason:](self, "_announceDeactivationReasonForBannerRevocationReason:", v7), 1);
  objc_msgSend(v17, "viewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dismissViewControllerAnimated:completion:", 1, 0);

  -[SBNotificationCarPlayDestination _setSuspended:forPresentingAlertControllerForPresentable:](self, "_setSuspended:forPresentingAlertControllerForPresentable:", 0, v17);
  -[SBNotificationCarPlayDestination delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "destination:didDismissNotificationRequest:", self, v12);

}

- (BOOL)presentableViewControllerClosesByDefault:(id)a3
{
  void *v4;

  objc_msgSend(a3, "notificationRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SBNotificationCarPlayDestination _effectiveDefaultActionTypeForNotificationRequest:](self, "_effectiveDefaultActionTypeForNotificationRequest:", v4) == 1;

  return (char)self;
}

- (void)didSelectBannerOfPresentableViewController:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  void (**v15)(_QWORD);
  void *v16;
  SBNotificationCarPlayDestination *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45[2];
  id location[2];

  v4 = a3;
  objc_msgSend(v4, "notificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBNotificationCarPlayDestination _notificationRequestShouldShowModalSubActions:](self, "_notificationRequestShouldShowModalSubActions:", v5))
  {
    v31 = v4;
    -[SBNotificationCarPlayDestination _setSuspended:forPresentingAlertControllerForPresentable:](self, "_setSuspended:forPresentingAlertControllerForPresentable:", 1, v4);
    -[SBNotificationCarPlayDestination _subActionLabelsForNotificationRequest:](self, "_subActionLabelsForNotificationRequest:", v5);
    v6 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CEA2E8];
    objc_msgSend(v5, "carPlayTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v5;
    objc_msgSend(v5, "carPlayMessage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v6, "count");
    -[SBNotificationCarPlayDestination _carPlayBannerSource](self, "_carPlayBannerSource");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v29 = v10;
    if (v10)
    {
      v11 = 0;
      v12 = (char *)(v29 - 1);
      v13 = (char *)(v29 - 1);
      do
      {
        if (v29 <= 2)
          v14 = v13;
        else
          v14 = v11;
        v15 = v6;
        objc_msgSend(v6, "objectAtIndex:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = self;
        objc_initWeak(location, self);
        v18 = (void *)MEMORY[0x1E0CEA2E0];
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __79__SBNotificationCarPlayDestination_didSelectBannerOfPresentableViewController___block_invoke;
        v41[3] = &unk_1E8EBBA08;
        objc_copyWeak(v45, location);
        v42 = v30;
        v45[1] = v14;
        v43 = v32;
        v44 = v31;
        objc_msgSend(v18, "actionWithTitle:style:handler:", v16, v14 == v12, v41);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addAction:", v19);
        if (v14 == v12)
          objc_msgSend(v33, "setPreferredAction:", v19);

        objc_destroyWeak(v45);
        objc_destroyWeak(location);

        ++v11;
        --v13;
        v6 = v15;
        self = v17;
      }
      while (v13 != (char *)-1);
    }
    v4 = v31;
    objc_msgSend(v31, "parentViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v21 = MEMORY[0x1E0C809B0];
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __79__SBNotificationCarPlayDestination_didSelectBannerOfPresentableViewController___block_invoke_72;
      v38[3] = &unk_1E8E9E820;
      v39 = v32;
      v40 = v31;
      v35[0] = v21;
      v35[1] = 3221225472;
      v35[2] = __79__SBNotificationCarPlayDestination_didSelectBannerOfPresentableViewController___block_invoke_2;
      v35[3] = &unk_1E8E9E820;
      v36 = v40;
      v37 = v33;
      objc_msgSend(v20, "performCoordinatedUpdate:updateResponseHandler:", v38, v35);

    }
    v5 = v30;
  }
  else
  {
    objc_msgSend(v4, "notificationRequest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBNotificationCarPlayDestination _actionForNotificationRequest:](self, "_actionForNotificationRequest:", v22);
    v6 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

    if (v6)
      v6[2](v6);
    v23 = (void *)MEMORY[0x1E0D01070];
    objc_msgSend(MEMORY[0x1E0DC6140], "requesterIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bannerSourceForDestination:forRequesterIdentifier:", 1, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "requestIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v25;
    v34 = 0;
    objc_msgSend(v25, "revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:", v26, CFSTR("SBBannerRevocationReasonCarPlayDestinationUserAction"), 1, 0, &v34);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v34;

    if (!v27)
    {
      v28 = (void *)*MEMORY[0x1E0DC5F70];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
        -[SBNotificationCarPlayDestination didSelectBannerOfPresentableViewController:].cold.1(v28, v4, (uint64_t)v32);
    }
  }

}

void __79__SBNotificationCarPlayDestination_didSelectBannerOfPresentableViewController___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void (**v4)(_QWORD);
  void **v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_subActionsForNotificationRequest:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 64));
  v4 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

  if (v4)
    v4[2](v4);
  v6 = *(void **)(a1 + 48);
  v5 = (void **)(a1 + 48);
  v7 = *(v5 - 1);
  objc_msgSend(v6, "requestIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v7, "revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:", v8, CFSTR("SBBannerRevocationReasonCarPlayDestinationUserAction"), 1, 0, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v12;

  if (!v9)
  {
    v11 = (void *)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
      __79__SBNotificationCarPlayDestination_didSelectBannerOfPresentableViewController___block_invoke_cold_1(v5, v11);
  }
  objc_msgSend(WeakRetained, "_setSuspended:forPresentingAlertControllerForPresentable:", 0, *v5);

}

void __79__SBNotificationCarPlayDestination_didSelectBannerOfPresentableViewController___block_invoke_72(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "layoutDescriptionWithError:", 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setFillsContainer:", 1);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

  v3 = *(void **)(a1 + 40);
  objc_msgSend(v10, "presentationSize");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v10, "containerSize");
  objc_msgSend(v3, "preferredContentSizeWithPresentationSize:containerSize:", v5, v7, v8, v9);

}

void __79__SBNotificationCarPlayDestination_didSelectBannerOfPresentableViewController___block_invoke_2(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __79__SBNotificationCarPlayDestination_didSelectBannerOfPresentableViewController___block_invoke_3;
  v2[3] = &unk_1E8E9E820;
  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __79__SBNotificationCarPlayDestination_didSelectBannerOfPresentableViewController___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)didCancelBannerOfPresentableViewController:(id)a3 reason:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0D01070];
  v7 = (void *)MEMORY[0x1E0DC6140];
  v8 = a4;
  objc_msgSend(v7, "requesterIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bannerSourceForDestination:forRequesterIdentifier:", 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "requestIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v10, "revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:", v11, v8, 1, 0, &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v15;
  if (!v12)
  {
    v14 = (void *)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
      -[SBNotificationCarPlayDestination didCancelBannerOfPresentableViewController:reason:].cold.1(v14, v5);
  }

}

- (NCCarPlayBannerSource)_carPlayBannerSource
{
  NCCarPlayBannerSource *carPlayBannerSource;
  NCCarPlayBannerSource *v4;
  NCCarPlayBannerSource *v5;

  carPlayBannerSource = self->_carPlayBannerSource;
  if (!carPlayBannerSource)
  {
    v4 = (NCCarPlayBannerSource *)objc_alloc_init(MEMORY[0x1E0DC6148]);
    v5 = self->_carPlayBannerSource;
    self->_carPlayBannerSource = v4;

    carPlayBannerSource = self->_carPlayBannerSource;
  }
  return carPlayBannerSource;
}

- (id)_newPresentableForNotificationRequest:(id)a3 layoutDescription:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v6 = (objc_class *)MEMORY[0x1E0DC6140];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithNotificationRequest:", v8);

  -[SBNotificationCarPlayDestination _addPresentable:](self, "_addPresentable:", v9);
  objc_msgSend(v9, "setDelegate:", self);
  objc_msgSend(v9, "addPresentableObserver:", self);
  objc_msgSend(v7, "presentationSize");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v7, "containerSize");
  v15 = v14;
  v17 = v16;

  objc_msgSend(v9, "preferredContentSizeWithPresentationSize:containerSize:", v11, v13, v15, v17);
  objc_msgSend(v9, "setPreferredContentSize:");
  return v9;
}

- (void)_addPresentable:(id)a3
{
  id v4;
  SBNotificationCarPlayDestination *v5;
  NSHashTable *presentables;
  uint64_t v7;
  NSHashTable *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = self;
    objc_sync_enter(v5);
    presentables = v5->_presentables;
    if (!presentables)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v5->_presentables;
      v5->_presentables = (NSHashTable *)v7;

      presentables = v5->_presentables;
    }
    -[NSHashTable addObject:](presentables, "addObject:", v9);
    objc_sync_exit(v5);

    v4 = v9;
  }

}

- (id)_presentablesWithRequestIdentifier:(id)a3
{
  id v4;
  SBNotificationCarPlayDestination *v5;
  id v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5->_presentables;
    v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v11, "requestIdentifier", (_QWORD)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v4);

          if (v13)
            objc_msgSend(v6, "addObject:", v11);
        }
        v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    v14 = v6;
    if (!objc_msgSend(v14, "count") && os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
      -[SBNotificationCarPlayDestination _presentablesWithRequestIdentifier:].cold.1();

    objc_sync_exit(v5);
  }
  else
  {
    v14 = 0;
  }
  if (v14)
    v15 = v14;
  else
    v15 = (void *)MEMORY[0x1E0C9AA60];
  v16 = v15;

  return v16;
}

- (id)_removePresentable:(id)a3
{
  id v4;
  SBNotificationCarPlayDestination *v5;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    if (-[NSHashTable containsObject:](v5->_presentables, "containsObject:", v4))
    {
      -[NSHashTable removeObject:](v5->_presentables, "removeObject:", v4);
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
    {
      -[SBNotificationCarPlayDestination _removePresentable:].cold.1();
    }
    objc_sync_exit(v5);

  }
  return v4;
}

- (id)_appPolicyEvaluator
{
  CRCarPlayAppPolicyEvaluator *appPolicyEvaluator;
  CRCarPlayAppPolicyEvaluator *v4;
  CRCarPlayAppPolicyEvaluator *v5;

  appPolicyEvaluator = self->_appPolicyEvaluator;
  if (!appPolicyEvaluator)
  {
    v4 = (CRCarPlayAppPolicyEvaluator *)objc_alloc_init(MEMORY[0x1E0D0D358]);
    v5 = self->_appPolicyEvaluator;
    self->_appPolicyEvaluator = v4;

    -[CRCarPlayAppPolicyEvaluator setGeoSupported:](self->_appPolicyEvaluator, "setGeoSupported:", 1);
    appPolicyEvaluator = self->_appPolicyEvaluator;
  }
  return appPolicyEvaluator;
}

- (id)_policyForApp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBNotificationCarPlayDestination _policyForApp:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("SBNotificationCarPlayDestination.m"), 404, CFSTR("this call must be made on the main thread"));

  }
  objc_msgSend(v4, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "carPlayDeclaration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_appPolicyForBundleID, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      -[SBNotificationCarPlayDestination _appPolicyEvaluator](self, "_appPolicyEvaluator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "effectivePolicyForAppDeclaration:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        -[NSMutableDictionary setObject:forKey:](self->_appPolicyForBundleID, "setObject:forKey:", v8, v7);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)_defaultActionTypeForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  int64_t v13;
  void *v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(v4, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationWithBundleIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBNotificationCarPlayDestination _policyForApp:](self, "_policyForApp:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "bannerLaunchTypeForNotificationContentType:", v10) == 1
    || (objc_msgSend(v4, "options"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "lauchUsingSiriForCarPlayDefaultAction"),
        v11,
        (v12 & 1) != 0))
  {
    v13 = 2;
  }
  else
  {
    v13 = 0;
    if ((objc_msgSend(v8, "canDisplayOnCarScreen") & 1) == 0)
    {
      -[SBNotificationCarPlayDestination _supplementaryActionsForNotificationRequest:](self, "_supplementaryActionsForNotificationRequest:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (!v15)
        v13 = 1;
    }
  }

  return v13;
}

- (int64_t)_effectiveDefaultActionTypeForNotificationRequest:(id)a3
{
  int64_t v4;

  v4 = -[SBNotificationCarPlayDestination _defaultActionTypeForNotificationRequest:](self, "_defaultActionTypeForNotificationRequest:", a3);
  if (-[SBNotificationCarPlayDestination _inCallOrFaceTime](self, "_inCallOrFaceTime") && v4 == 2)
    return 1;
  else
    return v4;
}

- (id)_actionForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  -[SBNotificationCarPlayDestination delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__SBNotificationCarPlayDestination__actionForNotificationRequest___block_invoke;
  v11[3] = &unk_1E8EA8CF8;
  v11[4] = self;
  v12 = v4;
  v13 = v5;
  v6 = v5;
  v7 = v4;
  v8 = (void *)MEMORY[0x1D17E5550](v11);
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

uint64_t __66__SBNotificationCarPlayDestination__actionForNotificationRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_effectiveDefaultActionTypeForNotificationRequest:", *(_QWORD *)(a1 + 40));
  switch(v2)
  {
    case 0:
      v8 = *(void **)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "defaultAction");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      v11 = MEMORY[0x1E0C9AA70];
      v12 = v8;
      v13 = v9;
      v14 = v4;
      v15 = 1;
LABEL_7:
      objc_msgSend(v12, "destination:executeAction:forNotificationRequest:requestAuthentication:withParameters:completion:", v13, v14, v10, v15, v11, 0);
      goto LABEL_8;
    case 1:
      v16 = *(void **)(a1 + 48);
      v17 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "closeAction");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      v11 = MEMORY[0x1E0C9AA70];
      v12 = v16;
      v13 = v17;
      v14 = v4;
      v15 = 0;
      goto LABEL_7;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "alertingController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "killAlertsForNotificationRequest:", *(_QWORD *)(a1 + 40));

      v4 = (void *)objc_opt_new();
      v5 = objc_alloc(MEMORY[0x1E0D97820]);
      objc_msgSend(*(id *)(a1 + 32), "_bulletinForNotificationRequest:", *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "initWithBBBulletin:", v6);
      objc_msgSend(v4, "activateWithContext:", v7);

LABEL_8:
      break;
  }
  return 1;
}

- (id)_ignoreActionForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  SBNotificationCarPlayDestination *v12;
  id v13;

  v4 = a3;
  -[SBNotificationCarPlayDestination delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__SBNotificationCarPlayDestination__ignoreActionForNotificationRequest___block_invoke;
  v10[3] = &unk_1E8EA8CF8;
  v11 = v5;
  v12 = self;
  v13 = v4;
  v6 = v4;
  v7 = v5;
  v8 = (void *)objc_msgSend(v10, "copy");

  return v8;
}

uint64_t __72__SBNotificationCarPlayDestination__ignoreActionForNotificationRequest___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "silenceAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "destination:executeAction:forNotificationRequest:requestAuthentication:withParameters:completion:", v3, v4, *(_QWORD *)(a1 + 48), 0, MEMORY[0x1E0C9AA70], 0);

  return 1;
}

- (id)_supplementaryActionsForNotificationRequest:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "supplementaryActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DC5F58]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_closeNotificationActionForNotificationRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hideCloseActionForCarPlay") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "closeAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_allNotificationActionsForNotificationRequest:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[SBNotificationCarPlayDestination _supplementaryActionsForNotificationRequest:](self, "_supplementaryActionsForNotificationRequest:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);
  -[SBNotificationCarPlayDestination _closeNotificationActionForNotificationRequest:](self, "_closeNotificationActionForNotificationRequest:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bs_safeAddObject:", v8);
  return v6;
}

- (BOOL)_notificationRequestSupportsSubActions:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if (-[SBNotificationCarPlayDestination _defaultActionTypeForNotificationRequest:](self, "_defaultActionTypeForNotificationRequest:", v4) == 2)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "options");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "allowActionsForCarPlay");

  }
  return v5;
}

- (BOOL)_notificationRequestShouldShowModalSubActions:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (-[SBNotificationCarPlayDestination _notificationRequestSupportsSubActions:](self, "_notificationRequestSupportsSubActions:", v4))
  {
    -[SBNotificationCarPlayDestination _supplementaryActionsForNotificationRequest:](self, "_supplementaryActionsForNotificationRequest:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_subActionLabelsForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SBNotificationCarPlayDestination _notificationRequestSupportsSubActions:](self, "_notificationRequestSupportsSubActions:", v4))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBNotificationCarPlayDestination _supplementaryActionsForNotificationRequest:](self, "_supplementaryActionsForNotificationRequest:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "title");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "length"))
            objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }
    -[SBNotificationCarPlayDestination _closeNotificationActionForNotificationRequest:](self, "_closeNotificationActionForNotificationRequest:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("BANNER_ALERT_CLOSE"), &stru_1E8EC7EC0, CFSTR("CarDisplay"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v14);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_subActionsForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  if (-[SBNotificationCarPlayDestination _notificationRequestSupportsSubActions:](self, "_notificationRequestSupportsSubActions:", v4))
  {
    objc_initWeak(&location, self);
    -[SBNotificationCarPlayDestination _allNotificationActionsForNotificationRequest:](self, "_allNotificationActionsForNotificationRequest:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__SBNotificationCarPlayDestination__subActionsForNotificationRequest___block_invoke;
    v8[3] = &unk_1E8EBBA58;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    objc_msgSend(v5, "bs_map:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __70__SBNotificationCarPlayDestination__subActionsForNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__SBNotificationCarPlayDestination__subActionsForNotificationRequest___block_invoke_2;
  v7[3] = &unk_1E8EBBA30;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v4 = v3;
  v8 = v4;
  v9 = *(id *)(a1 + 32);
  v5 = (void *)objc_msgSend(v7, "copy");

  objc_destroyWeak(&v10);
  return v5;
}

uint64_t __70__SBNotificationCarPlayDestination__subActionsForNotificationRequest___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destination:executeAction:forNotificationRequest:requestAuthentication:withParameters:completion:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1, MEMORY[0x1E0C9AA70], 0);

  return 1;
}

- (BOOL)_inCallOrFaceTime
{
  void *v2;
  char v3;
  void *v4;

  +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "inCall") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    +[SBConferenceManager sharedInstance](SBConferenceManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "inFaceTime");

  }
  return v3;
}

- (void)_callOrFaceTimeStateChanged
{
  NSHashTable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_presentables;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "invalidateDisplayProperties", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)_bulletinForNotificationRequest:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "bulletin");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D036A8]);
    objc_msgSend(v3, "sectionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSectionID:", v5);

    objc_msgSend(v3, "carPlayTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v6);

    objc_msgSend(v3, "carPlayMessage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMessage:", v7);

  }
  return v4;
}

- (BOOL)_setSuspended:(BOOL)a3 forPresentingAlertControllerForPresentable:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  BNPresentable **p_presentablePresentingAlertController;
  id WeakRetained;
  void *v13;
  void *v14;
  NSObject *v15;
  id v17;

  v4 = a3;
  v6 = a4;
  -[SBNotificationCarPlayDestination _carPlayBannerSource](self, "_carPlayBannerSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0DC6100];
  v17 = 0;
  v9 = objc_msgSend(v7, "setSuspended:forReason:revokingCurrent:error:", v4, v8, 0, &v17);
  v10 = v17;

  if (v9)
  {
    p_presentablePresentingAlertController = &self->_presentablePresentingAlertController;
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentablePresentingAlertController);
    v13 = WeakRetained;
    v14 = v6;
    if (!v4)
    {
      if (WeakRetained != v6)
      {
LABEL_6:

        goto LABEL_9;
      }
      v14 = 0;
    }
    objc_storeWeak((id *)p_presentablePresentingAlertController, v14);
    goto LABEL_6;
  }
  v15 = *MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
    -[SBNotificationCarPlayDestination _setSuspended:forPresentingAlertControllerForPresentable:].cold.1(v4, (uint64_t)v10, v15);
LABEL_9:

  return v9;
}

- (void)notificationAnnouncementObserver:(id)a3 announcementSpeakingStateDidUpdate:(int64_t)a4 forNotificationRequestIdentifiers:(id)a5
{
  id v7;
  NSObject *v8;
  os_log_t *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  os_log_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  void *v38;
  os_log_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  os_log_t v56;
  NSObject *v57;
  void *v58;
  void *v59;
  NSMutableArray *notificationRequestsForAnnounce;
  NSMutableDictionary *announceRequestsForNotificationRequests;
  NSObject *loga;
  os_log_t log;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint8_t v73[128];
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  NSObject *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(v7, "bs_compactMap:", &__block_literal_global_323);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (os_log_t *)MEMORY[0x1E0DC5F70];
  v10 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    AFSiriUserNotificationAnnouncementSpeakingStateGetName();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v75 = v12;
    v76 = 2114;
    v77 = v8;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "CarPlay received updated announce state:%{public}@ for requests %{public}@", buf, 0x16u);

  }
  if (a4 == 2)
  {
    -[SBNotificationCarPlayDestination _notificationRequestCurrentlyAnnouncing](self, "_notificationRequestCurrentlyAnnouncing");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBNotificationCarPlayDestination _carPlayBannerSource](self, "_carPlayBannerSource");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "didFinishAnnounceForNotificationRequest:", v14);

    if ((unint64_t)-[NSMutableArray count](self->_notificationRequestsForAnnounce, "count") < 2)
    {
      -[SBNotificationCarPlayDestination _announcementStateObserver](self, "_announcementStateObserver");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "stopObservingNotificationWithRequestIdentifier:", v55);

      v56 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        v57 = v56;
        objc_msgSend(v14, "notificationIdentifier");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "un_logDigest");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v75 = v59;
        _os_log_impl(&dword_1D0540000, v57, OS_LOG_TYPE_DEFAULT, "Carplay setting up deferred announce deactivation for %{public}@ on announce finish since this is the last notification to be announced", buf, 0xCu);

      }
      objc_storeStrong((id *)&self->_notificationRequestPendingDeactivation, v14);
    }
    else
    {
      log = v8;
      if (v14)
      {
        -[NSMutableArray removeObject:](self->_notificationRequestsForAnnounce, "removeObject:", v14);
        -[NSMutableDictionary removeObjectForKey:](self->_announceRequestsForNotificationRequests, "removeObjectForKey:", v14);
      }
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v31 = v7;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v69;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v69 != v34)
              objc_enumerationMutation(v31);
            v36 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i);
            -[SBNotificationCarPlayDestination _announcementStateObserver](self, "_announcementStateObserver");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "stopObservingNotificationWithRequestIdentifier:", v36);

            -[SBNotificationCarPlayDestination _notificationRequestForAnnounceWithIdentifier:](self, "_notificationRequestForAnnounceWithIdentifier:", v36);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (v38)
            {
              -[NSMutableArray removeObject:](self->_notificationRequestsForAnnounce, "removeObject:", v38);
              -[NSMutableDictionary removeObjectForKey:](self->_announceRequestsForNotificationRequests, "removeObjectForKey:", v38);
            }

          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
        }
        while (v33);
      }

      if (-[NSMutableArray count](self->_notificationRequestsForAnnounce, "count"))
      {
        v39 = *v9;
        v8 = log;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          v40 = v39;
          -[SBNotificationCarPlayDestination _notificationRequestCurrentlyAnnouncing](self, "_notificationRequestCurrentlyAnnouncing");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "notificationIdentifier");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "un_logDigest");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v75 = v43;
          _os_log_impl(&dword_1D0540000, v40, OS_LOG_TYPE_DEFAULT, "Carplay withdrawing notification request %{public}@ on announce finish while pending other announce notifications", buf, 0xCu);

        }
        -[SBNotificationCarPlayDestination _notificationRequestCurrentlyAnnouncing](self, "_notificationRequestCurrentlyAnnouncing");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBNotificationCarPlayDestination withdrawNotificationRequest:](self, "withdrawNotificationRequest:", v44);

        -[SBNotificationCarPlayDestination _setNotificationRequestCurrentlyAnnouncing:](self, "_setNotificationRequestCurrentlyAnnouncing:", 0);
        -[SBNotificationCarPlayDestination _startAnnounceTimeoutTimer](self, "_startAnnounceTimeoutTimer");
      }
      else
      {
        -[SBNotificationCarPlayDestination _setNotificationRequestCurrentlyAnnouncing:](self, "_setNotificationRequestCurrentlyAnnouncing:", 0);
        notificationRequestsForAnnounce = self->_notificationRequestsForAnnounce;
        self->_notificationRequestsForAnnounce = 0;

        announceRequestsForNotificationRequests = self->_announceRequestsForNotificationRequests;
        self->_announceRequestsForNotificationRequests = 0;

        -[SBNotificationCarPlayDestination _flushNotificationRequestsPendingAnnounce](self, "_flushNotificationRequestsPendingAnnounce");
        v8 = log;
      }
    }
  }
  else
  {
    if (a4 == 1)
    {
      -[SBNotificationCarPlayDestination _invalidateAnnounceTimeoutTimer](self, "_invalidateAnnounceTimeoutTimer");
      objc_msgSend(v7, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBNotificationCarPlayDestination _notificationRequestForAnnounceWithIdentifier:](self, "_notificationRequestForAnnounceWithIdentifier:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBNotificationCarPlayDestination _notificationRequestCurrentlyAnnouncing](self, "_notificationRequestCurrentlyAnnouncing");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)v15;
        -[SBNotificationCarPlayDestination _notificationRequestCurrentlyAnnouncing](self, "_notificationRequestCurrentlyAnnouncing");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v14, "matchesRequest:", v17);

        if ((v18 & 1) != 0)
          goto LABEL_14;
      }
      -[SBNotificationCarPlayDestination _notificationRequestCurrentlyAnnouncing](self, "_notificationRequestCurrentlyAnnouncing");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "matchesRequest:", v19) & 1) == 0)
      {
        -[SBNotificationCarPlayDestination _notificationRequestCurrentlyAnnouncing](self, "_notificationRequestCurrentlyAnnouncing");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
LABEL_13:
          -[SBNotificationCarPlayDestination _setNotificationRequestCurrentlyAnnouncing:](self, "_setNotificationRequestCurrentlyAnnouncing:", v14);
          -[SBNotificationCarPlayDestination _notificationRequestCurrentlyAnnouncing](self, "_notificationRequestCurrentlyAnnouncing");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBNotificationCarPlayDestination _postNotificationRequest:shouldAnnounce:](self, "_postNotificationRequest:shouldAnnounce:", v27, 0);

LABEL_14:
          -[SBNotificationCarPlayDestination _carPlayBannerSource](self, "_carPlayBannerSource");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBNotificationCarPlayDestination _notificationRequestCurrentlyAnnouncing](self, "_notificationRequestCurrentlyAnnouncing");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "didBeginAnnounceForNotificationRequest:", v29);

          goto LABEL_47;
        }
        v21 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          loga = v21;
          -[SBNotificationCarPlayDestination _notificationRequestCurrentlyAnnouncing](self, "_notificationRequestCurrentlyAnnouncing");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "notificationIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "un_logDigest");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "notificationIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "un_logDigest");
          v26 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v75 = v24;
          v76 = 2114;
          v77 = v26;
          _os_log_impl(&dword_1D0540000, loga, OS_LOG_TYPE_DEFAULT, "Carplay withdrawing currently announcing notification request %{public}@ as it is starting announce for request %{public}@", buf, 0x16u);

        }
        -[SBNotificationCarPlayDestination _notificationRequestCurrentlyAnnouncing](self, "_notificationRequestCurrentlyAnnouncing");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBNotificationCarPlayDestination withdrawNotificationRequest:](self, "withdrawNotificationRequest:", v19);
      }

      goto LABEL_13;
    }
    -[SBNotificationCarPlayDestination _notificationRequestCurrentlyAnnouncing](self, "_notificationRequestCurrentlyAnnouncing");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[SBNotificationCarPlayDestination _carPlayBannerSource](self, "_carPlayBannerSource");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "didFinishAnnounceForNotificationRequest:", v14);

    }
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v46 = v7;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v65;
      do
      {
        for (j = 0; j != v48; ++j)
        {
          if (*(_QWORD *)v65 != v49)
            objc_enumerationMutation(v46);
          v51 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * j);
          -[SBNotificationCarPlayDestination _announcementStateObserver](self, "_announcementStateObserver");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "stopObservingNotificationWithRequestIdentifier:", v51);

          -[SBNotificationCarPlayDestination _notificationRequestForAnnounceWithIdentifier:](self, "_notificationRequestForAnnounceWithIdentifier:", v51);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          if (v53)
          {
            -[NSMutableArray removeObject:](self->_notificationRequestsForAnnounce, "removeObject:", v53);
            -[NSMutableDictionary removeObjectForKey:](self->_announceRequestsForNotificationRequests, "removeObjectForKey:", v53);
          }

        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
      }
      while (v48);
    }

    -[SBNotificationCarPlayDestination _invalidateAnnounceTimeoutTimer](self, "_invalidateAnnounceTimeoutTimer");
    -[SBNotificationCarPlayDestination _setNotificationRequestCurrentlyAnnouncing:](self, "_setNotificationRequestCurrentlyAnnouncing:", 0);
    -[SBNotificationCarPlayDestination _flushAnnounceNotificationRequestsShouldAnnounce:](self, "_flushAnnounceNotificationRequestsShouldAnnounce:", 0);
    -[SBNotificationCarPlayDestination _flushNotificationRequestsPendingAnnounce](self, "_flushNotificationRequestsPendingAnnounce");
  }
LABEL_47:

}

uint64_t __138__SBNotificationCarPlayDestination_notificationAnnouncementObserver_announcementSpeakingStateDidUpdate_forNotificationRequestIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "un_logDigest");
}

- (BOOL)_isCurrentlyAnnouncing
{
  return -[NSMutableArray count](self->_notificationRequestsForAnnounce, "count") != 0;
}

- (BOOL)_shouldAnnounceNotificationRequest:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v3, "options");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldAnnounceForCarPlay");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldDeferPostingNotificationRequestForAnnounce:(id)a3
{
  id v4;
  _BOOL4 v5;

  v4 = a3;
  if (-[SBNotificationCarPlayDestination _isCurrentlyAnnouncing](self, "_isCurrentlyAnnouncing"))
    v5 = !-[SBNotificationCarPlayDestination _shouldAnnounceNotificationRequest:](self, "_shouldAnnounceNotificationRequest:", v4);
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (id)_announcementStateObserver
{
  AFUserNotificationAnnouncementSpeakingStateObserver *announcementStateObserver;
  id v4;
  AFUserNotificationAnnouncementSpeakingStateObserver *v5;
  AFUserNotificationAnnouncementSpeakingStateObserver *v6;

  announcementStateObserver = self->_announcementStateObserver;
  if (!announcementStateObserver)
  {
    v4 = objc_alloc(MEMORY[0x1E0CFEA80]);
    v5 = (AFUserNotificationAnnouncementSpeakingStateObserver *)objc_msgSend(v4, "initWithQueue:delegate:", MEMORY[0x1E0C80D38], self);
    v6 = self->_announcementStateObserver;
    self->_announcementStateObserver = v5;

    announcementStateObserver = self->_announcementStateObserver;
  }
  return announcementStateObserver;
}

- (void)_requestAnnounceForNotificationRequest:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *notificationRequestsForAnnounce;
  NSMutableArray *v13;
  NSMutableArray *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  NSMutableDictionary *announceRequestsForNotificationRequests;
  NSMutableDictionary *v24;
  NSMutableDictionary *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  void *v31;
  os_log_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  _BOOL4 v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  SBNotificationCarPlayDestination *v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0DC5F70];
  v6 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v4, "notificationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "un_logDigest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v47 = v9;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "CarPlay requesting announce for notification request %{public}@", buf, 0xCu);

  }
  if (-[SBNotificationCarPlayDestination _isCurrentlyAnnouncing](self, "_isCurrentlyAnnouncing")
    || -[SBNotificationCarPlayDestination _shouldAnnounceNotificationForActiveAVSession:](self, "_shouldAnnounceNotificationForActiveAVSession:", v4))
  {
    objc_msgSend(v4, "notificationIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBNotificationCarPlayDestination _announcementStateObserver](self, "_announcementStateObserver");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startObservingNotificationWithRequestIdentifier:", v10);

    notificationRequestsForAnnounce = self->_notificationRequestsForAnnounce;
    if (!notificationRequestsForAnnounce)
    {
      v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v14 = self->_notificationRequestsForAnnounce;
      self->_notificationRequestsForAnnounce = v13;

      notificationRequestsForAnnounce = self->_notificationRequestsForAnnounce;
    }
    -[NSMutableArray addObject:](notificationRequestsForAnnounce, "addObject:", v4);
    objc_msgSend(v4, "userNotification");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBNotificationCarPlayDestination _bulletinForNotificationRequest:](self, "_bulletinForNotificationRequest:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "summary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "length"))
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFEA10]), "initWithSummary:summaryType:error:", v17, 2, 0);
      v19 = 0;
    }
    else
    {
      v18 = 0;
      v19 = 1;
    }
    v20 = objc_alloc(MEMORY[0x1E0CFEA08]);
    objc_msgSend(v4, "sectionIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithUserNotification:sourceAppId:platform:summaryDecision:summary:", v38, v21, 2, v19, v18);

    announceRequestsForNotificationRequests = self->_announceRequestsForNotificationRequests;
    if (!announceRequestsForNotificationRequests)
    {
      v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v25 = self->_announceRequestsForNotificationRequests;
      self->_announceRequestsForNotificationRequests = v24;

      announceRequestsForNotificationRequests = self->_announceRequestsForNotificationRequests;
    }
    -[NSMutableDictionary setObject:forKey:](announceRequestsForNotificationRequests, "setObject:forKey:", v22, v4);
    -[SBNotificationCarPlayDestination _notificationRequestCurrentlyAnnouncing](self, "_notificationRequestCurrentlyAnnouncing");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v26)
      v28 = (id)v26;
    else
      v28 = v4;
    -[SBNotificationCarPlayDestination _setNotificationRequestCurrentlyAnnouncing:](self, "_setNotificationRequestCurrentlyAnnouncing:", v28);

    objc_initWeak((id *)buf, self);
    v29 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __75__SBNotificationCarPlayDestination__requestAnnounceForNotificationRequest___block_invoke;
    v41[3] = &unk_1E8EA3CB0;
    v30 = v10;
    v42 = v30;
    objc_copyWeak(&v45, (id *)buf);
    v43 = v4;
    v44 = self;
    objc_msgSend(v22, "performRequestWithCompletion:", v41);
    if (objc_msgSend(v17, "length"))
    {
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFEA10]), "initWithSummary:summaryType:error:", v17, 2, 0);
      v39[0] = v29;
      v39[1] = 3221225472;
      v39[2] = __75__SBNotificationCarPlayDestination__requestAnnounceForNotificationRequest___block_invoke_116;
      v39[3] = &unk_1E8E9E980;
      v40 = v15;
      objc_msgSend(v22, "deliverSummary:completion:", v31, v39);

    }
    objc_destroyWeak(&v45);

    objc_destroyWeak((id *)buf);
  }
  else
  {
    v32 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v33 = v32;
      objc_msgSend(v4, "notificationIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "un_logDigest");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v35;
      _os_log_impl(&dword_1D0540000, v33, OS_LOG_TYPE_DEFAULT, "CarPlay request to announce notification request %{public}@ dropped due to current AV session", buf, 0xCu);

    }
    -[SBNotificationCarPlayDestination _notificationRequestCurrentlyAnnouncing](self, "_notificationRequestCurrentlyAnnouncing");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    v37 = v36 == v4;

    if (v37)
      -[SBNotificationCarPlayDestination _setNotificationRequestCurrentlyAnnouncing:](self, "_setNotificationRequestCurrentlyAnnouncing:", 0);
  }

}

void __75__SBNotificationCarPlayDestination__requestAnnounceForNotificationRequest___block_invoke(uint64_t a1, char a2)
{
  id v4;
  uint64_t v5;
  _QWORD block[4];
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  char v11;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__SBNotificationCarPlayDestination__requestAnnounceForNotificationRequest___block_invoke_2;
  block[3] = &unk_1E8EBBAA0;
  v7 = *(id *)(a1 + 32);
  v11 = a2;
  objc_copyWeak(&v10, (id *)(a1 + 56));
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v8 = v4;
  v9 = v5;
  dispatch_sync(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v10);
}

void __75__SBNotificationCarPlayDestination__requestAnnounceForNotificationRequest___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  id *WeakRetained;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "un_logDigest");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("succeeded");
    if (!*(_BYTE *)(a1 + 64))
      v7 = CFSTR("failed");
    v15 = 138543618;
    v16 = v5;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "CarPlay request to announce notification request %{public}@ %@", (uint8_t *)&v15, 0x16u);

  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v9 = WeakRetained;
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 48), "_notificationRequestCurrentlyAnnouncing");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 40);

    if (v10 == v11)
      objc_msgSend(*(id *)(a1 + 48), "_startAnnounceTimeoutTimer");
  }
  else
  {
    objc_msgSend(WeakRetained, "_announcementStateObserver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stopObservingNotificationWithRequestIdentifier:", *(_QWORD *)(a1 + 32));

    objc_msgSend(v9, "_notificationRequestCurrentlyAnnouncing");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 40);

    if (v13 == v14)
      objc_msgSend(v9, "_setNotificationRequestCurrentlyAnnouncing:", 0);
    objc_msgSend(v9[6], "removeObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v9[11], "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    if (objc_msgSend(v9[6], "count"))
      objc_msgSend(v9, "_flushAnnounceNotificationRequestsShouldAnnounce:", 1);
    else
      objc_msgSend(v9, "_flushNotificationRequestsPendingAnnounce");
  }

}

void __75__SBNotificationCarPlayDestination__requestAnnounceForNotificationRequest___block_invoke_116(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void *)*MEMORY[0x1E0DC5F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "publisherMatchID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "un_logDigest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 1024;
    v12 = a2;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Did delivery summary for notification %{public}@: %{BOOL}u", (uint8_t *)&v9, 0x12u);

  }
}

- (int64_t)_announceDeactivationReasonForBannerRevocationReason:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SBBannerRevocationReasonCarPlayDestinationExplicitDismissal")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC60E0]) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D0D390]) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D0D398]) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC60E8]) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC60F0]) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC60F8]))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_cancelAnnounceForNotificationRequest:(id)a3 withReason:(int64_t)a4 deactivateAnnounce:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSMutableArray *notificationRequestsForAnnounce;
  uint64_t v10;
  id v11;
  uint64_t v12;
  os_log_t *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  os_log_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSMutableArray *v29;
  NSMutableDictionary *announceRequestsForNotificationRequests;
  NCNotificationRequest *notificationRequestPendingDeactivation;
  os_log_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSMutableArray *notificationRequestsPendingAVSession;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, int);
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  _BOOL4 v49;
  uint64_t v50;

  v5 = a5;
  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  notificationRequestsForAnnounce = self->_notificationRequestsForAnnounce;
  v10 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __104__SBNotificationCarPlayDestination__cancelAnnounceForNotificationRequest_withReason_deactivateAnnounce___block_invoke;
  v42[3] = &unk_1E8EBBAC8;
  v11 = v8;
  v43 = v11;
  v12 = -[NSMutableArray indexOfObjectPassingTest:](notificationRequestsForAnnounce, "indexOfObjectPassingTest:", v42);
  v13 = (os_log_t *)MEMORY[0x1E0DC5F70];
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = v12;
    v15 = (void *)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      objc_msgSend(v11, "notificationIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "un_logDigest");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      AFSiriDeactivationReasonGetName();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v45 = v18;
      v46 = 2114;
      v47 = v19;
      v48 = 1024;
      v49 = v5;
      _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "CarPlay clearing announce for notification request %{public}@ for reason %{public}@ with deactivation = %{BOOL}d", buf, 0x1Cu);

      v13 = (os_log_t *)MEMORY[0x1E0DC5F70];
    }
    -[NSMutableArray objectAtIndex:](self->_notificationRequestsForAnnounce, "objectAtIndex:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObject:](self->_notificationRequestsForAnnounce, "removeObject:", v20);
    -[SBNotificationCarPlayDestination _notificationRequestCurrentlyAnnouncing](self, "_notificationRequestCurrentlyAnnouncing");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "matchesRequest:", v21);

    if (v22)
      -[SBNotificationCarPlayDestination _setNotificationRequestCurrentlyAnnouncing:](self, "_setNotificationRequestCurrentlyAnnouncing:", 0);
    -[NSMutableDictionary objectForKey:](self->_announceRequestsForNotificationRequests, "objectForKey:", v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](self->_announceRequestsForNotificationRequests, "removeObjectForKey:", v20);
    if (v23 && v5 && AFSiriDeactivationReasonGetIsValidAndSpecified())
    {
      v24 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v24;
        objc_msgSend(v11, "notificationIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "un_logDigest");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        AFSiriDeactivationReasonGetName();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v27;
        v46 = 2114;
        v47 = v28;
        _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_DEFAULT, "CarPlay requesting deactivate announce for notification request %{public}@ for reason %{public}@", buf, 0x16u);

        v13 = (os_log_t *)MEMORY[0x1E0DC5F70];
      }
      v37 = v10;
      v38 = 3221225472;
      v39 = __104__SBNotificationCarPlayDestination__cancelAnnounceForNotificationRequest_withReason_deactivateAnnounce___block_invoke_118;
      v40 = &unk_1E8E9E980;
      v41 = v20;
      objc_msgSend(v23, "deactivateRequestForReason:completion:", a4, &v37);

    }
    if (!-[NSMutableArray count](self->_notificationRequestsForAnnounce, "count", v37, v38, v39, v40))
    {
      v29 = self->_notificationRequestsForAnnounce;
      self->_notificationRequestsForAnnounce = 0;

      announceRequestsForNotificationRequests = self->_announceRequestsForNotificationRequests;
      self->_announceRequestsForNotificationRequests = 0;

    }
    if (-[NCNotificationRequest matchesRequest:](self->_notificationRequestPendingDeactivation, "matchesRequest:", v20))
    {
      notificationRequestPendingDeactivation = self->_notificationRequestPendingDeactivation;
      self->_notificationRequestPendingDeactivation = 0;

    }
  }
  if (-[NSMutableArray containsObject:](self->_notificationRequestsPendingAVSession, "containsObject:", v11))
  {
    v32 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
    {
      v33 = v32;
      objc_msgSend(v11, "notificationIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "un_logDigest");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v35;
      _os_log_impl(&dword_1D0540000, v33, OS_LOG_TYPE_DEFAULT, "CarPlay removing request %{public}@ from announce list pending AV session completion", buf, 0xCu);

    }
    -[NSMutableArray removeObject:](self->_notificationRequestsPendingAVSession, "removeObject:", v11);
    if (!-[NSMutableArray count](self->_notificationRequestsPendingAVSession, "count"))
    {
      notificationRequestsPendingAVSession = self->_notificationRequestsPendingAVSession;
      self->_notificationRequestsPendingAVSession = 0;

    }
  }

}

uint64_t __104__SBNotificationCarPlayDestination__cancelAnnounceForNotificationRequest_withReason_deactivateAnnounce___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "matchesRequest:", a2);
}

void __104__SBNotificationCarPlayDestination__cancelAnnounceForNotificationRequest_withReason_deactivateAnnounce___block_invoke_118(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "notificationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "un_logDigest");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("failed");
    if (a2)
      v10 = CFSTR("succeeded");
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "CarPlay request to deactivate announce for notification %{public}@ %@", (uint8_t *)&v11, 0x16u);

  }
}

- (BOOL)_shouldAnnounceNotificationForActiveAVSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSMutableArray *notificationRequestsPendingAVSession;
  NSMutableArray *v21;
  NSMutableArray *v22;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeForKey:", *MEMORY[0x1E0D482C8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D482E0]);
  if (v7)
  {
    v8 = *MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412290;
      v25 = v6;
      v9 = "CarPlay should announce notification because current AV prompt style is %@";
      v10 = v8;
      v11 = 12;
LABEL_7:
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v24, v11);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "attributeForKey:", *MEMORY[0x1E0D47F30]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    v15 = *MEMORY[0x1E0DC5F70];
    v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        LOWORD(v24) = 0;
        v9 = "CarPlay should not announce notification because AV currently playing longer duration session";
        v10 = v15;
        v11 = 2;
        goto LABEL_7;
      }
    }
    else
    {
      if (v16)
      {
        v17 = v15;
        objc_msgSend(v4, "notificationIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "un_logDigest");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543618;
        v25 = v19;
        v26 = 2112;
        v27 = v6;
        _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "CarPlay deferring announce for notification %{public}@ because current AV prompt style is %@", (uint8_t *)&v24, 0x16u);

      }
      notificationRequestsPendingAVSession = self->_notificationRequestsPendingAVSession;
      if (!notificationRequestsPendingAVSession)
      {
        v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v22 = self->_notificationRequestsPendingAVSession;
        self->_notificationRequestsPendingAVSession = v21;

        notificationRequestsPendingAVSession = self->_notificationRequestsPendingAVSession;
      }
      if ((-[NSMutableArray containsObject:](notificationRequestsPendingAVSession, "containsObject:", v4) & 1) == 0)
        -[NSMutableArray addObject:](self->_notificationRequestsPendingAVSession, "addObject:", v4);
    }
  }

  return v7;
}

- (void)_voicePromptStyleChanged:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSMutableArray *v7;
  NSMutableArray *notificationRequestsPendingAVSession;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D482D8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D482E0])
    && -[NSMutableArray count](self->_notificationRequestsPendingAVSession, "count"))
  {
    v6 = *MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "CarPlay voice prompt changed to %@, requesting announce again for pending notification requests", buf, 0xCu);
    }
    v7 = self->_notificationRequestsPendingAVSession;
    notificationRequestsPendingAVSession = self->_notificationRequestsPendingAVSession;
    self->_notificationRequestsPendingAVSession = 0;

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = v7;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          -[SBNotificationCarPlayDestination _requestAnnounceForNotificationRequest:](self, "_requestAnnounceForNotificationRequest:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), (_QWORD)v14);
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (void)_setNotificationRequestCurrentlyAnnouncing:(id)a3
{
  NCNotificationRequest *v5;
  NCNotificationRequest **p_notificationRequestCurrentlyAnnouncing;
  NCNotificationRequest *notificationRequestCurrentlyAnnouncing;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (NCNotificationRequest *)a3;
  notificationRequestCurrentlyAnnouncing = self->_notificationRequestCurrentlyAnnouncing;
  p_notificationRequestCurrentlyAnnouncing = &self->_notificationRequestCurrentlyAnnouncing;
  if (notificationRequestCurrentlyAnnouncing != v5)
  {
    v8 = (void *)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      -[NCNotificationRequest notificationIdentifier](v5, "notificationIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "un_logDigest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationRequest notificationIdentifier](*p_notificationRequestCurrentlyAnnouncing, "notificationIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "un_logDigest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2114;
      v17 = v13;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "CarPlay setting currently announcing notification request to %{public}@ from %{public}@", (uint8_t *)&v14, 0x16u);

    }
    objc_storeStrong((id *)p_notificationRequestCurrentlyAnnouncing, a3);
  }

}

- (void)_clearNotificationRequestPendingAnnounceDeactivationIfNecessary
{
  NCNotificationRequest *v3;
  NCNotificationRequest *notificationRequestPendingDeactivation;
  void *v5;
  NCNotificationRequest *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_notificationRequestPendingDeactivation)
  {
    -[SBNotificationCarPlayDestination _notificationRequestCurrentlyAnnouncing](self, "_notificationRequestCurrentlyAnnouncing");
    v3 = (NCNotificationRequest *)objc_claimAutoreleasedReturnValue();
    notificationRequestPendingDeactivation = self->_notificationRequestPendingDeactivation;

    if (v3 == notificationRequestPendingDeactivation)
    {
      v5 = (void *)*MEMORY[0x1E0DC5F70];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
      {
        v6 = self->_notificationRequestPendingDeactivation;
        v7 = v5;
        -[NCNotificationRequest notificationIdentifier](v6, "notificationIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "un_logDigest");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543362;
        v11 = v9;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "CarPlay clearing notification request %{public}@ pending announce deactivation and requesting early deactivation", (uint8_t *)&v10, 0xCu);

      }
      -[SBNotificationCarPlayDestination _cancelAnnounceForNotificationRequest:withReason:deactivateAnnounce:](self, "_cancelAnnounceForNotificationRequest:withReason:deactivateAnnounce:", self->_notificationRequestPendingDeactivation, -[SBNotificationCarPlayDestination _announceDeactivationReasonForBannerRevocationReason:](self, "_announceDeactivationReasonForBannerRevocationReason:", CFSTR("SBBannerRevocationReasonCarPlayDestinationExplicitDismissal")), 1);
    }
  }
}

- (id)_notificationRequestForAnnounceWithIdentifier:(id)a3
{
  id v4;
  NSMutableArray *notificationRequestsForAnnounce;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  notificationRequestsForAnnounce = self->_notificationRequestsForAnnounce;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__SBNotificationCarPlayDestination__notificationRequestForAnnounceWithIdentifier___block_invoke;
  v10[3] = &unk_1E8EBBAC8;
  v6 = v4;
  v11 = v6;
  v7 = -[NSMutableArray indexOfObjectPassingTest:](notificationRequestsForAnnounce, "indexOfObjectPassingTest:", v10);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_notificationRequestsForAnnounce, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

uint64_t __82__SBNotificationCarPlayDestination__notificationRequestForAnnounceWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "notificationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_queueNotificationRequestWhileAnnouncing:(id)a3
{
  id v4;
  NSMutableArray *notificationRequestsPendingAnnounce;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  notificationRequestsPendingAnnounce = self->_notificationRequestsPendingAnnounce;
  v8 = v4;
  if (!notificationRequestsPendingAnnounce)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_notificationRequestsPendingAnnounce;
    self->_notificationRequestsPendingAnnounce = v6;

    v4 = v8;
    notificationRequestsPendingAnnounce = self->_notificationRequestsPendingAnnounce;
  }
  -[NSMutableArray addObject:](notificationRequestsPendingAnnounce, "addObject:", v4);

}

- (void)_modifyNotificationRequest:(id)a3 inStore:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a3;
  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __71__SBNotificationCarPlayDestination__modifyNotificationRequest_inStore___block_invoke;
    v9[3] = &unk_1E8EBBAC8;
    v6 = v8;
    v10 = v6;
    v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v5, "replaceObjectAtIndex:withObject:", v7, v6);

  }
}

uint64_t __71__SBNotificationCarPlayDestination__modifyNotificationRequest_inStore___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "matchesRequest:", a2);
}

- (void)_withdrawNotificationRequest:(id)a3 inStore:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a3;
  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73__SBNotificationCarPlayDestination__withdrawNotificationRequest_inStore___block_invoke;
    v8[3] = &unk_1E8EBBAC8;
    v9 = v7;
    v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v8);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v5, "removeObjectAtIndex:", v6);

  }
}

uint64_t __73__SBNotificationCarPlayDestination__withdrawNotificationRequest_inStore___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "matchesRequest:", a2);
}

- (void)_flushNotificationRequestsPendingAnnounce
{
  NSObject *v3;
  NSMutableArray *notificationRequestsPendingAnnounce;
  NSMutableArray *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  if (-[NSMutableArray count](self->_notificationRequestsPendingAnnounce, "count"))
  {
    v3 = *MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "CarPlay flushing notification requests pending announce", buf, 2u);
    }
    notificationRequestsPendingAnnounce = self->_notificationRequestsPendingAnnounce;
    self->_notificationRequestsPendingAnnounce = 0;
    v5 = notificationRequestsPendingAnnounce;

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __77__SBNotificationCarPlayDestination__flushNotificationRequestsPendingAnnounce__block_invoke;
    v6[3] = &unk_1E8EBBAF0;
    v6[4] = self;
    -[NSMutableArray enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", v6);

  }
}

uint64_t __77__SBNotificationCarPlayDestination__flushNotificationRequestsPendingAnnounce__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "postNotificationRequest:", a2);
}

- (void)_flushAnnounceNotificationRequestsShouldAnnounce:(BOOL)a3
{
  NSObject *v5;
  NSMutableArray *notificationRequestsForAnnounce;
  NSMutableArray *v7;
  NSMutableDictionary *announceRequestsForNotificationRequests;
  NCNotificationRequest *notificationRequestPendingDeactivation;
  _QWORD v10[5];
  BOOL v11;
  uint8_t buf[16];

  if (-[NSMutableArray count](self->_notificationRequestsForAnnounce, "count"))
  {
    v5 = *MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "CarPlay flushing all announce notification requests", buf, 2u);
    }
    notificationRequestsForAnnounce = self->_notificationRequestsForAnnounce;
    self->_notificationRequestsForAnnounce = 0;
    v7 = notificationRequestsForAnnounce;

    announceRequestsForNotificationRequests = self->_announceRequestsForNotificationRequests;
    self->_announceRequestsForNotificationRequests = 0;

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __85__SBNotificationCarPlayDestination__flushAnnounceNotificationRequestsShouldAnnounce___block_invoke;
    v10[3] = &unk_1E8EBBB18;
    v10[4] = self;
    v11 = a3;
    -[NSMutableArray enumerateObjectsUsingBlock:](v7, "enumerateObjectsUsingBlock:", v10);
    notificationRequestPendingDeactivation = self->_notificationRequestPendingDeactivation;
    self->_notificationRequestPendingDeactivation = 0;

  }
}

void __85__SBNotificationCarPlayDestination__flushAnnounceNotificationRequestsShouldAnnounce___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "matchesRequest:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72)) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_postNotificationRequest:shouldAnnounce:", v3, *(unsigned __int8 *)(a1 + 40));

}

- (void)_startAnnounceTimeoutTimer
{
  NSObject *v3;
  BSAbsoluteMachTimer *v4;
  BSAbsoluteMachTimer *announceTimeoutTimer;
  BSAbsoluteMachTimer *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id buf[2];

  if (!self->_announceTimeoutTimer)
  {
    v3 = *MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "CarPlay starting announce timeout timer", (uint8_t *)buf, 2u);
    }
    objc_initWeak(buf, self);
    v4 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBNotificationCarPlayDestination.announceTimeoutTimer"));
    announceTimeoutTimer = self->_announceTimeoutTimer;
    self->_announceTimeoutTimer = v4;

    v6 = self->_announceTimeoutTimer;
    v7 = MEMORY[0x1E0C80D38];
    v8 = MEMORY[0x1E0C80D38];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__SBNotificationCarPlayDestination__startAnnounceTimeoutTimer__block_invoke;
    v9[3] = &unk_1E8E9EEC8;
    objc_copyWeak(&v10, buf);
    -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v6, "scheduleWithFireInterval:leewayInterval:queue:handler:", v7, v9, 10.0, 0.0);

    objc_destroyWeak(&v10);
    objc_destroyWeak(buf);
  }
}

void __62__SBNotificationCarPlayDestination__startAnnounceTimeoutTimer__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  id v6;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)*MEMORY[0x1E0DC5F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_ERROR))
    __62__SBNotificationCarPlayDestination__startAnnounceTimeoutTimer__block_invoke_cold_1((uint64_t)WeakRetained, v5);
  objc_msgSend(WeakRetained, "_announceTimeoutTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v3)
    objc_msgSend(WeakRetained, "_invalidateAnnounceTimeoutTimer");
  objc_msgSend(WeakRetained, "_setNotificationRequestCurrentlyAnnouncing:", 0);
  objc_msgSend(WeakRetained, "_flushAnnounceNotificationRequestsShouldAnnounce:", 1);
  objc_msgSend(WeakRetained, "_flushNotificationRequestsPendingAnnounce");

}

- (void)_invalidateAnnounceTimeoutTimer
{
  NSObject *v3;
  BSAbsoluteMachTimer *announceTimeoutTimer;
  uint8_t v5[16];

  v3 = *MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "CarPlay cancelling announce timeout timer", v5, 2u);
  }
  -[BSAbsoluteMachTimer invalidate](self->_announceTimeoutTimer, "invalidate");
  announceTimeoutTimer = self->_announceTimeoutTimer;
  self->_announceTimeoutTimer = 0;

}

- (NCNotificationAlertDestinationDelegate)delegate
{
  return (NCNotificationAlertDestinationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBNCAlertingController)alertingController
{
  return (SBNCAlertingController *)objc_loadWeakRetained((id *)&self->_alertingController);
}

- (void)setAlertingController:(id)a3
{
  objc_storeWeak((id *)&self->_alertingController, a3);
}

- (BSAbsoluteMachTimer)_announceTimeoutTimer
{
  return self->_announceTimeoutTimer;
}

- (void)_setAnnounceTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_announceTimeoutTimer, a3);
}

- (NCNotificationRequest)_notificationRequestCurrentlyAnnouncing
{
  return self->_notificationRequestCurrentlyAnnouncing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationRequestCurrentlyAnnouncing, 0);
  objc_storeStrong((id *)&self->_announceTimeoutTimer, 0);
  objc_destroyWeak((id *)&self->_alertingController);
  objc_storeStrong((id *)&self->_carPlayBannerSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_announceRequestsForNotificationRequests, 0);
  objc_storeStrong((id *)&self->_announcementStateObserver, 0);
  objc_storeStrong((id *)&self->_notificationRequestPendingDeactivation, 0);
  objc_storeStrong((id *)&self->_notificationRequestsPendingAVSession, 0);
  objc_storeStrong((id *)&self->_notificationRequestsPendingAnnounce, 0);
  objc_storeStrong((id *)&self->_notificationRequestsForAnnounce, 0);
  objc_destroyWeak((id *)&self->_presentablePresentingAlertController);
  objc_storeStrong((id *)&self->_appPolicyForBundleID, 0);
  objc_storeStrong((id *)&self->_appPolicyEvaluator, 0);
  objc_storeStrong((id *)&self->_presentables, 0);
  objc_storeStrong((id *)&self->_bannerHostMonitorListener, 0);
}

- (void)_postNotificationRequest:shouldAnnounce:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, v0, v1, "Error requesting presentation and container sizes: %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)_postNotificationRequest:shouldAnnounce:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, v0, (uint64_t)v0, "Error attempting to post presentable: presentable: %{public}@; error: %{public}@",
    v1);
  OUTLINED_FUNCTION_2_0();
}

- (void)withdrawNotificationRequest:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, v0, (uint64_t)v0, "Error attempting to revoke presentable: requestID: %{public}@; error: %{public}@",
    v1);
  OUTLINED_FUNCTION_2_0();
}

- (void)didSelectBannerOfPresentableViewController:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "requestIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v6;
  v10 = 2114;
  v11 = a3;
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, v5, v7, "Error attempting to revoke presentable: requestID: %{public}@; error: %{public}@",
    (uint8_t *)&v8);

  OUTLINED_FUNCTION_20();
}

void __79__SBNotificationCarPlayDestination_didSelectBannerOfPresentableViewController___block_invoke_cold_1(void **a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = a2;
  objc_msgSend(v2, "requestIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_11();
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, v3, v5, "Error attempting to revoke presentable: requestID: %{public}@; error: %{public}@",
    v6);

  OUTLINED_FUNCTION_20();
}

- (void)didCancelBannerOfPresentableViewController:(void *)a1 reason:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "requestIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_11();
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, v3, v5, "Error attempting to revoke presentable: requestID: %{public}@; error: %{public}@",
    v6);

  OUTLINED_FUNCTION_20();
}

- (void)_presentablesWithRequestIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, v0, v1, "No presentables for requestID: %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)_removePresentable:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, v0, v1, "No presentable to remove: %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)_setSuspended:(NSObject *)a3 forPresentingAlertControllerForPresentable:.cold.1(char a1, uint64_t a2, NSObject *a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("suspend");
  if ((a1 & 1) == 0)
    v3 = CFSTR("resume");
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, a3, (uint64_t)a3, "Error attempting to %{public}@: %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2_0();
}

void __62__SBNotificationCarPlayDestination__startAnnounceTimeoutTimer__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 48);
  v3 = a2;
  objc_msgSend(v2, "count");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, v3, v4, "Timed out while waiting for announce to start for %lu notifications!", v5);

}

@end
