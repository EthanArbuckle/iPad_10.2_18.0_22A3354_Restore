@implementation LTSStatsManager

+ (id)sharedLTSStatsManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009898;
  block[3] = &unk_1000106C0;
  block[4] = a1;
  if (qword_100014B48 != -1)
    dispatch_once(&qword_100014B48, block);
  return (id)qword_100014B40;
}

- (LTSStatsManager)init
{
  os_log_t v3;
  void *v4;
  LTSStatsManager *v5;
  CFMutableDictionaryRef v6;
  uint64_t v7;
  const void *v8;
  uint64_t v9;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  LTSStatsManager *v14;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  NSObject *v21;
  objc_super v22;
  CFTypeRef cf;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;

  cf = 0;
  v3 = os_log_create("com.apple.powerdatad", "LTSStats");
  v4 = off_100014B00;
  off_100014B00 = v3;

  v22.receiver = self;
  v22.super_class = (Class)LTSStatsManager;
  v5 = -[LTSStatsManager init](&v22, "init");
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
      sub_10000B37C();
    v6 = 0;
    goto LABEL_22;
  }
  v6 = IOServiceNameMatching("RTBuddyIOReportingEndpoint");
  v7 = IOReportCopyChannelsForDrivers(v6, 0, &cf);
  if (!v7)
  {
    v16 = off_100014B00;
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v25 = (const char *)cf;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "IOReportCopyChannelsForDrivers error: %{public}@", buf, 0xCu);
    }
LABEL_22:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = (const void *)v7;
  if (!((uint64_t (*)(void))IOReportGetChannelCount)())
  {
    v17 = off_100014B00;
    if (!os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    *(_DWORD *)buf = 136315138;
    v25 = "RTBuddyIOReportingEndpoint";
    v18 = "No channels found for service %s";
    v19 = v17;
    v20 = 12;
LABEL_27:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, v18, buf, v20);
    goto LABEL_7;
  }
  IOReportPrune(v8, &stru_100010700);
  if (!IOReportGetChannelCount(v8))
  {
    v21 = off_100014B00;
    if (!os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    *(_DWORD *)buf = 136315394;
    v25 = "PMP";
    v26 = 2080;
    v27 = "Volt-Temp HM";
    v18 = "No channels found for group '%s' subgroup '%s'";
    v19 = v21;
    v20 = 22;
    goto LABEL_27;
  }
  v9 = IOReportCreateSubscription(0, v8, &v5->_subscribedChannels, 0, &cf);
  v5->_subscription = (__IOReportSubscriptionCF *)v9;
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_create("com.apple.powerdatad.ltsqueue", v11);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v12;

  }
  else if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
  {
    sub_10000B3A8();
  }
LABEL_7:
  if (cf)
    CFRelease(cf);
  if (v8)
    CFRelease(v8);
  if (v6)
    CFRelease(v6);
  if (v5->_queue)
    v14 = v5;
  else
    v14 = 0;

  return v14;
}

- (void)dealloc
{
  NSObject *v3;
  __IOReportSubscriptionCF *subscription;
  __CFDictionary *subscribedChannels;
  objc_super v6;
  uint8_t buf[16];

  v3 = off_100014B00;
  if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Dealloc call\n", buf, 2u);
  }
  subscription = self->_subscription;
  if (subscription)
    CFRelease(subscription);
  subscribedChannels = self->_subscribedChannels;
  if (subscribedChannels)
    CFRelease(subscribedChannels);
  v6.receiver = self;
  v6.super_class = (Class)LTSStatsManager;
  -[LTSStatsManager dealloc](&v6, "dealloc");
}

- (id)getStatsSinceBoot
{
  __IOReportSubscriptionCF *subscription;
  void *v4;
  CFTypeRef cf;

  cf = 0;
  subscription = self->_subscription;
  if (subscription)
  {
    v4 = (void *)IOReportCreateSamples(subscription, self->_subscribedChannels, &cf);
    if (v4)
      goto LABEL_3;
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
      sub_10000B434();
  }
  else if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
  {
    sub_10000B408();
  }
  v4 = 0;
LABEL_3:
  if (cf)
    CFRelease(cf);
  return v4;
}

- (int)updateLifetimeStatsForChannel:(__CFDictionary *)a3
{
  uint64_t ChannelName;
  uint64_t v5;
  uint64_t ChannelID;
  id v7;
  void *v8;
  void *v9;
  int Count;
  __int128 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t NameForIndex;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  int v25;
  __int128 v27;
  void *v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;

  ChannelName = IOReportChannelGetChannelName(a3, a2);
  if (ChannelName)
  {
    v5 = ChannelName;
    ChannelID = IOReportChannelGetChannelID(a3);
    v7 = -[LTSStatsStore initForChannel:]([LTSStatsStore alloc], "initForChannel:", v5);
    if (v7)
    {
      v8 = v7;
      v29 = ChannelID;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getLifetimeStatsForVersion:", ChannelID));
      Count = IOReportStateGetCount(a3);
      if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_DEBUG))
        sub_10000B520();
      v28 = (void *)v5;
      if (Count < 1)
      {
        v13 = 0;
      }
      else
      {
        v12 = 0;
        v13 = 0;
        *(_QWORD *)&v11 = 138412546;
        v27 = v11;
        do
        {
          v14 = v13;
          NameForIndex = IOReportStateGetNameForIndex(a3, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue(NameForIndex);

          v16 = IOReportStateGetInTransitions(a3, v12);
          v17 = off_100014B00;
          if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_DEBUG))
          {
            v22 = v17;
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v13));
            *(_DWORD *)buf = 138412802;
            v31 = v13;
            v32 = 2048;
            v33 = v16;
            v34 = 2112;
            v35 = v23;
            _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Incremented count for state %@ by %lld. Previous value: %@\n", buf, 0x20u);

          }
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v13, v27));

          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v13));
            v16 += (uint64_t)objc_msgSend(v19, "unsignedLongValue");

          }
          else
          {
            v20 = off_100014B00;
            if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v27;
              v31 = v13;
              v32 = 2048;
              v33 = v16;
              _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Added new state %@ to lifetime stats with count %lld", buf, 0x16u);
            }
          }
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v16));
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, v13);

          v12 = (v12 + 1);
        }
        while (Count != (_DWORD)v12);
      }
      objc_msgSend(v8, "saveLifetimeStats:forVersion:", v9, v29);
      v24 = off_100014B00;
      if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v31 = v28;
        v32 = 1024;
        LODWORD(v33) = Count;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Updated Channel name: %{public}@ Num States: %d", buf, 0x12u);
      }

      return 0;
    }
    else
    {
      v25 = 16;
      if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
        sub_10000B4C0();
    }
  }
  else
  {
    v25 = 16;
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
      sub_10000B494();
  }
  return v25;
}

- (void)updateLifetimeStatsGated
{
  _QWORD *v3;
  void *v4;
  void *v5;
  id *p_prevStatsSinceBoot;
  NSDictionary *prevStatsSinceBoot;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];
  _QWORD v13[5];
  CFTypeRef cf;

  v13[4] = self;
  cf = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000A258;
  v13[3] = &unk_100010728;
  v3 = objc_retainBlock(v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LTSStatsManager getStatsSinceBoot](self, "getStatsSinceBoot"));
  if (v4)
  {
    prevStatsSinceBoot = self->_prevStatsSinceBoot;
    p_prevStatsSinceBoot = (id *)&self->_prevStatsSinceBoot;
    v5 = prevStatsSinceBoot;
    if (!prevStatsSinceBoot)
    {
      v8 = objc_claimAutoreleasedReturnValue(+[LTSStatsStore getPrevStatsSinceBoot](LTSStatsStore, "getPrevStatsSinceBoot"));
      v9 = *p_prevStatsSinceBoot;
      *p_prevStatsSinceBoot = (id)v8;

      v5 = *p_prevStatsSinceBoot;
      if (!*p_prevStatsSinceBoot)
      {
        v10 = v4;
        v11 = off_100014B00;
        if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "No Previously saved stats since boot\n", v12, 2u);
        }
        goto LABEL_5;
      }
    }
    v10 = (id)IOReportCreateSamplesDelta(v5, v4, &cf);
    if (v10)
    {
LABEL_5:
      IOReportIterate(v10, v3);
      +[LTSStatsStore saveStatsSinceBoot:](LTSStatsStore, "saveStatsSinceBoot:", v4);
      objc_storeStrong(p_prevStatsSinceBoot, v4);
      goto LABEL_6;
    }
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
      sub_10000B5AC();
  }
  else if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
  {
    sub_10000B580();
  }
  v10 = 0;
LABEL_6:
  if (cf)
    CFRelease(cf);

}

- (void)updateLifetimeStats
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A2BC;
  block[3] = &unk_100010750;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)getLifetimeStats
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10000A3A0;
  v10 = sub_10000A3B0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000A3B8;
  v5[3] = &unk_100010778;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_DEBUG))
    sub_10000B60C();
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSDictionary)prevStatsSinceBoot
{
  return self->_prevStatsSinceBoot;
}

- (void)setPrevStatsSinceBoot:(id)a3
{
  objc_storeStrong((id *)&self->_prevStatsSinceBoot, a3);
}

- (__CFDictionary)subscribedChannels
{
  return self->_subscribedChannels;
}

- (void)setSubscribedChannels:(__CFDictionary *)a3
{
  self->_subscribedChannels = a3;
}

- (__IOReportSubscriptionCF)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(__IOReportSubscriptionCF *)a3
{
  self->_subscription = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_prevStatsSinceBoot, 0);
}

@end
