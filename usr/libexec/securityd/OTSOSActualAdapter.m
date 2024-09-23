@implementation OTSOSActualAdapter

- (id)initAsEssential:(BOOL)a3
{
  OTSOSActualAdapter *v4;
  OTSOSActualAdapter *v5;
  NSString *providerID;
  CKKSListenerCollection *v7;
  CKKSListenerCollection *peerChangeListeners;
  OTSOSActualAdapter *v9;
  const char *v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  OTSOSActualAdapter *v13;
  _QWORD v15[4];
  OTSOSActualAdapter *v16;
  int out_token;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)OTSOSActualAdapter;
  v4 = -[OTSOSActualAdapter init](&v18, "init");
  v5 = v4;
  if (v4)
  {
    v4->_essential = a3;
    providerID = v4->_providerID;
    v4->_providerID = (NSString *)CFSTR("[OTSOSActualAdapter]");

    v7 = -[CKKSListenerCollection initWithName:]([CKKSListenerCollection alloc], "initWithName:", CFSTR("ckks-sos"));
    peerChangeListeners = v5->_peerChangeListeners;
    v5->_peerChangeListeners = v7;

    v9 = v5;
    out_token = 0;
    v10 = (const char *)kSOSCCCircleOctagonKeysChangedNotification;
    global_queue = dispatch_get_global_queue(17, 0);
    v12 = objc_claimAutoreleasedReturnValue(global_queue);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100092B50;
    v15[3] = &unk_1002EB980;
    v13 = v9;
    v16 = v13;
    notify_register_dispatch(v10, &out_token, v12, v15);

  }
  return v5;
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<OTSOSActualAdapter e:%d>"), -[OTSOSActualAdapter essential](self, "essential"));
}

- (int)circleStatus:(id *)a3
{
  int v4;
  id v5;
  id v7;

  if (-[OTSOSActualAdapter sosEnabled](self, "sosEnabled"))
  {
    v7 = 0;
    v4 = SOSCCThisDeviceIsInCircle(&v7);
    v5 = v7;
    if (a3 && v7)
    {
      *a3 = v7;
    }
    else if (v7)
    {
      v7 = 0;
      CFRelease(v5);
    }
  }
  else
  {
    if (a3)
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -4, CFSTR("SOS is not enabled for compatibility mode")));
    return -1;
  }
  return v4;
}

- (id)currentSOSSelf:(id *)a3
{
  unsigned int v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  NSObject *v9;
  const __CFString *v10;
  CKKSSOSSelfPeer *v11;
  void *v12;
  _QWORD *v13;
  _QWORD *v14;
  CFTypeRef v15;
  void *v16;
  unsigned __int8 v17;
  const void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const void *v25;
  NSObject *v26;
  uint64_t v27;
  CKKSSOSSelfPeer *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _QWORD v33[7];
  id obj;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  CFTypeRef v54;
  _BYTE buf[24];
  void *v56;
  id v57;

  if (-[OTSOSActualAdapter sosEnabled](self, "sosEnabled"))
  {
    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = sub_100092214;
    v52 = sub_100092224;
    v53 = 0;
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = sub_100092214;
    v46 = sub_100092224;
    v47 = 0;
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = sub_100092214;
    v40 = sub_100092224;
    v41 = 0;
    obj = 0;
    v35 = 0;
    v5 = -[OTSOSActualAdapter circleStatus:](self, "circleStatus:", &obj);
    objc_storeStrong(&v41, obj);
    if (v5)
    {
      if (!v37[5])
      {
        v6 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 24, CFSTR("Not in SOS circle, but no error returned")));
        v7 = (void *)v37[5];
        v37[5] = v6;

      }
      v8 = sub_10000EF14("SecError");
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        if (v5 + 1 > 4)
          v10 = CFSTR("kSOSCCError");
        else
          v10 = off_1002EB7C0[v5 + 1];
        v27 = v37[5];
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v27;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "octagon-sos: Not in circle : %@ %@", buf, 0x16u);
      }

      v11 = 0;
      if (a3)
        *a3 = objc_retainAutorelease((id)v37[5]);
      goto LABEL_37;
    }
    v12 = (void *)sub_10020B190((CFTypeRef *)&v35);
    if (!v12 || v35)
    {
      v22 = (void *)v37[5];
      v37[5] = v35;

      if (!v37[5])
      {
        v23 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 24, CFSTR("No SOS peer info available, but no error returned")));
        v24 = (void *)v37[5];
        v37[5] = v23;

      }
      v25 = sub_10000EF14("SecError");
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v35;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "octagon-sos: Error fetching self peer : %@", buf, 0xCu);
      }

      if (a3)
      {
        v21 = objc_retainAutorelease((id)v37[5]);
        goto LABEL_28;
      }
    }
    else
    {
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100092A8C;
      v33[3] = &unk_1002DC6E0;
      v33[4] = &v36;
      v33[5] = &v48;
      v33[6] = &v42;
      v13 = v33;
      v54 = 0;
      *(_QWORD *)buf = _NSConcreteStackBlock;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_1002125F4;
      v56 = &unk_1002ED300;
      v14 = v13;
      v57 = v14;
      sub_100202B4C(&v54, buf);
      v15 = v54;
      if (v54)
      {
        v54 = 0;
        CFRelease(v15);
      }

      if (!v37[5])
      {
        v28 = [CKKSSOSSelfPeer alloc];
        v29 = v43[5];
        v30 = v49[5];
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[OTSOSActualAdapter sosCKKSViewList](OTSOSActualAdapter, "sosCKKSViewList"));
        v11 = -[CKKSSOSSelfPeer initWithSOSPeerID:encryptionKey:signingKey:viewList:](v28, "initWithSOSPeerID:encryptionKey:signingKey:viewList:", v12, v29, v30, v31);

        goto LABEL_36;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSLockStateTracker globalTracker](CKKSLockStateTracker, "globalTracker"));
      v17 = objc_msgSend(v16, "isLockedError:", v37[5]);

      if ((v17 & 1) == 0)
      {
        v18 = sub_10000EF14("SecError");
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = v37[5];
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "octagon-sos: Error fetching self encryption keys: %@", buf, 0xCu);
        }

      }
      if (a3)
      {
        v21 = objc_retainAutorelease((id)v37[5]);
LABEL_28:
        v11 = 0;
        *a3 = v21;
LABEL_36:

LABEL_37:
        _Block_object_dispose(&v36, 8);

        _Block_object_dispose(&v42, 8);
        _Block_object_dispose(&v48, 8);

        return v11;
      }
    }
    v11 = 0;
    goto LABEL_36;
  }
  v11 = 0;
  if (a3)
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -4, CFSTR("SOS is not enabled for compatibility mode")));
  return v11;
}

- (id)fetchSelfPeers:(id *)a3
{
  void *v5;
  CKKSSelves *v6;

  if (-[OTSOSActualAdapter sosEnabled](self, "sosEnabled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSActualAdapter currentSOSSelf:](self, "currentSOSSelf:", a3));
    if (v5)
      v6 = -[CKKSSelves initWithCurrent:allSelves:]([CKKSSelves alloc], "initWithCurrent:allSelves:", v5, 0);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
    if (a3)
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -4, CFSTR("SOS is not enabled for compatibility mode")));
  }
  return v6;
}

- (id)fetchTrustedPeers:(id *)a3
{
  _QWORD *v4;
  _QWORD *v5;
  CFTypeRef v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[4];
  id v24;
  CFTypeRef v25;

  if (-[OTSOSActualAdapter sosEnabled](self, "sosEnabled"))
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = sub_100092214;
    v21 = sub_100092224;
    v22 = (id)0xAAAAAAAAAAAAAAAALL;
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = sub_100092214;
    v15 = sub_100092224;
    v16 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000926B0;
    v10[3] = &unk_1002DC708;
    v10[4] = &v11;
    v10[5] = &v17;
    v4 = v10;
    v25 = 0;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100213790;
    v23[3] = &unk_1002ED300;
    v5 = v4;
    v24 = v5;
    sub_100202B4C(&v25, v23);
    v6 = v25;
    if (v25)
    {
      v25 = 0;
      CFRelease(v6);
    }

    if (a3)
    {
      v7 = (void *)v12[5];
      if (v7)
        *a3 = objc_retainAutorelease(v7);
    }
    v8 = (id)v18[5];
    _Block_object_dispose(&v11, 8);

    _Block_object_dispose(&v17, 8);
    return v8;
  }
  else
  {
    if (a3)
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -4, CFSTR("SOS is not enabled for compatibility mode")));
    return 0;
  }
}

- (BOOL)preloadOctagonKeySetOnAccount:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  CFTypeRef v34;
  BOOL v35;
  const void *v36;
  NSObject *v37;
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  unint64_t v82;
  uint8_t buf[8];
  uint64_t v84;
  uint64_t (*v85)(uint64_t, void *);
  void *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  CFTypeRef v94;

  v6 = a3;
  if (-[OTSOSActualAdapter sosEnabled](self, "sosEnabled"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publicSigningKey"));
    if (objc_msgSend(v7, "_secKey"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publicEncryptionKey"));
      v9 = objc_msgSend(v8, "_secKey");

      if (v9)
      {
        v79 = 0;
        v80 = &v79;
        v81 = 0x2020000000;
        v82 = 0xAAAAAAAAAAAAAAAALL;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "signingKey"));
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keyData"));

        v82 = v11;
        v75 = 0;
        v76 = &v75;
        v77 = 0x2020000000;
        v78 = 0xAAAAAAAAAAAAAAAALL;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "encryptionKey"));
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "keyData"));

        v78 = v13;
        v71 = 0;
        v72 = &v71;
        v73 = 0x2020000000;
        v74 = 0xAAAAAAAAAAAAAAAALL;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publicSigningKey"));
        v15 = objc_msgSend(v14, "_secKey");

        if (v15)
          CFRetain(v15);
        v74 = (unint64_t)v15;
        v67 = 0;
        v68 = &v67;
        v69 = 0x2020000000;
        v70 = 0xAAAAAAAAAAAAAAAALL;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publicEncryptionKey"));
        v17 = objc_msgSend(v16, "_secKey");

        if (v17)
          CFRetain(v17);
        v70 = (unint64_t)v17;
        v63 = 0;
        v64 = &v63;
        v65 = 0x2020000000;
        v66 = 0xAAAAAAAAAAAAAAAALL;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "signingKey"));
        v19 = objc_msgSend(v18, "_secKey");

        if (v19)
          CFRetain(v19);
        v66 = (unint64_t)v19;
        v59 = 0;
        v60 = &v59;
        v61 = 0x2020000000;
        v62 = 0xAAAAAAAAAAAAAAAALL;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "encryptionKey"));
        v21 = objc_msgSend(v20, "_secKey");

        if (v21)
          CFRetain(v21);
        v62 = (unint64_t)v21;
        v22 = objc_msgSend((id)objc_opt_class(CKKSAnalytics), "logger");
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonSOSAdapterUpdateKeys")));

        v55 = 0;
        v56 = &v55;
        v57 = 0x2020000000;
        v58 = -86;
        v49 = 0;
        v50 = &v49;
        v51 = 0x3032000000;
        v52 = sub_100092214;
        v53 = sub_100092224;
        v54 = 0;
        v25 = v80[3];
        v26 = v76[3];
        v27 = v64[3];
        v28 = v60[3];
        v29 = v72[3];
        v30 = v68[3];
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_100092504;
        v39[3] = &unk_1002DC730;
        v31 = v24;
        v40 = v31;
        v41 = &v55;
        v42 = &v49;
        v43 = &v79;
        v44 = &v75;
        v45 = &v71;
        v46 = &v67;
        v47 = &v63;
        v48 = &v59;
        v32 = v39;
        v94 = 0;
        *(_QWORD *)buf = _NSConcreteStackBlock;
        v84 = 3221225472;
        v85 = sub_100213444;
        v86 = &unk_1002ED350;
        v88 = v25;
        v89 = v26;
        v90 = v29;
        v91 = v30;
        v33 = v32;
        v87 = v33;
        v92 = v27;
        v93 = v28;
        sub_100202B4C(&v94, buf);
        v34 = v94;
        if (v94)
        {
          v94 = 0;
          CFRelease(v34);
        }

        if (a4)
          *a4 = objc_retainAutorelease((id)v50[5]);
        v35 = *((_BYTE *)v56 + 24) != 0;

        _Block_object_dispose(&v49, 8);
        _Block_object_dispose(&v55, 8);

        _Block_object_dispose(&v59, 8);
        _Block_object_dispose(&v63, 8);
        _Block_object_dispose(&v67, 8);
        _Block_object_dispose(&v71, 8);
        _Block_object_dispose(&v75, 8);
        _Block_object_dispose(&v79, 8);
        goto LABEL_23;
      }
    }
    else
    {

    }
    v36 = sub_10000EF14("octagon-preload-keys");
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "no octagon keys available skipping updating SOS record", buf, 2u);
    }

    v35 = 1;
  }
  else
  {
    v35 = 0;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -4, CFSTR("SOS is not enabled for compatibility mode")));
  }
LABEL_23:

  return v35;
}

- (BOOL)updateOctagonKeySetWithAccount:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  _QWORD *v36;
  _QWORD *v37;
  CFTypeRef v38;
  BOOL v39;
  const void *v40;
  NSObject *v41;
  id *v43;
  _QWORD v44[4];
  id v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t *v49;
  _QWORD *v50;
  _QWORD *v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  unint64_t v81;
  _QWORD v82[3];
  unint64_t v83;
  _QWORD v84[3];
  unint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  unint64_t v93;
  uint8_t buf[8];
  uint64_t v95;
  uint64_t (*v96)(uint64_t, void *);
  void *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  CFTypeRef v105;

  v6 = a3;
  if (-[OTSOSActualAdapter sosEnabled](self, "sosEnabled"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publicSigningKey"));
    if (objc_msgSend(v7, "_secKey"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publicEncryptionKey"));
      v9 = objc_msgSend(v8, "_secKey");

      if (v9)
      {
        v90 = 0;
        v91 = &v90;
        v92 = 0x2020000000;
        v93 = 0xAAAAAAAAAAAAAAAALL;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "signingKey"));
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keyData"));

        v93 = v11;
        v86 = 0;
        v87 = &v86;
        v88 = 0x2020000000;
        v89 = 0xAAAAAAAAAAAAAAAALL;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "encryptionKey"));
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "keyData"));

        v89 = v13;
        v84[0] = 0;
        v84[1] = v84;
        v84[2] = 0x2020000000;
        v85 = 0xAAAAAAAAAAAAAAAALL;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publicSigningKey"));
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "keyData"));

        v85 = v15;
        v82[0] = 0;
        v82[1] = v82;
        v82[2] = 0x2020000000;
        v83 = 0xAAAAAAAAAAAAAAAALL;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publicEncryptionKey"));
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "keyData"));

        v83 = v17;
        v78 = 0;
        v79 = &v78;
        v80 = 0x2020000000;
        v81 = 0xAAAAAAAAAAAAAAAALL;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publicSigningKey"));
        v19 = objc_msgSend(v18, "_secKey");

        if (v19)
          CFRetain(v19);
        v81 = (unint64_t)v19;
        v74 = 0;
        v75 = &v74;
        v76 = 0x2020000000;
        v77 = 0xAAAAAAAAAAAAAAAALL;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publicEncryptionKey"));
        v21 = objc_msgSend(v20, "_secKey");

        if (v21)
          CFRetain(v21);
        v77 = (unint64_t)v21;
        v70 = 0;
        v71 = &v70;
        v72 = 0x2020000000;
        v73 = 0xAAAAAAAAAAAAAAAALL;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "signingKey"));
        v23 = objc_msgSend(v22, "_secKey");

        if (v23)
          CFRetain(v23);
        v73 = (unint64_t)v23;
        v66 = 0;
        v67 = &v66;
        v68 = 0x2020000000;
        v69 = 0xAAAAAAAAAAAAAAAALL;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "encryptionKey"));
        v25 = objc_msgSend(v24, "_secKey");

        if (v25)
          CFRetain(v25);
        v43 = a4;
        v69 = (unint64_t)v25;
        v26 = objc_msgSend((id)objc_opt_class(CKKSAnalytics), "logger");
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "startLogSystemMetricsForActivityNamed:", CFSTR("OctagonSOSAdapterUpdateKeys")));

        v62 = 0;
        v63 = &v62;
        v64 = 0x2020000000;
        v65 = -86;
        v56 = 0;
        v57 = &v56;
        v58 = 0x3032000000;
        v59 = sub_100092214;
        v60 = sub_100092224;
        v61 = 0;
        v29 = v91[3];
        v30 = v87[3];
        v31 = v79[3];
        v32 = v75[3];
        v33 = v71[3];
        v34 = v67[3];
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_100092338;
        v44[3] = &unk_1002DC758;
        v35 = v28;
        v45 = v35;
        v46 = &v62;
        v47 = &v56;
        v48 = &v90;
        v49 = &v86;
        v50 = v84;
        v51 = v82;
        v52 = &v78;
        v53 = &v74;
        v54 = &v70;
        v55 = &v66;
        v36 = v44;
        v105 = 0;
        *(_QWORD *)buf = _NSConcreteStackBlock;
        v95 = 3221225472;
        v96 = sub_100212DA8;
        v97 = &unk_1002ED350;
        v99 = v29;
        v100 = v30;
        v101 = v31;
        v102 = v32;
        v37 = v36;
        v98 = v37;
        v103 = v33;
        v104 = v34;
        sub_100202B4C(&v105, buf);
        v38 = v105;
        if (v105)
        {
          v105 = 0;
          CFRelease(v38);
        }

        if (v43)
          *v43 = objc_retainAutorelease((id)v57[5]);
        v39 = *((_BYTE *)v63 + 24) != 0;

        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(&v62, 8);

        _Block_object_dispose(&v66, 8);
        _Block_object_dispose(&v70, 8);
        _Block_object_dispose(&v74, 8);
        _Block_object_dispose(&v78, 8);
        _Block_object_dispose(v82, 8);
        _Block_object_dispose(v84, 8);
        _Block_object_dispose(&v86, 8);
        _Block_object_dispose(&v90, 8);
        goto LABEL_23;
      }
    }
    else
    {

    }
    v40 = sub_10000EF14("octagon-sos");
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "no octagon keys available skipping updating SOS record", buf, 2u);
    }

    v39 = 1;
  }
  else
  {
    v39 = 0;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -4, CFSTR("SOS is not enabled for compatibility mode")));
  }
LABEL_23:

  return v39;
}

- (BOOL)updateCKKS4AllStatus:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  const void *v8;
  NSObject *v9;
  const __CFString *v10;
  const void *v11;
  NSObject *v12;
  CFTypeRef v14;
  __int128 buf;
  uint64_t (*v16)(uint64_t, void *, uint64_t);
  void *v17;
  BOOL v18;

  v5 = a3;
  if (-[OTSOSActualAdapter sosEnabled](self, "sosEnabled"))
  {
    v14 = 0;
    *(_QWORD *)&buf = _NSConcreteStackBlock;
    *((_QWORD *)&buf + 1) = 3221225472;
    v16 = sub_1002136F0;
    v17 = &unk_1002ED2B8;
    v18 = v5;
    v6 = sub_100202B4C(&v14, &buf);
    v7 = (void *)v14;
    if (!v6 || v14)
    {
      v11 = sub_10000EF14("SecError");
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "octagon-sos: failed to update CKKS4All status in SOS: %@", (uint8_t *)&buf, 0xCu);
      }

      if (a4 && v7)
        *a4 = objc_retainAutorelease(v7);
    }
    else
    {
      v8 = sub_10000EF14("octagon-sos");
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = CFSTR("not supported");
        if (v5)
          v10 = CFSTR("supported");
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "successfully updated CKKS4All status in SOS to '%@'", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  else
  {
    LOBYTE(v6) = 0;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -4, CFSTR("SOS is not enabled for compatibility mode")));
  }
  return v6;
}

- (void)registerForPeerChangeUpdates:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[OTSOSActualAdapter peerChangeListeners](self, "peerChangeListeners"));
  objc_msgSend(v5, "registerListener:", v4);

}

- (void)sendSelfPeerChangedUpdate
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSActualAdapter peerChangeListeners](self, "peerChangeListeners"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009232C;
  v4[3] = &unk_1002DC780;
  v4[4] = self;
  objc_msgSend(v3, "iterateListeners:", v4);

}

- (void)sendTrustedPeerSetChangedUpdate
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSActualAdapter peerChangeListeners](self, "peerChangeListeners"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100092320;
  v4[3] = &unk_1002DC780;
  v4[4] = self;
  objc_msgSend(v3, "iterateListeners:", v4);

}

- (id)currentState
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_100092214;
  v9 = sub_100092224;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009222C;
  v4[3] = &unk_1002EB140;
  v4[4] = self;
  v4[5] = &v5;
  +[SOSAccount performOnQuietAccountQueue:](SOSAccount, "performOnQuietAccountQueue:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (BOOL)safariViewSyncingEnabled:(id *)a3
{
  int v4;
  void *v5;
  id v6;
  _BOOL8 v7;
  CFTypeRef cf;

  if (-[OTSOSActualAdapter sosEnabled](self, "sosEnabled"))
  {
    cf = 0;
    v4 = SOSCCView(kSOSViewAutofillPasswords, 3, &cf);
    v5 = (void *)cf;
    if (!cf)
      return v4 == 1;
    if (!a3)
    {
      cf = 0;
      CFRelease(v5);
LABEL_8:
      LOBYTE(v7) = 0;
      return v7;
    }
  }
  else
  {
    if (!a3)
      goto LABEL_8;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -4, CFSTR("SOS is not enabled for compatibility mode")));
  }
  v6 = v5;
  LOBYTE(v7) = 0;
  *a3 = v6;
  return v7;
}

- (BOOL)joinAfterRestore:(id *)a3
{
  int v4;
  const void *v5;
  NSObject *v6;
  id v7;
  id v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  id v13;

  if (!-[OTSOSActualAdapter sosEnabled](self, "sosEnabled"))
  {
    if (!a3)
    {
      LOBYTE(v4) = 0;
      return v4;
    }
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -4, CFSTR("SOS unsupported on this platform")));
    LOBYTE(v4) = 0;
    goto LABEL_8;
  }
  v9 = 0;
  v4 = SOSCCRequestToJoinCircleAfterRestore(&v9);
  v5 = sub_10000EF14("octagon-sos");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v11 = v4;
    v12 = 2112;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SOSCCRequestToJoinCircleAfterRestore complete: %d %@", buf, 0x12u);
  }

  if (a3)
  {
    v7 = v9;
LABEL_8:
    *a3 = v7;
  }
  return v4;
}

- (BOOL)resetToOffering:(id *)a3
{
  int v4;
  const void *v5;
  NSObject *v6;
  id v7;
  id v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  id v13;

  if (!-[OTSOSActualAdapter sosEnabled](self, "sosEnabled"))
  {
    if (!a3)
    {
      LOBYTE(v4) = 0;
      return v4;
    }
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -4, CFSTR("SOS is not enabled for compatibility mode")));
    LOBYTE(v4) = 0;
    goto LABEL_8;
  }
  v9 = 0;
  v4 = SOSCCResetToOffering(&v9);
  v5 = sub_10000EF14("octagon-sos");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v11 = v4;
    v12 = 2112;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SOSCCResetToOffering complete: %d %@", buf, 0x12u);
  }

  if (a3)
  {
    v7 = v9;
LABEL_8:
    *a3 = v7;
  }
  return v4;
}

- (BOOL)essential
{
  return self->_essential;
}

- (void)setEssential:(BOOL)a3
{
  self->_essential = a3;
}

- (NSString)providerID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (CKKSListenerCollection)peerChangeListeners
{
  return (CKKSListenerCollection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPeerChangeListeners:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerChangeListeners, 0);
  objc_storeStrong((id *)&self->_providerID, 0);
}

+ (id)sosCKKSViewList
{
  if (qword_100340F80 != -1)
    dispatch_once(&qword_100340F80, &stru_1002DC6B8);
  return (id)qword_100340F78;
}

- (BOOL)sosEnabled
{
  const void *v1;
  NSObject *v2;
  const __CFDictionary *v3;
  OSStatus v4;
  OSStatus v5;
  CFTypeID v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  unsigned int v11;
  int v12;
  const void *v13;
  NSObject *v14;
  const void *v15;
  NSObject *v16;
  const char *v17;
  const void *v18;
  NSObject *v19;
  uint32_t v20;
  const void *v21;
  int v22;
  id v23;
  void *v24;
  const void *v25;
  NSObject *v26;
  const __CFString *v27;
  id v28;
  void *v29;
  CFTypeRef result;
  uint8_t buf[4];
  const __CFString *v32;
  _QWORD v33[9];
  _QWORD v34[9];

  if (dword_100341678)
    return dword_100341678 == 2;
  if (qword_1003412D8 != -1)
    dispatch_once(&qword_1003412D8, &stru_1002E7880);
  if (!byte_1003412D0)
  {
    if (qword_1003412B8 != -1)
      dispatch_once(&qword_1003412B8, &stru_1002E7840);
    if (byte_10033FE20)
      v12 = 2;
    else
      v12 = 1;
    dword_100341678 = v12;
    if (!byte_10033FE20)
      goto LABEL_43;
    goto LABEL_36;
  }
  v1 = sub_10000EF14("sos-compatibility");
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "compatibility mode feature flag enabled, checking keychain for sos compatibility mode", buf, 2u);
  }

  dword_100341678 = 1;
  v33[0] = kSecClass;
  v33[1] = kSecUseDataProtectionKeychain;
  v34[0] = kSecClassGenericPassword;
  v34[1] = &__kCFBooleanTrue;
  v33[2] = kSecAttrSynchronizable;
  v33[3] = kSecAttrAccessGroup;
  v34[2] = &__kCFBooleanFalse;
  v34[3] = CFSTR("com.apple.security.sos");
  v33[4] = kSecAttrAccount;
  v33[5] = kSecReturnData;
  v34[4] = CFSTR("sos-compatibility-mode");
  v34[5] = &__kCFBooleanTrue;
  v33[6] = kSecMatchLimit;
  v33[7] = kSecAttrAccessible;
  v34[6] = kSecMatchLimitOne;
  v34[7] = kSecAttrAccessibleAfterFirstUnlock;
  v33[8] = kSecAttrSysBound;
  v34[8] = &off_10030B0D8;
  v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 9));
  result = 0;
  v4 = SecItemCopyMatching(v3, &result);
  if (v4 == -25308)
  {
    v13 = sub_10000EF14("sos-compatibility");
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "keychain is locked, will keep compatibility mode set to UNKNOWN", buf, 2u);
    }

    dword_100341678 = 0;
    goto LABEL_43;
  }
  v5 = v4;
  if (v4 == -25300)
  {
    v15 = sub_10000EF14("sos-compatibility");
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    *(_WORD *)buf = 0;
    v17 = "could not find sos compatibility mode in the keychain, defaulting to OFF";
    goto LABEL_33;
  }
  if (v4)
  {
    v18 = sub_10000EF14("SecError");
    v16 = objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    *(_DWORD *)buf = 67109120;
    LODWORD(v32) = v5;
    v17 = "sos-compatibility: failed to fetch sos compatibility mode from the keychain, error code: %d, defaulting to OFF";
    v19 = v16;
    v20 = 8;
    goto LABEL_34;
  }
  if (result)
  {
    v6 = CFGetTypeID(result);
    if (v6 == CFDataGetTypeID())
    {
      v7 = (void *)result;
      v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", result, 134217984);
      v9 = v8;
      v10 = 1;
      if (v8)
      {
        v11 = objc_msgSend(v8, "isEqualToString:", CFSTR("enabled"));
        if (v11)
          v10 = 2;
        else
          v10 = 1;
      }
      else
      {
        v11 = 0;
      }
      dword_100341678 = v10;
      v25 = sub_10000EF14("sos-compatibility");
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = CFSTR("enabled");
        if (!v11)
          v27 = CFSTR("disabled");
        *(_DWORD *)buf = 138412290;
        v32 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "SOS compatibility mode is %@", buf, 0xCu);
      }

      if ((v11 & 1) == 0)
        goto LABEL_43;
LABEL_36:
      v23 = objc_msgSend((id)objc_opt_class(CKKSAnalytics), "logger");
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      objc_msgSend(v24, "logSuccessForEventNamed:", CFSTR("SOSDeferralEventCompatibilityModeEnabled"));

      return 1;
    }
  }
  v21 = sub_10000EF14("SecError");
  v16 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v17 = "sos-compatibility: unexpected return type, defaulting to OFF";
LABEL_33:
    v19 = v16;
    v20 = 2;
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v17, buf, v20);
  }
LABEL_35:

  v22 = dword_100341678;
  if (v22 == 2)
    goto LABEL_36;
LABEL_43:
  v28 = objc_msgSend((id)objc_opt_class(CKKSAnalytics), "logger");
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  objc_msgSend(v29, "logSuccessForEventNamed:", CFSTR("SOSDeferralEventCompatibilityModeDisabled"));

  return 0;
}

@end
