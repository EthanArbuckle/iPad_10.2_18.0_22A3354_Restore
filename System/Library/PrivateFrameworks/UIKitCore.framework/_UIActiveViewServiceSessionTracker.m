@implementation _UIActiveViewServiceSessionTracker

- (void)_removeViewServiceSessionActivityRecord:(uint64_t)a1
{
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = _removeViewServiceSessionActivityRecord____s_category;
    if (!_removeViewServiceSessionActivityRecord____s_category)
    {
      v4 = __UILogCategoryGetNode("ViewServiceSessionActivityTracking", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&_removeViewServiceSessionActivityRecord____s_category);
    }
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      objc_msgSend(a2, "succinctDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v7;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "Removing session: %@", buf, 0xCu);

    }
    if (a2)
      v8 = a2[8];
    else
      v8 = 0;
    v9 = *(void **)(a1 + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __78___UIActiveViewServiceSessionTracker__removeViewServiceSessionActivityRecord___block_invoke;
    v13[3] = &unk_1E16B1B50;
    v14 = v11;
    v15 = a2;
    v12 = v11;
    -[_UIActiveViewServiceSessionTracker _notifyChangeOfTopEvaluatedObjectIfNeededForIdiom:withSortedActivityRecords:mutatedByBlock:](a1, v8, v12, (uint64_t)v13);

  }
}

+ (id)sharedTracker
{
  if (qword_1ECD7CAF8 != -1)
    dispatch_once(&qword_1ECD7CAF8, &__block_literal_global_120);
  return (id)qword_1ECD7CB00;
}

- (_UIActiveViewServiceSessionTracker)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIActiveViewServiceSessionTracker.m"), 379, CFSTR("%s: init is not allowed on %@"), "-[_UIActiveViewServiceSessionTracker init]", objc_opt_class());

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_stateCaptureToken, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_UIActiveViewServiceSessionTracker;
  -[_UIActiveViewServiceSessionTracker dealloc](&v3, sel_dealloc);
}

- (void)_notifyChangeOfTopEvaluatedObjectIfNeededForIdiom:(id *)a3 withSortedActivityRecords:(uint64_t)a4 mutatedByBlock:
{
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[_UIEvaluatedObjectCache topEvaluatedObject](a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = qword_1ECD7CB08;
  if (!qword_1ECD7CB08)
  {
    v9 = __UILogCategoryGetNode("ViewServiceSessionActivityTracking", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v9, (unint64_t *)&qword_1ECD7CB08);
  }
  if ((*(_BYTE *)v9 & 1) != 0)
  {
    v15 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = v15;
      _NSStringFromUIUserInterfaceIdiom(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "succinctDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v17;
      v27 = 2112;
      v28 = v18;
      _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "mostActiveViewServiceSession for %@: current: %@", buf, 0x16u);

    }
  }
  (*(void (**)(uint64_t))(a4 + 16))(a4);
  -[_UIEvaluatedObjectCache topEvaluatedObject](a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = qword_1ECD7CB10;
  if (!qword_1ECD7CB10)
  {
    v11 = __UILogCategoryGetNode("ViewServiceSessionActivityTracking", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v11, (unint64_t *)&qword_1ECD7CB10);
  }
  if ((*(_BYTE *)v11 & 1) != 0)
  {
    v19 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = v19;
      _NSStringFromUIUserInterfaceIdiom(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "succinctDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v21;
      v27 = 2112;
      v28 = v22;
      _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "mostActiveViewServiceSession for %@: new: %@", buf, 0x16u);

    }
  }
  if (v10 != v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2, CFSTR("_UIActiveViewServiceSessionChangingIdiomKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("_UIActiveViewServiceSessionDidChangeNotification"), a1, v13);

  }
}

- (void)handleViewServiceActivity:(_QWORD *)a3 inHostedWindow:(void *)a4 fromProvider:(uint64_t)a5 forSessionActivityRecord:
{
  unint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  id *v12;
  int IsPrimary;
  int v14;
  int v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  char v26;
  uint64_t v27;
  unint64_t v28;
  int v29;
  _BOOL4 v30;
  unint64_t v31;
  NSObject *v32;
  void *v33;
  _QWORD *v34;
  NSObject *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  NSObject *v41;
  void *v42;
  _QWORD *v43;
  objc_class *v44;
  void *v45;
  __CFString *v46;
  uint64_t v47;
  int v48;
  id v49;
  unsigned int v50;
  unsigned int v51;
  BOOL v53;
  void *v54;
  void *v55;
  __CFString *v56;
  unint64_t v57;
  NSObject *v58;
  const __CFString *v59;
  void *v60;
  _QWORD *v61;
  objc_class *v62;
  void *v63;
  __CFString *v64;
  __CFString *v65;
  void *v66;
  id v67;
  objc_class *v68;
  void *v69;
  __CFString *v70;
  uint64_t v71;
  __CFString *v72;
  uint64_t v73;
  void *v74;
  id v75;
  uint64_t v76;
  id v77;
  void *v78;
  uint64_t v79;
  void *v80;
  id *v81;
  BOOL v82;
  int v83;
  BOOL v84;
  id *val;
  unint64_t v86;
  id *WeakRetained;
  _QWORD v88[7];
  id v89;
  uint64_t v90;
  unint64_t v91;
  BOOL v92;
  BOOL v93;
  id location;
  _BYTE buf[24];
  _BYTE v96[10];
  __CFString *v97;
  __int16 v98;
  uint64_t v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  if (a5 && !*(_BYTE *)(a5 + 16))
  {
    v12 = a1;
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a5 + 24));
    IsPrimary = _UIActiveViewServiceSessionProviderIsPrimary(a4);
    v82 = a2 == 2;
    v83 = IsPrimary;
    if (a2 == 2)
      v14 = IsPrimary;
    else
      v14 = 1;
    if (a2)
      v15 = v14;
    else
      v15 = 0;
    v86 = a2;
    v16 = a3 && objc_msgSend(a3, "_isHostedInAnotherProcess") && (a3[13] & 0x1000) == 0;
    if (WeakRetained && WeakRetained != v12)
      goto LABEL_23;
    val = v12;
    v21 = *(id *)(a5 + 56);
    objc_msgSend(a4, "_sessionIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v21;
    v24 = v22;
    v25 = v24;
    if (v23 == v24)
    {
      v26 = 1;
      v12 = val;
    }
    else
    {
      v26 = 0;
      v12 = val;
      if (v23 && v24)
        v26 = objc_msgSend(v23, "isEqual:", v24);
    }

    if ((v15 & v16) != 1 || (v26 & 1) == 0)
    {
LABEL_23:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v86 > 4)
        v20 = &stru_1E16EDF20;
      else
        v20 = off_1E16B48E8[v86];
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel_handleViewServiceActivity_inHostedWindow_fromProvider_forSessionActivityRecord_, v12, CFSTR("_UIActiveViewServiceSessionTracker.m"), 488, CFSTR("Invalid state: activity: %@; window: %@; provider: %@; session: %@"),
        v20,
        a3,
        a4,
        a5);

LABEL_81:
      return;
    }
    v27 = *(_QWORD *)(a5 + 40);
    v28 = v86;
    *(_QWORD *)(a5 + 40) = v86;
    objc_storeWeak((id *)(a5 + 32), a4);
    *(_QWORD *)(a5 + 48) = mach_absolute_time();
    if (a3)
    {
      v29 = objc_msgSend(a3, "_isHostedInAnotherProcess");
      v30 = (a3[13] & 0x1000) == 0;
      if (v29 && (a3[13] & 0x1000) == 0)
      {
        if ((objc_msgSend(*(id *)(a5 + 8), "containsObject:", a3) & 1) != 0)
          goto LABEL_53;
        objc_msgSend(*(id *)(a5 + 8), "addObject:", a3);
        v31 = qword_1ECD7CAF0;
        if (!qword_1ECD7CAF0)
        {
          v31 = __UILogCategoryGetNode("ViewServiceSessionActivityTracking", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v31, (unint64_t *)&qword_1ECD7CAF0);
        }
        if ((*(_BYTE *)v31 & 1) == 0 || (v32 = *(NSObject **)(v31 + 8), !os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)))
        {
LABEL_53:
          v48 = v83;
          if (v28 != 2)
            v48 = 0;
          if (v48 == 1)
          {
            v49 = a4;
            v50 = objc_msgSend(v49, "_effectiveViewControllerAppearState");
            v51 = v50;
            v53 = v50 != 3 && v50 != 0;
            v84 = v53;
            v54 = (void *)MEMORY[0x1E0CB3940];
            _NSStringFromUIViewControllerAppearState(v50);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "stringWithFormat:", CFSTR("appearState: %@; "), v55);
            v56 = (__CFString *)objc_claimAutoreleasedReturnValue();

            *(_DWORD *)(a5 + 20) = v51;
          }
          else
          {
            v84 = 0;
            v56 = &stru_1E16EDF20;
          }
          v57 = qword_1ECD7CB20;
          if (!qword_1ECD7CB20)
          {
            v57 = __UILogCategoryGetNode("ViewServiceSessionActivityTracking", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v57, (unint64_t *)&qword_1ECD7CB20);
          }
          v58 = *(id *)(v57 + 8);
          if (!os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            goto LABEL_76;
          if (v86 > 4)
          {
            v59 = &stru_1E16EDF20;
            if (a3)
              goto LABEL_69;
          }
          else
          {
            v59 = off_1E16B4910[v86 - 1];
            if (a3)
            {
LABEL_69:
              v60 = (void *)MEMORY[0x1E0CB3940];
              v61 = a3;
              v62 = (objc_class *)objc_opt_class();
              NSStringFromClass(v62);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "stringWithFormat:", CFSTR("<%@: %p>"), v63, v61);
              v64 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_72:
              v65 = v64;
              if (a4)
              {
                v66 = (void *)MEMORY[0x1E0CB3940];
                v67 = a4;
                v68 = (objc_class *)objc_opt_class();
                NSStringFromClass(v68);
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "stringWithFormat:", CFSTR("<%@: %p>"), v69, v67);
                v70 = (__CFString *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v70 = CFSTR("(nil)");
              }
              v71 = *(_QWORD *)(a5 + 56);
              *(_DWORD *)buf = 138413314;
              *(_QWORD *)&buf[4] = v59;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v56;
              *(_WORD *)&buf[22] = 2112;
              *(_QWORD *)v96 = v65;
              *(_WORD *)&v96[8] = 2112;
              v97 = v70;
              v98 = 2112;
              v99 = v71;
              v72 = v70;
              _os_log_impl(&dword_185066000, v58, OS_LOG_TYPE_DEFAULT, "Activity: %@; %@window: %@; provider: %@; session: %@",
                buf,
                0x34u);

LABEL_76:
              v73 = *(_QWORD *)(a5 + 64);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v73);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v75 = val[1];
              if (!v75)
              {
                v76 = objc_opt_new();
                v77 = val[1];
                val[1] = (id)v76;

                v75 = val[1];
              }
              objc_msgSend(v75, "objectForKey:", v74);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v79 = MEMORY[0x1E0C809B0];
              if (!v78)
              {
                objc_initWeak(&location, val);
                *(_QWORD *)buf = v79;
                *(_QWORD *)&buf[8] = 3221225472;
                *(_QWORD *)&buf[16] = __65___UIActiveViewServiceSessionTracker__createEvaluatedObjectCache__block_invoke;
                *(_QWORD *)v96 = &unk_1E16B48A0;
                objc_copyWeak((id *)&v96[8], &location);
                v80 = _Block_copy(buf);
                v78 = -[_UIEvaluatedObjectCache initWithSortComparator:evaluationBlock:]([_UIEvaluatedObjectCache alloc], &__block_literal_global_25, v80);

                objc_destroyWeak((id *)&v96[8]);
                objc_destroyWeak(&location);
                objc_msgSend(val[1], "setObject:forKey:", v78, v74);
              }
              v88[0] = v79;
              v88[1] = 3221225472;
              v88[2] = __117___UIActiveViewServiceSessionTracker_handleViewServiceActivity_inHostedWindow_fromProvider_forSessionActivityRecord___block_invoke;
              v88[3] = &unk_1E16B48C8;
              v88[4] = WeakRetained;
              v88[5] = a5;
              v88[6] = val;
              v89 = v78;
              v90 = v27;
              v91 = v86;
              v92 = v82;
              v93 = v84;
              v81 = v78;
              -[_UIActiveViewServiceSessionTracker _notifyChangeOfTopEvaluatedObjectIfNeededForIdiom:withSortedActivityRecords:mutatedByBlock:]((uint64_t)val, v73, v81, (uint64_t)v88);

              goto LABEL_81;
            }
          }
          v64 = CFSTR("(nil)");
          goto LABEL_72;
        }
        v33 = (void *)MEMORY[0x1E0CB3940];
        v34 = a3;
        v35 = v32;
        v36 = (objc_class *)objc_opt_class();
        NSStringFromClass(v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", CFSTR("<%@: %p>"), v37, v34);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = *(_QWORD *)(a5 + 56);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v39;
        _os_log_impl(&dword_185066000, v35, OS_LOG_TYPE_ERROR, "Added activity window: %@; for viewServiceSession: %@",
          buf,
          0x16u);

LABEL_52:
        v28 = v86;
        goto LABEL_53;
      }
    }
    else
    {
      v30 = 0;
      v29 = 0;
    }
    v40 = _MergedGlobals_940;
    if (!_MergedGlobals_940)
    {
      v40 = __UILogCategoryGetNode("ViewServiceSessionActivityTracking", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v40, (unint64_t *)&_MergedGlobals_940);
    }
    v41 = *(id *)(v40 + 8);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
      {
        v42 = (void *)MEMORY[0x1E0CB3940];
        v43 = a3;
        v44 = (objc_class *)objc_opt_class();
        NSStringFromClass(v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "stringWithFormat:", CFSTR("<%@: %p>"), v45, v43);
        v46 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v46 = CFSTR("(nil)");
      }
      v47 = *(_QWORD *)(a5 + 56);
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v46;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v29;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v30;
      *(_WORD *)v96 = 2112;
      *(_QWORD *)&v96[2] = v47;
      _os_log_impl(&dword_185066000, v41, OS_LOG_TYPE_DEFAULT, "Attempting to track invalid window: %@; isHosted: %d; isNotDeallocating: %d; viewServiceSession: %@",
        buf,
        0x22u);

    }
    goto LABEL_52;
  }
  v9 = qword_1ECD7CB18;
  if (!qword_1ECD7CB18)
  {
    v9 = __UILogCategoryGetNode("ViewServiceSessionActivityTracking", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v9, (unint64_t *)&qword_1ECD7CB18);
  }
  v10 = *(NSObject **)(v9 + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (a2 > 4)
      v11 = &stru_1E16EDF20;
    else
      v11 = off_1E16B48E8[a2];
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)v96 = a4;
    *(_WORD *)&v96[8] = 2112;
    v97 = (__CFString *)a5;
    v17 = v10;
    _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_DEFAULT, "Invalid session activity record was provided to handleViewServiceActivity: activity: %@; window: %@; provider: %@; session: %@",
      buf,
      0x2Au);

  }
}

- (_QWORD)mostActiveViewServiceSessionForUserInterfaceIdiom:(_QWORD *)a1
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id *v6;

  v2 = a1;
  if (a1)
  {
    v3 = _UIActiveViewServiceSessionEffectiveIdiomForIdiom(a2);
    v4 = (void *)v2[1];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v5);
    v6 = (id *)objc_claimAutoreleasedReturnValue();

    -[_UIEvaluatedObjectCache topEvaluatedObject](v6);
    v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)viewServiceSessionForHostedWindow:(uint64_t)a3 inUserInterfaceIdiom:
{
  uint64_t v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id *v12;
  uint64_t v13;
  uint64_t i;
  id *v15;
  void *v16;
  int v17;
  id *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return (id *)0;
  v5 = _UIActiveViewServiceSessionEffectiveIdiomForIdiom(a3);
  v6 = *(void **)(a1 + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (id *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[_UIEvaluatedObjectCache sortedObjects](v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v9);
        v15 = *(id **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (v15 && objc_msgSend(v15[1], "count", (_QWORD)v20))
        {
          v16 = (void *)objc_msgSend(v15[1], "copy");
          v17 = objc_msgSend(v16, "containsObject:", a2);

          if (v17)
          {
            v18 = v15;

            v12 = v18;
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (uint64_t)hasTrackedSessions
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v1 = a1;
  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 8), "count"))
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v2 = *(id *)(v1 + 8);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v3)
      {
        v4 = v3;
        v5 = *(_QWORD *)v13;
        do
        {
          v6 = 0;
          do
          {
            if (*(_QWORD *)v13 != v5)
              objc_enumerationMutation(v2);
            objc_msgSend(*(id *)(v1 + 8), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6), (_QWORD)v12);
            v7 = objc_claimAutoreleasedReturnValue();
            if (v7)
            {
              v8 = (void *)v7;
              v9 = objc_msgSend(*(id *)(v7 + 24), "count");

              if (v9)
              {
                v1 = 1;
                goto LABEL_16;
              }
            }
            ++v6;
          }
          while (v4 != v6);
          v10 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          v4 = v10;
        }
        while (v10);
      }
      v1 = 0;
LABEL_16:

    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (NSString)debugDescription
{
  return (NSString *)-[_UIActiveViewServiceSessionTracker debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIActiveViewServiceSessionTracker succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIActiveViewServiceSessionTracker descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIActiveViewServiceSessionTracker descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  _UIActiveViewServiceSessionTracker *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableDictionary count](self->_sortedActivityRecordsByIdiom, "count"))
  {
    objc_msgSend(v5, "setActiveMultilinePrefix:", a3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __76___UIActiveViewServiceSessionTracker_descriptionBuilderWithMultilinePrefix___block_invoke;
    v8[3] = &unk_1E16B1B50;
    v9 = v5;
    v10 = self;
    v6 = (id)objc_msgSend(v9, "modifyBody:", v8);

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureToken, 0);
  objc_storeStrong((id *)&self->_sortedActivityRecordsByIdiom, 0);
}

@end
