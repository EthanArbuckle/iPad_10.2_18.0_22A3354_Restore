@implementation NSLocale(isEqualToLocaleForWeather)

- (uint64_t)isEqualToLocaleForWeather:()isEqualToLocaleForWeather
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  _BYTE v94[44];
  _BYTE v95[12];
  _BYTE v96[12];
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  unint64_t v100;
  id v101;
  id v102;
  __int128 v103;

  v8 = a3;
  objc_msgSend(a1, "localeIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localeIdentifier");
  v101 = (id)objc_claimAutoreleasedReturnValue();
  v102 = v9;
  if (v9 == v101)
  {
    v99 = 0;
    v100 = 0;
    v97 = 0;
    v98 = 0;
    v103 = 0uLL;
    memset(v96, 0, sizeof(v96));
    memset(v95, 0, sizeof(v95));
    v16 = 0;
    v17 = 0;
    memset(v94, 0, sizeof(v94));
    v18 = 0;
    v19 = 0;
    v20 = 0;
    goto LABEL_8;
  }
  objc_msgSend(a1, "localeIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  v4 = v10 != 0;
  v93 = (void *)v10;
  if (v10)
  {
    objc_msgSend(v8, "localeIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v84 = (void *)v11;
      objc_msgSend(a1, "localeIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localeIdentifier");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v12;
      if (objc_msgSend(v12, "isEqualToString:"))
      {
        objc_msgSend(a1, "languageCode");
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "languageCode");
        v13 = objc_claimAutoreleasedReturnValue();
        v59 = (void *)v3;
        if (v3 == v13)
        {
          *(_DWORD *)&v94[24] = 1;
          *(_OWORD *)&v94[28] = 0uLL;
          v98 = 0;
          v99 = 0;
          v103 = 0uLL;
          v97 = 0;
          memset(v96, 0, sizeof(v96));
          memset(v95, 0, sizeof(v95));
          v16 = 0;
          v17 = 0;
          memset(v94, 0, 24);
          v18 = 0;
          v19 = 0;
          v20 = 0;
          v58 = (void *)v3;
          v100 = 0x100000001;
          goto LABEL_8;
        }
        v58 = (void *)v13;
        v14 = 1;
        v15 = 1;
      }
      else
      {
        v15 = 0;
        v14 = 1;
      }
    }
    else
    {
      v84 = 0;
      v14 = 0;
      v15 = 0;
    }
  }
  else
  {
    v14 = 0;
    v15 = 0;
  }
  objc_msgSend(a1, "languageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v5 != 0;
  v100 = __PAIR64__(v14, v15);
  v92 = v5;
  if (v5)
  {
    objc_msgSend(v8, "languageCode");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v82 = (void *)v22;
      objc_msgSend(a1, "languageCode");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "languageCode");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v23;
      if (objc_msgSend(v23, "isEqualToString:"))
      {
        objc_msgSend(a1, "countryCode");
        v6 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "countryCode");
        v24 = objc_claimAutoreleasedReturnValue();
        v57 = (void *)v6;
        if (v6 == v24)
        {
          *(_DWORD *)&v94[24] = v4;
          *(_DWORD *)&v94[28] = 1;
          v103 = 0uLL;
          v97 = 0;
          memset(v96, 0, sizeof(v96));
          memset(v95, 0, sizeof(v95));
          *(_QWORD *)&v94[32] = 0;
          v16 = 0;
          *(_DWORD *)&v94[40] = 0;
          v17 = 0;
          memset(v94, 0, 24);
          v18 = 0;
          v19 = 0;
          v20 = 0;
          v99 = 0x100000001;
          v56 = (void *)v6;
          v98 = 1;
          goto LABEL_8;
        }
        v56 = (void *)v24;
        v6 = 1;
        LODWORD(v98) = 1;
      }
      else
      {
        LODWORD(v98) = 0;
        v6 = 1;
      }
    }
    else
    {
      v82 = 0;
      v6 = 0;
      LODWORD(v98) = 0;
    }
  }
  else
  {
    v6 = 0;
    LODWORD(v98) = 0;
  }
  objc_msgSend(a1, "countryCode");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = __PAIR64__(v3, v6);
  HIDWORD(v103) = v91 != 0;
  *(_DWORD *)&v94[24] = v4;
  if (v91)
  {
    objc_msgSend(v8, "countryCode");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v81 = (void *)v25;
      objc_msgSend(a1, "countryCode");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "countryCode");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v26;
      if (objc_msgSend(v26, "isEqualToString:"))
      {
        objc_msgSend(a1, "scriptCode");
        v4 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "scriptCode");
        v27 = objc_claimAutoreleasedReturnValue();
        v55 = (void *)v4;
        if (v4 == v27)
        {
          *(_DWORD *)&v94[28] = 1;
          *(_QWORD *)((char *)&v103 + 4) = 0;
          memset(v96, 0, sizeof(v96));
          memset(v95, 0, sizeof(v95));
          *(_QWORD *)&v94[32] = 0;
          v16 = 0;
          LODWORD(v103) = 0;
          *(_DWORD *)&v94[40] = 0;
          v17 = 0;
          memset(v94, 0, 20);
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_DWORD *)&v94[20] = 1;
          HIDWORD(v103) = 1;
          HIDWORD(v98) = 1;
          v54 = (void *)v4;
          v97 = 1;
          goto LABEL_8;
        }
        v54 = (void *)v27;
        v4 = 1;
        LODWORD(v97) = 1;
      }
      else
      {
        LODWORD(v97) = 0;
        v4 = 1;
      }
    }
    else
    {
      v81 = 0;
      v4 = 0;
      LODWORD(v97) = 0;
    }
  }
  else
  {
    v4 = 0;
    LODWORD(v97) = 0;
  }
  objc_msgSend(a1, "scriptCode");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v98) = v4;
  DWORD2(v103) = v90 != 0;
  if (v90)
  {
    objc_msgSend(v8, "scriptCode");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v80 = (void *)v28;
      objc_msgSend(a1, "scriptCode");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scriptCode");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v29;
      if (objc_msgSend(v29, "isEqualToString:"))
      {
        objc_msgSend(a1, "calendarIdentifier");
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "calendarIdentifier");
        v30 = objc_claimAutoreleasedReturnValue();
        v53 = (void *)v3;
        if (v3 == v30)
        {
          *(_DWORD *)&v94[28] = 1;
          *(_QWORD *)&v94[8] = 0;
          HIDWORD(v97) = 0;
          memset(v95, 0, sizeof(v95));
          *(_QWORD *)&v103 = 0;
          *(_QWORD *)&v94[32] = 0;
          v16 = 0;
          *(_DWORD *)&v94[40] = 0;
          v17 = 0;
          *(_QWORD *)v94 = 0;
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_QWORD *)&v94[16] = 0x100000001;
          DWORD2(v103) = 1;
          *(_QWORD *)&v96[4] = 1;
          v52 = (void *)v3;
          *(_DWORD *)v96 = 1;
          goto LABEL_8;
        }
        v52 = (void *)v30;
        *(_QWORD *)v96 = 0x100000001;
      }
      else
      {
        *(_QWORD *)v96 = 0x100000000;
      }
    }
    else
    {
      v80 = 0;
      *(_QWORD *)v96 = 0;
    }
  }
  else
  {
    *(_QWORD *)v96 = 0;
  }
  objc_msgSend(a1, "calendarIdentifier");
  v31 = objc_claimAutoreleasedReturnValue();
  v3 = v31 != 0;
  v89 = (void *)v31;
  if (v31)
  {
    objc_msgSend(v8, "calendarIdentifier");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v79 = (void *)v32;
      objc_msgSend(a1, "calendarIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "calendarIdentifier");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (void *)v15;
      if (objc_msgSend((id)v15, "isEqualToString:"))
      {
        objc_msgSend(a1, "decimalSeparator");
        v15 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "decimalSeparator");
        v33 = objc_claimAutoreleasedReturnValue();
        if (v15 == v33)
        {
          *(_DWORD *)&v94[28] = 1;
          *(_QWORD *)&v94[4] = 0;
          *(_QWORD *)&v103 = 0;
          *(_DWORD *)&v96[8] = 0;
          *(_QWORD *)&v94[32] = 0;
          v16 = 0;
          *(_DWORD *)&v94[40] = 0;
          v44 = (void *)v15;
          v17 = 0;
          *(_DWORD *)v94 = 0;
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_DWORD *)&v94[16] = 1;
          *(_DWORD *)&v94[20] = 1;
          *(_DWORD *)&v94[12] = 1;
          HIDWORD(v97) = 1;
          *(_QWORD *)&v95[4] = 1;
          v88 = v44;
          v51 = v44;
          *(_DWORD *)v95 = 1;
          goto LABEL_8;
        }
        v51 = (void *)v33;
        *(_QWORD *)v95 = 0x100000001;
      }
      else
      {
        *(_QWORD *)v95 = 0x100000000;
      }
    }
    else
    {
      v79 = 0;
      *(_QWORD *)v95 = 0;
    }
  }
  else
  {
    *(_QWORD *)v95 = 0;
  }
  objc_msgSend(a1, "decimalSeparator");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v97) = v3;
  DWORD1(v103) = v87 != 0;
  v88 = (void *)v15;
  if (v87)
  {
    objc_msgSend(v8, "decimalSeparator");
    v34 = objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v78 = (void *)v34;
      objc_msgSend(a1, "decimalSeparator");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "decimalSeparator");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = (void *)v14;
      if (objc_msgSend((id)v14, "isEqualToString:"))
      {
        objc_msgSend(a1, "groupingSeparator");
        v14 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "groupingSeparator");
        v35 = objc_claimAutoreleasedReturnValue();
        if (v14 == v35)
        {
          *(_DWORD *)&v94[28] = 1;
          v45 = (void *)v14;
          v16 = 0;
          *(_QWORD *)&v94[36] = 0;
          v17 = 0;
          *(_DWORD *)&v95[8] = 0;
          *(_QWORD *)v94 = 0;
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_QWORD *)&v94[16] = 0x100000001;
          *(_QWORD *)&v94[8] = 0x100000001;
          *(_QWORD *)&v103 = 0x100000000;
          *(_DWORD *)&v96[8] = 1;
          v86 = v45;
          v50 = v45;
          *(_DWORD *)&v94[32] = 1;
          goto LABEL_8;
        }
        v50 = (void *)v35;
        v4 = 1;
        *(_DWORD *)&v94[32] = 1;
      }
      else
      {
        *(_DWORD *)&v94[32] = 0;
        v4 = 1;
      }
    }
    else
    {
      v78 = 0;
      v4 = 0;
      *(_DWORD *)&v94[32] = 0;
    }
  }
  else
  {
    v4 = 0;
    *(_DWORD *)&v94[32] = 0;
  }
  objc_msgSend(a1, "groupingSeparator");
  v36 = objc_claimAutoreleasedReturnValue();
  LODWORD(v103) = v36 != 0;
  v85 = (void *)v36;
  *(_DWORD *)&v96[8] = v4;
  v86 = (void *)v14;
  if (v36)
  {
    objc_msgSend(v8, "groupingSeparator");
    v37 = objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      v77 = (void *)v37;
      objc_msgSend(a1, "groupingSeparator");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "groupingSeparator");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v38;
      if (objc_msgSend(v38, "isEqualToString:"))
      {
        objc_msgSend(a1, "quotationBeginDelimiter");
        v6 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "quotationBeginDelimiter");
        v39 = objc_claimAutoreleasedReturnValue();
        v49 = (void *)v6;
        if (v6 == v39)
        {
          *(_DWORD *)&v94[28] = 1;
          v17 = 0;
          *(_DWORD *)&v95[8] = 0;
          *(_QWORD *)v94 = 0;
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_DWORD *)&v94[16] = 1;
          *(_DWORD *)&v94[20] = 1;
          *(_DWORD *)&v94[8] = 1;
          *(_DWORD *)&v94[12] = 1;
          v16 = 1;
          LODWORD(v103) = 1;
          *(_DWORD *)&v94[40] = 1;
          v48 = (void *)v6;
          *(_DWORD *)&v94[36] = 1;
          goto LABEL_8;
        }
        v48 = (void *)v39;
        *(_DWORD *)&v94[36] = 1;
        *(_DWORD *)&v94[40] = 1;
      }
      else
      {
        *(_DWORD *)&v94[36] = 0;
        *(_DWORD *)&v94[40] = 1;
      }
    }
    else
    {
      v77 = 0;
      *(_QWORD *)&v94[36] = 0;
    }
  }
  else
  {
    *(_QWORD *)&v94[36] = 0;
  }
  objc_msgSend(a1, "quotationBeginDelimiter");
  v6 = objc_claimAutoreleasedReturnValue();
  v83 = (void *)v6;
  if (v6)
  {
    objc_msgSend(v8, "quotationBeginDelimiter");
    v40 = objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      v72 = (void *)v40;
      objc_msgSend(a1, "quotationBeginDelimiter");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "quotationBeginDelimiter");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v41;
      if (objc_msgSend(v41, "isEqualToString:"))
      {
        objc_msgSend(a1, "quotationEndDelimiter");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "quotationEndDelimiter");
        v42 = objc_claimAutoreleasedReturnValue();
        v47 = v5;
        if (v5 != (void *)v42)
        {
          *(_QWORD *)v94 = 0x100000001;
          objc_msgSend(a1, "quotationEndDelimiter", v42, v5, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59);
          goto LABEL_69;
        }
        *(_DWORD *)&v94[28] = 1;
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_DWORD *)&v94[16] = 1;
        *(_DWORD *)&v94[20] = 1;
        *(_DWORD *)&v94[8] = 1;
        *(_DWORD *)&v94[12] = 1;
        v16 = 1;
        v17 = 1;
        *(_DWORD *)&v95[8] = 1;
        *(_DWORD *)&v94[4] = 1;
        v46 = v5;
        *(_DWORD *)v94 = 1;
LABEL_8:
        v21 = 1;
        goto LABEL_75;
      }
      *(_QWORD *)v94 = 0x100000000;
    }
    else
    {
      v72 = 0;
      *(_QWORD *)v94 = 0;
    }
  }
  else
  {
    *(_QWORD *)v94 = 0;
  }
  objc_msgSend(a1, "quotationEndDelimiter", v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59);
LABEL_69:
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v95[8] = v6 != 0;
  if (v5)
  {
    objc_msgSend(v8, "quotationEndDelimiter");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(a1, "quotationEndDelimiter");
      v4 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "quotationEndDelimiter");
      v3 = objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend((id)v4, "isEqualToString:", v3);
      v20 = 1;
    }
    else
    {
      v20 = 0;
      v21 = 0;
    }
    *(_DWORD *)&v94[28] = 1;
    *(_QWORD *)&v94[16] = 0x100000001;
    *(_QWORD *)&v94[8] = 0x100000001;
    v16 = 1;
    v17 = 1;
    v18 = 1;
    v19 = 1;
  }
  else
  {
    v19 = 0;
    v20 = 0;
    v21 = 0;
    *(_DWORD *)&v94[28] = 1;
    *(_QWORD *)&v94[16] = 0x100000001;
    *(_QWORD *)&v94[8] = 0x100000001;
    v16 = 1;
    v17 = 1;
    v18 = 1;
  }
LABEL_75:
  if (v20)
  {

  }
  if (v19)

  if (v18)
  if (*(_DWORD *)v94)
  {

  }
  if (*(_DWORD *)&v94[4])
  {

  }
  if (*(_DWORD *)&v95[8])

  if (v17)
  if (*(_DWORD *)&v94[36])
  {

  }
  if (*(_DWORD *)&v94[40])
  {

  }
  if ((_DWORD)v103)

  if (v16)
  if (*(_DWORD *)&v94[32])
  {

  }
  if (*(_DWORD *)&v96[8])
  {

  }
  if (DWORD1(v103))

  if (*(_DWORD *)&v94[8])
  if (*(_DWORD *)v95)
  {

  }
  if (*(_DWORD *)&v95[4])
  {

  }
  if (HIDWORD(v97))

  if (*(_DWORD *)&v94[12])
  if (*(_DWORD *)v96)
  {

  }
  if (*(_DWORD *)&v96[4])
  {

  }
  if (DWORD2(v103))

  if (*(_DWORD *)&v94[16])
  if ((_DWORD)v97)
  {

  }
  if (HIDWORD(v98))
  {

  }
  if (HIDWORD(v103))

  if (*(_DWORD *)&v94[20])
  {

    if (!(_DWORD)v98)
      goto LABEL_129;
  }
  else if (!(_DWORD)v98)
  {
LABEL_129:
    if ((_DWORD)v99)
      goto LABEL_130;
LABEL_134:
    if (!HIDWORD(v99))
      goto LABEL_136;
    goto LABEL_135;
  }

  if (!(_DWORD)v99)
    goto LABEL_134;
LABEL_130:

  if (HIDWORD(v99))
LABEL_135:

LABEL_136:
  if (*(_DWORD *)&v94[28])
  {

    if (!(_DWORD)v100)
      goto LABEL_138;
  }
  else if (!(_DWORD)v100)
  {
LABEL_138:
    if (!HIDWORD(v100))
      goto LABEL_140;
    goto LABEL_139;
  }

  if (HIDWORD(v100))
  {
LABEL_139:

  }
LABEL_140:
  if (*(_DWORD *)&v94[24])

  if (v102 != v101)
  return v21;
}

@end
