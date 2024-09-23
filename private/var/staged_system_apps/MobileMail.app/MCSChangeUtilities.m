@implementation MCSChangeUtilities

+ (id)flagChangesForKey:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t *v26;
  id v27;

  v3 = a3;
  if (!qword_1005A9E58)
  {
    v4 = objc_alloc((Class)NSDictionary);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    v6 = objc_msgSend(v4, "initWithObjectsAndKeys:", v5, MessageIsDeleted, 0, 0);
    v7 = (void *)qword_1005A9E58;
    qword_1005A9E58 = (uint64_t)v6;

    v8 = objc_alloc((Class)NSDictionary);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    v10 = MessageIsRead;
    v11 = objc_msgSend(v8, "initWithObjectsAndKeys:", v9, MessageIsRead, 0, 0);
    v12 = (void *)qword_1005A9E60;
    qword_1005A9E60 = (uint64_t)v11;

    v13 = objc_alloc((Class)NSDictionary);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
    v15 = objc_msgSend(v13, "initWithObjectsAndKeys:", v14, v10, 0, 0);
    v16 = (void *)qword_1005A9E68;
    qword_1005A9E68 = (uint64_t)v15;

    v17 = objc_alloc((Class)NSDictionary);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    v19 = MFMessageIsFlagged;
    v20 = objc_msgSend(v17, "initWithObjectsAndKeys:", v18, MFMessageIsFlagged, 0, 0);
    v21 = (void *)qword_1005A9E70;
    qword_1005A9E70 = (uint64_t)v20;

    v22 = objc_alloc((Class)NSDictionary);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
    v24 = objc_msgSend(v22, "initWithObjectsAndKeys:", v23, v19, 0, 0);
    v25 = (void *)qword_1005A9E78;
    qword_1005A9E78 = (uint64_t)v24;

  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MCSChangeSetDeletedMessages")) & 1) != 0)
  {
    v26 = &qword_1005A9E58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MCSChangeSetReadMessages")) & 1) != 0)
  {
    v26 = &qword_1005A9E60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MCSChangeSetUnreadMessages")) & 1) != 0)
  {
    v26 = &qword_1005A9E68;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MCSChangeSetFlaggedMessages")) & 1) != 0)
  {
    v26 = &qword_1005A9E70;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("MCSChangeSetUnflaggedMessages")))
    {
      v27 = 0;
      goto LABEL_14;
    }
    v26 = &qword_1005A9E78;
  }
  v27 = (id)*v26;
LABEL_14:

  return v27;
}

+ (id)allMessagesInChanges:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("MCSChangeSetDeletedMessages")));
  objc_msgSend(v4, "unionSet:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("MCSChangeSetReadMessages")));
  objc_msgSend(v4, "unionSet:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("MCSChangeSetUnreadMessages")));
  objc_msgSend(v4, "unionSet:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("MCSChangeSetFlaggedMessages")));
  objc_msgSend(v4, "unionSet:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("MCSChangeSetUnflaggedMessages")));
  objc_msgSend(v4, "unionSet:", v9);

  return v4;
}

+ (id)mergeMessageChanges:(id)a3 withChanges:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 5);
  v8 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("MCSChangeSetDeletedMessages")));
  objc_msgSend(v8, "unionSet:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("MCSChangeSetDeletedMessages")));
  objc_msgSend(v8, "unionSet:", v10);

  if (objc_msgSend(v8, "count"))
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("MCSChangeSetDeletedMessages"));
  v11 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("MCSChangeSetReadMessages")));
  objc_msgSend(v11, "unionSet:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("MCSChangeSetReadMessages")));
  objc_msgSend(v11, "unionSet:", v13);

  if (objc_msgSend(v11, "count"))
    objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("MCSChangeSetReadMessages"));
  v14 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("MCSChangeSetUnreadMessages")));
  objc_msgSend(v14, "unionSet:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("MCSChangeSetUnreadMessages")));
  objc_msgSend(v14, "unionSet:", v16);

  if (objc_msgSend(v14, "count"))
    objc_msgSend(v7, "setObject:forKey:", v14, CFSTR("MCSChangeSetUnreadMessages"));
  v17 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("MCSChangeSetFlaggedMessages")));
  objc_msgSend(v17, "unionSet:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("MCSChangeSetFlaggedMessages")));
  objc_msgSend(v17, "unionSet:", v19);

  if (objc_msgSend(v17, "count"))
    objc_msgSend(v7, "setObject:forKey:", v17, CFSTR("MCSChangeSetFlaggedMessages"));
  v20 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("MCSChangeSetUnflaggedMessages")));
  objc_msgSend(v20, "unionSet:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("MCSChangeSetUnflaggedMessages")));
  objc_msgSend(v20, "unionSet:", v22);

  if (objc_msgSend(v20, "count"))
    objc_msgSend(v7, "setObject:forKey:", v20, CFSTR("MCSChangeSetUnflaggedMessages"));

  return v7;
}

@end
