@implementation PKPassPreferencesManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PKPassPreferencesManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_240 != -1)
    dispatch_once(&_MergedGlobals_240, block);
  return (id)qword_1ECF22618;
}

void __42__PKPassPreferencesManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECF22618;
  qword_1ECF22618 = (uint64_t)v1;

}

- (void)removeAllPreferencesForPassWithUniqueID:(id)a3
{
  id v4;

  v4 = a3;
  -[PKPassPreferencesManager _removeValueForKey:passUniqueID:](self, "_removeValueForKey:passUniqueID:", CFSTR("LowBalanceReminderAmount"), v4);
  -[PKPassPreferencesManager _removeValueForKey:passUniqueID:](self, "_removeValueForKey:passUniqueID:", CFSTR("LowBalanceReminderCurrency"), v4);
  -[PKPassPreferencesManager _removeValueForKey:passUniqueID:](self, "_removeValueForKey:passUniqueID:", CFSTR("CommutePlanRenewalReminderInterval"), v4);

  -[PKPassPreferencesManager _synchronize](self, "_synchronize");
}

- (void)removeAllPreferences
{
  const __CFString *v3;
  const __CFString *v4;
  CFArrayRef v5;
  const __CFArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v4 = (const __CFString *)*MEMORY[0x1E0C9B230];
  v5 = CFPreferencesCopyKeyList(CFSTR("com.apple.PassKit.passes"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = -[__CFArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        CFPreferencesSetValue(*(CFStringRef *)(*((_QWORD *)&v11 + 1) + 8 * v10++), 0, CFSTR("com.apple.PassKit.passes"), v3, v4);
      }
      while (v8 != v10);
      v8 = -[__CFArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  -[PKPassPreferencesManager _synchronize](self, "_synchronize", (_QWORD)v11);
}

- (void)setHasDoneExpressUpgrade:(BOOL)a3
{
  const void *v3;

  v3 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  CFPreferencesSetValue(CFSTR("PassExpressUpgrade"), v3, CFSTR("com.apple.PassKit.passes"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
}

- (BOOL)hasDoneExpressUpgrade
{
  void *v2;
  char v3;

  v2 = (void *)CFPreferencesCopyValue(CFSTR("PassExpressUpgrade"), CFSTR("com.apple.PassKit.passes"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)_synchronize
{
  int v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = CFPreferencesSynchronize(CFSTR("com.apple.PassKit.passes"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  _CFPreferencesSetBackupDisabled();
  if (!v2)
  {
    PKLogFacilityTypeGetObject(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_18FC92000, v3, OS_LOG_TYPE_ERROR, "Pass preferences failed to synchronize", v4, 2u);
    }

  }
}

- (void)_setDouble:(double)a3 forKey:(id)a4 passUniqueID:(id)a5
{
  __CFString *v6;
  const void *v7;

  v6 = -[PKPassPreferencesManager _cfPreferencesKeyForConstant:passUniqueID:](self, "_cfPreferencesKeyForConstant:passUniqueID:", a4, a5);
  v7 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  CFPreferencesSetValue(v6, v7, CFSTR("com.apple.PassKit.passes"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
}

- (double)_doubleForKey:(id)a3 passUniqueID:(id)a4
{
  __CFString *v4;
  void *v5;
  double v6;
  double v7;

  v4 = -[PKPassPreferencesManager _cfPreferencesKeyForConstant:passUniqueID:](self, "_cfPreferencesKeyForConstant:passUniqueID:", a3, a4);
  v5 = (void *)CFPreferencesCopyValue(v4, CFSTR("com.apple.PassKit.passes"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)_setDecimalNumber:(id)a3 forKey:(id)a4 passUniqueID:(id)a5
{
  id v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v8 = a3;
  v9 = -[PKPassPreferencesManager _cfPreferencesKeyForConstant:passUniqueID:](self, "_cfPreferencesKeyForConstant:passUniqueID:", a4, a5);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = PKCurrencyDecimalToLegacyStorageInteger(v8, 0);

  objc_msgSend(v10, "numberWithLongLong:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetValue(v9, v12, CFSTR("com.apple.PassKit.passes"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);

}

- (id)_decimalNumberForKey:(id)a3 passUniqueID:(id)a4
{
  __CFString *v4;
  void *v5;
  void *v6;

  v4 = -[PKPassPreferencesManager _cfPreferencesKeyForConstant:passUniqueID:](self, "_cfPreferencesKeyForConstant:passUniqueID:", a3, a4);
  v5 = (void *)CFPreferencesCopyValue(v4, CFSTR("com.apple.PassKit.passes"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  PKLegacyCurrencyStorageIntegerToDecimal(objc_msgSend(v5, "unsignedLongLongValue"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_setString:(id)a3 forKey:(id)a4 passUniqueID:(id)a5
{
  __CFString *v8;
  id value;

  value = a3;
  v8 = -[PKPassPreferencesManager _cfPreferencesKeyForConstant:passUniqueID:](self, "_cfPreferencesKeyForConstant:passUniqueID:", a4, a5);
  CFPreferencesSetValue(v8, value, CFSTR("com.apple.PassKit.passes"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);

}

- (id)_stringForKey:(id)a3 passUniqueID:(id)a4
{
  __CFString *v4;

  v4 = -[PKPassPreferencesManager _cfPreferencesKeyForConstant:passUniqueID:](self, "_cfPreferencesKeyForConstant:passUniqueID:", a3, a4);
  return (id)(id)CFPreferencesCopyValue(v4, CFSTR("com.apple.PassKit.passes"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
}

- (void)_removeValueForKey:(id)a3 passUniqueID:(id)a4
{
  __CFString *v4;

  v4 = -[PKPassPreferencesManager _cfPreferencesKeyForConstant:passUniqueID:](self, "_cfPreferencesKeyForConstant:passUniqueID:", a3, a4);
  CFPreferencesSetValue(v4, 0, CFSTR("com.apple.PassKit.passes"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
}

- (__CFString)_cfPreferencesKeyForConstant:(id)a3 passUniqueID:(id)a4
{
  return (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), a4, a3);
}

- (id)lowBalanceReminderAmountForPassWithUniqueID:(id)a3
{
  return -[PKPassPreferencesManager _decimalNumberForKey:passUniqueID:](self, "_decimalNumberForKey:passUniqueID:", CFSTR("LowBalanceReminderAmount"), a3);
}

- (double)commutePlanRenewalReminderTimeIntervalForPassWithUniqueID:(id)a3
{
  double result;

  -[PKPassPreferencesManager _doubleForKey:passUniqueID:](self, "_doubleForKey:passUniqueID:", CFSTR("CommutePlanRenewalReminderInterval"), a3);
  return result;
}

@end
