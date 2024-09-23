@implementation WLMessageParty

- (id)_initWithAddress:(id)a3 addCountryCode:(BOOL)a4 sqlController:(id)a5
{
  _BOOL4 v6;
  __CFString *v8;
  id v9;
  WLMessageParty *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSString *address;
  uint64_t v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  void *v25;
  NSString *ccAcNumber;
  uint64_t v27;
  NSString *v28;
  NSString *v29;
  void *v30;
  uint64_t v31;
  NSString *v32;
  NSString *v33;
  void *v34;
  uint64_t v35;
  NSString *v36;
  NSString *v37;
  void *v38;
  uint64_t v39;
  NSString *v40;
  NSString *v41;
  NSString *v42;
  __CFString *v43;
  uint64_t v44;
  __CFString *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __CFString *v49;
  NSString *v50;
  id *p_icc;
  uint64_t v52;
  __CFString *v53;
  NSString *icc;
  NSString *np;
  uint64_t v57;
  char v58;
  id v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  NSString *v63;
  uint64_t v64;
  id v65;
  NSString *v66;
  NSString *v67;
  __CFString *v68;
  NSString *v69;
  NSString *v70;
  id v71;
  NSString *v72;
  __CFString *v73;
  void *v74;
  _BOOL4 v75;
  NSString *v76;
  char v77;
  __CFString *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  objc_super v83;

  v6 = a4;
  v8 = (__CFString *)a3;
  v9 = a5;
  v83.receiver = self;
  v83.super_class = (Class)WLMessageParty;
  v10 = -[WLMessageParty init](&v83, sel_init);
  if (!v10)
    goto LABEL_47;
  if (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("insert-address-token")))
  {
    _WLLog();

    v8 = &stru_24E376E00;
  }
  v11 = -[__CFString length](v8, "length");
  v10->_isPhoneNumber = v11 != 0;
  if (!v11)
    goto LABEL_46;
  if (-[__CFString length](v8, "length"))
  {
    v12 = 0;
    while (1)
    {
      v13 = -[__CFString characterAtIndex:](v8, "characterAtIndex:", v12);
      if ((v13 - 97) < 0x1A || (v13 - 64) <= 0x1A)
        break;
      if (++v12 >= (unint64_t)-[__CFString length](v8, "length"))
        goto LABEL_13;
    }
    v10->_isPhoneNumber = 0;
    goto LABEL_46;
  }
LABEL_13:
  if (!v10->_isPhoneNumber)
  {
LABEL_46:
    objc_storeStrong((id *)&v10->_address, v8);
    icc = v10->_icc;
    v10->_icc = 0;

    np = v10->_np;
    v10->_np = 0;

    objc_storeStrong((id *)&v10->_ccAcNumber, v8);
    goto LABEL_47;
  }
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "countryCode");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[__CFString length](v16, "length"))
  {

    v16 = CFSTR("US");
  }
  v17 = PNCopyBestGuessNormalizedNumberForCountry();
  if (!v17)
  {
    v68 = v8;
    _WLLog();
    v10->_isPhoneNumber = 0;
    goto LABEL_33;
  }
  v18 = (void *)v17;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v17);
  v19 = objc_claimAutoreleasedReturnValue();
  address = v10->_address;
  v10->_address = (NSString *)v19;

  v72 = v10->_address;
  _WLLog();
  free(v18);
  v21 = -[NSString length](v10->_address, "length", v8, v72);
  v10->_isPhoneNumber = v21 != 0;
  if (!v21)
  {
LABEL_33:
    +[WLMessageParty _normalize:](WLMessageParty, "_normalize:", v8, v68);
    v44 = objc_claimAutoreleasedReturnValue();

    v8 = (__CFString *)v44;
    goto LABEL_45;
  }
  v75 = v6;
  v81 = *(_OWORD *)(MEMORY[0x24BE1FAA8] + 32);
  v82 = *(_OWORD *)(MEMORY[0x24BE1FAA8] + 48);
  v79 = *MEMORY[0x24BE1FAA8];
  v80 = *(_OWORD *)(MEMORY[0x24BE1FAA8] + 16);
  -[NSString UTF8String](v10->_address, "UTF8String");
  v22 = PNDecomposeForCountry();
  v77 = v22;
  v76 = v10->_address;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v22);
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", DWORD2(v80));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", DWORD2(v81));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", DWORD2(v82));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v76;
  v73 = v23;
  _WLLog();

  if ((v77 & 1) != 0)
  {
    ccAcNumber = v10->_ccAcNumber;
    v10->_ccAcNumber = (NSString *)&stru_24E376E00;

    if (*((_QWORD *)&v79 + 1))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v76, v23, v79, (_QWORD)v80, v24, (_QWORD)v81, v25, (_QWORD)v82, v74);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v10->_np;
      v10->_np = (NSString *)v27;

    }
    if ((_QWORD)v80 && DWORD2(v80))
    {
      v29 = v10->_ccAcNumber;
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", (_QWORD)v80, DWORD2(v80), 4);
      -[NSString stringByAppendingString:](v29, "stringByAppendingString:", v30);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v10->_ccAcNumber;
      v10->_ccAcNumber = (NSString *)v31;

    }
    if ((_QWORD)v81 && DWORD2(v81))
    {
      v33 = v10->_ccAcNumber;
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", (_QWORD)v81, DWORD2(v81), 4);
      -[NSString stringByAppendingString:](v33, "stringByAppendingString:", v34);
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = v10->_ccAcNumber;
      v10->_ccAcNumber = (NSString *)v35;

    }
    if ((_QWORD)v82 && DWORD2(v82))
    {
      v37 = v10->_ccAcNumber;
      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", (_QWORD)v82, DWORD2(v82), 4);
      -[NSString stringByAppendingString:](v37, "stringByAppendingString:", v38);
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = v10->_ccAcNumber;
      v10->_ccAcNumber = (NSString *)v39;

    }
    v41 = v10->_np;
    v42 = v10->_ccAcNumber;
    if (v41)
    {
      -[NSString stringByAppendingString:](v41, "stringByAppendingString:", v42);
      v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v43 = v42;
    }
    v45 = v43;
    if (-[__CFString length](v43, "length", v69))
    {
      v46 = -[NSString length](v10->_address, "length");
      if (v46 >= -[__CFString length](v45, "length"))
      {
        v47 = -[NSString length](v10->_address, "length");
        v48 = -[__CFString length](v45, "length");
        -[NSString substringFromIndex:](v10->_address, "substringFromIndex:", v47 - v48);
        v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (-[__CFString isEqualToString:](v49, "isEqualToString:", v45))
        {
          v78 = v49;
          if (v47 == v48)
          {
            p_icc = (id *)&v10->_icc;
            v50 = v10->_icc;
            v10->_icc = 0;
          }
          else
          {
            -[NSString substringToIndex:](v10->_address, "substringToIndex:", v47 - v48);
            v57 = objc_claimAutoreleasedReturnValue();
            p_icc = (id *)&v10->_icc;
            v50 = v10->_icc;
            v10->_icc = (NSString *)v57;
          }

          if (*p_icc)
          {
            v58 = objc_msgSend(*p_icc, "hasPrefix:", CFSTR("+"));
            v59 = *p_icc;
            if ((v58 & 1) == 0)
            {
              objc_msgSend(CFSTR("+"), "stringByAppendingString:", *p_icc);
              v60 = objc_claimAutoreleasedReturnValue();
              v61 = *p_icc;
              *p_icc = (id)v60;

              v59 = *p_icc;
            }
          }
          else
          {
            v59 = 0;
          }
          if (!v59 && v75)
          {
            objc_msgSend(v9, "messagePhoneNumberIccForCcAcNumber:", v10->_ccAcNumber);
            v62 = objc_claimAutoreleasedReturnValue();
            v63 = v10->_icc;
            v10->_icc = (NSString *)v62;

            v71 = v10->_icc;
            v73 = (__CFString *)v10->_ccAcNumber;
            _WLLog();
            v59 = v10->_icc;
            if (v59)
              goto LABEL_58;
            +[WLMessageParty _guessIccForNumber:](WLMessageParty, "_guessIccForNumber:", v45, v71, v73);
            v64 = objc_claimAutoreleasedReturnValue();
            v65 = *p_icc;
            *p_icc = (id)v64;

            v71 = *p_icc;
            v73 = v45;
            _WLLog();
            v59 = *p_icc;
          }
          if (!v59)
          {
            v66 = v10->_ccAcNumber;
            goto LABEL_60;
          }
LABEL_58:
          objc_msgSend(v59, "stringByAppendingString:", v10->_ccAcNumber, v71, v73);
          v66 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_60:
          v67 = v10->_address;
          v10->_address = v66;

          v53 = v78;
          goto LABEL_43;
        }

      }
    }
    _WLLog();
    v10->_isPhoneNumber = 0;
    +[WLMessageParty _normalize:](WLMessageParty, "_normalize:", v8, v45, v8);
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = v8;
    v8 = (__CFString *)v52;
LABEL_43:

    goto LABEL_44;
  }
  v10->_isPhoneNumber = 0;
  v70 = v10->_address;
  _WLLog();
  +[WLMessageParty _normalize:](WLMessageParty, "_normalize:", v8, v70, v23, v79, (_QWORD)v80, v24, (_QWORD)v81, v25, (_QWORD)v82, v74);
  v45 = v8;
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_44:

LABEL_45:
  if (!v10->_isPhoneNumber)
    goto LABEL_46;
LABEL_47:

  return v10;
}

+ (id)_guessIccForNumber:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v3 = a3;
  if (_guessIccForNumber__onceToken != -1)
    dispatch_once(&_guessIccForNumber__onceToken, &__block_literal_global_279);
  if (_guessIccForNumber__icc)
  {
    objc_msgSend((id)_guessIccForNumber__icc, "stringByAppendingString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_OWORD *)(MEMORY[0x24BE1FAA8] + 16);
    v14 = *(_OWORD *)(MEMORY[0x24BE1FAA8] + 32);
    v15 = *(_OWORD *)(MEMORY[0x24BE1FAA8] + 48);
    v5 = objc_retainAutorelease(v4);
    objc_msgSend(v5, "UTF8String");
    v6 = PNDecomposeForCountry();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", DWORD2(v13));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", DWORD2(v14));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", DWORD2(v15));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

    if ((_DWORD)v6)
      v10 = (id)_guessIccForNumber__icc;
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __37__WLMessageParty__guessIccForNumber___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "countryCode");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_guessIccForNumber__countryCode;
  _guessIccForNumber__countryCode = v1;

  if (!objc_msgSend((id)_guessIccForNumber__countryCode, "length"))
  {
    v3 = (void *)_guessIccForNumber__countryCode;
    _guessIccForNumber__countryCode = (uint64_t)CFSTR("US");

  }
  v4 = _PNCopyInternationalCodeForCountry();
  v5 = (void *)_guessIccForNumber__icc;
  _guessIccForNumber__icc = v4;

  v6 = objc_msgSend((id)_guessIccForNumber__icc, "length");
  v7 = (void *)_guessIccForNumber__icc;
  if (v6)
  {
    objc_msgSend(CFSTR("+"), "stringByAppendingString:", _guessIccForNumber__icc);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)_guessIccForNumber__icc;
  }
  _guessIccForNumber__icc = v6;

  return _WLLog();
}

+ (id)_normalize:(id)a3
{
  uint64_t v3;
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = _normalize__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_normalize__onceToken, &__block_literal_global_284);
  v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("+"));
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("[^0-9]"), &stru_24E376E00, 1024, 0, objc_msgSend(v4, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(CFSTR("+"), "stringByAppendingString:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v6, "hasPrefix:", CFSTR("0")))
    {
      objc_msgSend(v6, "substringFromIndex:", 1);
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("+%@%@"), _normalize__internationalCallingCode, v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v7;

  return v9;
}

void __29__WLMessageParty__normalize___block_invoke()
{
  void *v0;
  const __CFString *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "countryCode");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString length](v5, "length"))
  {
    v1 = v5;
  }
  else
  {

    v1 = CFSTR("US");
  }
  v6 = (__CFString *)v1;
  v2 = _PNCopyInternationalCodeForCountry();
  v3 = (void *)_normalize__internationalCallingCode;
  _normalize__internationalCallingCode = v2;

  if (!objc_msgSend((id)_normalize__internationalCallingCode, "length"))
  {
    v4 = (void *)_normalize__internationalCallingCode;
    _normalize__internationalCallingCode = (uint64_t)CFSTR("1");

  }
  _WLLog();

}

- (BOOL)isPhoneNumber
{
  return self->_isPhoneNumber;
}

- (NSString)address
{
  return self->_address;
}

- (NSString)icc
{
  return self->_icc;
}

- (NSString)np
{
  return self->_np;
}

- (NSString)ccAcNumber
{
  return self->_ccAcNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ccAcNumber, 0);
  objc_storeStrong((id *)&self->_np, 0);
  objc_storeStrong((id *)&self->_icc, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
