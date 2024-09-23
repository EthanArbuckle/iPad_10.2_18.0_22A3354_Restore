@implementation KTFlags

- (KTFlags)initWithQueue:(id)a3 flags:(id)a4
{
  id v7;
  id v8;
  KTFlags *v9;
  KTFlags *v10;
  uint64_t v11;
  NSMutableSet *flags;
  NSMutableDictionary *v13;
  NSMutableDictionary *flagConditions;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  KTCondition *v21;
  void *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];

  v7 = a3;
  v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)KTFlags;
  v9 = -[KTFlags init](&v29, "init");
  v10 = v9;
  if (v9)
  {
    v24 = v7;
    objc_storeStrong((id *)&v9->_queue, a3);
    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    flags = v10->_flags;
    v10->_flags = (NSMutableSet *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    flagConditions = v10->_flagConditions;
    v10->_flagConditions = v13;

    objc_storeStrong((id *)&v10->_allowableFlags, a4);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v15 = v8;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v19);
          v21 = objc_alloc_init(KTCondition);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTFlags flagConditions](v10, "flagConditions"));
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v20);

          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v17);
    }

    v7 = v24;
  }

  return v10;
}

- (id)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTFlags contentsAsString](self, "contentsAsString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<KTFlags: %@>"), v2));

  return v3;
}

- (id)contentsAsString
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTFlags flags](self, "flags"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTFlags flags](self, "flags"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", CFSTR(",")));

  }
  else
  {
    v7 = CFSTR("none");
  }
  return v7;
}

- (id)dumpFlags
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTFlags flags](self, "flags"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allObjects"));

  return v3;
}

- (BOOL)_onqueueContains:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTFlags queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTFlags flags](self, "flags"));
  LOBYTE(v5) = objc_msgSend(v6, "containsObject:", v4);

  return (char)v5;
}

- (void)_onqueueSetFlag:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTFlags queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[KTFlags flags](self, "flags"));
  objc_msgSend(v6, "addObject:", v4);

}

- (id)conditionForFlag:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTFlags flagConditions](self, "flagConditions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (void)setFlag:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTFlags queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011D590;
  block[3] = &unk_10023B3A8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)_onqueueRemoveFlag:(id)a3
{
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  KTCondition *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTFlags queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTFlags allowableFlags](self, "allowableFlags"));
  v7 = objc_msgSend(v6, "containsObject:", v14);

  if ((v7 & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KTFlags.m"), 72, CFSTR("state machine tried to handle unknown flag %@"), v14);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTFlags flags](self, "flags"));
  objc_msgSend(v8, "removeObject:", v14);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTFlags flagConditions](self, "flagConditions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v14));
  objc_msgSend(v10, "fulfill");

  v11 = objc_alloc_init(KTCondition);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTFlags flagConditions](self, "flagConditions"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v14);

}

- (NSMutableDictionary)flagConditions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFlagConditions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableSet)flags
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFlags:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSSet)allowableFlags
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowableFlags, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_flagConditions, 0);
}

@end
