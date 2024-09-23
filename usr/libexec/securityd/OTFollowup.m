@implementation OTFollowup

- (OTFollowup)initWithFollowupController:(id)a3
{
  id v4;
  OTFollowup *v5;
  OTFollowup *v6;
  uint64_t v7;
  NSMutableSet *postedCFUTypes;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)OTFollowup;
  v5 = -[OTFollowup init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    -[OTFollowup setCdpd:](v5, "setCdpd:", v4);
    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    postedCFUTypes = v6->_postedCFUTypes;
    v6->_postedCFUTypes = (NSMutableSet *)v7;

  }
  return v6;
}

- (id)createCDPFollowupContext:(unsigned __int8)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 1u:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[CDPFollowUpContext contextForRecoveryKeyRepair](CDPFollowUpContext, "contextForRecoveryKeyRepair", v3, v4));
      break;
    case 2u:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[CDPFollowUpContext contextForStateRepair](CDPFollowUpContext, "contextForStateRepair", v3, v4));
      break;
    case 3u:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[CDPFollowUpContext contextForConfirmExistingSecret](CDPFollowUpContext, "contextForConfirmExistingSecret", v3, v4));
      break;
    case 4u:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[CDPFollowUpContext contextForSecureTerms](CDPFollowUpContext, "contextForSecureTerms", v3, v4));
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (BOOL)postFollowUp:(unsigned __int8)a3 activeAccount:(id)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  const void *v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  const void *v15;
  NSObject *v16;
  const __CFString *v17;
  unsigned int v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  id v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  void *v29;

  v6 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTFollowup createCDPFollowupContext:](self, "createCDPFollowupContext:", v6));
  if (qword_1003412C8 != -1)
    dispatch_once(&qword_1003412C8, &stru_1002E7860);
  if (byte_1003412C0)
  {
    v10 = sub_10000EF14("followup");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "altDSID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "personaUniqueString"));
      *(_DWORD *)buf = 138412546;
      v27 = v12;
      v28 = 2112;
      v29 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting altdsid (%@) on context for persona (%@)", buf, 0x16u);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "altDSID"));
    objc_msgSend(v9, "setAltDSID:", v14);

  }
  if (v9)
  {
    v15 = sub_10000EF14("followup");
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      if ((v6 - 1) > 3u)
        v17 = CFSTR("none");
      else
        v17 = *(&off_1002E9310 + (v6 - 1));
      *(_DWORD *)buf = 138412290;
      v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Posting a follow up (for Octagon) of type %@", buf, 0xCu);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTFollowup cdpd](self, "cdpd"));
    v25 = 0;
    v18 = objc_msgSend(v19, "postFollowUpWithContext:error:", v9, &v25);
    v20 = v25;

    if (v18)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTFollowup postedCFUTypes](self, "postedCFUTypes"));
      v22 = v21;
      if ((v6 - 1) > 3u)
        v23 = CFSTR("none");
      else
        v23 = *(&off_1002E9310 + (v6 - 1));
      objc_msgSend(v21, "addObject:", v23);

    }
    else if (a5)
    {
      *a5 = objc_retainAutorelease(v20);
    }

  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (BOOL)clearFollowUp:(unsigned __int8)a3 activeAccount:(id)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  const void *v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  const void *v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  BOOL v23;
  int v25;
  const __CFString *v26;
  __int16 v27;
  void *v28;

  v6 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTFollowup createCDPFollowupContext:](self, "createCDPFollowupContext:", v6));
  if (qword_1003412C8 != -1)
    dispatch_once(&qword_1003412C8, &stru_1002E7860);
  if (byte_1003412C0)
  {
    v10 = sub_10000EF14("followup");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "altDSID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "personaUniqueString"));
      v25 = 138412546;
      v26 = v12;
      v27 = 2112;
      v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting altdsid (%@) on context for persona (%@)", (uint8_t *)&v25, 0x16u);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "altDSID"));
    objc_msgSend(v9, "setAltDSID:", v14);

  }
  if (!v9)
    goto LABEL_16;
  v15 = sub_10000EF14("followup");
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if ((v6 - 1) > 3u)
      v17 = CFSTR("none");
    else
      v17 = *(&off_1002E9310 + (v6 - 1));
    v25 = 138412290;
    v26 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Clearing follow ups (for Octagon) of type %@", (uint8_t *)&v25, 0xCu);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTFollowup cdpd](self, "cdpd"));
  v19 = objc_msgSend(v18, "clearFollowUpWithContext:error:", v9, a5);

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTFollowup postedCFUTypes](self, "postedCFUTypes"));
    v21 = v20;
    if ((v6 - 1) > 3u)
      v22 = CFSTR("none");
    else
      v22 = *(&off_1002E9310 + (v6 - 1));
    objc_msgSend(v20, "removeObject:", v22);

    v23 = 1;
  }
  else
  {
LABEL_16:
    v23 = 0;
  }

  return v23;
}

- (id)sysdiagnoseStatus
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  const void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;

  if (objc_opt_class(FLFollowUpController))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v3 = objc_msgSend(objc_alloc((Class)FLFollowUpController), "initWithClientIdentifier:", 0);
    v23 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pendingFollowUpItems:", &v23));
    v5 = v23;
    if (v5)
    {
      v6 = sub_10000EF14("octagon");
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Fetching pending follow ups failed with: %@", buf, 0xCu);
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("error"));

    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "notification", (_QWORD)v19));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "creationDate"));

          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uniqueIdentifier"));
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v16, v17);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v11);
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)sfaStatus
{
  void *v2;
  id v3;
  const void *v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const void *v17;
  NSObject *v18;
  void *v20;
  id v21;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;

  v23 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (objc_opt_class(FLFollowUpController))
  {
    v28 = 0;
    v21 = objc_msgSend(objc_alloc((Class)FLFollowUpController), "initWithClientIdentifier:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "pendingFollowUpItems:", &v28));
    v3 = v28;
    if (v3)
    {
      v4 = sub_10000EF14("octagon");
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Fetching pending follow ups failed with: %@", buf, 0xCu);
      }

    }
    v20 = v3;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = v2;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "notification"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "creationDate"));

          if (v12)
            v13 = (uint64_t)+[CKKSAnalytics fuzzyDaysSinceDate:](CKKSAnalytics, "fuzzyDaysSinceDate:", v12);
          else
            v13 = 10000;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueIdentifier"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("OACFU-%@"), v14));

          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13));
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v16, v15);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v7);
    }

    v17 = sub_10000EF14("octagon");
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v23;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Analytics CFUs are %@", buf, 0xCu);
    }

  }
  return v23;
}

- (OctagonFollowUpControllerProtocol)cdpd
{
  return (OctagonFollowUpControllerProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCdpd:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (double)previousFollowupEnd
{
  return self->_previousFollowupEnd;
}

- (void)setPreviousFollowupEnd:(double)a3
{
  self->_previousFollowupEnd = a3;
}

- (double)followupStart
{
  return self->_followupStart;
}

- (void)setFollowupStart:(double)a3
{
  self->_followupStart = a3;
}

- (double)followupEnd
{
  return self->_followupEnd;
}

- (void)setFollowupEnd:(double)a3
{
  self->_followupEnd = a3;
}

- (NSMutableSet)postedCFUTypes
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPostedCFUTypes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postedCFUTypes, 0);
  objc_storeStrong((id *)&self->_cdpd, 0);
}

- (BOOL)hasPosted:(unsigned __int8)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  unsigned __int8 v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTFollowup postedCFUTypes](self, "postedCFUTypes"));
  v5 = v4;
  if ((a3 - 1) > 3u)
    v6 = CFSTR("none");
  else
    v6 = *(&off_1002E9310 + (a3 - 1));
  v7 = objc_msgSend(v4, "containsObject:", v6);

  return v7;
}

- (void)clearAllPostedFlags
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[OTFollowup postedCFUTypes](self, "postedCFUTypes"));
  objc_msgSend(v2, "removeAllObjects");

}

@end
