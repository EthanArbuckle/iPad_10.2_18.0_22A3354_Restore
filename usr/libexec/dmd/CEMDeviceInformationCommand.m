@implementation CEMDeviceInformationCommand

+ (id)deviceInfoSupervisedKeys
{
  if (qword_1000EB678 != -1)
    dispatch_once(&qword_1000EB678, &stru_1000B9A50);
  return (id)qword_1000EB680;
}

+ (id)deviceInfoDeviceChannelKeys
{
  if (qword_1000EB688 != -1)
    dispatch_once(&qword_1000EB688, &stru_1000B9A70);
  return (id)qword_1000EB690;
}

+ (id)deviceInfoUserChannelKeys
{
  if (qword_1000EB698 != -1)
    dispatch_once(&qword_1000EB698, &stru_1000B9A90);
  return (id)qword_1000EB6A0;
}

+ (id)deviceInfoRMDKeys
{
  if (qword_1000EB6A8 != -1)
    dispatch_once(&qword_1000EB6A8, &stru_1000B9AB0);
  return (id)qword_1000EB6B0;
}

+ (id)dmfKeyFromDeviceInfoKey:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1000EB6B8;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1000EB6B8, &stru_1000B9AD0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000EB6C0, "objectForKeyedSubscript:", v4));

  return v5;
}

+ (id)deviceInfoKeyFromDMFKey:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1000EB6C8;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1000EB6C8, &stru_1000B9AF0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000EB6D0, "objectForKeyedSubscript:", v4));

  return v5;
}

- (id)dmf_executeRequestWithContext:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CEMDeviceInformationCommand filterQueryForScope](self, "filterQueryForScope", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[CEMDeviceInformationCommand dmfKeyFromDeviceInfoKey:](CEMDeviceInformationCommand, "dmfKeyFromDeviceInfoKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), (_QWORD)v14));
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_opt_new(DMFFetchDevicePropertiesRequest);
  objc_msgSend(v12, "setPropertyKeys:", v5);

  return v12;
}

- (id)dmf_executeOperationWithContext:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)dmf_requestExecutesWithoutReturning
{
  return 0;
}

- (id)dmf_statusForResult:(id)a3 context:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *j;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *k;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v48;
  id v49;
  void *v50;
  id v51;
  id obj;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[2];
  _QWORD v68[2];
  _BYTE v69[128];
  const __CFString *v70;
  const __CFString *v71;
  _BYTE v72[128];
  const __CFString *v73;
  const __CFString *v74;
  _BYTE v75[128];

  v4 = a3;
  v6 = objc_opt_class(DMFFetchDevicePropertiesResultObject, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v51 = v4;
    v7 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valuesByPropertyKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v8, "count")));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "errorsByPropertyKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v10, "count")));

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v54 = v7;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valuesByPropertyKey"));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v64 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[CEMDeviceInformationCommand deviceInfoKeyFromDMFKey:](CEMDeviceInformationCommand, "deviceInfoKeyFromDMFKey:", v17));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "valuesByPropertyKey"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v17));

          v22 = objc_opt_class(NSNull, v21);
          if ((objc_opt_isKindOfClass(v20, v22) & 1) != 0)
          {
            v73 = CFSTR("Code");
            v74 = CFSTR("Not Supported");
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1));
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, v18);

          }
          else
          {
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, v18);
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
      }
      while (v14);
    }
    v50 = v9;

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CEMDeviceInformationCommand payloadQueries](self, "payloadQueries"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v24));

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CEMDeviceInformationCommand filterQueryForScope](self, "filterQueryForScope"));
    objc_msgSend(v25, "minusSet:", v26);

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v27 = v25;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(_QWORD *)v60 != v30)
            objc_enumerationMutation(v27);
          v32 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)j);
          v70 = CFSTR("Code");
          v71 = CFSTR("Not Allowed");
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1));
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v33, v32);

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
      }
      while (v29);
    }
    v48 = v27;

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "errorsByPropertyKey"));
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v56;
      do
      {
        for (k = 0; k != v35; k = (char *)k + 1)
        {
          if (*(_QWORD *)v56 != v36)
            objc_enumerationMutation(obj);
          v38 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)k);
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[CEMDeviceInformationCommand deviceInfoKeyFromDMFKey:](CEMDeviceInformationCommand, "deviceInfoKeyFromDMFKey:", v38, v48));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "errorsByPropertyKey"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", v38));

          v67[1] = CFSTR("ErrorChain");
          v68[0] = CFSTR("Failed");
          v67[0] = CFSTR("Code");
          v42 = DMDErrorChainFromError(v41);
          v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
          v68[1] = v43;
          v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v68, v67, 2));
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v44, v39);

        }
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
      }
      while (v35);
    }

    -[CEMDeviceInformationCommand addRMDSpecificResultsToDictionary:errors:](self, "addRMDSpecificResultsToDictionary:errors:", v50, v11);
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 2));
    objc_msgSend(v45, "setObject:forKeyedSubscript:", v50, CFSTR("QueryResponses"));
    v4 = v51;
    if (objc_msgSend(v11, "count"))
      objc_msgSend(v45, "setObject:forKeyedSubscript:", v11, CFSTR("ErrorResponses"));
    v46 = objc_msgSend(v45, "copy", v48);

  }
  else
  {
    v46 = 0;
  }

  return v46;
}

- (id)filterQueryForScope
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CEMDeviceInformationCommand payloadQueries](self, "payloadQueries"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CEMDeviceInformationCommand deviceInfoDeviceChannelKeys](CEMDeviceInformationCommand, "deviceInfoDeviceChannelKeys"));
  objc_msgSend(v3, "intersectSet:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CEMDeviceInformationCommand deviceInfoRMDKeys](CEMDeviceInformationCommand, "deviceInfoRMDKeys"));
  objc_msgSend(v3, "minusSet:", v5);

  return v3;
}

- (void)addRMDSpecificResultsToDictionary:(id)a3 errors:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  const __CFString *v20;
  const __CFString *v21;
  _BYTE v22[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CEMDeviceInformationCommand payloadQueries](self, "payloadQueries"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CEMDeviceInformationCommand deviceInfoRMDKeys](CEMDeviceInformationCommand, "deviceInfoRMDKeys"));
  objc_msgSend(v7, "intersectSet:", v8);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v13);
        v20 = CFSTR("Code");
        v21 = CFSTR("Not Supported");
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1, (_QWORD)v16));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v14);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v11);
  }

}

@end
