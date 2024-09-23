@implementation RCShareableComposition

- (RCShareableComposition)initWithComposition:(id)a3
{
  id v5;
  RCShareableComposition *v6;
  RCShareableComposition *v7;
  NSMutableArray *v8;
  NSMutableArray *temporaryDirectories;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RCShareableComposition;
  v6 = -[RCShareableComposition init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_composition, a3);
    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    temporaryDirectories = v7->_temporaryDirectories;
    v7->_temporaryDirectories = v8;

  }
  return v7;
}

- (NSString)recordingUUID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareableComposition composition](self, "composition"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "savedRecordingUUID"));

  return (NSString *)v3;
}

- (NSString)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareableComposition composition](self, "composition"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "title"));

  return (NSString *)v3;
}

+ (id)_createTemporaryDirectory
{
  void *v2;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v5, 1, 0));

  return v6;
}

- (id)_createManagedTemporaryDirectory
{
  NSMutableArray *v3;
  uint64_t v4;
  id v5;
  void *v6;

  v3 = self->_temporaryDirectories;
  objc_sync_enter(v3);
  v5 = objc_msgSend((id)objc_opt_class(self, v4), "_createTemporaryDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
    -[NSMutableArray addObject:](self->_temporaryDirectories, "addObject:", v6);
  objc_sync_exit(v3);

  return v6;
}

- (void)_cleanUpManagedTemporaryDirectories
{
  void *v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  int v13;
  BOOL v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  unsigned __int8 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = self->_temporaryDirectories;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    v8 = kVMLogCategoryDefault;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v9);
        v18 = 0;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
        v12 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v11, &v18);
        v13 = v18;

        if (v12)
          v14 = v13 == 0;
        else
          v14 = 1;
        if (!v14)
        {
          v17 = 0;
          if ((objc_msgSend(v3, "removeItemAtURL:error:", v10, &v17) & 1) == 0)
          {
            v15 = OSLogForCategory(v8);
            v16 = objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              sub_10010E3E4(buf, &v24, v16);

          }
        }
        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v6);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[RCShareableComposition _cleanUpManagedTemporaryDirectories](self, "_cleanUpManagedTemporaryDirectories");
  v3.receiver = self;
  v3.super_class = (Class)RCShareableComposition;
  -[RCShareableComposition dealloc](&v3, "dealloc");
}

- (BOOL)registerAudioFileRepresentationWithItemProvider:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareableComposition composition](self, "composition"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "composedAVURL"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareableComposition composition](self, "composition"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "savedRecordingUUID"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
  v12 = objc_msgSend(v10, "isReadableFileAtPath:", v11);

  if (v12)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000A0F28;
    v14[3] = &unk_1001AD490;
    v15 = v7;
    v16 = v9;
    objc_msgSend(v5, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", AVFileTypeAppleM4A, 0, 0, v14);

  }
  return 1;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return -[RCShareableComposition placeholderURL](self, "placeholderURL", a3);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  uint64_t v15;
  NSObject *v16;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
LABEL_13:
    v11 = 0;
    goto LABEL_14;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareableComposition composition](self, "composition"));
  v9 = objc_msgSend(v8, "compositionIsShareable");

  if (!v9)
  {
    v15 = OSLogForCategory(kVMLogCategoryDefault);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      sub_10010E430(self, v16);

    goto LABEL_13;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareableComposition _cachedItemsForActivityTypes](self, "_cachedItemsForActivityTypes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v7));
  if (!v11)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareableComposition _itemForActivityType:](self, "_itemForActivityType:", v7));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[RCShareMemoHelper customActivityTypes](RCShareMemoHelper, "customActivityTypes"));
      v13 = objc_msgSend(v12, "containsObject:", v7);

      v14 = objc_msgSend(v7, "isEqual:", UIActivityTypeCopyToPasteboard);
      if ((v13 & 1) == 0 && (v14 & 1) == 0)
        +[RCAnalyticsUtilities sendDidShareRecording](RCAnalyticsUtilities, "sendDidShareRecording");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v7);
    }
  }

LABEL_14:
  return v11;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareableComposition customSubject](self, "customSubject"));

  if (v6)
  {
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RCShareableComposition customSubject](self, "customSubject"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareableComposition _cachedSubjectsForActivityTypes](self, "_cachedSubjectsForActivityTypes"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v5));
    if (!v7)
    {
      v9 = objc_claimAutoreleasedReturnValue(-[RCShareableComposition _subjectForActivityType:](self, "_subjectForActivityType:", v5));
      if (v9)
      {
        v7 = (__CFString *)v9;
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v5);
      }
      else
      {
        v7 = &stru_1001B2BC0;
      }
    }

  }
  return v7;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  double height;
  double width;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  height = a5.height;
  width = a5.width;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareableComposition _cachedThumbnailsForActivityTypes](self, "_cachedThumbnailsForActivityTypes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v8));
  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareableComposition composition](self, "composition"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "composedAVURL"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RCWaveform waveformURLForAVURL:](RCWaveform, "waveformURLForAVURL:", v12));

    v10 = 0;
    if (objc_msgSend(v13, "checkResourceIsReachableAndReturnError:", 0))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareableComposition composition](self, "composition"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[RCWaveformSnapshotGenerator snapshotForComposition:size:](RCWaveformSnapshotGenerator, "snapshotForComposition:size:", v14, width, height));

      objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v8);
    }

  }
  return v10;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;

  v4 = objc_alloc_init((Class)LPLinkMetadata);
  v5 = objc_alloc_init((Class)LPFileMetadata);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareableComposition composition](self, "composition"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  objc_msgSend(v5, "setName:", v7);

  objc_msgSend(v5, "setIcon:", 0);
  objc_msgSend(v5, "setType:", AVFileTypeAppleM4A);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareableComposition composition](self, "composition"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "composedAVURL"));
  v18 = 0;
  v17 = 0;
  v10 = objc_msgSend(v9, "getResourceValue:forKey:error:", &v18, NSURLFileSizeKey, &v17);
  v11 = v18;
  v12 = v17;

  if (v10)
  {
    v13 = objc_msgSend(v11, "unsignedLongLongValue");
  }
  else
  {
    v14 = OSLogForCategory(kVMLogCategoryDefault);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[RCShareableComposition activityViewControllerLinkMetadata:]";
      v21 = 2112;
      v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s -- Error reading file size: %@", buf, 0x16u);
    }

    v13 = 0;
  }
  objc_msgSend(v5, "setSize:", v13);
  objc_msgSend(v4, "setSpecialization:", v5);

  return v4;
}

- (id)placeholderURL
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A1700;
  block[3] = &unk_1001AB588;
  block[4] = self;
  if (qword_1001ED988 != -1)
    dispatch_once(&qword_1001ED988, block);
  return (id)qword_1001ED990;
}

+ (void)_accessRecording:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationContainer sharedContainer](RCApplicationContainer, "sharedContainer"));
  v8 = objc_msgSend(v7, "newBackgroundModel");

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000A1800;
  v12[3] = &unk_1001AC270;
  v13 = v8;
  v14 = v5;
  v15 = v6;
  v9 = v6;
  v10 = v5;
  v11 = v8;
  objc_msgSend(v11, "performBlockAndWait:", v12);

}

- (id)_itemForActivityType:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareableComposition _createManagedTemporaryDirectory](self, "_createManagedTemporaryDirectory", a3));
  v6 = (void *)objc_opt_class(self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareableComposition composition](self, "composition"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "savedRecordingUUID"));
  v9 = objc_msgSend(v6, "_copyResourcesForRecording:toDirectory:", v8, v4);

  return v9;
}

+ (id)_copyResourcesForRecording:(id)a3 toDirectory:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1000A19CC;
  v17 = sub_1000A19DC;
  v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A19E4;
  v10[3] = &unk_1001AD4B8;
  v12 = &v13;
  v7 = a4;
  v11 = v7;
  objc_msgSend(a1, "_accessRecording:withBlock:", v6, v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)_subjectForActivityType:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1000A19CC;
  v19 = sub_1000A19DC;
  v20 = 0;
  v6 = (void *)objc_opt_class(self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareableComposition composition](self, "composition"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "savedRecordingUUID"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000A1B50;
  v12[3] = &unk_1001AD4B8;
  v14 = &v15;
  v9 = v4;
  v13 = v9;
  objc_msgSend(v6, "_accessRecording:withBlock:", v8, v12);

  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (id)_cachedItemsForActivityTypes
{
  id AssociatedObject;
  NSMutableDictionary *v5;

  AssociatedObject = objc_getAssociatedObject(self, a2);
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v5)
  {
    v5 = objc_opt_new(NSMutableDictionary);
    objc_setAssociatedObject(self, a2, v5, (void *)0x301);
  }
  return v5;
}

- (id)_cachedSubjectsForActivityTypes
{
  id AssociatedObject;
  NSMutableDictionary *v5;

  AssociatedObject = objc_getAssociatedObject(self, a2);
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v5)
  {
    v5 = objc_opt_new(NSMutableDictionary);
    objc_setAssociatedObject(self, a2, v5, (void *)0x301);
  }
  return v5;
}

- (id)_cachedThumbnailsForActivityTypes
{
  id AssociatedObject;
  NSMutableDictionary *v5;

  AssociatedObject = objc_getAssociatedObject(self, a2);
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v5)
  {
    v5 = objc_opt_new(NSMutableDictionary);
    objc_setAssociatedObject(self, a2, v5, (void *)0x301);
  }
  return v5;
}

- (NSString)customSubject
{
  return self->_customSubject;
}

- (void)setCustomSubject:(id)a3
{
  objc_storeStrong((id *)&self->_customSubject, a3);
}

- (RCComposition)composition
{
  return self->_composition;
}

- (void)setComposition:(id)a3
{
  objc_storeStrong((id *)&self->_composition, a3);
}

- (NSMutableArray)temporaryDirectories
{
  return self->_temporaryDirectories;
}

- (void)setTemporaryDirectories:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryDirectories, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryDirectories, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_customSubject, 0);
}

@end
