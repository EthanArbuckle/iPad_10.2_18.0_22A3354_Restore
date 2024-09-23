@implementation SBSceneSnapshotRequestor

- (void)requestSnapshotsForSceneHandle:(id)a3 updatingToNewSettings:(id)a4 withUpdateContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_class *v43;
  void *v44;
  NSObject *v45;
  _BOOL4 v46;
  NSObject *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  int v57;
  NSObject *v58;
  _BOOL4 v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t m;
  void *v64;
  uint64_t v65;
  id v66;
  void *v67;
  id v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  NSMutableSet *v73;
  id v74;
  NSObject *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  int v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  __CFString *v101;
  void *v102;
  _QWORD v104[4];
  NSObject *v105;
  _BYTE *v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _BYTE v123[128];
  uint8_t v124[4];
  uint64_t v125;
  _BYTE v126[128];
  uint8_t v127[128];
  _BYTE buf[24];
  _BYTE v129[28];
  _BYTE v130[128];
  uint64_t v131;
  CGRect v132;

  v131 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v99 = v8;
  if (!v8)
  {
    v86 = v10;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneSnapshotRequestor.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneHandle"));

    v10 = v86;
  }
  v98 = v9;
  if (!v9)
  {
    v88 = v10;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneSnapshotRequestor.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newSettings"));

    v10 = v88;
  }
  v96 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneSnapshotRequestor.m"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateContext"));

  }
  objc_msgSend(v99, "scene");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "application");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "info");
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v97;
  if ((objc_msgSend(v97, "disablesSnapshots") & 1) == 0)
  {
    objc_msgSend(v102, "settings");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v95, "isForeground"))
      v92 = objc_msgSend(v98, "isForeground") ^ 1;
    else
      v92 = 0;
    if ((objc_msgSend(v95, "isForeground") & 1) != 0)
      v13 = 0;
    else
      v13 = objc_msgSend(v98, "isForeground");
    objc_msgSend(v96, "transitionContext");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "watchdogTransitionContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "watchdogBehavior");

    if ((v92 & 1) != 0)
    {
      v16 = CFSTR("we are taking new snapshots");
    }
    else
    {
      if (v15 == 1)
        v17 = 1;
      else
        v17 = v13;
      if (v17 != 1)
      {
LABEL_88:

        v12 = v97;
        goto LABEL_89;
      }
      v16 = CFSTR("(unknown)");
      if (v15 == 1)
        v16 = CFSTR("another scene update with a watchdog is happening");
      if (v13)
        v16 = CFSTR("the scene is moving to the foreground");
    }
    v101 = v16;
    objc_msgSend(v102, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    v19 = (void *)-[NSMutableSet copy](self->_outgoingSnapshots, "copy");
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v119, v130, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v120;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v120 != v21)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * i);
          objc_msgSend(v23, "sceneID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v18, "isEqualToString:", v24);

          if (v25)
          {
            SBLogSceneSnapshots();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              -[SBSceneSnapshotRequestor succinctDescription](self, "succinctDescription");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "identifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = (objc_class *)objc_opt_class();
              NSStringFromClass(v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              *(_QWORD *)&buf[4] = v27;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v28;
              *(_WORD *)&buf[22] = 2114;
              *(_QWORD *)v129 = v30;
              *(_WORD *)&v129[8] = 2050;
              *(_QWORD *)&v129[10] = v23;
              *(_WORD *)&v129[18] = 2114;
              *(_QWORD *)&v129[20] = v101;
              _os_log_debug_impl(&dword_1D0540000, v26, OS_LOG_TYPE_DEBUG, "%{public}@ [%{public}@] Cancelling outgoing snapshot action <%{public}@ %{public}p> because %{public}@", buf, 0x34u);

            }
            objc_msgSend(v23, "invalidate");
            -[NSMutableSet removeObject:](self->_outgoingSnapshots, "removeObject:", v23);
          }
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v119, v130, 16);
      }
      while (v20);
    }

    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    v31 = (void *)-[NSMutableSet copy](self->_incomingSnapshots, "copy");
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v115, v127, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v116;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v116 != v33)
            objc_enumerationMutation(v31);
          v35 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * j);
          objc_msgSend(v35, "context");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "sceneID");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v18, "isEqualToString:", v37);

          if (v38)
          {
            SBLogSceneSnapshots();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
            {
              -[SBSceneSnapshotRequestor succinctDescription](self, "succinctDescription");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "identifier");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = (objc_class *)objc_opt_class();
              NSStringFromClass(v43);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              *(_QWORD *)&buf[4] = v41;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v42;
              *(_WORD *)&buf[22] = 2114;
              *(_QWORD *)v129 = v44;
              *(_WORD *)&v129[8] = 2050;
              *(_QWORD *)&v129[10] = v35;
              *(_WORD *)&v129[18] = 2114;
              *(_QWORD *)&v129[20] = v101;
              _os_log_debug_impl(&dword_1D0540000, v39, OS_LOG_TYPE_DEBUG, "%{public}@ [%{public}@] Cancelling incoming snapshot action <%{public}@ %{public}p> because %{public}@", buf, 0x34u);

            }
            FBSSceneSnapshotActionResponseForErrorCode();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "sendResponse:", v40);

            -[NSMutableSet removeObject:](self->_incomingSnapshots, "removeObject:", v35);
          }
        }
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v115, v127, 16);
      }
      while (v32);
    }

    if (v92)
    {
      -[SBSceneSnapshotRequestor _sceneSnapshotRequestContext](self, "_sceneSnapshotRequestContext");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSceneSnapshotRequestor _sbSceneSnapshotRequestsForSceneHandle:settings:snapshotRequestContext:](self, "_sbSceneSnapshotRequestsForSceneHandle:settings:snapshotRequestContext:", v99, v98, v93);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogSceneSnapshots();
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG);

      if (v46)
      {
        SBLogSceneSnapshots();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          -[SBSceneSnapshotRequestor succinctDescription](self, "succinctDescription");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "identifier");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = objc_msgSend(v100, "count");
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v83;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v84;
          *(_WORD *)&buf[22] = 1026;
          *(_DWORD *)v129 = v85;
          _os_log_debug_impl(&dword_1D0540000, v47, OS_LOG_TYPE_DEBUG, "%{public}@ [%{public}@] Generated %{public}d SB requests", buf, 0x1Cu);

        }
        v113 = 0u;
        v114 = 0u;
        v111 = 0u;
        v112 = 0u;
        v48 = v100;
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v111, v126, 16);
        if (v49)
        {
          v50 = *(_QWORD *)v112;
          do
          {
            for (k = 0; k != v49; ++k)
            {
              if (*(_QWORD *)v112 != v50)
                objc_enumerationMutation(v48);
              v52 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * k);
              SBLogSceneSnapshots();
              v53 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                -[SBSceneSnapshotRequestor requestSnapshotsForSceneHandle:updatingToNewSettings:withUpdateContext:].cold.2(v124, v52, &v125, v53);

            }
            v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v111, v126, 16);
          }
          while (v49);
        }

      }
      if (objc_msgSend(v100, "count"))
      {
        -[SBSceneSnapshotRequestor _fbsSceneSnapshotRequestsFromSBSceneSnapshotRequests:forSceneHandle:settings:snapshotRequestContext:](self, "_fbsSceneSnapshotRequestsFromSBSceneSnapshotRequests:forSceneHandle:settings:snapshotRequestContext:", v100, v99, v98, v93);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        SBLogSceneSnapshots();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          -[SBSceneSnapshotRequestor succinctDescription](self, "succinctDescription");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "identifier");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v91, "count");
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v55;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v56;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)v129 = v57;
          *(_WORD *)&v129[4] = 2112;
          *(_QWORD *)&v129[6] = CFSTR("the scene actually moved to the background");
          _os_log_impl(&dword_1D0540000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Requesting %d snapshot(s) because %@", buf, 0x26u);

        }
        SBLogSceneSnapshots();
        v58 = objc_claimAutoreleasedReturnValue();
        v59 = os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG);

        if (v59)
        {
          v109 = 0u;
          v110 = 0u;
          v107 = 0u;
          v108 = 0u;
          v60 = v91;
          v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v107, v123, 16);
          if (v61)
          {
            v62 = *(_QWORD *)v108;
            do
            {
              for (m = 0; m != v61; ++m)
              {
                if (*(_QWORD *)v108 != v62)
                  objc_enumerationMutation(v60);
                objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * m), "settings");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = objc_opt_class();
                v66 = v64;
                if (v65)
                {
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    v67 = v66;
                  else
                    v67 = 0;
                }
                else
                {
                  v67 = 0;
                }
                v68 = v67;

                SBLogSceneSnapshots();
                v69 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v68, "frame");
                  NSStringFromCGRect(v132);
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v68, "interfaceOrientation");
                  BSInterfaceOrientationDescription();
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v68, "userInterfaceStyle");
                  SBFStringForUIUserInterfaceStyle();
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  *(_QWORD *)&buf[4] = v70;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v71;
                  *(_WORD *)&buf[22] = 2114;
                  *(_QWORD *)v129 = v72;
                  _os_log_debug_impl(&dword_1D0540000, v69, OS_LOG_TYPE_DEBUG, " - frame: %{public}@, interfaceOrientation: %{public}@, user interface style: %{public}@", buf, 0x20u);

                }
              }
              v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v107, v123, 16);
            }
            while (v61);
          }

        }
        if (v94)
        {
          v73 = self->_outgoingSnapshots;
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          *(_QWORD *)v129 = __Block_byref_object_copy__39;
          *(_QWORD *)&v129[8] = __Block_byref_object_dispose__39;
          *(_QWORD *)&v129[16] = 0;
          v74 = objc_alloc(MEMORY[0x1E0D22978]);
          v104[0] = MEMORY[0x1E0C809B0];
          v104[1] = 3221225472;
          v104[2] = __99__SBSceneSnapshotRequestor_requestSnapshotsForSceneHandle_updatingToNewSettings_withUpdateContext___block_invoke;
          v104[3] = &unk_1E8EAB8E0;
          v75 = v73;
          v105 = v75;
          v106 = buf;
          v76 = objc_msgSend(v74, "initWithScene:requests:expirationInterval:responseHandler:", v102, v91, v104, 5.0);
          v77 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v76;

          -[NSMutableSet addObject:](self->_outgoingSnapshots, "addObject:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
          objc_msgSend(v94, "actions");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = v78;
          if (v78)
          {
            v80 = v78;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E60], "set");
            v80 = (id)objc_claimAutoreleasedReturnValue();
          }
          v81 = v80;

          objc_msgSend(v81, "setByAddingObject:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "setActions:", v82);

          _Block_object_dispose(buf, 8);
        }
        else
        {
          SBLogSceneSnapshots();
          v75 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
            -[SBSceneSnapshotRequestor requestSnapshotsForSceneHandle:updatingToNewSettings:withUpdateContext:].cold.1(self, v102, v75);
        }

      }
    }
    goto LABEL_88;
  }
LABEL_89:

}

- (id)preventTakingSupplementalSnapshotsForBackgroundingScenesWithReason:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSHashTable *preventSupplementalSnapshotsAssertions;
  NSHashTable *v10;
  NSHashTable *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0D01868]);
  v6 = MEMORY[0x1E0C80D38];
  v7 = MEMORY[0x1E0C80D38];
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __95__SBSceneSnapshotRequestor_preventTakingSupplementalSnapshotsForBackgroundingScenesWithReason___block_invoke;
  v16 = &unk_1E8E9E468;
  objc_copyWeak(&v17, &location);
  v8 = (void *)objc_msgSend(v5, "initWithIdentifier:forReason:queue:invalidationBlock:", CFSTR("SBSceneSnapshotRequestor.PreventSupplementalSnapshots"), v4, v6, &v13);

  preventSupplementalSnapshotsAssertions = self->_preventSupplementalSnapshotsAssertions;
  if (!preventSupplementalSnapshotsAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable", v13, v14, v15, v16);
    v10 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v11 = self->_preventSupplementalSnapshotsAssertions;
    self->_preventSupplementalSnapshotsAssertions = v10;

    preventSupplementalSnapshotsAssertions = self->_preventSupplementalSnapshotsAssertions;
  }
  -[NSHashTable addObject:](preventSupplementalSnapshotsAssertions, "addObject:", v8, v13, v14, v15, v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v8;
}

void __95__SBSceneSnapshotRequestor_preventTakingSupplementalSnapshotsForBackgroundingScenesWithReason___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  _QWORD *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = *((id *)WeakRetained + 3);
    objc_msgSend(v5, "removeObject:", v7);
    if (!objc_msgSend(v5, "count"))
    {
      v6 = (void *)v4[3];
      v4[3] = 0;

    }
  }

}

- (SBSceneSnapshotRequestor)initWithDelegate:(id)a3
{
  id v4;
  SBSceneSnapshotRequestor *v5;
  SBSceneSnapshotRequestor *v6;
  NSMutableSet *v7;
  NSMutableSet *outgoingSnapshots;
  NSMutableSet *v9;
  NSMutableSet *incomingSnapshots;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBSceneSnapshotRequestor;
  v5 = -[SBSceneSnapshotRequestor init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    outgoingSnapshots = v6->_outgoingSnapshots;
    v6->_outgoingSnapshots = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    incomingSnapshots = v6->_incomingSnapshots;
    v6->_incomingSnapshots = v9;

  }
  return v6;
}

- (NSString)description
{
  return (NSString *)-[SBSceneSnapshotRequestor descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSceneSnapshotRequestor succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSceneSnapshotRequestor _debugName](self, "_debugName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("debugName"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSceneSnapshotRequestor descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  -[SBSceneSnapshotRequestor succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSceneSnapshotRequestor _sceneSnapshotRequestStrategy](self, "_sceneSnapshotRequestStrategy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("strategy"));

  v7 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[NSMutableSet count](self->_incomingSnapshots, "count"), CFSTR("incomingSnapshots.count"));
  v8 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[NSMutableSet count](self->_outgoingSnapshots, "count"), CFSTR("outgoingSnapshots.count"));
  return v4;
}

- (void)invalidate
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = self->_outgoingSnapshots;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v7++), "invalidate");
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_incomingSnapshots;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "invalidate", (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }

}

void __99__SBSceneSnapshotRequestor_requestSnapshotsForSceneHandle_updatingToNewSettings_withUpdateContext___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __99__SBSceneSnapshotRequestor_requestSnapshotsForSceneHandle_updatingToNewSettings_withUpdateContext___block_invoke_2;
  v4[3] = &unk_1E8E9E868;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

uint64_t __99__SBSceneSnapshotRequestor_requestSnapshotsForSceneHandle_updatingToNewSettings_withUpdateContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (BOOL)handleSnapshotRequestAction:(id)a3 forSceneHandle:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneSnapshotRequestor.m"), 229, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshotRequestAction"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneSnapshotRequestor.m"), 230, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneHandle"));

LABEL_3:
  objc_msgSend(v9, "application");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v7, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "type");
    if (v12 == 2)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      v25 = _os_activity_create(&dword_1D0540000, "XBInvalidate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
      os_activity_scope_enter(v25, &state);

      XBLogFileManifest();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        -[SBSceneSnapshotRequestor succinctDescription](self, "succinctDescription");
        v27 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "sceneIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v41 = v27;
        v42 = 2114;
        v43 = v28;
        v44 = 2112;
        v45 = v11;
        _os_log_impl(&dword_1D0540000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Got snapshot-invalidate request with context: %@", buf, 0x20u);

      }
      objc_msgSend(v10, "deleteSnapshotForContext:", v11);
      FBSSceneSnapshotActionResponseForErrorCode();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sendResponse:", v29);

    }
    else
    {
      if (v12 != 1)
      {
        FBSSceneSnapshotActionResponseForErrorCode();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sendResponse:", v30);

LABEL_21:
        goto LABEL_22;
      }
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      v13 = _os_activity_create(&dword_1D0540000, "XBCapture", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
      os_activity_scope_enter(v13, &state);

      SBLogSceneSnapshots();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[SBSceneSnapshotRequestor succinctDescription](self, "succinctDescription");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "sceneIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v41 = v15;
        v42 = 2114;
        v43 = v16;
        v44 = 2048;
        v45 = v7;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Got FBSSceneSnapshotRequestTypePerform (%p)", buf, 0x20u);

      }
      objc_msgSend(v9, "sceneIfExists");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "settings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18 && (objc_msgSend(v18, "isForeground") & 1) == 0)
      {
        -[NSMutableSet addObject:](self->_incomingSnapshots, "addObject:", v7);
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __71__SBSceneSnapshotRequestor_handleSnapshotRequestAction_forSceneHandle___block_invoke;
        v34[3] = &unk_1E8EAB930;
        v34[4] = self;
        v35 = v9;
        v36 = v7;
        v37 = v10;
        v38 = v11;
        objc_msgSend(v37, "saveSnapshotForSceneHandle:context:completion:", v35, v38, v34);

      }
      else
      {
        SBLogSceneSnapshots();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          -[SBSceneSnapshotRequestor succinctDescription](self, "succinctDescription");
          v21 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "sceneIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBSceneSnapshotRequestor handleSnapshotRequestAction:forSceneHandle:].cold.1(v21, v22, (uint64_t)buf, v20);
        }

        FBSSceneSnapshotActionResponseForErrorCode();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sendResponse:", v23);

      }
    }
    os_activity_scope_leave(&state);
    goto LABEL_21;
  }
  FBSSceneSnapshotActionResponseForErrorCode();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendResponse:", v24);

LABEL_22:
  return 1;
}

void __71__SBSceneSnapshotRequestor_handleSnapshotRequestAction_forSceneHandle___block_invoke(id *a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  SBLogSceneSnapshots();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[4], "succinctDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "sceneIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1[6];
    *(_DWORD *)buf = 138544130;
    v13 = v5;
    v14 = 2114;
    v15 = v6;
    v16 = 2048;
    v17 = v7;
    v18 = 2048;
    v19 = a2;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Snapshot request (%p) complete with error: %ld", buf, 0x2Au);

  }
  v8 = a1[6];
  v9 = a1[5];
  v10 = a1[7];
  v11 = a1[8];
  BSDispatchMain();

}

uint64_t __71__SBSceneSnapshotRequestor_handleSnapshotRequestAction_forSceneHandle___block_invoke_41(uint64_t a1)
{
  uint64_t result;
  int v3;
  char v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsObject:", *(_QWORD *)(a1 + 40));
  if (!(_DWORD)result)
  {
    if (!*(_QWORD *)(a1 + 72))
      return result;
    goto LABEL_10;
  }
  v3 = objc_msgSend(*(id *)(a1 + 40), "isValid");
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 40);
    FBSSceneSnapshotActionResponseForErrorCode();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendResponse:", v6);

  }
  else
  {
    SBLogSceneSnapshots();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "sceneIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      v15 = 138543874;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      v19 = 2048;
      v20 = v10;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Snapshot request (%p) was invalidated before it completed!", (uint8_t *)&v15, 0x20u);

    }
  }
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
  if ((v4 & 1) == 0)
  {
LABEL_10:
    SBLogSceneSnapshots();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "sceneIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 40);
      v15 = 138543874;
      v16 = v12;
      v17 = 2114;
      v18 = v13;
      v19 = 2048;
      v20 = v14;
      _os_log_debug_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ [%{public}@] Deleting any snapshot taken for now-invalidated action (%p)", (uint8_t *)&v15, 0x20u);

    }
    return objc_msgSend(*(id *)(a1 + 56), "deleteSnapshotForContext:", *(_QWORD *)(a1 + 64));
  }
  return result;
}

- (void)invalidatePendingSnapshotsForSceneID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = (void *)-[NSMutableSet copy](self->_outgoingSnapshots, "copy");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v10, "sceneID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "isEqualToString:", v11);

        if (v12)
        {
          objc_msgSend(v10, "invalidate");
          -[NSMutableSet removeObject:](self->_outgoingSnapshots, "removeObject:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v7);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = (void *)-[NSMutableSet copy](self->_incomingSnapshots, "copy", 0);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
        objc_msgSend(v18, "context");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "sceneID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v4, "isEqualToString:", v20);

        if (v21)
        {
          objc_msgSend(v18, "invalidate");
          -[NSMutableSet removeObject:](self->_incomingSnapshots, "removeObject:", v18);
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v15);
  }

}

- (id)_sbSceneSnapshotRequestsForSceneHandle:(id)a3 settings:(id)a4 snapshotRequestContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  SBSingleSceneSnapshotRequestStrategy *v13;
  void *v14;
  void *v15;
  SBSingleSceneSnapshotRequestStrategy *v16;
  void *v17;
  void *v19;
  void *v20;
  NSUInteger v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  NSUInteger v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneSnapshotRequestor.m"), 319, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settings"));

    if (v11)
      goto LABEL_4;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneSnapshotRequestor.m"), 318, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneHandle"));

  if (!v10)
    goto LABEL_14;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneSnapshotRequestor.m"), 320, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshotRequestContext"));

LABEL_4:
  if (-[NSHashTable count](self->_preventSupplementalSnapshotsAssertions, "count"))
  {
    SBLogSceneSnapshots();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      -[SBSceneSnapshotRequestor succinctDescription](self, "succinctDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sceneIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[NSHashTable count](self->_preventSupplementalSnapshotsAssertions, "count");
      -[NSHashTable allObjects](self->_preventSupplementalSnapshotsAssertions, "allObjects");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bs_map:", &__block_literal_global_119);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v28 = v19;
      v29 = 2114;
      v30 = v20;
      v31 = 2050;
      v32 = v21;
      v33 = 2114;
      v34 = v23;
      _os_log_debug_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ [%{public}@] Preventing supplemental snapshot requests because %{public}lu assertion(s): %{public}@", buf, 0x2Au);

    }
  }
  else
  {
    objc_msgSend(v11, "sceneDisplayLayoutStateTransitionContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fromLayoutState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[SBSceneSnapshotRequestor _sceneSnapshotRequestStrategy](self, "_sceneSnapshotRequestStrategy");
      v13 = (SBSingleSceneSnapshotRequestStrategy *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    SBLogSceneSnapshots();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[SBSceneSnapshotRequestor _sbSceneSnapshotRequestsForSceneHandle:settings:snapshotRequestContext:].cold.1(self, v9, v12);
  }

  v13 = objc_alloc_init(SBSingleSceneSnapshotRequestStrategy);
LABEL_10:
  v16 = v13;
  -[SBSingleSceneSnapshotRequestStrategy snapshotRequestsForSceneHandle:settings:snapshotRequestContext:](v13, "snapshotRequestsForSceneHandle:settings:snapshotRequestContext:", v9, v10, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __99__SBSceneSnapshotRequestor__sbSceneSnapshotRequestsForSceneHandle_settings_snapshotRequestContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reason");
}

- (id)_fbsSceneSnapshotRequestsFromSBSceneSnapshotRequests:(id)a3 forSceneHandle:(id)a4 settings:(id)a5 snapshotRequestContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  void **v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  NSObject *v76;
  void *v77;
  NSObject *v78;
  uint64_t v79;
  BOOL v80;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  char v87;
  uint64_t v88;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  uint64_t v100;
  id obj;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  void *v107;
  NSObject *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  id v119;
  void *v120;
  id v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  uint8_t buf[4];
  void *v135;
  __int16 v136;
  void *v137;
  __int16 v138;
  void *v139;
  __int16 v140;
  void *v141;
  _BYTE v142[128];
  void *v143;
  _BYTE v144[128];
  _QWORD v145[2];
  void *v146;
  void *v147;
  _BYTE v148[128];
  uint64_t v149;
  CGRect v150;

  v149 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v98 = a6;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneSnapshotRequestor.m"), 342, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sbRequests"));

  }
  v115 = v10;
  if (v10)
  {
    if (v11)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneSnapshotRequestor.m"), 343, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneHandle"));

    if (v11)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneSnapshotRequestor.m"), 344, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settings"));

LABEL_5:
  if (!v98)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneSnapshotRequestor.m"), 345, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshotRequestContext"));

  }
  v119 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v10, "application");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "info");
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_opt_class();
  v15 = v11;
  if (v14)
  {
    v16 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
  }
  else
  {
    v16 = v15;
    v17 = 0;
  }
  v18 = v17;

  v96 = v18;
  v117 = objc_msgSend(v97, "xb_userInterfaceStyleForRequestedUserInterfaceStyle:", objc_msgSend(v18, "userInterfaceStyle"));
  objc_msgSend(v98, "sceneDisplayReferenceFrameProvider");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "sceneDisplayLayoutStateTransitionContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "fromLayoutState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v98, "embeddedDisplayReferenceFrameProvider");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "appLayout");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "sceneIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v20;
  objc_msgSend(v20, "elementWithIdentifier:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = objc_msgSend(v23, "layoutRole");

  v120 = v16;
  v116 = objc_msgSend(v16, "interfaceOrientation");
  v24 = 4;
  if ((unint64_t)(v116 - 1) >= 2)
    v24 = 1;
  v100 = v24;
  objc_msgSend(v21, "itemsToLayoutAttributesMap");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  obj = v9;
  v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v148, 16);
  if (v103)
  {
    v102 = *(_QWORD *)v131;
    v25 = *MEMORY[0x1E0C9D820];
    v26 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v110 = v117;
    v121 = v12;
    v107 = v21;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v131 != v102)
        {
          v28 = v27;
          objc_enumerationMutation(obj);
          v27 = v28;
        }
        v104 = v27;
        v29 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * v27);
        if (objc_msgSend(v29, "size"))
          v30 = v109 == 0;
        else
          v30 = 0;
        if (v30)
        {
          SBLogSceneSnapshots();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            -[SBSceneSnapshotRequestor succinctDescription](self, "succinctDescription");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v115, "sceneIdentifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v135 = v35;
            v136 = 2114;
            v137 = v36;
            v138 = 2114;
            v139 = v29;
            _os_log_error_impl(&dword_1D0540000, v34, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] skipping snapshot request because referenceFrameProvider == nil for sbRequest %{public}@", buf, 0x20u);

            v21 = v107;
          }
        }
        else
        {
          switch(objc_msgSend(v29, "orientation"))
          {
            case 0:
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v116);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v147 = v31;
              v32 = (void *)MEMORY[0x1E0C99D20];
              v33 = &v147;
              goto LABEL_30;
            case 1:
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v100);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v146 = v31;
              v32 = (void *)MEMORY[0x1E0C99D20];
              v33 = &v146;
LABEL_30:
              objc_msgSend(v32, "arrayWithObjects:count:", v33, 1);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_31;
            case 2:
              v38 = &unk_1E91CE698;
              break;
            case 3:
              v38 = &unk_1E91CE6B0;
              break;
            case 4:
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v116);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v145[0] = v31;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v100);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v145[1] = v37;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v145, 2);
              v38 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_31:
              break;
            default:
              v38 = 0;
              break;
          }
          v128 = 0u;
          v129 = 0u;
          v126 = 0u;
          v127 = 0u;
          v108 = v38;
          v112 = -[NSObject countByEnumeratingWithState:objects:count:](v108, "countByEnumeratingWithState:objects:count:", &v126, v144, 16);
          if (v112)
          {
            v111 = *(_QWORD *)v127;
            v118 = v29;
            do
            {
              v39 = 0;
              do
              {
                if (*(_QWORD *)v127 != v111)
                  objc_enumerationMutation(v108);
                v40 = objc_msgSend(*(id *)(*((_QWORD *)&v126 + 1) + 8 * v39), "integerValue");
                switch(objc_msgSend(v29, "size"))
                {
                  case 0:
                    objc_msgSend(v120, "frame");
                    goto LABEL_50;
                  case 1:
                    v46 = v109;
                    goto LABEL_47;
                  case 2:
                    v46 = v105;
LABEL_47:
                    objc_msgSend(v46, "referenceFrameForInterfaceOrientation:layoutRole:appLayout:", v40, v106, v107);
                    goto LABEL_50;
                  case 3:
                    objc_msgSend(v107, "leafAppLayoutForRole:", v106);
                    v45 = objc_claimAutoreleasedReturnValue();
                    goto LABEL_44;
                  case 4:
                    SBAppLayoutGenericAppLayoutWithConfiguration(3);
                    v45 = objc_claimAutoreleasedReturnValue();
LABEL_44:
                    v47 = (void *)v45;
                    objc_msgSend(v109, "referenceFrameForInterfaceOrientation:layoutRole:appLayout:", v40, 1, v45);
                    v49 = v48;
                    v51 = v50;
                    v53 = v52;
                    v55 = v54;

                    break;
                  case 5:
                    objc_msgSend(v109, "referenceFrameForInterfaceOrientation:floatingConfiguration:", v40, 2);
                    goto LABEL_50;
                  case 6:
                    objc_msgSend(v109, "referenceFrameForInterfaceOrientation:centerConfiguration:", v40, 1);
LABEL_50:
                    v49 = v41;
                    v51 = v42;
                    v53 = v43;
                    v55 = v44;
                    break;
                  default:
                    v55 = 0.0;
                    v53 = 0.0;
                    v51 = 0.0;
                    v49 = 0.0;
                    break;
                }
                if (v53 == v25 && v55 == v26)
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  v150.origin.x = v49;
                  v150.origin.y = v51;
                  v150.size.width = v53;
                  v150.size.height = v55;
                  NSStringFromCGRect(v150);
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v115, "sceneIdentifier");
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v83, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneSnapshotRequestor.m"), 433, CFSTR("frame %@ isn't valid for scene %@ from request %@"), v84, v85, v29);

                }
                v57 = objc_msgSend(v29, "userInterfaceStyle");
                v113 = v39;
                if (v57 == 1)
                {
                  if (v110 == 2)
                    v59 = &unk_1E91CE6C8;
                  else
                    v59 = &unk_1E91CE6E0;
                  v60 = 1;
                  if (v110 != 2)
                    v60 = 2;
                  v110 = v60;
                }
                else if (v57)
                {
                  v59 = 0;
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v117);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  v143 = v58;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v143, 1);
                  v59 = (void *)objc_claimAutoreleasedReturnValue();

                  v110 = v117;
                }
                v124 = 0u;
                v125 = 0u;
                v122 = 0u;
                v123 = 0u;
                v61 = v59;
                v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v122, v142, 16);
                if (v62)
                {
                  v63 = v62;
                  v64 = *(_QWORD *)v123;
                  do
                  {
                    for (i = 0; i != v63; ++i)
                    {
                      if (*(_QWORD *)v123 != v64)
                        objc_enumerationMutation(v61);
                      v66 = objc_msgSend(*(id *)(*((_QWORD *)&v122 + 1) + 8 * i), "integerValue");
                      v67 = (void *)MEMORY[0x1E0CB3940];
                      SBFStringForUIUserInterfaceStyle();
                      v68 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v67, "stringWithFormat:", CFSTR("w%0.0f:h%0.0f:%@"), *(_QWORD *)&v53, *(_QWORD *)&v55, v68);
                      v69 = (void *)objc_claimAutoreleasedReturnValue();

                      if (objc_msgSend(v12, "containsObject:", v69))
                      {
                        SBLogSceneSnapshots();
                        v70 = objc_claimAutoreleasedReturnValue();
                        if (!os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
                          goto LABEL_95;
                        -[SBSceneSnapshotRequestor succinctDescription](self, "succinctDescription");
                        v71 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v115, "sceneIdentifier");
                        v72 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v118, "succinctDescription");
                        v73 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138544130;
                        v135 = v71;
                        v136 = 2114;
                        v137 = v72;
                        v138 = 2114;
                        v139 = v69;
                        v140 = 2114;
                        v141 = v73;
                        _os_log_debug_impl(&dword_1D0540000, v70, OS_LOG_TYPE_DEBUG, "%{public}@ [%{public}@] skipping duplicate request (%{public}@) from sbRequest %{public}@", buf, 0x2Au);

                        v12 = v121;
LABEL_81:

                        goto LABEL_95;
                      }
                      if (!v40)
                      {
                        SBLogSceneSnapshots();
                        v70 = objc_claimAutoreleasedReturnValue();
                        if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                          goto LABEL_95;
                        -[SBSceneSnapshotRequestor succinctDescription](self, "succinctDescription");
                        v71 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v115, "sceneIdentifier");
                        v77 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543874;
                        v135 = v71;
                        v136 = 2114;
                        v137 = v77;
                        v138 = 2114;
                        v139 = v118;
                        _os_log_error_impl(&dword_1D0540000, v70, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] skipping snapshot request with unknown orientation from sbRequest %{public}@", buf, 0x20u);

                        v12 = v121;
                        goto LABEL_81;
                      }
                      objc_msgSend(v12, "addObject:", v69);
                      v74 = (void *)objc_msgSend(v120, "mutableCopy");
                      objc_msgSend(v74, "setFrame:", v49, v51, v53, v55);
                      objc_msgSend(v74, "setInterfaceOrientation:", v40);
                      v75 = objc_opt_class();
                      v70 = v74;
                      if (v75)
                      {
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                          v76 = v70;
                        else
                          v76 = 0;
                      }
                      else
                      {
                        v76 = 0;
                      }
                      v78 = v76;

                      -[NSObject setUserInterfaceStyle:](v78, "setUserInterfaceStyle:", v66);
                      if ((objc_msgSend((id)SBApp, "underMemoryPressure") & 1) != 0)
                      {
                        v79 = 0;
                      }
                      else
                      {
                        if (objc_msgSend(v118, "size"))
                          v80 = 0;
                        else
                          v80 = v66 == v117;
                        v79 = v80 && v40 == v116;
                      }
                      v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D23230]), "initWithSettings:allowsProtectedContent:", v70, v79);
                      objc_msgSend(v119, "addObject:", v82);

                      v12 = v121;
LABEL_95:

                    }
                    v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v122, v142, 16);
                  }
                  while (v63);
                }

                v39 = v113 + 1;
                v29 = v118;
              }
              while (v113 + 1 != v112);
              v112 = -[NSObject countByEnumeratingWithState:objects:count:](v108, "countByEnumeratingWithState:objects:count:", &v126, v144, 16);
            }
            while (v112);
          }
          v34 = v108;

          v21 = v107;
        }

        v27 = v104 + 1;
      }
      while (v104 + 1 != v103);
      v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v148, 16);
    }
    while (v103);
  }

  objc_msgSend(v21, "itemsToLayoutAttributesMap");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend(v94, "isEqualToDictionary:", v86);

  if ((v87 & 1) == 0)
  {
    objc_msgSend(v21, "appLayoutByModifyingLayoutAttributesForItems:", v94);
    v88 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v88;
  }

  return v119;
}

- (id)_debugName
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "debugNameForSceneSnapshotRequestor:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_sceneSnapshotRequestContext
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sceneSnapshotRequestContextForSceneSnapshotRequestor:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_sceneSnapshotRequestStrategy
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sceneSnapshotRequestStrategyForSceneSnapshotRequestor:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SBSceneSnapshotRequestorDelegate)delegate
{
  return (SBSceneSnapshotRequestorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preventSupplementalSnapshotsAssertions, 0);
  objc_storeStrong((id *)&self->_incomingSnapshots, 0);
  objc_storeStrong((id *)&self->_outgoingSnapshots, 0);
}

- (void)requestSnapshotsForSceneHandle:(void *)a1 updatingToNewSettings:(void *)a2 withUpdateContext:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "succinctDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1D0540000, a3, OS_LOG_TYPE_ERROR, "%{public}@ ERROR: No transition context exists for update to scene %{public}@; unable to include snapshot actions.",
    (uint8_t *)&v7,
    0x16u);

  OUTLINED_FUNCTION_20();
}

- (void)requestSnapshotsForSceneHandle:(_QWORD *)a3 updatingToNewSettings:(NSObject *)a4 withUpdateContext:.cold.2(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "succinctDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_debug_impl(&dword_1D0540000, a4, OS_LOG_TYPE_DEBUG, " - %{public}@", a1, 0xCu);

}

- (void)handleSnapshotRequestAction:(uint64_t)a3 forSceneHandle:(NSObject *)a4 .cold.1(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_2_1(&dword_1D0540000, a4, a3, "%{public}@ [%{public}@] Ignoring snapshot request, because scene is foreground", (uint8_t *)a3);

}

- (void)_sbSceneSnapshotRequestsForSceneHandle:(void *)a1 settings:(void *)a2 snapshotRequestContext:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "succinctDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v5;
  v10 = 2114;
  v11 = v6;
  OUTLINED_FUNCTION_2_1(&dword_1D0540000, a3, v7, "%{public}@ [%{public}@] Preventing supplemental snapshot requests because locked", (uint8_t *)&v8);

  OUTLINED_FUNCTION_20();
}

@end
