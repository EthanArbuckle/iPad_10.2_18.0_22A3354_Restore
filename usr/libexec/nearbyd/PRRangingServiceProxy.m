@implementation PRRangingServiceProxy

- (PRRangingServiceProxy)initWithConnection:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PRRangingServiceProxy *v10;
  PRRangingServiceProxy *v11;
  PRNSXPCConnection *v12;
  PRRangingClientProtocol *connWrapper;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  NSObject *v17;
  void *v19;
  void *v20;
  __int128 buf;
  id location;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRRangingServiceProxy.mm"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

    if (v9)
      goto LABEL_3;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRRangingServiceProxy.mm"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)PRRangingServiceProxy;
  v10 = -[PRRangingServiceProxy init](&v23, "init");
  v11 = v10;
  if (v10)
  {
    v10->_terminated = 0;
    v12 = -[PRNSXPCConnection initWithConnection:]([PRNSXPCConnection alloc], "initWithConnection:", v7);
    connWrapper = v11->_connWrapper;
    v11->_connWrapper = (PRRangingClientProtocol *)v12;

    objc_initWeak(&location, v11);
    sub_10004635C(&location, &buf);
    sub_1000145E8((uint64_t)&v11->_rangingManagerClient, &buf);
    v14 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
    if (*((_QWORD *)&buf + 1))
    {
      v15 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    v11->_p2pServiceId = 0;
    objc_destroyWeak(&location);
  }
  v17 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "PRRangingServiceProxy init", (uint8_t *)&buf, 2u);
  }

  return v11;
}

- (void)connectWithClientInfo:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  unsigned int v12;

  v5 = a3;
  v6 = (id)qword_10085F520;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", PRProcessNameKey));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", PRProcessIdentifierKey));
    v9 = 138412546;
    v10 = v7;
    v11 = 1024;
    v12 = objc_msgSend(v8, "intValue");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PRGenericRanging: XPC connection created. Process name: %@, pid: %d", (uint8_t *)&v9, 0x12u);

  }
  objc_storeStrong((id *)&self->_clientInfo, a3);
  -[PRRangingServiceProxy activate](self, "activate");

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  if (!self->_terminated)
    -[PRRangingServiceProxy terminate](self, "terminate");
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PRRangingServiceProxy dealloc", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)PRRangingServiceProxy;
  -[PRRangingServiceProxy dealloc](&v4, "dealloc");
}

- (void)activate
{
  void *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  void *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v3 = sub_1002CA108();
  sub_10001ADBC(&v17, (_QWORD *)self->_rangingManagerClient.__ptr_ + 1);
  v18 = v17;
  v17 = 0uLL;
  sub_1002CE308((uint64_t)v3, (unint64_t *)&v18);
  v4 = (std::__shared_weak_count *)*((_QWORD *)&v18 + 1);
  if (*((_QWORD *)&v18 + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&v18 + 1) + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  v7 = (std::__shared_weak_count *)*((_QWORD *)&v17 + 1);
  if (*((_QWORD *)&v17 + 1))
  {
    v8 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  v10 = sub_1002CA108();
  sub_10001ADBC(&v17, (_QWORD *)self->_rangingManagerClient.__ptr_ + 1);
  v16 = v17;
  if (*((_QWORD *)&v17 + 1))
  {
    v11 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 16);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  sub_1002CA79C((uint64_t)v10, (uint64_t *)&v16);
  if (*((_QWORD *)&v16 + 1))
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v16 + 1));
  v13 = (std::__shared_weak_count *)*((_QWORD *)&v17 + 1);
  if (*((_QWORD *)&v17 + 1))
  {
    v14 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
}

- (void)terminate
{
  void *v3;
  __shared_weak_count *cntrl;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  PRRangingManagerClient *ptr;
  __shared_weak_count *v11;

  -[PRRangingClientProtocol invalidate](self->_connWrapper, "invalidate");
  v3 = sub_1002CA108();
  cntrl = self->_rangingManagerClient.__cntrl_;
  ptr = self->_rangingManagerClient.__ptr_;
  v11 = cntrl;
  if (cntrl)
  {
    v5 = (unint64_t *)((char *)cntrl + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  sub_1002CE3E0((uint64_t)v3, (unint64_t *)&ptr);
  v7 = (std::__shared_weak_count *)v11;
  if (v11)
  {
    v8 = (unint64_t *)((char *)v11 + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  self->_terminated = 1;
}

- (void)didFailWithError:(id)a3
{
  id v4;
  PRRangingClientProtocol *connWrapper;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100044A28;
  v7[3] = &unk_1007FA308;
  v8 = v4;
  v6 = v4;
  -[PRRangingClientProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v7);

}

- (void)didReceiveNewSolutions:(id)a3
{
  id v4;
  PRRangingClientProtocol *connWrapper;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100044B48;
  v7[3] = &unk_1007FA308;
  v8 = v4;
  v6 = v4;
  -[PRRangingClientProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v7);

}

- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4
{
  PRRangingClientProtocol *connWrapper;
  _QWORD v5[6];

  connWrapper = self->_connWrapper;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100044C28;
  v5[3] = &unk_1007FA350;
  v5[4] = a3;
  v5[5] = a4;
  -[PRRangingClientProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v5);
}

- (void)rangingRequestDidUpdateStatus:(unint64_t)a3
{
  PRRangingClientProtocol *connWrapper;
  _QWORD v4[5];

  connWrapper = self->_connWrapper;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100044D08;
  v4[3] = &unk_1007FA370;
  v4[4] = a3;
  -[PRRangingClientProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v4);
}

- (void)remoteDevice:(id)a3 didChangeState:(int64_t)a4
{
  id v6;
  PRRangingClientProtocol *connWrapper;
  id v8;
  _QWORD v9[4];
  id v10;
  int64_t v11;

  v6 = a3;
  connWrapper = self->_connWrapper;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100044E2C;
  v9[3] = &unk_1007FA3C0;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  -[PRRangingClientProtocol actOnRemoteObjectAndScheduleBarrierBlock:](connWrapper, "actOnRemoteObjectAndScheduleBarrierBlock:", v9);

}

- (void)configureForP2PRanging:(id)a3 options:(id)a4 reply:(id)a5
{
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD **v14;
  uint64_t v15;
  int v16;
  _BYTE *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  unint64_t *v23;
  unint64_t v24;
  BOOL v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *p_shared_owners;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned __int8 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unsigned __int8 v46;
  __int16 v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  NSObject *v62;
  void *v63;
  char v64;
  id v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  unsigned int v70;
  NSObject *v71;
  int v72;
  NSObject *v73;
  NSObject *v74;
  std::__shared_weak_count *v75;
  unint64_t *p_shared_weak_owners;
  unint64_t v77;
  int v78;
  PRRangingServiceProxy *v79;
  void *v80;
  id v81;
  void *v82;
  unint64_t *v83;
  unint64_t v84;
  void *v85;
  void *v86;
  std::__shared_weak_count *v87;
  id v88;
  uint64_t v89;
  std::__shared_weak_count *v90;
  id v91;
  char v92;
  __int16 v93;
  int *v94;
  uint64_t v95;
  std::__shared_weak_count *v96;
  uint64_t v97;
  std::__shared_weak_count *v98;
  NSErrorUserInfoKey v99;
  const __CFString *v100;
  uint8_t v101[8];
  std::__shared_weak_count *v102;
  _BYTE buf[18];
  char v104;
  int v105;
  unsigned __int8 v106[408];
  NSErrorUserInfoKey v107;
  const __CFString *v108;
  int v109;
  char v110;
  char v111;
  uint64_t v112;
  __int16 v113;
  char v114;
  uint64_t v115;
  NSErrorUserInfoKey v116;
  const __CFString *v117;
  NSErrorUserInfoKey v118;
  const __CFString *v119;
  NSErrorUserInfoKey v120;
  const __CFString *v121;
  NSErrorUserInfoKey v122;
  const __CFString *v123;
  NSErrorUserInfoKey v124;
  void *v125;

  v9 = a3;
  v88 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v11 = (id)qword_10085F520;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_clientInfo, "objectForKey:", PRProcessNameKey));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_clientInfo, "objectForKey:", PRProcessIdentifierKey));
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = objc_msgSend(v13, "intValue");
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PRGenericRanging: XPC command - configureForP2PRanging. Process name: %@, pid: %d", buf, 0x12u);

  }
  if (!v9)
  {
    v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v85, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRRangingServiceProxy.mm"), 150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("remoteDevice"));

  }
  v14 = (_QWORD **)sub_1002CA108();
  v15 = (*(uint64_t (**)(_QWORD *))(*v14[807] + 72))(v14[807]);
  v16 = v15;
  sub_10000BF04(buf, (&off_1007FB278)[v15 >> 32]);
  if (v104 >= 0)
    v17 = buf;
  else
    v17 = *(_BYTE **)buf;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Ranging service is not ready. Reason: %s"), v17));
  if (v104 < 0)
    operator delete(*(void **)buf);
  if ((v16 - 3) <= 0xFFFFFFFD)
  {
    v124 = NSLocalizedDescriptionKey;
    v125 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v125, &v124, 1));
    v20 = PRErrorWithCodeAndUserInfo(101, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    v10[2](v10, 0, v21);
    goto LABEL_37;
  }
  if (self->_p2pServiceId)
  {
    v22 = sub_1002CA108();
    sub_10001ADBC(buf, (_QWORD *)self->_rangingManagerClient.__ptr_ + 1);
    v97 = *(_QWORD *)buf;
    v98 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v23 = (unint64_t *)(*(_QWORD *)&buf[8] + 16);
      do
        v24 = __ldxr(v23);
      while (__stxr(v24 + 1, v23));
    }
    v25 = sub_1002CAF88((uint64_t)v22, &v97, self->_p2pServiceId);
    if (v98)
      std::__shared_weak_count::__release_weak(v98);
    v26 = *(std::__shared_weak_count **)&buf[8];
    if (!*(_QWORD *)&buf[8])
      goto LABEL_22;
    v27 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
      if (v25)
        goto LABEL_23;
    }
    else
    {
LABEL_22:
      if (v25)
        goto LABEL_23;
    }
    v122 = NSLocalizedDescriptionKey;
    v123 = CFSTR("Failed to override P2P job.");
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v123, &v122, 1));
    v52 = PRErrorWithCodeAndUserInfo(105, v51);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v52);

    v10[2](v10, 0, v21);
    goto LABEL_37;
  }
LABEL_23:
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "objectForKey:", PRP2PArgsRangingRole));
  if (!v21 || (v30 = objc_opt_class(NSNumber, v29), (objc_opt_isKindOfClass(v21, v30) & 1) == 0))
  {
    v120 = NSLocalizedDescriptionKey;
    v121 = CFSTR("No session role provided.");
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v121, &v120, 1));
    v49 = PRErrorWithCodeAndUserInfo(100, v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue(v49);

    v10[2](v10, 0, v50);
    goto LABEL_37;
  }
  if (objc_msgSend(v21, "intValue") && objc_msgSend(v21, "intValue") != 1)
  {
    v118 = NSLocalizedDescriptionKey;
    v119 = CFSTR("Invalid session role provided.");
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1));
    v54 = PRErrorWithCodeAndUserInfo(100, v53);
    v55 = (void *)objc_claimAutoreleasedReturnValue(v54);

    v10[2](v10, 0, v55);
    goto LABEL_37;
  }
  v31 = sub_1002CA108();
  v32 = v31[406];
  v33 = (std::__shared_weak_count *)v31[407];
  v95 = v32;
  v96 = v33;
  v87 = v33;
  if (v33)
  {
    p_shared_owners = (unint64_t *)&v33->__shared_owners_;
    do
      v35 = __ldxr(p_shared_owners);
    while (__stxr(v35 + 1, p_shared_owners));
  }
  if (v32)
  {
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "objectForKey:", PRDebugConfigArgUWBChannel));
    if (v86 && (v37 = objc_opt_class(NSNumber, v36), (objc_opt_isKindOfClass(v86, v37) & 1) != 0))
    {
      v38 = objc_msgSend(v86, "intValue");
      v46 = sub_10036C43C(v38, v39, v40, v41, v42, v43, v44, v45);
      v47 = 256;
    }
    else
    {
      v46 = 0;
      v47 = 0;
    }
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "roseMACAddress"));
    objc_msgSend(v56, "getBytes:length:", &v115, 8);

    v109 = 1;
    v110 = 0;
    v111 = 0;
    v112 = v115;
    v113 = 1;
    v114 = 0;
    v93 = 0;
    v94 = &v109;
    if (sub_1002A4728(v32, &v92, (unsigned __int8 *)&v93, v47 | v46))
    {
      if (objc_msgSend(v21, "intValue"))
        sub_100163948(&v92, (uint64_t)buf);
      else
        sub_100163678(&v92, (uint64_t)buf);
      v62 = (id)qword_10085F520;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        if (!v106[57])
          sub_10000BA44();
        *(_DWORD *)v101 = 67109120;
        *(_DWORD *)&v101[4] = v106[56];
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "[P2PDEBUG] post prep req uwbChannel %hhu", v101, 8u);
      }

      v63 = v88;
      if (v88)
      {
        v91 = 0;
        v64 = sub_100010BA8(v88, v106, &v91);
        v65 = v91;
        v66 = v65;
        if ((v64 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
            sub_1003CBD14();
          v10[2](v10, 0, v66);
          goto LABEL_80;
        }

        v63 = v88;
      }
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKey:", PRDebugConfigArgSolutionVariant));
      if (v66)
      {
        v68 = objc_opt_class(NSNumber, v67);
        if ((objc_opt_isKindOfClass(v66, v68) & 1) != 0)
        {
          v69 = qword_10085F520;
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v101 = 0;
            _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "P2P Ranging: PRDebugConfigArgSolutionVariant passed as an option.", v101, 2u);
          }
          v70 = objc_msgSend(v66, "intValue");
          switch(v70)
          {
            case 0u:
              v74 = qword_10085F520;
              if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v101 = 0;
                _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "   PRRoseSolutionNotSensorFused", v101, 2u);
              }
              v72 = 1;
              goto LABEL_71;
            case 2u:
              v73 = qword_10085F520;
              if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v101 = 0;
                _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "   PRRoseSolutionRawRangeSensorFusionAngle", v101, 2u);
              }
              v72 = 5;
              goto LABEL_71;
            case 1u:
              v71 = qword_10085F520;
              if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v101 = 0;
                _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "   PRRoseSolutionSensorFused", v101, 2u);
              }
              v72 = 3;
LABEL_71:
              v105 = v72;
              break;
          }
        }
      }
      v75 = (std::__shared_weak_count *)sub_1002CA108();
      sub_10001ADBC(v101, (_QWORD *)self->_rangingManagerClient.__ptr_ + 1);
      v89 = *(_QWORD *)v101;
      v90 = v102;
      if (v102)
      {
        p_shared_weak_owners = (unint64_t *)&v102->__shared_weak_owners_;
        do
          v77 = __ldxr(p_shared_weak_owners);
        while (__stxr(v77 + 1, p_shared_weak_owners));
      }
      v78 = sub_1002CA950(v75, &v89, (uint64_t)buf);
      if (v90)
        std::__shared_weak_count::__release_weak(v90);
      sub_10001AE68((uint64_t)v101);
      if ((v78 & 0xFF0000) != 0)
      {
        v79 = self;
        objc_sync_enter(v79);
        self->_p2pServiceId = v78;
        objc_sync_exit(v79);

        v10[2](v10, 1, 0);
        -[PRRangingServiceProxy remoteDevice:didChangeState:](v79, "remoteDevice:didChangeState:", v9, 1);
      }
      else
      {
        v99 = NSLocalizedDescriptionKey;
        v100 = CFSTR("Register for service failed");
        v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1));
        v81 = PRErrorWithCodeAndUserInfo(101, v80);
        v82 = (void *)objc_claimAutoreleasedReturnValue(v81);

        v10[2](v10, 0, v82);
      }
LABEL_80:

      goto LABEL_81;
    }
    v107 = NSLocalizedDescriptionKey;
    v108 = CFSTR("Failed to find usable UWB channel for service request.");
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1));
    v60 = PRErrorWithCodeAndUserInfo(999, v59);
    v61 = (void *)objc_claimAutoreleasedReturnValue(v60);

    v10[2](v10, 0, v61);
  }
  else
  {
    v116 = NSLocalizedDescriptionKey;
    v117 = CFSTR("Configuration Manager Error.");
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1));
    v58 = PRErrorWithCodeAndUserInfo(999, v57);
    v86 = (void *)objc_claimAutoreleasedReturnValue(v58);

    v10[2](v10, 0, v86);
  }
LABEL_81:

  if (v87)
  {
    v83 = (unint64_t *)&v87->__shared_owners_;
    do
      v84 = __ldaxr(v83);
    while (__stlxr(v84 - 1, v83));
    if (!v84)
    {
      ((void (*)(std::__shared_weak_count *))v87->__on_zero_shared)(v87);
      std::__shared_weak_count::__release_weak(v87);
    }
  }
LABEL_37:

}

- (void)startP2PRanging:(id)a3 reply:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t *p_shared_weak_owners;
  unint64_t v15;
  unsigned __int8 v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  NSErrorUserInfoKey v30;
  const __CFString *v31;
  NSErrorUserInfoKey v32;
  const __CFString *v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  unsigned int v37;
  char v38;
  uint64_t v39;
  __int16 v40;
  char v41;
  char v42;
  uint64_t v43;
  char v44;
  int v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  if (!v7)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRRangingServiceProxy.mm"), 270, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("remoteDevice"));

  }
  v9 = (id)qword_10085F520;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_clientInfo, "objectForKey:", PRProcessNameKey));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_clientInfo, "objectForKey:", PRProcessIdentifierKey));
    *(_DWORD *)buf = 138412546;
    v35 = v10;
    v36 = 1024;
    v37 = objc_msgSend(v11, "intValue");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PRGenericRanging: XPC command - startP2PRanging. Process name: %@, pid: %d", buf, 0x12u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "roseMACAddress"));
  objc_msgSend(v12, "getBytes:length:", &v49, 8);

  *(_DWORD *)buf = 1;
  LOBYTE(v35) = 0;
  v38 = 0;
  v39 = v49;
  v40 = 1;
  v41 = 0;
  v42 = 1;
  v43 = 50000;
  v44 = 1;
  v45 = 10000000;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  if (!self->_p2pServiceId)
  {
    v32 = NSLocalizedDescriptionKey;
    v33 = CFSTR("Must configure for ranging before calling start ranging.");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    v21 = PRErrorWithCodeAndUserInfo(102, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

    v8[2](v8, 0, v22);
LABEL_20:

    goto LABEL_21;
  }
  v13 = sub_1002CA108();
  sub_10001ADBC(&v26, (_QWORD *)self->_rangingManagerClient.__ptr_ + 1);
  v28 = v26;
  v29 = v27;
  if (v27)
  {
    p_shared_weak_owners = (unint64_t *)&v27->__shared_weak_owners_;
    do
      v15 = __ldxr(p_shared_weak_owners);
    while (__stxr(v15 + 1, p_shared_weak_owners));
  }
  v16 = sub_1002CB6B4((uint64_t)v13, &v28, self->_p2pServiceId, (uint64_t)buf);
  if (v29)
    std::__shared_weak_count::__release_weak(v29);
  v17 = v27;
  if (v27)
  {
    p_shared_owners = (unint64_t *)&v27->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
      if ((v16 & 1) != 0)
        goto LABEL_16;
      goto LABEL_19;
    }
  }
  if ((v16 & 1) == 0)
  {
LABEL_19:
    v30 = NSLocalizedDescriptionKey;
    v31 = CFSTR("Initate user triggered ranging failed");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    v24 = PRErrorWithCodeAndUserInfo(102, v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v24);

    v8[2](v8, 0, v22);
    goto LABEL_20;
  }
LABEL_16:
  v8[2](v8, 1, 0);
LABEL_21:

}

- (void)stopP2PRanging:(id)a3 reply:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t *v13;
  unint64_t v14;
  char v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  NSErrorUserInfoKey v27;
  const __CFString *v28;
  NSErrorUserInfoKey v29;
  const __CFString *v30;
  _BYTE buf[18];

  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  if (!v7)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRRangingServiceProxy.mm"), 312, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("remoteDevice"));

  }
  v9 = (id)qword_10085F520;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_clientInfo, "objectForKey:", PRProcessNameKey));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_clientInfo, "objectForKey:", PRProcessIdentifierKey));
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = objc_msgSend(v11, "intValue");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PRGenericRanging: XPC command - stopP2PRanging. Process name: %@, pid: %d", buf, 0x12u);

  }
  if (!self->_p2pServiceId)
  {
    v29 = NSLocalizedDescriptionKey;
    v30 = CFSTR("This remote device is unknown");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
    v20 = PRErrorWithCodeAndUserInfo(103, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    v8[2](v8, 0, v21);
LABEL_20:

    goto LABEL_21;
  }
  v12 = sub_1002CA108();
  sub_10001ADBC(buf, (_QWORD *)self->_rangingManagerClient.__ptr_ + 1);
  v25 = *(_QWORD *)buf;
  v26 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v13 = (unint64_t *)(*(_QWORD *)&buf[8] + 16);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  v15 = sub_1002CC2C8((uint64_t)v12, &v25, self->_p2pServiceId);
  if (v26)
    std::__shared_weak_count::__release_weak(v26);
  v16 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v17 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
      if ((v15 & 1) != 0)
        goto LABEL_16;
      goto LABEL_19;
    }
  }
  if ((v15 & 1) == 0)
  {
LABEL_19:
    v27 = NSLocalizedDescriptionKey;
    v28 = CFSTR("Stop ranging failed");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
    v23 = PRErrorWithCodeAndUserInfo(103, v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v23);

    v8[2](v8, 0, v21);
    goto LABEL_20;
  }
LABEL_16:
  v8[2](v8, 1, 0);
LABEL_21:

}

- (NSDictionary)clientInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientInfo, 0);
  sub_10001AE68((uint64_t)&self->_rangingManagerClient);
  objc_storeStrong((id *)&self->_connWrapper, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
