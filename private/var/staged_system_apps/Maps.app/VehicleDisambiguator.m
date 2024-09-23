@implementation VehicleDisambiguator

+ (BOOL)isAccessory:(id)a3 alreadyPairedWithVehicleInGarage:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "vehicles", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "iapIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if ((v12 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

+ (id)findPossibleMatchesForAccessory:(id)a3 inVehicles:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  uint64_t v32;
  float v33;
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
  id v44;
  id v45;
  void *v46;
  int v47;
  uint64_t v48;
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
  id v59;
  id v60;
  void *v61;
  float v62;
  uint64_t v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  unsigned int v70;
  void *v71;
  id v72;
  void *v74;
  id v75;
  id v76;
  uint64_t v77;
  id v78;
  NSObject *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[4];
  NSObject *v85;
  uint8_t v86[128];
  uint8_t buf[4];
  void *v88;
  __int16 v89;
  void *v90;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "count"))
  {
    v15 = sub_10043268C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "There are no vehicles to pair the current accessory against.", buf, 2u);
    }
    v14 = &__NSDictionary0__struct;
    goto LABEL_49;
  }
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472;
  v84[2] = sub_100B3B954;
  v84[3] = &unk_1011B87C0;
  v7 = v5;
  v85 = v7;
  v8 = sub_10039E080(v6, v84);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (!objc_msgSend(v9, "count"))
  {
    v74 = v9;
    v76 = v5;
    v79 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v6, "count")));
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v75 = v6;
    v17 = v6;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
    if (!v18)
      goto LABEL_47;
    v19 = v18;
    v20 = *(_QWORD *)v81;
    v77 = *(_QWORD *)v81;
    v78 = v17;
    while (1)
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v81 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "iapIdentifier"));
        v24 = objc_msgSend(v23, "length");

        if (!v24)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "siriIntentsIdentifier"));
          v26 = objc_msgSend(v25, "length");

          if (v26)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "headUnitIdentifier"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject identifier](v7, "identifier"));
            if (objc_msgSend(v27, "isEqualToString:", v28))
            {

LABEL_46:
              -[NSObject setObject:forKeyedSubscript:](v79, "setObject:forKeyedSubscript:", &off_101275268, v22);
              v17 = v78;
              goto LABEL_47;
            }
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "headUnitBluetoothIdentifier"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bluetoothIdentifier](v7, "bluetoothIdentifier"));
            v31 = objc_msgSend(v29, "isEqualToString:", v30);

            if (v31)
              goto LABEL_46;
            v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "model"));
            v33 = 1.0;
            if (v32
              && (v34 = (void *)v32,
                  v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject model](v7, "model")),
                  v35,
                  v34,
                  v35))
            {
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "model"));
              v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject model](v7, "model"));
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "lowercaseString"));
              v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "stringByTrimmingCharactersInSet:", v39));

              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "lowercaseString"));
              v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
              v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "stringByTrimmingCharactersInSet:", v42));

              v44 = objc_msgSend(v40, "_navigation_distanceLevenshtein:", v43);
              v45 = objc_msgSend(v40, "length");
              if (v45 <= objc_msgSend(v43, "length"))
                v46 = v43;
              else
                v46 = v40;
              v33 = 1.0 - (float)((float)(unint64_t)v44 / (float)(unint64_t)objc_msgSend(v46, "length"));

              v47 = 1;
            }
            else
            {
              v47 = 0;
            }
            v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "manufacturer"));
            if (v48)
            {
              v49 = (void *)v48;
              v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject manufacturer](v7, "manufacturer"));

              if (v50)
              {
                v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "manufacturer"));
                v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject manufacturer](v7, "manufacturer"));
                v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "lowercaseString"));
                v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
                v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "stringByTrimmingCharactersInSet:", v54));

                v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "lowercaseString"));
                v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
                v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "stringByTrimmingCharactersInSet:", v57));

                v59 = objc_msgSend(v55, "_navigation_distanceLevenshtein:", v58);
                v60 = objc_msgSend(v55, "length");
                if (v60 <= objc_msgSend(v58, "length"))
                  v61 = v58;
                else
                  v61 = v55;
                v62 = 1.0 - (float)((float)(unint64_t)v59 / (float)(unint64_t)objc_msgSend(v61, "length"));

                v33 = v33 * v62;
                v47 = 1;
              }
            }
            v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "year"));
            if (v63)
            {
              v65 = (void *)v63;
              v66 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject year](v7, "year"));

              if (v66)
              {
                v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "year"));
                v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject year](v7, "year"));
                v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "stringValue"));
                v70 = objc_msgSend(v67, "isEqualToString:", v69);

                if (!v70)
                  v33 = 0.0;
LABEL_37:
                *(float *)&v64 = v33;
              }
              else
              {
                LODWORD(v64) = 0;
                if (v47)
                  goto LABEL_37;
              }
            }
            else
            {
              LODWORD(v64) = 0;
              if ((v47 & 1) != 0)
                goto LABEL_37;
            }
            v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v64));
            -[NSObject setObject:forKeyedSubscript:](v79, "setObject:forKeyedSubscript:", v71, v22);

            v20 = v77;
            v17 = v78;
          }
        }
        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v72 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
      v19 = v72;
      if (!v72)
      {
LABEL_47:

        v11 = v79;
        v14 = -[NSObject copy](v79, "copy");
        v6 = v75;
        v5 = v76;
        v9 = v74;
        goto LABEL_48;
      }
    }
  }
  v10 = sub_10043268C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject identifier](v7, "identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
    *(_DWORD *)buf = 138412546;
    v88 = v12;
    v89 = 2112;
    v90 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "There is already a vehicle in the garage that matches this accessory: %@, vehicle: %@", buf, 0x16u);

  }
  v14 = &__NSDictionary0__struct;
LABEL_48:

  v16 = v85;
LABEL_49:

  return v14;
}

+ (void)pairAccessory:(id)a3 withVehicle:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;

  v5 = a3;
  v6 = a4;
  v7 = sub_10043268C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bluetoothIdentifier"));
    v14 = 138412802;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Will pair accessory with identifier: %@, bluetoothIdentifier: %@ to vehicle: %@", (uint8_t *)&v14, 0x20u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bluetoothIdentifier"));
  objc_msgSend(v6, "pairToIapIdentifier:bluetoothIdentifier:", v11, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  objc_msgSend(v13, "virtualGarageSaveVehicle:", v6);

}

@end
