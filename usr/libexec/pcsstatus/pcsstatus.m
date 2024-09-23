BOOL sub_100004284(id a1, id a2, unint64_t a3, BOOL *a4)
{
  return objc_msgSend(a2, "isFinished", a3, a4) ^ 1;
}

void sub_10000447C(FILE *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  id v11;
  id v12;

  v10 = a2;
  v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v10, &a9);

  v12 = objc_retainAutorelease(v11);
  fprintf(a1, "%s\n", (const char *)objc_msgSend(v12, "UTF8String"));

}

void sub_100004504(void *a1, int a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v3 = a1;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  sub_100004614(v4, v3);

  v5 = v4;
  v6 = v5;
  if (a2)
  {
    v11 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v5, 3, &v11));
    v8 = v11;
    v9 = v8;
    if (v7)
    {
      v10 = objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v7, 4));
      printf("%s", (const char *)objc_msgSend(v10, "UTF8String"));
    }
    else
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedDescription"));
      NSLog(CFSTR("error: %@"), v10);
    }

  }
  else
  {
    sub_1000047A8(v5, 0);
  }

}

void sub_100004614(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a1;
  v4 = a2;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v11));
        v13 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
          v14 = v11;
        else
          v14 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v11));
        v7 = v14;

        v15 = sub_1000061A0(v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, v7);

        v9 = (char *)v9 + 1;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);

  }
}

void sub_1000047A8(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingSelector:", "localizedCaseInsensitiveCompare:"));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v11, (_QWORD)v13));
        sub_100005F4C(v11, v12, a2);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

id sub_1000048F8(uint64_t a1)
{
  uint64_t IsICDP;
  uint64_t IsICDPNetwork;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  NSNumber *v16;
  void *v17;
  NSNumber *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  const __CFDictionary *v26;
  _QWORD context[4];
  id v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  id v37;

  IsICDP = PCSIdentitySetIsICDP(a1, 0);
  IsICDPNetwork = PCSIdentitySetIsICDPNetwork(a1, 0);
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("all_status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", IsICDP));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("icdp_status"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", IsICDPNetwork));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("icdp_status_network"));

  if ((_DWORD)IsICDP)
  {
    v37 = 0;
    v8 = PCSIdentityiCDPWalrus(a1, 0, &v37);
    if (v37)
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("icdp_status_w"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "description"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("icdp_status_w_error"));

      v10 = v37;
      if (v37)
      {
        v37 = 0;
        CFRelease(v10);
      }
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("icdp_status_w"));

    }
    v12 = PCSIdentityiCDPPlesio(a1, 0, 0, &v37);
    if (v37)
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("icdp_status_2"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "description"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("icdp_status_2_status"));

      v14 = v37;
      if (v37)
      {
        v37 = 0;
        CFRelease(v14);
      }
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v12));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("icdp_status_2"));

    }
  }
  v16 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", PCSReportManateeStatus(CFSTR("Engram")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("CKKS_Engram"));

  v18 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", PCSReportManateeStatus(CFSTR("Manatee")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("CKKS_Manatee"));

  v20 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("current_identities"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100004CF0;
  v34[3] = &unk_1000187B8;
  v36 = a1;
  v21 = v20;
  v35 = v21;
  PCSServiceItemsGetEachName(v34);
  v22 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("current_identity_pointers"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100004DC4;
  v31[3] = &unk_1000187B8;
  v33 = a1;
  v23 = v22;
  v32 = v23;
  PCSServiceItemsGetEachName(v31);
  v24 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("identities"));
  v25 = PCSIdentitySetCopyIdentities(a1, 0);
  if (v25)
  {
    v26 = (const __CFDictionary *)v25;
    context[0] = _NSConcreteStackBlock;
    context[1] = 3221225472;
    context[2] = sub_100004F08;
    context[3] = &unk_1000187E0;
    v29 = v24;
    v30 = a1;
    CFDictionaryApplyFunction(v26, (CFDictionaryApplierFunction)sub_100006364, context);
    CFRelease(v26);

  }
  return v4;
}

void sub_100004CF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = 0;
  v4 = PCSIdentitySetCopyCurrentIdentityWithError(*(_QWORD *)(a1 + 40), a2, &v9);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v4));
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, a2);

    v7 = v5;
LABEL_3:
    CFRelease(v7);
    return;
  }
  if (!v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", CFSTR("missing"), a2);
    return;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, a2);

  v7 = v9;
  if (v9)
  {
    v9 = 0;
    goto LABEL_3;
  }
}

void sub_100004DC4(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CFTypeRef v12;
  CFTypeRef cf;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  cf = 0;
  v5 = PCSIdentitySetCopyCurrentIdentityPointer(*(_QWORD *)(a1 + 40), a2, &cf);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), objc_msgSend(v6, "identity")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("service"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentItemPointerModificationTime"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("currentItemModificationTime"));

  }
  if (cf)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)cf, "description"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("error"));
    v12 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v12);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, a2);

}

void sub_100004F08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  NSString *ServiceName;
  void *v9;
  const __CFData *KeyID;
  id v11;
  id v12;
  NSNumber *v13;
  void *v14;
  const UInt8 *BytePtr;
  CFIndex Length;
  void *v17;
  uint64_t v18;
  void *v19;
  NSNumber *v20;
  void *v21;
  NSNumber *v22;
  void *v23;
  NSNumber *v24;
  void *v25;
  void *v26;
  const __CFString *Mutable;
  void *v28;
  void *v29;
  char v30;

  v29 = objc_autoreleasePoolPush();
  v6 = _PCSIdentityCopyBAT(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  ServiceName = (NSString *)PCSIdentityGetServiceName(a3);
  v9 = (void *)PCSIdentityCopyCircleFingerPrint(a3, 0);
  KeyID = (const __CFData *)PCSIdentityGetKeyID(a3);
  if (!ServiceName)
    ServiceName = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UNKNOWN-%d"), PCSIdentityGetServiceID(a3));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKey:", ServiceName));
  if (!v11)
  {
    v11 = objc_alloc_init((Class)NSMutableArray);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, ServiceName);
  }
  v12 = objc_alloc_init((Class)NSMutableDictionary);
  v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", PCSIdentityGetServiceID(a3));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("service_id"));

  objc_msgSend(v12, "setObject:forKeyedSubscript:", a2, CFSTR("public_key"));
  BytePtr = CFDataGetBytePtr(KeyID);
  Length = CFDataGetLength(KeyID);
  v17 = (void *)_PCSCreateHexString(BytePtr, Length);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("key_id"));

  v18 = PCSIdentityWebSafePublicKeyID(a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("key_id_websafe"));

  v20 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", _PCSIdentitySetIsCurrentIdentityPreferCache(*(_QWORD *)(a1 + 40), a3));
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("current"));

  v22 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", _PCSIdentityIsManatee(a3));
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, CFSTR("manatee"));

  v24 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", PCSIdentityIsFullManatee(a3));
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v25, CFSTR("manatee_full"));

  if (v9)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "base64EncodedStringWithOptions:", 0));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v26, CFSTR("circleFingerPrint"));

  }
  if (v7)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, CFSTR("build_time"));
  Mutable = CFStringCreateMutable(0, 0);
  v30 = 0;
  if (!_PCSIdentityValidate(a3, &v30, Mutable) || v30)
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("key_valid"));
    v28 = v29;
    goto LABEL_14;
  }
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("key_valid"));
  v28 = v29;
  if (CFStringGetLength(Mutable) > 0)
LABEL_14:
    objc_msgSend(v12, "setObject:forKeyedSubscript:", Mutable, CFSTR("key_valid_status"));
  if (Mutable)
    CFRelease(Mutable);
  objc_msgSend(v11, "addObject:", v12);

  objc_autoreleasePoolPop(v28);
}

id sub_100005270(uint64_t a1)
{
  void *v2;
  _UNKNOWN **v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *i;
  uint64_t v9;
  void *v10;
  uint64_t ServiceID;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _UNKNOWN **v16;
  void *v17;
  NSNumber *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int IsICDP;
  id v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _BYTE v36[128];

  IsICDP = PCSIdentitySetIsICDP(a1, 0);
  v28 = a1;
  v2 = (void *)PCSIdentitySetCopyIdentities(a1, 0);
  v3 = &APSConnectionOverrideNamedDelegatePort_ptr;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v6)
  {
    v7 = v6;
    v29 = *(_QWORD *)v31;
    v27 = v5;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v29)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v9));

        ServiceID = PCSIdentityGetServiceID(v10);
        if ((_DWORD)ServiceID)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), ServiceID));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v12));
          if (!v13)
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3[50], "dictionary"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3[50], "dictionary"));
          if (_PCSIdentityIsManatee(v10))
          {
            objc_msgSend(v14, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("manatee"));
            if ((PCSIdentityIsFullManatee(v10) & 1) == 0)
              objc_msgSend(v14, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("fake-manatee"));
          }
          else
          {
            v15 = v7;
            v16 = v3;
            v17 = v4;
            v18 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", _PCSIdentitySetIsCurrentIdentityPreferCache(v28, v10));
            v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, CFSTR("current"));

            v4 = v17;
            v3 = v16;
            v7 = v15;
            v5 = v27;
          }
          v20 = _PCSIdentityCopyBAT(v10);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          if (v21)
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, CFSTR("bat"));
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, v9);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v7);
  }

  v34[0] = CFSTR("iCDP");
  v22 = v4;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", IsICDP));
  v34[1] = CFSTR("services");
  v35[0] = v23;
  v35[1] = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 2));

  return v24;
}

id sub_10000558C()
{
  id v0;
  unsigned int v1;
  const __CFString *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  unsigned int v11;
  const __CFString *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _BYTE v19[128];
  _QWORD v20[11];

  v0 = objc_alloc_init((Class)NSMutableDictionary);
  if (OctagonPlatformSupportsSOS())
  {
    v18 = 0;
    v1 = SOSCCThisDeviceIsInCircle(&v18) + 1;
    if (v1 > 4)
      v2 = CFSTR("unknown");
    else
      v2 = off_1000188C0[v1];
    objc_msgSend(v0, "setObject:forKeyedSubscript:", v2, CFSTR("circle_status"));
    v20[0] = kSOSViewPCSMasterKey;
    v20[1] = kSOSViewPCSiCloudDrive;
    v20[2] = kSOSViewPCSPhotos;
    v20[3] = kSOSViewPCSCloudKit;
    v20[4] = kSOSViewPCSEscrow;
    v20[5] = kSOSViewPCSFDE;
    v20[6] = kSOSViewPCSMailDrop;
    v20[7] = kSOSViewPCSiCloudBackup;
    v20[8] = kSOSViewPCSNotes;
    v20[9] = kSOSViewPCSiMessage;
    v20[10] = kSOSViewPCSFeldspar;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 11));
    v4 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v0, "setObject:forKeyedSubscript:", v4, CFSTR("view_status"));
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          v11 = SOSCCView(v10, 3, &v18) - 1;
          v12 = CFSTR("unknown");
          if (v11 <= 3)
            v12 = off_1000188E8[v11];
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10, (_QWORD)v14);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v7);
    }

  }
  return v0;
}

id sub_1000057F8()
{
  id v0;
  dispatch_semaphore_t v1;
  id v2;
  NSObject *v3;
  dispatch_time_t v4;
  dispatch_semaphore_t v5;
  id v6;
  _QWORD v8[4];
  id v9;
  dispatch_semaphore_t v10;

  v0 = objc_alloc_init((Class)NSMutableDictionary);
  v1 = dispatch_semaphore_create(0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000058CC;
  v8[3] = &unk_100018808;
  v2 = v0;
  v9 = v2;
  v10 = v1;
  v3 = v1;
  PCSKeySyncingGetAllClients(v8);
  v4 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v3, v4);
  v5 = v10;
  v6 = v2;

  return v6;
}

void sub_1000058CC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, CFSTR("clients"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, CFSTR("clients_error"));

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

id sub_100005964(const void *a1)
{
  id v2;
  CFTypeID v3;
  _QWORD v5[4];
  id v6;
  const void *v7;

  v2 = objc_alloc_init((Class)NSMutableDictionary);
  if (a1)
  {
    v3 = CFGetTypeID(a1);
    if (v3 == CFDictionaryGetTypeID())
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100005A10;
      v5[3] = &unk_1000187E0;
      v6 = v2;
      v7 = a1;
      CFDictionaryApplyFunction((CFDictionaryRef)a1, (CFDictionaryApplierFunction)sub_100006364, v5);

    }
  }
  return v2;
}

void sub_100005A10(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  id v6;
  const void *v7;
  CFTypeID v8;
  const __CFArray *Value;
  const __CFArray *v10;
  CFTypeID v11;
  NSString *v12;
  void *v13;
  _QWORD context[4];
  id v15;
  CFRange v16;

  v6 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, a2);
  v7 = *(const void **)(a1 + 40);
  if (!v7 || (v8 = CFGetTypeID(v7), v8 != CFDictionaryGetTypeID()))
  {
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: %@ is not a dictionary"), a3);
LABEL_8:
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_msgSend(v6, "addObject:", v13);

    goto LABEL_9;
  }
  Value = (const __CFArray *)CFDictionaryGetValue(a3, kPCSSecureBackupCFKeyRegistryPublicIdentities);
  v10 = Value;
  if (!Value || (v11 = CFGetTypeID(Value), v11 != CFArrayGetTypeID()))
  {
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: %@ is not an array"), v10);
    goto LABEL_8;
  }
  context[0] = _NSConcreteStackBlock;
  context[1] = 3221225472;
  context[2] = sub_100005B64;
  context[3] = &unk_100018830;
  v15 = v6;
  v16.length = CFArrayGetCount(v10);
  v16.location = 0;
  CFArrayApplyFunction(v10, v16, (CFArrayApplierFunction)sub_10000637C, context);

LABEL_9:
}

void sub_100005B64(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  const void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  const void *v9;

  v9 = 0;
  v3 = PCSPublicIdentityCreateWithPublicKeyInfo(a2, &v9);
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v5 = (const void *)v3;
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d/%@"), PCSPublicIdentityGetServiceID(), v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v4, "addObject:", v7);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: PCSPublicIdentityCreateWithPublicKeyInfo error: %@"), v9));
    objc_msgSend(v4, "addObject:", v8);

    v5 = v9;
    if (!v9)
      return;
    v9 = 0;
  }
  CFRelease(v5);
}

_UNKNOWN **sub_100005C30()
{
  NSObject *v0;
  dispatch_time_t v1;
  _UNKNOWN **v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _UNKNOWN **v6;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t, uint64_t, void *);
  void *v11;
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_100005D9C;
  v18 = sub_100005DAC;
  v19 = 0;
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_100005DB4;
  v11 = &unk_100018858;
  v13 = &v14;
  v0 = dispatch_semaphore_create(0);
  v12 = v0;
  PCSRestoreCKBackupWithCompletion(1, &v8);
  v1 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v0, v1))
  {
    v2 = &off_100019FD0;
  }
  else
  {
    v3 = PCSReportKeyRollPending(CFSTR("Messages3"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3, v8, v9, v10, v11));
    objc_msgSend((id)v15[5], "setObject:forKeyedSubscript:", v4, CFSTR("rollPending"));

    v2 = (_UNKNOWN **)(id)v15[5];
  }
  v5 = v12;
  v6 = v2;

  _Block_object_dispose(&v14, 8);
  return v6;
}

void sub_100005D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005D9C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100005DAC(uint64_t a1)
{

}

void sub_100005DB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[3];

  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v19[0] = CFSTR("RecoveryIssues");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a2));
  v20[0] = v14;
  v19[1] = CFSTR("RecoveredToIdentitySet");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3));
  v20[1] = v15;
  v19[2] = CFSTR("AlreadyInRecoverySet");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a4));
  v20[2] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 3));
  objc_msgSend(v13, "addEntriesFromDictionary:", v17);

  if (v9)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v18, CFSTR("error"));

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100005F4C(void *a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  _QWORD v33[4];
  int v34;

  v32 = a1;
  v5 = a2;
  v6 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    if (a3 == 1)
    {
      sub_10000447C(__stdoutp, CFSTR("\n%*s%@ -"), v7, v8, v9, v10, v11, v12, 4);
      sub_10000447C(__stdoutp, CFSTR("%*s------------------------"), v26, v27, v28, v29, v30, v31, 4);
    }
    else if (a3)
    {
      sub_10000447C(__stdoutp, CFSTR("%*s%@ -"), v7, v8, v9, v10, v11, v12, (4 * a3));
    }
    else
    {
      sub_10000447C(__stdoutp, CFSTR("\n%*s%@ -"), v7, v8, v9, v10, v11, v12, 0);
      sub_10000447C(__stdoutp, CFSTR("%*s========================"), v13, v14, v15, v16, v17, v18, 0);
    }
    sub_1000047A8(v5, (a3 + 1));
  }
  else
  {
    v19 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v5, v19) & 1) != 0)
    {
      sub_10000447C(__stdoutp, CFSTR("%*s%@ -"), v20, v21, v22, v23, v24, v25, (4 * a3));
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100006138;
      v33[3] = &unk_100018878;
      v34 = a3 + 1;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v33);
    }
    else
    {
      sub_10000447C(__stdoutp, CFSTR("%*s%@: %@"), v20, v21, v22, v23, v24, v25, (4 * a3));
    }
  }

}

void sub_100006138(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  sub_100005F4C(v6, v5, *(unsigned int *)(a1 + 32));

}

id sub_1000061A0(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v1 = a1;
  v2 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v1, v2) & 1) != 0)
  {
    v3 = objc_alloc_init((Class)NSMutableDictionary);
    sub_100004614();
LABEL_5:

    v1 = v3;
    return v1;
  }
  v4 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v1, v4) & 1) != 0)
  {
    v5 = v1;
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100006318;
    v10[3] = &unk_1000188A0;
    v11 = v3;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

    goto LABEL_5;
  }
  v7 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v1, v7) & 1) == 0)
  {
    v8 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v1, v8) & 1) == 0)
    {
      v9 = objc_opt_class(NSNull);
      if ((objc_opt_isKindOfClass(v1, v9) & 1) == 0)
      {
        v3 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v1));
        goto LABEL_5;
      }
    }
  }
  return v1;
}

void sub_100006318(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  v5 = sub_1000061A0(a2);
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v6, a3);

}

uint64_t sub_100006364(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

uint64_t sub_10000637C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

uint64_t start(int a1, char **a2)
{
  char v4;
  int i;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  FILE *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int v41;
  int v42;
  int v43;
  __CFDictionary *Mutable;
  __CFDictionary *v45;
  const void *v46;
  void *v47;
  const void *v48;
  void *v49;
  const void *v50;
  id v51;
  const void *v52;
  id v53;
  const void *v54;
  id v55;
  const void *v56;
  PCSUserRegistry *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  const void *v71;
  id v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  _UNKNOWN **v79;
  void *v80;
  const char *v81;
  const char *v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *value;
  _QWORD v91[4];
  NSObject *v92;
  _QWORD v93[4];
  NSObject *v94;
  uint64_t *v95;
  id v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  int v100;
  const void *v101;
  uint64_t v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;

  v85 = 0;
  v86 = 0;
  v87 = 0;
  v88 = 0;
  v4 = 0;
  v83 = 0;
  v84 = 0;
  v89 = 0;
  value = 0;
  v101 = 0;
  optind = 0;
  for (i = 2; ; i = 1)
  {
    while (1)
    {
      v6 = getopt_long(a1, a2, "CDPdfjOsDRrc:hp:s:UuvwZy", (const option *)&off_10001D728, 0);
      if ((int)v6 > 98)
      {
        switch((int)v6)
        {
          case 'c':
            v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", optarg));

            v89 = (void *)v7;
            continue;
          case 'd':
            LOBYTE(v86) = 1;
            continue;
          case 'f':
            LOBYTE(v84) = 1;
            continue;
          case 'h':
            i = 3;
            continue;
          case 'j':
            BYTE4(v84) = 1;
            continue;
          case 'p':
            v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", optarg));

            value = (void *)v9;
            continue;
          case 'r':
            v83 = 1;
            continue;
          case 's':
            v4 = 1;
            if (optarg)
            {
              v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:"));

              v88 = (void *)v8;
            }
            continue;
          case 'u':
            continue;
          case 'v':
            BYTE4(v85) = 1;
            continue;
          case 'w':
            BYTE4(v86) = 1;
            continue;
          case 'y':
            LOBYTE(v87) = 1;
            continue;
          default:
            goto LABEL_83;
        }
      }
      if ((int)v6 > 78)
      {
        switch((int)v6)
        {
          case 'O':
            i = 2;
            continue;
          case 'P':
            BYTE4(v87) = 1;
            continue;
          case 'R':
            i = 5;
            continue;
          case 'U':
            continue;
          case 'Z':
            LOBYTE(v85) = 1;
            continue;
          default:
            goto LABEL_83;
        }
      }
      if ((_DWORD)v6 != 67)
        break;
      i = 4;
    }
    if ((_DWORD)v6 != 68)
      break;
  }
  if ((_DWORD)v6 != -1)
LABEL_83:
    errx(1, "unknown command: %c", v6);
  v97 = 0;
  v98 = &v97;
  v99 = 0x2020000000;
  v100 = 1;
  if ((v87 & 0x100000000) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PCSAccountsModel accountForCurrentPersona](PCSAccountsModel, "accountForCurrentPersona"));
    v11 = v10;
    if (!v10)
      errx(1, "no accounts");
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "aa_personID"));
    v13 = (void *)v12;
    if (!v12)
      errx(1, "no dsid");
    v106 = kPCSSetupDSID;
    v107 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1));
    v15 = PCSIdentitySetCreate(v14, 0, &v101);
    v16 = (const void *)v15;
    if (!v15)
      errx(1, "didn't find any identites in keychain");
    v17 = sub_100005270(v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if (!v18)
      errx(1, "no status");
    CFRelease(v16);
    v96 = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v18, 100, 0, &v96));
    v20 = v96;
    if (!v19)
    {
      v81 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("failed to make plist: %@"), v20))), "UTF8String");
      errx(1, "%s", v81);
    }
    v21 = objc_retainAutorelease(v19);
    v22 = objc_msgSend(v21, "bytes");
    v23 = objc_msgSend(v21, "length");
    fwrite(v22, (size_t)v23, 1uLL, __stdoutp);
    *((_DWORD *)v98 + 6) = 0;

    goto LABEL_40;
  }
  if ((v4 & 1) != 0)
  {
    v93[0] = _NSConcreteStackBlock;
    v93[1] = 3221225472;
    v93[2] = sub_100006FDC;
    v93[3] = &unk_100018910;
    v95 = &v97;
    v24 = dispatch_semaphore_create(0);
    v94 = v24;
    PCSSyncKeyRegistryWithServiceName(v88, v93);
    dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);

LABEL_36:
    v11 = 0;
    goto LABEL_40;
  }
  if ((v87 & 1) != 0)
  {
    PCSKeySyncingTriggerDaily();
    v11 = 0;
LABEL_39:
    *((_DWORD *)v98 + 6) = 0;
    goto LABEL_40;
  }
  if ((v86 & 0x100000000) != 0)
  {
    v91[0] = _NSConcreteStackBlock;
    v91[1] = 3221225472;
    v91[2] = sub_100007034;
    v91[3] = &unk_100018938;
    v27 = dispatch_semaphore_create(0);
    v92 = v27;
    PCSTriggerWatchSyncing(v91);
    dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
    *((_DWORD *)v98 + 6) = 0;

    goto LABEL_36;
  }
  if ((v86 & 1) != 0)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[PCSAccountsModel accountForCurrentPersona](PCSAccountsModel, "accountForCurrentPersona"));
    v11 = v28;
    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "aa_personID"));
    }
    else
    {
      warnx("Failed to a configured account, will delete all PCS data");
      v29 = 0;
    }
    *((_DWORD *)v98 + 6) = 0;
    if ((__PCSDeleteFromKeychainICDP(v29, &v101) & 1) == 0)
    {
      v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to delete from icloud keychain: %@"), v101)));
      warnx("%s", (const char *)objc_msgSend(v51, "UTF8String"));

      v52 = v101;
      if (v101)
      {
        v101 = 0;
        CFRelease(v52);
      }
      *((_DWORD *)v98 + 6) = 1;
    }
    if ((__PCSDeleteFromKeychain(&v101) & 1) == 0)
    {
      v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to delete from keychain: %@"), v101)));
      warnx("%s", (const char *)objc_msgSend(v53, "UTF8String"));

      v54 = v101;
      if (v101)
      {
        v101 = 0;
        CFRelease(v54);
      }
      *((_DWORD *)v98 + 6) = 1;
    }
    if ((__PCSDeleteKeyfile(v29, 0) & 1) == 0)
    {
      v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to delete from keyfile: %@"), v101)));
      warnx("%s", (const char *)objc_msgSend(v55, "UTF8String"));

      v56 = v101;
      if (v101)
      {
        v101 = 0;
        CFRelease(v56);
      }
      *((_DWORD *)v98 + 6) = 1;
    }
    v57 = -[PCSUserRegistry initWithBackup:]([PCSUserRegistry alloc], "initWithBackup:", 0);
    -[PCSUserRegistry clearCloudKitCache](v57, "clearCloudKitCache");

    goto LABEL_40;
  }
  if (v89)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[PCSAccountsModel accountForCurrentPersona](PCSAccountsModel, "accountForCurrentPersona"));
    if (!value)
      errx(1, "password missing");
    v11 = v30;
    v31 = __stdoutp;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "aa_personID"));
    sub_10000447C(v31, CFSTR("converting dsid %@\n"), v33, v34, v35, v36, v37, v38, (uint64_t)v32);

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "username"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "aa_personID"));
    sub_100010388(i, (uint64_t)v39, (int)value, (int)v40, BYTE4(v85) & 1, v41, v42, v43);

    goto LABEL_39;
  }
  if ((v85 & 1) != 0)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v45 = Mutable;
    if (!Mutable)
      errx(1, "out of memory");
    if (value)
      CFDictionarySetValue(Mutable, kPCSSetupPassword, value);
    if ((v84 & 1) != 0)
      CFDictionarySetValue(v45, kPCSSetupForceUpdate, kCFBooleanTrue);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[PCSAccountsModel accountForCurrentPersona](PCSAccountsModel, "accountForCurrentPersona"));
    v46 = (const void *)kPCSSetupUsername;
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "username"));
    CFDictionarySetValue(v45, v46, v47);

    v48 = (const void *)kPCSSetupDSID;
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "aa_personID"));
    CFDictionarySetValue(v45, v48, v49);

    if ((PCSIdentitySynchronizeKeys(v45, &v101) & 1) == 0)
    {
      v82 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PCSIdentitySynchronizeKeys: %@"), v101))), "UTF8String");
      errx(1, "%s", v82);
    }
    CFRelease(v45);
    v50 = v101;
    if (v101)
    {
      v101 = 0;
      CFRelease(v50);
    }
    goto LABEL_39;
  }
  if ((v83 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[PCSAccountsModel accountForCurrentPersona](PCSAccountsModel, "accountForCurrentPersona"));
    v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "aa_personID"));
    v59 = (void *)v58;
    if (!v58)
      errx(1, "no iCloud primary account");
    v104 = kPCSSetupDSID;
    v105 = v58;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1));
    v61 = (void *)__PCSCopyStingrayInfo(0, v60, 0);
    v62 = v61;
    if (!v61)
      errx(1, "metadata");
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "objectForKeyedSubscript:", kPCSSecureBackupCFStingrayMetadataKey));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKeyedSubscript:", kPCSSecureBackupCFClientMetadataKey));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "objectForKeyedSubscript:", kPCSSecureBackupCFSecureBackupKeyRegistry));

    v66 = sub_100005964(v65);
    v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
    sub_100004504(v67, BYTE4(v84) & 1);

    *((_DWORD *)v98 + 6) = 0;
    goto LABEL_40;
  }
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[PCSAccountsModel accountForCurrentPersona](PCSAccountsModel, "accountForCurrentPersona"));
  v11 = v68;
  if (!v68)
  {
    warnx("no accounts");
    goto LABEL_80;
  }
  v69 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "aa_personID"));
  if (!v69)
  {
    warnx("no dsid");
LABEL_80:
    v69 = kPCSSetupDSIDAny;
  }
  v102 = kPCSSetupDSID;
  v103 = v69;
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1));
  v71 = (const void *)PCSIdentitySetCreate(v70, 0, &v101);
  if (!v71)
    errx(1, "didn't find any identites in keychain");
  v72 = objc_alloc_init((Class)NSMutableDictionary);
  v73 = sub_1000048F8((uint64_t)v71);
  v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v74, CFSTR("status"));

  CFRelease(v71);
  v75 = sub_10000558C();
  v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v76, CFSTR("status_keychain"));

  v77 = sub_1000057F8();
  v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v78, CFSTR("status_keysync"));

  v79 = sub_100005C30();
  v80 = (void *)objc_claimAutoreleasedReturnValue(v79);
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v80, CFSTR("status_messages"));

  sub_100004504(v72, BYTE4(v84) & 1);
  *((_DWORD *)v98 + 6) = 0;

LABEL_40:
  v25 = *((unsigned int *)v98 + 6);
  _Block_object_dispose(&v97, 8);

  return v25;
}

void sub_100006F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100006FDC(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  else
    sub_10000447C(__stderrp, CFSTR("error: %@"), a3, a4, a5, a6, a7, a8, a3);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_100007034(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000738C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000073F0(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = objc_msgSend(WeakRetained, "syncUserRegistry");

}

void sub_100007424(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setupSubscriptions");

}

void sub_100007714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v7);
  _Unwind_Resume(a1);
}

uint64_t sub_100007740(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100007750(uint64_t a1)
{

}

void sub_100007758(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_onqueueSaveUserRegistryStats");
  objc_msgSend(*(id *)(a1 + 32), "setStats_dirty:", 0);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void sub_1000077D8(id a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)CKOperationConfiguration);
  v2 = (void *)qword_10001D950;
  qword_10001D950 = (uint64_t)v1;

  objc_msgSend((id)qword_10001D950, "setTimeoutIntervalForResource:", 120.0);
  objc_msgSend((id)qword_10001D950, "setIsCloudKitSupportOperation:", 1);
}

void sub_100007890(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  char *v8;
  time_t v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  _DWORD v13[2];
  __int16 v14;
  id v15;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "oslog"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109378;
    v13[1] = a2;
    v14 = 2112;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "accountStatusWithCompletionHandler: %d error: %@", (uint8_t *)v13, 0x12u);
  }

  if (a2 == 3)
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "oslog"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Stoping syncing", (uint8_t *)v13, 2u);
    }

  }
  else if (a2 == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stats"));
    v8 = (char *)objc_msgSend(v7, "lastfetchRecordZoneChangesAtStart") + 86400;
    v9 = time(0);

    if ((uint64_t)v8 <= v9)
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "oslog"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Starting to sync", (uint8_t *)v13, 2u);
      }

      v11 = objc_msgSend(*(id *)(a1 + 32), "syncUserRegistry");
    }
  }

}

void sub_100007C20(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100007C3C(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "container"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100007CE4;
  v3[3] = &unk_100018A18;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  objc_msgSend(v2, "serverPreferredPushEnvironmentWithCompletionHandler:", v3);

  objc_destroyWeak(&v4);
}

void sub_100007CD0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100007CE4(id *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a2;
  v4 = objc_alloc((Class)APSConnection);
  v5 = APSConnectionOverrideNamedDelegatePort;
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "queue"));
  v8 = objc_msgSend(v4, "initWithEnvironmentName:namedDelegatePort:queue:", v3, v5, v7);

  v9 = (void *)qword_10001D960;
  qword_10001D960 = (uint64_t)v8;

  v10 = objc_loadWeakRetained(a1);
  objc_msgSend((id)qword_10001D960, "setDelegate:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.icloud-container."), "stringByAppendingString:", CFSTR("com.apple.protectedcloudstorage.protectedcloudkeysyncing")));
  v13 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  objc_msgSend((id)qword_10001D960, "_setEnabledTopics:", v12);

}

void sub_100008184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,uint64_t a23,uint64_t a24,char a25)
{
  _Block_object_dispose(&a25, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000081E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userdb"));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getConfigData:", CFSTR("doneSubscription")));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_10000823C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[5];
  _QWORD block[5];
  uint8_t buf[4];
  id v14;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "oslog"));
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Couldn't create database subscription; syncing is severely degraded: %@",
        buf,
        0xCu);
    }

    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "queue"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000845C;
    v11[3] = &unk_100018938;
    v11[4] = WeakRetained;
    dispatch_sync(v9, v11);

    objc_msgSend(WeakRetained, "checkErrorForRetryPause:", v5);
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "subscribeAction"));
    -[NSObject trigger](v10, "trigger");
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "subscription completed", buf, 2u);
    }

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000083F0;
    block[3] = &unk_100018938;
    block[4] = WeakRetained;
    dispatch_sync(v10, block);
  }

}

void sub_1000083F0(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userdb"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", "done", 4));
  objc_msgSend(v2, "replaceConfigRecord:data:", CFSTR("doneSubscription"), v1);

}

void sub_10000845C(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userdb"));
  objc_msgSend(v1, "deleteRecordID:", CFSTR("doneSubscription"));

}

void sub_10000869C(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_onqueueDeleteServerChangeToken:", CFSTR("serverChangeToken"));
  objc_msgSend(*(id *)(a1 + 32), "_onqueueDeleteServerChangeToken:", CFSTR("MBserverChangeToken"));
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userdb"));
  objc_msgSend(v2, "deleteRecordID:", CFSTR("doneSubscription"));

}

void sub_100008700(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "oslog"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v7 = 138412290;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Creating resyncing operation, finishing with %@", (uint8_t *)&v7, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "createPendingSyncOperation:", *(_QWORD *)(a1 + 40)));
  objc_msgSend(*(id *)(a1 + 32), "setCurrentSyncOperations:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mainOperationQueue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actualOperation"));
  objc_msgSend(v5, "addOperation:", v6);

}

void sub_100008C50(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak((id *)(v5 - 144));
  _Unwind_Resume(a1);
}

void sub_100008CA8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  void *v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "oslog"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneID"));
      v20 = 138412546;
      v21 = v13;
      v22 = 2112;
      v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "received new record(%@) for: %@", (uint8_t *)&v20, 0x16u);

    }
    if (v9)
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "oslog"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138412290;
        v21 = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Got CloudKit error: %@", (uint8_t *)&v20, 0xCu);
      }
LABEL_11:

      goto LABEL_12;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mobileBackupRecordZoneID"));
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "oslog"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneID"));
        v20 = 138412290;
        v21 = v19;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "got update for unknown zone: %@", (uint8_t *)&v20, 0xCu);

      }
      goto LABEL_11;
    }
    objc_msgSend(v11, "saveEscrowChange:", v8);
  }
LABEL_12:

}

void sub_100008EE0(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "oslog"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordName"));
      v13 = 138412290;
      v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Record deleted: %@", (uint8_t *)&v13, 0xCu);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "zoneID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mobileBackupRecordZoneID"));
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (v10)
    {
      objc_msgSend(v5, "deleteEscrowID:", v3);
    }
    else
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "oslog"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "zoneID"));
        v13 = 138412290;
        v14 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "got delete for unknown zone: %@", (uint8_t *)&v13, 0xCu);

      }
    }
  }

}

void sub_100009078(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  unsigned int v15;
  NSObject *v16;
  _BOOL4 v17;
  const char *v18;
  NSObject *v19;
  void *v20;
  unsigned int v21;
  int v22;
  id v23;
  __int16 v24;
  id v25;

  v9 = a2;
  v10 = a3;
  v11 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    if (v11)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "domain"));
      v15 = objc_msgSend(v14, "isEqualToString:", CKErrorDomain);

      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "oslog"));
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        if (v17)
        {
          v22 = 138412546;
          v23 = v11;
          v24 = 2112;
          v25 = v9;
          v18 = "Got CloudKit error while fetching: %@ for zone:%@";
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v22, 0x16u);
        }
      }
      else if (v17)
      {
        v22 = 138412546;
        v23 = v11;
        v24 = 2112;
        v25 = v9;
        v18 = "Got other error: %@for zone:%@";
        goto LABEL_13;
      }

      goto LABEL_15;
    }
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "oslog"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412546;
      v23 = v9;
      v24 = 2112;
      v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Finished fetching changes for %@ with change token %@", (uint8_t *)&v22, 0x16u);
    }

    if (v10)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mobileBackupRecordZoneID"));
      v21 = objc_msgSend(v9, "isEqual:", v20);

      if (v21)
        objc_msgSend(v13, "saveServerChangeToken:forKey:", v10, CFSTR("MBserverChangeToken"));
    }
  }
LABEL_15:

}

void sub_100009280(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  id v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "oslog"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "fetchRecordzoneChangesCompletionBlock error: %@", buf, 0xCu);
    }

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stats"));
  objc_msgSend(v7, "setFetchRecordZoneChanges:", (char *)objc_msgSend(v7, "fetchRecordZoneChanges") + 1);

  objc_msgSend(v5, "flushStats");
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "oslog"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Finished fetching changes with error: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setError:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOperationQueue"));
  objc_msgSend(v9, "addOperation:", *(_QWORD *)(a1 + 32));

  if (!v3)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009448;
    block[3] = &unk_100018938;
    block[4] = v5;
    dispatch_sync(v10, block);

  }
}

id sub_100009448(uint64_t a1)
{
  time_t v2;
  void *v3;

  v2 = time(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stats"));
  objc_msgSend(v3, "setLastfetchRecordZoneChangesAtStart:", v2);

  return objc_msgSend(*(id *)(a1 + 32), "_onqueueSaveUserRegistryStats");
}

void sub_10000969C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000096C0(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pendingSyncOperations"));

  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "oslog"));
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pendingSyncOperations"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "finishOperation"));
      v24 = 138412290;
      v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Returning pending syncing operation: %@", (uint8_t *)&v24, 0xCu);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pendingSyncOperations"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "finishOperation"));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;
  }
  else
  {
    if (v4)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentSyncOperations"));
      v24 = 138412290;
      v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating new syncing operation, after %@", (uint8_t *)&v24, 0xCu);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "createPendingSyncOperation:", 0));
    objc_msgSend(*(id *)(a1 + 32), "setPendingSyncOperations:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentSyncOperations"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "finishOperation"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pendingSyncOperations"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "actualOperation"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentSyncOperations"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "finishOperation"));
      objc_msgSend(v16, "addDependency:", v18);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pendingSyncOperations"));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "finishOperation"));
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mainOperationQueue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pendingSyncOperations"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "actualOperation"));
    objc_msgSend(v7, "addOperation:", v23);

  }
}

void sub_100009C00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, char a20)
{
  uint64_t v20;

  _Block_object_dispose(&a20, 8);
  objc_destroyWeak((id *)(v20 - 104));
  _Unwind_Resume(a1);
}

void sub_100009C78(uint64_t a1)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  dispatch_semaphore_t v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  PCSRegistryOperation *v34;
  PCSRegistryOperation *v35;
  id v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id WeakRetained;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  _QWORD v47[5];
  id v48;
  _QWORD v49[4];
  NSObject *v50;
  __int128 *p_buf;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _QWORD v59[5];
  id v60;
  id v61;
  id v62;
  _QWORD block[5];
  id location;
  NSErrorUserInfoKey v65;
  const __CFString *v66;
  NSErrorUserInfoKey v67;
  const __CFString *v68;
  _QWORD v69[2];
  _QWORD v70[2];
  uint8_t v71[4];
  uint64_t v72;
  __int128 buf;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;

  objc_initWeak(&location, *(id *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "oslog"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Beginning syncing operation %@", (uint8_t *)&buf, 0xCu);
  }

  if (*(_BYTE *)(a1 + 64))
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000A5A0;
    block[3] = &unk_100018938;
    block[4] = v2;
    dispatch_sync(v4, block);

    v5 = *(void **)(a1 + 32);
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_10000A68C;
    v59[3] = &unk_100018B80;
    objc_copyWeak(&v60, (id *)(a1 + 56));
    objc_copyWeak(&v61, &location);
    objc_copyWeak(&v62, (id *)(a1 + 48));
    v59[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "addExecutionBlock:", v59);
    objc_destroyWeak(&v62);
    objc_destroyWeak(&v61);
    objc_destroyWeak(&v60);
  }
  v6 = dispatch_semaphore_create(0);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v74 = 0x3032000000;
  v75 = sub_100007740;
  v76 = sub_100007750;
  v77 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = sub_100007740;
  v57 = sub_100007750;
  v58 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "container"));
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10000A7A4;
  v49[3] = &unk_100018BA8;
  p_buf = &buf;
  v52 = &v53;
  v8 = v6;
  v50 = v8;
  objc_msgSend(v7, "accountInfoWithCompletionHandler:", v49);

  v9 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kPCSErrorDomain, 75, 0));
    objc_msgSend(*(id *)(a1 + 32), "setError:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mainOperationQueue"));
    objc_msgSend(v11, "addOperation:", *(_QWORD *)(a1 + 32));
    goto LABEL_34;
  }
  if (objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "accountStatus") == (id)1)
  {
    if ((objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "hasValidCredentials") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "userdb"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dsid"));

      if (!v11
        || (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accounts")),
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dsid")),
            v15 = objc_msgSend(v11, "isEqualToString:", v14),
            v14,
            v13,
            (v15 & 1) == 0))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accounts"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dsid"));

        if (!v17)
        {
          v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "oslog"));
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v71 = 0;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "No DSID available. Quitting sync.", v71, 2u);
          }

          v39 = kPCSErrorDomain;
          v65 = NSLocalizedDescriptionKey;
          v66 = CFSTR("No iCloud account");
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1));
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v39, 66, v40));
          objc_msgSend(*(id *)(a1 + 32), "setError:", v41);

          v36 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mainOperationQueue"));
          objc_msgSend(v36, "addOperation:", *(_QWORD *)(a1 + 32));
          goto LABEL_33;
        }
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "queue"));
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_10000A82C;
        v47[3] = &unk_100018AB8;
        v47[4] = v2;
        v48 = v17;
        v19 = v17;
        dispatch_sync(v18, v47);

      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getServerChangeToken:", CFSTR("MBserverChangeToken")));
      v21 = v20 == 0;

      if (v21)
      {
        v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "oslog"));
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v71 = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Creating zone before syncing", v71, 2u);
        }

        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "defaultCKConfiguration"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "createZone:withName:", v33, CFSTR("PCSUserRegistryMobileBackup")));

      }
      else
      {
        v22 = 0;
      }
      v34 = objc_alloc_init(PCSRegistryOperation);
      v35 = v34;
      if (v22)
        -[PCSRegistryOperation addDependency:](v34, "addDependency:", v22);
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_10000A8C4;
      v43[3] = &unk_100018BD0;
      objc_copyWeak(&v46, (id *)(a1 + 56));
      v36 = v22;
      v44 = v36;
      v45 = *(id *)(a1 + 32);
      -[PCSRegistryOperation addExecutionBlock:](v35, "addExecutionBlock:", v43);
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mainOperationQueue"));
      objc_msgSend(v37, "addOperation:", v35);

      objc_destroyWeak(&v46);
LABEL_33:

      goto LABEL_34;
    }
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "oslog"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = v54[5];
      *(_DWORD *)v71 = 138412290;
      v72 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "iCloud account in grey mode (%@)", v71, 0xCu);
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CKErrorDomain, 9, 0));
    objc_msgSend(*(id *)(a1 + 32), "setError:", v31);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mainOperationQueue"));
    objc_msgSend(v11, "addOperation:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "oslog"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v54[5];
      *(_DWORD *)v71 = 138412290;
      v72 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Not logged into iCloud (%@)", v71, 0xCu);
    }

    v25 = v54[5];
    v26 = kPCSErrorDomain;
    if (v25)
    {
      v69[0] = NSLocalizedDescriptionKey;
      v69[1] = NSUnderlyingErrorKey;
      v70[0] = CFSTR("No iCloud account");
      v70[1] = v25;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v70, v69, 2));
    }
    else
    {
      v67 = NSLocalizedDescriptionKey;
      v68 = CFSTR("No iCloud account");
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1));
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v26, 66, v27));
    objc_msgSend(*(id *)(a1 + 32), "setError:", v28);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mainOperationQueue"));
    objc_msgSend(v11, "addOperation:", *(_QWORD *)(a1 + 32));
  }
LABEL_34:

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&location);
}

void sub_10000A500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,id location)
{
  uint64_t v50;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v50 - 176), 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10000A5A0(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  void *v7;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "oslog"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pendingSyncOperations"));
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "syncing operation (%@) no longer pending", (uint8_t *)&v6, 0xCu);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pendingSyncOperations"));
  objc_msgSend(*(id *)(a1 + 32), "setCurrentSyncOperations:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "setPendingSyncOperations:", 0);
}

void sub_10000A68C(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "oslog"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Finished syncing operation %@: (%@)", (uint8_t *)&v9, 0x16u);

  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

void sub_10000A7A4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000A82C(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "_onqueueDeleteServerChangeToken:", CFSTR("MBserverChangeToken"));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "oslog"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Caching DSID from Accounts", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userdb"));
  objc_msgSend(v4, "setDsid:", v3);

}

void sub_10000A8C4(id *a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  PCSRegistryOperation *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v4 = a1[4];
  if (v4 && (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error")), v5, v5))
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "oslog"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "error"));
      *(_DWORD *)buf = 138412290;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Zone creation failed for some reason: (%@), stopping MobileBackup sync", buf, 0xCu);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "error"));
    objc_msgSend(a1[5], "setError:", v8);

    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mainOperationQueue"));
    objc_msgSend(v9, "addOperation:", a1[5]);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "fetchAllChanges:", 0));
    v11 = objc_alloc_init(PCSRegistryOperation);
    -[PCSRegistryOperation addDependency:](v11, "addDependency:", v10);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000AAE4;
    v13[3] = &unk_100018BD0;
    objc_copyWeak(&v16, v2);
    v9 = v10;
    v14 = v9;
    v15 = a1[5];
    -[PCSRegistryOperation addExecutionBlock:](v11, "addExecutionBlock:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mainOperationQueue"));
    objc_msgSend(v12, "addOperation:", v11);

    objc_destroyWeak(&v16);
  }

}

void sub_10000AAC4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000AAE4(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "error"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "error"));
    objc_msgSend(WeakRetained, "checkErrorForRetryPause:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "error"));
    v7 = objc_msgSend(WeakRetained, "errorShouldCauseReset:", v6);

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "oslog"));
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "error"));
        *(_DWORD *)buf = 138412290;
        v30 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetch failed for some terrible reason: (%@), restarting entire sync process", buf, 0xCu);

      }
      objc_msgSend(WeakRetained, "resyncDatabase:", a1[5]);
    }
    else
    {
      if (v9)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "error"));
        *(_DWORD *)buf = 138412290;
        v30 = v17;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetching failed for some reason: (%@), scheduling sync restart", buf, 0xCu);

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "resyncRegistryAction"));
      objc_msgSend(v18, "trigger");

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "error"));
      objc_msgSend(a1[5], "setError:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mainOperationQueue"));
      objc_msgSend(v20, "addOperation:", a1[5]);

    }
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mobileBackup"));
    v12 = objc_msgSend(v11, "isBackupEnabled");

    if ((v12 & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "startBackupOfNewMobileBackupIdentities"));
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10000AEA4;
      v25[3] = &unk_100018BD0;
      objc_copyWeak(&v28, v2);
      v14 = v13;
      v26 = v14;
      v27 = a1[5];
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v25));
      v16 = v15;
      if (v14)
      {
        objc_msgSend(v15, "addDependency:", v14);
      }
      else
      {
        v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "oslog"));
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No new items to push; finishing",
            buf,
            2u);
        }

      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mainOperationQueue"));
      objc_msgSend(v24, "addOperation:", v16);

      objc_destroyWeak(&v28);
    }
    else
    {
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "oslog"));
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "MobileBackup is off; not pushing data to CloudKit",
          buf,
          2u);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mainOperationQueue"));
      objc_msgSend(v22, "addOperation:", a1[5]);

    }
  }

}

void sub_10000AE80(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000AEA4(id *a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "oslog"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "error"));
    v12 = 138412290;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "startBackupOfNewMobileBackupIdentities as part of syncing done: (%@)", (uint8_t *)&v12, 0xCu);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "error"));

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "oslog"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "error"));
      v12 = 138412290;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Pushing new changes failed for some reason: (%@), scheduling retry", (uint8_t *)&v12, 0xCu);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "error"));
    objc_msgSend(WeakRetained, "checkErrorForRetryPause:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "resyncRegistryAction"));
    objc_msgSend(v9, "trigger");

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "error"));
  objc_msgSend(a1[5], "setError:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mainOperationQueue"));
  objc_msgSend(v11, "addOperation:", a1[5]);

}

void sub_10000B24C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userdb"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "recordID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recordName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "encodedData"));
  objc_msgSend(v5, "replaceRecordID:data:publicKey:", v3, v4, *(_QWORD *)(a1 + 56));

}

void sub_10000B468(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userdb"));
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "encodedData"));
  objc_msgSend(v4, "replaceConfigRecord:data:", v2, v3);

}

void sub_10000B728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B74C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userdb"));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getConfigData:", *(_QWORD *)(a1 + 40)));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_10000B8E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B8FC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userdb"));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getConfigData:", CFSTR("UserRegistryStats")));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_10000BB04(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userdb"));
  objc_msgSend(v1, "deleteRecordAll");

}

void sub_10000C310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000C344(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "oslog"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "CloudKit timeout complete", v3, 2u);
  }

}

void sub_10000C3B8(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mainOperationQueue"));
  objc_msgSend(v2, "addOperation:", *(_QWORD *)(a1 + 40));

}

void sub_10000C5F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000C638(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;

  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "oslog"));
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      v11 = *(void **)(a1 + 32);
      v14 = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error creating zone (%@): %@", (uint8_t *)&v14, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "setError:", v7);
    objc_msgSend(WeakRetained, "checkErrorForRetryPause:", v7);
  }
  else
  {
    if (v10)
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Created zones: %@", (uint8_t *)&v14, 0xCu);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "subscribeAction"));
    objc_msgSend(v12, "trigger");

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mainOperationQueue"));
  objc_msgSend(v13, "addOperation:", *(_QWORD *)(a1 + 40));

}

void sub_10000C944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000C984(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "oslog"));
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mobileBackupRecordZoneID"));
      v13 = 138412546;
      v14 = v11;
      v15 = 2112;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error deleting zone (%@): %@", (uint8_t *)&v13, 0x16u);

    }
  }
  else if (v10)
  {
    v13 = 138412290;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Deleted zones: %@", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setError:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mainOperationQueue"));
  objc_msgSend(v12, "addOperation:", *(_QWORD *)(a1 + 32));

}

void sub_10000CBEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000CC04(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userdb"));
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  v4 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  objc_msgSend(v4, "encodeObject:forKey:", v3, CFSTR("record"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "encodedData"));
  v6 = objc_msgSend(v5, "copy");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v7, "setEscrowKey:escrowBlob:", v2, v6);
}

void sub_10000CD60(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recordName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "userdb"));
  objc_msgSend(v2, "deleteEscrowKey:", v3);

}

void sub_10000CEC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000CEDC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userdb"));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queryEscrowKey:", *(_QWORD *)(a1 + 40)));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id sub_10000CF34(void *a1)
{
  id v1;
  id v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v1, 0);

  v3 = objc_msgSend(v2, "decodeObjectOfClass:forKey:", objc_opt_class(CKRecord), CFSTR("record"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

void sub_10000D3C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  id *v18;
  id *v19;

  objc_destroyWeak(v18);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_10000D448(uint64_t a1, void *a2, void *a3, void *a4)
{
  id WeakRetained;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  PCSRegistryOperation *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id *from;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint8_t v51[128];
  uint8_t buf[4];
  id v53;

  v37 = a2;
  v36 = a3;
  v38 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v34 = a1;
  v8 = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = v8;
  if (WeakRetained)
  {
    from = (id *)(a1 + 48);
    v35 = v8;
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "oslog"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v38;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Finished uploading registry records (%@)", buf, 0xCu);
    }

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v11 = v37;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v47 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "oslog"));
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "recordID"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "recordName"));
            *(_DWORD *)buf = 138412290;
            v53 = v18;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Stored record, saving in cache: %@", buf, 0xCu);

          }
          objc_msgSend(WeakRetained, "saveEscrowChange:", v15);
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v12);
    }

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v19 = v36;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(_QWORD *)v43 != v21)
            objc_enumerationMutation(v19);
          objc_msgSend(WeakRetained, "deleteEscrowID:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)j));
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v20);
    }

    if (v38)
    {
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "oslog"));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v38;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Retriggering syncing due to error (%@)", buf, 0xCu);
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "resyncRegistryAction"));
      objc_msgSend(v24, "trigger");

      objc_msgSend(v35, "setError:", v38);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mainOperationQueue"));
      objc_msgSend(v25, "addOperation:", v35);

    }
    else
    {
      v26 = *(_QWORD *)(v34 + 32);
      if (v26)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pushMobileBackupRecordsToCloudKit:removeObjects:", v26, &__NSArray0__struct));
        v28 = objc_alloc_init(PCSRegistryOperation);
        -[PCSRegistryOperation addDependency:](v28, "addDependency:", v27);
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_10000D914;
        v39[3] = &unk_100018D10;
        objc_copyWeak(&v41, from);
        v29 = v27;
        v40 = v29;
        -[PCSRegistryOperation addExecutionBlock:](v28, "addExecutionBlock:", v39);
        objc_msgSend(v35, "addDependency:", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mainOperationQueue"));
        objc_msgSend(v30, "addOperation:", v35);

        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mainOperationQueue"));
        objc_msgSend(v31, "addOperation:", v28);

        objc_destroyWeak(&v41);
      }
      else
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mainOperationQueue"));
        objc_msgSend(v32, "addOperation:", v35);

      }
    }
    v9 = v35;
  }
  else
  {
    objc_msgSend(v8, "cancel");
  }

}

void sub_10000D8F4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000D914(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "error"));
  objc_msgSend(WeakRetained, "setError:", v2);

}

id sub_10000DAF0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t PublicKey;
  void *v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  size_t v13;
  void *v14;
  _BYTE v16[32];

  v5 = a3;
  v6 = a2;
  PublicKey = PCSIdentityGetPublicKey(a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(PublicKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@%@"), v6, v8, v5));

  v10 = objc_retainAutorelease(v9);
  v11 = (const char *)objc_msgSend(v10, "UTF8String");
  v12 = ccsha256_di();
  v13 = strlen(v11);
  ccdigest(v12, v13, v11, v16);
  v14 = (void *)_PCSCreateHexString(v16, 32);

  return v14;
}

void sub_10000DEA8(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "error"));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void sub_10000E1F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  const __CFArray *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  _QWORD context[5];
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  CFRange v15;

  if (PCSServiceItemEscrowManateeIdentityByName(a2))
  {
    v4 = PCSIdentitySetCopyOrderedIdentities(*(_QWORD *)(a1 + 48), a2);
    if (v4)
    {
      v5 = (const __CFArray *)v4;
      context[0] = _NSConcreteStackBlock;
      context[1] = 3221225472;
      context[2] = sub_10000E37C;
      context[3] = &unk_100018D88;
      v6 = *(_QWORD *)(a1 + 56);
      v7 = *(void **)(a1 + 40);
      context[4] = *(_QWORD *)(a1 + 32);
      v12 = v6;
      v11 = v7;
      v15.length = CFArrayGetCount(v5);
      v15.location = 0;
      CFArrayApplyFunction(v5, v15, (CFArrayApplierFunction)sub_10000FC88, context);
      CFRelease(v5);

      return;
    }
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "oslog"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = a2;
      v9 = "No identities for %@";
      goto LABEL_8;
    }
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "oslog"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = a2;
      v9 = "Not doing MobileBackup for %@";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
    }
  }

}

void sub_10000E37C(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;

  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mobileBackupKeyRecordIdentity:version:", a2, CFSTR("-v2")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queryEscrowName:", v5));
  v7 = v6;
  if (!v6 || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "etag")), v8, !v8))
  {
    v10 = *(void **)(a1 + 32);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mobileBackupRecordZoneID"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keyRecord:withName:zone:", a2, v5, v11));

    if (objc_msgSend(*(id *)(a1 + 32), "updateEscrowData:escrowIdentity:identity:", v9, *(_QWORD *)(a1 + 48), a2))
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "oslog"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412546;
        v15 = a2;
        v16 = 2112;
        v17 = v5;
        v13 = "Will store %@ as (%@)";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v14, 0x16u);
      }
    }
    else
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "oslog"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412546;
        v15 = a2;
        v16 = 2112;
        v17 = v5;
        v13 = "Couldn't escrow identity %@ (%@); skipping";
        goto LABEL_10;
      }
    }

    goto LABEL_12;
  }
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "oslog"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = a2;
    v16 = 2112;
    v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Already stored %@ as (%@); skipping",
      (uint8_t *)&v14,
      0x16u);
  }
LABEL_12:

  objc_autoreleasePoolPop(v4);
}

void sub_10000ED88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000EDC4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userdb"));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queryEscrowKeys"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_10000F490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000F4C8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "oslog"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "queryMobileBackupKeysFromCloudKit: error: %@", (uint8_t *)&v13, 0xCu);
    }

    v8 = objc_msgSend(v6, "copy");
    v9 = *(_QWORD *)(a1 + 48);
LABEL_9:
    v11 = *(_QWORD *)(v9 + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v8;

    goto LABEL_10;
  }
  if (v5)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "oslog"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134217984;
      v14 = objc_msgSend(v5, "count");
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "queryMobileBackupKeysFromCloudKit got keys (count %lu)", (uint8_t *)&v13, 0xCu);
    }

    v8 = objc_msgSend(v5, "copy");
    v9 = *(_QWORD *)(a1 + 56);
    goto LABEL_9;
  }
LABEL_10:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_10000F9F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000FA14(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userdb"));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queryEscrowKeys"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t sub_10000FC88(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

id sub_10000FDD4()
{
  if (qword_10001D978 != -1)
    dispatch_once(&qword_10001D978, &stru_100018E48);
  return (id)qword_10001D970;
}

void sub_10000FE14(uint64_t a1)
{
  dispatch_object_t *WeakRetained;
  dispatch_object_t *v2;
  dispatch_object_t v3;
  NSObject *v4;
  dispatch_object_t v5;
  dispatch_object_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  id v9;
  NSObject *v10;
  _QWORD block[4];
  dispatch_object_t *v12;
  _QWORD v13[4];
  NSObject *v14;
  _QWORD *v15;
  _QWORD v16[5];
  NSObject *v17;

  WeakRetained = (dispatch_object_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_suspend(WeakRetained[7]);
    v3 = v2[3];
    if (v3)
    {
      v4 = objc_retainBlock(v3);
      v16[0] = 0;
      v16[1] = v16;
      v16[2] = 0x3032000000;
      v16[3] = sub_10000FF9C;
      v16[4] = sub_10000FFAC;
      v17 = v2[8];
      v5 = v2[8];
      v2[8] = 0;

      v6 = v2[6];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10000FFB4;
      v13[3] = &unk_100018E00;
      v7 = v4;
      v14 = v7;
      v15 = v16;
      -[NSObject addOperationWithBlock:](v6, "addOperationWithBlock:", v13);

      _Block_object_dispose(v16, 8);
    }
    v8 = dispatch_time(0, 1000000000 * (_QWORD)v2[4]);
    v9 = sub_10000FDD4();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001000C;
    block[3] = &unk_100018938;
    v12 = v2;
    dispatch_after(v8, v10, block);

  }
}

void sub_10000FF84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000FF9C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000FFAC(uint64_t a1)
{

}

void sub_10000FFB4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_autoreleasePoolPush();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  if (v4)
  {
    *(_QWORD *)(v3 + 40) = 0;

  }
}

void sub_10001000C(uint64_t a1)
{
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 56));
}

uint64_t sub_1000100E4(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 72) = *(_BYTE *)(result + 40) == 0;
  return result;
}

void sub_1000101A4(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (!*((_QWORD *)WeakRetained + 9) && !*((_QWORD *)WeakRetained + 8))
  {
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "label")));
    v4 = os_transaction_create(objc_msgSend(v3, "UTF8String"));
    v5 = (void *)v6[8];
    v6[8] = v4;

    WeakRetained = v6;
  }
  dispatch_source_merge_data(*((dispatch_source_t *)WeakRetained + 7), 1uLL);

}

void sub_100010338(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("PCSDelayedActionQueue", v4);
  v3 = (void *)qword_10001D970;
  qword_10001D970 = (uint64_t)v2;

}

uint64_t sub_100010388(int a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  __CFDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __CFDictionary *v17;
  FILE *v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  FILE *v28;
  __CFString *v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  FILE *v37;
  __CFString *v38;
  char v39;
  const void *v40;
  void *key;
  void *keya;
  id v44;
  id v45;
  void *v46;

  v46 = 0;
  v10 = sub_100010764(a1, a2, a3, a4, a5, a6, a7, a8, kPCSSetupUsername, a2);
  if (v10)
  {
    v17 = v10;
    switch(a1)
    {
      case 1:
        if (a5)
        {
          sub_10000447C(__stdoutp, CFSTR("Calling PCSIdentityMigrateDropStingray"), v11, v12, v13, v14, v15, v16, (uint64_t)key);
          if ((PCSIdentityMigrateDropStingray(v17, &v46) & 1) != 0)
          {
            v18 = __stdoutp;
            v19 = CFSTR("PCSIdentityMigrateDropStingray succeeded");
            goto LABEL_17;
          }
        }
        else if ((PCSIdentityMigrateDropStingray(v10, &v46) & 1) != 0)
        {
          goto LABEL_36;
        }
        sub_10000447C(__stderrp, CFSTR("PCSIdentityMigrateDropStingray: %@"), v11, v12, v13, v14, v15, v16, (uint64_t)v46);
        goto LABEL_41;
      case 2:
        if (a5)
        {
          sub_10000447C(__stdoutp, CFSTR("Calling PCSIdentityMigrateToiCDP"), v11, v12, v13, v14, v15, v16, (uint64_t)key);
          if ((PCSIdentityMigrateToiCDP(v17, &v46) & 1) != 0)
          {
            v18 = __stdoutp;
            v19 = CFSTR("PCSIdentityMigrateToiCDP succeeded");
            goto LABEL_17;
          }
        }
        else if ((PCSIdentityMigrateToiCDP(v10, &v46) & 1) != 0)
        {
          goto LABEL_36;
        }
        sub_10000447C(__stderrp, CFSTR("PCSIdentityMigrateToiCDP: %@"), v11, v12, v13, v14, v15, v16, (uint64_t)v46);
        goto LABEL_41;
      case 3:
        v28 = __stderrp;
        v29 = CFSTR("Convert HSM no longer supported");
        goto LABEL_40;
      case 4:
        if (a5)
        {
          sub_10000447C(__stdoutp, CFSTR("Calling PCSIdentityMigrateCloseDoor"), v11, v12, v13, v14, v15, v16, (uint64_t)key);
          if ((PCSIdentityMigrateCloseDoor(v17, &v46) & 1) != 0)
          {
            v18 = __stdoutp;
            v19 = CFSTR("PCSIdentityMigrateCloseDoor succeeded");
            goto LABEL_17;
          }
        }
        else if ((PCSIdentityMigrateCloseDoor(v10, &v46) & 1) != 0)
        {
          goto LABEL_36;
        }
        sub_10000447C(__stderrp, CFSTR("PCSIdentityMigrateCloseDoor: %@"), v11, v12, v13, v14, v15, v16, (uint64_t)v46);
        goto LABEL_41;
      case 5:
        if (a5)
        {
          sub_10000447C(__stdoutp, CFSTR("Calling PCSIdentityMigrateRestoreHSM"), v11, v12, v13, v14, v15, v16, (uint64_t)key);
          if ((PCSIdentityMigrateRestoreHSM(v17, &v46) & 1) != 0)
          {
            v18 = __stdoutp;
            v19 = CFSTR("PCSIdentityMigrateRestoreHSM succeeded");
LABEL_17:
            sub_10000447C(v18, v19, v11, v12, v13, v14, v15, v16, (uint64_t)keya);
            goto LABEL_36;
          }
        }
        else if ((PCSIdentityMigrateRestoreHSM(v10, &v46) & 1) != 0)
        {
LABEL_36:
          v26 = 0;
          goto LABEL_37;
        }
        v28 = __stderrp;
        key = v46;
        v29 = CFSTR("PCSIdentityMigrateRestoreHSM: %@");
LABEL_40:
        sub_10000447C(v28, v29, v11, v12, v13, v14, v15, v16, (uint64_t)key);
LABEL_41:
        v26 = 0;
LABEL_43:
        v27 = 1;
LABEL_44:
        CFRelease(v17);
        v40 = v46;
        if (v46)
        {
          v46 = 0;
          CFRelease(v40);
        }
        break;
      case 6:
        if (a5)
          sub_10000447C(__stdoutp, CFSTR("Calling PCSAccountEnableWalrus"), v11, v12, v13, v14, v15, v16, (uint64_t)key);
        v45 = 0;
        v30 = PCSAccountEnableWalrus(0, v17, &v45);
        v26 = v45;
        if ((v30 & 1) == 0)
        {
          sub_10000447C(__stderrp, CFSTR("PCSAccountEnableWalrus: %@"), v31, v32, v33, v34, v35, v36, (uint64_t)v26);
          goto LABEL_43;
        }
        if (!a5)
          goto LABEL_37;
        v37 = __stdoutp;
        v38 = CFSTR("PCSAccountEnableWalrus succeeded");
        goto LABEL_28;
      case 7:
        if (a5)
          sub_10000447C(__stdoutp, CFSTR("Calling PCSAccountDisableWalrus"), v11, v12, v13, v14, v15, v16, (uint64_t)key);
        v44 = 0;
        v39 = PCSAccountDisableWalrus(0, v17, &v44);
        v26 = v44;
        if ((v39 & 1) == 0)
        {
          sub_10000447C(__stderrp, CFSTR("PCSAccountDisableWalrus: %@"), v31, v32, v33, v34, v35, v36, (uint64_t)v26);
          goto LABEL_43;
        }
        if (a5)
        {
          v37 = __stdoutp;
          v38 = CFSTR("PCSAccountDisableWalrus succeeded");
LABEL_28:
          sub_10000447C(v37, v38, v31, v32, v33, v34, v35, v36, (uint64_t)key);
        }
LABEL_37:
        v27 = 0;
        goto LABEL_44;
      default:
        goto LABEL_41;
    }
  }
  else
  {
    sub_10000447C(__stderrp, CFSTR("CFDictionaryCreateMutableForCFTypesWith failed"), v11, v12, v13, v14, v15, v16, (uint64_t)key);
    v26 = 0;
    v27 = 1;
  }
  if (a5)
    sub_10000447C(__stderrp, CFSTR("convert returning: %d"), v20, v21, v22, v23, v24, v25, v27);

  return v27;
}

__CFDictionary *sub_100010764(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *key, uint64_t a10)
{
  __CFDictionary *Mutable;
  const void *v11;
  const void **v12;
  const void **v14;

  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v14 = (const void **)&a10;
  v11 = key;
  if (key)
  {
    do
    {
      CFDictionarySetValue(Mutable, v11, *v14);
      v12 = v14 + 1;
      v14 += 2;
      v11 = *v12;
    }
    while (*v12);
  }
  return Mutable;
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__onqueueDeleteServerChangeToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onqueueDeleteServerChangeToken:");
}

id objc_msgSend__onqueueSaveUserRegistryStats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onqueueSaveUserRegistryStats");
}

id objc_msgSend__setEnabledTopics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setEnabledTopics:");
}

id objc_msgSend_aa_personID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_personID");
}

id objc_msgSend_accountForCurrentPersona(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountForCurrentPersona");
}

id objc_msgSend_accountInfoWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountInfoWithCompletionHandler:");
}

id objc_msgSend_accountStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountStatus");
}

id objc_msgSend_accountStatusWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountStatusWithCompletionHandler:");
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accounts");
}

id objc_msgSend_actualOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actualOperation");
}

id objc_msgSend_addDatabaseOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDatabaseOperation:");
}

id objc_msgSend_addDependency_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDependency:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addExecutionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addExecutionBlock:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addOperationWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOperationWithBlock:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_blockOperationWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockOperationWithBlock:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_checkAccountStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkAccountStatus:");
}

id objc_msgSend_checkErrorForRetryPause_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkErrorForRetryPause:");
}

id objc_msgSend_ckRecordListToRecordIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ckRecordListToRecordIDs:");
}

id objc_msgSend_clearCloudKitCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearCloudKitCache");
}

id objc_msgSend_cloudKitRateLimitedOp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloudKitRateLimitedOp");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "container");
}

id objc_msgSend_containerWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerWithIdentifier:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createPendingSyncOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createPendingSyncOperation:");
}

id objc_msgSend_createZone_withName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createZone:withName:");
}

id objc_msgSend_currentItemPointerModificationTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentItemPointerModificationTime");
}

id objc_msgSend_currentSyncOperations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentSyncOperations");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_defaultAccountsModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultAccountsModel");
}

id objc_msgSend_defaultCKConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCKConfiguration");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_deleteEscrowID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteEscrowID:");
}

id objc_msgSend_deleteEscrowKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteEscrowKey:");
}

id objc_msgSend_deleteRecordAll(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteRecordAll");
}

id objc_msgSend_deleteRecordID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteRecordID:");
}

id objc_msgSend_dependencies(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dependencies");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_dsid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dsid");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodedData");
}

id objc_msgSend_ensureUserRegistryDbLoaded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ensureUserRegistryDbLoaded:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorShouldCauseReset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorShouldCauseReset:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_etag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "etag");
}

id objc_msgSend_extractMobilebackupKeyEscrow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extractMobilebackupKeyEscrow:");
}

id objc_msgSend_fetchAllChanges_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAllChanges:");
}

id objc_msgSend_fetchRecordZoneChanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRecordZoneChanges");
}

id objc_msgSend_finishOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishOperation");
}

id objc_msgSend_flushStats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flushStats");
}

id objc_msgSend_getConfigData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getConfigData:");
}

id objc_msgSend_getServerChangeToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getServerChangeToken:");
}

id objc_msgSend_hasValidCredentials(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasValidCredentials");
}

id objc_msgSend_identity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identity");
}

id objc_msgSend_identityCopySet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identityCopySet");
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_init_finish_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init:finish:");
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initRequiringSecureCoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initRequiringSecureCoding:");
}

id objc_msgSend_initWithBackup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBackup:");
}

id objc_msgSend_initWithDSID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDSID:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEnvironmentName:namedDelegatePort:queue:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithLabel_delay_operationQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLabel:delay:operationQueue:");
}

id objc_msgSend_initWithRecordName_zoneID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecordName:zoneID:");
}

id objc_msgSend_initWithRecordType_predicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecordType:predicate:");
}

id objc_msgSend_initWithRecordType_recordID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecordType:recordID:");
}

id objc_msgSend_initWithRecordZoneIDs_configurationsByRecordZoneID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecordZoneIDs:configurationsByRecordZoneID:");
}

id objc_msgSend_initWithRecordZonesToSave_recordZoneIDsToDelete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecordZonesToSave:recordZoneIDsToDelete:");
}

id objc_msgSend_initWithRecordsToSave_recordIDsToDelete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecordsToSave:recordIDsToDelete:");
}

id objc_msgSend_initWithSubscriptionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSubscriptionID:");
}

id objc_msgSend_initWithSubscriptionsToSave_subscriptionIDsToDelete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSubscriptionsToSave:subscriptionIDsToDelete:");
}

id objc_msgSend_initWithZoneName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithZoneName:");
}

id objc_msgSend_initWithZoneName_ownerName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithZoneName:ownerName:");
}

id objc_msgSend_isBackupEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBackupEnabled");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExecuting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isExecuting");
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFinished");
}

id objc_msgSend_isReady(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isReady");
}

id objc_msgSend_keyRecord_withName_zone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyRecord:withName:zone:");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "label");
}

id objc_msgSend_lastError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastError");
}

id objc_msgSend_lastfetchRecordZoneChangesAtStart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastfetchRecordZoneChangesAtStart");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_loadMobileBackupKeysFromDB(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadMobileBackupKeysFromDB");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longValue");
}

id objc_msgSend_mainOperationQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainOperationQueue");
}

id objc_msgSend_mobileBackup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mobileBackup");
}

id objc_msgSend_mobileBackupKeyRecordIdentity_version_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mobileBackupKeyRecordIdentity:version:");
}

id objc_msgSend_mobileBackupRecordZoneID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mobileBackupRecordZoneID");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectsAtIndexes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectsAtIndexes:");
}

id objc_msgSend_operationStateString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationStateString");
}

id objc_msgSend_operationUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationUUID");
}

id objc_msgSend_oslog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "oslog");
}

id objc_msgSend_pendingDependenciesString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingDependenciesString:");
}

id objc_msgSend_pendingSyncOperations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingSyncOperations");
}

id objc_msgSend_performQuery_inZoneWithID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performQuery:inZoneWithID:completionHandler:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_previousServerChangeToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previousServerChangeToken");
}

id objc_msgSend_privateCloudDatabase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "privateCloudDatabase");
}

id objc_msgSend_privateDatabase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "privateDatabase");
}

id objc_msgSend_pushMobileBackupRecordsToCloudKit_removeObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushMobileBackupRecordsToCloudKit:removeObjects:");
}

id objc_msgSend_pushNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushNotifications");
}

id objc_msgSend_queryEscrowKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryEscrowKey:");
}

id objc_msgSend_queryEscrowKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryEscrowKeys");
}

id objc_msgSend_queryEscrowName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryEscrowName:");
}

id objc_msgSend_queryMobileBackupKeysFromCloudKit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryMobileBackupKeysFromCloudKit:");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue");
}

id objc_msgSend_recordFetch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordFetch");
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordID");
}

id objc_msgSend_recordModify(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordModify");
}

id objc_msgSend_recordName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordName");
}

id objc_msgSend_recordType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordType");
}

id objc_msgSend_removeObjectsInRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsInRange:");
}

id objc_msgSend_replaceConfigRecord_data_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceConfigRecord:data:");
}

id objc_msgSend_replaceRecordID_data_publicKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceRecordID:data:publicKey:");
}

id objc_msgSend_resyncDatabase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resyncDatabase:");
}

id objc_msgSend_resyncRegistryAction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resyncRegistryAction");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_saveEscrowChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveEscrowChange:");
}

id objc_msgSend_saveServerChangeToken_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveServerChangeToken:forKey:");
}

id objc_msgSend_scanPCSIdentitiesForNewMobileBackupRecords(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanPCSIdentitiesForNewMobileBackupRecords");
}

id objc_msgSend_selfname(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selfname");
}

id objc_msgSend_serverPreferredPushEnvironmentWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverPreferredPushEnvironmentWithCompletionHandler:");
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAction:");
}

id objc_msgSend_setCloudKitRateLimitedOp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCloudKitRateLimitedOp:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setCurrentSyncOperations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentSyncOperations:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDsid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDsid:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setError:");
}

id objc_msgSend_setEscrowKey_escrowBlob_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEscrowKey:escrowBlob:");
}

id objc_msgSend_setFetchAllChanges_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFetchAllChanges:");
}

id objc_msgSend_setFetchRecordZoneChanges_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFetchRecordZoneChanges:");
}

id objc_msgSend_setFetchRecordZoneChangesCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFetchRecordZoneChangesCompletionBlock:");
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlags:");
}

id objc_msgSend_setHoldTransaction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHoldTransaction:");
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLabel:");
}

id objc_msgSend_setLastfetchRecordZoneChangesAtStart_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastfetchRecordZoneChangesAtStart:");
}

id objc_msgSend_setModifyRecordZonesCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModifyRecordZonesCompletionBlock:");
}

id objc_msgSend_setModifyRecordsCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModifyRecordsCompletionBlock:");
}

id objc_msgSend_setModifySubscriptionsCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModifySubscriptionsCompletionBlock:");
}

id objc_msgSend_setNotificationInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotificationInfo:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPendingSyncOperations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPendingSyncOperations:");
}

id objc_msgSend_setPreviousServerChangeToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviousServerChangeToken:");
}

id objc_msgSend_setPushNotifications_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPushNotifications:");
}

id objc_msgSend_setRecordFetch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecordFetch:");
}

id objc_msgSend_setRecordModify_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecordModify:");
}

id objc_msgSend_setRecordWasChangedBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecordWasChangedBlock:");
}

id objc_msgSend_setRecordWithIDWasDeletedBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecordWithIDWasDeletedBlock:");
}

id objc_msgSend_setRecordZoneFetchCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecordZoneFetchCompletionBlock:");
}

id objc_msgSend_setSavePolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSavePolicy:");
}

id objc_msgSend_setStats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStats:");
}

id objc_msgSend_setStats_dirty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStats_dirty:");
}

id objc_msgSend_setTimeoutIntervalForResource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutIntervalForResource:");
}

id objc_msgSend_setUserdb_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserdb:");
}

id objc_msgSend_setZoneReset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setZoneReset:");
}

id objc_msgSend_setupSubscriptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupSubscriptions");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_startBackupOfNewMobileBackupIdentities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startBackupOfNewMobileBackupIdentities");
}

id objc_msgSend_statModify(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statModify");
}

id objc_msgSend_stats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stats");
}

id objc_msgSend_stats_dirty(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stats_dirty");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_subscribeAction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subscribeAction");
}

id objc_msgSend_syncUserRegistry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncUserRegistry");
}

id objc_msgSend_trigger(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trigger");
}

id objc_msgSend_updateEscrowData_escrowIdentity_identity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateEscrowData:escrowIdentity:identity:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userdb(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userdb");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "username");
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zoneID");
}

id objc_msgSend_zoneReset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zoneReset");
}
