@implementation _SESACWGSession

- (_SESACWGSession)initWithRemoteObject:(id)a3 queue:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SESACWGSession;
  return -[_SESSession initWithRemoteObject:queue:](&v5, "initWithRemoteObject:queue:", a3, a4);
}

+ (id)validateEntitlements:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_SESSessionClientInfo withConnection:](_SESSessionClientInfo, "withConnection:", a3));
  v4 = objc_msgSend(v3, "acwgSessionEntitlement");
  if ((v4 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = SESDefaultLogObject(v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = SESErrorDomain;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clientName"));
    v10 = SESCreateAndLogError(0, v8, v9, 0, CFSTR("Client %@ missing entitlement %@"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v10);

  }
  return v6;
}

- (void)setDidEndCallback:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SESACWGSession;
  -[_SESSession setDidEndCallback:](&v3, "setDidEndCallback:", a3);
}

- (void)releaseRemoteObject
{
  NSObject *v3;
  objc_super v4;

  v3 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4.receiver = self;
  v4.super_class = (Class)_SESACWGSession;
  -[_SESSession releaseRemoteObject](&v4, "releaseRemoteObject");
}

- (void)start
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[4];
  _SESACWGSession *v10;

  v3 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v6 = SESDefaultLogObject(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "SESACWGSession start %@", buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)_SESACWGSession;
  -[_SESSession start](&v8, "start");
}

- (void)endSessionInternal:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  SEEndPoint *activeEndpoint;
  objc_super v11;
  uint8_t buf[4];
  _SESACWGSession *v13;
  __int16 v14;
  id v15;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v8 = SESDefaultLogObject(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "SESACWGSession endSessionInternal %@ error %@", buf, 0x16u);
  }

  -[_SESACWGSession setSeToken:](self, "setSeToken:", 0);
  -[_SESACWGSession setAuth:](self, "setAuth:", 0);
  -[_SESACWGSession setIsWaitingForSecureElement:](self, "setIsWaitingForSecureElement:", 0);
  activeEndpoint = self->_activeEndpoint;
  self->_activeEndpoint = 0;

  self->_isPreArmed = 0;
  v11.receiver = self;
  v11.super_class = (Class)_SESACWGSession;
  -[_SESSession endSessionInternal:](&v11, "endSessionInternal:", v4);

}

- (void)endSession:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100059F04;
  v7[3] = &unk_100303078;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)setActiveKey:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005A07C;
  block[3] = &unk_1003030E0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)setSecureElementToken:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005A50C;
  block[3] = &unk_100303730;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)preArmActiveKey:(BOOL)a3 reply:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005A6F8;
  block[3] = &unk_100304FE8;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)useSecureElementToken
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005A928;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)pushSecureElementToken:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005AA88;
  block[3] = &unk_100302AA0;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

- (void)sendEvent:(id)a3 keyIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL8 v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  int v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[_SESSession queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v9 = -[_SESSession isActive](self, "isActive");
  if (!v9)
  {
    v19 = SESDefaultLogObject(v9, v10);
    v13 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v20 = 138412290;
      v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Dropping event due to session not active %@", (uint8_t *)&v20, 0xCu);
    }
    goto LABEL_11;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SEEndPoint publicKeyIdentifier](self->_activeEndpoint, "publicKeyIdentifier"));
  v12 = objc_msgSend(v11, "isEqualToData:", v7);

  if (v12)
  {
    if (qword_10034BBF8 != -1)
      dispatch_once(&qword_10034BBF8, &stru_100305008);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("xpcEventName")));
    v14 = objc_msgSend((id)qword_10034BBF0, "containsObject:", v13);
    if ((_DWORD)v14)
    {
      v16 = SESDefaultLogObject(v14, v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v20 = 138412290;
        v21 = v6;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Sending event via session delegate %@", (uint8_t *)&v20, 0xCu);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[_SESSession remoteObject](self, "remoteObject"));
      objc_msgSend(v18, "sendEvent:", v6);

    }
LABEL_11:

  }
}

- (SEEndPoint)activeEndpoint
{
  return self->_activeEndpoint;
}

- (BOOL)isPreArmed
{
  return self->_isPreArmed;
}

- (NSData)seToken
{
  return self->_seToken;
}

- (void)setSeToken:(id)a3
{
  objc_storeStrong((id *)&self->_seToken, a3);
}

- (NSData)auth
{
  return self->_auth;
}

- (void)setAuth:(id)a3
{
  objc_storeStrong((id *)&self->_auth, a3);
}

- (BOOL)isWaitingForSecureElement
{
  return self->_isWaitingForSecureElement;
}

- (void)setIsWaitingForSecureElement:(BOOL)a3
{
  self->_isWaitingForSecureElement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auth, 0);
  objc_storeStrong((id *)&self->_seToken, 0);
  objc_storeStrong((id *)&self->_activeEndpoint, 0);
}

@end
