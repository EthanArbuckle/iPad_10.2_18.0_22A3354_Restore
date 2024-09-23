@implementation EventPublisher

+ (id)sharedInstance
{
  if (qword_10034BBC8 != -1)
    dispatch_once(&qword_10034BBC8, &stru_100304A40);
  return (id)qword_10034BBC0;
}

- (void)sendEvent:(id)a3 keyIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a4)
  {
    v6 = a4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[_SESSessionManager sessionManager](_SESSessionManager, "sessionManager"));
    objc_msgSend(v7, "sendEvent:keyIdentifier:", v8, v6);

  }
  -[EventPublisher sendEvent:](self, "sendEvent:", v8);

}

- (void)sendEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  void *v12;
  uint64_t v13;
  NSString *v14;
  const __CFString *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  size_t count;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  void *v32;
  void *v33;
  _UNKNOWN **v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;

  v4 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("xpcEventName")));
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appletIdentifier")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyIdentifier")));
    if (objc_msgSend(CFSTR("com.apple.secureelementservice.dck.event.vehicle.did.ranging.start"), "isEqualToString:", v6))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("readerIdentifier")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rangingTimeoutSec")));
      v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@:%@:%d"), v7, v8, v9, objc_msgSend(v10, "unsignedIntValue"));
LABEL_4:
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
LABEL_5:

LABEL_16:
      goto LABEL_17;
    }
    if (objc_msgSend(CFSTR("com.apple.secureelementservice.dck.event.vehicle.did.ranging.end"), "isEqualToString:", v6))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("readerIdentifier")));
      v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@:%@"), v7, v8, v9);
LABEL_15:
      v12 = (void *)objc_claimAutoreleasedReturnValue(v14);
      goto LABEL_16;
    }
    if (objc_msgSend(CFSTR("com.apple.secureelementservice.dck.event.did.ranging.suspend"), "isEqualToString:", v6))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rangingSuspensionReasons")));
      v38 = v8;
      v39 = objc_msgSend(v9, "unsignedIntValue");
      v37 = v7;
      v15 = CFSTR("%@:%@:%d");
LABEL_14:
      v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v37, v38, v39);
      goto LABEL_15;
    }
    if (objc_msgSend(CFSTR("com.apple.secureelementservice.event.did.ranging.suspend"), "isEqualToString:", v6))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rangingSuspensionReasons")));
      v37 = objc_msgSend(v9, "unsignedIntValue");
      v15 = CFSTR("%d");
      goto LABEL_14;
    }
    if (objc_msgSend(CFSTR("com.apple.secureelementservice.dck.event.vehicle.did.rke.action.start"), "isEqualToString:", v6))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rkeFunctionID")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rkeActionID")));
      v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@:%d:%d"), v7, v8, objc_msgSend(v9, "unsignedShortValue"), objc_msgSend(v10, "unsignedCharValue"));
      goto LABEL_4;
    }
    if (objc_msgSend(CFSTR("com.apple.secureelementservice.dck.event.vehicle.did.rke.action.complete"), "isEqualToString:", v6))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rkeFunctionID")));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rkeActionID")));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error")));
      if (v33)
        v34 = &off_100322F20;
      else
        v34 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rkeExecutionStatus")));

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@:%d:%d:%d"), v7, v8, objc_msgSend(v31, "unsignedShortValue"), objc_msgSend(v32, "unsignedCharValue"), objc_msgSend(v34, "unsignedCharValue")));
      goto LABEL_17;
    }
    if (objc_msgSend(CFSTR("com.apple.secureelementservice.acwg.event.did.status.update"), "isEqualToString:", v6))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lockStatus")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("readerIdentifier")));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp")));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lockOperationSource")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@:%@:%@:%@:%@"), v7, v8, v10, v35, v9, v36));

    }
    else
    {
      if ((objc_msgSend(CFSTR("com.apple.secureelementservice.acwg.event.did.lock"), "isEqualToString:", v6) & 1) == 0&& (objc_msgSend(CFSTR("com.apple.secureelementservice.acwg.event.did.unlock"), "isEqualToString:", v6) & 1) == 0)
      {
        v16 = objc_msgSend(CFSTR("com.apple.secureelementservice.acwg.event.did.jam"), "isEqualToString:", v6);
        if (!(_DWORD)v16)
        {
          v12 = 0;
          if (v7 && v8)
          {
            v16 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v7, v8));
            v12 = v16;
          }
LABEL_17:
          v18 = SESDefaultLogObject(v16, v17);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v41 = v6;
            v42 = 2112;
            v43 = v12;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Sending event via NSDistributedNotification %@ %@", buf, 0x16u);
          }

          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
          objc_msgSend(v20, "postNotificationName:object:userInfo:options:", v6, v12, 0, 3);

          v21 = (void *)_CFXPCCreateXPCObjectFromCFObject(v4);
          v23 = v21;
          if (v21)
          {
            count = xpc_dictionary_get_count(v21);
            v26 = SESDefaultLogObject(count, v25);
            v27 = objc_claimAutoreleasedReturnValue(v26);
            v28 = v27;
            if (count)
            {
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v41 = v4;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Sending event via XPC %@", buf, 0xCu);
              }

              v28 = objc_claimAutoreleasedReturnValue(-[EventPublisher eventPublisher](self, "eventPublisher"));
              -[NSObject sendEvent:](v28, "sendEvent:", v23);
              goto LABEL_29;
            }
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v41 = v4;
              v30 = "Created event xpc object has no keys for dictionary %@";
              goto LABEL_28;
            }
          }
          else
          {
            v29 = SESDefaultLogObject(0, v22);
            v28 = objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v41 = v4;
              v30 = "Failed to get event xpc object from dictionary %@";
LABEL_28:
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, v30, buf, 0xCu);
            }
          }
LABEL_29:

          goto LABEL_30;
        }
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("readerIdentifier")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp")));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lockOperationSource")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@:%@:%@:%@"), v7, v8, v9, v10, v35));
    }

    goto LABEL_5;
  }
  v13 = SESDefaultLogObject(0, v5);
  v7 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Dropping event with no SES_EVENT_KEY_NAME %@", buf, 0xCu);
  }
LABEL_30:

}

- (OS_dispatch_queue)eventPublisherQueue
{
  return self->_eventPublisherQueue;
}

- (void)setEventPublisherQueue:(id)a3
{
  objc_storeStrong((id *)&self->_eventPublisherQueue, a3);
}

- (NFSecureXPCEventPublisher)eventPublisher
{
  return self->_eventPublisher;
}

- (void)setEventPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_eventPublisher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPublisher, 0);
  objc_storeStrong((id *)&self->_eventPublisherQueue, 0);
}

@end
