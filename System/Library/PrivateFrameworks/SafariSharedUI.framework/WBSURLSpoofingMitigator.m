@implementation WBSURLSpoofingMitigator

- (BOOL)UIShouldReflectCommittedURLInsteadOfCurrentURL
{
  return self->_UIShouldReflectCommittedURLInsteadOfCurrentURL;
}

+ (BOOL)automaticallyNotifiesObserversOfUIShouldReflectCommittedURLInsteadOfCurrentURL
{
  return 0;
}

- (void)didStartProvisionalNavigationWithUserInitiatedAction:(id)a3
{
  _WKUserInitiatedAction *v5;
  void *v6;
  id *v7;
  NSTimer *v8;
  NSTimer *timerForRevertingToCommittedURL;
  void *v10;
  void *v11;
  NSTimer *v12;
  NSTimer *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v5 = (_WKUserInitiatedAction *)a3;
  objc_initWeak(&location, self);
  if (self->_navigationSource)
  {
    if (!v5 || self->_userInitiatedAction != v5)
    {
      objc_storeStrong((id *)&self->_userInitiatedAction, a3);
      if (!self->_userInitiatedAction)
      {
        -[WBSURLSpoofingMitigator _setUIShouldReflectCommittedURLInsteadOfCurrentURL:](self, "_setUIShouldReflectCommittedURLInsteadOfCurrentURL:", 1);
        goto LABEL_11;
      }
      v6 = (void *)MEMORY[0x1E0C99E88];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __80__WBSURLSpoofingMitigator_didStartProvisionalNavigationWithUserInitiatedAction___block_invoke_2;
      v14[3] = &unk_1E5442518;
      v7 = &v15;
      objc_copyWeak(&v15, &location);
      objc_msgSend(v6, "timerWithTimeInterval:repeats:block:", 0, v14, 2.0);
      v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      timerForRevertingToCommittedURL = self->_timerForRevertingToCommittedURL;
      self->_timerForRevertingToCommittedURL = v8;

      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addTimer:forMode:", self->_timerForRevertingToCommittedURL, *MEMORY[0x1E0C99860]);
      goto LABEL_9;
    }
  }
  else if (self->_hasCommittedChromeInitiatedLoad && !self->_timerForRevertingToCommittedURL)
  {
    v11 = (void *)MEMORY[0x1E0C99E88];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __80__WBSURLSpoofingMitigator_didStartProvisionalNavigationWithUserInitiatedAction___block_invoke;
    v16[3] = &unk_1E5442518;
    v7 = &v17;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v11, "timerWithTimeInterval:repeats:block:", 0, v16, 2.0);
    v12 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v13 = self->_timerForRevertingToCommittedURL;
    self->_timerForRevertingToCommittedURL = v12;

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addTimer:forMode:", self->_timerForRevertingToCommittedURL, *MEMORY[0x1E0C99860]);
LABEL_9:

    objc_destroyWeak(v7);
  }
LABEL_11:
  objc_destroyWeak(&location);

}

void __80__WBSURLSpoofingMitigator_didStartProvisionalNavigationWithUserInitiatedAction___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setUIShouldReflectCommittedURLInsteadOfCurrentURL:", 1);

}

void __80__WBSURLSpoofingMitigator_didStartProvisionalNavigationWithUserInitiatedAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setUIShouldReflectCommittedURLInsteadOfCurrentURL:", 1);

}

- (void)didFailProvisionalNavigationWithError:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CEF800];
  v9[0] = *MEMORY[0x1E0CB32E8];
  v9[1] = v4;
  v10[0] = &unk_1E547C378;
  v10[1] = &unk_1E547C390;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "safari_matchesErrorDomainsAndCodes:", v7);

  if (v8)
    -[WBSURLSpoofingMitigator _determineIfPageIsTryingToSpoofAddressFieldWhenInterruptingProvisionalNavigation](self, "_determineIfPageIsTryingToSpoofAddressFieldWhenInterruptingProvisionalNavigation");
  else
    -[WBSURLSpoofingMitigator _stopTrackingInterruptedProvisionalNavigations](self, "_stopTrackingInterruptedProvisionalNavigations");
}

- (void)didCommitNavigation
{
  if (!self->_navigationSource)
    self->_hasCommittedChromeInitiatedLoad = 1;
  -[WBSURLSpoofingMitigator _stopTrackingInterruptedProvisionalNavigations](self, "_stopTrackingInterruptedProvisionalNavigations");
}

- (void)willStartNewBrowserChromeInitiatedNavigation
{
  self->_hasCommittedChromeInitiatedLoad = 0;
}

- (void)_determineIfPageIsTryingToSpoofAddressFieldWhenInterruptingProvisionalNavigation
{
  NSDate *v3;
  NSDate *v4;
  double v5;
  double v6;
  NSDate *dateOfLastSuspiciousProvisionalNavigationInterruption;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_dateOfLastSuspiciousProvisionalNavigationInterruption)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    v6 = v5;
  }
  else
  {
    v6 = 0.0;
  }
  dateOfLastSuspiciousProvisionalNavigationInterruption = self->_dateOfLastSuspiciousProvisionalNavigationInterruption;
  self->_dateOfLastSuspiciousProvisionalNavigationInterruption = v4;

  v8 = self->_recentlyInterruptedNavigationCount + 1;
  self->_recentlyInterruptedNavigationCount = v8;
  if (v8 == 2)
  {
    if (v6 > 30.0)
      -[WBSURLSpoofingMitigator _stopTrackingInterruptedProvisionalNavigations](self, "_stopTrackingInterruptedProvisionalNavigations");
  }
  else if (v8 >= 5)
  {
    -[WBSURLSpoofingMitigator _setUIShouldReflectCommittedURLInsteadOfCurrentURL:](self, "_setUIShouldReflectCommittedURLInsteadOfCurrentURL:", 1);
  }
}

- (void)_stopTrackingInterruptedProvisionalNavigations
{
  NSDate *dateOfLastSuspiciousProvisionalNavigationInterruption;
  NSTimer *timerForRevertingToCommittedURL;
  _WKUserInitiatedAction *userInitiatedAction;

  dateOfLastSuspiciousProvisionalNavigationInterruption = self->_dateOfLastSuspiciousProvisionalNavigationInterruption;
  self->_dateOfLastSuspiciousProvisionalNavigationInterruption = 0;
  self->_recentlyInterruptedNavigationCount = 0;

  -[WBSURLSpoofingMitigator _setUIShouldReflectCommittedURLInsteadOfCurrentURL:](self, "_setUIShouldReflectCommittedURLInsteadOfCurrentURL:", 0);
  -[NSTimer invalidate](self->_timerForRevertingToCommittedURL, "invalidate");
  timerForRevertingToCommittedURL = self->_timerForRevertingToCommittedURL;
  self->_timerForRevertingToCommittedURL = 0;

  userInitiatedAction = self->_userInitiatedAction;
  self->_userInitiatedAction = 0;

  self->_navigationSource = 0;
}

- (void)_setUIShouldReflectCommittedURLInsteadOfCurrentURL:(BOOL)a3
{
  if (self->_UIShouldReflectCommittedURLInsteadOfCurrentURL != a3)
  {
    -[WBSURLSpoofingMitigator willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("UIShouldReflectCommittedURLInsteadOfCurrentURL"));
    self->_UIShouldReflectCommittedURLInsteadOfCurrentURL = a3;
    -[WBSURLSpoofingMitigator didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("UIShouldReflectCommittedURLInsteadOfCurrentURL"));
  }
}

- (int64_t)navigationSource
{
  return self->_navigationSource;
}

- (void)setNavigationSource:(int64_t)a3
{
  self->_navigationSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerForRevertingToCommittedURL, 0);
  objc_storeStrong((id *)&self->_userInitiatedAction, 0);
  objc_storeStrong((id *)&self->_dateOfLastSuspiciousProvisionalNavigationInterruption, 0);
}

@end
