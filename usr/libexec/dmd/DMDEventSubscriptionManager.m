@implementation DMDEventSubscriptionManager

- (DMDEventSubscriptionManager)init
{
  DMDEventSubscriptionManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *eventSubscriptionsByIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMDEventSubscriptionManager;
  v2 = -[DMDEventSubscriptionManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    eventSubscriptionsByIdentifier = v2->_eventSubscriptionsByIdentifier;
    v2->_eventSubscriptionsByIdentifier = v3;

  }
  return v2;
}

- (BOOL)setEventSubscriptionRegistrations:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  DMDEventSubscriptionRegistrationController *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id location;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventSubscriptionManager eventSubscriptionsByIdentifier](self, "eventSubscriptionsByIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
  v24 = objc_msgSend(v7, "mutableCopy");

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v8)
  {
    v23 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "payloadMetadata"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "organization"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventSubscriptionManager eventSubscriptionsByIdentifier](self, "eventSubscriptionsByIdentifier"));
        v17 = (DMDEventSubscriptionRegistrationController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v15));

        if (v17)
        {
          -[DMDEventSubscriptionRegistrationController updateWithSubscriptionRegistration:](v17, "updateWithSubscriptionRegistration:", v10);
        }
        else
        {
          objc_initWeak(&location, self);
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_1000433C4;
          v25[3] = &unk_1000BAFF0;
          objc_copyWeak(&v28, &location);
          v26 = v14;
          v27 = v13;
          v18 = objc_retainBlock(v25);
          v17 = -[DMDEventSubscriptionRegistrationController initWithSubscriptionRegistration:streamEventsHandler:]([DMDEventSubscriptionRegistrationController alloc], "initWithSubscriptionRegistration:streamEventsHandler:", v10, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventSubscriptionManager eventSubscriptionsByIdentifier](self, "eventSubscriptionsByIdentifier"));
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, v15);

          objc_destroyWeak(&v28);
          objc_destroyWeak(&location);
        }
        objc_msgSend(v24, "removeObject:", v15);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v8);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventSubscriptionManager eventSubscriptionsByIdentifier](self, "eventSubscriptionsByIdentifier"));
  objc_msgSend(v20, "removeObjectsForKeys:", v24);

  return 1;
}

- (id)eventStatusesByPayloadIdentifierSinceStartDate:(id)a3 organizationIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventSubscriptionManager eventSubscriptionsByIdentifier](self, "eventSubscriptionsByIdentifier"));
  v9 = objc_msgSend(v8, "copy");

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10004354C;
  v16[3] = &unk_1000BB018;
  v17 = v7;
  v10 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v9, "count"));
  v18 = v10;
  v19 = v6;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v16);
  v13 = v19;
  v14 = v10;

  return v14;
}

- (id)eventsHandler
{
  return self->_eventsHandler;
}

- (void)setEventsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableDictionary)eventSubscriptionsByIdentifier
{
  return self->_eventSubscriptionsByIdentifier;
}

- (void)setEventSubscriptionsByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_eventSubscriptionsByIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventSubscriptionsByIdentifier, 0);
  objc_storeStrong(&self->_eventsHandler, 0);
}

@end
