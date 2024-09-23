@implementation FMDExtHelper

+ (id)deviceIDFromAddress:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BT_%@"), a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtHelper _computehash:](FMDExtHelper, "_computehash:", v3));

  return v4;
}

+ (id)deviceTypeFromVendorId:(unsigned int)a3 productId:(unsigned int)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BT_%u_%u"), *(_QWORD *)&a3, *(_QWORD *)&a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_computehash:", v5));

  return v6;
}

+ (id)_computehash:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fm_sha256Hash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fm_hexString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lowercaseString"));

  return v6;
}

+ (id)serialNumberFromVersionInfo:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 3));
  v7 = objc_opt_class(NSString, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 3));
    v9 = objc_msgSend(v8, "length");

    if (!v9)
      goto LABEL_5;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 3));
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("systemSerialNumber"));
  }

LABEL_5:
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 8));
  v12 = objc_opt_class(NSString, v11);
  if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 8));
    v14 = objc_msgSend(v13, "length");

    if (!v14)
      goto LABEL_9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 8));
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("leftSerialNumber"));
  }

LABEL_9:
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 9));
  v17 = objc_opt_class(NSString, v16);
  if ((objc_opt_isKindOfClass(v15, v17) & 1) == 0)
  {
LABEL_12:

    goto LABEL_13;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 9));
  v19 = objc_msgSend(v18, "length");

  if (v19)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 9));
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("rightSerialNumber"));
    goto LABEL_12;
  }
LABEL_13:

  return v4;
}

+ (id)parseStyle:(unint64_t)a3 info:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  uint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  BOOL v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  unint64_t v53;
  __int16 v54;
  id v55;

  v5 = a4;
  v6 = sub_1000530AC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v53 = a3;
    v54 = 2112;
    v55 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#PARSING style %llu with feature %@", buf, 0x16u);
  }

  if (v5)
  {
    v9 = objc_opt_class(NSDictionary, v8);
    if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0)
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pattern")));
      if (v11 && (v12 = objc_opt_class(NSString, v10), (objc_opt_isKindOfClass(v11, v12) & 1) != 0))
      {
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mask")));
        if (v14)
        {
          v15 = objc_opt_class(NSDictionary, v13);
          if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
          {
            v46 = v5;
            v49 = 0u;
            v50 = 0u;
            v47 = 0u;
            v48 = 0u;
            v14 = v14;
            v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v48;
              do
              {
                for (i = 0; i != v17; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v48 != v18)
                    objc_enumerationMutation(v14);
                  v20 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
                  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v20));
                  v22 = v21;
                  if (v21)
                  {
                    v23 = strtouq((const char *)objc_msgSend(objc_retainAutorelease(v21), "UTF8String"), 0, 16);
                    v24 = a3;
                    if (v23)
                      v25 = (v23 & 1) == 0;
                    else
                      v25 = 0;
                    if (v25)
                    {
                      do
                      {
                        v26 = v23;
                        v23 >>= 1;
                        v24 >>= 1;
                      }
                      while (v26 >= 2 && (v26 & 2) == 0);
                    }
                    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), v24 & v23));
                    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", v20, v27));

                    v11 = (id)v28;
                  }

                }
                v17 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
              }
              while (v17);
            }

            v11 = v11;
            v29 = v11;
            v5 = v46;
            goto LABEL_33;
          }
        }
        v37 = sub_1000530AC();
        v38 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          sub_10022C270((uint64_t)v5, v38, v39, v40, v41, v42, v43, v44);

      }
      else
      {
        v30 = sub_1000530AC();
        v14 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_10022C208((uint64_t)v5, v14, v31, v32, v33, v34, v35, v36);
      }
      v29 = 0;
LABEL_33:

      goto LABEL_34;
    }
  }
  v29 = 0;
LABEL_34:

  return v29;
}

@end
