@implementation NSString(CRSafeSubstring)

- (__CFString)safeSubstringWithRange:()CRSafeSubstring
{
  NSObject *v7;
  int v9;
  unint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a4)
    return &stru_1E98DC948;
  if (a3 < objc_msgSend(a1, "length") && a3 + a4 <= objc_msgSend(a1, "length"))
  {
    objc_msgSend(a1, "substringWithRange:", a3, a4);
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CROSLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218496;
      v10 = a3;
      v11 = 2048;
      v12 = a4;
      v13 = 2048;
      v14 = objc_msgSend(a1, "length");
      _os_log_impl(&dword_1D4FB8000, v7, OS_LOG_TYPE_FAULT, "safeSubstringWithRange: range out of bounds NSMakeRange(%lu, %lu), in string of length %lu", (uint8_t *)&v9, 0x20u);
    }

    return (__CFString *)0;
  }
}

@end
