@implementation PBFPowerLogger

+ (signed)powerLogClientIdentifier
{
  return 135;
}

+ (void)logUpdate:(int64_t)a3 reason:(int64_t)a4
{
  objc_msgSend(a1, "logUpdate:reason:inServiceOfBundleIdentifier:", a3, a4, 0);
}

+ (void)logUpdate:(int64_t)a3 reason:(int64_t)a4 inServiceOfBundleIdentifier:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  void (*v19)(uint64_t, const __CFString *, void *, _QWORD);
  void *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;
  _BYTE buf[24];
  void *v26;
  uint64_t *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (v9)
  {
    NSClassFromString(CFSTR("NSString"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        +[PBFPowerLogger logUpdate:reason:inServiceOfBundleIdentifier:].cold.2(a2, (uint64_t)a1, (uint64_t)v20);
      objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBA58F14);
    }
  }

  v10 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("updateType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("Reason"));

  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v14;
  }
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("BundleID"));
  PBFLogPower();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a3 - 1) > 3)
      v16 = CFSTR("PBFPowerLogUpdateTypeStaticDescriptors");
    else
      v16 = off_1E86F4A30[a3 - 1];
    if ((unint64_t)(a4 - 1) > 5)
      v17 = CFSTR("PBFPowerLogReasonUserViewed");
    else
      v17 = off_1E86F4A50[a4 - 1];
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2112;
    v26 = v9;
    _os_log_impl(&dword_1CB9FA000, v15, OS_LOG_TYPE_DEFAULT, "logUpdate:%{public}@ reason:%{public}@ inServiceOfBundleIdentifier:%@", buf, 0x20u);
  }

  v18 = objc_msgSend(a1, "powerLogClientIdentifier");
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v19 = (void (*)(uint64_t, const __CFString *, void *, _QWORD))getPLLogRegisteredEventSymbolLoc_ptr;
  v24 = getPLLogRegisteredEventSymbolLoc_ptr;
  if (!getPLLogRegisteredEventSymbolLoc_ptr)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getPLLogRegisteredEventSymbolLoc_block_invoke;
    v26 = &unk_1E86F2990;
    v27 = &v21;
    __getPLLogRegisteredEventSymbolLoc_block_invoke((uint64_t)buf);
    v19 = (void (*)(uint64_t, const __CFString *, void *, _QWORD))v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v19)
    +[PBFPowerLogger logUpdate:reason:inServiceOfBundleIdentifier:].cold.1();
  v19(v18, CFSTR("PosterUpdates"), v10, 0);

}

+ (void)logUpdate:reason:inServiceOfBundleIdentifier:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void Soft_PLLogRegisteredEvent(PLClientID, CFStringRef, CFDictionaryRef, CFArrayRef)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBFPowerLogger.m"), 39, CFSTR("%s"), dlerror());

  __break(1u);
}

+ (void)logUpdate:(const char *)a1 reason:(uint64_t)a2 inServiceOfBundleIdentifier:(uint64_t)a3 .cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("PBFPowerLogger.m");
  v16 = 1024;
  v17 = 73;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1CB9FA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
