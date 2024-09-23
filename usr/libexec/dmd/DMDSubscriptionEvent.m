@implementation DMDSubscriptionEvent

- (id)dictionaryRepresentation
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSubscriptionEvent payloadIdentifier](self, "payloadIdentifier"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSubscriptionEvent payloadIdentifier](self, "payloadIdentifier"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, DMFDeclarationEventsMessageInReplyToKey);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSubscriptionEvent eventType](self, "eventType"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSubscriptionEvent eventType](self, "eventType"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, DMFDeclarationEventsMessageEventTypeKey);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSubscriptionEvent date](self, "date"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSubscriptionEvent date](self, "date"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, DMFDeclarationEventsMessageEventTimestampKey);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSubscriptionEvent details](self, "details"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSubscriptionEvent details](self, "details"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, DMFDeclarationEventsMessageEventPayloadKey);

  }
  return v3;
}

+ (id)fetchRequestMatchingEventsFromOrganizationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("organization.identifier = %@"), v4));

  objc_msgSend(v5, "setPredicate:", v6);
  return v5;
}

@end
