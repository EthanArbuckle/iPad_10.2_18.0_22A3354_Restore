@implementation KeyTransparencyContactMapping

+ (id)countryCodeMap
{
  if (qword_1002A79B0 != -1)
    dispatch_once(&qword_1002A79B0, &stru_10024A310);
  return (id)qword_1002A79A8;
}

+ (id)mapContactsToIDS:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  id v46;
  id v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  _BYTE v66[128];

  v46 = a3;
  v47 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "phoneNumbers"));
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v54;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v54 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));
        v9 = v8;
        if (v8)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "digits"));
          if (v10)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "countryCode"));
            v12 = (void *)IDSCopyIDForPhoneNumberWithOptions(v10, v11, 1);

            if (qword_1002A79B8 != -1)
              dispatch_once(&qword_1002A79B8, &stru_10024A370);
            v13 = (void *)qword_1002A79C0;
            if (os_log_type_enabled((os_log_t)qword_1002A79C0, OS_LOG_TYPE_DEFAULT))
            {
              v14 = v13;
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "digits"));
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "countryCode"));
              *(_DWORD *)buf = 138413058;
              v59 = (uint64_t)v15;
              v60 = 2112;
              v61 = v16;
              v62 = 2160;
              v63 = 1752392040;
              v64 = 2112;
              v65 = (uint64_t)v12;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "mapContactsToIDS adding phonenumber %@[%@] as %{mask.hash}@", buf, 0x2Au);

            }
            v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "countryCode"));
            if (v17)
            {
              v18 = (void *)v17;
              goto LABEL_35;
            }
            if ((objc_msgSend(v12, "isEqualToString:", CFSTR("tel:(null)")) & 1) == 0 && v12)
              goto LABEL_36;
            if (qword_1002A79B8 != -1)
              dispatch_once(&qword_1002A79B8, &stru_10024A390);
            v21 = qword_1002A79C0;
            if (os_log_type_enabled((os_log_t)qword_1002A79C0, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Unable to find IDS contact for given phone number, attempting to guess country code based on NSLocale", buf, 2u);
            }
            v22 = CPPhoneNumberCopyHomeCountryCode();
            v18 = (void *)objc_claimAutoreleasedReturnValue(v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "countryCodeMap"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v18, "intValue")));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", v24));

            if (v25)
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "digits"));
              v27 = IDSCopyIDForPhoneNumberWithOptions(v26, v25, 1);

              if (qword_1002A79B8 != -1)
                dispatch_once(&qword_1002A79B8, &stru_10024A3B0);
              v28 = (void *)qword_1002A79C0;
              if (os_log_type_enabled((os_log_t)qword_1002A79C0, OS_LOG_TYPE_DEFAULT))
              {
                v29 = v28;
                v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "digits"));
                *(_DWORD *)buf = 138413058;
                v59 = (uint64_t)v30;
                v60 = 2112;
                v61 = v25;
                v62 = 2160;
                v63 = 1752392040;
                v64 = 2112;
                v65 = v27;
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "mapContactsToIDS Found valid country code from NSLocale, adding phonenumber %@[%@] as %{mask.hash}@", buf, 0x2Au);

              }
            }
            else
            {
              v27 = (uint64_t)v12;
            }

            v12 = (void *)v27;
LABEL_35:

            if (v12)
            {
LABEL_36:
              if ((objc_msgSend(v12, "isEqualToString:", CFSTR("tel:(null)")) & 1) == 0)
                objc_msgSend(v47, "addObject:", v12);
            }

          }
          else
          {
            if (qword_1002A79B8 != -1)
              dispatch_once(&qword_1002A79B8, &stru_10024A350);
            v20 = qword_1002A79C0;
            if (os_log_type_enabled((os_log_t)qword_1002A79C0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 141558530;
              v59 = 1752392040;
              v60 = 2112;
              v61 = v7;
              v62 = 2112;
              v63 = (uint64_t)v46;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "mapContactsToIDS phonenumber string missing %{mask.hash}@ on %@", buf, 0x20u);
            }
          }

          goto LABEL_40;
        }
        if (qword_1002A79B8 != -1)
          dispatch_once(&qword_1002A79B8, &stru_10024A330);
        v19 = qword_1002A79C0;
        if (os_log_type_enabled((os_log_t)qword_1002A79C0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 141558530;
          v59 = 1752392040;
          v60 = 2112;
          v61 = v7;
          v62 = 2112;
          v63 = (uint64_t)v46;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "mapContactsToIDS phonenumber missing %{mask.hash}@ on %@", buf, 0x20u);
        }
LABEL_40:

        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
    }
    while (v4);
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "emailAddresses"));
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v50;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v50 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "value"));

        if (v37)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "value"));
          v39 = (void *)IDSCopyIDForEmailAddress();

          if (qword_1002A79B8 != -1)
            dispatch_once(&qword_1002A79B8, &stru_10024A3F0);
          v40 = (void *)qword_1002A79C0;
          if (os_log_type_enabled((os_log_t)qword_1002A79C0, OS_LOG_TYPE_DEFAULT))
          {
            v41 = v40;
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "value"));
            *(_DWORD *)buf = 141558786;
            v59 = 1752392040;
            v60 = 2112;
            v61 = v42;
            v62 = 2160;
            v63 = 1752392040;
            v64 = 2112;
            v65 = (uint64_t)v39;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "mapContactsToIDS adding email %{mask.hash}@ as %{mask.hash}@", buf, 0x2Au);

          }
          if (v39)
            objc_msgSend(v47, "addObject:", v39);

        }
        else
        {
          if (qword_1002A79B8 != -1)
            dispatch_once(&qword_1002A79B8, &stru_10024A3D0);
          v43 = qword_1002A79C0;
          if (os_log_type_enabled((os_log_t)qword_1002A79C0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 141558530;
            v59 = 1752392040;
            v60 = 2112;
            v61 = v36;
            v62 = 2112;
            v63 = (uint64_t)v46;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "mapContactsToIDS phonenumber missing %{mask.hash}@ on %@", buf, 0x20u);
          }
        }
        v35 = (char *)v35 + 1;
      }
      while (v33 != v35);
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v33);
  }

  return v47;
}

@end
