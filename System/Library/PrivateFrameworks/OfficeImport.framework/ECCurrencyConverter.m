@implementation ECCurrencyConverter

+ (id)currencyConverter
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (id)lassoCurrencyCodeFromXl:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;

  v4 = a3;
  if (!self->mXlToLassoCurrencyCode)
    -[ECCurrencyConverter populateDictionaries](self, "populateDictionaries");
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("$")))
  {
    -[ECCurrencyConverter lassoCurrencyCodeForDollar](self, "lassoCurrencyCodeForDollar");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("$USD")) & 1) != 0)
    {
      v6 = CFSTR("USD");
      goto LABEL_13;
    }
    if (objc_msgSend(v4, "rangeOfString:", CFSTR("€")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = CFSTR("EUR");
      goto LABEL_13;
    }
    v7 = objc_msgSend(v4, "rangeOfString:", CFSTR("-"));
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v4, "substringFromIndex:", 1);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (-[__CFString length](v6, "length"))
        goto LABEL_13;
    }
    else
    {
      objc_msgSend(v4, "substringFromIndex:", v7 + v8);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (-[__CFString length](v10, "length"))
      {
        -[NSMutableDictionary objectForKey:](self->mXlToLassoCurrencyCode, "objectForKey:", v10);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {

          goto LABEL_13;
        }
      }
      v6 = v10;
    }

    if (objc_msgSend(v4, "length") != 3)
      goto LABEL_22;
    objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13)
      goto LABEL_22;
    objc_msgSend(MEMORY[0x24BDBCEA0], "ISOCurrencyCodes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", v4);

    if (v15)
    {
      v5 = (__CFString *)v4;
    }
    else
    {
LABEL_22:
      if (!objc_msgSend(v4, "length"))
      {
        v6 = 0;
        goto LABEL_13;
      }
      -[NSMutableDictionary objectForKey:](self->mXlToLassoCurrencyCodeBySymbol, "objectForKey:", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  v6 = v5;
LABEL_13:

  return v6;
}

- (id)xlCurrencyCodeFromLasso:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  if (!self->mLassoToXlCurrencyCode)
    -[ECCurrencyConverter populateDictionaries](self, "populateDictionaries");
  +[OITSULocale currentLocale](OITSULocale, "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currencyCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", v6) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("KRW")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("JPY")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("TWD")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("USD")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("THB")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("INR")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("EUR")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("GBP")) & 1) == 0
    && !objc_msgSend(v4, "isEqualToString:", CFSTR("BRL")))
  {
    goto LABEL_19;
  }
  -[NSMutableDictionary objectForKey:](self->mLassoToXlCurrencyCode, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("\"$\")))
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[$%@]"), v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_19:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[$%@]"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  v8 = v7;
LABEL_17:
  v9 = v8;

LABEL_18:
  return v9;
}

- (int)xlAccountFormatFromLasso:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  if (!self->mLassoToXlCurrencyCode)
    -[ECCurrencyConverter populateDictionaries](self, "populateDictionaries");
  -[NSMutableDictionary objectForKey:](self->mXlAccountingFormat, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "intValue");
  else
    v7 = 0;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mXlToLassoCurrencyCodeBySymbol, 0);
  objc_storeStrong((id *)&self->mXlAccountingFormat, 0);
  objc_storeStrong((id *)&self->mLassoToXlCurrencyCode, 0);
  objc_storeStrong((id *)&self->mXlToLassoCurrencyCode, 0);
}

- (void)populateDictionaries
{
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *mXlToLassoCurrencyCode;
  NSMutableDictionary *v6;
  NSMutableDictionary *mXlToLassoCurrencyCodeBySymbol;
  NSMutableDictionary *v8;
  NSMutableDictionary *mLassoToXlCurrencyCode;
  NSMutableDictionary *v10;
  NSMutableDictionary *mXlAccountingFormat;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t i;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  uint64_t j;
  _QWORD v24[140];

  v24[138] = *MEMORY[0x24BDAC8D0];
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("AED"), 14337, CFSTR("د.إ.\u200F"));
  v24[0] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("ALL"), 1052, CFSTR("Lek"));
  v24[1] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("AMD"), 1067, CFSTR("դր"));
  v24[2] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("ARS"), 11274, CFSTR("$"));
  v24[3] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:accountingFormat:", CFSTR("AUD"), 3081, CFSTR("$"), 1);
  v24[4] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("AZM"), 2092, CFSTR("ман."), 0);
  v24[5] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("AZM"), 1068, CFSTR("man."));
  v24[6] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("BAM"), 4122, CFSTR("KM"), 0);
  v24[7] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("BAM"), 5146, CFSTR("KM"), 0);
  v24[8] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("BAM"), 6170, CFSTR("KM"));
  v24[9] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("BGN"), 1026, CFSTR("лв"));
  v24[10] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("BHD"), 15361, CFSTR("د.ب.\u200F"));
  v24[11] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("BND"), 2110, CFSTR("$"));
  v24[12] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("BOB"), 1131, CFSTR("$b"), 0);
  v24[13] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("BOB"), 16394, CFSTR("$b"));
  v24[14] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("BRL"), 1046, CFSTR("R$"));
  v24[15] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("BYR"), 1059, CFSTR("р."));
  v24[16] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("BZD"), 10249, CFSTR("BZ$"));
  v24[17] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:accountingFormat:", CFSTR("CAD"), 4105, CFSTR("$"), 1);
  v24[18] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:", CFSTR("CAD"), 3084, CFSTR("$"), 0, 8);
  v24[19] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:accountingFormat:", CFSTR("CHF"), 4108, CFSTR("SFr."), 3);
  v24[20] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("CHF"), 5127, CFSTR("CHF"), 0);
  v24[21] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("CHF"), 2064, CFSTR("SFr."), 0);
  v24[22] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("CHF"), 2055, CFSTR("SFr."), 0);
  v24[23] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("CLP"), 13322, CFSTR("$"));
  v24[24] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("CNY"), 2052, CFSTR("￥"));
  v24[25] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("COP"), 9226, CFSTR("$"));
  v24[26] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("CRC"), 5130, CFSTR("₡"));
  v24[27] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("CSD"), 3098, CFSTR("Дин."), 0);
  v24[28] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("CSD"), 2074, CFSTR("Din."));
  v24[29] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("CSD"), 7194, CFSTR("КМ"), 0);
  v24[30] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Kč"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:accountingFormat:", CFSTR("CZK"), 1029, v3, 9);
  v24[31] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("DKK"), 1030, CFSTR("kr"));
  v24[32] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("DKK"), 1080, CFSTR("kr"), 0);
  v24[33] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("DOP"), 7178, CFSTR("RD$"));
  v24[34] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("DZD"), 5121, CFSTR("د.ج.\u200F"));
  v24[35] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("EEK"), 1061, CFSTR("kr"));
  v24[36] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("EGP"), 3073, CFSTR("ج.م.\u200F"));
  v24[37] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("EUR"), 2, CFSTR("€"));
  v24[38] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:", CFSTR("EUR"), 1, CFSTR("€"), 0, 8);
  v24[39] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:", CFSTR("EUR"), 3079, CFSTR("€"), 0, 1);
  v24[40] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:", CFSTR("EUR"), 2067, CFSTR("€"), 0, 9);
  v24[41] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:", CFSTR("EUR"), 2077, CFSTR("€"), 0, 9);
  v24[42] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:", CFSTR("EUR"), 1036, CFSTR("€"), 0, 9);
  v24[43] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:", CFSTR("EUR"), 1031, CFSTR("€"), 0, 9);
  v24[44] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:", CFSTR("EUR"), 1032, CFSTR("€"), 0, 9);
  v24[45] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:", CFSTR("EUR"), 6153, CFSTR("€"), 0, 1);
  v24[46] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:", CFSTR("EUR"), 1040, CFSTR("€"), 0, 1);
  v24[47] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:", CFSTR("EUR"), 1043, CFSTR("€"), 0, 5);
  v24[48] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:", CFSTR("EUR"), 2070, CFSTR("€"), 0, 1);
  v24[49] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:", CFSTR("EUR"), 3082, CFSTR("€"), 0, 1);
  v24[50] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("GEL"), 1079, CFSTR("Lari"));
  v24[51] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:accountingFormat:", CFSTR("GBP"), 2057, CFSTR("£"), 1);
  v24[52] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("GBP"), 1106, CFSTR("£"), 0);
  v24[53] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("GTQ"), 4106, CFSTR("Q"));
  v24[54] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("HKD"), 3076, CFSTR("HK$"));
  v24[55] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("HNL"), 18442, CFSTR("L."));
  v24[56] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("HRK"), 1050, CFSTR("kn"));
  v24[57] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:accountingFormat:", CFSTR("HUF"), 1038, CFSTR("Ft"), 9);
  v24[58] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("IDR"), 1057, CFSTR("Rp"));
  v24[59] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("ILS"), 1037, CFSTR("₪"));
  v24[60] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("ILR"), 1081, CFSTR("रु"));
  v24[61] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("ILR"), 1099, CFSTR("ರೂ"), 0);
  v24[62] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("ILR"), 1111, CFSTR("रु"), 0);
  v24[63] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("ILR"), 1100, CFSTR("ക"), 0);
  v24[64] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("ILR"), 1102, CFSTR("रु"), 0);
  v24[65] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("ILR"), 1098, CFSTR("రూ"), 0);
  v24[66] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:accountingFormat:", CFSTR("ISK"), 1039, CFSTR("kr."), 9);
  v24[67] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("IQD"), 2049, CFSTR("د.ع.\u200F"));
  v24[68] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("JMD"), 8201, CFSTR("J$"));
  v24[69] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("JOD"), 11265, CFSTR("د.ا.\u200F"));
  v24[70] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:accountingFormat:", CFSTR("JPY"), 1041, CFSTR("¥"), 1);
  v24[71] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("KGS"), 1088, CFSTR("сом"));
  v24[72] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:accountingFormat:", CFSTR("KRW"), 1042, CFSTR("₩"), 1);
  v24[73] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("KWD"), 13313, CFSTR("د.ك.\u200F"));
  v24[74] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("KZT"), 1087, CFSTR("Т"));
  v24[75] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("LBP"), 12289, CFSTR("ل.ل.\u200F"));
  v24[76] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("LTL"), 1063, CFSTR("Lt"));
  v24[77] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("LVL"), 1062, CFSTR("Ls"));
  v24[78] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("LYD"), 4097, CFSTR("د.ل.\u200F"));
  v24[79] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("MAD"), 6145, CFSTR("د.م.\u200F"));
  v24[80] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("MKD"), 1071, CFSTR("ден."));
  v24[81] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("MNT"), 1104, CFSTR("₮"));
  v24[82] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("MOP"), 5124, CFSTR("P"));
  v24[83] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("MTL"), 1082, CFSTR("Lm"));
  v24[84] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("MXN"), 2058, CFSTR("$"));
  v24[85] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("MYR"), 1086, CFSTR("R"));
  v24[86] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("NIO"), 19466, CFSTR("C$"));
  v24[87] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:accountingFormat:", CFSTR("NOK"), 1044, CFSTR("kr"), 3);
  v24[88] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("NOK"), 2068, CFSTR("kr"), 0);
  v24[89] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("NOK"), 1083, CFSTR("kr"), 0);
  v24[90] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("NOK"), 4155, CFSTR("kr"), 0);
  v24[91] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("NOK"), 6203, CFSTR("kr"), 0);
  v24[92] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:accountingFormat:", CFSTR("NZD"), 5129, CFSTR("$"), 1);
  v24[93] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("NZD"), 1153, CFSTR("$"), 0);
  v24[94] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("OMR"), 8193, CFSTR("ر.ع.\u200F"));
  v24[95] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("PAB"), 6154, CFSTR("B/."));
  v24[96] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("PEN"), 10250, CFSTR("S/."));
  v24[97] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("PEN"), 3179, CFSTR("S/."), 0);
  v24[98] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("PHP"), 13321, CFSTR("Php"));
  v24[99] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:accountingFormat:", CFSTR("PLN"), 1045, CFSTR("zł"), 9);
  v24[100] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("PYG"), 15370, CFSTR("Gs"));
  v24[101] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("QAR"), 16385, CFSTR("ر.ق.\u200F"));
  v24[102] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("RON"), 1048, CFSTR("lei"));
  v24[103] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:accountingFormat:", CFSTR("RUB"), 1049, CFSTR("р."), 9);
  v24[104] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("SEK"), 5179, CFSTR("kr"), 0);
  v24[105] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("SEK"), 2107, CFSTR("kr"), 0);
  v24[106] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("SEK"), 7227, CFSTR("kr"), 0);
  v24[107] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:accountingFormat:", CFSTR("SEK"), 1053, CFSTR("kr"), 9);
  v24[108] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("SGD"), 4100, CFSTR("$"));
  v24[109] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("SIT"), 1060, CFSTR("SIT"));
  v24[110] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:accountingFormat:", CFSTR("SKK"), 1051, CFSTR("Sk"), 9);
  v24[111] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("SYP"), 10241, CFSTR("ل.س.\u200F"));
  v24[112] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("THB"), 1054, CFSTR("฿"));
  v24[113] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("TND"), 7169, CFSTR("د.ت.\u200F"));
  v24[114] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:accountingFormat:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:accountingFormat:", CFSTR("TRY"), 1055, CFSTR("TL"), 9);
  v24[115] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("TTD"), 11273, CFSTR("TT$"));
  v24[116] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("TWD"), 1028, CFSTR("NT$"));
  v24[117] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("UAH"), 1058, CFSTR("грн."));
  v24[118] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("USD"), 1033, CFSTR("$"));
  v24[119] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("USD"), 2155, CFSTR("$"), 0);
  v24[120] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("USD"), 12298, CFSTR("$"), 0);
  v24[121] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("USD"), 17418, CFSTR("$"), 0);
  v24[122] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("USD"), 20490, CFSTR("$"), 0);
  v24[123] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("UYU"), 14346, CFSTR("$U"));
  v24[124] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("UZS"), 2115, CFSTR("сўм"), 0);
  v24[125] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("UZS"), 1091, CFSTR("su'm"));
  v24[126] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("VEB"), 8202, CFSTR("Bs"));
  v24[127] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("VND"), 1066, CFSTR("₫"));
  v24[128] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("XCD"), 9225, CFSTR("$"));
  v24[129] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("YER"), 9217, CFSTR("ر.ي.\u200F"));
  v24[130] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("ZAR"), 1078, CFSTR("R"), 0);
  v24[131] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("ZAR"), 7177, CFSTR("R"));
  v24[132] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("ZAR"), 1132, CFSTR("R"), 0);
  v24[133] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("ZAR"), 1074, CFSTR("R"), 0);
  v24[134] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("ZAR"), 1076, CFSTR("R"), 0);
  v24[135] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:isExport:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:isExport:", CFSTR("ZAR"), 1077, CFSTR("R"), 0);
  v24[136] = objc_claimAutoreleasedReturnValue();
  +[ECCurrencyEntry currencyWithLassoCode:langId:xlSymbol:](ECCurrencyEntry, "currencyWithLassoCode:langId:xlSymbol:", CFSTR("ZWD"), 12297, CFSTR("Z$"));
  v24[137] = objc_claimAutoreleasedReturnValue();

  v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  mXlToLassoCurrencyCode = self->mXlToLassoCurrencyCode;
  self->mXlToLassoCurrencyCode = v4;

  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  mXlToLassoCurrencyCodeBySymbol = self->mXlToLassoCurrencyCodeBySymbol;
  self->mXlToLassoCurrencyCodeBySymbol = v6;

  v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  mLassoToXlCurrencyCode = self->mLassoToXlCurrencyCode;
  self->mLassoToXlCurrencyCode = v8;

  v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  mXlAccountingFormat = self->mXlAccountingFormat;
  self->mXlAccountingFormat = v10;

  +[OITSULocale currentLocale](OITSULocale, "currentLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currencyCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[OITSUNumberFormatter currencySymbolForCurrencyCode:](OITSUNumberFormatter, "currencySymbolForCurrencyCode:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("$"));

  for (i = 0; i != 138; ++i)
  {
    v17 = (id)v24[i];
    -[NSMutableDictionary setValue:forKey:](self->mXlToLassoCurrencyCode, "setValue:forKey:", v17[1], v17[2]);
    if (*((_BYTE *)v17 + 32))
    {
      if (v15 && (objc_msgSend(v13, "isEqualToString:", v17[1]) & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\"%@\"), v17[3]);
        v18 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v17[3], v17[2]);
        v18 = objc_claimAutoreleasedReturnValue();
      }
      v19 = (void *)v18;
      -[NSMutableDictionary setValue:forKey:](self->mLassoToXlCurrencyCode, "setValue:forKey:", v18, v17[1]);

      if (*((_BYTE *)v17 + 32))
      {
        if (!*((_DWORD *)v17 + 9)
          || (v20 = self->mXlAccountingFormat,
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:"),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              -[NSMutableDictionary setValue:forKey:](v20, "setValue:forKey:", v21, v17[1]),
              v21,
              *((_BYTE *)v17 + 32)))
        {
          -[NSMutableDictionary objectForKey:](self->mXlToLassoCurrencyCodeBySymbol, "objectForKey:", v17[3]);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v22)
            -[NSMutableDictionary setValue:forKey:](self->mXlToLassoCurrencyCodeBySymbol, "setValue:forKey:", v17[1], v17[3]);
        }
      }
    }

  }
  for (j = 137; j != -1; --j)

}

- (id)lassoCurrencyCodeForDollar
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;

  +[OITSULocale currentLocale](OITSULocale, "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currencyCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[OITSUNumberFormatter currencySymbolForCurrencyCode:](OITSUNumberFormatter, "currencySymbolForCurrencyCode:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "rangeOfString:", CFSTR("$")) == 0x7FFFFFFFFFFFFFFFLL)
    v5 = CFSTR("USD");
  else
    v5 = v3;

  return v5;
}

@end
