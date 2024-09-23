@implementation BTAVRCP_VFSFolder

- (BTAVRCP_VFSFolder)initWithName:(id)a3 uid:(unint64_t)a4
{
  id v7;
  BTAVRCP_VFSFolder *v8;
  BTAVRCP_VFSFolder *v9;
  NSMutableSet *v10;
  NSMutableSet *storedPredicates;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BTAVRCP_VFSFolder;
  v8 = -[BTAVRCP_VFSFolder init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_uid = a4;
    v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    storedPredicates = v9->_storedPredicates;
    v9->_storedPredicates = v10;

  }
  return v9;
}

- (MPMediaQuery)query
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder builtQuery](self, "builtQuery"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder baseQuery](self, "baseQuery"));
    -[BTAVRCP_VFSFolder setBuiltQuery:](self, "setBuiltQuery:", v4);

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder storedPredicates](self, "storedPredicates", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder builtQuery](self, "builtQuery"));
          objc_msgSend(v11, "addFilterPredicate:", v10);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    v12 = (void *)qword_10001F1C0;
    if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG))
      sub_10000FFD0(v12, self);
  }
  return (MPMediaQuery *)(id)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder builtQuery](self, "builtQuery"));
}

- (void)storePredicates:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder builtQuery](self, "builtQuery"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BTAVRCP_VFSFolder.m"), 57, CFSTR("Trying to store a predicate after the query is already built"));

  }
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder storedPredicates](self, "storedPredicates"));
  objc_msgSend(v8, "unionSet:", v5);

}

- (unint64_t)childrenCount
{
  -[BTAVRCP_VFSFolder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  -[BTAVRCP_VFSFolder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  -[BTAVRCP_VFSFolder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  -[BTAVRCP_VFSFolder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (unsigned)playItemWithUid:(unint64_t)a3
{
  -[BTAVRCP_VFSFolder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)baseQuery
{
  -[BTAVRCP_VFSFolder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)storePredicate:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", a3));
  -[BTAVRCP_VFSFolder storePredicates:](self, "storePredicates:", v4);

}

- (id)replyFolderWithType:(unsigned __int8)a3 uid:(id)a4 name:(id)a5
{
  uint64_t v6;
  __CFString *v7;
  id v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[4];

  v6 = a3;
  v14[0] = &__kCFBooleanTrue;
  v13[0] = CFSTR("kIsFolder");
  v13[1] = CFSTR("kFolderType");
  v7 = (__CFString *)a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v6));
  v14[1] = v9;
  v14[2] = v8;
  v13[2] = CFSTR("kUid");
  v13[3] = CFSTR("kName");
  if (v7)
    v10 = v7;
  else
    v10 = &stru_1000195C0;
  v14[3] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 4));

  return v11;
}

- (id)replyItemWithUid:(id)a3 name:(id)a4 attributes:(id)a5
{
  id v7;
  const __CFString *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[3];
  _QWORD v15[3];

  v7 = a5;
  v14[0] = CFSTR("kIsFolder");
  v14[1] = CFSTR("kUid");
  v14[2] = CFSTR("kName");
  v15[0] = &__kCFBooleanFalse;
  v8 = &stru_1000195C0;
  if (a4)
    v8 = (const __CFString *)a4;
  v15[1] = a3;
  v15[2] = v8;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 3));

  if (v7)
  {
    v12 = objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v12, "setValue:forKey:", v7, CFSTR("kAttributes"));

    v11 = v12;
  }

  return v11;
}

- (id)recentlyAddedFolderName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mobileBluetoothBundle](NSBundle, "mobileBluetoothBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("RECENTLY_ADDED"), CFSTR("Recently Added"), 0));

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)uid
{
  return self->_uid;
}

- (NSMutableSet)storedPredicates
{
  return self->_storedPredicates;
}

- (MPMediaQuery)builtQuery
{
  return self->_builtQuery;
}

- (void)setBuiltQuery:(id)a3
{
  objc_storeStrong((id *)&self->_builtQuery, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builtQuery, 0);
  objc_storeStrong((id *)&self->_storedPredicates, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
