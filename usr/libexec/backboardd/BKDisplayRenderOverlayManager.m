@implementation BKDisplayRenderOverlayManager

- (id)_initWithPersistenceCoordinator:(id)a3 orientationManager:(id)a4 backlightManager:(id)a5 windowServer:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BKDisplayRenderOverlayManager *v15;
  BKDisplayRenderOverlayManager *v16;
  NSMutableSet *v17;
  NSMutableSet *activeOverlays;
  void *v19;
  void *v20;
  uint64_t v21;
  NSMutableSet *overlaysDisablingUpdates;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v29;
  NSString *v30;
  void *v31;
  uint64_t v32;
  objc_class *v33;
  NSString *v34;
  void *v35;
  void *v36;
  NSString *v37;
  void *v38;
  uint64_t v39;
  objc_class *v40;
  NSString *v41;
  void *v42;
  void *v43;
  NSString *v44;
  void *v45;
  uint64_t v46;
  objc_class *v47;
  NSString *v48;
  void *v49;
  void *v50;
  NSString *v51;
  void *v52;
  uint64_t v53;
  objc_class *v54;
  NSString *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  objc_super v61;
  uint8_t v62[128];
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  BKDisplayRenderOverlayManager *v68;
  __int16 v69;
  const __CFString *v70;
  __int16 v71;
  int v72;
  __int16 v73;
  void *v74;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v61.receiver = self;
  v61.super_class = (Class)BKDisplayRenderOverlayManager;
  v15 = -[BKDisplayRenderOverlayManager init](&v61, "init");
  v16 = v15;
  if (v15)
  {
    if (!v14)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("windowServer")));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v30 = NSStringFromSelector(a2);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        v33 = (objc_class *)objc_opt_class(v16, v32);
        v34 = NSStringFromClass(v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        *(_DWORD *)buf = 138544642;
        v64 = v31;
        v65 = 2114;
        v66 = v35;
        v67 = 2048;
        v68 = v16;
        v69 = 2114;
        v70 = CFSTR("BKDisplayRenderOverlayManager.m");
        v71 = 1024;
        v72 = 55;
        v73 = 2114;
        v74 = v29;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v29), "UTF8String"));
      __break(0);
      JUMPOUT(0x10008F380);
    }
    if (!v13)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("backlightManager")));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v37 = NSStringFromSelector(a2);
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        v40 = (objc_class *)objc_opt_class(v16, v39);
        v41 = NSStringFromClass(v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        *(_DWORD *)buf = 138544642;
        v64 = v38;
        v65 = 2114;
        v66 = v42;
        v67 = 2048;
        v68 = v16;
        v69 = 2114;
        v70 = CFSTR("BKDisplayRenderOverlayManager.m");
        v71 = 1024;
        v72 = 56;
        v73 = 2114;
        v74 = v36;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v36), "UTF8String"));
      __break(0);
      JUMPOUT(0x10008F478);
    }
    if (!v12)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("orientationManager")));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v44 = NSStringFromSelector(a2);
        v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
        v47 = (objc_class *)objc_opt_class(v16, v46);
        v48 = NSStringFromClass(v47);
        v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
        *(_DWORD *)buf = 138544642;
        v64 = v45;
        v65 = 2114;
        v66 = v49;
        v67 = 2048;
        v68 = v16;
        v69 = 2114;
        v70 = CFSTR("BKDisplayRenderOverlayManager.m");
        v71 = 1024;
        v72 = 57;
        v73 = 2114;
        v74 = v43;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v43), "UTF8String"));
      __break(0);
      JUMPOUT(0x10008F570);
    }
    if (!v11)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("persistenceCoordinator")));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v51 = NSStringFromSelector(a2);
        v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
        v54 = (objc_class *)objc_opt_class(v16, v53);
        v55 = NSStringFromClass(v54);
        v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
        *(_DWORD *)buf = 138544642;
        v64 = v52;
        v65 = 2114;
        v66 = v56;
        v67 = 2048;
        v68 = v16;
        v69 = 2114;
        v70 = CFSTR("BKDisplayRenderOverlayManager.m");
        v71 = 1024;
        v72 = 58;
        v73 = 2114;
        v74 = v50;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v50), "UTF8String"));
      __break(0);
      JUMPOUT(0x10008F668);
    }
    objc_storeStrong((id *)&v15->_windowServer, a6);
    objc_storeStrong((id *)&v16->_orientationManager, a4);
    objc_storeStrong((id *)&v16->_backlightManager, a5);
    v17 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    activeOverlays = v16->_activeOverlays;
    v16->_activeOverlays = v17;

    v16->_lock._os_unfair_lock_opaque = 0;
    v16->_lockedOrientation = 0;
    v16->_backlightLocked = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rebuildPersistentOverlays"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v19));

    v21 = objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlayManager _updateWindowServerUpdatesForOverlays:](v16, "_updateWindowServerUpdatesForOverlays:", v20));
    overlaysDisablingUpdates = v16->_overlaysDisablingUpdates;
    v16->_overlaysDisablingUpdates = (NSMutableSet *)v21;

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v23 = v20;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v58;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v58 != v26)
            objc_enumerationMutation(v23);
          -[BKDisplayRenderOverlayManager applyOverlay:withAnimationSettings:](v16, "applyOverlay:withAnimationSettings:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)v27), 0);
          v27 = (char *)v27 + 1;
        }
        while (v25 != v27);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      }
      while (v25);
    }

  }
  return v16;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = objc_msgSend(v3, "appendObject:withName:", self->_activeOverlays, CFSTR("activeOverlays"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return v5;
}

- (id)activeOverlayWithDescriptor:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableSet *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_activeOverlays;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "descriptor", (_QWORD)v14));
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (NSMutableSet)activeOverlays
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NSMutableSet copy](self->_activeOverlays, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSMutableSet *)v4;
}

- (BOOL)applyOverlay:(id)a3 withAnimationSettings:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v8 = objc_msgSend(v6, "presentWithAnimationSettings:", v7);

  if (v8)
  {
    -[NSMutableSet addObject:](self->_activeOverlays, "addObject:", v6);
    -[BKDisplayRenderOverlayManager _lock_updateStateForActiveOverlayChange](self, "_lock_updateStateForActiveOverlayChange");
  }
  os_unfair_lock_unlock(&self->_lock);

  return v8;
}

- (BOOL)removeOverlay:(id)a3 withAnimationSettings:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v8 = -[NSMutableSet containsObject:](self->_activeOverlays, "containsObject:", v6);
  if (v8)
  {
    objc_msgSend(v6, "dismissWithAnimationSettings:", v7);
    -[NSMutableSet removeObject:](self->_activeOverlays, "removeObject:", v6);
    -[NSMutableSet removeObject:](self->_overlaysDisablingUpdates, "removeObject:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlayManager _updateWindowServerUpdatesForOverlays:](self, "_updateWindowServerUpdatesForOverlays:", self->_overlaysDisablingUpdates));
    -[BKDisplayRenderOverlayManager _lock_setOverlaysDisablingUpdates:](self, "_lock_setOverlaysDisablingUpdates:", v9);

    -[BKDisplayRenderOverlayManager _lock_updateStateForActiveOverlayChange](self, "_lock_updateStateForActiveOverlayChange");
  }
  os_unfair_lock_unlock(&self->_lock);

  return v8;
}

- (BOOL)freezeOverlay:(id)a3
{
  id v4;
  unsigned int v5;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = -[NSMutableSet containsObject:](self->_activeOverlays, "containsObject:", v4);
  if (v5)
    -[BKDisplayRenderOverlayManager _lock_freezeOverlay:](self, "_lock_freezeOverlay:", v4);
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (void)prepareForRestart
{
  os_unfair_lock_s *p_lock;
  NSMutableSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_activeOverlays;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[BKDisplayRenderOverlayManager _lock_freezeOverlay:](self, "_lock_freezeOverlay:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isShowingNonBootUIOverlays
{
  os_unfair_lock_s *p_lock;
  NSMutableSet *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_activeOverlays;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "type", (_QWORD)v10) != (id)2 && objc_msgSend(v8, "type") != (id)3)
        {
          LOBYTE(v5) = 1;
          goto LABEL_12;
        }
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

  os_unfair_lock_unlock(p_lock);
  return (char)v5;
}

- (void)_lock_setOverlaysDisablingUpdates:(id)a3
{
  NSMutableSet **p_overlaysDisablingUpdates;
  NSMutableSet *overlaysDisablingUpdates;
  NSMutableSet *v7;

  v7 = (NSMutableSet *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  overlaysDisablingUpdates = self->_overlaysDisablingUpdates;
  p_overlaysDisablingUpdates = &self->_overlaysDisablingUpdates;
  if (overlaysDisablingUpdates != v7)
    objc_storeStrong((id *)p_overlaysDisablingUpdates, a3);

}

- (void)_lock_freezeOverlay:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  NSMutableIndexSet *frozenDisplayIDs;
  NSMutableIndexSet *v14;
  NSMutableIndexSet *v15;
  id v16;
  NSObject *v17;
  int v18;
  _QWORD v19[2];

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = objc_msgSend(v4, "isFrozen");
  v6 = sub_100059A88();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if ((v5 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v18 = 138543362;
      v19[0] = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Requested freezing of an already frozen overlay; ignoring freeze request for overlay:%{public}@",
        (uint8_t *)&v18,
        0xCu);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138543362;
    v19[0] = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Freezing overlay:%{public}@", (uint8_t *)&v18, 0xCu);
  }

  objc_msgSend(v4, "freeze");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlayManager _updateWindowServerUpdatesForOverlays:](self, "_updateWindowServerUpdatesForOverlays:", self->_overlaysDisablingUpdates));
  -[BKDisplayRenderOverlayManager _lock_setOverlaysDisablingUpdates:](self, "_lock_setOverlaysDisablingUpdates:", v9);

  if (objc_msgSend(v4, "disablesDisplayUpdates"))
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "display"));
    v10 = -[NSObject displayId](v8, "displayId");
    if ((-[NSMutableIndexSet containsIndex:](self->_frozenDisplayIDs, "containsIndex:", v10) & 1) != 0)
    {
      v11 = sub_100059A88();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v18 = 67109378;
        LODWORD(v19[0]) = (_DWORD)v10;
        WORD2(v19[0]) = 2114;
        *(_QWORD *)((char *)v19 + 6) = v4;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Display %d previously frozen; ignoring freeze request for overlay:%{public}@",
          (uint8_t *)&v18,
          0x12u);
      }
    }
    else
    {
      frozenDisplayIDs = self->_frozenDisplayIDs;
      if (!frozenDisplayIDs)
      {
        v14 = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
        v15 = self->_frozenDisplayIDs;
        self->_frozenDisplayIDs = v14;

        frozenDisplayIDs = self->_frozenDisplayIDs;
      }
      -[NSMutableIndexSet addIndex:](frozenDisplayIDs, "addIndex:", v10);
      v12 = objc_claimAutoreleasedReturnValue(-[CAWindowServer displayWithDisplayId:](self->_windowServer, "displayWithDisplayId:", v10));
      if (v12)
      {
        v16 = sub_100059A88();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138543362;
          v19[0] = v12;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Freezing display: %{public}@", (uint8_t *)&v18, 0xCu);
        }

        -[NSObject freeze](v12, "freeze");
      }
    }

    goto LABEL_17;
  }
LABEL_18:

}

- (void)_lock_updateStateForActiveOverlayChange
{
  NSMutableSet *v3;
  id v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  BKDisplayRenderOverlayManager *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];

  os_unfair_lock_assert_owner(&self->_lock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v14 = self;
  v3 = self->_activeOverlays;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (BSInterfaceOrientationIsValid(objc_msgSend(v10, "interfaceOrientation")))
        {
          if (BSInterfaceOrientationIsValid(v7) && v7 != objc_msgSend(v10, "interfaceOrientation"))
          {
            v11 = sub_100059A88();
            v12 = objc_claimAutoreleasedReturnValue(v11);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "succinctDescription"));
              *(_DWORD *)buf = 138543362;
              v20 = v13;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Conflicting choices for orientation lock, choosing orientation for this overlay: %{public}@", buf, 0xCu);

            }
          }
          v7 = objc_msgSend(v10, "interfaceOrientation");
        }
        v6 |= objc_msgSend(v10, "lockBacklight");
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
    v7 = 0;
  }

  -[BKDisplayRenderOverlayManager _lock_setLockedOrientation:](v14, "_lock_setLockedOrientation:", v7);
  -[BKDisplayRenderOverlayManager _lock_setBacklightLocked:](v14, "_lock_setBacklightLocked:", v6 & 1);
}

- (void)_lock_setLockedOrientation:(int64_t)a3
{
  int IsValid;
  BKOrientationManager *orientationManager;
  uint64_t v7;

  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_lockedOrientation != a3)
  {
    self->_lockedOrientation = a3;
    IsValid = BSInterfaceOrientationIsValid(a3);
    orientationManager = self->_orientationManager;
    v7 = BSGetVersionedPID();
    if (IsValid)
      sub_10008B4BC((uint64_t)orientationManager, 4, a3, v7);
    else
      sub_10008BA9C((uint64_t)orientationManager, 4, v7);
  }
}

- (void)_lock_setBacklightLocked:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  BKDisplayBrightnessController *backlightManager;
  objc_class *v7;
  NSString *v8;
  id v9;

  v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_backlightLocked != v3)
  {
    self->_backlightLocked = v3;
    backlightManager = self->_backlightManager;
    v7 = (objc_class *)objc_opt_class(self, v5);
    v8 = NSStringFromClass(v7);
    v9 = (id)objc_claimAutoreleasedReturnValue(v8);
    -[BKDisplayBrightnessController setBacklightLocked:forReason:](backlightManager, "setBacklightLocked:forReason:", v3, v9);

  }
}

- (id)_updateWindowServerUpdatesForOverlays:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  CAWindowServer *windowServer;
  void *v15;
  void *v16;
  id v17;
  id v18;
  __int128 v19;
  id v20;
  uint64_t v21;
  void *j;
  void *v23;
  id v24;
  NSObject *v25;
  unsigned int v26;
  id v27;
  id v28;
  __int128 v29;
  id v30;
  uint64_t v31;
  void *k;
  void *v33;
  id v34;
  NSObject *v35;
  unsigned int v36;
  __int128 v38;
  __int128 v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  unsigned int v55;
  _BYTE v56[128];
  _BYTE v57[128];

  v4 = a3;
  v40 = objc_alloc_init((Class)NSMutableSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CAWindowServer displays](self->_windowServer, "displays"));
  v6 = objc_msgSend(v5, "mutableCopy");

  v7 = objc_alloc_init((Class)NSMutableArray);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "disablesDisplayUpdates"))
        {
          windowServer = self->_windowServer;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "display"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[CAWindowServer displayWithDisplayId:](windowServer, "displayWithDisplayId:", objc_msgSend(v15, "displayId")));

          objc_msgSend(v40, "addObject:", v13);
          objc_msgSend(v6, "removeObject:", v16);
          objc_msgSend(v7, "addObject:", v16);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v10);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v17 = v7;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
  if (v18)
  {
    v20 = v18;
    v21 = *(_QWORD *)v46;
    *(_QWORD *)&v19 = 67109120;
    v38 = v19;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(_QWORD *)v46 != v21)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j);
        if ((objc_msgSend(v23, "disablesUpdates", v38) & 1) == 0)
        {
          v24 = sub_100059A88();
          v25 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v26 = objc_msgSend(v23, "displayId");
            *(_DWORD *)buf = v38;
            v55 = v26;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Disabling framebuffer changes on display (%d) because we have overlays that require disabled updates.", buf, 8u);
          }

          objc_msgSend(v23, "setDisablesUpdates:", 1);
        }
      }
      v20 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
    }
    while (v20);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v27 = v6;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
  if (v28)
  {
    v30 = v28;
    v31 = *(_QWORD *)v42;
    *(_QWORD *)&v29 = 67109120;
    v39 = v29;
    do
    {
      for (k = 0; k != v30; k = (char *)k + 1)
      {
        if (*(_QWORD *)v42 != v31)
          objc_enumerationMutation(v27);
        v33 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)k);
        if (objc_msgSend(v33, "disablesUpdates", v39))
        {
          v34 = sub_100059A88();
          v35 = objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            v36 = objc_msgSend(v33, "displayId");
            *(_DWORD *)buf = v39;
            v55 = v36;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Enabling framebuffer changes on display (%d) because we have don't have any overlays that require disabled updates.", buf, 8u);
          }

          objc_msgSend(v33, "setDisablesUpdates:", 0);
        }
      }
      v30 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    }
    while (v30);
  }

  return v40;
}

- (NSMutableSet)overlaysDisablingUpdates
{
  return self->_overlaysDisablingUpdates;
}

- (BOOL)backlightLocked
{
  return self->_backlightLocked;
}

- (int64_t)lockedOrientation
{
  return self->_lockedOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frozenDisplayIDs, 0);
  objc_storeStrong((id *)&self->_overlaysDisablingUpdates, 0);
  objc_storeStrong((id *)&self->_activeOverlays, 0);
  objc_storeStrong((id *)&self->_backlightManager, 0);
  objc_storeStrong((id *)&self->_orientationManager, 0);
  objc_storeStrong((id *)&self->_windowServer, 0);
}

+ (id)sharedInstance
{
  if (qword_1001175F8 != -1)
    dispatch_once(&qword_1001175F8, &stru_1000ECCC8);
  return (id)qword_1001175F0;
}

@end
