@implementation SBAppClipOverlayCoordinator

- (SBAppClipOverlayCoordinator)init
{
  SBAppClipOverlayCoordinator *v2;
  NSMutableSet *v3;
  NSMutableSet *overlayViewControllers;
  uint64_t v5;
  NSMapTable *participantForViewController;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBAppClipOverlayCoordinator;
  v2 = -[SBAppClipOverlayCoordinator init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    overlayViewControllers = v2->_overlayViewControllers;
    v2->_overlayViewControllers = v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    participantForViewController = v2->_participantForViewController;
    v2->_participantForViewController = (NSMapTable *)v5;

  }
  return v2;
}

- (id)overlayViewControllerForBundleIdentifier:(id)a3 webClipIdentifier:(id)a4 participant:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  const char *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "participantName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppClipOverlayCoordinator _existingOverlayViewControllerForWebClipIdentifier:](self, "_existingOverlayViewControllerForWebClipIdentifier:", v10);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[NSMapTable objectForKey:](self->_participantForViewController, "objectForKey:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppClipOverlayCoordinator.m"), 35, CFSTR("We expect to have a particpant for this overlay. Bundle identifier: %@ web clip identifier: %@"), v9, v10);

    }
    SBLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v27 = v9;
      v18 = a2;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "participantName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v29 = v19;
      v30 = 2114;
      v31 = v20;
      v32 = 2050;
      v33 = v14;
      v34 = 2114;
      v35 = v12;
      _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_INFO, "%{public}@ asking participant %{public}@ to relinquish ownership of %{public}p to give to participant: %{public}@", buf, 0x2Au);

      a2 = v18;
      v9 = v27;
    }

    objc_msgSend(v15, "appClipOverlayCoordinator:requestsSurrenderOfViewController:", self, v14);
    if (-[NSMutableSet containsObject:](self->_overlayViewControllers, "containsObject:", v14))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppClipOverlayCoordinator.m"), 41, CFSTR("Participants must relinquish synchronously"));

    }
  }
  else
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10858]), "initWithAppClipBundleID:webClipID:", v9, v10);
  }
  -[NSMutableSet addObject:](self->_overlayViewControllers, "addObject:", v14);
  -[NSMapTable setObject:forKey:](self->_participantForViewController, "setObject:forKey:", v11, v14);

  SBLogCommon();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v23;
    v30 = 2050;
    v31 = v14;
    v32 = 2114;
    v33 = v12;
    _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_INFO, "%{public}@ handing ownership of %{public}p to participant: %{public}@", buf, 0x20u);

  }
  return v14;
}

- (void)participant:(id)a3 didSurrenderViewController:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "participantName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableSet containsObject:](self->_overlayViewControllers, "containsObject:", v7) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppClipOverlayCoordinator.m"), 58, CFSTR("%@ is asking to relinquish a view controller we don't know about %@"), v9, v7);

  }
  -[NSMapTable objectForKey:](self->_participantForViewController, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v8);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppClipOverlayCoordinator.m"), 59, CFSTR("%@ is asking to relinquish a view controller it doesn't own %@"), v9, v7);

  }
  -[NSMutableSet removeObject:](self->_overlayViewControllers, "removeObject:", v7);
  -[NSMapTable removeObjectForKey:](self->_participantForViewController, "removeObjectForKey:", v7);
  SBLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v14;
    v19 = 2114;
    v20 = v9;
    v21 = 2050;
    v22 = v7;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_INFO, "%{public}@ participant: %{public}@ relinquished view controller: %{public}p", buf, 0x20u);

  }
}

- (id)_existingOverlayViewControllerForWebClipIdentifier:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_overlayViewControllers;
  v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "webClipID", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantForViewController, 0);
  objc_storeStrong((id *)&self->_overlayViewControllers, 0);
}

@end
