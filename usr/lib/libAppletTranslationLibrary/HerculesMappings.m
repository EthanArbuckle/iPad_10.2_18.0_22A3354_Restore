@implementation HerculesMappings

+ (id)getStationCode:(id)a3 withTransitInformation:(id)a4 forCity:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(a5, "intValue") == 5)
  {
    v9 = objc_msgSend(v8, "u8:", 0);
    v10 = objc_msgSend(v8, "u16BE:", 1);
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", objc_msgSend(v7, "length") + 3);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendShortBE:", v10);
    objc_msgSend(v11, "appendByte:", v9);
    objc_msgSend(v11, "appendData:", v7);
  }
  else
  {
    v11 = v7;
  }

  return v11;
}

+ (id)getStationMode:(id)a3 forCity:(id)a4
{
  id v5;
  id v6;
  int v7;
  int v8;
  const __CFString *v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "u8:", 3);
  v8 = objc_msgSend(v6, "intValue");

  v9 = CFSTR("StartStation");
  if (v8 == 1)
  {
    if (v7 == 2 || v7 == 12)
      v9 = CFSTR("EndStation");
  }
  else if (v8 == 7 && objc_msgSend(v5, "u16BE:", 1) == 4 && (v7 - 64) < 4u)
  {
    v9 = off_1E7D8AEC0[(char)(v7 - 64)];
  }

  return (id)v9;
}

+ (id)getTransitModality:(id)a3 forCity:(id)a4
{
  id v5;
  int v6;
  uint64_t v7;
  __CFString **v8;
  unsigned int v9;
  const __CFString *v10;
  uint64_t v11;

  v5 = a3;
  v6 = objc_msgSend(a4, "intValue");
  if (v6 != 1)
  {
    if (v6 == 5)
    {
      LOBYTE(v7) = objc_msgSend(v5, "u8:", 0) - 1;
      if (v7 < 4u)
      {
        v7 = (char)v7;
        v8 = off_1E7D8AF08;
        goto LABEL_12;
      }
    }
    else if (v6 == 7)
    {
      LODWORD(v7) = objc_msgSend(v5, "u8:", 0) - 2;
      if (v7 < 5)
      {
        v7 = (char)v7;
        v8 = off_1E7D8AEE0;
LABEL_12:
        v10 = v8[v7];
        goto LABEL_21;
      }
    }
LABEL_20:
    v10 = CFSTR("Transit");
    goto LABEL_21;
  }
  v9 = objc_msgSend(v5, "u16BE:", 1);
  if (v9 > 0x3D)
    goto LABEL_15;
  if (((1 << v9) & 0x2008020000200044) != 0)
    goto LABEL_17;
  if (((1 << v9) & 0x400038) == 0)
  {
    if (v9 == 23)
    {
      v10 = CFSTR("PurchaseAdmissionParking");
      goto LABEL_21;
    }
LABEL_15:
    v11 = v9 - 81;
    if (v11 <= 0x3C)
    {
      if (((1 << (v9 - 81)) & 0x1000010040100401) != 0)
        goto LABEL_17;
      if (v11 == 50)
        goto LABEL_9;
    }
    if (v9 != 71)
      goto LABEL_20;
LABEL_17:
    v10 = CFSTR("TransitBus");
    goto LABEL_21;
  }
LABEL_9:
  v10 = CFSTR("TransitTrain");
LABEL_21:

  return (id)v10;
}

+ (id)processEnRouteStatus:(id)a3 forTransitInformation:(id)a4 forCity:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  int v11;
  const __CFString *v12;
  const __CFString *v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v8, "u8:", 3);
  v11 = objc_msgSend(v9, "intValue");

  if (v11 == 1)
  {
    switch(v10)
    {
      case 1:
      case 11:
        goto LABEL_8;
      case 2:
      case 12:
        goto LABEL_9;
      case 9:
        goto LABEL_11;
      default:
        break;
    }
  }
  else if (v11 == 7 && objc_msgSend(v8, "u16BE:", 1) == 4)
  {
    if ((v10 - 63) <= 4)
    {
      if (((1 << (v10 - 63)) & 0x16) == 0)
      {
LABEL_8:
        objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("Start"), CFSTR("InternalEnRouteStatus"));
        v12 = CFSTR("EnRoute");
        v13 = CFSTR("IgnoreReason");
LABEL_13:
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v13);
        goto LABEL_14;
      }
LABEL_9:
      v12 = CFSTR("End");
LABEL_12:
      v13 = CFSTR("InternalEnRouteStatus");
      goto LABEL_13;
    }
    if ((v10 - 61) <= 1)
    {
LABEL_11:
      v12 = CFSTR("Cancel");
      goto LABEL_12;
    }
  }
LABEL_14:

  return v7;
}

+ (id)mergeTaps:(id)a3 forCity:(id)a4 outEnRoute:(id *)a5
{
  id v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    v7 = 1;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("InternalEnRouteStatus"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        if ((v7 & 1) != 0
          && ((objc_msgSend(CFSTR("Start"), "isEqualToString:", v9) & 1) != 0
           || objc_msgSend(CFSTR("Transfer"), "isEqualToString:", v9)))
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TypeDetail"));
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (objc_msgSend(CFSTR("End"), "isEqualToString:", v9))
        {
          v10 = v6 + 1;
          if (v6 + 1 < (unint64_t)objc_msgSend(v5, "count"))
          {
            while (1)
            {
              objc_msgSend(v5, "objectAtIndexedSubscript:", v10);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("InternalEnRouteStatus"));
              v12 = objc_claimAutoreleasedReturnValue();
              if (v12)
                break;

              if (++v10 >= (unint64_t)objc_msgSend(v5, "count"))
              {
                v7 = 0;
                v10 = v6;
                goto LABEL_15;
              }
            }
            v13 = (void *)v12;
            if ((objc_msgSend(CFSTR("End"), "isEqualToString:", v12) & 1) == 0
              && (objc_msgSend(CFSTR("Cancel"), "isEqualToString:", v13) & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v11);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("Merged"), CFSTR("IgnoreReason"));
              objc_msgSend(v5, "setObject:atIndexedSubscript:", v14, v10);
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v8);
              v22 = v14;
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("StartStation"));
              v15 = objc_claimAutoreleasedReturnValue();
              if (v15)
                objc_msgSend(v23, "setObject:forKeyedSubscript:", v15, CFSTR("StartStation"));
              v21 = (void *)v15;
              objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, CFSTR("MergedStartRecord"));
              objc_msgSend(v5, "setObject:atIndexedSubscript:", v23, v6);
              ATLLogObject();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("SerialNumber"));
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("SerialNumber"));
                v18 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 67109890;
                v26 = v10;
                v27 = 2112;
                v28 = v17;
                v29 = 1024;
                v30 = v6;
                v31 = 2112;
                v32 = v18;
                v19 = (void *)v18;
                _os_log_impl(&dword_1C3511000, v16, OS_LOG_TYPE_DEFAULT, "Merged events %u (SN %@) --> %u (SN %@)", buf, 0x22u);

              }
            }

            v7 = 0;
            goto LABEL_15;
          }
        }
        v7 = 0;
      }
      v10 = v6;
LABEL_15:

      v6 = v10 + 1;
    }
    while (v10 + 1 < (unint64_t)objc_msgSend(v5, "count"));
  }
  return v5;
}

+ (id)addBalancesFromVC:(id)a3 withTransceiver:(id)a4 forCity:(id)a5 withError:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  void *v36;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  id obj;
  _QWORD v44[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  _QWORD v50[2];
  _QWORD v51[2];
  uint64_t v52;
  uint64_t v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((objc_msgSend(v11, "intValue") | 4) == 5)
  {
    v49 = 0;
    +[HerculesVCReader readBalancesFromVC:forCity:withError:](HerculesVCReader, "readBalancesFromVC:forCity:withError:", v10, v11, &v49);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v49;
    if (v13 && +[AppletTranslator isInternalBuild]())
    {
      v14 = 0;
      if (a6)
        *a6 = objc_retainAutorelease(v13);
    }
    else
    {
      v38 = v13;
      v39 = v11;
      v40 = v10;
      v15 = (void *)objc_msgSend(v9, "mutableCopy");
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      obj = v12;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v46;
        v19 = MEMORY[0x1E0C809B0];
        v41 = v9;
        v42 = v15;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v46 != v18)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            v44[0] = v19;
            v44[1] = 3221225472;
            v44[2] = __72__HerculesMappings_addBalancesFromVC_withTransceiver_forCity_withError___block_invoke;
            v44[3] = &unk_1E7D8AEA0;
            v44[4] = v21;
            Find(v9, v44);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              if (+[AppletTranslator isInternalBuild]() && (objc_msgSend(v21, "isEqual:", v22) & 1) == 0)
              {
                ATLLogObject();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v55 = v21;
                  v56 = 2112;
                  v57 = v22;
                  _os_log_impl(&dword_1C3511000, v25, OS_LOG_TYPE_ERROR, "Found a balance discrepancy %@ %@", buf, 0x16u);
                }

                v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Found a balance discrepancy %@ %@"), v21, v22);
                v28 = (void *)v27;
                v11 = v39;
                v10 = v40;
                v13 = v38;
                if (a6)
                {
                  v29 = *a6;
                  v30 = (void *)MEMORY[0x1E0CB35C8];
                  if (*a6)
                  {
                    v31 = *MEMORY[0x1E0CB3388];
                    v50[0] = *MEMORY[0x1E0CB2D50];
                    v50[1] = v31;
                    v51[0] = v27;
                    v51[1] = v29;
                    v32 = (void *)MEMORY[0x1E0C99D80];
                    v33 = v51;
                    v34 = v50;
                    v35 = 2;
                  }
                  else
                  {
                    v52 = *MEMORY[0x1E0CB2D50];
                    v53 = v27;
                    v32 = (void *)MEMORY[0x1E0C99D80];
                    v33 = &v53;
                    v34 = &v52;
                    v35 = 1;
                  }
                  objc_msgSend(v32, "dictionaryWithObjects:forKeys:count:", v33, v34, v35);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v36);
                  *a6 = (id)objc_claimAutoreleasedReturnValue();

                  v15 = v42;
                }

                v14 = 0;
                v9 = v41;
                goto LABEL_31;
              }
            }
            else
            {
              ATLLogObject();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("BalanceIdentifier"));
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v55 = v24;
                _os_log_impl(&dword_1C3511000, v23, OS_LOG_TYPE_DEFAULT, "Adding missing balance %@", buf, 0xCu);

                v9 = v41;
              }

              v15 = v42;
              objc_msgSend(v42, "addObject:", v21);
            }

          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
          if (v17)
            continue;
          break;
        }
      }

      v14 = v15;
      v11 = v39;
      v10 = v40;
      v13 = v38;
LABEL_31:

    }
  }
  else
  {
    v14 = v9;
  }

  return v14;
}

uint64_t __72__HerculesMappings_addBalancesFromVC_withTransceiver_forCity_withError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("BalanceIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("BalanceIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

+ (BOOL)supportsPlasticCardMode:(id)a3
{
  return objc_msgSend(a3, "intValue") == 7;
}

@end
