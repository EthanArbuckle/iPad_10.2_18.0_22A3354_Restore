@implementation WFNANTableViewContext

- (WFNANTableViewContext)init
{
  WFNANTableViewContext *v2;
  uint64_t v3;
  NSMutableArray *publishers;
  uint64_t v5;
  NSMutableDictionary *dataSessionsForPublish;
  uint64_t v7;
  NSMutableArray *subscribers;
  uint64_t v9;
  NSMutableDictionary *discoveryResults;
  uint64_t v11;
  NSMutableDictionary *dataSessionsForSubscribe;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WFNANTableViewContext;
  v2 = -[WFNANTableViewContext init](&v14, sel_init);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = objc_claimAutoreleasedReturnValue();
  publishers = v2->_publishers;
  v2->_publishers = (NSMutableArray *)v3;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = objc_claimAutoreleasedReturnValue();
  dataSessionsForPublish = v2->_dataSessionsForPublish;
  v2->_dataSessionsForPublish = (NSMutableDictionary *)v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = objc_claimAutoreleasedReturnValue();
  subscribers = v2->_subscribers;
  v2->_subscribers = (NSMutableArray *)v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = objc_claimAutoreleasedReturnValue();
  discoveryResults = v2->_discoveryResults;
  v2->_discoveryResults = (NSMutableDictionary *)v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = objc_claimAutoreleasedReturnValue();
  dataSessionsForSubscribe = v2->_dataSessionsForSubscribe;
  v2->_dataSessionsForSubscribe = (NSMutableDictionary *)v11;

  return v2;
}

- (void)addPublisher:(id)a3
{
  id v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "start");
  -[NSMutableArray addObject:](self->_publishers, "addObject:", v4);
  WFLogForCategory(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5)
  {
    v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      v8 = -[NSMutableArray count](self->_publishers, "count");
      *(_DWORD *)buf = 134217984;
      v13 = v8;
      _os_log_impl(&dword_219FC8000, v7, v6, "Added new publisher, new count is %lu", buf, 0xCu);
    }

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__WFNANTableViewContext_addPublisher___block_invoke;
  block[3] = &unk_24DC348F8;
  v11 = v4;
  v9 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __38__WFNANTableViewContext_addPublisher___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("WFNANTableViewContextChangedOperationTypeKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = CFSTR("WFNANTableViewContextChangedPublisherKey");
  v6[0] = v2;
  v6[1] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("WFNANPublishersChangedNotification"), 0, v3);

}

- (void)addSubscriber:(id)a3
{
  id v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "start");
  -[NSMutableArray addObject:](self->_subscribers, "addObject:", v4);
  WFLogForCategory(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5)
  {
    v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      v8 = -[NSMutableArray count](self->_subscribers, "count");
      *(_DWORD *)buf = 134217984;
      v13 = v8;
      _os_log_impl(&dword_219FC8000, v7, v6, "Added new subcriber, new count is %lu", buf, 0xCu);
    }

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__WFNANTableViewContext_addSubscriber___block_invoke;
  block[3] = &unk_24DC348F8;
  v11 = v4;
  v9 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __39__WFNANTableViewContext_addSubscriber___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("WFNANTableViewContextChangedOperationTypeKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = CFSTR("WFNANTableViewContextChangedSubscriberKey");
  v6[0] = v2;
  v6[1] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("WFNANSubscribersChangedNotification"), 0, v3);

}

- (void)addDiscoveryResult:(id)a3 forSubscriber:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *discoveryResults;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  os_log_type_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  discoveryResults = self->_discoveryResults;
  objc_msgSend(v7, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](discoveryResults, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "addObject:", v6);
  v11 = self->_discoveryResults;
  objc_msgSend(v7, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v10, v12);

  WFLogForCategory(0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v13)
  {
    v15 = v13;
    if (os_log_type_enabled(v15, v14))
    {
      objc_msgSend(v7, "configuration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "serviceName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v17;
      v25 = 2048;
      v26 = objc_msgSend(v10, "count");
      _os_log_impl(&dword_219FC8000, v15, v14, "Added new discovery result for subscriber %@, new count is %lu", buf, 0x16u);

    }
  }

  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __58__WFNANTableViewContext_addDiscoveryResult_forSubscriber___block_invoke;
  v20[3] = &unk_24DC34BE8;
  v21 = v7;
  v22 = v6;
  v18 = v6;
  v19 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v20);

}

void __58__WFNANTableViewContext_addDiscoveryResult_forSubscriber___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("WFNANTableViewContextChangedOperationTypeKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8[0] = v2;
  v8[1] = v3;
  v7[1] = CFSTR("WFNANTableViewContextChangedSubscriberKey");
  v7[2] = CFSTR("WFNANTableViewContextChangedDiscoveryResultKey");
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("WFNANDiscoveryResultsChangedNotification"), 0, v5);

}

- (void)addDataSession:(id)a3 forPublisher:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *dataSessionsForPublish;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  os_log_type_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dataSessionsForPublish = self->_dataSessionsForPublish;
  objc_msgSend(v7, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](dataSessionsForPublish, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "addObject:", v6);
  v11 = self->_dataSessionsForPublish;
  objc_msgSend(v7, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v10, v12);

  WFLogForCategory(0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v13)
  {
    v15 = v13;
    if (os_log_type_enabled(v15, v14))
    {
      objc_msgSend(v7, "configuration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "serviceName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v17;
      v25 = 2048;
      v26 = objc_msgSend(v10, "count");
      _os_log_impl(&dword_219FC8000, v15, v14, "Added new data session for publisher %@, new count is %lu", buf, 0x16u);

    }
  }

  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __53__WFNANTableViewContext_addDataSession_forPublisher___block_invoke;
  v20[3] = &unk_24DC34BE8;
  v21 = v7;
  v22 = v6;
  v18 = v6;
  v19 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v20);

}

void __53__WFNANTableViewContext_addDataSession_forPublisher___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("WFNANTableViewContextChangedOperationTypeKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8[0] = v2;
  v8[1] = v3;
  v7[1] = CFSTR("WFNANTableViewContextChangedPublisherKey");
  v7[2] = CFSTR("WFNANTableViewContextChangedDataSessionKey");
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("WFNANDataSessionsForPublishChangedNotification"), 0, v5);

}

- (void)addDataSession:(id)a3 forSubscriber:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *dataSessionsForSubscribe;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  os_log_type_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dataSessionsForSubscribe = self->_dataSessionsForSubscribe;
  objc_msgSend(v7, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](dataSessionsForSubscribe, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "addObject:", v6);
  v11 = self->_dataSessionsForSubscribe;
  objc_msgSend(v7, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v10, v12);

  WFLogForCategory(0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v13)
  {
    v15 = v13;
    if (os_log_type_enabled(v15, v14))
    {
      objc_msgSend(v7, "configuration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "serviceName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v17;
      v25 = 2048;
      v26 = objc_msgSend(v10, "count");
      _os_log_impl(&dword_219FC8000, v15, v14, "Added new data session for subscriber %@, new count is %lu", buf, 0x16u);

    }
  }

  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __54__WFNANTableViewContext_addDataSession_forSubscriber___block_invoke;
  v20[3] = &unk_24DC34BE8;
  v21 = v7;
  v22 = v6;
  v18 = v6;
  v19 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v20);

}

void __54__WFNANTableViewContext_addDataSession_forSubscriber___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("WFNANTableViewContextChangedOperationTypeKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8[0] = v2;
  v8[1] = v3;
  v7[1] = CFSTR("WFNANTableViewContextChangedSubscriberKey");
  v7[2] = CFSTR("WFNANTableViewContextChangedDataSessionKey");
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("WFNANDataSessionsForSubscribeChangedNotification"), 0, v5);

}

- (void)removePublisherAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  os_log_type_t v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[4];
  int64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[WFNANTableViewContext getPublisherAtIndex:](self, "getPublisherAtIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stop");
  -[NSMutableArray removeObjectAtIndex:](self->_publishers, "removeObjectAtIndex:", a3);
  WFLogForCategory(0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6)
  {
    v8 = v6;
    if (os_log_type_enabled(v8, v7))
    {
      v9 = -[NSMutableArray count](self->_publishers, "count");
      *(_DWORD *)buf = 134218240;
      v14 = a3;
      v15 = 2048;
      v16 = v9;
      _os_log_impl(&dword_219FC8000, v8, v7, "Removed publisher at index %ld, new count is %lu", buf, 0x16u);
    }

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__WFNANTableViewContext_removePublisherAtIndex___block_invoke;
  block[3] = &unk_24DC348F8;
  v12 = v5;
  v10 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __48__WFNANTableViewContext_removePublisherAtIndex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("WFNANTableViewContextChangedOperationTypeKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = CFSTR("WFNANTableViewContextChangedPublisherKey");
  v6[0] = v2;
  v6[1] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("WFNANPublishersChangedNotification"), 0, v3);

}

- (void)removePublisher:(id)a3
{
  id v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  os_log_type_t v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[NSMutableArray count](self->_publishers, "count"))
  {
    v5 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->_publishers, "objectAtIndex:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject isEqual:](v6, "isEqual:", v4))
        break;

      if ((unint64_t)++v5 >= -[NSMutableArray count](self->_publishers, "count"))
        goto LABEL_5;
    }
    objc_msgSend(v4, "stop");
    -[NSMutableArray removeObjectAtIndex:](self->_publishers, "removeObjectAtIndex:", v5);
    WFLogForCategory(0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8)
    {
      v10 = v8;
      if (os_log_type_enabled(v10, v9))
      {
        v11 = -[NSMutableArray count](self->_publishers, "count");
        *(_DWORD *)buf = 134218240;
        v15 = v5;
        v16 = 2048;
        v17 = v11;
        _os_log_impl(&dword_219FC8000, v10, v9, "Removed publisher at index %ld, new count is %lu", buf, 0x16u);
      }

    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__WFNANTableViewContext_removePublisher___block_invoke;
    block[3] = &unk_24DC348F8;
    v13 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
LABEL_5:
    WFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
    {
      *(_DWORD *)buf = 138412290;
      v15 = (char *)v4;
      _os_log_impl(&dword_219FC8000, v6, v7, "Publisher %@ does not exist", buf, 0xCu);
    }
  }

}

void __41__WFNANTableViewContext_removePublisher___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("WFNANTableViewContextChangedOperationTypeKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = CFSTR("WFNANTableViewContextChangedPublisherKey");
  v6[0] = v2;
  v6[1] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("WFNANPublishersChangedNotification"), 0, v3);

}

- (void)removeSubscriberAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  os_log_type_t v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[4];
  int64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[WFNANTableViewContext getSubscriberAtIndex:](self, "getSubscriberAtIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stop");
  -[NSMutableArray removeObjectAtIndex:](self->_subscribers, "removeObjectAtIndex:", a3);
  WFLogForCategory(0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6)
  {
    v8 = v6;
    if (os_log_type_enabled(v8, v7))
    {
      v9 = -[NSMutableArray count](self->_subscribers, "count");
      *(_DWORD *)buf = 134218240;
      v14 = a3;
      v15 = 2048;
      v16 = v9;
      _os_log_impl(&dword_219FC8000, v8, v7, "Removed subscriber at index %ld, new count is %lu", buf, 0x16u);
    }

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__WFNANTableViewContext_removeSubscriberAtIndex___block_invoke;
  block[3] = &unk_24DC348F8;
  v12 = v5;
  v10 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __49__WFNANTableViewContext_removeSubscriberAtIndex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("WFNANTableViewContextChangedOperationTypeKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = CFSTR("WFNANTableViewContextChangedSubscriberKey");
  v6[0] = v2;
  v6[1] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("WFNANSubscribersChangedNotification"), 0, v3);

}

- (void)removeSubscriber:(id)a3
{
  id v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  os_log_type_t v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[NSMutableArray count](self->_subscribers, "count"))
  {
    v5 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->_subscribers, "objectAtIndex:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject isEqual:](v6, "isEqual:", v4))
        break;

      if ((unint64_t)++v5 >= -[NSMutableArray count](self->_subscribers, "count"))
        goto LABEL_5;
    }
    objc_msgSend(v4, "stop");
    -[NSMutableArray removeObjectAtIndex:](self->_subscribers, "removeObjectAtIndex:", v5);
    WFLogForCategory(0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8)
    {
      v10 = v8;
      if (os_log_type_enabled(v10, v9))
      {
        v11 = -[NSMutableArray count](self->_subscribers, "count");
        *(_DWORD *)buf = 134218240;
        v15 = v5;
        v16 = 2048;
        v17 = v11;
        _os_log_impl(&dword_219FC8000, v10, v9, "Removed subscriber at index %ld, new count is %lu", buf, 0x16u);
      }

    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__WFNANTableViewContext_removeSubscriber___block_invoke;
    block[3] = &unk_24DC348F8;
    v13 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
LABEL_5:
    WFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
    {
      *(_DWORD *)buf = 138412290;
      v15 = (char *)v4;
      _os_log_impl(&dword_219FC8000, v6, v7, "Subscriber %@ does not exist", buf, 0xCu);
    }
  }

}

void __42__WFNANTableViewContext_removeSubscriber___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("WFNANTableViewContextChangedOperationTypeKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = CFSTR("WFNANTableViewContextChangedSubscriberKey");
  v6[0] = v2;
  v6[1] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("WFNANSubscribersChangedNotification"), 0, v3);

}

- (void)removeDiscoveryResultWithPublishID:(unsigned __int8)a3 andPublisherAddress:(id)a4 forSubscriber:(id)a5
{
  int v6;
  id v8;
  id v9;
  NSMutableDictionary *discoveryResults;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  os_log_type_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  void *v25;
  os_log_type_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  NSObject *v31;
  id v32;
  uint8_t buf[4];
  _BYTE v34[24];
  uint64_t v35;

  v6 = a3;
  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  discoveryResults = self->_discoveryResults;
  objc_msgSend(v9, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](discoveryResults, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
  {
    v13 = 0;
    while (1)
    {
      objc_msgSend(v12, "objectAtIndex:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "publishID") == v6)
      {
        objc_msgSend(v14, "publisherAddress");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqual:", v8);

        if (v16)
          break;
      }

      if (++v13 >= (unint64_t)objc_msgSend(v12, "count"))
        goto LABEL_6;
    }
    objc_msgSend(v12, "removeObjectAtIndex:", v13);
    v23 = self->_discoveryResults;
    objc_msgSend(v9, "configuration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v12, v24);

    WFLogForCategory(0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v25)
    {
      v27 = v25;
      if (os_log_type_enabled(v27, v26))
      {
        objc_msgSend(v9, "configuration");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "serviceName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v34 = v29;
        *(_WORD *)&v34[8] = 2048;
        *(_QWORD *)&v34[10] = objc_msgSend(v12, "count");
        _os_log_impl(&dword_219FC8000, v27, v26, "Removed discovery result for subcriber %@, new count is %lu", buf, 0x16u);

      }
    }

    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __94__WFNANTableViewContext_removeDiscoveryResultWithPublishID_andPublisherAddress_forSubscriber___block_invoke;
    v30[3] = &unk_24DC34BE8;
    v31 = v9;
    v32 = v14;
    v17 = v14;
    dispatch_async(MEMORY[0x24BDAC9B8], v30);

    v19 = v31;
    goto LABEL_17;
  }
LABEL_6:
  WFLogForCategory(0);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v17)
  {
    v19 = v17;
    if (os_log_type_enabled(v19, v18))
    {
      objc_msgSend(v8, "description");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "configuration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "serviceName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v34 = v6;
      *(_WORD *)&v34[4] = 2112;
      *(_QWORD *)&v34[6] = v20;
      *(_WORD *)&v34[14] = 2112;
      *(_QWORD *)&v34[16] = v22;
      _os_log_impl(&dword_219FC8000, v19, v18, "Discovery result with publish ID %hhu and address %@ does not exist for subscriber %@", buf, 0x1Cu);

    }
    v17 = v19;
LABEL_17:

  }
}

void __94__WFNANTableViewContext_removeDiscoveryResultWithPublishID_andPublisherAddress_forSubscriber___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("WFNANTableViewContextChangedOperationTypeKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8[0] = v2;
  v8[1] = v3;
  v7[1] = CFSTR("WFNANTableViewContextChangedSubscriberKey");
  v7[2] = CFSTR("WFNANTableViewContextChangedDiscoveryResultKey");
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("WFNANDiscoveryResultsChangedNotification"), 0, v5);

}

- (void)removeDataSession:(id)a3 forPublisher:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *dataSessionsForPublish;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  os_log_type_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  os_log_type_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  NSObject *v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dataSessionsForPublish = self->_dataSessionsForPublish;
  objc_msgSend(v7, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](dataSessionsForPublish, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    v11 = 0;
    while (1)
    {
      objc_msgSend(v10, "objectAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqual:", v6))
        break;

      if (++v11 >= (unint64_t)objc_msgSend(v10, "count"))
        goto LABEL_5;
    }
    objc_msgSend(v10, "removeObjectAtIndex:", v11);
    v17 = self->_dataSessionsForPublish;
    objc_msgSend(v7, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v10, v18);

    WFLogForCategory(0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v19)
    {
      v21 = v19;
      if (os_log_type_enabled(v21, v20))
      {
        objc_msgSend(v7, "configuration");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "serviceName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v28 = v23;
        v29 = 2048;
        v30 = objc_msgSend(v10, "count");
        _os_log_impl(&dword_219FC8000, v21, v20, "Removed data session for publisher %@, new count is %lu", buf, 0x16u);

      }
    }

    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __56__WFNANTableViewContext_removeDataSession_forPublisher___block_invoke;
    v24[3] = &unk_24DC34BE8;
    v25 = v7;
    v26 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], v24);

    v14 = v25;
    goto LABEL_16;
  }
LABEL_5:
  WFLogForCategory(0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v12)
  {
    v14 = v12;
    if (os_log_type_enabled(v14, v13))
    {
      objc_msgSend(v7, "configuration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "serviceName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v6;
      v29 = 2112;
      v30 = (uint64_t)v16;
      _os_log_impl(&dword_219FC8000, v14, v13, "Data session %@ does not exist for publisher %@", buf, 0x16u);

    }
    v12 = v14;
LABEL_16:

  }
}

void __56__WFNANTableViewContext_removeDataSession_forPublisher___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("WFNANTableViewContextChangedOperationTypeKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8[0] = v2;
  v8[1] = v3;
  v7[1] = CFSTR("WFNANTableViewContextChangedPublisherKey");
  v7[2] = CFSTR("WFNANTableViewContextChangedDataSessionKey");
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("WFNANDataSessionsForPublishChangedNotification"), 0, v5);

}

- (void)removeDataSession:(id)a3 forSubscriber:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *dataSessionsForSubscribe;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  os_log_type_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  os_log_type_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  NSObject *v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dataSessionsForSubscribe = self->_dataSessionsForSubscribe;
  objc_msgSend(v7, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](dataSessionsForSubscribe, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    v11 = 0;
    while (1)
    {
      objc_msgSend(v10, "objectAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqual:", v6))
        break;

      if (++v11 >= (unint64_t)objc_msgSend(v10, "count"))
        goto LABEL_5;
    }
    objc_msgSend(v10, "removeObjectAtIndex:", v11);
    v17 = self->_dataSessionsForSubscribe;
    objc_msgSend(v7, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v10, v18);

    WFLogForCategory(0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v19)
    {
      v21 = v19;
      if (os_log_type_enabled(v21, v20))
      {
        objc_msgSend(v7, "configuration");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "serviceName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v28 = v23;
        v29 = 2048;
        v30 = objc_msgSend(v10, "count");
        _os_log_impl(&dword_219FC8000, v21, v20, "Removed data session for subscriber %@, new count is %lu", buf, 0x16u);

      }
    }

    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __57__WFNANTableViewContext_removeDataSession_forSubscriber___block_invoke;
    v24[3] = &unk_24DC34BE8;
    v25 = v7;
    v26 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], v24);

    v14 = v25;
    goto LABEL_16;
  }
LABEL_5:
  WFLogForCategory(0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v12)
  {
    v14 = v12;
    if (os_log_type_enabled(v14, v13))
    {
      objc_msgSend(v7, "configuration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "serviceName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v6;
      v29 = 2112;
      v30 = (uint64_t)v16;
      _os_log_impl(&dword_219FC8000, v14, v13, "Data session %@ does not exist for subscriber %@", buf, 0x16u);

    }
    v12 = v14;
LABEL_16:

  }
}

void __57__WFNANTableViewContext_removeDataSession_forSubscriber___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("WFNANTableViewContextChangedOperationTypeKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8[0] = v2;
  v8[1] = v3;
  v7[1] = CFSTR("WFNANTableViewContextChangedSubscriberKey");
  v7[2] = CFSTR("WFNANTableViewContextChangedDataSessionKey");
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("WFNANDataSessionsForSubscribeChangedNotification"), 0, v5);

}

- (id)getPublisherAtIndex:(int64_t)a3
{
  void *v5;

  if (-[NSMutableArray count](self->_publishers, "count") <= (unint64_t)a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_publishers, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)getSubscriberAtIndex:(int64_t)a3
{
  void *v5;

  if (-[NSMutableArray count](self->_subscribers, "count") <= (unint64_t)a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_subscribers, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)getDiscoveryResultAtIndex:(int64_t)a3 forSubscriber:(id)a4
{
  NSMutableDictionary *discoveryResults;
  void *v6;
  void *v7;
  void *v8;

  discoveryResults = self->_discoveryResults;
  objc_msgSend(a4, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](discoveryResults, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") <= (unint64_t)a3)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)getDataSessionAtIndex:(int64_t)a3 forPublisher:(id)a4
{
  NSMutableDictionary *dataSessionsForPublish;
  void *v6;
  void *v7;
  void *v8;

  dataSessionsForPublish = self->_dataSessionsForPublish;
  objc_msgSend(a4, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](dataSessionsForPublish, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") <= (unint64_t)a3)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)getDataSessionAtIndex:(int64_t)a3 forSubscriber:(id)a4
{
  NSMutableDictionary *dataSessionsForSubscribe;
  void *v6;
  void *v7;
  void *v8;

  dataSessionsForSubscribe = self->_dataSessionsForSubscribe;
  objc_msgSend(a4, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](dataSessionsForSubscribe, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") <= (unint64_t)a3)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)getPublishers
{
  return self->_publishers;
}

- (id)getSubscribers
{
  return self->_subscribers;
}

- (id)getDiscoveryResultsForSubscriber:(id)a3
{
  NSMutableDictionary *discoveryResults;
  void *v4;
  void *v5;

  discoveryResults = self->_discoveryResults;
  objc_msgSend(a3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](discoveryResults, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getDataSessionsForPublisher:(id)a3
{
  NSMutableDictionary *dataSessionsForPublish;
  void *v4;
  void *v5;

  dataSessionsForPublish = self->_dataSessionsForPublish;
  objc_msgSend(a3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](dataSessionsForPublish, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getDataSessionsForSubscriber:(id)a3
{
  NSMutableDictionary *dataSessionsForSubscribe;
  void *v4;
  void *v5;

  dataSessionsForSubscribe = self->_dataSessionsForSubscribe;
  objc_msgSend(a3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](dataSessionsForSubscribe, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)getPublishersCount
{
  return -[NSMutableArray count](self->_publishers, "count");
}

- (int64_t)getSubscribersCount
{
  return -[NSMutableArray count](self->_subscribers, "count");
}

- (int64_t)getDiscoveryResultsCountForSubscriber:(id)a3
{
  NSMutableDictionary *discoveryResults;
  void *v4;
  void *v5;
  int64_t v6;

  discoveryResults = self->_discoveryResults;
  objc_msgSend(a3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](discoveryResults, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count");
  return v6;
}

- (int64_t)getDataSessionsCountForPublisher:(id)a3
{
  NSMutableDictionary *dataSessionsForPublish;
  void *v4;
  void *v5;
  int64_t v6;

  dataSessionsForPublish = self->_dataSessionsForPublish;
  objc_msgSend(a3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](dataSessionsForPublish, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count");
  return v6;
}

- (int64_t)getDataSessionsCountForSubscriber:(id)a3
{
  NSMutableDictionary *dataSessionsForSubscribe;
  void *v4;
  void *v5;
  int64_t v6;

  dataSessionsForSubscribe = self->_dataSessionsForSubscribe;
  objc_msgSend(a3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](dataSessionsForSubscribe, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count");
  return v6;
}

- (void)publisherStarted:(id)a3
{
  id v3;
  void *v4;
  os_log_type_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  WFLogForCategory(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4)
  {
    v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      objc_msgSend(v3, "configuration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "serviceName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_219FC8000, v6, v5, "NAN publish %@ started", (uint8_t *)&v9, 0xCu);

    }
  }

}

- (void)publisher:(id)a3 failedToStartWithError:(int64_t)a4
{
  id v6;
  void *v7;
  os_log_type_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  WFLogForCategory(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7)
  {
    v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      objc_msgSend(v6, "configuration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "serviceName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v11;
      v14 = 2048;
      v15 = a4;
      _os_log_impl(&dword_219FC8000, v9, v8, "NAN publish %@ failed to start with error %ld", (uint8_t *)&v12, 0x16u);

    }
  }

  -[WFNANTableViewContext removePublisher:](self, "removePublisher:", v6);
}

- (void)publisher:(id)a3 terminatedWithReason:(int64_t)a4
{
  id v6;
  void *v7;
  os_log_type_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  WFLogForCategory(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7)
  {
    v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      objc_msgSend(v6, "configuration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "serviceName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v11;
      v14 = 2048;
      v15 = a4;
      _os_log_impl(&dword_219FC8000, v9, v8, "NAN publish %@ terminated with reason %ld", (uint8_t *)&v12, 0x16u);

    }
  }

  -[WFNANTableViewContext removePublisher:](self, "removePublisher:", v6);
}

- (void)publisher:(id)a3 dataConfirmedForHandle:(id)a4 localInterfaceIndex:(unsigned int)a5 serviceSpecificInfo:(id)a6
{
  id v8;
  id v9;
  void *v10;
  os_log_type_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a3;
  WFLogForCategory(0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v10)
  {
    v12 = v10;
    if (os_log_type_enabled(v12, v11))
    {
      objc_msgSend(v8, "initiatorDataAddress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_219FC8000, v12, v11, "Data confirmed for session with peer %@", (uint8_t *)&v14, 0xCu);

    }
  }

  -[WFNANTableViewContext addDataSession:forPublisher:](self, "addDataSession:forPublisher:", v8, v9);
}

- (void)publisher:(id)a3 dataTerminatedForHandle:(id)a4 reason:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  os_log_type_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a3;
  WFLogForCategory(0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v9)
  {
    v11 = v9;
    if (os_log_type_enabled(v11, v10))
    {
      objc_msgSend(v7, "initiatorDataAddress");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v12;
      _os_log_impl(&dword_219FC8000, v11, v10, "Data terminated for session with peer %@", (uint8_t *)&v13, 0xCu);

    }
  }

  -[WFNANTableViewContext removeDataSession:forPublisher:](self, "removeDataSession:forPublisher:", v7, v8);
}

- (void)subscriberStarted:(id)a3
{
  id v3;
  void *v4;
  os_log_type_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  WFLogForCategory(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4)
  {
    v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      objc_msgSend(v3, "configuration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "serviceName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_219FC8000, v6, v5, "NAN subscribe %@ started", (uint8_t *)&v9, 0xCu);

    }
  }

}

- (void)subscriber:(id)a3 failedToStartWithError:(int64_t)a4
{
  id v6;
  void *v7;
  os_log_type_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  WFLogForCategory(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7)
  {
    v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      objc_msgSend(v6, "configuration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "serviceName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v11;
      v14 = 2048;
      v15 = a4;
      _os_log_impl(&dword_219FC8000, v9, v8, "NAN subscribe %@ failed to start with error %ld", (uint8_t *)&v12, 0x16u);

    }
  }

  -[WFNANTableViewContext removeSubscriber:](self, "removeSubscriber:", v6);
}

- (void)subscriber:(id)a3 terminatedWithReason:(int64_t)a4
{
  id v6;
  void *v7;
  os_log_type_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  WFLogForCategory(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7)
  {
    v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      objc_msgSend(v6, "configuration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "serviceName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v11;
      v14 = 2048;
      v15 = a4;
      _os_log_impl(&dword_219FC8000, v9, v8, "NAN subscribe %@ terminated with reason %ld", (uint8_t *)&v12, 0x16u);

    }
  }

  -[WFNANTableViewContext removeSubscriber:](self, "removeSubscriber:", v6);
}

- (void)subscriber:(id)a3 receivedDiscoveyResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  os_log_type_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WFLogForCategory(0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v8)
  {
    v10 = v8;
    if (os_log_type_enabled(v10, v9))
    {
      objc_msgSend(v6, "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "serviceName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "serviceSpecificInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v12;
      v17 = 2112;
      v18 = v14;
      _os_log_impl(&dword_219FC8000, v10, v9, "NAN subscribe %@ received discovery result %@", (uint8_t *)&v15, 0x16u);

    }
  }

  -[WFNANTableViewContext addDiscoveryResult:forSubscriber:](self, "addDiscoveryResult:forSubscriber:", v7, v6);
}

- (void)subscriber:(id)a3 lostDiscoveryResultForPublishID:(unsigned __int8)a4 address:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  os_log_type_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v6 = a4;
  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  WFLogForCategory(0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v10)
  {
    v12 = v10;
    if (os_log_type_enabled(v12, v11))
    {
      objc_msgSend(v8, "configuration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "serviceName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "description");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v14;
      v18 = 1024;
      v19 = v6;
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_219FC8000, v12, v11, "NAN subscribe %@ lost discovery result with publish ID %hhu and address %@", (uint8_t *)&v16, 0x1Cu);

    }
  }

  -[WFNANTableViewContext removeDiscoveryResultWithPublishID:andPublisherAddress:forSubscriber:](self, "removeDiscoveryResultWithPublishID:andPublisherAddress:forSubscriber:", v6, v9, v8);
}

- (NSMutableArray)publishers
{
  return self->_publishers;
}

- (void)setPublishers:(id)a3
{
  objc_storeStrong((id *)&self->_publishers, a3);
}

- (NSMutableDictionary)dataSessionsForPublish
{
  return self->_dataSessionsForPublish;
}

- (void)setDataSessionsForPublish:(id)a3
{
  objc_storeStrong((id *)&self->_dataSessionsForPublish, a3);
}

- (NSMutableArray)subscribers
{
  return self->_subscribers;
}

- (void)setSubscribers:(id)a3
{
  objc_storeStrong((id *)&self->_subscribers, a3);
}

- (NSMutableDictionary)discoveryResults
{
  return self->_discoveryResults;
}

- (void)setDiscoveryResults:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryResults, a3);
}

- (NSMutableDictionary)dataSessionsForSubscribe
{
  return self->_dataSessionsForSubscribe;
}

- (void)setDataSessionsForSubscribe:(id)a3
{
  objc_storeStrong((id *)&self->_dataSessionsForSubscribe, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSessionsForSubscribe, 0);
  objc_storeStrong((id *)&self->_discoveryResults, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_dataSessionsForPublish, 0);
  objc_storeStrong((id *)&self->_publishers, 0);
}

@end
