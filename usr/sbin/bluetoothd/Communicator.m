@implementation Communicator

- (Communicator)initWithDelegate:(Delegate *)a3
{
  Communicator *v4;
  Communicator *v5;
  id v6;
  uint64_t v7;
  TUCallCenter *tuCallCenter;
  void *v9;
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
  id v20;
  id v21;
  id v22;
  CoreTelephonyClient *v23;
  CoreTelephonyClient *ctClient;
  __CTServerConnection *v25;
  uint64_t v26;
  _QWORD v28[4];
  Communicator *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)Communicator;
  v4 = -[Communicator init](&v30, "init");
  v5 = v4;
  if (v4)
  {
    v4->_delegate = a3;
    if (NSClassFromString(CFSTR("TUCallCenter")))
    {
      v6 = *(id *)(sub_100475960() + 8);
      v7 = objc_claimAutoreleasedReturnValue(+[TUCallCenter callCenterWithQueue:](TUCallCenter, "callCenterWithQueue:", v6));
      tuCallCenter = v5->_tuCallCenter;
      v5->_tuCallCenter = (TUCallCenter *)v7;

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUCallCenter callServicesClientCapabilities](v5->_tuCallCenter, "callServicesClientCapabilities"));
      objc_msgSend(v9, "setWantsToScreenCalls:", 1);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUCallCenter callServicesClientCapabilities](v5->_tuCallCenter, "callServicesClientCapabilities"));
      objc_msgSend(v10, "save");

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v11, "addObserver:selector:name:object:", v5, "_handleTUCallCenterCallStatusChangedNotification:", TUCallCenterCallStatusChangedNotification, 0);

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v12, "addObserver:selector:name:object:", v5, "_handleTUCallCenterCallStatusChangedNotification:", TUCallCenterVideoCallStatusChangedNotification, 0);

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v13, "addObserver:selector:name:object:", v5, "_handleTUCallCenterCallStatusChangedNotification:", TUCallCenterCallInvitationSentNotification, 0);

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v14, "addObserver:selector:name:object:", v5, "_handleTUCallCenterCallStatusChangedNotification:", TUCallCenterVideoCallInvitationSentNotification, 0);

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v15, "addObserver:selector:name:object:", v5, "_handleTUCallCenterCallStatusChangedNotification:", TUCallCenterCallerIDChangedNotification, 0);

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v16, "addObserver:selector:name:object:", v5, "_handleTUCallCenterCallStatusChangedNotification:", TUCallCenterCallConnectedNotification, 0);

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v17, "addObserver:selector:name:object:", v5, "_handleTUCallCenterCallStatusChangedNotification:", TUCallCenterCallContinuityStateChangedNotification, 0);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v18, "addObserver:selector:name:object:", v5, "_handleTUCallCenterCallExpanseStatusChangedNotification:", TUCallMixesVoiceWithMediaChangedNotification, 0);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v19, "addObserver:selector:name:object:", v5, "_handleTUCallCenterCallStatusChangedNotification:", TUCallCenterIsScreeningChangedNotification, 0);

      -[Communicator _updateCalls](v5, "_updateCalls");
    }
    if (sub_1004F948C())
    {
      v20 = *(id *)(sub_100475960() + 8);
      v5->_ctServerConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue(kCFAllocatorDefault, CFSTR("com.apple.bluetooth.communicator"), v20, 0);

      v21 = objc_alloc((Class)CoreTelephonyClient);
      v22 = *(id *)(sub_100475960() + 8);
      v23 = (CoreTelephonyClient *)objc_msgSend(v21, "initWithQueue:", v22);
      ctClient = v5->_ctClient;
      v5->_ctClient = v23;

      -[CoreTelephonyClient setDelegate:](v5->_ctClient, "setDelegate:", v5);
      v25 = -[Communicator ctServerConnection](v5, "ctServerConnection");
      v26 = kCTCellularTransmitStateNotification;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100457B88;
      v28[3] = &unk_10092F720;
      v29 = v5;
      _CTServerConnectionRegisterBlockForNotification(v25, v26, v28);

    }
  }
  return v5;
}

- (void)invalidate
{
  void *v3;

  if (-[Communicator ctServerConnection](self, "ctServerConnection"))
    _CTServerConnectionUnregisterForAllNotifications(-[Communicator ctServerConnection](self, "ctServerConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[Communicator setDelegate:](self, "setDelegate:", 0);
}

- (void)dealloc
{
  objc_super v3;

  if (-[Communicator ctServerConnection](self, "ctServerConnection"))
    CFRelease(-[Communicator ctServerConnection](self, "ctServerConnection"));
  v3.receiver = self;
  v3.super_class = (Class)Communicator;
  -[Communicator dealloc](&v3, "dealloc");
}

- (id)_identifierForCall:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = objc_alloc((Class)NSUUID);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uniqueProxyIdentifier"));
  v6 = objc_msgSend(v4, "initWithUUIDString:", v5);

  return v6;
}

- (id)_callForIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "UUIDString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "callWithUniqueProxyIdentifier:", v4));

  return v6;
}

- (BOOL)_appearsToBeEmailAddress:(id)a3
{
  return objc_msgSend(a3, "containsString:", CFSTR("@"));
}

- (void)_updateCalls
{
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id *v11;
  unsigned int v12;
  BOOL v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint8_t *v28;
  void *v29;
  id obj;
  _BYTE v31[24];
  void *__p[2];
  char v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id *v41;
  id *v42;
  uint64_t v43;
  std::string __str;
  uint8_t buf[16];
  _OWORD v46[4];
  std::string v47;
  _BYTE v48[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentAudioAndVideoCalls"));

  v41 = 0;
  v42 = 0;
  v43 = 0;
  -[Communicator calls](self, "calls");
  v38 = 0;
  v39 = 0;
  v40 = 0;
  sub_1005C5C20(&v38);
  v4 = qword_100999858;
  if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v29;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Current TU call(s): %@", buf, 0xCu);
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v29;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v35;
LABEL_5:
    v7 = 0;
    while (2)
    {
      if (*(_QWORD *)v35 != v6)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v7);
      memset(&v47, 0, sizeof(v47));
      *(_OWORD *)buf = 0u;
      memset(v46, 0, sizeof(v46));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator _identifierForCall:](self, "_identifierForCall:", v8));
      sub_10045CA68((uint64_t)buf, v9);

      v10 = *(id *)buf;
      v11 = sub_1005C5DCC(&v41, v10);

      v12 = objc_msgSend(v8, "status");
      switch(v12)
      {
        case 0u:
        case 6u:
          goto LABEL_43;
        case 1u:
          if ((unint64_t)objc_msgSend(obj, "count") < 2)
          {
            v12 = 1;
          }
          else if (objc_msgSend(v8, "isConnected"))
          {
            v12 = 1;
          }
          else
          {
            v12 = 6;
          }
          goto LABEL_22;
        case 2u:
          goto LABEL_22;
        case 3u:
          v13 = objc_msgSend(v8, "hasSentInvitation") == 0;
          v14 = 3;
          goto LABEL_15;
        case 4u:
          v13 = objc_msgSend(obj, "count") == (id)1;
          v14 = 5;
LABEL_15:
          if (v13)
            v12 = v14;
          else
            v12 = v14 + 1;
          goto LABEL_22;
        case 5u:
          if (objc_msgSend(obj, "count") != (id)1 || v42 == v11)
            goto LABEL_43;
          v12 = *((_DWORD *)v11 + 4);
LABEL_22:
          LODWORD(v46[0]) = v12;
LABEL_23:
          if (v42 != v11)
            *(_DWORD *)&buf[8] = *((_DWORD *)v11 + 2);
          buf[12] = objc_msgSend(v8, "isOutgoing");
          buf[13] = objc_msgSend(v8, "isConferenced");
          buf[14] = objc_msgSend(v8, "mixesVoiceWithMedia");
          buf[15] = objc_msgSend(v8, "isScreening");
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "handle"));
          v16 = v15;
          if (v15)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "value"));
            v18 = -[Communicator _appearsToBeEmailAddress:](self, "_appearsToBeEmailAddress:", v17);

            if ((v18 & 1) == 0)
            {
              v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "value")));
              sub_1005D4160(&__str, objc_msgSend(v19, "UTF8String"));
              sub_1005D4228((std::string *)((char *)v46 + 8), (uint64_t)&__str);
              sub_1005D4204(&__str);

            }
            if (v42 == v11 || !sub_1005D4270((unsigned __int8 *)v11 + 24, (unsigned __int8 *)v46 + 8))
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayName"));
              v21 = v20;
              if (v20)
              {
                if ((unint64_t)objc_msgSend(v20, "length") >= 0x81)
                {
                  v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "substringToIndex:", 128));

                  v21 = (void *)v22;
                }
                v23 = objc_retainAutorelease(v21);
                if (objc_msgSend(v23, "UTF8String"))
                {
                  sub_100091AE8(__p, (char *)objc_msgSend(objc_retainAutorelease(v23), "UTF8String"));
                  sub_1004174B8((uint64_t)__p, &__str);
                  std::string::operator=(&v47, &__str);
                  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
                    operator delete(__str.__r_.__value_.__l.__data_);
                  if (v33 < 0)
                    operator delete(__p[0]);
                }
                else
                {
                  v24 = qword_100999858;
                  if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(__str.__r_.__value_.__l.__data_) = 138412290;
                    *(std::string::size_type *)((char *)__str.__r_.__value_.__r.__words + 4) = (std::string::size_type)v8;
                    _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Invalid call display name for %@", (uint8_t *)&__str, 0xCu);
                  }
                }

              }
            }
            else
            {
              std::string::operator=(&v47, (const std::string *)(v11 + 10));
            }
          }

          sub_1005C5CAC(&v38, (uint64_t)buf);
LABEL_43:
          if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v47.__r_.__value_.__l.__data_);
          sub_1005D4204((char *)v46 + 8);

          if (v5 != (id)++v7)
            continue;
          v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
          if (!v5)
            goto LABEL_47;
          goto LABEL_5;
        default:
          goto LABEL_23;
      }
    }
  }
LABEL_47:

  v26 = v38;
  v25 = v39;
  while (v26 != v25)
  {
    if (!*(_DWORD *)(v26 + 8))
    {
      *(_DWORD *)(v26 + 8) = sub_1005C5E8C(&v38);
      v25 = v39;
    }
    v26 += 104;
  }
  v27 = (id)qword_100999858;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    sub_1005C5ED4(&v38, (std::string *)buf);
    v28 = (SBYTE7(v46[0]) & 0x80u) == 0 ? buf : *(uint8_t **)buf;
    LODWORD(__str.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)__str.__r_.__value_.__r.__words + 4) = (std::string::size_type)v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Updated call(s): %s", (uint8_t *)&__str, 0xCu);
    if (SBYTE7(v46[0]) < 0)
      operator delete(*(void **)buf);
  }

  sub_1005C5CA8((int)v31);
  -[Communicator setCalls:](self, "setCalls:", v31);
  *(_QWORD *)buf = v31;
  sub_10026BD18((void ***)buf);
  *(_QWORD *)buf = &v38;
  sub_10026BD18((void ***)buf);
  *(_QWORD *)buf = &v41;
  sub_10026BD18((void ***)buf);

}

- (id)_myNumber
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator _getSubscriptionContext](self, "_getSubscriptionContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "phoneNumber"));

  return v3;
}

- (int)_dialNumber:(const void *)a3 uid:(const void *)a4 providerIdentifier:(const void *)a5
{
  id v9;
  const void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  const void *v17;
  void *v18;
  void *v19;
  const void *v20;
  void *v21;
  NSObject *v22;
  const void *v23;
  void *v24;
  int v26;
  const void *v27;
  __int16 v28;
  void *v29;

  v9 = objc_alloc_init((Class)TUCallProviderManager);
  if (*((char *)a5 + 23) >= 0)
    v10 = a5;
  else
    v10 = *(const void **)a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "providerWithIdentifier:", v11));
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "telephonyProvider"));
  v15 = v14;

  v16 = objc_msgSend(objc_alloc((Class)TUDialRequest), "initWithProvider:", v15);
  if (*((char *)a3 + 23) >= 0)
    v17 = a3;
  else
    v17 = *(const void **)a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle handleWithDestinationID:](TUHandle, "handleWithDestinationID:", v18));
  objc_msgSend(v16, "setHandle:", v19);

  if (*((char *)a4 + 23) >= 0)
    v20 = a4;
  else
    v20 = *(const void **)a4;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v20));
  objc_msgSend(v16, "setAudioSourceIdentifier:", v21);

  v22 = qword_100999858;
  if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
  {
    if (*((char *)a3 + 23) >= 0)
      v23 = a3;
    else
      v23 = *(const void **)a3;
    v26 = 136315394;
    v27 = v23;
    v28 = 2112;
    v29 = v15;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Dialing '%s' with TU provider %@", (uint8_t *)&v26, 0x16u);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  objc_msgSend(v24, "launchAppForDialRequest:completion:", v16, 0);

  return 0;
}

- (int)_redialNumberWhileScreening:(const void *)a3 uid:(const void *)a4 providerIdentifier:(const void *)a5
{
  id v9;
  const void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  const void *v17;
  void *v18;
  void *v19;
  const void *v20;
  void *v21;
  NSObject *v22;
  const void *v23;
  void *v24;
  char v25;
  void *v26;
  int v28;
  const void *v29;
  __int16 v30;
  void *v31;

  v9 = objc_alloc_init((Class)TUCallProviderManager);
  if (*((char *)a5 + 23) >= 0)
    v10 = a5;
  else
    v10 = *(const void **)a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "providerWithIdentifier:", v11));
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "telephonyProvider"));
  v15 = v14;

  v16 = objc_msgSend(objc_alloc((Class)TUDialRequest), "initWithProvider:", v15);
  if (*((char *)a3 + 23) >= 0)
    v17 = a3;
  else
    v17 = *(const void **)a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle handleWithDestinationID:](TUHandle, "handleWithDestinationID:", v18));
  objc_msgSend(v16, "setHandle:", v19);

  if (*((char *)a4 + 23) >= 0)
    v20 = a4;
  else
    v20 = *(const void **)a4;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v20));
  objc_msgSend(v16, "setAudioSourceIdentifier:", v21);

  v22 = qword_100999858;
  if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
  {
    if (*((char *)a3 + 23) >= 0)
      v23 = a3;
    else
      v23 = *(const void **)a3;
    v28 = 136315394;
    v29 = v23;
    v30 = 2112;
    v31 = v15;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Calling handleRedialCommandWhileScreening '%s' with TU provider %@", (uint8_t *)&v28, 0x16u);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  v25 = objc_opt_respondsToSelector(v24, "handleRedialCommandWhileScreening:");

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  if ((v25 & 1) != 0)
    objc_msgSend(v26, "handleRedialCommandWhileScreening:", v16);
  else
    objc_msgSend(v26, "launchAppForDialRequest:completion:", v16, 0);

  return 0;
}

- (int)_answerCall:(id)a3 uid:(const void *)a4 behavior:(int64_t)a5
{
  id v8;
  id v9;
  const void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = objc_msgSend(objc_alloc((Class)TUAnswerRequest), "initWithCall:", v8);
  if (*((char *)a4 + 23) >= 0)
    v10 = a4;
  else
    v10 = *(const void **)a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v10));
  objc_msgSend(v9, "setSourceIdentifier:", v11);

  objc_msgSend(v9, "setBehavior:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  objc_msgSend(v12, "answerWithRequest:", v9);

  return 0;
}

- (id)_getSubscriptionContext
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator ctClient](self, "ctClient"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getSubscriptionInfoWithError:", 0));

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subscriptions", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userDefaultVoice"));
        v10 = objc_msgSend(v9, "BOOLValue");

        if ((v10 & 1) != 0)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)activeSubscriptionsDidChange
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  Delegate *v7;
  void *v8;
  Delegate *v9;
  Delegate *v10;
  uint8_t v11[16];

  if (-[Communicator delegate](self, "delegate"))
  {
    v3 = qword_100999858;
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Received 'active subscriptions did change' delegate", v11, 2u);
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator _getSubscriptionContext](self, "_getSubscriptionContext"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator ctClient](self, "ctClient"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getSignalStrengthInfo:error:", v4, 0));

    v7 = -[Communicator delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bars"));
    (*((void (**)(Delegate *, _QWORD))v7->var0 + 4))(v7, objc_msgSend(v8, "unsignedIntValue"));

    v9 = -[Communicator delegate](self, "delegate");
    (*((void (**)(Delegate *))v9->var0 + 3))(v9);
    v10 = -[Communicator delegate](self, "delegate");
    (*((void (**)(Delegate *))v10->var0 + 1))(v10);

  }
}

- (void)operatorNameChanged:(id)a3 name:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  NSObject *v8;
  Delegate *v9;
  uint8_t v10[16];

  v5 = a3;
  if (-[Communicator delegate](self, "delegate"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userDefaultVoice"));
    v7 = objc_msgSend(v6, "BOOLValue");

    if (v7)
    {
      v8 = qword_100999858;
      if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Received 'operator name changed' delegate", v10, 2u);
      }
      v9 = -[Communicator delegate](self, "delegate");
      (*((void (**)(Delegate *))v9->var0 + 1))(v9);
    }
  }

}

- (void)signalStrengthChanged:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  void *v11;
  unsigned __int8 v12;
  Delegate *v13;
  uint8_t v14[16];

  v6 = a3;
  v7 = a4;
  if (-[Communicator delegate](self, "delegate"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userDefaultVoice"));
    v9 = objc_msgSend(v8, "BOOLValue");

    if (v9)
    {
      v10 = qword_100999858;
      if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Received 'signal strength changed' delegate", v14, 2u);
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bars"));
      v12 = objc_msgSend(v11, "unsignedIntValue");

      v13 = -[Communicator delegate](self, "delegate");
      (*((void (**)(Delegate *, _QWORD))v13->var0 + 4))(v13, v12);
    }
  }

}

- (void)displayStatusChanged:(id)a3 status:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  NSObject *v8;
  Delegate *v9;
  uint8_t v10[16];

  v5 = a3;
  if (-[Communicator delegate](self, "delegate"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userDefaultVoice"));
    v7 = objc_msgSend(v6, "BOOLValue");

    if (v7)
    {
      v8 = qword_100999858;
      if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Received 'display status changed' delegate", v10, 2u);
      }
      v9 = -[Communicator delegate](self, "delegate");
      (*((void (**)(Delegate *))v9->var0 + 3))(v9);
    }
  }

}

- (void)context:(id)a3 capabilitiesChanged:(id)a4
{
  NSObject *v5;
  Delegate *v6;
  uint8_t v7[16];

  if (-[Communicator delegate](self, "delegate", a3, a4))
  {
    v5 = qword_100999858;
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Received 'context capabilities changed' notification", v7, 2u);
    }
    v6 = -[Communicator delegate](self, "delegate");
    (*((void (**)(Delegate *))v6->var0 + 2))(v6);
  }
}

- (void)networkReselectionNeeded:(id)a3
{
  NSObject *v4;
  Delegate *v5;
  Delegate *v6;
  uint8_t v7[16];

  if (-[Communicator delegate](self, "delegate", a3))
  {
    v4 = qword_100999858;
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Received 'network selection needed' notification", v7, 2u);
    }
    v5 = -[Communicator delegate](self, "delegate");
    (*((void (**)(Delegate *))v5->var0 + 1))(v5);
    v6 = -[Communicator delegate](self, "delegate");
    (*((void (**)(Delegate *))v6->var0 + 3))(v6);
  }
}

- (void)networkSelected:(id)a3 success:(BOOL)a4 mode:(id)a5
{
  NSObject *v6;
  Delegate *v7;
  Delegate *v8;
  uint8_t v9[16];

  if (-[Communicator delegate](self, "delegate", a3, a4, a5))
  {
    v6 = qword_100999858;
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Received 'network selection changed' notification", v9, 2u);
    }
    v7 = -[Communicator delegate](self, "delegate");
    (*((void (**)(Delegate *))v7->var0 + 1))(v7);
    v8 = -[Communicator delegate](self, "delegate");
    (*((void (**)(Delegate *))v8->var0 + 3))(v8);
  }
}

- (void)_handleTUCallCenterCallStatusChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator _identifierForCall:](self, "_identifierForCall:", v5));

  v7 = *(NSObject **)(sub_100475960() + 8);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004593D8;
  v9[3] = &unk_100918340;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

}

- (void)_handleTUCallCenterCallExpanseStatusChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v4 = a3;
  v5 = (id)qword_100999858;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
    v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Expanse status changed for call: %@", (uint8_t *)&v7, 0xCu);

  }
  -[Communicator _updateCalls](self, "_updateCalls");

}

- (void)_handleCTCellularTransmitStateChangedNotification:(__CFDictionary *)a3
{
  NSObject *v5;
  const void *Value;
  _BOOL8 v7;
  Delegate *v8;
  uint8_t v9[16];

  if (-[Communicator delegate](self, "delegate"))
  {
    v5 = qword_100999858;
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Received 'cellular transmit state changed' notification", v9, 2u);
    }
    Value = CFDictionaryGetValue(a3, kKeyCTCellularTransmitState);
    if (Value)
    {
      v7 = CFEqual(Value, kCTCellularTransmitStarted) != 0;
      v8 = -[Communicator delegate](self, "delegate");
      (*((void (**)(Delegate *, _BOOL8))v8->var0 + 5))(v8, v7);
    }
  }
}

+ (id)myNumber
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  unsigned int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getSubscriptionInfoWithError:", 0));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subscriptions", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userDefaultVoice"));
        v10 = objc_msgSend(v9, "BOOLValue");

        if (v10)
        {
          v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "phoneNumber"));
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)supports3WC
{
  const void *Value;
  BOOL result;
  char v5;
  CFTypeRef arg;

  result = 1;
  if (-[Communicator ctServerConnection](self, "ctServerConnection"))
  {
    arg = 0;
    v5 = 0;
    _CTServerConnectionCopySystemCapabilities(-[Communicator ctServerConnection](self, "ctServerConnection"), &arg, &v5);
    if (v5)
    {
      CFAutorelease(arg);
      Value = CFDictionaryGetValue((CFDictionaryRef)arg, kConferenceCallType);
      if (CFEqual(Value, kConferenceCallType3Party))
        return 0;
    }
  }
  return result;
}

- (int)answerIncomingCall:()basic_string<char
{
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  int v10;
  void *v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "audioOrVideoCallWithStatus:", 4));

  v7 = qword_100999858;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Found incoming TU call to answer: %@", (uint8_t *)&v10, 0xCu);
    }
    v8 = -[Communicator _answerCall:uid:behavior:](self, "_answerCall:uid:behavior:", v6, a3, 0);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
      sub_1006F2600();
    v8 = 13;
  }

  return v8;
}

- (int)rejectIncomingCall
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  int v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "audioOrVideoCallWithStatus:", 4));

  v5 = qword_100999858;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Found incoming TU call to reject: %@", (uint8_t *)&v9, 0xCu);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
    objc_msgSend(v6, "disconnectCall:", v4);

    v7 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
      sub_1006F262C();
    v7 = 13;
  }

  return v7;
}

- (int)hangupActiveCall
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  int v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "audioOrVideoCallWithStatus:", 3));

  if (v4)
  {
    v5 = qword_100999858;
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Found sending TU call to disconnect: %@", (uint8_t *)&v13, 0xCu);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
    objc_msgSend(v6, "disconnectCall:", v4);
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "audioAndVideoCallsWithStatus:", 1));

  v8 = objc_msgSend(v6, "count");
  v9 = qword_100999858;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Found active TU calls to disconnect: %@", (uint8_t *)&v13, 0xCu);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
    objc_msgSend(v10, "disconnectCurrentCallAndActivateHeld");

    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
    sub_1006F2658();
  v11 = 13;
LABEL_10:

  return v11;
}

- (int)releaseHeldCalls
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "audioAndVideoCallsWithStatus:", 2));

  v14 = v4;
  if (objc_msgSend(v4, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v5);
          v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v10 = qword_100999858;
          if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v9;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Found held TU call to disconnect: %@", buf, 0xCu);
          }
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
          objc_msgSend(v11, "disconnectCall:", v9);

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      }
      while (v6);
    }

    v12 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
      sub_1006F2684();
    v12 = 13;
  }

  return v12;
}

- (int)releaseActiveCalls:()basic_string<char
{
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "audioOrVideoCallWithStatus:", 4));

  if (v6)
  {
    v7 = qword_100999858;
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
    {
      v15 = 138412290;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Found incoming TU call to answer: %@", (uint8_t *)&v15, 0xCu);
    }
    v8 = -[Communicator _answerCall:uid:behavior:](self, "_answerCall:uid:behavior:", v6, a3, 0);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "audioAndVideoCallsWithStatus:", 1));

    v11 = objc_msgSend(v10, "count");
    v12 = qword_100999858;
    if (v11)
    {
      if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Found active TU calls to disconnect: %@", (uint8_t *)&v15, 0xCu);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
      objc_msgSend(v13, "disconnectCurrentCallAndActivateHeld");

      v8 = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
        sub_1006F2658();
      v8 = 13;
    }

  }
  return v8;
}

- (int)holdActiveCalls:()basic_string<char
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  uint64_t v27;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "audioOrVideoCallWithStatus:", 4));

  if (!v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "audioOrVideoCallWithStatus:", 1));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "audioOrVideoCallWithStatus:", 2));

    if (v12 && v14)
    {
      v15 = qword_100999858;
      if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Swapping TU calls", (uint8_t *)&v24, 2u);
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
      objc_msgSend(v16, "swapCalls");

    }
    else if (!v12 || v14)
    {
      v22 = qword_100999858;
      if (v12 || !v14)
      {
        if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
          sub_1006F26B0();
        v10 = 13;
        goto LABEL_14;
      }
      if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
      {
        v24 = 138412290;
        v25 = v14;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Found held TU call to resume: %@", (uint8_t *)&v24, 0xCu);
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
      objc_msgSend(v23, "unholdCall:", v14);

    }
    else
    {
      v18 = qword_100999858;
      if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
      {
        v24 = 138412290;
        v25 = v12;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Found active TU call to hold: %@", (uint8_t *)&v24, 0xCu);
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "model"));
      v20 = objc_msgSend(v19, "supportsHolding");

      if (!v20)
      {
        if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
          sub_1006F26DC();
        v10 = 2;
        goto LABEL_14;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
      objc_msgSend(v21, "holdCall:", v12);

    }
    v10 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  if (objc_msgSend(v7, "isHoldAndAnswerAllowed"))
    v8 = 2;
  else
    v8 = 0;

  v9 = qword_100999858;
  if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
  {
    v24 = 138412546;
    v25 = v6;
    v26 = 2048;
    v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Found incoming TU call to answer %@ with behavior %ld", (uint8_t *)&v24, 0x16u);
  }
  v10 = -[Communicator _answerCall:uid:behavior:](self, "_answerCall:uid:behavior:", v6, a3, v8);
LABEL_15:

  return v10;
}

- (int)addHeldCall
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  int v12;
  int v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "audioOrVideoCallWithStatus:", 2));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "audioOrVideoCallWithStatus:", 1));

  v7 = qword_100999858;
  if (v4 && v6)
  {
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Found held TU call to create a conference: %@", (uint8_t *)&v14, 0xCu);
    }
    v8 = qword_100999858;
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Found active TU call to create a conference: %@", (uint8_t *)&v14, 0xCu);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
    v10 = objc_msgSend(v9, "canGroupCall:withCall:", v4, v6);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
      objc_msgSend(v11, "groupCall:withOtherCall:", v4, v6);

      v12 = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
        sub_1006F2708();
      v12 = 2;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
      sub_1006F2734();
    v12 = 13;
  }

  return v12;
}

- (int)releaseCall:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  int v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator _callForIdentifier:](self, "_callForIdentifier:", v4));
  v6 = qword_100999858;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Found TU call to disconnect: %@", (uint8_t *)&v14, 0xCu);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
    objc_msgSend(v7, "disconnectCall:", v5);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "audioOrVideoCallWithStatus:", 2));

    if (v9)
    {
      v10 = qword_100999858;
      if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
      {
        v14 = 138412290;
        v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Found held TU call to resume: %@", (uint8_t *)&v14, 0xCu);
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
      objc_msgSend(v11, "unholdCall:", v9);

    }
    v12 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
      sub_1006F2760();
    v12 = 15;
  }

  return v12;
}

- (int)privateConference:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  int v10;
  int v12;
  void *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator _callForIdentifier:](self, "_callForIdentifier:", v4));
  v6 = qword_100999858;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
      sub_1006F278C();
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Found TU call to leave the conference: %@", (uint8_t *)&v12, 0xCu);
  }
  if (!objc_msgSend(v5, "isConferenced"))
  {
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
      sub_1006F27E4();
LABEL_11:
    v10 = 15;
    goto LABEL_12;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "model"));
  v8 = objc_msgSend(v7, "supportsUngrouping");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
    objc_msgSend(v9, "ungroupCall:", v5);

    v10 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
      sub_1006F27B8();
    v10 = 2;
  }
LABEL_12:

  return v10;
}

- (int)dialNumber:(const void *)a3 uid:()basic_string<char
{
  unsigned int v7;
  int v8;
  void *__p[2];
  char v11;
  void *v12[2];
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v14 = 0;
  v15 = 0;
  v16 = 0;
  sub_1005C5C20(&v14);
  -[Communicator getCurrentScreeningCalls:](self, "getCurrentScreeningCalls:", &v14);
  if (v14 == v15)
  {
    sub_1005D4330((char *)a3, (uint64_t)v12);
    sub_100091AE8(__p, "");
    v7 = -[Communicator _dialNumber:uid:providerIdentifier:](self, "_dialNumber:uid:providerIdentifier:", v12, a4, __p);
  }
  else
  {
    sub_1005D4330((char *)a3, (uint64_t)v12);
    sub_100091AE8(__p, "");
    v7 = -[Communicator _redialNumberWhileScreening:uid:providerIdentifier:](self, "_redialNumberWhileScreening:uid:providerIdentifier:", v12, a4, __p);
  }
  v8 = v7;
  if (v11 < 0)
    operator delete(__p[0]);
  if (v13 < 0)
    operator delete(v12[0]);
  v12[0] = &v14;
  sub_10026BD18((void ***)v12);
  return v8;
}

- (int)redialLastNumberWithUid:()basic_string<char
{
  operator new();
}

- (int)sendDTMFTone:(unsigned __int8)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  int v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "audioOrVideoCallWithStatus:", 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "model"));
  v7 = objc_msgSend(v6, "supportsDTMF");

  if (v7)
  {
    objc_msgSend(v5, "playDTMFToneForKey:", v3);
    v8 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
      sub_1006F2810();
    v8 = 13;
  }

  return v8;
}

- (int)enableEchoCancellationNoiseReduction:(BOOL)a3
{
  _BOOL8 v3;
  int result;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  if (!-[Communicator ctServerConnection](self, "ctServerConnection")
    || (result = _CTServerConnectionEchoCancelationAndNoiseReduction(-[Communicator ctServerConnection](self, "ctServerConnection"), v3, v3)) != 0)
  {
    v6 = qword_100999858;
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
      sub_1006F283C(v3, v6, v7, v8, v9, v10, v11, v12);
    return 2;
  }
  return result;
}

- (int)addVirtualCall
{
  id v3;
  id *v4;
  int v5;
  id v6;
  id v7;
  id v8;
  _BYTE v10[24];
  std::string __str;
  _BYTE v12[80];
  std::string __p;
  id *v14;
  id *v15;
  uint64_t v16;
  _QWORD v17[2];

  v14 = 0;
  v15 = 0;
  v16 = 0;
  -[Communicator calls](self, "calls");
  v17[0] = 0;
  v17[1] = 0;
  v3 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v17);
  v4 = sub_1005C5DCC(&v14, v3);
  if (v15 == v4)
  {
    memset(&__p, 0, sizeof(__p));
    memset(v12, 0, sizeof(v12));
    sub_10045CA68((uint64_t)v12, v3);
    *(_DWORD *)&v12[16] = 7;
    *(_DWORD *)&v12[8] = 1;
    *(_WORD *)&v12[12] = 1;
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[Communicator _myNumber](self, "_myNumber")));
    sub_1005D4160(&__str, objc_msgSend(v6, "UTF8String"));
    sub_1005D4228((std::string *)&v12[24], (uint64_t)&__str);
    sub_1005D4204(&__str);

    v7 = sub_100355F10(CFSTR("MY_NUMBER"), CFSTR("My Number"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v7));
    sub_100091AE8(&__str, (char *)objc_msgSend(v8, "UTF8String"));
    std::string::operator=(&__p, &__str);
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__str.__r_.__value_.__l.__data_);

    if (v14 != v15)
    {
      if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
        sub_1006F28B8();
      sub_1005C5CFC((uint64_t *)&v14);
    }
    sub_1005C5CAC((uint64_t *)&v14, (uint64_t)v12);
    sub_1005C5CA8((int)v10);
    -[Communicator setCalls:](self, "setCalls:", v10);
    __str.__r_.__value_.__r.__words[0] = (std::string::size_type)v10;
    sub_10026BD18((void ***)&__str);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    sub_1005D4204(&v12[24]);

    v5 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
      sub_1006F28E4();
    v5 = 15;
  }

  *(_QWORD *)v12 = &v14;
  sub_10026BD18((void ***)v12);
  return v5;
}

- (int)removeVirtualCall
{
  id v3;
  id *v4;
  int v5;
  _BYTE v7[24];
  id *v8;
  id *v9;
  uint64_t v10;
  void **v11;
  void **v12[2];

  v8 = 0;
  v9 = 0;
  v10 = 0;
  -[Communicator calls](self, "calls");
  v12[0] = 0;
  v12[1] = 0;
  v3 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v12);
  v4 = sub_1005C5DCC(&v8, v3);
  if (v9 == v4)
  {
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
      sub_1006F2910();
    v5 = 15;
  }
  else
  {
    sub_1005C5D4C((uint64_t)&v8, v4);
    sub_1005C5CA8((int)v7);
    -[Communicator setCalls:](self, "setCalls:", v7);
    v11 = (void **)v7;
    sub_10026BD18(&v11);
    v5 = 0;
  }

  v12[0] = (void **)&v8;
  sub_10026BD18(v12);
  return v5;
}

- (int)getCurrentCalls:(void *)a3
{
  uint64_t v5;
  uint64_t v6;
  void **v7;

  -[Communicator calls](self, "calls");
  if (&v5 != a3)
    sub_10026BDD4((uint64_t)a3, v5, v6, 0x4EC4EC4EC4EC4EC5 * ((v6 - v5) >> 3));
  v7 = (void **)&v5;
  sub_10026BD18(&v7);
  return 0;
}

- (int)getCurrentExpanseCalls:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  void **v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void ***v13;

  v10 = 0;
  v11 = 0;
  v12 = 0;
  -[Communicator calls](self, "calls");
  v7 = 0;
  v8 = 0;
  v9 = 0;
  sub_1005C5C20(&v7);
  v5 = v10;
  v4 = v11;
  while (v5 != v4)
  {
    if (*(_BYTE *)(v5 + 14))
    {
      sub_1005C5CAC((uint64_t *)&v7, v5);
      v4 = v11;
    }
    v5 += 104;
  }
  if (&v7 != a3)
    sub_10026BDD4((uint64_t)a3, (uint64_t)v7, v8, 0x4EC4EC4EC4EC4EC5 * ((v8 - (uint64_t)v7) >> 3));
  v13 = &v7;
  sub_10026BD18((void ***)&v13);
  v7 = (void **)&v10;
  sub_10026BD18(&v7);
  return 0;
}

- (int)setScreeningCall:(id)a3 isScreening:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  id *v9;
  NSObject *v10;
  Delegate *v11;
  int v12;
  NSObject *v13;
  uint8_t v15[24];
  uint8_t v16[8];
  uint8_t buf[8];
  __int128 v18;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator _callForIdentifier:](self, "_callForIdentifier:", v6));
  if (v7)
  {
    v8 = qword_100999858;
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v4;
      LOWORD(v18) = 2112;
      *(_QWORD *)((char *)&v18 + 2) = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Screening:%d Call:%@", buf, 0x12u);
    }
    -[Communicator _updateCalls](self, "_updateCalls");
    *(_QWORD *)buf = 0;
    v18 = 0uLL;
    -[Communicator calls](self, "calls");
    v9 = sub_1005C5DCC((id **)buf, v6);
    if ((id *)v18 != v9)
    {
      v10 = qword_100999858;
      if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Found Call. Updating State", v16, 2u);
      }
      *((_BYTE *)v9 + 15) = v4;
      sub_1005C5CA8((int)v15);
      -[Communicator setCalls:](self, "setCalls:", v15);
      *(_QWORD *)v16 = v15;
      sub_10026BD18((void ***)v16);
      v11 = -[Communicator delegate](self, "delegate");
      (*(void (**)(Delegate *, id))v11->var0)(v11, v6);
      *(_QWORD *)v16 = buf;
      sub_10026BD18((void ***)v16);
      v12 = 0;
      goto LABEL_11;
    }
    *(_QWORD *)v16 = buf;
    sub_10026BD18((void ***)v16);
  }
  v13 = qword_100999858;
  v12 = 16;
  if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
    sub_1006F293C((uint64_t)v7, v4, v13);
LABEL_11:

  return v12;
}

- (int)getCurrentScreeningCalls:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  void **v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void ***v13;

  v10 = 0;
  v11 = 0;
  v12 = 0;
  -[Communicator calls](self, "calls");
  v7 = 0;
  v8 = 0;
  v9 = 0;
  sub_1005C5C20(&v7);
  v5 = v10;
  v4 = v11;
  while (v5 != v4)
  {
    if (*(_BYTE *)(v5 + 15))
    {
      sub_1005C5CAC((uint64_t *)&v7, v5);
      v4 = v11;
    }
    v5 += 104;
  }
  if (&v7 != a3)
    sub_10026BDD4((uint64_t)a3, (uint64_t)v7, v8, 0x4EC4EC4EC4EC4EC5 * ((v8 - (uint64_t)v7) >> 3));
  v13 = &v7;
  sub_10026BD18((void ***)&v13);
  v7 = (void **)&v10;
  sub_10026BD18(&v7);
  return 0;
}

- (int)getOperatorStatus:(void *)a3
{
  void *v5;
  void *v6;
  void *v7;
  std::string __p;
  CFTypeRef cf1;
  void *v11[2];
  __int128 v12;

  if (-[Communicator ctServerConnection](self, "ctServerConnection"))
  {
    *(_OWORD *)v11 = 0u;
    v12 = 0u;
    sub_100091AE8(&v11[1], "");
    cf1 = 0;
    if (!_CTServerConnectionGetNetworkSelectionMode(-[Communicator ctServerConnection](self, "ctServerConnection"), &cf1)&& CFEqual(cf1, kCTRegistrationNetworkSelectionModeManual))
    {
      LODWORD(v11[0]) = 1;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator _getSubscriptionContext](self, "_getSubscriptionContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator ctClient](self, "ctClient"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getLocalizedOperatorName:error:", v5, 0));

    if (v7)
    {
      sub_100091AE8(&__p, (char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
      std::string::operator=((std::string *)&v11[1], &__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      std::string::operator=((std::string *)((char *)a3 + 8), (const std::string *)&v11[1]);
      *(_DWORD *)a3 = v11[0];
    }

    if (SHIBYTE(v12) < 0)
    {
      operator delete(v11[1]);
      if (v7)
        return 0;
    }
    else if (v7)
    {
      return 0;
    }
  }
  if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
    sub_1006F29C0();
  return 2;
}

- (id)getRegistrationStatus
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  BDRegistrationStatus *v7;
  uint64_t v8;

  if (-[Communicator ctServerConnection](self, "ctServerConnection"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator _getSubscriptionContext](self, "_getSubscriptionContext"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator ctClient](self, "ctClient"));
    v5 = objc_msgSend(v4, "copyRegistrationDisplayStatus:error:", v3, 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "registrationDisplayStatus"));
    v7 = objc_alloc_init(BDRegistrationStatus);
    if ((objc_msgSend(v6, "isEqualToString:", kCTRegistrationStatusRegisteredHome) & 1) != 0)
      v8 = 1;
    else
      v8 = (uint64_t)objc_msgSend(v6, "isEqualToString:", kCTRegistrationStatusRegisteredRoaming);
    -[BDRegistrationStatus setService:](v7, "setService:", v8);
    -[BDRegistrationStatus setRoaming:](v7, "setRoaming:", objc_msgSend(v6, "isEqualToString:", kCTRegistrationStatusRegisteredRoaming));

  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
      sub_1006F29EC();
    v7 = 0;
  }
  return v7;
}

- (int)getSignalStrength:(int *)a3 mode:(int)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  if (-[Communicator ctServerConnection](self, "ctServerConnection"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator _getSubscriptionContext](self, "_getSubscriptionContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator ctClient](self, "ctClient"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getSignalStrengthInfo:error:", v7, 0));

    if (a4)
    {
      if (a4 != 1)
      {
LABEL_10:

        return 0;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bars"));
      v11 = 20 * objc_msgSend(v10, "intValue");
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bars"));
      v11 = objc_msgSend(v10, "intValue");
    }
    *a3 = v11;

    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
    sub_1006F2A18();
  return 2;
}

- (int)getSubscriberNumber:(void *)a3
{
  void *v4;
  void *v5;
  int v6;
  _BYTE v8[56];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator _myNumber](self, "_myNumber"));
  v5 = v4;
  if (v4)
  {
    sub_1005D4160(v8, objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    sub_1005D4228((std::string *)a3, (uint64_t)v8);
    sub_1005D4204(v8);
    v6 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
      sub_1006F2A44();
    v6 = 2;
  }

  return v6;
}

- (int)getMobileSubscriberIdentity:(void *)a3
{
  void *Value;
  CFTypeRef arg;

  if (-[Communicator ctServerConnection](self, "ctServerConnection")
    && (arg = 0,
        !_CTServerConnectionCopyMobileEquipmentInfo(-[Communicator ctServerConnection](self, "ctServerConnection"), &arg))&& (CFAutorelease(arg), (Value = (void *)CFDictionaryGetValue((CFDictionaryRef)arg, kCTMobileEquipmentInfoCurrentSubscriberId)) != 0))
  {
    std::string::assign((std::string *)a3, (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(Value), "UTF8String"));
    return 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
      sub_1006F2A70();
    return 2;
  }
}

- (int)getMobileEquipmentIdentity:(void *)a3
{
  void *Value;
  CFTypeRef arg;

  if (-[Communicator ctServerConnection](self, "ctServerConnection")
    && (arg = 0,
        !_CTServerConnectionCopyMobileEquipmentInfo(-[Communicator ctServerConnection](self, "ctServerConnection"), &arg))&& (CFAutorelease(arg), (Value = (void *)CFDictionaryGetValue((CFDictionaryRef)arg, kCTMobileEquipmentInfoCurrentMobileId)) != 0))
  {
    std::string::assign((std::string *)a3, (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(Value), "UTF8String"));
    return 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
      sub_1006F2A9C();
    return 2;
  }
}

- (id)getCountryCodeForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v4 = a3;
  if (-[Communicator ctServerConnection](self, "ctServerConnection")
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator ctClient](self, "ctClient")), v5, v5))
  {
    v6 = objc_autoreleasePoolPush();
    if (!v4
      || (v9 = 0,
          _CTServerConnectionCopyISOForMCC(-[Communicator ctServerConnection](self, "ctServerConnection"), v4, &v9))|| (v7 = v9) == 0)
    {
      v7 = 0;
    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)getCountryCode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v19;

  if (-[Communicator ctServerConnection](self, "ctServerConnection")
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator ctClient](self, "ctClient")), v3, v3))
  {
    v4 = objc_autoreleasePoolPush();
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator ctClient](self, "ctClient"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getCurrentDataSubscriptionContextSync:", 0));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator ctClient](self, "ctClient"));
    v19 = 0;
    v8 = objc_msgSend(v7, "copyLastKnownMobileCountryCode:error:", v6, &v19);
    v9 = v19;

    if (v9)
    {
      v10 = qword_100999858;
      if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
        sub_1006F2AC8((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
    }
    else
    {
      v17 = -[Communicator getCountryCodeForIdentifier:](self, "getCountryCodeForIdentifier:", v8);
    }

    objc_autoreleasePoolPop(v4);
  }
  return 0;
}

- (id)getCountryCodeIdentifer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator ctClient](self, "ctClient"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator ctClient](self, "ctClient"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getCurrentDataSubscriptionContextSync:", 0));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator ctClient](self, "ctClient"));
    v17 = 0;
    v7 = objc_msgSend(v6, "copyMobileCountryCode:error:", v5, &v17);
    v8 = v17;

    if (v8)
    {
      v9 = qword_100999858;
      if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
        sub_1006F2AC8((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);

      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (int)getTransmitState:(BOOL *)a3
{
  int result;
  const void *Value;
  int v7;
  CFTypeRef arg;

  if (-[Communicator ctServerConnection](self, "ctServerConnection")
    && (arg = 0,
        !_CTServerConnectionCopyCellularTransmitState(-[Communicator ctServerConnection](self, "ctServerConnection"), &arg))&& (CFAutorelease(arg), (Value = CFDictionaryGetValue((CFDictionaryRef)arg, kKeyCTCellularTransmitState)) != 0))
  {
    v7 = CFEqual(Value, kCTCellularTransmitStarted);
    result = 0;
    *a3 = v7 != 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100999858, OS_LOG_TYPE_ERROR))
      sub_1006F2B2C();
    return 2;
  }
  return result;
}

- (Delegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(Delegate *)a3
{
  self->_delegate = a3;
}

- (TUCallCenter)tuCallCenter
{
  return self->_tuCallCenter;
}

- (__CTServerConnection)ctServerConnection
{
  return self->_ctServerConnection;
}

- (CoreTelephonyClient)ctClient
{
  return self->_ctClient;
}

- (CallList)calls
{
  return (CallList *)sub_1005C5CA8((int)retstr);
}

- (void)setCalls:(CallList *)a3
{
  CallList *p_calls;

  p_calls = &self->_calls;
  if (p_calls != a3)
    sub_10026BDD4((uint64_t)p_calls, (uint64_t)a3->fCalls.__begin_, (uint64_t)a3->fCalls.__end_, 0x4EC4EC4EC4EC4EC5 * ((a3->fCalls.__end_ - a3->fCalls.__begin_) >> 3));
}

- (void).cxx_destruct
{
  CallList *p_calls;

  p_calls = &self->_calls;
  sub_10026BD18((void ***)&p_calls);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_tuCallCenter, 0);
}

- (id).cxx_construct
{
  sub_1005C5C20(&self->_calls.fCalls.__begin_);
  return self;
}

@end
