@implementation GondolaDecoder

+ (id)decodeCardNumberFromBlock0:(id)a3 andBlock1:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;

  v5 = (void *)MEMORY[0x1E0C99DF0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dataWithCapacity:", 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_retainAutorelease(v7);
  v10 = objc_msgSend(v9, "bytes");

  v11 = objc_retainAutorelease(v6);
  v12 = objc_msgSend(v11, "bytes");

  objc_msgSend(v8, "appendBytes:length:", v10 + 12, 4);
  objc_msgSend(v8, "appendBytes:length:", v12, 4);
  return v8;
}

+ (BOOL)isCardUsageFlag:(id)a3
{
  return objc_msgSend(a3, "readBinaryValueAtBit:numberOfBits:", 111, 2) & 1;
}

+ (BOOL)isCardEffectiveFlag:(id)a3
{
  return objc_msgSend(a3, "readBinaryValueAtBit:numberOfBits:", 112, 2) & 1;
}

+ (id)decodeEnrollmentDateAfterDelivery:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0C99D78];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "decodeBCDAtOffset:length:", 3, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "intValue") + 2000);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeBCDAtOffset:length:", 4, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeBCDAtOffset:length:", 5, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setDay:", (int)objc_msgSend(v10, "intValue"));
  objc_msgSend(v5, "setMonth:", (int)objc_msgSend(v9, "intValue"));
  objc_msgSend(v5, "setYear:", (int)objc_msgSend(v8, "intValue"));

  return v5;
}

+ (id)decodeLastTransactionDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a3;
  objc_msgSend(v4, "decodeBCDAtOffset:length:", 11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v5, "intValue") + 2000);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeBCDAtOffset:length:", 12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeBCDAtOffset:length:", 13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D78], "dateWithYear:month:day:", (int)objc_msgSend(v6, "intValue"), (int)objc_msgSend(v7, "intValue"), (int)objc_msgSend(v8, "intValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)decodeHistoryBlock1:(id)a3 andWithBlock2:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  int v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  const void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  const __CFString *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  void *v47;
  __CFString *v48;
  unsigned int v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  __CFString *v53;
  const __CFString *v54;
  void *v55;
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[9];
  _QWORD v59[9];
  _QWORD v60[7];
  _QWORD v61[9];

  v61[7] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "subdataWithRange:", 0, 13);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v7, "u16BE:", 13);

  v8 = (unint64_t)objc_msgSend(v6, "readBinaryValueAtBit:numberOfBits:", 8, 7) >> 1;
  objc_msgSend(a1, "decodeTransactionType:", v8);
  v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  LODWORD(v7) = objc_msgSend(v6, "readBinaryValueAtBit:numberOfBits:", 14, 7);
  v10 = objc_msgSend(v6, "readBinaryValueAtBit:numberOfBits:", 21, 4);
  v11 = objc_msgSend(v6, "readBinaryValueAtBit:numberOfBits:", 25, 5);
  v12 = objc_msgSend(v6, "readBinaryValueAtBit:numberOfBits:", 30, 5);
  v13 = objc_msgSend(v6, "readBinaryValueAtBit:numberOfBits:", 35, 6);
  objc_msgSend(v9, "setDay:", v11);
  objc_msgSend(v9, "setMonth:", v10);
  objc_msgSend(v9, "setYear:", (int)v7 + 2005);
  objc_msgSend(v9, "setHour:", v12);
  objc_msgSend(v9, "setMinute:", v13);
  v14 = objc_msgSend(v6, "readBinaryValueAtBit:numberOfBits:", 41, 18);
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", v14, 0, 0);
  v52 = objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v6, "readBinaryValueAtBit:numberOfBits:", 59, 18);
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", v15, 0, v8 == 10);
  v51 = objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v6, "readBinaryValueAtBit:numberOfBits:", 77, 17);
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", v16, 0, v8 != 5);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = a1;
  v43 = objc_msgSend(v6, "readBinaryValueAtBit:numberOfBits:", 94, 4);
  objc_msgSend(a1, "decodeTransactionTopupCategory:");
  v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 32);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_retainAutorelease(v6);
  v20 = (const void *)objc_msgSend(v19, "bytes");

  v46 = objc_retainAutorelease(v18);
  CC_SHA256(v20, 8u, (unsigned __int8 *)objc_msgSend(v46, "mutableBytes"));
  v44 = v15;
  if (v15)
  {
    v60[0] = CFSTR("TerminalIdentifier");
    objc_msgSend(v55, "asHexString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v21;
    v60[1] = CFSTR("SerialNumber");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v49);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v22;
    v60[2] = CFSTR("TypeDetailRaw");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v61[2] = v23;
    v61[3] = v9;
    v60[3] = CFSTR("TransactionTime");
    v60[4] = CFSTR("Amount");
    v61[4] = v51;
    v61[5] = v52;
    v60[5] = CFSTR("FinalBalance");
    v60[6] = CFSTR("TypeDetail");
    v61[6] = v48;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setValuesForKeysWithDictionary:", v24);

  }
  v47 = v17;
  v25 = v48;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v27 = v53;
    if (objc_msgSend(v45, "isTransactionTypePaymentWithReload:", v8))
    {

      v28 = CFSTR("TopUpAuto");
    }
    else
    {
      v28 = v48;
    }
    if (v8 == 6 && !v43)
    {

      v27 = CFSTR("Points");
    }
    v58[0] = CFSTR("TerminalIdentifier");
    objc_msgSend(v55, "asHexString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v35;
    v58[1] = CFSTR("SerialNumber");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v49);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v36;
    v58[2] = CFSTR("TypeDetailRaw");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v59[2] = v37;
    v59[3] = v9;
    v58[3] = CFSTR("TransactionTime");
    v58[4] = CFSTR("Amount");
    v59[4] = v50;
    v59[5] = v52;
    v58[5] = CFSTR("FinalBalance");
    v58[6] = CFSTR("AddValueTypeRaw");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v43);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v59[6] = v38;
    v59[7] = v27;
    v54 = v27;
    v58[7] = CFSTR("AddValueType");
    v58[8] = CFSTR("TypeDetail");
    v25 = (__CFString *)v28;
    v59[8] = v28;
    v34 = 0x1E0C99000uLL;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 9);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setValuesForKeysWithDictionary:", v39);

    if (v44)
    {
      v33 = v46;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", bswap64(*(_QWORD *)objc_msgSend(objc_retainAutorelease(v46), "bytes")));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v17;
      objc_msgSend(v17, "setObject:forKey:", v40, CFSTR("fakeTransactionId"));

      v34 = 0x1E0C99000;
      v29 = (void *)v51;
      v30 = (void *)v52;
      v31 = (__CFString *)v54;
    }
    else
    {
      v29 = (void *)v51;
      v30 = (void *)v52;
      v31 = (__CFString *)v54;
      v33 = v46;
      v32 = v47;
    }
  }
  else
  {
    v29 = (void *)v51;
    v30 = (void *)v52;
    v31 = v53;
    v33 = v46;
    v32 = v47;
    v34 = 0x1E0C99000;
  }
  v56[0] = CFSTR("Charge");
  v56[1] = CFSTR("TopUp");
  v57[0] = v32;
  v57[1] = v26;
  objc_msgSend(*(id *)(v34 + 3456), "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

+ (unint64_t)decodeLastHistoryNumber:(id)a3
{
  return (unint64_t)*(unsigned __int8 *)(objc_msgSend(objc_retainAutorelease(a3), "bytes") + 3) >> 6;
}

+ (id)getPurseBalance:(id)a3
{
  unsigned int *v3;

  v3 = (unsigned int *)objc_msgSend(objc_retainAutorelease(a3), "bytes");
  return (id)objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", *v3, 0, 0);
}

+ (id)decodeTotalPointsUntil1YearAgo:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "s24BE:", 0));
}

+ (id)decodeTotalPointsUntil2YearsAgo:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "s24BE:", 3));
}

+ (unsigned)decodePointIssuer1AppStatus:(id)a3
{
  return *(_BYTE *)(objc_msgSend(objc_retainAutorelease(a3), "bytes") + 10);
}

+ (id)decodeAutoTopUpAmount:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a3, "readBinaryValueAtBit:numberOfBits:", 34, 17));
}

+ (id)decodeAutoTopThresholdAmount:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a3, "readBinaryValueAtBit:numberOfBits:", 51, 17));
}

+ (id)decodeTransactionTopupCategory:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return CFSTR("Unknown");
  else
    return off_1E7D8A0A8[a3 - 1];
}

+ (id)decodeTransactionType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  +[AppletConfigurationData getSlalomSettings](AppletConfigurationData, "getSlalomSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gondola"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transactionType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a3),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "valueForKey:", v7),
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    if (a3 - 1 > 0x25)
      v8 = CFSTR("Unknown");
    else
      v8 = off_1E7D8A0D8[a3 - 1];
  }

  return v8;
}

+ (BOOL)isTransactionTypePaymentWithReload:(unint64_t)a3
{
  return a3 - 7 < 2;
}

+ (id)decodeLoyaltyPointBalancesAndExpiration:(id)a3 withActivationDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[7];

  v28[5] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "decodeTotalPointsUntil1YearAgo:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeTotalPointsUntil2YearsAgo:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeLastTransactionDate:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "year") == 2000)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D78], "dateWithYear:month:day:", objc_msgSend(v6, "year") + 1, objc_msgSend(v6, "month") % 12 + 1, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateFromComponents:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateFromComponents:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v9;
    if (objc_msgSend(v15, "compare:", v14) == 1)
    {
      objc_msgSend(v13, "setYear:", objc_msgSend(v10, "year"));
      objc_msgSend(v12, "dateFromComponents:", v13);
      v16 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v16;
      if (objc_msgSend(v15, "compare:", v16) == 1)
        objc_msgSend(v13, "setYear:", objc_msgSend(v13, "year") + 1);
      v25[0] = CFSTR("BalanceIdentifier");
      v25[1] = CFSTR("Balance");
      v26[0] = CFSTR("Points2");
      v26[1] = v9;
      v25[2] = CFSTR("BalanceCurrency");
      v25[3] = CFSTR("BalanceCurrencyExponent");
      v26[2] = CFSTR("XXX");
      v26[3] = &unk_1E7D9A860;
      v25[4] = CFSTR("BalanceExpirationDate");
      v26[4] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v17);

      objc_msgSend(MEMORY[0x1E0C99D78], "dateWithYear:month:day:", objc_msgSend(v13, "year") + 1, objc_msgSend(v13, "month"), objc_msgSend(v13, "day"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = CFSTR("BalanceIdentifier");
      v23[1] = CFSTR("Balance");
      v24[0] = CFSTR("Points1");
      v24[1] = v8;
      v23[2] = CFSTR("BalanceCurrency");
      v23[3] = CFSTR("BalanceCurrencyExponent");
      v24[2] = CFSTR("XXX");
      v24[3] = &unk_1E7D9A860;
      v23[4] = CFSTR("BalanceExpirationDate");
      v24[4] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v19);

      v14 = v21;
    }
    else
    {
      objc_msgSend(v13, "setYear:", objc_msgSend(v13, "year") + 1);
      v27[0] = CFSTR("BalanceIdentifier");
      v27[1] = CFSTR("Balance");
      v28[0] = CFSTR("Points1");
      v28[1] = v8;
      v27[2] = CFSTR("BalanceCurrency");
      v27[3] = CFSTR("BalanceCurrencyExponent");
      v28[2] = CFSTR("XXX");
      v28[3] = &unk_1E7D9A860;
      v27[4] = CFSTR("BalanceExpirationDate");
      v28[4] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v18);
    }

    v9 = v22;
  }

  return v11;
}

@end
