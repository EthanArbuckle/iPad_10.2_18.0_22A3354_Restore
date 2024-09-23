@implementation XpcSession

- (XpcSession)initWithConnection:(id)a3
{
  XpcSession *v3;
  CHManager *v4;
  CHManager *chManager;
  void *v6;
  TUCallProviderManager *v7;
  TUCallProviderManager *tuCallProviderManager;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)XpcSession;
  v3 = -[BTXpcSession initWithConnection:](&v10, "initWithConnection:", a3);
  if (v3 && NSClassFromString(CFSTR("CHManager")))
  {
    v4 = (CHManager *)objc_alloc_init((Class)CHManager);
    chManager = v3->_chManager;
    v3->_chManager = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -31536000.0));
    -[CHManager setLimitingStartDate:](v3->_chManager, "setLimitingStartDate:", v6);

    -[CHManager setCoalescingStrategy:](v3->_chManager, "setCoalescingStrategy:", kCHCoalescingStrategyRecents);
    v7 = (TUCallProviderManager *)objc_alloc_init((Class)TUCallProviderManager);
    tuCallProviderManager = v3->_tuCallProviderManager;
    v3->_tuCallProviderManager = v7;

  }
  return v3;
}

- (void)handleMsg:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t reply;
  NSString *v7;
  const char *v8;
  id v9;

  v4 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[BTXpcSession stringForKey:optional:dict:](self, "stringForKey:optional:dict:", "kMsgId", 0, v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTXpcSession xpcDictForKey:optional:dict:](self, "xpcDictForKey:optional:dict:", "kMsgArgs", 1, v4));
  reply = xpc_dictionary_create_reply(v4);

  v7 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("_handle%@Msg:reply:"), v9));
  v8 = NSSelectorFromString(v7);

  if ((objc_opt_respondsToSelector(self, v8) & 1) != 0)
    objc_msgSend(self, v8, v5, reply);
  if (reply)
    -[BTXpcSession sendReply:](self, "sendReply:", reply);

}

- (void)_handleOpenMsg:(id)a3 reply:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSRange v13;
  void *v14;
  id v15;
  NSRange v16;
  NSRange v17;

  v5 = a3;
  v15 = (id)objc_claimAutoreleasedReturnValue(-[BTXpcSession stringForKey:optional:dict:](self, "stringForKey:optional:dict:", "kArgType", 0, v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTXpcSession numberForKey:optional:dict:](self, "numberForKey:optional:dict:", "kArgOffset", 0, v5));
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTXpcSession numberForKey:optional:dict:](self, "numberForKey:optional:dict:", "kArgCount", 0, v5));
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[XpcSession _predicateForType:](self, "_predicateForType:", v15));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[XpcSession chManager](self, "chManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "coalescedCallsWithPredicate:limit:offset:batchSize:", v10, 0, 0, 0));

  v16.length = (NSUInteger)objc_msgSend(v12, "count");
  v16.location = 0;
  v17.location = (NSUInteger)v7;
  v17.length = (NSUInteger)v9;
  v13 = NSIntersectionRange(v16, v17);
  if (v13.length)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subarrayWithRange:", v13.location, v13.length));
    -[XpcSession setChRecentCalls:](self, "setChRecentCalls:", v14);

  }
}

- (void)_handleGetSizeMsg:(id)a3 reply:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[XpcSession chRecentCalls](self, "chRecentCalls"));
  xpc_dictionary_set_uint64(v5, "kValue", (uint64_t)objc_msgSend(v6, "count"));

}

- (void)_handleGetRecentCallMsg:(id)a3 reply:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  id v20;
  id v21;
  xpc_object_t xdict;

  xdict = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTXpcSession numberForKey:optional:dict:](self, "numberForKey:optional:dict:", "kArgIndex", 0, a3));
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[XpcSession chRecentCalls](self, "chRecentCalls"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[XpcSession tuCallProviderManager](self, "tuCallProviderManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "providerForRecentCall:", v9));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "addressBookRecordId"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "addressBookRecordId"));
    xpc_dictionary_set_uint64(xdict, "kLegacyIdentifier", (uint64_t)objc_msgSend(v13, "longLongValue"));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "callerId"));

  if (v14)
  {
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "callerId")));
    xpc_dictionary_set_string(xdict, "kCallerId", (const char *)objc_msgSend(v15, "UTF8String"));

  }
  if (objc_msgSend(v9, "callStatus"))
    xpc_dictionary_set_string(xdict, "kStatus", -[XpcSession _callStatusForCall:](self, "_callStatusForCall:", v9));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "date"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "date"));
    objc_msgSend(v17, "timeIntervalSince1970");
    xpc_dictionary_set_date(xdict, "kDate", (uint64_t)(v18 * 1000000000.0));

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "callerIdLabel"));

  if (v19)
  {
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "callerIdLabel")));
    xpc_dictionary_set_string(xdict, "kLabel", (const char *)objc_msgSend(v20, "UTF8String"));

  }
  if (v11)
  {
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier")));
    xpc_dictionary_set_string(xdict, "kProviderIdentifier", (const char *)objc_msgSend(v21, "UTF8String"));

  }
}

- (id)_predicateForType:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[2];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  if (objc_msgSend(v3, "containsString:", CFSTR("Incoming")))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CHRecentCall predicateForCallsWithStatus:](CHRecentCall, "predicateForCallsWithStatus:", kCHCallStatusConnectedIncoming));
    v21[0] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CHRecentCall predicateForCallsWithStatus:](CHRecentCall, "predicateForCallsWithStatus:", kCHCallStatusAnsweredElsewhere));
    v21[1] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v7));
    objc_msgSend(v4, "addObject:", v8);

  }
  if (objc_msgSend(v3, "containsString:", CFSTR("Outgoing")))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CHRecentCall predicateForCallsWithStatus:](CHRecentCall, "predicateForCallsWithStatus:", kCHCallStatusConnectedOutgoing));
    v20[0] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CHRecentCall predicateForCallsWithStatus:](CHRecentCall, "predicateForCallsWithStatus:", kCHCallStatusCancelled));
    v20[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v11));
    objc_msgSend(v4, "addObject:", v12);

  }
  if (objc_msgSend(v3, "containsString:", CFSTR("Missed")))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CHRecentCall predicateForCallsWithStatus:](CHRecentCall, "predicateForCallsWithStatus:", kCHCallStatusMissed));
    objc_msgSend(v4, "addObject:", v13);

  }
  if (objc_msgSend(v3, "containsString:", CFSTR("Unread")))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CHRecentCall predicateForCallsWithStatusRead:](CHRecentCall, "predicateForCallsWithStatusRead:", 0));
    objc_msgSend(v4, "addObject:", v14);

  }
  if (objc_msgSend(v3, "containsString:", CFSTR("Telephony")))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CHRecentCall predicateForCallsWithRemoteParticipantHandleType:](CHRecentCall, "predicateForCallsWithRemoteParticipantHandleType:", 2));
    objc_msgSend(v4, "addObject:", v15);

  }
  if (objc_msgSend(v4, "count"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -31536000.0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CHRecentCall predicateForCallsBetweenStartDate:endDate:](CHRecentCall, "predicateForCallsBetweenStartDate:endDate:", v16, 0));
    objc_msgSend(v4, "addObject:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v4));
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (const)_callStatusForCall:(id)a3
{
  id v3;
  unsigned int v4;
  const char *v5;
  unsigned int v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "callStatus");
  if ((kCHCallStatusIncoming & v4 & ~kCHCallStatusMissed) != 0)
  {
    v5 = "Incoming";
  }
  else
  {
    v6 = objc_msgSend(v3, "callStatus");
    if ((kCHCallStatusOutgoing & v6) != 0)
      v5 = "Outgoing";
    else
      v5 = "Missed";
  }

  return v5;
}

- (CHManager)chManager
{
  return self->_chManager;
}

- (TUCallProviderManager)tuCallProviderManager
{
  return self->_tuCallProviderManager;
}

- (NSArray)chRecentCalls
{
  return self->_chRecentCalls;
}

- (void)setChRecentCalls:(id)a3
{
  objc_storeStrong((id *)&self->_chRecentCalls, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chRecentCalls, 0);
  objc_storeStrong((id *)&self->_tuCallProviderManager, 0);
  objc_storeStrong((id *)&self->_chManager, 0);
}

@end
