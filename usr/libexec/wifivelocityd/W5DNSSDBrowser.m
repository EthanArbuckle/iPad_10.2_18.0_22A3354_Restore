@implementation W5DNSSDBrowser

- (id)init:(BOOL)a3
{
  _BOOL4 v3;
  char *v4;
  DNSServiceRef *v5;
  DNSServiceErrorType Connection;
  DNSServiceErrorType v7;
  NSOperationQueue *v8;
  NSObject *v10;
  DNSServiceErrorType v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  objc_super v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  DNSServiceErrorType v23;

  v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)W5DNSSDBrowser;
  v4 = -[W5DNSSDBrowser init](&v15, "init");
  if (!v4)
    return v4;
  *((_QWORD *)v4 + 2) = dispatch_queue_create("com.apple.wifivelocity.dnssd", 0);
  v5 = (DNSServiceRef *)(v4 + 8);
  Connection = DNSServiceCreateConnection((DNSServiceRef *)v4 + 1);
  if (Connection || !*v5)
  {
    v10 = sub_10008F56C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315906;
      v17 = "-[W5DNSSDBrowser init:]";
      v18 = 2080;
      v19 = "W5LogManager.m";
      v20 = 1024;
      v21 = 10163;
      v22 = 1024;
      v23 = Connection;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) DNSServiceCreateConnection failed. Error: %d", &v16, 34);
    }
  }
  else
  {
    v7 = DNSServiceSetDispatchQueue(*v5, *((dispatch_queue_t *)v4 + 2));
    if (!v7)
    {
      *((_QWORD *)v4 + 3) = +[NSMutableArray array](NSMutableArray, "array");
      *((_QWORD *)v4 + 4) = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
      v4[40] = 0;
      *((_QWORD *)v4 + 6) = 0;
      *((_QWORD *)v4 + 7) = 0;
      if (v3)
      {
        v4[40] = 1;
        v8 = objc_opt_new(NSOperationQueue);
        *((_QWORD *)v4 + 6) = v8;
        -[NSOperationQueue setMaxConcurrentOperationCount:](v8, "setMaxConcurrentOperationCount:", -1);
        *((_QWORD *)v4 + 7) = objc_opt_new(NSMutableSet);
      }
      return v4;
    }
    v11 = v7;
    v12 = sub_10008F56C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315906;
      v17 = "-[W5DNSSDBrowser init:]";
      v18 = 2080;
      v19 = "W5LogManager.m";
      v20 = 1024;
      v21 = 10166;
      v22 = 1024;
      v23 = v11;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] %s (%s:%u) DNSServiceSetDispatchQueue failed. Error: %d", &v16, 34);
    }
  }
  v13 = sub_10008F56C();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315650;
    v17 = "-[W5DNSSDBrowser init:]";
    v18 = 2080;
    v19 = "W5LogManager.m";
    v20 = 1024;
    v21 = 10191;
    LODWORD(v14) = 28;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v13, 0, "[wifivelocity] %s (%s:%u) Failed to init W5DNSSDBrowser", (const char *)&v16, v14, LODWORD(v15.receiver));
  }
  return 0;
}

- (_DNSServiceRef_t)serviceRef
{
  return self->_sdRef;
}

- (int)startBrowsing
{
  DNSServiceRef sdRef;

  sdRef = self->_sdRef;
  return DNSServiceQueryRecord(&sdRef, 0x4000u, 0xFFFFFFFF, "b._dns-sd._udp.local.", 0xCu, 1u, (DNSServiceQueryRecordReply)sub_100076508, self);
}

- (id)addDomain:(const void *)a3 rdlen:(unsigned __int16)a4
{
  int v5;
  NSString *v6;
  int v8;
  NSObject *v9;
  int v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  unsigned __int8 v19[1009];

  v5 = sub_100091520((unsigned __int8 *)a3, 0, v19, 0);
  if (v5)
  {
    v8 = v5;
    v9 = sub_10008F56C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315906;
      v12 = "-[W5DNSSDBrowser addDomain:rdlen:]";
      v13 = 2080;
      v14 = "W5LogManager.m";
      v15 = 1024;
      v16 = 10218;
      v17 = 1024;
      v18 = v8;
      v10 = 34;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) DomainNameToString failed. Error: %d", (const char *)&v11, v10);
    }
    return 0;
  }
  else
  {
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), v19);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->browseResults, "setObject:forKeyedSubscript:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"), v6);
  }
  return v6;
}

- (id)addServiceType:(const void *)a3 rdlen:(unsigned __int16)a4 fullname:(const char *)a5
{
  id result;
  id v8;
  NSString *v9;
  _QWORD v10[2];

  result = -[W5DNSSDBrowser _deconstructServiceType:rdlen:](self, "_deconstructServiceType:rdlen:", a3, a4);
  if (result)
  {
    v8 = result;
    v9 = -[NSString substringFromIndex:](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), a5), "substringFromIndex:", objc_msgSend(CFSTR("_services._dns-sd._udp."), "length"));
    result = -[NSMutableDictionary objectForKey:](self->browseResults, "objectForKey:", v9);
    if (result)
    {
      objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->browseResults, "objectForKeyedSubscript:", v9), "setObject:forKeyedSubscript:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"), v8);
      v10[0] = v8;
      v10[1] = v9;
      return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2);
    }
  }
  return result;
}

- (BOOL)addServiceInstance:(const char *)a3 serviceType:(const char *)a4 domain:(const char *)a5
{
  id v8;
  void *v9;
  char fullName[1009];

  v8 = -[NSMutableDictionary objectForKey:](self->browseResults, "objectForKey:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), a5));
  if (v8)
  {
    v8 = objc_msgSend(v8, "objectForKey:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), a4));
    if (v8)
    {
      v9 = v8;
      if (DNSServiceConstructFullName(fullName, a3, a4, a5))
      {
        LOBYTE(v8) = 0;
      }
      else
      {
        objc_msgSend(v9, "setValue:forKey:", +[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), a3)), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), fullName));
        LOBYTE(v8) = 1;
      }
    }
  }
  return (char)v8;
}

- (void)addBrowseResult:(id)a3 hostname:(const char *)a4 address:(const sockaddr *)a5 interfaceIndex:(unsigned int)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  id v21;
  void *v22;
  NSString *v23;
  id v24;
  const char *v25;
  int sa_family;
  NSArray *v27;
  const __CFString *v28;
  NSOperationQueue *pingQueue;
  NSMutableSet *pingedIPAddresses;
  const char *v31;
  const sockaddr *v32;
  W5DNSSDBrowser *v33;
  _QWORD v35[7];
  int v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[6];
  _QWORD v46[2];
  _QWORD v47[4];
  char v48[17];
  _BYTE v49[128];
  _BYTE v50[128];

  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v10 = -[NSMutableDictionary allValues](self->browseResults, "allValues");
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v42;
    v32 = a5;
    v33 = self;
    v31 = a4;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v16 = objc_msgSend(v15, "allValues");
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
        if (!v17)
          continue;
        v18 = v17;
        v19 = *(_QWORD *)v38;
        while (2)
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(_QWORD *)v38 != v19)
              objc_enumerationMutation(v16);
            v21 = objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j), "objectForKey:", a3);
            if (v21)
            {
              v22 = v21;
              if_indextoname(a6, v48);
              v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), v48);
              v36 = 0;
              SocketGetInterfaceInfo(0xFFFFFFFFLL, v48, 0, 0, 0, 0, 0, 0, 0, &v36);
              v24 = -[W5DNSSDBrowser _ipStringFromAddress:](v33, "_ipStringFromAddress:", v32);
              v47[0] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), v31);
              v47[1] = v23;
              if (v36 <= 31)
              {
                v25 = "Enet";
                switch(v36)
                {
                  case 1:
                    goto LABEL_36;
                  case 2:
                    v25 = "WiFi";
                    break;
                  case 3:
                  case 5:
                  case 6:
                  case 7:
                    goto LABEL_29;
                  case 4:
                    v25 = "AWDL";
                    break;
                  case 8:
                    v25 = "USB";
                    break;
                  default:
                    if (v36 != 16)
                      goto LABEL_29;
                    v25 = "Direct";
                    break;
                }
                goto LABEL_36;
              }
              if (v36 > 127)
              {
                if (v36 == 128)
                {
                  v25 = "NAN";
                }
                else
                {
                  if (v36 != 256)
                    goto LABEL_29;
                  v25 = "IPsecBT";
                }
              }
              else
              {
                if (v36 != 32)
                {
                  if (v36 == 64)
                  {
                    v25 = "WFD";
                    goto LABEL_36;
                  }
LABEL_29:
                  v25 = "?";
                  if (v36 == 512)
                    v25 = "IPSecWiFi";
                  goto LABEL_36;
                }
                v25 = "BTLE";
              }
LABEL_36:
              v47[2] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), v25);
              v47[3] = v24;
              objc_msgSend(v22, "addObject:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 4));
              if (v33->doPing
                && v24
                && ((v36 - 2) <= 0x3E && ((1 << (v36 - 2)) & 0x4000000040000005) != 0
                 || v36 == 128)
                && (-[NSMutableSet containsObject:](v33->pingedIPAddresses, "containsObject:", v24) & 1) == 0)
              {
                sa_family = v32->sa_family;
                if (sa_family == 30)
                {
                  v45[0] = v24;
                  v45[1] = CFSTR("-c 1");
                  v45[2] = CFSTR("-B");
                  v45[3] = v23;
                  v45[4] = CFSTR("-I");
                  v45[5] = v23;
                  v27 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 6);
                  v28 = CFSTR("/sbin/ping6");
                }
                else if (sa_family == 2)
                {
                  v46[0] = v24;
                  v46[1] = CFSTR("-c 1");
                  v27 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 2);
                  v28 = CFSTR("/sbin/ping");
                }
                else
                {
                  v28 = 0;
                  v27 = 0;
                }
                pingQueue = v33->pingQueue;
                v35[0] = _NSConcreteStackBlock;
                v35[1] = 3221225472;
                v35[2] = sub_100076EDC;
                v35[3] = &unk_1000D58F8;
                v35[4] = v28;
                v35[5] = v27;
                v35[6] = v33;
                -[NSOperationQueue addOperationWithBlock:](pingQueue, "addOperationWithBlock:", v35);
                pingedIPAddresses = v33->pingedIPAddresses;
                ++v33->addedCount;
                -[NSMutableSet addObject:](pingedIPAddresses, "addObject:", v24);
              }
              return;
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
          if (v18)
            continue;
          break;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v12);
  }
}

- (void)addBrowseContext:(id)a3
{
  -[NSMutableArray addObject:](self->browseContexts, "addObject:", a3);
}

- (id)browseAllResults
{
  return self->browseResults;
}

- (id)_deconstructServiceType:(const void *)a3 rdlen:(unsigned __int16)a4
{
  char *v4;
  char *v5;
  unsigned __int8 *v6;
  char v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  int v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  unsigned __int8 v23[1009];
  unsigned __int8 __dst[129];

  v4 = (char *)a3;
  v5 = (char *)a3 + a4;
  v6 = __dst;
  v7 = 1;
  while (1)
  {
    v8 = v7;
    if (v5 - v4 < 1)
      break;
    v9 = *v4;
    if ((v9 - 64) < 0xFFFFFFC1 || v5 - v4 <= v9)
      break;
    v10 = v9 + 1;
    memcpy(v6, v4, v9 + 1);
    v7 = 0;
    v4 += v10;
    v6 += v10;
    if ((v8 & 1) == 0)
    {
      *v6 = 0;
      v11 = sub_100091520(__dst, 0, v23, 0);
      if (!v11)
        return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), v23);
      v13 = v11;
      v14 = sub_10008F56C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136315906;
        v16 = "-[W5DNSSDBrowser _deconstructServiceType:rdlen:]";
        v17 = 2080;
        v18 = "W5LogManager.m";
        v19 = 1024;
        v20 = 10372;
        v21 = 1024;
        v22 = v13;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v14, 0, "[wifivelocity] %s (%s:%u) DomainNameToString failed. Error: %d", (const char *)&v15, 34);
      }
      return 0;
    }
  }
  return 0;
}

- (id)_ipStringFromAddress:(const sockaddr *)a3
{
  int sa_family;
  char *v4;
  int v5;
  socklen_t v6;
  char v8[16];
  _BYTE v9[30];

  sa_family = a3->sa_family;
  if (sa_family == 30)
  {
    v4 = &a3->sa_data[6];
    v5 = 30;
    v6 = 46;
  }
  else
  {
    if (sa_family != 2)
    {
      *(_OWORD *)v8 = *(_OWORD *)"Unsupported";
      memset(v9, 0, sizeof(v9));
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), v8);
    }
    v4 = &a3->sa_data[2];
    v5 = 2;
    v6 = 16;
  }
  inet_ntop(v5, v4, v8, v6);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), v8);
}

- (void)stopBrowsing
{
  _DNSServiceRef_t *sdRef;
  NSOperationQueue *pingQueue;
  NSObject *v5;
  int64_t addedCount;
  int64_t pingedCount;
  int v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int64_t v16;
  __int16 v17;
  int64_t v18;

  sdRef = self->_sdRef;
  if (sdRef)
    DNSServiceRefDeallocate(sdRef);
  self->_sdRef = 0;
  pingQueue = self->pingQueue;
  if (pingQueue)
    -[NSOperationQueue cancelAllOperations](pingQueue, "cancelAllOperations");

  self->browseContexts = 0;
  v5 = sub_10008F56C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    addedCount = self->addedCount;
    pingedCount = self->pingedCount;
    v9 = 136316162;
    v10 = "-[W5DNSSDBrowser stopBrowsing]";
    v11 = 2080;
    v12 = "W5LogManager.m";
    v13 = 1024;
    v14 = 10410;
    v15 = 2048;
    v16 = addedCount;
    v17 = 2048;
    v18 = pingedCount;
    v8 = 48;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v5, 0, "[wifivelocity] %s (%s:%u) Browsed IP Address Stats (unique). Added: %ld, Pinged: %ld", (const char *)&v9, v8);
  }
}

- (void)dealloc
{
  _DNSServiceRef_t *sdRef;
  NSObject *dsnsdQueue;
  NSMutableArray *browseContexts;
  NSOperationQueue *pingQueue;
  NSMutableSet *pingedIPAddresses;
  objc_super v8;

  sdRef = self->_sdRef;
  if (sdRef)
    DNSServiceRefDeallocate(sdRef);
  dsnsdQueue = self->dsnsdQueue;
  if (dsnsdQueue)
    dispatch_release(dsnsdQueue);
  browseContexts = self->browseContexts;
  if (browseContexts)

  pingQueue = self->pingQueue;
  if (pingQueue)

  pingedIPAddresses = self->pingedIPAddresses;
  if (pingedIPAddresses)

  v8.receiver = self;
  v8.super_class = (Class)W5DNSSDBrowser;
  -[W5DNSSDBrowser dealloc](&v8, "dealloc");
}

@end
