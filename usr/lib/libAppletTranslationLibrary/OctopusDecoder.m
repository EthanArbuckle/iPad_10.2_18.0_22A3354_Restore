@implementation OctopusDecoder

+ (id)getPurseBalance:(id)a3
{
  id v3;
  unsigned int *v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];

  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    v4 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", bswap32(*v4), 0xFFFFFFFFLL, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    ATLLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1C3511000, v6, OS_LOG_TYPE_DEFAULT, "Octopus Purse Service to decode did not have 16 bytes; aborting",
        v8,
        2u);
    }

    v5 = 0;
  }

  return v5;
}

+ (id)parseTLOGBlock:(id)a3 withBaseDate:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 *v8;
  uint64_t v9;
  uint64_t v10;
  signed int v11;
  unint64_t v12;
  double v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v33;
  unsigned int v34;
  id v35;
  uint8_t buf[4];
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v6))
  {
    ATLLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v28 = "Octopus TLOG block to decode did not have 16 bytes; aborting.";
LABEL_16:
      _os_log_impl(&dword_1C3511000, v14, OS_LOG_TYPE_DEFAULT, v28, buf, 2u);
    }
LABEL_17:
    v15 = 0;
    goto LABEL_20;
  }
  if (!v7)
  {
    ATLLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v28 = "Cannot parse TLOG block without a Base Date";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v35 = objc_retainAutorelease(v6);
  v8 = (unsigned __int8 *)objc_msgSend(v35, "bytes");
  v9 = *v8;
  v10 = v8[1] >> 1;
  v33 = *((unsigned __int16 *)v8 + 1);
  v11 = bswap32(*((_DWORD *)v8 + 1)) >> 3;
  v12 = +[SlalomUtils readBitsValueFromBuffer:bitPosition:length:](SlalomUtils, "readBitsValueFromBuffer:bitPosition:length:", v8, 61, 3);
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v13 + (double)v11);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("UTC"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTimeZone:", v17);

  objc_msgSend(v16, "components:fromDate:", 252, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("TransactionTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("TypeDetailRaw"));

  v34 = v9;
  objc_msgSend(a1, "getTransactionTypeStringFromCode:andServiceProviderID:", v10, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, CFSTR("TypeDetail"));

  if (objc_msgSend(a1, "isTransitTransactionCode:", v10))
  {
    objc_msgSend(a1, "getTransactionTypeModifierStringFromCode:", v10);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
    {
      v37[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, CFSTR("TypeModifiers"));

    }
  }
  v24 = __rev16(v33);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v25, CFSTR("AddValueTypeRaw"));

  if (v12 == 4)
    v26 = MEMORY[0x1E0C9AAB0];
  else
    v26 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v26, CFSTR("AddValueType"));
  if (v33)
    v27 = objc_msgSend(a1, "isTopUpTransaction:", v10);
  else
    v27 = 0;
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", v24, 0xFFFFFFFFLL, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v29, CFSTR("Amount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v34);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v30, CFSTR("MerchantCategoryCode"));

  CC_SHA256((const void *)objc_msgSend(objc_retainAutorelease(v35), "bytes"), 0x10u, buf);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", bswap32(*(unsigned int *)buf));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v31, CFSTR("SerialNumber"));

LABEL_20:
  return v15;
}

+ (id)injectTLOGAAVS:(id)a3 withAAVSAmount:(id)a4 andBalance:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  _QWORD v25[6];

  v25[5] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AddValueType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Amount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TransactionTime"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "compare:", &unk_1E7D9AD40) == 1)
      objc_msgSend(v9, "decimalNumberByAdding:", v12);
    else
      objc_msgSend(v9, "decimalNumberBySubtracting:", v12);
    v15 = objc_claimAutoreleasedReturnValue();

    +[HashHelper hashHelper]();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HashHelper addDictionary:](v16, v7);
    v17 = (char *)objc_claimAutoreleasedReturnValue();
    -[HashHelper getHash](v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "u32BE:", 0);

    v20 = objc_msgSend(v8, "BOOLValue");
    v25[0] = CFSTR("TopUpAuto");
    v24[0] = CFSTR("TypeDetail");
    v24[1] = CFSTR("Amount");
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", objc_msgSend(v8, "unsignedLongLongValue"), 0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v21;
    v25[2] = v13;
    v24[2] = CFSTR("TransactionTime");
    v24[3] = CFSTR("FinalBalance");
    v25[3] = v15;
    v24[4] = CFSTR("SerialNumber");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[4] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (id)v15;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)getLoyaltyBalance:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[16];

  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    v4 = +[SlalomUtils readBitsValueFromBuffer:bitPosition:length:](SlalomUtils, "readBitsValueFromBuffer:bitPosition:length:", objc_msgSend(objc_retainAutorelease(v3), "bytes"), 52, 18);
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    objc_msgSend(v5, "numberWithDouble:", v7 / 100.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    ATLLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1C3511000, v9, OS_LOG_TYPE_DEFAULT, "Octopus TLOG block to decode did not have 16 bytes; aborting.",
        v11,
        2u);
    }

    v8 = 0;
  }

  return v8;
}

+ (id)getNegativeValueLimit:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];

  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    v4 = +[SlalomUtils readBitsValueFromBuffer:bitPosition:length:](SlalomUtils, "readBitsValueFromBuffer:bitPosition:length:", objc_msgSend(objc_retainAutorelease(v3), "bytes"), 34, 10);
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", 10 * v4, 0xFFFFFFFFLL, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    ATLLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1C3511000, v6, OS_LOG_TYPE_DEFAULT, "Octopus Negative Value Limit data cannot be retrieved; block to decode did not have 16 bytes; aborting.",
        v8,
        2u);
    }

    v5 = 0;
  }

  return v5;
}

+ (id)getBaseDate:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t v15[16];

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length") == 16)
  {
    v5 = +[SlalomUtils readBitsValueFromBuffer:bitPosition:length:](SlalomUtils, "readBitsValueFromBuffer:bitPosition:length:", objc_msgSend(objc_retainAutorelease(v4), "bytes"), 80, 16);
    v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("UTC"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimeZone:", v8);

    objc_msgSend(v6, "setCalendar:", v7);
    objc_msgSend(v6, "setYear:", 2000);
    objc_msgSend(v6, "setMonth:", 1);
    objc_msgSend(v6, "setDay:", 1);
    objc_msgSend(v6, "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("UTC"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTimeZone:", v11);

    objc_msgSend(v10, "setDay:", v5);
    objc_msgSend(v7, "dateByAddingComponents:toDate:options:", v10, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    ATLLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1C3511000, v13, OS_LOG_TYPE_DEFAULT, "Octopus Base Date cannot be retrieved; block to decode did not have 16 bytes; aborting.",
        v15,
        2u);
    }

    v12 = 0;
  }

  return v12;
}

+ (id)getPhysicalID:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    objc_msgSend(v3, "subdataWithRange:", 4, 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    ATLLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C3511000, v5, OS_LOG_TYPE_DEFAULT, "Octopus Negative Value Limit data cannot be retrieved; block to decode did not have 16 bytes; aborting.",
        v7,
        2u);
    }

    v4 = 0;
  }

  return v4;
}

+ (id)getAAVSAmount:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];

  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    v4 = +[SlalomUtils readBitsValueFromBuffer:bitPosition:length:](SlalomUtils, "readBitsValueFromBuffer:bitPosition:length:", objc_msgSend(objc_retainAutorelease(v3), "bytes"), 48, 6);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 50 * v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    ATLLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1C3511000, v6, OS_LOG_TYPE_DEFAULT, "Octopus AAVS data cannot be retrieved; block to decode did not have 16 bytes; aborting.",
        v8,
        2u);
    }

    v5 = 0;
  }

  return v5;
}

+ (BOOL)isTopUpTransaction:(unsigned __int8)a3
{
  return (a3 < 0x21u) & (0x105647244uLL >> a3);
}

+ (id)getTransactionTypeModifierStringFromCode:(unsigned __int8)a3
{
  id result;

  result = 0;
  if ((int)a3 <= 25)
  {
    if (a3 != 2 && a3 != 21)
      return result;
    return CFSTR("FareAdjustment");
  }
  if (a3 == 32)
    return CFSTR("FareRebate");
  if (a3 == 26)
    return CFSTR("FareAdjustment");
  return result;
}

+ (int)isTransitTransactionCode:(unsigned __int8)a3
{
  int result;

  result = 1;
  if ((a3 > 0x20u || ((1 << a3) & 0x104BA003ELL) == 0)
    && ((a3 - 100) > 6 || ((1 << (a3 - 100)) & 0x65) == 0))
  {
    return 0;
  }
  return result;
}

+ (id)getTransactionTypeStringFromCode:(unsigned __int8)a3 andServiceProviderID:(unsigned __int8)a4
{
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;

  v6 = CFSTR("Purchase");
  switch(a3)
  {
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 0x11u:
    case 0x13u:
    case 0x14u:
    case 0x15u:
    case 0x17u:
    case 0x1Au:
    case 0x20u:
      goto LABEL_5;
    case 6u:
      return CFSTR("TopUpContactless");
    case 7u:
    case 8u:
    case 0xAu:
    case 0xBu:
    case 0xFu:
    case 0x10u:
      return v6;
    case 9u:
    case 0xDu:
    case 0xEu:
    case 0x12u:
    case 0x16u:
    case 0x18u:
      return CFSTR("TopUp");
    case 0xCu:
      return CFSTR("TopUpServer");
    case 0x19u:
    case 0x1Bu:
    case 0x1Cu:
    case 0x1Du:
    case 0x1Eu:
    case 0x1Fu:
      return CFSTR("Unknown");
    default:
      if ((a3 - 100) > 6 || ((1 << (a3 - 100)) & 0x65) == 0)
        return CFSTR("Unknown");
LABEL_5:
      objc_msgSend(a1, "getTransitTransactionTypeNameFromCode:andServiceProvider:", v4, v5);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v6;
  }
}

+ (id)getTransitTransactionTypeNameFromCode:(unsigned __int8)a3 andServiceProvider:(unsigned __int16)a4
{
  id result;
  char v5;

  if (a3 == 102 && a4 == 253 || a3 <= 0x1Au && ((1 << a3) & 0x4000018) != 0)
    return CFSTR("TransitBus");
  result = CFSTR("TransitTrain");
  if ((int)a4 <= 199)
  {
    v5 = a4 - 101;
    if ((a4 - 101) <= 0x39)
    {
      if (((1 << v5) & 0x281040F80000000) != 0)
        return CFSTR("TransitBus");
      if (((1 << v5) & 0x600000000000) != 0)
        return CFSTR("TransitOtherFerry");
      if (a4 == 101)
        return result;
    }
    switch(a4)
    {
      case 1u:
      case 2u:
        return result;
      case 3u:
        return CFSTR("TransitLightRail");
      case 4u:
      case 5u:
      case 7u:
        return CFSTR("TransitBus");
      case 6u:
        return CFSTR("TransitOtherFerry");
      default:
        return CFSTR("Transit");
    }
    return result;
  }
  if ((int)a4 > 248)
  {
    if (a4 != 250)
    {
      if (a4 == 249)
        return CFSTR("TransitLightRail");
      return CFSTR("Transit");
    }
    return CFSTR("TransitOtherFerry");
  }
  if (a4 != 200 && a4 != 248)
    return CFSTR("Transit");
  return result;
}

+ (int)isDenyListed:(id)a3
{
  return +[SlalomUtils readBitsValueFromBuffer:bitPosition:length:](SlalomUtils, "readBitsValueFromBuffer:bitPosition:length:", objc_msgSend(objc_retainAutorelease(a3), "bytes"), 28, 4) != 0;
}

+ (int)getEnRouteStatus:(id)a3
{
  id v3;
  _BOOL4 v4;
  NSObject *v5;
  uint8_t v7[16];

  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    v4 = +[SlalomUtils readBitsValueFromBuffer:bitPosition:length:](SlalomUtils, "readBitsValueFromBuffer:bitPosition:length:", objc_msgSend(objc_retainAutorelease(v3), "bytes"), 15, 1) == 1;
  }
  else
  {
    ATLLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C3511000, v5, OS_LOG_TYPE_DEFAULT, "Octopus Transit Flag data cannot be retrieved; block to decode did not have 16 bytes; aborting.",
        v7,
        2u);
    }

    v4 = 0;
  }

  return v4;
}

+ (int)filterHistoryEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AddValueTypeRaw"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "intValue") == 4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MerchantCategoryCode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "intValue") == 1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TypeDetailRaw"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "intValue") == 18)
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Amount"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "intValue") == 0;

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
