@implementation XpcSession

- (XpcSession)initWithConnection:(id)a3
{
  XpcSession *v3;
  MapHandler *v4;
  MapHandler *mapHandler;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)XpcSession;
  v3 = -[BTXpcSession initWithConnection:](&v7, "initWithConnection:", a3);
  if (v3)
  {
    v4 = objc_alloc_init(MapHandler);
    mapHandler = v3->_mapHandler;
    v3->_mapHandler = v4;

    -[MapHandler setDelegate:](v3->_mapHandler, "setDelegate:", v3);
  }
  return v3;
}

- (void)handleMsg:(id)a3
{
  const char *string;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  string = xpc_dictionary_get_string(v7, "kMsgId");
  if (!strcmp(string, "kStart"))
  {
    -[XpcSession registerForIMCoreNotifications](self, "registerForIMCoreNotifications");
    goto LABEL_9;
  }
  if (!strcmp(string, "kMarkMessageRead"))
  {
    -[XpcSession markMessageAsRead:](self, "markMessageAsRead:", v7);
    goto LABEL_9;
  }
  if (!strcmp(string, "kSendTextMessage"))
  {
    -[XpcSession sendTextMessage:](self, "sendTextMessage:", v7);
    goto LABEL_9;
  }
  v5 = strcmp(string, "kGetImCoreInitialMessages");
  v6 = v7;
  if (!v5)
  {
    -[XpcSession getImCoreSeedMessages:](self, "getImCoreSeedMessages:", v7);
LABEL_9:
    v6 = v7;
  }

}

- (void)sendMsg:(id)a3 args:(id)a4
{
  id v6;
  xpc_object_t v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = a3;
  v7 = xpc_dictionary_create(0, 0, 0);
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "cStringUsingEncoding:", 4);

  xpc_dictionary_set_string(v7, "kMsgId", v9);
  if (v11)
  {
    v10 = (void *)_CFXPCCreateXPCObjectFromCFObject(v11);
    xpc_dictionary_set_value(v7, "kMsgArgs", v10);

  }
  -[BTXpcSession sendMsg:](self, "sendMsg:", v7);

}

- (void)sendReplyToMsg:(id)a3 status:(unsigned __int8)a4 args:(id)a5
{
  unsigned int v5;
  id v8;
  void *v9;
  void *v10;
  xpc_object_t xdict;

  v5 = a4;
  v8 = a5;
  xdict = xpc_dictionary_create_reply(a3);
  xpc_dictionary_set_int64(xdict, "kMsgStatus", v5);
  if (v8)
    v9 = v8;
  else
    v9 = &__NSArray0__struct;
  v10 = (void *)_CFXPCCreateXPCObjectFromCFObject(v9);

  xpc_dictionary_set_value(xdict, "kMsgArgs", v10);
  -[BTXpcSession sendReply:](self, "sendReply:", xdict);

}

- (void)messageReceivedNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  if (objc_msgSend(v5, "isMuted"))
  {
    v6 = qword_10000D088;
    if (os_log_type_enabled((os_log_t)qword_10000D088, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Dropping text message as chat session is muted", buf, 2u);
    }
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", IMChatValueKey));

    v9 = (void *)qword_10000D088;
    if (os_log_type_enabled((os_log_t)qword_10000D088, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "guid"));
      *(_DWORD *)buf = 138412290;
      v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sending received text message with GUID %@ to bluetoothd", buf, 0xCu);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[XpcSession serializeIMMessageNotification:](self, "serializeIMMessageNotification:", v4));
    objc_msgSend(v12, "addObject:", v13);

    v15 = CFSTR("kMessagesInfo");
    v16 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    -[XpcSession sendMsg:args:](self, "sendMsg:args:", CFSTR("kMessageAdded"), v14);

  }
}

- (void)messageSentNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", IMChatValueKey));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "guid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapHandler pendingSendGuids](self->_mapHandler, "pendingSendGuids"));
  if (!objc_msgSend(v8, "containsObject:", v7))
  {
LABEL_6:

    goto LABEL_7;
  }
  v9 = objc_msgSend(v6, "isSent");

  if (v9)
  {
    v10 = qword_10000D088;
    if (os_log_type_enabled((os_log_t)qword_10000D088, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Guid %@ has sent, updating CK", buf, 0xCu);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[XpcSession serializeIMMessageNotification:](self, "serializeIMMessageNotification:", v4));
    objc_msgSend(v8, "addObject:", v11);

    v14 = CFSTR("kMessagesInfo");
    v15 = v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    -[XpcSession sendMsg:args:](self, "sendMsg:args:", CFSTR("kMessageSent"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapHandler pendingSendGuids](self->_mapHandler, "pendingSendGuids"));
    objc_msgSend(v13, "removeObject:", v7);

    goto LABEL_6;
  }
LABEL_7:

}

- (void)markMessageAsRead:(id)a3
{
  xpc_object_t value;
  void *v4;
  NSString *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;

  value = xpc_dictionary_get_value(a3, "kMsgArgs");
  v4 = (void *)objc_claimAutoreleasedReturnValue(value);
  v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v4, "kMessageGUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = qword_10000D088;
  if (os_log_type_enabled((os_log_t)qword_10000D088, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Asking IMCore to mark message with messageGUID: %@ as read", (uint8_t *)&v8, 0xCu);
  }
  IMSPIQueryMessageWithGUID(v6, &stru_100008638, &_dispatch_main_q);

}

- (void)sendTextMessage:(id)a3
{
  xpc_object_t value;
  void *v5;
  NSString *v6;
  void *v7;
  char *string;
  char *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  char *v14;
  char *v15;
  int v16;
  NSObject *v17;
  _BOOL4 v18;
  const char *v19;
  _QWORD v20[5];
  id v21;
  char *v22;
  char *v23;
  uint8_t buf[16];

  value = xpc_dictionary_get_value(a3, "kMsgArgs");
  v5 = (void *)objc_claimAutoreleasedReturnValue(value);
  v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v5, "kBody"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  string = (char *)xpc_dictionary_get_string(v5, "kRecipientPhoneNumber");
  v9 = (char *)xpc_dictionary_get_string(v5, "kRecipientEmail");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (string)
  {
    string = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
    objc_msgSend(v10, "addObject:", string);
  }
  if (v9)
  {
    v9 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9));
    objc_msgSend(v10, "addObject:", v9);
  }
  v11 = qword_10000D088;
  if (os_log_type_enabled((os_log_t)qword_10000D088, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Sending message through IMCore", buf, 2u);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", 0));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100003E74;
  v20[3] = &unk_100008660;
  v20[4] = self;
  v13 = v7;
  v21 = v13;
  v14 = string;
  v22 = v14;
  v15 = v9;
  v23 = v15;
  v16 = IMSPISendMessageWithAttachmentsReturningGUID(0, v12, v13, 0, v20);

  v17 = qword_10000D088;
  v18 = os_log_type_enabled((os_log_t)qword_10000D088, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      *(_WORD *)buf = 0;
      v19 = "Message handed off to ImCore for sending";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
    }
  }
  else if (v18)
  {
    *(_WORD *)buf = 0;
    v19 = "Message failed to send through IMCore, could not send new chat";
    goto LABEL_12;
  }

}

- (void)getImCoreSeedMessages:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004124;
  v4[3] = &unk_100008688;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  IMSPIQueryMessages(10, v4, &_dispatch_main_q);

}

- (id)serializeIMSPIMessage:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  unsigned int v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint8_t buf[16];
  _QWORD v45[11];
  _QWORD v46[11];

  v3 = a3;
  v4 = qword_10000D088;
  if (os_log_type_enabled((os_log_t)qword_10000D088, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Processing added text message", buf, 2u);
  }
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "date"));
  v6 = objc_msgSend(v3, "isAudioMessage");
  if (v6)
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
    if (!-[NSObject length](v4, "length"))
    {
      v7 = CFSTR("Audio Message");
      goto LABEL_8;
    }
  }
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
  if (v6)
LABEL_8:

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sender"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayName"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sender"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "address"));

  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "guid"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "service"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "isRead")));
  v13 = objc_msgSend(v11, "containsString:", CFSTR("@"));
  v14 = v11;
  if (v13)
    v15 = 0;
  else
    v15 = v14;
  v42 = v15;
  v38 = v14;
  if (v13)
    v16 = v14;
  else
    v16 = 0;
  v17 = objc_claimAutoreleasedReturnValue(-[__CFString UTF8StringWithMaxLength:](v7, "UTF8StringWithMaxLength:", 128));
  v45[0] = CFSTR("kDate");
  v18 = v5;
  if (!v5)
    v18 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v34 = (void *)v18;
  v46[0] = v18;
  v45[1] = CFSTR("kBody");
  v19 = (uint64_t)v7;
  if (!v7)
    v19 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v33 = (void *)v19;
  v46[1] = v19;
  v45[2] = CFSTR("kSenderFirstName");
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v46[2] = v37;
  v45[3] = CFSTR("kSubject");
  v20 = v17;
  if (!v17)
    v20 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v40 = (void *)v5;
  v32 = (void *)v20;
  v46[3] = v20;
  v45[4] = CFSTR("kSenderLastName");
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v46[4] = v36;
  v45[5] = CFSTR("kSenderFormattedName");
  v21 = (uint64_t)v9;
  if (!v9)
    v21 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v30 = v21;
  v46[5] = v21;
  v45[6] = CFSTR("kMessageGUID");
  v22 = (void *)v12;
  if (!v12)
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null", v21));
  v39 = (void *)v12;
  v46[6] = v22;
  v45[7] = CFSTR("kSenderEmail");
  v23 = v16;
  if (!v16)
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v24 = v7;
  v46[7] = v23;
  v45[8] = CFSTR("kSenderPhoneNumber");
  v25 = v42;
  if (!v42)
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v26 = (void *)v17;
  v46[8] = v25;
  v45[9] = CFSTR("kAppType");
  v27 = v43;
  if (!v43)
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v46[9] = v27;
  v45[10] = CFSTR("kIsRead");
  v28 = v41;
  if (!v41)
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v46[10] = v28;
  v35 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 11, v30));
  if (!v41)

  if (!v43)
  if (!v42)

  if (!v16)
  if (v39)
  {
    if (v9)
      goto LABEL_43;
  }
  else
  {

    if (v9)
      goto LABEL_43;
  }

LABEL_43:
  if (!v26)

  if (!v24)
  {

    if (v40)
      goto LABEL_47;
LABEL_51:

    goto LABEL_47;
  }
  if (!v40)
    goto LABEL_51;
LABEL_47:

  return v35;
}

- (id)serializeIMMessageNotification:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint8_t buf[16];
  _QWORD v66[12];
  _QWORD v67[12];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", IMChatValueKey));
  v7 = qword_10000D088;
  if (os_log_type_enabled((os_log_t)qword_10000D088, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Processing added text message", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sender"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sender"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ID"));

  v12 = objc_msgSend(v11, "containsString:", CFSTR("@"));
  v13 = v11;
  if (v12)
    v14 = 0;
  else
    v14 = v13;
  v56 = v13;
  if (v12)
    v15 = v13;
  else
    v15 = 0;
  v16 = 0;
  v63 = 0;
  v64 = 0;
  if (objc_msgSend(v6, "isFromMe"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recipient"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recipient"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "ID"));

    v21 = objc_msgSend(v20, "containsString:", CFSTR("@"));
    if (v21)
      v22 = 0;
    else
      v22 = v20;
    if (v21)
      v23 = v20;
    else
      v23 = 0;
    v63 = v23;
    v64 = v22;
    v16 = (void *)v18;
  }
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timeDelivered"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "plainBody"));
  v58 = v4;
  if (!objc_msgSend(v24, "length"))
  {
    v25 = v16;
    v26 = qword_10000D088;
    if (os_log_type_enabled((os_log_t)qword_10000D088, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "No body, using message summary instead", buf, 2u);
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_imMessageItem"));
    v28 = IMSPIMessageSummary(2, v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);

    v24 = (void *)v29;
    v16 = v25;
  }
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UTF8StringWithMaxLength:", 128));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "guid"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subject"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "accountTypeName"));

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "isRead")));
  v66[0] = CFSTR("kDate");
  v32 = (uint64_t)v59;
  if (!v59)
    v32 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v52 = (void *)v32;
  v67[0] = v32;
  v66[1] = CFSTR("kBody");
  v33 = (uint64_t)v24;
  if (!v24)
    v33 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v51 = (void *)v33;
  v67[1] = v33;
  v66[2] = CFSTR("kSubject");
  v34 = (uint64_t)v62;
  if (!v62)
    v34 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v67[2] = v34;
  v66[3] = CFSTR("kSenderFormattedName");
  v35 = v9;
  if (!v9)
    v35 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v49 = (void *)v35;
  v67[3] = v35;
  v66[4] = CFSTR("kSenderEmail");
  v36 = (uint64_t)v15;
  if (!v15)
    v36 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v48 = (void *)v36;
  v67[4] = v36;
  v66[5] = CFSTR("kSenderPhoneNumber");
  v37 = (uint64_t)v14;
  if (!v14)
    v37 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v57 = (void *)v9;
  v46 = v37;
  v67[5] = v37;
  v66[6] = CFSTR("kRecipientFormattedName");
  v38 = v16;
  if (!v16)
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null", v37, v48, v49));
  v54 = v16;
  v67[6] = v38;
  v66[7] = CFSTR("kRecipientEmail");
  v39 = v63;
  if (!v63)
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v55 = v14;
  v67[7] = v39;
  v66[8] = CFSTR("kRecipientPhoneNumber");
  v40 = v64;
  if (!v64)
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v41 = v15;
  v67[8] = v40;
  v66[9] = CFSTR("kMessageGUID");
  v42 = v61;
  if (!v61)
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v50 = (void *)v34;
  v67[9] = v42;
  v66[10] = CFSTR("kAppType");
  v43 = v60;
  if (!v60)
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v67[10] = v43;
  v66[11] = CFSTR("kIsRead");
  v44 = v31;
  if (!v31)
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v67[11] = v44;
  v53 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v67, v66, 12, v46));
  if (!v31)

  if (!v60)
  if (!v61)

  if (!v64)
  if (!v63)

  if (!v54)
  if (!v55)

  if (v41)
  {
    if (v57)
      goto LABEL_61;
  }
  else
  {

    if (v57)
      goto LABEL_61;
  }

LABEL_61:
  if (v62)
  {
    if (v24)
      goto LABEL_63;
LABEL_68:

    if (v59)
      goto LABEL_64;
LABEL_69:

    goto LABEL_64;
  }

  if (!v24)
    goto LABEL_68;
LABEL_63:
  if (!v59)
    goto LABEL_69;
LABEL_64:

  return v53;
}

- (void)registerForIMCoreNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
  objc_msgSend(v3, "addListenerID:capabilities:", CFSTR("BTMapListener"), kFZListenerCapNotifications | kFZListenerCapChats | (kFZListenerCapTruncatedChatRegistry | kFZListenerCapEvenMoreTruncatedChatRegistry));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
  objc_msgSend(v4, "blockUntilConnected");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
  objc_msgSend(v5, "_setBlocksConnectionAtResume:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "messageReceivedNotification:", IMChatMessageReceivedNotification, 0);

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "messageSentNotification:", IMChatMessageDidChangeNotification, 0);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
  objc_msgSend(v3, "removeListenerID:", CFSTR("BTMapListener"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
  objc_msgSend(v4, "disconnectFromDaemon");

  v5.receiver = self;
  v5.super_class = (Class)XpcSession;
  -[XpcSession dealloc](&v5, "dealloc");
}

- (MapHandler)mapHandler
{
  return self->_mapHandler;
}

- (void)setMapHandler:(id)a3
{
  objc_storeStrong((id *)&self->_mapHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapHandler, 0);
}

@end
