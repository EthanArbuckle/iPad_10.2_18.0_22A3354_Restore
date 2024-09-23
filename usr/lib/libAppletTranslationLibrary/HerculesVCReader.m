@implementation HerculesVCReader

+ (id)readBalancesFromVC:(id)a3 forCity:(id)a4 withError:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t v48;
  NSObject *v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void **v54;
  uint64_t *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  _QWORD v68[2];
  _QWORD v69[2];
  uint64_t v70;
  void *v71;
  _QWORD v72[2];
  _QWORD v73[2];
  uint64_t v74;
  uint64_t v75;
  _QWORD v76[2];
  _QWORD v77[2];
  uint64_t v78;
  uint64_t v79;
  uint8_t buf[4];
  uint64_t v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v67 = 0;
  +[MifareUtils getMcmDataDal:withTransceiver:withError:](MifareUtils, "getMcmDataDal:withTransceiver:withError:", 21071, v7, &v67);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v67;
  if (v10)
  {
    v11 = v10;
    if (a5)
    {
      v11 = objc_retainAutorelease(v10);
      v12 = 0;
      *a5 = v11;
      goto LABEL_53;
    }
LABEL_20:
    v12 = 0;
    goto LABEL_53;
  }
  if (objc_msgSend(v9, "length") != 352)
  {
    ATLLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(v9, "length");
      *(_DWORD *)buf = 134217984;
      v81 = v16;
      _os_log_impl(&dword_1C3511000, v15, OS_LOG_TYPE_ERROR, "Unexpected RTA Data length %lu", buf, 0xCu);
    }

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected RTA Data length %lu"), objc_msgSend(v9, "length"));
    v18 = (void *)v17;
    if (a5)
    {
      v19 = *a5;
      v20 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v21 = *MEMORY[0x1E0CB3388];
        v76[0] = *MEMORY[0x1E0CB2D50];
        v76[1] = v21;
        v77[0] = v17;
        v77[1] = v19;
        v22 = (void *)MEMORY[0x1E0C99D80];
        v23 = v77;
        v24 = v76;
        v25 = 2;
      }
      else
      {
        v78 = *MEMORY[0x1E0CB2D50];
        v79 = v17;
        v22 = (void *)MEMORY[0x1E0C99D80];
        v23 = &v79;
        v24 = &v78;
        v25 = 1;
      }
      objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v28);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v11 = 0;
    goto LABEL_20;
  }
  v66 = 0;
  +[MifareUtils getMcmDataDal:withTransceiver:withError:](MifareUtils, "getMcmDataDal:withTransceiver:withError:", 21327, v7, &v66);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v66;
  if (v14)
  {
    v11 = v14;
    if (a5)
    {
      v11 = objc_retainAutorelease(v14);
      v12 = 0;
      *a5 = v11;
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v65 = 0;
    +[HerculesVCReader getCurrentTransitSummary:withError:](HerculesVCReader, "getCurrentTransitSummary:withError:", v13, &v65);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v65;
    if (v27)
    {
      v11 = v27;
      if (a5)
      {
        v11 = objc_retainAutorelease(v27);
        v12 = 0;
        *a5 = v11;
      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      v62 = v26;
      v29 = objc_retainAutorelease(v26);
      v30 = *(_BYTE *)(objc_msgSend(v29, "bytes") + 15) & 3;
      if ((_DWORD)v30 == 1)
      {
        v31 = (void *)MEMORY[0x1E0C99D50];
        v32 = objc_retainAutorelease(v9);
        objc_msgSend(v31, "dataWithReversedBytes:length:", objc_msgSend(v32, "bytes"), 16);
        v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v34 = *(_BYTE *)(objc_msgSend(v33, "bytes") + 15) & 3;
        v61 = v33;
        if ((_DWORD)v34 == 1)
        {
          v60 = v13;
          v35 = objc_msgSend(v33, "u8:", 7);
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 6);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = 0;
          while (1)
          {
            v64 = 0;
            +[HerculesVCReader getBalanceForPass:withRiderClass:withTransitSummary:withRTAData:forCity:withError:](HerculesVCReader, "getBalanceForPass:withRiderClass:withTransitSummary:withRTAData:forCity:withError:", v36, v35, v29, v32, v8, &v64);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v64;
            v11 = v38;
            if (v38)
              break;
            if (v37)
              objc_msgSend(v63, "addObject:", v37);

            if (++v36 == 6)
            {
              v12 = v63;
              v63 = v12;
              goto LABEL_43;
            }
          }
          if (a5)
            *a5 = objc_retainAutorelease(v38);

          v12 = 0;
LABEL_43:
          v13 = v60;
        }
        else
        {
          ATLLogObject();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v81) = v34;
            _os_log_impl(&dword_1C3511000, v49, OS_LOG_TYPE_ERROR, "Unexpected Issue Object data format %hhu", buf, 8u);
          }

          v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected Issue Object data format %hhu"), v34);
          if (a5)
          {
            v50 = *a5;
            v51 = (void *)MEMORY[0x1E0CB35C8];
            if (*a5)
            {
              v52 = *MEMORY[0x1E0CB3388];
              v68[0] = *MEMORY[0x1E0CB2D50];
              v68[1] = v52;
              v69[0] = v63;
              v69[1] = v50;
              v53 = (void *)MEMORY[0x1E0C99D80];
              v54 = (void **)v69;
              v55 = v68;
              v56 = 2;
            }
            else
            {
              v70 = *MEMORY[0x1E0CB2D50];
              v71 = v63;
              v53 = (void *)MEMORY[0x1E0C99D80];
              v54 = &v71;
              v55 = &v70;
              v56 = 1;
            }
            objc_msgSend(v53, "dictionaryWithObjects:forKeys:count:", v54, v55, v56);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v58);
            *a5 = (id)objc_claimAutoreleasedReturnValue();

          }
          v11 = 0;
          v12 = 0;
        }
        v26 = v62;

      }
      else
      {
        ATLLogObject();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v81) = v30;
          _os_log_impl(&dword_1C3511000, v39, OS_LOG_TYPE_ERROR, "Unexpected Transit Summary data format %hhu", buf, 8u);
        }

        v40 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected Transit Summary data format %hhu"), v30);
        v41 = (void *)v40;
        if (a5)
        {
          v42 = *a5;
          v43 = (void *)MEMORY[0x1E0CB35C8];
          if (*a5)
          {
            v44 = *MEMORY[0x1E0CB3388];
            v72[0] = *MEMORY[0x1E0CB2D50];
            v72[1] = v44;
            v73[0] = v40;
            v73[1] = v42;
            v45 = (void *)MEMORY[0x1E0C99D80];
            v46 = v73;
            v47 = v72;
            v48 = 2;
          }
          else
          {
            v74 = *MEMORY[0x1E0CB2D50];
            v75 = v40;
            v45 = (void *)MEMORY[0x1E0C99D80];
            v46 = &v75;
            v47 = &v74;
            v48 = 1;
          }
          objc_msgSend(v45, "dictionaryWithObjects:forKeys:count:", v46, v47, v48);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v57);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        v11 = 0;
        v12 = 0;
        v26 = v62;
      }
    }

  }
LABEL_53:

  return v12;
}

+ (id)getCurrentTransitSummary:(id)a3 withError:(id *)a4
{
  id v5;
  id v6;
  unsigned int v7;
  unsigned int v8;
  id v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _QWORD v31[2];
  _QWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "length") == 32)
  {
    v6 = objc_retainAutorelease(v5);
    v7 = *(unsigned __int8 *)(objc_msgSend(v6, "bytes") + 13);
    v8 = v7 >> 4;
    v9 = objc_retainAutorelease(v6);
    v10 = *(unsigned __int8 *)(objc_msgSend(v9, "bytes") + 29);
    v11 = v10 >> 4;
    if (v7 >> 4 <= v10 >> 4)
      v12 = v10 >> 4;
    else
      v12 = v7 >> 4;
    if (v8 >= v10 >> 4)
      v13 = v10 >> 4;
    else
      v13 = v7 >> 4;
    v14 = (void *)MEMORY[0x1E0C99D50];
    v15 = objc_msgSend(objc_retainAutorelease(v9), "bytes");
    v16 = v15;
    if (v13)
      v17 = 0;
    else
      v17 = v12 == 15;
    if (v17)
    {
      if (v7 < 0x10)
      {
LABEL_21:
        objc_msgSend(v14, "dataWithReversedBytes:length:", v16, 16);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      }
    }
    else if (v8 >= v11)
    {
      goto LABEL_21;
    }
    v16 = v15 + 16;
    goto LABEL_21;
  }
  ATLLogObject();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v36 = objc_msgSend(v5, "length");
    _os_log_impl(&dword_1C3511000, v18, OS_LOG_TYPE_ERROR, "Unexpected Transit Summary length %lu", buf, 0xCu);
  }

  v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected Transit Summary length %lu"), objc_msgSend(v5, "length"));
  v20 = (void *)v19;
  if (a4)
  {
    v21 = *a4;
    v22 = (void *)MEMORY[0x1E0CB35C8];
    if (*a4)
    {
      v23 = *MEMORY[0x1E0CB3388];
      v31[0] = *MEMORY[0x1E0CB2D50];
      v31[1] = v23;
      v32[0] = v19;
      v32[1] = v21;
      v24 = (void *)MEMORY[0x1E0C99D80];
      v25 = v32;
      v26 = v31;
      v27 = 2;
    }
    else
    {
      v33 = *MEMORY[0x1E0CB2D50];
      v34 = v19;
      v24 = (void *)MEMORY[0x1E0C99D80];
      v25 = &v34;
      v26 = &v33;
      v27 = 1;
    }
    objc_msgSend(v24, "dictionaryWithObjects:forKeys:count:", v25, v26, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v29);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v28 = 0;
LABEL_25:

  return v28;
}

+ (id)getBalanceForPass:(unint64_t)a3 withRiderClass:(unsigned __int8)a4 withTransitSummary:(id)a5 withRTAData:(id)a6 forCity:(id)a7 withError:(id *)a8
{
  uint64_t v11;
  id v13;
  id v14;
  id v15;
  id v16;
  unsigned int v17;
  void *v18;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  id v46;
  uint64_t v47;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t v54;
  id v55;
  unsigned __int8 v56;
  _QWORD v57[4];
  _QWORD v58[4];
  _QWORD v59[2];
  _QWORD v60[2];
  uint64_t v61;
  uint64_t v62;
  _QWORD v63[2];
  _QWORD v64[2];
  uint64_t v65;
  uint64_t v66;
  uint8_t buf[4];
  int v68;
  uint64_t v69;

  v11 = a4;
  v69 = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = objc_retainAutorelease(v13);
  if (*(char *)(objc_msgSend(v16, "bytes") + 8 - a3) < 0)
  {
    v17 = *(_BYTE *)(objc_msgSend(objc_retainAutorelease(v16), "bytes") + 8 - a3) & 0x3F;
    if (v17 != 63)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithReversedBytes:length:", objc_msgSend(objc_retainAutorelease(v14), "bytes") + 16 * a3 + 64, 16);
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v21 = *(_BYTE *)(objc_msgSend(v20, "bytes") + 15) & 3;
      if ((_DWORD)v21 != 1)
      {
        ATLLogObject();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v68 = v21;
          _os_log_impl(&dword_1C3511000, v29, OS_LOG_TYPE_ERROR, "Unexpected Pass Object data format %hhu", buf, 8u);
        }

        v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected Pass Object data format %hhu"), v21);
        v28 = (void *)v30;
        if (a8)
        {
          v31 = *a8;
          v32 = (void *)MEMORY[0x1E0CB35C8];
          if (*a8)
          {
            v33 = *MEMORY[0x1E0CB3388];
            v63[0] = *MEMORY[0x1E0CB2D50];
            v63[1] = v33;
            v64[0] = v30;
            v64[1] = v31;
            v34 = (void *)MEMORY[0x1E0C99D80];
            v35 = v64;
            v36 = v63;
            v37 = 2;
          }
          else
          {
            v65 = *MEMORY[0x1E0CB2D50];
            v66 = v30;
            v34 = (void *)MEMORY[0x1E0C99D80];
            v35 = &v66;
            v36 = &v65;
            v37 = 1;
          }
          objc_msgSend(v34, "dictionaryWithObjects:forKeys:count:", v35, v36, v37);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v40);
          *a8 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_19;
      }
      v22 = objc_retainAutorelease(v20);
      v23 = *(unsigned __int8 *)(objc_msgSend(v22, "bytes") + 14);
      v24 = objc_retainAutorelease(v22);
      v25 = *(unsigned __int8 *)(objc_msgSend(v24, "bytes") + 9);
      v56 = 0;
      v55 = 0;
      v26 = +[HerculesFareTables getProductIDWithTicketType:withOperatorID:withRiderClass:forCity:withProductCategory:withError:](HerculesFareTables, "getProductIDWithTicketType:withOperatorID:withRiderClass:forCity:withProductCategory:withError:", v25, v23, v11, v15, &v56, &v55);
      v27 = v55;
      v28 = v27;
      if (v27)
      {
        if (a8)
        {
          v18 = 0;
          *a8 = objc_retainAutorelease(v27);
LABEL_33:

          goto LABEL_4;
        }
LABEL_19:
        v18 = 0;
        goto LABEL_33;
      }
      if (v56 == 1)
      {
        if (!v17)
          goto LABEL_19;
        v39 = 0;
        v38 = CFSTR("XXX");
      }
      else
      {
        if (v56 != 3)
        {
          ATLLogObject();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            v68 = v56;
            _os_log_impl(&dword_1C3511000, v45, OS_LOG_TYPE_ERROR, "Unexpected product category %d", buf, 8u);
          }

          v46 = objc_alloc(MEMORY[0x1E0CB3940]);
          v47 = objc_msgSend(v46, "initWithFormat:", CFSTR("Unexpected product category %d"), v56);
          v41 = (void *)v47;
          if (!a8)
          {
            v18 = 0;
LABEL_32:

            goto LABEL_33;
          }
          v48 = *a8;
          v49 = (void *)MEMORY[0x1E0CB35C8];
          if (*a8)
          {
            v50 = *MEMORY[0x1E0CB3388];
            v59[0] = *MEMORY[0x1E0CB2D50];
            v59[1] = v50;
            v60[0] = v47;
            v60[1] = v48;
            v51 = (void *)MEMORY[0x1E0C99D80];
            v52 = v60;
            v53 = v59;
            v54 = 2;
          }
          else
          {
            v61 = *MEMORY[0x1E0CB2D50];
            v62 = v47;
            v51 = (void *)MEMORY[0x1E0C99D80];
            v52 = &v62;
            v53 = &v61;
            v54 = 1;
          }
          objc_msgSend(v51, "dictionaryWithObjects:forKeys:count:", v52, v53, v54);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v42);
          v18 = 0;
          *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

          goto LABEL_32;
        }
        v17 = bswap32(*(_DWORD *)(objc_msgSend(objc_retainAutorelease(v24), "bytes") + 10)) >> 13;
        v38 = CFSTR("USD");
        v39 = 2;
      }
      v57[0] = CFSTR("Balance");
      objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", v17, -(int)v39, 0);
      v58[0] = objc_claimAutoreleasedReturnValue();
      v58[1] = v38;
      v41 = (void *)v58[0];
      v57[1] = CFSTR("BalanceCurrency");
      v57[2] = CFSTR("BalanceCurrencyExponent");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v39);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v58[2] = v42;
      v57[3] = CFSTR("BalanceIdentifier");
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithIntBE:", v26);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "asHexString");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v58[3] = v44;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_31;
    }
  }
  v18 = 0;
LABEL_4:

  return v18;
}

@end
