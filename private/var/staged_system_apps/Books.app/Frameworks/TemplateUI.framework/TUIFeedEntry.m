@implementation TUIFeedEntry

+ (id)feedEntryFromDictionary:(id)a3
{
  id v3;
  TUIFeedEntry *v4;

  v3 = a3;
  v4 = -[TUIFeedEntry initWithDictionary:]([TUIFeedEntry alloc], "initWithDictionary:", v3);

  return v4;
}

+ (id)feedEntryFromTemplateURL:(id)a3 data:(id)a4 behaviors:(id)a5
{
  id v7;
  id v8;
  id v9;
  TUIFeedEntry *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(TUIFeedEntry);
  -[TUIFeedEntry setTemplateURL:](v10, "setTemplateURL:", v9);

  -[TUIFeedEntry setData:](v10, "setData:", v8);
  -[TUIFeedEntry setBehaviors:](v10, "setBehaviors:", v7);

  return v10;
}

+ (id)defaultStackNames
{
  return objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", CFSTR("default"), 0);
}

- (TUIFeedEntry)init
{
  return -[TUIFeedEntry initWithDictionary:](self, "initWithDictionary:", 0);
}

- (TUIFeedEntry)initWithDictionary:(id)a3
{
  id v4;
  TUIFeedEntry *v5;
  NSUUID *v6;
  NSUUID *uuid;
  TUIIdentifierMap *v8;
  TUIIdentifierMap *identifierMap;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSSet *stackNames;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TUIFeedEntry;
  v5 = -[TUIFeedEntry init](&v15, "init");
  if (v5)
  {
    v6 = (NSUUID *)objc_alloc_init((Class)NSUUID);
    uuid = v5->_uuid;
    v5->_uuid = v6;

    v8 = -[TUIIdentifierMap initWithUUID:]([TUIIdentifierMap alloc], "initWithUUID:", v5->_uuid);
    identifierMap = v5->_identifierMap;
    v5->_identifierMap = v8;

    v11 = objc_msgSend((id)objc_opt_class(v5, v10), "defaultStackNames");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    stackNames = v5->_stackNames;
    v5->_stackNames = (NSSet *)v12;

    v5->_stackNamesLock._os_unfair_lock_opaque = 0;
    -[TUIFeedEntry setDictionary:](v5, "setDictionary:", v4);
  }

  return v5;
}

- (void)setDictionary:(id)a3
{
  NSDictionary *v5;
  NSDictionary *dictionary;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSURL *v13;
  NSURL *v14;
  NSURL *templateURL;
  uint64_t v16;
  id v17;
  NSURL *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  float v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  TUIFeedData *v29;
  TUIFeedData *data;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  TUIFeedBehaviors *v35;
  TUIFeedBehaviors *behaviors;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  uint64_t v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];

  v5 = (NSDictionary *)a3;
  dictionary = self->_dictionary;
  if (dictionary != v5 && (-[NSDictionary isEqual:](dictionary, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_dictionary, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("template")));
    if (v8)
    {
      v9 = objc_opt_class(NSString, v7);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        v11 = objc_opt_class(NSString, v10);
        v12 = TUIDynamicCast(v11, v8);
        v13 = (NSURL *)objc_claimAutoreleasedReturnValue(v12);
        v14 = (NSURL *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v13));
        templateURL = self->_templateURL;
        self->_templateURL = v14;

      }
      else
      {
        v16 = objc_opt_class(NSURL, v10);
        v17 = TUIDynamicCast(v16, v8);
        v18 = (NSURL *)objc_claimAutoreleasedReturnValue(v17);
        v13 = self->_templateURL;
        self->_templateURL = v18;
      }

      if (!self->_templateURL)
      {
        v19 = TUIDefaultLog();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          sub_17D688((uint64_t)v8, v20);

      }
    }
    v21 = objc_opt_class(NSNumber, v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("load-delay")));
    v23 = TUIDynamicCast(v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    objc_msgSend(v24, "floatValue");
    self->_loadDelay = v25;

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("data")));
    v28 = objc_opt_class(NSDictionary, v27);
    if ((objc_opt_isKindOfClass(v26, v28) & 1) != 0)
    {
      v29 = (TUIFeedData *)objc_claimAutoreleasedReturnValue(+[TUIFeedData feedDataWithDictionary:](TUIFeedData, "feedDataWithDictionary:", v26));
      data = self->_data;
      self->_data = v29;

    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("behaviors")));

    v33 = objc_opt_class(NSDictionary, v32);
    if ((objc_opt_isKindOfClass(v31, v33) & 1) != 0)
    {
      v35 = (TUIFeedBehaviors *)objc_claimAutoreleasedReturnValue(+[TUIFeedBehaviors feedBehaviorsWithDictionary:](TUIFeedBehaviors, "feedBehaviorsWithDictionary:", v31));
      behaviors = self->_behaviors;
      self->_behaviors = v35;

    }
    v37 = objc_opt_class(NSArray, v34);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("stackNames")));
    v39 = TUIDynamicCast(v37, v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);

    if (objc_msgSend(v40, "count"))
    {
      v58 = v31;
      v59 = v8;
      v42 = objc_alloc_init((Class)NSMutableSet);
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v57 = v40;
      v43 = v40;
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
      if (v44)
      {
        v46 = v44;
        v47 = *(_QWORD *)v61;
        do
        {
          v48 = 0;
          do
          {
            if (*(_QWORD *)v61 != v47)
              objc_enumerationMutation(v43);
            v49 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)v48);
            v50 = objc_opt_class(NSString, v45);
            v51 = TUIDynamicCast(v50, v49);
            v52 = (void *)objc_claimAutoreleasedReturnValue(v51);

            if (v52)
              objc_msgSend(v42, "addObject:", v49);
            v48 = (char *)v48 + 1;
          }
          while (v46 != v48);
          v46 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
        }
        while (v46);
      }

      if (objc_msgSend(v42, "count"))
        -[TUIFeedEntry setStackNames:](self, "setStackNames:", v42);
      v31 = v58;
      v8 = v59;
      v40 = v57;
    }
    else
    {
      v53 = objc_opt_class(NSString, v41);
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("stackName")));
      v55 = TUIDynamicCast(v53, v54);
      v42 = (id)objc_claimAutoreleasedReturnValue(v55);

      if (objc_msgSend(v42, "length"))
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v42));
        -[TUIFeedEntry setStackNames:](self, "setStackNames:", v56);

      }
    }

  }
}

- (NSString)uid
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedEntry dictionary](self, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("entryID")));
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_uuid, "UUIDString"));
  v7 = v6;

  return (NSString *)v7;
}

- (id)requestDataWithPriority:(float)a3 block:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v6 = a4;
  if (!v6)
    goto LABEL_5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedEntry delegate](self, "delegate"));

  if (!v7)
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedEntry delegate](self, "delegate"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_58528;
  v12[3] = &unk_23F008;
  objc_copyWeak(&v14, &location);
  v13 = v6;
  *(float *)&v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "feedEntry:requestDataWithPriority:block:", self, v12, v9));

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
LABEL_6:

  return v10;
}

- (BOOL)handleBehaviorWithName:(id)a3 arguments:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  void *v15;
  unsigned __int8 v16;
  int v18;
  id v19;
  __int16 v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedBehaviors behaviorWithName:](self->_behaviors, "behaviorWithName:", v6));
  if (v8
    && (v9 = objc_claimAutoreleasedReturnValue(-[TUIFeedEntry delegate](self, "delegate"))) != 0
    && (v10 = (void *)v9,
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedEntry delegate](self, "delegate")),
        v12 = objc_opt_respondsToSelector(v11, "feedEntry:handleBehavior:name:arguments:"),
        v11,
        v10,
        (v12 & 1) != 0))
  {
    v13 = TUIDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v18 = 138412546;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Feed handling behavior '%@' : %@", (uint8_t *)&v18, 0x16u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedEntry delegate](self, "delegate"));
    v16 = objc_msgSend(v15, "feedEntry:handleBehavior:name:arguments:", self, v8, v6, v7);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)dragItemForFeedEntry:(id)a3 name:(id)a4 arguments:(id)a5 imageResourceBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v23;
  id v24;
  __int16 v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_claimAutoreleasedReturnValue(-[TUIFeedEntry delegate](self, "delegate"));
  if (v14
    && (v15 = (void *)v14,
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedEntry delegate](self, "delegate")),
        v17 = objc_opt_respondsToSelector(v16, "dragItemForFeedEntry:name:arguments:imageResourceBlock:"),
        v16,
        v15,
        (v17 & 1) != 0))
  {
    v18 = TUIDefaultLog();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v23 = 138412546;
      v24 = v11;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Feed handling drag behavior '%@' : %@", (uint8_t *)&v23, 0x16u);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedEntry delegate](self, "delegate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dragItemForFeedEntry:name:arguments:imageResourceBlock:", v10, v11, v12, v13));

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)performDropWithSession:(id)a3 behavior:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[TUIFeedEntry delegate](self, "delegate"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedEntry delegate](self, "delegate"));
    v11 = objc_opt_respondsToSelector(v10, "performDropWithSession:behavior:");

    if ((v11 & 1) != 0)
    {
      v12 = TUIDefaultLog();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v7;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Feed handling drop behavior '%@", (uint8_t *)&v15, 0xCu);
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedEntry delegate](self, "delegate"));
      objc_msgSend(v14, "performDropWithSession:behavior:", v6, v7);

    }
  }

}

- (BOOL)canHandleDropSession:(id)a3 behavior:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  unsigned __int8 v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[TUIFeedEntry delegate](self, "delegate"));
  if (v8
    && (v9 = (void *)v8,
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedEntry delegate](self, "delegate")),
        v11 = objc_opt_respondsToSelector(v10, "canHandleDropSession:behavior:"),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedEntry delegate](self, "delegate"));
    v13 = objc_msgSend(v12, "canHandleDropSession:behavior:", v6, v7);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedEntry stackNames](self, "stackNames"));
  v5 = objc_msgSend((id)objc_opt_class(self, v4), "defaultStackNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v3, "isEqualToSet:", v6);

  if ((v7 & 1) != 0)
  {
    v9 = &stru_243BF0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", ")));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" stackNames=%@"), v11));

  }
  v12 = (objc_class *)objc_opt_class(self, v8);
  v13 = NSStringFromClass(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedEntry uid](self, "uid"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](self->_templateURL, "lastPathComponent"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p uid=%@ template=%@%@>"), v14, self, v15, v16, v9));

  return v17;
}

- (NSSet)stackNames
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStackNames:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (TUIIdentifierMap)identifierMap
{
  return self->_identifierMap;
}

- (void)setIdentifierMap:(id)a3
{
  objc_storeStrong((id *)&self->_identifierMap, a3);
}

- (NSURL)templateURL
{
  return self->_templateURL;
}

- (void)setTemplateURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (TUIFeedData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (TUIFeedBehaviors)behaviors
{
  return self->_behaviors;
}

- (void)setBehaviors:(id)a3
{
  objc_storeStrong((id *)&self->_behaviors, a3);
}

- (double)loadDelay
{
  return self->_loadDelay;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (TUIFeedEntryDelegate)delegate
{
  return (TUIFeedEntryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_behaviors, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_templateURL, 0);
  objc_storeStrong((id *)&self->_identifierMap, 0);
  objc_storeStrong((id *)&self->_stackNames, 0);
}

@end
