@implementation SBKeyboardFocusLockReason

- (_QWORD)_initReasonWithName:(uint64_t)a3 strength:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v6 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)SBKeyboardFocusLockReason;
    v7 = objc_msgSendSuper2(&v11, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 3, a2);
      a1[1] = a3;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)a1[2];
      a1[2] = v8;

    }
  }

  return a1;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_name, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[NSString isEqual:](self->_name, "isEqual:", v4[3])
    && self->_strength == v4[1];

  return v5;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

+ (id)appSwitcher
{
  return -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], CFSTR("appSwitcher"), 2);
}

+ (id)commandTab
{
  return -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], CFSTR("commandTab"), 2);
}

+ (id)controlCenter
{
  return -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], CFSTR("controlCenter"), 2);
}

+ (id)coverSheet
{
  return -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], CFSTR("coverSheet"), 2);
}

+ (id)coverSheetHostingApp
{
  return -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], CFSTR("coverSheetHostingApp"), 2);
}

+ (id)keyShortcutHUD
{
  return -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], CFSTR("keyShortcutHUD"), 2);
}

+ (id)modalBannerInLongLook
{
  return -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], CFSTR("modalBannerInLongLook"), 2);
}

+ (id)screenIsDim
{
  return -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], CFSTR("screenIsDim"), 2);
}

+ (id)systemModalAlert
{
  return -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], CFSTR("systemModalAlert"), 2);
}

+ (id)universalControl
{
  return -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], CFSTR("universalControl"), 2);
}

+ (id)accessibility:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  SBKeyboardFocusLockReason *v7;
  void *v8;
  _QWORD *v9;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_opt_class();
  v6 = (objc_class *)objc_opt_class();
  if (!v4)
  {
    NSStringFromClass(v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("subreason"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[SBKeyboardFocusLockReason accessibility:].cold.1(a2);
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0A51EB8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = (objc_class *)objc_msgSend(v4, "classForCoder");
    if (!v14)
      v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("subreason"), v15, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[SBKeyboardFocusLockReason accessibility:].cold.1(a2);
    goto LABEL_11;
  }

  v7 = [SBKeyboardFocusLockReason alloc];
  objc_msgSend(CFSTR("accessibility-"), "stringByAppendingString:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBKeyboardFocusLockReason _initReasonWithName:strength:](v7, v8, 2);

  return v9;
}

+ (id)activeTransientOverlay
{
  return -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], CFSTR("activeTransientOverlay"), 1);
}

+ (id)addWidgetSheet
{
  return -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], CFSTR("addWidgetSheet"), 1);
}

+ (id)floatingDock
{
  return -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], CFSTR("floatingDock"), 1);
}

+ (id)modalAppLibrary
{
  return -[SBKeyboardFocusLockReason _initReasonWithName:strength:]([SBKeyboardFocusLockReason alloc], CFSTR("modalAppLibrary"), 1);
}

+ (int64_t)maximumStrengthInSet:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v3);
      v9 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "strength", (_QWORD)v11);
      if (v9 > v6)
      {
        v6 = v9;
        if (v9 == 2)
          break;
      }
      if (v5 == ++v8)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isMoreRecentThanReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBKeyboardFocusLockReason timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "compare:", v6) == 1;
  return (char)v4;
}

+ (id)mostRecentReasonInSet:(id)a3 strength:(int64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "strength") == a4)
        {
          if (v8)
          {
            if (objc_msgSend(v11, "isMoreRecentThanReason:", v8))
            {
              v12 = v11;

              v8 = v12;
            }
          }
          else
          {
            v8 = v11;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBKeyboardFocusLockReason *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__SBKeyboardFocusLockReason_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E8E9E820;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

id __55__SBKeyboardFocusLockReason_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), 0);
  v3 = *(void **)(a1 + 32);
  NSStringFromSBKeyboardFocusLockReasonStrength(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, 0);

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("date"));
}

- (int64_t)strength
{
  return self->_strength;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

+ (void)accessibility:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
