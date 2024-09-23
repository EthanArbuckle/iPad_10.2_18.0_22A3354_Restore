void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x12u);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

id StocksAttributionString()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("yahooAttributionLogo"), v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageWithRenderingMode:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("STOCKS_ATTRIBUTION"), 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("STOCK"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "rangeOfString:options:", v4, 1);
  v7 = v6;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v3);
  if (v7)
  {
    if (MKBDeviceUnlockedSinceBoot() || MKBGetDeviceLockState() == 3)
    {
      +[NetPreferences sharedPreferences](NetPreferences, "sharedPreferences");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "backsideLogoURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v15)
          StocksAttributionString_cold_2(v15, v16, v17, v18, v19, v20, v21, v22);
        goto LABEL_11;
      }
      v11 = *MEMORY[0x24BDF6618];
      +[NetPreferences sharedPreferences](NetPreferences, "sharedPreferences");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "backsideLogoURL");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[NetPreferences sharedPreferences](NetPreferences, "sharedPreferences");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "defaultBacksideLogoURL");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        v30 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v30)
          StocksAttributionString_cold_3(v30, v31, v32, v33, v34, v35, v36, v37);
        goto LABEL_11;
      }
      v11 = *MEMORY[0x24BDF6618];
      +[NetPreferences sharedPreferences](NetPreferences, "sharedPreferences");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "defaultBacksideLogoURL");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v13;
    objc_msgSend(v8, "addAttribute:value:range:", v11, v13, v5, v7);

LABEL_11:
    objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x24BDF66D8], MEMORY[0x24BDBD1C8], v5, v7);
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    StocksAttributionString_cold_1((uint64_t)v4, (uint64_t)v3);
LABEL_12:
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR(" "));
  v24 = (void *)objc_opt_new();
  objc_msgSend(v24, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
  objc_msgSend(v24, "setImage:", v2);
  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");

  objc_msgSend(v26, "addAttribute:value:range:", *MEMORY[0x24BDF65D8], &unk_24D75EF98, 0, objc_msgSend(v26, "length"));
  objc_msgSend(v8, "appendAttributedString:", v23);
  objc_msgSend(v8, "appendAttributedString:", v26);

  return v8;
}

void sub_217373DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_217373F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217374450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t pseudoRandomFloatStringInRange(unint64_t a1, unint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f"), (float)((float)((float)random() / (float)(0x7FFFFFFF / a2)) + (float)a1));
}

id randomStringOfLength(uint64_t a1, int a2)
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1)
  {
    v5 = MEMORY[0x24BDACB70];
    do
    {
      if (a2)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c"), ((int)random() % 26 + 97));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
        v8 = random() % 0x7FFF;
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &v8, 4, 2617245952);
        if (!v6 && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v10 = v8;
          _os_log_impl(&dword_21736B000, v5, OS_LOG_TYPE_DEFAULT, "Got a bad character %#llX", buf, 0xCu);
        }
      }
      objc_msgSend(v4, "appendString:", v6);

      --a1;
    }
    while (a1);
  }
  return v4;
}

uint64_t stocksDidUpdateRemotely(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stocksDidUpdateRemotely");
}

void sub_217377D2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id StocksLogForCategory(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (StocksLogForCategory_onceToken != -1)
    dispatch_once(&StocksLogForCategory_onceToken, &__block_literal_global_4);
  v2 = (void *)StocksLogForCategory_loggingTypes;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x24BDACB70];
  v6 = v4;

  return v6;
}

void sub_21737C8BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

void __parseEntryIntoStruct_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("close")))
    {
      objc_msgSend(v7, "doubleValue");
      *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) = v8;
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("volume")))
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16) = objc_msgSend(v7, "longLongValue");
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

CFStringRef OAuthURLEncodedString(CFStringRef originalString)
{
  return objc_autoreleaseReturnValue((id)CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x24BDBD240], originalString, 0, CFSTR(":/?#[]@!$&’()*+,;='"),
                                           0x8000100u));
}

id ParameterString(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v1, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v1, "objectForKeyedSubscript:", v7);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        OAuthURLEncodedString(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), v7, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v11);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_compare_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR("&"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id ProductVersion()
{
  if (ProductVersion_onceToken != -1)
    dispatch_once(&ProductVersion_onceToken, &__block_literal_global_117);
  return (id)ProductVersion_ProductVersion;
}

id ClientInfo()
{
  if (ClientInfo_onceToken != -1)
    dispatch_once(&ClientInfo_onceToken, &__block_literal_global_118);
  return (id)ClientInfo_ClientInfo;
}

id DeviceInfo()
{
  if (DeviceInfo_onceToken != -1)
    dispatch_once(&DeviceInfo_onceToken, &__block_literal_global_121);
  return (id)DeviceInfo_DeviceInfo;
}

id _ConsumerSecret()
{
  if (_ConsumerSecret_onceToken != -1)
    dispatch_once(&_ConsumerSecret_onceToken, &__block_literal_global_124);
  return (id)_ConsumerSecret_ConsumerSecretString;
}

const __CFString *_ConsumerKey()
{
  return CFSTR("dj0yJmk9cU51ZlhUZ2ZneDBJJmQ9WVdrOU1rOVVlWE5vTkhNbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD1hNw--");
}

id CreateCredential()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BE6DF70]);
  objc_msgSend(v0, "setConsumerKey:", CFSTR("dj0yJmk9cU51ZlhUZ2ZneDBJJmQ9WVdrOU1rOVVlWE5vTkhNbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD1hNw--"));
  _ConsumerSecret();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setConsumerSecret:", v1);

  return v0;
}

void sub_2173816C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t ShouldSwapColorsForLocale(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (ShouldSwapColorsForLocale_onceToken != -1)
    dispatch_once(&ShouldSwapColorsForLocale_onceToken, &__block_literal_global_8);
  objc_msgSend(v1, "countryCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = objc_msgSend((id)ShouldSwapColorsForLocale_countryCodesToSwap, "containsObject:", v2);
  else
    v3 = 0;

  return v3;
}

void sub_2173887C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21738A728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21738C23C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21738C5C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21738FF34(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21739002C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void GizmoSettingsChanged(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = a2;
  +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronize");

  +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("stocks"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setLocalStockListFromSyncableStockList:", v6);
  objc_msgSend(v2, "saveListChanges");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", StockListDidChangeNotification, 0);

}

void StockWasModified(int a1, int a2, CFStringRef theString2)
{
  id v4;

  if (CFStringCompare((CFStringRef)StockWasAddedDarwinNotification, theString2, 0) == kCFCompareEqualTo)
  {
    +[StockManager sharedManager](StockManager, "sharedManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_checkForAddedStocks");
LABEL_8:

    return;
  }
  if (CFStringCompare((CFStringRef)StockWasMovedDarwinNotification, theString2, 0) == kCFCompareEqualTo)
  {
    +[StockManager sharedManager](StockManager, "sharedManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_checkForMovedStocks");
    goto LABEL_8;
  }
  if (CFStringCompare((CFStringRef)StockWasDeletedDarwinNotification, theString2, 0) == kCFCompareEqualTo)
  {
    +[StockManager sharedManager](StockManager, "sharedManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_checkForDeletedStocks");
    goto LABEL_8;
  }
}

void sub_21739FB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double RoundToPixel(double a1)
{
  double v2;
  void *v3;
  uint64_t v4;

  v2 = *(double *)&gScale;
  if (*(double *)&gScale == -1.0)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen", *(double *)&gScale);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    gScale = v4;

    v2 = *(double *)&gScale;
  }
  return round(v2 * a1) / v2;
}

double RoundRectToPixel(double a1)
{
  double v2;
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  uint64_t v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v2 = *(double *)&gScale;
  if (*(double *)&gScale == -1.0)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    gScale = v4;

    v2 = *(double *)&gScale;
  }
  v5 = v2;
  if (v2 == -1.0)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    gScale = v7;

    v5 = *(double *)&gScale;
  }
  v8 = v5;
  if (v5 == -1.0)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scale");
    gScale = v10;

    v8 = *(double *)&gScale;
  }
  if (v8 == -1.0)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    gScale = v12;

  }
  return round(a1 * v2) / v2;
}

double FloorToPixel(double a1)
{
  double v2;
  void *v3;
  uint64_t v4;

  v2 = *(double *)&gScale;
  if (*(double *)&gScale == -1.0)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen", *(double *)&gScale);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    gScale = v4;

    v2 = *(double *)&gScale;
  }
  return floor(v2 * a1) / v2;
}

double CeilToPixel(double a1)
{
  double v2;
  void *v3;
  uint64_t v4;

  v2 = *(double *)&gScale;
  if (*(double *)&gScale == -1.0)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen", *(double *)&gScale);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    gScale = v4;

    v2 = *(double *)&gScale;
  }
  return ceil(v2 * a1) / v2;
}

double RoundToPixelWatch(double a1)
{
  double v2;
  Class v3;
  void *v4;
  uint64_t v5;

  v2 = *(double *)&gScaleWatch;
  if (*(double *)&gScaleWatch == -1.0)
  {
    v3 = (Class)_WKInterfaceDevice;
    if (_WKInterfaceDevice)
      goto LABEL_5;
    if (!dlopen("/System/Library/Frameworks/WatchKit.framework/WatchKit", 2))
    {
      v3 = (Class)_WKInterfaceDevice;
      if (!_WKInterfaceDevice)
        return round(*(double *)&gScaleWatch * a1) / *(double *)&gScaleWatch;
      goto LABEL_5;
    }
    v3 = NSClassFromString(CFSTR("WKInterfaceDevice"));
    _WKInterfaceDevice = (uint64_t)v3;
    if (v3)
    {
LABEL_5:
      -[objc_class performSelector:](v3, "performSelector:", sel_currentDevice, v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "screenScale");
      gScaleWatch = v5;

    }
  }
  return round(*(double *)&gScaleWatch * a1) / *(double *)&gScaleWatch;
}

void sub_2173A2D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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

id SCKDatabaseLog()
{
  if (SCKDatabaseLog_onceToken != -1)
    dispatch_once(&SCKDatabaseLog_onceToken, &__block_literal_global_13);
  return (id)SCKDatabaseLog_databaseLog;
}

void sub_2173A77A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_2173A988C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_2173A9D44(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2173AB634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 208), 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_2173ABD90(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_2173AC21C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void StocksAttributionString_cold_1(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412802;
  v7 = a1;
  v8 = 2112;
  v9 = a2;
  v10 = 2112;
  v11 = v5;
  _os_log_error_impl(&dword_21736B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "#Attribution Warning! Missing (%@) from string (%@)! (Lang: %@)", (uint8_t *)&v6, 0x20u);

}

void StocksAttributionString_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21736B000, MEMORY[0x24BDACB70], a3, "#Attribution Warning! Missing backsideLogoURL", a5, a6, a7, a8, 0);
}

void StocksAttributionString_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21736B000, MEMORY[0x24BDACB70], a3, "#Attribution Warning! Missing defaultBacksideLogoURL", a5, a6, a7, a8, 0);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFTypeRef CFDateFormatterCopyProperty(CFDateFormatterRef formatter, CFDateFormatterKey key)
{
  return (CFTypeRef)MEMORY[0x24BDBBD38](formatter, key);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x24BDBBD40](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x24BDBBD68](allocator, formatter, date);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x24BDBC730](string, range, transform, reverse);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC838](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(_QWORD *)&encoding);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDCD0](c, x, y);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x24BDBDCE0](c, path);
}

void CGContextBeginPath(CGContextRef c)
{
  MEMORY[0x24BDBDD00](c);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x24BDBDD28](c);
}

void CGContextClosePath(CGContextRef c)
{
  MEMORY[0x24BDBDD48](c);
}

CGPathRef CGContextCopyPath(CGContextRef c)
{
  return (CGPathRef)MEMORY[0x24BDBDD88](c);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x24BDBDDF8](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGContextGetClipBoundingBox(CGContextRef c)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBDEA0](c);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDF20](c, x, y);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x24BDBDFB0](c, *(_QWORD *)&mode);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
  MEMORY[0x24BDBE020](c, *(_QWORD *)&cap);
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
  MEMORY[0x24BDBE028](c, lengths, count, phase);
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
  MEMORY[0x24BDBE030](c, *(_QWORD *)&join);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x24BDBE038](c, width);
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
  MEMORY[0x24BDBE088](c, shouldAntialias);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBE0D0](c, color);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x24BDBE118](c);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x24BDBE538](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x24BDBE550](gradient);
}

CGGradientRef CGGradientRetain(CGGradientRef gradient)
{
  return (CGGradientRef)MEMORY[0x24BDBE558](gradient);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF038]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CPDateFormatStringForFormatType()
{
  return MEMORY[0x24BE04670]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x24BE67140]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BDF6670]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BDF6678]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x24BDF7698](category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x24BDF7CB0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CPTimeFormatIs24HourMode()
{
  return MEMORY[0x24BE047B8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x24BDAC7D8](a1);
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x24BEDCEA0](cls, name);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x24BDADF98](source, value);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE798](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAB0](__x);
  return result;
}

float log10f(float a1)
{
  float result;

  MEMORY[0x24BDAEAB8](a1);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

IMP method_setImplementation(Method m, IMP imp)
{
  return (IMP)MEMORY[0x24BEDCF58](m, imp);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t random(void)
{
  return MEMORY[0x24BDAFA48]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x24BEDD500](sel);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAFD98](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

void srandom(unsigned int a1)
{
  MEMORY[0x24BDAFE98](*(_QWORD *)&a1);
}

