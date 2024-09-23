@implementation BKDisplayCloneMirroringManager

- (BKDisplayCloneMirroringManager)initWithDisplayProvider:(id)a3
{
  id v5;
  BKDisplayCloneMirroringManager *v6;
  BKDisplayCloneMirroringManager *v7;
  BKDisplayCloneMirrorRequestCache *v8;
  BKDisplayCloneMirrorRequestCache *lock_cloneMirrorRequests;
  BKDisplayCloneMirrorRequestCache *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *lock_destinationDisplayIdentifierToCloneRecord;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BKDisplayCloneMirroringManager;
  v6 = -[BKDisplayCloneMirroringManager init](&v14, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_displayProvider, a3);
    v8 = objc_alloc_init(BKDisplayCloneMirrorRequestCache);
    lock_cloneMirrorRequests = v7->_lock_cloneMirrorRequests;
    v7->_lock_cloneMirrorRequests = v8;

    v10 = v7->_lock_cloneMirrorRequests;
    if (v10)
      objc_storeWeak((id *)&v10->_delegate, v7);
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    lock_destinationDisplayIdentifierToCloneRecord = v7->_lock_destinationDisplayIdentifierToCloneRecord;
    v7->_lock_destinationDisplayIdentifierToCloneRecord = v11;

  }
  return v7;
}

- (void)_lock_evaluateCarPlayDisplay:(id)a3 label:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  int v24;
  NSObject *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000F7688, "objectForKey:", v6));
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "integerValue");
    v10 = BKLogDisplay(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = NSStringFromBKSDisplayTags(v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueId"));
      v24 = 138543874;
      v25 = v6;
      v26 = 2114;
      v27 = v13;
      v28 = 2114;
      v29 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Tagging CarPlay display %{public}@ %{public}@ %{public}@", (uint8_t *)&v24, 0x20u);

    }
    objc_msgSend(v5, "setTag:", v9);
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueId"));
    v16 = objc_msgSend(objc_alloc((Class)CARSessionStatus), "initWithOptions:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentSession"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "configuration"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "screenInfoForScreenID:", v15));

    v20 = objc_msgSend(v19, "supportsLayerTracking");
    if ((_DWORD)v20)
    {
      v21 = BKLogDisplay(v20);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 138543362;
        v25 = v15;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Enabling layer tracking for CarPlay display %{public}@", (uint8_t *)&v24, 0xCu);
      }

      objc_msgSend(v5, "setTracksCarPlayRegions:", 1);
    }

  }
  else
  {
    v23 = BKLogDisplay(0);
    v15 = objc_claimAutoreleasedReturnValue(v23);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueId"));
    v24 = 138543874;
    v25 = v6;
    v26 = 2114;
    v27 = v17;
    v28 = 2114;
    v29 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Unknown CarPlay display label %{public}@ for %{public}@ %{public}@", (uint8_t *)&v24, 0x20u);
  }

LABEL_11:
}

- (void)_lock_evaluateContinuityDisplay:(id)a3 label:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  v7 = BKLogDisplay(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueId"));
    v10 = NSStringFromBKSDisplayTags(128);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = 138543874;
    v13 = v9;
    v14 = 2114;
    v15 = v6;
    v16 = 2114;
    v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Tagging display %{public}@ with label %{public}@ as %{public}@", (uint8_t *)&v12, 0x20u);

  }
  objc_msgSend(v5, "setTag:", 128);

}

- (id)_lock_cloneMirroringOptionsFromSourceDisplay:(id)a3 destinationDisplay:(id)a4 virtualMode:(id)a5 isStevenote:(BOOL *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  unsigned int v31;
  BKDisplayCloneRecord *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id obj;
  objc_super v39;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("ContextIDs")));
  v15 = objc_opt_class(NSArray, v14);
  v16 = v13;
  v17 = v16;
  if (v15)
  {
    if ((objc_opt_isKindOfClass(v16, v15) & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
  }
  else
  {
    v18 = 0;
  }
  v19 = v18;

  obj = a4;
  if (v19)
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v19));
  else
    v20 = 0;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("DisplayLabel")));
  v23 = objc_opt_class(NSString, v22);
  v24 = v21;
  v25 = v24;
  if (v23)
  {
    if ((objc_opt_isKindOfClass(v24, v23) & 1) != 0)
      v26 = v25;
    else
      v26 = 0;
  }
  else
  {
    v26 = 0;
  }
  v27 = v26;

  v28 = objc_msgSend(v27, "isEqual:", CFSTR("Stevenote"));
  *a6 = (char)v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayCloneMirroringManager _lock_cloneMirroringOptionsSteveNote:contextIDs:](self, "_lock_cloneMirroringOptionsSteveNote:contextIDs:", v28, v20));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("ClientPID")));
  v31 = objc_msgSend(v30, "intValue");

  v32 = [BKDisplayCloneRecord alloc];
  v33 = v12;
  v34 = v11;
  v35 = v29;
  if (v32)
  {
    v39.receiver = v32;
    v39.super_class = (Class)BKDisplayCloneRecord;
    v36 = -[BKDisplayCloneMirroringManager init](&v39, "init");
    v32 = (BKDisplayCloneRecord *)v36;
    if (v36)
    {
      objc_storeStrong((id *)v36 + 2, a3);
      objc_storeStrong((id *)&v32->_destinationDisplay, obj);
      v32->_clientPID = v31;
      objc_storeStrong((id *)&v32->_options, v29);
    }
  }

  return v32;
}

- (void)_lock_setupCloningToDestination:(id)a3 fromVirtualMode:(id)a4 hideByDefault:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  NSMutableDictionary *lock_destinationDisplayIdentifierToCloneRecord;
  void *v26;
  _QWORD *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  NSObject *v31;
  _BOOL4 v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  const char *v38;
  NSObject *v39;
  uint32_t v40;
  uint64_t v41;
  void *v42;
  unsigned int v43;
  id v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  unsigned int v52;
  uint64_t v53;
  NSMutableDictionary *v54;
  void *v55;
  uint64_t v56;
  _BOOL4 v57;
  char v58;
  uint8_t buf[4];
  id v60;
  __int16 v61;
  id v62;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("MirroredDisplayID")));
  v12 = objc_opt_class(NSNumber, v11);
  v13 = v10;
  v14 = v13;
  if (v12)
  {
    if ((objc_opt_isKindOfClass(v13, v12) & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
  }
  else
  {
    v15 = 0;
  }
  v16 = v15;

  if (v16)
  {
    v18 = objc_msgSend(v16, "integerValue");
    v19 = BKLogDisplay(v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v60 = v16;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "mirroring source display is %{public}@", buf, 0xCu);
    }

    v21 = objc_claimAutoreleasedReturnValue(-[BKDisplayCloneMirroringManagerInformationProvider windowServerDisplayForDisplayIdentifier:](self->_displayProvider, "windowServerDisplayForDisplayIdentifier:", v18));
    v22 = (id)v21;
    if (v21)
      goto LABEL_10;
LABEL_19:
    v36 = BKLogDisplay(v21);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v38 = "specified source display does not exist";
    v39 = v37;
    v40 = 2;
LABEL_41:
    _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, v38, buf, v40);
    goto LABEL_22;
  }
  v33 = BKLogDisplay(v17);
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v60 = v8;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "no mirroring source display specified for %{public}@; assuming main",
      buf,
      0xCu);
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayCloneMirroringManagerInformationProvider windowServerDisplays](self->_displayProvider, "windowServerDisplays"));
  v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "firstObject"));

  if (!v22)
    goto LABEL_19;
LABEL_10:
  if (v22 != v8)
  {
    v57 = v5;
    v58 = 0;
    v23 = objc_claimAutoreleasedReturnValue(-[BKDisplayCloneMirroringManager _lock_cloneMirroringOptionsFromSourceDisplay:destinationDisplay:virtualMode:isStevenote:](self, "_lock_cloneMirroringOptionsFromSourceDisplay:destinationDisplay:virtualMode:isStevenote:", v22, v8, v9, &v58));
    v24 = objc_msgSend(v8, "displayId");
    lock_destinationDisplayIdentifierToCloneRecord = self->_lock_destinationDisplayIdentifierToCloneRecord;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v24));
    v27 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](lock_destinationDisplayIdentifierToCloneRecord, "objectForKey:", v26));

    if (v27)
    {
      v28 = BSEqualObjects(v23, v27);
      v29 = v28;
      v30 = BKLogDisplay(v28);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
      if ((v29 & 1) != 0)
      {
        if (v32)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "clone settings did not change; no-op",
            buf,
            2u);
        }

LABEL_38:
        goto LABEL_39;
      }
      if (v32)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "clone settings changed; removing previous clone",
          buf,
          2u);
      }

      v47 = (void *)v27[2];
    }
    else
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "clones"));
      v43 = objc_msgSend(v42, "containsObject:", v8);

      if (!v43)
      {
LABEL_31:
        v48 = BKLogDisplay(v44);
        v49 = objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v60 = v22;
          v61 = 2114;
          v62 = v8;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "cloning %{public}@ to %{public}@", buf, 0x16u);
        }

        if (v23)
          v50 = *(_QWORD *)(v23 + 32);
        else
          v50 = 0;
        objc_msgSend(v22, "addClone:options:", v8, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
        v52 = objc_msgSend(v51, "isEqualToString:", CFSTR("TVOut"));

        v53 = ((v58 == 0) | ~v52) & v57;
        v54 = self->_lock_destinationDisplayIdentifierToCloneRecord;
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v24));
        -[NSMutableDictionary setObject:forKey:](v54, "setObject:forKey:", v23, v55);

        if (v23)
          v56 = *(unsigned int *)(v23 + 8);
        else
          v56 = 0;
        objc_msgSend(v8, "setProcessId:", v56);
        -[BKDisplayCloneMirroringManager _lock_recomputeTagsForDisplay:shouldHide:](self, "_lock_recomputeTagsForDisplay:shouldHide:", v8, v53);
        goto LABEL_38;
      }
      v45 = BKLogDisplay(v44);
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v60 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "no record, but source display is already cloned to %{public}@ -- will remove and reapply with current settings, which may result in flicker", buf, 0xCu);
      }

      v47 = v22;
    }
    v44 = objc_msgSend(v47, "removeClone:", v8);
    goto LABEL_31;
  }
  v41 = BKLogDisplay(v21);
  v37 = objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v60 = v8;
    v38 = "cannot clone display to itself: %{public}@";
    v39 = v37;
    v40 = 12;
    goto LABEL_41;
  }
LABEL_22:

LABEL_39:
}

- (void)_lock_evaluateConnectedDisplay:(id)a3 because:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  char v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "virtualDisplayMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("MirroringMode")));
  v11 = objc_opt_class(NSNumber, v10);
  v12 = v9;
  v13 = v12;
  if (v11)
  {
    if ((objc_opt_isKindOfClass(v12, v11) & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;

  v16 = objc_msgSend(v15, "intValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueId"));
  v18 = BKLogDisplay(v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v36 = v7;
    v37 = 2114;
    v38 = v17;
    v39 = 2114;
    v40 = v8;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "evaluateDisplay(%{public}@) incoming virtual display mode(%{public}@): %{public}@", buf, 0x20u);
  }

  if (v16 - 1 >= 2)
  {
    if (v16 == 3)
    {
      -[BKDisplayCloneMirroringManager _lock_removeDisplayCloneDestination:](self, "_lock_removeDisplayCloneDestination:", v6);
      -[BKDisplayCloneMirroringManager _lock_clearWindowServerDisplayTags:](self, "_lock_clearWindowServerDisplayTags:", v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("DisplayLabel")));
      v22 = objc_opt_class(NSString, v21);
      v23 = v20;
      v24 = v23;
      if (v22)
      {
        if ((objc_opt_isKindOfClass(v23, v22) & 1) != 0)
          v25 = v24;
        else
          v25 = 0;
      }
      else
      {
        v25 = 0;
      }
      v26 = v25;

      if (objc_msgSend(v26, "isEqual:", CFSTR("Continuity")))
      {
        objc_msgSend(v6, "setProcessId:", 0);
        -[BKDisplayCloneMirroringManager _lock_evaluateContinuityDisplay:label:](self, "_lock_evaluateContinuityDisplay:label:", v6, v26);
        goto LABEL_25;
      }
      if (objc_msgSend(v26, "hasPrefix:", CFSTR("CarPlay")))
      {
        objc_msgSend(v6, "setProcessId:", 0);
        -[BKDisplayCloneMirroringManager _lock_evaluateCarPlayDisplay:label:](self, "_lock_evaluateCarPlayDisplay:label:", v6, v26);
        goto LABEL_25;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("ClientPID")));
      v30 = objc_msgSend(v29, "intValue");

      v31 = objc_msgSend(v6, "processId");
      if ((_DWORD)v30 == (_DWORD)v31)
      {
LABEL_18:
        -[BKDisplayCloneMirroringManager _lock_recomputeTagsForDisplay:shouldHide:](self, "_lock_recomputeTagsForDisplay:shouldHide:", v6, 0);
LABEL_25:

        goto LABEL_26;
      }
      v32 = BKLogDisplay(v31);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v36 = v6;
        v37 = 1024;
        LODWORD(v38) = (_DWORD)v30;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "setting %{public}@ processID to %d", buf, 0x12u);
      }

      v27 = v6;
      v28 = v30;
    }
    else
    {
      buf[0] = 0;
      v34 = 0;
      v26 = (id)objc_claimAutoreleasedReturnValue(-[BKDisplayCloneMirroringManager _lock_virtualDisplayModeFromClientParametersForDisplay:shouldHide:shouldDisable:](self, "_lock_virtualDisplayModeFromClientParametersForDisplay:shouldHide:shouldDisable:", v6, buf, &v34));
      if (!v34)
      {
        -[BKDisplayCloneMirroringManager _lock_setupCloningToDestination:fromVirtualMode:hideByDefault:](self, "_lock_setupCloningToDestination:fromVirtualMode:hideByDefault:", v6, v26, buf[0]);
        goto LABEL_25;
      }
      -[BKDisplayCloneMirroringManager _lock_removeDisplayCloneDestination:](self, "_lock_removeDisplayCloneDestination:", v6);
      v27 = v6;
      v28 = 0;
    }
    objc_msgSend(v27, "setProcessId:", v28);
    goto LABEL_18;
  }
  -[BKDisplayCloneMirroringManager _lock_setupCloningToDestination:fromVirtualMode:hideByDefault:](self, "_lock_setupCloningToDestination:fromVirtualMode:hideByDefault:", v6, v8, 1);
LABEL_26:

}

- (id)_lock_cloneMirroringOptionsSteveNote:(BOOL)a3 contextIDs:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](BKSDefaults, "localDefaults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_lock_cloneRotationDisabled));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v8, kCAWindowServerClone_DisableRotation, 0));

  v10 = objc_msgSend(v7, "disableCAOverscan");
  v11 = v10;
  if (v4 || (_DWORD)v10)
  {
    if (((v10 | !v4) & 1) == 0)
      v11 = (id)(objc_msgSend(v7, "isSteveNoteOverscanEnabled", v10) ^ 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v11));
    objc_msgSend(v9, "setObject:forKey:", v12, kCAWindowServerClone_DisableOverscan);

  }
  if (objc_msgSend(v7, "disableCAScaling", v11))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    objc_msgSend(v9, "setObject:forKey:", v13, kCAWindowServerClone_DisableScaling);

  }
  v14 = objc_msgSend(v7, "disableCAYUV");
  if (v4 || v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    objc_msgSend(v9, "setObject:forKey:", v15, kCAWindowServerClone_DisableYUV);

  }
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v9, "setObject:forKey:", v6, kCAWindowServerClone_ReplayContexts);

  return v9;
}

- (id)_lock_virtualDisplayModeFromClientParametersForDisplay:(id)a3 shouldHide:(BOOL *)a4 shouldDisable:(BOOL *)a5
{
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  BKDisplayCloneMirrorRequestCache *v14;
  BKDisplayCloneMirrorRequestCache *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  BKDisplayCloneMirrorRequestCache *lock_cloneMirrorRequests;
  os_unfair_lock_s *p_lock;
  id v23;
  NSMutableDictionary *displayUUIDToModeRequest;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  unsigned __int8 v28;
  unsigned __int8 v29;
  BOOL v30;
  objc_class *v32;
  NSString *v33;
  void *v34;
  void *v35;
  NSString *v36;
  BKDisplayCloneMirrorRequestCache *v37;
  uint64_t v38;
  objc_class *v39;
  NSString *v40;
  void *v41;
  objc_class *v42;
  uint64_t v43;
  NSString *v44;
  void *v45;
  uint64_t v46;
  objc_class *v47;
  NSString *v48;
  void *v49;
  void *v50;
  NSString *v51;
  BKDisplayCloneMirrorRequestCache *v52;
  uint64_t v53;
  objc_class *v54;
  NSString *v55;
  void *v56;
  uint8_t buf[4];
  BKDisplayCloneMirrorRequestCache *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  BKDisplayCloneMirroringManager *v62;
  __int16 v63;
  const __CFString *v64;
  __int16 v65;
  int v66;
  __int16 v67;
  void *v68;

  v9 = a3;
  if (!v9)
  {
    v32 = (objc_class *)objc_opt_class(CAWindowServerDisplay, v10);
    v33 = NSStringFromClass(v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("display"), v34));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v36 = NSStringFromSelector(a2);
      v37 = (BKDisplayCloneMirrorRequestCache *)objc_claimAutoreleasedReturnValue(v36);
      v39 = (objc_class *)objc_opt_class(self, v38);
      v40 = NSStringFromClass(v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      *(_DWORD *)buf = 138544642;
      v58 = v37;
      v59 = 2114;
      v60 = v41;
      v61 = 2048;
      v62 = self;
      v63 = 2114;
      v64 = CFSTR("BKDisplayCloneMirroringManager.m");
      v65 = 1024;
      v66 = 324;
      v67 = 2114;
      v68 = v35;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v35), "UTF8String"));
    __break(0);
    JUMPOUT(0x10006F980);
  }
  v11 = v9;
  v12 = objc_opt_class(CAWindowServerDisplay, v10);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
  {
    v42 = (objc_class *)objc_msgSend(v11, "classForCoder");
    if (!v42)
      v42 = (objc_class *)objc_opt_class(v11, v43);
    v44 = NSStringFromClass(v42);
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    v47 = (objc_class *)objc_opt_class(CAWindowServerDisplay, v46);
    v48 = NSStringFromClass(v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("display"), v45, v49));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v51 = NSStringFromSelector(a2);
      v52 = (BKDisplayCloneMirrorRequestCache *)objc_claimAutoreleasedReturnValue(v51);
      v54 = (objc_class *)objc_opt_class(self, v53);
      v55 = NSStringFromClass(v54);
      v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
      *(_DWORD *)buf = 138544642;
      v58 = v52;
      v59 = 2114;
      v60 = v56;
      v61 = 2048;
      v62 = self;
      v63 = 2114;
      v64 = CFSTR("BKDisplayCloneMirroringManager.m");
      v65 = 1024;
      v66 = 324;
      v67 = 2114;
      v68 = v50;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v50), "UTF8String"));
    __break(0);
    JUMPOUT(0x10006FABCLL);
  }

  v13 = objc_alloc_init((Class)NSMutableDictionary);
  v14 = (BKDisplayCloneMirrorRequestCache *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "virtualDisplayMode"));
  v15 = v14;
  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayCloneMirrorRequestCache objectForKey:](v14, "objectForKey:", CFSTR("DisplayLabel")));
    if (v16)
    {
      objc_msgSend(v13, "setObject:forKey:", v16, CFSTR("DisplayLabel"));
    }
    else
    {
      v17 = BKLogDisplay(0);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v58 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "no label for mode: %{public}@", buf, 0xCu);
      }

    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueId"));
  v20 = v19;
  lock_cloneMirrorRequests = self->_lock_cloneMirrorRequests;
  if (!lock_cloneMirrorRequests)
    goto LABEL_34;
  p_lock = &lock_cloneMirrorRequests->_lock;
  v23 = v19;
  os_unfair_lock_lock(&lock_cloneMirrorRequests->_lock);
  lock_cloneMirrorRequests = (BKDisplayCloneMirrorRequestCache *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](lock_cloneMirrorRequests->_displayUUIDToModeRequest, "objectForKey:", v23));

  if (!lock_cloneMirrorRequests)
  {
    objc_opt_self(BKDisplayCloneMirrorRequestClient);
    if (qword_100117340 != -1)
      dispatch_once(&qword_100117340, &stru_1000EAB60);
    lock_cloneMirrorRequests = (BKDisplayCloneMirrorRequestCache *)(id)qword_100117338;
  }
  os_unfair_lock_unlock(p_lock);
  if (lock_cloneMirrorRequests)
    displayUUIDToModeRequest = lock_cloneMirrorRequests->_displayUUIDToModeRequest;
  else
LABEL_34:
    displayUUIDToModeRequest = 0;
  v25 = BKLogDisplay(v19);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v58 = lock_cloneMirrorRequests;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Prevailing clone mirror mode: %{public}@ ", buf, 0xCu);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](BKSDefaults, "localDefaults"));
  v28 = objc_msgSend(v27, "disableCloneMirroring");
  if (displayUUIDToModeRequest == (NSMutableDictionary *)1)
    v29 = 1;
  else
    v29 = objc_msgSend(v27, "forceCloneMirroring");
  if (displayUUIDToModeRequest == (NSMutableDictionary *)2)
    v30 = 1;
  else
    v30 = v28;
  *a4 = v29;
  *a5 = v30;

  return v13;
}

- (void)_lock_recomputeTagsForDisplay:(id)a3 shouldHide:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;

  v4 = a4;
  v5 = a3;
  v6 = (unint64_t)objc_msgSend(v5, "tag");
  v7 = v6 & 0xFFFFFFFFFFFFFFFALL | v4 | (4 * ((v6 & 0xF8) == 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("TVOut"));

  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults externalDefaults](BKSDefaults, "externalDefaults"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "iapDefaults"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "videoTVOutReservedForIPodOut"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "videoTVOutReservedForRemoteUI"));
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("Yes")))
    {
      v7 = v7 & 0xFFFFFFFFFFFFFFE5 | 0xA;
    }
    else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Yes")))
    {
      v7 = v7 & 0xFFFFFFFFFFFFFFE5 | 0x12;
    }
    else
    {
      v7 = v7 & 0xFFFFFFFFFFFFFFE5 | 2;
    }

  }
  v15 = BKLogDisplay(v10);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = NSStringFromBKSDisplayTags(v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = 138543618;
    v20 = v5;
    v21 = 2114;
    v22 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "tagging %{public}@ with %{public}@", (uint8_t *)&v19, 0x16u);

  }
  objc_msgSend(v5, "setTag:", v7);

}

- (void)_lock_removeDisplayCloneDestination:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cloneMaster"));
  if (v4)
    -[BKDisplayCloneMirroringManager _lock_removeClone:fromWindowServerDisplay:](self, "_lock_removeClone:fromWindowServerDisplay:", v5, v4);

}

- (void)_lock_removeClone:(id)a3 fromWindowServerDisplay:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  if (v6 && v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v6, "displayId")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_lock_destinationDisplayIdentifierToCloneRecord, "objectForKey:", v8));
    -[NSMutableDictionary removeObjectForKey:](self->_lock_destinationDisplayIdentifierToCloneRecord, "removeObjectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "clones"));
    v11 = objc_msgSend(v10, "containsObject:", v6);

    if (v11)
    {
      v13 = BKLogDisplay(v12);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      v15 = v14;
      if (v9)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138543618;
          v19 = v6;
          v20 = 2114;
          v21 = v7;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Removing clone %{public}@ from %{public}@", (uint8_t *)&v18, 0x16u);
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v18 = 138543618;
        v19 = v6;
        v20 = 2114;
        v21 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Display %{public}@ cloning from %{public}@, but we're missing a record of the clone", (uint8_t *)&v18, 0x16u);
      }

      objc_msgSend(v7, "removeClone:", v6);
    }
    else if (v9)
    {
      v16 = BKLogDisplay(v12);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = 138543618;
        v19 = v6;
        v20 = 2114;
        v21 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Clone missing: expected to see %{public}@ cloning from %{public}@", (uint8_t *)&v18, 0x16u);
      }

    }
  }

}

- (void)_lock_clearWindowServerDisplayTags:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  id v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "tag");
  if (v4)
  {
    v5 = BKLogDisplay(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Untagging %{public}@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(v3, "setTag:", 0);
    objc_msgSend(v3, "setTracksCarPlayRegions:", 0);
  }

}

- (void)_lock_evaluateDisplay:(id)a3 reason:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (-[BKDisplayCloneMirroringManagerInformationProvider displayIsConnected:](self->_displayProvider, "displayIsConnected:", v7))
  {
    -[BKDisplayCloneMirroringManager _lock_evaluateConnectedDisplay:because:](self, "_lock_evaluateConnectedDisplay:because:", v7, v6);
  }
  else
  {
    -[BKDisplayCloneMirroringManager _lock_removeDisplayCloneDestination:](self, "_lock_removeDisplayCloneDestination:", v7);
    objc_msgSend(v7, "setProcessId:", 0);
    -[BKDisplayCloneMirroringManager _lock_clearWindowServerDisplayTags:](self, "_lock_clearWindowServerDisplayTags:", v7);
  }

}

- (void)_lock_evaluateAllDisplaysForReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayCloneMirroringManagerInformationProvider windowServerDisplays](self->_displayProvider, "windowServerDisplays"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  if (v6)
  {
    v14 = v6;
    v15 = v5;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          if (-[BKDisplayCloneMirroringManagerInformationProvider supportCloningToDisplay:](self->_displayProvider, "supportCloningToDisplay:", v12))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("updateClonedDisplaysForSettingsChange(%@)"), v4));
            -[BKDisplayCloneMirroringManager _lock_evaluateDisplay:reason:](self, "_lock_evaluateDisplay:reason:", v12, v13);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    v6 = v14;
    v5 = v15;
  }

}

- (void)_lock_evaluateExistingClonesForReason:(id)a3
{
  id v4;
  NSMutableDictionary *lock_destinationDisplayIdentifierToCloneRecord;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  lock_destinationDisplayIdentifierToCloneRecord = self->_lock_destinationDisplayIdentifierToCloneRecord;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100070ED0;
  v7[3] = &unk_1000EBC60;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](lock_destinationDisplayIdentifierToCloneRecord, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)cloneMirroringRequestsDidChange
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BKDisplayCloneMirroringManager _lock_evaluateAllDisplaysForReason:](self, "_lock_evaluateAllDisplaysForReason:", CFSTR("cloneMirroringRequestsDidChange"));
  os_unfair_lock_unlock(p_lock);
}

- (void)setCloneRotationDisabled:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  void *v6;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_cloneRotationDisabled != v3)
  {
    self->_lock_cloneRotationDisabled = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setCloneRotationDisabled:%d"), v3));
    -[BKDisplayCloneMirroringManager _lock_evaluateExistingClonesForReason:](self, "_lock_evaluateExistingClonesForReason:", v6);

  }
  os_unfair_lock_unlock(p_lock);
}

- (void)evaluateDisplay:(id)a3 reason:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  NSString *v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  objc_class *v21;
  uint64_t v22;
  NSString *v23;
  void *v24;
  uint64_t v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  void *v29;
  NSString *v30;
  void *v31;
  uint64_t v32;
  objc_class *v33;
  NSString *v34;
  void *v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  BKDisplayCloneMirroringManager *v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  void *v48;

  v7 = a3;
  v8 = a4;
  v36 = v7;
  if (!v36)
  {
    v11 = (objc_class *)objc_opt_class(CAWindowServerDisplay, v9);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("display"), v13));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v15 = NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v18 = (objc_class *)objc_opt_class(self, v17);
      v19 = NSStringFromClass(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138544642;
      v38 = v16;
      v39 = 2114;
      v40 = v20;
      v41 = 2048;
      v42 = self;
      v43 = 2114;
      v44 = CFSTR("BKDisplayCloneMirroringManager.m");
      v45 = 1024;
      v46 = 489;
      v47 = 2114;
      v48 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
    __break(0);
    JUMPOUT(0x100070510);
  }
  v10 = objc_opt_class(CAWindowServerDisplay, v9);
  if ((objc_opt_isKindOfClass(v36, v10) & 1) == 0)
  {
    v21 = (objc_class *)objc_msgSend(v36, "classForCoder");
    if (!v21)
      v21 = (objc_class *)objc_opt_class(v36, v22);
    v23 = NSStringFromClass(v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v26 = (objc_class *)objc_opt_class(CAWindowServerDisplay, v25);
    v27 = NSStringFromClass(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("display"), v24, v28));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v30 = NSStringFromSelector(a2);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v33 = (objc_class *)objc_opt_class(self, v32);
      v34 = NSStringFromClass(v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      *(_DWORD *)buf = 138544642;
      v38 = v31;
      v39 = 2114;
      v40 = v35;
      v41 = 2048;
      v42 = self;
      v43 = 2114;
      v44 = CFSTR("BKDisplayCloneMirroringManager.m");
      v45 = 1024;
      v46 = 489;
      v47 = 2114;
      v48 = v29;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v29), "UTF8String"));
    __break(0);
    JUMPOUT(0x10007064CLL);
  }

  os_unfair_lock_lock(&self->_lock);
  -[BKDisplayCloneMirroringManager _lock_evaluateDisplay:reason:](self, "_lock_evaluateDisplay:reason:", v36, v8);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeDisplay:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSString *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  objc_class *v17;
  uint64_t v18;
  NSString *v19;
  void *v20;
  uint64_t v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  void *v25;
  NSString *v26;
  void *v27;
  uint64_t v28;
  objc_class *v29;
  NSString *v30;
  void *v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  BKDisplayCloneMirroringManager *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;

  v32 = a3;
  if (!v32)
  {
    v7 = (objc_class *)objc_opt_class(CAWindowServerDisplay, v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("display"), v9));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v11 = NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v14 = (objc_class *)objc_opt_class(self, v13);
      v15 = NSStringFromClass(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      *(_DWORD *)buf = 138544642;
      v34 = v12;
      v35 = 2114;
      v36 = v16;
      v37 = 2048;
      v38 = self;
      v39 = 2114;
      v40 = CFSTR("BKDisplayCloneMirroringManager.m");
      v41 = 1024;
      v42 = 497;
      v43 = 2114;
      v44 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
    __break(0);
    JUMPOUT(0x10007082CLL);
  }
  v6 = objc_opt_class(CAWindowServerDisplay, v5);
  if ((objc_opt_isKindOfClass(v32, v6) & 1) == 0)
  {
    v17 = (objc_class *)objc_msgSend(v32, "classForCoder");
    if (!v17)
      v17 = (objc_class *)objc_opt_class(v32, v18);
    v19 = NSStringFromClass(v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v22 = (objc_class *)objc_opt_class(CAWindowServerDisplay, v21);
    v23 = NSStringFromClass(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("display"), v20, v24));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v26 = NSStringFromSelector(a2);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v29 = (objc_class *)objc_opt_class(self, v28);
      v30 = NSStringFromClass(v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      *(_DWORD *)buf = 138544642;
      v34 = v27;
      v35 = 2114;
      v36 = v31;
      v37 = 2048;
      v38 = self;
      v39 = 2114;
      v40 = CFSTR("BKDisplayCloneMirroringManager.m");
      v41 = 1024;
      v42 = 497;
      v43 = 2114;
      v44 = v25;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v25), "UTF8String"));
    __break(0);
    JUMPOUT(0x100070968);
  }

  os_unfair_lock_lock(&self->_lock);
  -[BKDisplayCloneMirroringManager _lock_removeDisplayCloneDestination:](self, "_lock_removeDisplayCloneDestination:", v32);
  -[BKDisplayCloneMirroringManager _lock_clearWindowServerDisplayTags:](self, "_lock_clearWindowServerDisplayTags:", v32);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)addModeRequest:(unint64_t)a3 forDisplay:(id)a4 clientPID:(int)a5
{
  uint64_t v5;
  BKDisplayCloneMirroringManager *v8;
  os_unfair_lock_s *p_lock;
  id v10;
  BKDisplayCloneMirrorRequestCache *lock_cloneMirrorRequests;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  BKDisplayCloneMirroringManager *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  BKDisplayCloneMirrorRequestClient *v21;
  BKDisplayCloneMirrorRequestClient *v22;
  NSMutableDictionary *v23;
  NSMutableDictionary *displayUUIDToModeRequest;
  NSMutableDictionary *v25;
  NSMutableDictionary *pidToRequests;
  NSMutableOrderedSet *v27;
  NSMutableOrderedSet *modeRequestsInOrder;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  os_unfair_lock_s *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  BKDisplayCloneMirrorRequestClient *v40;
  NSMutableDictionary *v41;
  BKDisplayCloneMirroringManager *v42;
  void *v43;
  _BYTE buf[12];
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;

  v5 = *(_QWORD *)&a5;
  v8 = self;
  p_lock = &self->_lock;
  v10 = a4;
  os_unfair_lock_lock(p_lock);
  lock_cloneMirrorRequests = v8->_lock_cloneMirrorRequests;
  v12 = v10;
  v13 = v12;
  if (lock_cloneMirrorRequests)
  {
    v14 = BKLogDisplay(v12);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = NSStringFromBKSDisplayServicesCloneMirroringMode(a3);
      v17 = v8;
      v18 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v19 = BSProcessDescriptionForPID(v5);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v18;
      v45 = 2114;
      v46 = v13;
      v47 = 2114;
      v48 = v20;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "clone mirror mode request:%{public}@ destinationDisplay:%{public}@ from process:%{public}@", buf, 0x20u);

      v8 = v17;
    }

    os_unfair_lock_lock(&lock_cloneMirrorRequests->_lock);
    v21 = objc_alloc_init(BKDisplayCloneMirrorRequestClient);
    v22 = v21;
    if (v21)
    {
      v21->_pid = v5;
      objc_storeStrong((id *)&v21->_displayUUID, a4);
      v22->_mode = a3;
    }
    if (!lock_cloneMirrorRequests->_displayUUIDToModeRequest)
    {
      v23 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      displayUUIDToModeRequest = lock_cloneMirrorRequests->_displayUUIDToModeRequest;
      lock_cloneMirrorRequests->_displayUUIDToModeRequest = v23;

      v25 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      pidToRequests = lock_cloneMirrorRequests->_pidToRequests;
      lock_cloneMirrorRequests->_pidToRequests = v25;

      v27 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
      modeRequestsInOrder = lock_cloneMirrorRequests->_modeRequestsInOrder;
      lock_cloneMirrorRequests->_modeRequestsInOrder = v27;

    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](lock_cloneMirrorRequests->_pidToRequests, "objectForKey:", v29));
    v31 = v30;
    if (v30)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", v13));
      -[NSMutableOrderedSet removeObject:](lock_cloneMirrorRequests->_modeRequestsInOrder, "removeObject:", v32);
      objc_msgSend(v31, "setObject:forKey:", v22, v13);

    }
    else
    {
      v41 = lock_cloneMirrorRequests->_pidToRequests;
      v33 = objc_alloc((Class)NSMutableDictionary);
      *(_QWORD *)buf = v22;
      v42 = v8;
      v34 = p_lock;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", buf, 1));
      v43 = v13;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v43, 1));
      v37 = objc_msgSend(v33, "initWithObjects:forKeys:", v35, v36);
      -[NSMutableDictionary setObject:forKey:](v41, "setObject:forKey:", v37, v29);

      p_lock = v34;
      v8 = v42;
      -[BKDisplayCloneMirrorRequestCache _lock_addDeathWatcherForPid:](lock_cloneMirrorRequests, "_lock_addDeathWatcherForPid:", v5);
    }
    -[NSMutableOrderedSet addObject:](lock_cloneMirrorRequests->_modeRequestsInOrder, "addObject:", v22, v41);
    v38 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](lock_cloneMirrorRequests->_displayUUIDToModeRequest, "objectForKey:", v13));
    v39 = (void *)v38;
    if (!v38 || *(_DWORD *)(v38 + 8) == (_DWORD)v5)
    {
      v40 = v22;

      -[NSMutableDictionary setObject:forKey:](lock_cloneMirrorRequests->_displayUUIDToModeRequest, "setObject:forKey:", v40, v13);
      v39 = v40;
    }
    os_unfair_lock_unlock(&lock_cloneMirrorRequests->_lock);

  }
  -[BKDisplayCloneMirroringManager _lock_evaluateAllDisplaysForReason:](v8, "_lock_evaluateAllDisplaysForReason:", CFSTR("addModeRequest"));
  os_unfair_lock_unlock(p_lock);
}

- (void)removeModeRequestForDisplay:(id)a3 clientPID:(int)a4
{
  uint64_t v4;
  os_unfair_lock_s *p_lock;
  id v7;
  BKDisplayCloneMirrorRequestCache *lock_cloneMirrorRequests;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;

  v4 = *(_QWORD *)&a4;
  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  lock_cloneMirrorRequests = self->_lock_cloneMirrorRequests;
  v9 = v7;
  v10 = v9;
  if (lock_cloneMirrorRequests)
  {
    v11 = BKLogDisplay(v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = BSProcessDescriptionForPID(v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v19 = 138543618;
      v20 = v10;
      v21 = 2114;
      v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "clone mirror mode remove for destinationDisplay:%{public}@ from process:%{public}@", (uint8_t *)&v19, 0x16u);

    }
    os_unfair_lock_lock(&lock_cloneMirrorRequests->_lock);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](lock_cloneMirrorRequests->_pidToRequests, "objectForKey:", v15));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", v10));
    if (v17)
    {
      -[NSMutableOrderedSet removeObject:](lock_cloneMirrorRequests->_modeRequestsInOrder, "removeObject:", v17);
      objc_msgSend(v16, "removeObjectForKey:", v10);
    }
    if (!objc_msgSend(v16, "count"))
    {
      -[NSMutableDictionary removeObjectForKey:](lock_cloneMirrorRequests->_pidToRequests, "removeObjectForKey:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](lock_cloneMirrorRequests->_pidToDeathWatcher, "objectForKey:", v15));
      objc_msgSend(v18, "invalidate");

      -[NSMutableDictionary removeObjectForKey:](lock_cloneMirrorRequests->_pidToDeathWatcher, "removeObjectForKey:", v15);
    }
    -[BKDisplayCloneMirrorRequestCache _lock_rebuildModeCache](lock_cloneMirrorRequests, "_lock_rebuildModeCache");
    os_unfair_lock_unlock(&lock_cloneMirrorRequests->_lock);

  }
  -[BKDisplayCloneMirroringManager _lock_evaluateAllDisplaysForReason:](self, "_lock_evaluateAllDisplaysForReason:", CFSTR("removeModeRequest"));
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_destinationDisplayIdentifierToCloneRecord, 0);
  objc_storeStrong((id *)&self->_lock_cloneMirrorRequests, 0);
  objc_storeStrong((id *)&self->_displayProvider, 0);
}

@end
