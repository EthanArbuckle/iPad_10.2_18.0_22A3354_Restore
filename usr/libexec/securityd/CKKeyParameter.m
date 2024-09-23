@implementation CKKeyParameter

- (BOOL)SOSTransportKeyParameterHandleKeyParameterChanges:(id)a3 data:(__CFData *)a4 err:(__CFError *)a5
{
  SOSAccount *v6;
  SOSAccount *v7;
  const void *v8;
  NSObject *v9;
  BOOL v10;
  __SecKey *v11;
  const void *v12;
  NSObject *v13;
  __SecKey *v14;
  const void *v15;
  NSObject *v16;
  const char *v17;
  __SecKey *v18;
  CFTypeRef v19;
  SOSAccount *v20;
  const void *v21;
  NSObject *v22;
  __SecKey *v23;
  __SecKey *v24;
  const void *v25;
  NSObject *v26;
  CFTypeRef v27;
  SOSAccount *v28;
  void *v29;
  const void *v30;
  NSObject *v31;
  void *v32;
  int v33;
  const void *v34;
  const void *v35;
  NSObject *v36;
  _BOOL4 v37;
  const void *v38;
  NSObject *v39;
  CFTypeRef v40;
  CFTypeRef v41;
  __CFError *v43;
  CFTypeRef cf;
  CFTypeRef cf2;
  uint8_t buf[4];
  __SecKey *v47;

  v43 = a5;
  v6 = self->account;
  v7 = v6;
  if (v6)
  {
    if (-[SOSAccount accountIsChanging](v6, "accountIsChanging"))
    {
      v8 = sub_10000EF14("circleOps");
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SOSAccountHandleParametersChange called before signing in to new account", buf, 2u);
      }

      v10 = 1;
      goto LABEL_62;
    }
    cf = 0;
    cf2 = 0;
    if (!sub_1001D4EF4(&cf2, a4, (uint64_t)&cf))
      goto LABEL_17;
LABEL_7:
    sub_1001D3B78((uint64_t)CFSTR("SOSAccountHandleParametersChange got new user key parameters:"), (CFDataRef)cf);
    v11 = (__SecKey *)SOSCopyIDOfKeyWithLength(cf2, 8, 0);
    v12 = sub_10000EF14("circleOps");
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SOSAccountHandleParametersChange got new public key: %@", buf, 0xCu);
    }

    if (v11)
      CFRelease(v11);
    v14 = -[SOSAccount accountKey](v7, "accountKey");
    if (v14 && cf2)
    {
      if (CFEqual(v14, cf2))
        goto LABEL_14;
    }
    else if (v14 == cf2)
    {
LABEL_14:
      v15 = sub_10000EF14("circleOps");
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v17 = "Got same public key sent our way. Ignoring.";
LABEL_45:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
        goto LABEL_46;
      }
      goto LABEL_46;
    }
    v18 = -[SOSAccount previousAccountKey](v7, "previousAccountKey");
    v19 = cf2;
    if (v18 && cf2)
    {
      if (!CFEqual(v18, cf2))
      {
        v19 = cf2;
        goto LABEL_24;
      }
    }
    else if (v18 != cf2)
    {
LABEL_24:
      v20 = v7;
      if (-[SOSAccount accountKeyIsTrusted](v20, "accountKeyIsTrusted") && -[SOSAccount accountKey](v20, "accountKey"))
      {
        v21 = sub_10000EF14("circleOps");
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = -[SOSAccount accountKey](v20, "accountKey");
          *(_DWORD *)buf = 138412290;
          v47 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Moving : %@ to previousAccountKey", buf, 0xCu);
        }

        -[SOSAccount setPreviousAccountKey:](v20, "setPreviousAccountKey:", -[SOSAccount accountKey](v20, "accountKey"));
      }
      -[SOSAccount setAccountKey:](v20, "setAccountKey:", v19);
      -[SOSAccount setAccountKeyIsTrusted:](v20, "setAccountKeyIsTrusted:", 0);
      if (!-[SOSAccount previousAccountKey](v20, "previousAccountKey"))
        -[SOSAccount setPreviousAccountKey:](v20, "setPreviousAccountKey:", -[SOSAccount accountKey](v20, "accountKey"));
      v24 = (__SecKey *)SOSCopyIDOfKeyWithLength(-[SOSAccount accountKey](v20, "accountKey"), 8, 0);
      v25 = sub_10000EF14("circleOps");
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v24;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "not trusting new public key: %@", buf, 0xCu);
      }

      if (v24)
        CFRelease(v24);

      v27 = cf2;
      if (cf2)
      {
        cf2 = 0;
        CFRelease(v27);
      }
      -[SOSAccount setAccountKeyDerivationParameters:](v20, "setAccountKeyDerivationParameters:", cf);
      v28 = v20;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount _password_tmp](v28, "_password_tmp"));

      if (!v29)
      {
        v30 = sub_10000EF14("circleOps");
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Password cache expired", buf, 2u);
        }

      }
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount _password_tmp](v28, "_password_tmp"));

      if (v32)
      {
        CFRetain(v32);
        v33 = sub_1001D8090(v28, 0, (const __CFData *)v32, 0);
        CFRelease(v32);
      }
      else
      {
        v33 = 0;
      }

      v35 = sub_10000EF14("circleOps");
      v36 = objc_claimAutoreleasedReturnValue(v35);
      v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
      if (v33)
      {
        if (v37)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Successfully used cached password with new parameters", buf, 2u);
        }

        sub_1001D6C6C(v28, (uint64_t)&v43);
      }
      else
      {
        if (v37)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Got new parameters for public key - could not find or use cached password", buf, 2u);
        }

        sub_1001D6D30(v28);
      }
      v38 = sub_10000EF14("circleop");
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Setting account.key_interests_need_updating to true in SOSAccountHandleParametersChange", buf, 2u);
      }

      v10 = 1;
      -[SOSAccount setCircle_rings_retirements_need_attention:](v28, "setCircle_rings_retirements_need_attention:", 1);
      -[SOSAccount setKey_interests_need_updating:](v28, "setKey_interests_need_updating:", 1);
      goto LABEL_58;
    }
    v34 = sub_10000EF14("circleOps");
    v16 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v17 = "Got previous public key repeated. Ignoring.";
      goto LABEL_45;
    }
LABEL_46:

    v10 = 1;
    goto LABEL_58;
  }
  cf = 0;
  cf2 = 0;
  if (sub_1001D4EF4(&cf2, a4, (uint64_t)&cf))
    goto LABEL_7;
LABEL_17:
  v10 = 0;
LABEL_58:
  v40 = cf2;
  if (cf2)
  {
    cf2 = 0;
    CFRelease(v40);
  }
  v41 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v41);
  }
LABEL_62:

  return v10;
}

- (id)SOSTransportKeyParameterGetAccount:(id)a3
{
  return self->account;
}

- (int64_t)SOSTransportKeyParameterGetTransportType:(id)a3 err:(__CFError *)a4
{
  return 1;
}

- (CKKeyParameter)initWithAccount:(id)a3
{
  id v4;
  CKKeyParameter *v5;
  CKKeyParameter *v6;
  CKKeyParameter *v7;
  __CFArray *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKKeyParameter;
  v5 = -[CKKeyParameter init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    -[CKKeyParameter setAccount:](v5, "setAccount:", v4);
    v7 = v6;
    v8 = (__CFArray *)sub_1001F31B0();
    CFArrayAppendValue(v8, v7);

  }
  return v6;
}

- (BOOL)SOSTransportKeyParameterKVSAppendKeyInterests:(id)a3 ak:(__CFArray *)a4 firstUnLock:(__CFArray *)a5 unlocked:(__CFArray *)a6 err:(__CFError *)a7
{
  CFArrayAppendValue(a4, kSOSKVSKeyParametersKey);
  CFArrayAppendValue(a4, kSOSKVSOfficialDSIDKey);
  return 1;
}

- (BOOL)SOSTransportKeyParameterPublishCloudParameters:(id)a3 data:(__CFData *)a4 err:(__CFError *)a5
{
  const void *v8;
  NSObject *v9;
  _BOOL4 v10;
  CFMutableStringRef MutableCopy;
  double Current;
  const __CFData *ExternalRepresentation;
  CFIndex Length;
  CFIndex v15;
  __CFData *Mutable;
  const UInt8 *BytePtr;
  CFIndex v18;
  const UInt8 *v19;
  CFIndex v20;
  CFDataRef Copy;
  void *v22;
  uint64_t v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  const void *v31;
  CFDictionaryRef v32;
  dispatch_queue_global_t global_queue;
  void *v34;
  _QWORD v36[5];
  uint8_t buf[16];

  v8 = sub_10000EF14("circleOps");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (a4)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Publishing Cloud Parameters", buf, 2u);
    }

    MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, CFSTR("["));
    Current = CFAbsoluteTimeGetCurrent();
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1001FB394;
    v36[3] = &unk_1002ECDD0;
    v36[4] = MutableCopy;
    sub_100030404((uint64_t)v36, Current);
    CFStringAppend(MutableCopy, CFSTR("]"));
    ExternalRepresentation = CFStringCreateExternalRepresentation(0, MutableCopy, 0x8000100u, 0x3Fu);
    Length = CFDataGetLength(ExternalRepresentation);
    v15 = CFDataGetLength(a4);
    Mutable = CFDataCreateMutable(kCFAllocatorDefault, v15 + Length);
    BytePtr = CFDataGetBytePtr(ExternalRepresentation);
    v18 = CFDataGetLength(ExternalRepresentation);
    CFDataAppendBytes(Mutable, BytePtr, v18);
    v19 = CFDataGetBytePtr(a4);
    v20 = CFDataGetLength(a4);
    CFDataAppendBytes(Mutable, v19, v20);
    Copy = CFDataCreateCopy(kCFAllocatorDefault, Mutable);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount peerID](self->account, "peerID"));

    if (v22)
      v23 = SOSLastKeyParametersPushedKeyCreateWithPeerID(v22);
    else
      v23 = SOSLastKeyParametersPushedKeyCreateWithAccountGestalt(self->account);
    v31 = (const void *)v23;
    v32 = sub_10012E96C(kCFAllocatorDefault, v24, v25, v26, v27, v28, v29, v30, kSOSKVSKeyParametersKey, (uint64_t)a4);
    if (v31)
      CFRelease(v31);
    global_queue = dispatch_get_global_queue(-2, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    SOSCloudKeychainPutObjectsInCloud(v32, v34, &stru_1002ECC08);

    sub_10020346C(1);
    if (v32)
      CFRelease(v32);
    if (ExternalRepresentation)
      CFRelease(ExternalRepresentation);
    if (Copy)
      CFRelease(Copy);
    if (Mutable)
      CFRelease(Mutable);
    if (MutableCopy)
      CFRelease(MutableCopy);
  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Tried to publish nil Cloud Parameters", buf, 2u);
    }

    sub_10003268C(0, (CFTypeRef *)a5, CFSTR("Tried to publish nil Cloud Parameters"));
  }
  return a4 != 0;
}

- (SOSAccount)account
{
  return (SOSAccount *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->account, 0);
}

@end
