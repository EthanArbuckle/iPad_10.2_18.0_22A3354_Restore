@implementation SOSAccountTransaction

- (unint64_t)currentTrustBitmask
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  __SecKey *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unsigned int v10;

  v3 = objc_claimAutoreleasedReturnValue(-[SOSAccount queue](self->_account, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self->_account, "trust"));
  v5 = objc_msgSend(v4, "getCircleStatusOnly:", 0);

  if (-[SOSAccount accountKeyIsTrusted](self->_account, "accountKeyIsTrusted"))
  {
    v6 = -[SOSAccount accountPrivateKey](self->_account, "accountPrivateKey");
    v7 = 0xE000000000000000;
    if (!v6)
      v7 = 0xC000000000000000;
    v8 = v7 | v5;
  }
  else
  {
    v8 = v5 | 0x8000000000000000;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self->_account, "trust"));
  v10 = objc_msgSend(v9, "isInCircleOnly:", 0);

  if (v10)
    return v8 | 0x1000000000000000;
  else
    return v8;
}

- (void)updateSOSCircleCachedStatus
{
  NSObject *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const void *v7;
  NSObject *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  int v11;

  v3 = objc_claimAutoreleasedReturnValue(-[SOSAccount queue](self->_account, "queue"));
  dispatch_assert_queue_V2(v3);

  if (qword_100341570 != -1)
    dispatch_once(&qword_100341570, &stru_1002EBBC0);
  v4 = -[SOSAccountTransaction currentTrustBitmask](self, "currentTrustBitmask");
  v5 = v4;
  if ((qword_100341568 & 0x8000000000000000) == 0 || qword_100341568 != v4)
    -[SOSAccount setNotifyCircleChangeOnExit:](self->_account, "setNotifyCircleChangeOnExit:", 1);
  if (-[SOSAccount notifyCircleChangeOnExit](self->_account, "notifyCircleChangeOnExit"))
  {
    v6 = qword_100341568;
    qword_100341568 = v5;
    v7 = sub_10000EF14("sosnotify");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v11 = qword_100341568;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "new last circle status is: %d", buf, 8u);
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001DD1B0;
    v9[3] = &unk_1002EBC28;
    v9[4] = self;
    v9[5] = v5;
    SOSCachedNotificationOperation(kSOSCCCircleChangedNotification, v9);
    if ((v6 & 0x8000000000000000) == 0)
      -[SOSAccount setNotifyViewChangeOnExit:](self->_account, "setNotifyViewChangeOnExit:", 1);
  }
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction initialViews](self, "initialViews"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction initialViews](self, "initialViews"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<SOSAccountTransaction*@%p %ld>"), self, objc_msgSend(v4, "count")));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<SOSAccountTransaction*@%p %ld>"), self, 0));
  }

  return (NSString *)v5;
}

- (SOSAccountTransaction)initWithAccount:(id)a3 quiet:(BOOL)a4
{
  id v6;
  SOSAccountTransaction *v7;
  SOSAccountTransaction *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SOSAccountTransaction;
  v7 = -[SOSAccountTransaction init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    -[SOSAccountTransaction setAccount:](v7, "setAccount:", v6);
    v8->_quiet = a4;
    -[SOSAccountTransaction start](v8, "start");
  }

  return v8;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CFMutableSetRef v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  const __CFSet *v22;
  _QWORD v23[5];

  -[SOSAccountTransaction updateSOSCircleCachedStatus](self, "updateSOSCircleCachedStatus");
  sub_1001DCD7C(self->_account);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  -[SOSAccountTransaction setInitialInCircle:](self, "setInitialInCircle:", objc_msgSend(v3, "isInCircle:", 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  -[SOSAccountTransaction setInitialTrusted:](self, "setInitialTrusted:", objc_msgSend(v4, "accountKeyIsTrusted"));

  -[SOSAccountTransaction setInitialCirclePeerCount:](self, "setInitialCirclePeerCount:", 0);
  if (-[SOSAccountTransaction initialInCircle](self, "initialInCircle"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trust"));
    -[SOSAccountTransaction setInitialCirclePeerCount:](self, "setInitialCirclePeerCount:", SOSCircleCountPeers(objc_msgSend(v6, "trustedCircle")));

  }
  if (-[SOSAccountTransaction initialInCircle](self, "initialInCircle"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    sub_1001DFB54(v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  v9 = sub_1001DEE3C(v8);
  -[SOSAccountTransaction setInitialUnsyncedViews:](self, "setInitialUnsyncedViews:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accountKeyDerivationParameters"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accountKeyDerivationParameters"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](NSData, "dataWithData:", v13));
    -[SOSAccountTransaction setInitialKeyParameters:](self, "setInitialKeyParameters:", v14);

  }
  else
  {
    -[SOSAccountTransaction setInitialKeyParameters:](self, "setInitialKeyParameters:", 0);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  v16 = objc_msgSend(v15, "peerInfo");

  if (v16)
  {
    v17 = (void *)SOSPeerInfoCopyEnabledViews(v16);
    -[SOSAccountTransaction setInitialViews:](self, "setInitialViews:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    objc_msgSend(v18, "ensureOctagonPeerKeys");

  }
  -[SOSAccountTransaction setPeersToRequestSync:](self, "setPeersToRequestSync:", 0);
  sub_1001D38C0(self);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  if (objc_msgSend(v19, "key_interests_need_updating"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    v21 = objc_msgSend(v20, "consolidateKeyInterest");

    if ((v21 & 1) != 0)
      goto LABEL_14;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    sub_1001F34E8(v19);
  }

LABEL_14:
  if (!-[SOSAccountTransaction quiet](self, "quiet"))
  {
    v22 = (const __CFSet *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction initialViews](self, "initialViews"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1001DD088;
    v23[3] = &unk_1002EBC50;
    v23[4] = self;
    sub_10002FEC4(v22, (uint64_t)v23);

  }
}

- (void)restart
{
  -[SOSAccountTransaction finish](self, "finish");
  -[SOSAccountTransaction start](self, "start");
}

- (void)finish
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  const __CFSet *v11;
  id v12;
  void *v13;
  id v14;
  const void *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  id v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  CFMutableSetRef v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  const void *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  const __CFSet *v37;
  const __CFSet *v38;
  const __CFSet *v39;
  CFTypeID v40;
  id v41;
  id v42;
  CFTypeID v43;
  void *v44;
  unsigned int v45;
  const void *v46;
  NSObject *v47;
  NSObject *v48;
  const void *v49;
  NSObject *v50;
  const void *v51;
  NSObject *v52;
  const __CFDictionary *v53;
  const void *v54;
  NSObject *v55;
  const void *v56;
  NSObject *v57;
  void *v58;
  id v59;
  const void *v60;
  NSObject *v61;
  id v62;
  void *v63;
  unsigned int v64;
  void *v65;
  void *v66;
  unsigned int v67;
  void *v68;
  void *v69;
  void *v70;
  unsigned int v71;
  void *v72;
  void *v73;
  void *v74;
  const void *v75;
  void *v76;
  void *v77;
  unsigned int v78;
  int v79;
  void *v80;
  void *v81;
  void *v82;
  unsigned __int8 v83;
  void *v84;
  void *v85;
  void *v86;
  unsigned int v87;
  SOSAccount *v88;
  void *v89;
  void *v90;
  void *v91;
  double v92;
  void *v93;
  const __CFSet *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  unsigned int v99;
  unsigned int v100;
  void *v101;
  CFMutableSetRef v102;
  const void *v103;
  NSObject *v104;
  int v105;
  void *v106;
  void *v107;
  unsigned __int8 v108;
  const void *v109;
  void *v110;
  unsigned __int8 v111;
  const void *v112;
  NSObject *v113;
  void *v114;
  unsigned int v115;
  const void *v116;
  NSObject *v117;
  void *v118;
  void *v119;
  void *v120;
  unsigned int v121;
  void *v122;
  int v123;
  id v124;
  const void *v125;
  NSObject *v126;
  CFStringRef v127;
  const void *v128;
  NSObject *v129;
  void *v130;
  id v131;
  id v132;
  NSObject *v133;
  const void *v134;
  id v135;
  void *v136;
  unsigned int v137;
  const __CFSet *v138;
  BOOL v139;
  BOOL v140;
  CFMutableSetRef v141;
  const void *v142;
  NSObject *v143;
  unsigned int v144;
  const __CFString *v145;
  const void *v146;
  NSObject *v147;
  const void *v148;
  void *v149;
  unsigned int v150;
  __CFSet *cf;
  const __CFSet *cfa;
  _QWORD v153[5];
  __int128 buf;
  void *v155;
  void *v156;
  NSObject *v157;
  uint8_t v158[4];
  const __CFString *v159;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  v4 = objc_msgSend(v3, "notifyCircleChangeOnExit");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  v6 = objc_msgSend(v5, "SOSMonitorModeSOSIsActive");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  v8 = objc_msgSend(v7, "isInCircle:", 0);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction peersToRequestSync](self, "peersToRequestSync"));
    if (v9)
      v10 = v6;
    else
      v10 = 0;

    if (v10 == 1)
    {
      v11 = (const __CFSet *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction peersToRequestSync](self, "peersToRequestSync"));
      -[SOSAccountTransaction setPeersToRequestSync:](self, "setPeersToRequestSync:", 0);
      sub_100201EF4(v11);

    }
    sub_1001D38C0(self);
    if (v6)
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
      sub_1001DFB54(v12);
      goto LABEL_20;
    }
  }
  else
  {
    sub_1001D38C0(self);
  }
  v12 = (id)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  if (objc_msgSend(v12, "isListeningForSync"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trust"));
    v14 = objc_msgSend(v13, "getDataSourceEngine:", objc_msgSend(v12, "factory"));

    v15 = sub_10000EF14("initial-sync");
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v17)
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Cancelling notifications to monitor in-sync", (uint8_t *)&buf, 2u);
      }

      sub_100101D94((uint64_t)v14, 0);
      sub_100101CDC((uint64_t)v14, 0);
    }
    else
    {
      if (v17)
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No engine to cancel notification from.", (uint8_t *)&buf, 2u);
      }

    }
    objc_msgSend(v12, "setIsListeningForSync:", 0);
  }

LABEL_20:
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  v19 = objc_msgSend(v18, "peerInfo");

  if (v6)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction initialID](self, "initialID"));
    v21 = objc_msgSend(v20, "isEqualToString:", SOSPeerInfoGetPeerID(v19));

    if (v21)
    {
      v22 = (void *)SOSViewCopyViewSet(0);
      -[SOSAccountTransaction setInitialUnsyncedViews:](self, "setInitialUnsyncedViews:", v22);

    }
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  v24 = sub_1001DEE3C(v23);

  if (!v6)
  {
    v28 = 0;
    goto LABEL_68;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction initialUnsyncedViews](self, "initialUnsyncedViews"));
  if (!v25)
  {
    if (!v24)
      goto LABEL_26;
LABEL_29:
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction initialUnsyncedViews](self, "initialUnsyncedViews"));
    v31 = v29;
    v28 = sub_1001DF0FC(2, (_BOOL8)v30, (_BOOL8)v24);
    if (v28)
    {
      v150 = v4;
      cf = v24;
      v32 = v31;
      v33 = sub_10000EF14("initial-sync");
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Handling initial sync done.", (uint8_t *)&buf, 2u);
      }
      v149 = v30;

      v35 = v32;
      v36 = SOSViewCopyViewSet(3);
      v37 = (const __CFSet *)SOSViewCopyViewSet(1);
      v38 = (const __CFSet *)sub_1001CA91C(v35, (uint64_t)CFSTR("pendingEnableViews"));
      if (!v38 || (v39 = v38, v40 = CFGetTypeID(v38), v40 != CFSetGetTypeID()))
        v39 = 0;
      v41 = sub_1001CA91C(v35, (uint64_t)CFSTR("pendingDisableViews"));
      if (!v41 || (v42 = v41, v43 = CFGetTypeID(v41), v43 != CFSetGetTypeID()))
        v42 = 0;
      if (v37)
      {
        *(_QWORD *)&buf = _NSConcreteStackBlock;
        *((_QWORD *)&buf + 1) = 3221225472;
        v155 = sub_1001DF0EC;
        v156 = &unk_1002EDB28;
        v157 = v36;
        CFSetApplyFunction(v37, (CFSetApplierFunction)sub_1001DF040, &buf);
      }
      if (v39)
      {
        *(_QWORD *)&buf = _NSConcreteStackBlock;
        *((_QWORD *)&buf + 1) = 3221225472;
        v155 = sub_1001DF0EC;
        v156 = &unk_1002EDB28;
        v157 = v36;
        CFSetApplyFunction(v39, (CFSetApplierFunction)sub_1001DF040, &buf);
      }
      if (v37)
        CFRelease(v37);
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject trust](v35, "trust"));
      v45 = objc_msgSend(v44, "updateViewSets:enabled:disabled:", v35, v36, v42);

      if (v36)
        CFRelease(v36);
      v24 = cf;
      v30 = v149;
      if (v45)
      {
        sub_1001E6948(v35, (uint64_t)CFSTR("pendingEnableViews"), 0);
        sub_1001E6948(v35, (uint64_t)CFSTR("pendingDisableViews"), 0);
        v46 = sub_10000EF14("views");
        v47 = objc_claimAutoreleasedReturnValue(v46);
        v4 = v150;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "updated view sets!", (uint8_t *)&buf, 2u);
        }

        v48 = v35;
      }
      else
      {
        v49 = sub_10000EF14("SecError");
        v50 = objc_claimAutoreleasedReturnValue(v49);
        v4 = v150;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Could not update view sets", (uint8_t *)&buf, 2u);
        }

        v51 = sub_10000EF14("initial-sync");
        v48 = objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Account could not add the pending view sets", (uint8_t *)&buf, 2u);
        }
      }

      v52 = v35;
      v53 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(-[NSObject waitForInitialSync_blocks](v52, "waitForInitialSync_blocks"));
      -[NSObject setWaitForInitialSync_blocks:](v52, "setWaitForInitialSync_blocks:", 0);
      if (v53)
      {
        *(_QWORD *)&buf = _NSConcreteStackBlock;
        *((_QWORD *)&buf + 1) = 3221225472;
        v155 = sub_1001DF268;
        v156 = &unk_1002EBE88;
        v157 = v52;
        CFDictionaryApplyFunction(v53, (CFDictionaryApplierFunction)sub_1001DF330, &buf);

        CFRelease(v53);
      }

    }
    if (sub_1001DF0FC(5, (_BOOL8)v30, (_BOOL8)v24))
    {
      v54 = sub_10000EF14("initial-sync");
      v55 = objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Handling Required Backup Sync done", (uint8_t *)&buf, 2u);
      }

      v28 = 1;
    }

    v56 = sub_10000EF14("initial-sync");
    v57 = objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction initialUnsyncedViews](self, "initialUnsyncedViews"));
      v59 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "shortDescription"));
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v59;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Unsynced was: %@", (uint8_t *)&buf, 0xCu);

    }
    v60 = sub_10000EF14("initial-sync");
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      v62 = (id)objc_claimAutoreleasedReturnValue(-[__CFSet shortDescription](v24, "shortDescription"));
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v62;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Unsynced is: %@", (uint8_t *)&buf, 0xCu);

    }
    goto LABEL_66;
  }
  v26 = v25;
  v27 = objc_msgSend(v25, "isEqual:", v24);

  if ((v27 & 1) == 0)
    goto LABEL_29;
LABEL_26:
  v28 = 0;
LABEL_66:
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  v64 = objc_msgSend(v63, "engine_peer_state_needs_repair");

  if (v64)
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    sub_1001CFD08(v65);

    v28 = 1;
  }
LABEL_68:
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  v67 = objc_msgSend(v66, "circle_rings_retirements_need_attention");

  if (v67)
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    objc_msgSend(v68, "setCircle_rings_retirements_need_attention:", 0);

    v69 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    objc_msgSend(v69, "triggerRingUpdate");

    v28 = 1;
  }
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  v71 = objc_msgSend(v70, "need_backup_peers_created_after_backup_key_set");

  if (v71)
  {
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    objc_msgSend(v72, "setNeed_backup_peers_created_after_backup_key_set:", 0);

    v28 = 1;
  }
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  if (objc_msgSend(v73, "peerInfo"))
  {
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    v75 = (const void *)SOSPeerInfoCopyEnabledViews(objc_msgSend(v74, "peerInfo"));

  }
  else
  {
    v75 = 0;
  }

  v76 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction initialViews](self, "initialViews"));
  v77 = v76;
  if (v76)
    v78 = objc_msgSend(v76, "isEqual:", v75);
  else
    v78 = v75 == 0;
  v79 = v78 ^ 1;

  if (v75)
    CFRelease(v75);
  if ((v28 | v79) == 1)
  {
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    sub_1001DD750(v80);

  }
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  if (objc_msgSend(v81, "key_interests_need_updating"))
  {
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    v83 = objc_msgSend(v82, "consolidateKeyInterest");

    if ((v83 & 1) != 0)
      goto LABEL_86;
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    sub_1001F34E8(v81);
  }

LABEL_86:
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  objc_msgSend(v84, "setEngine_peer_state_needs_repair:", 0);

  v85 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  objc_msgSend(v85, "flattenToSaveBlock");

  v86 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  v87 = objc_msgSend(v86, "isInCircle:", 0);

  if ((v6 & v87 & v4) == 1)
  {
    v88 = self->_account;
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount settings](v88, "settings"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKey:", CFSTR("lastKVSCleanup")));

    v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v91, "timeIntervalSinceDate:", v90);
    if (v92 >= 259200.0)
      sub_1001D0198(v88, 0);

  }
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  v94 = (const __CFSet *)objc_msgSend(v93, "peerInfo");

  if (v94)
    v94 = (const __CFSet *)SOSPeerInfoCopyEnabledViews(v94);
  if (!-[SOSAccountTransaction quiet](self, "quiet"))
  {
    v153[0] = _NSConcreteStackBlock;
    v153[1] = 3221225472;
    v153[2] = sub_1001DCC54;
    v153[3] = &unk_1002EBC50;
    v153[4] = self;
    sub_10002FEC4(v94, (uint64_t)v153);
  }
  cfa = v94;
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction initialKeyParameters](self, "initialKeyParameters"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  v97 = objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "accountKeyDerivationParameters"));
  v98 = (void *)v97;
  if (v95)
    v99 = objc_msgSend(v95, "isEqual:", v97);
  else
    v99 = v97 == 0;

  if (-[SOSAccountTransaction initialTrusted](self, "initialTrusted")
    && ((!-[SOSAccountTransaction initialInCircle](self, "initialInCircle") | v99 | v87 ^ 1) & 1) == 0)
  {
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    v100 = objc_msgSend(v101, "accountKeyIsTrusted");

  }
  else
  {
    v100 = 0;
  }
  if (v87 == -[SOSAccountTransaction initialInCircle](self, "initialInCircle"))
  {
    if (v87)
    {
      v106 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction initialViews](self, "initialViews"));
      if (v106)
      {
        v107 = v106;
        v108 = objc_msgSend(v106, "isEqual:", cfa);

        if ((v108 & 1) != 0)
          goto LABEL_108;
      }
      else if (!cfa)
      {
        goto LABEL_108;
      }
      v102 = v24;
      dword_100341578 = 0;
      v148 = sub_10000EF14("secdNotify");
      v104 = objc_claimAutoreleasedReturnValue(v148);
      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "Notified clients of kSOSCCViewMembershipChangedNotification for viewchange(only)", (uint8_t *)&buf, 2u);
      }
      v105 = 1;
      goto LABEL_113;
    }
LABEL_108:
    v102 = v24;
    if (!v100)
    {
      v105 = 0;
      goto LABEL_114;
    }
    dword_100341578 = 0;
    v109 = sub_10000EF14("secdNotify");
    v104 = objc_claimAutoreleasedReturnValue(v109);
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "Notified clients of kSOSCCCircleChangedNotification for userKey change", (uint8_t *)&buf, 2u);
    }
    v105 = 0;
    goto LABEL_112;
  }
  v102 = v24;
  dword_100341578 = 0;
  v103 = sub_10000EF14("secdNotify");
  v104 = objc_claimAutoreleasedReturnValue(v103);
  if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "Notified clients of kSOSCCCircleChangedNotification && kSOSCCViewMembershipChangedNotification for circle/view change", (uint8_t *)&buf, 2u);
  }
  v105 = 1;
LABEL_112:
  v4 = 1;
LABEL_113:

LABEL_114:
  if (!-[SOSAccountTransaction initialTrusted](self, "initialTrusted")
    || ((!-[SOSAccountTransaction initialInCircle](self, "initialInCircle") | v99) & 1) != 0
    || (v110 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account")),
        v111 = objc_msgSend(v110, "accountKeyIsTrusted"),
        v110,
        (v111 & 1) != 0))
  {
    if (-[SOSAccountTransaction initialTrusted](self, "initialTrusted"))
    {
      if ((v4 & 1) == 0)
        goto LABEL_143;
LABEL_130:
      -[SOSAccountTransaction updateSOSCircleCachedStatus](self, "updateSOSCircleCachedStatus");
      v119 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
      objc_msgSend(v119, "sosEvaluateIfNeeded");

      if ((v105 & 1) == 0)
        goto LABEL_132;
      goto LABEL_131;
    }
  }
  else
  {
    v112 = sub_10000EF14("userKeyTrust");
    v113 = objc_claimAutoreleasedReturnValue(v112);
    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_DEFAULT, "No longer trust user public key - prompting for password.", (uint8_t *)&buf, 2u);
    }

    notify_post("com.apple.security.publickeynotavailable");
    dword_100341578 = 0;
    if (-[SOSAccountTransaction initialTrusted](self, "initialTrusted"))
      goto LABEL_130;
    v4 = 1;
  }
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  v115 = objc_msgSend(v114, "accountKeyIsTrusted") & v87;

  if (v115 == 1)
  {
    v116 = sub_10000EF14("userKeyTrust");
    v117 = objc_claimAutoreleasedReturnValue(v116);
    if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "UserKey is once again trusted and we're valid in circle.", (uint8_t *)&buf, 2u);
    }

    -[SOSAccountTransaction updateSOSCircleCachedStatus](self, "updateSOSCircleCachedStatus");
    v118 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    objc_msgSend(v118, "sosEvaluateIfNeeded");

    goto LABEL_131;
  }
  if (v4)
    goto LABEL_130;
LABEL_143:
  if (v105)
LABEL_131:
    sub_1001DCD7C(self->_account);
LABEL_132:
  v120 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  v121 = objc_msgSend(v120, "notifyBackupOnExit");

  if (v121)
  {
    notify_post("com.apple.security.itembackup");
    v122 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    objc_msgSend(v122, "setNotifyBackupOnExit:", 0);

  }
  v123 = dword_100341578;
  if (dword_100341578 <= 0)
  {
    v124 = (id)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    v125 = sub_10000EF14("accountLogState");
    v126 = objc_claimAutoreleasedReturnValue(v125);
    if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_DEFAULT, "Start", (uint8_t *)&buf, 2u);
    }

    v127 = sub_1001CBC24(v124);
    v128 = sub_10000EF14("accountLogState");
    v129 = objc_claimAutoreleasedReturnValue(v128);
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v127;
      _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);
    }

    if (v127)
      CFRelease(v127);
    v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "trust"));
    if (objc_msgSend(v130, "trustedCircle"))
    {
      v131 = objc_msgSend(v130, "trustedCircle");
      v132 = objc_msgSend(v124, "accountKey");
      v133 = objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "peerID"));
      SOSCircleLogState("accountLogState", v131, v132, v133);
    }
    else
    {
      v134 = sub_10000EF14("accountLogState");
      v133 = objc_claimAutoreleasedReturnValue(v134);
      if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_DEFAULT, "ACCOUNT: No Circle", (uint8_t *)&buf, 2u);
      }
    }

    v135 = (id)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "trust"));
    v137 = objc_msgSend(v136, "isInCircleOnly:", 0);

    if (v137)
    {
      v138 = (const __CFSet *)objc_msgSend(v135, "peerInfo");
      v139 = sub_1001DF090(v135, 2);
      v140 = sub_1001DF090(v135, 5);
      if (v138)
        v138 = (const __CFSet *)SOSPeerInfoCopyEnabledViews(v138);
      *(_QWORD *)&buf = _NSConcreteStackBlock;
      *((_QWORD *)&buf + 1) = 3221225472;
      v155 = sub_1001D18CC;
      v156 = &unk_1002EB500;
      LOBYTE(v157) = v139;
      BYTE1(v157) = v140;
      sub_10002FEC4(v138, (uint64_t)&buf);
      if (v138)
        CFRelease(v138);
      v141 = sub_1001DEE3C(v135);
      sub_1001D19C0(&stru_1002EB520, CFSTR("null"));
      if (v141)
        CFRelease(v141);
      if (qword_1003412D8 != -1)
        dispatch_once(&qword_1003412D8, &stru_1002E7880);
      if (byte_1003412D0)
      {
        v142 = sub_10000EF14("accountLogState");
        v143 = objc_claimAutoreleasedReturnValue(v142);
        if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
        {
          v144 = objc_msgSend(v135, "sosCompatibilityMode");
          v145 = CFSTR("disabled");
          if (v144)
            v145 = CFSTR("enabled");
          *(_DWORD *)v158 = 138412290;
          v159 = v145;
          _os_log_impl((void *)&_mh_execute_header, v143, OS_LOG_TYPE_DEFAULT, "SOS CompatibilityMode: %@", v158, 0xCu);
        }

      }
    }
    v146 = sub_10000EF14("accountLogState");
    v147 = objc_claimAutoreleasedReturnValue(v146);
    if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v158 = 0;
      _os_log_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_DEFAULT, "Finish", v158, 2u);
    }

    v123 = 200;
  }
  dword_100341578 = v123 - 1;
  if (cfa)
    CFRelease(cfa);

}

- (void)requestSyncWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction peersToRequestSync](self, "peersToRequestSync"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[SOSAccountTransaction setPeersToRequestSync:](self, "setPeersToRequestSync:", v6);

  }
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction peersToRequestSync](self, "peersToRequestSync"));
  objc_msgSend(v7, "addObject:", v4);

}

- (void)requestSyncWithPeers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction peersToRequestSync](self, "peersToRequestSync"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[SOSAccountTransaction setPeersToRequestSync:](self, "setPeersToRequestSync:", v6);

  }
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction peersToRequestSync](self, "peersToRequestSync"));
  objc_msgSend(v7, "unionSet:", v4);

}

- (SOSAccount)account
{
  return (SOSAccount *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)initialInCircle
{
  return self->_initialInCircle;
}

- (void)setInitialInCircle:(BOOL)a3
{
  self->_initialInCircle = a3;
}

- (NSSet)initialViews
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInitialViews:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSSet)initialUnsyncedViews
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInitialUnsyncedViews:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)initialID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInitialID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)initialTrusted
{
  return self->_initialTrusted;
}

- (void)setInitialTrusted:(BOOL)a3
{
  self->_initialTrusted = a3;
}

- (NSData)initialKeyParameters
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInitialKeyParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (unsigned)initialCirclePeerCount
{
  return self->_initialCirclePeerCount;
}

- (void)setInitialCirclePeerCount:(unsigned int)a3
{
  self->_initialCirclePeerCount = a3;
}

- (BOOL)quiet
{
  return self->_quiet;
}

- (void)setQuiet:(BOOL)a3
{
  self->_quiet = a3;
}

- (NSMutableSet)peersToRequestSync
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPeersToRequestSync:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peersToRequestSync, 0);
  objc_storeStrong((id *)&self->_initialKeyParameters, 0);
  objc_storeStrong((id *)&self->_initialID, 0);
  objc_storeStrong((id *)&self->_initialUnsyncedViews, 0);
  objc_storeStrong((id *)&self->_initialViews, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
