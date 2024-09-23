@implementation TUIFeedCaptureController

- (TUIFeedCaptureController)initWithTitle:(id)a3
{
  id v4;
  TUIFeedCaptureController *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSURL *url;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSURL *v24;
  void *v25;
  void *v26;
  NSMutableArray *v27;
  NSMutableArray *sections;
  dispatch_group_t v29;
  OS_dispatch_group *completionGroup;
  id v32;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)TUIFeedCaptureController;
  v5 = -[TUIFeedCaptureController init](&v33, "init");
  if (v5)
  {
    v32 = v4;
    v6 = (__CFString *)objc_msgSend(v4, "copy");
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = CFSTR("Untitled");
    objc_storeStrong((id *)&v5->_title, v8);

    v9 = NSTemporaryDirectory();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v10, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URLByAppendingPathComponent:", v5->_title));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URLByAppendingPathExtension:", CFSTR("feed")));
    url = v5->_url;
    v5->_url = (NSURL *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v5->_url, "path"));
    LODWORD(v12) = objc_msgSend(v15, "fileExistsAtPath:", v16);

    if ((_DWORD)v12)
    {
      v17 = 1;
      do
      {
        v18 = NSTemporaryDirectory();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v19, 1));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%lu"), v5->_title, v17));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "URLByAppendingPathComponent:", v21));
        v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "URLByAppendingPathExtension:", CFSTR("feed")));
        v24 = v5->_url;
        v5->_url = (NSURL *)v23;

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v5->_url, "path"));
        LOBYTE(v19) = objc_msgSend(v15, "fileExistsAtPath:", v25);

        ++v17;
      }
      while ((v19 & 1) != 0);
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v26, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5->_url, 1, 0, 0);

    v27 = objc_opt_new(NSMutableArray);
    sections = v5->_sections;
    v5->_sections = v27;

    v29 = dispatch_group_create();
    completionGroup = v5->_completionGroup;
    v5->_completionGroup = (OS_dispatch_group *)v29;

    v4 = v32;
  }

  return v5;
}

- (TUIFeedCaptureController)initWithEntry:(id)a3 title:(id)a4
{
  id v7;
  TUIFeedCaptureController *v8;
  TUIFeedCaptureController *v9;

  v7 = a3;
  v8 = -[TUIFeedCaptureController initWithTitle:](self, "initWithTitle:", a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_entry, a3);

  return v9;
}

- (id)_makeDir:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](self->_url, "URLByAppendingPathComponent:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, 0);

  return v3;
}

- (void)beginCaptureWithFactory:(id)a3 completion:(id)a4
{
  id v7;
  id v8;

  objc_storeStrong((id *)&self->_factory, a3);
  v7 = a3;
  v8 = a4;
  dispatch_group_enter((dispatch_group_t)self->_completionGroup);
  TUIDispatchGroupNotifyViaRunloopIfMain(self->_completionGroup, &_dispatch_main_q, v8);

}

- (void)endCapture
{
  void *v3;
  void *v4;
  id v5;

  -[TUIFeedCaptureController _copyPackages](self, "_copyPackages");
  -[TUIFeedCaptureController _emitDynamicState](self, "_emitDynamicState");
  -[TUIFeedCaptureController _emitImages](self, "_emitImages");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](self->_url, "URLByAppendingPathComponent:", CFSTR("feed.json")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedCaptureController _feedInfo](self, "_feedInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v3, 1, 0));
  objc_msgSend(v4, "writeToURL:atomically:", v5, 0);

  dispatch_group_leave((dispatch_group_t)self->_completionGroup);
}

- (void)captureSectionWithEntry:(id)a3 bindings:(id)a4 template:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TUIFeedCaptureSection *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[_TUIFeedCaptureSection initWithEntry:bindings:template:]([_TUIFeedCaptureSection alloc], "initWithEntry:bindings:template:", v10, v9, v8);

  -[NSMutableArray addObject:](self->_sections, "addObject:", v11);
}

- (id)instantiateCaptureForEntry:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_sections;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "entry", (_QWORD)v12));

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_feedInfo
{
  NSMutableArray *v3;
  NSMutableArray *sections;
  NSMutableArray *v5;
  NSString *title;
  void *v7;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  NSMutableArray *v13;
  _QWORD v14[2];
  _QWORD v15[2];

  v3 = objc_opt_new(NSMutableArray);
  sections = self->_sections;
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_73808;
  v12 = &unk_23F440;
  v13 = v3;
  v5 = v3;
  -[NSMutableArray enumerateObjectsUsingBlock:](sections, "enumerateObjectsUsingBlock:", &v9);
  title = self->_title;
  v14[0] = CFSTR("title");
  v14[1] = CFSTR("sections");
  v15[0] = title;
  v15[1] = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2, v9, v10, v11, v12));

  return v7;
}

- (void)_copyPackages
{
  void *v3;
  NSMutableArray *sections;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
  sections = self->_sections;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_73A38;
  v21[3] = &unk_23F440;
  v5 = v3;
  v22 = v5;
  -[NSMutableArray enumerateObjectsUsingBlock:](sections, "enumerateObjectsUsingBlock:", v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedCaptureController _makeDir:](self, "_makeDir:", CFSTR("packages")));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v11), "url", (_QWORD)v17));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URLByDeletingLastPathComponent"));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:", v14));

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        objc_msgSend(v16, "copyItemAtURL:toURL:error:", v13, v15, 0);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v9);
  }

}

- (void)_emitDynamicState
{
  NSMutableSet *v3;
  NSMutableArray *sections;
  NSMutableSet *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *v12;
  NSMutableArray *v13;
  NSMutableDictionary *v14;
  NSMutableArray *v15;
  NSMutableArray *v16;
  void *v17;
  void *v18;
  TUIFeedCaptureController *v19;
  void *v20;
  void *v21;
  NSMutableSet *v22;
  NSMutableSet *obj;
  _QWORD v24[4];
  NSMutableArray *v25;
  _QWORD v26[5];
  NSMutableDictionary *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  NSMutableSet *v33;
  const __CFString *v34;
  NSMutableArray *v35;
  _BYTE v36[128];

  v3 = objc_opt_new(NSMutableSet);
  sections = self->_sections;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_73D58;
  v32[3] = &unk_23F440;
  v5 = v3;
  v33 = v5;
  -[NSMutableArray enumerateObjectsUsingBlock:](sections, "enumerateObjectsUsingBlock:", v32);
  if (-[NSMutableSet count](v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedCaptureController _makeDir:](self, "_makeDir:", CFSTR("dynamic-state")));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v22 = v5;
    obj = v5;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v29;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v10);
          v12 = objc_opt_new(NSMutableDictionary);
          v13 = self->_sections;
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = sub_73E1C;
          v26[3] = &unk_23F4B8;
          v26[4] = v11;
          v27 = v12;
          v14 = v12;
          -[NSMutableArray enumerateObjectsUsingBlock:](v13, "enumerateObjectsUsingBlock:", v26);
          v15 = objc_opt_new(NSMutableArray);
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_73F74;
          v24[3] = &unk_23F508;
          v25 = v15;
          v16 = v15;
          -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v14, "enumerateKeysAndObjectsUsingBlock:", v24);
          v34 = CFSTR("instances");
          v35 = v16;
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:", v11));
          v19 = self;
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "URLByAppendingPathExtension:", CFSTR("json")));

          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v17, 1, 0));
          objc_msgSend(v21, "writeToURL:atomically:", v20, 0);

          self = v19;
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v8);
    }

    v5 = v22;
  }

}

- (void)_emitImages
{
  NSMutableSet *v3;
  NSMutableArray *sections;
  NSMutableSet *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *v12;
  NSMutableArray *v13;
  NSMutableDictionary *v14;
  NSMutableArray *v15;
  id v16;
  NSMutableArray *v17;
  TUIFeedCaptureController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSMutableSet *v23;
  NSMutableSet *obj;
  _QWORD v25[4];
  id v26;
  NSMutableArray *v27;
  _QWORD v28[5];
  NSMutableDictionary *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  NSMutableSet *v35;
  const __CFString *v36;
  NSMutableArray *v37;
  _BYTE v38[128];

  v3 = objc_opt_new(NSMutableSet);
  sections = self->_sections;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_74818;
  v34[3] = &unk_23F440;
  v5 = v3;
  v35 = v5;
  -[NSMutableArray enumerateObjectsUsingBlock:](sections, "enumerateObjectsUsingBlock:", v34);
  if (-[NSMutableSet count](v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedCaptureController _makeDir:](self, "_makeDir:", CFSTR("images")));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v23 = v5;
    obj = v5;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v31;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v31 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v10);
          v12 = objc_opt_new(NSMutableDictionary);
          v13 = self->_sections;
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_748DC;
          v28[3] = &unk_23F4B8;
          v28[4] = v11;
          v29 = v12;
          v14 = v12;
          -[NSMutableArray enumerateObjectsUsingBlock:](v13, "enumerateObjectsUsingBlock:", v28);
          v15 = objc_opt_new(NSMutableArray);
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_74A34;
          v25[3] = &unk_23F5A8;
          v16 = v6;
          v26 = v16;
          v27 = v15;
          v17 = v15;
          -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v14, "enumerateKeysAndObjectsUsingBlock:", v25);
          v36 = CFSTR("instances");
          v37 = v17;
          v18 = self;
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "URLByAppendingPathComponent:", v11));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "URLByAppendingPathExtension:", CFSTR("json")));

          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v19, 1, 0));
          objc_msgSend(v22, "writeToURL:atomically:", v21, 0);

          self = v18;
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v8);
    }

    v5 = v23;
  }

}

+ (id)feedCaptureInfoWithURL:(id)a3 packagesURL:(id)a4
{
  id v5;
  id v6;
  _TUIFeedCaptureInfo *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_TUIFeedCaptureInfo initWithURL:packagesURL:]([_TUIFeedCaptureInfo alloc], "initWithURL:packagesURL:", v6, v5);

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)url
{
  return self->_url;
}

- (TUIFeedEntry)entry
{
  return self->_entry;
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (OS_dispatch_group)completionGroup
{
  return self->_completionGroup;
}

- (TUITemplateFactory)factory
{
  return self->_factory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_completionGroup, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
