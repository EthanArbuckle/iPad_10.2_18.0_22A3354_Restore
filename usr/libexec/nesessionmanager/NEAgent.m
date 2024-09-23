@implementation NEAgent

- (NEAgent)initWithPluginType:(id)a3 pluginVersion:(int64_t)a4 pluginClass:(int64_t)a5 pluginInfo:(id)a6 userID:(id)a7
{
  id v13;
  id v14;
  id v15;
  NEAgent *v16;
  dispatch_queue_attr_t v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *queue;
  NSDictionary *v21;
  NSDictionary *pluginInfo;
  uint64_t v23;
  NSString *description;
  NEAgent *v25;
  objc_super v27;

  v13 = a3;
  v14 = a6;
  v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)NEAgent;
  v16 = -[NEAgent init](&v27, "init");
  if (v16)
  {
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = dispatch_queue_create("NEAgent queue", v18);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v16->_uid, a7);
    objc_storeStrong((id *)&v16->_pluginType, a3);
    v16->_pluginClass = a5;
    v21 = (NSDictionary *)objc_msgSend(v14, "copy");
    pluginInfo = v16->_pluginInfo;
    v16->_pluginInfo = v21;

    v23 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@[inactive]"), v13));
    description = v16->_description;
    v16->_description = (NSString *)v23;

    v16->_pid = 0;
    v16->_pluginVersion = a4;
    v25 = v16;
  }

  return v16;
}

- (id)description
{
  return self->_description;
}

- (void)startWithCompletionHandler:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  id v7;
  _QWORD block[5];
  id v9;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 24, 1);
  else
    Property = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007F2C0;
  block[3] = &unk_1000BECD0;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(Property, block);

}

- (BOOL)isPerUser
{
  return 1;
}

- (BOOL)isLocal
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginInfo, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_processIdentities, 0);
  objc_storeStrong((id *)&self->_pluginUUIDs, 0);
  objc_storeStrong((id *)&self->_pluginType, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

@end
