@implementation SOSAccountTrustClassic

- (BOOL)cleanupRetirementTickets:(id)a3 circle:(__OpaqueSOSCircle *)a4 time:(unint64_t)a5 err:(__CFError *)a6
{
  id v10;
  const __CFSet *MutableForSOSPeerInfosByID;
  const __CFSet *v12;
  CFMutableArrayRef Mutable;
  uint64_t Name;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  CFDictionaryRef v22;
  void *v23;
  unsigned __int8 v24;
  _QWORD v26[6];
  _QWORD context[7];

  v10 = a3;
  MutableForSOSPeerInfosByID = (const __CFSet *)CFSetCreateMutableForSOSPeerInfosByID(kCFAllocatorDefault);
  v12 = (const __CFSet *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust retirees](self, "retirees"));
  context[0] = _NSConcreteStackBlock;
  context[1] = 3221225472;
  context[2] = sub_1001D8C80;
  context[3] = &unk_1002EB9A0;
  context[4] = a5;
  context[5] = a4;
  context[6] = MutableForSOSPeerInfosByID;
  CFSetApplyFunction(v12, (CFSetApplierFunction)sub_1001D8CE8, context);

  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1001D8CFC;
  v26[3] = &unk_1002EBD90;
  v26[4] = self;
  v26[5] = Mutable;
  CFSetApplyFunction(MutableForSOSPeerInfosByID, (CFSetApplierFunction)sub_1001D8CE8, v26);
  if (MutableForSOSPeerInfosByID)
    CFRelease(MutableForSOSPeerInfosByID);
  Name = SOSCircleGetName(a4);
  v22 = sub_10012E96C(kCFAllocatorDefault, v15, v16, v17, v18, v19, v20, v21, Name, (uint64_t)Mutable);
  if (Mutable)
    CFRelease(Mutable);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "circle_transport"));
  v24 = objc_msgSend(v23, "expireRetirementRecords:err:", v22, a6);

  if (v22)
    CFRelease(v22);

  return v24;
}

- (BOOL)cleanupAfterPeer:(id)a3 circleTransport:(id)a4 seconds:(unint64_t)a5 circle:(__OpaqueSOSCircle *)a6 cleanupPeer:(__OpaqueSOSPeerInfo *)a7 err:(__CFError *)a8
{
  id v14;
  id v15;
  __OpaqueSOSPeerInfo *v16;
  const void *PeerID;
  const void *Name;
  const __CFDictionary *Mutable;
  __CFArray *Value;
  CFMutableArrayRef v21;
  CFTypeID v22;
  unsigned int v23;
  const void *v24;
  NSObject *v25;
  CFTypeRef v26;
  BOOL v27;
  const void *v28;
  NSObject *v29;
  CFTypeRef v30;
  CFTypeRef cf;
  uint8_t buf[4];
  const void *v34;
  __int16 v35;
  CFTypeRef v36;

  v14 = a3;
  v15 = a4;
  v16 = -[SOSAccountTrust peerInfo](self, "peerInfo");
  if (!-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo") || !v16)
  {
    SOSErrorCreate(1032, a8, 0, CFSTR("I have no peer"));
    goto LABEL_27;
  }
  if (!SOSCircleHasActivePeer(a6, -[SOSAccountTrust peerInfo](self, "peerInfo"), a8))
  {
LABEL_27:
    v27 = 1;
    goto LABEL_25;
  }
  PeerID = (const void *)SOSPeerInfoGetPeerID(a7);
  Name = (const void *)SOSCircleGetName(a6);
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  Value = (__CFArray *)CFDictionaryGetValue(Mutable, Name);
  if (!Value || (v21 = Value, v22 = CFGetTypeID(Value), v22 != CFArrayGetTypeID()))
  {
    v21 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    CFDictionarySetValue(Mutable, Name, v21);
    if (v21)
      CFRelease(v21);
  }
  CFArrayAppendValue(v21, PeerID);
  cf = 0;
  v23 = objc_msgSend(v14, "SOSTransportMessageCleanupAfterPeerMessages:peers:err:", v14, Mutable, &cf);
  if ((v23 & 1) == 0)
  {
    v24 = sub_10000EF14("account");
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v34 = PeerID;
      v35 = 2112;
      v36 = cf;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Failed to cleanup after peer %@ messages: %@", buf, 0x16u);
    }

  }
  v26 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v26);
  }
  if ((v23 & SOSPeerInfoRetireRetirementTicket(a5, a7)) != 1)
    goto LABEL_20;
  if ((objc_msgSend(v15, "expireRetirementRecords:err:", Mutable, &cf) & 1) == 0)
  {
    v28 = sub_10000EF14("account");
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v34 = PeerID;
      v35 = 2112;
      v36 = cf;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Failed to cleanup after peer %@ retirement: %@", buf, 0x16u);
    }

LABEL_20:
    v27 = 0;
    goto LABEL_21;
  }
  v27 = 1;
LABEL_21:
  v30 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v30);
  }
  if (Mutable)
    CFRelease(Mutable);
LABEL_25:

  return v27;
}

- (void)getValueFromExpansion:(__CFString *)a3 err:(__CFError *)a4
{
  void *v6;
  void *v7;
  id v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion", a3, a4));

  if (!v6)
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));
  v8 = objc_msgSend(v7, "objectForKey:", a3);

  return v8;
}

- (BOOL)ensureExpansion:(__CFError *)a3
{
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[SOSAccountTrust setExpansion:](self, "setExpansion:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));
  v8 = sub_1000326EC((uint64_t)v7, (CFTypeRef *)a3, CFSTR("Can't Alloc Account Expansion dictionary"));

  return v8;
}

- (BOOL)clearValueFromExpansion:(__CFString *)a3 err:(__CFError *)a4
{
  _BOOL4 v6;
  void *v7;

  v6 = -[SOSAccountTrustClassic ensureExpansion:](self, "ensureExpansion:", a4);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));
    objc_msgSend(v7, "removeObjectForKey:", a3);

  }
  return v6;
}

- (BOOL)setValueInExpansion:(__CFString *)a3 value:(void *)a4 err:(__CFError *)a5
{
  _BOOL4 v8;
  void *v9;

  if (a4)
  {
    v8 = -[SOSAccountTrustClassic ensureExpansion:](self, "ensureExpansion:", a5);
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));
      objc_msgSend(v9, "setObject:forKey:", a4, a3);

      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = -[SOSAccountTrustClassic clearValueFromExpansion:err:](self, "clearValueFromExpansion:err:", a3, a5);
  }
  return v8;
}

- (BOOL)valueSetContainsValue:(__CFString *)a3 value:(void *)a4
{
  const __CFSet *v5;
  const __CFSet *v6;
  CFTypeID v7;

  v5 = -[SOSAccountTrustClassic getValueFromExpansion:err:](self, "getValueFromExpansion:err:", a3, 0);
  if (v5)
  {
    v6 = v5;
    v7 = CFGetTypeID(v5);
    LOBYTE(v5) = v7 == CFSetGetTypeID() && CFSetContainsValue(v6, a4) != 0;
  }
  return (char)v5;
}

- (void)valueUnionWith:(__CFString *)a3 valuesToUnion:(__CFSet *)a4
{
  CFMutableSetRef MutableCopy;
  const __CFSet *v7;
  const __CFSet *v8;
  CFTypeID v9;
  _QWORD context[5];

  MutableCopy = CFSetCreateMutableCopy(kCFAllocatorDefault, 0, a4);
  v7 = -[SOSAccountTrustClassic getValueFromExpansion:err:](self, "getValueFromExpansion:err:", a3, 0);
  if (v7)
  {
    v8 = v7;
    v9 = CFGetTypeID(v7);
    if (v9 == CFSetGetTypeID())
    {
      context[0] = _NSConcreteStackBlock;
      context[1] = 3221225472;
      context[2] = sub_1001E2BB8;
      context[3] = &unk_1002EDB28;
      context[4] = MutableCopy;
      CFSetApplyFunction(v8, (CFSetApplierFunction)sub_1001E2990, context);
    }
  }
  -[SOSAccountTrustClassic setValueInExpansion:value:err:](self, "setValueInExpansion:value:err:", a3, MutableCopy, 0);
  if (MutableCopy)
    CFRelease(MutableCopy);
}

- (void)valueSubtractFrom:(__CFString *)a3 valuesToSubtract:(__CFSet *)a4
{
  const __CFSet *v7;
  const __CFSet *v8;
  CFTypeID v9;
  CFMutableSetRef MutableCopy;
  _QWORD context[5];

  v7 = -[SOSAccountTrustClassic getValueFromExpansion:err:](self, "getValueFromExpansion:err:", a3, 0);
  if (v7)
  {
    v8 = v7;
    v9 = CFGetTypeID(v7);
    if (v9 == CFSetGetTypeID())
    {
      MutableCopy = CFSetCreateMutableCopy(kCFAllocatorDefault, 0, v8);
      context[0] = _NSConcreteStackBlock;
      context[1] = 3221225472;
      context[2] = sub_1001E2BB0;
      context[3] = &unk_1002EDB28;
      context[4] = MutableCopy;
      CFSetApplyFunction(a4, (CFSetApplierFunction)sub_1001E2990, context);
      -[SOSAccountTrustClassic setValueInExpansion:value:err:](self, "setValueInExpansion:value:err:", a3, MutableCopy, 0);
      if (MutableCopy)
        CFRelease(MutableCopy);
    }
  }
}

- (void)pendEnableViewSet:(__CFSet *)a3
{
  const void *v5;
  NSObject *v6;
  uint8_t v7[16];

  if (CFSetGetValue(a3, kSOSViewKeychainV0))
  {
    v5 = sub_10000EF14("viewChange");
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Warning, attempting to Add KeychainV0", v7, 2u);
    }

  }
  -[SOSAccountTrustClassic valueUnionWith:valuesToUnion:](self, "valueUnionWith:valuesToUnion:", CFSTR("pendingEnableViews"), a3);
  -[SOSAccountTrustClassic valueSubtractFrom:valuesToSubtract:](self, "valueSubtractFrom:valuesToSubtract:", CFSTR("pendingDisableViews"), a3);
}

- (BOOL)updateV2Dictionary:(id)a3 v2:(__CFDictionary *)a4
{
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  if (a4)
  {
    -[SOSAccountTrustClassic setValueInExpansion:value:err:](self, "setValueInExpansion:value:err:", CFSTR("v2dictionary"), a4, 0);
    if (-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
    {
      if (-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo")
        && SOSFullPeerInfoUpdateV2Dictionary(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), a4, 0))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "circle_transport"));
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_1001E2B20;
        v9[3] = &unk_1002EDB08;
        v10 = v6;
        -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v7, 0, v9);

      }
    }
  }

  return 1;
}

- (BOOL)forEachRing:(id)a3
{
  id v4;
  __CFDictionary *v5;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v7;
  BOOL v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, const void *, CFDataRef);
  void *v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t *v20;
  CFMutableDictionaryRef v21;
  _QWORD v22[4];
  _QWORD v23[4];
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[4];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v4 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v5 = -[SOSAccountTrustClassic getRings:](self, "getRings:", 0);
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v7 = Mutable;
  if (!v5)
  {
    if (Mutable)
      CFRelease(Mutable);
    goto LABEL_8;
  }
  if (!Mutable)
  {
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_1001E29A4;
  v13 = &unk_1002EBED8;
  v15 = v26;
  v16 = v25;
  v21 = Mutable;
  v17 = v24;
  v18 = v23;
  v14 = v4;
  v19 = v22;
  v20 = &v27;
  CFDictionaryApplyFunction(v5, (CFDictionaryApplierFunction)sub_1001E2B08, &v10);
  if (*((_BYTE *)v28 + 24))
    -[SOSAccountTrustClassic setRings:](self, "setRings:", v7, v10, v11, v12, v13);
  CFRelease(v7);

  v8 = 1;
LABEL_9:
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v27, 8);

  return v8;
}

- (BOOL)resetAllRings:(id)a3 err:(__CFError *)a4
{
  id v6;
  CFMutableSetRef Mutable;
  const __CFSet *v8;
  int v9;
  _QWORD context[5];
  id v12;
  uint64_t *v13;
  __CFError **v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
  v8 = Mutable;
  if (Mutable)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001E2920;
    v15[3] = &unk_1002EBEF8;
    v15[4] = Mutable;
    -[SOSAccountTrustClassic forEachRing:](self, "forEachRing:", v15);
    context[0] = _NSConcreteStackBlock;
    context[1] = 3221225472;
    context[2] = sub_1001E293C;
    context[3] = &unk_1002EBF20;
    v13 = &v16;
    context[4] = self;
    v12 = v6;
    v14 = a4;
    CFSetApplyFunction(v8, (CFSetApplierFunction)sub_1001E2990, context);
    CFRelease(v8);
    v9 = *((unsigned __int8 *)v17 + 24);

  }
  else
  {
    v9 = *((unsigned __int8 *)v17 + 24);
  }
  _Block_object_dispose(&v16, 8);

  return v9 != 0;
}

- (BOOL)resetAccountToEmpty:(id)a3 transport:(id)a4 err:(__CFError *)a5
{
  id v8;
  id v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  const void *v12;
  NSObject *v13;
  CFTypeRef v14;
  const void *v15;
  NSObject *v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  const void *v19;
  NSObject *v20;
  __CFError *v21;
  BOOL v22;
  _QWORD v24[6];
  CFTypeRef cf;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint8_t buf[4];
  CFTypeRef v31;

  v8 = a3;
  v9 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  cf = 0;
  v10 = -[SOSAccountTrustClassic resetAllRings:err:](self, "resetAllRings:err:", v8, &cf);
  if (*((_BYTE *)v27 + 24))
    v11 = v10;
  else
    v11 = 0;
  *((_BYTE *)v27 + 24) = v11;
  if (cf)
  {
    v12 = sub_10000EF14("SecError");
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = cf;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "reset all rings error: %@", buf, 0xCu);
    }

    v14 = cf;
    if (a5)
    {
      *a5 = (__CFError *)cf;
    }
    else if (cf)
    {
      cf = 0;
      CFRelease(v14);
    }
  }
  -[SOSAccountTrust setFullPeerInfo:](self, "setFullPeerInfo:", 0);
  -[SOSAccountTrust setDepartureCode:](self, "setDepartureCode:", 2);
  v15 = sub_10000EF14("circleOps");
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Reset Rings to empty by client request", buf, 2u);
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1001E28DC;
  v24[3] = &unk_1002EBF48;
  v24[4] = &v26;
  v24[5] = a5;
  v17 = -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v9, a5, v24);
  if (*((_BYTE *)v27 + 24))
    v18 = v17;
  else
    v18 = 0;
  *((_BYTE *)v27 + 24) = v18;
  if ((v18 & 1) != 0)
  {
    notify_post(kSOSCCCircleOctagonKeysChangedNotification);
  }
  else
  {
    v19 = sub_10000EF14("SecError");
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      if (a5)
        v21 = *a5;
      else
        v21 = 0;
      *(_DWORD *)buf = 138412290;
      v31 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "error: %@", buf, 0xCu);
    }

  }
  v22 = *((_BYTE *)v27 + 24) != 0;
  _Block_object_dispose(&v26, 8);

  return v22;
}

- (void)setRings:(__CFDictionary *)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));
  objc_msgSend(v4, "setObject:forKey:", a3, CFSTR("trusted_rings"));

}

- (BOOL)checkForRings:(__CFError *)a3
{
  __CFDictionary *v5;
  CFTypeID v6;
  BOOL v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  v5 = -[SOSAccountTrustClassic getRings:](self, "getRings:", 0);
  if (v5 && (v6 = CFGetTypeID(v5), v6 == CFDictionaryGetTypeID()))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001E27F8;
    v9[3] = &unk_1002EBF70;
    v9[4] = &v10;
    -[SOSAccountTrustClassic forEachRing:](self, "forEachRing:", v9);
    v7 = *((_BYTE *)v11 + 24) != 0;
  }
  else
  {
    SOSCreateError(4, CFSTR("Rings not present"), 0, a3);
    v7 = 0;
    *((_BYTE *)v11 + 24) = 0;
  }
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (BOOL)setRing:(__OpaqueSOSRing *)a3 ringName:(__CFString *)a4 err:(__CFError *)a5
{
  __CFDictionary *v8;
  __CFDictionary *v9;
  const void *v10;
  const void *v11;

  if (a3)
  {
    v8 = -[SOSAccountTrustClassic getRings:](self, "getRings:", 0);
    if (v8)
    {
      v9 = v8;
      v10 = (const void *)sub_1001E6424((const __CFDictionary **)a3, (CFTypeRef *)a5);
      if (v10)
      {
        v11 = v10;
        CFDictionarySetValue(v9, a4, v10);
        CFRelease(v11);
        LOBYTE(v10) = 1;
      }
    }
    else
    {
      SOSCreateError(1043, CFSTR("No Rings found"), 0, a5);
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return (char)v10;
}

- (BOOL)handleUpdateRing:(id)a3 prospectiveRing:(__OpaqueSOSRing *)a4 transport:(id)a5 userPublicKey:(__SecKey *)a6 writeUpdate:(BOOL)a7 err:(__CFError *)a8
{
  _BOOL4 v9;
  const char *v14;
  int v15;
  int v16;
  const void *v17;
  NSObject *v18;
  BOOL v19;
  __OpaqueSOSFullPeerInfo *v20;
  uint64_t PeerInfo;
  uint64_t PeerID;
  unsigned int v23;
  uint64_t MutableForSOSPeerInfosByID;
  const __CFString *Value;
  const __CFString *v26;
  CFStringRef Copy;
  CFStringRef v28;
  const void *v29;
  NSObject *v30;
  const __CFString *v31;
  const void *v32;
  NSObject *v33;
  const __CFSet *v34;
  const __CFSet *v35;
  uint64_t Instance;
  CFTypeRef v37;
  uint64_t v38;
  __OpaqueSOSRing *v39;
  unsigned int v40;
  unsigned int v41;
  uint64_t v42;
  const void *v43;
  NSObject *v44;
  uint64_t v45;
  const void *v46;
  NSObject *v47;
  const void *v48;
  NSObject *v49;
  const void *v50;
  const void *v51;
  CFStringRef v52;
  CFStringRef v53;
  const void *v54;
  NSObject *v55;
  char *v56;
  const __CFString *v57;
  int v58;
  const void *v59;
  NSObject *v60;
  const void *v61;
  NSObject *v62;
  char *v63;
  const char *v64;
  CFMutableSetRef v65;
  __OpaqueSOSCircle *v66;
  const void *v67;
  NSObject *v68;
  _BOOL4 v69;
  const __CFData *v70;
  const void *v71;
  const void *v72;
  NSObject *v73;
  char v74;
  const __CFDictionary **v75;
  uint64_t v76;
  void *v77;
  unsigned int v78;
  _BOOL4 v79;
  const void *v80;
  NSObject *v81;
  char v82;
  const void *v83;
  NSObject *v84;
  const void *v85;
  NSObject *v86;
  const void *v87;
  NSObject *v88;
  unsigned int v89;
  char *v90;
  const void *v91;
  NSObject *v92;
  const void *v93;
  _BOOL4 v94;
  const void *v95;
  NSObject *v96;
  _BOOL4 v97;
  uint64_t v98;
  const __CFData *v99;
  const void *v100;
  _BOOL4 v101;
  const void *v102;
  NSObject *v103;
  _BOOL4 v104;
  const void *v105;
  NSObject *v106;
  const __CFDictionary **v107;
  const void *v108;
  NSObject *v109;
  const __CFData *v110;
  const void *v111;
  NSObject *v112;
  const void *v113;
  NSObject *v114;
  const void *v115;
  const void *v116;
  NSObject *v117;
  __CFDictionary *Mutable;
  const void *v119;
  char v120;
  const void *v121;
  NSObject *v122;
  CFTypeRef v123;
  _DWORD *v124;
  const void *v125;
  NSObject *v126;
  const void *v127;
  unsigned int v128;
  const void *v129;
  NSObject *v130;
  const void *v132;
  NSObject *v133;
  const void *v134;
  NSObject *v135;
  CFTypeRef v136;
  _BOOL4 v137;
  int v138;
  const char *v139;
  uint64_t v140;
  CFTypeRef v141;
  const __CFString *cf1;
  const void *v143;
  CFTypeRef v144;
  char v145;
  CFTypeRef v146;
  CFMutableSetRef cf;
  __SecKey *v148;
  uint64_t *v149;
  __OpaqueSOSRing *v150;
  id v151;
  id v152;
  _QWORD v153[6];
  _QWORD v154[6];
  CFTypeRef v155;
  CFTypeRef *v156;
  uint64_t v157;
  uint64_t v158;
  _BYTE buf[24];
  const char *v160;
  CFTypeRef *v161;
  uint64_t v162;
  CFRange v163;
  CFRange v164;

  v9 = a7;
  v152 = a3;
  v151 = a5;
  if (v9)
    v14 = "local";
  else
    v14 = "remote";
  v15 = sub_1002146F0(a4);
  v16 = sub_1002146F0(a4);
  if (v15 != 1 && v16 != 5)
  {
    v17 = sub_10000EF14("ring");
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v14;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "start:[%s] halt processing invalid ring", buf, 0xCu);
    }

    v19 = 0;
    goto LABEL_244;
  }
  v138 = v16;
  v145 = v9;
  v149 = (uint64_t *)a8;
  v20 = -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo");
  PeerInfo = SOSFullPeerInfoGetPeerInfo(v20);
  PeerID = SOSPeerInfoGetPeerID(PeerInfo);
  v146 = (CFTypeRef)SOSFullPeerInfoCopyDeviceKey(v20, 0);
  v148 = (__SecKey *)SOSFullPeerInfoCopyPubKey(v20, 0);
  v23 = 0;
  v139 = v14;
  v140 = PeerInfo;
  if (v20 && PeerInfo && PeerID)
    v23 = -[SOSAccountTrustClassic isInCircleOnly:](self, "isInCircleOnly:", 0);
  v143 = sub_100214310(a4->var2);
  v141 = (CFTypeRef)SOSCircleCopyPeers(-[SOSAccountTrust trustedCircle](self, "trustedCircle"), kCFAllocatorDefault);
  cf = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
  MutableForSOSPeerInfosByID = CFSetCreateMutableForSOSPeerInfosByID(kCFAllocatorDefault);
  Value = (const __CFString *)CFDictionaryGetValue(a4->var1, CFSTR("LastModifier"));
  cf1 = (const __CFString *)PeerID;
  v144 = (CFTypeRef)MutableForSOSPeerInfosByID;
  if (Value)
  {
    v26 = Value;
    if (CFStringGetLength(Value) > 8)
    {
      v163.location = 0;
      v163.length = 8;
      Copy = CFStringCreateWithSubstring(kCFAllocatorDefault, v26, v163);
    }
    else
    {
      Copy = CFStringCreateCopy(kCFAllocatorDefault, v26);
    }
    v28 = Copy;
  }
  else
  {
    v28 = 0;
  }
  v29 = sub_10000EF14("ring");
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = v139;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v28;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "start:[%s] modifier: %@", buf, 0x16u);
  }

  if (v28)
    CFRelease(v28);
  v150 = -[SOSAccountTrustClassic copyRing:err:](self, "copyRing:err:", v143, 0);
  if ((v145 & 1) != 0)
    goto LABEL_36;
  v31 = (const __CFString *)CFDictionaryGetValue(a4->var1, CFSTR("LastModifier"));
  if (cf1 && v31)
  {
    if (!CFEqual(cf1, v31))
      goto LABEL_36;
  }
  else if (cf1 != v31)
  {
    goto LABEL_36;
  }
  if (a4 && v150)
  {
    if (CFEqual(v150, a4))
    {
LABEL_32:
      v32 = sub_10000EF14("ring");
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Ceasing ring handling for an echo of our own posted ring", buf, 2u);
      }

      goto LABEL_56;
    }
  }
  else if (v150 == a4)
  {
    goto LABEL_32;
  }
LABEL_36:
  if (!sub_1001D7408(v152, (uint64_t)v149))
    goto LABEL_270;
  if (!v148)
  {
    SOSCreateError(2, CFSTR("No device public key to work with"), 0, v149);
    goto LABEL_270;
  }
  if (!v146)
  {
    SOSCreateError(1, CFSTR("No device private key to work with"), 0, v149);
    goto LABEL_270;
  }
  if (!a4->var1 || !a4->var2 || !a4->var3 || !a4->var4)
  {
    SOSCreateError(5, CFSTR("You give rings a bad name"), 0, v149);
    goto LABEL_270;
  }
  if (!-[SOSAccountTrustClassic checkForRings:](self, "checkForRings:", v149))
  {
LABEL_270:
    Instance = 0;
    v19 = 0;
    goto LABEL_230;
  }
  if (v15 != 1)
  {
    Instance = 0;
    if (v23)
    {
      v136 = 0;
      goto LABEL_54;
    }
LABEL_57:
    v19 = 1;
    goto LABEL_230;
  }
  v155 = 0;
  v156 = &v155;
  v157 = 0x2020000000;
  v158 = 0;
  v34 = (const __CFSet *)sub_1001E9440(a4);
  v35 = v34;
  if (v34)
  {
    if (CFSetGetCount(v34) == 1)
    {
      *(_QWORD *)buf = _NSConcreteStackBlock;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_1001E949C;
      v160 = (const char *)&unk_1002EC5E8;
      v161 = &v155;
      v162 = 0;
      CFSetApplyFunction(v35, (CFSetApplierFunction)sub_1001E9518, buf);
    }
  }
  else
  {
    SOSCreateError(1045, CFSTR("Wrong set count for one return"), 0, 0);
  }
  v37 = v156[3];
  _Block_object_dispose(&v155, 8);
  if (!v37
    || (v136 = v37, !SOSPeerInfoIsViewPermitted(v140, v37))
    || (v23 & SOSPeerInfoHasBackupKey(v140) & 1) == 0)
  {
LABEL_56:
    Instance = 0;
    goto LABEL_57;
  }
LABEL_54:
  v38 = sub_100213B84();
  Instance = _CFRuntimeCreateInstance(0, v38, 32, 0);
  *(_QWORD *)(Instance + 16) = CFDictionaryCreateMutableCopy(0, 0, a4->var1);
  *(_QWORD *)(Instance + 24) = CFDictionaryCreateMutableCopy(0, 0, a4->var2);
  *(_QWORD *)(Instance + 32) = CFDictionaryCreateMutableCopy(0, 0, a4->var3);
  *(_QWORD *)(Instance + 40) = CFDictionaryCreateMutableCopy(0, 0, a4->var4);
  v39 = v150;
  if (v150)
  {
    v137 = !sub_1002151EC((uint64_t)v150, v148, 0);
  }
  else
  {
    CFRetain((CFTypeRef)Instance);
    v137 = 1;
    v39 = (__OpaqueSOSRing *)Instance;
  }
  sub_1001D6A98(v39);
  sub_1001D6A98((_QWORD *)Instance);
  v150 = v39;
  v40 = sub_1002146F0(v39);
  v41 = sub_1002146F0((_QWORD *)Instance);
  if (v40 > 5)
    goto LABEL_90;
  v42 = v40;
  if ((unint64_t)v40 - 5 > 0xFFFFFFFFFFFFFFFCLL
    || v41 > 5
    || (unint64_t)v41 - 5 > 0xFFFFFFFFFFFFFFFCLL
    || v40 != v41)
  {
    goto LABEL_90;
  }
  v43 = sub_10000EF14("ring");
  v44 = objc_claimAutoreleasedReturnValue(v43);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    v45 = (uint64_t)*off_1002EC370[v42];
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v45;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "concordance trust (%s)", buf, 0xCu);
  }

  v46 = sub_10000EF14("ring");
  v47 = objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v150;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "    knownRing: %@", buf, 0xCu);
  }

  v48 = sub_10000EF14("ring");
  v49 = objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = Instance;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, " proposedRing: %@", buf, 0xCu);
  }

  v50 = (const void *)SOSCopyIDOfKeyWithLength(a6, 8, 0);
  v51 = (const void *)SOSCopyIDOfKeyWithLength(a6, 8, 0);
  if (cf1)
  {
    if (CFStringGetLength(cf1) > 8)
    {
      v164.location = 0;
      v164.length = 8;
      v52 = CFStringCreateWithSubstring(kCFAllocatorDefault, cf1, v164);
    }
    else
    {
      v52 = CFStringCreateCopy(kCFAllocatorDefault, cf1);
    }
    v53 = v52;
  }
  else
  {
    v53 = 0;
  }
  v54 = sub_10000EF14("ring");
  v55 = objc_claimAutoreleasedReturnValue(v54);
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v50;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v51;
    *(_WORD *)&buf[22] = 2112;
    v160 = (const char *)v53;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "knownkey: %@ userkey: %@ myPeerID: %@", buf, 0x20u);
  }

  if (v50)
    CFRelease(v50);
  if (v51)
    CFRelease(v51);
  if (v53)
    CFRelease(v53);
  v56 = off_1002EC370[v42][10];
  if (v56)
  {
    v57 = CFSTR("Trusted");
    v58 = 1;
    switch(((unsigned int (*)(__OpaqueSOSFullPeerInfo *, CFTypeRef, __OpaqueSOSRing *, uint64_t, __SecKey *, __SecKey *, const __CFString *, uint64_t *))v56)(v20, v141, v150, Instance, a6, a6, cf1, v149))
    {
      case 0u:
        break;
      case 1u:
        if (v137)
          v58 = 5;
        else
          v58 = 3;
        v57 = CFSTR("Generation Old");
        break;
      case 2u:
        if (v137)
          v58 = 0;
        else
          v58 = 3;
        v57 = CFSTR("No User Signature");
        break;
      case 3u:
        v132 = sub_10000EF14("SecError");
        v133 = objc_claimAutoreleasedReturnValue(v132);
        if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_DEFAULT, "##### No User Public Key Available, this shouldn't ever happen!!!", buf, 2u);
        }

        v57 = CFSTR("No User Public Key Available");
        goto LABEL_93;
      case 4u:
        v57 = CFSTR("No trusted peer left");
        goto LABEL_266;
      case 5u:
      case 6u:
        if (v137)
          v58 = 0;
        else
          v58 = 3;
        v57 = CFSTR("Bad Signature");
        break;
      case 7u:
        v134 = sub_10000EF14("signing");
        v135 = objc_claimAutoreleasedReturnValue(v134);
        if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_DEFAULT, "##### No trusted peer signature found, accepting hoping for concordance later", buf, 2u);
        }

        v58 = 0;
        v57 = CFSTR("No trusted peer signature");
        break;
      case 9u:
        if (v137)
          v58 = 5;
        else
          v58 = 3;
        v57 = CFSTR("Invalid Ring Membership");
        break;
      case 0xAu:
        v57 = CFSTR("Incorrect membership for me");
        v58 = 4;
        break;
      case 0xBu:
        v57 = CFSTR("This peer shouldn't be in this ring since it isn't in view");
LABEL_266:
        v58 = 2;
        break;
      default:
        goto LABEL_90;
    }
  }
  else
  {
LABEL_90:
    v59 = sub_10000EF14("SecError");
    v60 = objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "##### Bad Error Return from ConcordanceTrust", buf, 2u);
    }

    v57 = CFSTR("Bad Error Return from ConcordanceTrust");
LABEL_93:
    v58 = 5;
  }
  v61 = sub_10000EF14("ring");
  v62 = objc_claimAutoreleasedReturnValue(v61);
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    v63 = off_1002EBF90[v58];
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = v63;
    if (v137)
      v64 = "untrusted";
    else
      v64 = "trusted";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v57;
    *(_WORD *)&buf[22] = 2080;
    v160 = v64;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Decided on action [%s] based on concordance state [%@] and [%s] ring.", buf, 0x20u);
  }

  if (v58 == 5)
    goto LABEL_57;
  if (v58 == 2)
  {
    v75 = 0;
LABEL_135:
    v82 = v145;
    goto LABEL_161;
  }
  v65 = sub_1002149E4(Instance);
  if (!CFSetGetCount(v65))
  {
    v67 = sub_10000EF14("ring");
    v68 = objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "changing state to accept - we have a reset ring", buf, 2u);
    }

    v58 = 0;
    if (!v65)
      goto LABEL_112;
LABEL_111:
    CFRelease(v65);
    goto LABEL_112;
  }
  v66 = -[SOSAccountTrust trustedCircle](self, "trustedCircle");
  if (v15 == 1)
  {
    v154[0] = _NSConcreteStackBlock;
    v154[1] = 3221225472;
    v154[2] = sub_1001E2768;
    v154[3] = &unk_1002ECBC8;
    v154[4] = cf;
    v154[5] = v144;
    SOSCircleForEachBackupCapablePeerForView(v66, a6, v136, v154);
  }
  else
  {
    v153[0] = _NSConcreteStackBlock;
    v153[1] = 3221225472;
    v153[2] = sub_1001E27B0;
    v153[3] = &unk_1002ECBC8;
    v153[4] = cf;
    v153[5] = v144;
    SOSCircleForEachValidSyncingPeer(v66, a6, v153);
  }
  if (CFEqual(cf, v65))
  {
    if (!v65)
      goto LABEL_112;
    goto LABEL_111;
  }
  v83 = sub_10000EF14("ring");
  v84 = objc_claimAutoreleasedReturnValue(v83);
  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "mismatch between filteredPeerIDs and ringPeerIDSet, fixing ring and gensigning", buf, 2u);
  }

  v85 = sub_10000EF14("ring");
  v86 = objc_claimAutoreleasedReturnValue(v85);
  if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = cf;
    _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "filteredPeerIDs %@", buf, 0xCu);
  }

  v87 = sub_10000EF14("ring");
  v88 = objc_claimAutoreleasedReturnValue(v87);
  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v65;
    _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "  ringPeerIDSet %@", buf, 0xCu);
  }

  sub_100214928(Instance, cf);
  CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(Instance + 32));
  v58 = 1;
  if (v65)
    goto LABEL_111;
LABEL_112:
  if (v58 != 1)
  {
    v75 = 0;
    goto LABEL_159;
  }
  v69 = CFSetGetCount(cf) > 0 && v15 == 1;
  if (!v69 || !SOSPeerInfoHasBackupKey(v140))
  {
    v75 = 0;
    goto LABEL_128;
  }
  v70 = sub_1001E97E4(kCFAllocatorDefault, v152, 0);
  v71 = (const void *)sub_1001E9620((_QWORD *)Instance);
  if (!v71)
  {
    v72 = sub_10000EF14("ring");
    v73 = objc_claimAutoreleasedReturnValue(v72);
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "Backup ring contains no BSKB", buf, 2u);
    }

  }
  if ((SOSBSKBAllPeersBackupKeysAreInKeyBag(v71, v144) & 1) == 0)
  {
    v111 = sub_10000EF14("ring");
    v112 = objc_claimAutoreleasedReturnValue(v111);
    if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "BSKB is missing some backup keys", buf, 2u);
    }

    if ((SOSBSKBHasThisRecoveryKey(v71, v70) & 1) != 0)
      goto LABEL_196;
    goto LABEL_193;
  }
  if ((SOSBSKBHasThisRecoveryKey(v71, v70) & 1) == 0)
  {
LABEL_193:
    v113 = sub_10000EF14("ring");
    v114 = objc_claimAutoreleasedReturnValue(v113);
    if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "BSKB is missing recovery key", buf, 2u);
    }

    goto LABEL_196;
  }
  if (v71)
  {
    v74 = 0;
    v75 = 0;
    goto LABEL_211;
  }
LABEL_196:
  v155 = 0;
  v115 = sub_1001E9440((_QWORD *)Instance);
  v116 = sub_10000EF14("ring");
  v117 = objc_claimAutoreleasedReturnValue(v116);
  if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "Need to fix BSKB - this will prompt a gensign", buf, 2u);
  }

  if (v70)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionaryAddValue(Mutable, bskbRkbgPrefix, v70);
    v119 = (const void *)SOSBackupSliceKeyBagCreateWithAdditionalKeys(kCFAllocatorDefault, v144, Mutable, v149);
    if (Mutable)
      CFRelease(Mutable);
  }
  else
  {
    v119 = (const void *)SOSBackupSliceKeyBagCreate(kCFAllocatorDefault, v144, v149);
  }
  v120 = sub_1001E952C((_QWORD *)Instance, (uint64_t)v20, v115, (uint64_t)v119, (uint64_t)&v155);
  if ((v120 & 1) == 0)
  {
    v121 = sub_10000EF14("ring");
    v122 = objc_claimAutoreleasedReturnValue(v121);
    if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v155;
      _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_DEFAULT, "Couldn't fix BSKB (%@)", buf, 0xCu);
    }

  }
  CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(Instance + 32));
  sub_1001E9258((_QWORD *)Instance, (uint64_t)v20, (uint64_t)v149);
  v123 = v155;
  if (v155)
  {
    v155 = 0;
    CFRelease(v123);
  }
  if (v119)
    CFRelease(v119);
  v74 = v120 ^ 1;
  v75 = (const __CFDictionary **)Instance;
LABEL_211:
  if (v70)
    CFRelease(v70);
  if (v71)
    CFRelease(v71);
  if ((v74 & 1) != 0)
    goto LABEL_216;
LABEL_128:
  v76 = SOSFullPeerInfoGetPeerInfo(v20);
  v77 = (void *)SOSPeerInfoCopyPubKey(v76, 0);
  if (v77)
  {
    sub_1001D6A98((_QWORD *)Instance);
    v78 = sub_1002146F0((_QWORD *)Instance);
    if (v78 > 5 || (unint64_t)v78 - 5 >= 0xFFFFFFFFFFFFFFFDLL)
    {
      SOSCreateError(1040, CFSTR("Not valid ring type"), 0, 0);
      CFRelease(v77);
    }
    else
    {
      v79 = sub_1002151EC(Instance, (__SecKey *)v77, 0);
      CFRelease(v77);
      if (v79)
      {
        v80 = sub_10000EF14("ring");
        v81 = objc_claimAutoreleasedReturnValue(v80);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "Already concur with newRing", buf, 2u);
        }

        goto LABEL_135;
      }
    }
  }
  v155 = 0;
  if (!v20)
    goto LABEL_154;
  sub_1001D6A98((_QWORD *)Instance);
  v89 = sub_1002146F0((_QWORD *)Instance);
  if (v89 > 5 || (unint64_t)v89 - 5 >= 0xFFFFFFFFFFFFFFFDLL)
  {
    SOSCreateError(1040, CFSTR("Not valid ring type"), 0, &v155);
LABEL_154:
    v93 = sub_10000EF14("ring");
    v92 = objc_claimAutoreleasedReturnValue(v93);
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v155;
      _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "Failed to concordance sign, error: %@", buf, 0xCu);
    }
    v58 = 5;
    goto LABEL_157;
  }
  v90 = off_1002EC370[v89][9];
  if (v90 && !((unsigned int (*)(uint64_t, __OpaqueSOSFullPeerInfo *, CFTypeRef *))v90)(Instance, v20, &v155))
    goto LABEL_154;
  v91 = sub_10000EF14("ring");
  v92 = objc_claimAutoreleasedReturnValue(v91);
  if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "concordance signed", buf, 2u);
  }
  v58 = 0;
  v75 = (const __CFDictionary **)Instance;
LABEL_157:

  if (v155)
    CFRelease(v155);
LABEL_159:
  v82 = v145;
  if (v58 == 3)
  {
    v101 = sub_10021496C((uint64_t)v150, cf1);
    v102 = sub_10000EF14("ring");
    v103 = objc_claimAutoreleasedReturnValue(v102);
    v104 = os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT);
    if (v101)
    {
      if (v104)
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = Instance;
        _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "Rejecting: %@", buf, 0xCu);
      }

      v105 = sub_10000EF14("ring");
      v106 = objc_claimAutoreleasedReturnValue(v105);
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v150;
        _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "   RePush: %@", buf, 0xCu);
      }

      v107 = (const __CFDictionary **)v150;
      goto LABEL_218;
    }
    if (v104)
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = Instance;
      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "Rejecting: %@", buf, 0xCu);
    }

    v108 = sub_10000EF14("ring");
    v109 = objc_claimAutoreleasedReturnValue(v108);
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "Have no old ring - would reset", buf, 2u);
    }

    goto LABEL_216;
  }
  if (v58)
  {
LABEL_216:
    v19 = 0;
    goto LABEL_217;
  }
LABEL_161:
  if (v138 == 5 && (v82 & 1) == 0)
  {
    v94 = sub_100215024(Instance);
    v95 = sub_10000EF14("ring");
    v96 = objc_claimAutoreleasedReturnValue(v95);
    v97 = os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT);
    if (v94)
    {
      if (v97)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "Reset ring for recovery from remote peer", buf, 2u);
      }

      v99 = (const __CFData *)SOSRKNullKey(v98);
      v100 = (const void *)sub_1001F5778(kCFAllocatorDefault, v152, v99, v149);
      sub_1001E9684(v152, (uint64_t)v100, (CFTypeRef *)v149);
      goto LABEL_183;
    }
    if (v97)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "normal ring recovery key harvest", buf, 2u);
    }

    sub_1001D6A98((_QWORD *)Instance);
    if (sub_1001D6C1C((_QWORD *)Instance, 0))
    {
      v110 = (const __CFData *)sub_1001E93A8((_QWORD *)Instance, 0);
      if (v110)
      {
        v100 = (const void *)sub_1001F5B30(kCFAllocatorDefault, v110, 0);
        sub_1001E9684(v152, (uint64_t)v100, (CFTypeRef *)v149);
LABEL_183:
        if (v100)
          CFRelease(v100);
        goto LABEL_185;
      }
    }
    sub_1001E9684(v152, 0, (CFTypeRef *)v149);
  }
LABEL_185:
  if (v140 && sub_10021480C(Instance, cf1))
    sub_100214858(Instance, cf1);
  -[SOSAccountTrustClassic setRing:ringName:err:](self, "setRing:ringName:err:", Instance, v143, v149);
  objc_msgSend(v152, "setCircle_rings_retirements_need_attention:", 1);
  v107 = (const __CFDictionary **)Instance;
  if ((v145 & 1) != 0)
    goto LABEL_218;
  v19 = (v75 == 0) & ~v145;
LABEL_217:
  v107 = v75;
  if (v75)
  {
LABEL_218:
    v124 = &unk_100341590;
    if (v15 == 1)
      v124 = &unk_100341594;
    ++*v124;
    v125 = sub_10000EF14("ring");
    v126 = objc_claimAutoreleasedReturnValue(v125);
    if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = v139;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v107;
      _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_DEFAULT, "Pushing:[%s] %@", buf, 0x16u);
    }

    v127 = (const void *)sub_1001E6424(v107, (CFTypeRef *)v149);
    if (v127)
      v128 = objc_msgSend(v151, "kvsRingPostRing:ring:err:", sub_100214310(v107[3]), v127, v149);
    else
      v128 = 0;
    v129 = sub_10000EF14("ring");
    v130 = objc_claimAutoreleasedReturnValue(v129);
    if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_DEFAULT, "Setting account.key_interests_need_updating to true in handleUpdateRing", buf, 2u);
    }

    objc_msgSend(v152, "setKey_interests_need_updating:", 1);
    if (v127)
      CFRelease(v127);
    v19 = v128 != 0;
  }
LABEL_230:
  if (cf)
    CFRelease(cf);
  if (v144)
    CFRelease(v144);
  if (v150)
    CFRelease(v150);
  if (Instance)
    CFRelease((CFTypeRef)Instance);
  if (v141)
    CFRelease(v141);
  if (v148)
    CFRelease(v148);
  if (v146)
    CFRelease(v146);
LABEL_244:

  return v19;
}

- (__OpaqueSOSRing)copyRing:(__CFString *)a3 err:(__CFError *)a4
{
  __CFDictionary *v6;
  const __CFData *Value;

  v6 = -[SOSAccountTrustClassic getRings:](self, "getRings:", a4);
  if (v6)
  {
    Value = (const __CFData *)CFDictionaryGetValue(v6, a3);
    if (Value)
      return (__OpaqueSOSRing *)sub_1001E66E4(0, Value);
    SOSCreateErrorWithFormat(1043, 0, a4, 0, CFSTR("No Ring found %@"));
  }
  else
  {
    SOSCreateError(1043, CFSTR("No Rings found"), 0, a4);
  }
  return 0;
}

- (__CFDictionary)getRings:(__CFError *)a3
{
  void *v5;
  __CFDictionary *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));
  v6 = (__CFDictionary *)objc_msgSend(v5, "objectForKey:", CFSTR("trusted_rings"));

  if (v6)
    return v6;
  -[SOSAccountTrustClassic addRingDictionary](self, "addRingDictionary");
  return -[SOSAccountTrustClassic getRings:](self, "getRings:", a3);
}

- (BOOL)resetRing:(id)a3 ringName:(__CFString *)a4 err:(__CFError *)a5
{
  id v8;
  __OpaqueSOSRing *v9;
  unsigned int v10;
  uint64_t v11;
  const void *Value;
  const void *v13;
  const void *v14;
  __OpaqueSOSFullPeerInfo *v15;
  const void *v16;
  id v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;

  v8 = a3;
  v9 = -[SOSAccountTrustClassic copyRing:err:](self, "copyRing:err:", a4, a5);
  v10 = sub_1002146F0(v9);
  v11 = sub_1001E91F8((uint64_t)a4, 0, v10, (uint64_t)a5);
  if (v11)
  {
    Value = CFDictionaryGetValue(v9->var2, CFSTR("Generation"));
    v13 = (const void *)SOSGenerationCreateWithBaseline(Value);
    if (v13)
    {
      v14 = v13;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v11 + 24), CFSTR("Generation"), v13);
      CFRelease(v14);
    }
  }
  v15 = -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo");
  v16 = sub_100214890((uint64_t)v9);
  sub_1001D4834(v11, (uint64_t)v15, v16, (CFTypeRef *)a5);
  if (v11)
  {
    if (v9)
      CFRelease(v9);
    v17 = v8;
    if (sub_1001D7408(v17, (uint64_t)a5))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trust"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "circle_transport"));
      v20 = objc_msgSend(v18, "handleUpdateRing:prospectiveRing:transport:userPublicKey:writeUpdate:err:", v17, v11, v19, objc_msgSend(v17, "accountKey"), 1, a5);

    }
    else
    {
      v20 = 0;
    }

    v9 = (__OpaqueSOSRing *)v11;
  }
  else
  {
    v20 = 0;
    if (!v9)
      goto LABEL_11;
  }
  CFRelease(v9);
  LOBYTE(v11) = v20;
LABEL_11:

  return v11;
}

- (SOSAccountTrustClassic)init
{
  SOSAccountTrustClassic *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SOSAccountTrustClassic;
  v2 = -[SOSAccountTrust init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[SOSAccountTrust setRetirees:](v2, "setRetirees:", v3);

    -[SOSAccountTrust setFullPeerInfo:](v2, "setFullPeerInfo:", 0);
    -[SOSAccountTrust setTrustedCircle:](v2, "setTrustedCircle:", 0);
    -[SOSAccountTrust setDepartureCode:](v2, "setDepartureCode:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[SOSAccountTrust setExpansion:](v2, "setExpansion:", v4);

    -[SOSAccountTrustClassic addRingDictionary](v2, "addRingDictionary");
  }
  return v2;
}

- (SOSAccountTrustClassic)initWithRetirees:(id)a3 fpi:(__OpaqueSOSFullPeerInfo *)a4 circle:(__OpaqueSOSCircle *)a5 departureCode:(int)a6 peerExpansion:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  SOSAccountTrustClassic *v14;
  id v15;
  id v16;
  objc_super v18;

  v8 = *(_QWORD *)&a6;
  v12 = a3;
  v13 = a7;
  v18.receiver = self;
  v18.super_class = (Class)SOSAccountTrustClassic;
  v14 = -[SOSAccountTrust init](&v18, "init");
  if (v14)
  {
    v15 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithSet:", v12);
    -[SOSAccountTrust setRetirees:](v14, "setRetirees:", v15);

    if (a4)
      CFRetain(a4);
    -[SOSAccountTrust setFullPeerInfo:](v14, "setFullPeerInfo:", a4);
    if (a5)
      CFRetain(a5);
    -[SOSAccountTrust setTrustedCircle:](v14, "setTrustedCircle:", a5);
    -[SOSAccountTrust setDepartureCode:](v14, "setDepartureCode:", v8);
    v16 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v13);
    -[SOSAccountTrust setExpansion:](v14, "setExpansion:", v16);

    -[SOSAccountTrustClassic addRingDictionary](v14, "addRingDictionary");
  }

  return v14;
}

- (BOOL)updateGestalt:(id)a3 newGestalt:(__CFDictionary *)a4
{
  id v6;
  __CFDictionary *v7;
  __CFDictionary *v8;
  int v9;
  BOOL v10;
  void *v11;
  id v12;
  _QWORD v14[5];

  v6 = a3;
  v7 = (__CFDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "gestalt"));
  v8 = v7;
  if (a4 && v7)
  {
    v9 = CFEqual(a4, v7);

    if (v9)
    {
LABEL_4:
      v10 = 0;
      goto LABEL_11;
    }
  }
  else
  {

    if (v8 == a4)
      goto LABEL_4;
  }
  if (-[SOSAccountTrust trustedCircle](self, "trustedCircle")
    && -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo")
    && SOSFullPeerInfoUpdateGestalt(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), a4, 0))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "circle_transport"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001E6380;
    v14[3] = &unk_1002EDB08;
    v14[4] = self;
    -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v11, 0, v14);

  }
  v12 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:", a4);
  objc_msgSend(v6, "setGestalt:", v12);

  v10 = 1;
LABEL_11:

  return v10;
}

- (int)updateView:(id)a3 name:(__CFString *)a4 code:(int)a5 err:(__CFError *)a6
{
  id v10;
  _BOOL4 v11;
  const void *v12;
  void *v13;
  int updated;
  void *v15;
  char IsV0Subview;
  __CFSet *Mutable;
  BOOL v18;
  int v19;
  void *v20;
  id v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  _QWORD v27[5];

  v10 = a3;
  v11 = sub_1001DF090(v10, 2);
  v12 = (const void *)SOSViewCopyViewSet(3);
  if (!-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
  {
    v25 = CFSTR("No Trusted Circle");
    v26 = 1037;
LABEL_47:
    SOSCreateError(v26, v25, 0, a6);
    goto LABEL_48;
  }
  if (!-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"))
  {
    v25 = CFSTR("No Peer for Account");
    v26 = 1032;
    goto LABEL_47;
  }
  if ((a5 - 3) < 0xFFFFFFFE
    || (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trust")),
        updated = objc_msgSend(v13, "viewStatus:name:err:", v10, a4, a6),
        v13,
        (updated - 3) < 0xFFFFFFFE))
  {
LABEL_48:
    updated = 0;
    if (!v12)
      goto LABEL_42;
    goto LABEL_41;
  }
  if (a4 && kSOSViewKeychainV0)
  {
    if (CFEqual(a4, kSOSViewKeychainV0))
      goto LABEL_8;
  }
  else if ((__CFString *)kSOSViewKeychainV0 == a4)
  {
LABEL_8:
    if (sub_1001DD65C(v10))
      updated = a5 == 2;
    else
      updated = 2 * (a5 == 1);
    if (!v12)
      goto LABEL_42;
LABEL_41:
    CFRelease(v12);
    goto LABEL_42;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trust"));
  if (objc_msgSend(v15, "isSyncingV0"))
  {
    IsV0Subview = SOSViewsIsV0Subview(a4);

    if ((IsV0Subview & 1) != 0)
    {
      updated = 1;
      if (!v12)
        goto LABEL_42;
      goto LABEL_41;
    }
  }
  else
  {

  }
  Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
  CFSetAddValue(Mutable, a4);
  if (a5 == 1 && updated == 2)
  {
    if (v11)
    {
      updated = SOSFullPeerInfoUpdateViews(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), 1, a4, a6);
      v18 = updated == 1;
      goto LABEL_29;
    }
    -[SOSAccountTrustClassic pendEnableViewSet:](self, "pendEnableViewSet:", Mutable);
    goto LABEL_35;
  }
  v19 = 0;
  if (a5 != 2 || updated != 1)
  {
LABEL_36:
    if (!Mutable)
      goto LABEL_38;
    goto LABEL_37;
  }
  if (v12 && CFSetContainsValue((CFSetRef)v12, a4))
  {
LABEL_35:
    v19 = 0;
    updated = 1;
    goto LABEL_36;
  }
  if (!v11)
  {
    v22 = v10;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trust"));
    objc_msgSend(v23, "valueUnionWith:valuesToUnion:", CFSTR("pendingDisableViews"), Mutable);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trust"));
    objc_msgSend(v24, "valueSubtractFrom:valuesToSubtract:", CFSTR("pendingEnableViews"), Mutable);

    v19 = 0;
    updated = 2;
    if (!Mutable)
      goto LABEL_38;
LABEL_37:
    CFRelease(Mutable);
    goto LABEL_38;
  }
  updated = SOSFullPeerInfoUpdateViews(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), 2, a4, a6);
  v18 = updated == 2;
LABEL_29:
  v19 = v18;
  if (Mutable)
    goto LABEL_37;
LABEL_38:
  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "circle_transport"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1001E62F0;
    v27[3] = &unk_1002EDB08;
    v27[4] = self;
    -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v20, 0, v27);

  }
  if (v12)
    goto LABEL_41;
LABEL_42:

  return updated;
}

- (BOOL)activeValidInCircle:(id)a3 err:(__CFError *)a4
{
  id v6;
  __OpaqueSOSCircle *v7;
  uint64_t PeerInfo;
  id v9;

  v6 = a3;
  v7 = -[SOSAccountTrust trustedCircle](self, "trustedCircle");
  PeerInfo = SOSFullPeerInfoGetPeerInfo(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"));
  v9 = sub_1001D7408(v6, (uint64_t)a4);

  return SOSCircleHasActiveValidPeer(v7, PeerInfo, v9, a4);
}

- (int)viewStatus:(id)a3 name:(__CFString *)a4 err:(__CFError *)a5
{
  id v8;
  int v9;
  void *v10;
  unsigned int v11;
  const __CFString *v13;
  uint64_t v14;

  v8 = a3;
  if (!sub_1001D7408(v8, (uint64_t)a5))
  {
    v13 = CFSTR("No Trusted UserKey");
    v14 = 1033;
LABEL_24:
    SOSCreateError(v14, v13, 0, a5);
    v9 = 0;
    goto LABEL_19;
  }
  if (!-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
  {
    v13 = CFSTR("No Trusted Circle");
    v14 = 1037;
    goto LABEL_24;
  }
  if (!-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"))
  {
    v13 = CFSTR("No Peer for Account");
    v14 = 1032;
    goto LABEL_24;
  }
  if (!-[SOSAccountTrustClassic activeValidInCircle:err:](self, "activeValidInCircle:err:", v8, a5))
  {
    v13 = CFSTR("Not in Circle");
    v14 = 1046;
    goto LABEL_24;
  }
  if (!-[SOSAccountTrustClassic valueSetContainsValue:value:](self, "valueSetContainsValue:value:", CFSTR("pendingEnableViews"), a4))
  {
    if (-[SOSAccountTrustClassic valueSetContainsValue:value:](self, "valueSetContainsValue:value:", CFSTR("pendingDisableViews"), a4))
    {
      v9 = 2;
LABEL_9:
      if (a4 && kSOSViewKeychainV0)
      {
        if (!CFEqual(a4, kSOSViewKeychainV0))
        {
LABEL_14:
          if (!SOSViewsIsV0Subview(a4))
            goto LABEL_19;
        }
      }
      else if ((__CFString *)kSOSViewKeychainV0 != a4)
      {
        goto LABEL_14;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trust"));
      v11 = objc_msgSend(v10, "isSyncingV0");

      if (!v11)
        goto LABEL_19;
      goto LABEL_16;
    }
    v9 = SOSFullPeerInfoViewStatus(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), a4, a5);
    if (v9 != 1)
      goto LABEL_9;
  }
LABEL_16:
  if (SOSCircleHasApplicant(-[SOSAccountTrust trustedCircle](self, "trustedCircle"), -[SOSAccountTrust peerInfo](self, "peerInfo"), a5))v9 = 5;
  else
    v9 = 1;
LABEL_19:

  return v9;
}

- (BOOL)matchOTUserViewSettings:(id)a3 userViewsEnabled:(BOOL)a4 err:(__CFError *)a5
{
  _BOOL4 v6;
  id v8;
  const __CFSet *UserVisibleSet;
  const void *v10;
  NSObject *v11;
  const __CFSet *v12;
  const void *v13;
  BOOL v14;
  uint8_t v16[16];
  _QWORD context[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  __CFError **v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v6 = a4;
  v8 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  UserVisibleSet = (const __CFSet *)SOSViewsGetUserVisibleSet();
  if (objc_msgSend(v8, "isInCircle:", a5))
  {
    context[0] = _NSConcreteStackBlock;
    context[1] = 3221225472;
    context[2] = sub_1001E629C;
    context[3] = &unk_1002EC048;
    v18 = v8;
    v19 = &v26;
    v20 = &v22;
    v21 = a5;
    CFSetApplyFunction(UserVisibleSet, (CFSetApplierFunction)sub_1001E5870, context);

  }
  if (!v6)
  {
    if (*((_BYTE *)v23 + 24))
    {
      v13 = sub_10000EF14("circleChange");
      v11 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Disabling User Visible Views to match OT Settings", v16, 2u);
      }
      v12 = 0;
      goto LABEL_12;
    }
LABEL_13:
    v14 = 0;
    goto LABEL_14;
  }
  if (!*((_BYTE *)v27 + 24))
    goto LABEL_13;
  v10 = sub_10000EF14("circleChange");
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Enabling User Visible Views to match OT Settings", v16, 2u);
  }
  v12 = UserVisibleSet;
  UserVisibleSet = 0;
LABEL_12:

  v14 = -[SOSAccountTrustClassic updateViewSets:enabled:disabled:](self, "updateViewSets:enabled:disabled:", v8, v12, UserVisibleSet);
LABEL_14:
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

- (BOOL)updateViewSets:(id)a3 enabled:(__CFSet *)MutableCopy disabled:(__CFSet *)a5
{
  id v8;
  __OpaqueSOSFullPeerInfo *v9;
  __OpaqueSOSFullPeerInfo *v10;
  uint64_t PeerInfo;
  uint64_t Copy;
  const void *v13;
  int IsCurrent;
  const void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  unsigned int v19;
  BOOL v20;
  const void *v22;
  NSObject *v23;
  const char *v24;
  const void *v25;
  const void *v26;
  NSObject *v27;
  const void *v28;
  const void *v29;
  NSObject *v30;
  const char *v31;
  const void *v32;
  const void *v33;
  NSObject *v34;
  CFTypeRef v35;
  _QWORD v36[5];
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v39;

  v8 = a3;
  if (MutableCopy)
    MutableCopy = CFSetCreateMutableCopy(kCFAllocatorDefault, 0, MutableCopy);
  if (a5)
    a5 = CFSetCreateMutableCopy(kCFAllocatorDefault, 0, a5);
  sub_1001E5E78((uint64_t)CFSTR("Enabled"), MutableCopy);
  sub_1001E5E78((uint64_t)CFSTR("Disabled"), a5);
  if (!-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
  {
    v22 = sub_10000EF14("views");
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_42;
    *(_WORD *)buf = 0;
    v24 = "Attempt to set viewsets with no trusted circle";
LABEL_41:
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
    goto LABEL_42;
  }
  v9 = -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo");
  if (!v9)
  {
    v25 = sub_10000EF14("views");
    v23 = objc_claimAutoreleasedReturnValue(v25);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_42;
    *(_WORD *)buf = 0;
    v24 = "Attempt to set viewsets with no fullPeerInfo";
    goto LABEL_41;
  }
  if ((unint64_t)MutableCopy | (unint64_t)a5)
  {
    v10 = v9;
    PeerInfo = SOSFullPeerInfoGetPeerInfo(v9);
    Copy = SOSPeerInfoCreateCopy(kCFAllocatorDefault, PeerInfo, 0);
    if (Copy)
    {
      v13 = (const void *)Copy;
      IsCurrent = SOSPeerInfoVersionIsCurrent(Copy);
      if ((IsCurrent & 1) == 0)
      {
        cf = 0;
        if ((SOSPeerInfoUpdateToV2(v13, &cf) & 1) == 0)
        {
          v33 = sub_10000EF14("views");
          v34 = objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v39 = cf;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Unable to update peer to V2- can't update views: %@", buf, 0xCu);
          }

          v35 = cf;
          if (cf)
          {
            cf = 0;
            CFRelease(v35);
          }
LABEL_49:
          v20 = 0;
          if (!MutableCopy)
            goto LABEL_27;
          goto LABEL_26;
        }
        v15 = sub_10000EF14("V2update");
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Updating PeerInfo to V2 within SOSAccountUpdateViewSets", buf, 2u);
        }

      }
      sub_10002FEC4(MutableCopy, (uint64_t)&stru_1002EC068);
      sub_10002FEC4(a5, (uint64_t)&stru_1002EC088);
      if (sub_1001E5F68(v8, MutableCopy, 1))
      {
        if (sub_1001E5F68(v8, a5, 2))
        {
          v17 = IsCurrent ^ 1;
          if (MutableCopy)
            v17 |= SOSViewSetEnable(v13, MutableCopy);
          if (a5)
          {
            if (((v17 | SOSViewSetDisable(v13, a5)) & 1) == 0)
              goto LABEL_25;
          }
          else if (!v17)
          {
            goto LABEL_25;
          }
          if (SOSFullPeerInfoUpdateToThisPeer(v10, v13, 0))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "circle_transport"));
            v36[0] = _NSConcreteStackBlock;
            v36[1] = 3221225472;
            v36[2] = sub_1001E5FF8;
            v36[3] = &unk_1002EDB08;
            v36[4] = self;
            v19 = -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v18, 0, v36);

            if (v19)
              sub_1001D2D74(v8);
          }
LABEL_25:
          v20 = 1;
          if (!MutableCopy)
          {
LABEL_27:
            if (a5)
              CFRelease(a5);
            if (v13)
              CFRelease(v13);
            goto LABEL_31;
          }
LABEL_26:
          CFRelease(MutableCopy);
          goto LABEL_27;
        }
        v32 = sub_10000EF14("viewChange");
        v30 = objc_claimAutoreleasedReturnValue(v32);
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          goto LABEL_48;
        *(_WORD *)buf = 0;
        v31 = "Bad view change (disable) with kSOSViewKeychainV0";
      }
      else
      {
        v29 = sub_10000EF14("viewChange");
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
LABEL_48:

          goto LABEL_49;
        }
        *(_WORD *)buf = 0;
        v31 = "Bad view change (enable) with kSOSViewKeychainV0";
      }
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v31, buf, 2u);
      goto LABEL_48;
    }
    v28 = sub_10000EF14("views");
    v23 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v24 = "Couldn't copy PeerInfoRef";
      goto LABEL_41;
    }
LABEL_42:

    v13 = 0;
    goto LABEL_49;
  }
  v26 = sub_10000EF14("views");
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "No work to do", buf, 2u);
  }

  v20 = 0;
LABEL_31:

  return v20;
}

- (void)addSyncablePeerBlock:(id)a3 dsName:(__CFString *)a4 change:(id)a5
{
  id v8;
  void *v9;
  _QWORD *v10;
  const void *MutableForSOSPeerInfosByID;
  __CFString *Name;
  _QWORD v13[5];
  id v14;
  __CFString *v15;

  v8 = a5;
  if (!v8)
    goto LABEL_12;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "account"));
  if (a4)
    CFRetain(a4);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001E5B2C;
  v13[3] = &unk_1002EC0B0;
  v15 = a4;
  v13[4] = self;
  v14 = v8;
  v10 = objc_retainBlock(v13);
  sub_1001CE5C0(v9, v10);
  MutableForSOSPeerInfosByID = (const void *)CFSetCreateMutableForSOSPeerInfosByID(kCFAllocatorDefault);
  if (-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
  {
    Name = (__CFString *)SOSCircleGetName(-[SOSAccountTrust trustedCircle](self, "trustedCircle"));
    if (!a4 || !Name)
    {
      if (Name != a4)
        goto LABEL_9;
      goto LABEL_8;
    }
    if (CFEqual(a4, Name))
LABEL_8:
      ((void (*)(_QWORD *, void *, __OpaqueSOSCircle *, const void *, const void *, const void *, const void *))v10[2])(v10, v9, -[SOSAccountTrust trustedCircle](self, "trustedCircle"), MutableForSOSPeerInfosByID, MutableForSOSPeerInfosByID, MutableForSOSPeerInfosByID, MutableForSOSPeerInfosByID);
  }
LABEL_9:
  if (MutableForSOSPeerInfosByID)
    CFRelease(MutableForSOSPeerInfosByID);

LABEL_12:
}

- (__CFSet)copyPeerSetForView:(__CFString *)a3
{
  __CFSet *MutableForSOSPeerInfosByID;
  _QWORD v7[6];

  MutableForSOSPeerInfosByID = (__CFSet *)CFSetCreateMutableForSOSPeerInfosByID(kCFAllocatorDefault);
  if (-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001E5AE4;
    v7[3] = &unk_1002ECBC8;
    v7[4] = a3;
    v7[5] = MutableForSOSPeerInfosByID;
    SOSCircleForEachPeer(-[SOSAccountTrust trustedCircle](self, "trustedCircle"), v7);
  }
  return MutableForSOSPeerInfosByID;
}

- (__SecKey)copyPublicKeyForPeer:(__CFString *)a3 err:(__CFError *)a4
{
  uint64_t v7;
  const void *v8;
  __SecKey *v9;

  if (-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
  {
    v7 = SOSCircleCopyPeerWithID(-[SOSAccountTrust trustedCircle](self, "trustedCircle"), a3, a4);
    if (v7)
    {
      v8 = (const void *)v7;
      v9 = (__SecKey *)SOSPeerInfoCopyPubKey(v7, a4);
      CFRelease(v8);
      return v9;
    }
  }
  else
  {
    SOSErrorCreate(1037, a4, 0, CFSTR("No circle to get peer key from"));
  }
  return 0;
}

- (__OpaqueSOSPeerInfo)copyPeerWithID:(__CFString *)a3 err:(__CFError *)a4
{
  __OpaqueSOSPeerInfo *result;

  result = -[SOSAccountTrust trustedCircle](self, "trustedCircle");
  if (result)
    return (__OpaqueSOSPeerInfo *)SOSCircleCopyPeerWithID(-[SOSAccountTrust trustedCircle](self, "trustedCircle"), a3, a4);
  return result;
}

- (BOOL)isAccountIdentity:(__OpaqueSOSPeerInfo *)a3 err:(__CFError *)a4
{
  __OpaqueSOSPeerInfo *v5;

  v5 = -[SOSAccountTrust peerInfo](self, "peerInfo", a3, a4);
  if (a3 && v5)
    return CFEqual(a3, v5) != 0;
  else
    return v5 == a3;
}

- (__CFSet)copyPeerSetMatching:(id)a3
{
  id v4;
  __CFSet *MutableForSOSPeerInfosByID;
  __OpaqueSOSCircle *v6;
  _QWORD v8[4];
  id v9;
  __CFSet *v10;

  v4 = a3;
  MutableForSOSPeerInfosByID = (__CFSet *)CFSetCreateMutableForSOSPeerInfosByID(kCFAllocatorDefault);
  if (-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
  {
    v6 = -[SOSAccountTrust trustedCircle](self, "trustedCircle");
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001E5AA0;
    v8[3] = &unk_1002ECB38;
    v9 = v4;
    v10 = MutableForSOSPeerInfosByID;
    SOSCircleForEachPeer(v6, v8);

  }
  return MutableForSOSPeerInfosByID;
}

- (__CFArray)copyPeersToListenTo:(__SecKey *)a3 err:(__CFError *)a4
{
  __OpaqueSOSPeerInfo *PeerID;
  _QWORD v9[6];

  PeerID = -[SOSAccountTrust peerInfo](self, "peerInfo");
  if (PeerID)
    PeerID = (__OpaqueSOSPeerInfo *)SOSPeerInfoGetPeerID(PeerID);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001E59AC;
  v9[3] = &unk_1002EC0F0;
  v9[4] = PeerID;
  v9[5] = a3;
  return -[SOSAccountTrustClassic copySortedPeerArray:action:](self, "copySortedPeerArray:action:", a4, v9);
}

- (BOOL)peerSignatureUpdate:(__SecKey *)a3 err:(__CFError *)a4
{
  __OpaqueSOSFullPeerInfo *v7;

  v7 = -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo");
  if (v7)
    LOBYTE(v7) = SOSFullPeerInfoUpgradeSignatures(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), a3, a4);
  return (char)v7;
}

- (BOOL)updatePeerInfo:(id)a3 description:(__CFString *)a4 err:(__CFError *)a5 update:(id)a6
{
  id v10;
  unsigned int (**v11)(id, __OpaqueSOSFullPeerInfo *, __CFError **);
  BOOL v12;
  _QWORD v14[6];

  v10 = a3;
  v11 = (unsigned int (**)(id, __OpaqueSOSFullPeerInfo *, __CFError **))a6;
  if (!-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"))
    goto LABEL_5;
  if (!v11[2](v11, -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), a5))
  {
    v12 = 0;
    goto LABEL_7;
  }
  if (-[SOSAccountTrustClassic hasCircle:](self, "hasCircle:", 0))
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001E58E0;
    v14[3] = &unk_1002ECAE8;
    v14[4] = self;
    v14[5] = a4;
    v12 = -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v10, a5, v14);
  }
  else
  {
LABEL_5:
    v12 = 1;
  }
LABEL_7:

  return v12;
}

- (void)removeInvalidApplications:(__OpaqueSOSCircle *)a3 userPublic:(__SecKey *)a4
{
  const __CFSet *MutableForSOSPeerInfosByID;
  _QWORD context[5];
  _QWORD v8[6];

  MutableForSOSPeerInfosByID = (const __CFSet *)CFSetCreateMutableForSOSPeerInfosByID(kCFAllocatorDefault);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001E588C;
  v8[3] = &unk_1002ECBC8;
  v8[4] = a4;
  v8[5] = MutableForSOSPeerInfosByID;
  SOSCircleForEachApplicant(a3, v8);
  context[0] = _NSConcreteStackBlock;
  context[1] = 3221225472;
  context[2] = sub_1001E58D4;
  context[3] = &unk_1002EDB28;
  context[4] = a3;
  CFSetApplyFunction(MutableForSOSPeerInfosByID, (CFSetApplierFunction)sub_1001E5870, context);
}

- (BOOL)upgradeiCloudIdentity:(__OpaqueSOSCircle *)a3 privKey:(__SecKey *)a4
{
  uint64_t v6;
  const void *v7;
  uint64_t PeerInfo;
  char updated;

  v6 = SOSCircleCopyiCloudFullPeerInfoRef(a3, 0);
  if (!v6)
    return 0;
  v7 = (const void *)v6;
  if (SOSFullPeerInfoUpgradeSignatures(v6, a4, 0))
  {
    PeerInfo = SOSFullPeerInfoGetPeerInfo(v7);
    updated = SOSCircleUpdatePeerInfo(a3, PeerInfo);
  }
  else
  {
    updated = 0;
  }
  CFRelease(v7);
  return updated;
}

- (__CFSet)copyPreApprovedHSA2Info
{
  const __CFSet *v2;

  v2 = -[SOSAccountTrustClassic getValueFromExpansion:err:](self, "getValueFromExpansion:err:", CFSTR("HSAPreApprovedPeer"), 0);
  if (v2)
    return CFSetCreateMutableCopy(0, 0, v2);
  else
    return CFSetCreateMutable(0, 0, &kCFTypeSetCallBacks);
}

- (BOOL)addiCloudIdentity:(__OpaqueSOSCircle *)a3 key:(__SecKey *)a4 err:(__CFError *)a5
{
  SecKeyRef v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  SecKeyRef v17;
  CFDictionaryRef v18;
  CFDictionaryRef v19;
  uint64_t CloudIdentity;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  const void *v28;
  const __CFDictionary *v29;
  uint64_t PeerID;
  CFStringRef v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  const __CFDictionary *v39;
  OSStatus v40;
  const void *v41;
  __OpaqueSOSFullPeerInfo *v42;
  uint64_t PeerInfo;
  char v44;

  v9 = sub_1001D8D48(256, (uint64_t)CFSTR("Cloud Identity"), (uint64_t)kSecAttrAccessibleWhenUnlocked, (uint64_t)kCFBooleanTrue, a5);
  if (!v9)
  {
    sub_100019F20(-108, (__CFString **)a5, CFSTR("Can't generate keypair for icloud identity"));
    return 0;
  }
  v17 = v9;
  v18 = sub_10012E96C(kCFAllocatorDefault, v10, v11, v12, v13, v14, v15, v16, kPIUserDefinedDeviceNameKey, (uint64_t)CFSTR("iCloud"));
  if (!v18)
  {
    sub_100019F20(-108, (__CFString **)a5, CFSTR("Can't allocate gestalt"));
LABEL_18:
    CFRelease(v17);
    return 0;
  }
  v19 = v18;
  CloudIdentity = SOSPeerInfoCreateCloudIdentity(kCFAllocatorDefault, v18, v17, a5);
  if (!CloudIdentity)
  {
    CFRelease(v19);
    goto LABEL_18;
  }
  v28 = (const void *)CloudIdentity;
  v29 = sub_10012E96C(kCFAllocatorDefault, v21, v22, v23, v24, v25, v26, v27, (uint64_t)kSecClass, (uint64_t)kSecClassKey);
  PeerID = SOSPeerInfoGetPeerID(v28);
  v31 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Cloud Identity - '%@'"), PeerID);
  v39 = sub_10012E96C(kCFAllocatorDefault, v32, v33, v34, v35, v36, v37, v38, (uint64_t)kSecAttrLabel, (uint64_t)v31);
  v40 = SecItemUpdate(v29, v39);
  sub_100019F20(v40, (__CFString **)a5, CFSTR("Couldn't update name"));
  if (v31)
    CFRelease(v31);
  if (v29)
    CFRelease(v29);
  if (v39)
    CFRelease(v39);
  CFRelease(v19);
  CFRelease(v17);
  v41 = (const void *)SOSFullPeerInfoCreateCloudIdentity(0, v28, a5);
  CFRelease(v28);
  if (!v41)
    return 0;
  if (SOSCircleRequestAdmission(a3, a4, v41, a5))
  {
    v42 = -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo");
    PeerInfo = SOSFullPeerInfoGetPeerInfo(v41);
    v44 = SOSCircleAcceptRequest(a3, a4, v42, PeerInfo, a5);
  }
  else
  {
    v44 = 0;
  }
  CFRelease(v41);
  return v44;
}

- (BOOL)addEscrowToPeerInfo:(__OpaqueSOSFullPeerInfo *)a3 err:(__CFError *)a4
{
  return SOSFullPeerInfoReplaceEscrowRecords(a3, -[SOSAccountTrustClassic getValueFromExpansion:err:](self, "getValueFromExpansion:err:", CFSTR("EscrowRecord")), a4);
}

- (__CFArray)copySortedPeerArray:(__CFError *)a3 action:(id)a4
{
  void (**v5)(id, __OpaqueSOSCircle *, __CFArray *);
  __CFArray *Mutable;

  v5 = (void (**)(id, __OpaqueSOSCircle *, __CFArray *))a4;
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  v5[2](v5, -[SOSAccountTrust trustedCircle](self, "trustedCircle"), Mutable);

  CFArrayOfSOSPeerInfosSortByID(Mutable);
  return Mutable;
}

- (unint64_t)getDEREncodedSize:(id)a3 err:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFDictionary *v9;
  uint64_t v10;
  __OpaqueSOSFullPeerInfo *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t DEREncodedArraySize;
  const __CFData *v23;
  const __CFData *v24;
  CFIndex Length;
  uint64_t v26;
  const __CFDictionary *v27;
  uint64_t v28;
  unint64_t v29;
  id v31;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t DEREncodedSize;
  uint64_t v37;
  id v38;

  v5 = a3;
  v38 = 0;
  v6 = ccder_sizeof_uint64(8);
  if (!v6)
    goto LABEL_20;
  v8 = v6;
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "gestalt"));
  v10 = sub_10001017C(v9, (uint64_t)&v38);

  v37 = v10;
  if (!v10)
    goto LABEL_20;
  DEREncodedSize = SOSCircleGetDEREncodedSize(-[SOSAccountTrust trustedCircle](self, "trustedCircle"), &v38);
  if (!DEREncodedSize)
    goto LABEL_20;
  v11 = -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo");
  v12 = v11 ? SOSFullPeerInfoGetDEREncodedSize(v11, &v38) : ccder_sizeof(5, 0);
  v35 = v12;
  if (!v12)
    goto LABEL_20;
  v34 = ccder_sizeof_uint64(-[SOSAccountTrust departureCode](self, "departureCode"));
  if (!v34)
    goto LABEL_20;
  objc_msgSend(v5, "accountKeyIsTrusted");
  v13 = ccder_sizeof(1, 1);
  if (!v13)
    goto LABEL_20;
  v14 = v13;
  v15 = sub_1001D5E2C(objc_msgSend(v5, "accountKey"), (uint64_t)&v38);
  if (!v15)
    goto LABEL_20;
  v16 = v15;
  v17 = sub_1001D5E2C(objc_msgSend(v5, "previousAccountKey"), (uint64_t)&v38);
  if (!v17)
    goto LABEL_20;
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountKeyDerivationParameters"));
  v20 = der_sizeof_data_or_null(v19, &v38);

  if (!v20)
    goto LABEL_20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust retirees](self, "retirees"));
  DEREncodedArraySize = SOSPeerInfoSetGetDEREncodedArraySize(v21, &v38);

  if (!DEREncodedArraySize)
    goto LABEL_20;
  v23 = (const __CFData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "backup_key"));
  v24 = v23;
  if (v23)
  {
    Length = CFDataGetLength(v23);
    v26 = ccder_sizeof_raw_octet_string(Length);
  }
  else
  {
    v26 = 0;
  }

  v27 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));
  v28 = sub_10001017C(v27, (uint64_t)&v38);

  if (v28)
  {
    v29 = ccder_sizeof(0x2000000000000010, v37 + v8 + DEREncodedSize + v35 + v34 + v14 + v16 + v18 + v20 + DEREncodedArraySize + v26 + v28);
  }
  else
  {
LABEL_20:
    sub_100032660(-1, CFSTR("com.apple.security.cfder.error"), 0, (CFTypeRef *)&v38, v7, CFSTR("don't know how to encode"), a4, v34, v35, DEREncodedSize, v37);
    v31 = v38;
    if (v33 && v38)
    {
      v29 = 0;
      *v33 = v38;
    }
    else
    {
      if (v38)
      {
        v38 = 0;
        CFRelease(v31);
      }
      v29 = 0;
    }
  }

  return v29;
}

- (char)encodeToDER:(id)a3 err:(id *)a4 start:(const char *)a5 end:(char *)a6
{
  id v9;
  unsigned __int8 v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  const __CFData *v15;
  const __CFDictionary *v16;
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
  char *v27;
  id v28;
  __OpaqueSOSCircle *v30;
  const __CFDictionary *v31;
  uint64_t v33;
  __OpaqueSOSFullPeerInfo *v34;
  id v35;
  unsigned __int8 v36;

  v35 = 0;
  v9 = a3;
  v31 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "gestalt"));
  v30 = -[SOSAccountTrust trustedCircle](self, "trustedCircle");
  v34 = -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo");
  v33 = -[SOSAccountTrust departureCode](self, "departureCode");
  v10 = objc_msgSend(v9, "accountKeyIsTrusted");
  v11 = objc_msgSend(v9, "accountKey");
  v12 = objc_msgSend(v9, "previousAccountKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountKeyDerivationParameters"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust retirees](self, "retirees"));
  v15 = (const __CFData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "backup_key"));

  v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));
  v17 = sub_1000101DC(v16, (CFTypeRef *)&v35, 0, (uint64_t)a5, (uint64_t)a6);
  if (v15)
    v17 = sub_1000206B0(v15, (CFTypeRef *)&v35, (uint64_t)a5, v17);
  v18 = SOSPeerInfoSetEncodeToArrayDER(v14, &v35, a5, v17);
  v19 = der_encode_data_or_null(v13, &v35, a5, v18);
  v20 = sub_1001D5E84(v12, (uint64_t)&v35, (uint64_t)a5, v19);
  v21 = sub_1001D5E84(v11, (uint64_t)&v35, (uint64_t)a5, v20);
  v36 = v10;
  v22 = ccder_encode_body(1, &v36, a5, v21);
  ccder_encode_tl(1, 1, a5, v22);
  v23 = ccder_encode_uint64(v33);
  if (v34)
    v24 = SOSFullPeerInfoEncodeToDER(v34, &v35, a5, v23);
  else
    v24 = ccder_encode_tl(5, 0, a5, v23);
  v25 = SOSCircleEncodeToDER(v30, &v35, a5, v24);
  sub_1000101DC(v31, (CFTypeRef *)&v35, 0, (uint64_t)a5, v25);
  v26 = ccder_encode_uint64(8);
  v27 = (char *)ccder_encode_constructed_tl(0x2000000000000010, a6, a5, v26);

  v28 = v35;
  if (a4 && v35)
  {
    *a4 = v35;
  }
  else if (v35)
  {
    v35 = 0;
    CFRelease(v28);
  }
  return v27;
}

- (__CFSet)syncWithPeers:(id)a3 peerIDs:(__CFSet *)a4 err:(__CFError *)a5
{
  id v8;
  void *v9;
  __CFSet *Mutable;
  const __CFSet *v11;
  id v12;
  const void *PeerID;
  __CFSet *MutableCopy;
  const __CFSet *v15;
  _QWORD context[5];
  id v18;
  const __CFSet *v19;
  __CFSet *v20;
  _QWORD v21[5];

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "account"));
  if ((objc_msgSend(v9, "isInCircle:", a5) & 1) != 0)
  {
    Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
    v11 = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
    v12 = objc_msgSend(v9, "peerInfo");
    if (v12)
    {
      PeerID = (const void *)SOSPeerInfoGetPeerID(v12);
      MutableCopy = CFSetCreateMutableCopy(kCFAllocatorDefault, 0, a4);
      CFSetRemoveValue(MutableCopy, PeerID);
      context[0] = _NSConcreteStackBlock;
      context[1] = 3221225472;
      context[2] = sub_1001E5690;
      context[3] = &unk_1002EC118;
      context[4] = self;
      v18 = v9;
      v19 = v11;
      v20 = Mutable;
      CFSetApplyFunction(MutableCopy, (CFSetApplierFunction)sub_1001E5870, context);
      v15 = sub_1001D52BC(v8, v11);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1001E5884;
      v21[3] = &unk_1002EDB28;
      v21[4] = Mutable;
      CFSetApplyFunction(v15, (CFSetApplierFunction)sub_1001E5870, v21);
      if (v15)
        CFRelease(v15);
      sub_1001D4FD4(v8);
      if (MutableCopy)
        CFRelease(MutableCopy);
      if (v11)
        CFRelease(v11);

    }
    else if (v11)
    {
      CFRelease(v11);
    }
  }
  else
  {
    Mutable = CFSetCreateMutableCopy(kCFAllocatorDefault, 0, a4);
  }

  return Mutable;
}

- (BOOL)requestSyncWithAllPeers:(id)a3 key:(__SecKey *)a4 err:(__CFError *)a5
{
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  __OpaqueSOSCircle *v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "account"));
  v10 = objc_msgSend(v9, "isInCircle:", a5);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v12 = -[SOSAccountTrust trustedCircle](self, "trustedCircle");
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001E5664;
    v15[3] = &unk_1002EC140;
    v16 = v11;
    v13 = v11;
    SOSCircleForEachValidSyncingPeer(v12, a4, v15);
    objc_msgSend(v8, "requestSyncWithPeers:", v13);

  }
  return v10;
}

- (BOOL)isSyncingV0
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001E561C;
  v4[3] = &unk_1002EC168;
  v4[4] = &v5;
  -[SOSAccountTrustClassic forEachCirclePeerExceptMe:](self, "forEachCirclePeerExceptMe:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (__OpaqueSOSEngine)getDataSourceEngine:(SOSDataSourceFactory *)a3
{
  uint64_t Name;
  uint64_t v6;
  const void *v7;
  NSObject *v8;
  uint8_t v10[16];

  if (!-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
  {
    v7 = sub_10000EF14("engine");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Tried to set dataSourceEngine with no circle", v10, 2u);
    }

    return 0;
  }
  Name = SOSCircleGetName(-[SOSAccountTrust trustedCircle](self, "trustedCircle"));
  if (a3)
  {
    v6 = ((uint64_t (*)(SOSDataSourceFactory *, uint64_t, _QWORD))a3->var1)(a3, Name, 0);
    if (v6)
    {
      a3 = *(SOSDataSourceFactory **)v6;
      (*(void (**)(uint64_t, _QWORD))(v6 + 72))(v6, 0);
      return (__OpaqueSOSEngine *)a3;
    }
    return 0;
  }
  return (__OpaqueSOSEngine *)a3;
}

- (BOOL)postDebugScope:(id)a3 scope:(void *)a4 err:(__CFError *)a5
{
  if (a3)
    return objc_msgSend(a3, "kvssendDebugInfo:debug:err:", CFSTR("Scope"), a4, a5);
  else
    return 0;
}

- (__SecKey)copyDeviceKey:(__CFError *)a3
{
  if (-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"))
    return (__SecKey *)SOSFullPeerInfoCopyDeviceKey(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), a3);
  SOSErrorCreate(1032, a3, 0, CFSTR("No identity to get key from"));
  return 0;
}

- (BOOL)removeIncompleteiCloudIdentities:(__OpaqueSOSCircle *)a3 privKey:(__SecKey *)a4 err:(__CFError *)a5
{
  const __CFSet *Mutable;
  CFIndex Count;
  _QWORD v11[5];

  Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001E55B4;
  v11[3] = &unk_1002EC3A0;
  v11[4] = Mutable;
  SOSCircleForEachActivePeer(-[SOSAccountTrust trustedCircle](self, "trustedCircle"), v11);
  Count = CFSetGetCount(Mutable);
  if (Count >= 1)
    SOSCircleRemovePeers(-[SOSAccountTrust trustedCircle](self, "trustedCircle"), a4, -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), Mutable, a5);
  if (Mutable)
    CFRelease(Mutable);
  return Count > 0;
}

- (BOOL)clientPing:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[5];

  v4 = a3;
  if (-[SOSAccountTrust trustedCircle](self, "trustedCircle")
    && -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo")
    && SOSFullPeerInfoPing(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), 0))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "circle_transport"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001E5524;
    v7[3] = &unk_1002EDB08;
    v7[4] = self;
    -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v5, 0, v7);

  }
  return 1;
}

- (void)addRingDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("trusted_rings")));

    if (!v5)
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));
      objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("trusted_rings"));

    }
  }
}

- (void)resetRingDictionary
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));

  if (v3)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust expansion](self, "expansion"));
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("trusted_rings"));

  }
}

+ (id)trustClassic
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)isInCircleOnly:(__CFError *)a3
{
  unsigned int v4;

  v4 = -[SOSAccountTrustClassic getCircleStatusOnly:](self, "getCircleStatusOnly:");
  if (v4)
    SOSErrorCreate(1037, a3, 0, CFSTR("Not in circle"));
  return v4 == 0;
}

- (BOOL)hasCircle:(__CFError *)a3
{
  if (!-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
    SOSCreateErrorWithFormat(1037, 0, a3, 0, CFSTR("No trusted circle"));
  return -[SOSAccountTrust trustedCircle](self, "trustedCircle") != 0;
}

- (int)thisDeviceStatusInCircle:(__OpaqueSOSCircle *)a3 peer:(__OpaqueSOSPeerInfo *)a4
{
  if (!a3)
    return 1;
  if (!SOSCircleCountPeers(a3))
    return 3;
  if (!a4 || (SOSPeerInfoIsRetirementTicket(a4) & 1) != 0)
    return 1;
  if ((SOSCircleHasPeer(a3, a4, 0) & 1) != 0)
    return 0;
  if ((SOSCircleHasApplicant(a3, a4, 0) & 1) == 0)
    return 1;
  return 2;
}

- (int)getCircleStatusOnly:(__CFError *)a3
{
  return -[SOSAccountTrustClassic thisDeviceStatusInCircle:peer:](self, "thisDeviceStatusInCircle:peer:", -[SOSAccountTrust trustedCircle](self, "trustedCircle", a3), -[SOSAccountTrust peerInfo](self, "peerInfo"));
}

- (__OpaqueSOSCircle)getCircle:(__CFError *)a3
{
  __OpaqueSOSCircle *v4;
  __OpaqueSOSCircle *v5;
  CFTypeID v6;

  v4 = -[SOSAccountTrust trustedCircle](self, "trustedCircle");
  v5 = v4;
  if (v4)
  {
    v6 = CFGetTypeID(v4);
    if (v6 == CFNullGetTypeID())
    {
      SOSCreateError(5, CFSTR("Incompatible circle in KVS"), 0, a3);
      return 0;
    }
  }
  return v5;
}

- (__OpaqueSOSCircle)ensureCircle:(id)a3 name:(__CFString *)a4 err:(__CFError *)a5
{
  id v7;
  const void *v8;
  const void *v9;
  NSObject *v10;
  __OpaqueSOSCircle *v11;
  uint8_t v13[16];

  v7 = a3;
  if (!-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
  {
    v8 = (const void *)SOSCircleCreate(0, a4, 0);
    -[SOSAccountTrust setTrustedCircle:](self, "setTrustedCircle:", v8);
    if (v8)
      CFRelease(v8);
    v9 = sub_10000EF14("circleop");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting key_interests_need_updating to true in ensureCircle", v13, 2u);
    }

    objc_msgSend(v7, "setKey_interests_need_updating:", 1);
  }
  -[SOSAccountTrust trustedCircle](self, "trustedCircle");
  v11 = -[SOSAccountTrust trustedCircle](self, "trustedCircle");

  return v11;
}

- (BOOL)hasLeft
{
  unsigned int v2;

  v2 = -[SOSAccountTrust departureCode](self, "departureCode");
  return (v2 < 8) & (0xDCu >> v2);
}

- (BOOL)ghostBustingOK:(__OpaqueSOSCircle *)a3 updatingTo:(__OpaqueSOSCircle *)a4
{
  __OpaqueSOSFullPeerInfo *v6;
  uint64_t PeerInfo;
  uint64_t v8;
  const void *PeerID;
  const __CFDictionary *v10;
  CFIndex CountOfKey;
  CFIndex Count;
  char HasPeer;
  BOOL v14;
  BOOL v15;

  v6 = -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo");
  if (!v6)
    return 0;
  PeerInfo = SOSFullPeerInfoGetPeerInfo(v6);
  if (!PeerInfo)
    return 0;
  v8 = PeerInfo;
  if ((SOSCircleHasPeer(a4, PeerInfo, 0) & 1) == 0 && !SOSCircleHasApplicant(a4, v8, 0))
    return 0;
  PeerID = (const void *)SOSPeerInfoGetPeerID(v8);
  v10 = (const __CFDictionary *)SOSCircleCopyAllSignatures(a4);
  CountOfKey = CFDictionaryGetCountOfKey(v10, PeerID);
  Count = CFDictionaryGetCount(v10);
  HasPeer = SOSCircleHasPeer(a3, v8, 0);
  v14 = Count - 2 > 1;
  if (!CountOfKey)
    v14 = 1;
  v15 = (HasPeer & 1) != 0 || v14;
  if (v10)
    CFRelease(v10);
  return v15;
}

- (BOOL)checkForSponsorshipTrust:(__OpaqueSOSCircle *)a3
{
  __OpaqueSOSCircle *v5;
  uint64_t v6;
  const void *v7;
  BOOL v8;

  v5 = -[SOSAccountTrust trustedCircle](self, "trustedCircle");
  if (!a3 || !v5)
  {
    if (v5 != a3)
      goto LABEL_6;
    return 0;
  }
  if (CFEqual(v5, a3))
    return 0;
LABEL_6:
  v6 = SOSFullPeerInfoCopyPubKey(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), 0);
  if (!v6)
    return 0;
  v7 = (const void *)v6;
  if (SOSCircleVerify(a3, v6, 0)
    && SOSCircleIsOlderGeneration(-[SOSAccountTrust trustedCircle](self, "trustedCircle"), a3))
  {
    -[SOSAccountTrust setTrustedCircle:](self, "setTrustedCircle:", a3);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  CFRelease(v7);
  return v8;
}

- (id)iCloudCheckEventHandle:(id)a3
{
  id v3;
  SOSIntervalEvent *v4;
  void *v5;
  SOSIntervalEvent *v6;

  v3 = a3;
  v4 = [SOSIntervalEvent alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "settings"));

  v6 = -[SOSIntervalEvent initWithDefaults:dateDescription:earliest:latest:](v4, "initWithDefaults:dateDescription:earliest:latest:", v5, CFSTR("iCloudIDCheck"), 86400.0, 129600.0);
  return v6;
}

- (id)iCloudCleanerHandle:(id)a3
{
  id v3;
  SOSIntervalEvent *v4;
  void *v5;
  SOSIntervalEvent *v6;

  v3 = a3;
  v4 = [SOSIntervalEvent alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "settings"));

  v6 = -[SOSIntervalEvent initWithDefaults:dateDescription:earliest:latest:](v4, "initWithDefaults:dateDescription:earliest:latest:", v5, CFSTR("iCloudCleanerCheck"), 432000.0, 604800.0);
  return v6;
}

- (BOOL)handleUpdateCircle:(__OpaqueSOSCircle *)a3 transport:(id)a4 update:(BOOL)a5 err:(__CFError *)a6
{
  unsigned int v7;
  id v10;
  void *v11;
  const char *v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  const void *v16;
  NSObject *v17;
  int v18;
  uint64_t Name;
  __OpaqueSOSCircle *v21;
  const void *v22;
  NSObject *v23;
  const void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  int HasApplicant;
  void *v32;
  const __CFSet *v33;
  const __CFSet *v34;
  id v35;
  id v36;
  const void *v37;
  NSObject *v38;
  void *v39;
  unsigned __int8 v40;
  const void *v41;
  NSObject *v42;
  uint64_t PeerID;
  const __CFString *v44;
  const char *v45;
  const char *v46;
  _BOOL4 v48;
  int v49;
  const __CFString *v50;
  int v51;
  int v52;
  const void *v53;
  NSObject *v54;
  const void *v55;
  NSObject *v56;
  char *v57;
  const char *v58;
  const void *v59;
  NSObject *v60;
  const void *v61;
  NSObject *v62;
  const void *v63;
  NSObject *v64;
  id v65;
  id v66;
  const void *v67;
  NSObject *v68;
  const void *v69;
  NSObject *v70;
  const void *v71;
  NSObject *v72;
  const void *v73;
  NSObject *v74;
  const void *v75;
  NSObject *v76;
  void *v77;
  __OpaqueSOSCircle *v78;
  int v79;
  const void *v80;
  NSObject *v81;
  const void *v82;
  NSObject *v83;
  unsigned int v84;
  const void *v85;
  const void *v86;
  const void *v87;
  NSObject *v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  const void *v92;
  NSObject *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const void *v97;
  NSObject *v98;
  uint64_t v99;
  uint64_t v100;
  const void *v101;
  NSObject *v102;
  const void *v103;
  const void *v104;
  const void *v105;
  NSObject *v106;
  _BOOL4 v107;
  const char *v108;
  const void *v109;
  NSObject *v110;
  const void *v111;
  NSObject *v112;
  void *v113;
  id v114;
  const __CFSet *v115;
  const __CFSet *v116;
  const void *v117;
  __OpaqueSOSCircle *v118;
  id v119;
  id v120;
  __OpaqueSOSCircle *v121;
  const void *v122;
  NSObject *v123;
  const void *v124;
  NSObject *v125;
  const void *v126;
  unsigned __int8 v127;
  char v128;
  __CFError *v129;
  const void *v130;
  NSObject *v131;
  const void *v132;
  NSObject *v133;
  unsigned int v134;
  const __CFString *v135;
  __OpaqueSOSCircle *v136;
  const __CFString *v137;
  __OpaqueSOSFullPeerInfo *v138;
  __OpaqueSOSCircle *v139;
  uint64_t TypeID;
  CFTypeID v141;
  CFTypeRef cf2;
  id v143;
  __OpaqueSOSCircle *v144;
  __OpaqueSOSCircle *cf;
  const char *v146;
  CFTypeRef v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  uint8_t *v151;
  __OpaqueSOSCircle *v152;
  uint8_t v153[8];
  uint8_t *v154;
  uint64_t v155;
  char v156;
  _BYTE buf[24];
  const char *v158;
  __int128 v159;
  __OpaqueSOSCircle *v160;
  __OpaqueSOSCircle *v161;

  v7 = a5;
  v10 = a4;
  v11 = v10;
  v12 = "remote";
  if (v7)
    v12 = "local";
  v146 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getAccount"));
  v14 = sub_10000EF14("signing");
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v146;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "start:[%s]", buf, 0xCu);
  }

  if (!objc_msgSend(v13, "accountKey") || (objc_msgSend(v13, "accountKeyIsTrusted") & 1) == 0)
  {
    SOSCreateError(2, CFSTR("Can't handle updates with no trusted public key here"), 0, a6);
LABEL_14:
    LOBYTE(v18) = 0;
    goto LABEL_15;
  }
  if (!a3)
  {
    v22 = sub_10000EF14("SecError");
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "##### Can't update to a NULL circle ######", buf, 2u);
    }
    goto LABEL_21;
  }
  if ((v7 & 1) == 0 && -[SOSAccountTrustClassic checkForSponsorshipTrust:](self, "checkForSponsorshipTrust:", a3))
  {
    _os_activity_initiate((void *)&_mh_execute_header, "CloudCircle EnsurePeerRegistration", OS_ACTIVITY_FLAG_DEFAULT, &stru_1002ED1E0);
    v16 = sub_10000EF14("circleop");
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Setting key_interests_need_updating to true in handleUpdateCircle", buf, 2u);
    }

    objc_msgSend(v13, "setKey_interests_need_updating:", 1);
    objc_msgSend(v13, "sosEvaluateIfNeeded");
    LOBYTE(v18) = 1;
    goto LABEL_15;
  }
  Name = SOSCircleGetName(a3);
  v21 = -[SOSAccountTrust trustedCircle](self, "trustedCircle");
  cf = v21;
  if (!v21)
  {
    SOSCreateErrorWithFormat(5, 0, a6, 0, CFSTR("Current Entry is NULL; rejecting %@"));
    v24 = sub_10000EF14("SecError");
    v23 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "##### Can't replace circle - we don't care about it ######", buf, 2u);
    }
LABEL_21:

    goto LABEL_14;
  }
  v141 = CFGetTypeID(v21);
  TypeID = SOSCircleGetTypeID();
  if (v141 == TypeID)
  {
    v139 = 0;
  }
  else
  {
    v139 = (__OpaqueSOSCircle *)SOSCircleCreate(kCFAllocatorDefault, Name, 0);
    cf = v139;
  }
  v25 = v13;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trust"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "retirees"));
  *(_QWORD *)buf = _NSConcreteStackBlock;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = sub_1001CE420;
  v158 = (const char *)&unk_1002EB258;
  *(_QWORD *)&v159 = v27;
  *((_QWORD *)&v159 + 1) = v25;
  v160 = a3;
  v28 = v25;
  v29 = v27;
  SOSCircleForEachRetiredPeer(a3, buf);

  v143 = v28;
  v144 = (__OpaqueSOSCircle *)SOSCircleCopyCircle(0, a3, a6);
  v30 = objc_msgSend(v143, "peerInfo");
  if (v30)
    HasApplicant = SOSCircleHasApplicant(v144, v30, 0);
  else
    HasApplicant = 0;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "trust"));
  v33 = (const __CFSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "retirees"));
  v34 = v33;
  if (v144)
  {
    v147 = 0;
    v148 = (uint64_t)&v147;
    v149 = 0x2020000000;
    LOBYTE(v150) = 0;
    if (v33)
    {
      *(_QWORD *)buf = _NSConcreteStackBlock;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_1001CE560;
      v158 = (const char *)&unk_1002EC5E8;
      *(_QWORD *)&v159 = &v147;
      *((_QWORD *)&v159 + 1) = v144;
      CFSetApplyFunction(v33, (CFSetApplierFunction)sub_1001C9C54, buf);
      if (*(_BYTE *)(v148 + 24))
      {
        if (!SOSCircleCountPeers(v144))
        {
          v35 = sub_1001D6CD8(v143, (uint64_t)a6);
          if (HasApplicant)
          {
            v36 = v35;
            if (!v35)
              goto LABEL_44;
            v37 = sub_10000EF14("resetToOffering");
            v38 = objc_claimAutoreleasedReturnValue(v37);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v153 = 0;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Reset to offering with last retirement and me as applicant", v153, 2u);
            }

            if (SOSCircleResetToOffering(v144, v36, objc_msgSend(v143, "fullPeerInfo"), a6)
              && (v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "trust")),
                  v40 = objc_msgSend(v39, "addiCloudIdentity:key:err:", v144, v36, a6),
                  v39,
                  (v40 & 1) != 0))
            {
              objc_msgSend(v143, "setNotifyBackupOnExit:", 1);
            }
            else
            {
LABEL_44:
              CFRelease(v144);
              v144 = 0;
            }
          }
          else
          {
            v41 = sub_10000EF14("circleOps");
            v42 = objc_claimAutoreleasedReturnValue(v41);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v153 = 0;
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Reset to empty with last retirement", v153, 2u);
            }

            SOSCircleResetToEmpty(v144, 0);
          }
        }
      }
    }
    _Block_object_dispose(&v147, 8);
  }
  else
  {
    v144 = 0;
  }

  if (!v144)
    goto LABEL_14;
  v138 = -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo");
  cf2 = (CFTypeRef)SOSFullPeerInfoGetPeerInfo(v138);
  PeerID = SOSPeerInfoGetPeerID(cf2);
  v44 = CFSTR("No Peer");
  if (PeerID)
    v44 = (const __CFString *)PeerID;
  v135 = v44;
  if (cf2)
    v7 |= SOSCircleUpdatePeerInfo(v144, cf2);
  if (SOSCircleVerify(cf, objc_msgSend(v143, "accountKey"), 0))
  {
    v45 = (const char *)objc_msgSend(v143, "accountKey");
LABEL_56:
    v46 = v45;
    goto LABEL_58;
  }
  if (objc_msgSend(v143, "previousAccountKey")
    && SOSCircleVerify(cf, objc_msgSend(v143, "previousAccountKey"), 0))
  {
    v45 = (const char *)objc_msgSend(v143, "previousAccountKey");
    goto LABEL_56;
  }
  v46 = 0;
LABEL_58:
  v48 = v141 == TypeID && v46 != 0;
  v49 = SOSCircleConcordanceTrust(cf, v144, v46, objc_msgSend(v143, "accountKey"), cf2, a6);
  v50 = CFSTR("Trusted");
  v51 = 1;
  v52 = 1;
  switch(v49)
  {
    case 0:
      goto LABEL_82;
    case 1:
      if (v48)
        v51 = 3;
      else
        v51 = 4;
      v50 = CFSTR("Generation Old");
      goto LABEL_81;
    case 2:
      if (v48)
        v51 = 3;
      else
        v51 = 0;
      v50 = CFSTR("No User Signature");
      goto LABEL_81;
    case 3:
      v130 = sub_10000EF14("SecError");
      v131 = objc_claimAutoreleasedReturnValue(v130);
      if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_DEFAULT, "##### No User Public Key Available, this shouldn't ever happen!!!", buf, 2u);
      }

      abort();
    case 4:
      v50 = CFSTR("No trusted peer left");
      v52 = 4;
      v51 = 2;
      goto LABEL_82;
    case 5:
    case 6:
      if (v48)
        v51 = 3;
      else
        v51 = 0;
      v50 = CFSTR("Bad Signature");
      goto LABEL_81;
    case 7:
      v53 = sub_10000EF14("signing");
      v54 = objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "##### No trusted peer signature found, accepting hoping for concordance later", buf, 2u);
      }

      v51 = 0;
      v50 = CFSTR("No trusted peer signature");
LABEL_81:
      v52 = 1;
LABEL_82:
      v134 = v52;
      v137 = v50;
      v55 = sub_10000EF14("signing");
      v56 = objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        v57 = off_1002ECA68[v51];
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v57;
        v58 = "trusted";
        *(_WORD *)&buf[12] = 2112;
        if (!v48)
          v58 = "untrusted";
        *(_QWORD *)&buf[14] = v137;
        *(_WORD *)&buf[22] = 2080;
        v158 = v58;
        LOWORD(v159) = 2112;
        *(_QWORD *)((char *)&v159 + 2) = v135;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Decided on action [%s] based on concordance state [%@] and [%s] circle.  My PeerID is %@", buf, 0x2Au);
      }
      break;
    default:
      v132 = sub_10000EF14("SecError");
      v133 = objc_claimAutoreleasedReturnValue(v132);
      if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_DEFAULT, "##### Bad Error Return from ConcordanceTrust", buf, 2u);
      }

      abort();
  }

  LOBYTE(v18) = 1;
  v136 = 0;
  switch(v51)
  {
    case 0:
      goto LABEL_119;
    case 1:
      if (!cf2 || !SOSCircleHasPeer(v144, cf2, 0))
      {
        v75 = sub_10000EF14("signing");
        v76 = objc_claimAutoreleasedReturnValue(v75);
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Not countersigning, not in new circle", buf, 2u);
        }

        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "trust"));
        objc_msgSend(v77, "resetRingDictionary");

        goto LABEL_118;
      }
      if (SOSCircleVerifyPeerSigned(v144, cf2, 0))
      {
        v59 = sub_10000EF14("signing");
        v60 = objc_claimAutoreleasedReturnValue(v59);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Already concur with the new circle", buf, 2u);
        }

        goto LABEL_118;
      }
      v147 = 0;
      if (v138 && SOSCircleConcordanceSign(v144, v138, &v147))
      {
        v101 = sub_10000EF14("signing");
        v102 = objc_claimAutoreleasedReturnValue(v101);
        if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "Concurred with new circle", buf, 2u);
        }
        v136 = v144;
      }
      else
      {
        v104 = sub_10000EF14("SecError");
        v102 = objc_claimAutoreleasedReturnValue(v104);
        if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v147;
          _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "Failed to concurrence sign, error: %@", buf, 0xCu);
        }
        v136 = 0;
        LOBYTE(v18) = 0;
      }

      if (v147)
        CFRelease(v147);
      goto LABEL_119;
    case 2:
      if (cf2 && SOSCircleHasPeer(cf, cf2, 0))
      {
        v61 = sub_10000EF14("account");
        v62 = objc_claimAutoreleasedReturnValue(v61);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = cf2;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Leaving circle with peer %@", buf, 0xCu);
        }

        debugDumpCircle(CFSTR("oldCircle"), cf);
        debugDumpCircle(CFSTR("newCircle"), v144);
        debugDumpCircle(CFSTR("prospective_circle"), a3);
        v63 = sub_10000EF14("account");
        v64 = objc_claimAutoreleasedReturnValue(v63);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          v65 = objc_msgSend(v143, "accountKey");
          v66 = objc_msgSend(v143, "previousAccountKey");
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v65;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v66;
          *(_WORD *)&buf[22] = 2112;
          v158 = v46;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Key state: accountKey %@, previousAccountKey %@, old_circle_key %@", buf, 0x20u);
        }

        v18 = sub_1001CE630(v143, (uint64_t)v144, (CFTypeRef *)a6);
        if (v18)
        {
          v67 = sub_10000EF14("circleOps");
          v68 = objc_claimAutoreleasedReturnValue(v67);
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Leaving circle by newcircle state", buf, 2u);
          }
          v136 = v144;
        }
        else
        {
          v103 = sub_10000EF14("signing");
          v68 = objc_claimAutoreleasedReturnValue(v103);
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Can't leave circle, but dumping identities", buf, 2u);
          }
          v136 = 0;
        }

        -[SOSAccountTrust setDepartureCode:](self, "setDepartureCode:", v134);
        cf2 = 0;
      }
      else
      {
        v73 = sub_10000EF14("signing");
        v74 = objc_claimAutoreleasedReturnValue(v73);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "We are not in this circle, but we need to update account with it", buf, 2u);
        }

        debugDumpCircle(CFSTR("oldCircle"), cf);
        debugDumpCircle(CFSTR("newCircle"), v144);
        debugDumpCircle(CFSTR("prospective_circle"), a3);
LABEL_118:
        v136 = 0;
      }
LABEL_119:
      *(_QWORD *)v153 = 0;
      v154 = v153;
      v155 = 0x2020000000;
      v156 = 0;
      *(_QWORD *)buf = _NSConcreteStackBlock;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_1001F8F14;
      v158 = (const char *)&unk_1002ECB88;
      v78 = cf;
      *(_QWORD *)&v159 = v153;
      *((_QWORD *)&v159 + 1) = v144;
      SOSCircleForEachPeer(cf, buf);
      v147 = _NSConcreteStackBlock;
      v148 = 3221225472;
      v149 = (uint64_t)sub_1001F8F94;
      v150 = &unk_1002ECB88;
      v151 = v153;
      v152 = cf;
      SOSCircleForEachPeer(v144, &v147);
      v79 = v154[24];
      _Block_object_dispose(v153, 8);
      if (v79)
      {
        v80 = sub_10000EF14("circleOps");
        v81 = objc_claimAutoreleasedReturnValue(v80);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "Sending kSOSCCCircleOctagonKeysChangedNotification", buf, 2u);
        }

        notify_post(kSOSCCCircleOctagonKeysChangedNotification);
        v78 = cf;
      }
      if (!cf2)
      {
        cf2 = 0;
        v91 = 1;
        goto LABEL_183;
      }
      if (SOSCircleHasActivePeer(v78, cf2, 0) && (SOSCircleHasPeer(v144, cf2, 0) & 1) == 0)
      {
        if (!-[SOSAccountTrustClassic hasLeft](self, "hasLeft"))
          -[SOSAccountTrust setDepartureCode:](self, "setDepartureCode:", 3);
        v82 = sub_10000EF14("circleOps");
        v83 = objc_claimAutoreleasedReturnValue(v82);
        if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
        {
          v84 = -[SOSAccountTrust departureCode](self, "departureCode");
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v84;
          _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "Member of old circle but not of new circle (%d)", buf, 8u);
        }

        SOSCircleLogState("circleOps-Old", cf, objc_msgSend(v143, "accountKey"), v135);
        SOSCircleLogState("circleOps-New", v144, objc_msgSend(v143, "accountKey"), v135);
      }
      if (SOSCircleHasActivePeer(cf, cf2, 0)
        && (SOSCircleCountPeers(cf) != 1 || (SOSCircleHasPeer(cf, cf2, 0) & 1) == 0)
        && (SOSCircleHasPeer(v144, cf2, 0) & 1) == 0
        && (SOSCircleHasApplicant(v144, cf2, 0) & 1) == 0)
      {
        v97 = sub_10000EF14("circle");
        v98 = objc_claimAutoreleasedReturnValue(v97);
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
        {
          v99 = SOSPeerInfoGetPeerID(cf2);
          v100 = SOSCircleGetName(cf);
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v99;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v100;
          _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "Purging my peer (ID: %@) for circle '%@'!!!", buf, 0x16u);
        }

        -[SOSAccountTrustClassic purgeIdentity](self, "purgeIdentity");
        goto LABEL_157;
      }
      if (SOSCircleHasRejectedApplicant(v144, cf2, 0))
      {
        v85 = (const void *)SOSCircleCopyRejectedApplicant(v144, cf2, 0);
        v86 = v85;
        if (v85
          && CFEqual(v85, cf2)
          && SOSPeerInfoApplicationVerify(cf2, objc_msgSend(v143, "accountKey"), 0))
        {
          v87 = sub_10000EF14("circle");
          v88 = objc_claimAutoreleasedReturnValue(v87);
          if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
          {
            v89 = SOSPeerInfoGetPeerID(cf2);
            v90 = SOSCircleGetName(cf);
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v89;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v90;
            _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "Rejected, Purging my applicant peer (ID: %@) for circle '%@'", buf, 0x16u);
          }

          debugDumpCircle(CFSTR("oldCircle"), cf);
          debugDumpCircle(CFSTR("newCircle"), v144);
          -[SOSAccountTrustClassic purgeIdentity](self, "purgeIdentity");
          CFRelease(v86);
LABEL_157:
          cf2 = 0;
          v91 = 1;
          goto LABEL_182;
        }
        v92 = sub_10000EF14("circle");
        v93 = objc_claimAutoreleasedReturnValue(v92);
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          v94 = SOSPeerInfoGetPeerID(cf2);
          v95 = SOSCircleGetName(cf);
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v94;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v95;
          _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "Rejected, Reapplying (ID: %@) for circle '%@'", buf, 0x16u);
        }

        debugDumpCircle(CFSTR("oldCircle"), cf);
        debugDumpCircle(CFSTR("newCircle"), v144);
        SOSCircleRequestReadmission(v144, objc_msgSend(v143, "accountKey"), cf2, 0);
        if (v86)
          CFRelease(v86);
        v7 = 1;
      }
      if (!objc_msgSend(v143, "accountKeyIsTrusted") || !SOSCircleHasPeer(v144, cf2, 0))
        goto LABEL_181;
      v96 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrustClassic iCloudCheckEventHandle:](self, "iCloudCheckEventHandle:", v143));
      if (!objc_msgSend(v96, "checkDate"))
        goto LABEL_180;
      if ((v7 & 1) != 0)
      {
        v7 = 1;
        goto LABEL_179;
      }
      v7 = -[SOSAccountTrustClassic fixICloudIdentities:circle:](self, "fixICloudIdentities:circle:", v143, v144);
      v105 = sub_10000EF14("circleOps");
      v106 = objc_claimAutoreleasedReturnValue(v105);
      v107 = os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (!v107)
          goto LABEL_178;
        *(_WORD *)buf = 0;
        v108 = "Fixed iCloud Identity in circle";
      }
      else
      {
        if (!v107)
          goto LABEL_178;
        *(_WORD *)buf = 0;
        v108 = "Failed to fix broken icloud identity";
      }
      _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, v108, buf, 2u);
LABEL_178:

LABEL_179:
      objc_msgSend(v96, "followup");
LABEL_180:

LABEL_181:
      v91 = 0;
LABEL_182:
      v78 = cf;
LABEL_183:
      if (v78)
        CFRetain(cf);
      objc_msgSend(v143, "setPreviousAccountKey:", objc_msgSend(v143, "accountKey"));
      v109 = sub_10000EF14("signing");
      v110 = objc_claimAutoreleasedReturnValue(v109);
      if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v137;
        _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "%@, Accepting new circle", buf, 0xCu);
      }

      -[SOSAccountTrust setTrustedCircle:](self, "setTrustedCircle:", v144);
      objc_msgSend(v143, "sosEvaluateIfNeeded");
      if ((v91 & 1) == 0)
      {
        if (objc_msgSend(v143, "accountKeyIsTrusted")
          && SOSCircleHasApplicant(cf, cf2, 0)
          && (int)SOSCircleCountPeers(v144) >= 1
          && (SOSCircleHasPeer(v144, cf2, 0) & 1) == 0
          && (SOSCircleHasApplicant(v144, cf2, 0) & 1) == 0)
        {
          v111 = sub_10000EF14("signing");
          v112 = objc_claimAutoreleasedReturnValue(v111);
          if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "requesting readmission to new circle", buf, 2u);
          }

          v7 |= SOSCircleRequestReadmission(v144, objc_msgSend(v143, "accountKey"), cf2, 0);
        }
        if (SOSCircleHasActivePeer(cf, cf2, 0))
        {
          v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "trust"));
          objc_msgSend(v113, "cleanupRetirementTickets:circle:time:err:", v143, cf, 86400, 0);

        }
      }
      v114 = v143;
      objc_msgSend(v114, "setCircle_rings_retirements_need_attention:", 1);
      v115 = (const __CFSet *)SOSCircleCopyPeers(cf, kCFAllocatorDefault);
      v116 = (const __CFSet *)SOSCircleCopyPeers(v144, kCFAllocatorDefault);
      v117 = (const void *)SOSCircleCopyApplicants(cf, kCFAllocatorDefault);
      v118 = (__OpaqueSOSCircle *)SOSCircleCopyApplicants(v144, kCFAllocatorDefault);
      v119 = objc_msgSend(v114, "peerInfo");
      if (v119 && CFSetContainsValue(v116, v119))
        sub_1001E6A88(v114, (uint64_t)CFSTR("EscrowRecord"), (uint64_t)kCFNull, 0);
      *(_QWORD *)buf = _NSConcreteStackBlock;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_1001DE918;
      v158 = (const char *)&unk_1002EBD40;
      *((_QWORD *)&v159 + 1) = v117;
      v160 = v118;
      v120 = v114;
      *(_QWORD *)&v159 = v120;
      v161 = v144;
      sub_1001DE9B0(v115, v116, buf);
      if (v117)
        CFRelease(v117);
      if (v118)
        CFRelease(v118);
      if (v115)
        CFRelease(v115);
      if (v116)
        CFRelease(v116);

      if (cf)
        CFRelease(cf);
      v121 = v144;
      if (!v7)
        v121 = v136;
      cf = v121;
      v122 = sub_10000EF14("circleop");
      v123 = objc_claimAutoreleasedReturnValue(v122);
      if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEFAULT, "Setting key_interests_need_updating to true in handleUpdateCircle", buf, 2u);
      }

      objc_msgSend(v120, "setKey_interests_need_updating:", 1);
LABEL_216:
      if (cf)
      {
        v124 = sub_10000EF14("signing");
        v125 = objc_claimAutoreleasedReturnValue(v124);
        if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v146;
          _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEFAULT, "Pushing:[%s]", buf, 0xCu);
        }

        v126 = (const void *)SOSCircleCopyEncodedData(cf, kCFAllocatorDefault, a6);
        if (v126)
        {
          objc_msgSend(v143, "setCircle_rings_retirements_need_attention:", 1);
          v127 = objc_msgSend(v11, "postCircle:circleData:err:", SOSCircleGetName(cf), v126, a6);
          CFRelease(v126);
          LOBYTE(v18) = v18 & v127;
        }
        else
        {
          LOBYTE(v18) = 0;
        }
      }
LABEL_222:
      CFRelease(v144);
      if (v139)
        CFRelease(v139);
      v128 = v18 ^ 1;
      if (!a6)
        v128 = 1;
      if ((v128 & 1) == 0)
      {
        v129 = *a6;
        if (*a6)
        {
          *a6 = 0;
          CFRelease(v129);
        }
      }
      objc_msgSend(v143, "sosEvaluateIfNeeded");
LABEL_15:

      return v18;
    case 3:
      if (v141 == TypeID && cf2 && SOSCircleHasActivePeer(cf, cf2, 0))
      {
        v69 = sub_10000EF14("signing");
        v70 = objc_claimAutoreleasedReturnValue(v69);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v137;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%@, Rejecting new circle, re-publishing old circle", buf, 0xCu);
        }

        -[SOSAccountTrust setTrustedCircle:](self, "setTrustedCircle:", cf);
        objc_msgSend(v143, "sosEvaluateIfNeeded");
        goto LABEL_216;
      }
      v71 = sub_10000EF14("canary");
      v72 = objc_claimAutoreleasedReturnValue(v71);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v137;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "%@, Rejecting: new circle Have no old circle - would reset", buf, 0xCu);
      }

      goto LABEL_222;
    default:
      goto LABEL_222;
  }
}

- (BOOL)updateCircleFromRemote:(id)a3 newCircle:(__OpaqueSOSCircle *)a4 err:(__CFError *)a5
{
  return -[SOSAccountTrustClassic handleUpdateCircle:transport:update:err:](self, "handleUpdateCircle:transport:update:err:", a4, a3, 0, a5);
}

- (BOOL)updateCircle:(id)a3 newCircle:(__OpaqueSOSCircle *)a4 err:(__CFError *)a5
{
  return -[SOSAccountTrustClassic handleUpdateCircle:transport:update:err:](self, "handleUpdateCircle:transport:update:err:", a4, a3, 1, a5);
}

- (BOOL)modifyCircle:(id)a3 err:(__CFError *)a4 action:(id)a5
{
  id v8;
  unsigned int (**v9)(id, uint64_t);
  uint64_t v10;
  const void *v11;
  BOOL v12;

  v8 = a3;
  v9 = (unsigned int (**)(id, uint64_t))a5;
  if (!-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
  {
    SOSErrorCreate(1037, a4, 0, CFSTR("No circle to get peer key from"));
    goto LABEL_8;
  }
  v10 = SOSCircleCopyCircle(kCFAllocatorDefault, -[SOSAccountTrust trustedCircle](self, "trustedCircle"), a4);
  if (!v10)
  {
LABEL_8:
    v12 = 0;
    goto LABEL_6;
  }
  v11 = (const void *)v10;
  if (v9[2](v9, v10))
    v12 = -[SOSAccountTrustClassic updateCircle:newCircle:err:](self, "updateCircle:newCircle:err:", v8, v11, a4);
  else
    v12 = 1;
  CFRelease(v11);
LABEL_6:

  return v12;
}

- (BOOL)fixICloudIdentities:(id)a3 circle:(__OpaqueSOSCircle *)a4
{
  id v6;
  const void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  CFMutableSetRef Mutable;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  _UNKNOWN **v18;
  CFTypeRef v19;
  CFTypeRef cf[5];

  v6 = a3;
  v7 = (const void *)SOSCircleCopyiCloudFullPeerInfoRef(a4, 0);
  if (v7)
  {
    CFRelease(v7);
LABEL_21:
    LOBYTE(v14) = 0;
    goto LABEL_22;
  }
  sub_1001D6E4C(v6);
  if (!sub_1001D6CD8(v6, 0) && !sub_1001D7620(v6, 0))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SOSAnalytics logger](SOSAnalytics, "logger"));
    v17 = v16;
    v18 = &off_10030B850;
    goto LABEL_20;
  }
  v8 = sub_1001D6CD8(v6, 0);
  if (!v8)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SOSAnalytics logger](SOSAnalytics, "logger"));
    v17 = v16;
    v18 = &off_10030B828;
LABEL_20:
    objc_msgSend(v16, "logHardFailureForEventNamed:withAttributes:", CFSTR("iCloudIdentityFix"), v18);

    goto LABEL_21;
  }
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrustClassic iCloudCleanerHandle:](self, "iCloudCleanerHandle:", v6));
  if (objc_msgSend(v10, "checkDate"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trust"));
    v12 = objc_msgSend(v11, "fullPeerInfo");
    Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
    cf[0] = _NSConcreteStackBlock;
    cf[1] = (CFTypeRef)3221225472;
    cf[2] = sub_1001CEA7C;
    cf[3] = &unk_1002EC3A0;
    cf[4] = Mutable;
    SOSCircleForEachActivePeer(a4, cf);
    if (CFSetGetCount(Mutable) >= 1)
      SOSCircleRemovePeers(a4, v9, v12, Mutable, 0);
    if (Mutable)
      CFRelease(Mutable);

    objc_msgSend(v10, "followup");
  }
  cf[0] = 0;
  v14 = -[SOSAccountTrustClassic addiCloudIdentity:key:err:](self, "addiCloudIdentity:key:err:", a4, v9, cf);
  if (v14)
  {
    objc_msgSend(v6, "setNotifyBackupOnExit:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SOSAnalytics logger](SOSAnalytics, "logger"));
    objc_msgSend(v15, "logSuccessForEventNamed:", CFSTR("iCloudIdentityFix"));
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SOSAnalytics logger](SOSAnalytics, "logger"));
    objc_msgSend(v15, "logResultForEvent:hardFailure:result:", CFSTR("iCloudIdentityFix"), 1, cf[0]);
  }

  v19 = cf[0];
  if (cf[0])
  {
    cf[0] = 0;
    CFRelease(v19);
  }

LABEL_22:
  return v14;
}

- (void)generationSignatureUpdateWith:(id)a3 key:(__SecKey *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  const void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  NSObject *v14;
  SOSAccountTrustClassic *v15;
  __SecKey *v16;
  uint8_t buf[16];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trust"));
  if (objc_msgSend(v7, "trustedCircle") && (sub_1001D91F0(v6, (uint64_t)a4) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trust"));
    v9 = SOSCircleVerify(objc_msgSend(v8, "trustedCircle"), objc_msgSend(v6, "accountKey"), 0);

    if (v9)
    {
      v10 = sub_10000EF14("updatingGenSignature");
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "no change to userKey - skipping gensign", buf, 2u);
      }
      goto LABEL_10;
    }
  }
  else
  {

  }
  if (-[SOSAccountTrust trustedCircle](self, "trustedCircle") && -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "circle_transport"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001F8D78;
    v13[3] = &unk_1002ECA98;
    v14 = v6;
    v15 = self;
    v16 = a4;
    -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v12, 0, v13);

    v11 = v14;
LABEL_10:

  }
}

- (void)forEachCirclePeerExceptMe:(id)a3
{
  id v4;
  void *v5;
  __OpaqueSOSCircle *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  if (-[SOSAccountTrust trustedCircle](self, "trustedCircle") && -[SOSAccountTrust peerInfo](self, "peerInfo"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTrust peerID](self, "peerID"));
    v6 = -[SOSAccountTrust trustedCircle](self, "trustedCircle");
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001F8D24;
    v8[3] = &unk_1002ECAC0;
    v9 = v5;
    v10 = v4;
    v7 = v5;
    SOSCircleForEachPeer(v6, v8);

  }
}

- (BOOL)leaveCircleWithAccount:(id)a3 err:(__CFError *)a4
{
  id v6;
  const void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  BOOL v11;
  void **v13;
  uint64_t v14;
  BOOL (*v15)(uint64_t, uint64_t);
  void *v16;
  id v17;
  __CFError **v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = sub_10000EF14("circleOps");
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "leaveCircleWithAccount: Leaving circle by client request", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "circle_transport"));
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_1001F8D18;
  v16 = &unk_1002ECAE8;
  v17 = v6;
  v18 = a4;
  v10 = v6;
  v11 = -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v9, a4, &v13);

  -[SOSAccountTrust setDepartureCode:](self, "setDepartureCode:", 2, v13, v14, v15, v16);
  return v11;
}

- (BOOL)leaveCircle:(id)a3 err:(__CFError *)a4
{
  id v6;
  const void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  BOOL v11;
  void **v13;
  uint64_t v14;
  BOOL (*v15)(uint64_t, uint64_t);
  void *v16;
  id v17;
  __CFError **v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = sub_10000EF14("circleOps");
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Leaving circle by client request", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "circle_transport"));
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_1001F8D0C;
  v16 = &unk_1002ECAE8;
  v17 = v6;
  v18 = a4;
  v10 = v6;
  v11 = -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v9, a4, &v13);

  objc_msgSend(v10, "setBackup_key:", 0, v13, v14, v15, v16);
  -[SOSAccountTrust setDepartureCode:](self, "setDepartureCode:", 2);

  return v11;
}

- (BOOL)resetToOffering:(id)a3 key:(__SecKey *)a4 err:(__CFError *)a5
{
  id v8;
  const void *v9;
  NSObject *v10;
  BOOL v11;
  uint8_t v13[16];

  v8 = a3;
  -[SOSAccountTrustClassic purgeIdentity](self, "purgeIdentity");
  v9 = sub_10000EF14("resetToOffering");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Resetting circle to offering by request from client", v13, 2u);
  }

  if (a4)
    v11 = -[SOSAccountTrustClassic resetCircleToOffering:userKey:err:](self, "resetCircleToOffering:userKey:err:", v8, a4, a5);
  else
    v11 = 0;

  return v11;
}

- (BOOL)resetCircleToOffering:(id)a3 userKey:(__SecKey *)a4 err:(__CFError *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFSet *AllCurrent;
  BOOL v18;
  _QWORD v20[5];
  id v21;
  __SecKey *v22;
  __CFError **v23;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "account"));
  if (-[SOSAccountTrustClassic hasCircle:](self, "hasCircle:", a5)
    && -[SOSAccountTrustClassic ensureFullPeerAvailable:err:](self, "ensureFullPeerAvailable:err:", v9, a5))
  {
    -[SOSAccountTrustClassic resetAllRings:err:](self, "resetAllRings:err:", v9, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "circle_transport"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1001F8B90;
    v20[3] = &unk_1002ECB10;
    v22 = a4;
    v23 = a5;
    v20[4] = self;
    v11 = v9;
    v21 = v11;
    -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v10, a5, v20);

    sub_1001DED04(v11);
    AllCurrent = (const __CFSet *)SOSViewsGetAllCurrent(v12, v13, v14, v15, v16);
    sub_1001DF388(v8, AllCurrent);
    notify_post(kSOSCCCircleOctagonKeysChangedNotification);

    v18 = 1;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)joinCircle:(id)a3 userKey:(__SecKey *)a4 useCloudPeer:(BOOL)a5 err:(__CFError *)a6
{
  _BOOL4 v7;
  id v10;
  const void *v11;
  NSObject *v12;
  unsigned __int8 v13;
  uint64_t v14;
  void *v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFSet *AllCurrent;
  const void *v22;
  char v23;
  _QWORD v25[10];
  uint8_t buf[16];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;

  v7 = a5;
  v10 = a3;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_1001F897C;
  v31 = sub_1001F898C;
  v32 = (id)0xAAAAAAAAAAAAAAAALL;
  v32 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "account"));
  if (-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
  {
    if (-[SOSAccountTrustClassic ensureFullPeerAvailable:err:](self, "ensureFullPeerAvailable:err:", v28[5], a6))
    {
      if (SOSCircleCountPeers(-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
        && !sub_1001F045C((void *)v28[5]))
      {
        -[SOSAccountTrustClassic setValueInExpansion:value:err:](self, "setValueInExpansion:value:err:", CFSTR("unsynced"), kCFBooleanTrue, 0);
        if (v7)
        {
          v14 = SOSCircleCopyiCloudFullPeerInfoRef(-[SOSAccountTrust trustedCircle](self, "trustedCircle"), 0);
          v34[3] = v14;
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v28[5], "circle_transport"));
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_1001F8994;
        v25[3] = &unk_1002ECB60;
        v25[4] = self;
        v25[5] = &v37;
        v25[8] = a6;
        v25[9] = a4;
        v25[6] = &v27;
        v25[7] = &v33;
        -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v15, a6, v25);

        if (v7 || (v16 = sub_1001DF090((void *)v28[5], 2)))
        {
          AllCurrent = (const __CFSet *)SOSViewsGetAllCurrent(v16, v17, v18, v19, v20);
          sub_1001DF388(v10, AllCurrent);
        }
      }
      else
      {
        v11 = sub_10000EF14("resetToOffering");
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Resetting circle to offering since there are no peers", buf, 2u);
        }

        v13 = -[SOSAccountTrustClassic resetCircleToOffering:userKey:err:](self, "resetCircleToOffering:userKey:err:", v10, a4, a6);
        *((_BYTE *)v38 + 24) = v13;
      }
    }
  }
  else
  {
    SOSCreateErrorWithFormat(1032, 0, a6, 0, CFSTR("Don't have circle when joining???"));
  }
  v22 = (const void *)v34[3];
  if (v22)
  {
    v34[3] = 0;
    CFRelease(v22);
  }
  v23 = *((_BYTE *)v38 + 24);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v23;
}

- (BOOL)isLockedError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    if (objc_msgSend(v5, "isEqualToString:", kCFErrorDomainOSStatus))
      v6 = objc_msgSend(v4, "code") == (id)-25308;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)updateFullPeerInfo:(id)a3 minimum:(__CFSet *)a4 excluded:(__CFSet *)a5
{
  id v8;
  void *v9;
  _QWORD v11[5];

  v8 = a3;
  if (-[SOSAccountTrust trustedCircle](self, "trustedCircle")
    && -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo")
    && SOSFullPeerInfoUpdateToCurrent(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), a4, a5))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "circle_transport"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002190A0;
    v11[3] = &unk_1002EDB08;
    v11[4] = self;
    -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v9, 0, v11);

  }
  return 1;
}

- (__OpaqueSOSFullPeerInfo)getMyFullPeerInfo
{
  __OpaqueSOSFullPeerInfo *result;

  result = -[SOSAccountTrust trustedCircle](self, "trustedCircle");
  if (result)
    return -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo");
  return result;
}

- (BOOL)fullPeerInfoVerify:(__SecKey *)a3 err:(__CFError *)a4
{
  const void *PublicFromPrivate;
  char v8;

  if (!-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"))
    return 0;
  PublicFromPrivate = (const void *)SecKeyCreatePublicFromPrivate(a3);
  v8 = SOSPeerInfoApplicationVerify(-[SOSAccountTrust peerInfo](self, "peerInfo"), PublicFromPrivate, a4);
  if (PublicFromPrivate)
    CFRelease(PublicFromPrivate);
  return v8;
}

- (BOOL)hasFullPeerInfo:(__CFError *)a3
{
  _BOOL4 v5;

  v5 = -[SOSAccountTrustClassic hasCircle:](self, "hasCircle:");
  if (v5)
  {
    if (-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"))
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      SOSCreateErrorWithFormat(1032, 0, a3, 0, CFSTR("No peer for circle"));
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (__OpaqueSOSFullPeerInfo)CopyAccountIdentityPeerInfo
{
  return (__OpaqueSOSFullPeerInfo *)SOSFullPeerInfoCopyFullPeerInfo(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"));
}

- (__SecKey)randomPermanentFullECKey:(int)a3 name:(id)a4 error:(__CFError *)a5
{
  return sub_1001D8D48(a3, (uint64_t)a4, (uint64_t)kSecAttrAccessibleWhenUnlockedThisDeviceOnly, (uint64_t)kCFBooleanFalse, a5);
}

- (BOOL)haveConfirmedOctagonKeys
{
  __SecKey *v3;
  __SecKey *v4;
  char v5;
  const void *v6;
  NSObject *v7;
  __SecKey *v8;
  __SecKey *v9;
  char v10;
  const void *v11;
  NSObject *v12;
  uint8_t v14[16];
  uint8_t buf[16];

  v3 = (__SecKey *)SOSFullPeerInfoCopyOctagonPublicSigningKey(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), 0);
  if (-[SOSAccountTrust cachedOctagonSigningKey](self, "cachedOctagonSigningKey"))
  {
    v4 = -[SOSAccountTrust cachedOctagonSigningKey](self, "cachedOctagonSigningKey");
    if (v3 && v4)
    {
      if (CFEqual(v3, v4))
      {
LABEL_5:
        v5 = 1;
        goto LABEL_10;
      }
    }
    else if (v3 == v4)
    {
      goto LABEL_5;
    }
  }
  v6 = sub_10000EF14("SecError");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "circleChange: No extant octagon signing key", buf, 2u);
  }

  v5 = 0;
LABEL_10:
  v8 = (__SecKey *)SOSFullPeerInfoCopyOctagonPublicEncryptionKey(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), 0);
  if (-[SOSAccountTrust cachedOctagonEncryptionKey](self, "cachedOctagonEncryptionKey"))
  {
    v9 = -[SOSAccountTrust cachedOctagonEncryptionKey](self, "cachedOctagonEncryptionKey");
    if (v8 && v9)
    {
      if (CFEqual(v8, v9))
        goto LABEL_14;
    }
    else if (v8 == v9)
    {
LABEL_14:
      v10 = 1;
      if (!v3)
        goto LABEL_21;
LABEL_20:
      CFRelease(v3);
      goto LABEL_21;
    }
  }
  v11 = sub_10000EF14("SecError");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "circleChange: No extant octagon encryption key", v14, 2u);
  }

  v10 = 0;
  if (v3)
    goto LABEL_20;
LABEL_21:
  if (v8)
    CFRelease(v8);
  return v5 & v10;
}

- (void)ensureOctagonPeerKeys:(id)a3
{
  id v4;
  __SecKey *v5;
  const void *v6;
  NSObject *v7;
  const void *v8;
  NSObject *v9;
  __SecKey *cachedOctagonSigningKey;
  __SecKey *v11;
  CFErrorDomain Domain;
  CFErrorDomain v13;
  const __CFString *v14;
  NSString *v15;
  void *v16;
  __SecKey *v17;
  BOOL v18;
  int v19;
  const void *v20;
  NSObject *v21;
  const char *v22;
  const void *v23;
  NSObject *v24;
  void *v25;
  CFErrorRef v26;
  CFErrorRef v27;
  __SecKey *v28;
  const void *v29;
  NSObject *v30;
  const void *v31;
  NSObject *v32;
  __SecKey *cachedOctagonEncryptionKey;
  __SecKey *v34;
  CFErrorDomain v35;
  CFErrorDomain v36;
  CFErrorDomain v37;
  const void *v38;
  NSObject *v39;
  uint32_t v40;
  CFTypeRef v41;
  NSString *v42;
  uint64_t v43;
  __SecKey *v44;
  const void *v45;
  NSObject *v46;
  const char *v47;
  NSObject *v48;
  uint32_t v49;
  const void *v50;
  NSObject *v51;
  void *v52;
  const void *v53;
  const void *v54;
  const void *v55;
  CFTypeRef v56;
  CFErrorRef v57;
  _QWORD v58[5];
  CFTypeRef cf;
  CFErrorRef err;
  uint8_t buf[4];
  void *v62;

  v4 = a3;
  if (-[SOSAccountTrustClassic haveConfirmedOctagonKeys](self, "haveConfirmedOctagonKeys"))
    goto LABEL_118;
  err = 0;
  v5 = (__SecKey *)SOSFullPeerInfoCopyOctagonSigningKey(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), &err);
  if (err && !-[SOSAccountTrustClassic isLockedError:](self, "isLockedError:"))
  {
    v6 = sub_10000EF14("SecError");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v62 = err;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "circleChange: Error fetching Octagon signing key: %@", buf, 0xCu);
    }

  }
  if (v5)
  {
    v8 = sub_10000EF14("circleChange");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Already have Octagon signing key", buf, 2u);
    }

    cachedOctagonSigningKey = self->super._cachedOctagonSigningKey;
    if (cachedOctagonSigningKey)
    {
      self->super._cachedOctagonSigningKey = 0;
      CFRelease(cachedOctagonSigningKey);
    }
    v11 = SecKeyCopyPublicKey(v5);
    self->super._cachedOctagonSigningKey = v11;
    sub_100212BFC((uint64_t)v11, kSOSInternalAccessGroup);
LABEL_47:
    v19 = 0;
    v16 = 0;
    goto LABEL_48;
  }
  if (!err)
    goto LABEL_42;
  Domain = CFErrorGetDomain(err);
  if (Domain && kCFErrorDomainOSStatus)
  {
    if (!CFEqual(Domain, kCFErrorDomainOSStatus))
      goto LABEL_20;
  }
  else if (Domain != kCFErrorDomainOSStatus)
  {
    goto LABEL_20;
  }
  if (CFErrorGetCode(err) == -25300)
    goto LABEL_32;
LABEL_20:
  v13 = CFErrorGetDomain(err);
  if (kCFErrorDomainOSStatus && v13)
  {
    if (!CFEqual(v13, kCFErrorDomainOSStatus))
      goto LABEL_26;
  }
  else if (v13 != kCFErrorDomainOSStatus)
  {
    goto LABEL_26;
  }
  if (CFErrorGetCode(err) == -26275)
    goto LABEL_32;
LABEL_26:
  v14 = CFErrorGetDomain(err);
  if (!kCFErrorDomainOSStatus || !v14)
  {
    if (v14 == kCFErrorDomainOSStatus)
      goto LABEL_31;
LABEL_42:
    if (!-[SOSAccountTrustClassic isLockedError:](self, "isLockedError:", err))
    {
      v23 = sub_10000EF14("SecError");
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v62 = err;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "error is too scary, not creating new Octagon signing key: %@", buf, 0xCu);
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[SOSAnalytics logger](SOSAnalytics, "logger"));
      objc_msgSend(v25, "logResultForEvent:hardFailure:result:", CFSTR("SOSCheckOctagonSigningKey"), 1, err);

    }
    v5 = 0;
    goto LABEL_47;
  }
  if (!CFEqual(v14, kCFErrorDomainOSStatus))
    goto LABEL_42;
LABEL_31:
  if (CFErrorGetCode(err) != -50)
    goto LABEL_42;
LABEL_32:
  v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Octagon Peer Signing ID for %@"), SOSCircleGetName(-[SOSAccountTrust trustedCircle](self, "trustedCircle")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  cf = 0;
  v17 = -[SOSAccountTrustClassic randomPermanentFullECKey:name:error:](self, "randomPermanentFullECKey:name:error:", 384, v16, &cf);
  v5 = v17;
  if (cf)
    v18 = 1;
  else
    v18 = v17 == 0;
  v19 = !v18;
  if (v18)
  {
    v38 = sub_10000EF14("SecError");
    v21 = objc_claimAutoreleasedReturnValue(v38);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_86;
    *(_DWORD *)buf = 138412290;
    v62 = (void *)cf;
    v22 = "circleChange: Error creating Octagon signing key: %@";
    goto LABEL_84;
  }
  SOSFullPeerInfoUpdateOctagonSigningKey(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), v17, &cf);
  if (cf)
  {
    v20 = sub_10000EF14("SecError");
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_86;
    *(_DWORD *)buf = 138412290;
    v62 = (void *)cf;
    v22 = "circleChange: Error upgrading Octagon signing key: %@";
LABEL_84:
    v39 = v21;
    v40 = 12;
LABEL_85:
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, v22, buf, v40);
    goto LABEL_86;
  }
  v54 = sub_10000EF14("circleChange");
  v21 = objc_claimAutoreleasedReturnValue(v54);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v22 = "Successfully created new Octagon signing key";
    v39 = v21;
    v40 = 2;
    goto LABEL_85;
  }
LABEL_86:

  v41 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v41);
  }
LABEL_48:
  v26 = err;
  if (err)
  {
    err = 0;
    CFRelease(v26);
  }
  if (v5)
    CFRelease(v5);
  v27 = err;
  if (err)
  {
    err = 0;
    CFRelease(v27);
  }
  v28 = (__SecKey *)SOSFullPeerInfoCopyOctagonEncryptionKey(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), &err);
  if (err && !-[SOSAccountTrustClassic isLockedError:](self, "isLockedError:"))
  {
    v29 = sub_10000EF14("SecError");
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v62 = err;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "circleChange: Error fetching Octagon encryption key: %@", buf, 0xCu);
    }

  }
  if (!v28)
  {
    if (!err)
      goto LABEL_95;
    v35 = CFErrorGetDomain(err);
    if (v35 && kCFErrorDomainOSStatus)
    {
      if (!CFEqual(v35, kCFErrorDomainOSStatus))
      {
LABEL_72:
        v36 = CFErrorGetDomain(err);
        if (kCFErrorDomainOSStatus && v36)
        {
          if (!CFEqual(v36, kCFErrorDomainOSStatus))
          {
LABEL_78:
            v37 = CFErrorGetDomain(err);
            if (kCFErrorDomainOSStatus && v37)
            {
              if (!CFEqual(v37, kCFErrorDomainOSStatus))
                goto LABEL_95;
            }
            else if (v37 != kCFErrorDomainOSStatus)
            {
              goto LABEL_95;
            }
            if (CFErrorGetCode(err) == -50)
              goto LABEL_90;
LABEL_95:
            if (!-[SOSAccountTrustClassic isLockedError:](self, "isLockedError:", err))
            {
              v50 = sub_10000EF14("SecError");
              v51 = objc_claimAutoreleasedReturnValue(v50);
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v62 = err;
                _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "error is too scary, not creating new Octagon encryption key: %@", buf, 0xCu);
              }

              v52 = (void *)objc_claimAutoreleasedReturnValue(+[SOSAnalytics logger](SOSAnalytics, "logger"));
              objc_msgSend(v52, "logResultForEvent:hardFailure:result:", CFSTR("SOSCheckOctagonEncryptionKey"), 1, err);

            }
            v28 = 0;
            goto LABEL_111;
          }
        }
        else if (v36 != kCFErrorDomainOSStatus)
        {
          goto LABEL_78;
        }
        if (CFErrorGetCode(err) != -26275)
          goto LABEL_78;
LABEL_90:
        v42 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Octagon Peer Encryption ID for %@"), SOSCircleGetName(-[SOSAccountTrust trustedCircle](self, "trustedCircle")));
        v43 = objc_claimAutoreleasedReturnValue(v42);

        cf = 0;
        v44 = -[SOSAccountTrustClassic randomPermanentFullECKey:name:error:](self, "randomPermanentFullECKey:name:error:", 384, v43, &cf);
        v28 = v44;
        if (cf || !v44)
        {
          v53 = sub_10000EF14("SecError");
          v46 = objc_claimAutoreleasedReturnValue(v53);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v62 = (void *)cf;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "circleChange: Error creating Octagon encryption key: %@", buf, 0xCu);
          }
          goto LABEL_108;
        }
        SOSFullPeerInfoUpdateOctagonEncryptionKey(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), v44, &cf);
        if (cf)
        {
          v45 = sub_10000EF14("SecError");
          v46 = objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v62 = (void *)cf;
            v47 = "circleChange: Error upgrading Octagon encryption key: %@";
            v48 = v46;
            v49 = 12;
LABEL_106:
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, v47, buf, v49);
          }
        }
        else
        {
          v55 = sub_10000EF14("circleChange");
          v46 = objc_claimAutoreleasedReturnValue(v55);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v47 = "Successfully created new Octagon encryption key";
            v48 = v46;
            v49 = 2;
            goto LABEL_106;
          }
        }
        v19 = 1;
LABEL_108:

        v56 = cf;
        if (cf)
        {
          cf = 0;
          CFRelease(v56);
        }
        v16 = (void *)v43;
        goto LABEL_111;
      }
    }
    else if (v35 != kCFErrorDomainOSStatus)
    {
      goto LABEL_72;
    }
    if (CFErrorGetCode(err) == -25300)
      goto LABEL_90;
    goto LABEL_72;
  }
  v31 = sub_10000EF14("circleChange");
  v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Already have Octagon encryption key", buf, 2u);
  }

  cachedOctagonEncryptionKey = self->super._cachedOctagonEncryptionKey;
  if (cachedOctagonEncryptionKey)
  {
    self->super._cachedOctagonEncryptionKey = 0;
    CFRelease(cachedOctagonEncryptionKey);
  }
  v34 = SecKeyCopyPublicKey(v28);
  self->super._cachedOctagonEncryptionKey = v34;
  sub_100212BFC((uint64_t)v34, kSOSInternalAccessGroup);
LABEL_111:
  v57 = err;
  if (err)
  {
    err = 0;
    CFRelease(v57);
  }
  if (v28)
    CFRelease(v28);
  if (v19)
  {
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100219070;
    v58[3] = &unk_1002EDB08;
    v58[4] = self;
    -[SOSAccountTrustClassic modifyCircle:err:action:](self, "modifyCircle:err:action:", v4, 0, v58);
  }

LABEL_118:
}

- (BOOL)ensureFullPeerAvailable:(id)a3 err:(__CFError *)a4
{
  id v6;
  const void *v7;
  NSObject *v8;
  __OpaqueSOSFullPeerInfo *fullPeerInfo;
  __OpaqueSOSPeerInfo *peerInfo;
  __SecKey *cachedOctagonSigningKey;
  __SecKey *cachedOctagonEncryptionKey;
  uint64_t Name;
  void *v14;
  uint64_t v15;
  CFStringRef v16;
  void *v17;
  __SecKey *v18;
  __SecKey *v19;
  uint64_t v20;
  __SecKey *v21;
  __SecKey *v22;
  _BOOL4 v23;
  _BOOL4 v24;
  BOOL v25;
  const __CFSet *v26;
  const __CFSet *v27;
  uint64_t v28;
  const __CFSet *v29;
  const __CFSet *v30;
  const __CFSet *v31;
  void *v32;
  void *v33;
  const void *v34;
  const void *v35;
  const void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  const void *v40;
  NSObject *v41;
  _BOOL4 v42;
  void *v43;
  BOOL v44;
  CFIndex Count;
  const __CFSet *cf;
  const __CFString *v48;
  CFTypeRef v49;
  CFSetRef theSet;
  uint64_t v51;
  void *v52;
  __CFError **v53;
  __SecKey *v54;
  __int128 buf;
  void (*v56)(uint64_t, const void *);
  void *v57;
  const __CFSet *v58;

  v6 = a3;
  if (!-[SOSAccountTrust trustedCircle](self, "trustedCircle"))
  {
    SOSCreateErrorWithFormat(1037, 0, a4, 0, CFSTR("Don't have circle"));
    goto LABEL_64;
  }
  if (!-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo")
    || (SOSFullPeerInfoPrivKeyExists(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo")) & 1) == 0)
  {
    if (-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"))
    {
      v7 = sub_10000EF14("circleOps");
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FullPeerInfo has no matching private key - resetting FPI and attendant keys", (uint8_t *)&buf, 2u);
      }

      fullPeerInfo = self->super.fullPeerInfo;
      if (fullPeerInfo)
      {
        self->super.fullPeerInfo = 0;
        CFRelease(fullPeerInfo);
      }
      peerInfo = self->super.peerInfo;
      if (peerInfo)
      {
        self->super.peerInfo = 0;
        CFRelease(peerInfo);
      }
      cachedOctagonSigningKey = self->super._cachedOctagonSigningKey;
      if (cachedOctagonSigningKey)
      {
        self->super._cachedOctagonSigningKey = 0;
        CFRelease(cachedOctagonSigningKey);
      }
      cachedOctagonEncryptionKey = self->super._cachedOctagonEncryptionKey;
      if (cachedOctagonEncryptionKey)
      {
        self->super._cachedOctagonEncryptionKey = 0;
        CFRelease(cachedOctagonEncryptionKey);
      }
    }
    v53 = a4;
    Name = SOSCircleGetName(-[SOSAccountTrust trustedCircle](self, "trustedCircle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "gestalt"));
    v15 = SOSPeerGestaltGetName(v14);
    v16 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("ID for %@-%@"), v15, Name);

    v54 = -[SOSAccountTrustClassic randomPermanentFullECKey:name:error:](self, "randomPermanentFullECKey:name:error:", 256, v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Octagon Peer Signing "), "stringByAppendingString:", v16));
    if (objc_msgSend(v6, "octagonSigningFullKeyRef"))
    {
      v18 = (__SecKey *)objc_msgSend(v6, "octagonSigningFullKeyRef");
      v19 = v18;
      if (v18)
        CFRetain(v18);
    }
    else
    {
      v19 = -[SOSAccountTrustClassic randomPermanentFullECKey:name:error:](self, "randomPermanentFullECKey:name:error:", 384, v17, 0);
    }
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Octagon Peer Encryption "), "stringByAppendingString:", v16));

    v52 = (void *)v20;
    if (objc_msgSend(v6, "octagonEncryptionFullKeyRef"))
    {
      v21 = (__SecKey *)objc_msgSend(v6, "octagonEncryptionFullKeyRef");
      v22 = v21;
      if (!v21)
      {
        v25 = 0;
        v23 = v54 != 0;
        v24 = v19 != 0;
        goto LABEL_50;
      }
      v51 = Name;
      CFRetain(v21);
    }
    else
    {
      v51 = Name;
      v22 = -[SOSAccountTrustClassic randomPermanentFullECKey:name:error:](self, "randomPermanentFullECKey:name:error:", 384, v20, 0);
    }
    v23 = v54 != 0;
    v24 = v19 != 0;
    v25 = v22 != 0;
    if (v54 && v19 && v22)
    {
      v48 = v16;
      v26 = (const __CFSet *)SOSViewCopyViewSet(2);
      v27 = (const __CFSet *)SOSViewCopyViewSet(3);
      v28 = SOSViewCopyViewSet(1);
      v29 = (const __CFSet *)SOSViewCopyViewSet(5);
      *(_QWORD *)&buf = _NSConcreteStackBlock;
      *((_QWORD *)&buf + 1) = 3221225472;
      v56 = sub_100219054;
      v57 = &unk_1002EDB28;
      v49 = (CFTypeRef)v28;
      theSet = v27;
      v58 = v27;
      v30 = (const __CFSet *)v28;
      v31 = v26;
      CFSetApplyFunction(v30, (CFSetApplierFunction)sub_10021905C, &buf);
      Count = CFSetGetCount(v26);
      if (!Count)
      {
        *(_QWORD *)&buf = _NSConcreteStackBlock;
        *((_QWORD *)&buf + 1) = 3221225472;
        v56 = sub_100219054;
        v57 = &unk_1002EDB28;
        v58 = v26;
        CFSetApplyFunction(v27, (CFSetApplierFunction)sub_10021905C, &buf);
      }
      *(_QWORD *)&buf = _NSConcreteStackBlock;
      *((_QWORD *)&buf + 1) = 3221225472;
      v56 = sub_100219054;
      v57 = &unk_1002EDB28;
      v58 = v26;
      cf = v29;
      CFSetApplyFunction(v29, (CFSetApplierFunction)sub_10021905C, &buf);
      -[SOSAccountTrust setFullPeerInfo:](self, "setFullPeerInfo:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "gestalt"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "backup_key"));
      v34 = (const void *)SOSFullPeerInfoCreateWithViews(kCFAllocatorDefault, v51, v32, v33, v26, v54, v19, v22, v53);

      -[SOSAccountTrust setFullPeerInfo:](self, "setFullPeerInfo:", v34);
      v35 = (const void *)SOSFullPeerInfoCopyPubKey(v34, 0);
      objc_msgSend(v6, "setPeerPublicKey:", v35);
      if (v35)
        CFRelease(v35);
      v16 = v48;
      if (!objc_msgSend(v6, "peerPublicKey"))
      {
        v36 = sub_10000EF14("circleOp");
        v37 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Failed to copy peer public key for account object", (uint8_t *)&buf, 2u);
        }

      }
      if (v34)
        CFRelease(v34);
      v38 = -[SOSAccountTrustClassic getValueFromExpansion:err:](self, "getValueFromExpansion:err:", CFSTR("v2dictionary"), 0);
      v39 = v52;
      if (v38)
        SOSFullPeerInfoUpdateV2Dictionary(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), v38, 0);
      if (Count)
      {
        -[SOSAccountTrustClassic pendEnableViewSet:](self, "pendEnableViewSet:", theSet);
        -[SOSAccountTrustClassic setValueInExpansion:value:err:](self, "setValueInExpansion:value:err:", CFSTR("unsynced"), kCFBooleanTrue, 0);
      }
      if (v31)
        CFRelease(v31);
      if (cf)
        CFRelease(cf);
      if (theSet)
        CFRelease(theSet);
      if (v49)
        CFRelease(v49);
      CFRelease(v54);
      CFRelease(v19);
      goto LABEL_60;
    }
LABEL_50:
    v40 = sub_10000EF14("SecError");
    v41 = objc_claimAutoreleasedReturnValue(v40);
    v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
    v43 = v53;
    if (v42)
    {
      if (v53)
        v43 = *v53;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v43;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "No full_key: %@:", (uint8_t *)&buf, 0xCu);
    }

    if (v23)
    {
      CFRelease(v54);
      if (!v24)
      {
LABEL_59:
        v39 = v52;
        if (!v25)
        {
LABEL_61:
          if (v16)
            CFRelease(v16);

          goto LABEL_64;
        }
LABEL_60:
        CFRelease(v22);
        goto LABEL_61;
      }
    }
    else if (!v24)
    {
      goto LABEL_59;
    }
    CFRelease(v19);
    goto LABEL_59;
  }
LABEL_64:
  v44 = -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo") != 0;

  return v44;
}

- (BOOL)isMyPeerActive:(__CFError *)a3
{
  __OpaqueSOSPeerInfo *v5;

  v5 = -[SOSAccountTrust peerInfo](self, "peerInfo");
  if (v5)
    LOBYTE(v5) = SOSCircleHasActivePeer(-[SOSAccountTrust trustedCircle](self, "trustedCircle"), -[SOSAccountTrust peerInfo](self, "peerInfo"), a3);
  return (char)v5;
}

- (void)purgeIdentity
{
  const void *v3;
  NSObject *v4;
  __OpaqueSOSFullPeerInfo *v5;
  CFTypeRef v6;
  CFTypeRef cf;
  uint8_t buf[4];
  __OpaqueSOSFullPeerInfo *v9;
  __int16 v10;
  CFTypeRef v11;

  if (-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"))
  {
    cf = 0;
    if ((SOSFullPeerInfoPurgePersistentKey(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"), &cf) & 1) == 0)
    {
      v3 = sub_10000EF14("SecWarning");
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = -[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo");
        *(_DWORD *)buf = 138412546;
        v9 = v5;
        v10 = 2112;
        v11 = cf;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Couldn't purge persistent keys for %@ [%@]", buf, 0x16u);
      }

    }
    v6 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v6);
    }
    -[SOSAccountTrust setFullPeerInfo:](self, "setFullPeerInfo:", 0);
  }
}

@end
