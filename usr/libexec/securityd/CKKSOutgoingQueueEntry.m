@implementation CKKSOutgoingQueueEntry

- (id)description
{
  objc_class *v3;
  NSString *v4;
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

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry contextID](self, "contextID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry item](self, "item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry action](self, "action"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry item](self, "item"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uuid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry state](self, "state"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@[%@](%@): %@ %@ (%@)>"), v5, v6, v9, v10, v12, v13));

  return v14;
}

- (CKKSOutgoingQueueEntry)initWithCKKSItem:(id)a3 action:(id)a4 state:(id)a5 waitUntil:(id)a6 accessGroup:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CKKSOutgoingQueueEntry *v17;
  CKKSOutgoingQueueEntry *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CKKSOutgoingQueueEntry;
  v17 = -[CKKSOutgoingQueueEntry init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_item, a3);
    objc_storeStrong((id *)&v18->_action, a4);
    objc_storeStrong((id *)&v18->_state, a5);
    objc_storeStrong((id *)&v18->_accessgroup, a7);
    objc_storeStrong((id *)&v18->_waitUntil, a6);
  }

  return v18;
}

- (NSString)contextID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry item](self, "item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contextID"));

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = a3;
  v5 = objc_opt_class(CKKSOutgoingQueueEntry);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry item](self, "item"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "item"));
    if (!objc_msgSend(v7, "isEqual:", v8))
    {
      v16 = 0;
LABEL_22:

      goto LABEL_23;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry action](self, "action"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "action"));
    if (!objc_msgSend(v9, "isEqual:", v10))
    {
      v16 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry state](self, "state"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "state"));
    if (!objc_msgSend(v11, "isEqual:", v12))
    {
      v16 = 0;
LABEL_20:

      goto LABEL_21;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry waitUntil](self, "waitUntil"));
    if (v13 || (v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "waitUntil"))) != 0)
    {
      v26 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry waitUntil](self, "waitUntil"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "waitUntil"));
      v25 = v14;
      objc_msgSend(v14, "timeIntervalSinceDate:");
      if (fabs(v15) >= 1.0)
      {
        v16 = 0;
        v12 = v26;
        goto LABEL_17;
      }
      v22 = v13;
      v23 = v11;
      v21 = 1;
      v12 = v26;
    }
    else
    {
      v22 = 0;
      v23 = v11;
      v20 = 0;
      v21 = 0;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry accessgroup](self, "accessgroup"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessgroup"));
    v16 = objc_msgSend(v17, "isEqual:", v18);

    if (!v21)
    {
      v13 = v22;
      v11 = v23;
      if (v22)
        goto LABEL_19;
      goto LABEL_18;
    }
    v13 = v22;
    v11 = v23;
LABEL_17:

    if (v13)
    {
LABEL_19:

      goto LABEL_20;
    }
LABEL_18:

    goto LABEL_19;
  }
  v16 = 0;
LABEL_23:

  return v16;
}

- (NSString)uuid
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry item](self, "item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "uuid"));

  return (NSString *)v3;
}

- (void)setUuid:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry item](self, "item"));
  objc_msgSend(v5, "setUuid:", v4);

}

- (id)whereClauseToFindSelf
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[4];

  v14[0] = CFSTR("contextID");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry item](self, "item"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contextID"));

  if (v4)
    v5 = v4;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v6 = v5;

  v15[0] = v6;
  v14[1] = CFSTR("UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry uuid](self, "uuid"));
  v15[1] = v7;
  v14[2] = CFSTR("state");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry state](self, "state"));
  v15[2] = v8;
  v14[3] = CFSTR("ckzone");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry item](self, "item"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneName"));
  v15[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 4));

  return v12;
}

- (id)sqlValues
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init((Class)NSISO8601DateFormatter);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry item](self, "item"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sqlValues"));
  v6 = objc_msgSend(v5, "mutableCopy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry action](self, "action"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("action"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry state](self, "state"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("state"));

  v9 = objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry waitUntil](self, "waitUntil"));
  if (!v9
    || (v10 = (void *)v9,
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry waitUntil](self, "waitUntil")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringFromDate:", v11)),
        v11,
        v10,
        !v12))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("waituntil"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry accessgroup](self, "accessgroup"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("accessgroup"));

  return v6;
}

- (BOOL)intransactionMoveToState:(id)a3 viewState:(id)a4 error:(id *)a5
{
  CKKSOutgoingQueueEntry *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  CKKSOutgoingQueueEntry *v13;
  CKKSOutgoingQueueEntry *v14;
  void *v15;
  id v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CKKSOutgoingQueueEntry *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  NSObject *v37;
  CKKSOutgoingQueueEntry *v38;
  void *v39;
  id v40;
  id v42;
  CKKSOutgoingQueueEntry *v43;
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  CKKSOutgoingQueueEntry *v48;
  __int16 v49;
  CKKSOutgoingQueueEntry *v50;
  __int16 v51;
  CKKSOutgoingQueueEntry *v52;

  v8 = (CKKSOutgoingQueueEntry *)a3;
  v9 = a4;
  if (-[CKKSOutgoingQueueEntry isEqualToString:](v8, "isEqualToString:", CFSTR("deleted")))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](CKKSViewManager, "manager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry uuid](self, "uuid"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "claimCallbackForUUID:", v11));

    if (v12)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v12 + 16))(v12, 1, 0);
    v46 = 0;
    -[CKKSSQLDatabaseObject deleteFromDatabase:](self, "deleteFromDatabase:", &v46);
    v13 = (CKKSOutgoingQueueEntry *)v46;
    if (v13)
    {
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
      v16 = sub_10000BDF4(CFSTR("ckks"), v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);

      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
LABEL_18:

        goto LABEL_23;
      }
      *(_DWORD *)buf = 138412546;
      v48 = self;
      v49 = 2112;
      v50 = v14;
      v18 = "Couldn't delete %@: %@";
      v19 = v17;
      v20 = 22;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
      goto LABEL_18;
    }
    goto LABEL_32;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry state](self, "state"));
  if (objc_msgSend(v21, "isEqualToString:", CFSTR("inflight")))
  {
    v22 = -[CKKSOutgoingQueueEntry isEqualToString:](v8, "isEqualToString:", CFSTR("new"));

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry uuid](self, "uuid"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry item](self, "item"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "contextID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
      v45 = 0;
      v12 = objc_claimAutoreleasedReturnValue(+[CKKSOutgoingQueueEntry tryFromDatabase:state:contextID:zoneID:error:](CKKSOutgoingQueueEntry, "tryFromDatabase:state:contextID:zoneID:error:", v23, CFSTR("new"), v25, v26, &v45));
      v27 = (CKKSOutgoingQueueEntry *)v45;

      if (v27)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
        v29 = sub_10000BDF4(CFSTR("ckksoutgoing"), v28);
        v30 = objc_claimAutoreleasedReturnValue(v29);

        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v48 = v27;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Couldn't fetch an overwriting OQE, assuming one doesn't exist: %@", buf, 0xCu);
        }

      }
      else if (v12)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
        v36 = sub_10000BDF4(CFSTR("ckksoutgoing"), v35);
        v37 = objc_claimAutoreleasedReturnValue(v36);

        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v48 = self;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "New modification has come in behind inflight %@; dropping failed change",
            buf,
            0xCu);
        }

        v44 = 0;
        -[CKKSOutgoingQueueEntry intransactionMoveToState:viewState:error:](self, "intransactionMoveToState:viewState:error:", CFSTR("deleted"), v9, &v44);
        v38 = (CKKSOutgoingQueueEntry *)v44;
        if (v38)
        {
          v14 = v38;
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
          v40 = sub_10000BDF4(CFSTR("ckksoutgoing"), v39);
          v17 = objc_claimAutoreleasedReturnValue(v40);

          if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            goto LABEL_18;
          *(_DWORD *)buf = 138412290;
          v48 = v14;
          v18 = "Couldn't delete in-flight OQE: %@";
          v19 = v17;
          v20 = 12;
          goto LABEL_7;
        }
LABEL_32:

        v14 = 0;
        goto LABEL_33;
      }
      -[CKKSOutgoingQueueEntry setState:](self, "setState:", v8);
      v43 = v27;
      -[CKKSSQLDatabaseObject saveToDatabase:](self, "saveToDatabase:", &v43);
      v14 = v43;

      if (v14)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
        v32 = sub_10000BDF4(CFSTR("ckks"), v31);
        v17 = objc_claimAutoreleasedReturnValue(v32);

        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v48 = self;
          v49 = 2112;
          v50 = v8;
          v51 = 2112;
          v52 = v14;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Couldn't save %@ as %@: %@", buf, 0x20u);
        }
        v12 = 0;
        goto LABEL_18;
      }
      v12 = 0;
      goto LABEL_32;
    }
  }
  else
  {

  }
  -[CKKSOutgoingQueueEntry setState:](self, "setState:", v8);
  v42 = 0;
  -[CKKSSQLDatabaseObject saveToDatabase:](self, "saveToDatabase:", &v42);
  v14 = (CKKSOutgoingQueueEntry *)v42;
  if (!v14)
    goto LABEL_33;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
  v34 = sub_10000BDF4(CFSTR("ckks"), v33);
  v12 = objc_claimAutoreleasedReturnValue(v34);

  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v48 = self;
    v49 = 2112;
    v50 = v8;
    v51 = 2112;
    v52 = v14;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_ERROR, "Couldn't save %@ as %@: %@", buf, 0x20u);
  }
LABEL_23:

  if (a5)
  {
    v14 = objc_retainAutorelease(v14);
    *a5 = v14;
  }
LABEL_33:

  return v14 == 0;
}

- (BOOL)intransactionMarkAsError:(id)a3 viewState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  CKKSOutgoingQueueEntry *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](CKKSViewManager, "manager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry uuid](self, "uuid"));
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "claimCallbackForUUID:", v11));

  if (v12)
    ((void (**)(_QWORD, _QWORD, id))v12)[2](v12, 0, v8);
  v18 = 0;
  -[CKKSSQLDatabaseObject deleteFromDatabase:](self, "deleteFromDatabase:", &v18);
  v13 = v18;
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
    v15 = sub_10000BDF4(CFSTR("ckks"), v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v20 = self;
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Couldn't delete %@ (due to error %@): %@", buf, 0x20u);
    }

    if (a5)
      *a5 = objc_retainAutorelease(v13);
  }

  return v13 == 0;
}

- (CKKSItem)item
{
  return (CKKSItem *)objc_getProperty(self, a2, 16, 1);
}

- (void)setItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)action
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)state
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)accessgroup
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAccessgroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDate)waitUntil
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWaitUntil:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitUntil, 0);
  objc_storeStrong((id *)&self->_accessgroup, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

+ (id)keyForItem:(SecDbItem *)a3 contextID:(id)a4 zoneID:(id)a5 keyCache:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  __objc2_class *v13;
  const void *v14;
  void *v15;
  __CFString **v16;
  void *v17;
  id v18;
  NSObject *v19;
  __CFString *v20;
  __CFString *v21;
  id *v22;
  uint64_t *v23;
  __objc2_class *v24;
  __CFString *v25;
  SecDbItem *v26;
  SecDbItem *v27;
  void *v28;
  SecDbItem *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  id *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[4];
  __CFString *v46;
  __int16 v47;
  SecDbItem *v48;

  v11 = a4;
  v12 = a5;
  v13 = (__objc2_class *)a6;
  if (a3)
  {
    v14 = sub_10000C1D0(a3, kSecAttrAccessible);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if ((objc_msgSend(v15, "isEqualToString:", kSecAttrAccessibleWhenUnlocked) & 1) != 0)
    {
      v16 = &off_1002EA910;
    }
    else
    {
      if ((objc_msgSend(v15, "isEqualToString:", kSecAttrAccessibleAlwaysPrivate) & 1) == 0
        && (objc_msgSend(v15, "isEqualToString:", kSecAttrAccessibleAfterFirstUnlock) & 1) == 0)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("can't pick key class for protection %@"), v15));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 17, v36));

        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
        v38 = sub_10000BDF4(CFSTR("ckks-key"), v37);
        v39 = objc_claimAutoreleasedReturnValue(v38);

        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412547;
          v46 = v21;
          v47 = 2113;
          v48 = a3;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "can't pick key class: %@ %{private}@", buf, 0x16u);
        }

        if (a7)
        {
          v21 = objc_retainAutorelease(v21);
          v20 = 0;
          *a7 = v21;
        }
        else
        {
          v20 = 0;
        }
        goto LABEL_34;
      }
      v16 = &off_1002EAAF8;
    }
    v41 = a7;
    v21 = *v16;
    if (v13)
    {
      v44 = 0;
      v22 = (id *)&v44;
      v23 = &v44;
      v24 = v13;
    }
    else
    {
      v24 = CKKSKey;
      v43 = 0;
      v22 = (id *)&v43;
      v23 = &v43;
    }
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__objc2_class currentKeyForClass:contextID:zoneID:error:](v24, "currentKeyForClass:contextID:zoneID:error:", v21, v11, v12, v23));
    v26 = (SecDbItem *)*v22;
    v27 = v26;
    if (!v25 || v26)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
      v31 = sub_10000BDF4(CFSTR("ckks-key"), v30);
      v32 = objc_claimAutoreleasedReturnValue(v31);

      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v46 = v21;
        v47 = 2112;
        v48 = v27;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Couldn't find current key for %@: %@", buf, 0x16u);
      }

      v20 = 0;
      if (v41)
        *v41 = objc_retainAutorelease(v27);
    }
    else
    {
      v42 = 0;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString ensureKeyLoadedForContextID:error:](v25, "ensureKeyLoadedForContextID:error:", v11, &v42));
      v29 = (SecDbItem *)v42;

      if (v28)
      {
        v20 = v25;
      }
      else
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
        v34 = sub_10000BDF4(CFSTR("ckks-key"), v33);
        v35 = objc_claimAutoreleasedReturnValue(v34);

        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v46 = v25;
          v47 = 2112;
          v48 = v29;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Couldn't load key(%@): %@", buf, 0x16u);
        }

        v20 = 0;
        if (v41)
          *v41 = objc_retainAutorelease(v29);
      }

    }
LABEL_34:

    goto LABEL_35;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
  v18 = sub_10000BDF4(CFSTR("ckks-key"), v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);

  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Cannot select a key for no item!", buf, 2u);
  }

  v20 = 0;
  if (a7)
    *a7 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 57, CFSTR("can't pick a key class for an empty item")));
LABEL_35:

  return v20;
}

+ (id)withItem:(SecDbItem *)a3 action:(id)a4 contextID:(id)a5 zoneID:(id)a6 keyCache:(id)a7 error:(id *)a8
{
  SecDbItem *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  __CFDictionary *v24;
  SecDbItem *v25;
  SecDbItem *v26;
  __CFString *v27;
  uint64_t v28;
  SecDbItem *v29;
  void *v30;
  id v31;
  NSObject *v32;
  const char *v33;
  __CFString *v34;
  void *v35;
  id v36;
  NSObject *v37;
  const char *v38;
  CFIndex Code;
  __CFString *v40;
  void *v41;
  id v42;
  CKKSOutgoingQueueEntry *v43;
  void *v44;
  id v45;
  __CFString *v47;
  __CFError *v48;
  uint64_t v49;
  void *v50;
  id v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  unsigned int v56;
  __CFString *v57;
  const __CFString *v58;
  __CFString *v59;
  CFIndex v60;
  __CFString *v61;
  void *v62;
  id v63;
  NSObject *v64;
  void *v65;
  id v66;
  NSObject *v67;
  os_log_t v68;
  unsigned int v69;
  __CFString *v70;
  unsigned int v71;
  __CFString *v72;
  __CFString *v73;
  void *v74;
  void *v75;
  SecDbItem *v76;
  void *v77;
  id v78;
  NSObject *v79;
  id v80;
  void *v81;
  id v82;
  NSObject *v83;
  void *v84;
  id v85;
  NSObject *v86;
  __CFString *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  CKKSItem *v91;
  void *v92;
  CKKSItem *v93;
  void *v94;
  SecDbItem *v95;
  void *v96;
  SecDbItem *v97;
  BOOL v98;
  void *v99;
  id v100;
  void *v101;
  id v102;
  NSObject *v103;
  void *v104;
  id v105;
  NSObject *v106;
  NSObject *v107;
  _BOOL4 v108;
  void *v109;
  void *v110;
  id v111;
  NSObject *v112;
  NSObject *oslog;
  SecDbItem *v114;
  SecDbItem *v115;
  SecDbItem *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  CKKSItem *v120;
  id v121;
  SecDbItem *v122;
  os_log_t v123;
  os_log_t v124;
  id v125;
  void *v126;
  void *v127;
  SecDbItem *v128;
  void *v129;
  os_log_t log;
  os_log_t loga;
  void *v132;
  __CFString *v133;
  void *v134;
  SecDbItem *v135;
  id v136;
  __CFString *v137;
  SecDbItem *v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  __CFString *v144;
  uint8_t buf[4];
  SecDbItem *v146;
  __int16 v147;
  SecDbItem *v148;
  __int16 v149;
  SecDbItem *v150;

  v14 = (SecDbItem *)a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v144 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneName"));
  v19 = sub_10000BDF4(CFSTR("ckksitem"), v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);

  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412547;
    v146 = v14;
    v147 = 2113;
    v148 = a3;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Creating a (%@) outgoing queue entry for: %{private}@", buf, 0x16u);
  }

  v143 = 0;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "keyForItem:contextID:zoneID:keyCache:error:", a3, v15, v16, v17, &v143));
  v22 = v143;
  v23 = v22;
  v138 = v14;
  if (!v21 || v22)
  {
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("CKKSErrorDomain"), objc_msgSend(v22, "code"), CFSTR("No key for item"), v22));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneName"));
    v36 = sub_10000BDF4(CFSTR("ckksitem"), v35);
    v37 = objc_claimAutoreleasedReturnValue(v36);

    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412547;
      v146 = (SecDbItem *)v34;
      v147 = 2113;
      v148 = a3;
      v38 = "no key for item: %@ %{private}@";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, v38, buf, 0x16u);
    }
LABEL_16:

    if (a8)
    {
      v34 = objc_retainAutorelease(v34);
      v26 = 0;
      v43 = 0;
      *a8 = v34;
      goto LABEL_27;
    }
    v26 = 0;
    goto LABEL_19;
  }
  v24 = sub_10001904C(a3, 0x10000, 0, &v144);
  if (!v24)
  {
    Code = CFErrorGetCode((CFErrorRef)v144);
    v40 = v144;
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("CKKSErrorDomain"), Code, CFSTR("Couldn't create object plist"), v144));

    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneName"));
    v42 = sub_10000BDF4(CFSTR("ckksitem"), v41);
    v37 = objc_claimAutoreleasedReturnValue(v42);

    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412547;
      v146 = (SecDbItem *)v34;
      v147 = 2113;
      v148 = a3;
      v38 = "no plist: %@ %{private}@";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  v137 = (__CFString *)v24;
  -[__CFDictionary setObject:forKey:](v24, "setObject:forKey:", a3->var1->var0, kSecClass);
  v25 = (SecDbItem *)sub_100019204(a3, (uint64_t)&off_1002E9538, &v144);
  v26 = v25;
  v136 = v15;
  if (v25)
  {
    CFRetain(v25);
    v27 = v144;
    if (!v144)
    {
      v28 = objc_opt_class(NSNull);
      if ((objc_opt_isKindOfClass(v26, v28) & 1) != 0)
      {
        v29 = (SecDbItem *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("CKKSErrorDomain"), 15, CFSTR("UUID not found in object"), 0));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneName"));
        v31 = sub_10000BDF4(CFSTR("ckksitem"), v30);
        v32 = objc_claimAutoreleasedReturnValue(v31);

        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412547;
          v146 = v29;
          v147 = 2113;
          v148 = a3;
          v33 = "couldn't fetch UUID: %@ %{private}@";
LABEL_23:
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, v33, buf, 0x16u);
          goto LABEL_24;
        }
        goto LABEL_24;
      }
      v47 = (__CFString *)sub_100019204(a3, (uint64_t)&off_1002E94E8, &v144);
      v34 = v47;
      if (v47)
      {
        CFRetain(v47);
        v48 = (__CFError *)v144;
        if (!v144)
        {
          v49 = objc_opt_class(NSNull);
          if ((objc_opt_isKindOfClass(v34, v49) & 1) != 0)
          {
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneName"));
            v51 = sub_10000BDF4(CFSTR("ckksitem"), v50);
            v52 = objc_claimAutoreleasedReturnValue(v51);

            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138477827;
              v146 = a3;
              _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "couldn't fetch accessgroup: %{private}@", buf, 0xCu);
            }

            v34 = CFSTR("no-group");
            v15 = v136;
          }
          v134 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSMirrorEntry tryFromDatabase:contextID:zoneID:error:](CKKSMirrorEntry, "tryFromDatabase:contextID:zoneID:error:", v26, v15, v16, a8));
          v133 = v138;
          v142 = 0;
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSOutgoingQueueEntry tryFromDatabase:state:contextID:zoneID:error:](CKKSOutgoingQueueEntry, "tryFromDatabase:state:contextID:zoneID:error:", v26, CFSTR("new"), v15, v16, &v142));
          v54 = v142;
          v132 = v53;
          if (v53)
          {
            v123 = v54;
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "action"));
            v56 = objc_msgSend(v55, "isEqual:", CFSTR("add"));

            v57 = v133;
            v58 = v133;
            if (v56)
            {
              if (-[__CFString isEqual:](v133, "isEqual:", CFSTR("modify")))
              {
                v59 = CFSTR("add");

                v58 = CFSTR("add");
              }
              else
              {
                v69 = -[__CFString isEqual:](v133, "isEqual:", CFSTR("delete"));
                v58 = v133;
                if (v69)
                {
                  v58 = v133;
                  if (!v134)
                  {
                    objc_msgSend(v132, "deleteFromDatabase:", a8);
                    goto LABEL_76;
                  }
                }
              }
            }
            v133 = (__CFString *)v58;
            v70 = v57;
            v68 = (os_log_t)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "action"));
            if (-[NSObject isEqual:](v68, "isEqual:", CFSTR("delete")))
            {
              v71 = -[__CFString isEqual:](v70, "isEqual:", CFSTR("add"));

              if (!v71)
              {
                v72 = v133;
LABEL_56:
                if (!v134)
                {
                  v133 = v72;
                  v121 = 0;
                  goto LABEL_80;
                }
                goto LABEL_57;
              }
              v72 = CFSTR("modify");
              v73 = CFSTR("modify");
              v68 = (os_log_t)v133;
LABEL_55:

              goto LABEL_56;
            }
          }
          else
          {
            if (!v54)
            {
              if (!v134)
              {
                if (-[__CFString isEqualToString:](v133, "isEqualToString:", CFSTR("delete")))
                {
                  v141 = 0;
                  v128 = (SecDbItem *)objc_claimAutoreleasedReturnValue(+[CKKSOutgoingQueueEntry tryFromDatabase:contextID:zoneID:error:](CKKSOutgoingQueueEntry, "tryFromDatabase:contextID:zoneID:error:", v26, v15, v16, &v141));
                  v123 = (os_log_t)v141;
                  if (v123)
                  {
                    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneName"));
                    v82 = sub_10000BDF4(CFSTR("ckksitem"), v81);
                    v83 = objc_claimAutoreleasedReturnValue(v82);

                    log = v83;
                    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      v146 = (SecDbItem *)v123;
                      _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "Unable to fetch an existing OQE (any state) due to error: %@", buf, 0xCu);
                    }
                    v80 = 0;
                    goto LABEL_78;
                  }
                  if (v128)
                  {
                    v123 = 0;
                    v80 = 0;
                    goto LABEL_79;
                  }
                  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneName"));
                  v111 = sub_10000BDF4(CFSTR("ckksitem"), v110);
                  v112 = objc_claimAutoreleasedReturnValue(v111);

                  v123 = v112;
                  if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v146 = v26;
                    _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_ERROR, "Asked to delete a record for which we don't have a CKME or any OQE, ignoring: %@", buf, 0xCu);
                  }
                  goto LABEL_76;
                }
                v121 = 0;
                v123 = 0;
LABEL_80:
                v88 = kSecAttrPCSPlaintextServiceIdentifier;
                v126 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v137, "objectForKeyedSubscript:", kSecAttrPCSPlaintextServiceIdentifier));
                -[__CFString setObject:forKeyedSubscript:](v137, "setObject:forKeyedSubscript:", 0, v88);
                v89 = kSecAttrPCSPlaintextPublicKey;
                loga = (os_log_t)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v137, "objectForKeyedSubscript:", kSecAttrPCSPlaintextPublicKey));
                -[__CFString setObject:forKeyedSubscript:](v137, "setObject:forKeyedSubscript:", 0, v89);
                v90 = kSecAttrPCSPlaintextPublicIdentity;
                v129 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v137, "objectForKeyedSubscript:", kSecAttrPCSPlaintextPublicIdentity));
                -[__CFString setObject:forKeyedSubscript:](v137, "setObject:forKeyedSubscript:", 0, v90);
                v91 = [CKKSItem alloc];
                v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "uuid"));
                v93 = -[CKKSItem initWithUUID:parentKeyUUID:contextID:zoneID:encodedCKRecord:encItem:wrappedkey:generationCount:encver:plaintextPCSServiceIdentifier:plaintextPCSPublicKey:plaintextPCSPublicIdentity:](v91, "initWithUUID:parentKeyUUID:contextID:zoneID:encodedCKRecord:encItem:wrappedkey:generationCount:encver:plaintextPCSServiceIdentifier:plaintextPCSPublicKey:plaintextPCSPublicIdentity:", v26, v92, v136, v16, 0, 0, 0, v121, 2, v126, loga, v129);

                v120 = v93;
                if (!v93)
                {
                  v122 = (SecDbItem *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("CKKSErrorDomain"), 16, CFSTR("Couldn't create an item"), 0));
                  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneName"));
                  v102 = sub_10000BDF4(CFSTR("ckksitem"), v101);
                  v103 = objc_claimAutoreleasedReturnValue(v102);

                  if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412547;
                    v146 = v122;
                    v147 = 2113;
                    v148 = a3;
                    _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_ERROR, "couldn't create an item: %@ %{private}@", buf, 0x16u);
                  }

                  v15 = v136;
                  v43 = 0;
                  if (a8)
                  {
                    v122 = objc_retainAutorelease(v122);
                    *a8 = v122;
                  }
                  v87 = v137;
                  goto LABEL_102;
                }
                v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "item"));
                v139 = 0;
                v94 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSItemEncrypter encryptCKKSItem:dataDictionary:updatingCKKSItem:parentkey:keyCache:error:](CKKSItemEncrypter, "encryptCKKSItem:dataDictionary:updatingCKKSItem:parentkey:keyCache:error:", v93, v137, v118, v21, v17, &v139));
                v95 = (SecDbItem *)v139;

                v119 = v94;
                v122 = v95;
                if (!v94 || v95)
                {
                  v116 = (SecDbItem *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("CKKSErrorDomain"), -[SecDbItem code](v95, "code"), CFSTR("Couldn't encrypt item"), v95));
                  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneName"));
                  v105 = sub_10000BDF4(CFSTR("ckksitem"), v104);
                  v106 = objc_claimAutoreleasedReturnValue(v105);

                  v107 = v106;
                  v108 = os_log_type_enabled(v106, OS_LOG_TYPE_ERROR);
                  v15 = v136;
                  if (v108)
                  {
                    *(_DWORD *)buf = 138412547;
                    v146 = v116;
                    v147 = 2113;
                    v148 = a3;
                    _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_ERROR, "couldn't encrypt item: %@ %{private}@", buf, 0x16u);
                  }

                  if (a8)
                    *a8 = objc_retainAutorelease(v116);

                  v43 = 0;
                  v87 = v137;
                }
                else
                {
                  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "encitem"));
                  v97 = (SecDbItem *)objc_msgSend(v96, "length");

                  v114 = v97;
                  v98 = (unint64_t)v97 >= 0x100000;
                  v15 = v136;
                  if (!v98)
                  {
                    v109 = v119;
                    v43 = -[CKKSOutgoingQueueEntry initWithCKKSItem:action:state:waitUntil:accessGroup:]([CKKSOutgoingQueueEntry alloc], "initWithCKKSItem:action:state:waitUntil:accessGroup:", v119, v133, CFSTR("new"), 0, v34);
                    v87 = v137;
LABEL_100:

LABEL_102:
                    goto LABEL_103;
                  }
                  v115 = (SecDbItem *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 65, CFSTR("Object size too large")));
                  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneName"));
                  v100 = sub_10000BDF4(CFSTR("ckksitem"), v99);
                  oslog = objc_claimAutoreleasedReturnValue(v100);

                  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218499;
                    v146 = v114;
                    v147 = 2112;
                    v148 = v115;
                    v149 = 2113;
                    v150 = a3;
                    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Object Size (%lu bytes) too large: %@ %{private}@", buf, 0x20u);
                  }

                  v87 = v137;
                  if (a8)
                    *a8 = objc_retainAutorelease(v115);

                  v43 = 0;
                }
                v109 = v119;
                goto LABEL_100;
              }
              v123 = 0;
              v72 = v133;
LABEL_57:
              v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "item"));
              v121 = objc_msgSend(v74, "generationCount");

              v133 = v72;
              if (!v132 && -[__CFString isEqualToString:](v72, "isEqualToString:", CFSTR("modify")))
              {
                v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "item"));
                v140 = 0;
                v75 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSItemEncrypter decryptItemToDictionary:keyCache:error:](CKKSItemEncrypter, "decryptItemToDictionary:keyCache:error:", v127, v17, &v140));
                v76 = (SecDbItem *)v140;
                log = (os_log_t)objc_msgSend(v75, "mutableCopy");

                v125 = -[__CFString mutableCopy](v137, "mutableCopy");
                v128 = v76;
                if (v76)
                {
                  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneName"));
                  v78 = sub_10000BDF4(CFSTR("ckksitem"), v77);
                  v79 = objc_claimAutoreleasedReturnValue(v78);

                  if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v146 = v128;
                    _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "Unable to decrypt current CKME: %@", buf, 0xCu);
                  }

                  v80 = v121;
                  goto LABEL_77;
                }
                -[NSObject setObject:forKeyedSubscript:](log, "setObject:forKeyedSubscript:", 0);
                v117 = kSecAttrSHA1;
                -[NSObject setObject:forKeyedSubscript:](log, "setObject:forKeyedSubscript:", 0);
                objc_msgSend(v125, "setObject:forKeyedSubscript:", 0, kSecAttrModificationDate);
                objc_msgSend(v125, "setObject:forKeyedSubscript:", 0, v117);
                v80 = v121;
                if (!-[NSObject isEqualToDictionary:](log, "isEqualToDictionary:", v125))
                {
LABEL_77:

LABEL_78:
LABEL_79:
                  v121 = v80;

                  goto LABEL_80;
                }
                v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneName"));
                v85 = sub_10000BDF4(CFSTR("ckksitem"), v84);
                v86 = objc_claimAutoreleasedReturnValue(v85);

                if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v146 = v26;
                  _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "Update to item only changes mdat; skipping %@",
                    buf,
                    0xCu);
                }

LABEL_76:
                v43 = 0;
                v15 = v136;
                v87 = v137;
LABEL_103:

                goto LABEL_27;
              }
              goto LABEL_80;
            }
            v124 = v54;
            v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneName"));
            v66 = sub_10000BDF4(CFSTR("ckksitem"), v65);
            v67 = objc_claimAutoreleasedReturnValue(v66);

            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v146 = (SecDbItem *)v124;
              _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "Unable to fetch an existing OQE due to error: %@", buf, 0xCu);
            }

            v68 = v124;
            v123 = 0;
          }
          v72 = v133;
          goto LABEL_55;
        }
      }
      else
      {
        v48 = (__CFError *)v144;
      }
      v60 = CFErrorGetCode(v48);
      v61 = v144;
      v135 = (SecDbItem *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("CKKSErrorDomain"), v60, CFSTR("accessgroup not found in object"), v144));

      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneName"));
      v63 = sub_10000BDF4(CFSTR("ckksitem"), v62);
      v64 = objc_claimAutoreleasedReturnValue(v63);

      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412547;
        v146 = v135;
        v147 = 2113;
        v148 = a3;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "couldn't fetch access group from item: %@ %{private}@", buf, 0x16u);
      }

      v15 = v136;
      if (a8)
        *a8 = objc_retainAutorelease(v135);

LABEL_19:
      v43 = 0;
      goto LABEL_27;
    }
  }
  else
  {
    v27 = v144;
  }
  v29 = (SecDbItem *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("CKKSErrorDomain"), 15, CFSTR("No UUID for item"), v27));

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneName"));
  v45 = sub_10000BDF4(CFSTR("ckksitem"), v44);
  v32 = objc_claimAutoreleasedReturnValue(v45);

  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412547;
    v146 = v29;
    v147 = 2113;
    v148 = a3;
    v33 = "No UUID for item: %@ %{private}@";
    goto LABEL_23;
  }
LABEL_24:

  v15 = v136;
  if (a8)
    *a8 = objc_retainAutorelease(v29);

  v43 = 0;
  v34 = v137;
LABEL_27:

  return v43;
}

+ (id)fromDatabase:(id)a3 state:(id)a4 contextID:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v35[4];
  _QWORD v36[4];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v35[0] = CFSTR("contextID");
  v14 = v12;
  v15 = v14;
  if (v14)
    v16 = v14;
  else
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v17 = v16;

  v36[0] = v17;
  v35[1] = CFSTR("UUID");
  v18 = v10;
  v19 = v18;
  if (v18)
    v20 = v18;
  else
    v20 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v21 = v20;

  v36[1] = v21;
  v35[2] = CFSTR("state");
  v22 = v11;
  v23 = v22;
  if (v22)
    v24 = v22;
  else
    v24 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v25 = v24;

  v36[2] = v25;
  v35[3] = CFSTR("ckzone");
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneName"));
  v27 = v26;
  if (v26)
    v28 = v26;
  else
    v28 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v29 = v28;

  v36[3] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 4));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fromDatabaseWhere:error:", v30, a7));

  return v31;
}

+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[3];
  _QWORD v29[3];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v28[0] = CFSTR("contextID");
  v13 = v11;
  v14 = v13;
  if (v13)
    v15 = v13;
  else
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v16 = v15;

  v29[0] = v16;
  v28[1] = CFSTR("UUID");
  v17 = v10;
  v18 = v17;
  if (v17)
    v19 = v17;
  else
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v20 = v19;

  v29[1] = v20;
  v28[2] = CFSTR("ckzone");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
  v22 = v21;
  if (v21)
    v23 = v21;
  else
    v23 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v24 = v23;

  v29[2] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 3));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tryFromDatabaseWhere:error:", v25, a6));

  return v26;
}

+ (id)tryFromDatabase:(id)a3 state:(id)a4 contextID:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v35[4];
  _QWORD v36[4];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v35[0] = CFSTR("contextID");
  v14 = v12;
  v15 = v14;
  if (v14)
    v16 = v14;
  else
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v17 = v16;

  v36[0] = v17;
  v35[1] = CFSTR("UUID");
  v18 = v10;
  v19 = v18;
  if (v18)
    v20 = v18;
  else
    v20 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v21 = v20;

  v36[1] = v21;
  v35[2] = CFSTR("state");
  v22 = v11;
  v23 = v22;
  if (v22)
    v24 = v22;
  else
    v24 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v25 = v24;

  v36[2] = v25;
  v35[3] = CFSTR("ckzone");
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneName"));
  v27 = v26;
  if (v26)
    v28 = v26;
  else
    v28 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v29 = v28;

  v36[3] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 4));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tryFromDatabaseWhere:error:", v30, a7));

  return v31;
}

+ (id)fetch:(int64_t)a3 state:(id)a4 contextID:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  CKKSSQLWhereNullOrValue *v25;
  void *v26;
  void *v27;
  CKKSSQLWhereNullOrValue *v28;
  void *v29;
  void *v30;
  void *v32;
  _QWORD v35[4];
  _QWORD v36[4];

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc_init((Class)NSISO8601DateFormatter);
  v35[0] = CFSTR("contextID");
  v14 = v11;
  v15 = v14;
  if (v14)
    v16 = v14;
  else
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v17 = v16;

  v36[0] = v17;
  v35[1] = CFSTR("state");
  v18 = v10;
  v19 = v18;
  if (v18)
    v20 = v18;
  else
    v20 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v21 = v20;

  v36[1] = v21;
  v35[2] = CFSTR("ckzone");
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));

  v32 = v17;
  if (v22)
    v23 = v22;
  else
    v23 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null", v17));
  v24 = v23;

  v36[2] = v24;
  v35[3] = CFSTR("waituntil");
  v25 = [CKKSSQLWhereNullOrValue alloc];
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringFromDate:", v26));
  v28 = -[CKKSSQLWhereValue initWithOperation:value:](v25, "initWithOperation:value:", 4, v27);
  v36[3] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 4));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetch:where:error:", a3, v29, a7));

  return v30;
}

+ (id)allInState:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[3];
  _QWORD v29[3];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v28[0] = CFSTR("contextID");
  v13 = v11;
  v14 = v13;
  if (v13)
    v15 = v13;
  else
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v16 = v15;

  v29[0] = v16;
  v28[1] = CFSTR("state");
  v17 = v10;
  v18 = v17;
  if (v17)
    v19 = v17;
  else
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v20 = v19;

  v29[1] = v20;
  v28[2] = CFSTR("ckzone");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
  v22 = v21;
  if (v21)
    v23 = v21;
  else
    v23 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v24 = v23;

  v29[2] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 3));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "allWhere:error:", v25, a6));

  return v26;
}

+ (id)allWithUUID:(id)a3 states:(id)a4 contextID:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  CKKSSQLWhereIn *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v32[4];
  _QWORD v33[4];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v32[0] = CFSTR("contextID");
  v14 = v12;
  v15 = v14;
  if (v14)
    v16 = v14;
  else
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v17 = v16;

  v33[0] = v17;
  v32[1] = CFSTR("UUID");
  v18 = v10;
  v19 = v18;
  if (v18)
    v20 = v18;
  else
    v20 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v21 = v20;

  v33[1] = v21;
  v32[2] = CFSTR("state");
  v22 = -[CKKSSQLWhereIn initWithValues:]([CKKSSQLWhereIn alloc], "initWithValues:", v11);
  v33[2] = v22;
  v32[3] = CFSTR("ckzone");
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneName"));
  v24 = v23;
  if (v23)
    v25 = v23;
  else
    v25 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v26 = v25;

  v33[3] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 4));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "allWhere:error:", v27, a7));

  return v28;
}

+ (id)sqlTable
{
  return CFSTR("outgoingqueue");
}

+ (id)sqlColumns
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSItem sqlColumns](CKKSItem, "sqlColumns"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "arrayByAddingObjectsFromArray:", &off_10030B528));

  return v3;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3;
  CKKSOutgoingQueueEntry *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CKKSOutgoingQueueEntry *v14;

  v3 = a3;
  v4 = [CKKSOutgoingQueueEntry alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSItem fromDatabaseRow:](CKKSItem, "fromDatabaseRow:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("action")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("state")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asString"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("waituntil")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "asISO8601Date"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accessgroup")));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "asString"));
  v14 = -[CKKSOutgoingQueueEntry initWithCKKSItem:action:state:waitUntil:accessGroup:](v4, "initWithCKKSItem:action:state:waitUntil:accessGroup:", v5, v7, v9, v11, v13);

  return v14;
}

+ (id)countsByStateWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[2];
  _QWORD v26[2];

  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init((Class)NSMutableDictionary);
  v11 = objc_msgSend((id)objc_opt_class(a1), "sqlTable");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v25[0] = CFSTR("contextID");
  v13 = v8;
  v14 = v13;
  if (v13)
    v15 = v13;
  else
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v16 = v15;

  v25[1] = CFSTR("ckzone");
  v26[0] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));

  if (v17)
    v18 = v17;
  else
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v19 = v18;

  v26[1] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 2));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10007600C;
  v23[3] = &unk_1002DE3E0;
  v21 = v10;
  v24 = v21;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:](CKKSSQLDatabaseObject, "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:", v12, v20, &off_10030B540, &off_10030B558, 0, -1, v23, a5);

  return v21;
}

+ (int64_t)countByState:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  int64_t v24;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[3];
  _QWORD v32[3];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = -1;
  v13 = objc_msgSend((id)objc_opt_class(a1), "sqlTable");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v31[0] = CFSTR("contextID");
  v15 = v11;
  v16 = v15;
  if (v15)
    v17 = v15;
  else
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v18 = v17;

  v32[0] = v18;
  v31[1] = CFSTR("ckzone");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
  v20 = v19;
  if (v19)
    v21 = v19;
  else
    v21 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v22 = v21;

  v31[2] = CFSTR("state");
  v32[1] = v22;
  v32[2] = v10;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 3));
  v26[1] = 3221225472;
  v26[2] = sub_100075FBC;
  v26[3] = &unk_1002E9DF8;
  v26[4] = &v27;
  v26[0] = _NSConcreteStackBlock;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:](CKKSSQLDatabaseObject, "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:", v14, v23, &off_10030B570, 0, 0, -1, v26, a6);

  v24 = v28[3];
  _Block_object_dispose(&v27, 8);

  return v24;
}

@end
