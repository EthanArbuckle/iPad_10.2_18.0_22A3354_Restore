@implementation FMFRefreshCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedAppContexts, 0);
  objc_storeStrong((id *)&self->_tapMessages, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_skippedReasons, 0);
  objc_storeStrong((id *)&self->_selectedHandles, 0);
}

- (id)tapContext
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "cachedTapMessages"));

  return v3;
}

- (id)pathSuffix
{
  void *v3;
  id v4;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRefreshCommand selectedHandles](self, "selectedHandles"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("selFriend/"), "stringByAppendingString:", CFSTR("refreshClient")));
    v6 = -[FMFRefreshCommand isShallowLocate](self, "isShallowLocate");
    v7 = CFSTR("deep");
    if (v6)
      v7 = CFSTR("shallow");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/"), v7));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", v5));

  }
  else
  {
    v9 = CFSTR("refreshClient");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForReasonCode:", -[FMFRefreshCommand reason](self, "reason")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/"), v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", v9));

  return v13;
}

- (id)clientContext
{
  FMFRefreshCommand *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  __CFString *v32;
  void *v33;
  __CFString *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  FMFRefreshCommand *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  _BYTE v59[128];
  _BYTE v60[128];

  v2 = self;
  v58.receiver = self;
  v58.super_class = (Class)FMFRefreshCommand;
  v3 = -[FMFBaseCmd clientContext](&v58, "clientContext");
  v48 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v4 = objc_msgSend(v48, "mutableCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRefreshCommand selectedHandles](v2, "selectedHandles"));
  v6 = objc_msgSend(v5, "count");

  v49 = v2;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[FMFRefreshCommand isShallowLocate](v2, "isShallowLocate")));
    v8 = v4;
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("shallowLocatesOnly"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRefreshCommand selectedHandles](v2, "selectedHandles"));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v55 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trackingTimestamp"));
          if (v16)
          {
            v17 = (void *)v16;
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));

            if (v18)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trackingTimestamp"));
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
              objc_msgSend(v9, "setObject:forKey:", v19, v20);

            }
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
      }
      while (v12);
    }

    v4 = v8;
    objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("selectedHandlesMap"));

    v2 = v49;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[FMFRefreshCommand reason](v2, "reason")));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringForReasonCode:", -[FMFRefreshCommand reason](v2, "reason")));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - %@"), v21, v23));
  objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("reason"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRefreshCommand skippedReasons](v2, "skippedReasons"));
  v26 = objc_msgSend(v25, "count");

  if (v26)
  {
    v47 = v4;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRefreshCommand skippedReasons](v2, "skippedReasons"));
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    if (v28)
    {
      v29 = v28;
      v30 = 0;
      v31 = *(_QWORD *)v51;
      v32 = &stru_10009B948;
      do
      {
        v33 = 0;
        v34 = v32;
        do
        {
          if (*(_QWORD *)v51 != v31)
            objc_enumerationMutation(v27);
          v35 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v33);
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRefreshCommand skippedReasons](v2, "skippedReasons"));
          v37 = objc_msgSend(v36, "countForObject:", v35);

          v30 += (uint64_t)v37;
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%lu) "), v35, v37));
          v32 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v34, "stringByAppendingString:", v38));

          v2 = v49;
          v33 = (char *)v33 + 1;
          v34 = v32;
        }
        while (v29 != v33);
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      }
      while (v29);
    }
    else
    {
      v30 = 0;
      v32 = &stru_10009B948;
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(Total: %lu), {%@}"), v30, v32));
    v4 = v47;
    objc_msgSend(v47, "setObject:forKey:", v39, CFSTR("skippedRefreshes"));

  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRefreshCommand type](v2, "type"));

  if (v40)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRefreshCommand type](v2, "type"));
    objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("type"));

  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRefreshCommand coalescedAppContexts](v2, "coalescedAppContexts"));
  v43 = objc_msgSend(v42, "count");

  if (v43)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRefreshCommand coalescedAppContexts](v2, "coalescedAppContexts"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "componentsJoinedByString:", CFSTR(",")));

    objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("contextApp"));
  }

  return v4;
}

- (NSString)type
{
  return self->_type;
}

- (NSCountedSet)skippedReasons
{
  return self->_skippedReasons;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (void)setSkippedReasons:(id)a3
{
  objc_storeStrong((id *)&self->_skippedReasons, a3);
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (NSArray)selectedHandles
{
  return self->_selectedHandles;
}

- (NSArray)coalescedAppContexts
{
  return self->_coalescedAppContexts;
}

- (void)setSelectedHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)isShallowLocate
{
  return self->_isShallowLocate;
}

- (void)setIsShallowLocate:(BOOL)a3
{
  self->_isShallowLocate = a3;
}

- (NSArray)tapMessages
{
  return self->_tapMessages;
}

- (void)setTapMessages:(id)a3
{
  objc_storeStrong((id *)&self->_tapMessages, a3);
}

- (void)setCoalescedAppContexts:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedAppContexts, a3);
}

@end
