void sub_1B262392C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B26239E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ___ZN12SafariShared25SuddenTerminationDisabler28disableSuddenTerminationTaskEv_block_invoke(uint64_t a1)
{
  _QWORD *v1;
  NSObject *v2;
  _BOOL8 v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL8 v21;
  void *v22;
  SafariShared *v23;
  void *v24;
  _BYTE v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD **)(a1 + 32);
  v2 = WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    v4 = v1[2];
    *(_DWORD *)v25 = 138543362;
    *(_QWORD *)&v25[4] = v4;
    _os_log_impl(&dword_1B2621000, v2, OS_LOG_TYPE_DEFAULT, "Beginning new task assertion with reason: %{public}@", v25, 0xCu);
  }
  SafariShared::sharedApplication((SafariShared *)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.SafariShared.SuddenTerminationDisabler"), &__block_literal_global_61);

  if (SafariShared::invalidTaskIdentifier(void)::once != -1)
    dispatch_once(&SafariShared::invalidTaskIdentifier(void)::once, &__block_literal_global_7_2);
  if (v6 == SafariShared::invalidTaskIdentifier(void)::identifer)
  {
    v7 = SafariShared::coalescingBackgroundTaskIdentifier == SafariShared::invalidTaskIdentifier(void)::identifer;
    v8 = WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v9)
        ___ZN12SafariShared25SuddenTerminationDisabler28disableSuddenTerminationTaskEv_block_invoke_cold_1(v8, v10, v11, v12, v13, v14, v15, v16);
    }
    else if (v9)
    {
      ___ZN12SafariShared25SuddenTerminationDisabler28disableSuddenTerminationTaskEv_block_invoke_cold_2(v8, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  else
  {
    v17 = WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v1[2];
      *(_DWORD *)v25 = 138543362;
      *(_QWORD *)&v25[4] = v18;
      _os_log_impl(&dword_1B2621000, v17, OS_LOG_TYPE_DEFAULT, "Did begin task assertion with reason %{public}@", v25, 0xCu);
    }
    v19 = SafariShared::coalescingBackgroundTaskIdentifier;
    if (SafariShared::invalidTaskIdentifier(void)::once != -1)
      dispatch_once(&SafariShared::invalidTaskIdentifier(void)::once, &__block_literal_global_7_2);
    if (v19 != SafariShared::invalidTaskIdentifier(void)::identifer)
    {
      v20 = (id)WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v21)
      {
        SafariShared::coalescedDisablerReasons((SafariShared *)v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v25 = 138543362;
        *(_QWORD *)&v25[4] = v22;
        _os_log_impl(&dword_1B2621000, v20, OS_LOG_TYPE_DEFAULT, "Interrupting previous coalesced task assertion to be replaced with existing reasons: %{public}@", v25, 0xCu);

      }
      SafariShared::sharedApplication(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "endBackgroundTask:", SafariShared::coalescingBackgroundTaskIdentifier);

    }
    SafariShared::coalescingBackgroundTaskIdentifier = v6;
    {
      qword_1ED0DDCA0 = 0;
      qword_1ED0DDC98 = 0;
      SafariShared::coalescedDisablers(void)::set = (uint64_t)&qword_1ED0DDC98;
    }
    *(_QWORD *)v25 = v1;
    std::__tree<SafariShared::SuddenTerminationDisabler *>::__emplace_unique_key_args<SafariShared::SuddenTerminationDisabler *,SafariShared::SuddenTerminationDisabler *>((uint64_t **)&SafariShared::coalescedDisablers(void)::set, (unint64_t *)v25, (uint64_t *)v25);
    *v1 = SafariShared::coalescingBackgroundTaskIdentifier;
  }
}

void sub_1B2623CF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t *std::__tree<SafariShared::SuddenTerminationDisabler *>::__emplace_unique_key_args<SafariShared::SuddenTerminationDisabler *,SafariShared::SuddenTerminationDisabler *>(uint64_t **a1, unint64_t *a2, uint64_t *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  unint64_t v7;
  uint64_t **v8;
  unint64_t v9;
  uint64_t *v10;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = v5[4];
        if (v7 >= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = *a3;
    std::__tree<SafariShared::SuddenTerminationDisabler *>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

uint64_t *std::__tree<SafariShared::SuddenTerminationDisabler *>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:sn180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void sub_1B2623F90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id SafariShared::WBSSQLiteDatabaseFetch<>(void *a1, void *a2)
{
  id v3;
  id v4;
  WBSSQLiteStatement *v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  v5 = -[WBSSQLiteStatement initWithDatabase:query:]([WBSSQLiteStatement alloc], "initWithDatabase:query:", v3, v4);
  -[WBSSQLiteStatement fetch](v5, "fetch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_1B262403C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B262410C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2624214(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void SafariShared::SuddenTerminationDisabler::enableSuddenTermination(SafariShared::SuddenTerminationDisabler *this)
{
  void *v2;

  SafariShared::sharedApplication(this);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    SafariShared::SuddenTerminationDisabler::enableSuddenTerminationTask(this);
  else
    SafariShared::SuddenTerminationDisabler::enableSuddenTerminationTransaction(this);
}

SafariShared::SuddenTerminationDisabler *SafariShared::SuddenTerminationDisabler::SuddenTerminationDisabler(SafariShared::SuddenTerminationDisabler *this, NSString *a2)
{
  NSString *v3;

  v3 = a2;
  if (SafariShared::invalidTaskIdentifier(void)::once != -1)
    dispatch_once(&SafariShared::invalidTaskIdentifier(void)::once, &__block_literal_global_7_2);
  *(_QWORD *)this = SafariShared::invalidTaskIdentifier(void)::identifer;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = v3;
  SafariShared::SuddenTerminationDisabler::disableSuddenTermination(this);
  return this;
}

void SafariShared::SuddenTerminationDisabler::disableSuddenTermination(SafariShared::SuddenTerminationDisabler *this)
{
  void *v2;

  SafariShared::sharedApplication(this);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    SafariShared::SuddenTerminationDisabler::disableSuddenTerminationTask(this);
  else
    SafariShared::SuddenTerminationDisabler::disableSuddenTerminationTransaction(this);
}

id SafariShared::sharedApplication(SafariShared *this)
{
  if (SafariShared::sharedApplication(void)::once != -1)
    dispatch_once(&SafariShared::sharedApplication(void)::once, &__block_literal_global_9_2);
  return (id)SafariShared::sharedApplication(void)::app;
}

void SafariShared::SuddenTerminationDisabler::enableSuddenTerminationTask(SafariShared::SuddenTerminationDisabler *this)
{
  NSObject *v2;
  _QWORD block[5];

  SafariShared::coalescingBackgroundTaskAssertionQueue(this);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___ZN12SafariShared25SuddenTerminationDisabler27enableSuddenTerminationTaskEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = this;
  dispatch_sync(v2, block);

}

void SafariShared::SuddenTerminationDisabler::disableSuddenTerminationTask(SafariShared::SuddenTerminationDisabler *this)
{
  NSObject *v2;
  _QWORD block[5];

  SafariShared::coalescingBackgroundTaskAssertionQueue(this);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___ZN12SafariShared25SuddenTerminationDisabler28disableSuddenTerminationTaskEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = this;
  dispatch_sync(v2, block);

}

id SafariShared::coalescingBackgroundTaskAssertionQueue(SafariShared *this)
{
  if (SafariShared::coalescingBackgroundTaskAssertionQueue(void)::onceToken != -1)
    dispatch_once(&SafariShared::coalescingBackgroundTaskAssertionQueue(void)::onceToken, &__block_literal_global_12_2);
  return (id)SafariShared::coalescingBackgroundTaskAssertionQueue(void)::queue;
}

void __determineBundle_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void **v3;
  void *v4;

  _WBSGetLocalizableBundleFromAddress();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void ***)(a1 + 32);
  v4 = *v3;
  *v3 = (void *)v2;

}

id _WBSGetLocalizableBundleFromAddress()
{
  const char *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (const char *)dyld_image_path_containing_address();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFileSystemRepresentation:length:", v0, strlen(v0));
  v2 = (void *)_CFBundleCopyFrameworkURLForExecutablePath();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v0, 0, 0);
    v2 = (void *)_CFBundleCopyBundleURLForExecutableURL();
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_1B2624A88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2624BD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void soft_MKBGetDeviceLockState(const __CFDictionary *a1)
{
  void (*MKBGetDeviceLockStateSymbolLoc)(_QWORD);
  void *v2;
  void *v3;

  MKBGetDeviceLockStateSymbolLoc = (void (*)(_QWORD))getMKBGetDeviceLockStateSymbolLoc();
  if (MKBGetDeviceLockStateSymbolLoc)
  {
    MKBGetDeviceLockStateSymbolLoc(0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int soft_MKBGetDeviceLockState(CFDictionaryRef)");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WBSKeyBagLockStatusManager.mm"), 22, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_1B2624EBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t getMKBGetDeviceLockStateSymbolLoc(void)
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = getMKBGetDeviceLockStateSymbolLoc(void)::ptr;
  v6 = getMKBGetDeviceLockStateSymbolLoc(void)::ptr;
  if (!getMKBGetDeviceLockStateSymbolLoc(void)::ptr)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = ___ZL33getMKBGetDeviceLockStateSymbolLocv_block_invoke;
    v2[3] = &unk_1E649C650;
    v2[4] = &v3;
    ___ZL33getMKBGetDeviceLockStateSymbolLocv_block_invoke(v2);
    v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B2624F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B26250C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object)
{
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

id _WBSLocalizedString(void *a1, dispatch_once_t *a2, id *a3)
{
  id v5;
  void *v6;

  v5 = a1;
  determineBundle(a2, (uint64_t)a3);
  objc_msgSend(*a3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void determineBundle(dispatch_once_t *a1, uint64_t a2)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __determineBundle_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  if (*a1 != -1)
    dispatch_once(a1, block);
}

void sub_1B26266E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

uint64_t SafariShared::WBSSQLiteDatabaseEnumerate<std::tuple<std::__ignore_t<unsigned char> const&>>(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  WBSSQLiteStatement *v7;
  WBSSQLiteStatement *v8;
  uint64_t v9;

  v5 = a1;
  v6 = a3;
  v7 = -[WBSSQLiteStatement initWithDatabase:query:error:]([WBSSQLiteStatement alloc], "initWithDatabase:query:error:", v5, v6, a2);
  v8 = v7;
  if (v7)
  {
    v9 = SafariShared::_WBSSQLiteStatementBindOrStep<0,0,std::tuple<std::tuple<std::__ignore_t<unsigned char> const&>>>(v5, -[WBSSQLiteStatement handle](v7, "handle"), a2);
    -[WBSSQLiteStatement invalidate](v8, "invalidate");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void sub_1B26267DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B262689C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, objc_super a10)
{
  a10.super_class = (Class)WBSSQLiteStatement;
  -[_Unwind_Exception dealloc](&a10, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1B262696C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2626A00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B2626AE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2626BEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B2626C60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t SafariShared::_WBSSQLiteStatementBindOrStep<0,0,std::tuple<std::tuple<std::__ignore_t<unsigned char> const&>>>(void *a1, sqlite3_stmt *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a1;
  v6 = sqlite3_step(a2);
  if ((_DWORD)v6 == 100 && (v6 = sqlite3_step(a2), (_DWORD)v6 == 101))
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v5, "reportErrorWithCode:statement:error:", v6, a2, a3);
    v7 = 0;
  }

  return v7;
}

void sub_1B2626D08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2626D84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2626F48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2627128(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZN12SafariShared25SuddenTerminationDisabler27enableSuddenTerminationTaskEv_block_invoke(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL8 v6;
  void *v7;
  NSObject *v8;
  _BOOL8 v9;
  void *v10;
  _BYTE v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = *(uint64_t **)(a1 + 32);
  v2 = *v1;
  if (SafariShared::invalidTaskIdentifier(void)::once != -1)
    dispatch_once(&SafariShared::invalidTaskIdentifier(void)::once, &__block_literal_global_7_2);
  if (v2 != SafariShared::invalidTaskIdentifier(void)::identifer)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v1[2];
      *(_DWORD *)v11 = 138543362;
      *(_QWORD *)&v11[4] = v4;
      _os_log_impl(&dword_1B2621000, v3, OS_LOG_TYPE_DEFAULT, "Ending task assertion with reason %{public}@", v11, 0xCu);
    }
    if (SafariShared::invalidTaskIdentifier(void)::once != -1)
      dispatch_once(&SafariShared::invalidTaskIdentifier(void)::once, &__block_literal_global_7_2);
    *v1 = SafariShared::invalidTaskIdentifier(void)::identifer;
    {
      qword_1ED0DDCA0 = 0;
      qword_1ED0DDC98 = 0;
      SafariShared::coalescedDisablers(void)::set = (uint64_t)&qword_1ED0DDC98;
    }
    *(_QWORD *)v11 = v1;
    std::__tree<SafariShared::SuddenTerminationDisabler *>::__erase_unique<SafariShared::SuddenTerminationDisabler *>((uint64_t)&SafariShared::coalescedDisablers(void)::set, (unint64_t *)v11);
    {
      if (qword_1ED0DDCA0)
      {
        v5 = (id)WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler();
        v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
        if (v6)
        {
          SafariShared::coalescedDisablerReasons((SafariShared *)v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v11 = 138543362;
          *(_QWORD *)&v11[4] = v7;
          _os_log_impl(&dword_1B2621000, v5, OS_LOG_TYPE_DEFAULT, "Continuing background task assertion with reasons %{public}@", v11, 0xCu);

        }
        return;
      }
    }
    else
    {
      qword_1ED0DDCA0 = 0;
      qword_1ED0DDC98 = 0;
      SafariShared::coalescedDisablers(void)::set = (uint64_t)&qword_1ED0DDC98;
    }
    v8 = WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1B2621000, v8, OS_LOG_TYPE_DEFAULT, "Ending background task assertion", v11, 2u);
    }
    SafariShared::sharedApplication((SafariShared *)v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endBackgroundTask:", SafariShared::coalescingBackgroundTaskIdentifier);

    if (SafariShared::invalidTaskIdentifier(void)::once != -1)
      dispatch_once(&SafariShared::invalidTaskIdentifier(void)::once, &__block_literal_global_7_2);
    SafariShared::coalescingBackgroundTaskIdentifier = SafariShared::invalidTaskIdentifier(void)::identifer;
  }
}

void sub_1B26273F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t std::__tree<SafariShared::SuddenTerminationDisabler *>::__erase_unique<SafariShared::SuddenTerminationDisabler *>(uint64_t a1, unint64_t *a2)
{
  _QWORD *v2;
  unint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  BOOL v6;
  _QWORD *v7;

  v2 = *(_QWORD **)(a1 + 8);
  if (!v2)
    return 0;
  v3 = *a2;
  v4 = (uint64_t *)(a1 + 8);
  do
  {
    v5 = v2[4];
    v6 = v5 >= v3;
    if (v5 >= v3)
      v7 = v2;
    else
      v7 = v2 + 1;
    if (v6)
      v4 = v2;
    v2 = (_QWORD *)*v7;
  }
  while (*v7);
  if (v4 == (uint64_t *)(a1 + 8) || v3 < v4[4])
    return 0;
  std::__tree<SafariShared::SuddenTerminationDisabler *>::__remove_node_pointer((uint64_t **)a1, v4);
  operator delete(v4);
  return 1;
}

uint64_t *std::__tree<SafariShared::SuddenTerminationDisabler *>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  BOOL v5;
  uint64_t *v6;

  v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      v3 = v2;
      v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    v4 = a2;
    do
    {
      v3 = (uint64_t *)v4[2];
      v5 = *v3 == (_QWORD)v4;
      v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2)
    *a1 = v3;
  v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:sn180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

void sub_1B2627C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B2628248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  void *v20;
  id *v21;
  id *v22;
  void *v23;
  void *v24;

  v24 = v23;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1B2628374(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t WBSIsEqual(void *a1, void *a2)
{
  if (a1 == a2)
    return 1;
  else
    return objc_msgSend(a1, "isEqual:", a2);
}

void sub_1B2628650(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B26287A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  id *v18;
  void *v19;
  uint64_t v20;

  objc_destroyWeak(v18);
  objc_destroyWeak((id *)(v20 - 88));
  _Unwind_Resume(a1);
}

void sub_1B2628894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1B2628C98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B2628F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AccountsLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!AccountsLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E649E9D0;
    v3 = 0;
    AccountsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AccountsLibraryCore_frameworkLibrary)
    AccountsLibrary_cold_1(&v1);
  return AccountsLibraryCore_frameworkLibrary;
}

Class __getACMonitoredAccountStoreClass_block_invoke(uint64_t a1)
{
  Class result;

  AccountsLibrary();
  result = objc_getClass("ACMonitoredAccountStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getACMonitoredAccountStoreClass_block_invoke_cold_1();
  getACMonitoredAccountStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B2629574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WBSAuthenticationServicesAgentInterface()
{
  if (WBSAuthenticationServicesAgentInterface_onceToken != -1)
    dispatch_once(&WBSAuthenticationServicesAgentInterface_onceToken, &__block_literal_global_2);
  return (id)WBSAuthenticationServicesAgentInterface_interface;
}

id WBSAuthenticationServicesAgentDelegateInterface()
{
  if (WBSAuthenticationServicesAgentDelegateInterface_onceToken != -1)
    dispatch_once(&WBSAuthenticationServicesAgentDelegateInterface_onceToken, &__block_literal_global_47);
  return (id)WBSAuthenticationServicesAgentDelegateInterface_interface;
}

void sub_1B2629AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1B2629E5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  void *v21;
  void *v22;
  void *v23;

  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1B2629F78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(void *a1, _QWORD *a2, void *a3)
{
  id v5;
  id v6;
  WBSSQLiteStatement *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v13;

  v5 = a1;
  v6 = a3;
  v13 = 0;
  v7 = -[WBSSQLiteStatement initWithDatabase:query:error:]([WBSSQLiteStatement alloc], "initWithDatabase:query:error:", v5, v6, &v13);
  v8 = v13;
  v9 = v8;
  if (v7)
  {
    v10 = -[WBSSQLiteStatement execute](v7, "execute");
    -[WBSSQLiteStatement invalidate](v7, "invalidate");
    if ((v10 - 100) >= 2 && (_DWORD)v10 != 0)
      objc_msgSend(v5, "reportErrorWithCode:statement:error:", v10, -[WBSSQLiteStatement handle](v7, "handle"), a2);
  }
  else
  {
    if (a2)
      *a2 = objc_retainAutorelease(v8);
    v10 = objc_msgSend(v9, "code");
  }

  return v10;
}

void sub_1B262A0C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B262A244(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B262A408(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B262A4D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B262A548(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B262A5AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void __isProcessAllowedToPerformAccountStoreMaintenance_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "safari_isSafariFamilyApplicationBundle"))
  {
    isProcessAllowedToPerformAccountStoreMaintenance_isAllowedToPerformMaintenance = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.AuthenticationServicesCore.AuthenticationServicesAgent"), CFSTR("com.apple.Preferences"), CFSTR("com.apple.Safari.SafariCoreUnitTests.xctrunner"), 0);
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleIdentifier");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    isProcessAllowedToPerformAccountStoreMaintenance_isAllowedToPerformMaintenance = objc_msgSend(v0, "containsObject:", v1);

  }
}

void sub_1B262B268(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B262B2D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B262B55C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B262B754(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B262BBF0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXPasswords()
{
  if (WBS_LOG_CHANNEL_PREFIXPasswords_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPasswords_onceToken, &__block_literal_global_21);
  return WBS_LOG_CHANNEL_PREFIXPasswords_log;
}

void sub_1B262C78C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B262E32C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B262E54C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B262E71C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,void *a22)
{
  void *v22;
  void *v23;
  void *v24;

  _Unwind_Resume(a1);
}

void sub_1B262E9FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B262EB64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B262EC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B262FB08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B262FFE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXKeychain()
{
  if (WBS_LOG_CHANNEL_PREFIXKeychain_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXKeychain_onceToken, &__block_literal_global_13_0);
  return WBS_LOG_CHANNEL_PREFIXKeychain_log;
}

id WBSMakeAccessibilityIdentifier(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __WBSMakeAccessibilityIdentifier_block_invoke;
  v11[3] = &unk_1E649A1A8;
  v12 = v6;
  v7 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v11);

  v8 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v8, "setPath:", v5);

  objc_msgSend(v8, "setQueryItems:", v7);
  objc_msgSend(v8, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_6(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_8(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_0_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_0_10(uint64_t result, uint64_t a2, int a3, float a4)
{
  *(float *)a2 = a4;
  *(_QWORD *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x12u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_1_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

char *OUTLINED_FUNCTION_1_5()
{
  return dlerror();
}

void OUTLINED_FUNCTION_1_6(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x12u);
}

uint64_t OUTLINED_FUNCTION_1_7(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void sub_1B26325B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2632638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B2632850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B2632D28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B2632D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B2632FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B2633178(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263342C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void WBSDispatchAsyncToMainQueueWithAutoreleasePool(void *a1)
{
  id v1;
  id v2;
  _QWORD block[4];
  id v4;

  v1 = a1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __WBSDispatchAsyncToMainQueueWithAutoreleasePool_block_invoke;
  block[3] = &unk_1E649CC10;
  v4 = v1;
  v2 = v1;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void sub_1B263370C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void WBSReleaseOnMainQueueImpl(const void **a1)
{
  const void *v1;
  uint64_t v3;
  void *v4;

  v1 = *a1;
  if (*a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&WBSReleaseOnMainQueueImpl_lock);
    if (WBSReleaseOnMainQueueImpl_objectList)
    {
      objc_msgSend((id)WBSReleaseOnMainQueueImpl_objectList, "addObject:", v1);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v1);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)WBSReleaseOnMainQueueImpl_objectList;
      WBSReleaseOnMainQueueImpl_objectList = v3;

    }
    if (objc_msgSend((id)WBSReleaseOnMainQueueImpl_objectList, "count") == 1)
      dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_63);
    CFRelease(v1);
    *a1 = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)&WBSReleaseOnMainQueueImpl_lock);
  }
}

void sub_1B2633914(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZN12SafariSharedL17sharedApplicationEv_block_invoke()
{
  uint64_t v0;
  void *v1;

  -[objc_class sharedApplication](NSClassFromString(CFSTR("UIApplication")), "sharedApplication");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SafariShared::sharedApplication(void)::app;
  SafariShared::sharedApplication(void)::app = v0;

}

void sub_1B2633F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

size_t WBSReadExactAmountOfBytesFromFileDescriptor(int a1, char *a2, size_t a3)
{
  size_t v3;
  ssize_t v6;

  v3 = a3;
  while (v3)
  {
    v6 = read(a1, a2, v3);
    if (v3 == v6)
      break;
    if (!v6)
      return 0;
    if (v6 < 0)
    {
      if (*__error() != 4)
        return -1;
    }
    else
    {
      a2 += v6;
      v3 -= v6;
    }
  }
  return v3;
}

void sub_1B263497C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B2634A08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZN12SafariSharedL38coalescingBackgroundTaskAssertionQueueEv_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  if (SafariShared::invalidTaskIdentifier(void)::once != -1)
    dispatch_once(&SafariShared::invalidTaskIdentifier(void)::once, &__block_literal_global_7_2);
  SafariShared::coalescingBackgroundTaskIdentifier = SafariShared::invalidTaskIdentifier(void)::identifer;
  v0 = dispatch_queue_create("com.apple.SafariShared.CoalescingBackgroundTaskAssertionQueue", 0);
  v1 = (void *)SafariShared::coalescingBackgroundTaskAssertionQueue(void)::queue;
  SafariShared::coalescingBackgroundTaskAssertionQueue(void)::queue = (uint64_t)v0;

}

void sub_1B2634D00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void WBSDispatchSyncToMainQueueWithAutoreleasePool(void *a1)
{
  id v1;
  id v2;
  _QWORD block[4];
  id v4;

  v1 = a1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __WBSDispatchSyncToMainQueueWithAutoreleasePool_block_invoke;
  block[3] = &unk_1E649CC10;
  v4 = v1;
  v2 = v1;
  dispatch_sync(MEMORY[0x1E0C80D38], block);

}

void sub_1B26350D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B263536C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B263542C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2635C0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1B2635D5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t WBSAXShouldShowAnimatedImageControls()
{
  uint64_t result;
  unsigned int (*v1)(void);
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;

  result = libAccessibilityLibraryCore();
  if (result)
  {
    result = _os_feature_enabled_impl();
    if ((_DWORD)result)
    {
      v3 = 0;
      v4 = &v3;
      v5 = 0x2020000000;
      v1 = (unsigned int (*)(void))get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_ptr;
      v6 = get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_ptr;
      if (!get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_ptr)
      {
        v2[0] = MEMORY[0x1E0C809B0];
        v2[1] = 3221225472;
        v2[2] = __get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_block_invoke;
        v2[3] = &unk_1E649A1E8;
        v2[4] = &v3;
        __get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_block_invoke((uint64_t)v2);
        v1 = (unsigned int (*)(void))v4[3];
      }
      _Block_object_dispose(&v3, 8);
      if (!v1)
        WBSAXShouldShowAnimatedImageControls_cold_1();
      return v1() == 0;
    }
  }
  return result;
}

void sub_1B2636560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t libAccessibilityLibraryCore()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 0;
  v3 = &v2;
  v4 = 0x2020000000;
  v0 = libAccessibilityLibraryCore_frameworkLibrary;
  v5 = libAccessibilityLibraryCore_frameworkLibrary;
  if (!libAccessibilityLibraryCore_frameworkLibrary)
  {
    v6 = xmmword_1E649A1C8;
    v7 = 0;
    v0 = _sl_dlopen();
    v3[3] = v0;
    libAccessibilityLibraryCore_frameworkLibrary = v0;
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1B2636630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

dispatch_time_t WBSTimeUntilNextWeeklyAnalyticsReportForKey(void *a1)
{
  id v1;
  double Current;
  void *v3;
  double v4;
  double v5;
  double v6;
  dispatch_time_t v7;

  v1 = a1;
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleForKey:", v1);
  v5 = v4;

  v6 = v5 - Current + 604800.0;
  if (v6 < 300.0)
    v6 = 300.0;
  v7 = dispatch_walltime(0, 1000000000 * (uint64_t)v6);

  return v7;
}

void sub_1B2636F18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B263713C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{

  _Unwind_Resume(a1);
}

void sub_1B26372F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B26375C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{

  _Unwind_Resume(a1);
}

void sub_1B2637804(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263791C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{

  _Unwind_Resume(a1);
}

void sub_1B26379F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2637AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1B2637C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1B2637D98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B2637EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{

  _Unwind_Resume(a1);
}

void sub_1B2637F2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2638460(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B26385D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2638740(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2638860(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B26388E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1B2638C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1B2638DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1B2638E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

id extensionInvokedMetric(NSString *a1, int a2)
{
  NSString *v3;
  NSString *v4;
  const __CFString *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  v8[0] = CFSTR("extensionIdentifier");
  v8[1] = CFSTR("method");
  v5 = CFSTR("scriptInjection");
  if (a2)
    v5 = CFSTR("button");
  v9[0] = v3;
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_1B2638F68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2639000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B263911C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263925C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B263937C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2639544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B26396B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B26398CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B2639B18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2639C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B2639D3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2639E80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B2639FB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263A0E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263A198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B263A2EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B263A39C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263A504(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263A5E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B263A77C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263A88C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263AA68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B263ABA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263ACB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263ADC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1B263AF74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B263B068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B263B1AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B263B2F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B263B428(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263B578(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263B6A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263B91C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263BA2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263BB54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263BD30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B263BEF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B263C044(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263C10C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B263C260(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B263C4B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B263C5D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263C6E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263C958(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  int v3;

  if (v3)

  _Unwind_Resume(a1);
}

void sub_1B263CAA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263CD0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B263CE34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263CF60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263D070(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263D180(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263D480(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263D700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B263D808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B263DB34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263DE28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263DF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1B263E09C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1B263E218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{

  _Unwind_Resume(a1);
}

void sub_1B263E2D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263E46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B263E568(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B263E5E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263E7A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263EA84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263EB84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B263ECC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{

  _Unwind_Resume(a1);
}

void sub_1B263EE08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B263EFA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263F0D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B263F208(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B263F458(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B263F5AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263F70C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263F820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B263F9B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263FAD0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263FC18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263FE64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B263FF90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B264006C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B26402C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

const __CFString *stringForFieldType(unint64_t a1)
{
  if (a1 > 0x18)
    return CFSTR("Invalid Field Type");
  else
    return off_1E649B160[a1];
}

void sub_1B26403DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B2640538(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B2640618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B2640774(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B2640854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B2640928(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2640B28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2640CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B2640EB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2640F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B26410DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B26411D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B26412B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B26413BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1B264153C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B264161C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2641800(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B264194C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B2641A6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2641BB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2641DE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

const __CFString *stringForToolbarButtonType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x24)
    return CFSTR("back");
  else
    return off_1E649B2D0[a1 - 1];
}

void sub_1B2641F4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2642050(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B26423A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B26424DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2642574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B26426F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B26427D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B2642874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B26429CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2642A94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2642BD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B2642C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B2642D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

BOOL WBSAuditTokenHasEntitlement(_OWORD *a1, void *a2)
{
  __CFString *v3;
  const __CFAllocator *v4;
  __int128 v5;
  __SecTask *v6;
  __SecTask *v7;
  const __CFBoolean *v8;
  const __CFBoolean *v9;
  _BOOL8 v10;
  CFTypeID v11;
  CFErrorRef error;
  audit_token_t token;

  v3 = a2;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v5 = a1[1];
  *(_OWORD *)token.val = *a1;
  *(_OWORD *)&token.val[4] = v5;
  v6 = SecTaskCreateWithAuditToken(v4, &token);
  v7 = v6;
  if (v6)
  {
    error = 0;
    v8 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v6, v3, &error);
    v9 = v8;
    if (error)
    {
      NSLog(CFSTR("Unable to get entitlements for client task to verify entitlement %@. Error: %@"), v3, error);
      CFRelease(error);
      v10 = 0;
      if (!v9)
        goto LABEL_12;
    }
    else
    {
      if (!v8)
      {
        v10 = 0;
LABEL_12:
        CFRelease(v7);
        goto LABEL_13;
      }
      v11 = CFGetTypeID(v8);
      v10 = v11 == CFBooleanGetTypeID() && CFBooleanGetValue(v9) != 0;
    }
    CFRelease(v9);
    goto LABEL_12;
  }
  NSLog(CFSTR("Unable to create security task from audit token to verify entitlement %@."), v3);
  v10 = 0;
LABEL_13:

  return v10;
}

void sub_1B2642F60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id WBSAuditTokenValueArrayForEntitlement(_OWORD *a1, void *a2)
{
  __CFString *v3;
  const __CFAllocator *v4;
  __int128 v5;
  __SecTask *v6;
  __SecTask *v7;
  void *v8;
  id v9;
  CFErrorRef error;
  audit_token_t token;

  v3 = a2;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v5 = a1[1];
  *(_OWORD *)token.val = *a1;
  *(_OWORD *)&token.val[4] = v5;
  v6 = SecTaskCreateWithAuditToken(v4, &token);
  v7 = v6;
  if (v6)
  {
    error = 0;
    v8 = (void *)SecTaskCopyValueForEntitlement(v6, v3, &error);
    if (error)
    {
      NSLog(CFSTR("Unable to get entitlements for client task to verify entitlement %@. Error: %@"), v3, error);
      CFRelease(error);
      CFRelease(v7);
    }
    else
    {
      CFRelease(v7);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v8;
LABEL_9:

        goto LABEL_10;
      }
      NSLog(CFSTR("Unable to get an array of entitlements for client task to verify entitlement %@."), v3);
    }
    v9 = 0;
    goto LABEL_9;
  }
  NSLog(CFSTR("Unable to create security task from audit token to verify entitlement %@."), v3);
  v9 = 0;
LABEL_10:

  return v9;
}

void sub_1B2643078(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id WBSApplicationIdentifierFromAuditToken(_OWORD *a1)
{
  const __CFAllocator *v1;
  __int128 v2;
  __SecTask *v3;
  __SecTask *v4;
  void *v5;
  id v6;
  audit_token_t v8;

  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v2 = a1[1];
  *(_OWORD *)v8.val = *a1;
  *(_OWORD *)&v8.val[4] = v2;
  v3 = SecTaskCreateWithAuditToken(v1, &v8);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)SecTaskCopyValueForEntitlement(v3, CFSTR("application-identifier"), 0);
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

void sub_1B2643144(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id WBSTeamIdentifierFromAuditToken(_OWORD *a1)
{
  const __CFAllocator *v1;
  __int128 v2;
  SecTaskRef v3;
  void *v4;
  audit_token_t v6;

  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v2 = a1[1];
  *(_OWORD *)v6.val = *a1;
  *(_OWORD *)&v6.val[4] = v2;
  v3 = SecTaskCreateWithAuditToken(v1, &v6);
  if (!v3)
    return 0;
  v4 = (void *)SecTaskCopyTeamIdentifier();
  CFRelease(v3);
  return v4;
}

void sub_1B26431D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface()
{
  if (WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface_onceToken != -1)
    dispatch_once(&WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface_onceToken, &__block_literal_global_1);
  return (id)WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface_interface;
}

void sub_1B2643558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  uint64_t v0;

  return v0;
}

id OUTLINED_FUNCTION_5_0(uint64_t a1, void *a2)
{
  return a2;
}

id OUTLINED_FUNCTION_6(uint64_t a1, void *a2)
{
  return a2;
}

const __CFString *WBSAuthenticationServicesAgentAutoFillServiceName()
{
  return CFSTR("com.apple.AuthenticationServices.AutoFill");
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1B2646F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1B2647088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B26471A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B26472B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B26473E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B26474E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B2647630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B2647F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B2648880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B2648A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WBSCloudBookmarksMigrationCoordinatorLogsDirectoryURL(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  objc_msgSend(CFSTR("CloudBookmarksMigrationCoordinator"), "stringByAppendingPathComponent:", CFSTR("Logs"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

const __CFString *stringFromLocalMigrationState(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 4)
    return CFSTR("Unexpected Value");
  else
    return off_1E649B940[a1 + 1];
}

const __CFString *stringFromRemoteMigrationState(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 3)
    return CFSTR("Unexpected Value");
  else
    return off_1E649B968[a1 + 1];
}

void *__Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1B264B1C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B264B278(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B264B2F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B264B380(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B264B464(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B264B550(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B264B818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B264BAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B264BB60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B264BC18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B264BCA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B264BE34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B264BF98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1B264C02C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B264C0C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B264C28C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B264C344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B264C51C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)WBSCoalescedAsynchronousWriter;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_1B264C6D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B264C83C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B264C9DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B264CA70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B264CC90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B264CDF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B264CEE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B264D0E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1B5E26C38](v1, 0x1080C40D2F62047);
  _Unwind_Resume(a1);
}

void sub_1B264D250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B264D390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B264D4D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id *std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100](id **a1, id *a2)
{
  id *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(result);
    JUMPOUT(0x1B5E26C38);
  }
  return result;
}

void SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(id *this)
{
  SafariShared::SuddenTerminationDisabler::enableSuddenTermination((SafariShared::SuddenTerminationDisabler *)this);

}

void sub_1B264D6B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_1B264D7C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B264D908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  void *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1B264DA04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B264DC9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXAppleAccount()
{
  if (WBS_LOG_CHANNEL_PREFIXAppleAccount_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXAppleAccount_onceToken, &__block_literal_global_4);
  return WBS_LOG_CHANNEL_PREFIXAppleAccount_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXAutoFill()
{
  if (WBS_LOG_CHANNEL_PREFIXAutoFill_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXAutoFill_onceToken, &__block_literal_global_3);
  return WBS_LOG_CHANNEL_PREFIXAutoFill_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXCoalescedAsynchronousWriter()
{
  if (WBS_LOG_CHANNEL_PREFIXCoalescedAsynchronousWriter_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCoalescedAsynchronousWriter_onceToken, &__block_literal_global_5);
  return WBS_LOG_CHANNEL_PREFIXCoalescedAsynchronousWriter_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXDebugUtilities()
{
  if (WBS_LOG_CHANNEL_PREFIXDebugUtilities_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXDebugUtilities_onceToken, &__block_literal_global_7);
  return WBS_LOG_CHANNEL_PREFIXDebugUtilities_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXFileManager()
{
  if (WBS_LOG_CHANNEL_PREFIXFileManager_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXFileManager_onceToken, &__block_literal_global_11);
  return WBS_LOG_CHANNEL_PREFIXFileManager_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXKeyedArchiver()
{
  if (WBS_LOG_CHANNEL_PREFIXKeyedArchiver_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXKeyedArchiver_onceToken, &__block_literal_global_15_0);
  return WBS_LOG_CHANNEL_PREFIXKeyedArchiver_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXMissingPasswordGroups()
{
  if (WBS_LOG_CHANNEL_PREFIXMissingPasswordGroups_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXMissingPasswordGroups_onceToken, &__block_literal_global_17);
  return WBS_LOG_CHANNEL_PREFIXMissingPasswordGroups_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXOther()
{
  if (WBS_LOG_CHANNEL_PREFIXOther_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXOther_onceToken, &__block_literal_global_19);
  return WBS_LOG_CHANNEL_PREFIXOther_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPinnedTabRestoration()
{
  if (WBS_LOG_CHANNEL_PREFIXPinnedTabRestoration_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPinnedTabRestoration_onceToken, &__block_literal_global_23);
  return WBS_LOG_CHANNEL_PREFIXPinnedTabRestoration_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXRemotelyUpdatableDataController()
{
  if (WBS_LOG_CHANNEL_PREFIXRemotelyUpdatableDataController_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXRemotelyUpdatableDataController_onceToken, &__block_literal_global_25);
  return WBS_LOG_CHANNEL_PREFIXRemotelyUpdatableDataController_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXSandbox()
{
  if (WBS_LOG_CHANNEL_PREFIXSandbox_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSandbox_onceToken, &__block_literal_global_27);
  return WBS_LOG_CHANNEL_PREFIXSandbox_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXSQLite()
{
  if (WBS_LOG_CHANNEL_PREFIXSQLite_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSQLite_onceToken, &__block_literal_global_29);
  return WBS_LOG_CHANNEL_PREFIXSQLite_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXSQLiteStore()
{
  if (WBS_LOG_CHANNEL_PREFIXSQLiteStore_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSQLiteStore_onceToken, &__block_literal_global_31);
  return WBS_LOG_CHANNEL_PREFIXSQLiteStore_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler()
{
  if (WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler_onceToken, &__block_literal_global_33);
  return WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXXPC()
{
  if (WBS_LOG_CHANNEL_PREFIXXPC_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXXPC_onceToken, &__block_literal_global_39);
  return WBS_LOG_CHANNEL_PREFIXXPC_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness()
{
  if (WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness_onceToken, &__block_literal_global_41);
  return WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness_log;
}

void sub_1B264E8E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B264EA3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B264EAD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B264EC20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B264EEB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B264F01C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B264F1A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B264F260(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B264F78C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B264F890(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B264F940(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B264F9B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B264FA28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B264FAA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B264FB2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B264FB98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B264FBFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B264FCC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B264FDF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B264FEEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2650198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1B265027C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B2650358(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B2650408(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B26504E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B26505B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B265073C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B26507EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2650A3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B2650B38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2650CC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B2650F3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B26514A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1B265170C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B2651878(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B2651974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B26519EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2651A44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2651BD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2651CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

void sub_1B2652030(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B26520BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2652164(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B26522BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B2652368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

uint64_t enumeratePossibleURLsForUserTypedStringWithBlockInternal(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, void *, _BYTE *);
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v18;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "safari_stringByRemovingUnnecessaryCharactersFromUserTypedURLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
    v10 = 0;
    goto LABEL_47;
  }
  v18 = 0;
  v6 = v5;
  v7 = objc_msgSend(v6, "rangeOfString:", CFSTR(":"));
  v8 = objc_msgSend(v6, "rangeOfString:", CFSTR("/"));
  if (v7 != 0x7FFFFFFFFFFFFFFFLL && (v8 == 0x7FFFFFFFFFFFFFFFLL || v8 >= v7))
  {
    if ((objc_msgSend(v6, "safari_hasCaseInsensitivePrefix:", CFSTR("http:")) & 1) != 0
      || (objc_msgSend(v6, "safari_hasCaseInsensitivePrefix:", CFSTR("https:")) & 1) != 0
      || (objc_msgSend(v6, "safari_hasCaseInsensitivePrefix:", CFSTR("file:")) & 1) != 0
      || (objc_msgSend(v6, "safari_hasCaseInsensitivePrefix:", CFSTR("ftp:")) & 1) != 0
      || (objc_msgSend(v6, "safari_hasCaseInsensitivePrefix:", CFSTR("javascript:")) & 1) != 0
      || (objc_msgSend(v6, "safari_hasCaseInsensitivePrefix:", CFSTR("about:")) & 1) != 0
      || objc_msgSend(v6, "length") <= v7 + 1)
    {

    }
    else
    {
      LODWORD(v7) = objc_msgSend(v6, "characterAtIndex:") - 58;

      if ((unsigned __int16)v7 > 0xFFF5u)
        goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "safari_URLWithUserTypedString:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v4[2](v4, v14, &v18);
      LOBYTE(v7) = v18 != 0;
    }

    v10 = (v14 != 0) & v7;
    goto LABEL_47;
  }

LABEL_6:
  if (objc_msgSend(v6, "safari_hasCaseInsensitivePrefix:", CFSTR("www.")))
  {
    urlWithAddedComponents((NSString *)v6, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      goto LABEL_45;
    goto LABEL_46;
  }
  v11 = objc_msgSend(v3, "rangeOfString:", CFSTR("/"));
  v12 = objc_msgSend(v3, "rangeOfString:", CFSTR("@"));
  if (v12 != 0x7FFFFFFFFFFFFFFFLL && (v11 == 0x7FFFFFFFFFFFFFFFLL || v12 < v11))
  {
    urlWithAddedComponents((NSString *)v6, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      goto LABEL_45;
    goto LABEL_46;
  }
  v13 = objc_msgSend(v3, "rangeOfString:", CFSTR("."));
  if (v13 != 0x7FFFFFFFFFFFFFFFLL && (v11 == 0x7FFFFFFFFFFFFFFFLL || v13 < v11))
  {
    urlWithAddedComponents((NSString *)v6, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      v4[2](v4, v15, &v18);

    if (!v18)
    {
      urlWithAddedComponents((NSString *)v6, 3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        goto LABEL_45;
      goto LABEL_46;
    }
  }
  else
  {
    if ((objc_msgSend(v6, "safari_isCaseInsensitiveEqualToString:", CFSTR("localhost")) & 1) != 0
      || objc_msgSend(v6, "safari_hasCaseInsensitivePrefix:", CFSTR("localhost/")))
    {
      urlWithAddedComponents((NSString *)v6, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        goto LABEL_45;
      goto LABEL_46;
    }
    urlWithAddedComponents((NSString *)v6, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v4[2](v4, v16, &v18);

    if (!v18)
    {
      urlWithAddedComponents((NSString *)v6, 7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
LABEL_45:
        v4[2](v4, v9, &v18);
LABEL_46:

      v10 = v18 != 0;
      goto LABEL_47;
    }
  }
  v10 = 1;
LABEL_47:

  return v10;
}

void sub_1B2652774(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B2652804()
{
  JUMPOUT(0x1B26527F4);
}

void sub_1B2652990(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B2652B1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B2652C78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B2652D3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B2652E14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B2652ED4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B2652F34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2652FCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B265328C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B2653330(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B265339C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2653438(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B26534C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B26537F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{

  _Unwind_Resume(a1);
}

void sub_1B265396C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B26539C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2653AAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B2653C5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL fileExists(NSURL *a1)
{
  id v1;
  _BOOL8 v2;
  stat v4;

  -[NSURL path](a1, "path");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = lstat((const char *)objc_msgSend(v1, "fileSystemRepresentation"), &v4) == 0;

  return v2;
}

void sub_1B2653CF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2653D58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id urlWithAddedComponents(NSString *a1, uint64_t a2)
{
  NSString *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFRange v13;

  v3 = a1;
  if (-[NSString length](v3, "length") && -[NSString characterAtIndex:](v3, "characterAtIndex:", 0) != 47)
  {
    v5 = (__CFString *)-[NSString mutableCopy](v3, "mutableCopy");
    v6 = v5;
    if ((a2 & 1) != 0)
    {
      -[__CFString insertString:atIndex:](v5, "insertString:atIndex:", CFSTR("http://"), 0);
      a2 &= ~1uLL;
    }
    if (a2)
    {
      v7 = -[__CFString rangeOfString:](v6, "rangeOfString:", CFSTR("://"));
      v8 = v7;
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if ((a2 & 2) != 0)
          -[__CFString insertString:atIndex:](v6, "insertString:atIndex:", CFSTR("www."), v7 + 3);
        if ((a2 & 4) != 0)
        {
          v9 = v8 + 3;
          v10 = -[__CFString length](v6, "length") - v8 - 3;
          v11 = -[__CFString rangeOfString:options:range:](v6, "rangeOfString:options:range:", CFSTR(":"), 0, v9, v10);
          if (v11 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v11 = -[__CFString rangeOfString:options:range:](v6, "rangeOfString:options:range:", CFSTR("/"), 0, v9, v10);
            if (v11 == 0x7FFFFFFFFFFFFFFFLL)
              v11 = -[__CFString length](v6, "length");
          }
          v13.location = v11 - 4;
          v13.length = 4;
          if (CFStringCompareWithOptions(v6, CFSTR(".com"), v13, 1uLL))
            -[__CFString insertString:atIndex:](v6, "insertString:atIndex:", CFSTR(".com"), v11);
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "safari_URLWithUserTypedString:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_1B2653F2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void WBSReportThreadLocationAndSleep(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v6;
  NSObject *v7;
  size_t v8;
  int v9[2];
  int v10;
  pid_t v11;
  uint8_t buf[32];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = WBS_LOG_CHANNEL_PREFIXDebugUtilities();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    WBSReportThreadLocationAndSleep_cold_1(v6);
  v7 = WBS_LOG_CHANNEL_PREFIXDebugUtilities();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = a1;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a2;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = a3;
    _os_log_error_impl(&dword_1B2621000, v7, OS_LOG_TYPE_ERROR, "\t at %{public}s(%d) : %s\n", buf, 0x1Cu);
  }
  while (1)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v18 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
    memset(buf, 0, sizeof(buf));
    *(_QWORD *)v9 = 0xE00000001;
    v10 = 1;
    v11 = getpid();
    v8 = 648;
    if (sysctl(v9, 4u, buf, &v8, 0, 0) != -1 && (v13 & 0x800) != 0)
      break;
    sleep(1u);
  }
  __break(0);
  JUMPOUT(0x1B26549D0);
}

void WBSLogWithDifferentialPrivacy(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(CFSTR("com.apple.safari."), "stringByAppendingString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "copy");

    if (loggingQueue(void)::onceToken != -1)
      dispatch_once(&loggingQueue(void)::onceToken, &__block_literal_global_9);
    v7 = loggingQueue(void)::loggingQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __WBSLogWithDifferentialPrivacy_block_invoke;
    v9[3] = &unk_1E649A540;
    v10 = v5;
    v4 = v6;
    v11 = v4;
    v8 = v5;
    dispatch_async(v7, v9);

  }
}

void sub_1B2655018(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B2655160(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZL12loggingQueuev_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.Safari.WBSDifferentialPrivacyLogger", v2);
  v1 = (void *)loggingQueue(void)::loggingQueue;
  loggingQueue(void)::loggingQueue = (uint64_t)v0;

}

void WBSDispatchGroupNotifyWithTimeout(void *a1, void *a2, void *a3, double a4)
{
  id v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_block_t v12;
  dispatch_time_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD block[5];
  _QWORD aBlock[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[3];
  char v26;

  v7 = a3;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__3;
  v23[4] = __Block_byref_object_dispose__3;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __WBSDispatchGroupNotifyWithTimeout_block_invoke;
  aBlock[3] = &unk_1E649C190;
  v21 = v7;
  v22 = v25;
  v9 = v7;
  v10 = a2;
  v11 = a1;
  v24 = _Block_copy(aBlock);
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __WBSDispatchGroupNotifyWithTimeout_block_invoke_2;
  block[3] = &unk_1E649A1E8;
  block[4] = v23;
  v12 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
  dispatch_group_notify(v11, v10, v12);

  v13 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __WBSDispatchGroupNotifyWithTimeout_block_invoke_3;
  v15[3] = &unk_1E649C1B8;
  v17 = v25;
  v18 = v23;
  v16 = v12;
  v14 = v12;
  dispatch_after(v13, v10, v15);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);
}

void *__Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

id WBSReadExactAmountOfBytesFromFileDescriptorAsNSData(int a1, size_t a2, _QWORD *a3)
{
  id v6;
  size_t v7;
  id v8;

  v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", a2));
  v7 = WBSReadExactAmountOfBytesFromFileDescriptor(a1, (char *)objc_msgSend(v6, "mutableBytes"), a2);
  if ((v7 & 0x8000000000000000) != 0)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
      v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  if (!v7)
    goto LABEL_6;
  v8 = v6;
LABEL_7:

  return v8;
}

ssize_t WBSWriteExactAmountOfBytesToFileDescriptor(int __fd, char *__buf, size_t __nbyte)
{
  ssize_t result;
  size_t v5;
  char *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t buf[4];
  int v11;
  uint64_t v12;

  result = 0;
  v12 = *MEMORY[0x1E0C80C00];
  if (!__buf)
    return result;
  v5 = __nbyte;
  if (!__nbyte)
    return result;
  v6 = __buf;
  while (1)
  {
    result = write(__fd, v6, v5);
    if (v5 == result)
      return v5;
    if (!result)
      return result;
    if (result < 0)
      break;
    v6 += result;
    v5 -= result;
LABEL_11:
    if (!v5)
      return 0;
  }
  v7 = *__error();
  v8 = WBS_LOG_CHANNEL_PREFIXOther();
  v9 = v8;
  if (v7 == 4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v11 = __fd;
      _os_log_impl(&dword_1B2621000, v9, OS_LOG_TYPE_INFO, "Interrupted while writing to file descriptor %d; trying again",
        buf,
        8u);
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    WBSWriteExactAmountOfBytesToFileDescriptor_cold_1(v9, __fd);
  return -1;
}

void sub_1B2657714(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_1B26594F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2659664(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B26596E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1B265976C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)WBSKeychainCredentialNotificationMonitor;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1B2659CCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2659D9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2659EF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B265B688(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, const __CFString *a11)
{
  _QWORD *v11;
  void *v12;
  void *v13;

  if (a2)
  {
    objc_begin_catch(exception_object);
    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      a10 = *MEMORY[0x1E0CB2D50];
      a11 = CFSTR("Invalid JSON object");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &a11, &a10, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Safari.Core.WBSJSONWriterErrorDomain"), 7, v13);
      *v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_end_catch();
    JUMPOUT(0x1B265B64CLL);
  }
  _Unwind_Resume(exception_object);
}

BOOL WBSKeychainItemExists(void *a1, void *a2, void *a3, _DWORD *a4)
{
  int PasswordAndItem;

  PasswordAndItem = getPasswordAndItem(a1, a2, a3, 0, 1, 0);
  if (a4)
    *a4 = PasswordAndItem;
  return PasswordAndItem == 0;
}

uint64_t getPasswordAndItem(void *a1, void *a2, void *a3, _QWORD *a4, char a5, _QWORD *a6)
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  CFTypeRef result;
  uint8_t buf[4];
  _BYTE v34[34];
  _QWORD v35[5];
  _QWORD v36[6];

  v36[5] = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = *MEMORY[0x1E0CD6CA8];
  v15 = *MEMORY[0x1E0CD6B58];
  v35[0] = *MEMORY[0x1E0CD6C98];
  v35[1] = v15;
  v36[0] = v14;
  v36[1] = v12;
  v16 = *MEMORY[0x1E0CD68F8];
  v17 = *MEMORY[0x1E0CD7018];
  v35[2] = *MEMORY[0x1E0CD68F8];
  v35[3] = v17;
  v18 = *MEMORY[0x1E0C9AE50];
  v36[2] = v13;
  v36[3] = v18;
  v35[4] = *MEMORY[0x1E0CD7020];
  v36[4] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  if (v11)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CD6898]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11 != 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CD6B80]);

  if ((a5 & 2) != 0)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70A8]);
  result = 0;
  v22 = SecItemCopyMatching((CFDictionaryRef)v20, &result);
  if ((_DWORD)v22 == -34018)
  {
    if ((a5 & 1) == 0)
    {
      v22 = 4294933278;
LABEL_12:
      if (a4)
        *a4 = 0;
      if ((_DWORD)v22 == -25300)
      {
        v29 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543875;
          *(_QWORD *)v34 = v11;
          *(_WORD *)&v34[8] = 2114;
          *(_QWORD *)&v34[10] = v12;
          *(_WORD *)&v34[18] = 2113;
          *(_QWORD *)&v34[20] = v13;
          _os_log_impl(&dword_1B2621000, v29, OS_LOG_TYPE_INFO, "SecItemCopyMatching failed: Item not found; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
            buf,
            0x20u);
        }
        v22 = 4294941996;
      }
      else if ((_DWORD)v22 == -128)
      {
        v25 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543875;
          *(_QWORD *)v34 = v11;
          *(_WORD *)&v34[8] = 2114;
          *(_QWORD *)&v34[10] = v12;
          *(_WORD *)&v34[18] = 2113;
          *(_QWORD *)&v34[20] = v13;
          _os_log_impl(&dword_1B2621000, v25, OS_LOG_TYPE_INFO, "SecItemCopyMatching failed: User canceled; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
            buf,
            0x20u);
        }
        v22 = 4294967168;
      }
      else
      {
        v30 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109891;
          *(_DWORD *)v34 = v22;
          *(_WORD *)&v34[4] = 2114;
          *(_QWORD *)&v34[6] = v11;
          *(_WORD *)&v34[14] = 2114;
          *(_QWORD *)&v34[16] = v12;
          *(_WORD *)&v34[24] = 2113;
          *(_QWORD *)&v34[26] = v13;
          _os_log_error_impl(&dword_1B2621000, v30, OS_LOG_TYPE_ERROR, "SecItemCopyMatching failed with error %d; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
            buf,
            0x26u);
        }
      }
      goto LABEL_31;
    }
    v23 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543875;
      *(_QWORD *)v34 = v11;
      *(_WORD *)&v34[8] = 2114;
      *(_QWORD *)&v34[10] = v12;
      *(_WORD *)&v34[18] = 2113;
      *(_QWORD *)&v34[20] = v13;
      _os_log_error_impl(&dword_1B2621000, v23, OS_LOG_TYPE_ERROR, "SecItemCopyMatching failed: Missing entitlement. Falling back to legacy keychain; accessGroup: %{public}@, servi"
        "ce: %{public}@, account: %{private}@",
        buf,
        0x20u);
    }
    objc_msgSend(v20, "removeObjectForKey:", *MEMORY[0x1E0CD70A8]);
    objc_msgSend(v13, "stringByAppendingString:", CFSTR("ForWebKitDevelopment"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v24, v16);

    v22 = SecItemCopyMatching((CFDictionaryRef)v20, &result);
  }
  if ((_DWORD)v22)
    goto LABEL_12;
  v26 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543875;
    *(_QWORD *)v34 = v11;
    *(_WORD *)&v34[8] = 2114;
    *(_QWORD *)&v34[10] = v12;
    *(_WORD *)&v34[18] = 2113;
    *(_QWORD *)&v34[20] = v13;
    _os_log_debug_impl(&dword_1B2621000, v26, OS_LOG_TYPE_DEBUG, "SecItemCopyMatching succeeded; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
      buf,
      0x20u);
  }
  v27 = (void *)result;
  if (a4)
  {
    objc_msgSend((id)result, "objectForKey:", *MEMORY[0x1E0CD70D8]);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a6)
  {
    objc_msgSend(v27, "objectForKey:", *MEMORY[0x1E0CD70E0]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *a6 = (id)objc_msgSend(v28, "copy");

  }
  v22 = 0;
LABEL_31:

  return v22;
}

uint64_t WBSGetKeychainPassword(void *a1, void *a2, void *a3, _QWORD *a4)
{
  return getPasswordAndItem(a1, a2, a3, a4, 1, 0);
}

uint64_t WBSGetKeychainData(void *a1, void *a2, void *a3, char a4, _QWORD *a5)
{
  return getPasswordAndItem(a1, a2, a3, a5, a4, 0);
}

BOOL WBSSetKeychainData(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, char a7, _QWORD *a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  int PasswordAndItem;
  const __CFDictionary *v22;
  const __CFDictionary *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  const __CFDictionary *v44;
  uint64_t v45;
  const __CFDictionary *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  const __CFDictionary *v55;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  _QWORD *v66;
  id v67;
  CFTypeRef result;
  _QWORD v69[3];
  _QWORD v70[3];
  _QWORD v71[2];
  _QWORD v72[2];
  uint8_t v73[4];
  _BYTE v74[34];
  _QWORD v75[7];
  _BYTE buf[40];
  id v77;
  uint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v15 = a1;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v67 = 0;
  PasswordAndItem = getPasswordAndItem(v15, v16, v17, 0, a7, &v67);
  v22 = (const __CFDictionary *)v67;
  v23 = v22;
  if (!PasswordAndItem)
  {
    v66 = a8;
    v42 = *MEMORY[0x1E0CD6C98];
    v71[0] = *MEMORY[0x1E0CD70E0];
    v71[1] = v42;
    v43 = *MEMORY[0x1E0CD6CA8];
    v72[0] = v22;
    v72[1] = v43;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
    v44 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v45 = *MEMORY[0x1E0CD6A90];
    v69[0] = *MEMORY[0x1E0CD70D8];
    v69[1] = v45;
    v65 = v18;
    v70[0] = v18;
    v70[1] = v19;
    v69[2] = *MEMORY[0x1E0CD6988];
    v70[2] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 3);
    v46 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    PasswordAndItem = SecItemUpdate(v44, v46);
    v47 = WBS_LOG_CHANNEL_PREFIXKeychain();
    v48 = v47;
    if (PasswordAndItem)
    {
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109891;
        *(_DWORD *)&buf[4] = PasswordAndItem;
        *(_WORD *)&buf[8] = 2114;
        *(_QWORD *)&buf[10] = v15;
        *(_WORD *)&buf[18] = 2114;
        *(_QWORD *)&buf[20] = v16;
        *(_WORD *)&buf[28] = 2113;
        *(_QWORD *)&buf[30] = v17;
        _os_log_error_impl(&dword_1B2621000, v48, OS_LOG_TYPE_ERROR, "SecItemUpdate failed with error %d; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
          buf,
          0x26u);
      }
    }
    else if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543875;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2113;
      *(_QWORD *)&buf[24] = v17;
      _os_log_debug_impl(&dword_1B2621000, v48, OS_LOG_TYPE_DEBUG, "SecItemUpdate succeeded; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
        buf,
        0x20u);
    }

    goto LABEL_32;
  }
  if (PasswordAndItem != -25300)
    goto LABEL_33;
  v66 = a8;
  v61 = v15;
  v24 = v15;
  v25 = v20;
  v26 = v19;
  v27 = v24;
  v28 = v16;
  v29 = v17;
  v65 = v18;
  v30 = v18;
  v62 = v26;
  v31 = v26;
  v20 = v25;
  v32 = v31;
  v33 = v20;
  v34 = *MEMORY[0x1E0CD6CA8];
  v35 = *MEMORY[0x1E0CD6B58];
  v75[0] = *MEMORY[0x1E0CD6C98];
  v75[1] = v35;
  *(_QWORD *)buf = v34;
  *(_QWORD *)&buf[8] = v28;
  v63 = v28;
  v36 = *MEMORY[0x1E0CD70D8];
  v57 = *MEMORY[0x1E0CD68F8];
  v75[2] = *MEMORY[0x1E0CD68F8];
  v75[3] = v36;
  v64 = v29;
  *(_QWORD *)&buf[16] = v29;
  *(_QWORD *)&buf[24] = v30;
  v37 = v27;
  v60 = v30;
  v38 = *MEMORY[0x1E0CD6988];
  v75[4] = *MEMORY[0x1E0CD6A90];
  v75[5] = v38;
  v58 = v33;
  v59 = v32;
  *(_QWORD *)&buf[32] = v32;
  v77 = v33;
  v75[6] = *MEMORY[0x1E0CD7020];
  v78 = *MEMORY[0x1E0C9AE50];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v75, 7);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "mutableCopy");

  if (v27)
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0CD6898]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27 != 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v41, *MEMORY[0x1E0CD6B80]);

  if ((a7 & 2) != 0)
  {
    objc_msgSend(v40, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70A8]);
    if (!v27)
      objc_msgSend(v40, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD69C0]);
  }
  result = 0;
  PasswordAndItem = SecItemAdd((CFDictionaryRef)v40, &result);
  v15 = v61;
  v19 = v62;
  if (PasswordAndItem == -34018)
  {
    if ((a7 & 1) == 0)
    {
      PasswordAndItem = -34018;
      goto LABEL_24;
    }
    v49 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v73 = 138543875;
      *(_QWORD *)v74 = v37;
      *(_WORD *)&v74[8] = 2114;
      *(_QWORD *)&v74[10] = v63;
      *(_WORD *)&v74[18] = 2113;
      *(_QWORD *)&v74[20] = v64;
      _os_log_error_impl(&dword_1B2621000, v49, OS_LOG_TYPE_ERROR, "SecItemAdd failed: Missing entitlement. Falling back to legacy keychain. accessGroup: %{public}@, service: %{public}@, account: %{private}@", v73, 0x20u);
    }
    objc_msgSend(v40, "removeObjectForKey:", *MEMORY[0x1E0CD70A8]);
    objc_msgSend(v40, "removeObjectForKey:", *MEMORY[0x1E0CD69C0]);
    objc_msgSend(v64, "stringByAppendingString:", CFSTR("ForWebKitDevelopment"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v50, v57);

    PasswordAndItem = SecItemAdd((CFDictionaryRef)v40, &result);
  }
  if (PasswordAndItem == -128)
  {
    v54 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v73 = 138543875;
      *(_QWORD *)v74 = v37;
      *(_WORD *)&v74[8] = 2114;
      *(_QWORD *)&v74[10] = v63;
      *(_WORD *)&v74[18] = 2113;
      *(_QWORD *)&v74[20] = v64;
      _os_log_impl(&dword_1B2621000, v54, OS_LOG_TYPE_INFO, "SecItemAdd failed: User canceled; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
        v73,
        0x20u);
    }
    v53 = 0;
    PasswordAndItem = -128;
    goto LABEL_31;
  }
  if (!PasswordAndItem)
  {
    v51 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v73 = 138543875;
      *(_QWORD *)v74 = v37;
      *(_WORD *)&v74[8] = 2114;
      *(_QWORD *)&v74[10] = v63;
      *(_WORD *)&v74[18] = 2113;
      *(_QWORD *)&v74[20] = v64;
      _os_log_debug_impl(&dword_1B2621000, v51, OS_LOG_TYPE_DEBUG, "SecItemAdd succeeded; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
        v73,
        0x20u);
    }
    v53 = objc_retainAutorelease((id)result);

    PasswordAndItem = 0;
    goto LABEL_31;
  }
LABEL_24:
  v52 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v73 = 67109891;
    *(_DWORD *)v74 = PasswordAndItem;
    *(_WORD *)&v74[4] = 2114;
    *(_QWORD *)&v74[6] = v37;
    *(_WORD *)&v74[14] = 2114;
    *(_QWORD *)&v74[16] = v63;
    *(_WORD *)&v74[24] = 2113;
    *(_QWORD *)&v74[26] = v64;
    _os_log_error_impl(&dword_1B2621000, v52, OS_LOG_TYPE_ERROR, "SecItemAdd failed with error %d; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
      v73,
      0x26u);
  }
  v53 = 0;
LABEL_31:

  v55 = v53;
  v44 = v23;
  v23 = v55;
LABEL_32:

  v18 = v65;
  a8 = v66;
LABEL_33:
  if (a8)
    *a8 = objc_retainAutorelease(v23);

  return PasswordAndItem == 0;
}

BOOL WBSSetKeychainPassword(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, _QWORD *a7)
{
  return WBSSetKeychainData(a1, a2, a3, a4, a5, a6, 1, a7);
}

BOOL WBSRemoveKeychainData(void *a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  int v14;
  _BYTE v15[34];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = removeKeychainData(v7, v8, v9, a4);
  v11 = WBS_LOG_CHANNEL_PREFIXKeychain();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = 67109891;
      *(_DWORD *)v15 = v10;
      *(_WORD *)&v15[4] = 2114;
      *(_QWORD *)&v15[6] = v7;
      *(_WORD *)&v15[14] = 2114;
      *(_QWORD *)&v15[16] = v8;
      *(_WORD *)&v15[24] = 2113;
      *(_QWORD *)&v15[26] = v9;
      _os_log_error_impl(&dword_1B2621000, v12, OS_LOG_TYPE_ERROR, "SecItemDelete failed with error %d; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
        (uint8_t *)&v14,
        0x26u);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138543875;
    *(_QWORD *)v15 = v7;
    *(_WORD *)&v15[8] = 2114;
    *(_QWORD *)&v15[10] = v8;
    *(_WORD *)&v15[18] = 2113;
    *(_QWORD *)&v15[20] = v9;
    _os_log_debug_impl(&dword_1B2621000, v12, OS_LOG_TYPE_DEBUG, "SecItemDelete succeeded; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
      (uint8_t *)&v14,
      0x20u);
  }

  return v10 == 0;
}

uint64_t removeKeychainData(void *a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = *MEMORY[0x1E0CD6CA8];
  v11 = *MEMORY[0x1E0CD6B58];
  v19[0] = *MEMORY[0x1E0CD6C98];
  v19[1] = v11;
  v20[0] = v10;
  v20[1] = v8;
  v19[2] = *MEMORY[0x1E0CD68F8];
  v20[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  if (v7)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CD6898]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7 != 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CD6B80]);

  if ((a4 & 1) != 0)
  {
    v15 = SecItemDelete((CFDictionaryRef)v13);
    if ((a4 & 2) != 0)
    {
LABEL_5:
      objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70A8]);
      v16 = SecItemDelete((CFDictionaryRef)v13);
      if (!(_DWORD)v15)
        goto LABEL_10;
LABEL_9:
      if ((_DWORD)v15 != -25300)
        goto LABEL_19;
      goto LABEL_10;
    }
  }
  else
  {
    v15 = 4294941996;
    if ((a4 & 2) != 0)
      goto LABEL_5;
  }
  v16 = 4294941996;
  if ((_DWORD)v15)
    goto LABEL_9;
LABEL_10:
  if ((_DWORD)v16 && (_DWORD)v16 != -25300)
  {
    v15 = v16;
  }
  else
  {
    if ((_DWORD)v16)
      v17 = (_DWORD)v15 == 0;
    else
      v17 = 1;
    if (v17)
      v15 = 0;
    else
      v15 = 4294941996;
  }
LABEL_19:

  return v15;
}

uint64_t WBSRemoveKeychainDataIfExists(void *a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  id v9;
  int v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  uint64_t v15;
  int v17;
  _BYTE v18[34];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = removeKeychainData(v7, v8, v9, a4);
  v11 = v10;
  if (v10 != -25300 && v10)
  {
    v13 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = 67109891;
      *(_DWORD *)v18 = v11;
      *(_WORD *)&v18[4] = 2114;
      *(_QWORD *)&v18[6] = v7;
      *(_WORD *)&v18[14] = 2114;
      *(_QWORD *)&v18[16] = v8;
      *(_WORD *)&v18[24] = 2113;
      *(_QWORD *)&v18[26] = v9;
      _os_log_error_impl(&dword_1B2621000, v13, OS_LOG_TYPE_ERROR, "SecItemDelete failed with error %d; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
        (uint8_t *)&v17,
        0x26u);
    }
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v17 = 138543875;
      *(_QWORD *)v18 = v7;
      *(_WORD *)&v18[8] = 2114;
      *(_QWORD *)&v18[10] = v8;
      *(_WORD *)&v18[18] = 2113;
      *(_QWORD *)&v18[20] = v9;
      _os_log_debug_impl(&dword_1B2621000, v12, OS_LOG_TYPE_DEBUG, "SecItemDelete succeeded; accessGroup: %{public}@, service: %{public}@, account: %{private}@",
        (uint8_t *)&v17,
        0x20u);
    }
  }
  if (v11)
    v14 = v11 == -25300;
  else
    v14 = 1;
  v15 = v14;

  return v15;
}

uint64_t WBSRemoveKeychainPasswordIfExists(void *a1, void *a2, void *a3)
{
  return WBSRemoveKeychainDataIfExists(a1, a2, a3, 1);
}

id _WBSLocalizedStringWithCurrentUserLocale(void *a1, dispatch_once_t *a2, id *a3)
{
  id v5;
  __CFBundle *v6;
  id v7;
  void *v8;
  const __CFArray *v9;
  const __CFArray *v10;
  CFArrayRef v11;
  const __CFArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  determineBundle(a2, (uint64_t)a3);
  v6 = (__CFBundle *)objc_msgSend(*a3, "_cfBundle");
  v7 = v5;
  if (v7)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *LocalizedKeyWithCurrentUserLocaleForBundle(CFBundleRef, NSString *__strong, NSString * _Nullable __strong)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("WBSLocalizableStrings.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("formatKey"));

    if (v6)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *LocalizedKeyWithCurrentUserLocaleForBundle(CFBundleRef, NSString *__strong, NSString * _Nullable __strong)");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("WBSLocalizableStrings.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundle"));

LABEL_3:
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (const __CFArray *)objc_msgSend(v8, "mutableCopy");

  v10 = CFBundleCopyBundleLocalizations(v6);
  v11 = CFBundleCopyLocalizationsForPreferences(v10, v9);
  CFRelease(v10);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = v11;
  v13 = -[__CFArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        v17 = CFBundleCopyLocalizedStringForLocalization();
        if (v17)
        {
          v18 = (void *)v17;
          goto LABEL_13;
        }
      }
      v14 = -[__CFArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v14)
        continue;
      break;
    }
  }
  v18 = 0;
LABEL_13:

  return v18;
}

void sub_1B265D4E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WBSManagedExtensionsConfigurationDisplayTitle()
{
  return _WBSLocalizedString(CFSTR("Safari Extensions"), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
}

id WBSManagedExtensionsConfigurationDisplayDescription()
{
  return _WBSLocalizedString(CFSTR("Safari Extension Management"), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
}

id WBSManagedExtensionsConfigurationDisplayAlwaysOnText()
{
  return _WBSLocalizedString(CFSTR("Always On"), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
}

id WBSManagedExtensionsConfigurationDisplayAlwaysOffText()
{
  return _WBSLocalizedString(CFSTR("Always Off"), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
}

id WBSManagedExtensionsConfigurationDisplayAllExtensionsText()
{
  return _WBSLocalizedString(CFSTR("All Extensions"), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
}

id WBSManagedExtensionsConfigurationDisplayAllOtherExtensionsText()
{
  return _WBSLocalizedString(CFSTR("All Other Extensions"), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
}

uint64_t managedExtensionStateFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("AlwaysOn")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("AlwaysOff")) & 1) != 0)
  {
    v2 = 2;
  }
  else
  {
    objc_msgSend(v1, "isEqualToString:", CFSTR("Allowed"));
    v2 = 0;
  }

  return v2;
}

void enumerateAsynchronously(void *a1, void *a2, unint64_t a3, void *a4, void *a5)
{
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  unint64_t v18;

  v9 = a1;
  v10 = a2;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "count") <= a3)
  {
    dispatch_async(v9, v12);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __enumerateAsynchronously_block_invoke;
    block[3] = &unk_1E649CB40;
    v16 = v11;
    v14 = v10;
    v18 = a3;
    v15 = v9;
    v17 = v12;
    dispatch_async(v15, block);

  }
}

void sub_1B2661678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __enumerateAsynchronously_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 64);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __enumerateAsynchronously_block_invoke_2;
  v7[3] = &unk_1E649CB18;
  v8 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 64);
  v9 = v5;
  v12 = v6;
  v11 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, void *, uint64_t, _QWORD *))(v2 + 16))(v2, v3, v4, v7);

}

void __enumerateAsynchronously_block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v3;

  v3 = *(NSObject **)(a1 + 32);
  if (a2)
    dispatch_async(v3, *(dispatch_block_t *)(a1 + 48));
  else
    enumerateAsynchronously(v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64) + 1, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t ___dateFormatTemplatesWithLongMonth_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_dateFormatTemplatesWithLongMonth_dateFormats;
  _dateFormatTemplatesWithLongMonth_dateFormats = v0;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  result = objc_msgSend(&unk_1E64D1118, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  v14 = result;
  if (result)
  {
    v13 = *(_QWORD *)v28;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(&unk_1E64D1118);
        v15 = v3;
        v4 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v3);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v17 = objc_msgSend(&unk_1E64D1130, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
        if (v17)
        {
          v16 = *(_QWORD *)v24;
          do
          {
            v5 = 0;
            do
            {
              if (*(_QWORD *)v24 != v16)
                objc_enumerationMutation(&unk_1E64D1130);
              v18 = v5;
              v6 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v5);
              v19 = 0u;
              v20 = 0u;
              v21 = 0u;
              v22 = 0u;
              v7 = objc_msgSend(&unk_1E64D1148, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
              if (v7)
              {
                v8 = v7;
                v9 = *(_QWORD *)v20;
                do
                {
                  v10 = 0;
                  do
                  {
                    if (*(_QWORD *)v20 != v9)
                      objc_enumerationMutation(&unk_1E64D1148);
                    v11 = (void *)_dateFormatTemplatesWithLongMonth_dateFormats;
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v4, v6, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10));
                    v12 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v11, "addObject:", v12);

                    ++v10;
                  }
                  while (v8 != v10);
                  v8 = objc_msgSend(&unk_1E64D1148, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
                }
                while (v8);
              }
              v5 = v18 + 1;
            }
            while (v18 + 1 != v17);
            v17 = objc_msgSend(&unk_1E64D1130, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
          }
          while (v17);
        }
        v3 = v15 + 1;
      }
      while (v15 + 1 != v14);
      result = objc_msgSend(&unk_1E64D1118, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      v14 = result;
    }
    while (result);
  }
  return result;
}

void sub_1B2664BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_1B2665528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B2665610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B2665934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B2665B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B2666240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__8(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

id WBSNSExtensionFromNSExtension(void *a1)
{
  return a1;
}

void sub_1B2666520(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B266658C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B26665EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2666640(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2666714(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B26668D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B26669C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B2666AA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2666B74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B2666C4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B2666D30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B2666D98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2666E7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B2667158(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B26673C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B2667800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1B2667A08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2667AF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B2667C30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1B2667F4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B26680D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B266823C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1B2668588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_1B2668738(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id WBSHTTPProtocolFromSecAttrProtocolValue(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  id v4;
  id *v5;
  NSObject *v6;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = v1;
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CD6AF0]))
    {
      v5 = (id *)MEMORY[0x1E0C92B90];
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CD6B00]))
      {
        v6 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          WBSHTTPProtocolFromSecAttrProtocolValue_cold_2();
        v3 = 0;
        goto LABEL_13;
      }
      v5 = (id *)MEMORY[0x1E0C92BA0];
    }
    v3 = *v5;
LABEL_13:

    goto LABEL_14;
  }
  v2 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    WBSHTTPProtocolFromSecAttrProtocolValue_cold_1(v2);
  v3 = 0;
LABEL_14:

  return v3;
}

id queryForUserInProtectionSpace(void *a1, void *a2, uint64_t a3, void *a4, int a5)
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  partialKeychainDictionaryForUserInProtectionSpace(a1, a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0CD70A8];
  v12 = MEMORY[0x1E0C9AAB0];
  v29[0] = MEMORY[0x1E0C9AAB0];
  v13 = *MEMORY[0x1E0CD6898];
  v28[0] = v11;
  v28[1] = v13;
  v14 = CFSTR("com.apple.cfnetwork.testing");
  v15 = CFSTR("com.apple.cfnetwork-recently-deleted.testing");
  if (!shouldUseTestingAccessGroups)
  {
    v14 = CFSTR("com.apple.cfnetwork");
    v15 = CFSTR("com.apple.cfnetwork-recently-deleted");
  }
  if (!a5)
    v15 = (__CFString *)v14;
  v16 = v15;
  v29[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addEntriesFromDictionary:", v17);

  if (a3 == 1)
  {
    v18 = *MEMORY[0x1E0CD7018];
    v26[0] = *MEMORY[0x1E0CD7010];
    v26[1] = v18;
    v27[0] = v12;
    v27[1] = v12;
    v19 = *MEMORY[0x1E0CD7020];
    v26[2] = *MEMORY[0x1E0CD6F30];
    v26[3] = v19;
    v27[2] = *MEMORY[0x1E0CD6F40];
    v27[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addEntriesFromDictionary:", v20);

  }
  v21 = objc_msgSend(v9, "length");
  v22 = *MEMORY[0x1E0CD6B80];
  if (v21)
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v22);
    v22 = *MEMORY[0x1E0CD6B60];
    v23 = v10;
    v24 = v9;
  }
  else
  {
    v24 = (id)MEMORY[0x1E0C9AAB0];
    v23 = v10;
  }
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, v22);

  return v10;
}

id queryForPasskeyFromSavedAccount(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  __CFString *v9;
  const __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  _QWORD v28[4];
  _QWORD v29[4];
  _QWORD v30[5];
  _QWORD v31[6];

  v31[5] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_alloc(MEMORY[0x1E0C99D50]);
  objc_msgSend(v1, "passkeyCredentialID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithBase64EncodedString:options:", v3, 0);

  v5 = *MEMORY[0x1E0CD6CC0];
  v6 = *MEMORY[0x1E0CD6900];
  v30[0] = *MEMORY[0x1E0CD6C98];
  v30[1] = v6;
  v31[0] = v5;
  v31[1] = v4;
  v7 = *MEMORY[0x1E0CD6898];
  v30[2] = *MEMORY[0x1E0CD6898];
  v8 = objc_msgSend(v1, "isRecentlyDeleted");
  v9 = CFSTR("com.apple.webkit.webauthn-recently-deleted.testing");
  if (shouldUseTestingAccessGroups)
    v10 = CFSTR("com.apple.webkit.webauthn.testing");
  else
    v10 = CFSTR("com.apple.webkit.webauthn");
  if (!shouldUseTestingAccessGroups)
    v9 = CFSTR("com.apple.webkit.webauthn-recently-deleted");
  if (!v8)
    v9 = (__CFString *)v10;
  v11 = v9;
  v12 = v11;
  if (shouldUseTestingAccessGroups)
    v13 = CFSTR("com.apple.webkit.webauthn.testing");
  else
    v13 = CFSTR("com.apple.webkit.webauthn");
  v31[2] = v11;
  v31[3] = v13;
  v14 = *MEMORY[0x1E0CD70A8];
  v30[3] = v7;
  v30[4] = v14;
  v15 = MEMORY[0x1E0C9AAB0];
  v31[4] = MEMORY[0x1E0C9AAB0];
  v16 = (void *)MEMORY[0x1E0C99D80];
  v17 = v13;
  objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v31, v30, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(v18, "mutableCopy");
  v20 = *MEMORY[0x1E0CD7018];
  v28[0] = *MEMORY[0x1E0CD7010];
  v28[1] = v20;
  v29[0] = v15;
  v29[1] = v15;
  v21 = *MEMORY[0x1E0CD6F30];
  v28[2] = *MEMORY[0x1E0CD7020];
  v28[3] = v21;
  v22 = *MEMORY[0x1E0CD6F40];
  v29[2] = v15;
  v29[3] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addEntriesFromDictionary:", v23);

  v24 = objc_msgSend(v1, "isSavedInPersonalKeychain");
  v25 = *MEMORY[0x1E0CD6B80];
  if (v24)
  {
    objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v25);
  }
  else
  {
    objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v25);
    objc_msgSend(v1, "sharedGroupID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0CD6B60]);

  }
  return v19;
}

void sub_1B266CA88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id queryForSidecarOfTypeWithUserAndProtectionSpaceInGroupWithID(uint64_t a1, void *a2, void *a3, void *a4, int a5, uint64_t a6)
{
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  _QWORD *v25;
  _QWORD *v26;
  const __CFString *v27;
  const __CFString *v28;
  uint64_t v29;
  __CFString *v30;
  void *v31;
  const __CFString *v32;
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[4];
  _QWORD v39[5];

  v39[4] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  partialKeychainDictionaryForUserInProtectionSpace(a2, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70A8]);
  if (a6 == 1)
  {
    v14 = *MEMORY[0x1E0CD7010];
    v38[0] = *MEMORY[0x1E0CD7018];
    v38[1] = v14;
    v15 = *MEMORY[0x1E0CD6F30];
    v38[2] = *MEMORY[0x1E0CD7020];
    v38[3] = v15;
    v39[0] = v13;
    v39[1] = v13;
    v16 = *MEMORY[0x1E0CD6F40];
    v39[2] = v13;
    v39[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addEntriesFromDictionary:", v17);

  }
  if (objc_msgSend(v11, "length"))
  {
    if (a1 == 1936220530)
    {
      v29 = *MEMORY[0x1E0CD6B60];
      v34[0] = *MEMORY[0x1E0CD6B80];
      v34[1] = v29;
      v35[0] = MEMORY[0x1E0C9AAA0];
      v35[1] = v11;
      v34[2] = *MEMORY[0x1E0CD6898];
      if (shouldUseTestingAccessGroups)
        v20 = CFSTR("com.apple.password-manager.testing");
      else
        v20 = CFSTR("com.apple.password-manager");
      if (shouldUseTestingAccessGroups)
        v21 = CFSTR("com.apple.password-manager-recently-deleted.testing");
      else
        v21 = CFSTR("com.apple.password-manager-recently-deleted");
      if (a5)
        v30 = v21;
      else
        v30 = v20;
      v35[2] = v30;
      v24 = (void *)MEMORY[0x1E0C99D80];
      v25 = v35;
      v26 = v34;
    }
    else
    {
      if (a1 != 1835626085)
        goto LABEL_36;
      v18 = *MEMORY[0x1E0CD6B80];
      v37[0] = v13;
      v19 = *MEMORY[0x1E0CD6898];
      v36[0] = v18;
      v36[1] = v19;
      if (shouldUseTestingAccessGroups)
        v20 = CFSTR("com.apple.password-manager.personal.testing");
      else
        v20 = CFSTR("com.apple.password-manager.personal");
      if (shouldUseTestingAccessGroups)
        v21 = CFSTR("com.apple.password-manager.personal-recently-deleted.testing");
      else
        v21 = CFSTR("com.apple.password-manager.personal-recently-deleted");
      if (a5)
        v22 = v21;
      else
        v22 = v20;
      v23 = v22;
      v36[2] = *MEMORY[0x1E0CD6AC0];
      v37[1] = v23;
      v37[2] = v11;
      v24 = (void *)MEMORY[0x1E0C99D80];
      v25 = v37;
      v26 = v36;
    }
    objc_msgSend(v24, "dictionaryWithObjects:forKeys:count:", v25, v26, 3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addEntriesFromDictionary:", v31);

    if ((a5 & 1) != 0)
    else

  }
  else
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD6B80]);
    if ((a5 & 1) != 0)
    {
      v27 = CFSTR("com.apple.password-manager-recently-deleted.testing");
      v28 = CFSTR("com.apple.password-manager-recently-deleted");
    }
    else
    {
      v27 = CFSTR("com.apple.password-manager.testing");
      v28 = CFSTR("com.apple.password-manager");
    }
    if (shouldUseTestingAccessGroups)
      v32 = v27;
    else
      v32 = v28;
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0CD6898]);
  }
LABEL_36:

  return v12;
}

void sub_1B266FF78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id queryForPasswordFromSavedAccountAndProtectionSpace(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v5 = a2;
  v6 = a1;
  objc_msgSend(v6, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sharedGroupID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isRecentlyDeleted");

  queryForUserInProtectionSpace(v7, v5, a3, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void sub_1B2670360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B26706AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B267091C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id partialKeychainDictionaryForUserInProtectionSpace(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = *MEMORY[0x1E0CD6CB8];
  v5 = *MEMORY[0x1E0CD6910];
  v15[0] = *MEMORY[0x1E0CD6C98];
  v15[1] = v5;
  v6 = *MEMORY[0x1E0CD6920];
  v16[0] = v4;
  v16[1] = v6;
  v15[2] = *MEMORY[0x1E0CD6AD0];
  v7 = a2;
  v16[2] = objc_msgSend(v7, "safari_protocolAsSecAttrProtocolValue");
  v15[3] = *MEMORY[0x1E0CD6B50];
  objc_msgSend(v7, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v8;
  v15[4] = *MEMORY[0x1E0CD6AC8];
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = objc_msgSend(v7, "port");

  objc_msgSend(v9, "numberWithInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  if (v3)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0CD68F8]);

  return v13;
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_15(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

id OUTLINED_FUNCTION_18(uint64_t a1, void *a2)
{
  return a2;
}

id OUTLINED_FUNCTION_19(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_20()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_25(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x16u);
}

id OUTLINED_FUNCTION_28(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_29()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_31(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_32(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_1B26755F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *WBSCreditCardNumberFieldLabels()
{
  return &unk_1E64D12B0;
}

id creditCardLabels(int a1)
{
  id result;
  void *v2;
  void *v3;
  void *v4;

  switch(a1)
  {
    case 2:
      return &unk_1E64D11C0;
    case 3:
      return &unk_1E64D11D8;
    case 4:
      return &unk_1E64D11F0;
    case 5:
      return &unk_1E64D1208;
    case 6:
      return &unk_1E64D1220;
    case 7:
      return &unk_1E64D1238;
    case 8:
      return &unk_1E64D1250;
    case 9:
      v2 = &unk_1E64D1268;
      v3 = &unk_1E64D11F0;
      goto LABEL_14;
    case 10:
      v2 = &unk_1E64D1280;
      goto LABEL_13;
    case 11:
      v2 = &unk_1E64D1298;
LABEL_13:
      v3 = &unk_1E64D1238;
LABEL_14:
      objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    case 12:
      return &unk_1E64D12B0;
    case 13:
      return &unk_1E64D12C8;
    case 14:
      return &unk_1E64D12E0;
    case 15:
      return &unk_1E64D12F8;
    case 16:
      return &unk_1E64D1310;
    case 17:
      v4 = &unk_1E64D1328;
LABEL_21:
      result = v4;
      break;
    default:
      result = &unk_1E64D11A8;
      break;
  }
  return result;
}

void *WBSCreditCardSecurityCodeFieldLabels()
{
  return &unk_1E64D12C8;
}

void *WBSCreditCardCardholderFieldLabels()
{
  return &unk_1E64D12E0;
}

void *WBSCreditCardTypeFieldLabels()
{
  return &unk_1E64D12F8;
}

void *WBSCreditCardCompositeExpirationDateFieldLabels()
{
  return &unk_1E64D1310;
}

void *WBSNonCreditCardCardNumberFieldLabels()
{
  return &unk_1E64D1328;
}

id WBSCreditCardTypeSynonyms(uint64_t a1)
{
  id result;
  int v2;
  void *v3;

  switch(a1)
  {
    case 1:
      return &unk_1E64D1250;
    case 2:
      return &unk_1E64D1238;
    case 3:
      return &unk_1E64D11A8;
    case 4:
      return &unk_1E64D11F0;
    case 5:
      v2 = 9;
      goto LABEL_10;
    case 6:
      v2 = 10;
      goto LABEL_10;
    case 7:
      v2 = 11;
LABEL_10:
      creditCardLabels(v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 8:
      v3 = &unk_1E64D1220;
LABEL_12:
      result = v3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

id WBSAllowedCreditCardNumberSeparatorCharacters()
{
  void *v0;

  {
    v0 = (void *)WBSAllowedCreditCardNumberSeparatorCharacters::separators;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(" -"));
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    WBSAllowedCreditCardNumberSeparatorCharacters::separators = (uint64_t)v0;
  }
  return v0;
}

id WBSNormalizedCreditCardNumber(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    WBSAllowedCreditCardNumberSeparatorCharacters();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "componentsSeparatedByCharactersInSet:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsJoinedByString:", &stru_1E64A2498);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      v8 = 0;
      v1 = v4;
    }
    else
    {
      v8 = v4;
      v1 = v8;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_1B2675C7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t WBSCreditCardTypeFromNumber(void *a1)
{
  return WBSCreditCardTypeFromNumberAllowingPartialMatch(a1, 0);
}

uint64_t WBSCreditCardTypeFromNumberAllowingPartialMatch(void *a1, int a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v9;
  uint64_t v10;
  BOOL v11;
  _BOOL4 v12;
  char v13;
  int v14;
  _BOOL4 v15;
  char v16;

  v3 = a1;
  WBSNormalizedCreditCardNumber(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_6;
  if (!a2 || (v5 = WBSCreditCardTypeFromNumberAllowingPartialMatch(v4, 0)) == 0)
  {
    v6 = objc_msgSend(v4, "length");
    v7 = v6;
    if ((a2 & 1) == 0 && v6 <= 3)
    {
LABEL_6:
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v4, "stringByPaddingToLength:withString:startingAtIndex:", 4, CFSTR("0"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    if (a2)
    {
      if (v7 >= 0x11)
      {
        v11 = 0;
        v12 = 0;
        v13 = 0;
        goto LABEL_28;
      }
    }
    else if (v7 != 16 && v7 != 13)
    {
      v12 = 0;
      v11 = v7 < 0x11;
      goto LABEL_25;
    }
    if ((unint64_t)(v10 - 4000) < 0x3E8)
    {
      v5 = 1;
      goto LABEL_7;
    }
    v12 = v7 == 16;
    if (v7 == 16)
      v14 = 1;
    else
      v14 = a2;
    if (v14 == 1 && (unint64_t)(v10 - 5100) < 0x1F4)
    {
      v5 = 2;
      goto LABEL_7;
    }
    v11 = 1;
    if (a2)
    {
      v13 = 1;
      if (v7 >= 0x10)
        goto LABEL_28;
LABEL_26:
      v5 = 3;
      if ((unint64_t)(v10 - 3400) < 0x64 || (unint64_t)(v10 - 3700) < 0x64)
        goto LABEL_7;
LABEL_28:
      if ((unint64_t)(v10 - 3800) >= 0xC8
        && (unint64_t)(v10 - 3000) >= 0x3C
        && (unint64_t)(v10 - 3600) > 0x63)
      {
        if (a2)
        {
          if (!v11)
            goto LABEL_43;
LABEL_38:
          v5 = 4;
          if (v10 == 6011 || (unint64_t)(v10 - 6440) < 0xA0)
            goto LABEL_7;
          goto LABEL_43;
        }
        if (v12)
          goto LABEL_38;
LABEL_43:
        v15 = v7 < 0x14;
        if (!a2)
          v15 = (v7 & 0xFFFFFFFFFFFFFFFCLL) == 16;
        if (v15 && (unint64_t)(v10 - 6200) < 0x33)
        {
          v5 = 5;
        }
        else if ((isMaestroCard(v7, v10, a2) & 1) != 0)
        {
          v5 = 6;
        }
        else
        {
          if ((unint64_t)(v10 - 6370) < 0x1E)
            v16 = v13;
          else
            v16 = 0;
          if ((v16 & 1) != 0)
          {
            v5 = 7;
          }
          else if (isJCBCard(v7, v10, a2))
          {
            v5 = 8;
          }
          else
          {
            v5 = 0;
          }
        }
        goto LABEL_7;
      }
      if (a2)
      {
        if (v7 >= 0xF)
          goto LABEL_43;
      }
      else if (v7 != 14)
      {
        goto LABEL_43;
      }
      v5 = 4;
      goto LABEL_7;
    }
LABEL_25:
    v13 = v12;
    if (v7 != 15)
      goto LABEL_28;
    goto LABEL_26;
  }
LABEL_7:

  return v5;
}

void sub_1B2675F44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t isMaestroCard(unint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;
  uint64_t v4;

  if (a3)
  {
    if (a1 >= 0x14)
      return 0;
  }
  else if (a1 - 12 > 7)
  {
    return 0;
  }
  result = 1;
  if (a2 > 5892)
  {
    if (((unint64_t)(a2 - 6706) > 0x39 || ((1 << (a2 - 50)) & 0x3A0000000000001) == 0)
      && a2 != 5893)
    {
      v4 = 6304;
LABEL_14:
      if (a2 == v4)
        return result;
      return 0;
    }
  }
  else if (((unint64_t)(a2 - 5018) > 0x14 || ((1 << (a2 + 102)) & 0x100005) == 0)
         && a2 != 604)
  {
    v4 = 5612;
    goto LABEL_14;
  }
  return result;
}

BOOL isJCBCard(unint64_t a1, uint64_t a2, int a3)
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;

  if ((unint64_t)(a2 - 3000) > 0x3E7)
  {
    if (a3)
    {
      if (a1 >= 0x10)
        return 0;
    }
    else if (a1 != 15)
    {
      return 0;
    }
    return a2 == 1800 || a2 == 2131;
  }
  if ((unint64_t)(a2 - 3400) < 0x64)
    return 0;
  v3 = a1 == 16;
  if (a3)
    v3 = a1 < 0x11;
  v4 = (unint64_t)(a2 - 3900) >= 0x64 && v3;
  v5 = (unint64_t)(a2 - 3600) >= 0x64 && v4;
  v6 = (unint64_t)(a2 - 3000) >= 0x3C && v5;
  if ((unint64_t)(a2 - 3800) < 0x64)
    v6 = 0;
  return (unint64_t)(a2 - 3700) >= 0x64 && v6;
}

id WBSCreditCardTypeLocalizedName(uint64_t a1)
{
  __CFString *v1;
  void *v2;

  switch(a1)
  {
    case 1:
      v1 = CFSTR("Visa (credit card type for filling)");
      goto LABEL_12;
    case 2:
      v1 = CFSTR("Mastercard (credit card type for filling)");
      goto LABEL_12;
    case 3:
      v1 = CFSTR("American Express (credit card type for filling)");
      goto LABEL_12;
    case 4:
      v1 = CFSTR("Discover");
      goto LABEL_12;
    case 5:
      v1 = CFSTR("China UnionPay");
      goto LABEL_12;
    case 6:
      v1 = CFSTR("Maestro");
      goto LABEL_12;
    case 7:
      v1 = CFSTR("InstaPayment");
      goto LABEL_12;
    case 8:
      v1 = CFSTR("JCB");
LABEL_12:
      _WBSLocalizedString(v1, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v2 = 0;
      break;
  }
  return v2;
}

id WBSCreditCardTypeLocalizedNameForGeneratingCardNames(uint64_t a1)
{
  __CFString *v1;
  void *v2;

  switch(a1)
  {
    case 1:
      v1 = CFSTR("Visa (credit card name)");
      goto LABEL_12;
    case 2:
      v1 = CFSTR("Mastercard");
      goto LABEL_12;
    case 3:
      v1 = CFSTR("American Express");
      goto LABEL_12;
    case 4:
      v1 = CFSTR("Discover card");
      goto LABEL_12;
    case 5:
      v1 = CFSTR("China UnionPay card");
      goto LABEL_12;
    case 6:
      v1 = CFSTR("Maestro card");
      goto LABEL_12;
    case 7:
      v1 = CFSTR("InstaPayment card");
      goto LABEL_12;
    case 8:
      v1 = CFSTR("JCB card");
LABEL_12:
      _WBSLocalizedString(v1, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v2 = 0;
      break;
  }
  return v2;
}

id WBSExpirationDateWithDayMonthYear(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v3;
  uint64_t v4;
  _QWORD *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;

  if (a3 > 0x7FFFFFFFFFFFFFFELL)
    goto LABEL_2;
  v4 = a3;
  v7 = (_QWORD *)MEMORY[0x1E0C996C8];
  if (a3 > 0x63)
    goto LABEL_5;
  v8 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v8, "setDateFormat:", CFSTR("y"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02ld"), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateFromString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D48]), "initWithCalendarIdentifier:", *v7);
  objc_msgSend(v11, "components:fromDate:", 4, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v12, "year");

  if (v4)
  {
LABEL_5:
    if ((unint64_t)(a2 - 13) < 0xFFFFFFFFFFFFFFF4)
      a2 = 12;
    gregorianDateFromParts(1, a2, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v14, "setMonth:", 1);
    objc_msgSend(v14, "setDay:", -1);
    objc_msgSend(v14, "setYear:", 0);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D48]), "initWithCalendarIdentifier:", *v7);
    objc_msgSend(v15, "dateByAddingComponents:toDate:options:", v14, v13, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "components:fromDate:", 16, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "day");
    if (v18 < a1 || a1 < 1)
      v20 = v18;
    else
      v20 = a1;
    gregorianDateFromParts(v20, a2, v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_2:
    v3 = 0;
  }
  return v3;
}

void sub_1B2676448(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id gregorianDateFromParts(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v6, "setDay:", a1);
  objc_msgSend(v6, "setMonth:", a2);
  objc_msgSend(v6, "setYear:", a3);
  v7 = objc_alloc(MEMORY[0x1E0C99D48]);
  v8 = (void *)objc_msgSend(v7, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v8, "dateFromComponents:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void sub_1B2676538(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id WBSLastDigitsOfCreditCardNumber(void *a1)
{
  void *v1;
  id v2;
  void *v3;

  WBSNormalizedCreditCardNumber(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v1, "length") < 5)
  {
    v2 = v1;
  }
  else
  {
    objc_msgSend(v1, "substringFromIndex:", objc_msgSend(v1, "length") - 4);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;

  return v3;
}

void sub_1B26765B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

__CFString *WBSDisplayTextForCreditCardNumber(void *a1)
{
  void *v1;
  __CFString *v2;

  WBSLastDigitsOfCreditCardNumber(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\u202D•••• %@\u202C"), v1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = &stru_1E64A2498;
  }

  return v2;
}

void sub_1B2676628(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id WBSLocaleForCreditCardExpirationDate()
{
  if (WBSLocaleForCreditCardExpirationDate::once != -1)
    dispatch_once(&WBSLocaleForCreditCardExpirationDate::once, &__block_literal_global_28);
  return (id)WBSLocaleForCreditCardExpirationDate::localeForCreditCardExpirationDate;
}

uint64_t WBSStatusCodeGroupFromStatusCode(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = 5;
  if ((unint64_t)(a1 - 500) >= 0x64)
    v1 = 0;
  if ((unint64_t)(a1 - 400) >= 0x64)
    v2 = v1;
  else
    v2 = 4;
  if ((unint64_t)(a1 - 300) >= 0x64)
    v3 = v2;
  else
    v3 = 3;
  if ((unint64_t)(a1 - 200) >= 0x64)
    v4 = v3;
  else
    v4 = 2;
  if ((unint64_t)(a1 - 100) >= 0x64)
    return v4;
  else
    return 1;
}

void sub_1B2677764(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B267792C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v6;

  _Unwind_Resume(a1);
}

void sub_1B26779E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2677A7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2677B18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t WBSOngoingSharingInvitationFallbackURL()
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://www.icloud.com/unavailable_shared_passwords"));
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void sub_1B2678168(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void WBSParseOperatingSystemVersion(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("."));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v11, "count");
  if ((unint64_t)(v3 - 4) > 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v3;
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");
    objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");
    v9 = 0;
    if (v4 == 3)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "integerValue");

    }
    *a2 = v6;
    a2[1] = v8;
    a2[2] = v9;

  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
  }

}

uint64_t WBSMakeOperatingSystemVersion@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

BOOL WBSAppWasLaunchedAfterMajorOSUpgrade(void *a1, void *a2)
{
  id v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = 0;
  v9 = 0;
  v10 = 0;
  v3 = a2;
  WBSParseOperatingSystemVersion(a1, &v8);
  v5 = 0;
  v6 = 0;
  v7 = 0;
  WBSParseOperatingSystemVersion(v3, &v5);

  return v8 >= v5 && (v8 != v5 || v9 > v6);
}

BOOL WBSOperatingSystemVersionsEqual(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

void sub_1B2679524(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1B267A318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *WBSUnlocalizedStringFromPasswordBreachCheckResult(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("Unknown");
  else
    return off_1E649DA28[a1 - 1];
}

void sub_1B267CF68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B267D1A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B267D3A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B267D8BC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

unint64_t WBSPasswordBreachMurmur3HashWithSeed(void *a1, unsigned int a2)
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unsigned __int8 *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;

  v3 = objc_retainAutorelease(a1);
  v4 = objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  v6 = a2;
  if (v5 >= 0x10)
  {
    v8 = v5 >> 4;
    v9 = (_QWORD *)(v4 + 8);
    v7 = a2;
    do
    {
      v7 = 5
         * (__ROR8__((0x4CF5AD432745937FLL * ((0x88A129EA80000000 * *(v9 - 1)) | ((0x87C37B91114253D5 * *(v9 - 1)) >> 33))) ^ v7, 37)+ v6)+ 1390208809;
      v6 = 5
         * (v7
          + __ROR8__((0x87C37B91114253D5* ((0x4E8B26FE00000000 * *v9) | ((unint64_t)(0x4CF5AD432745937FLL * *v9) >> 31))) ^ v6, 33))+ 944331445;
      v9 += 2;
      --v8;
    }
    while (v8);
  }
  else
  {
    v7 = a2;
  }
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23 = (unsigned __int8 *)(v4 + (v5 & 0xFFFFFFFFFFFFFFF0));
  switch(v5 & 0xF)
  {
    case 1uLL:
      goto LABEL_20;
    case 2uLL:
      goto LABEL_19;
    case 3uLL:
      goto LABEL_18;
    case 4uLL:
      goto LABEL_17;
    case 5uLL:
      goto LABEL_16;
    case 6uLL:
      goto LABEL_15;
    case 7uLL:
      goto LABEL_14;
    case 8uLL:
      goto LABEL_13;
    case 9uLL:
      goto LABEL_12;
    case 0xAuLL:
      goto LABEL_11;
    case 0xBuLL:
      goto LABEL_10;
    case 0xCuLL:
      goto LABEL_9;
    case 0xDuLL:
      goto LABEL_8;
    case 0xEuLL:
      goto LABEL_7;
    case 0xFuLL:
      v10 = (unint64_t)v23[14] << 48;
LABEL_7:
      v11 = v10 | ((unint64_t)v23[13] << 40);
LABEL_8:
      v12 = v11 ^ ((unint64_t)v23[12] << 32);
LABEL_9:
      v13 = v12 ^ ((unint64_t)v23[11] << 24);
LABEL_10:
      v14 = v13 ^ ((unint64_t)v23[10] << 16);
LABEL_11:
      v15 = v14 ^ ((unint64_t)v23[9] << 8);
LABEL_12:
      v6 ^= 0x87C37B91114253D5
          * ((0x4E8B26FE00000000 * (v15 ^ v23[8])) | ((0x4CF5AD432745937FLL * (v15 ^ v23[8])) >> 31));
LABEL_13:
      v16 = (unint64_t)v23[7] << 56;
LABEL_14:
      v17 = v16 | ((unint64_t)v23[6] << 48);
LABEL_15:
      v18 = v17 ^ ((unint64_t)v23[5] << 40);
LABEL_16:
      v19 = v18 ^ ((unint64_t)v23[4] << 32);
LABEL_17:
      v20 = v19 ^ ((unint64_t)v23[3] << 24);
LABEL_18:
      v21 = v20 ^ ((unint64_t)v23[2] << 16);
LABEL_19:
      v22 = v21 ^ ((unint64_t)v23[1] << 8);
LABEL_20:
      v7 ^= 0x4CF5AD432745937FLL
          * ((0x88A129EA80000000 * (v22 ^ *v23)) | ((0x87C37B91114253D5 * (v22 ^ *v23)) >> 33));
      break;
    default:
      break;
  }
  v24 = v6 ^ v5;
  v25 = v24 + (v7 ^ v5);
  v26 = v25 + v24;
  v27 = 0xC4CEB9FE1A85EC53
      * ((0xFF51AFD7ED558CCDLL * (v25 ^ (v25 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v25 ^ (v25 >> 33))) >> 33));
  v28 = 0xC4CEB9FE1A85EC53
      * ((0xFF51AFD7ED558CCDLL * (v26 ^ (v26 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v26 ^ (v26 >> 33))) >> 33));
  v29 = (v28 ^ (v28 >> 33)) + (v27 ^ (v27 >> 33));

  return v29;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void sub_1B2684620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

id appendedCanonicalizedCharactersFromCharacterClasses(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  __CFString *v7;
  uint64_t v8;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v10 = a1;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = v10;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        v6 = *(id *)(*((_QWORD *)&v11 + 1) + 8 * v5);
        v7 = CFSTR("abcdefghijklmnopqrstuvwxyz");
        switch(objc_msgSend(v6, "type"))
        {
          case 0:
          case 5:
            v8 = objc_claimAutoreleasedReturnValue();
            goto LABEL_14;
          case 1:
            v7 = CFSTR("0123456789");
            goto LABEL_12;
          case 2:
            goto LABEL_12;
          case 3:
            v7 = CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
            goto LABEL_12;
          case 4:
LABEL_12:

            goto LABEL_15;
          case 6:
            objc_msgSend(v6, "value");
            v8 = objc_claimAutoreleasedReturnValue();
LABEL_14:
            v7 = (__CFString *)v8;

            if (v7)
LABEL_15:
              objc_msgSend(v1, "appendString:", v7);
            break;
          default:

            v7 = 0;
            break;
        }

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }

  return v1;
}

void sub_1B26848E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B2684A44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t createLexiconWithLocale(NSString *a1)
{
  NSString *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = *MEMORY[0x1E0D437B0];
  v5[0] = *MEMORY[0x1E0D437B8];
  v5[1] = v2;
  v6[0] = v1;
  v6[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = LXLexiconCreate();

  return v3;
}

void sub_1B2684B88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B2684C14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)WBSPasswordGenerationManager;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1B2684CA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL passwordMatchesFormatOfGenerationStyle(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;

  v3 = a1;
  v4 = objc_msgSend(v3, "length");
  if (!a2)
  {
    if (v4 == 15 && objc_msgSend(v3, "containsString:", CFSTR("-")))
    {
      if (regexForClassicPassword(void)::onceToken != -1)
        dispatch_once(&regexForClassicPassword(void)::onceToken, &__block_literal_global_41);
      v5 = objc_msgSend((id)regexForClassicPassword(void)::regex, "numberOfMatchesInString:options:range:", v3, 0, 0, 15);
      goto LABEL_13;
    }
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  if (a2 != 2 || v4 != 20 || !objc_msgSend(v3, "containsString:", CFSTR("-")))
    goto LABEL_14;
  if (regexForMoreTypablePassword(void)::onceToken != -1)
    dispatch_once(&regexForMoreTypablePassword(void)::onceToken, &__block_literal_global_115);
  v5 = objc_msgSend((id)regexForMoreTypablePassword(void)::regex, "numberOfMatchesInString:options:range:", v3, 0, 0, 20);
LABEL_13:
  v6 = v5 != 0;
LABEL_15:

  return v6;
}

void sub_1B2684DC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2684E20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2684EEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B26851B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t randomSyllable(void)
{
  void *v0;
  unsigned int v1;
  unsigned int v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  v1 = randomConsonant();
  v2 = randomVowel();
  return objc_msgSend(v0, "stringWithFormat:", CFSTR("%C%C%C"), v1, v2, randomConsonant());
}

uint64_t randomConsonant(void)
{
  uint64_t v0;

  {
    LODWORD(v0) = randomConsonant(void)::lengthOfConsonants;
  }
  else
  {
    v0 = objc_msgSend(CFSTR("bcdfghjkmnpqrstvwxz"), "length");
    randomConsonant(void)::lengthOfConsonants = v0;
  }
  return objc_msgSend(CFSTR("bcdfghjkmnpqrstvwxz"), "characterAtIndex:", arc4random_uniform(v0));
}

uint64_t randomVowel(void)
{
  uint64_t v0;

  {
    LODWORD(v0) = randomVowel(void)::lengthOfVowels;
  }
  else
  {
    v0 = objc_msgSend(CFSTR("aeiouy"), "length");
    randomVowel(void)::lengthOfVowels = v0;
  }
  return objc_msgSend(CFSTR("aeiouy"), "characterAtIndex:", arc4random_uniform(v0));
}

uint64_t randomNumber(void)
{
  uint64_t v0;

  {
    LODWORD(v0) = randomNumber(void)::lengthOfNumbers;
  }
  else
  {
    v0 = objc_msgSend(CFSTR("0123456789"), "length");
    randomNumber(void)::lengthOfNumbers = v0;
  }
  return objc_msgSend(CFSTR("0123456789"), "characterAtIndex:", arc4random_uniform(v0));
}

void sub_1B2685460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B26856D0(_Unwind_Exception *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B26866C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,void *a30,uint64_t a31,void *a32)
{
  void *v32;
  void *v33;
  void *v34;

  _Unwind_Resume(a1);
}

void getPasswordRandomCharacters(uint64_t *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  char *v7;
  unsigned __int8 v8;
  unint64_t v9;
  unsigned int v10;
  unsigned int v11;
  const __SecRandom *v12;
  char *v13;
  size_t v14;
  size_t v15;
  char *v16;
  unsigned int v17;
  unsigned int v18;
  unint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;
  void *__p;
  _BYTE *v24;

  v3 = a2;
  v5 = *a1;
  v4 = a1[1];
  v6 = (v4 - *a1) >> 1;
  std::vector<unsigned char>::vector(&__p, v6);
  v7 = (char *)__p;
  v8 = objc_msgSend(v3, "length");
  if (v4 == v5)
    goto LABEL_16;
  v21 = v5;
  v22 = v4;
  v9 = 0;
  v10 = v8;
  v11 = (0xFFu % v8) ^ 0xFF;
  v12 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
  v13 = v7;
  v14 = v6;
  do
  {
    while (SecRandomCopyBytes(v12, v14, v13) == -1)
      ;
    v15 = v6 - v9;
    if (v6 > v9)
    {
      v16 = &v7[v9];
      do
      {
        v18 = *v16++;
        v17 = v18;
        if (v18 < v11)
          v7[v9++] = v17 % v10;
        --v15;
      }
      while (v15);
    }
    v13 = &v7[v9];
    v14 = v6 - v9;
  }
  while (v6 > v9);
  if (v22 == v21)
  {
LABEL_16:
    if (__p)
    {
      v24 = __p;
      operator delete(__p);
    }

  }
  else
  {
    v19 = 0;
    if (v6 <= 1)
      v6 = 1;
    while (v24 - (_BYTE *)__p > v19)
    {
      v20 = objc_msgSend(v3, "characterAtIndex:", *((unsigned __int8 *)__p + v19));
      if (v19 >= (a1[1] - *a1) >> 1)
        break;
      *(_WORD *)(*a1 + 2 * v19++) = v20;
      if (v6 == v19)
        goto LABEL_16;
    }
    __break(1u);
  }
}

void sub_1B2686B84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  void *v13;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

id tokenizedPassword(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a1;
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2 == 1)
    goto LABEL_5;
  if (a2 == 2)
  {
    if (objc_msgSend(v3, "length") == 18)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(v4, "substringWithRange:", 0, 6);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safari_setOfAllSubstringsWithMinimumLength:", 3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v8);

      objc_msgSend(v4, "substringWithRange:", 6, 6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safari_setOfAllSubstringsWithMinimumLength:", 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v11);

      objc_msgSend(v4, "substringWithRange:", 12, 6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "safari_setOfAllSubstringsWithMinimumLength:", 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v14);

      goto LABEL_9;
    }
LABEL_8:
    v5 = 0;
    goto LABEL_9;
  }
  if (a2 != 3 || objc_msgSend(v3, "length") != 18)
    goto LABEL_8;
LABEL_5:
  objc_msgSend(v4, "safari_setOfAllSubstringsWithMinimumLength:", 3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v5;
}

void sub_1B2686D4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v4;

  _Unwind_Resume(a1);
}

void sub_1B2686E90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2686F40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B2686FB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B2687058(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B26870FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZL23regexForClassicPasswordv_block_invoke()
{
  void *v0;
  uint64_t v1;
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  _BYTE v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("^[%@]{3}-[%@]{3}-[%@]{3}-[%@]{3}$"), CFSTR("abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ0123456789"), CFSTR("abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ0123456789"), CFSTR("abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ0123456789"), CFSTR("abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ0123456789"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v0, 16, &v6);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = v6;
  v3 = (void *)regexForClassicPassword(void)::regex;
  regexForClassicPassword(void)::regex = v1;

  if (v2)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      ___ZL23regexForClassicPasswordv_block_invoke_cold_1(v5, (uint64_t)v7, v4);
    }

  }
}

void sub_1B2687228(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void ___ZL27regexForMoreTypablePasswordv_block_invoke()
{
  void *v0;
  uint64_t v1;
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  _BYTE v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("^[%@]{6}-[%@]{6}-[%@]{6}$"), CFSTR("abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ0123456789"), CFSTR("abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ0123456789"), CFSTR("abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ0123456789"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v0, 16, &v6);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = v6;
  v3 = (void *)regexForMoreTypablePassword(void)::regex;
  regexForMoreTypablePassword(void)::regex = v1;

  if (v2)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      ___ZL23regexForClassicPasswordv_block_invoke_cold_1(v5, (uint64_t)v7, v4);
    }

  }
}

void sub_1B2687360(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

char *std::vector<unsigned short>::vector(_QWORD *a1, uint64_t a2)
{
  char *result;
  _WORD *v5;
  _WORD *v6;
  uint64_t v7;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (!a2)
    return (char *)a1;
  result = std::vector<unsigned short>::__vallocate[abi:sn180100](a1, a2);
  v5 = (_WORD *)a1[1];
  v6 = &v5[a2];
  v7 = 2 * a2;
  while (v5)
  {
    *v5++ = 0;
    v7 -= 2;
    if (!v7)
    {
      a1[1] = v6;
      return (char *)a1;
    }
  }
  __break(1u);
  return result;
}

char *std::vector<unsigned short>::__vallocate[abi:sn180100](_QWORD *a1, uint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 < 0)
    abort();
  result = (char *)std::__allocate_at_least[abi:sn180100]<std::allocator<unsigned short>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[2 * v4];
  return result;
}

void *std::__allocate_at_least[abi:sn180100]<std::allocator<unsigned short>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
    std::__throw_bad_array_new_length[abi:sn180100]();
  return operator new(2 * a2);
}

void std::__throw_bad_array_new_length[abi:sn180100]()
{
  abort();
}

char *std::vector<unsigned char>::vector(_QWORD *a1, size_t a2)
{
  size_t v3;
  char *result;
  _BYTE *v5;
  _BYTE *v6;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (!a2)
    return (char *)a1;
  v3 = a2;
  result = std::vector<unsigned char>::__vallocate[abi:sn180100](a1, a2);
  v5 = (_BYTE *)a1[1];
  v6 = &v5[v3];
  while (v5)
  {
    *v5++ = 0;
    if (!--v3)
    {
      a1[1] = v6;
      return (char *)a1;
    }
  }
  __break(1u);
  return result;
}

char *std::vector<unsigned char>::__vallocate[abi:sn180100](_QWORD *a1, size_t __sz)
{
  char *result;

  if ((__sz & 0x8000000000000000) != 0)
    abort();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void ___ZL50ignorePasswordGenerationIsDisallowedByRequirementsv_block_invoke()
{
  id v0;

  if (+[WBSFeatureAvailability hasInternalContent](WBSFeatureAvailability, "hasInternalContent"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    ignorePasswordGenerationIsDisallowedByRequirements(void)::ignorePasswordGenerationIsDisallowedByRequirements = objc_msgSend(v0, "BOOLForKey:", CFSTR("WBSIgnorePasswordGenerationIsDisallowedByRequirements"));

  }
  else
  {
    ignorePasswordGenerationIsDisallowedByRequirements(void)::ignorePasswordGenerationIsDisallowedByRequirements = 0;
  }
}

void sub_1B2687574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t WBSAuthenticationPolicyForPasswordManager()
{
  if (+[WBSFeatureAvailability isDTOMitigationEnabled](WBSFeatureAvailability, "isDTOMitigationEnabled"))
    return 1025;
  else
    return 2;
}

uint64_t WBSAuthenticationPolicyForCreditCards()
{
  if (+[WBSFeatureAvailability isDTOMitigationEnabled](WBSFeatureAvailability, "isDTOMitigationEnabled"))
    return 1025;
  else
    return 2;
}

double nChooseK(double a1, double a2)
{
  double v2;
  int v4;
  double v5;

  v2 = 0.0;
  if (a2 <= a1)
  {
    if (a1 * 0.5 < a2)
      a2 = a1 - a2;
    v2 = 1.0;
    if (a2 != 0.0 && a2 >= 1.0)
    {
      v4 = 2;
      v5 = 1.0;
      do
      {
        v2 = v2 * (a1 - v5 + 1.0) / v5;
        v5 = (double)v4++;
      }
      while (a2 >= v5);
    }
  }
  return v2;
}

void sub_1B268C460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double factorial(unint64_t a1)
{
  double result;

  result = 1.0;
  if (a1 > 1)
    return factorial(a1 - 1, 1.0) * (double)a1;
  return result;
}

void sub_1B268C65C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

unsigned __int16 *skipWhitespaceCharacters(unsigned __int16 *result, _QWORD *a2)
{
  unsigned int v2;
  BOOL v3;
  uint64_t v4;

  while (1)
  {
    v2 = *result;
    v3 = v2 > 0x20;
    v4 = (1 << v2) & 0x100003600;
    if (v3 || v4 == 0)
      break;
    ++result;
  }
  *a2 = result;
  return result;
}

__CFString *parseIdentifier(UniChar *chars, UniChar **a2, _QWORD *a3)
{
  UniChar *v3;
  int v4;
  uint64_t v5;
  UniChar *v6;
  int v7;
  __CFString *v8;

  v3 = chars;
  v4 = *chars;
  if (*chars)
  {
    v5 = 0;
    v6 = chars;
    while (v4 == 45 || (v4 & 0xFFDFu) - 65 <= 0x19)
    {
      v7 = v6[1];
      ++v6;
      v4 = v7;
      --v5;
      if (!v7)
        goto LABEL_8;
    }
    if (v5)
    {
LABEL_8:
      *a3 = -1;
      *a2 = v6;
      v8 = (__CFString *)CFStringCreateWithCharactersNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], chars, -v5, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
      return v8;
    }
    v3 = v6;
  }
  *a3 = 2;
  *a2 = v3;
  v8 = &stru_1E64A2498;
  return v8;
}

id parseNamedCharacterClass(UniChar *a1, _QWORD *a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UniChar *v11;

  v11 = a1;
  parseIdentifier(a1, &v11, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (*a3 == -1)
  {
    objc_msgSend(v5, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ascii-printable")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("lower")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("upper")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("digit")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("special")) & 1) != 0)
    {
      v9 = 4;
    }
    else
    {
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("unicode")) & 1) == 0)
      {

        v7 = 0;
        *a3 = 1;
        goto LABEL_3;
      }
      v9 = 5;
    }

    *a3 = -1;
    *a2 = v11;
    +[WBSPasswordCharacterClass namedCharacterClassWithType:](WBSPasswordCharacterClass, "namedCharacterClassWithType:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v7 = 0;
LABEL_3:
  *a2 = v11;
LABEL_17:

  return v7;
}

uint64_t parsePositiveIntegerPropertyValue(unsigned __int16 *a1, _QWORD *a2, uint64_t *a3)
{
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  BOOL v7;

  v3 = *a1;
  if (v3 - 48 > 9)
  {
    v4 = -1;
    v6 = 3;
  }
  else
  {
    v4 = 0;
    if (*a1)
    {
      while (v3 != 59)
      {
        if (v3 - 48 > 9)
        {
          v7 = v3 == 0;
          if (v3)
            v6 = 3;
          else
            v6 = -1;
          if (!v7)
            v4 = -1;
          goto LABEL_13;
        }
        v4 = 10 * v4 + v3 - 48;
        v5 = a1[1];
        ++a1;
        v3 = v5;
        if (!v5)
          break;
      }
    }
    v6 = -1;
  }
LABEL_13:
  *a3 = v6;
  *a2 = a1;
  return v4;
}

id parseCustomCharacterClass(_WORD *a1, _QWORD *a2, _QWORD *a3)
{
  void *v6;
  _WORD *v7;
  unint64_t i;
  int v9;
  void *v10;

  if (*a1 == 91)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1 + 2;
    for (i = 1; ; ++i)
    {
      v9 = (unsigned __int16)*(v7 - 1);
      if (!*(v7 - 1))
      {
        v10 = 0;
        *a3 = 3;
        *a2 = v7 - 1;
        goto LABEL_16;
      }
      if (v9 == 93)
        break;
      if ((v9 - 32) < 0x5F && (i < 2 || v9 != 45))
        objc_msgSend(v6, "appendFormat:", CFSTR("%C"), (unsigned __int16)*(v7 - 1));
      ++v7;
    }
    if (*v7 == 93)
      objc_msgSend(v6, "appendFormat:", CFSTR("%C"), 93);
    else
      --v7;
    *a3 = -1;
    *a2 = v7;
    +[WBSPasswordCharacterClass customCharacterClassWithValue:](WBSPasswordCharacterClass, "customCharacterClassWithValue:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  }
  else
  {
    v10 = 0;
    *a3 = 3;
    *a2 = a1;
  }
  return v10;
}

id parsePasswordRequiredOrAllowedPropertyValue(UniChar *a1, UniChar **a2, uint64_t *a3)
{
  UniChar *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  UniChar *v10;
  void *v11;
  void *v12;
  UniChar *i;
  uint64_t v14;
  uint64_t v16;
  id v17;
  UniChar *v19;

  v5 = a1;
  v19 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *v5;
LABEL_2:
  if (v7)
  {
    if (v7 == 45 || (v7 & 0xFFDF) - 65 <= 0x19)
    {
      parseNamedCharacterClass(v5, &v19, a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (*a3 == -1)
      {
        objc_msgSend(v6, "addObject:", v11);

        v10 = v19;
LABEL_10:
        v5 = v10 + 1;
        for (i = v10; ; ++i)
        {
          v14 = *i;
          if (v14 > 0x3B)
            break;
          if (((1 << v14) & 0x100003600) == 0)
          {
            if (v14 == 44)
            {
              while (1)
              {
                v7 = *v5;
                if (v7 > 0x20 || ((1 << v7) & 0x100003600) == 0)
                  break;
                ++v5;
              }
              v19 = v5;
              if (!v7)
              {
                v16 = 2;
                goto LABEL_31;
              }
              goto LABEL_2;
            }
            if (v14 == 59)
            {
              v10 = i;
              goto LABEL_25;
            }
            break;
          }
          ++v5;
        }
        if (!*i)
          goto LABEL_25;
        *a3 = 3;
        *a2 = i;
        goto LABEL_27;
      }
      *a2 = v5;

    }
    else if (v7 == 91)
    {
      parseCustomCharacterClass(v5, &v19, a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (*a3 == -1)
      {
        objc_msgSend(v6, "addObject:", v8);
        v10 = v19 + 1;

        goto LABEL_10;
      }
      *a2 = v19;

    }
    else
    {
      v16 = 3;
LABEL_31:
      *a3 = v16;
      *a2 = v5;
    }
LABEL_27:
    v17 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_28;
  }
  v10 = v5;
LABEL_25:
  *a3 = -1;
  *a2 = v10;
  v17 = v6;
LABEL_28:

  return v17;
}

id parsePasswordRule(UniChar *a1, UniChar **a2, uint64_t *a3)
{
  void *v6;
  void *v7;
  void *v8;
  UniChar *i;
  void *v10;
  char v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  UniChar *j;
  unsigned int v16;
  uint64_t v19;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  UniChar *v26;

  v26 = a1;
  parseIdentifier(a1, &v26, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (*a3 == -1)
  {
    objc_msgSend(v6, "lowercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("allowed"));
    if ((v11 & 1) != 0)
    {
      v12 = 0;
      v13 = 0;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("required")) & 1) != 0)
    {
      v12 = 0;
      v13 = 1;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("max-consecutive")) & 1) != 0)
    {
      v12 = 0;
      v13 = 2;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("minlength")) & 1) != 0)
    {
      v12 = 1;
      v13 = 3;
    }
    else
    {
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("maxlength")) & 1) == 0)
      {

        v8 = 0;
        *a3 = 2;
        *a2 = a1;
        goto LABEL_33;
      }
      v12 = 0;
      v13 = 4;
    }

    for (i = v26; ; ++i)
    {
      v14 = *i;
      if (v14 > 0x3A)
        goto LABEL_31;
      if (((1 << v14) & 0x100003600) == 0)
        break;
    }
    if (v14 != 58)
    {
LABEL_31:
      v8 = 0;
      *a3 = 3;
      goto LABEL_32;
    }
    for (j = i + 1; ; ++j)
    {
      v16 = *j;
      if (v16 > 0x20 || ((1 << v16) & 0x100003600) == 0)
        break;
    }
    v26 = j;
    if (v16 == 59 || v16 == 0)
    {
      *a3 = -1;
      *a2 = j;
      switch(v13)
      {
        case 0uLL:
          +[WBSAllowedPasswordRule allowedRuleWithCharacterClasses:](WBSAllowedPasswordRule, "allowedRuleWithCharacterClasses:", 0);
          v19 = objc_claimAutoreleasedReturnValue();
          break;
        case 1uLL:
          +[WBSRequiredPasswordRule requiredRuleWithCharacterClasses:](WBSRequiredPasswordRule, "requiredRuleWithCharacterClasses:", 0);
          v19 = objc_claimAutoreleasedReturnValue();
          break;
        case 2uLL:
          +[WBSMaxConsecutivePasswordRule maxConsecutiveRuleWithValue:](WBSMaxConsecutivePasswordRule, "maxConsecutiveRuleWithValue:", 0);
          v19 = objc_claimAutoreleasedReturnValue();
          break;
        case 3uLL:
          +[WBSMinLengthPasswordRule minLengthRuleWithValue:](WBSMinLengthPasswordRule, "minLengthRuleWithValue:", 0);
          v19 = objc_claimAutoreleasedReturnValue();
          break;
        case 4uLL:
          +[WBSMaxLengthPasswordRule maxLengthRuleWithValue:](WBSMaxLengthPasswordRule, "maxLengthRuleWithValue:", 0);
          v19 = objc_claimAutoreleasedReturnValue();
          break;
        default:
          goto LABEL_49;
      }
      v8 = (void *)v19;
      goto LABEL_33;
    }
    if (v13 < 2)
    {
      parsePasswordRequiredOrAllowedPropertyValue(j, &v26, a3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *a2 = v26;
      if (*a3 == -1)
      {
        if ((v11 & 1) != 0)
          +[WBSAllowedPasswordRule allowedRuleWithCharacterClasses:](WBSAllowedPasswordRule, "allowedRuleWithCharacterClasses:", v24);
        else
          +[WBSRequiredPasswordRule requiredRuleWithCharacterClasses:](WBSRequiredPasswordRule, "requiredRuleWithCharacterClasses:", v24);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }

      goto LABEL_33;
    }
    if (v13 - 3 >= 2)
    {
      if (v13 != 2)
      {
        v8 = 0;
        *a3 = 0;
        *a2 = j;
        goto LABEL_33;
      }
      v25 = parsePositiveIntegerPropertyValue(j, &v26, a3);
      *a2 = v26;
      if (*a3 == -1)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[WBSMaxConsecutivePasswordRule maxConsecutiveRuleWithValue:](WBSMaxConsecutivePasswordRule, "maxConsecutiveRuleWithValue:", v22);
        v23 = objc_claimAutoreleasedReturnValue();
LABEL_56:
        v8 = (void *)v23;

        goto LABEL_33;
      }
    }
    else
    {
      v21 = parsePositiveIntegerPropertyValue(j, &v26, a3);
      *a2 = v26;
      if (*a3 == -1)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v12 & 1) != 0)
          +[WBSMinLengthPasswordRule minLengthRuleWithValue:](WBSMinLengthPasswordRule, "minLengthRuleWithValue:", v22);
        else
          +[WBSMaxLengthPasswordRule maxLengthRuleWithValue:](WBSMaxLengthPasswordRule, "maxLengthRuleWithValue:", v22);
        v23 = objc_claimAutoreleasedReturnValue();
        goto LABEL_56;
      }
    }
LABEL_49:
    v8 = 0;
    goto LABEL_33;
  }
  v8 = 0;
  i = v26;
LABEL_32:
  *a2 = i;
LABEL_33:

  return v8;
}

id parsePasswordRules(UniChar *i, uint64_t *a2)
{
  void *v4;
  unsigned int v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  UniChar *v11;
  uint64_t v12;
  unsigned int v13;
  BOOL v14;
  uint64_t v15;
  UniChar *v18;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    v5 = *i;
    if (v5 > 0x20 || ((1 << v5) & 0x100003600) == 0)
      break;
    ++i;
  }
  v18 = i;
  if (v5)
  {
    v7 = (id)MEMORY[0x1E0C9AA60];
    while (v5 == 45 || (v5 & 0xFFDF) - 65 <= 0x19)
    {
      parsePasswordRule(i, &v18, a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (*a2 != -1)
      {
LABEL_29:

        goto LABEL_30;
      }
      objc_msgSend(v8, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        objc_msgSend(v4, "addObject:", v9);
      v11 = v18;
      for (i = v18 + 1; ; ++i)
      {
        v12 = *v11;
        if (v12 > 0x3B)
          goto LABEL_28;
        if (((1 << v12) & 0x100003600) == 0)
          break;
        ++v11;
      }
      if (!*v11)
      {
        *a2 = -1;
        v7 = v4;
        goto LABEL_29;
      }
      if (v12 != 59)
      {
LABEL_28:
        *a2 = 3;
        v7 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_29;
      }
      while (1)
      {
        v13 = *i;
        v14 = v13 > 0x20;
        v15 = (1 << v13) & 0x100003600;
        if (v14 || v15 == 0)
          break;
        ++i;
      }
      v18 = i;

      v5 = *i;
      if (!*i)
        break;
    }
  }
  *a2 = -1;
  v7 = v4;
LABEL_30:

  return v7;
}

id canonicalizedCharacterClasses(void *a1)
{
  id v1;
  __CFString *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  __CFBitVector *Mutable;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  CFRange v16;
  void *v17;
  uint64_t v18;
  CFIndex v19;
  CFIndex j;
  CFIndex v21;
  CFIndex k;
  CFIndex v23;
  CFIndex m;
  CFIndex v25;
  CFIndex v26;
  CFIndex n;
  CFIndex ii;
  CFIndex jj;
  void *v30;
  void *v31;
  void **v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  void *v47;
  UniChar chars[95];
  _BYTE v49[128];
  void *v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;
  CFRange v54;
  CFRange v55;
  CFRange v56;

  v53 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!objc_msgSend(v1, "count"))
  {
    v33 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_77;
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v2 = (__CFString *)v1;
  v3 = -[__CFString countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (!v3)
    goto LABEL_11;
  v4 = v3;
  v5 = *(_QWORD *)v44;
  while (2)
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v44 != v5)
        objc_enumerationMutation(v2);
      v7 = objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "type");
      if (!v7)
      {
        +[WBSPasswordCharacterClass asciiPrintableCharacterClass](WBSPasswordCharacterClass, "asciiPrintableCharacterClass");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v30;
        v32 = &v50;
LABEL_73:
        v31 = (void *)MEMORY[0x1E0C99D20];
        goto LABEL_74;
      }
      if (v7 == 5)
      {
        +[WBSPasswordCharacterClass unicodeCharacterClass](WBSPasswordCharacterClass, "unicodeCharacterClass");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v30;
        v32 = &v51;
        goto LABEL_73;
      }
    }
    v4 = -[__CFString countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    if (v4)
      continue;
    break;
  }
LABEL_11:

  Mutable = CFBitVectorCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 95);
  CFBitVectorSetCount(Mutable, 95);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v9 = v2;
  v10 = -[__CFString countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v40;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v13);
        v15 = objc_msgSend(v14, "type", (_QWORD)v39);
        v16.location = 33;
        v16.length = 26;
        switch(v15)
        {
          case 1:
            v16.location = 16;
            v16.length = 10;
            goto LABEL_20;
          case 2:
            v16.location = 65;
            v16.length = 26;
            goto LABEL_20;
          case 3:
            goto LABEL_20;
          case 4:
            v54.location = 0;
            v54.length = 16;
            CFBitVectorSetBits(Mutable, v54, 1u);
            v55.location = 26;
            v55.length = 7;
            CFBitVectorSetBits(Mutable, v55, 1u);
            v56.location = 59;
            v56.length = 6;
            CFBitVectorSetBits(Mutable, v56, 1u);
            v16.location = 91;
            v16.length = 4;
LABEL_20:
            CFBitVectorSetBits(Mutable, v16, 1u);
            break;
          case 6:
            objc_msgSend(v14, "value", 26);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            markBitsForCustomCharacterClassPropertyValue(Mutable, v17);

            break;
          default:
            break;
        }
        ++v13;
      }
      while (v11 != v13);
      v18 = -[__CFString countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
      v11 = v18;
    }
    while (v18);
  }

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  for (j = 33; j != 59; ++j)
  {
    if (CFBitVectorGetBitAtIndex(Mutable, j))
      chars[v19++] = j + 32;
  }
  if (v19 && v19 != 26)
    CFStringAppendCharacters(v2, chars, v19);
  v21 = 0;
  for (k = 65; k != 91; ++k)
  {
    if (CFBitVectorGetBitAtIndex(Mutable, k))
      chars[v21++] = k + 32;
  }
  if (v21 && v21 != 26)
    CFStringAppendCharacters(v2, chars, v21);
  v23 = 0;
  for (m = 16; m != 26; ++m)
  {
    if (CFBitVectorGetBitAtIndex(Mutable, m))
      chars[v23++] = m + 32;
  }
  if (v23 && v23 != 10)
    CFStringAppendCharacters(v2, chars, v23);
  v25 = 0;
  v26 = 0;
  do
  {
    if (CFBitVectorGetBitAtIndex(Mutable, v25))
      chars[v26++] = v25 + 32;
    ++v25;
  }
  while (v25 != 16);
  for (n = 26; n != 33; ++n)
  {
    if (CFBitVectorGetBitAtIndex(Mutable, n))
      chars[v26++] = n + 32;
  }
  for (ii = 59; ii != 65; ++ii)
  {
    if (CFBitVectorGetBitAtIndex(Mutable, ii))
      chars[v26++] = ii + 32;
  }
  for (jj = 91; jj != 95; ++jj)
  {
    if (CFBitVectorGetBitAtIndex(Mutable, jj))
      chars[v26++] = jj + 32;
  }
  if (v26 && v26 != 33)
    CFStringAppendCharacters(v2, chars, v26);
  CFRelease(Mutable);
  if (v19 == 26 && v21 == 26 && v23 == 10 && v26 == 33)
  {
    +[WBSPasswordCharacterClass asciiPrintableCharacterClass](WBSPasswordCharacterClass, "asciiPrintableCharacterClass");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v30;
    v31 = (void *)MEMORY[0x1E0C99D20];
    v32 = &v47;
LABEL_74:
    objc_msgSend(v31, "arrayWithObjects:count:", v32, 1, (_QWORD)v39);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_75:

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array", (_QWORD)v39);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 == 26)
    {
      +[WBSPasswordCharacterClass uppercaseCharacterClass](WBSPasswordCharacterClass, "uppercaseCharacterClass");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v35);

    }
    if (v21 == 26)
    {
      +[WBSPasswordCharacterClass lowercaseCharacterClass](WBSPasswordCharacterClass, "lowercaseCharacterClass");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v36);

    }
    if (v23 == 10)
    {
      +[WBSPasswordCharacterClass digitCharacterClass](WBSPasswordCharacterClass, "digitCharacterClass");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v37);

    }
    if (v26 == 33)
    {
      +[WBSPasswordCharacterClass specialCharacterClass](WBSPasswordCharacterClass, "specialCharacterClass");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v38);

    }
    if (-[__CFString length](v2, "length"))
    {
      +[WBSPasswordCharacterClass customCharacterClassWithValue:](WBSPasswordCharacterClass, "customCharacterClassWithValue:", v2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v30);
      goto LABEL_75;
    }
  }

LABEL_77:
  return v33;
}

void markBitsForCustomCharacterClassPropertyValue(__CFBitVector *a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  id v6;
  __int16 v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  _OWORD v18[4];
  __int128 v19;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v19 = 0u;
    memset(v18, 0, sizeof(v18));
    v5 = objc_msgSend(v3, "length", 0, 0, 0, 0, 0);
    v6 = v4;
    v17 = v5;
    *(_QWORD *)&v18[0] = 0;
    v16 = v6;
    if (v5)
    {
      if (v5 >= 0x20)
        v5 = 32;
      v14 = v5;
      objc_msgSend(v6, sel_getUid("getCharacters:range:"), (char *)v18 + 8, 0, v5);
      v7 = WORD4(v18[0]);
    }
    else
    {
      v14 = 0;
      v7 = -1;
    }
    v15 = 1;
    WORD4(v19) = v7;

    v8 = 1;
    v9 = v14;
    if (v14)
    {
      do
      {
        v10 = WORD4(v19);
        if (v8 >= v9)
        {
          v12 = *(_QWORD *)&v18[0] + v9;
          if (v17 <= *(_QWORD *)&v18[0] + v9)
          {
            v8 = v9 + 1;
            v15 = v9 + 1;
            WORD4(v19) = -1;
          }
          else
          {
            if (v17 - (*(_QWORD *)&v18[0] + v9) >= 0x20)
              v13 = 32;
            else
              v13 = v17 - (*(_QWORD *)&v18[0] + v9);
            *(_QWORD *)&v18[0] += v9;
            v14 = v13;
            objc_msgSend(v16, sel_getUid("getCharacters:range:"), (char *)v18 + 8, v12, v13);
            WORD4(v19) = WORD4(v18[0]);
            v15 = 1;
            v8 = 1;
          }
        }
        else
        {
          v11 = (char *)&v14 + 2 * v8++;
          v15 = v8;
          WORD4(v19) = *((_WORD *)v11 + 20);
        }
        if ((v10 - 32) <= 0x5E)
        {
          CFBitVectorSetBitAtIndex(a1, v10 - 32, 1u);
          v8 = v15;
        }
        v9 = v14;
      }
      while (v8 - 1 < v14);
    }
  }

}

uint64_t __intersectCharacterClasses_block_invoke(uint64_t a1, int a2)
{
  char v2;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  id *v11;
  char v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  id *v18;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v2 = a2;
  v26 = *MEMORY[0x1E0C80C00];
  v4 = 40;
  if (a2)
    v4 = 32;
  v5 = *(id *)(a1 + v4);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v22;
    v20 = v2;
    v10 = (id *)(a1 + 48);
    v11 = (id *)(a1 + 56);
    v12 = v2;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v5);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        switch(objc_msgSend(v14, "type"))
        {
          case 0:
            v8 |= 0x20uLL;
            break;
          case 1:
            v8 |= 4uLL;
            break;
          case 2:
            v8 |= 2uLL;
            break;
          case 3:
            v8 |= 1uLL;
            break;
          case 4:
            v8 |= 8uLL;
            break;
          case 5:
            v8 |= 0x10uLL;
            break;
          case 6:
            objc_msgSend(v14, "value");
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = (void *)v15;
            if (v15)
              v17 = v12;
            else
              v17 = 0;
            v18 = v10;
            if ((v17 & 1) != 0 || v15 && (v18 = v11, (v20 & 1) == 0))
              objc_msgSend(*v18, "appendString:", v15);

            break;
          default:
            continue;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_1B26912F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void sub_1B2692D88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B2692E18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  v2 = v1;

  _Unwind_Resume(a1);
}

void sub_1B26930D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B26931FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1B5E26C38](v1, 0x1080C40D2F62047);
  _Unwind_Resume(a1);
}

void sub_1B2693470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, ...)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  va_list va;

  va_start(va, a8);

  std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)va, 0);
  _Unwind_Resume(a1);
}

void sub_1B26935C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B26937E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B269393C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B2693AB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B2693B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_1B2693C14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B26959F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,std::exception a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,void *a42,uint64_t a43,int a44,__int16 a45,char a46,char a47,char a48,uint64_t a49,uint64_t a50,char *a51,uint64_t a52)
{
  void *v52;
  uint64_t v53;
  char *v55;
  uint64_t v56;

  a31.__vftable = (std::exception_vtbl *)&unk_1E649E898;
  MEMORY[0x1B5E26B48](v53 + 16);
  std::exception::~exception(&a31);
  if (a23 < 0)
    operator delete(__p);
  if (a17 < 0)
    operator delete(a12);
  if (a41 < 0)
    operator delete(a36);
  if (a42)
    operator delete(a42);
  nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::~parser(&a52);
  v55 = a51;
  if (a51 == &a48)
  {
    v56 = 4;
    v55 = &a48;
  }
  else
  {
    if (!a51)
      goto LABEL_14;
    v56 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v55 + 8 * v56))();
LABEL_14:

  _Unwind_Resume(a1);
}

void `anonymous namespace'::JSONSAXAdapter::~JSONSAXAdapter(id *this)
{

}

{

  JUMPOUT(0x1B5E26C38);
}

void sub_1B2695E40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, _QWORD *a6, uint64_t a7, ...)
{
  void *v7;
  uint64_t v8;
  _QWORD *v10;
  uint64_t v11;
  va_list va;

  va_start(va, a7);
  nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::~parser((_QWORD *)(v8 - 224));
  v10 = *(_QWORD **)(v8 - 232);
  if (v10 == (_QWORD *)(v8 - 256))
  {
    v11 = 4;
    v10 = (_QWORD *)(v8 - 256);
  }
  else
  {
    if (!v10)
      goto LABEL_6;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
LABEL_6:
  if (a6)
    std::ios_base::clear((std::ios_base *)((char *)a6 + *(_QWORD *)(*a6 - 24)), *(_DWORD *)((_BYTE *)a6 + *(_QWORD *)(*a6 - 24) + 32) & 2);
  std::ifstream::~ifstream((uint64_t *)va);

  _Unwind_Resume(a1);
}

_QWORD *std::ifstream::basic_ifstream(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  std::ios_base *v7;

  v2 = MEMORY[0x1E0DE4FA8];
  v3 = MEMORY[0x1E0DE4FA8] + 64;
  a1[53] = MEMORY[0x1E0DE4FA8] + 64;
  v4 = a1 + 2;
  v5 = *(_QWORD *)(MEMORY[0x1E0DE4F40] + 8);
  v6 = *(_QWORD *)(MEMORY[0x1E0DE4F40] + 16);
  *a1 = v5;
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v5 - 24)) = v6;
  a1[1] = 0;
  v7 = (std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  std::ios_base::init(v7, a1 + 2);
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  *a1 = v2 + 24;
  a1[53] = v3;
  MEMORY[0x1B5E26B84](v4);
  if (!std::filebuf::open())
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 4);
  return a1;
}

void sub_1B2695FBC(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::istream::~istream();
  MEMORY[0x1B5E26BE4](v1 + 424);
  _Unwind_Resume(a1);
}

_QWORD *std::ifstream::~ifstream(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x1E0DE4F40];
  v3 = *MEMORY[0x1E0DE4F40];
  *a1 = *MEMORY[0x1E0DE4F40];
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  MEMORY[0x1B5E26B90](a1 + 2);
  std::istream::~istream();
  MEMORY[0x1B5E26BE4](a1 + 53);
  return a1;
}

void sub_1B2696228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,void *a33,_QWORD *a34)
{
  void *v34;
  uint64_t v35;
  unint64_t *v37;
  uint64_t v38;

  nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::~parser((_QWORD *)(v35 - 240));
  v37 = (unint64_t *)STACK[0x538];
  if ((unint64_t *)STACK[0x538] == &STACK[0x520])
  {
    v38 = 4;
    v37 = &STACK[0x520];
  }
  else
  {
    if (!v37)
      goto LABEL_6;
    v38 = 5;
  }
  (*(void (**)(void))(*v37 + 8 * v38))();
LABEL_6:
  if (a34)
    std::ios_base::clear((std::ios_base *)((char *)a34 + *(_QWORD *)(*a34 - 24)), *(_DWORD *)((_BYTE *)a34 + *(_QWORD *)(*a34 - 24) + 32) & 2);
  std::istream::~istream();
  std::streambuf::~streambuf();

  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::JSONSAXAdapter::null(_anonymous_namespace_::JSONSAXAdapter *this)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *((_QWORD *)this + 1);
  v1 = (void *)*((_QWORD *)this + 2);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v1, "jsonReader:scalarValue:", v2, v3);

  return v4;
}

void sub_1B269635C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::JSONSAXAdapter::BOOLean(_anonymous_namespace_::JSONSAXAdapter *this, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = *((_QWORD *)this + 1);
  v2 = (void *)*((_QWORD *)this + 2);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "jsonReader:scalarValue:", v3, v4);

  return v5;
}

void sub_1B26963C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::JSONSAXAdapter::number_integer(_anonymous_namespace_::JSONSAXAdapter *this, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = *((_QWORD *)this + 1);
  v2 = (void *)*((_QWORD *)this + 2);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "jsonReader:scalarValue:", v3, v4);

  return v5;
}

void sub_1B269642C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::JSONSAXAdapter::number_unsigned(_anonymous_namespace_::JSONSAXAdapter *this, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = *((_QWORD *)this + 1);
  v2 = (void *)*((_QWORD *)this + 2);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "jsonReader:scalarValue:", v3, v4);

  return v5;
}

void sub_1B2696494(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::JSONSAXAdapter::number_float(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 8);
  v1 = *(void **)(a1 + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v1, "jsonReader:scalarValue:", v2, v3);

  return v4;
}

void sub_1B26964F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::JSONSAXAdapter::string(uint64_t a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  void *v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(void **)(a1 + 16);
  if (*((char *)a2 + 23) >= 0)
    v4 = a2;
  else
    v4 = (uint64_t *)*a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "jsonReader:scalarValue:", v3, v5);

  return v6;
}

void sub_1B269656C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::JSONSAXAdapter::binary(uint64_t a1, _QWORD *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(void **)(a1 + 16);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *a2, a2[1] - *a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "jsonReader:scalarValue:", v3, v4);

  return v5;
}

void sub_1B26965D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::JSONSAXAdapter::start_object(id *this)
{
  return objc_msgSend(this[2], "jsonReaderBeginObject:", this[1]);
}

uint64_t `anonymous namespace'::JSONSAXAdapter::key(uint64_t a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  void *v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(void **)(a1 + 16);
  if (*((char *)a2 + 23) >= 0)
    v4 = a2;
  else
    v4 = (uint64_t *)*a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "jsonReader:appendKey:", v3, v5);

  return v6;
}

void sub_1B2696658(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::JSONSAXAdapter::end_object(id *this)
{
  return objc_msgSend(this[2], "jsonReaderEndObject:", this[1]);
}

uint64_t `anonymous namespace'::JSONSAXAdapter::start_array(id *this)
{
  return objc_msgSend(this[2], "jsonReaderBeginArray:", this[1]);
}

uint64_t `anonymous namespace'::JSONSAXAdapter::end_array(id *this)
{
  return objc_msgSend(this[2], "jsonReaderEndArray:", this[1]);
}

uint64_t `anonymous namespace'::JSONSAXAdapter::parse_error(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = a4[2];
  v12 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (*(uint64_t (**)(int *))(*(_QWORD *)a4 + 16))(a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Safari.Core.WBSJSONReaderErrorDomain"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(*(id *)(a1 + 16), "jsonReader:error:", *(_QWORD *)(a1 + 8), v9);
  return v10;
}

void sub_1B2696798(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void `anonymous namespace'::FileDescriptorStreamBuf::~FileDescriptorStreamBuf(_anonymous_namespace_::FileDescriptorStreamBuf *this)
{
  std::streambuf::~streambuf();
  JUMPOUT(0x1B5E26C38);
}

uint64_t `anonymous namespace'::FileDescriptorStreamBuf::underflow(_anonymous_namespace_::FileDescriptorStreamBuf *this)
{
  unsigned __int8 *v1;
  ssize_t v3;

  v1 = (unsigned __int8 *)*((_QWORD *)this + 3);
  if ((unint64_t)v1 < *((_QWORD *)this + 4))
    return *v1;
  v1 = (unsigned __int8 *)this + 68;
  v3 = read(*((_DWORD *)this + 16), (char *)this + 68, 0x400uLL);
  if (v3 >= 1)
  {
    *((_QWORD *)this + 2) = v1;
    *((_QWORD *)this + 3) = v1;
    *((_QWORD *)this + 4) = &v1[v3];
    return *v1;
  }
  return 0xFFFFFFFFLL;
}

_QWORD *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parser<nlohmann::detail::iterator_input_adapter<char const*>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  _QWORD *v7;
  _QWORD *result;
  uint64_t v9;
  __int128 v10;
  _BYTE v11[24];
  _BYTE *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v10 = a1;
  *((_QWORD *)&v10 + 1) = a2;
  v7 = (_QWORD *)a3[3];
  if (v7)
  {
    if (v7 == a3)
    {
      v12 = v11;
      (*(void (**)(_QWORD *, _BYTE *))(*a3 + 24))(a3, v11);
    }
    else
    {
      v12 = (_BYTE *)a3[3];
      a3[3] = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::parser(a5, &v10, (uint64_t)v11, a4);
  result = v12;
  if (v12 == v11)
  {
    v9 = 4;
    result = v11;
  }
  else
  {
    if (!v12)
      return result;
    v9 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v9))();
}

void sub_1B269696C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, char *a15)
{
  char *v15;
  char *v17;
  uint64_t v18;

  v17 = a15;
  if (a15 == v15)
  {
    v18 = 4;
    v17 = &a12;
  }
  else
  {
    if (!a15)
      goto LABEL_6;
    v18 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v17 + 8 * v18))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

_QWORD *nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::~parser(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;

  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::~lexer((uint64_t)(a1 + 5));
  v2 = (_QWORD *)a1[3];
  if (v2 == a1)
  {
    v3 = 4;
    v2 = a1;
    goto LABEL_5;
  }
  if (v2)
  {
    v3 = 5;
LABEL_5:
    (*(void (**)(void))(*v2 + 8 * v3))();
  }
  return a1;
}

uint64_t nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::parser(uint64_t a1, _OWORD *a2, uint64_t a3, char a4)
{
  uint64_t v7;
  uint64_t v8;
  lconv *v9;
  int v10;

  v7 = std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::__value_func[abi:sn180100](a1, a3);
  *(_DWORD *)(v7 + 32) = 0;
  v8 = v7 + 40;
  *(_OWORD *)(v7 + 40) = *a2;
  *(_DWORD *)(v7 + 56) = -1;
  *(_BYTE *)(v7 + 60) = 0;
  *(_OWORD *)(v7 + 64) = 0u;
  *(_OWORD *)(v7 + 80) = 0u;
  *(_OWORD *)(v7 + 96) = 0u;
  *(_OWORD *)(v7 + 112) = 0u;
  *(_QWORD *)(v7 + 128) = 0;
  *(_QWORD *)(v7 + 136) = "";
  *(_QWORD *)(v7 + 152) = 0;
  *(_QWORD *)(v7 + 160) = 0;
  *(_QWORD *)(v7 + 144) = 0;
  v9 = localeconv();
  if (v9->decimal_point)
    v10 = *v9->decimal_point;
  else
    v10 = 46;
  *(_DWORD *)(a1 + 168) = v10;
  *(_BYTE *)(a1 + 176) = a4;
  *(_DWORD *)(a1 + 32) = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v8);
  return a1;
}

void sub_1B2696A98(_Unwind_Exception *a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::~lexer(v2);
  v4 = (_QWORD *)v1[3];
  if (v4 == v1)
  {
    v5 = 4;
  }
  else
  {
    if (!v4)
      goto LABEL_6;
    v5 = 5;
    v1 = (_QWORD *)v1[3];
  }
  (*(void (**)(_QWORD *))(*v1 + 8 * v5))(v1);
LABEL_6:
  _Unwind_Resume(a1);
}

uint64_t std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::__value_func[abi:sn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 24) + 24))(*(_QWORD *)(a2 + 24), a1);
    }
    else
    {
      *(_QWORD *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
    }
  }
  else
  {
    *(_QWORD *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(uint64_t a1)
{
  int v2;
  uint64_t result;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;

  if (*(_QWORD *)(a1 + 24)
    || nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::skip_bom((unsigned __int8 **)a1))
  {
    while (2)
    {
      while (1)
      {
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
        v2 = *(_DWORD *)(a1 + 16);
        if (v2 > 31)
          break;
        if ((v2 - 9) >= 2 && v2 != 13)
        {
          if ((v2 + 1) < 2)
            return 15;
LABEL_44:
          v6 = "invalid literal";
          goto LABEL_22;
        }
      }
      if (v2 > 90)
      {
        if (v2 <= 109)
        {
          switch(v2)
          {
            case '[':
              return 8;
            case ']':
              return 10;
            case 'f':
              v7 = 0;
              while (aFalse_0[v7 + 1] == nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1))
              {
                if (++v7 == 4)
                  return 2;
              }
              break;
          }
        }
        else if (v2 > 122)
        {
          if (v2 == 123)
            return 9;
          if (v2 == 125)
            return 11;
        }
        else if (v2 == 110)
        {
          v9 = 1819047278;
          v8 = 1;
          while (*((unsigned __int8 *)&v9 + v8) == nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1))
          {
            if (++v8 == 4)
              return 3;
          }
        }
        else if (v2 == 116)
        {
          v10 = 1702195828;
          v5 = 1;
          while (*((unsigned __int8 *)&v10 + v5) == nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1))
          {
            if (++v5 == 4)
              return 1;
          }
        }
        goto LABEL_44;
      }
      switch(v2)
      {
        case ' ':
          continue;
        case '"':
          result = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_string(a1);
          break;
        case ',':
          result = 13;
          break;
        case '-':
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
          result = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_number(a1);
          break;
        case ':':
          result = 12;
          break;
        default:
          goto LABEL_44;
      }
      break;
    }
  }
  else
  {
    v6 = "invalid BOM; must be 0xEF 0xBB 0xBF if given";
LABEL_22:
    *(_QWORD *)(a1 + 96) = v6;
    return 14;
  }
  return result;
}

BOOL nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::skip_bom(unsigned __int8 **a1)
{
  if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get(a1) == 239)
  {
    return nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get(a1) == 187
        && nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get(a1) == 191;
  }
  else
  {
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget((uint64_t)a1);
    return 1;
  }
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get(unsigned __int8 **a1)
{
  int i;
  unsigned __int8 *v3;
  unint64_t v4;
  unsigned __int8 *v5;
  uint64_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  uint64_t v9;
  unint64_t v10;
  size_t v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  unsigned __int8 v15;
  uint64_t result;
  uint64_t v17;

  *(int64x2_t *)(a1 + 3) = vaddq_s64(*(int64x2_t *)(a1 + 3), vdupq_n_s64(1uLL));
  if (!*((_BYTE *)a1 + 20))
  {
    v3 = *a1;
    if (*a1 == a1[1])
      goto LABEL_29;
    i = *v3;
    *a1 = v3 + 1;
    goto LABEL_5;
  }
  *((_BYTE *)a1 + 20) = 0;
  for (i = *((_DWORD *)a1 + 4); ; *((_DWORD *)a1 + 4) = i)
  {
    if (i == -1)
      return 0xFFFFFFFFLL;
    v5 = a1[7];
    v4 = (unint64_t)a1[8];
    if ((unint64_t)v5 >= v4)
      break;
    if (v5)
    {
      *v5 = i;
      v6 = (uint64_t)(v5 + 1);
      goto LABEL_24;
    }
LABEL_28:
    __break(1u);
LABEL_29:
    i = -1;
LABEL_5:
    ;
  }
  v7 = (unint64_t)a1[6];
  v8 = &v5[-v7];
  v9 = (uint64_t)&v5[-v7 + 1];
  if (v9 < 0)
    abort();
  v10 = v4 - v7;
  if (2 * v10 > v9)
    v9 = 2 * v10;
  if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v11 = v9;
  if (!v11)
    goto LABEL_28;
  v12 = (unsigned __int8 *)operator new(v11);
  v13 = &v12[v11];
  v8[(_QWORD)v12] = i;
  v6 = (uint64_t)&v8[(_QWORD)v12 + 1];
  if (v5 == (unsigned __int8 *)v7)
  {
    v12 = &v8[(_QWORD)v12];
  }
  else
  {
    v14 = &v5[~v7];
    do
    {
      v15 = *--v5;
      (v14--)[(_QWORD)v12] = v15;
    }
    while (v5 != (unsigned __int8 *)v7);
    v5 = (unsigned __int8 *)v7;
  }
  a1[6] = v12;
  a1[7] = (unsigned __int8 *)v6;
  a1[8] = v13;
  if (v5)
    operator delete(v5);
LABEL_24:
  a1[7] = (unsigned __int8 *)v6;
  result = *((unsigned int *)a1 + 4);
  if ((_DWORD)result == 10)
  {
    v17 = (uint64_t)(a1[5] + 1);
    a1[4] = 0;
    a1[5] = (unsigned __int8 *)v17;
  }
  return result;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_string(uint64_t a1)
{
  int v2;
  uint64_t result;
  const char *v4;
  int v5;
  std::string *v6;
  uint64_t v7;
  __int128 v8;
  __int128 *v9;
  int v10;
  unsigned int codepoint;
  unsigned int v12;
  unsigned int v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::reset(a1);
  while (2)
  {
    while (2)
    {
      v2 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1)
         + 1;
      result = 4;
      v4 = "invalid string: missing closing quote";
      switch(v2)
      {
        case 0:
          goto LABEL_81;
        case 1:
          v4 = "invalid string: control character U+0000 (NUL) must be escaped to \\u0000";
          goto LABEL_81;
        case 2:
          v4 = "invalid string: control character U+0001 (SOH) must be escaped to \\u0001";
          goto LABEL_81;
        case 3:
          v4 = "invalid string: control character U+0002 (STX) must be escaped to \\u0002";
          goto LABEL_81;
        case 4:
          v4 = "invalid string: control character U+0003 (ETX) must be escaped to \\u0003";
          goto LABEL_81;
        case 5:
          v4 = "invalid string: control character U+0004 (EOT) must be escaped to \\u0004";
          goto LABEL_81;
        case 6:
          v4 = "invalid string: control character U+0005 (ENQ) must be escaped to \\u0005";
          goto LABEL_81;
        case 7:
          v4 = "invalid string: control character U+0006 (ACK) must be escaped to \\u0006";
          goto LABEL_81;
        case 8:
          v4 = "invalid string: control character U+0007 (BEL) must be escaped to \\u0007";
          goto LABEL_81;
        case 9:
          v4 = "invalid string: control character U+0008 (BS) must be escaped to \\u0008 or \\b";
          goto LABEL_81;
        case 10:
          v4 = "invalid string: control character U+0009 (HT) must be escaped to \\u0009 or \\t";
          goto LABEL_81;
        case 11:
          v4 = "invalid string: control character U+000A (LF) must be escaped to \\u000A or \\n";
          goto LABEL_81;
        case 12:
          v4 = "invalid string: control character U+000B (VT) must be escaped to \\u000B";
          goto LABEL_81;
        case 13:
          v4 = "invalid string: control character U+000C (FF) must be escaped to \\u000C or \\f";
          goto LABEL_81;
        case 14:
          v4 = "invalid string: control character U+000D (CR) must be escaped to \\u000D or \\r";
          goto LABEL_81;
        case 15:
          v4 = "invalid string: control character U+000E (SO) must be escaped to \\u000E";
          goto LABEL_81;
        case 16:
          v4 = "invalid string: control character U+000F (SI) must be escaped to \\u000F";
          goto LABEL_81;
        case 17:
          v4 = "invalid string: control character U+0010 (DLE) must be escaped to \\u0010";
          goto LABEL_81;
        case 18:
          v4 = "invalid string: control character U+0011 (DC1) must be escaped to \\u0011";
          goto LABEL_81;
        case 19:
          v4 = "invalid string: control character U+0012 (DC2) must be escaped to \\u0012";
          goto LABEL_81;
        case 20:
          v4 = "invalid string: control character U+0013 (DC3) must be escaped to \\u0013";
          goto LABEL_81;
        case 21:
          v4 = "invalid string: control character U+0014 (DC4) must be escaped to \\u0014";
          goto LABEL_81;
        case 22:
          v4 = "invalid string: control character U+0015 (NAK) must be escaped to \\u0015";
          goto LABEL_81;
        case 23:
          v4 = "invalid string: control character U+0016 (SYN) must be escaped to \\u0016";
          goto LABEL_81;
        case 24:
          v4 = "invalid string: control character U+0017 (ETB) must be escaped to \\u0017";
          goto LABEL_81;
        case 25:
          v4 = "invalid string: control character U+0018 (CAN) must be escaped to \\u0018";
          goto LABEL_81;
        case 26:
          v4 = "invalid string: control character U+0019 (EM) must be escaped to \\u0019";
          goto LABEL_81;
        case 27:
          v4 = "invalid string: control character U+001A (SUB) must be escaped to \\u001A";
          goto LABEL_81;
        case 28:
          v4 = "invalid string: control character U+001B (ESC) must be escaped to \\u001B";
          goto LABEL_81;
        case 29:
          v4 = "invalid string: control character U+001C (FS) must be escaped to \\u001C";
          goto LABEL_81;
        case 30:
          v4 = "invalid string: control character U+001D (GS) must be escaped to \\u001D";
          goto LABEL_81;
        case 31:
          v4 = "invalid string: control character U+001E (RS) must be escaped to \\u001E";
          goto LABEL_81;
        case 32:
          v4 = "invalid string: control character U+001F (US) must be escaped to \\u001F";
          goto LABEL_81;
        case 33:
        case 34:
        case 36:
        case 37:
        case 38:
        case 39:
        case 40:
        case 41:
        case 42:
        case 43:
        case 44:
        case 45:
        case 46:
        case 47:
        case 48:
        case 49:
        case 50:
        case 51:
        case 52:
        case 53:
        case 54:
        case 55:
        case 56:
        case 57:
        case 58:
        case 59:
        case 60:
        case 61:
        case 62:
        case 63:
        case 64:
        case 65:
        case 66:
        case 67:
        case 68:
        case 69:
        case 70:
        case 71:
        case 72:
        case 73:
        case 74:
        case 75:
        case 76:
        case 77:
        case 78:
        case 79:
        case 80:
        case 81:
        case 82:
        case 83:
        case 84:
        case 85:
        case 86:
        case 87:
        case 88:
        case 89:
        case 90:
        case 91:
        case 92:
        case 94:
        case 95:
        case 96:
        case 97:
        case 98:
        case 99:
        case 100:
        case 101:
        case 102:
        case 103:
        case 104:
        case 105:
        case 106:
        case 107:
        case 108:
        case 109:
        case 110:
        case 111:
        case 112:
        case 113:
        case 114:
        case 115:
        case 116:
        case 117:
        case 118:
        case 119:
        case 120:
        case 121:
        case 122:
        case 123:
        case 124:
        case 125:
        case 126:
        case 127:
        case 128:
          v5 = *(_DWORD *)(a1 + 16);
          goto LABEL_4;
        case 35:
          return result;
        case 93:
          v10 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
          v4 = "invalid string: forbidden character after backslash";
          if (v10 <= 97)
          {
            switch(v10)
            {
              case '"':
                LOBYTE(v5) = 34;
                break;
              case '/':
                LOBYTE(v5) = 47;
                break;
              case '\\':
                LOBYTE(v5) = 92;
                break;
              default:
                goto LABEL_81;
            }
            goto LABEL_4;
          }
          break;
        case 195:
        case 196:
        case 197:
        case 198:
        case 199:
        case 200:
        case 201:
        case 202:
        case 203:
        case 204:
        case 205:
        case 206:
        case 207:
        case 208:
        case 209:
        case 210:
        case 211:
        case 212:
        case 213:
        case 214:
        case 215:
        case 216:
        case 217:
        case 218:
        case 219:
        case 220:
        case 221:
        case 222:
        case 223:
        case 224:
          *(_QWORD *)&v14 = 0xBF00000080;
          v6 = (std::string *)a1;
          v7 = 2;
          goto LABEL_19;
        case 225:
          v8 = xmmword_1B26DEC60;
          goto LABEL_7;
        case 226:
        case 227:
        case 228:
        case 229:
        case 230:
        case 231:
        case 232:
        case 233:
        case 234:
        case 235:
        case 236:
        case 237:
        case 239:
        case 240:
          v8 = xmmword_1B26DEC50;
          goto LABEL_7;
        case 238:
          v8 = xmmword_1B26DEC40;
LABEL_7:
          v14 = v8;
          v6 = (std::string *)a1;
          v7 = 4;
          goto LABEL_19;
        case 241:
          v15 = 0xBF00000080;
          v9 = &xmmword_1B26DEBF8;
          goto LABEL_18;
        case 242:
        case 243:
        case 244:
          v15 = 0xBF00000080;
          v9 = &xmmword_1B26DEC10;
          goto LABEL_18;
        case 245:
          v15 = 0xBF00000080;
          v9 = &xmmword_1B26DEC28;
LABEL_18:
          v14 = *v9;
          v6 = (std::string *)a1;
          v7 = 6;
LABEL_19:
          if ((nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::next_byte_in_range(v6, &v14, v7) & 1) == 0)return 14;
          continue;
        default:
          v4 = "invalid string: ill-formed UTF-8 byte";
          goto LABEL_81;
      }
      break;
    }
    switch(v10)
    {
      case 'n':
        LOBYTE(v5) = 10;
        goto LABEL_4;
      case 'o':
      case 'p':
      case 'q':
      case 's':
        goto LABEL_81;
      case 'r':
        LOBYTE(v5) = 13;
        goto LABEL_4;
      case 't':
        LOBYTE(v5) = 9;
        goto LABEL_4;
      case 'u':
        codepoint = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_codepoint(a1);
        if (codepoint == -1)
          goto LABEL_83;
        v12 = codepoint;
        if ((codepoint & 0xFFFFFC00) != 0xD800)
        {
          if ((codepoint & 0xFFFFFC00) == 0xDC00)
          {
            v4 = "invalid string: surrogate U+DC00..U+DFFF must follow U+D800..U+DBFF";
            goto LABEL_81;
          }
          if ((int)codepoint > 127)
          {
            if (codepoint <= 0x7FF)
            {
              std::string::push_back((std::string *)(a1 + 72), (codepoint >> 6) | 0xC0);
              goto LABEL_39;
            }
            if (!HIWORD(codepoint))
            {
              std::string::push_back((std::string *)(a1 + 72), (codepoint >> 12) | 0xE0);
              goto LABEL_38;
            }
LABEL_37:
            std::string::push_back((std::string *)(a1 + 72), (v12 >> 18) | 0xF0);
            std::string::push_back((std::string *)(a1 + 72), (v12 >> 12) & 0x3F | 0x80);
LABEL_38:
            std::string::push_back((std::string *)(a1 + 72), (v12 >> 6) & 0x3F | 0x80);
LABEL_39:
            LOBYTE(v5) = v12 & 0x3F | 0x80;
            goto LABEL_4;
          }
          LOBYTE(v5) = codepoint;
LABEL_4:
          std::string::push_back((std::string *)(a1 + 72), v5);
          continue;
        }
        if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1) != 92
          || nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1) != 117)
        {
LABEL_84:
          v4 = "invalid string: surrogate U+D800..U+DBFF must be followed by U+DC00..U+DFFF";
          goto LABEL_81;
        }
        v13 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_codepoint(a1);
        if (v13 != -1)
        {
          if (v13 >> 10 != 55)
            goto LABEL_84;
          v12 = v13 + (v12 << 10) - 56613888;
          goto LABEL_37;
        }
LABEL_83:
        v4 = "invalid string: '\\u' must be followed by 4 hex digits";
LABEL_81:
        *(_QWORD *)(a1 + 96) = v4;
        return 14;
      default:
        if (v10 == 98)
        {
          LOBYTE(v5) = 8;
        }
        else
        {
          if (v10 != 102)
            goto LABEL_81;
          LOBYTE(v5) = 12;
        }
        goto LABEL_4;
    }
  }
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_number(uint64_t a1)
{
  int v2;
  int v3;
  std::string *v4;
  int v5;
  int v6;
  std::string *v7;
  const char *v8;
  int v10;
  const char *v11;
  int v12;
  int v13;
  const char *v14;
  unint64_t v15;
  const char *v16;
  uint64_t v17;
  char *__endptr;

  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::reset(a1);
  v2 = *(_DWORD *)(a1 + 16);
  if ((v2 - 49) < 9)
  {
    v3 = 5;
LABEL_3:
    v4 = (std::string *)(a1 + 72);
    while (1)
    {
      std::string::push_back((std::string *)(a1 + 72), v2);
      v5 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
      if ((v5 - 48) >= 0xA)
        break;
      v2 = *(_DWORD *)(a1 + 16);
    }
    if (v5 != 46)
    {
      if (v5 == 69 || v5 == 101)
        goto LABEL_9;
LABEL_37:
      nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget(a1);
      __endptr = 0;
      *__error() = 0;
      if (v3 == 6)
      {
        v16 = (const char *)(a1 + 72);
        if (*(char *)(a1 + 95) < 0)
          v16 = *(const char **)v16;
        v17 = strtoll(v16, &__endptr, 10);
        if (!*__error())
        {
          *(_QWORD *)(a1 + 104) = v17;
          return 6;
        }
      }
      else
      {
        v14 = (const char *)(a1 + 72);
        if (*(char *)(a1 + 95) < 0)
          v14 = *(const char **)v14;
        v15 = strtoull(v14, &__endptr, 10);
        if (!*__error())
        {
          *(_QWORD *)(a1 + 112) = v15;
          return 5;
        }
      }
      goto LABEL_14;
    }
    goto LABEL_31;
  }
  if (v2 == 48)
  {
    std::string::push_back((std::string *)(a1 + 72), 48);
    v3 = 5;
  }
  else
  {
    if (v2 == 45)
      std::string::push_back((std::string *)(a1 + 72), 45);
    v10 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
    if ((v10 - 49) < 9)
    {
      v2 = *(_DWORD *)(a1 + 16);
      v3 = 6;
      goto LABEL_3;
    }
    if (v10 != 48)
    {
      v11 = "invalid number; expected digit after '-'";
      goto LABEL_52;
    }
    std::string::push_back((std::string *)(a1 + 72), *(_BYTE *)(a1 + 16));
    v3 = 6;
  }
  v12 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
  if (v12 == 101 || v12 == 69)
  {
    v4 = (std::string *)(a1 + 72);
    goto LABEL_9;
  }
  if (v12 != 46)
    goto LABEL_37;
  v4 = (std::string *)(a1 + 72);
LABEL_31:
  std::string::push_back(v4, *(_BYTE *)(a1 + 128));
  if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1)
     - 48 > 9)
  {
    v11 = "invalid number; expected digit after '.'";
    goto LABEL_52;
  }
  v4 = (std::string *)(a1 + 72);
  do
  {
    std::string::push_back((std::string *)(a1 + 72), *(_BYTE *)(a1 + 16));
    v13 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
  }
  while ((v13 - 48) < 0xA);
  if (v13 == 101 || v13 == 69)
  {
LABEL_9:
    std::string::push_back(v4, *(_BYTE *)(a1 + 16));
    v6 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
    if ((v6 - 48) < 0xA)
    {
      v7 = (std::string *)(a1 + 72);
      goto LABEL_11;
    }
    if (v6 == 45 || v6 == 43)
    {
      v7 = (std::string *)(a1 + 72);
      std::string::push_back((std::string *)(a1 + 72), *(_BYTE *)(a1 + 16));
      if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1)
         - 48 < 0xA)
      {
LABEL_11:
        std::string::push_back(v7, *(_BYTE *)(a1 + 16));
        if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1)
           - 48 <= 9)
        {
          do
            std::string::push_back((std::string *)(a1 + 72), *(_BYTE *)(a1 + 16));
          while (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1)
                - 48 < 0xA);
        }
        goto LABEL_13;
      }
      v11 = "invalid number; expected digit after exponent sign";
    }
    else
    {
      v11 = "invalid number; expected '+', '-', or digit after exponent";
    }
LABEL_52:
    *(_QWORD *)(a1 + 96) = v11;
    return 14;
  }
LABEL_13:
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget(a1);
  __endptr = 0;
  *__error() = 0;
LABEL_14:
  v8 = (const char *)(a1 + 72);
  if (*(char *)(a1 + 95) < 0)
    v8 = *(const char **)v8;
  *(double *)(a1 + 120) = strtod(v8, &__endptr);
  return 7;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (_QWORD *)(result + 32);
  v2 = *(_QWORD *)(result + 32);
  *(_BYTE *)(result + 20) = 1;
  --*(_QWORD *)(result + 24);
  if (v2 || (v1 = (_QWORD *)(result + 40), (v2 = *(_QWORD *)(result + 40)) != 0))
    *v1 = v2 - 1;
  if (*(_DWORD *)(result + 16) != -1)
  {
    v3 = *(_QWORD *)(result + 56);
    if (*(_QWORD *)(result + 48) == v3)
      __break(1u);
    else
      *(_QWORD *)(result + 56) = v3 - 1;
  }
  return result;
}

void nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::reset(uint64_t a1)
{
  _BYTE *v2;
  int v3;
  unint64_t v4;
  _BYTE *v5;
  unint64_t v6;
  uint64_t v7;
  size_t v8;
  _BYTE *v9;
  _BYTE *v10;

  if (*(char *)(a1 + 95) < 0)
  {
    **(_BYTE **)(a1 + 72) = 0;
    *(_QWORD *)(a1 + 80) = 0;
  }
  else
  {
    *(_BYTE *)(a1 + 72) = 0;
    *(_BYTE *)(a1 + 95) = 0;
  }
  v2 = *(_BYTE **)(a1 + 48);
  *(_QWORD *)(a1 + 56) = v2;
  v3 = *(_DWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 64);
  if ((unint64_t)v2 >= v4)
  {
    v6 = v4 - (_QWORD)v2;
    v7 = 2 * v6;
    if (2 * v6 <= 1)
      v7 = 1;
    if (v6 >= 0x3FFFFFFFFFFFFFFFLL)
      v8 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v8 = v7;
    v9 = operator new(v8);
    v10 = &v9[v8];
    *v9 = v3;
    v5 = v9 + 1;
    *(_QWORD *)(a1 + 48) = v9;
    *(_QWORD *)(a1 + 56) = v9 + 1;
    *(_QWORD *)(a1 + 64) = v10;
    if (v2)
      operator delete(v2);
    goto LABEL_14;
  }
  if (v2)
  {
    *v2 = v3;
    v5 = v2 + 1;
LABEL_14:
    *(_QWORD *)(a1 + 56) = v5;
    return;
  }
  __break(1u);
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_codepoint(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  __int128 v8;
  uint64_t v9;

  v2 = 0;
  LODWORD(v3) = 0;
  v9 = *MEMORY[0x1E0C80C00];
  v8 = xmmword_1B26DEC70;
  while (1)
  {
    v4 = *(_DWORD *)((char *)&v8 + v2);
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
    v5 = *(_DWORD *)(a1 + 16);
    v6 = v5 - 48;
    if ((v5 - 48) >= 0xA)
      break;
LABEL_7:
    v3 = ((v6 << v4) + v3);
    v2 += 4;
    if (v2 == 16)
      return v3;
  }
  if ((v5 - 65) <= 5)
  {
    v6 = v5 - 55;
    goto LABEL_7;
  }
  if ((v5 - 97) <= 5)
  {
    v6 = v5 - 87;
    goto LABEL_7;
  }
  return 0xFFFFFFFFLL;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::next_byte_in_range(std::string *a1, _DWORD *a2, uint64_t a3)
{
  std::string *v6;
  _DWORD *v7;
  int v8;
  uint64_t result;

  v6 = a1 + 3;
  std::string::push_back(a1 + 3, a1->__r_.__value_.__s.__data_[16]);
  if (!a3)
    return 1;
  v7 = &a2[a3];
  while (1)
  {
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
    v8 = a1->__r_.__value_.__r.__words[2];
    if (*a2 > v8 || v8 > a2[1])
      break;
    std::string::push_back(v6, v8);
    a2 += 2;
    if (a2 == v7)
      return 1;
  }
  result = 0;
  a1[4].__r_.__value_.__r.__words[0] = (std::string::size_type)"invalid string: ill-formed UTF-8 byte";
  return result;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::~lexer(uint64_t a1)
{
  void *v2;

  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
  return a1;
}

void nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  unsigned __int8 *v3;
  unsigned __int8 *i;
  unsigned int v5;
  std::string::size_type v6;
  char __str[8];
  char v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  v3 = *(unsigned __int8 **)(a1 + 48);
  for (i = *(unsigned __int8 **)(a1 + 56); v3 != i; ++v3)
  {
    v5 = *v3;
    if (v5 > 0x1F)
    {
      std::string::push_back(a2, v5);
    }
    else
    {
      v8 = 0;
      *(_QWORD *)__str = 0;
      snprintf(__str, 9uLL, "<U+%.4X>", v5);
      v6 = strlen(__str);
      std::string::append(a2, __str, v6);
    }
  }
}

void sub_1B2697A7C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::parse_error::create(int a1@<W0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, nlohmann::detail::exception *a4@<X8>)
{
  std::string *v8;
  __int128 v9;
  std::string *p_p;
  std::string::size_type size;
  std::string *v12;
  __int128 v13;
  std::string *v14;
  __int128 v15;
  int v16;
  const std::string::value_type *v17;
  std::string::size_type v18;
  std::string *v19;
  __int128 v20;
  uint64_t v21;
  const char *v22;
  std::string __p;
  void *v24;
  char v25;
  std::string v26;
  std::string v27;
  std::string v28;
  std::string v29;
  __int128 v30;
  int64_t v31;

  std::string::basic_string[abi:sn180100]<0>((char **)&v24, "parse_error");
  nlohmann::detail::exception::name(a1, &v26);
  v8 = std::string::append(&v26, "parse error", 0xBuLL);
  v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v27.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  nlohmann::detail::parse_error::position_string((uint64_t)a2, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  v12 = std::string::append(&v27, (const std::string::value_type *)p_p, size);
  v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  v28.__r_.__value_.__r.__words[2] = v12->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  v14 = std::string::append(&v28, ": ", 2uLL);
  v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  v29.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  v16 = *(char *)(a3 + 23);
  if (v16 >= 0)
    v17 = (const std::string::value_type *)a3;
  else
    v17 = *(const std::string::value_type **)a3;
  if (v16 >= 0)
    v18 = *(unsigned __int8 *)(a3 + 23);
  else
    v18 = *(_QWORD *)(a3 + 8);
  v19 = std::string::append(&v29, v17, v18);
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  v31 = v19->__r_.__value_.__r.__words[2];
  v30 = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v29.__r_.__value_.__l.__data_);
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v28.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v27.__r_.__value_.__l.__data_);
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v26.__r_.__value_.__l.__data_);
  if (v25 < 0)
    operator delete(v24);
  v21 = *a2;
  if (v31 >= 0)
    v22 = (const char *)&v30;
  else
    v22 = (const char *)v30;
  nlohmann::detail::exception::exception(a4, a1, v22);
  *(_QWORD *)a4 = &unk_1E649E8C0;
  *((_QWORD *)a4 + 4) = v21;
  if (SHIBYTE(v31) < 0)
    operator delete((void *)v30);
}

void sub_1B2697C80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  uint64_t v40;

  if (*(char *)(v40 - 57) < 0)
    operator delete(*(void **)(v40 - 80));
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  uint64_t v8;
  std::string *v9;
  __int128 v10;
  const std::string::value_type *v11;
  std::string::size_type v12;
  unsigned int v13;
  std::string *v14;
  __int128 v15;
  std::string *p_p;
  std::string::size_type size;
  std::string *v18;
  __int128 v19;
  std::string *v20;
  __int128 v21;
  const std::string::value_type *v22;
  std::string::size_type v23;
  void *v24;
  char *v25;
  std::string *v26;
  __int128 v27;
  const std::string::value_type *v28;
  std::string::size_type v29;
  char *v30;
  std::string *v31;
  __int128 v32;
  const std::string::value_type *v33;
  std::string::size_type v34;
  std::string __p;
  std::string v36;
  std::string v37;
  std::string v38;
  __int128 v39;
  int64_t v40;

  std::string::basic_string[abi:sn180100]<0>(&a4->__r_.__value_.__l.__data_, "syntax error ");
  v8 = *(unsigned __int8 *)(a3 + 23);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a3 + 8);
  if (v8)
  {
    std::operator+<char>();
    v9 = std::string::append(&v38, " ", 1uLL);
    v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    v40 = v9->__r_.__value_.__r.__words[2];
    v39 = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    if (v40 >= 0)
      v11 = (const std::string::value_type *)&v39;
    else
      v11 = (const std::string::value_type *)v39;
    if (v40 >= 0)
      v12 = HIBYTE(v40);
    else
      v12 = *((_QWORD *)&v39 + 1);
    std::string::append(a4, v11, v12);
    if (SHIBYTE(v40) < 0)
      operator delete((void *)v39);
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v38.__r_.__value_.__l.__data_);
  }
  std::string::append(a4, "- ", 2uLL);
  v13 = *(_DWORD *)(a1 + 32);
  if (v13 == 14)
  {
    std::string::basic_string[abi:sn180100]<0>(&v36.__r_.__value_.__l.__data_, *(char **)(a1 + 136));
    v14 = std::string::append(&v36, "; last read: '", 0xEuLL);
    v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
    v37.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v15;
    v14->__r_.__value_.__l.__size_ = 0;
    v14->__r_.__value_.__r.__words[2] = 0;
    v14->__r_.__value_.__r.__words[0] = 0;
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(a1 + 40, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      size = __p.__r_.__value_.__l.__size_;
    v18 = std::string::append(&v37, (const std::string::value_type *)p_p, size);
    v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    v38.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v19;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    v20 = std::string::append(&v38, "'", 1uLL);
    v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
    v40 = v20->__r_.__value_.__r.__words[2];
    v39 = v21;
    v20->__r_.__value_.__l.__size_ = 0;
    v20->__r_.__value_.__r.__words[2] = 0;
    v20->__r_.__value_.__r.__words[0] = 0;
    if (v40 >= 0)
      v22 = (const std::string::value_type *)&v39;
    else
      v22 = (const std::string::value_type *)v39;
    if (v40 >= 0)
      v23 = HIBYTE(v40);
    else
      v23 = *((_QWORD *)&v39 + 1);
    std::string::append(a4, v22, v23);
    if (SHIBYTE(v40) < 0)
      operator delete((void *)v39);
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v38.__r_.__value_.__l.__data_);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v37.__r_.__value_.__l.__data_);
    if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
    {
      v24 = (void *)v36.__r_.__value_.__r.__words[0];
      goto LABEL_49;
    }
LABEL_46:
    if (!a2)
      return;
    goto LABEL_50;
  }
  v25 = (char *)nlohmann::detail::lexer_base<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::token_type_name(v13);
  std::string::basic_string[abi:sn180100]<0>(&v38.__r_.__value_.__l.__data_, v25);
  v26 = std::string::insert(&v38, 0, "unexpected ", 0xBuLL);
  v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
  v40 = v26->__r_.__value_.__r.__words[2];
  v39 = v27;
  v26->__r_.__value_.__l.__size_ = 0;
  v26->__r_.__value_.__r.__words[2] = 0;
  v26->__r_.__value_.__r.__words[0] = 0;
  if (v40 >= 0)
    v28 = (const std::string::value_type *)&v39;
  else
    v28 = (const std::string::value_type *)v39;
  if (v40 >= 0)
    v29 = HIBYTE(v40);
  else
    v29 = *((_QWORD *)&v39 + 1);
  std::string::append(a4, v28, v29);
  if (SHIBYTE(v40) < 0)
    operator delete((void *)v39);
  if ((SHIBYTE(v38.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    goto LABEL_46;
  v24 = (void *)v38.__r_.__value_.__r.__words[0];
LABEL_49:
  operator delete(v24);
  if (!a2)
    return;
LABEL_50:
  v30 = (char *)nlohmann::detail::lexer_base<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::token_type_name(a2);
  std::string::basic_string[abi:sn180100]<0>(&v38.__r_.__value_.__l.__data_, v30);
  v31 = std::string::insert(&v38, 0, "; expected ", 0xBuLL);
  v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
  v40 = v31->__r_.__value_.__r.__words[2];
  v39 = v32;
  v31->__r_.__value_.__l.__size_ = 0;
  v31->__r_.__value_.__r.__words[2] = 0;
  v31->__r_.__value_.__r.__words[0] = 0;
  if (v40 >= 0)
    v33 = (const std::string::value_type *)&v39;
  else
    v33 = (const std::string::value_type *)v39;
  if (v40 >= 0)
    v34 = HIBYTE(v40);
  else
    v34 = *((_QWORD *)&v39 + 1);
  std::string::append(a4, v33, v34);
  if (SHIBYTE(v40) < 0)
    operator delete((void *)v39);
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v38.__r_.__value_.__l.__data_);
}

void sub_1B2698068(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  uint64_t v33;
  uint64_t v34;

  if (*(char *)(v34 - 41) < 0)
    operator delete(*(void **)(v34 - 64));
  if (a33 < 0)
    operator delete(__p);
  if (a14 < 0)
    operator delete(a9);
  if (a26 < 0)
    operator delete(a21);
  if (a20 < 0)
    operator delete(a15);
  if (*(char *)(v33 + 23) < 0)
    operator delete(*(void **)v33);
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::parse_error::~parse_error(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_1E649E898;
  MEMORY[0x1B5E26B48](&this[2]);
  std::exception::~exception(this);
}

{
  this->__vftable = (std::exception_vtbl *)&unk_1E649E898;
  MEMORY[0x1B5E26B48](&this[2]);
  std::exception::~exception(this);
  JUMPOUT(0x1B5E26C38);
}

void std::vector<BOOL>::push_back(uint64_t a1, _BYTE *a2)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  if (v4 == v5 << 6)
  {
    if ((uint64_t)(v4 + 1) < 0)
      abort();
    v6 = v5 << 7;
    if (v6 <= (v4 & 0xFFFFFFFFFFFFFFC0) + 64)
      v6 = (v4 & 0xFFFFFFFFFFFFFFC0) + 64;
    if (v4 <= 0x3FFFFFFFFFFFFFFELL)
      v7 = v6;
    else
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    std::vector<BOOL>::reserve((char **)a1, v7);
    v4 = *(_QWORD *)(a1 + 8);
  }
  *(_QWORD *)(a1 + 8) = v4 + 1;
  v8 = *(char **)a1;
  v9 = v4 >> 6;
  v10 = 1 << v4;
  if (*a2)
    v11 = *(_QWORD *)&v8[8 * v9] | v10;
  else
    v11 = *(_QWORD *)&v8[8 * v9] & ~v10;
  *(_QWORD *)&v8[8 * v9] = v11;
}

void nlohmann::detail::out_of_range::create(int a1@<W0>, uint64_t a2@<X1>, nlohmann::detail::exception *a3@<X8>)
{
  int v6;
  const std::string::value_type *v7;
  std::string::size_type v8;
  std::string *v9;
  __int128 v10;
  void **v11;
  void *__p;
  char v13;
  std::string v14;
  void *v15[2];
  int64_t v16;

  std::string::basic_string[abi:sn180100]<0>((char **)&__p, "out_of_range");
  nlohmann::detail::exception::name(a1, &v14);
  v6 = *(char *)(a2 + 23);
  if (v6 >= 0)
    v7 = (const std::string::value_type *)a2;
  else
    v7 = *(const std::string::value_type **)a2;
  if (v6 >= 0)
    v8 = *(unsigned __int8 *)(a2 + 23);
  else
    v8 = *(_QWORD *)(a2 + 8);
  v9 = std::string::append(&v14, v7, v8);
  v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v16 = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)v15 = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  if (v13 < 0)
    operator delete(__p);
  if (v16 >= 0)
    v11 = v15;
  else
    v11 = (void **)v15[0];
  nlohmann::detail::exception::exception(a3, a1, (const char *)v11);
  *(_QWORD *)a3 = &unk_1E649E870;
  if (SHIBYTE(v16) < 0)
    operator delete(v15[0]);
}

void sub_1B2698308(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::out_of_range::~out_of_range(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_1E649E898;
  MEMORY[0x1B5E26B48](&this[2]);
  std::exception::~exception(this);
}

{
  this->__vftable = (std::exception_vtbl *)&unk_1E649E898;
  MEMORY[0x1B5E26B48](&this[2]);
  std::exception::~exception(this);
  JUMPOUT(0x1B5E26C38);
}

void std::vector<BOOL>::reserve(char **a1, unint64_t a2)
{
  unint64_t v3;
  char *v4;
  __int128 v5;
  char *v6;
  int v7;
  char *v8;
  int v9;
  char *v10;
  __int128 v11;

  if (a2 > (_QWORD)a1[2] << 6)
  {
    if ((a2 & 0x8000000000000000) != 0)
      abort();
    v10 = 0;
    v11 = 0uLL;
    std::vector<BOOL>::__vallocate[abi:sn180100](&v10, a2);
    v3 = (unint64_t)a1[1];
    v8 = *a1;
    v9 = 0;
    v6 = &v8[8 * (v3 >> 6)];
    v7 = v3 & 0x3F;
    std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(&v10, (uint64_t)&v8, (uint64_t)&v6, v3);
    v4 = *a1;
    *a1 = v10;
    v10 = v4;
    v5 = *(_OWORD *)(a1 + 1);
    *(_OWORD *)(a1 + 1) = v11;
    v11 = v5;
    if (v4)
      operator delete(v4);
  }
}

void sub_1B2698424(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void *std::vector<BOOL>::__vallocate[abi:sn180100](_QWORD *a1, uint64_t a2)
{
  void *result;
  uint64_t v4;

  if (a2 < 0)
    abort();
  result = std::__allocate_at_least[abi:sn180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 2), ((unint64_t)(a2 - 1) >> 6) + 1);
  *a1 = result;
  a1[1] = 0;
  a1[2] = v4;
  return result;
}

void std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;

  v4 = a1[1];
  v5 = v4 + a4;
  a1[1] = v4 + a4;
  if (!v4 || ((v5 - 1) ^ (v4 - 1)) >= 0x40)
  {
    if (v5 >= 0x41)
      v6 = (v5 - 1) >> 6;
    else
      v6 = 0;
    *(_QWORD *)(*a1 + 8 * v6) = 0;
  }
  v7 = *(_DWORD *)(a2 + 8);
  v8 = *(_QWORD *)a3;
  v9 = *(_DWORD *)(a3 + 8);
  v10 = *a1 + 8 * (v4 >> 6);
  v16 = *(_QWORD *)a2;
  v17 = v7;
  v14 = v8;
  v15 = v9;
  v12 = v10;
  v13 = v4 & 0x3F;
  std::__unwrap_and_dispatch[abi:sn180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,0>(&v16, &v14, &v12, (uint64_t)&v11);
}

void *std::__allocate_at_least[abi:sn180100]<std::allocator<unsigned long>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:sn180100]();
  return operator new(8 * a2);
}

void std::__unwrap_and_dispatch[abi:sn180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;

  v5 = *((_DWORD *)a1 + 2);
  v6 = *a2;
  v7 = *((_DWORD *)a2 + 2);
  v16 = *a1;
  v17 = v5;
  v14 = v6;
  v15 = v7;
  v8 = *((_DWORD *)a3 + 2);
  v12 = *a3;
  v13 = v8;
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:sn180100]<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>((uint64_t)&v16, (uint64_t)&v14, (uint64_t)&v12, (uint64_t)&v18);
  v9 = v19;
  v10 = v20;
  v11 = v21;
  *(_QWORD *)a4 = v18;
  *(_DWORD *)(a4 + 8) = v9;
  *(_QWORD *)(a4 + 16) = v10;
  *(_DWORD *)(a4 + 24) = v11;
}

void std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:sn180100]<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  _QWORD *v4;
  int v5;
  int i;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;

  v4 = *(_QWORD **)a1;
  v5 = *(_DWORD *)(a1 + 8);
  for (i = *(_DWORD *)(a3 + 8); *(_QWORD *)a1 != *(_QWORD *)a2 || v5 != *(_DWORD *)(a2 + 8); v5 = *(_DWORD *)(a1 + 8))
  {
    v8 = *(uint64_t **)a3;
    v9 = 1 << i;
    if (((*v4 >> v5) & 1) != 0)
      v10 = *v8 | v9;
    else
      v10 = *v8 & ~v9;
    *v8 = v10;
    if (v5 == 63)
    {
      v11 = 0;
      *(_QWORD *)a1 = v4 + 1;
    }
    else
    {
      v11 = v5 + 1;
    }
    *(_DWORD *)(a1 + 8) = v11;
    v12 = *(_DWORD *)(a3 + 8);
    if (v12 == 63)
    {
      i = 0;
      *(_QWORD *)a3 += 8;
    }
    else
    {
      i = v12 + 1;
    }
    *(_DWORD *)(a3 + 8) = i;
    v4 = *(_QWORD **)a1;
  }
  *(_QWORD *)a4 = v4;
  *(_DWORD *)(a4 + 8) = v5;
  *(_QWORD *)(a4 + 16) = *(_QWORD *)a3;
  *(_DWORD *)(a4 + 24) = i;
}

void nlohmann::detail::exception::name(int a1@<W1>, std::string *a2@<X8>)
{
  std::string *v4;
  __int128 v5;
  std::string *p_p;
  std::string::size_type size;
  std::string *v8;
  __int128 v9;
  std::string *v10;
  std::string __p;
  std::string v12;
  std::string v13;
  std::string v14;

  std::operator+<char>();
  v4 = std::string::append(&v12, ".", 1uLL);
  v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v13.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&__p, a1);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  v8 = std::string::append(&v13, (const std::string::value_type *)p_p, size);
  v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v14.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  v10 = std::string::append(&v14, "] ", 2uLL);
  *a2 = *v10;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v13.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
}

void sub_1B26987D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  uint64_t v26;

  if (*(char *)(v26 - 41) < 0)
    operator delete(*(void **)(v26 - 64));
  if (a14 < 0)
    operator delete(__p);
  if (a26 < 0)
    operator delete(a21);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(exception_object);
}

nlohmann::detail::exception *nlohmann::detail::exception::exception(nlohmann::detail::exception *this, int a2, const char *a3)
{
  *(_QWORD *)this = &unk_1E649E898;
  *((_DWORD *)this + 2) = a2;
  MEMORY[0x1B5E26B3C]((char *)this + 16, a3);
  return this;
}

void sub_1B2698874(_Unwind_Exception *a1)
{
  std::exception *v1;

  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

const char *nlohmann::detail::exception::what(const std::runtime_error *this)
{
  return std::runtime_error::what(this + 1);
}

void nlohmann::detail::exception::~exception(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_1E649E898;
  MEMORY[0x1B5E26B48](&this[2]);
  std::exception::~exception(this);
}

{
  this->__vftable = (std::exception_vtbl *)&unk_1E649E898;
  MEMORY[0x1B5E26B48](&this[2]);
  std::exception::~exception(this);
  JUMPOUT(0x1B5E26C38);
}

void nlohmann::detail::parse_error::position_string(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  std::string *v4;
  __int128 v5;
  std::string *v6;
  __int128 v7;
  std::string *p_p;
  std::string::size_type size;
  std::string *v10;
  std::string __p;
  std::string v12;
  std::string v13;
  std::string v14;

  std::to_string(&v12, *(_QWORD *)(a1 + 16) + 1);
  v4 = std::string::insert(&v12, 0, " at line ", 9uLL);
  v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v13.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  v6 = std::string::append(&v13, ", column ", 9uLL);
  v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  v14.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&__p, *(_QWORD *)(a1 + 8));
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  v10 = std::string::append(&v14, (const std::string::value_type *)p_p, size);
  *a2 = *v10;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v13.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
}

void sub_1B2698A70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  uint64_t v26;

  if (a14 < 0)
    operator delete(__p);
  if (*(char *)(v26 - 25) < 0)
    operator delete(*(void **)(v26 - 48));
  if (a26 < 0)
    operator delete(a21);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(exception_object);
}

const char *nlohmann::detail::lexer_base<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::token_type_name(unsigned int a1)
{
  if (a1 > 0x10)
    return "unknown token";
  else
    return off_1E649E8D8[a1];
}

char **std::string::basic_string[abi:sn180100]<0>(char **a1, char *__s)
{
  size_t v4;
  size_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;

  if (!__s)
    goto LABEL_15;
  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    goto LABEL_16;
  v5 = v4;
  if (v4 > 0x16)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = (char *)operator new(v7 + 1);
    a1[1] = (char *)v5;
    a1[2] = (char *)(v8 | 0x8000000000000000);
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = (char *)a1;
  }
  v9 = &v6[v5];
  if (v6 <= __s && v9 > __s)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    abort();
  }
  if (v5)
    memmove(v6, __s, v5);
  *v9 = 0;
  return a1;
}

_QWORD *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parser<nlohmann::detail::input_stream_adapter>@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  _QWORD *v7;
  _QWORD *result;
  uint64_t v9;
  _BYTE v10[24];
  _BYTE *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = (_QWORD *)a2[3];
  if (v7)
  {
    if (v7 == a2)
    {
      v11 = v10;
      (*(void (**)(_QWORD *, _BYTE *))(*a2 + 24))(a2, v10);
    }
    else
    {
      v11 = (_BYTE *)a2[3];
      a2[3] = 0;
    }
  }
  else
  {
    v11 = 0;
  }
  nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::parser(a4, a1, (uint64_t)v10, a3);
  result = v11;
  if (v11 == v10)
  {
    v9 = 4;
    result = v10;
  }
  else
  {
    if (!v11)
      return result;
    v9 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v9))();
}

void sub_1B2698CDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == v13)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::sax_parse<`anonymous namespace'::JSONSAXAdapter>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  nlohmann::detail::input_stream_adapter *v5;
  char v6;
  int v7;
  int v8;
  std::string::size_type size;
  int v10;
  char v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  std::string *v28;
  __int128 v29;
  std::string *v30;
  __int128 v31;
  std::string v32;
  std::string v33;
  std::string __p;
  std::exception v35;
  _BYTE v36[24];
  std::string v37;
  std::string v38;

  memset(&v38, 0, sizeof(v38));
  v4 = a1 + 112;
  v5 = (nlohmann::detail::input_stream_adapter *)(a1 + 40);
  while (2)
  {
    switch(*(_DWORD *)(a1 + 32))
    {
      case 1:
        v6 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 8))(a2, 1);
        goto LABEL_18;
      case 2:
        v6 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a2 + 8))(a2, 0);
        goto LABEL_18;
      case 3:
        v6 = (**(uint64_t (***)(uint64_t))a2)(a2);
        goto LABEL_18;
      case 4:
        v6 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 40))(a2, v4);
        goto LABEL_18;
      case 5:
        v6 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a2 + 24))(a2, *(_QWORD *)(a1 + 152));
        goto LABEL_18;
      case 6:
        v6 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a2 + 16))(a2, *(_QWORD *)(a1 + 144));
        goto LABEL_18;
      case 7:
        if ((*(_QWORD *)(a1 + 160) & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
        {
          v27 = *(_QWORD *)(a1 + 64);
          nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_token_string((uint64_t)v5, &v37);
          nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_token_string((uint64_t)v5, &v32);
          v28 = std::string::insert(&v32, 0, "number overflow parsing '", 0x19uLL);
          v29 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
          v33.__r_.__value_.__r.__words[2] = v28->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v33.__r_.__value_.__l.__data_ = v29;
          v28->__r_.__value_.__l.__size_ = 0;
          v28->__r_.__value_.__r.__words[2] = 0;
          v28->__r_.__value_.__r.__words[0] = 0;
          v30 = std::string::append(&v33, "'", 1uLL);
          v31 = *(_OWORD *)&v30->__r_.__value_.__l.__data_;
          __p.__r_.__value_.__r.__words[2] = v30->__r_.__value_.__r.__words[2];
          *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v31;
          v30->__r_.__value_.__l.__size_ = 0;
          v30->__r_.__value_.__r.__words[2] = 0;
          v30->__r_.__value_.__r.__words[0] = 0;
          nlohmann::detail::out_of_range::create(406, (uint64_t)&__p, (nlohmann::detail::exception *)&v35);
          v17 = (*(uint64_t (**)(uint64_t, uint64_t, std::string *, std::exception *))(*(_QWORD *)a2 + 96))(a2, v27, &v37, &v35);
          v35.__vftable = (std::exception_vtbl *)&unk_1E649E898;
          MEMORY[0x1B5E26B48](v36);
          std::exception::~exception(&v35);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);
          goto LABEL_57;
        }
        if ((*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 32))(a2, v4))
          goto LABEL_19;
        goto LABEL_53;
      case 8:
        if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 80))(a2, -1))
          goto LABEL_53;
        v7 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan(v5);
        *(_DWORD *)(a1 + 32) = v7;
        if (v7 == 10)
        {
          v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 88))(a2);
          goto LABEL_18;
        }
        LOBYTE(v35.__vftable) = 1;
        std::vector<BOOL>::push_back((uint64_t)&v38, &v35);
        continue;
      case 9:
        if (((*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 56))(a2, -1) & 1) == 0)
          goto LABEL_53;
        v8 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan(v5);
        *(_DWORD *)(a1 + 32) = v8;
        if (v8 != 11)
        {
          if (v8 != 4)
            goto LABEL_65;
          if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 64))(a2, v4))
            goto LABEL_53;
          v16 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan(v5);
          *(_DWORD *)(a1 + 32) = v16;
          if (v16 != 12)
            goto LABEL_66;
          LOBYTE(v35.__vftable) = 0;
          std::vector<BOOL>::push_back((uint64_t)&v38, &v35);
          v15 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan(v5);
LABEL_35:
          *(_DWORD *)(a1 + 32) = v15;
          continue;
        }
        v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 72))(a2);
LABEL_18:
        if ((v6 & 1) == 0)
          goto LABEL_53;
LABEL_19:
        size = v38.__r_.__value_.__l.__size_;
        if (!v38.__r_.__value_.__l.__size_)
        {
LABEL_41:
          v17 = 1;
          goto LABEL_42;
        }
        while (2)
        {
          if (((*(_QWORD *)(v38.__r_.__value_.__r.__words[0] + (((size - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (size - 1)) & 1) != 0)
          {
            v10 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan(v5);
            *(_DWORD *)(a1 + 32) = v10;
            if (v10 == 13)
              goto LABEL_34;
            if (v10 != 10)
            {
              v23 = *(_QWORD *)(a1 + 64);
              nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_token_string((uint64_t)v5, &v37);
              __p = *(std::string *)(a1 + 64);
              std::string::basic_string[abi:sn180100]<0>(&v32.__r_.__value_.__l.__data_, "array");
              nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::exception_message(a1, 0xAu, (uint64_t)&v32, &v33);
              nlohmann::detail::parse_error::create(101, (uint64_t *)&__p, (uint64_t)&v33, (nlohmann::detail::exception *)&v35);
              v21 = (*(uint64_t (**)(uint64_t, uint64_t, std::string *, std::exception *))(*(_QWORD *)a2 + 96))(a2, v23, &v37, &v35);
              goto LABEL_56;
            }
            v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 88))(a2);
LABEL_27:
            if ((v11 & 1) == 0)
              goto LABEL_53;
            size = v38.__r_.__value_.__l.__size_ - 1;
            v38.__r_.__value_.__l.__size_ = size;
            if (!size)
              goto LABEL_41;
            continue;
          }
          break;
        }
        v12 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan(v5);
        *(_DWORD *)(a1 + 32) = v12;
        if (v12 != 13)
        {
          if (v12 != 11)
          {
            v24 = *(_QWORD *)(a1 + 64);
            nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_token_string((uint64_t)v5, &v37);
            __p = *(std::string *)(a1 + 64);
            std::string::basic_string[abi:sn180100]<0>(&v32.__r_.__value_.__l.__data_, "object");
            nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::exception_message(a1, 0xBu, (uint64_t)&v32, &v33);
            nlohmann::detail::parse_error::create(101, (uint64_t *)&__p, (uint64_t)&v33, (nlohmann::detail::exception *)&v35);
            v21 = (*(uint64_t (**)(uint64_t, uint64_t, std::string *, std::exception *))(*(_QWORD *)a2 + 96))(a2, v24, &v37, &v35);
            goto LABEL_56;
          }
          v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 72))(a2);
          goto LABEL_27;
        }
        v13 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan(v5);
        *(_DWORD *)(a1 + 32) = v13;
        if (v13 != 4)
        {
LABEL_65:
          v25 = *(_QWORD *)(a1 + 64);
          nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_token_string((uint64_t)v5, &v37);
          __p = *(std::string *)(a1 + 64);
          std::string::basic_string[abi:sn180100]<0>(&v32.__r_.__value_.__l.__data_, "object key");
          nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::exception_message(a1, 4u, (uint64_t)&v32, &v33);
          nlohmann::detail::parse_error::create(101, (uint64_t *)&__p, (uint64_t)&v33, (nlohmann::detail::exception *)&v35);
          v21 = (*(uint64_t (**)(uint64_t, uint64_t, std::string *, std::exception *))(*(_QWORD *)a2 + 96))(a2, v25, &v37, &v35);
          goto LABEL_56;
        }
        if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 64))(a2, v4))
        {
LABEL_53:
          v17 = 0;
          goto LABEL_42;
        }
        v14 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan(v5);
        *(_DWORD *)(a1 + 32) = v14;
        if (v14 == 12)
        {
LABEL_34:
          v15 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan(v5);
          goto LABEL_35;
        }
LABEL_66:
        v26 = *(_QWORD *)(a1 + 64);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_token_string((uint64_t)v5, &v37);
        __p = *(std::string *)(a1 + 64);
        std::string::basic_string[abi:sn180100]<0>(&v32.__r_.__value_.__l.__data_, "object separator");
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::exception_message(a1, 0xCu, (uint64_t)&v32, &v33);
        nlohmann::detail::parse_error::create(101, (uint64_t *)&__p, (uint64_t)&v33, (nlohmann::detail::exception *)&v35);
        v21 = (*(uint64_t (**)(uint64_t, uint64_t, std::string *, std::exception *))(*(_QWORD *)a2 + 96))(a2, v26, &v37, &v35);
LABEL_56:
        v17 = v21;
        v35.__vftable = (std::exception_vtbl *)&unk_1E649E898;
        MEMORY[0x1B5E26B48](v36);
        std::exception::~exception(&v35);
LABEL_57:
        if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v33.__r_.__value_.__l.__data_);
        if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v32.__r_.__value_.__l.__data_);
        if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v37.__r_.__value_.__l.__data_);
LABEL_42:
        if (v38.__r_.__value_.__r.__words[0])
          operator delete(v38.__r_.__value_.__l.__data_);
        if (v17)
        {
          v18 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan(v5);
          *(_DWORD *)(a1 + 32) = v18;
          if (v18 != 15)
          {
            v19 = *(_QWORD *)(a1 + 64);
            nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_token_string((uint64_t)v5, &v38);
            v37 = *(std::string *)(a1 + 64);
            std::string::basic_string[abi:sn180100]<0>(&v33.__r_.__value_.__l.__data_, "value");
            nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::exception_message(a1, 0xFu, (uint64_t)&v33, &__p);
            nlohmann::detail::parse_error::create(101, (uint64_t *)&v37, (uint64_t)&__p, (nlohmann::detail::exception *)&v35);
            (*(void (**)(uint64_t, uint64_t, std::string *, std::exception *))(*(_QWORD *)a2 + 96))(a2, v19, &v38, &v35);
            v35.__vftable = (std::exception_vtbl *)&unk_1E649E898;
            MEMORY[0x1B5E26B48](v36);
            std::exception::~exception(&v35);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
            if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v33.__r_.__value_.__l.__data_);
            if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v38.__r_.__value_.__l.__data_);
          }
        }
        return;
      case 0xE:
        v20 = *(_QWORD *)(a1 + 64);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_token_string((uint64_t)v5, &v37);
        __p = *(std::string *)(a1 + 64);
        std::string::basic_string[abi:sn180100]<0>(&v32.__r_.__value_.__l.__data_, "value");
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::exception_message(a1, 0, (uint64_t)&v32, &v33);
        nlohmann::detail::parse_error::create(101, (uint64_t *)&__p, (uint64_t)&v33, (nlohmann::detail::exception *)&v35);
        v21 = (*(uint64_t (**)(uint64_t, uint64_t, std::string *, std::exception *))(*(_QWORD *)a2 + 96))(a2, v20, &v37, &v35);
        goto LABEL_56;
      default:
        v22 = *(_QWORD *)(a1 + 64);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_token_string((uint64_t)v5, &v37);
        __p = *(std::string *)(a1 + 64);
        std::string::basic_string[abi:sn180100]<0>(&v32.__r_.__value_.__l.__data_, "value");
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::exception_message(a1, 0x10u, (uint64_t)&v32, &v33);
        nlohmann::detail::parse_error::create(101, (uint64_t *)&__p, (uint64_t)&v33, (nlohmann::detail::exception *)&v35);
        v21 = (*(uint64_t (**)(uint64_t, uint64_t, std::string *, std::exception *))(*(_QWORD *)a2 + 96))(a2, v22, &v37, &v35);
        goto LABEL_56;
    }
  }
}

void sub_1B2699654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,std::exception a29)
{
  uint64_t v29;
  uint64_t v30;
  void *v32;

  a29.__vftable = (std::exception_vtbl *)&unk_1E649E898;
  MEMORY[0x1B5E26B48](v29 + 16);
  std::exception::~exception(&a29);
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  if (*(char *)(v30 - 89) < 0)
    operator delete(*(void **)(v30 - 112));
  v32 = *(void **)(v30 - 88);
  if (v32)
    operator delete(v32);
  _Unwind_Resume(a1);
}

_QWORD *nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::~parser(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;

  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::~lexer((uint64_t)(a1 + 5));
  v2 = (_QWORD *)a1[3];
  if (v2 == a1)
  {
    v3 = 4;
    v2 = a1;
    goto LABEL_5;
  }
  if (v2)
  {
    v3 = 5;
LABEL_5:
    (*(void (**)(void))(*v2 + 8 * v3))();
  }
  return a1;
}

uint64_t nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::parser(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7;
  nlohmann::detail::input_stream_adapter *v8;

  v7 = std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::__value_func[abi:sn180100](a1, a3);
  *(_DWORD *)(v7 + 32) = 0;
  v8 = (nlohmann::detail::input_stream_adapter *)(v7 + 40);
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::lexer(v7 + 40, a2);
  *(_BYTE *)(a1 + 176) = a4;
  *(_DWORD *)(a1 + 32) = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan(v8);
  return a1;
}

void sub_1B26998E8(_Unwind_Exception *a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::~lexer(v2);
  v4 = (_QWORD *)v1[3];
  if (v4 == v1)
  {
    v5 = 4;
  }
  else
  {
    if (!v4)
      goto LABEL_6;
    v5 = 5;
    v1 = (_QWORD *)v1[3];
  }
  (*(void (**)(_QWORD *))(*v1 + 8 * v5))(v1);
LABEL_6:
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::lexer(uint64_t a1, uint64_t a2)
{
  lconv *v3;
  int v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_DWORD *)(a1 + 16) = -1;
  *(_BYTE *)(a1 + 20) = 0;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = "";
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  v3 = localeconv();
  if (v3->decimal_point)
    v4 = *v3->decimal_point;
  else
    v4 = 46;
  *(_DWORD *)(a1 + 128) = v4;
  return a1;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan(nlohmann::detail::input_stream_adapter *this)
{
  unint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  const char *v8;
  uint64_t v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  int v14;
  int v15;

  v2 = *((_QWORD *)this + 3);
  if (v2
    || nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::skip_bom(this))
  {
    while (2)
    {
      while (1)
      {
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get((uint64_t *)v2, this);
        v2 = *((unsigned int *)this + 4);
        if ((int)v2 > 31)
          break;
        if ((v2 - 9) >= 2 && (_DWORD)v2 != 13)
        {
          if ((v2 + 1) < 2)
            return 15;
LABEL_44:
          v8 = "invalid literal";
          goto LABEL_22;
        }
      }
      if ((int)v2 > 90)
      {
        if ((int)v2 <= 109)
        {
          switch((_DWORD)v2)
          {
            case '[':
              return 8;
            case ']':
              return 10;
            case 'f':
              v9 = 0;
              while (1)
              {
                v10 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get((uint64_t *)v2, this);
                v2 = aFalse_0[v9 + 1];
                if ((_DWORD)v2 != v10)
                  break;
                if (++v9 == 4)
                  return 2;
              }
              break;
          }
        }
        else if ((int)v2 > 122)
        {
          if ((_DWORD)v2 == 123)
            return 9;
          if ((_DWORD)v2 == 125)
            return 11;
        }
        else if ((_DWORD)v2 == 110)
        {
          v11 = 1819047278;
          v14 = 1819047278;
          v12 = 1;
          while (1)
          {
            v13 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get((uint64_t *)v11, this);
            v11 = *((unsigned __int8 *)&v14 + v12);
            if ((_DWORD)v11 != v13)
              break;
            if (++v12 == 4)
              return 3;
          }
        }
        else if ((_DWORD)v2 == 116)
        {
          v5 = 1702195828;
          v15 = 1702195828;
          v6 = 1;
          while (1)
          {
            v7 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get((uint64_t *)v5, this);
            v5 = *((unsigned __int8 *)&v15 + v6);
            if ((_DWORD)v5 != v7)
              break;
            if (++v6 == 4)
              return 1;
          }
        }
        goto LABEL_44;
      }
      v2 = (v2 - 32);
      switch((int)v2)
      {
        case 0:
          continue;
        case 2:
          result = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan_string((uint64_t)this);
          break;
        case 12:
          result = 13;
          break;
        case 13:
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
          result = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan_number((uint64_t)this);
          break;
        case 26:
          result = 12;
          break;
        default:
          goto LABEL_44;
      }
      break;
    }
  }
  else
  {
    v8 = "invalid BOM; must be 0xEF 0xBB 0xBF if given";
LABEL_22:
    *((_QWORD *)this + 12) = v8;
    return 14;
  }
  return result;
}

BOOL nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::skip_bom(nlohmann::detail::input_stream_adapter *a1)
{
  if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get(a1) == 239)
  {
    return nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get(a1) == 187
        && nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get(a1) == 191;
  }
  else
  {
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget((uint64_t)a1);
    return 1;
  }
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get(nlohmann::detail::input_stream_adapter *this)
{
  int character;
  unint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  unint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  unint64_t v9;
  size_t v10;
  _BYTE *v11;
  char *v12;
  _BYTE *v13;
  char v14;
  uint64_t result;
  uint64_t v16;

  *(int64x2_t *)((char *)this + 24) = vaddq_s64(*(int64x2_t *)((char *)this + 24), vdupq_n_s64(1uLL));
  if (*((_BYTE *)this + 20))
  {
    *((_BYTE *)this + 20) = 0;
    character = *((_DWORD *)this + 4);
  }
  else
  {
    character = nlohmann::detail::input_stream_adapter::get_character(this);
    *((_DWORD *)this + 4) = character;
  }
  if (character == -1)
    return 0xFFFFFFFFLL;
  v4 = (_BYTE *)*((_QWORD *)this + 7);
  v3 = *((_QWORD *)this + 8);
  if ((unint64_t)v4 >= v3)
  {
    v6 = *((_QWORD *)this + 6);
    v7 = &v4[-v6];
    v8 = (uint64_t)&v4[-v6 + 1];
    if (v8 < 0)
      goto LABEL_27;
    v9 = v3 - v6;
    if (2 * v9 > v8)
      v8 = 2 * v9;
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL)
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v10 = v8;
    if (v10)
    {
      v11 = operator new(v10);
      v12 = &v11[v10];
      v7[(_QWORD)v11] = character;
      v5 = (uint64_t)&v7[(_QWORD)v11 + 1];
      if (v4 == (_BYTE *)v6)
      {
        v11 = &v7[(_QWORD)v11];
      }
      else
      {
        v13 = &v4[~v6];
        do
        {
          v14 = *--v4;
          (v13--)[(_QWORD)v11] = v14;
        }
        while (v4 != (_BYTE *)v6);
        v4 = (_BYTE *)v6;
      }
      *((_QWORD *)this + 6) = v11;
      *((_QWORD *)this + 7) = v5;
      *((_QWORD *)this + 8) = v12;
      if (v4)
        operator delete(v4);
      goto LABEL_22;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    abort();
  }
  if (!v4)
    goto LABEL_26;
  *v4 = character;
  v5 = (uint64_t)(v4 + 1);
LABEL_22:
  *((_QWORD *)this + 7) = v5;
  result = *((unsigned int *)this + 4);
  if ((_DWORD)result == 10)
  {
    v16 = *((_QWORD *)this + 5) + 1;
    *((_QWORD *)this + 4) = 0;
    *((_QWORD *)this + 5) = v16;
  }
  return result;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan_string(uint64_t a1)
{
  int v2;
  uint64_t result;
  const char *v4;
  int v5;
  std::string *v6;
  uint64_t v7;
  __int128 v8;
  __int128 *v9;
  int v10;
  unsigned int codepoint;
  unsigned int v12;
  uint64_t *v13;
  uint64_t *v14;
  unsigned int v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::reset(a1);
  while (2)
  {
    while (2)
    {
      v2 = ((uint64_t (*)(nlohmann::detail::input_stream_adapter *))nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get)((nlohmann::detail::input_stream_adapter *)a1)
         + 1;
      result = 4;
      v4 = "invalid string: missing closing quote";
      switch(v2)
      {
        case 0:
          goto LABEL_81;
        case 1:
          v4 = "invalid string: control character U+0000 (NUL) must be escaped to \\u0000";
          goto LABEL_81;
        case 2:
          v4 = "invalid string: control character U+0001 (SOH) must be escaped to \\u0001";
          goto LABEL_81;
        case 3:
          v4 = "invalid string: control character U+0002 (STX) must be escaped to \\u0002";
          goto LABEL_81;
        case 4:
          v4 = "invalid string: control character U+0003 (ETX) must be escaped to \\u0003";
          goto LABEL_81;
        case 5:
          v4 = "invalid string: control character U+0004 (EOT) must be escaped to \\u0004";
          goto LABEL_81;
        case 6:
          v4 = "invalid string: control character U+0005 (ENQ) must be escaped to \\u0005";
          goto LABEL_81;
        case 7:
          v4 = "invalid string: control character U+0006 (ACK) must be escaped to \\u0006";
          goto LABEL_81;
        case 8:
          v4 = "invalid string: control character U+0007 (BEL) must be escaped to \\u0007";
          goto LABEL_81;
        case 9:
          v4 = "invalid string: control character U+0008 (BS) must be escaped to \\u0008 or \\b";
          goto LABEL_81;
        case 10:
          v4 = "invalid string: control character U+0009 (HT) must be escaped to \\u0009 or \\t";
          goto LABEL_81;
        case 11:
          v4 = "invalid string: control character U+000A (LF) must be escaped to \\u000A or \\n";
          goto LABEL_81;
        case 12:
          v4 = "invalid string: control character U+000B (VT) must be escaped to \\u000B";
          goto LABEL_81;
        case 13:
          v4 = "invalid string: control character U+000C (FF) must be escaped to \\u000C or \\f";
          goto LABEL_81;
        case 14:
          v4 = "invalid string: control character U+000D (CR) must be escaped to \\u000D or \\r";
          goto LABEL_81;
        case 15:
          v4 = "invalid string: control character U+000E (SO) must be escaped to \\u000E";
          goto LABEL_81;
        case 16:
          v4 = "invalid string: control character U+000F (SI) must be escaped to \\u000F";
          goto LABEL_81;
        case 17:
          v4 = "invalid string: control character U+0010 (DLE) must be escaped to \\u0010";
          goto LABEL_81;
        case 18:
          v4 = "invalid string: control character U+0011 (DC1) must be escaped to \\u0011";
          goto LABEL_81;
        case 19:
          v4 = "invalid string: control character U+0012 (DC2) must be escaped to \\u0012";
          goto LABEL_81;
        case 20:
          v4 = "invalid string: control character U+0013 (DC3) must be escaped to \\u0013";
          goto LABEL_81;
        case 21:
          v4 = "invalid string: control character U+0014 (DC4) must be escaped to \\u0014";
          goto LABEL_81;
        case 22:
          v4 = "invalid string: control character U+0015 (NAK) must be escaped to \\u0015";
          goto LABEL_81;
        case 23:
          v4 = "invalid string: control character U+0016 (SYN) must be escaped to \\u0016";
          goto LABEL_81;
        case 24:
          v4 = "invalid string: control character U+0017 (ETB) must be escaped to \\u0017";
          goto LABEL_81;
        case 25:
          v4 = "invalid string: control character U+0018 (CAN) must be escaped to \\u0018";
          goto LABEL_81;
        case 26:
          v4 = "invalid string: control character U+0019 (EM) must be escaped to \\u0019";
          goto LABEL_81;
        case 27:
          v4 = "invalid string: control character U+001A (SUB) must be escaped to \\u001A";
          goto LABEL_81;
        case 28:
          v4 = "invalid string: control character U+001B (ESC) must be escaped to \\u001B";
          goto LABEL_81;
        case 29:
          v4 = "invalid string: control character U+001C (FS) must be escaped to \\u001C";
          goto LABEL_81;
        case 30:
          v4 = "invalid string: control character U+001D (GS) must be escaped to \\u001D";
          goto LABEL_81;
        case 31:
          v4 = "invalid string: control character U+001E (RS) must be escaped to \\u001E";
          goto LABEL_81;
        case 32:
          v4 = "invalid string: control character U+001F (US) must be escaped to \\u001F";
          goto LABEL_81;
        case 33:
        case 34:
        case 36:
        case 37:
        case 38:
        case 39:
        case 40:
        case 41:
        case 42:
        case 43:
        case 44:
        case 45:
        case 46:
        case 47:
        case 48:
        case 49:
        case 50:
        case 51:
        case 52:
        case 53:
        case 54:
        case 55:
        case 56:
        case 57:
        case 58:
        case 59:
        case 60:
        case 61:
        case 62:
        case 63:
        case 64:
        case 65:
        case 66:
        case 67:
        case 68:
        case 69:
        case 70:
        case 71:
        case 72:
        case 73:
        case 74:
        case 75:
        case 76:
        case 77:
        case 78:
        case 79:
        case 80:
        case 81:
        case 82:
        case 83:
        case 84:
        case 85:
        case 86:
        case 87:
        case 88:
        case 89:
        case 90:
        case 91:
        case 92:
        case 94:
        case 95:
        case 96:
        case 97:
        case 98:
        case 99:
        case 100:
        case 101:
        case 102:
        case 103:
        case 104:
        case 105:
        case 106:
        case 107:
        case 108:
        case 109:
        case 110:
        case 111:
        case 112:
        case 113:
        case 114:
        case 115:
        case 116:
        case 117:
        case 118:
        case 119:
        case 120:
        case 121:
        case 122:
        case 123:
        case 124:
        case 125:
        case 126:
        case 127:
        case 128:
          v5 = *(_DWORD *)(a1 + 16);
          goto LABEL_4;
        case 35:
          return result;
        case 93:
          v10 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get((uint64_t *)"invalid string: missing closing quote", (nlohmann::detail::input_stream_adapter *)a1);
          v4 = "invalid string: forbidden character after backslash";
          if (v10 <= 97)
          {
            switch(v10)
            {
              case '"':
                LOBYTE(v5) = 34;
                break;
              case '/':
                LOBYTE(v5) = 47;
                break;
              case '\\':
                LOBYTE(v5) = 92;
                break;
              default:
                goto LABEL_81;
            }
            goto LABEL_4;
          }
          break;
        case 195:
        case 196:
        case 197:
        case 198:
        case 199:
        case 200:
        case 201:
        case 202:
        case 203:
        case 204:
        case 205:
        case 206:
        case 207:
        case 208:
        case 209:
        case 210:
        case 211:
        case 212:
        case 213:
        case 214:
        case 215:
        case 216:
        case 217:
        case 218:
        case 219:
        case 220:
        case 221:
        case 222:
        case 223:
        case 224:
          *(_QWORD *)&v16 = 0xBF00000080;
          v6 = (std::string *)a1;
          v7 = 2;
          goto LABEL_19;
        case 225:
          v8 = xmmword_1B26DEC60;
          goto LABEL_7;
        case 226:
        case 227:
        case 228:
        case 229:
        case 230:
        case 231:
        case 232:
        case 233:
        case 234:
        case 235:
        case 236:
        case 237:
        case 239:
        case 240:
          v8 = xmmword_1B26DEC50;
          goto LABEL_7;
        case 238:
          v8 = xmmword_1B26DEC40;
LABEL_7:
          v16 = v8;
          v6 = (std::string *)a1;
          v7 = 4;
          goto LABEL_19;
        case 241:
          v17 = 0xBF00000080;
          v9 = &xmmword_1B26DEBF8;
          goto LABEL_18;
        case 242:
        case 243:
        case 244:
          v17 = 0xBF00000080;
          v9 = &xmmword_1B26DEC10;
          goto LABEL_18;
        case 245:
          v17 = 0xBF00000080;
          v9 = &xmmword_1B26DEC28;
LABEL_18:
          v16 = *v9;
          v6 = (std::string *)a1;
          v7 = 6;
LABEL_19:
          if ((nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::next_byte_in_range(v6, &v16, v7) & 1) == 0)return 14;
          continue;
        default:
          v4 = "invalid string: ill-formed UTF-8 byte";
          goto LABEL_81;
      }
      break;
    }
    switch(v10)
    {
      case 'n':
        LOBYTE(v5) = 10;
        goto LABEL_4;
      case 'o':
      case 'p':
      case 'q':
      case 's':
        goto LABEL_81;
      case 'r':
        LOBYTE(v5) = 13;
        goto LABEL_4;
      case 't':
        LOBYTE(v5) = 9;
        goto LABEL_4;
      case 'u':
        codepoint = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_codepoint((nlohmann::detail::input_stream_adapter *)a1);
        if (codepoint == -1)
          goto LABEL_83;
        v12 = codepoint;
        v13 = (uint64_t *)(codepoint & 0xFFFFFC00);
        if ((_DWORD)v13 != 55296)
        {
          if ((_DWORD)v13 == 56320)
          {
            v4 = "invalid string: surrogate U+DC00..U+DFFF must follow U+D800..U+DBFF";
            goto LABEL_81;
          }
          if ((int)codepoint > 127)
          {
            if (codepoint <= 0x7FF)
            {
              std::string::push_back((std::string *)(a1 + 72), (codepoint >> 6) | 0xC0);
              goto LABEL_39;
            }
            if (!HIWORD(codepoint))
            {
              std::string::push_back((std::string *)(a1 + 72), (codepoint >> 12) | 0xE0);
              goto LABEL_38;
            }
LABEL_37:
            std::string::push_back((std::string *)(a1 + 72), (v12 >> 18) | 0xF0);
            std::string::push_back((std::string *)(a1 + 72), (v12 >> 12) & 0x3F | 0x80);
LABEL_38:
            std::string::push_back((std::string *)(a1 + 72), (v12 >> 6) & 0x3F | 0x80);
LABEL_39:
            LOBYTE(v5) = v12 & 0x3F | 0x80;
            goto LABEL_4;
          }
          LOBYTE(v5) = codepoint;
LABEL_4:
          std::string::push_back((std::string *)(a1 + 72), v5);
          continue;
        }
        if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get(v13, (nlohmann::detail::input_stream_adapter *)a1) != 92|| nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get(v14, (nlohmann::detail::input_stream_adapter *)a1) != 117)
        {
LABEL_84:
          v4 = "invalid string: surrogate U+D800..U+DBFF must be followed by U+DC00..U+DFFF";
          goto LABEL_81;
        }
        v15 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_codepoint((nlohmann::detail::input_stream_adapter *)a1);
        if (v15 != -1)
        {
          if (v15 >> 10 != 55)
            goto LABEL_84;
          v12 = v15 + (v12 << 10) - 56613888;
          goto LABEL_37;
        }
LABEL_83:
        v4 = "invalid string: '\\u' must be followed by 4 hex digits";
LABEL_81:
        *(_QWORD *)(a1 + 96) = v4;
        return 14;
      default:
        if (v10 == 98)
        {
          LOBYTE(v5) = 8;
        }
        else
        {
          if (v10 != 102)
            goto LABEL_81;
          LOBYTE(v5) = 12;
        }
        goto LABEL_4;
    }
  }
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::scan_number(uint64_t a1)
{
  uint64_t *v2;
  int v3;
  std::string *v4;
  uint64_t *v5;
  unsigned int v6;
  uint64_t *v7;
  unsigned int v8;
  std::string *v9;
  uint64_t *v10;
  uint64_t *v11;
  const char *v12;
  unsigned int v14;
  uint64_t *v15;
  const char *v16;
  uint64_t *v17;
  unsigned int v18;
  uint64_t *v19;
  uint64_t *v20;
  unsigned int v21;
  const char *v22;
  unint64_t v23;
  const char *v24;
  uint64_t v25;
  char *__endptr;

  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::reset(a1);
  v2 = (uint64_t *)*(unsigned int *)(a1 + 16);
  if (((_DWORD)v2 - 49) < 9)
  {
    v3 = 5;
LABEL_3:
    v4 = (std::string *)(a1 + 72);
    while (1)
    {
      std::string::push_back((std::string *)(a1 + 72), (std::string::value_type)v2);
      v6 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get(v5, (nlohmann::detail::input_stream_adapter *)a1);
      if (v6 - 48 >= 0xA)
        break;
      LODWORD(v2) = *(_DWORD *)(a1 + 16);
    }
    if (v6 != 46)
    {
      if (v6 == 69 || v6 == 101)
        goto LABEL_9;
LABEL_37:
      nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget(a1);
      __endptr = 0;
      *__error() = 0;
      if (v3 == 6)
      {
        v24 = (const char *)(a1 + 72);
        if (*(char *)(a1 + 95) < 0)
          v24 = *(const char **)v24;
        v25 = strtoll(v24, &__endptr, 10);
        if (!*__error())
        {
          *(_QWORD *)(a1 + 104) = v25;
          return 6;
        }
      }
      else
      {
        v22 = (const char *)(a1 + 72);
        if (*(char *)(a1 + 95) < 0)
          v22 = *(const char **)v22;
        v23 = strtoull(v22, &__endptr, 10);
        if (!*__error())
        {
          *(_QWORD *)(a1 + 112) = v23;
          return 5;
        }
      }
      goto LABEL_14;
    }
    goto LABEL_31;
  }
  if ((_DWORD)v2 == 48)
  {
    std::string::push_back((std::string *)(a1 + 72), 48);
    v3 = 5;
  }
  else
  {
    if ((_DWORD)v2 == 45)
      std::string::push_back((std::string *)(a1 + 72), 45);
    v14 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get(v2, (nlohmann::detail::input_stream_adapter *)a1);
    if (v14 - 49 < 9)
    {
      LODWORD(v2) = *(_DWORD *)(a1 + 16);
      v3 = 6;
      goto LABEL_3;
    }
    if (v14 != 48)
    {
      v16 = "invalid number; expected digit after '-'";
      goto LABEL_52;
    }
    std::string::push_back((std::string *)(a1 + 72), *(_BYTE *)(a1 + 16));
    v3 = 6;
  }
  v18 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get(v17, (nlohmann::detail::input_stream_adapter *)a1);
  if (v18 == 101 || v18 == 69)
  {
    v4 = (std::string *)(a1 + 72);
    goto LABEL_9;
  }
  if (v18 != 46)
    goto LABEL_37;
  v4 = (std::string *)(a1 + 72);
LABEL_31:
  std::string::push_back(v4, *(_BYTE *)(a1 + 128));
  if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get(v19, (nlohmann::detail::input_stream_adapter *)a1)- 48 > 9)
  {
    v16 = "invalid number; expected digit after '.'";
    goto LABEL_52;
  }
  v4 = (std::string *)(a1 + 72);
  do
  {
    std::string::push_back((std::string *)(a1 + 72), *(_BYTE *)(a1 + 16));
    v21 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get(v20, (nlohmann::detail::input_stream_adapter *)a1);
  }
  while (v21 - 48 < 0xA);
  if (v21 == 101 || v21 == 69)
  {
LABEL_9:
    std::string::push_back(v4, *(_BYTE *)(a1 + 16));
    v8 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get(v7, (nlohmann::detail::input_stream_adapter *)a1);
    if (v8 - 48 < 0xA)
    {
      v9 = (std::string *)(a1 + 72);
      goto LABEL_11;
    }
    if (v8 == 45 || v8 == 43)
    {
      v9 = (std::string *)(a1 + 72);
      std::string::push_back((std::string *)(a1 + 72), *(_BYTE *)(a1 + 16));
      if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get(v15, (nlohmann::detail::input_stream_adapter *)a1)- 48 < 0xA)
      {
LABEL_11:
        std::string::push_back(v9, *(_BYTE *)(a1 + 16));
        if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get(v10, (nlohmann::detail::input_stream_adapter *)a1)- 48 <= 9)
        {
          do
            std::string::push_back((std::string *)(a1 + 72), *(_BYTE *)(a1 + 16));
          while (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get(v11, (nlohmann::detail::input_stream_adapter *)a1)- 48 < 0xA);
        }
        goto LABEL_13;
      }
      v16 = "invalid number; expected digit after exponent sign";
    }
    else
    {
      v16 = "invalid number; expected '+', '-', or digit after exponent";
    }
LABEL_52:
    *(_QWORD *)(a1 + 96) = v16;
    return 14;
  }
LABEL_13:
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget(a1);
  __endptr = 0;
  *__error() = 0;
LABEL_14:
  v12 = (const char *)(a1 + 72);
  if (*(char *)(a1 + 95) < 0)
    v12 = *(const char **)v12;
  *(double *)(a1 + 120) = strtod(v12, &__endptr);
  return 7;
}

uint64_t nlohmann::detail::input_stream_adapter::get_character(nlohmann::detail::input_stream_adapter *this)
{
  _QWORD *v2;
  unsigned __int8 *v3;
  uint64_t result;
  std::ios_base *v5;

  v2 = (_QWORD *)*((_QWORD *)this + 1);
  v3 = (unsigned __int8 *)v2[3];
  if (v3 == (unsigned __int8 *)v2[4])
  {
    result = (*(uint64_t (**)(_QWORD *))(*v2 + 80))(v2);
    if ((_DWORD)result == -1)
    {
      v5 = (std::ios_base *)(*(_QWORD *)this + *(_QWORD *)(**(_QWORD **)this - 24));
      std::ios_base::clear(v5, v5->__rdstate_ | 2);
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
    v2[3] = v3 + 1;
    return *v3;
  }
  return result;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_codepoint(nlohmann::detail::input_stream_adapter *this)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  __int128 v8;
  uint64_t v9;

  v2 = 0;
  LODWORD(v3) = 0;
  v9 = *MEMORY[0x1E0C80C00];
  v8 = xmmword_1B26DEC70;
  while (1)
  {
    v4 = *(_DWORD *)((char *)&v8 + v2);
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get(this);
    v5 = *((_DWORD *)this + 4);
    v6 = v5 - 48;
    if ((v5 - 48) >= 0xA)
      break;
LABEL_7:
    v3 = ((v6 << v4) + v3);
    v2 += 4;
    if (v2 == 16)
      return v3;
  }
  if ((v5 - 65) <= 5)
  {
    v6 = v5 - 55;
    goto LABEL_7;
  }
  if ((v5 - 97) <= 5)
  {
    v6 = v5 - 87;
    goto LABEL_7;
  }
  return 0xFFFFFFFFLL;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::next_byte_in_range(std::string *a1, _DWORD *a2, uint64_t a3)
{
  std::string *v6;
  _DWORD *v7;
  int v8;
  uint64_t result;

  v6 = a1 + 3;
  std::string::push_back(a1 + 3, a1->__r_.__value_.__s.__data_[16]);
  if (!a3)
    return 1;
  v7 = &a2[a3];
  while (1)
  {
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get((nlohmann::detail::input_stream_adapter *)a1);
    v8 = a1->__r_.__value_.__r.__words[2];
    if (*a2 > v8 || v8 > a2[1])
      break;
    std::string::push_back(v6, v8);
    a2 += 2;
    if (a2 == v7)
      return 1;
  }
  result = 0;
  a1[4].__r_.__value_.__r.__words[0] = (std::string::size_type)"invalid string: ill-formed UTF-8 byte";
  return result;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::~lexer(uint64_t a1)
{
  void *v2;

  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
  if (*(_QWORD *)a1)
    std::ios_base::clear((std::ios_base *)(*(_QWORD *)a1 + *(_QWORD *)(**(_QWORD **)a1 - 24)), *(_DWORD *)(*(_QWORD *)a1 + *(_QWORD *)(**(_QWORD **)a1 - 24) + 32) & 2);
  return a1;
}

void nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_token_string(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  unsigned __int8 *v3;
  unsigned __int8 *i;
  unsigned int v5;
  std::string::size_type v6;
  char __str[8];
  char v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  v3 = *(unsigned __int8 **)(a1 + 48);
  for (i = *(unsigned __int8 **)(a1 + 56); v3 != i; ++v3)
  {
    v5 = *v3;
    if (v5 > 0x1F)
    {
      std::string::push_back(a2, v5);
    }
    else
    {
      v8 = 0;
      *(_QWORD *)__str = 0;
      snprintf(__str, 9uLL, "<U+%.4X>", v5);
      v6 = strlen(__str);
      std::string::append(a2, __str, v6);
    }
  }
}

void sub_1B269A858(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::exception_message(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  uint64_t v8;
  std::string *v9;
  __int128 v10;
  const std::string::value_type *v11;
  std::string::size_type v12;
  unsigned int v13;
  std::string *v14;
  __int128 v15;
  std::string *p_p;
  std::string::size_type size;
  std::string *v18;
  __int128 v19;
  std::string *v20;
  __int128 v21;
  const std::string::value_type *v22;
  std::string::size_type v23;
  void *v24;
  char *v25;
  std::string *v26;
  __int128 v27;
  const std::string::value_type *v28;
  std::string::size_type v29;
  char *v30;
  std::string *v31;
  __int128 v32;
  const std::string::value_type *v33;
  std::string::size_type v34;
  std::string __p;
  std::string v36;
  std::string v37;
  std::string v38;
  __int128 v39;
  int64_t v40;

  std::string::basic_string[abi:sn180100]<0>(&a4->__r_.__value_.__l.__data_, "syntax error ");
  v8 = *(unsigned __int8 *)(a3 + 23);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a3 + 8);
  if (v8)
  {
    std::operator+<char>();
    v9 = std::string::append(&v38, " ", 1uLL);
    v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    v40 = v9->__r_.__value_.__r.__words[2];
    v39 = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    if (v40 >= 0)
      v11 = (const std::string::value_type *)&v39;
    else
      v11 = (const std::string::value_type *)v39;
    if (v40 >= 0)
      v12 = HIBYTE(v40);
    else
      v12 = *((_QWORD *)&v39 + 1);
    std::string::append(a4, v11, v12);
    if (SHIBYTE(v40) < 0)
      operator delete((void *)v39);
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v38.__r_.__value_.__l.__data_);
  }
  std::string::append(a4, "- ", 2uLL);
  v13 = *(_DWORD *)(a1 + 32);
  if (v13 == 14)
  {
    std::string::basic_string[abi:sn180100]<0>(&v36.__r_.__value_.__l.__data_, *(char **)(a1 + 136));
    v14 = std::string::append(&v36, "; last read: '", 0xEuLL);
    v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
    v37.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v15;
    v14->__r_.__value_.__l.__size_ = 0;
    v14->__r_.__value_.__r.__words[2] = 0;
    v14->__r_.__value_.__r.__words[0] = 0;
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::get_token_string(a1 + 40, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      size = __p.__r_.__value_.__l.__size_;
    v18 = std::string::append(&v37, (const std::string::value_type *)p_p, size);
    v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    v38.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v19;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    v20 = std::string::append(&v38, "'", 1uLL);
    v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
    v40 = v20->__r_.__value_.__r.__words[2];
    v39 = v21;
    v20->__r_.__value_.__l.__size_ = 0;
    v20->__r_.__value_.__r.__words[2] = 0;
    v20->__r_.__value_.__r.__words[0] = 0;
    if (v40 >= 0)
      v22 = (const std::string::value_type *)&v39;
    else
      v22 = (const std::string::value_type *)v39;
    if (v40 >= 0)
      v23 = HIBYTE(v40);
    else
      v23 = *((_QWORD *)&v39 + 1);
    std::string::append(a4, v22, v23);
    if (SHIBYTE(v40) < 0)
      operator delete((void *)v39);
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v38.__r_.__value_.__l.__data_);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v37.__r_.__value_.__l.__data_);
    if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
    {
      v24 = (void *)v36.__r_.__value_.__r.__words[0];
      goto LABEL_49;
    }
LABEL_46:
    if (!a2)
      return;
    goto LABEL_50;
  }
  v25 = (char *)nlohmann::detail::lexer_base<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::token_type_name(v13);
  std::string::basic_string[abi:sn180100]<0>(&v38.__r_.__value_.__l.__data_, v25);
  v26 = std::string::insert(&v38, 0, "unexpected ", 0xBuLL);
  v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
  v40 = v26->__r_.__value_.__r.__words[2];
  v39 = v27;
  v26->__r_.__value_.__l.__size_ = 0;
  v26->__r_.__value_.__r.__words[2] = 0;
  v26->__r_.__value_.__r.__words[0] = 0;
  if (v40 >= 0)
    v28 = (const std::string::value_type *)&v39;
  else
    v28 = (const std::string::value_type *)v39;
  if (v40 >= 0)
    v29 = HIBYTE(v40);
  else
    v29 = *((_QWORD *)&v39 + 1);
  std::string::append(a4, v28, v29);
  if (SHIBYTE(v40) < 0)
    operator delete((void *)v39);
  if ((SHIBYTE(v38.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    goto LABEL_46;
  v24 = (void *)v38.__r_.__value_.__r.__words[0];
LABEL_49:
  operator delete(v24);
  if (!a2)
    return;
LABEL_50:
  v30 = (char *)nlohmann::detail::lexer_base<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::token_type_name(a2);
  std::string::basic_string[abi:sn180100]<0>(&v38.__r_.__value_.__l.__data_, v30);
  v31 = std::string::insert(&v38, 0, "; expected ", 0xBuLL);
  v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
  v40 = v31->__r_.__value_.__r.__words[2];
  v39 = v32;
  v31->__r_.__value_.__l.__size_ = 0;
  v31->__r_.__value_.__r.__words[2] = 0;
  v31->__r_.__value_.__r.__words[0] = 0;
  if (v40 >= 0)
    v33 = (const std::string::value_type *)&v39;
  else
    v33 = (const std::string::value_type *)v39;
  if (v40 >= 0)
    v34 = HIBYTE(v40);
  else
    v34 = *((_QWORD *)&v39 + 1);
  std::string::append(a4, v33, v34);
  if (SHIBYTE(v40) < 0)
    operator delete((void *)v39);
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v38.__r_.__value_.__l.__data_);
}

void sub_1B269ABB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  uint64_t v33;
  uint64_t v34;

  if (*(char *)(v34 - 41) < 0)
    operator delete(*(void **)(v34 - 64));
  if (a33 < 0)
    operator delete(__p);
  if (a14 < 0)
    operator delete(a9);
  if (a26 < 0)
    operator delete(a21);
  if (a20 < 0)
    operator delete(a15);
  if (*(char *)(v33 + 23) < 0)
    operator delete(*(void **)v33);
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

id WBSBrowsingDataImportServiceInterface()
{
  if (WBSBrowsingDataImportServiceInterface_once != -1)
    dispatch_once(&WBSBrowsingDataImportServiceInterface_once, &__block_literal_global_47);
  return (id)WBSBrowsingDataImportServiceInterface_interface;
}

uint64_t WBSBrowsingDataImportServiceInterfaceWithProtocol(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", a1);
}

id getAAAccountClassPrimary()
{
  id *v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getAAAccountClassPrimarySymbolLoc_ptr;
  v6 = getAAAccountClassPrimarySymbolLoc_ptr;
  if (!getAAAccountClassPrimarySymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getAAAccountClassPrimarySymbolLoc_block_invoke;
    v2[3] = &unk_1E649A1E8;
    v2[4] = &v3;
    __getAAAccountClassPrimarySymbolLoc_block_invoke((uint64_t)v2);
    v0 = (id *)v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getAAAccountClassPrimary_cold_1();
  return *v0;
}

void sub_1B269B6DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAAAccountClassPrimarySymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!AppleAccountLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E649E9E8;
    v5 = 0;
    AppleAccountLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AppleAccountLibraryCore_frameworkLibrary)
    __getAAAccountClassPrimarySymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)AppleAccountLibraryCore_frameworkLibrary, "AAAccountClassPrimary");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAAAccountClassPrimarySymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void WBSSetUpAccessToAppDataContainerWithIdentifier(void *a1)
{
  id v1;
  WBSScopeExitHandler *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  xpc_object_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  xpc_object_t objects;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&WBSSetUpAccessToAppDataContainerWithIdentifier_lock);
  v2 = objc_alloc_init(WBSScopeExitHandler);
  -[WBSScopeExitHandler setHandler:](v2, "setHandler:", &__block_literal_global_49);
  v3 = (void *)WBSSetUpAccessToAppDataContainerWithIdentifier_identifiersOfContainersGrantedAccessForThisProcess;
  if (!WBSSetUpAccessToAppDataContainerWithIdentifier_identifiersOfContainersGrantedAccessForThisProcess)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)WBSSetUpAccessToAppDataContainerWithIdentifier_identifiersOfContainersGrantedAccessForThisProcess;
    WBSSetUpAccessToAppDataContainerWithIdentifier_identifiersOfContainersGrantedAccessForThisProcess = v4;

    v3 = (void *)WBSSetUpAccessToAppDataContainerWithIdentifier_identifiersOfContainersGrantedAccessForThisProcess;
  }
  if (objc_msgSend(v3, "containsObject:", v1))
  {
    v6 = WBS_LOG_CHANNEL_PREFIXSandbox();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      WBSSetUpAccessToAppDataContainerWithIdentifier_cold_1((uint64_t)v1, v6, v7, v8, v9, v10, v11, v12);
  }
  else
  {
    container_query_create();
    container_query_set_class();
    v13 = objc_retainAutorelease(v1);
    objects = xpc_string_create((const char *)objc_msgSend(v13, "UTF8String"));
    v14 = xpc_array_create(&objects, 1uLL);
    container_query_set_identifiers();
    container_query_operation_set_flags();
    container_query_set_persona_unique_string();
    if (container_query_get_single_result())
    {
      v15 = (void *)container_copy_sandbox_token();
      if ((sandbox_extension_consume() & 0x8000000000000000) == 0)
        free(v15);
      container_query_free();
      objc_msgSend((id)WBSSetUpAccessToAppDataContainerWithIdentifier_identifiersOfContainersGrantedAccessForThisProcess, "addObject:", v13);
    }
    else
    {
      container_query_get_last_error();
      v16 = (void *)container_error_copy_unlocalized_description();
      v17 = WBS_LOG_CHANNEL_PREFIXSandbox();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        WBSSetUpAccessToAppDataContainerWithIdentifier_cold_2((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);
      free(v16);
      container_query_free();
    }

  }
}

void sub_1B269C8D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B269CC18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

void WBSPerformBlockOnMainRunLoopWithCommonModes(void *a1)
{
  id v1;
  __CFRunLoop *Main;
  __CFRunLoop *v3;

  v1 = a1;
  Main = CFRunLoopGetMain();
  CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x1E0C9B270], v1);

  v3 = CFRunLoopGetMain();
  CFRunLoopWakeUp(v3);
}

void WBSRunLoopRunUntilTerminationSignal()
{
  void (__cdecl *v0)(int);
  void *v1;
  CFRunLoopRef Current;
  NSObject *v3;
  _QWORD handler[5];

  v0 = signal(15, (void (__cdecl *)(int))1);
  v1 = (void *)MEMORY[0x1B5E27154](v0);
  Current = CFRunLoopGetCurrent();
  v3 = dispatch_source_create(MEMORY[0x1E0C80DC0], 0xFuLL, 0, MEMORY[0x1E0C80D38]);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __WBSRunLoopRunUntilTerminationSignal_block_invoke;
  handler[3] = &__block_descriptor_40_e5_v8__0l;
  handler[4] = Current;
  dispatch_source_set_event_handler(v3, handler);
  dispatch_resume(v3);
  CFRunLoopRun();

  objc_autoreleasePoolPop(v1);
}

uint64_t _WBSRunOnceImpl(void *a1)
{
  void *v2;
  uint64_t v3;

  objc_getAssociatedObject(a1, &hasRunAssociatedObjectKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if ((v3 & 1) == 0)
    objc_setAssociatedObject(a1, &hasRunAssociatedObjectKey, MEMORY[0x1E0C9AAB0], (void *)1);
  return v3;
}

void sub_1B269D108(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *WBSStringFromCloudBookmarksAccountChangeType(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Added");
  if (a1 == 1)
    v1 = CFSTR("Deleted");
  if (a1 == 2)
    return CFSTR("Modified");
  else
    return v1;
}

const __CFString *WBSStringFromCloudBookmarksSyncResult(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return CFSTR("Success");
  else
    return off_1E649EB80[a1 - 1];
}

const __CFString *WBSStringFromCloudBookmarksErrorCode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("Sync Disabled");
  else
    return off_1E649EBB0[a1 - 1];
}

const __CFString *WBSStringFromCloudTabsErrorCode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("Code Invalid Close Request");
  else
    return off_1E649EBD0[a1 - 1];
}

const __CFString *WBSStringFromCKContainerManateeState(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Not Determined");
  if (a1 == 1)
    v1 = CFSTR("Not Supported");
  if (a1 == 2)
    return CFSTR("Supported");
  else
    return v1;
}

const __CFString *WBSStringFromCKAccountTermsState(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Not Determined");
  if (a1 == 1)
    v1 = CFSTR("Not Verified");
  if (a1 == 2)
    return CFSTR("Verified");
  else
    return v1;
}

void WBSSetEnvironmentFromContainerPath(void *a1)
{
  id v1;
  char __value[1024];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "fileSystemRepresentation");
  if ((unint64_t)__strlcpy_chk() >= 0x400
    || (setenv("HOME", __value, 1), setenv("CFFIXED_USER_HOME", __value, 1), (unint64_t)__strlcat_chk() >= 0x400))
  {
    exit(1);
  }
  setenv("TMPDIR", __value, 1);

}

void sub_1B269F320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

void sub_1B269F754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B26A0C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B26A2128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B26A4BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __protectionSpacesString_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v2 = a2;
  v3 = objc_msgSend(v2, "port");
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "protocol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%@:%ld"), v5, v6, v3);
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%@"), v5, v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __setOfHighLevelDomainsWhereFullDomainIsPreferableToHighLevelDomainForDisplayToUser_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E64D16D0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)setOfHighLevelDomainsWhereFullDomainIsPreferableToHighLevelDomainForDisplayToUser_set;
  setOfHighLevelDomainsWhereFullDomainIsPreferableToHighLevelDomainForDisplayToUser_set = v0;

}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return objc_opt_class();
}

void sub_1B26A6B24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

const __CFString *WBSStringFromSidecarType(uint64_t a1)
{
  if (a1)
    return CFSTR("shared");
  else
    return CFSTR("personal");
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

void sub_1B26AA6C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B26ABA14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B26ADAD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B26ADCC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B26AE914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B26B3C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B26B4DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B26B84D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B26B88F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B26B9060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B26BA4AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __setOfUninterestingSubdomains_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E64D16E8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)setOfUninterestingSubdomains_set;
  setOfUninterestingSubdomains_set = v0;

}

void __numberedSubdomainRegexp_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("(www\\d+|\\d+web)"), 0, 0);
  v1 = (void *)numberedSubdomainRegexp_regexp;
  numberedSubdomainRegexp_regexp = v0;

}

void OUTLINED_FUNCTION_12(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  uint8_t *v4;
  NSObject *v5;

  _os_log_error_impl(a1, v5, OS_LOG_TYPE_ERROR, a4, v4, 0xCu);
}

id OUTLINED_FUNCTION_14(uint64_t a1, void *a2)
{
  return a2;
}

void OUTLINED_FUNCTION_15_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id deepMutableDictionaryCopy(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (void *)objc_msgSend(v1, "mutableCopy");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v8, (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          deepMutableDictionaryCopy(v9);
          v10 = objc_claimAutoreleasedReturnValue();
LABEL_10:
          v11 = (void *)v10;
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v8);

          goto LABEL_12;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = objc_msgSend(v9, "mutableCopy");
          goto LABEL_10;
        }
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, v8);
LABEL_12:

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  return v2;
}

void sub_1B26BC9EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

__CFString *errorStringForCode(int a1)
{
  uint64_t v1;
  uint64_t v2;
  __CFString *v3;

  if (a1 == 101)
    return CFSTR("Statement returned nothing");
  if (a1 == 100)
  {
    v3 = CFSTR("Statement returned more rows than expected");
  }
  else
  {
    v3 = (__CFString *)sqlite3_errstr(a1);
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3, v1, v2);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

void sub_1B26BCB68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B26BCC38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B26BCE04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B26BCF50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B26BD038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B26BD128(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B26BD264(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B26BD4DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B26BD5D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B26BD66C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B26BD6F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B26BD924(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B26BDB5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

uint64_t SafariShared::WBSSQLiteDatabaseEnumerate<std::tuple<NSString * {__strong}&>>(void *a1, uint64_t a2, void *a3, void ***a4)
{
  id v7;
  id v8;
  WBSSQLiteStatement *v9;
  WBSSQLiteStatement *v10;
  sqlite3_stmt *v11;
  uint64_t v12;
  void **v14;

  v7 = a1;
  v8 = a3;
  v9 = -[WBSSQLiteStatement initWithDatabase:query:error:]([WBSSQLiteStatement alloc], "initWithDatabase:query:error:", v7, v8, a2);
  v10 = v9;
  if (v9)
  {
    v11 = -[WBSSQLiteStatement handle](v9, "handle");
    v14 = *a4;
    v12 = SafariShared::_WBSSQLiteStatementBindOrStep<0,0,std::tuple<std::tuple<NSString * {__strong}&>>>(v7, v11, a2, &v14);
    -[WBSSQLiteStatement invalidate](v10, "invalidate");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void sub_1B26BDC70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t SafariShared::_WBSSQLiteStatementBindOrStep<0,0,std::tuple<std::tuple<NSString * {__strong}&>>>(void *a1, sqlite3_stmt *a2, uint64_t a3, void ***a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;

  v7 = a1;
  v8 = sqlite3_step(a2);
  if ((_DWORD)v8 != 100)
    goto LABEL_5;
  if (!SafariShared::_WBSStatementFetchColumnsInTuple<std::tuple<NSString * {__strong}&>,0>(a2, a4))
  {
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v8 = sqlite3_step(a2);
  if ((_DWORD)v8 != 101)
  {
LABEL_5:
    objc_msgSend(v7, "reportErrorWithCode:statement:error:", v8, a2, a3);
    goto LABEL_6;
  }
  v9 = 1;
LABEL_7:

  return v9;
}

void sub_1B26BDD24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t SafariShared::_WBSStatementFetchColumnsInTuple<std::tuple<NSString * {__strong}&>,0>(sqlite3_stmt *a1, void ***a2)
{
  uint64_t v3;
  void *v4;

  SafariShared::WBSSQLiteDatatypeTraits<NSString * {__strong}>::fetch(a1, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = **a2;
  **a2 = (void *)v3;

  return 1;
}

__CFString *SafariShared::WBSSQLiteDatatypeTraits<NSString * {__strong}>::fetch(sqlite3_stmt *a1, int a2)
{
  __CFString *v4;
  const __CFAllocator *v5;
  const unsigned __int8 *v6;
  int v7;

  if (sqlite3_column_type(a1, a2) == 5)
  {
    v4 = 0;
  }
  else
  {
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v6 = sqlite3_column_text(a1, a2);
    v7 = sqlite3_column_bytes(a1, a2);
    v4 = (__CFString *)CFStringCreateWithBytes(v5, v6, v7, 0x8000100u, 0);
  }
  return v4;
}

void sub_1B26BDFDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B26BE12C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void temporarilyDisableSuddenTermination(void)
{
  SafariShared::SuddenTerminationDisabler *v0;
  dispatch_source_t v1;
  void *v2;
  dispatch_time_t v3;

  os_unfair_lock_lock((os_unfair_lock_t)&suddenTerminationDisablerLock);
  if (!suddenTerminationDisablerDispatchSource)
  {
    v0 = (SafariShared::SuddenTerminationDisabler *)operator new();
    SafariShared::SuddenTerminationDisabler::SuddenTerminationDisabler(v0, CFSTR("com.apple.SafariCore.WBSSQLiteStatement"));
    suddenTerminationDisabler = (uint64_t)v0;
    v1 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, 0);
    v2 = (void *)suddenTerminationDisablerDispatchSource;
    suddenTerminationDisablerDispatchSource = (uint64_t)v1;

    dispatch_source_set_event_handler((dispatch_source_t)suddenTerminationDisablerDispatchSource, &__block_literal_global_60);
    dispatch_resume((dispatch_object_t)suddenTerminationDisablerDispatchSource);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&suddenTerminationDisablerLock);
  v3 = dispatch_time(0, 3000000000);
  dispatch_source_set_timer((dispatch_source_t)suddenTerminationDisablerDispatchSource, v3, 0xFFFFFFFFFFFFFFFFLL, 0x493E0uLL);
}

void sub_1B26BE228(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1B5E26C38](v1, 0x1080C40D2F62047);
  _Unwind_Resume(a1);
}

void sub_1B26BE378(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B26BE434(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B26BE52C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B26BE5F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B26BE714(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B26BE814(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ___ZL35temporarilyDisableSuddenTerminationv_block_invoke()
{
  void *v0;

  os_unfair_lock_lock((os_unfair_lock_t)&suddenTerminationDisablerLock);
  if (suddenTerminationDisabler)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler((id *)suddenTerminationDisabler);
    MEMORY[0x1B5E26C38]();
  }
  suddenTerminationDisabler = 0;
  dispatch_source_cancel((dispatch_source_t)suddenTerminationDisablerDispatchSource);
  v0 = (void *)suddenTerminationDisablerDispatchSource;
  suddenTerminationDisablerDispatchSource = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&suddenTerminationDisablerLock);
}

void sub_1B26BE9D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B26BEAAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)WBSSQLiteStore;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1B26BEBC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  id *v15;

  objc_destroyWeak(v15);
  _Unwind_Resume(a1);
}

void sub_1B26BECA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B26BED90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B26BEFC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B26BF0D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B26BF210(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_2_3(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  int v4;

  *(float *)a4 = a2;
  *(_QWORD *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 1024;
  *(_DWORD *)(a4 + 14) = v4;
  return result;
}

void OUTLINED_FUNCTION_3_1(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

void OUTLINED_FUNCTION_4_2(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x16u);
}

void SafariShared::SuddenTerminationDisabler::invalidateTask(SafariShared::SuddenTerminationDisabler *this)
{
  if (SafariShared::invalidTaskIdentifier(void)::once != -1)
    dispatch_once(&SafariShared::invalidTaskIdentifier(void)::once, &__block_literal_global_7_2);
  *(_QWORD *)this = SafariShared::invalidTaskIdentifier(void)::identifer;
}

BOOL SafariShared::SuddenTerminationDisabler::isTaskInvalid(SafariShared::SuddenTerminationDisabler *this)
{
  uint64_t v1;

  v1 = *(_QWORD *)this;
  if (SafariShared::invalidTaskIdentifier(void)::once != -1)
    dispatch_once(&SafariShared::invalidTaskIdentifier(void)::once, &__block_literal_global_7_2);
  return v1 == SafariShared::invalidTaskIdentifier(void)::identifer;
}

_QWORD *SafariShared::SuddenTerminationDisabler::setTaskIdentifier(_QWORD *this, uint64_t a2)
{
  *this = a2;
  return this;
}

void SafariShared::SuddenTerminationDisabler::disableSuddenTerminationTransaction(SafariShared::SuddenTerminationDisabler *this)
{
  NSObject *v2;
  _QWORD block[5];

  SafariShared::coalescingBackgroundTaskAssertionQueue(this);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___ZN12SafariShared25SuddenTerminationDisabler35disableSuddenTerminationTransactionEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = this;
  dispatch_sync(v2, block);

}

void SafariShared::SuddenTerminationDisabler::enableSuddenTerminationTransaction(SafariShared::SuddenTerminationDisabler *this)
{
  NSObject *v2;
  _QWORD block[5];

  SafariShared::coalescingBackgroundTaskAssertionQueue(this);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___ZN12SafariShared25SuddenTerminationDisabler34enableSuddenTerminationTransactionEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = this;
  dispatch_sync(v2, block);

}

void ___ZN12SafariShared25SuddenTerminationDisabler35disableSuddenTerminationTransactionEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.SafariShared.SuddenTerminationDisabler:%@"), *(_QWORD *)(v1 + 16));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "UTF8String");
  v2 = os_transaction_create();
  v3 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = v2;

}

void sub_1B26BF4BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void ___ZN12SafariShared25SuddenTerminationDisabler34enableSuddenTerminationTransactionEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

void ___ZN12SafariShared25SuddenTerminationDisabler28disableSuddenTerminationTaskEv_block_invoke_4(SafariShared *a1)
{
  NSObject *v1;

  SafariShared::coalescingBackgroundTaskAssertionQueue(a1);
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v1, &__block_literal_global_5_0);

}

void ___ZN12SafariShared25SuddenTerminationDisabler28disableSuddenTerminationTaskEv_block_invoke_2()
{
  uint64_t v0;
  NSObject *v1;
  void *v2;
  uint64_t *v3;
  uint64_t v4;
  id v5;
  uint64_t *v6;
  uint64_t *v7;
  BOOL v8;
  NSObject *v9;
  _BOOL8 v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v0 = SafariShared::coalescingBackgroundTaskIdentifier;
  if (SafariShared::invalidTaskIdentifier(void)::once != -1)
    dispatch_once(&SafariShared::invalidTaskIdentifier(void)::once, &__block_literal_global_7_2);
  if (v0 == SafariShared::invalidTaskIdentifier(void)::identifer)
  {
    v1 = WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1B2621000, v1, OS_LOG_TYPE_INFO, "Background task assertion was released by a prior item in the queue", (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    {
      v3 = (uint64_t *)SafariShared::coalescedDisablers(void)::set;
      if ((uint64_t *)SafariShared::coalescedDisablers(void)::set != &qword_1ED0DDC98)
      {
        do
        {
          v4 = v3[4];
          v5 = *(id *)(v4 + 16);
          objc_msgSend(v2, "addObject:", v5);

          if (SafariShared::invalidTaskIdentifier(void)::once != -1)
            dispatch_once(&SafariShared::invalidTaskIdentifier(void)::once, &__block_literal_global_7_2);
          *(_QWORD *)v4 = SafariShared::invalidTaskIdentifier(void)::identifer;
          v6 = (uint64_t *)v3[1];
          if (v6)
          {
            do
            {
              v7 = v6;
              v6 = (uint64_t *)*v6;
            }
            while (v6);
          }
          else
          {
            do
            {
              v7 = (uint64_t *)v3[2];
              v8 = *v7 == (_QWORD)v3;
              v3 = v7;
            }
            while (!v8);
          }
          v3 = v7;
        }
        while (v7 != &qword_1ED0DDC98);
      }
    }
    else
    {
      qword_1ED0DDCA0 = 0;
      qword_1ED0DDC98 = 0;
      SafariShared::coalescedDisablers(void)::set = (uint64_t)&qword_1ED0DDC98;
    }
    std::__tree<SafariShared::SuddenTerminationDisabler *>::destroy((uint64_t)&SafariShared::coalescedDisablers(void)::set, (_QWORD *)qword_1ED0DDC98);
    SafariShared::coalescedDisablers(void)::set = (uint64_t)&qword_1ED0DDC98;
    qword_1ED0DDCA0 = 0;
    qword_1ED0DDC98 = 0;
    v9 = WBS_LOG_CHANNEL_PREFIXSuddenTerminationDisabler();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      v12 = 138543362;
      v13 = v2;
      _os_log_impl(&dword_1B2621000, v9, OS_LOG_TYPE_DEFAULT, "Background task assertion expired while performing reasons: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    SafariShared::sharedApplication((SafariShared *)v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endBackgroundTask:", SafariShared::coalescingBackgroundTaskIdentifier);

    if (SafariShared::invalidTaskIdentifier(void)::once != -1)
      dispatch_once(&SafariShared::invalidTaskIdentifier(void)::once, &__block_literal_global_7_2);
    SafariShared::coalescingBackgroundTaskIdentifier = SafariShared::invalidTaskIdentifier(void)::identifer;

  }
}

void sub_1B26BF7A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id SafariShared::coalescedDisablerReasons(SafariShared *this)
{
  void *v1;
  uint64_t *v2;
  id v3;
  uint64_t *v4;
  uint64_t *v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  {
    v2 = (uint64_t *)SafariShared::coalescedDisablers(void)::set;
    if ((uint64_t *)SafariShared::coalescedDisablers(void)::set != &qword_1ED0DDC98)
    {
      do
      {
        v3 = *(id *)(v2[4] + 16);
        objc_msgSend(v1, "addObject:", v3);

        v4 = (uint64_t *)v2[1];
        if (v4)
        {
          do
          {
            v5 = v4;
            v4 = (uint64_t *)*v4;
          }
          while (v4);
        }
        else
        {
          do
          {
            v5 = (uint64_t *)v2[2];
            v6 = *v5 == (_QWORD)v2;
            v2 = v5;
          }
          while (!v6);
        }
        v2 = v5;
      }
      while (v5 != &qword_1ED0DDC98);
    }
  }
  else
  {
    qword_1ED0DDCA0 = 0;
    qword_1ED0DDC98 = 0;
    SafariShared::coalescedDisablers(void)::set = (uint64_t)&qword_1ED0DDC98;
  }
  return v1;
}

void sub_1B26BF8AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void std::__tree<SafariShared::SuddenTerminationDisabler *>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<SafariShared::SuddenTerminationDisabler *>::destroy(a1, *a2);
    std::__tree<SafariShared::SuddenTerminationDisabler *>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *std::__tree_balance_after_insert[abi:sn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t *std::__tree_remove[abi:sn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t **v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *a2;
  v3 = a2;
  if (*a2)
  {
    v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      v3 = a2;
      goto LABEL_7;
    }
    do
    {
      v3 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  v2 = v3[1];
  if (v2)
  {
LABEL_7:
    v5 = 0;
    *(_QWORD *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  v5 = 1;
LABEL_8:
  v6 = (uint64_t **)v3[2];
  v7 = *v6;
  if (*v6 == v3)
  {
    *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      v7 = 0;
      result = (uint64_t *)v2;
    }
    else
    {
      v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    v9 = a2[2];
    v3[2] = v9;
    *(_QWORD *)(v9 + 8 * (*(_QWORD *)a2[2] != (_QWORD)a2)) = v3;
    v11 = *a2;
    v10 = a2[1];
    *(_QWORD *)(v11 + 16) = v3;
    *v3 = v11;
    v3[1] = v10;
    if (v10)
      *(_QWORD *)(v10 + 16) = v3;
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2)
      result = v3;
  }
  if (!v8 || !result)
    return result;
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    v12 = v7[2];
    if (*(uint64_t **)v12 == v7)
      break;
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      v13 = *(uint64_t **)(v12 + 8);
      v14 = *v13;
      *(_QWORD *)(v12 + 8) = *v13;
      if (v14)
        *(_QWORD *)(v14 + 16) = v12;
      v13[2] = *(_QWORD *)(v12 + 16);
      *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v13;
      *v13 = v12;
      *(_QWORD *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7)
        result = v7;
      v7 = *(uint64_t **)(*v7 + 8);
    }
    v15 = (_QWORD *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      v16 = (uint64_t *)v7[1];
      if (!v16)
        goto LABEL_56;
LABEL_55:
      if (*((_BYTE *)v16 + 24))
      {
LABEL_56:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v22 = v15[1];
        *v7 = v22;
        if (v22)
          *(_QWORD *)(v22 + 16) = v7;
        v15[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v16 = v7;
      }
      else
      {
        v15 = v7;
      }
      v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      v25 = *v24;
      *(_QWORD *)(v23 + 8) = *v24;
      if (v25)
        *(_QWORD *)(v25 + 16) = v23;
      v24[2] = *(_QWORD *)(v23 + 16);
      *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
      *v24 = v23;
      goto LABEL_72;
    }
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24))
      goto LABEL_55;
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }
    if (!*((_BYTE *)v17 + 24))
      goto LABEL_53;
LABEL_49:
    v7 = *(uint64_t **)(v17[2] + 8 * (*(_QWORD *)v17[2] == (_QWORD)v17));
  }
  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    v18 = v7[1];
    *(_QWORD *)v12 = v18;
    if (v18)
      *(_QWORD *)(v18 + 16) = v12;
    v7[2] = *(_QWORD *)(v12 + 16);
    *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(_QWORD *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12)
      result = v7;
    v7 = *(uint64_t **)v12;
  }
  v19 = (_QWORD *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24))
    goto LABEL_68;
  v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24))
      v21 = v17 == result;
    else
      v21 = 1;
    if (v21)
      goto LABEL_53;
    goto LABEL_49;
  }
  if (v19 && !*((_BYTE *)v19 + 24))
  {
LABEL_68:
    v20 = v7;
  }
  else
  {
    *((_BYTE *)v20 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    v26 = *v20;
    v7[1] = *v20;
    if (v26)
      *(_QWORD *)(v26 + 16) = v7;
    v20[2] = v7[2];
    *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v20;
    *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    v19 = v7;
  }
  v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  v24 = *(uint64_t **)v23;
  v27 = *(_QWORD *)(*(_QWORD *)v23 + 8);
  *(_QWORD *)v23 = v27;
  if (v27)
    *(_QWORD *)(v27 + 16) = v23;
  v24[2] = *(_QWORD *)(v23 + 16);
  *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(_QWORD *)(v23 + 16) = v24;
  return result;
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

void WBSDispatchAsyncAndReleaseOnMainQueue(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  _QWORD block[5];
  _QWORD v6[5];
  id v7;

  v3 = a1;
  v4 = (void *)objc_msgSend(a2, "copy");
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__17;
  v6[4] = __Block_byref_object_dispose__17;
  v7 = _Block_copy(v4);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __WBSDispatchAsyncAndReleaseOnMainQueue_block_invoke;
  block[3] = &unk_1E649A1E8;
  block[4] = v6;
  dispatch_async(v3, block);

  _Block_object_dispose(v6, 8);
}

void *__Block_byref_object_copy__17(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__17(uint64_t a1)
{

}

void sub_1B26C36D4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WBSReleaseOnMainQueueImpl((const void **)va);
  _Unwind_Resume(a1);
}

void WBSPrintf(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v9;
  id v10;
  void *v11;
  id v12;

  v9 = (objc_class *)MEMORY[0x1E0CB3940];
  v10 = a1;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithFormat:arguments:", v10, &a9);

  v12 = objc_retainAutorelease(v11);
  printf("%s", (const char *)objc_msgSend(v12, "UTF8String"));

}

void WBSDPrintf(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v10;
  id v11;
  void *v12;
  id v13;

  v10 = (objc_class *)MEMORY[0x1E0CB3940];
  v11 = a2;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithFormat:arguments:", v11, &a9);

  v13 = objc_retainAutorelease(v12);
  dprintf(a1, "%s", (const char *)objc_msgSend(v13, "UTF8String"));

}

unint64_t WBSRangeEnumerateIndexesUsingBlock(unint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  if (result < result + a2)
  {
    v10 = v3;
    v11 = v4;
    v6 = result;
    v7 = a2 - 1;
    do
    {
      v9 = 0;
      result = (*(uint64_t (**)(uint64_t, unint64_t, char *))(a3 + 16))(a3, v6++, &v9);
      if (v9)
        v8 = 1;
      else
        v8 = v7 == 0;
      --v7;
    }
    while (!v8);
  }
  return result;
}

void WBSSetSignalHandler(void *a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const dispatch_source_type_s *v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id obj;
  sigaction v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    v12 = (const dispatch_source_type_s *)MEMORY[0x1E0C80DC0];
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(obj);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v13), "intValue");
        v15 = dispatch_source_create(v12, v14, 0, v6);
        dispatch_source_set_event_handler(v15, v7);
        dispatch_resume(v15);
        objc_msgSend(v8, "addObject:", v15);
        v19.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
        *(_QWORD *)&v19.sa_mask = 0;
        sigaction(v14, &v19, 0);

        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  v16 = objc_msgSend(v8, "copy");
  v17 = (void *)WBSSetSignalHandler_immortalDispatchSources;
  WBSSetSignalHandler_immortalDispatchSources = v16;

}

id sub_1B26C3E00()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)WBSPasswordsNotificationManager), sel_initIfAvailable);
  qword_1EEFE5A58 = (uint64_t)result;
  return result;
}

id sub_1B26C3EA4()
{
  void *v0;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  if (MEMORY[0x1E0CEC798])
    return objc_msgSend(v0, sel_init);
  if (qword_1EEFE5A68 != -1)
    swift_once();
  v2 = sub_1B26D40EC();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEFE6500);
  v3 = sub_1B26D40C8();
  v4 = sub_1B26D41E8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B2621000, v3, v4, "Passwords notifications are unavailable because UserNotifications.framework is not present", v5, 2u);
    MEMORY[0x1B5E2794C](v5, -1, -1);
  }

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

char *sub_1B26C3FD4()
{
  void *v0;
  void *v1;
  char *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  char *v7;
  void *v8;
  char *v9;
  objc_super v11;

  swift_unknownObjectWeakInit();
  v1 = (void *)objc_opt_self();
  v2 = v0;
  v3 = objc_msgSend(v1, sel_mainBundle);
  LODWORD(v1) = objc_msgSend(v3, sel_safari_isPasswordsAppBundle);

  if ((_DWORD)v1)
  {
    v4 = objc_msgSend((id)objc_opt_self(), sel_currentNotificationCenter);
  }
  else
  {
    sub_1B26D414C();
    v5 = objc_allocWithZone(MEMORY[0x1E0CEC798]);
    v6 = (void *)sub_1B26D4134();
    swift_bridgeObjectRelease();
    v4 = objc_msgSend(v5, sel_initWithBundleIdentifier_, v6);

  }
  *(_QWORD *)&v2[OBJC_IVAR___WBSPasswordsNotificationManager_userNotificationCenter] = v4;

  v11.receiver = v2;
  v11.super_class = (Class)WBSPasswordsNotificationManager;
  v7 = (char *)objc_msgSendSuper2(&v11, sel_init);
  v8 = *(void **)&v7[OBJC_IVAR___WBSPasswordsNotificationManager_userNotificationCenter];
  v9 = v7;
  objc_msgSend(v8, sel_setDelegate_, v9);
  sub_1B26C4144();

  return v9;
}

void sub_1B26C4144()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  char *v30;
  id v31;
  id v32[2];

  v32[1] = (id)MEMORY[0x1E0DEE9E8];
  v0 = (void *)sub_1B26D4134();
  sub_1B26CB72C(0, &qword_1EEFE5CA8);
  v1 = (void *)sub_1B26D41A0();
  v2 = (void *)sub_1B26D41A0();
  v3 = (void *)objc_opt_self();
  v4 = objc_msgSend(v3, sel_categoryWithIdentifier_actions_intentIdentifiers_options_, v0, v1, v2, 0);

  sub_1B26C79F8(v32, v4);
  v5 = (void *)sub_1B26D4134();
  v6 = (void *)sub_1B26D41A0();
  v7 = (void *)sub_1B26D41A0();
  v8 = objc_msgSend(v3, sel_categoryWithIdentifier_actions_intentIdentifiers_options_, v5, v6, v7, 0);

  sub_1B26C79F8(v32, v8);
  v9 = (void *)sub_1B26D4134();
  v10 = (void *)sub_1B26D41A0();
  v11 = (void *)sub_1B26D41A0();
  v12 = objc_msgSend(v3, sel_categoryWithIdentifier_actions_intentIdentifiers_options_, v9, v10, v11, 0);

  sub_1B26C79F8(v32, v12);
  v13 = (void *)sub_1B26D4134();
  v14 = (void *)sub_1B26D41A0();
  v15 = (void *)sub_1B26D41A0();
  v16 = objc_msgSend(v3, sel_categoryWithIdentifier_actions_intentIdentifiers_options_, v13, v14, v15, 0);

  sub_1B26C79F8(v32, v16);
  sub_1B26D414C();
  v17 = (void *)sub_1B26D4134();
  v18 = (void *)sub_1B26D41A0();
  v19 = (void *)sub_1B26D41A0();
  v20 = objc_msgSend(v3, sel_categoryWithIdentifier_actions_intentIdentifiers_options_, v17, v18, v19, 0);
  swift_bridgeObjectRelease();

  sub_1B26C79F8(v32, v20);
  sub_1B26D414C();
  v21 = (void *)sub_1B26D4134();
  v22 = (void *)sub_1B26D41A0();
  v23 = (void *)sub_1B26D41A0();
  v24 = objc_msgSend(v3, sel_categoryWithIdentifier_actions_intentIdentifiers_options_, v21, v22, v23, 0);
  swift_bridgeObjectRelease();

  sub_1B26C79F8(v32, v24);
  v25 = (void *)sub_1B26D4134();
  v26 = (void *)sub_1B26D41A0();
  v27 = (void *)sub_1B26D41A0();
  v28 = objc_msgSend(v3, sel_categoryWithIdentifier_actions_intentIdentifiers_options_, v25, v26, v27, 0);

  sub_1B26C79F8(v32, v28);
  v29 = *(void **)&v30[OBJC_IVAR___WBSPasswordsNotificationManager_userNotificationCenter];
  sub_1B26CB72C(0, &qword_1EEFE5CB0);
  sub_1B26CB764();
  v31 = (id)sub_1B26D41DC();
  swift_bridgeObjectRelease();
  objc_msgSend(v29, sel_setNotificationCategories_, v31);

}

void sub_1B26C4640(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_1B26C47A0(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

void sub_1B26C4908(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_1B26D4080();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, _QWORD))(a3 + 16))(a3, a1 & 1);

}

uint64_t sub_1B26C4960(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_1B26C4978()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  if (!objc_msgSend((id)objc_opt_self(), sel_isPasswordManagerAppEnabled))
    return (*(uint64_t (**)(void))(v0 + 8))();
  v1 = sub_1B26C9E5C(*(void **)(v0 + 16));
  v2 = (void *)sub_1B26D4134();
  v3 = objc_msgSend((id)objc_opt_self(), sel_requestWithIdentifier_content_trigger_, v2, v1, 0);
  *(_QWORD *)(v0 + 32) = v3;

  v4 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v4;
  *(_QWORD *)v4 = v0;
  *(_QWORD *)(v4 + 8) = sub_1B26C4A84;
  v5 = *(_QWORD *)(v0 + 24);
  *(_BYTE *)(v4 + 304) = 1;
  *(_QWORD *)(v4 + 256) = v3;
  *(_QWORD *)(v4 + 264) = v5;
  return swift_task_switch();
}

uint64_t sub_1B26C4A84()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();

  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1B26C4AF8()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;

  if (qword_1EEFE5A68 != -1)
    swift_once();
  v1 = sub_1B26D40EC();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EEFE6500);
  v2 = sub_1B26D40C8();
  v3 = sub_1B26D41F4();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B2621000, v2, v3, "Unable to schedule Password Saved notification", v4, 2u);
    MEMORY[0x1B5E2794C](v4, -1, -1);
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B26C4BE4(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v3 + 304) = a2;
  *(_QWORD *)(v3 + 256) = a1;
  *(_QWORD *)(v3 + 264) = v2;
  return swift_task_switch();
}

uint64_t sub_1B26C4C00()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(void **)(v0[33] + OBJC_IVAR___WBSPasswordsNotificationManager_userNotificationCenter);
  v0[34] = v1;
  v0[15] = v0 + 31;
  v0[10] = v0;
  v0[11] = sub_1B26C4CA4;
  v2 = swift_continuation_init();
  v0[26] = MEMORY[0x1E0C809B0];
  v3 = v0 + 26;
  v3[1] = 0x40000000;
  v3[2] = sub_1B26C6978;
  v3[3] = &block_descriptor_32;
  v3[4] = v2;
  objc_msgSend(v1, sel_getNotificationSettingsWithCompletionHandler_, v3);
  return swift_continuation_await();
}

uint64_t sub_1B26C4CA4()
{
  return swift_task_switch();
}

uint64_t sub_1B26C4CF0()
{
  uint64_t v0;
  NSObject *v1;
  char *v2;
  void *v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v1 = *(NSObject **)(v0 + 248);
  *(_QWORD *)(v0 + 280) = v1;
  v2 = (char *)-[NSObject authorizationStatus](v1, sel_authorizationStatus);
  if ((unint64_t)(v2 - 2) < 3)
    goto LABEL_2;
  if (v2 == (char *)1)
    goto LABEL_14;
  if (!v2)
  {
    if (*(_BYTE *)(v0 + 304) == 1 && !-[NSObject authorizationStatus](v1, sel_authorizationStatus))
    {
      v6 = *(void **)(v0 + 264);
      *(_QWORD *)(v0 + 184) = v0 + 248;
      *(_QWORD *)(v0 + 144) = v0;
      *(_QWORD *)(v0 + 152) = sub_1B26C500C;
      *(_QWORD *)(v0 + 240) = swift_continuation_init();
      *(_QWORD *)(v0 + 208) = MEMORY[0x1E0C809B0];
      *(_QWORD *)(v0 + 216) = 0x40000000;
      *(_QWORD *)(v0 + 224) = sub_1B26C69A8;
      *(_QWORD *)(v0 + 232) = &block_descriptor_35;
      objc_msgSend(v6, sel_requestPermissionToSendNotificationsProvisionally_withCompletionHandler_, 1, v0 + 208);
      return swift_continuation_await();
    }
LABEL_2:
    v3 = *(void **)(v0 + 272);
    v4 = *(_QWORD *)(v0 + 256);
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_1B26C5134;
    *(_QWORD *)(v0 + 240) = swift_continuation_init();
    *(_QWORD *)(v0 + 208) = MEMORY[0x1E0C809B0];
    *(_QWORD *)(v0 + 216) = 0x40000000;
    *(_QWORD *)(v0 + 224) = sub_1B26C6A28;
    *(_QWORD *)(v0 + 232) = &block_descriptor_33;
    objc_msgSend(v3, sel_addNotificationRequest_withCompletionHandler_, v4, v0 + 208);
    return swift_continuation_await();
  }
  if (qword_1EEFE5A68 != -1)
    swift_once();
  v7 = sub_1B26D40EC();
  __swift_project_value_buffer(v7, (uint64_t)qword_1EEFE6500);
  v8 = v1;
  v1 = sub_1B26D40C8();
  v9 = sub_1B26D41F4();
  if (!os_log_type_enabled(v1, v9))
  {

LABEL_14:
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v10 = (uint8_t *)swift_slowAlloc();
  v11 = swift_slowAlloc();
  v14 = v11;
  *(_DWORD *)v10 = 136315138;
  *(_QWORD *)(v0 + 208) = -[NSObject authorizationStatus](v8, sel_authorizationStatus, v14);
  type metadata accessor for UNAuthorizationStatus(0);
  v12 = sub_1B26D417C();
  *(_QWORD *)(v0 + 208) = sub_1B26C73B8(v12, v13, &v14);
  sub_1B26D423C();
  swift_bridgeObjectRelease();

  _os_log_impl(&dword_1B2621000, v1, v9, "Received unknown notification authorization status: %s", v10, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x1B5E2794C](v11, -1, -1);
  MEMORY[0x1B5E2794C](v10, -1, -1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B26C500C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 288) = *(_QWORD *)(*(_QWORD *)v0 + 176);
  return swift_task_switch();
}

uint64_t sub_1B26C506C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  if ((*(_BYTE *)(v0 + 248) & 1) != 0)
  {
    v1 = *(void **)(v0 + 272);
    v2 = *(_QWORD *)(v0 + 256);
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_1B26C5134;
    v3 = swift_continuation_init();
    *(_QWORD *)(v0 + 208) = MEMORY[0x1E0C809B0];
    v4 = (_QWORD *)(v0 + 208);
    v4[1] = 0x40000000;
    v4[2] = sub_1B26C6A28;
    v4[3] = &block_descriptor_33;
    v4[4] = v3;
    objc_msgSend(v1, sel_addNotificationRequest_withCompletionHandler_, v2, v4);
    return swift_continuation_await();
  }
  else
  {

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1B26C5134()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 296) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1B26C5194()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B26C51C8()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 280);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B26C5208()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 280);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B26C537C(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;
  _QWORD *v8;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_1B26C540C;
  v8[2] = v6;
  v8[3] = v7;
  return swift_task_switch();
}

uint64_t sub_1B26C540C()
{
  uint64_t *v0;
  void (**v1)(_QWORD);
  void *v2;
  void *v3;
  uint64_t v5;

  v1 = *(void (***)(_QWORD))(*v0 + 32);
  v3 = *(void **)(*v0 + 16);
  v2 = *(void **)(*v0 + 24);
  v5 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_1B26C547C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_1B26C5494()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  if (!objc_msgSend((id)objc_opt_self(), sel_isPasswordManagerAppEnabled))
    return (*(uint64_t (**)(void))(v0 + 8))();
  v1 = sub_1B26CA280(*(void **)(v0 + 16));
  v2 = (void *)sub_1B26D4134();
  v3 = objc_msgSend((id)objc_opt_self(), sel_requestWithIdentifier_content_trigger_, v2, v1, 0);
  *(_QWORD *)(v0 + 32) = v3;

  v4 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v4;
  *(_QWORD *)v4 = v0;
  *(_QWORD *)(v4 + 8) = sub_1B26C55A0;
  v5 = *(_QWORD *)(v0 + 24);
  *(_BYTE *)(v4 + 304) = 1;
  *(_QWORD *)(v4 + 256) = v3;
  *(_QWORD *)(v4 + 264) = v5;
  return swift_task_switch();
}

uint64_t sub_1B26C55A0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();

  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1B26C5614()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;

  if (qword_1EEFE5A68 != -1)
    swift_once();
  v1 = sub_1B26D40EC();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EEFE6500);
  v2 = sub_1B26D40C8();
  v3 = sub_1B26D41F4();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B2621000, v2, v3, "Unable to schedule Password Updated notification", v4, 2u);
    MEMORY[0x1B5E2794C](v4, -1, -1);
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B26C5830(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;
  _QWORD *v8;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_1B26CB898;
  v8[2] = v6;
  v8[3] = v7;
  return swift_task_switch();
}

uint64_t sub_1B26C58C0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_1B26C58D8()
{
  uint64_t v0;
  void *v1;
  id v2;
  unsigned __int8 v3;
  id v4;
  unsigned int v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  if (!objc_msgSend((id)objc_opt_self(), sel_isPasswordManagerAppEnabled))
    return (*(uint64_t (**)(void))(v0 + 8))();
  v1 = (void *)objc_opt_self();
  *(_QWORD *)(v0 + 24) = v1;
  v2 = objc_msgSend(v1, sel_pm_defaults);
  *(_QWORD *)(v0 + 32) = CFSTR("hasSentTakeATourNotification");
  v3 = objc_msgSend(v2, sel_safari_BOOLForKey_defaultValue_);

  if ((v3 & 1) != 0)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v4 = objc_msgSend(v1, sel_pm_defaults);
  v5 = objc_msgSend(v4, sel_safari_BOOLForKey_defaultValue_, CFSTR("shouldShowAppOnboardingView"), 1);

  if (!v5)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v6 = sub_1B26CA4C4();
  v7 = (void *)sub_1B26D4134();
  v8 = objc_msgSend((id)objc_opt_self(), sel_requestWithIdentifier_content_trigger_, v7, v6, 0);
  *(_QWORD *)(v0 + 40) = v8;

  v9 = swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v9;
  *(_QWORD *)v9 = v0;
  *(_QWORD *)(v9 + 8) = sub_1B26C5A80;
  v10 = *(_QWORD *)(v0 + 16);
  *(_BYTE *)(v9 + 304) = 1;
  *(_QWORD *)(v9 + 256) = v8;
  *(_QWORD *)(v9 + 264) = v10;
  return swift_task_switch();
}

uint64_t sub_1B26C5A80()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 56) = v0;
  swift_task_dealloc();
  if (!v0)

  return swift_task_switch();
}

uint64_t sub_1B26C5AEC()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = objc_msgSend(*(id *)(v0 + 24), sel_pm_defaults);
  objc_msgSend(v2, sel_setBool_forKey_, 1, v1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B26C5B48()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  void *v5;
  uint8_t *v6;

  if (qword_1EEFE5A68 != -1)
    swift_once();
  v1 = sub_1B26D40EC();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EEFE6500);
  v2 = sub_1B26D40C8();
  v3 = sub_1B26D41F4();
  v4 = os_log_type_enabled(v2, v3);
  v5 = *(void **)(v0 + 56);
  if (v4)
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B2621000, v2, v3, "Unable to schedule Take A Tour notification", v6, 2u);
    MEMORY[0x1B5E2794C](v6, -1, -1);
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B26C5D54(const void *a1, void *a2)
{
  _QWORD *v2;
  id v4;
  _QWORD *v5;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  v4 = a2;
  v5 = (_QWORD *)swift_task_alloc();
  v2[4] = v5;
  *v5 = v2;
  v5[1] = sub_1B26C5DCC;
  v5[2] = v4;
  return swift_task_switch();
}

uint64_t sub_1B26C5DCC()
{
  uint64_t *v0;
  void (**v1)(_QWORD);
  void *v2;
  uint64_t v4;

  v1 = *(void (***)(_QWORD))(*v0 + 24);
  v2 = *(void **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

void sub_1B26C5E30()
{
  uint64_t v0;
  void *v1;
  id v2;

  if (objc_msgSend((id)objc_opt_self(), sel_isPasswordManagerAppEnabled))
  {
    v1 = *(void **)(v0 + OBJC_IVAR___WBSPasswordsNotificationManager_userNotificationCenter);
    v2 = (id)sub_1B26D41A0();
    objc_msgSend(v1, sel_removeDeliveredNotificationsWithIdentifiers_, v2);

  }
}

void sub_1B26C5EEC()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  if (objc_msgSend((id)objc_opt_self(), sel_isPasswordManagerAppEnabled))
  {
    v1 = *(void **)(v0 + OBJC_IVAR___WBSPasswordsNotificationManager_userNotificationCenter);
    v2 = sub_1B26CA4C4();
    v3 = (void *)sub_1B26D4134();
    v4 = objc_msgSend((id)objc_opt_self(), sel_requestWithIdentifier_content_trigger_, v3, v2, 0);

    objc_msgSend(v1, sel_addNotificationRequest_withCompletionHandler_, v4, 0);
  }
}

void sub_1B26C6000(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v7;
  void *v8;
  _QWORD v9[6];

  if (objc_msgSend((id)objc_opt_self(), sel_isPasswordManagerAppEnabled))
  {
    v7 = *(void **)(v3 + OBJC_IVAR___WBSPasswordsNotificationManager_userNotificationCenter);
    v9[4] = a2;
    v9[5] = a3;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 1107296256;
    v9[2] = sub_1B26C60D4;
    v9[3] = &block_descriptor_41;
    v8 = _Block_copy(v9);
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_addNotificationRequest_withCompletionHandler_, a1, v8);
    _Block_release(v8);
  }
}

void sub_1B26C60D4(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

void sub_1B26C61A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_1B26D4080();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

uint64_t sub_1B26C61F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;

  v9[9] = a8;
  v9[10] = v8;
  v9[7] = a6;
  v9[8] = a7;
  v9[5] = a4;
  v9[6] = a5;
  v9[3] = a2;
  v9[4] = a3;
  v9[2] = a1;
  return swift_task_switch();
}

uint64_t sub_1B26C621C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v17 = v0[6];
  v18 = v0[7];
  v1 = v0[4];
  v16 = v0[5];
  v2 = v0[2];
  v3 = v0[3];
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEC6D8]), sel_init);
  v0[11] = v4;
  sub_1B26CB9E4();
  v5 = (void *)sub_1B26D4134();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setTitle_, v5);

  sub_1B26CB9E4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFE5BE8);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1B26DED30;
  *(_QWORD *)(v6 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v6 + 64) = sub_1B26CB33C();
  *(_QWORD *)(v6 + 32) = v2;
  *(_QWORD *)(v6 + 40) = v3;
  swift_bridgeObjectRetain();
  sub_1B26D4140();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = (void *)sub_1B26D4134();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setBody_, v7);

  v8 = sub_1B26D40B0();
  sub_1B26C992C(v1, v16, v17, v18, 0, v8, v9, v4);
  swift_bridgeObjectRelease();
  v10 = v4;
  v11 = (void *)sub_1B26D4134();
  v12 = objc_msgSend((id)objc_opt_self(), sel_requestWithIdentifier_content_trigger_, v11, v10, 0);
  v0[12] = v12;

  v13 = swift_task_alloc();
  v0[13] = v13;
  *(_QWORD *)v13 = v0;
  *(_QWORD *)(v13 + 8) = sub_1B26C64B8;
  v14 = v0[10];
  *(_BYTE *)(v13 + 304) = 1;
  *(_QWORD *)(v13 + 256) = v12;
  *(_QWORD *)(v13 + 264) = v14;
  return swift_task_switch();
}

uint64_t sub_1B26C64B8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 112) = v0;
  swift_task_dealloc();
  if (!v0)

  return swift_task_switch();
}

uint64_t sub_1B26C6524()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B26C6554()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint8_t *v7;

  if (qword_1EEFE5A68 != -1)
    swift_once();
  v1 = sub_1B26D40EC();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EEFE6500);
  v2 = sub_1B26D40C8();
  v3 = sub_1B26D41F4();
  v4 = os_log_type_enabled(v2, v3);
  v5 = *(void **)(v0 + 112);
  v6 = *(void **)(v0 + 88);
  if (v4)
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B2621000, v2, v3, "Unable to schedule Automatically Created Passkey notification", v7, 2u);
    MEMORY[0x1B5E2794C](v7, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B26C67B8(int a1, int a2, int a3, void *a4, void *aBlock, void *a6)
{
  _QWORD *v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v24;

  v6[2] = a6;
  v6[3] = _Block_copy(aBlock);
  v24 = sub_1B26D414C();
  v10 = v9;
  v6[4] = v9;
  v11 = sub_1B26D414C();
  v13 = v12;
  v6[5] = v12;
  v14 = sub_1B26D414C();
  v16 = v15;
  v6[6] = v15;
  v17 = a4;
  v18 = a6;
  v19 = sub_1B26D40BC();
  v21 = v20;

  v6[7] = v19;
  v6[8] = v21;
  v22 = (_QWORD *)swift_task_alloc();
  v6[9] = v22;
  *v22 = v6;
  v22[1] = sub_1B26C68D0;
  v22[9] = v21;
  v22[10] = v18;
  v22[7] = v16;
  v22[8] = v19;
  v22[5] = v13;
  v22[6] = v14;
  v22[3] = v10;
  v22[4] = v11;
  v22[2] = v24;
  return swift_task_switch();
}

uint64_t sub_1B26C68D0()
{
  uint64_t *v0;
  unint64_t v1;
  uint64_t v2;
  void (**v3)(_QWORD);
  void *v4;
  uint64_t v6;

  v1 = *(_QWORD *)(*v0 + 64);
  v2 = *(_QWORD *)(*v0 + 56);
  v4 = *(void **)(*v0 + 16);
  v3 = *(void (***)(_QWORD))(*v0 + 24);
  v6 = *v0;
  swift_task_dealloc();
  sub_1B26CB2F8(v2, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3[2](v3);
  _Block_release(v3);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_1B26C6978(uint64_t a1, void *a2)
{
  id v2;

  **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
  v2 = a2;
  return swift_continuation_resume();
}

uint64_t sub_1B26C69A8(uint64_t a1, char a2, void *a3)
{
  _QWORD *v4;
  id v5;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFE5C00);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    **(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_1B26C6A28(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFE5C00);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

unint64_t sub_1B26C6A9C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFE5CA0);
  v2 = (_QWORD *)sub_1B26D432C();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_1B26C87A8(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1B26C6BBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD aBlock[6];

  v23 = a2;
  v24 = a4;
  v9 = sub_1B26D40F8();
  v27 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78]();
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1B26D4110();
  v25 = *(_QWORD *)(v12 - 8);
  v26 = v12;
  MEMORY[0x1E0C80A78]();
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = objc_msgSend(v5, sel_delegate);
  sub_1B26CB72C(0, &qword_1EEFE5B10);
  v16 = (void *)sub_1B26D4200();
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = v15;
  v17[3] = v5;
  v17[4] = v23;
  v17[5] = a1;
  v18 = v24;
  v17[6] = a3;
  v17[7] = v18;
  v17[8] = a5;
  aBlock[4] = sub_1B26CAE9C;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B26C6E98;
  aBlock[3] = &block_descriptor;
  v19 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  v20 = v5;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  sub_1B26D4104();
  aBlock[0] = MEMORY[0x1E0DEE9D8];
  sub_1B26CAEC8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFE5B80);
  sub_1B26CAF50();
  sub_1B26D4254();
  MEMORY[0x1B5E2656C](0, v14, v11, v19);
  _Block_release(v19);
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v9);
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v14, v26);
}

uint64_t sub_1B26C6DFC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void))
{
  void *v11;

  if (a1)
  {
    v11 = (void *)sub_1B26D411C();
    objc_msgSend(a1, sel_notificationManager_didReceiveResponseOfType_toNotificationOfType_withUserInfo_, a2, a3, a4, v11);

  }
  return a6();
}

uint64_t sub_1B26C6E98(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t type metadata accessor for WBSPasswordsNotificationManager(uint64_t a1)
{
  return sub_1B26CB72C(a1, &qword_1EEFE5B08);
}

_QWORD *sub_1B26C70F8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_1B26C7108(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_1B26C7114(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_1B26CB860;
  return v6();
}

uint64_t sub_1B26C7168(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1B26CB860;
  return v7();
}

uint64_t sub_1B26C71BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1B26D41D0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1B26D41C4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1B26CB3C8(a1, &qword_1EEFE5B98);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B26D41B8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1B26C7308(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1B26C736C;
  return v6(a1);
}

uint64_t sub_1B26C736C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1B26C73B8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1B26C7488(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1B26CB000((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1B26CB000((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1B26C7488(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1B26D4248();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1B26C7640(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_1B26D42FC();
  if (!v8)
  {
    sub_1B26D4308();
    __break(1u);
LABEL_17:
    result = sub_1B26D4338();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_1B26C7640(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1B26C76D4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1B26C78AC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1B26C78AC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1B26C76D4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_1B26C7848(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1B26D42F0();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1B26D4308();
      __break(1u);
LABEL_10:
      v2 = sub_1B26D4194();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1B26D4338();
    __break(1u);
LABEL_14:
    result = sub_1B26D4308();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1B26C7848(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFE5B90);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1B26C78AC(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFE5B90);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1B26D4338();
  __break(1u);
  return result;
}

uint64_t sub_1B26C79F8(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char isUniquelyReferenced_nonNull_native;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v8 = a2;
    v9 = sub_1B26D4290();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_1B26CB72C(0, &qword_1EEFE5CB0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_1B26D4284();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v21 = sub_1B26C7C94(v7, result + 1);
    v27 = v21;
    if (*(_QWORD *)(v21 + 24) <= *(_QWORD *)(v21 + 16))
    {
      v25 = v8;
      sub_1B26C7E88();
      v22 = v27;
    }
    else
    {
      v22 = v21;
      v23 = v8;
    }
    sub_1B26C8124((uint64_t)v8, v22);
    *v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    v11 = sub_1B26D4224();
    v12 = -1 << *(_BYTE *)(v6 + 32);
    v13 = v11 & ~v12;
    if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
    {
      sub_1B26CB72C(0, &qword_1EEFE5CB0);
      v14 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
      v15 = sub_1B26D4230();

      if ((v15 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v19 = *(void **)(*(_QWORD *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        v20 = v19;
        return 0;
      }
      v16 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v16;
        if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
        v18 = sub_1B26D4230();

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_1B26C81A4((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_1B26C7C94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEFE5CC0);
    v2 = sub_1B26D42E4();
    v14 = v2;
    sub_1B26D4278();
    if (sub_1B26D429C())
    {
      sub_1B26CB72C(0, &qword_1EEFE5CB0);
      do
      {
        swift_dynamicCast();
        v2 = v14;
        if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
        {
          sub_1B26C7E88();
          v2 = v14;
        }
        result = sub_1B26D4224();
        v4 = v2 + 56;
        v5 = -1 << *(_BYTE *)(v2 + 32);
        v6 = result & ~v5;
        v7 = v6 >> 6;
        if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v9 = 0;
          v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v11 = v7 == v10;
            if (v7 == v10)
              v7 = 0;
            v9 |= v11;
            v12 = *(_QWORD *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v13;
        ++*(_QWORD *)(v2 + 16);
      }
      while (sub_1B26D429C());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E0DEE9E8];
  }
  return v2;
}

uint64_t sub_1B26C7E88()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEFE5CC0);
  v3 = sub_1B26D42D8();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v28 = v0;
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain();
    v12 = 0;
    while (1)
    {
      if (v8)
      {
        v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v15 = v14 | (v12 << 6);
      }
      else
      {
        v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9)
          goto LABEL_33;
        v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          v12 = v16 + 1;
          if (v16 + 1 >= v9)
            goto LABEL_33;
          v17 = v6[v12];
          if (!v17)
          {
            v12 = v16 + 2;
            if (v16 + 2 >= v9)
              goto LABEL_33;
            v17 = v6[v12];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                v1 = v28;
                v27 = 1 << *(_BYTE *)(v2 + 32);
                if (v27 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  v12 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v12 >= v9)
                    goto LABEL_33;
                  v17 = v6[v12];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v12 = v18;
            }
          }
        }
LABEL_23:
        v8 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      v19 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
      result = sub_1B26D4224();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v25 = v22 == v24;
          if (v22 == v24)
            v22 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

unint64_t sub_1B26C8124(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_1B26D4224();
  result = sub_1B26D426C();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_1B26C81A4(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_1B26C7E88();
  }
  else
  {
    if (v7 > v6)
    {
      sub_1B26C8328();
      goto LABEL_14;
    }
    sub_1B26C84D0();
  }
  v8 = *v3;
  v9 = sub_1B26D4224();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_1B26CB72C(0, &qword_1EEFE5CB0);
    v11 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
    v12 = sub_1B26D4230();

    if ((v12 & 1) != 0)
    {
LABEL_13:
      sub_1B26D4350();
      __break(1u);
    }
    else
    {
      v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v14 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
        v15 = sub_1B26D4230();

        if ((v15 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v16 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v16 + 48) + 8 * a2) = a1;
  v17 = *(_QWORD *)(v16 + 16);
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (v18)
    __break(1u);
  else
    *(_QWORD *)(v16 + 16) = v19;
}

id sub_1B26C8328()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEFE5CC0);
  v2 = *v0;
  v3 = sub_1B26D42CC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1B26C84D0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEFE5CC0);
  v3 = sub_1B26D42D8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v27 = v0;
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= v9)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v12);
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= v9)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v12);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    v19 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    result = sub_1B26D4224();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v27;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v12 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v12);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_1B26C8748(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1B26D4368();
  return sub_1B26C880C(a1, v2);
}

unint64_t sub_1B26C8778(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1B26D42A8();
  return sub_1B26C88A8(a1, v2);
}

unint64_t sub_1B26C87A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1B26D4374();
  sub_1B26D4188();
  v4 = sub_1B26D4380();
  return sub_1B26C896C(a1, a2, v4);
}

unint64_t sub_1B26C880C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_1B26C88A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_1B26CB414(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x1B5E26614](v9, a1);
      sub_1B26CB394((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1B26C896C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1B26D4344() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1B26D4344() & 1) == 0);
    }
  }
  return v6;
}

double sub_1B26C8A4C@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  double result;
  uint64_t v11;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_1B26C8778(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    v11 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1B26C9748();
      v9 = v11;
    }
    sub_1B26CB394(*(_QWORD *)(v9 + 48) + 40 * v6);
    sub_1B26CB404((_OWORD *)(*(_QWORD *)(v9 + 56) + 32 * v6), a2);
    sub_1B26C90F8(v6, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t sub_1B26C8B34(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0DD8B8);
  result = sub_1B26D4320();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v9 = (uint64_t *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v32 = -1 << v10;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v33 = 1 << *(_BYTE *)(v5 + 32);
    v34 = v3;
    v35 = (unint64_t)(v10 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v20 = v19 | (v8 << 6);
      }
      else
      {
        v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v21 >= v35)
          goto LABEL_33;
        v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          v8 = v21 + 1;
          if (v21 + 1 >= v35)
            goto LABEL_33;
          v22 = v9[v8];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v35)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v34;
                goto LABEL_40;
              }
              if (v33 >= 64)
                bzero((void *)(v5 + 64), 8 * v35);
              else
                *v9 = v32;
              v3 = v34;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                v8 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_42;
                if (v8 >= v35)
                  goto LABEL_33;
                v22 = v9[v8];
                ++v23;
                if (v22)
                  goto LABEL_30;
              }
            }
            v8 = v23;
          }
        }
LABEL_30:
        v12 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      v28 = 8 * v20;
      v29 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v28);
      v30 = *(void **)(*(_QWORD *)(v5 + 56) + v28);
      if ((a2 & 1) == 0)
        v31 = v30;
      result = sub_1B26D4368();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v26 = v16 == v25;
          if (v16 == v25)
            v16 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = 8 * v17;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v18) = v29;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v30;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_1B26C8DE4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD v37[2];
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFE5C18);
  v6 = sub_1B26D4320();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v11)
        goto LABEL_34;
      v23 = *(_QWORD *)(v36 + 8 * v14);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v14 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_43;
            if (v14 >= v11)
              goto LABEL_34;
            v23 = *(_QWORD *)(v36 + 8 * v14);
            ++v24;
            if (v23)
              goto LABEL_21;
          }
        }
        v14 = v24;
      }
    }
LABEL_21:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    v25 = *(_QWORD *)(v5 + 48) + 40 * v20;
    if ((a2 & 1) != 0)
    {
      v26 = *(_OWORD *)v25;
      v27 = *(_OWORD *)(v25 + 16);
      v40 = *(_QWORD *)(v25 + 32);
      v38 = v26;
      v39 = v27;
      sub_1B26CB404((_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_1B26CB414(v25, (uint64_t)&v38);
      sub_1B26CB000(*(_QWORD *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    result = sub_1B26D42A8();
    v28 = -1 << *(_BYTE *)(v7 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    v16 = *(_QWORD *)(v7 + 48) + 40 * v15;
    v17 = v38;
    v18 = v39;
    *(_QWORD *)(v16 + 32) = v40;
    *(_OWORD *)v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    result = (uint64_t)sub_1B26CB404(v37, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v15));
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_1B26C90F8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v14;
  unint64_t v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _OWORD *v20;
  _OWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  _BYTE v28[40];

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1B26D4260();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1B26CB414(*(_QWORD *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        v10 = sub_1B26D42A8();
        result = sub_1B26CB394((uint64_t)v28);
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            v14 = *(_QWORD *)(a2 + 48);
            v15 = v14 + 40 * v3;
            v16 = (__int128 *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              v17 = *v16;
              v18 = v16[1];
              *(_QWORD *)(v15 + 32) = *((_QWORD *)v16 + 4);
              *(_OWORD *)v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            v19 = *(_QWORD *)(a2 + 56);
            v20 = (_OWORD *)(v19 + 32 * v3);
            v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (v3 = v6, v20 >= v21 + 2))
            {
              v9 = v21[1];
              *v20 = *v21;
              v20[1] = v9;
              v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v23 = *v22;
    v24 = (-1 << v3) - 1;
  }
  else
  {
    v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    v24 = *v22;
    v23 = (-1 << result) - 1;
  }
  *v22 = v24 & v23;
  v25 = *(_QWORD *)(a2 + 16);
  v26 = __OFSUB__(v25, 1);
  v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_1B26C92C0(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v4 = v3;
  v8 = *v3;
  v10 = sub_1B26C8748(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_1B26C95A8();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];

      *(_QWORD *)(v17 + 8 * v10) = a1;
      return;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    v20 = 8 * v10;
    *(_QWORD *)(v16[6] + v20) = a2;
    *(_QWORD *)(v16[7] + v20) = a1;
    v21 = v16[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v16[2] = v23;
      return;
    }
    goto LABEL_14;
  }
  sub_1B26C8B34(v13, a3 & 1);
  v18 = sub_1B26C8748(a2);
  if ((v14 & 1) == (v19 & 1))
  {
    v10 = v18;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_1B26D435C();
  __break(1u);
}

_OWORD *sub_1B26C93F8(_OWORD *a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  _OWORD *v17;
  _OWORD *result;
  unint64_t v19;
  char v20;
  _BYTE v21[40];

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_1B26C8778(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = (_OWORD *)(v16[7] + 32 * v10);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
        return sub_1B26CB404(a1, v17);
      }
      goto LABEL_11;
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_1B26C9748();
      goto LABEL_7;
    }
    sub_1B26C8DE4(v13, a3 & 1);
    v19 = sub_1B26C8778(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      v10 = v19;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1B26CB414(a2, (uint64_t)v21);
      return sub_1B26C9530(v10, (uint64_t)v21, a1, v16);
    }
  }
  result = (_OWORD *)sub_1B26D435C();
  __break(1u);
  return result;
}

_OWORD *sub_1B26C9530(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  uint64_t v5;
  __int128 v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v5 = a4[6] + 40 * a1;
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(a2 + 32);
  result = sub_1B26CB404(a3, (_OWORD *)(a4[7] + 32 * a1));
  v8 = a4[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a4[2] = v10;
  return result;
}

id sub_1B26C95A8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0DD8B8);
  v2 = *v0;
  v3 = sub_1B26D4314();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1B26C9748()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  _OWORD v24[2];
  _OWORD v25[2];
  uint64_t v26;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFE5C18);
  v2 = *v0;
  v3 = sub_1B26D4314();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 40 * v15;
    sub_1B26CB414(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    v17 = 32 * v15;
    sub_1B26CB000(*(_QWORD *)(v2 + 56) + v17, (uint64_t)v24);
    v18 = *(_QWORD *)(v4 + 48) + v16;
    v19 = v25[0];
    v20 = v25[1];
    *(_QWORD *)(v18 + 32) = v26;
    *(_OWORD *)v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    result = sub_1B26CB404(v24, (_OWORD *)(*(_QWORD *)(v4 + 56) + v17));
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_1B26C992C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v16;
  uint64_t v17;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  void *v26;
  _OWORD v27[2];
  __int128 v28;
  uint64_t v29;
  _BYTE v30[40];
  uint64_t v31;

  v16 = MEMORY[0x1E0DEE9E0];
  v31 = MEMORY[0x1E0DEE9E0];
  *(_QWORD *)&v28 = 0x6576654C68676968;
  *((_QWORD *)&v28 + 1) = 0xEF6E69616D6F446CLL;
  v17 = MEMORY[0x1E0DEA968];
  sub_1B26D42C0();
  if (a2)
  {
    v29 = v17;
    *(_QWORD *)&v28 = a1;
    *((_QWORD *)&v28 + 1) = a2;
    sub_1B26CB404(&v28, v27);
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_1B26C93F8(v27, (uint64_t)v30, isUniquelyReferenced_nonNull_native);
    v31 = v16;
    swift_bridgeObjectRelease();
    sub_1B26CB394((uint64_t)v30);
  }
  else
  {
    sub_1B26C8A4C((uint64_t)v30, &v28);
    sub_1B26CB394((uint64_t)v30);
    sub_1B26CB3C8((uint64_t)&v28, &qword_1EEFE5C08);
  }
  *(_QWORD *)&v28 = 0x656D614E72657375;
  *((_QWORD *)&v28 + 1) = 0xE800000000000000;
  v19 = MEMORY[0x1E0DEA968];
  sub_1B26D42C0();
  if (a4)
  {
    v29 = v19;
    *(_QWORD *)&v28 = a3;
    *((_QWORD *)&v28 + 1) = a4;
    sub_1B26CB404(&v28, v27);
    swift_bridgeObjectRetain();
    v20 = v31;
    v21 = swift_isUniquelyReferenced_nonNull_native();
    sub_1B26C93F8(v27, (uint64_t)v30, v21);
    v31 = v20;
    swift_bridgeObjectRelease();
    sub_1B26CB394((uint64_t)v30);
  }
  else
  {
    sub_1B26C8A4C((uint64_t)v30, &v28);
    sub_1B26CB394((uint64_t)v30);
    sub_1B26CB3C8((uint64_t)&v28, &qword_1EEFE5C08);
  }
  *(_QWORD *)&v28 = 0x7365746973;
  *((_QWORD *)&v28 + 1) = 0xE500000000000000;
  sub_1B26D42C0();
  if (a5)
  {
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFE5C10);
    *(_QWORD *)&v28 = a5;
    sub_1B26CB404(&v28, v27);
    swift_bridgeObjectRetain();
    v22 = v31;
    v23 = swift_isUniquelyReferenced_nonNull_native();
    sub_1B26C93F8(v27, (uint64_t)v30, v23);
    v31 = v22;
    swift_bridgeObjectRelease();
    sub_1B26CB394((uint64_t)v30);
  }
  else
  {
    sub_1B26C8A4C((uint64_t)v30, &v28);
    sub_1B26CB394((uint64_t)v30);
    sub_1B26CB3C8((uint64_t)&v28, &qword_1EEFE5C08);
  }
  *(_QWORD *)&v28 = 0xD000000000000013;
  *((_QWORD *)&v28 + 1) = 0x80000001B26F3900;
  v24 = MEMORY[0x1E0DEA968];
  sub_1B26D42C0();
  if (a7)
  {
    v29 = v24;
    *(_QWORD *)&v28 = a6;
    *((_QWORD *)&v28 + 1) = a7;
    sub_1B26CB404(&v28, v27);
    swift_bridgeObjectRetain();
    v25 = swift_isUniquelyReferenced_nonNull_native();
    sub_1B26C93F8(v27, (uint64_t)v30, v25);
    swift_bridgeObjectRelease();
    sub_1B26CB394((uint64_t)v30);
  }
  else
  {
    sub_1B26C8A4C((uint64_t)v30, &v28);
    sub_1B26CB394((uint64_t)v30);
    sub_1B26CB3C8((uint64_t)&v28, &qword_1EEFE5C08);
  }
  v26 = (void *)sub_1B26D411C();
  swift_bridgeObjectRelease();
  objc_msgSend(a8, sel_setUserInfo_, v26);

}

uint64_t sub_1B26C9CF0(void *a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = objc_msgSend(a1, sel_highLevelDomain);
  if (v4)
  {
    v5 = v4;
    v6 = sub_1B26D414C();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = objc_msgSend(a1, sel_user);
  if (v9)
  {
    v10 = v9;
    v11 = sub_1B26D414C();
    v13 = v12;

  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  v14 = objc_msgSend(a1, sel_sites);
  if (v14)
  {
    v15 = v14;
    v16 = sub_1B26D41AC();

  }
  else
  {
    v16 = 0;
  }
  v17 = objc_msgSend(a1, sel_passkeyCredentialID);
  if (v17)
  {
    v18 = v17;
    v19 = sub_1B26D414C();
    v21 = v20;

  }
  else
  {
    v19 = 0;
    v21 = 0;
  }
  sub_1B26C992C(v6, v8, v11, v13, v16, v19, v21, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id sub_1B26C9E5C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t inited;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v31;
  _QWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  int *v35;

  v2 = sub_1B26D40A4();
  v31 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78]();
  v4 = (char *)v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0) + 56;
  sub_1B26D4170();
  MEMORY[0x1E0C80A78]();
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEC6D8]), sel_init);
  strcpy((char *)v32, "Password Saved");
  HIBYTE(v32[1]) = -18;
  v33 = 0;
  v34 = 0;
  v35 = &dword_1B2621000;
  sub_1B26CB9E4();
  v6 = (void *)sub_1B26D4134();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setTitle_, v6);

  v7 = objc_msgSend(a1, sel_userVisibleDomain);
  if (v7)
  {
    v8 = v7;
    v9 = sub_1B26D414C();
    v11 = v10;

    v12 = HIBYTE(v11) & 0xF;
    if ((v11 & 0x2000000000000000) == 0)
      v12 = v9 & 0xFFFFFFFFFFFFLL;
    if (v12)
    {
      v32[0] = 0x1000000000000048;
      v32[1] = 0x80000001B26F3B50;
      v33 = 0;
      v34 = 0;
      v35 = &dword_1B2621000;
      sub_1B26CB9E4();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFE5BE8);
      v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_1B26DED30;
      *(_QWORD *)(v13 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v13 + 64) = sub_1B26CB33C();
      *(_QWORD *)(v13 + 32) = v9;
      *(_QWORD *)(v13 + 40) = v11;
      sub_1B26D4140();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    swift_bridgeObjectRelease();
  }
  v32[0] = 0xD00000000000003BLL;
  v32[1] = 0x80000001B26F3AF0;
  v33 = 0;
  v34 = 0;
  v35 = &dword_1B2621000;
  sub_1B26CB9E4();
LABEL_8:
  v14 = (void *)sub_1B26D4134();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setBody_, v14);

  v15 = (void *)sub_1B26D4134();
  objc_msgSend(v5, sel_setCategoryIdentifier_, v15);

  v16 = objc_msgSend(a1, sel_stableID);
  if (v16)
  {
    v17 = v16;
    v18 = sub_1B26D40BC();
    v20 = v19;

    sub_1B26D4164();
    v21 = sub_1B26D4158();
    if (v22)
    {
      v23 = v21;
      v24 = v22;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFE5C98);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1B26DED30;
      v26 = (void *)objc_opt_self();
      *(_QWORD *)(inited + 32) = 0x61746544776F6853;
      *(_QWORD *)(inited + 40) = 0xEB00000000736C69;
      *(_QWORD *)(inited + 48) = v23;
      *(_QWORD *)(inited + 56) = v24;
      sub_1B26C6A9C(inited);
      v27 = (void *)sub_1B26D411C();
      swift_bridgeObjectRelease();
      v28 = objc_msgSend(v26, sel_passwordManagerURLWithDictionary_, v27);

      sub_1B26D4098();
      v29 = (void *)sub_1B26D408C();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v4, v2);
      objc_msgSend(v5, sel_setDefaultActionURL_, v29);

    }
    sub_1B26CB2F8(v18, v20);
  }
  sub_1B26C9CF0(a1, v5);
  return v5;
}

id sub_1B26CA280(void *a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEC6D8]), sel_init);
  sub_1B26CB9E4();
  v3 = (void *)sub_1B26D4134();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setTitle_, v3);

  v4 = objc_msgSend(a1, sel_userVisibleDomain);
  if (!v4)
    goto LABEL_7;
  v5 = v4;
  v6 = sub_1B26D414C();
  v8 = v7;

  v9 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0)
    v9 = v6 & 0xFFFFFFFFFFFFLL;
  if (!v9)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    sub_1B26CB9E4();
    goto LABEL_8;
  }
  sub_1B26CB9E4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFE5BE8);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1B26DED30;
  *(_QWORD *)(v10 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v10 + 64) = sub_1B26CB33C();
  *(_QWORD *)(v10 + 32) = v6;
  *(_QWORD *)(v10 + 40) = v8;
  sub_1B26D4140();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_8:
  v11 = (void *)sub_1B26D4134();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setBody_, v11);

  v12 = (void *)sub_1B26D4134();
  objc_msgSend(v2, sel_setCategoryIdentifier_, v12);

  sub_1B26C9CF0(a1, v2);
  return v2;
}

id sub_1B26CA4C4()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEC6D8]), sel_init);
  sub_1B26CB9E4();
  v1 = (void *)sub_1B26D4134();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setTitle_, v1);

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedMonitor);
  objc_msgSend(v2, sel_isKeychainSyncEnabled);

  sub_1B26CB9E4();
  v3 = (void *)sub_1B26D4134();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setBody_, v3);

  v4 = (void *)sub_1B26D4134();
  objc_msgSend(v0, sel_setCategoryIdentifier_, v4);

  return v0;
}

uint64_t sub_1B26CA650(uint64_t a1, uint64_t a2)
{
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;

  if (a1 == 0xD00000000000003BLL && a2 == 0x80000001B26F3710 || (sub_1B26D4344() & 1) != 0)
    return 1;
  if (a1 == 0xD000000000000037 && a2 == 0x80000001B26F3750 || (sub_1B26D4344() & 1) != 0)
    return 2;
  if (a1 == 0xD000000000000039 && a2 == 0x80000001B26F3790 || (sub_1B26D4344() & 1) != 0)
    return 3;
  if (a1 == 0xD00000000000002BLL && a2 == 0x80000001B26F32B0 || (sub_1B26D4344() & 1) != 0)
    return 4;
  if (sub_1B26D414C() == a1 && v5 == a2)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  v6 = sub_1B26D4344();
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
    return 6;
  if (sub_1B26D414C() == a1 && v7 == a2)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  v8 = sub_1B26D4344();
  swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
    return 5;
  if (a1 == 0xD000000000000026 && a2 == 0x80000001B26F37D0)
    return 8;
  if ((sub_1B26D4344() & 1) != 0)
    return 8;
  return 0;
}

uint64_t sub_1B26CA8DC(void *a1, uint64_t a2, void (**a3)(_QWORD))
{
  uint64_t v5;
  id v6;
  char **v7;
  id v8;
  char **v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  char v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a3;
  _Block_copy(a3);
  v6 = objc_msgSend(a1, sel_notification);
  v7 = &selRef_passwordManagerURLWithPrefsURL_;
  v8 = objc_msgSend(v6, sel_request);

  v9 = &selRef__setUseEnhancedPrivacyMode_;
  v10 = objc_msgSend(v8, sel_identifier);

  v11 = sub_1B26D414C();
  v13 = v12;

  v14 = sub_1B26CA650(v11, v13);
  LOBYTE(v11) = v15;
  swift_bridgeObjectRelease();
  if ((v11 & 1) == 0)
  {
    v16 = objc_msgSend(a1, sel_actionIdentifier);
    v17 = sub_1B26D414C();
    v19 = v18;

    if (sub_1B26D414C() == v17 && v20 == v19)
    {
      v21 = 0;
LABEL_10:
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
    v22 = v5;
    v23 = sub_1B26D4344();
    swift_bridgeObjectRelease();
    if ((v23 & 1) != 0)
    {
      v21 = 0;
      v5 = v22;
      v7 = &selRef_passwordManagerURLWithPrefsURL_;
LABEL_11:
      swift_bridgeObjectRelease();
LABEL_12:
      v25 = objc_msgSend(a1, sel_notification);
      v26 = objc_msgSend(v25, v7[435]);

      v27 = objc_msgSend(v26, sel_content);
      v28 = objc_msgSend(v27, sel_userInfo);

      v29 = sub_1B26D4128();
      sub_1B26C6BBC(v14, v21, v29, (uint64_t)sub_1B26CAE3C, v5);
      swift_release();
      return swift_bridgeObjectRelease();
    }
    v5 = v22;
    if (sub_1B26D414C() == v17 && v24 == v19)
    {
      v21 = 1;
      v7 = &selRef_passwordManagerURLWithPrefsURL_;
      goto LABEL_10;
    }
    v31 = sub_1B26D4344();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v7 = &selRef_passwordManagerURLWithPrefsURL_;
    v9 = &selRef__setUseEnhancedPrivacyMode_;
    if ((v31 & 1) != 0)
    {
      v21 = 1;
      goto LABEL_12;
    }
  }
  if (qword_1EEFE5A68 != -1)
    swift_once();
  v32 = sub_1B26D40EC();
  __swift_project_value_buffer(v32, (uint64_t)qword_1EEFE6500);
  v33 = a1;
  v34 = sub_1B26D40C8();
  v35 = sub_1B26D41F4();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = swift_slowAlloc();
    v47 = swift_slowAlloc();
    v48 = v47;
    *(_DWORD *)v36 = 136315394;
    v37 = objc_msgSend(v33, sel_notification);
    v38 = objc_msgSend(v37, v7[435]);

    v39 = objc_msgSend(v38, v9[496]);
    v40 = sub_1B26D414C();
    v42 = v41;

    sub_1B26C73B8(v40, v42, &v48);
    sub_1B26D423C();

    swift_bridgeObjectRelease();
    *(_WORD *)(v36 + 12) = 2080;
    v43 = objc_msgSend(v33, sel_actionIdentifier);
    v44 = sub_1B26D414C();
    v46 = v45;

    sub_1B26C73B8(v44, v46, &v48);
    sub_1B26D423C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B2621000, v34, v35, "Could not get notification type (%s) or response type (%s) for user notification", (uint8_t *)v36, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1B5E2794C](v47, -1, -1);
    MEMORY[0x1B5E2794C](v36, -1, -1);

  }
  else
  {

  }
  a3[2](a3);
  return swift_release();
}

uint64_t sub_1B26CAE18()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1B26CAE3C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1B26CAE60()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B26CAE9C()
{
  uint64_t v0;

  return sub_1B26C6DFC(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(uint64_t (**)(void))(v0 + 56));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_1B26CAEC8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEFE5B78;
  if (!qword_1EEFE5B78)
  {
    v1 = sub_1B26D40F8();
    result = MEMORY[0x1B5E278EC](MEMORY[0x1E0DEF510], v1);
    atomic_store(result, (unint64_t *)&qword_1EEFE5B78);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1B5E278D4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1B26CAF50()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEFE5B88;
  if (!qword_1EEFE5B88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEFE5B80);
    result = MEMORY[0x1B5E278EC](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1EEFE5B88);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1B5E278E0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1B26CB000(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1B26CB040()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 16))(0);
}

uint64_t sub_1B26CB064()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 48));
  return swift_deallocObject();
}

uint64_t sub_1B26CB0B0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (void *)v0[5];
  v7 = (void *)v0[6];
  v6 = (void *)v0[7];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v8;
  *v8 = v1;
  v8[1] = sub_1B26CB860;
  return ((uint64_t (*)(int, int, int, void *, void *, void *))((char *)&dword_1EEFE5BA0 + dword_1EEFE5BA0))(v2, v3, v4, v5, v7, v6);
}

uint64_t sub_1B26CB140()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1B26CB860;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1EEFE5BB0 + dword_1EEFE5BB0))(v2, v3, v4);
}

uint64_t sub_1B26CB1BC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1B26CB860;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EEFE5BC0 + dword_1EEFE5BC0))(a1, v4, v5, v6);
}

uint64_t sub_1B26CB240(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1B26CB2B0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EEFE5BD0 + dword_1EEFE5BD0))(a1, v4);
}

uint64_t sub_1B26CB2B0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1B26CB2F8(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

unint64_t sub_1B26CB33C()
{
  unint64_t result;

  result = qword_1EEFE5BF0;
  if (!qword_1EEFE5BF0)
  {
    result = MEMORY[0x1B5E278EC](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, &qword_1EEFE5BF0);
  }
  return result;
}

void type metadata accessor for UNAuthorizationStatus(uint64_t a1)
{
  sub_1B26CB81C(a1, &qword_1EEFE5CD0);
}

uint64_t sub_1B26CB394(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 8))();
  return a1;
}

uint64_t sub_1B26CB3C8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *sub_1B26CB404(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1B26CB414(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

void sub_1B26CB450(uint64_t a1)
{
  uint64_t v1;

  sub_1B26C61A8(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1B26CB458()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_1B26CB484()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1B26CB860;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_1EEFE5C20 + dword_1EEFE5C20))(v2, v3);
}

uint64_t sub_1B26CB4F0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1B26CB2B0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EEFE5BC0 + dword_1EEFE5BC0))(a1, v4, v5, v6);
}

uint64_t sub_1B26CB578()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1B26CB860;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_1EEFE5C48 + dword_1EEFE5C48))(v2, v3, v4);
}

uint64_t objectdestroy_59Tm()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_1B26CB624()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1B26CB860;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_1EEFE5C70 + dword_1EEFE5C70))(v2, v3, v4);
}

uint64_t objectdestroy_16Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_1B26CB6C4(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_1B26C4908(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_1B26CB6CC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_1B26CB6DC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B26CB700(void *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(id))(v1 + 16))(objc_msgSend(a1, sel_authorizationStatus));
}

uint64_t sub_1B26CB72C(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_1B26CB764()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEFE5CB8;
  if (!qword_1EEFE5CB8)
  {
    v1 = sub_1B26CB72C(255, &qword_1EEFE5CB0);
    result = MEMORY[0x1B5E278EC](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1EEFE5CB8);
  }
  return result;
}

uint64_t sub_1B26CB7BC(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

void type metadata accessor for UNNotificationPresentationOptions(uint64_t a1)
{
  sub_1B26CB81C(a1, &qword_1EEFE5CD8);
}

void type metadata accessor for WBSPasswordsNotificationType(uint64_t a1)
{
  sub_1B26CB81C(a1, &qword_1EEFE5CE0);
}

void type metadata accessor for WBSPasswordsNotificationResponseType(uint64_t a1)
{
  sub_1B26CB81C(a1, &qword_1EEFE5CE8);
}

void sub_1B26CB81C(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

SafariCore::WBSLocalizedStringLiteral __swiftcall WBSLocalizedStringLiteral.init(stringLiteral:)(SafariCore::WBSLocalizedStringLiteral stringLiteral)
{
  SafariCore::WBSLocalizedStringLiteral *v1;

  *v1 = stringLiteral;
  return stringLiteral;
}

uint64_t WBSLookUpLocalizedString(_:key:dsohandle:)()
{
  uint64_t v0;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v0 = sub_1B26CB9E4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t WBSLookUpLocalizedString(_:dsohandle:)()
{
  uint64_t v0;

  swift_bridgeObjectRetain();
  v0 = sub_1B26CB9E4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

void __swiftcall UI_STRING_PLURAL_VAR(_:_:_:_:)(SafariCore::WBSLocalizedPluralVariable *__return_ptr retstr, SafariCore::WBSLocalizedStringLiteral a2, SafariCore::WBSLocalizedStringLiteral a3, SafariCore::WBSLocalizedStringLiteral a4, SafariCore::WBSLocalizedStringLiteral a5)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = *(_QWORD *)a2.stringValue._countAndFlagsBits;
  a2.stringValue._countAndFlagsBits = *(_QWORD *)(a2.stringValue._countAndFlagsBits + 8);
  v6 = *(_QWORD *)a2.stringValue._object;
  v7 = (void *)*((_QWORD *)a2.stringValue._object + 1);
  v8 = *(_QWORD *)a3.stringValue._countAndFlagsBits;
  v9 = *(void **)(a3.stringValue._countAndFlagsBits + 8);
  v10 = *(_QWORD *)a3.stringValue._object;
  v11 = (void *)*((_QWORD *)a3.stringValue._object + 1);
  retstr->name._countAndFlagsBits = v5;
  retstr->name._object = (void *)a2.stringValue._countAndFlagsBits;
  retstr->type._countAndFlagsBits = v6;
  retstr->type._object = v7;
  retstr->oneFormatString._countAndFlagsBits = v8;
  retstr->oneFormatString._object = v9;
  retstr->otherFormatString._countAndFlagsBits = v10;
  retstr->otherFormatString._object = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
}

_QWORD *sub_1B26CB9D8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t sub_1B26CB9E4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v1 = sub_1B26D40EC();
  MEMORY[0x1E0C80A78]();
  v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = v0[3];
  v5 = v0[4];
  v25 = v6;
  if (v4)
  {
    v7 = v0[2];
  }
  else
  {
    v8 = v0;
    v7 = *v0;
    v4 = v8[1];
  }
  swift_bridgeObjectRetain();
  v9 = sub_1B26CC138(v5);
  v10 = 0x80000001B26F3BC0;
  v23 = v7;
  if (!v9)
  {
    v15 = 0xD00000000000001ALL;
LABEL_8:
    if (v10 == 0x80000001B26F3BC0)
      goto LABEL_10;
    goto LABEL_9;
  }
  v11 = v9;
  v12 = (void *)sub_1B26D4134();
  v13 = (void *)sub_1B26D4134();
  v14 = objc_msgSend(v11, sel_localizedStringForKey_value_table_, v12, v13, 0);

  v15 = sub_1B26D414C();
  v10 = v16;

  if (v15 == 0xD00000000000001ALL)
    goto LABEL_8;
LABEL_9:
  if ((sub_1B26D4344() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return v15;
  }
LABEL_10:
  v24 = v1;
  sub_1B26D40E0();
  swift_bridgeObjectRetain();
  v17 = sub_1B26D40C8();
  v18 = sub_1B26D41F4();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    v27 = v20;
    *(_DWORD *)v19 = 136315138;
    swift_bridgeObjectRetain();
    v26 = sub_1B26C73B8(v23, v4, &v27);
    sub_1B26D423C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1B2621000, v17, v18, "Failed to look up localized string key: %s", v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B5E2794C](v20, -1, -1);
    MEMORY[0x1B5E2794C](v19, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v25 + 8))(v3, v24);
  return v15;
}

unint64_t sub_1B26CBCAC()
{
  unint64_t result;

  result = qword_1EEFE5D50;
  if (!qword_1EEFE5D50)
  {
    result = MEMORY[0x1B5E278EC](&protocol conformance descriptor for WBSLocalizedStringLiteral, &type metadata for WBSLocalizedStringLiteral);
    atomic_store(result, (unint64_t *)&qword_1EEFE5D50);
  }
  return result;
}

uint64_t sub_1B26CBCF0()
{
  return MEMORY[0x1E0DEA9F0];
}

unint64_t sub_1B26CBD00()
{
  unint64_t result;

  result = qword_1EEFE5D58;
  if (!qword_1EEFE5D58)
  {
    result = MEMORY[0x1B5E278EC](&protocol conformance descriptor for WBSLocalizedStringLiteral, &type metadata for WBSLocalizedStringLiteral);
    atomic_store(result, (unint64_t *)&qword_1EEFE5D58);
  }
  return result;
}

uint64_t sub_1B26CBD44()
{
  return MEMORY[0x1E0DEAA00];
}

uint64_t sub_1B26CBD50()
{
  return MEMORY[0x1E0DEA9F8];
}

uint64_t initializeBufferWithCopyOfBuffer for WBSLocalizedPluralVariable(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for WBSLocalizedPluralVariable()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for WBSLocalizedPluralVariable(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for WBSLocalizedPluralVariable(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

_QWORD *assignWithTake for WBSLocalizedPluralVariable(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WBSLocalizedPluralVariable(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WBSLocalizedPluralVariable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for WBSLocalizedPluralVariable()
{
  return &type metadata for WBSLocalizedPluralVariable;
}

_QWORD *initializeBufferWithCopyOfBuffer for WBSLocalizedStringLiteral(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for WBSLocalizedStringLiteral()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for WBSLocalizedStringLiteral(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for WBSLocalizedStringLiteral(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WBSLocalizedStringLiteral(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WBSLocalizedStringLiteral(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for WBSLocalizedStringLiteral()
{
  return &type metadata for WBSLocalizedStringLiteral;
}

id sub_1B26CC138(uint64_t a1)
{
  _QWORD *v2;
  unint64_t v3;
  char v4;
  id v5;
  id v6;
  id v7;
  char isUniquelyReferenced_nonNull_native;
  void *v10;

  if (qword_1ED0DD8B0 != -1)
    swift_once();
  swift_beginAccess();
  v2 = off_1ED0DD8C0;
  if (*((_QWORD *)off_1ED0DD8C0 + 2) && (v3 = sub_1B26C8748(a1), (v4 & 1) != 0))
  {
    v5 = *(id *)(v2[7] + 8 * v3);
    swift_endAccess();
    v6 = v5;
  }
  else
  {
    swift_endAccess();
    v5 = _WBSGetLocalizableBundleFromAddress();
    if (v5)
    {
      swift_beginAccess();
      v7 = v5;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v10 = off_1ED0DD8C0;
      off_1ED0DD8C0 = (_UNKNOWN *)0x8000000000000000;
      sub_1B26C92C0((uint64_t)v7, a1, isUniquelyReferenced_nonNull_native);
      off_1ED0DD8C0 = v10;
      swift_bridgeObjectRelease();
      swift_endAccess();
    }
  }
  return v5;
}

void sub_1B26CC264()
{
  off_1ED0DD8C0 = (_UNKNOWN *)MEMORY[0x1E0DEE9E0];
}

WBSSpotlightDonationEntityCorrelator __swiftcall WBSSpotlightDonationEntityCorrelator.init()()
{
  return (WBSSpotlightDonationEntityCorrelator)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id WBSSpotlightDonationEntityCorrelator.init()()
{
  objc_super v1;

  v1.super_class = (Class)WBSSpotlightDonationEntityCorrelator;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t type metadata accessor for WBSSpotlightDonationEntityCorrelator()
{
  unint64_t result;

  result = qword_1EEFE5D60;
  if (!qword_1EEFE5D60)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EEFE5D60);
  }
  return result;
}

unint64_t sub_1B26CC494(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFE5D68);
  v2 = sub_1B26D432C();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1B26CC9A8(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_1B26C87A8(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_1B26CB404(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void sub_1B26CC5BC(void *a1)
{
  id v2;
  id v3;
  id v4;
  id v5;

  v2 = objc_msgSend(a1, sel_attributeSet);
  v3 = objc_msgSend(v2, sel_title);

  if (v3)
  {
    sub_1B26D414C();

    v4 = objc_msgSend(a1, sel_attributeSet);
    v5 = objc_msgSend(a1, sel_uniqueIdentifier);
    sub_1B26D414C();

    sub_1B26CC494(MEMORY[0x1E0DEE9D8]);
    sub_1B26D4218();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_1B26CC71C(void *a1)
{
  id v2;
  id v3;
  id v4;

  v2 = objc_msgSend(a1, sel_attributeSet);
  v3 = objc_msgSend(v2, sel_title);

  if (v3)
  {
    sub_1B26D414C();

    v4 = objc_msgSend(a1, sel_attributeSet);
    sub_1B26CC494(MEMORY[0x1E0DEE9D8]);
    sub_1B26D4218();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
  }
}

void sub_1B26CC850(void *a1)
{
  id v2;
  id v3;
  id v4;
  id v5;

  v2 = objc_msgSend(a1, sel_attributeSet);
  v3 = objc_msgSend(v2, sel_title);

  if (v3)
  {
    sub_1B26D414C();

    v4 = objc_msgSend(a1, sel_attributeSet);
    v5 = objc_msgSend(a1, sel_uniqueIdentifier);
    sub_1B26D414C();

    sub_1B26CC494(MEMORY[0x1E0DEE9D8]);
    sub_1B26D4218();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1B26CC9A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEFE5D70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B26CC9F0()
{
  uint64_t v0;

  v0 = sub_1B26D40EC();
  __swift_allocate_value_buffer(v0, qword_1EEFE6500);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EEFE6500);
  return sub_1B26D40D4();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void WBSAXShouldShowAnimatedImageControls_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Boolean soft_AXSReduceMotionAutoplayAnimatedImagesEnabled(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WBSAccessibilityUtilities.m"), 12, CFSTR("%s"), dlerror());

  __break(1u);
}

void WBSReportThreadLocationAndSleep_cold_1(void *a1)
{
  NSObject *v1;
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2[0] = 67109120;
  v2[1] = getpid();
  _os_log_error_impl(&dword_1B2621000, v1, OS_LOG_TYPE_ERROR, "Sleeping thread for debugger; attach to process (PID: %d) to unsleep the thread.",
    (uint8_t *)v2,
    8u);

}

void WBSWriteExactAmountOfBytesToFileDescriptor_cold_1(void *a1, int a2)
{
  NSObject *v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = *__error();
  v5[0] = 67109376;
  v5[1] = a2;
  v6 = 1024;
  v7 = v4;
  _os_log_error_impl(&dword_1B2621000, v3, OS_LOG_TYPE_ERROR, "Failed to write bytes to file descriptor %d: %{errno}i", (uint8_t *)v5, 0xEu);

}

void WBSHTTPProtocolFromSecAttrProtocolValue_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  os_log_t v4;
  os_log_type_t v5;
  const char *v6;
  uint8_t *v7;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "unsignedIntValue");
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_26();
  _os_log_debug_impl(v3, v4, v5, v6, v7, 8u);

  OUTLINED_FUNCTION_1_1();
}

void WBSHTTPProtocolFromSecAttrProtocolValue_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "Not converting SecItem protocol string '%@' to NSURLProtectionSpace equivalent: Only HTTP and HTTPS are supported.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void createLexiconWithLocale(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1B2621000, log, OS_LOG_TYPE_ERROR, "Failed to create %{public}@ LXLexiconRef: %{public}@", buf, 0x16u);

  OUTLINED_FUNCTION_0_3();
}

void ___ZL23regexForClassicPasswordv_block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_6(&dword_1B2621000, a2, a3, "Error creating password matching regex: %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_0_3();
}

void getAAAccountClassPrimary_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAAAccountClassPrimary(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("WBSPrimaryAppleAccountObserver.m"), 11, CFSTR("%s"), OUTLINED_FUNCTION_1_5());

  __break(1u);
}

void __getACMonitoredAccountStoreClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getACMonitoredAccountStoreClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WBSPrimaryAppleAccountObserver.m"), 14, CFSTR("Unable to find class %s"), "ACMonitoredAccountStore");

  __break(1u);
}

void AccountsLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AccountsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WBSPrimaryAppleAccountObserver.m"), 13, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAAAccountClassPrimarySymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AppleAccountLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WBSPrimaryAppleAccountObserver.m"), 10, CFSTR("%s"), *a1);

  __break(1u);
}

void WBSSetUpAccessToAppDataContainerWithIdentifier_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, a2, a3, "Refusing to grant a sandbox extension to the same identifier twice (id: %@)", a5, a6, a7, a8, 2u);
}

void WBSSetUpAccessToAppDataContainerWithIdentifier_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, a2, a3, "Error executing container query: %s", a5, a6, a7, a8, 2u);
}

void ___ZN12SafariShared25SuddenTerminationDisabler28disableSuddenTerminationTaskEv_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, a1, a3, "Could not begin background task", a5, a6, a7, a8, 0);
}

void ___ZN12SafariShared25SuddenTerminationDisabler28disableSuddenTerminationTaskEv_block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, a1, a3, "Could not begin new background task to replace existing background task", a5, a6, a7, a8, 0);
}

uint64_t sub_1B26D4080()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1B26D408C()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1B26D4098()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1B26D40A4()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1B26D40B0()
{
  return MEMORY[0x1E0CB01F8]();
}

uint64_t sub_1B26D40BC()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1B26D40C8()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1B26D40D4()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1B26D40E0()
{
  return MEMORY[0x1E0DF2250]();
}

uint64_t sub_1B26D40EC()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1B26D40F8()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1B26D4104()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1B26D4110()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1B26D411C()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1B26D4128()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1B26D4134()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1B26D4140()
{
  return MEMORY[0x1E0CB1950]();
}

uint64_t sub_1B26D414C()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1B26D4158()
{
  return MEMORY[0x1E0CB1990]();
}

uint64_t sub_1B26D4164()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1B26D4170()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1B26D417C()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1B26D4188()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1B26D4194()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1B26D41A0()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1B26D41AC()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1B26D41B8()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1B26D41C4()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1B26D41D0()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1B26D41DC()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1B26D41E8()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1B26D41F4()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1B26D4200()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1B26D420C()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1B26D4218()
{
  return MEMORY[0x1E0C91D50]();
}

uint64_t sub_1B26D4224()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1B26D4230()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1B26D423C()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1B26D4248()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1B26D4254()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1B26D4260()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1B26D426C()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1B26D4278()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1B26D4284()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1B26D4290()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1B26D429C()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1B26D42A8()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1B26D42B4()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1B26D42C0()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1B26D42CC()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1B26D42D8()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1B26D42E4()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1B26D42F0()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1B26D42FC()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1B26D4308()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1B26D4314()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1B26D4320()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1B26D432C()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1B26D4338()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1B26D4344()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1B26D4350()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1B26D435C()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1B26D4368()
{
  return MEMORY[0x1E0DEDEE8]();
}

uint64_t sub_1B26D4374()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1B26D4380()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t AnalyticsIsEventUsed()
{
  return MEMORY[0x1E0D15408]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t CCECCryptorBlind()
{
  return MEMORY[0x1E0C80160]();
}

uint64_t CCECCryptorBlindingKeysRelease()
{
  return MEMORY[0x1E0C80168]();
}

uint64_t CCECCryptorExportKey()
{
  return MEMORY[0x1E0C80178]();
}

uint64_t CCECCryptorGenerateBlindingKeys()
{
  return MEMORY[0x1E0C80180]();
}

uint64_t CCECCryptorH2C()
{
  return MEMORY[0x1E0C80190]();
}

uint64_t CCECCryptorImportKey()
{
  return MEMORY[0x1E0C80198]();
}

uint64_t CCECCryptorRelease()
{
  return MEMORY[0x1E0C801A0]();
}

uint64_t CCECCryptorUnblind()
{
  return MEMORY[0x1E0C801B8]();
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
  MEMORY[0x1E0C801D8](*(_QWORD *)&algorithm, key, keyLength, data, dataLength, macOut);
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80308](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFMutableBitVectorRef CFBitVectorCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableBitVectorRef)MEMORY[0x1E0C97F68](allocator, capacity);
}

CFBit CFBitVectorGetBitAtIndex(CFBitVectorRef bv, CFIndex idx)
{
  return MEMORY[0x1E0C97F78](bv, idx);
}

void CFBitVectorSetBitAtIndex(CFMutableBitVectorRef bv, CFIndex idx, CFBit value)
{
  MEMORY[0x1E0C97FB0](bv, idx, *(_QWORD *)&value);
}

void CFBitVectorSetBits(CFMutableBitVectorRef bv, CFRange range, CFBit value)
{
  MEMORY[0x1E0C97FB8](bv, range.location, range.length, *(_QWORD *)&value);
}

void CFBitVectorSetCount(CFMutableBitVectorRef bv, CFIndex count)
{
  MEMORY[0x1E0C97FC0](bv, count);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x1E0C97FF8](bundle);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x1E0C98040](locArray, prefArray);
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x1E0C98060]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x1E0C98C80](rl, mode, block);
}

void CFRunLoopRun(void)
{
  MEMORY[0x1E0C98CA8]();
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D00](rl);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DF0](theSet, value);
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
  MEMORY[0x1E0C98EE8](theString, chars, numChars);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F18](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1E0C98F80](alloc, theString, *(_QWORD *)&encoding, lossByte);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FF8](alloc, chars, numChars, contentsDeallocator);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

void CFStringPad(CFMutableStringRef theString, CFStringRef padString, CFIndex length, CFIndex indexIntoPad)
{
  MEMORY[0x1E0C991E8](theString, padString, length, indexIntoPad);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1E0C99220](alloc, string, range.location, range.length, options, locale);
}

CFIndex CFStringTokenizerGetCurrentSubTokens(CFStringTokenizerRef tokenizer, CFRange *ranges, CFIndex maxRangeLength, CFMutableArrayRef derivedSubTokens)
{
  return MEMORY[0x1E0C99228](tokenizer, ranges, maxRangeLength, derivedSubTokens);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x1E0C99230](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

CFStringTokenizerTokenType CFStringTokenizerGoToTokenAtIndex(CFStringTokenizerRef tokenizer, CFIndex index)
{
  return MEMORY[0x1E0C99238](tokenizer, index);
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
  MEMORY[0x1E0C99240](tokenizer, string, range.location, range.length);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
  MEMORY[0x1E0C99258](theString);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1E0CFA6C0]();
}

uint64_t LXEntryCopyString()
{
  return MEMORY[0x1E0D435C8]();
}

uint64_t LXEntryGetCategoryFlags()
{
  return MEMORY[0x1E0D435F0]();
}

uint64_t LXEntryGetMetaFlags()
{
  return MEMORY[0x1E0D43600]();
}

uint64_t LXEntryGetProbability()
{
  return MEMORY[0x1E0D43618]();
}

uint64_t LXLexiconCreate()
{
  return MEMORY[0x1E0D43690]();
}

uint64_t LXLexiconEnumerateEntriesForString()
{
  return MEMORY[0x1E0D436B8]();
}

uint64_t MGCancelNotifications()
{
  return MEMORY[0x1E0DE2B18]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

uint64_t MGRegisterForUpdates()
{
  return MEMORY[0x1E0DE2BA8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x1E0CD5EA8](allocator, protection, flags, error);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6290](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1E0CD62A0](query);
}

uint64_t SecItemShareWithGroup()
{
  return MEMORY[0x1E0CD62D0]();
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1E0CD62D8](query, attributesToUpdate);
}

uint64_t SecItemUpdateWithError()
{
  return MEMORY[0x1E0CD62E0]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A0](rnd, count, bytes);
}

uint64_t SecTaskCopyTeamIdentifier()
{
  return MEMORY[0x1E0CD65E8]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1E0C99F70]();
}

uint64_t _CFBundleCopyFrameworkURLForExecutablePath()
{
  return MEMORY[0x1E0C99FA0]();
}

uint64_t _CFHostGetTopLevelDomain()
{
  return MEMORY[0x1E0C92EA0]();
}

uint64_t _NSErrorWithFilePathAndErrno()
{
  return MEMORY[0x1E0CB3BD8]();
}

uint64_t _NSErrorWithFilePathErrnoVariantAndExtraUserInfo()
{
  return MEMORY[0x1E0CB3BE8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return (const char *)MEMORY[0x1E0DE4190](this);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4308](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x1E0DE4338](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4470](this, __pos, __s, __n);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x1E0DE4590]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x1E0DE45A8]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x1E0DE45B0]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x1E0DE4620]();
}

{
  return MEMORY[0x1E0DE4628]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1E0DE4D58](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1E0DE4D70](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1E0DE4D88]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E6499610(__p);
}

uint64_t operator delete()
{
  return off_1E6499618();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E6499620(__sz);
}

uint64_t operator new()
{
  return off_1E6499628();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1E0C80C40]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C78](*(_QWORD *)&a1);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
  MEMORY[0x1E0C80FD0](dso, description, *(_QWORD *)&flags, activity_block);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t ccscrypt()
{
  return MEMORY[0x1E0C823C0]();
}

uint64_t ccscrypt_storage_size()
{
  return MEMORY[0x1E0C823C8]();
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1E0C826D8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t container_copy_sandbox_token()
{
  return MEMORY[0x1E0C827E8]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x1E0C82868]();
}

uint64_t container_query_create()
{
  return MEMORY[0x1E0C829B8]();
}

uint64_t container_query_free()
{
  return MEMORY[0x1E0C829C8]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x1E0C829D0]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x1E0C829D8]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x1E0C829E8]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x1E0C829F8]();
}

uint64_t container_query_set_identifiers()
{
  return MEMORY[0x1E0C82A08]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x1E0C82A18]();
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE92C0](strm, *(_QWORD *)&flush);
}

uLong deflateBound(z_streamp strm, uLong sourceLen)
{
  return MEMORY[0x1E0DE92C8](strm, sourceLen);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE92D0](strm);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE92E0](strm, *(_QWORD *)&level, version, *(_QWORD *)&stream_size);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x1E0C82C58](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E20](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F80](source);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1E0C82FC8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int dprintf(int a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83068](*(_QWORD *)&a1, a2);
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x1E0C83100]();
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int flock(int a1, int a2)
{
  return MEMORY[0x1E0C83400](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void freeaddrinfo(addrinfo *a1)
{
  MEMORY[0x1E0C834C0](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x1E0C835F8](a1, a2, a3, a4);
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return MEMORY[0x1E0C836C0](a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1E0C83970](*(_QWORD *)&a1, a2, a3);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE93A0](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE93B8](strm);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE93D0](strm, version, *(_QWORD *)&stream_size);
}

lconv *localeconv(void)
{
  return (lconv *)MEMORY[0x1E0C83B98]();
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

uint64_t malloc_get_all_zones()
{
  return MEMORY[0x1E0C83EA0]();
}

const char *__cdecl malloc_get_zone_name(malloc_zone_t *zone)
{
  return (const char *)MEMORY[0x1E0C83EA8](zone);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void malloc_zone_statistics(malloc_zone_t *zone, malloc_statistics_t *stats)
{
  MEMORY[0x1E0C83FA8](zone, stats);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return MEMORY[0x1E0C84168](*(_QWORD *)&a1, a2, a3);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1E0C84170](a1);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1E0C844A0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1E0C84948]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1E0C84A00]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

uint64_t realpath_np()
{
  return MEMORY[0x1E0C85048]();
}

int renameatx_np(int a1, const char *a2, int a3, const char *a4, unsigned int a5)
{
  return MEMORY[0x1E0C85110](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1E0C85138](a1);
}

uint64_t sandbox_container_path_for_pid()
{
  return MEMORY[0x1E0C85190]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

SEL sel_getUid(const char *str)
{
  return (SEL)MEMORY[0x1E0DE80D0](str);
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x1E0C85328](__name, __value, *(_QWORD *)&__overwrite);
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return MEMORY[0x1E0C853E0](*(_QWORD *)&a1, a2, a3);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1E0C853F0](*(_QWORD *)&a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1E0C85450](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1E0DE8598](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1E0DE85A8](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1E0DE85B0](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x1E0DE8638](a1, *(_QWORD *)&ms);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8640](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8658](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE8678](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8690](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1E0DE86A0](a1, *(_QWORD *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE86C8](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1E0DE8790](*(_QWORD *)&a1);
}

char *__cdecl sqlite3_expanded_sql(sqlite3_stmt *pStmt)
{
  return (char *)MEMORY[0x1E0DE87A8](pStmt);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1E0DE87B0](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x1E0DE87D0](a1);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8820](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE88B0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return MEMORY[0x1E0DE8A98](db, zDb, *(_QWORD *)&eMode, pnLog, pnCkpt);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

uint64_t stringForCKErrorCode()
{
  return MEMORY[0x1E0C95428]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

double strtod(const char *a1, char **a2)
{
  double result;

  MEMORY[0x1E0C85618](a1, a2);
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85678](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1E0DF0F98]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

uint64_t xpc_add_bundle()
{
  return MEMORY[0x1E0C85DD8]();
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

