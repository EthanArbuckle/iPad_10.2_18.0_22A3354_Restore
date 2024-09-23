@implementation IndoorServiceTransactionManager

- (BOOL)isLastOpenTransactionWithDescription:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if ((id)-[IndoorServiceTransactionManager numOpenTransactions](self, "numOpenTransactions") == (id)1)
  {
    v5 = -[IndoorServiceTransactionManager hasOpenTransactionWithDescription:](self, "hasOpenTransactionWithDescription:", v4);

    return v5;
  }
  else
  {

    return 0;
  }
}

- (BOOL)hasOpenTransactionWithDescription:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_activeTransactions, "objectForKey:", a3));
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "count") != 0;

    return v5;
  }
  else
  {

    return 0;
  }
}

- (BOOL)closeTransactionWithDescription:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  NSObject *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  _BYTE v28[14];
  __int16 v29;
  id v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;

  v4 = a3;
  if (qword_100417ED8 == -1)
  {
    v5 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_100417ED8, &stru_100406D68);
  v5 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v28 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "IndoorServiceTransactionManager: request to end transaction w/ name %@", buf, 0xCu);
  }
LABEL_4:
  LOBYTE(v6) = -[IndoorServiceTransactionManager hasOpenTransactionWithDescription:](self, "hasOpenTransactionWithDescription:", v4);
  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_activeTransactions, "objectForKey:", v4));
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "count"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
        objc_msgSend(v8, "removeLastObject");

        if (!objc_msgSend(v8, "count"))
          -[NSMutableDictionary removeObjectForKey:](self->_activeTransactions, "removeObjectForKey:", v4);
        if (qword_100417ED8 == -1)
        {
          v10 = qword_100417EE0;
          if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
          {
LABEL_12:

            goto LABEL_13;
          }
LABEL_11:
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v28 = v4;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "IndoorServiceTransactionManager: successfully closed a transaction w/ name %@", buf, 0xCu);
          goto LABEL_12;
        }
LABEL_31:
        dispatch_once(&qword_100417ED8, &stru_100406D68);
        v10 = qword_100417EE0;
        if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
          goto LABEL_12;
        goto LABEL_11;
      }
      v20 = sub_100323374();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        v22 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
        *(_DWORD *)buf = 68289795;
        *(_DWORD *)v28 = 0;
        *(_WORD *)&v28[4] = 2082;
        *(_QWORD *)&v28[6] = "";
        v29 = 2081;
        v30 = v22;
        v31 = 2082;
        v32 = "assert";
        v33 = 2081;
        v34 = "[transactionsOfType count] > 0";
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"IndoorServiceTransactionManager: expected to have at least one transaction\", \"type\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }

      v23 = sub_100323374();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_signpost_enabled(v24))
      {
        v25 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
        *(_DWORD *)buf = 68289795;
        *(_DWORD *)v28 = 0;
        *(_WORD *)&v28[4] = 2082;
        *(_QWORD *)&v28[6] = "";
        v29 = 2081;
        v30 = v25;
        v31 = 2082;
        v32 = "assert";
        v33 = 2081;
        v34 = "[transactionsOfType count] > 0";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "IndoorServiceTransactionManager: expected to have at least one transaction", "{\"msg%{public}.0s\":\"IndoorServiceTransactionManager: expected to have at least one transaction\", \"type\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }

      v26 = sub_100323374();
      v19 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        sub_100344E40((uint64_t)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), (uint64_t)buf);
      v6 = 89;
    }
    else
    {
      v12 = sub_100323374();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        v14 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
        *(_DWORD *)buf = 68289795;
        *(_DWORD *)v28 = 0;
        *(_WORD *)&v28[4] = 2082;
        *(_QWORD *)&v28[6] = "";
        v29 = 2081;
        v30 = v14;
        v31 = 2082;
        v32 = "assert";
        v33 = 2081;
        v34 = "transactionsOfType";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"IndoorServiceTransactionManager: list of transactions for this type should exist!\", \"type\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }

      v15 = sub_100323374();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_signpost_enabled(v16))
      {
        v17 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
        *(_DWORD *)buf = 68289795;
        *(_DWORD *)v28 = 0;
        *(_WORD *)&v28[4] = 2082;
        *(_QWORD *)&v28[6] = "";
        v29 = 2081;
        v30 = v17;
        v31 = 2082;
        v32 = "assert";
        v33 = 2081;
        v34 = "transactionsOfType";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "IndoorServiceTransactionManager: list of transactions for this type should exist!", "{\"msg%{public}.0s\":\"IndoorServiceTransactionManager: list of transactions for this type should exist!\", \"type\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }

      v18 = sub_100323374();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        sub_100344EA0((uint64_t)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), (uint64_t)buf);
      v6 = 88;
    }

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/indoorservice/IndoorServiceTransactionManager.mm", v6, "-[IndoorServiceTransactionManager closeTransactionWithDescription:]");
    __break(1u);
    goto LABEL_31;
  }
LABEL_13:

  return v6;
}

- (void)openTransactionWithDescription:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *activeTransactions;
  id v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;

  v4 = a3;
  if (qword_100417ED8 == -1)
  {
    v5 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_100417ED8, &stru_100406D68);
  v5 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    v12 = 138412290;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "IndoorServiceTransactionManager: opening a transaction w/ name %@", (uint8_t *)&v12, 0xCu);
  }
LABEL_4:
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_activeTransactions, "objectForKey:", v4));
  if (v6)
  {
    v7 = (void *)os_transaction_create(objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    objc_msgSend(v6, "addObject:", v7);
  }
  else
  {
    activeTransactions = self->_activeTransactions;
    v9 = objc_retainAutorelease(v4);
    v7 = (void *)os_transaction_create(objc_msgSend(v9, "UTF8String"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v7));
    -[NSMutableDictionary setObject:forKey:](activeTransactions, "setObject:forKey:", v10, v9);

  }
  if (qword_100417ED8 != -1)
  {
    dispatch_once(&qword_100417ED8, &stru_100406D68);
    v11 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      goto LABEL_10;
    goto LABEL_9;
  }
  v11 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
  {
LABEL_9:
    v12 = 138412290;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "IndoorServiceTransactionManager: opened a transaction w/ name %@", (uint8_t *)&v12, 0xCu);
  }
LABEL_10:

}

- (BOOL)hasAnyOpenTransaction
{
  return -[IndoorServiceTransactionManager numOpenTransactions](self, "numOpenTransactions") != 0;
}

- (unint64_t)numOpenTransactions
{
  NSMutableDictionary *v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_activeTransactions;
  v4 = 0;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_activeTransactions, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7), (_QWORD)v11));
        v9 = objc_msgSend(v8, "count");

        v4 += (unint64_t)v9;
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  return v4;
}

- (IndoorServiceTransactionManager)init
{
  IndoorServiceTransactionManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *activeTransactions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IndoorServiceTransactionManager;
  v2 = -[IndoorServiceTransactionManager init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    activeTransactions = v2->_activeTransactions;
    v2->_activeTransactions = v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSMutableDictionary removeAllObjects](self->_activeTransactions, "removeAllObjects");
  v3.receiver = self;
  v3.super_class = (Class)IndoorServiceTransactionManager;
  -[IndoorServiceTransactionManager dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTransactions, 0);
}

@end
