@implementation HPHistoryDecoder

+ (id)getTransactionDate:(id)a3
{
  id v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    v4 = bswap32(*(unsigned __int16 *)(objc_msgSend(objc_retainAutorelease(v3), "bytes") + 4));
    v5 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v5, "setYear:", (v4 >> 25) + 2000);
    objc_msgSend(v5, "setMonth:", (v4 >> 21) & 0xF);
    objc_msgSend(v5, "setDay:", HIWORD(v4) & 0x1F);
  }
  else
  {
    ATLLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1C3511000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get the transaction date for Suica, invalid block: %@", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

+ ($391024036B902F3EE9BCB0FBA5EF777F)getTransactionBalance:(id)a3
{
  id v3;
  unsigned __int8 *v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    v4 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
    v5 = (unint64_t)((v4[12] << 16) | (v4[11] << 8) | v4[10]) << 32;
    v6 = 1;
  }
  else
  {
    ATLLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1C3511000, v7, OS_LOG_TYPE_DEFAULT, "Failed to get the transaction balance for Suica, invalid block: %@", (uint8_t *)&v9, 0xCu);
    }

    v5 = 0;
    v6 = 0;
  }

  return ($391024036B902F3EE9BCB0FBA5EF777F)(v6 | v5);
}

+ ($391024036B902F3EE9BCB0FBA5EF777F)getCommuterBalance:(id)a3
{
  id v3;
  unsigned __int8 *v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    v4 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
    v5 = (unint64_t)((v4[13] << 16) | (v4[12] << 8) | v4[11]) << 32;
    v6 = 1;
  }
  else
  {
    ATLLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1C3511000, v7, OS_LOG_TYPE_DEFAULT, "Failed to get the commuter balance for Suica, invalid block: %@", (uint8_t *)&v9, 0xCu);
    }

    v5 = 0;
    v6 = 0;
  }

  return ($391024036B902F3EE9BCB0FBA5EF777F)(v6 | v5);
}

+ (unsigned)getTypeOfUse:(id)a3
{
  id v3;
  uint64_t v4;
  unsigned __int16 v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    v4 = objc_msgSend(objc_retainAutorelease(v3), "bytes");
    v5 = *(unsigned __int8 *)(v4 + 3) | ((*(_BYTE *)(v4 + 1) & 0x7F) << 8);
  }
  else
  {
    ATLLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1C3511000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get the type of use for Suica, invalid block: %@", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

+ (int)getTransactionAmount:(id)a3 withPreviousBlock:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  int v9;
  NSObject *v10;
  const char *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v6))
  {
    ATLLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v6;
      v11 = "Failed to get the transaction amount use for Suica, invalid (current) block: %@";
LABEL_8:
      _os_log_impl(&dword_1C3511000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0xCu);
    }
LABEL_9:

    v9 = 0;
    goto LABEL_10;
  }
  if (!+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v7))
  {
    ATLLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v7;
      v11 = "Failed to get the transaction amount use for Suica, invalid (previous) block: %@";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v8 = (unint64_t)objc_msgSend(a1, "getTransactionBalance:", v6) >> 32;
  v9 = ((unint64_t)objc_msgSend(a1, "getTransactionBalance:", v7) >> 32) - v8;
LABEL_10:

  return v9;
}

+ ($D5AB1F6BCC7169BA692F6D1C6C8B6B88)getSectorInformation:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    v4 = objc_msgSend(objc_retainAutorelease(v3), "bytes");
    v5 = bswap32(*(unsigned __int16 *)(v4 + 6)) >> 16;
    v6 = (unint64_t)(*(_BYTE *)(v4 + 15) & 0x30) << 48;
    v7 = (unint64_t)(bswap32(*(unsigned __int16 *)(v4 + 8)) >> 16) << 32;
    v8 = (unint64_t)(*(_BYTE *)(v4 + 15) & 0xC0) << 16;
  }
  else
  {
    ATLLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v3;
      _os_log_impl(&dword_1C3511000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get the sector information for Suica, invalid block: %@", (uint8_t *)&v11, 0xCu);
    }

    v6 = 0;
    v7 = 0;
    v8 = 0;
    v5 = 0;
  }

  return ($D5AB1F6BCC7169BA692F6D1C6C8B6B88)(v7 | v5 | v6 | v8);
}

+ (BOOL)getGreenCarTicketUsed:(id)a3
{
  id v3;
  BOOL v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    v4 = *(_BYTE *)(objc_msgSend(objc_retainAutorelease(v3), "bytes") + 15) & 1;
  }
  else
  {
    ATLLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1C3511000, v5, OS_LOG_TYPE_DEFAULT, "Failed to get the GreenCar information for Suica, invalid block: %@", (uint8_t *)&v7, 0xCu);
    }

    v4 = 0;
  }

  return v4;
}

+ ($06D0163FE0D7AFE752A9F21F38483579)getInOutStation:(id)a3
{
  id v3;
  unsigned __int8 *v4;
  uint64_t v5;
  int v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    v4 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
    LODWORD(v5) = *v4 >> 7;
    v6 = (v4[1] >> 6) & 1;
  }
  else
  {
    ATLLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1C3511000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Failed to get the In and Out information for Suica, invalid block: %@", (uint8_t *)&v8, 0xCu);
    }

    LOWORD(v6) = 0;
    LOWORD(v5) = 0;
  }

  return ($06D0163FE0D7AFE752A9F21F38483579)(v5 | ((_WORD)v6 << 8));
}

+ (BOOL)getIsDenyListed:(id)a3
{
  id v3;
  BOOL v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    v4 = *(char *)(objc_msgSend(objc_retainAutorelease(v3), "bytes") + 8) < 0;
  }
  else
  {
    ATLLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1C3511000, v5, OS_LOG_TYPE_DEFAULT, "Failed to get the denylisted information for Suica, invalid block: %@", (uint8_t *)&v7, 0xCu);
    }

    v4 = 0;
  }

  return v4;
}

+ (unsigned)getHistoryNumber:(id)a3
{
  id v3;
  NSObject *v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    LODWORD(v4) = bswap32(*(unsigned __int16 *)(objc_msgSend(objc_retainAutorelease(v3), "bytes") + 13)) >> 16;
  }
  else
  {
    ATLLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1C3511000, v4, OS_LOG_TYPE_DEFAULT, "Failed to get the history number information for Suica, invalid block: %@", (uint8_t *)&v6, 0xCu);
    }

    LOWORD(v4) = 0;
  }

  return (unsigned __int16)v4;
}

+ (id)parseSuicaHistoryBlocks:(id)a3 withIDm:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  unint64_t v36;
  void *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  int v47;
  _BYTE v48[3];
  _BYTE v49[3];
  unsigned int v50;
  unsigned __int8 md[8];
  uint64_t v52;
  uint64_t data;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7 || objc_msgSend(v7, "length") != 8)
  {
    NSLog(CFSTR("IDm not provided, aborting, %@"), v8);
LABEL_14:
    v40 = 0;
    goto LABEL_15;
  }
  if (!v6 || !objc_msgSend(v6, "count"))
  {
    NSLog(CFSTR("the array of block does not contain block entry"));
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v9 = 0;
    v10 = 0;
    v43 = a1;
    v44 = v8;
    v46 = v6;
    do
    {
      v47 = v10;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "getTransactionDate:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(a1, "getTypeOfUse:", v12);
      v15 = objc_msgSend(a1, "getSectorInformation:", v12);
      v16 = (unint64_t)objc_msgSend(a1, "getTransactionBalance:", v12) >> 32;
      v50 = 0;
      v17 = v9 + 1;
      if (v17 >= objc_msgSend(v6, "count"))
      {
        *(_QWORD *)md = 0;
        v52 = 0;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", md, 16, 0);
      }
      else
      {
        objc_msgSend(v46, "objectAtIndexedSubscript:", v17);
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(a1, "getTransactionAmount:withPreviousBlock:", v12, v18);

      objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("NFTransactionDate"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, CFSTR("NFBalance"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v50);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, CFSTR("NFAmount"));

      objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E7D9AD10, CFSTR("NFAmountType"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v14 >> 8);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, CFSTR("NFTransactionType"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, CFSTR("NFSectorCombination"));

      v49[0] = BYTE1(v15);
      v49[1] = v15;
      v49[2] = BYTE2(v15);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v49, 3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, CFSTR("NFStartStationData"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", (unsigned __int16)v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v24, CFSTR("NFStartStation"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", BYTE2(v15));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, CFSTR("NFStartStationExt"));

      v48[0] = BYTE5(v15);
      v48[1] = BYTE4(v15);
      v48[2] = BYTE6(v15);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v48, 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v26, CFSTR("NFEndStationData"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", WORD2(v15));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v27, CFSTR("NFEndStation"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", BYTE6(v15));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v28, CFSTR("NFEndStationExt"));

      data = 0;
      v54 = 0;
      v8 = v44;
      data = *(_QWORD *)objc_msgSend(objc_retainAutorelease(v44), "bytes");
      LODWORD(v54) = bswap32(v50);
      v29 = objc_retainAutorelease(v12);
      v30 = objc_msgSend(v29, "bytes");
      WORD2(v54) = *(_WORD *)(v30 + 4);
      CC_SHA256(&data, 0xDu, md);
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", md, 16);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "increaseLengthBy:", 16);
      objc_msgSend(v31, "asHexString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v32, CFSTR("NFTransactionID"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", bswap32(*(unsigned __int16 *)(v30 + 13)) >> 16);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v33, CFSTR("NFHistorySequenceNumber"));

      v34 = +[SlalomUtils readBitsValueFromBuffer:bitPosition:length:](SlalomUtils, "readBitsValueFromBuffer:bitPosition:length:", v30 + 1, 7, 1);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v35, CFSTR("NFSFBreakdown"));

      v36 = +[SlalomUtils readBitsValueFromBuffer:bitPosition:length:](SlalomUtils, "readBitsValueFromBuffer:bitPosition:length:", v30, 0, 7);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v37, CFSTR("NFDeviceCode"));

      v38 = +[SlalomUtils readBitsValueFromBuffer:bitPosition:length:](SlalomUtils, "readBitsValueFromBuffer:bitPosition:length:", v30 + 2, 0, 7);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v39, CFSTR("NFPaymentType"));

      objc_msgSend(v45, "addObject:", v11);
      v10 = v47 + 1;
      v9 = (unsigned __int16)(v47 + 1);
      v6 = v46;
      a1 = v43;
    }
    while (objc_msgSend(v46, "count") > v9);
  }
  v40 = v42;
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v45, CFSTR("NFHistoryRecords"));

LABEL_15:
  return v40;
}

+ (id)parseGreencarBlocks:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v6))
    {
      if (!objc_msgSend(v6, "isAll00"))
      {
        v12 = objc_msgSend(objc_retainAutorelease(v6), "bytes");
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v12, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isAll00") & 1) == 0)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("NFStartStationData"));
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v12 + 2, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v14, "isAll00") & 1) == 0)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("NFEndStationData"));
        v15 = +[SlalomUtils readUInt16FromBytes:](SlalomUtils, "readUInt16FromBytes:", v12 + 4);
        v16 = objc_alloc_init(MEMORY[0x1E0C99D78]);
        objc_msgSend(v16, "setYear:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v15, 7, 9)+ 2000);
        objc_msgSend(v16, "setMonth:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v15, 4, 5));
        objc_msgSend(v16, "setDay:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v15, 5, 0));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("NFPurchaseDate"));
        v17 = +[SlalomUtils readUInt24FromBytes:](SlalomUtils, "readUInt24FromBytes:", v12 + 6);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v17, 6, 13));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("NFMinuteSold"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v17, 5, 19));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("NFHourSold"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 10 * *(unsigned __int8 *)(v12 + 9));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("NFFare"));

        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v12 + 12, 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("NFRefundStation"));

        v22 = +[SlalomUtils readUInt16FromBytes:](SlalomUtils, "readUInt16FromBytes:", v12 + 14);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v22, 1, 0));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("NFTicketUsed"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v22, 6, 5));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("NFRefundDay"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v22, 6, 11));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("NFRefundMonth"));

        v11 = v5;
        goto LABEL_17;
      }
      ATLLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        v8 = "Shinkansen information are all zeros, filtering";
        v9 = v7;
        v10 = 2;
LABEL_10:
        _os_log_impl(&dword_1C3511000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v27, v10);
      }
    }
    else
    {
      ATLLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v27 = 138412290;
        v28 = v6;
        v8 = "Failed to get the GreenCar information for Suica, invalid block: %@";
        v9 = v7;
        v10 = 12;
        goto LABEL_10;
      }
    }

    v11 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v11 = 0;
LABEL_18:

  return v11;
}

+ (id)parseShinkansenBlocks:(id)a3 fromServiceCode:(unsigned __int16)a4
{
  int v4;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  unsigned int v17;
  id v18;
  void *v19;
  unsigned int v20;
  id v21;
  unsigned int v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned __int16 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unsigned __int8 *v46;
  unsigned __int8 *v47;
  void *v48;
  unsigned int v49;
  void *v50;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint8_t buf[4];
  uint64_t v58;
  uint64_t v59;

  v4 = a4;
  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v9))
    {
      if (objc_msgSend(v9, "isAll00"))
      {
        ATLLogObject();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v11 = "Shinkansen information are all zeros, filtering";
          v12 = v10;
          v13 = 2;
LABEL_13:
          _os_log_impl(&dword_1C3511000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
        }
LABEL_14:

        v14 = 0;
LABEL_44:

        goto LABEL_45;
      }
      if (v4 != 6475)
      {
        v9 = objc_retainAutorelease(v9);
        v46 = (unsigned __int8 *)objc_msgSend(v9, "bytes");
        if (!v46)
          goto LABEL_43;
        v47 = v46;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *v46);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v48, CFSTR("NFTicketSelected"));

        if ((unint64_t)objc_msgSend(v9, "length") < 9)
          goto LABEL_43;
        v49 = v47[8];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v49 >> 4) & 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v50, CFSTR("NFNotifyOnLowBalance"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v49 >> 5) & 1);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v23, CFSTR("NFAllowBalanceUsageForCommute"));
LABEL_42:

LABEL_43:
        v14 = v8;
        goto LABEL_44;
      }
      if (objc_msgSend(v7, "count") == 8)
      {
        v53 = a1;
        v15 = objc_retainAutorelease(v9);
        v16 = objc_msgSend(v15, "bytes");
        v17 = +[SlalomUtils readUInt16FromBytes:](SlalomUtils, "readUInt16FromBytes:", v16);
        v18 = objc_alloc_init(MEMORY[0x1E0C99D78]);
        objc_msgSend(v18, "setYear:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v17, 7, 9)+ 2000);
        objc_msgSend(v18, "setMonth:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v17, 4, 5));
        objc_msgSend(v18, "setDay:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v17, 5, 0));
        -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v18, CFSTR("NFExpressTicketDate"));
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v16 + 2, 3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v19, CFSTR("NFExpressTicketNumber"));

        v20 = +[SlalomUtils readUInt16FromBytes:](SlalomUtils, "readUInt16FromBytes:", v16 + 11);
        v21 = objc_alloc_init(MEMORY[0x1E0C99D78]);

        objc_msgSend(v21, "setYear:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v20, 7, 9)+ 2000);
        objc_msgSend(v21, "setMonth:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v20, 4, 5));
        objc_msgSend(v21, "setDay:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v20, 5, 0));
        -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v21, CFSTR("NFIssueDate"));
        v22 = +[SlalomUtils readUInt16FromBytes:](SlalomUtils, "readUInt16FromBytes:", v16 + 13);
        v23 = objc_alloc_init(MEMORY[0x1E0C99D78]);

        objc_msgSend(v23, "setYear:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v22, 7, 9)+ 2000);
        objc_msgSend(v23, "setMonth:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v22, 4, 5));
        objc_msgSend(v23, "setDay:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v22, 5, 0));
        -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v23, CFSTR("NFValidityStartDate"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v16 + 15));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v24, CFSTR("NFValidityTerm"));

        objc_msgSend(v7, "objectAtIndexedSubscript:", 5);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = objc_retainAutorelease(v25);
        v26 = objc_msgSend(v9, "bytes");
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v26, 2);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v26 + 2, 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v26 + 4, 2);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v26 + 6, 2);
        v56 = objc_claimAutoreleasedReturnValue();
        v28 = +[SlalomUtils readNumberFromBytes:numberOfBytes:](SlalomUtils, "readNumberFromBytes:numberOfBytes:", v26 + 8, 6);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 10* +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v28, 12, 12));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v29, CFSTR("NFExpressFareC"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 10* +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v28, 12, 12));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v30, CFSTR("NFExpressFareB"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 10* +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v28, 12, 24));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v31, CFSTR("NFExpressFareA"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 10* +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v28, 12, 36));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v32, CFSTR("NFExpressFare"));

        v33 = +[SlalomUtils readUInt16FromBytes:](SlalomUtils, "readUInt16FromBytes:", v26 + 14);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 2 * ((5 * v33) & 0x7FFF));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v34, CFSTR("NFTotalFare"));

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v54 && v27 && (objc_msgSend(v54, "isAll00") & 1) == 0 && (objc_msgSend(v27, "isAll00") & 1) == 0)
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "_decodeShinkansenTrainDataWithBlock:andBlock:", v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v38)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v38, "setObject:forKey:", v54, CFSTR("NFStartStationData"));
          objc_msgSend(v38, "setObject:forKey:", v27, CFSTR("NFEndStationData"));
          objc_msgSend(v35, "addObject:", v38);

        }
        v39 = v55;
        v40 = (void *)v56;
        if (v27 && v55 && (objc_msgSend(v27, "isAll00") & 1) == 0 && (objc_msgSend(v55, "isAll00") & 1) == 0)
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", 3);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectAtIndexedSubscript:", 4);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "_decodeShinkansenTrainDataWithBlock:andBlock:", v52, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v42)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v42, "setObject:forKey:", v27, CFSTR("NFStartStationData"));
          objc_msgSend(v42, "setObject:forKey:", v55, CFSTR("NFEndStationData"));
          objc_msgSend(v35, "addObject:", v42);

          v40 = (void *)v56;
        }
        if (v55 && v40 && (objc_msgSend(v55, "isAll00") & 1) == 0 && (objc_msgSend(v40, "isAll00") & 1) == 0)
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", 6);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectAtIndexedSubscript:", 7);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "_decodeShinkansenTrainDataWithBlock:andBlock:", v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v45)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v45, "setObject:forKey:", v55, CFSTR("NFStartStationData"));
          v40 = (void *)v56;
          objc_msgSend(v45, "setObject:forKey:", v56, CFSTR("NFEndStationData"));
          objc_msgSend(v35, "addObject:", v45);

          v39 = v55;
        }
        -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v35, CFSTR("NFTrains"));

        goto LABEL_42;
      }
      ATLLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      *(_DWORD *)buf = 134217984;
      v58 = objc_msgSend(v7, "count");
      v11 = "Shinkansen1 missing blocks, bailing out. Expecting 8 got %lu";
    }
    else
    {
      ATLLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      *(_DWORD *)buf = 138412290;
      v58 = (uint64_t)v9;
      v11 = "Failed to get the shinkansen information for Suica, invalid block: %@";
    }
    v12 = v10;
    v13 = 12;
    goto LABEL_13;
  }
  ATLLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_DEFAULT, "Bailing out for Shinkansen Service, not enough blocks", buf, 2u);
  }
  v14 = 0;
LABEL_45:

  return v14;
}

+ (id)_decodeShinkansenTrainDataWithBlock:(id)a3 andBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  const char *v34;
  char v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v5))
  {
    ATLLogObject();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v5;
      v34 = "Failed to get the denylisted information for Suica, invalid (block1) block: %@";
LABEL_16:
      _os_log_impl(&dword_1C3511000, v33, OS_LOG_TYPE_DEFAULT, v34, buf, 0xCu);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (!+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v6))
  {
    ATLLogObject();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v6;
      v34 = "Failed to get the denylisted information for Suica, invalid (block2) block: %@";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (!objc_msgSend(v5, "isAll00") || (objc_msgSend(v6, "isAll00") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "mutableCopy");
    v9 = objc_msgSend(objc_retainAutorelease(v6), "bytes");
    objc_msgSend(v8, "appendBytes:length:", v9, 6);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("NFTrainName"));
    v10 = +[SlalomUtils readNumberFromBytes:numberOfBytes:](SlalomUtils, "readNumberFromBytes:numberOfBytes:", v9 + 6, 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 6, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("NFArrivalMinute"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 5, 6));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("NFArrivalHour"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 6, 11));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("NFDepartureMinute"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 5, 17));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("NFDepartureHour"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 20, 22));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("NFPBCode"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 1, 42));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("NFReissue"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 3, 43));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("NFCarId"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 1, 46));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("NFSmoking"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 5, 47));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("NFCarNumber"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 3, 52));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, CFSTR("NFSeatType"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 1, 55));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, CFSTR("NFChild"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 2, 56));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, CFSTR("NFGreenCar"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 6, 58));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, CFSTR("NFSeatNumber"));

    v24 = +[SlalomUtils readUInt16FromBytes:](SlalomUtils, "readUInt16FromBytes:", v9 + 14);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 10 * (v24 >> 6));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, CFSTR("NFGreenCarFare"));

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NFDepartureHour"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "isEqualToNumber:", &unk_1E7D9AD28))
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NFDepartureMinute"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "isEqualToNumber:", &unk_1E7D9AD28))
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NFArrivalHour"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "isEqualToNumber:", &unk_1E7D9AD28))
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NFArrivalMinute"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v29, "isEqualToNumber:", &unk_1E7D9AD28))
          {
            objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NFPBCode"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v30, "isEqualToNumber:", &unk_1E7D9AD28))
            {
              objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NFCarId"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v31, "isEqualToNumber:", &unk_1E7D9AD28);

              if ((v36 & 1) != 0)
              {
                v32 = 0;
LABEL_25:

                goto LABEL_26;
              }
LABEL_24:
              v32 = v7;
              goto LABEL_25;
            }

          }
        }

      }
    }

    goto LABEL_24;
  }
LABEL_18:
  v32 = 0;
LABEL_26:

  return v32;
}

@end
