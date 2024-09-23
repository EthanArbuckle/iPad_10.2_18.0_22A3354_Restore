@implementation MogulDecoder

+ (id)decodeCardID:(id)a3
{
  return (id)objc_msgSend(a3, "subdataWithRange:", 0, 8);
}

+ (unsigned)decodeStatusFlag:(id)a3
{
  return objc_msgSend(a3, "u8:", 0);
}

+ (id)decodeCardIssueDate:(id)a3
{
  unsigned int v3;

  v3 = objc_msgSend(a3, "u16BE:", 1);
  return (id)objc_msgSend(MEMORY[0x1E0C99D78], "dateWithYear:month:day:", (v3 >> 9) + 2000, (v3 >> 5) & 0xF, v3 & 0x1F);
}

+ (int)decodeEnableFlag:(id)a3
{
  return objc_msgSend(a3, "u8:", 3) == 1;
}

+ (id)decodeTransactionHistoryEntry:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[6];
  _QWORD v21[7];

  v21[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isAll00") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = objc_msgSend(v4, "u8:", 0);
    v7 = objc_msgSend(v4, "u32BE:", 1);
    v8 = objc_msgSend(v4, "u32BE:", 5);
    v9 = objc_msgSend(v4, "u32BE:", 9);
    v10 = objc_msgSend(v4, "u16BE:", 13);
    objc_msgSend(MEMORY[0x1E0C99D78], "dateWithYear:month:day:hour:minute:second:", ((v9 >> 21) & 0x7F) + 2000, (v9 >> 17) & 0xF, (v9 >> 12) & 0x1F, (v9 >> 6) & 0x3F, v9 & 0x3F, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "decodeTransactionTypeCode:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(a1, "isTopUpTransactionType:", v6);
    if (v7)
      v14 = v13;
    else
      v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", v7, 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", v8, 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v15;
    v20[0] = CFSTR("Amount");
    v20[1] = CFSTR("TypeDetailRaw");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v17;
    v21[2] = v11;
    v20[2] = CFSTR("TransactionTime");
    v20[3] = CFSTR("TypeDetail");
    v21[3] = v12;
    v20[4] = CFSTR("SerialNumber");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[5] = CFSTR("FinalBalance");
    v21[4] = v18;
    v21[5] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)decodeTransactionTypeCode:(unsigned __int8)a3
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  char v9;

  v3 = a3;
  +[AppletConfigurationData getSlalomSettings](AppletConfigurationData, "getSlalomSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mogul"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transactionType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v3),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "valueForKey:", v7),
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    if (v3 > 110)
    {
      v9 = v3 - 111;
      if ((v3 - 111) <= 0x16)
      {
        if (((1 << v9) & 0x833) != 0)
        {
LABEL_13:
          v8 = CFSTR("TopUp");
          goto LABEL_14;
        }
        if (((1 << v9) & 0x500000) != 0)
        {
          v8 = CFSTR("Points");
          goto LABEL_14;
        }
        if (v3 == 119)
        {
          v8 = CFSTR("TopUpAuto");
          goto LABEL_14;
        }
      }
LABEL_17:
      v8 = CFSTR("Unknown");
      goto LABEL_14;
    }
    switch(v3)
    {
      case '[':
      case ']':
        v8 = CFSTR("CardRead");
        break;
      case '\\':
      case '^':
        goto LABEL_13;
      default:
        if (v3 == 56)
          goto LABEL_13;
        if (v3 != 71)
          goto LABEL_17;
        v8 = CFSTR("Purchase");
        break;
    }
  }
LABEL_14:

  return v8;
}

+ (id)getPurseBalance:(id)a3
{
  unsigned int *v3;

  v3 = (unsigned int *)objc_msgSend(objc_retainAutorelease(a3), "bytes");
  return (id)objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", *v3, 0, 0);
}

+ (id)decodePointsData:(id)a3 andWith:(id)a4
{
  id v5;
  char v6;
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  int v14;
  const __CFString *v15;

  v5 = a4;
  v6 = objc_msgSend(a3, "u8:", 0);
  v7 = 0;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v9 = 1;
    do
    {
      v10 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "s24BE:", v8));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBalance:", v11);

      v12 = objc_msgSend(v5, "u16BE:", v8 + 3);
      objc_msgSend(MEMORY[0x1E0C99D78], "dateWithYear:month:day:", (v12 >> 9) + 2000, (v12 >> 5) & 0xF, v12 & 0x1F);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHour:", 23);
      objc_msgSend(v13, "setMinute:", 59);
      objc_msgSend(v13, "setSecond:", 59);
      objc_msgSend(v10, "setExpiration:", v13);
      v14 = v9 & 1;
      if ((v9 & 1) != 0)
        v15 = CFSTR("Points1");
      else
        v15 = CFSTR("Points2");
      objc_msgSend(v10, "setName:", v15);
      objc_msgSend(v7, "addObject:", v10);

      v9 = 0;
      v8 += 5;
    }
    while (v14);
  }

  return v7;
}

+ (id)decodeChargeAmountFlagValue:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a3;
  v4 = objc_msgSend(v3, "u8:", 6);
  v5 = objc_msgSend(v3, "u8:", 5);

  v6 = 0;
  if (v5 && (_DWORD)v4)
  {
    +[AppletConfigurationData getSlalomSettings](AppletConfigurationData, "getSlalomSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mogul"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("rechargeAmountCodes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9
      && (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v4),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "valueForKey:", v10),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v11))
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", objc_msgSend(v11, "unsignedLongValue"), 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      switch((int)v4)
      {
        case 1:
        case 11:
        case 21:
        case 31:
        case 41:
        case 51:
        case 61:
        case 71:
        case 81:
        case 91:
        case 101:
        case 111:
          v12 = (void *)MEMORY[0x1E0CB3598];
          v13 = 5000;
          goto LABEL_17;
        case 2:
        case 12:
        case 22:
        case 32:
        case 42:
        case 52:
        case 62:
        case 72:
        case 82:
        case 92:
        case 102:
        case 112:
          v12 = (void *)MEMORY[0x1E0CB3598];
          v13 = 6000;
          goto LABEL_17;
        case 3:
        case 13:
        case 23:
        case 33:
        case 43:
        case 53:
        case 63:
        case 73:
        case 83:
        case 93:
        case 103:
        case 113:
          v12 = (void *)MEMORY[0x1E0CB3598];
          v13 = 7000;
          goto LABEL_17;
        case 4:
        case 14:
        case 24:
        case 34:
        case 44:
        case 54:
        case 64:
        case 74:
        case 84:
        case 94:
        case 104:
        case 114:
          v12 = (void *)MEMORY[0x1E0CB3598];
          v13 = 8000;
          goto LABEL_17;
        case 5:
        case 15:
        case 25:
        case 35:
        case 45:
        case 55:
        case 65:
        case 75:
        case 85:
        case 95:
        case 105:
        case 115:
          v12 = (void *)MEMORY[0x1E0CB3598];
          v13 = 9000;
          goto LABEL_17;
        case 6:
        case 16:
        case 26:
        case 36:
        case 46:
        case 56:
        case 66:
        case 76:
        case 86:
        case 96:
        case 106:
        case 116:
          v12 = (void *)MEMORY[0x1E0CB3598];
          v13 = 10000;
          goto LABEL_17;
        case 7:
        case 17:
        case 27:
        case 37:
        case 47:
        case 57:
        case 67:
        case 77:
        case 87:
        case 97:
        case 107:
        case 117:
          v12 = (void *)MEMORY[0x1E0CB3598];
          v13 = 15000;
          goto LABEL_17;
        case 8:
        case 18:
        case 28:
        case 38:
        case 48:
        case 58:
        case 68:
        case 78:
        case 88:
        case 98:
        case 108:
        case 118:
          v12 = (void *)MEMORY[0x1E0CB3598];
          v13 = 20000;
          goto LABEL_17;
        case 9:
        case 19:
        case 29:
        case 39:
        case 49:
        case 59:
        case 69:
        case 79:
        case 89:
        case 99:
        case 109:
        case 119:
          v12 = (void *)MEMORY[0x1E0CB3598];
          v13 = 25000;
          goto LABEL_17;
        case 10:
        case 20:
        case 30:
        case 40:
        case 50:
        case 60:
        case 70:
        case 80:
        case 90:
        case 100:
        case 110:
        case 120:
          v12 = (void *)MEMORY[0x1E0CB3598];
          v13 = 30000;
LABEL_17:
          objc_msgSend(v12, "decimalNumberWithMantissa:exponent:isNegative:", v13, 0, 0);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        default:
          v6 = 0;
          break;
      }
    }

  }
  return v6;
}

+ (unsigned)decodeTopupFlag:(id)a3
{
  return objc_msgSend(a3, "u8:", 5);
}

+ (unsigned)decodeTopupSettings:(id)a3
{
  return objc_msgSend(a3, "u8:", 6);
}

+ (BOOL)isTopUpTransactionType:(unsigned __int8)a3
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v3 = a3;
  +[AppletConfigurationData getSlalomSettings](AppletConfigurationData, "getSlalomSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mogul"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("topupCodes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v3),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "valueForKey:", v7),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    v9 = objc_msgSend(v8, "BOOLValue");

  }
  else
  {
    v9 = 1;
    if (v3 - 92 > 0x29 || ((1 << (v3 - 92)) & 0x28049980005) == 0)
      v9 = v3 == 56;
  }

  return v9;
}

@end
