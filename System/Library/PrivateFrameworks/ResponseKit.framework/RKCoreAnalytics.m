@implementation RKCoreAnalytics

+ (id)assignCoreAnalyticsCategory:(id)a3 forAction:(id)a4 withLanguageID:(id)a5
{
  id v7;
  id v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    if (v7 && (objc_msgSend(v7, "isEqualToString:", &stru_24C6B9E08) & 1) == 0)
    {
      v10 = CFSTR("StatementExpressEmotion");
      switch(RKLinguisticCategoryFromPreferenceKey(v7))
      {
        case 2:
        case 3:
        case 4:
        case 5:
          v12 = 2;
          goto LABEL_14;
        case 6:
        case 7:
        case 8:
        case 10:
        case 15:
        case 18:
        case 44:
        case 45:
          v11 = (__CFString *)v7;
          goto LABEL_15;
        case 11:
        case 12:
          v12 = 11;
          goto LABEL_14;
        case 13:
        case 14:
          v12 = 13;
          goto LABEL_14;
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
        case 28:
          v12 = 21;
          goto LABEL_14;
        case 34:
        case 35:
          break;
        case 37:
        case 38:
        case 39:
        case 42:
          v10 = CFSTR("StatementSpecialEvent");
          break;
        default:
          v12 = 0;
LABEL_14:
          RKLinguisticCategoryToPreferenceKey(v12);
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_15:
          v10 = v11;
          break;
      }
    }
    else
    {
      v10 = CFSTR("allCategories");
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)sendCoreAnalyticsEvent:(id)a3 forAction:(id)a4 withLanguageID:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a1, "assignCoreAnalyticsCategory:forAction:withLanguageID:", a3, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v8 && v9 && v10)
  {
    v12 = v8;
    v13 = v9;
    v14 = v11;
    AnalyticsSendEventLazy();

  }
}

id __67__RKCoreAnalytics_sendCoreAnalyticsEvent_forAction_withLanguageID___block_invoke(uint64_t a1)
{
  __int128 v1;
  _QWORD v3[3];
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = *(_OWORD *)(a1 + 32);
  v3[0] = CFSTR("ACTION");
  v3[1] = CFSTR("LOCALE");
  v4 = v1;
  v3[2] = CFSTR("CATEGORY");
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
