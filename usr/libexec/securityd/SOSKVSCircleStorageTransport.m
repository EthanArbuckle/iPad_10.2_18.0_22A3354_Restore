@implementation SOSKVSCircleStorageTransport

- (SOSKVSCircleStorageTransport)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SOSKVSCircleStorageTransport;
  return -[SOSCircleStorageTransport init](&v3, "init");
}

- (SOSKVSCircleStorageTransport)initWithAccount:(id)a3 andCircleName:(id)a4
{
  id v6;
  id v7;
  SOSKVSCircleStorageTransport *v8;
  void *v9;
  id v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SOSKVSCircleStorageTransport;
  v8 = -[SOSCircleStorageTransport init](&v12, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[SOSKVSCircleStorageTransport setPending_changes:](v8, "setPending_changes:", v9);

    v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithString:", v7);
    -[SOSKVSCircleStorageTransport setCircleName:](v8, "setCircleName:", v10);

    -[SOSCircleStorageTransport setAccount:](v8, "setAccount:", v6);
    sub_1001F33A8(v8);
  }

  return v8;
}

- (int64_t)getTransportType
{
  return 1;
}

- (BOOL)kvsSendPendingChanges:(__CFError *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  const __CFString *v8;
  CFNullRef v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = objc_claimAutoreleasedReturnValue(-[SOSKVSCircleStorageTransport pending_changes](self, "pending_changes", a3));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SOSKVSCircleStorageTransport pending_changes](self, "pending_changes"));
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = sub_1001CDAF8(self->super.account);
      if (v8)
        v9 = (CFNullRef)v8;
      else
        v9 = kCFNull;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SOSKVSCircleStorageTransport pending_changes](self, "pending_changes"));
      objc_msgSend(v10, "setObject:forKey:", v9, kSOSKVSRequiredKey);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SOSKVSCircleStorageTransport pending_changes](self, "pending_changes"));
      sub_1001FA174((uint64_t)v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SOSKVSCircleStorageTransport pending_changes](self, "pending_changes"));
      objc_msgSend(v12, "removeAllObjects");

    }
  }
  return 1;
}

- (void)kvsAddToPendingChanges:(__CFString *)a3 data:(__CFData *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SOSKVSCircleStorageTransport pending_changes](self, "pending_changes"));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[SOSKVSCircleStorageTransport setPending_changes:](self, "setPending_changes:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SOSKVSCircleStorageTransport pending_changes](self, "pending_changes"));
  v11 = v9;
  if (a4)
  {
    objc_msgSend(v9, "setObject:forKey:", a4, a3);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v11, "setObject:forKey:", v10, a3);

  }
}

- (BOOL)expireRetirementRecords:(__CFDictionary *)a3 err:(__CFError *)a4
{
  const __CFDictionary *Mutable;
  _QWORD context[5];

  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  context[0] = _NSConcreteStackBlock;
  context[1] = 3221225472;
  context[2] = sub_1001FA8C8;
  context[3] = &unk_1002ECD08;
  context[4] = Mutable;
  CFDictionaryApplyFunction(a3, (CFDictionaryApplierFunction)sub_1001FA8B0, context);
  if (CFDictionaryGetCount(Mutable))
    sub_1001FA174((uint64_t)Mutable);
  if (Mutable)
    CFRelease(Mutable);
  return 1;
}

- (BOOL)flushChanges:(__CFError *)a3
{
  return -[SOSKVSCircleStorageTransport kvsSendPendingChanges:](self, "kvsSendPendingChanges:", a3);
}

- (BOOL)postCircle:(__CFString *)a3 circleData:(__CFData *)a4 err:(__CFError *)a5
{
  uint64_t v7;
  const void *v8;

  v7 = SOSCircleKeyCreateWithName(a3, a5);
  if (v7)
  {
    v8 = (const void *)v7;
    -[SOSKVSCircleStorageTransport kvsAddToPendingChanges:data:](self, "kvsAddToPendingChanges:data:", v7, a4);
    CFRelease(v8);
  }
  return 1;
}

- (__CFDictionary)handleRetirementMessages:(__CFDictionary *)a3 err:(__CFError *)a4
{
  id v6;
  void *v7;
  const void *Name;
  const __CFArray *Mutable;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  const __CFDictionary *Value;
  const __CFDictionary *v18;
  CFTypeID v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  CFDictionaryRef v33;
  __CFDictionary *v34;
  uint64_t v36;
  _QWORD context[4];
  id v38;
  id v39;
  __CFError **v40;
  const __CFArray *v41;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[SOSCircleStorageTransport account](self, "account"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trust"));
  Name = (const void *)SOSCircleGetName(objc_msgSend(v7, "trustedCircle"));
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (objc_msgSend(v7, "trustedCircle")
    && (Value = (const __CFDictionary *)CFDictionaryGetValue(a3, Name)) != 0
    && (v18 = Value, v19 = CFGetTypeID(Value), v19 == CFDictionaryGetTypeID()))
  {
    context[0] = _NSConcreteStackBlock;
    context[1] = 3221225472;
    context[2] = sub_1001DEC38;
    context[3] = &unk_1002EBD68;
    v40 = a4;
    v20 = v7;
    v38 = v20;
    v21 = v6;
    v39 = v21;
    v41 = Mutable;
    CFDictionaryApplyFunction(v18, (CFDictionaryApplierFunction)sub_1001DE4BC, context);
    v22 = objc_msgSend(v21, "peerInfo");
    if (v22)
    {
      v23 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "retirees"));
      LODWORD(v23) = objc_msgSend(v24, "containsObject:", v23);

      if ((_DWORD)v23)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trust"));
        objc_msgSend(v25, "purgeIdentity");

        objc_msgSend(v20, "setDepartureCode:", 6);
      }
    }
    if (CFArrayGetCount(Mutable))
      v33 = sub_10012E96C(kCFAllocatorDefault, v26, v27, v28, v29, v30, v31, v32, (uint64_t)Name, (uint64_t)Mutable);
    else
      v33 = sub_10012E96C(kCFAllocatorDefault, v26, v27, v28, v29, v30, v31, v32, 0, v36);
    v34 = v33;
    if (Mutable)
      CFRelease(Mutable);

  }
  else
  {
    v34 = sub_10012E96C(kCFAllocatorDefault, v10, v11, v12, v13, v14, v15, v16, 0, v36);
  }

  return v34;
}

- (__CFArray)handleCircleMessagesAndReturnHandledCopy:(__CFDictionary *)a3 err:(__CFError *)a4
{
  __CFArray *Mutable;
  _QWORD v8[6];

  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001FA310;
  v8[3] = &unk_1002EDA28;
  v8[4] = self;
  v8[5] = Mutable;
  CFDictionaryApplyFunction(a3, (CFDictionaryApplierFunction)sub_1001FA8B0, v8);
  return Mutable;
}

- (BOOL)kvsAppendKeyInterest:(__CFArray *)a3 firstUnlock:(__CFArray *)a4 unlocked:(__CFArray *)a5 err:(__CFError *)a6
{
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  const void *v14;
  SOSAccount *account;
  void *v16;
  id v17;
  id v18;
  const void *Name;
  _QWORD v21[6];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SOSCircleStorageTransport account](self, "account", a3, a4));
  v11 = sub_1001D7408(v10, 0);

  if (!v11)
    goto LABEL_9;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SOSKVSCircleStorageTransport circleName](self, "circleName"));

  if (!v12)
    goto LABEL_12;
  v13 = SOSCircleKeyCreateWithName(v12, a6);
  if (v13)
  {
    v14 = (const void *)v13;
    account = self->super.account;
    if (account)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](account, "trust"));
      v17 = objc_msgSend(v16, "trustedCircle");
      if (v17)
      {
        v18 = v17;
        Name = (const void *)SOSCircleGetName(v17);
        if (Name)
        {
          if (CFEqual(v12, Name))
          {
            v21[0] = _NSConcreteStackBlock;
            v21[1] = 3221225472;
            v21[2] = sub_1001FA2B8;
            v21[3] = &unk_1002ECBC8;
            v21[4] = v12;
            v21[5] = a3;
            SOSCircleForEachActivePeer(v18, v21);
            CFArrayAppendValue(a5, v14);
            CFRelease(v14);

LABEL_9:
            LOBYTE(v13) = 1;
            return v13;
          }
        }
      }

    }
    CFRelease(v14);
LABEL_12:
    LOBYTE(v13) = 0;
  }
  return v13;
}

- (BOOL)kvsAppendRingKeyInterest:(__CFArray *)a3 firstUnlock:(__CFArray *)a4 unlocked:(__CFArray *)a5 err:(__CFError *)a6
{
  void *v8;
  id v9;
  SOSAccount *account;
  void *v11;
  SOSAccount *v12;
  _QWORD *v13;
  const __CFSet *v14;
  _QWORD *v15;
  _QWORD v17[2];
  void (*v18)(uint64_t, uint64_t);
  void *v19;
  __CFArray *v20;
  _QWORD context[4];
  id v22;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SOSCircleStorageTransport account](self, "account", a3, a4, a5, a6));
  v9 = sub_1001D7408(v8, 0);

  if (!v9)
  {
LABEL_9:
    LOBYTE(account) = 1;
    return (char)account;
  }
  account = self->super.account;
  if (account)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](account, "trust"));
    if (objc_msgSend(v11, "trustedCircle"))
    {
      v12 = self->super.account;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v18 = sub_1001FA270;
      v19 = &unk_1002ECDD0;
      v20 = a5;
      v13 = v17;
      if (-[SOSAccount peerInfo](v12, "peerInfo"))
      {
        v14 = (const __CFSet *)SOSViewCopyViewSet(0);
        context[0] = _NSConcreteStackBlock;
        context[1] = 3221225472;
        context[2] = sub_1001D2928;
        context[3] = &unk_1002EB9C8;
        v15 = v13;
        v22 = v15;
        CFSetApplyFunction(v14, (CFSetApplierFunction)sub_1001D2914, context);
        if (v14)
          CFRelease(v14);
        v18((uint64_t)v15, (uint64_t)CFSTR("RecoveryRing"));

      }
      goto LABEL_9;
    }

    LOBYTE(account) = 0;
  }
  return (char)account;
}

- (BOOL)kvsAppendDebugKeyInterest:(__CFArray *)a3 firstUnlock:(__CFArray *)a4 unlocked:(__CFArray *)a5 err:(__CFError *)a6
{
  const void *v7;

  v7 = (const void *)SOSDebugInfoKeyCreateWithTypeName(CFSTR("Scope"), a2, a3, a4, a5, a6);
  CFArrayAppendValue(a3, v7);
  if (v7)
    CFRelease(v7);
  return 1;
}

- (BOOL)kvssendDebugInfo:(__CFString *)a3 debug:(void *)a4 err:(__CFError *)a5
{
  const void *v6;
  void *v7;
  const void *v9;
  void *v10;

  v6 = (const void *)SOSDebugInfoKeyCreateWithTypeName(a3, a2, a3, a4, a5);
  v9 = v6;
  v10 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  if (v6)
    CFRelease(v6);
  sub_1001FA174((uint64_t)v7);

  return 1;
}

- (BOOL)kvsRingPostRing:(__CFString *)a3 ring:(__CFData *)a4 err:(__CFError *)a5
{
  uint64_t v7;
  const void *v8;

  v7 = SOSRingKeyCreateWithName(a3, a5);
  if (v7)
  {
    v8 = (const void *)v7;
    -[SOSKVSCircleStorageTransport kvsAddToPendingChanges:data:](self, "kvsAddToPendingChanges:data:", v7, a4);
    CFRelease(v8);
  }
  return 1;
}

- (BOOL)kvsRingFlushChanges:(__CFError *)a3
{
  return -[SOSKVSCircleStorageTransport kvsSendPendingChanges:](self, "kvsSendPendingChanges:", a3);
}

- (BOOL)kvsSendOfficialDSID:(__CFString *)a3 err:(__CFError *)a4
{
  CFDataRef ExternalRepresentation;

  if (a3)
  {
    ExternalRepresentation = CFStringCreateExternalRepresentation(kCFAllocatorDefault, a3, 0x8000100u, 0x3Fu);
    -[SOSKVSCircleStorageTransport kvsAddToPendingChanges:data:](self, "kvsAddToPendingChanges:data:", kSOSKVSOfficialDSIDKey, ExternalRepresentation);
    if (ExternalRepresentation)
      CFRelease(ExternalRepresentation);
  }
  return 1;
}

- (BOOL)postRetirement:(__CFString *)a3 peer:(__OpaqueSOSPeerInfo *)a4 err:(__CFError *)a5
{
  uint64_t v7;
  const void *v8;
  void *v9;
  const void *v10;

  v7 = SOSPeerInfoCopyEncodedData(a4, kCFAllocatorDefault, a5);
  if (v7)
  {
    v8 = (const void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SOSKVSCircleStorageTransport circleName](self, "circleName"));
    SOSPeerInfoGetPeerID(a4);
    v10 = (const void *)SOSRetirementKeyCreateWithCircleNameAndPeer(v9);

    if (v10)
    {
      -[SOSKVSCircleStorageTransport kvsAddToPendingChanges:data:](self, "kvsAddToPendingChanges:data:", v10, v8);
      CFRelease(v10);
    }
    CFRelease(v8);
  }
  return 1;
}

- (NSMutableDictionary)pending_changes
{
  return self->pending_changes;
}

- (void)setPending_changes:(id)a3
{
  objc_storeStrong((id *)&self->pending_changes, a3);
}

- (NSString)circleName
{
  return self->circleName;
}

- (void)setCircleName:(id)a3
{
  objc_storeStrong((id *)&self->circleName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->circleName, 0);
  objc_storeStrong((id *)&self->pending_changes, 0);
}

@end
