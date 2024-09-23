@implementation SOSMessageKVS

- (SOSMessageKVS)initWithAccount:(id)a3 andName:(id)a4
{
  id v6;
  id v7;
  SOSMessageKVS *v8;
  SOSMessageKVS *v9;
  id v10;
  uint64_t (**v11)(id, void *, _QWORD);
  void *v12;
  uint64_t v13;
  const void *v14;
  SOSMessageKVS *v15;
  __CFArray *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SOSMessageKVS;
  v8 = -[SOSMessageKVS init](&v18, "init");
  v9 = v8;
  if (v8)
  {
    -[SOSMessage setAccount:](v8, "setAccount:", v6);
    v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithString:", v7);
    -[SOSMessage setCircleName:](v9, "setCircleName:", v10);

    v11 = (uint64_t (**)(id, void *, _QWORD))objc_msgSend(v6, "factory");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SOSMessage circleName](v9, "circleName"));
    if (v11 && (v13 = v11[1](v11, v12, 0)) != 0)
    {
      v14 = *(const void **)v13;
      (*(void (**)(uint64_t, _QWORD))(v13 + 72))(v13, 0);

      if (v14)
        CFRetain(v14);
    }
    else
    {

      v14 = 0;
    }
    -[SOSMessage setEngine:](v9, "setEngine:", v14);
    v9->_pending_changes = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v15 = v9;
    v16 = (__CFArray *)sub_1001F30F8();
    CFArrayAppendValue(v16, v15);

  }
  return v9;
}

- (void)dealloc
{
  __CFDictionary *pending_changes;
  objc_super v4;

  pending_changes = self->_pending_changes;
  if (pending_changes)
  {
    self->_pending_changes = 0;
    CFRelease(pending_changes);
  }
  v4.receiver = self;
  v4.super_class = (Class)SOSMessageKVS;
  -[SOSMessage dealloc](&v4, "dealloc");
}

- (int64_t)SOSTransportMessageGetTransportType
{
  return 1;
}

- (__CFString)SOSTransportMessageGetCircleName
{
  __CFString *v2;

  v2 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SOSMessage circleName](self, "circleName"));

  return v2;
}

- (void)SOSTransportMessageGetEngine
{
  void *v3;
  uint64_t (**v4)(id, void *, _QWORD);
  void *v5;
  uint64_t v6;
  const void *v7;

  if (!-[SOSMessage engine](self, "engine"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSMessage account](self, "account"));
    v4 = (uint64_t (**)(id, void *, _QWORD))objc_msgSend(v3, "factory");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSMessage circleName](self, "circleName"));
    if (v4 && (v6 = v4[1](v4, v5, 0)) != 0)
    {
      v7 = *(const void **)v6;
      (*(void (**)(uint64_t, _QWORD))(v6 + 72))(v6, 0);

      if (v7)
        CFRetain(v7);
    }
    else
    {

      v7 = 0;
    }
    -[SOSMessage setEngine:](self, "setEngine:", v7);
  }
  return -[SOSMessage engine](self, "engine");
}

- (BOOL)SOSTransportMessageKVSAppendKeyInterest:(id)a3 ak:(__CFArray *)a4 firstUnlock:(__CFArray *)a5 unlocked:(__CFArray *)a6 err:(__CFError *)a7
{
  id v10;
  __OpaqueSOSEngine *v11;
  id v12;
  void *v13;
  uint64_t PeerInfo;
  id v15;
  const __CFArray *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD context[4];
  id v22;
  id v23;
  __CFArray *v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  CFRange v28;

  v10 = a3;
  v11 = -[SOSMessage engine](self, "engine");
  if (v11)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[SOSMessageKVS SOSTransportMessageGetAccount](self, "SOSTransportMessageGetAccount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trust"));
    PeerInfo = SOSFullPeerInfoGetPeerInfo(objc_msgSend(v13, "fullPeerInfo"));
    if (PeerInfo)
      PeerInfo = SOSPeerInfoGetPeerID(PeerInfo);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1001D9954;
    v25[3] = &unk_1002EBAB8;
    v26 = v12;
    v27 = PeerInfo;
    v15 = v12;
    v16 = sub_1001D974C(v15, (uint64_t)a7, v25);

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SOSMessage account](self, "account"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "peerID"));

      context[0] = _NSConcreteStackBlock;
      context[1] = 3221225472;
      context[2] = sub_100217B98;
      context[3] = &unk_1002EDA00;
      v22 = v10;
      v23 = v18;
      v24 = a6;
      v19 = v18;
      v28.length = CFArrayGetCount(v16);
      v28.location = 0;
      CFArrayApplyFunction(v16, v28, (CFArrayApplierFunction)sub_100217768, context);
      CFRelease(v16);

    }
  }

  return v11 != 0;
}

- (int64_t)SOSTransportMessageGetTransportType:(id)a3 err:(__CFError *)a4
{
  return 1;
}

- (BOOL)SOSTransportMessageCleanupAfterPeerMessages:(id)a3 peers:(__CFDictionary *)a4 err:(__CFError *)a5
{
  id v7;
  _QWORD *v8;
  _BOOL4 v9;
  uint64_t v10;
  id v11;
  unsigned __int8 v12;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, CFTypeRef, const void *);
  void *v17;
  id v18;
  uint64_t v19;

  v7 = a3;
  v8 = objc_msgSend(v7, "SOSTransportMessageGetEngine");
  v9 = -[OTSOSActualAdapter sosEnabled]_0();
  v10 = 0;
  if (v8 && v9)
    v10 = v8[10];
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_1002178D4;
  v17 = &unk_1002EDA28;
  v18 = v7;
  v19 = v10;
  v11 = v7;
  CFDictionaryApplyFunction(a4, (CFDictionaryApplierFunction)sub_1002175C0, &v14);
  v12 = objc_msgSend(v11, "SOSTransportMessageFlushChanges:err:", v11, a5, v14, v15, v16, v17);

  return v12;
}

- (__CFDictionary)SOSTransportMessageHandlePeerMessageReturnsHandledCopy:(id)a3 peerMessages:(__CFDictionary *)a4 err:(__CFError *)a5
{
  id v6;
  __CFDictionary *Mutable;
  void *v8;
  const __CFDictionary *Value;
  CFMutableArrayRef v10;
  void *v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, CFTypeRef, const void *);
  void *v16;
  id v17;
  CFMutableArrayRef v18;

  v6 = a3;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "circleName"));
  Value = (const __CFDictionary *)CFDictionaryGetValue(a4, v8);

  v10 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (Value)
  {
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_10021777C;
    v16 = &unk_1002EDA28;
    v17 = v6;
    v18 = v10;
    CFDictionaryApplyFunction(Value, (CFDictionaryApplierFunction)sub_1002175C0, &v13);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "circleName", v13, v14, v15, v16));
  CFDictionaryAddValue(Mutable, v11, v10);

  if (v10)
    CFRelease(v10);

  return Mutable;
}

- (BOOL)SOSTransportMessageSyncWithPeers:(id)a3 p:(__CFSet *)a4 err:(__CFError *)a5
{
  id v7;
  _QWORD context[4];
  id v10;
  uint64_t *v11;
  __CFError **v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  context[0] = _NSConcreteStackBlock;
  context[1] = 3221225472;
  context[2] = sub_100217684;
  context[3] = &unk_1002EDA50;
  v11 = &v13;
  v7 = a3;
  v10 = v7;
  v12 = a5;
  CFSetApplyFunction(a4, (CFSetApplierFunction)sub_100217768, context);
  LOBYTE(a5) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)a5;
}

- (BOOL)SOSTransportMessageSendMessages:(id)a3 pm:(__CFDictionary *)a4 err:(__CFError *)a5
{
  id v7;
  _QWORD context[4];
  id v10;
  _QWORD *v11;
  __CFError **v12;
  _QWORD v13[3];
  char v14;

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 1;
  context[0] = _NSConcreteStackBlock;
  context[1] = 3221225472;
  context[2] = sub_100217454;
  context[3] = &unk_1002EDA78;
  v7 = a3;
  v11 = v13;
  v12 = a5;
  v10 = v7;
  CFDictionaryApplyFunction(a4, (CFDictionaryApplierFunction)sub_1002175C0, context);

  _Block_object_dispose(v13, 8);
  return 1;
}

- (__CFDictionary)pending_changes
{
  return self->_pending_changes;
}

- (void)setPending_changes:(__CFDictionary *)a3
{
  self->_pending_changes = a3;
}

@end
