@implementation WAApple80211

- (WAApple80211)init
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("Please use the init defined in the header for this class"), 0));
  objc_exception_throw(v2);
}

- (id)initByFindingInterfaceName
{
  WAApple80211 *v2;
  WAApple80211 *v3;
  _Apple80211 **p_apple80211Ref;
  uint64_t v5;
  NSString *ValueAtIndex;
  id v7;
  NSObject *v8;
  NSString **p_ifName;
  uint64_t v10;
  NSDate *lastDateChannelQueried;
  uint64_t v12;
  NSDate *lastDateBSSIDQueried;
  void *v14;
  void *v15;
  dispatch_queue_attr_t v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *analyticsMOCQueue;
  WAMessage *v20;
  void *dummyWAMessage;
  id v23;
  NSObject *v24;
  const char *v25;
  id v26;
  NSObject *v27;
  uint32_t v28;
  id v29;
  id v30;
  NSString *v31;
  uint64_t v32;
  id v33;
  id v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  objc_super v38;
  id obj;
  CFArrayRef theArray;
  uint8_t buf[4];
  _BYTE v42[14];
  __int16 v43;
  NSString *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  uint64_t v48;

  obj = 0;
  theArray = 0;
  v38.receiver = self;
  v38.super_class = (Class)WAApple80211;
  v2 = -[WAApple80211 init](&v38, "init");
  v3 = v2;
  if (!v2)
  {
    LODWORD(v5) = 0;
LABEL_30:
    v34 = WALogCategoryDefaultHandle();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)v42 = "-[WAApple80211 initByFindingInterfaceName]";
      *(_WORD *)&v42[8] = 1024;
      *(_DWORD *)&v42[10] = 124;
      v43 = 1024;
      LODWORD(v44) = v5;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to init WAApple80211 err is: %d", buf, 0x18u);
    }

    v36 = WALogCategoryDefaultHandle();
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v42 = v5;
      *(_WORD *)&v42[4] = 2112;
      *(_QWORD *)&v42[6] = obj;
      _os_log_fault_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_FAULT, "Failed to init WAApple80211 err is: %d, interface %@", buf, 0x12u);
    }

    v17 = 0;
    if (obj)
      CFRelease(obj);
    dummyWAMessage = v3;
    v3 = 0;
    goto LABEL_11;
  }
  p_apple80211Ref = &v2->_apple80211Ref;
  LODWORD(v5) = Apple80211Open(&v2->_apple80211Ref);
  if ((_DWORD)v5)
  {
    v23 = WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)v42 = "-[WAApple80211 initByFindingInterfaceName]";
    *(_WORD *)&v42[8] = 1024;
    *(_DWORD *)&v42[10] = 78;
    v43 = 1024;
    LODWORD(v44) = v5;
    v25 = "%{public}s::%d:Apple80211Open failed with: %d";
    goto LABEL_20;
  }
  LODWORD(v5) = Apple80211GetIfListCopy(*p_apple80211Ref, &theArray);
  if ((_DWORD)v5)
  {
    v26 = WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)v42 = "-[WAApple80211 initByFindingInterfaceName]";
    *(_WORD *)&v42[8] = 1024;
    *(_DWORD *)&v42[10] = 81;
    v43 = 1024;
    LODWORD(v44) = v5;
    v25 = "%{public}s::%d:Apple80211GetIfListCopy failed with: %d";
LABEL_20:
    v27 = v24;
    v28 = 24;
    goto LABEL_28;
  }
  if (!CFArrayGetCount(theArray))
  {
    v29 = WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)v42 = "-[WAApple80211 initByFindingInterfaceName]";
      *(_WORD *)&v42[8] = 1024;
      *(_DWORD *)&v42[10] = 83;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}s::%d:Apple80211GetIfListCopy returned 0 interfaces", buf, 0x12u);
    }
    LODWORD(v5) = 0;
    goto LABEL_29;
  }
  ValueAtIndex = (NSString *)CFArrayGetValueAtIndex(theArray, 0);
  v7 = WALogCategoryDefaultHandle();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)v42 = "-[WAApple80211 initByFindingInterfaceName]";
    *(_WORD *)&v42[8] = 1024;
    *(_DWORD *)&v42[10] = 87;
    v43 = 2112;
    v44 = ValueAtIndex;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Found WiFi interface %@\n", buf, 0x1Cu);
  }

  p_ifName = &v3->_ifName;
  objc_storeStrong((id *)&v3->_ifName, ValueAtIndex);
  v5 = Apple80211BindToInterface(v3->_apple80211Ref, v3->_ifName);
  if ((_DWORD)v5)
  {
    v30 = WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue(v30);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    v31 = *p_ifName;
    v32 = Apple80211ErrToStr(v5);
    *(_DWORD *)buf = 136447234;
    *(_QWORD *)v42 = "-[WAApple80211 initByFindingInterfaceName]";
    *(_WORD *)&v42[8] = 1024;
    *(_DWORD *)&v42[10] = 93;
    v43 = 2112;
    v44 = v31;
    v45 = 1024;
    v46 = v5;
    v47 = 2080;
    v48 = v32;
    v25 = "%{public}s::%d:Apple80211BindToInterface (for interface with name: %@) failed with: %d - %s";
    v27 = v24;
    v28 = 44;
LABEL_28:
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, v25, buf, v28);
    goto LABEL_29;
  }
  LODWORD(v5) = Apple80211GetInterfaceNameCopy(*p_apple80211Ref, &obj);
  objc_storeStrong((id *)&v3->_ifName, obj);
  if (!*p_ifName)
  {
    v33 = WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)v42 = "-[WAApple80211 initByFindingInterfaceName]";
      *(_WORD *)&v42[8] = 1024;
      *(_DWORD *)&v42[10] = 100;
      v25 = "%{public}s::%d:No interface name to use with Apple80211";
      v27 = v24;
      v28 = 18;
      goto LABEL_28;
    }
LABEL_29:

    goto LABEL_30;
  }
  v10 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  lastDateChannelQueried = v3->_lastDateChannelQueried;
  v3->_lastDateChannelQueried = (NSDate *)v10;

  dword_1000ECFE0 = 0;
  qword_1000ECFD8 = 0;
  v12 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  lastDateBSSIDQueried = v3->_lastDateBSSIDQueried;
  v3->_lastDateBSSIDQueried = (NSDate *)v12;

  v14 = (void *)qword_1000ECFB8;
  qword_1000ECFB8 = (uint64_t)CFSTR("00:00:00:00:00:00");

  v15 = (void *)qword_1000ECFC0;
  qword_1000ECFC0 = (uint64_t)CFSTR("Uninit lastSSID");

  v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = dispatch_queue_create("com.apple.wifi.recoveryMO.queue", v17);
  analyticsMOCQueue = v3->analyticsMOCQueue;
  v3->analyticsMOCQueue = (OS_dispatch_queue *)v18;

  byte_1000ECFB0 = 0;
  if (v3->_dummyWAMessage)
    goto LABEL_12;
  v20 = (WAMessage *)objc_alloc_init((Class)WAMessage);
  dummyWAMessage = v3->_dummyWAMessage;
  v3->_dummyWAMessage = v20;
LABEL_11:

LABEL_12:
  if (theArray)
    CFRelease(theArray);

  return v3;
}

- (WAApple80211)initWithInterfaceName:(id)a3
{
  id v5;
  WAApple80211 *v6;
  WAApple80211 *v7;
  NSString **p_ifName;
  uint64_t v9;
  uint64_t v10;
  NSDate *lastDateChannelQueried;
  uint64_t v12;
  NSDate *lastDateBSSIDQueried;
  void *v14;
  void *v15;
  dispatch_queue_attr_t v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *analyticsMOCQueue;
  WAMessage *v20;
  void *dummyWAMessage;
  id v23;
  NSObject *v24;
  id v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  id v29;
  NSString *v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  objc_super v36;
  uint8_t buf[4];
  _BYTE v38[14];
  __int16 v39;
  NSString *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  uint64_t v44;

  v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)WAApple80211;
  v6 = -[WAApple80211 init](&v36, "init");
  v7 = v6;
  if (!v6)
  {
    LODWORD(v9) = 0;
LABEL_19:
    v32 = WALogCategoryDefaultHandle();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)v38 = "-[WAApple80211 initWithInterfaceName:]";
      *(_WORD *)&v38[8] = 1024;
      *(_DWORD *)&v38[10] = 182;
      v39 = 1024;
      LODWORD(v40) = v9;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to init WAApple80211 err is: %d", buf, 0x18u);
    }

    v34 = WALogCategoryDefaultHandle();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v38 = v9;
      *(_WORD *)&v38[4] = 2112;
      *(_QWORD *)&v38[6] = v5;
      _os_log_fault_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_FAULT, "Failed to init WAApple80211 err is: %d, interface %@", buf, 0x12u);
    }

    v17 = 0;
    dummyWAMessage = v7;
    v7 = 0;
    goto LABEL_7;
  }
  p_ifName = &v6->_ifName;
  objc_storeStrong((id *)&v6->_ifName, a3);
  if (!*p_ifName)
  {
    v23 = WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)v38 = "-[WAApple80211 initWithInterfaceName:]";
      *(_WORD *)&v38[8] = 1024;
      *(_DWORD *)&v38[10] = 151;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}s::%d:No interface name to use with Apple80211", buf, 0x12u);
    }
    LODWORD(v9) = 0;
    goto LABEL_18;
  }
  LODWORD(v9) = Apple80211Open(&v7->_apple80211Ref);
  if ((_DWORD)v9)
  {
    v25 = WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)v38 = "-[WAApple80211 initWithInterfaceName:]";
      *(_WORD *)&v38[8] = 1024;
      *(_DWORD *)&v38[10] = 154;
      v39 = 1024;
      LODWORD(v40) = v9;
      v26 = "%{public}s::%d:Apple80211Open failed with: %d";
      v27 = v24;
      v28 = 24;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
    }
LABEL_18:

    goto LABEL_19;
  }
  v9 = Apple80211BindToInterface(v7->_apple80211Ref, *p_ifName);
  if ((_DWORD)v9)
  {
    v29 = WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v30 = *p_ifName;
      v31 = Apple80211ErrToStr(v9);
      *(_DWORD *)buf = 136447234;
      *(_QWORD *)v38 = "-[WAApple80211 initWithInterfaceName:]";
      *(_WORD *)&v38[8] = 1024;
      *(_DWORD *)&v38[10] = 157;
      v39 = 2112;
      v40 = v30;
      v41 = 1024;
      v42 = v9;
      v43 = 2080;
      v44 = v31;
      v26 = "%{public}s::%d:Apple80211BindToInterface (for interface with name: %@) failed with: %d - %s";
      v27 = v24;
      v28 = 44;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v10 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  lastDateChannelQueried = v7->_lastDateChannelQueried;
  v7->_lastDateChannelQueried = (NSDate *)v10;

  dword_1000ECFE0 = 0;
  qword_1000ECFD8 = 0;
  v12 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  lastDateBSSIDQueried = v7->_lastDateBSSIDQueried;
  v7->_lastDateBSSIDQueried = (NSDate *)v12;

  v14 = (void *)qword_1000ECFB8;
  qword_1000ECFB8 = (uint64_t)CFSTR("00:00:00:00:00:00");

  v15 = (void *)qword_1000ECFC0;
  qword_1000ECFC0 = (uint64_t)CFSTR("Uninit lastSSID");

  v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = dispatch_queue_create("com.apple.wifi.recoveryMO.queue", v17);
  analyticsMOCQueue = v7->analyticsMOCQueue;
  v7->analyticsMOCQueue = (OS_dispatch_queue *)v18;

  byte_1000ECFB0 = 0;
  if (!v7->_dummyWAMessage)
  {
    v20 = (WAMessage *)objc_alloc_init((Class)WAMessage);
    dummyWAMessage = v7->_dummyWAMessage;
    v7->_dummyWAMessage = v20;
LABEL_7:

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  if (-[WAApple80211 apple80211Ref](self, "apple80211Ref"))
    Apple80211Close(self->_apple80211Ref);
  v3.receiver = self;
  v3.super_class = (Class)WAApple80211;
  -[WAApple80211 dealloc](&v3, "dealloc");
}

- (BOOL)hasSoftAPInterfaceListed
{
  int VirtualIfListCopy;
  void *v3;
  int v4;
  id v5;
  uint64_t v6;
  void *i;
  id v9;
  NSObject *v10;
  CFTypeRef cf;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;

  cf = 0;
  VirtualIfListCopy = Apple80211GetVirtualIfListCopy(self->_apple80211Ref, &cf, 0);
  if (VirtualIfListCopy)
  {
    v9 = WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v18 = "-[WAApple80211 hasSoftAPInterfaceListed]";
      v19 = 1024;
      v20 = 204;
      v21 = 1024;
      v22 = VirtualIfListCopy;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Apple80211GetVirtualIfListCopy failed with: %d", buf, 0x18u);
    }

    if (cf)
      CFRelease(cf);
    LOBYTE(v4) = 0;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = (id)cf;
    v4 = 0;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          v4 |= objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "containsString:", CFSTR("ap"));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      }
      while (v5);
    }

  }
  return v4 & 1;
}

- (BOOL)hasNANInterfaceListed
{
  int VirtualIfListCopy;
  void *v3;
  int v4;
  id v5;
  uint64_t v6;
  void *i;
  id v9;
  NSObject *v10;
  CFTypeRef cf;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;

  cf = 0;
  VirtualIfListCopy = Apple80211GetVirtualIfListCopy(self->_apple80211Ref, &cf, 0);
  if (VirtualIfListCopy)
  {
    v9 = WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v18 = "-[WAApple80211 hasNANInterfaceListed]";
      v19 = 1024;
      v20 = 229;
      v21 = 1024;
      v22 = VirtualIfListCopy;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Apple80211GetVirtualIfListCopy failed with: %d", buf, 0x18u);
    }

    if (cf)
      CFRelease(cf);
    LOBYTE(v4) = 0;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = (id)cf;
    v4 = 0;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          v4 |= objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "containsString:", CFSTR("nan"));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      }
      while (v5);
    }

  }
  return v4 & 1;
}

- (BOOL)hasIRInterfaceListed
{
  int VirtualIfListCopy;
  void *v3;
  int v4;
  id v5;
  uint64_t v6;
  void *i;
  id v9;
  NSObject *v10;
  CFTypeRef cf;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;

  cf = 0;
  VirtualIfListCopy = Apple80211GetVirtualIfListCopy(self->_apple80211Ref, &cf, 0);
  if (VirtualIfListCopy)
  {
    v9 = WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v18 = "-[WAApple80211 hasIRInterfaceListed]";
      v19 = 1024;
      v20 = 254;
      v21 = 1024;
      v22 = VirtualIfListCopy;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Apple80211GetVirtualIfListCopy failed with: %d", buf, 0x18u);
    }

    if (cf)
      CFRelease(cf);
    LOBYTE(v4) = 0;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = (id)cf;
    v4 = 0;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          v4 |= objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "containsString:", CFSTR("ir"));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      }
      while (v5);
    }

  }
  return v4 & 1;
}

- (BOOL)hasAWDLInterfaceListed
{
  int VirtualIfListCopy;
  void *v3;
  int v4;
  id v5;
  uint64_t v6;
  void *i;
  id v9;
  NSObject *v10;
  CFTypeRef cf;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;

  cf = 0;
  VirtualIfListCopy = Apple80211GetVirtualIfListCopy(self->_apple80211Ref, &cf, 0);
  if (VirtualIfListCopy)
  {
    v9 = WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v18 = "-[WAApple80211 hasAWDLInterfaceListed]";
      v19 = 1024;
      v20 = 279;
      v21 = 1024;
      v22 = VirtualIfListCopy;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Apple80211GetVirtualIfListCopy failed with: %d", buf, 0x18u);
    }

    if (cf)
      CFRelease(cf);
    LOBYTE(v4) = 0;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = (id)cf;
    v4 = 0;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          v4 |= objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "containsString:", CFSTR("awdl"));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      }
      while (v5);
    }

  }
  return v4 & 1;
}

- (int)currentPHYMode
{
  void *v3;
  int v4;
  int v5;
  int v6;
  void *v7;
  int v8;
  id v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = 7;
  while (1)
  {
    v5 = Apple80211Get(-[WAApple80211 apple80211Ref](self, "apple80211Ref"), 14, 0, v3, 8);
    v6 = v5;
    if (v5 <= 15)
    {
      if (v5 != -3905)
        break;
    }
    else if (v5 != 61 && v5 != 16)
    {
      goto LABEL_12;
    }
    if (!--v4)
      break;
    usleep(0x7A120u);
  }
  if (!v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PHYMODE_ACTIVE")));
    v8 = objc_msgSend(v7, "intValue");
    goto LABEL_11;
  }
LABEL_12:
  v10 = WALogCategoryDefaultHandle();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = 136446722;
    v13 = "-[WAApple80211 currentPHYMode]";
    v14 = 1024;
    v15 = 305;
    v16 = 1024;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:Apple80211Get(APPLE80211_IOC_PHY_MODE) failed: %d", (uint8_t *)&v12, 0x18u);
  }

  v7 = 0;
  v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)grabAndSubmitFWTrapInfo
{
  void *v3;
  int v4;
  int v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  BOOL v22;
  id v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  int v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  id v37;
  __int16 v38;
  NSObject *v39;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (-[WAApple80211 apple80211Ref](self, "apple80211Ref"))
  {
    v4 = 7;
    while (1)
    {
      v5 = Apple80211Get(-[WAApple80211 apple80211Ref](self, "apple80211Ref"), 339, 0, v3, 8);
      v6 = v5;
      if (v5 <= 15)
      {
        if (v5 != -3905)
          break;
      }
      else if (v5 != 61 && v5 != 16)
      {
        goto LABEL_22;
      }
      if (!--v4)
        break;
      usleep(0x7A120u);
    }
    if (v5)
    {
LABEL_22:
      v28 = WALogCategoryDefaultHandle();
      v17 = objc_claimAutoreleasedReturnValue(v28);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_30;
      v32 = 136446722;
      v33 = "-[WAApple80211 grabAndSubmitFWTrapInfo]";
      v34 = 1024;
      v35 = 322;
      v36 = 1024;
      LODWORD(v37) = v6;
      v25 = "%{public}s::%d:Apple80211Get(APPLE80211_IOC_TRAP_CRASHTRACER_MINI_DUMP) failed: %d";
      v26 = v17;
      v27 = 24;
      goto LABEL_24;
    }
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", &off_1000E0038));
    v8 = v7;
    if (v7)
    {
      v9 = objc_retainAutorelease(v7);
      CCSubmitLogToCrashTracer((const char *)-[NSObject bytes](v9, "bytes"), (int)-[NSObject length](v9, "length"));
      v10 = WALogCategoryDefaultHandle();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
LABEL_15:

        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", &off_1000E0050));
        v17 = v16;
        if (v8)
        {
          v18 = objc_retainAutorelease(v16);
          CCSubmitBinaryToCrashTracer((uint64_t)-[NSObject bytes](v18, "bytes"), (int)-[NSObject length](v18, "length"));
          v19 = WALogCategoryDefaultHandle();
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            v21 = -[NSObject length](v18, "length");
            v32 = 136446978;
            v33 = "-[WAApple80211 grabAndSubmitFWTrapInfo]";
            v34 = 1024;
            v35 = 334;
            v36 = 2048;
            v37 = v21;
            v38 = 2112;
            v39 = v18;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Did pass binary readable to CCSubmitBinaryToCrashTracer() of length(%ld): %@", (uint8_t *)&v32, 0x26u);
          }

          v22 = 1;
          v17 = v8;
          goto LABEL_19;
        }
        v30 = WALogCategoryDefaultHandle();
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = 136446466;
          v33 = "-[WAApple80211 grabAndSubmitFWTrapInfo]";
          v34 = 1024;
          v35 = 332;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%{public}s::%d:No bainry tag represented in dictionary, skipping.", (uint8_t *)&v32, 0x12u);
        }

        goto LABEL_30;
      }
      v32 = 136446978;
      v33 = "-[WAApple80211 grabAndSubmitFWTrapInfo]";
      v34 = 1024;
      v35 = 328;
      v36 = 2048;
      v37 = -[NSObject length](v9, "length");
      v38 = 2112;
      v39 = v9;
      v12 = "%{public}s::%d:Did pass human readable to CCSubmitLogToCrashTracer() of length(%ld): %@";
      v13 = v11;
      v14 = OS_LOG_TYPE_DEBUG;
      v15 = 38;
    }
    else
    {
      v29 = WALogCategoryDefaultHandle();
      v11 = objc_claimAutoreleasedReturnValue(v29);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      v32 = 136446466;
      v33 = "-[WAApple80211 grabAndSubmitFWTrapInfo]";
      v34 = 1024;
      v35 = 326;
      v12 = "%{public}s::%d:No human readable tag represented in dictionary, skipping.";
      v13 = v11;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 18;
    }
    _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, (uint8_t *)&v32, v15);
    goto LABEL_15;
  }
  v24 = WALogCategoryDefaultHandle();
  v17 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v32 = 136446466;
    v33 = "-[WAApple80211 grabAndSubmitFWTrapInfo]";
    v34 = 1024;
    v35 = 319;
    v25 = "%{public}s::%d:Failure as Apple80211Ref is NULL";
    v26 = v17;
    v27 = 18;
LABEL_24:
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v32, v27);
  }
LABEL_30:
  v22 = 0;
LABEL_19:

  return v22;
}

- (BOOL)grabAndSubmitLqmMetrics
{
  void *v3;
  int v4;
  int v5;
  int v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  id v13;
  const char *v14;
  id v15;
  NSObject *v16;
  uint32_t v17;
  id v18;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  __int16 v25;
  NSObject *v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (-[WAApple80211 apple80211Ref](self, "apple80211Ref"))
  {
    v4 = 7;
    while (1)
    {
      v5 = Apple80211Get(-[WAApple80211 apple80211Ref](self, "apple80211Ref"), 384, 0, v3, 8);
      v6 = v5;
      if (v5 <= 15)
      {
        if (v5 != -3905)
          break;
      }
      else if (v5 != 61 && v5 != 16)
      {
        goto LABEL_18;
      }
      if (!--v4)
        break;
      usleep(0x7A120u);
    }
    if (v5)
    {
LABEL_18:
      v15 = WALogCategoryDefaultHandle();
      v8 = objc_claimAutoreleasedReturnValue(v15);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      v19 = 136446722;
      v20 = "-[WAApple80211 grabAndSubmitLqmMetrics]";
      v21 = 1024;
      v22 = 350;
      v23 = 1024;
      LODWORD(v24) = v6;
      v14 = "%{public}s::%d:Apple80211Get(APPLE80211_IOC_LQM_METRICS_CRASHTRACER_DATA) failed: %d";
      v16 = v8;
      v17 = 24;
      goto LABEL_23;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", &off_1000E0068));
    if (v7)
    {
      v8 = objc_retainAutorelease(v7);
      CCSubmitLqmMetricsTLVBlockToCrashTracer((uint64_t)-[NSObject bytes](v8, "bytes"), (int)-[NSObject length](v8, "length"));
      v9 = WALogCategoryDefaultHandle();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 136446978;
        v20 = "-[WAApple80211 grabAndSubmitLqmMetrics]";
        v21 = 1024;
        v22 = 355;
        v23 = 2048;
        v24 = -[NSObject length](v8, "length");
        v25 = 2112;
        v26 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:CCSubmitLqmMetricsTLVBlockToCrashTracer() length(%ld): %@", (uint8_t *)&v19, 0x26u);
      }

      v11 = 1;
      goto LABEL_15;
    }
    v18 = WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v19 = 136446466;
    v20 = "-[WAApple80211 grabAndSubmitLqmMetrics]";
    v21 = 1024;
    v22 = 353;
    v14 = "%{public}s::%d:No LQM bainry tag represented in dictionary, skipping.";
  }
  else
  {
    v13 = WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue(v13);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v19 = 136446466;
    v20 = "-[WAApple80211 grabAndSubmitLqmMetrics]";
    v21 = 1024;
    v22 = 347;
    v14 = "%{public}s::%d:Failure as Apple80211Ref is NULL";
  }
  v16 = v8;
  v17 = 18;
LABEL_23:
  _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v19, v17);
LABEL_24:
  v11 = 0;
LABEL_15:

  return v11;
}

- (void)submitLqmMetrics:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;

  v3 = objc_retainAutorelease(a3);
  CCSubmitLqmMetricsTLVBlockToCrashTracer((uint64_t)objc_msgSend(v3, "bytes"), (int)objc_msgSend(v3, "length"));
  v4 = WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446978;
    v7 = "-[WAApple80211 submitLqmMetrics:]";
    v8 = 1024;
    v9 = 365;
    v10 = 2048;
    v11 = objc_msgSend(v3, "length");
    v12 = 2112;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:CCSubmitLqmMetricsTLVBlockToCrashTracer() length(%ld): %@", (uint8_t *)&v6, 0x26u);
  }

}

- (void)_storeAttemptedRecovery:(id)a3 reason:(id)a4 fromSSID:(id)a5 fromBSSID:(id)a6 commandResult:(int)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  _QWORD v31[4];

  v7 = *(_QWORD *)&a7;
  v22 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = objc_alloc_init((Class)NSMutableDictionary);
  v28 = *((_QWORD *)&WADeviceAnalyticsRecoveryInfo + 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v29 = *((_OWORD *)&WADeviceAnalyticsRecoveryInfo + 2);
  v31[0] = v16;
  v31[1] = v22;
  v31[2] = v12;
  v30 = *((_QWORD *)&WADeviceAnalyticsRecoveryInfo + 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
  v31[3] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, &v28, 4));
  objc_msgSend(v15, "addEntriesFromDictionary:", v18);

  if (v14)
  {
    v26 = *((_QWORD *)&WADeviceAnalyticsRecoveryInfo + 2);
    v27 = v14;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    objc_msgSend(v15, "addEntriesFromDictionary:", v19);

  }
  if (v13)
  {
    v24 = *((_QWORD *)&WADeviceAnalyticsRecoveryInfo + 3);
    v25 = v13;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
    objc_msgSend(v15, "addEntriesFromDictionary:", v20);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[WAApple80211 dbDelegate](self, "dbDelegate", v22));
  objc_msgSend(v21, "processMetricDictOffEngine:data:", WADeviceAnalyticsRecoveryInfo, v15);

}

- (BOOL)triggerFastDpsReset
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  id v14;
  int v15;
  int v16;
  int v17;
  OS_dispatch_queue *analyticsMOCQueue;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  _QWORD v24[7];
  int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_10002D844;
  v36 = sub_10002D854;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_10002D844;
  v30 = sub_10002D854;
  v31 = 0;
  if (-[WAApple80211 isAssociated](self, "isAssociated"))
  {
    v4 = objc_claimAutoreleasedReturnValue(-[WAApple80211 currentBSSIDandSSID](self, "currentBSSIDandSSID"));
    v5 = v4;
    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("bssid")));
      v7 = v6 == 0;

      if (!v7)
      {
        v8 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("bssid")));
        v9 = (void *)v33[5];
        v33[5] = v8;

      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("ssid")));
      v11 = v10 == 0;

      if (!v11)
      {
        v12 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("ssid")));
        v13 = (void *)v27[5];
        v27[5] = v12;

      }
    }
  }
  else
  {
    v14 = WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v39 = "-[WAApple80211 triggerFastDpsReset]";
      v40 = 1024;
      v41 = 396;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error Apple80211Set(APPLE80211_IOC_RESET_CHIP) for triggerFastDpsReset when not associated", buf, 0x12u);
    }
  }

  objc_msgSend(v3, "setValue:forKeyPath:", CFSTR("DPSQuickTriggeredChipReset"), CFSTR("CHIP_RESET_TRIGGER"));
  v15 = 7;
  while (1)
  {
    v16 = Apple80211Set(-[WAApple80211 apple80211Ref](self, "apple80211Ref"), 239, 0, v3, 8);
    v17 = v16;
    if (v16 != -3905 && v16 != 61 && v16 != 16)
      break;
    if (!--v15)
      break;
    usleep(0x7A120u);
  }
  if (v16)
  {
    v20 = WALogCategoryDefaultHandle();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v39 = "-[WAApple80211 triggerFastDpsReset]";
      v40 = 1024;
      v41 = 411;
      v42 = 1024;
      v43 = v17;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}s::%d:Apple80211Set(APPLE80211_IOC_RESET_CHIP) failed: %d", buf, 0x18u);
    }

    v22 = WALogCategoryDefaultHandle();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v39) = v17;
      _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "Failed to triggerFastDpsReset err %d", buf, 8u);
    }

  }
  analyticsMOCQueue = self->analyticsMOCQueue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10002D85C;
  v24[3] = &unk_1000CCEC0;
  v24[4] = self;
  v24[5] = &v26;
  v24[6] = &v32;
  v25 = v17;
  dispatch_async((dispatch_queue_t)analyticsMOCQueue, v24);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v17 == 0;
}

- (BOOL)triggerDpsReset:(id)a3
{
  char *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  id v16;
  int v17;
  int v18;
  int v19;
  OS_dispatch_queue *analyticsMOCQueue;
  char *v21;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  _QWORD block[5];
  char *v28;
  uint64_t *v29;
  uint64_t *v30;
  int v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;

  v4 = (char *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_10002D844;
  v42 = sub_10002D854;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_10002D844;
  v36 = sub_10002D854;
  v37 = 0;
  if (-[WAApple80211 isAssociated](self, "isAssociated"))
  {
    v6 = objc_claimAutoreleasedReturnValue(-[WAApple80211 currentBSSIDandSSID](self, "currentBSSIDandSSID"));
    v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("bssid")));
      v9 = v8 == 0;

      if (!v9)
      {
        v10 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("bssid")));
        v11 = (void *)v39[5];
        v39[5] = v10;

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("ssid")));
      v13 = v12 == 0;

      if (!v13)
      {
        v14 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("ssid")));
        v15 = (void *)v33[5];
        v33[5] = v14;

      }
    }
  }
  else
  {
    v16 = WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v45 = "-[WAApple80211 triggerDpsReset:]";
      v46 = 1024;
      v47 = 436;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error Apple80211Set(APPLE80211_IOC_RESET_CHIP) for triggerFastDpsReset when not associated", buf, 0x12u);
    }
  }

  objc_msgSend(v5, "setValue:forKeyPath:", v4, CFSTR("CHIP_RESET_TRIGGER"));
  v17 = 7;
  while (1)
  {
    v18 = Apple80211Set(-[WAApple80211 apple80211Ref](self, "apple80211Ref"), 239, 0, v5, 8);
    v19 = v18;
    if (v18 != -3905 && v18 != 61 && v18 != 16)
      break;
    if (!--v17)
      break;
    usleep(0x7A120u);
  }
  if (v18)
  {
    v23 = WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v45 = "-[WAApple80211 triggerDpsReset:]";
      v46 = 1024;
      v47 = 451;
      v48 = 1024;
      v49 = v19;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}s::%d:Apple80211Set(APPLE80211_IOC_RESET_CHIP) failed: %d", buf, 0x18u);
    }

    v25 = WALogCategoryDefaultHandle();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v45 = v4;
      v46 = 1024;
      v47 = v19;
      _os_log_fault_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "Failed to triggerDpsReset: %@, err %d", buf, 0x12u);
    }

  }
  analyticsMOCQueue = self->analyticsMOCQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002DCB0;
  block[3] = &unk_1000CCEE8;
  block[4] = self;
  v28 = v4;
  v29 = &v32;
  v30 = &v38;
  v31 = v19;
  v21 = v4;
  dispatch_async((dispatch_queue_t)analyticsMOCQueue, block);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v19 == 0;
}

- (BOOL)triggerReassociation:(id)a3
{
  char *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  id v16;
  int v17;
  int v18;
  int v19;
  OS_dispatch_queue *analyticsMOCQueue;
  char *v21;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  _QWORD block[5];
  char *v28;
  uint64_t *v29;
  uint64_t *v30;
  int v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;

  v4 = (char *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_10002D844;
  v42 = sub_10002D854;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_10002D844;
  v36 = sub_10002D854;
  v37 = 0;
  if (-[WAApple80211 isAssociated](self, "isAssociated"))
  {
    v6 = objc_claimAutoreleasedReturnValue(-[WAApple80211 currentBSSIDandSSID](self, "currentBSSIDandSSID"));
    v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("bssid")));
      v9 = v8 == 0;

      if (!v9)
      {
        v10 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("bssid")));
        v11 = (void *)v39[5];
        v39[5] = v10;

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("ssid")));
      v13 = v12 == 0;

      if (!v13)
      {
        v14 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("ssid")));
        v15 = (void *)v33[5];
        v33[5] = v14;

      }
    }
  }
  else
  {
    v16 = WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v45 = "-[WAApple80211 triggerReassociation:]";
      v46 = 1024;
      v47 = 475;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error Apple80211Set(APPLE80211_IOC_RESET_CHIP) for triggerFastDpsReset when not associated", buf, 0x12u);
    }
  }

  objc_msgSend(v5, "setValue:forKeyPath:", v4, CFSTR("REASSOC_CC_TRIGGER"));
  v17 = 7;
  while (1)
  {
    v18 = Apple80211Set(-[WAApple80211 apple80211Ref](self, "apple80211Ref"), 399, 0, v5, 8);
    v19 = v18;
    if (v18 != -3905 && v18 != 61 && v18 != 16)
      break;
    if (!--v17)
      break;
    usleep(0x7A120u);
  }
  if (v18)
  {
    v23 = WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v45 = "-[WAApple80211 triggerReassociation:]";
      v46 = 1024;
      v47 = 490;
      v48 = 1024;
      v49 = v19;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}s::%d:Apple80211Set(APPLE80211_IOC_REASSOCIATE_WITH_CORECAPTURE) failed: %d", buf, 0x18u);
    }

    v25 = WALogCategoryDefaultHandle();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v45 = v4;
      v46 = 1024;
      v47 = v19;
      _os_log_fault_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "Failed to triggerReassociation: %@, err %d", buf, 0x12u);
    }

  }
  analyticsMOCQueue = self->analyticsMOCQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E0FC;
  block[3] = &unk_1000CCEE8;
  block[4] = self;
  v28 = v4;
  v29 = &v32;
  v30 = &v38;
  v31 = v19;
  v21 = v4;
  dispatch_async((dispatch_queue_t)analyticsMOCQueue, block);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v19 == 0;
}

- (BOOL)currentChannelInfo:(apple80211_channel *)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  BOOL v17;
  id v19;
  NSObject *v20;
  int v21;
  id v22;
  int v23;
  const char *v24;
  __int16 v25;
  int v26;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = v6;
  if (self->_lastDateChannelQueried)
  {
    objc_msgSend(v6, "timeIntervalSinceDate:");
    if (v8 <= 2.0)
    {
      v14 = WALogCategoryDefaultHandle();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v23 = 136446466;
        v24 = "-[WAApple80211 currentChannelInfo:]";
        v25 = 1024;
        v26 = 514;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Using Cached instead of new query", (uint8_t *)&v23, 0x12u);
      }

      v16 = qword_1000ECFD8;
      a3->var2 = dword_1000ECFE0;
      *(_QWORD *)&a3->var0 = v16;
LABEL_16:
      v17 = 1;
      goto LABEL_17;
    }
  }
  objc_storeStrong((id *)&self->_lastDateChannelQueried, v7);
  v9 = 7;
  while (1)
  {
    v10 = Apple80211Get(-[WAApple80211 apple80211Ref](self, "apple80211Ref"), 4, 0, v5, 8);
    if (v10 > 15)
      break;
    if (v10 != -3905)
      goto LABEL_11;
LABEL_9:
    if (!--v9)
    {
LABEL_11:
      if (!v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("CHANNEL")));
        a3->var1 = objc_msgSend(v11, "unsignedIntValue");

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("CHANNEL_FLAGS")));
        a3->var2 = objc_msgSend(v12, "unsignedIntValue");

        v13 = *(_QWORD *)&a3->var0;
        dword_1000ECFE0 = a3->var2;
        qword_1000ECFD8 = v13;
        goto LABEL_16;
      }
      goto LABEL_22;
    }
    usleep(0x7A120u);
  }
  if (v10 == 16 || v10 == 61)
    goto LABEL_9;
  if (v10 == 82)
  {
    v19 = WALogCategoryDefaultHandle();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 136446466;
      v24 = "-[WAApple80211 currentChannelInfo:]";
      v25 = 1024;
      v26 = 534;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Failed to call APPLE80211_IOC_CHANNEL due to EPWROFF", (uint8_t *)&v23, 0x12u);
    }
    goto LABEL_24;
  }
LABEL_22:
  v21 = v10;
  v22 = WALogCategoryDefaultHandle();
  v20 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    v23 = 67109120;
    LODWORD(v24) = v21;
    _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "Failed to currentChannelInfo error %d", (uint8_t *)&v23, 8u);
  }
LABEL_24:

  v17 = 0;
LABEL_17:

  return v17;
}

- (id)currentBSSIDandSSID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSDate **p_lastDateBSSIDQueried;
  double v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  NSDate *v23;
  uint64_t v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  id v32;
  id v34;
  int v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  NSDate *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;

  v3 = (void *)objc_opt_new(NSMutableDictionary, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = v6;
  p_lastDateBSSIDQueried = &self->_lastDateBSSIDQueried;
  if (!self->_lastDateBSSIDQueried || (objc_msgSend(v6, "timeIntervalSinceDate:"), v9 > 2.0))
  {
    objc_storeStrong((id *)&self->_lastDateBSSIDQueried, v7);
    v10 = 7;
    while (1)
    {
      v11 = Apple80211Get(-[WAApple80211 apple80211Ref](self, "apple80211Ref"), 9, 0, v4, 8);
      v12 = v11;
      if (v11 <= 15)
      {
        if (v11 != -3905)
          break;
      }
      else if (v11 != 61 && v11 != 16)
      {
        goto LABEL_39;
      }
      if (!--v10)
        break;
      usleep(0x7A120u);
    }
    if (!v11)
    {
      if (!v4)
      {
        v26 = WALogCategoryDefaultHandle();
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v35 = 136446722;
          v36 = "-[WAApple80211 currentBSSIDandSSID]";
          v37 = 1024;
          v38 = 564;
          v39 = 2112;
          v40 = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find APPLE80211KEY_BSSID in currentBSSID curBSSID %@", (uint8_t *)&v35, 0x1Cu);
        }

        v28 = WALogCategoryDefaultHandle();
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          v35 = 138412290;
          v36 = 0;
          _os_log_fault_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "Failed to find APPLE80211KEY_BSSID in currentBSSID curBSSID %@", (uint8_t *)&v35, 0xCu);
        }
LABEL_37:

        v25 = 0;
        goto LABEL_38;
      }
      v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v4));
      v14 = (void *)qword_1000ECFB8;
      qword_1000ECFB8 = v13;

      v15 = 7;
      while (1)
      {
        v16 = Apple80211Get(-[WAApple80211 apple80211Ref](self, "apple80211Ref"), 1, 0, v5, 8);
        v12 = v16;
        if (v16 <= 15)
        {
          if (v16 != -3905)
            break;
        }
        else if (v16 != 61 && v16 != 16)
        {
          goto LABEL_39;
        }
        if (!--v15)
          break;
        usleep(0x7A120u);
      }
      if (!v16)
      {
        if (v5)
        {
          v17 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v5, 4);
          v18 = (void *)qword_1000ECFC0;
          qword_1000ECFC0 = (uint64_t)v17;

          goto LABEL_27;
        }
        v30 = WALogCategoryDefaultHandle();
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v35 = 136446466;
          v36 = "-[WAApple80211 currentBSSIDandSSID]";
          v37 = 1024;
          v38 = 575;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to fetch APPLE80211_IOC_SSID", (uint8_t *)&v35, 0x12u);
        }

        v32 = WALogCategoryDefaultHandle();
        v29 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v35) = 0;
          _os_log_fault_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "Failed to fetch APPLE80211_IOC_SSID", (uint8_t *)&v35, 2u);
        }
        goto LABEL_37;
      }
    }
LABEL_39:
    v34 = WALogCategoryDefaultHandle();
    v29 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v35 = 136446722;
      v36 = "-[WAApple80211 currentBSSIDandSSID]";
      v37 = 1024;
      v38 = 586;
      v39 = 1024;
      LODWORD(v40) = v12;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to fetch currentBSSID or SSID with error %d", (uint8_t *)&v35, 0x18u);
    }
    goto LABEL_37;
  }
  v19 = WALogCategoryDefaultHandle();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v22 = qword_1000ECFB8;
    v21 = qword_1000ECFC0;
    v23 = *p_lastDateBSSIDQueried;
    objc_msgSend(v7, "timeIntervalSinceDate:", *p_lastDateBSSIDQueried);
    v35 = 136447746;
    v36 = "-[WAApple80211 currentBSSIDandSSID]";
    v37 = 1024;
    v38 = 552;
    v39 = 2112;
    v40 = v22;
    v41 = 2112;
    v42 = v21;
    v43 = 2112;
    v44 = v23;
    v45 = 2112;
    v46 = v7;
    v47 = 2048;
    v48 = v24;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Using Cached instead of new query %@,%@ last %@ now %@ diff %f", (uint8_t *)&v35, 0x44u);
  }

LABEL_27:
  objc_msgSend(v3, "setObject:forKeyedSubscript:", qword_1000ECFB8, CFSTR("bssid"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", qword_1000ECFC0, CFSTR("ssid"));
  v25 = v3;
LABEL_38:

  return v25;
}

- (id)getChipSet
{
  int v3;
  int v4;
  int v5;
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  id v19;
  NSObject *v20;
  __CFString *v21;
  __CFString *v22;
  id v23;
  NSObject *v24;
  void *v26;
  NSObject *obj;
  __CFString *v28;
  unsigned int v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  __CFString *v35;
  _BYTE v36[128];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 0));
  v3 = 7;
  while (1)
  {
    v4 = Apple80211Get(-[WAApple80211 apple80211Ref](self, "apple80211Ref"), 44, 0, v26, 8);
    v5 = v4;
    if (v4 <= 15)
    {
      if (v4 != -3905)
        break;
    }
    else if (v4 != 61 && v4 != 16)
    {
      goto LABEL_10;
    }
    if (!--v3)
      break;
    usleep(0x7A120u);
  }
  if (v4)
  {
LABEL_10:
    v6 = WALogCategoryDefaultHandle();
    obj = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v31) = v5;
      _os_log_fault_impl((void *)&_mh_execute_header, obj, OS_LOG_TYPE_FAULT, "Failed to get APPLE80211_IOC_HARDWARE_VERSION error %d", buf, 8u);
    }
    v7 = &stru_1000CF640;
    goto LABEL_32;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](NSCharacterSet, "newlineCharacterSet"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "componentsSeparatedByCharactersInSet:", v8));

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v9;
  v10 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
  if (v10)
  {
    v28 = &stru_1000CF640;
    v11 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsSeparatedByCharactersInSet:", v14));

        if (objc_msgSend(v13, "rangeOfString:", CFSTR("chipnum")) != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", 1));
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "substringFromIndex:", 2));

          v29 = 0;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")));
          if (-[__CFString rangeOfCharacterFromSet:](v17, "rangeOfCharacterFromSet:", v18) == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v19 = WALogCategoryDefaultHandle();
            v20 = objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446722;
              v31 = "-[WAApple80211 getChipSet]";
              v32 = 1024;
              v33 = 614;
              v34 = 2112;
              v35 = v17;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Chipset number is %@", buf, 0x1Cu);
            }

            v21 = v17;
            v22 = v28;
          }
          else
          {
            v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v17));
            -[__CFString scanHexInt:](v22, "scanHexInt:", &v29);
            v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v29));
            v23 = WALogCategoryDefaultHandle();
            v24 = objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446722;
              v31 = "-[WAApple80211 getChipSet]";
              v32 = 1024;
              v33 = 611;
              v34 = 2112;
              v35 = v21;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Chipset number is %@", buf, 0x1Cu);
            }

          }
          v28 = v21;
        }

      }
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
    }
    while (v10);
  }
  else
  {
    v28 = &stru_1000CF640;
  }

  v7 = v28;
LABEL_32:

  return v7;
}

- (BOOL)everAssociated
{
  char *v3;
  char v4;
  int v5;
  int v6;
  int v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v15;
  NSObject *v16;
  id v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  char *v23;

  v3 = (char *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 0));
  if (!v3)
  {
    v15 = WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = 136446466;
      v19 = "-[WAApple80211 everAssociated]";
      v20 = 1024;
      v21 = 625;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to make curBSSID", (uint8_t *)&v18, 0x12u);
    }

    v7 = 0;
LABEL_26:
    v17 = WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v18 = 136446722;
      v19 = "-[WAApple80211 everAssociated]";
      v20 = 1024;
      v21 = 646;
      v22 = 1024;
      LODWORD(v23) = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to currentBSSID error %d", (uint8_t *)&v18, 0x18u);
    }
LABEL_21:

    v4 = 0;
    goto LABEL_22;
  }
  if ((byte_1000ECFB0 & 1) != 0)
  {
    v4 = 1;
    goto LABEL_22;
  }
  v5 = 7;
  while (1)
  {
    v6 = Apple80211Get(-[WAApple80211 apple80211Ref](self, "apple80211Ref"), 9, 0, v3, 8);
    v7 = v6;
    if (v6 <= 15)
    {
      if (v6 != -3905)
        break;
    }
    else if (v6 != 61 && v6 != 16)
    {
      goto LABEL_26;
    }
    if (!--v5)
      break;
    usleep(0x7A120u);
  }
  if (v6)
    goto LABEL_26;
  if (!objc_msgSend(v3, "length"))
  {
    v10 = WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v18 = 136446722;
      v19 = "-[WAApple80211 everAssociated]";
      v20 = 1024;
      v21 = 638;
      v22 = 2112;
      v23 = v3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find APPLE80211KEY_BSSID in currentBSSID curBSSID %@", (uint8_t *)&v18, 0x1Cu);
    }

    v12 = WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v18 = 138412290;
      v19 = v3;
      _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Failed to find APPLE80211KEY_BSSID in currentBSSID curBSSID %@", (uint8_t *)&v18, 0xCu);
    }
    goto LABEL_21;
  }
  byte_1000ECFB0 = 1;
  v8 = WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136446722;
    v19 = "-[WAApple80211 everAssociated]";
    v20 = 1024;
    v21 = 636;
    v22 = 2112;
    v23 = v3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:everAssociated curBSSID %@", (uint8_t *)&v18, 0x1Cu);
  }

  v4 = byte_1000ECFB0;
LABEL_22:

  return v4;
}

- (BOOL)isAssociated
{
  void *v3;
  BOOL v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  id v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 0));
  v4 = v3 != 0;
  if (v3)
  {
    v5 = 7;
    while (1)
    {
      v6 = Apple80211Get(-[WAApple80211 apple80211Ref](self, "apple80211Ref"), 9, 0, v3, 8);
      if (v6 <= 15)
      {
        if (v6 != -3905)
          break;
      }
      else if (v6 != 61 && v6 != 16)
      {
        goto LABEL_16;
      }
      if (!--v5)
        break;
      usleep(0x7A120u);
    }
    if (v6 || !objc_msgSend(v3, "length"))
    {
LABEL_16:
      v4 = 0;
      goto LABEL_17;
    }
    byte_1000ECFB0 = 1;
    v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v3));
    v8 = (void *)qword_1000ECFB8;
    qword_1000ECFB8 = v7;

    v9 = WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      goto LABEL_15;
    v17 = 136446722;
    v18 = "-[WAApple80211 isAssociated]";
    v19 = 1024;
    v20 = 664;
    v21 = 2112;
    v22 = v3;
    v11 = "%{public}s::%d:everAssociated curBSSID %@";
    v12 = v10;
    v13 = OS_LOG_TYPE_DEBUG;
    v14 = 28;
  }
  else
  {
    v16 = WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v17 = 136446466;
    v18 = "-[WAApple80211 isAssociated]";
    v19 = 1024;
    v20 = 655;
    v11 = "%{public}s::%d:Failed to make curBSSID";
    v12 = v10;
    v13 = OS_LOG_TYPE_ERROR;
    v14 = 18;
  }
  _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, (uint8_t *)&v17, v14);
LABEL_15:

LABEL_17:
  return v4;
}

- (BOOL)isAXAssociatoin
{
  char *v3;
  int v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  id v16;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint32_t v21;
  id v22;
  NSObject *v23;
  id v24;
  int v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  char *v30;

  v3 = (char *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  if (!v3)
  {
    v22 = WALogCategoryDefaultHandle();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v25 = 136446466;
      v26 = "-[WAApple80211 isAXAssociatoin]";
      v27 = 1024;
      v28 = 682;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to make dict", (uint8_t *)&v25, 0x12u);
    }

    v6 = 0;
LABEL_29:
    v24 = WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    v25 = 136446722;
    v26 = "-[WAApple80211 isAXAssociatoin]";
    v27 = 1024;
    v28 = 705;
    v29 = 1024;
    LODWORD(v30) = v6;
    v18 = "%{public}s::%d:Failed to isAXAssociatoin error %d";
    v19 = v11;
    v20 = OS_LOG_TYPE_ERROR;
    v21 = 24;
    goto LABEL_25;
  }
  v4 = 7;
  while (1)
  {
    v5 = Apple80211Get(-[WAApple80211 apple80211Ref](self, "apple80211Ref"), 14, 0, v3, 8);
    v6 = v5;
    if (v5 <= 15)
    {
      if (v5 != -3905)
        break;
    }
    else if (v5 != 61 && v5 != 16)
    {
      goto LABEL_29;
    }
    if (!--v4)
      break;
    usleep(0x7A120u);
  }
  if (v5)
    goto LABEL_29;
  if (!objc_msgSend(v3, "count")
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("PHYMODE_ACTIVE"))),
        v7,
        !v7))
  {
    v14 = WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v25 = 136446722;
      v26 = "-[WAApple80211 isAXAssociatoin]";
      v27 = 1024;
      v28 = 697;
      v29 = 2112;
      v30 = v3;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find APPLE80211KEY_PHYMODE_ACTIVE in APPLE80211_IOC_PHY_MODE dict %@", (uint8_t *)&v25, 0x1Cu);
    }

    v16 = WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v25 = 138412290;
      v26 = v3;
      _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Failed to find APPLE80211KEY_PHYMODE_ACTIVE in APPLE80211_IOC_PHY_MODE dict %@", (uint8_t *)&v25, 0xCu);
    }
    goto LABEL_21;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("PHYMODE_ACTIVE")));
  v9 = objc_msgSend(v8, "unsignedIntValue");

  v10 = WALogCategoryDefaultHandle();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v9 != 256)
  {
    if (!v12)
    {
LABEL_21:
      v13 = 0;
      goto LABEL_22;
    }
    v25 = 136446466;
    v26 = "-[WAApple80211 isAXAssociatoin]";
    v27 = 1024;
    v28 = 692;
    v18 = "%{public}s::%d:PHYMODE is not APPLE80211_MODE_11AX";
    v19 = v11;
    v20 = OS_LOG_TYPE_DEBUG;
    v21 = 18;
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, (uint8_t *)&v25, v21);
    goto LABEL_21;
  }
  if (v12)
  {
    v25 = 136446466;
    v26 = "-[WAApple80211 isAXAssociatoin]";
    v27 = 1024;
    v28 = 689;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}s::%d:PHYMODE is APPLE80211_MODE_11AX", (uint8_t *)&v25, 0x12u);
  }
  v13 = 1;
LABEL_22:

  return v13;
}

- (unint64_t)getPhyMode
{
  char *v3;
  int v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v15;
  NSObject *v16;
  id v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  char *v23;

  v3 = (char *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  if (!v3)
  {
    v15 = WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = 136446466;
      v19 = "-[WAApple80211 getPhyMode]";
      v20 = 1024;
      v21 = 715;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to make dict", (uint8_t *)&v18, 0x12u);
    }

    v6 = 0;
LABEL_23:
    v17 = WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v18 = 136446722;
      v19 = "-[WAApple80211 getPhyMode]";
      v20 = 1024;
      v21 = 732;
      v22 = 1024;
      LODWORD(v23) = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to isAXAssociatoin error %d", (uint8_t *)&v18, 0x18u);
    }
LABEL_18:

    v9 = 0;
    goto LABEL_19;
  }
  v4 = 7;
  while (1)
  {
    v5 = Apple80211Get(-[WAApple80211 apple80211Ref](self, "apple80211Ref"), 14, 0, v3, 8);
    v6 = v5;
    if (v5 <= 15)
    {
      if (v5 != -3905)
        break;
    }
    else if (v5 != 61 && v5 != 16)
    {
      goto LABEL_23;
    }
    if (!--v4)
      break;
    usleep(0x7A120u);
  }
  if (v5)
    goto LABEL_23;
  if (!objc_msgSend(v3, "count")
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("PHYMODE_ACTIVE"))),
        v7,
        !v7))
  {
    v10 = WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v18 = 136446722;
      v19 = "-[WAApple80211 getPhyMode]";
      v20 = 1024;
      v21 = 724;
      v22 = 2112;
      v23 = v3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find APPLE80211KEY_PHYMODE_ACTIVE in APPLE80211_IOC_PHY_MODE dict %@", (uint8_t *)&v18, 0x1Cu);
    }

    v12 = WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v18 = 138412290;
      v19 = v3;
      _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Failed to find APPLE80211KEY_PHYMODE_ACTIVE in APPLE80211_IOC_PHY_MODE dict %@", (uint8_t *)&v18, 0xCu);
    }
    goto LABEL_18;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("PHYMODE_ACTIVE")));
  v9 = objc_msgSend(v8, "unsignedIntValue");

LABEL_19:
  return v9;
}

- (id)getIOReportLegendItemsMatching:(id *)a3 retErr:(char *)a4
{
  uint64_t v7;
  id var1;
  id var2;
  id var3;
  id var4;
  id var5;
  id var6;
  id var7;
  int i;
  _Apple80211 *v16;
  int v17;
  int v18;
  size_t v19;
  void *v20;
  BOOL v21;
  id v22;
  id v23;
  NSObject *v24;
  id var0;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  NSObject *v34;
  const char *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  NSObject *v44;
  int v46;
  id v47;
  int v48;
  const char *v49;
  NSObject *v50;
  uint32_t v51;
  id v52;
  NSObject *v53;
  id v55;
  CFStringRef errorString;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  _BYTE v60[74];
  __int16 v61;
  id v62;

  errorString = 0;
  if (qword_1000ECFC8 != -1)
    dispatch_once(&qword_1000ECFC8, &stru_1000CCF08);
  v7 = qword_1000ECFD0;
  bzero((void *)qword_1000ECFD0, 0x3988uLL);
  if (a3->var0)
    snprintf((char *)(v7 + 8), 0x30uLL, "%s", (const char *)objc_msgSend(a3->var0, "UTF8String"));
  var1 = a3->var1;
  if (var1)
    snprintf((char *)(qword_1000ECFD0 + 56), 0x30uLL, "%s", (const char *)objc_msgSend(var1, "UTF8String"));
  var2 = a3->var2;
  if (var2)
    snprintf((char *)(qword_1000ECFD0 + 104), 0x30uLL, "%s", (const char *)objc_msgSend(var2, "UTF8String"));
  var3 = a3->var3;
  if (var3)
    snprintf((char *)(qword_1000ECFD0 + 152), 0x30uLL, "%s", (const char *)objc_msgSend(var3, "UTF8String"));
  var4 = a3->var4;
  if (var4)
    snprintf((char *)(qword_1000ECFD0 + 200), 0x30uLL, "%s", (const char *)objc_msgSend(var4, "UTF8String"));
  var5 = a3->var5;
  if (var5)
    snprintf((char *)(qword_1000ECFD0 + 248), 0x30uLL, "%s", (const char *)objc_msgSend(var5, "UTF8String"));
  var6 = a3->var6;
  if (var6)
    snprintf((char *)(qword_1000ECFD0 + 296), 0x30uLL, "%s", (const char *)objc_msgSend(var6, "UTF8String"));
  var7 = a3->var7;
  if (var7)
    snprintf((char *)(qword_1000ECFD0 + 344), 0x30uLL, "%s", (const char *)objc_msgSend(var7, "UTF8String"));
  for (i = 6; ; --i)
  {
    v16 = -[WAApple80211 apple80211Ref](self, "apple80211Ref");
    v17 = Apple80211Get(v16, 421, 0, qword_1000ECFD0, 14728);
    v18 = v17;
    if (v17 < 0)
      break;
    if (v17 != 16 && v17 != 61)
    {
LABEL_28:
      if (v17)
        goto LABEL_49;
      v19 = *(unsigned int *)(qword_1000ECFD0 + 4);
      if ((_DWORD)v19)
      {
        v20 = (void *)IOCFUnserializeWithSize((const char *)(qword_1000ECFD0 + 392), v19, kCFAllocatorDefault, 0, &errorString);
        if (v20)
          v21 = 1;
        else
          v21 = errorString == 0;
        if (v21)
        {
          if (v20)
          {
            v22 = v20;
            *a4 = 0;

            return v22;
          }
        }
        else
        {
          v43 = WALogCategoryDefaultHandle();
          v44 = objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            v46 = *(_DWORD *)(qword_1000ECFD0 + 4);
            *(_DWORD *)buf = 136446978;
            v58 = "-[WAApple80211 getIOReportLegendItemsMatching:retErr:]";
            v59 = 1024;
            *(_DWORD *)v60 = 811;
            *(_WORD *)&v60[4] = 1024;
            *(_DWORD *)&v60[6] = v46;
            *(_WORD *)&v60[10] = 2112;
            *(_QWORD *)&v60[12] = errorString;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%{public}s::%d:IOCFUnserializeWithSize error len %u, errorString: %@, exiting\n", buf, 0x22u);
          }

        }
        v47 = WALogCategoryDefaultHandle();
        v34 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v48 = *(_DWORD *)(qword_1000ECFD0 + 4);
          *(_DWORD *)buf = 136446978;
          v58 = "-[WAApple80211 getIOReportLegendItemsMatching:retErr:]";
          v59 = 1024;
          *(_DWORD *)v60 = 814;
          *(_WORD *)&v60[4] = 1024;
          *(_DWORD *)&v60[6] = v48;
          *(_WORD *)&v60[10] = 2112;
          *(_QWORD *)&v60[12] = errorString;
          v49 = "%{public}s::%d:IOCFUnserializeWithSize error len %u, errorString: %@, exiting\n";
          v50 = v34;
          v51 = 34;
          goto LABEL_46;
        }
      }
      else
      {
        v55 = WALogCategoryDefaultHandle();
        v34 = objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v58 = "-[WAApple80211 getIOReportLegendItemsMatching:retErr:]";
          v59 = 1024;
          *(_DWORD *)v60 = 805;
          v49 = "%{public}s::%d:No APPLE80211KEY_IOR_RESPONSE";
          v50 = v34;
          v51 = 18;
LABEL_46:
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, v49, buf, v51);
        }
      }
      v18 = 0;
      goto LABEL_48;
    }
LABEL_26:
    if (!i)
      goto LABEL_28;
    usleep(0x7A120u);
  }
  if (v17 != -536870175)
  {
    if (v17 != -3905)
      goto LABEL_49;
    goto LABEL_26;
  }
  v23 = WALogCategoryDefaultHandle();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    var0 = a3->var0;
    v26 = a3->var1;
    v27 = a3->var2;
    v28 = a3->var3;
    v29 = a3->var4;
    v30 = a3->var5;
    v31 = a3->var6;
    v32 = a3->var7;
    *(_DWORD *)buf = 136448514;
    v58 = "-[WAApple80211 getIOReportLegendItemsMatching:retErr:]";
    v59 = 1024;
    *(_DWORD *)v60 = 790;
    *(_WORD *)&v60[4] = 2112;
    *(_QWORD *)&v60[6] = var0;
    *(_WORD *)&v60[14] = 2112;
    *(_QWORD *)&v60[16] = v26;
    *(_WORD *)&v60[24] = 2112;
    *(_QWORD *)&v60[26] = v27;
    *(_WORD *)&v60[34] = 2112;
    *(_QWORD *)&v60[36] = v28;
    *(_WORD *)&v60[44] = 2112;
    *(_QWORD *)&v60[46] = v29;
    *(_WORD *)&v60[54] = 2112;
    *(_QWORD *)&v60[56] = v30;
    *(_WORD *)&v60[64] = 2112;
    *(_QWORD *)&v60[66] = v31;
    v61 = 2112;
    v62 = v32;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}s::%d:Apple80211Get APPLE80211_IOR_LEGEND too large, query %@,%@,%@,%@ %@,%@,%@,%@", buf, 0x62u);
  }

  v18 = -536870175;
  v33 = WALogCategoryDefaultHandle();
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
  {
    v35 = (const char *)a3->var0;
    v36 = a3->var1;
    v37 = a3->var2;
    v38 = a3->var3;
    v39 = a3->var4;
    v40 = a3->var5;
    v41 = a3->var6;
    v42 = a3->var7;
    *(_DWORD *)buf = 138414082;
    v58 = v35;
    v59 = 2112;
    *(_QWORD *)v60 = v36;
    *(_WORD *)&v60[8] = 2112;
    *(_QWORD *)&v60[10] = v37;
    *(_WORD *)&v60[18] = 2112;
    *(_QWORD *)&v60[20] = v38;
    *(_WORD *)&v60[28] = 2112;
    *(_QWORD *)&v60[30] = v39;
    *(_WORD *)&v60[38] = 2112;
    *(_QWORD *)&v60[40] = v40;
    *(_WORD *)&v60[48] = 2112;
    *(_QWORD *)&v60[50] = v41;
    *(_WORD *)&v60[58] = 2112;
    *(_QWORD *)&v60[60] = v42;
    _os_log_fault_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_FAULT, "Apple80211Get APPLE80211_IOR_LEGEND too large, query %@,%@,%@,%@ %@,%@,%@,%@", buf, 0x52u);
  }
LABEL_48:

LABEL_49:
  v52 = WALogCategoryDefaultHandle();
  v53 = objc_claimAutoreleasedReturnValue(v52);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v58 = "-[WAApple80211 getIOReportLegendItemsMatching:retErr:]";
    v59 = 1024;
    *(_DWORD *)v60 = 823;
    *(_WORD *)&v60[4] = 1024;
    *(_DWORD *)&v60[6] = v18;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to getIOReportLegendItemsMatching error %d", buf, 0x18u);
  }

  v22 = 0;
  *a4 = 1;
  return v22;
}

- (unsigned)getIOReportingService
{
  int i;
  int IOReportingService;
  int v4;
  id v6;
  NSObject *v7;
  unsigned int v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;

  v8 = 0;
  for (i = 6; ; --i)
  {
    IOReportingService = Apple80211GetIOReportingService(&v8, a2);
    v4 = IOReportingService;
    if (IOReportingService <= 15)
    {
      if (IOReportingService != -3905)
        break;
    }
    else if (IOReportingService != 61 && IOReportingService != 16)
    {
      goto LABEL_11;
    }
    if (!i)
      break;
    usleep(0x7A120u);
  }
  if (!IOReportingService)
    return v8;
LABEL_11:
  v6 = WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v10 = "-[WAApple80211 getIOReportingService]";
    v11 = 1024;
    v12 = 841;
    v13 = 1024;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed Apple80211GetIOReportingService error %d", buf, 0x18u);
  }

  return 0;
}

- (id)getIOReportingClassPath
{
  void *v2;
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  char path[520];

  memset(path, 0, 512);
  IORegistryEntryGetPath(-[WAApple80211 getIOReportingService](self, "getIOReportingService"), "IOService", path);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", path));
  if (!v2)
  {
    v4 = WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446466;
      v7 = "-[WAApple80211 getIOReportingClassPath]";
      v8 = 1024;
      v9 = 854;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to alloc IORegistryEntryGetPath NSString", (uint8_t *)&v6, 0x12u);
    }

  }
  return v2;
}

- (id)getIOReportingDriverName
{
  void *v2;
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;

  v2 = (void *)IOReportCopyDriverName(-[WAApple80211 getIOReportingService](self, "getIOReportingService"));
  if (!v2)
  {
    v4 = WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446466;
      v7 = "-[WAApple80211 getIOReportingDriverName]";
      v8 = 1024;
      v9 = 868;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to driver name through IOReportCopyDriverName", (uint8_t *)&v6, 0x12u);
    }

  }
  return v2;
}

- (unint64_t)getIOReportingDriverID
{
  id v3;
  NSObject *v4;
  uint64_t entryID;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;

  entryID = 0;
  if (!IORegistryEntryGetRegistryEntryID(-[WAApple80211 getIOReportingService](self, "getIOReportingService"), &entryID))return entryID;
  v3 = WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v7 = "-[WAApple80211 getIOReportingDriverID]";
    v8 = 1024;
    v9 = 878;
    v10 = 2048;
    v11 = entryID;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to convert IORegistryEntryGetRegistryEntryID %llx", buf, 0x1Cu);
  }

  return 0;
}

- (int64_t)getDriverType
{
  void *v3;
  void *v4;
  int64_t v5;
  id v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WAApple80211 getIOReportingDriverName](self, "getIOReportingDriverName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WAApple80211 getIOReportingClassPath](self, "getIOReportingClassPath"));
  if ((objc_msgSend(v3, "containsString:", CFSTR("ACIWiFiDriver")) & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("BCM")) & 1) != 0
         || (objc_msgSend(v3, "containsString:", CFSTR("IO80211ReporterProxy")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 136446978;
      v10 = "-[WAApple80211 getDriverType]";
      v11 = 1024;
      v12 = 901;
      v13 = 2112;
      v14 = v3;
      v15 = 2112;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to determine WLAN driver type: drvName %@ drvPath %@", (uint8_t *)&v9, 0x26u);
    }

    v5 = 0;
  }

  return v5;
}

- (WADeviceDBDelegate)dbDelegate
{
  return (WADeviceDBDelegate *)objc_loadWeakRetained((id *)&self->_dbDelegate);
}

- (void)setDbDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dbDelegate, a3);
}

- (_Apple80211)apple80211Ref
{
  return self->_apple80211Ref;
}

- (void)setApple80211Ref:(_Apple80211 *)a3
{
  self->_apple80211Ref = a3;
}

- (NSString)ifName
{
  return self->_ifName;
}

- (void)setIfName:(id)a3
{
  objc_storeStrong((id *)&self->_ifName, a3);
}

- (NSDate)lastDateChannelQueried
{
  return self->_lastDateChannelQueried;
}

- (void)setLastDateChannelQueried:(id)a3
{
  objc_storeStrong((id *)&self->_lastDateChannelQueried, a3);
}

- (NSDate)lastDateBSSIDQueried
{
  return self->_lastDateBSSIDQueried;
}

- (void)setLastDateBSSIDQueried:(id)a3
{
  objc_storeStrong((id *)&self->_lastDateBSSIDQueried, a3);
}

- (WAMessage)dummyWAMessage
{
  return (WAMessage *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDummyWAMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dummyWAMessage, 0);
  objc_storeStrong((id *)&self->_lastDateBSSIDQueried, 0);
  objc_storeStrong((id *)&self->_lastDateChannelQueried, 0);
  objc_storeStrong((id *)&self->_ifName, 0);
  objc_destroyWeak((id *)&self->_dbDelegate);
  objc_storeStrong((id *)&self->analyticsMOCQueue, 0);
}

@end
