@implementation BITensor

+ (id)log
{
  void *v2;
  os_log_t v3;
  void *v4;

  v2 = (void *)qword_100035230;
  if (!qword_100035230)
  {
    v3 = os_log_create("com.apple.batteryintelligence", "tensorhandling");
    v4 = (void *)qword_100035230;
    qword_100035230 = (uint64_t)v3;

    v2 = (void *)qword_100035230;
  }
  return v2;
}

+ (BOOL)verifyArraysHaveSameCount:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  unsigned int v16;
  unint64_t v17;
  void *v18;
  unsigned int v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v4, "count") == (id)1)
    {
      v5 = 1;
    }
    else
    {
      v6 = objc_alloc_init((Class)NSMutableArray);
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v7 = v4;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v22 != v10)
              objc_enumerationMutation(v7);
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), (_QWORD)v21));
            v13 = objc_msgSend(v12, "count");

            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v13));
            objc_msgSend(v6, "addObject:", v14);

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v9);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", 0));
      v16 = objc_msgSend(v15, "unsignedIntValue");

      if ((unint64_t)objc_msgSend(v6, "count") >= 2)
      {
        v17 = 1;
        do
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v17, (_QWORD)v21));
          v19 = objc_msgSend(v18, "unsignedIntValue");

          v5 = v19 == v16;
          if (v19 != v16)
            break;
          ++v17;
        }
        while ((unint64_t)objc_msgSend(v6, "count") > v17);
      }
      else
      {
        v5 = 1;
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)create3DMultiArrayFromFeatureArrays:(id)a3 withInputShape:(id)a4 usingFeatureDimensionsDict:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  _UNKNOWN **v14;
  uint64_t v15;
  id v16;
  void *i;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  unsigned int v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *j;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  unsigned int v40;
  unsigned int v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  NSObject *v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  uint64_t v62;
  int v63;
  id obj;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  id v79;
  uint8_t buf[4];
  _BYTE v81[10];
  void *v82;
  __int16 v83;
  int v84;
  _QWORD v85[3];
  _BYTE v86[128];
  uint8_t v87[4];
  unsigned int v88;
  _BYTE v89[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!+[BITensor verifyArraysHaveSameCount:](BITensor, "verifyArraysHaveSameCount:", v8))
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10001E8AC(v12, v43, v44, v45, v46, v47, v48, v49);
    goto LABEL_46;
  }
  if (objc_msgSend(v9, "count") != (id)3)
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10001E838(v9, v12);
LABEL_46:
    v50 = 0;
    goto LABEL_47;
  }
  v61 = a1;
  if (objc_msgSend(v9, "count"))
  {
    v11 = 0;
    while (1)
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v11));
      if ((int)-[NSObject intValue](v12, "intValue") <= 0)
        break;
      if (!v11 && -[NSObject intValue](v12, "intValue") != 1)
      {
        v52 = v10;
        v53 = objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "log"));
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          sub_10001E7D4();
        goto LABEL_59;
      }

      if (++v11 >= (unint64_t)objc_msgSend(v9, "count"))
        goto LABEL_9;
    }
    v52 = v10;
    v53 = objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "log"));
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      sub_10001E75C((uint64_t)v12, v11, v53);
LABEL_59:

    v50 = 0;
    v10 = v52;
  }
  else
  {
LABEL_9:
    v79 = 0;
    v69 = objc_msgSend(objc_alloc((Class)MLMultiArray), "initWithShape:dataType:error:", v9, 65568, &v79);
    v56 = v79;
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 1));
    v57 = v9;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 2));
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v58 = v8;
    obj = v8;
    v60 = v13;
    v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
    if (v66)
    {
      v63 = 0;
      v14 = &AnalyticsSendEventLazy_ptr;
      v15 = *(_QWORD *)v76;
      v16 = a1;
      v59 = v10;
      v62 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v66; i = (char *)i + 1)
        {
          if (*(_QWORD *)v76 != v15)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)i);
          v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allKeys"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14[47], "null"));
          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectsForKeys:notFoundMarker:", v19, v20));

          v22 = (void *)v19;
          v68 = (void *)v21;
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:](NSDictionary, "dictionaryWithObjects:forKeys:", v19, v21));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", v18));
          v25 = v24;
          v67 = v23;
          if (v24)
          {
            if ((objc_msgSend(v24, "intValue") & 0x80000000) != 0)
            {
              v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "log"));
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                sub_10001E6F4(v87, v25, &v88, v28);
            }
            else
            {
              v65 = v22;
              v26 = objc_msgSend(v25, "intValue");
              v27 = objc_msgSend(v13, "unsignedIntValue");
              v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "log"));
              v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
              if (v26 >= v27)
              {
                v15 = v62;
                v22 = v65;
                if (v29)
                {
                  v40 = objc_msgSend(v25, "intValue");
                  v41 = objc_msgSend(v13, "unsignedIntValue");
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v81 = v40;
                  v22 = v65;
                  *(_WORD *)&v81[4] = 1024;
                  *(_DWORD *)&v81[6] = v41;
                  _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Found feature dimension of %d but specified an inputShape to create a multiarray with only %i features, skipping.", buf, 0xEu);
                }
                v14 = &AnalyticsSendEventLazy_ptr;
              }
              else
              {
                if (v29)
                {
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)v81 = v18;
                  *(_WORD *)&v81[8] = 2112;
                  v82 = v25;
                  _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Placing %@ array at feature dimension %@ in multi-array", buf, 0x16u);
                }

                v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKey:", v18));
                v71 = 0u;
                v72 = 0u;
                v73 = 0u;
                v74 = 0u;
                v28 = v30;
                v31 = -[NSObject countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v71, v86, 16);
                if (v31)
                {
                  v32 = v31;
                  v33 = 0;
                  v34 = *(_QWORD *)v72;
                  while (2)
                  {
                    for (j = 0; j != v32; j = (char *)j + 1)
                    {
                      if (*(_QWORD *)v72 != v34)
                        objc_enumerationMutation(v28);
                      v36 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)j);
                      if ((unint64_t)j + v33 >= objc_msgSend(v70, "unsignedIntValue"))
                      {
                        v16 = v61;
                        v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "log"));
                        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                        {
                          v42 = -[NSObject count](v28, "count");
                          *(_DWORD *)buf = 134218242;
                          *(_QWORD *)v81 = v42;
                          *(_WORD *)&v81[8] = 2112;
                          v82 = v70;
                          _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "Warning: arrays contain %lu timesteps, but specified an inputShape to create a multiarray with %@ timesteps.", buf, 0x16u);
                        }

                        goto LABEL_38;
                      }
                      v85[0] = &off_10002F590;
                      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)j + v33));
                      v85[1] = v37;
                      v85[2] = v25;
                      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v85, 3));
                      objc_msgSend(v69, "setObject:forKeyedSubscript:", v36, v38);

                    }
                    v32 = -[NSObject countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v71, v86, 16);
                    v33 += (uint64_t)j;
                    v16 = v61;
                    if (v32)
                      continue;
                    break;
                  }
                }
LABEL_38:

                ++v63;
                v10 = v59;
                v13 = v60;
                v14 = &AnalyticsSendEventLazy_ptr;
                v15 = v62;
                v22 = v65;
              }
            }
          }
          else
          {
            v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "log"));
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v81 = v18;
              _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "No feature dimension defined in featureNamesAndDimensions for %@ array, skipping..", buf, 0xCu);
            }
          }

        }
        v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
      }
      while (v66);
    }
    else
    {
      v63 = 0;
      v16 = a1;
    }

    if (v63 >= (int)objc_msgSend(v13, "intValue"))
    {
      v55 = v69;
      v50 = v69;
      v9 = v57;
      v8 = v58;
    }
    else
    {
      v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "log"));
      v9 = v57;
      v55 = v69;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v81 = v57;
        *(_WORD *)&v81[8] = 2112;
        v82 = v60;
        v83 = 1024;
        v84 = v63;
        _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "inputShape of %@ indicates %@ desired features. But only successfully placed %d features into the array. Ensure featureDimensions dictionary contains a key and values for each dimension.", buf, 0x1Cu);
      }

      v50 = 0;
      v8 = v58;
    }
    v12 = v56;

  }
LABEL_47:

  return v50;
}

+ (id)getValuesFrom2DMultiArray:(id)a3 withFeatureNamesForDimensions:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v23;
  _QWORD v24[2];

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)NSMutableDictionary);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shape"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndex:", 1));
  v10 = objc_msgSend(v9, "unsignedIntValue");

  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_10001E940(v10, v11);

  if (v10)
  {
    v12 = 0;
    v13 = v10;
    while (1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v12));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v14));

      if (!v15)
        break;
      v24[0] = &off_10002F590;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v12));
      v24[1] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 2));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v17));

      objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, v15);
      if (v13 == ++v12)
        goto LABEL_7;
    }
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
    v20 = v23;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_10001E8DC();

    v19 = 0;
  }
  else
  {
LABEL_7:
    v19 = v8;
    v20 = v23;
  }

  return v19;
}

+ (id)getValuesFrom3DMultiArray:(id)a3 withFeatureNamesForDimensions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  uint64_t v13;
  _UNKNOWN **v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _UNKNOWN **v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  unsigned int v38;
  void *v39;
  id v40;
  _QWORD v41[3];

  v6 = a3;
  v40 = a4;
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v39 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shape"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", 1));
  v38 = objc_msgSend(v9, "unsignedIntValue");

  v35 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", 2));
  v11 = objc_msgSend(v10, "unsignedIntValue");

  v34 = a1;
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_10001E9B0(v38, v11, v12);

  if (v11)
  {
    v13 = 0;
    v36 = v11;
    v37 = v7;
    v14 = &AnalyticsSendEventLazy_ptr;
    v15 = v38;
    while (1)
    {
      v16 = objc_alloc_init((Class)NSMutableArray);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14[48], "numberWithUnsignedInteger:", v13));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKey:", v17));

      if (!v18)
        break;
      if (v38)
      {
        v19 = 0;
        do
        {
          v41[0] = &off_10002F590;
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14[48], "numberWithUnsignedInteger:", v19));
          v41[1] = v20;
          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14[48], "numberWithUnsignedInteger:", v13));
          v22 = v16;
          v23 = v14;
          v24 = v15;
          v25 = (void *)v21;
          v41[2] = v21;
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 3));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", v26));

          v15 = v24;
          v14 = v23;
          v16 = v22;

          objc_msgSend(v22, "addObject:", v27);
          ++v19;
        }
        while (v15 != v19);
      }
      v28 = objc_msgSend(v16, "copy");
      v7 = v37;
      objc_msgSend(v37, "setObject:forKeyedSubscript:", v28, v18);

      if (++v13 == v36)
        goto LABEL_10;
    }
    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "log"));
    v30 = v35;
    v31 = v39;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      sub_10001E8DC();

    v29 = 0;
  }
  else
  {
LABEL_10:
    v29 = v7;
    v30 = v35;
    v31 = v39;
  }

  return v29;
}

+ (id)createSubArraysFromArrays:(id)a3 fromStartIndex:(unint64_t)a4 withSize:(unint64_t)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  id v31;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  unint64_t v40;
  __int16 v41;
  unint64_t v42;
  __int16 v43;
  id v44;

  v7 = a3;
  if (+[BITensor verifyArraysHaveSameCount:](BITensor, "verifyArraysHaveSameCount:", v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allValues"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", 0));

    if ((unint64_t)-[NSObject count](v9, "count") >= a4)
    {
      if ((char *)-[NSObject count](v9, "count") - a4 >= (char *)a5)
      {
        v33 = objc_alloc_init((Class)NSMutableDictionary);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v10 = v7;
        v19 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v19)
        {
          v20 = v19;
          v30 = v9;
          v31 = v7;
          v21 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(_QWORD *)v35 != v21)
                objc_enumerationMutation(v10);
              v23 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
              v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v10, "objectForKey:", v23, v30, v31));
              v25 = a4;
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "subarrayWithRange:", a4, a5));
              v27 = objc_msgSend(v26, "mutableCopy");

              objc_msgSend(v33, "setValue:forKey:", v27, v23);
              v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              {
                v29 = objc_msgSend(v27, "count");
                *(_DWORD *)buf = 134218498;
                v40 = (unint64_t)v29;
                v41 = 2112;
                v42 = v23;
                v43 = 2112;
                v44 = v27;
                _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Creating subarray of size %lu from array.. Subarray %@ values: %@ ", buf, 0x20u);
              }

              a4 = v25;
            }
            v20 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          }
          while (v20);
          v9 = v30;
          v7 = v31;
        }
        goto LABEL_12;
      }
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218496;
        v40 = a5;
        v41 = 2048;
        v42 = a4;
        v43 = 2048;
        v44 = -[NSObject count](v9, "count");
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Can't create subarray with length %lu starting from index %lu when array size is %lu", buf, 0x20u);
      }
    }
    else
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10001EA30(v9, a4, v10);
    }
    v33 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_10001EAB8(v9, v11, v12, v13, v14, v15, v16, v17);
  v33 = 0;
LABEL_13:

  return v33;
}

@end
