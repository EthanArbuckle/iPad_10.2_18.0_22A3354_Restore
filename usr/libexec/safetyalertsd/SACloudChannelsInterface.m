@implementation SACloudChannelsInterface

- (SACloudChannelsInterface)initWithQueue:(id)a3 isProduction:(BOOL)a4 channelType:(int)a5
{
  _BOOL4 v6;
  id v9;
  void *v10;
  SACloudChannelsInterface *v11;
  SACloudChannelsInterface *v12;
  OS_dispatch_queue **p_queue;
  NSObject *v14;
  id v15;
  _QWORD *v16;
  APSConnection *v17;
  APSConnection *pushConnection;
  id v19;
  NSObject *v20;
  NSObject *v21;
  objc_super v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  int v31;

  v6 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("com.apple.aps.locationd.safetyalert"), CFSTR("com.apple.aps.mantis.safetyalert"), 0));
  v23.receiver = self;
  v23.super_class = (Class)SACloudChannelsInterface;
  v11 = -[SACloudChannelsInterface init](&v23, "init");
  v12 = v11;
  if (v11)
  {
    p_queue = &v11->_queue;
    objc_storeStrong((id *)&v11->_queue, a3);
    v14 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289538;
      v25 = 0;
      v26 = 2082;
      v27 = "";
      v28 = 1026;
      v29 = v6;
      v30 = 1026;
      v31 = a5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,initWithQueue\", \"isProduction\":%{public}hhd, \"type\":%{public}d}", buf, 0x1Eu);
    }
    v15 = objc_alloc((Class)APSConnection);
    v16 = &APSEnvironmentProduction;
    if (!v6)
      v16 = &APSEnvironmentDevelopment;
    v17 = (APSConnection *)objc_msgSend(v15, "initWithEnvironmentName:namedDelegatePort:queue:", *v16, CFSTR("com.apple.aps.safetyalerts"), *p_queue);
    pushConnection = v12->_pushConnection;
    v12->_pushConnection = v17;

    -[APSConnection setDelegate:](v12->_pushConnection, "setDelegate:", v12);
    v19 = objc_alloc_init((Class)NSMutableArray);
    objc_msgSend(v19, "addObjectsFromArray:", v10);
    -[APSConnection _setEnabledTopics:](v12->_pushConnection, "_setEnabledTopics:", v19);
    -[APSConnection requestTokenForTopic:identifier:](v12->_pushConnection, "requestTokenForTopic:identifier:", CFSTR("com.apple.aps.locationd.safetyalert"), 0);
    -[APSConnection requestTokenForTopic:identifier:](v12->_pushConnection, "requestTokenForTopic:identifier:", CFSTR("com.apple.aps.mantis.safetyalert"), 0);
    v20 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v25 = 0;
      v26 = 2082;
      v27 = "";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,#channel,Waiting for push notifications\"}", buf, 0x12u);
    }

  }
  v21 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v25 = 0;
    v26 = 2082;
    v27 = "";
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,Created SACloudChannelsInterface\"}", buf, 0x12u);
  }

  return v12;
}

- (BOOL)isSubscribedChannel:(id)a3
{
  id v4;
  char *begin;
  char *end;
  id v7;
  __int128 v8;
  id v9;
  int v10;
  NSObject *v11;
  int v12;
  std::string::size_type v13;
  id v14;
  std::string *p_dst;
  BOOL v16;
  SACloudChannelsInterface *v18;
  std::string __dst;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  std::string *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  int v29;

  v4 = a3;
  begin = (char *)self->_activeSubscibedChannels.__begin_;
  end = (char *)self->_activeSubscibedChannels.__end_;
  v18 = self;
  v7 = v4;
  if (begin != end)
  {
    while (1)
    {
      if (begin[23] < 0)
      {
        sub_100004870(&__dst, *(void **)begin, *((_QWORD *)begin + 1));
      }
      else
      {
        v8 = *(_OWORD *)begin;
        __dst.__r_.__value_.__r.__words[2] = *((_QWORD *)begin + 2);
        *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = v8;
      }
      v9 = objc_retainAutorelease(v7);
      v10 = std::string::compare(&__dst, (const std::string::value_type *)objc_msgSend(v9, "UTF8String"));
      v11 = (id)SALogObjectGeneral;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = SHIBYTE(__dst.__r_.__value_.__r.__words[2]);
        v13 = __dst.__r_.__value_.__r.__words[0];
        v14 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
        *(_DWORD *)buf = 68289795;
        p_dst = &__dst;
        if (v12 < 0)
          p_dst = (std::string *)v13;
        v21 = 0;
        v22 = 2082;
        v23 = "";
        v24 = 2081;
        v25 = p_dst;
        v26 = 2081;
        v27 = v14;
        v28 = 1026;
        v29 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,isSubscribedChannel\", \"candidate\":%{private, location:escape_only}s, \"matchedWith\":%{private, location:escape_only}s, \"result\":%{public}d}", buf, 0x2Cu);
      }

      if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__dst.__r_.__value_.__l.__data_);
      if (!v10)
        break;
      begin += 24;
      if (begin == end)
      {
        begin = end;
        break;
      }
    }
  }

  v16 = begin != v18->_activeSubscibedChannels.__end_;
  return v16;
}

- (void)addToSubscribedChannels:(id)a3
{
  id v4;
  char *value;
  char *end;
  __int128 v7;
  _BYTE *begin;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  __int128 v15;
  void *v16;
  int v17;
  NSObject *v18;
  id v19;
  int v20;
  char *v21;
  char *i;
  __int128 v23;
  NSObject *v24;
  void **v25;
  void *v26;
  void *__p[2];
  uint64_t v28;
  uint8_t buf[8];
  _BYTE v30[32];

  v4 = a3;
  v26 = v4;
  if (!-[SACloudChannelsInterface isSubscribedChannel:](self, "isSubscribedChannel:", v4))
  {
    sub_10000E8A0(__p, (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    value = (char *)self->_activeSubscibedChannels.__end_cap_.__value_;
    end = (char *)self->_activeSubscibedChannels.__end_;
    if (end >= value)
    {
      begin = self->_activeSubscibedChannels.__begin_;
      v9 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      v10 = v9 + 1;
      if (v9 + 1 > 0xAAAAAAAAAAAAAAALL)
        sub_100004C50();
      v11 = 0xAAAAAAAAAAAAAAABLL * ((value - begin) >> 3);
      if (2 * v11 > v10)
        v10 = 2 * v11;
      if (v11 >= 0x555555555555555)
        v12 = 0xAAAAAAAAAAAAAAALL;
      else
        v12 = v10;
      *(_QWORD *)&v30[24] = &self->_activeSubscibedChannels.__end_cap_;
      if (v12)
        v13 = (char *)sub_100004C64((uint64_t)&self->_activeSubscibedChannels.__end_cap_, v12);
      else
        v13 = 0;
      v14 = &v13[24 * v9];
      *(_QWORD *)buf = v13;
      *(_QWORD *)v30 = v14;
      *(_QWORD *)&v30[16] = &v13[24 * v12];
      v15 = *(_OWORD *)__p;
      *((_QWORD *)v14 + 2) = v28;
      *(_OWORD *)v14 = v15;
      __p[1] = 0;
      v28 = 0;
      __p[0] = 0;
      *(_QWORD *)&v30[8] = v14 + 24;
      sub_100004BDC((uint64_t *)&self->_activeSubscibedChannels, buf);
      v16 = self->_activeSubscibedChannels.__end_;
      sub_100004DBC((uint64_t)buf);
      v17 = SHIBYTE(v28);
      self->_activeSubscibedChannels.__end_ = v16;
      if (v17 < 0)
        operator delete(__p[0]);
    }
    else
    {
      v7 = *(_OWORD *)__p;
      *((_QWORD *)end + 2) = v28;
      *(_OWORD *)end = v7;
      self->_activeSubscibedChannels.__end_ = end + 24;
    }
  }
  v18 = (id)SALogObjectGeneral;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    v20 = -1431655765
        * ((unint64_t)((char *)self->_activeSubscibedChannels.__end_
                            - (char *)self->_activeSubscibedChannels.__begin_) >> 3);
    *(_DWORD *)buf = 68289539;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v30 = 2082;
    *(_QWORD *)&v30[2] = "";
    *(_WORD *)&v30[10] = 2081;
    *(_QWORD *)&v30[12] = v19;
    *(_WORD *)&v30[20] = 1026;
    *(_DWORD *)&v30[22] = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,addToSubscribedChannels\", \"channel\":%{private, location:escape_only}s, \"len\":%{public}d}", buf, 0x22u);
  }

  v21 = (char *)self->_activeSubscibedChannels.__begin_;
  for (i = (char *)self->_activeSubscibedChannels.__end_; v21 != i; v21 += 24)
  {
    if (v21[23] < 0)
    {
      sub_100004870(__p, *(void **)v21, *((_QWORD *)v21 + 1));
    }
    else
    {
      v23 = *(_OWORD *)v21;
      v28 = *((_QWORD *)v21 + 2);
      *(_OWORD *)__p = v23;
    }
    v24 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      if (v28 >= 0)
        v25 = __p;
      else
        v25 = (void **)__p[0];
      *(_DWORD *)buf = 68289283;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v30 = 2082;
      *(_QWORD *)&v30[2] = "";
      *(_WORD *)&v30[10] = 2081;
      *(_QWORD *)&v30[12] = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,addToSubscribedChannels,active\", \"channel\":%{private, location:escape_only}s}", buf, 0x1Cu);
    }
    if (SHIBYTE(v28) < 0)
      operator delete(__p[0]);
  }

}

- (void)removeFromSubscribedChannels:(id)a3
{
  id v4;
  __int128 *begin;
  __int128 *end;
  id v7;
  __int128 v8;
  int v9;
  __int128 *v10;
  void **v11;
  void **v12;
  void **i;
  std::string __p;

  v4 = a3;
  begin = (__int128 *)self->_activeSubscibedChannels.__begin_;
  end = (__int128 *)self->_activeSubscibedChannels.__end_;
  v7 = v4;
  if (begin != end)
  {
    while (1)
    {
      if (*((char *)begin + 23) < 0)
      {
        sub_100004870(&__p, *(void **)begin, *((_QWORD *)begin + 1));
      }
      else
      {
        v8 = *begin;
        __p.__r_.__value_.__r.__words[2] = *((_QWORD *)begin + 2);
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v8;
      }
      v9 = std::string::compare(&__p, (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (!v9)
        break;
      begin = (__int128 *)((char *)begin + 24);
      if (begin == end)
      {
        begin = end;
        break;
      }
    }
  }

  v10 = (__int128 *)self->_activeSubscibedChannels.__end_;
  if (begin != v10)
  {
    sub_10004255C((uint64_t)&__p, (__int128 *)((char *)begin + 24), v10, (uint64_t)begin);
    v12 = v11;
    for (i = (void **)self->_activeSubscibedChannels.__end_; i != v12; i -= 3)
    {
      if (*((char *)i - 1) < 0)
        operator delete(*(i - 3));
    }
    self->_activeSubscibedChannels.__end_ = v12;
  }

}

- (id)getPushConnection
{
  return self->_pushConnection;
}

- (void)subscribe:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  int v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = SALogObjectGeneral;
  if (v6)
  {
    v9 = (id)SALogObjectGeneral;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 68289539;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2081;
      v16 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      v17 = 2081;
      v18 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,subscribe\", \"channel\":%{private, location:escape_only}s, \"channelTopic\":%{private, location:escape_only}s}", (uint8_t *)&v11, 0x26u);
    }

    v10 = objc_msgSend(objc_alloc((Class)PKPublicChannel), "initWithChannelID:", v6);
    -[SACloudChannelsInterface addToSubscribedChannels:](self, "addToSubscribedChannels:", v6);
    -[APSConnection subscribeToChannel:forTopic:](self->_pushConnection, "subscribeToChannel:forTopic:", v10, v7);

  }
  else if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    v11 = 68289026;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ch,subscribeWithNilChannel\"}", (uint8_t *)&v11, 0x12u);
  }

}

- (void)unsubscribe:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  int v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = SALogObjectGeneral;
  if (v6)
  {
    v9 = (id)SALogObjectGeneral;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 68289539;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2081;
      v16 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      v17 = 2081;
      v18 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,unsubscribe\", \"channel\":%{private, location:escape_only}s, \"channelTopic\":%{private, location:escape_only}s}", (uint8_t *)&v11, 0x26u);
    }

    v10 = objc_msgSend(objc_alloc((Class)PKPublicChannel), "initWithChannelID:", v6);
    -[SACloudChannelsInterface removeFromSubscribedChannels:](self, "removeFromSubscribedChannels:", v6);
    -[APSConnection unsubscribeFromChannel:forTopic:](self->_pushConnection, "unsubscribeFromChannel:forTopic:", v10, v7);

  }
  else if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    v11 = 68289026;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ch,unsubscribeWithNilChannel\"}", (uint8_t *)&v11, 0x12u);
  }

}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  SACloudChannel *v16;
  _DWORD v17[2];
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_autoreleasePoolPush();
  v15 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v17[0] = 68289795;
    v17[1] = 0;
    v18 = 2082;
    v19 = "";
    v20 = 2113;
    v21 = v11;
    v22 = 2113;
    v23 = v12;
    v24 = 2113;
    v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,received push token\", \"token\":%{private, location:escape_only}@, \"topic\":%{private, location:escape_only}@, \"identifier\":%{private, location:escape_only}@}", (uint8_t *)v17, 0x30u);
  }
  v16 = -[SACloudChannelsInterface channelProxy](self, "channelProxy");
  (*((void (**)(SACloudChannel *, uint64_t))v16->var0 + 5))(v16, 1);
  objc_autoreleasePoolPop(v14);

}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  SACloudChannel *v10;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_autoreleasePoolPush();
  v9 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 68289283;
    v11[1] = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2113;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,received public push token\", \"token\":%{private, location:escape_only}@}", (uint8_t *)v11, 0x1Cu);
  }
  v10 = -[SACloudChannelsInterface channelProxy](self, "channelProxy");
  (*((void (**)(SACloudChannel *, uint64_t))v10->var0 + 6))(v10, 1);
  objc_autoreleasePoolPop(v8);

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  SACloudChannel *v13;
  _DWORD v14[2];
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __CFString *v21;
  void *v22;

  v5 = a4;
  v6 = objc_autoreleasePoolPush();
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topic"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
  v9 = objc_msgSend(v5, "incomingInterface");
  v21 = kIncomingMessageInterfaceKey;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9));
  v22 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));

  v12 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 68289539;
    v14[1] = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2113;
    v18 = v7;
    v19 = 2113;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,Received push message\", \"topic\":%{private, location:escape_only}@, \"message\":%{private, location:escape_only}@}", (uint8_t *)v14, 0x26u);
  }
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &stru_1000F6908);
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", &stru_1000F6928);
  v13 = -[SACloudChannelsInterface channelProxy](self, "channelProxy");
  (*((void (**)(SACloudChannel *, void *, void *))v13->var0 + 4))(v13, v8, v11);

  objc_autoreleasePoolPop(v6);
}

- (void)unsubcribeForgottenChannels:(id)a3
{
  id v4;

  v4 = a3;
  -[SACloudChannelsInterface unsubcribeForgottenChannelsForTopic:topicName:](self, "unsubcribeForgottenChannelsForTopic:topicName:");
  -[SACloudChannelsInterface unsubcribeForgottenChannelsForTopic:topicName:](self, "unsubcribeForgottenChannelsForTopic:topicName:", v4, CFSTR("com.apple.aps.mantis.safetyalert"));

}

- (void)unsubcribeForgottenChannelsForTopic:(id)a3 topicName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  SACloudChannelsInterface *v12;
  id v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SACloudChannelsInterface getPushConnection](self, "getPushConnection"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100094EBC;
    v10[3] = &unk_1000F6950;
    v11 = v7;
    v12 = self;
    v13 = v6;
    objc_msgSend(v8, "getRegisteredChannelsForTopic:withCompletion:", v11, v10);

  }
  else
  {
    v9 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,unsubcribeForgottenChannels,invalid topic\"}", buf, 0x12u);
    }
  }

}

- (SACloudChannel)channelProxy
{
  return self->_channelProxy;
}

- (void)setChannelProxy:(SACloudChannel *)a3
{
  self->_channelProxy = a3;
}

- (void).cxx_destruct
{
  vector<std::string, std::allocator<std::string>> *p_activeSubscibedChannels;

  p_activeSubscibedChannels = &self->_activeSubscibedChannels;
  sub_100004EC0((void ***)&p_activeSubscibedChannels);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cloudChannel, 0);
  objc_storeStrong((id *)&self->_pushConnection, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
