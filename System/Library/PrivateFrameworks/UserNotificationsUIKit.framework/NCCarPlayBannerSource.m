@implementation NCCarPlayBannerSource

+ (void)initialize
{
  id v3;

  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
    NCRegisterUserNotificationsUILogging();
}

- (int64_t)destination
{
  void *v2;
  int64_t v3;

  -[NCCarPlayBannerSource _bannerSource](self, "_bannerSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "destination");

  return v3;
}

- (id)requesterIdentifier
{
  void *v2;
  void *v3;

  -[NCCarPlayBannerSource _bannerSource](self, "_bannerSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requesterIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isValid
{
  void *v2;
  char v3;

  -[NCCarPlayBannerSource _bannerSource](self, "_bannerSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isValid");

  return v3;
}

- (id)layoutDescriptionWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[NCCarPlayBannerSource _bannerSource](self, "_bannerSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutDescriptionWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)postPresentable:(id)a3 options:(unint64_t)a4 userInfo:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  id v21;
  id v23;

  v10 = a3;
  v11 = a5;
  if (!-[NCCarPlayBannerSource _postedPresentableCount](self, "_postedPresentableCount"))
    -[NCCarPlayBannerSource _setSuspended:forReason:revokingCurrent:](self, "_setSuspended:forReason:revokingCurrent:", 0, CFSTR("NCCarPlayBannerSourceSuspensionReasonBannerPresented"), 0);
  v12 = *MEMORY[0x1E0D01058] | a4;
  v13 = (void *)objc_msgSend(v11, "mutableCopy");
  v14 = v13;
  if (v13)
    v15 = v13;
  else
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = v15;

  objc_msgSend(v16, "setObject:forKey:", CFSTR("NCCarPlayBannerSourceSuspensionReasonBannerPresented"), *MEMORY[0x1E0D010B8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NCCarPlayBannerSource _shouldPresentableBorrowCarPlayScreen:](self, "_shouldPresentableBorrowCarPlayScreen:", v10));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v17, *MEMORY[0x1E0D0D3A0]);

  v18 = v16;
  -[NCCarPlayBannerSource _bannerSource](self, "_bannerSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v20 = objc_msgSend(v19, "postPresentable:options:userInfo:error:", v10, v12, v18, &v23);
  v21 = v23;

  if (!v20)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
    {
      -[NCCarPlayBannerSource postPresentable:options:userInfo:error:].cold.1();
      if (!a6)
        goto LABEL_13;
    }
    else if (!a6)
    {
      goto LABEL_13;
    }
    *a6 = objc_retainAutorelease(v21);
    goto LABEL_13;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "addPresentableObserver:", self);
  -[NCCarPlayBannerSource _enqueuePostedPresentable:](self, "_enqueuePostedPresentable:", v10);
  -[NCCarPlayBannerSource _revokePreviouslyPostedPresentableIfPossible](self, "_revokePreviouslyPostedPresentableIfPossible");
LABEL_13:

  return v20;
}

- (id)revokePresentableWithRequestIdentifier:(id)a3 reason:(id)a4 animated:(BOOL)a5 userInfo:(id)a6 error:(id *)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v9 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  -[NCCarPlayBannerSource _bannerSource](self, "_bannerSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:", v12, v13, v9, v14, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v24;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v17);
          -[NCCarPlayBannerSource _presentableWithIdentificationDidDisappear:](self, "_presentableWithIdentificationDidDisappear:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v21++), (_QWORD)v23);
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v19);
    }

  }
  return v16;
}

- (id)revokeAllPresentablesWithReason:(id)a3 userInfo:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[NCCarPlayBannerSource _bannerSource](self, "_bannerSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "revokeAllPresentablesWithReason:userInfo:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    -[NCCarPlayBannerSource _allPresentablesDidDisappear](self, "_allPresentablesDidDisappear");
  return v11;
}

- (void)invalidate
{
  BNBannerSource *bannerSource;

  -[NCCarPlayBannerSource _cancelDismissTimer](self, "_cancelDismissTimer");
  -[NCCarPlayBannerSource _cancelReplaceTimer](self, "_cancelReplaceTimer");
  bannerSource = self->_bannerSource;
  self->_bannerSource = 0;

}

- (id)revokePresentableWithIdentification:(id)a3 reason:(id)a4 animated:(BOOL)a5 userInfo:(id)a6 error:(id *)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  id v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[6];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v9 = a5;
  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  -[NCCarPlayBannerSource _bannerSource](self, "_bannerSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "revokePresentableWithIdentification:reason:animated:userInfo:error:", v12, v13, v9, v14, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v26 = v14;
    v27 = v16;
    v28 = v13;
    v29 = v12;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v32;
      v21 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(v17);
          v23 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          -[NCCarPlayBannerSource _postedPresentablesWithIdentification:](self, "_postedPresentablesWithIdentification:", v23, v26, v27, v28, v29);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = v21;
          v30[1] = 3221225472;
          v30[2] = __92__NCCarPlayBannerSource_revokePresentableWithIdentification_reason_animated_userInfo_error___block_invoke;
          v30[3] = &unk_1E8D1F678;
          v30[4] = v23;
          v30[5] = self;
          objc_msgSend(v24, "enumerateObjectsWithOptions:usingBlock:", 2, v30);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v19);
    }

    v13 = v28;
    v12 = v29;
    v14 = v26;
    v16 = v27;
  }

  return v16;
}

void __92__NCCarPlayBannerSource_revokePresentableWithIdentification_reason_animated_userInfo_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (BNIsPresentableIdentifiedByIdentification())
    objc_msgSend(*(id *)(a1 + 40), "_presentableDidDisappear:", v3);

}

- (id)keyWindowForScreen:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[BNBannerSource keyWindowForScreen:](self->_bannerSource, "keyWindowForScreen:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)setSuspended:(BOOL)a3 forReason:(id)a4 revokingCurrent:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  char v12;

  v7 = a5;
  v8 = a3;
  v10 = a4;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("PresentingAlertController")))
  {
    if (v8)
      -[NCCarPlayBannerSource _cancelDismissTimer](self, "_cancelDismissTimer");
    else
      -[NCCarPlayBannerSource _startDismissTimer](self, "_startDismissTimer");
  }
  -[NCCarPlayBannerSource _bannerSource](self, "_bannerSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "setSuspended:forReason:revokingCurrent:error:", v8, v10, v7, a6);

  return v12;
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id v4;
  _BOOL4 v5;

  v4 = a3;
  -[NCCarPlayBannerSource _cancelDismissTimer](self, "_cancelDismissTimer");
  v5 = -[NCCarPlayBannerSource _isPresentableSticky:](self, "_isPresentableSticky:", v4);

  if (v5)
  {
    -[NCCarPlayBannerSource _setSuspended:forReason:revokingCurrent:](self, "_setSuspended:forReason:revokingCurrent:", 1, CFSTR("NCCarPlayBannerSourceSuspensionReasonSticky"), 0);
  }
  else
  {
    -[NCCarPlayBannerSource _startDismissTimer](self, "_startDismissTimer");
    -[NCCarPlayBannerSource _startReplaceTimer](self, "_startReplaceTimer");
  }
}

- (void)bannerSourceDidInvalidate:(id)a3
{
  BNBannerSource *bannerSource;

  bannerSource = self->_bannerSource;
  self->_bannerSource = 0;

}

- (id)_bannerSource
{
  BNBannerSource *bannerSource;
  void *v4;
  void *v5;
  BNBannerSource *v6;
  BNBannerSource *v7;

  bannerSource = self->_bannerSource;
  if (!bannerSource)
  {
    v4 = (void *)MEMORY[0x1E0D01070];
    objc_msgSend(MEMORY[0x1E0DC6008], "requesterIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bannerSourceForDestination:forRequesterIdentifier:", 1, v5);
    v6 = (BNBannerSource *)objc_claimAutoreleasedReturnValue();
    v7 = self->_bannerSource;
    self->_bannerSource = v6;

    -[BNBannerSource setDelegate:](self->_bannerSource, "setDelegate:", self);
    bannerSource = self->_bannerSource;
  }
  return bannerSource;
}

- (BOOL)_isPresentableSticky:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  v3 = a3;
  objc_opt_class();
  UNSafeCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "notificationRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "options");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "dismissAutomaticallyForCarPlay") ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)_shouldPresentableBorrowCarPlayScreen:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_opt_class();
  UNSafeCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "notificationRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isCriticalAlert");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_setSuspended:(BOOL)a3 forReason:(id)a4 revokingCurrent:(BOOL)a5
{
  BOOL v5;
  id v6;
  NSObject *v7;
  id v9;

  v9 = 0;
  v5 = -[NCCarPlayBannerSource setSuspended:forReason:revokingCurrent:error:](self, "setSuspended:forReason:revokingCurrent:error:", a3, a4, a5, &v9);
  v6 = v9;
  if (!v5)
  {
    v7 = *MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
      -[NCCarPlayBannerSource _setSuspended:forReason:revokingCurrent:].cold.1((uint64_t)v6, v7);
  }

  return v5;
}

- (void)_enqueuePostedPresentable:(id)a3
{
  id v4;
  NCCarPlayBannerSource *v5;
  NSPointerArray *postedPresentables;
  uint64_t v7;
  NSPointerArray *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = self;
    objc_sync_enter(v5);
    postedPresentables = v5->_postedPresentables;
    if (!postedPresentables)
    {
      objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v5->_postedPresentables;
      v5->_postedPresentables = (NSPointerArray *)v7;

      postedPresentables = v5->_postedPresentables;
    }
    -[NSPointerArray addPointer:](postedPresentables, "addPointer:", v9);
    objc_sync_exit(v5);

    v4 = v9;
  }

}

- (id)_peekPostedPresentable
{
  NCCarPlayBannerSource *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSPointerArray unui_compact](v2->_postedPresentables, "unui_compact");
  if (-[NSPointerArray count](v2->_postedPresentables, "count"))
  {
    -[NSPointerArray pointerAtIndex:](v2->_postedPresentables, "pointerAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (id)_postedPresentablesWithIdentification:(id)a3
{
  id v4;
  id v5;
  NCCarPlayBannerSource *v6;
  unint64_t i;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = self;
  objc_sync_enter(v6);
  -[NSPointerArray unui_compact](v6->_postedPresentables, "unui_compact");
  for (i = 0; i < -[NSPointerArray count](v6->_postedPresentables, "count"); ++i)
  {
    -[NSPointerArray pointerAtIndex:](v6->_postedPresentables, "pointerAtIndex:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (BNIsPresentableIdentifiedByIdentification())
      objc_msgSend(v5, "addObject:", v8);

  }
  objc_sync_exit(v6);

  return v5;
}

- (unint64_t)_indexOfPostedPresentable:(id)a3
{
  id v4;
  NCCarPlayBannerSource *v5;
  unint64_t i;
  id v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSPointerArray unui_compact](v5->_postedPresentables, "unui_compact");
  for (i = 0; i < -[NSPointerArray count](v5->_postedPresentables, "count"); ++i)
  {
    -[NSPointerArray pointerAtIndex:](v5->_postedPresentables, "pointerAtIndex:", i);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v4)
      goto LABEL_6;
  }
  i = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:
  objc_sync_exit(v5);

  return i;
}

- (id)_pullPostedPresentableAtIndex:(unint64_t)a3
{
  void *v3;
  NCCarPlayBannerSource *v5;
  NSPointerArray *postedPresentables;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    v5 = self;
    objc_sync_enter(v5);
    -[NSPointerArray unui_compact](v5->_postedPresentables, "unui_compact");
    -[NSPointerArray pointerAtIndex:](v5->_postedPresentables, "pointerAtIndex:", a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPointerArray removePointerAtIndex:](v5->_postedPresentables, "removePointerAtIndex:", a3);
    if (!-[NSPointerArray count](v5->_postedPresentables, "count"))
    {
      postedPresentables = v5->_postedPresentables;
      v5->_postedPresentables = 0;

    }
    objc_sync_exit(v5);

  }
  return v3;
}

- (unint64_t)_postedPresentableCount
{
  NCCarPlayBannerSource *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSPointerArray unui_compact](v2->_postedPresentables, "unui_compact");
  v3 = -[NSPointerArray count](v2->_postedPresentables, "count");
  objc_sync_exit(v2);

  return v3;
}

- (void)_presentableDidDisappear:(id)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  id v7;
  id v8;
  _BOOL4 v9;
  id v10;

  v10 = a3;
  v4 = -[NCCarPlayBannerSource _indexOfPostedPresentable:](self, "_indexOfPostedPresentable:", v10);
  v5 = v10;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "removePresentableObserver:", self);
    -[NCCarPlayBannerSource _peekPostedPresentable](self, "_peekPostedPresentable");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v8 = -[NCCarPlayBannerSource _pullPostedPresentableAtIndex:](self, "_pullPostedPresentableAtIndex:", v6);
    v5 = v10;
    if (v7 == v10)
    {
      -[NCCarPlayBannerSource _setSuspended:forReason:revokingCurrent:](self, "_setSuspended:forReason:revokingCurrent:", 0, CFSTR("NCCarPlayBannerSourceSuspensionReasonBannerPresented"), 0);
      v9 = -[NCCarPlayBannerSource _isPresentableSticky:](self, "_isPresentableSticky:", v10);
      v5 = v10;
      if (v9)
      {
        -[NCCarPlayBannerSource _setSuspended:forReason:revokingCurrent:](self, "_setSuspended:forReason:revokingCurrent:", 0, CFSTR("NCCarPlayBannerSourceSuspensionReasonSticky"), 0);
        v5 = v10;
      }
    }
  }

}

- (void)_presentableWithIdentificationDidDisappear:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[NCCarPlayBannerSource _postedPresentablesWithIdentification:](self, "_postedPresentablesWithIdentification:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__NCCarPlayBannerSource__presentableWithIdentificationDidDisappear___block_invoke;
  v5[3] = &unk_1E8D1F6A0;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsWithOptions:usingBlock:", 2, v5);

}

uint64_t __68__NCCarPlayBannerSource__presentableWithIdentificationDidDisappear___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentableDidDisappear:", a2);
}

- (void)_allPresentablesDidDisappear
{
  void *v2;
  NCCarPlayBannerSource *obj;
  _QWORD v4[5];

  obj = self;
  objc_sync_enter(obj);
  -[NSPointerArray allObjects](obj->_postedPresentables, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__NCCarPlayBannerSource__allPresentablesDidDisappear__block_invoke;
  v4[3] = &unk_1E8D1F6A0;
  v4[4] = obj;
  objc_msgSend(v2, "enumerateObjectsWithOptions:usingBlock:", 2, v4);

  objc_sync_exit(obj);
}

uint64_t __53__NCCarPlayBannerSource__allPresentablesDidDisappear__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentableDidDisappear:", a2);
}

- (void)_startDismissTimer
{
  -[NCCarPlayBannerSource _startDismissTimerWithTimeInterval:](self, "_startDismissTimerWithTimeInterval:", 10.0);
}

- (void)_startDismissTimerWithTimeInterval:(double)a3
{
  void *v5;
  NSTimer *v6;
  NSTimer *dismissTimer;
  _QWORD v8[4];
  id v9;
  id location;

  if (!self->_dismissTimer)
  {
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x1E0C99E88];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__NCCarPlayBannerSource__startDismissTimerWithTimeInterval___block_invoke;
    v8[3] = &unk_1E8D1D5E0;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 0, v8, a3);
    v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    dismissTimer = self->_dismissTimer;
    self->_dismissTimer = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __60__NCCarPlayBannerSource__startDismissTimerWithTimeInterval___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_dismissTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
    objc_msgSend(WeakRetained, "_setDismissTimer:", 0);
  objc_msgSend(WeakRetained, "_peekPostedPresentable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D010A0], "uniqueIdentificationForPresentable:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(WeakRetained, "revokePresentableWithIdentification:reason:animated:userInfo:error:", v7, CFSTR("NCCarPlayBannerRevocationReasonAutomaticDismissal"), 1, 0, &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;

    if (!v8 && os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
      __60__NCCarPlayBannerSource__startDismissTimerWithTimeInterval___block_invoke_cold_1();

  }
}

- (void)_cancelDismissTimer
{
  NSTimer *dismissTimer;

  -[NSTimer invalidate](self->_dismissTimer, "invalidate");
  dismissTimer = self->_dismissTimer;
  self->_dismissTimer = 0;

}

- (void)_revokePreviouslyPostedPresentableIfPossible
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_6(&dword_1CFC3D000, v0, v1, "Error attempting to revoke presentable: presentable: %{public}@; error: %{public}@");
  OUTLINED_FUNCTION_1_1();
}

- (void)_startReplaceTimer
{
  void *v3;
  NSTimer *v4;
  NSTimer *replaceTimer;
  _QWORD v6[4];
  id v7;
  id location;

  if (!self->_replaceTimer)
  {
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x1E0C99E88];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__NCCarPlayBannerSource__startReplaceTimer__block_invoke;
    v6[3] = &unk_1E8D1D5E0;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, v6, 4.0);
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    replaceTimer = self->_replaceTimer;
    self->_replaceTimer = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __43__NCCarPlayBannerSource__startReplaceTimer__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_replaceTimer");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v3)
  {
    objc_msgSend(WeakRetained, "_setReplaceTimer:", 0);
    objc_msgSend(WeakRetained, "_revokePreviouslyPostedPresentableIfPossible");
  }

}

- (void)_cancelReplaceTimer
{
  NSTimer *replaceTimer;

  -[NSTimer invalidate](self->_replaceTimer, "invalidate");
  replaceTimer = self->_replaceTimer;
  self->_replaceTimer = 0;

}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (NSTimer)_dismissTimer
{
  return self->_dismissTimer;
}

- (void)_setDismissTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissTimer, a3);
}

- (NSTimer)_replaceTimer
{
  return self->_replaceTimer;
}

- (void)_setReplaceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_replaceTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceTimer, 0);
  objc_storeStrong((id *)&self->_dismissTimer, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_postedPresentables, 0);
  objc_storeStrong((id *)&self->_bannerSource, 0);
}

- (void)didBeginAnnounceForNotificationRequest:(id)a3
{
  -[NCCarPlayBannerSource _cancelReplaceTimer](self, "_cancelReplaceTimer", a3);
  -[NCCarPlayBannerSource _cancelDismissTimer](self, "_cancelDismissTimer");
}

- (void)didFinishAnnounceForNotificationRequest:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;

  -[NCCarPlayBannerSource _peekPostedPresentable](self, "_peekPostedPresentable", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    v5 = -[NCCarPlayBannerSource _isPresentableSticky:](self, "_isPresentableSticky:", v4);
    v4 = v6;
    if (!v5)
    {
      -[NCCarPlayBannerSource _startReplaceTimer](self, "_startReplaceTimer");
      -[NCCarPlayBannerSource _cancelDismissTimer](self, "_cancelDismissTimer");
      -[NCCarPlayBannerSource _startAnnounceDismissalTimer](self, "_startAnnounceDismissalTimer");
      v4 = v6;
    }
  }

}

- (void)_startAnnounceDismissalTimer
{
  -[NCCarPlayBannerSource _startDismissTimerWithTimeInterval:](self, "_startDismissTimerWithTimeInterval:", 2.0);
}

- (void)postPresentable:options:userInfo:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_6(&dword_1CFC3D000, v0, v1, "Error attempting to post presentable: presentable: %{public}@; error: %{public}@");
  OUTLINED_FUNCTION_1_1();
}

- (void)_setSuspended:(uint64_t)a1 forReason:(NSObject *)a2 revokingCurrent:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1CFC3D000, a2, OS_LOG_TYPE_ERROR, "Error attempting to suspend: %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_1();
}

void __60__NCCarPlayBannerSource__startDismissTimerWithTimeInterval___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_6(&dword_1CFC3D000, v0, v1, "Error attempting to revoke posted presentable: presentable: %{public}@; error: %{public}@");
  OUTLINED_FUNCTION_1_1();
}

@end
