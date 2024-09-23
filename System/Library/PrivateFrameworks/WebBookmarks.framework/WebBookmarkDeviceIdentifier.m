@implementation WebBookmarkDeviceIdentifier

void __35__WebBookmarkDeviceIdentifier_UUID__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (NSUUID)UUID
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__WebBookmarkDeviceIdentifier_UUID__block_invoke;
  v5[3] = &unk_24CB31610;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSUUID *)v3;
}

- (WebBookmarkDeviceIdentifier)initWithPlistURL:(id)a3 readOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  WebBookmarkDeviceIdentifier *v7;
  id v8;
  dispatch_queue_t v9;
  WebBookmarkDeviceIdentifier *v10;
  objc_super v12;

  v4 = a4;
  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WebBookmarkDeviceIdentifier;
  v7 = -[WebBookmarkDeviceIdentifier init](&v12, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.WebBookmarkDeviceIdentifier.%p"), v7);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = dispatch_queue_create((const char *)objc_msgSend(v8, "UTF8String"), 0);

    -[WebBookmarkDeviceIdentifier _setUpWithPlistURL:readOnly:queue:](v7, "_setUpWithPlistURL:readOnly:queue:", v6, v4, v9);
    v10 = v7;

  }
  return v7;
}

- (void)_setUpWithPlistURL:(id)a3 readOnly:(BOOL)a4 queue:(id)a5
{
  NSURL *v8;
  NSURL *plistURL;
  NSURL *v10;
  NSObject *queue;
  id v12;
  _QWORD block[5];

  v8 = (NSURL *)a3;
  objc_storeStrong((id *)&self->_queue, a5);
  v12 = a5;
  plistURL = self->_plistURL;
  self->_plistURL = v8;
  v10 = v8;

  self->_readOnly = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__WebBookmarkDeviceIdentifier__setUpWithPlistURL_readOnly_queue___block_invoke;
  block[3] = &unk_24CB315A0;
  block[4] = self;
  dispatch_sync(queue, block);

}

uint64_t __65__WebBookmarkDeviceIdentifier__setUpWithPlistURL_readOnly_queue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createOrLoadMetaData");
}

- (void)_createOrLoadMetaData
{
  OUTLINED_FUNCTION_0_0(&dword_211022000, a2, a3, "Error reading bookmarks metadata file with code: %zd", a5, a6, a7, a8, 0);
}

uint64_t __52__WebBookmarkDeviceIdentifier__createOrLoadMetaData__block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  void *v4;
  uint8_t v6[16];

  if (a2)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_211022000, v3, OS_LOG_TYPE_DEFAULT, "Posted bookmarks metadata file changed notification", v6, 2u);
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("webBookmarksMetaDataDidChangeNotification"), *(_QWORD *)(a1 + 32));

  }
  return objc_msgSend(*(id *)(a1 + 32), "_resumeMonitoringMetaDataFile");
}

- (void)_resumeMonitoringMetaDataFile
{
  NSObject *fileMonitor;
  OS_dispatch_source **p_fileMonitor;
  unsigned int v5;
  int v6;
  dispatch_source_t v7;
  uint64_t v8;
  WebBookmarkDeviceIdentifier *v9;
  uint64_t v10;
  _QWORD v11[4];
  int v12;
  _QWORD handler[5];

  p_fileMonitor = &self->_fileMonitor;
  fileMonitor = self->_fileMonitor;
  if (fileMonitor)
  {
    dispatch_resume(fileMonitor);
  }
  else
  {
    v5 = open(-[NSURL fileSystemRepresentation](self->_plistURL, "fileSystemRepresentation"), 4);
    if ((v5 & 0x80000000) != 0)
    {
      -[WebBookmarkDeviceIdentifier _setListensForMetaDataChangeNotification:](self, "_setListensForMetaDataChangeNotification:", 1);
    }
    else
    {
      v6 = v5;
      v7 = dispatch_source_create(MEMORY[0x24BDACA28], v5, 3uLL, (dispatch_queue_t)self->_queue);
      if (v7)
      {
        objc_storeStrong((id *)p_fileMonitor, v7);
        v8 = MEMORY[0x24BDAC760];
        handler[0] = MEMORY[0x24BDAC760];
        handler[1] = 3221225472;
        handler[2] = __60__WebBookmarkDeviceIdentifier__resumeMonitoringMetaDataFile__block_invoke;
        handler[3] = &unk_24CB315A0;
        handler[4] = self;
        dispatch_source_set_event_handler(v7, handler);
        v11[0] = v8;
        v11[1] = 3221225472;
        v11[2] = __60__WebBookmarkDeviceIdentifier__resumeMonitoringMetaDataFile__block_invoke_13;
        v11[3] = &__block_descriptor_36_e5_v8__0l;
        v12 = v6;
        dispatch_source_set_cancel_handler(v7, v11);
        dispatch_resume(v7);
        v9 = self;
        v10 = 0;
      }
      else
      {
        close(v6);
        v9 = self;
        v10 = 1;
      }
      -[WebBookmarkDeviceIdentifier _setListensForMetaDataChangeNotification:](v9, "_setListensForMetaDataChangeNotification:", v10);

    }
  }
}

- (void)_setListensForMetaDataChangeNotification:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->_listensForMetaDataChangeNotification != a3)
  {
    v3 = a3;
    self->_listensForMetaDataChangeNotification = a3;
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__metaDataDidChange_, CFSTR("com.apple.WebBookmarks.MetaDataDidChangeNotification"), 0);
    else
      objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("com.apple.WebBookmarks.MetaDataDidChangeNotification"), 0);

  }
}

- (void)_cancelMonitoringMetaDataFile
{
  NSObject *fileMonitor;
  OS_dispatch_source *v4;

  fileMonitor = self->_fileMonitor;
  if (fileMonitor)
  {
    dispatch_source_cancel(fileMonitor);
    v4 = self->_fileMonitor;
    self->_fileMonitor = 0;

  }
}

- (void)dealloc
{
  objc_super v3;

  -[WebBookmarkDeviceIdentifier _setListensForMetaDataChangeNotification:](self, "_setListensForMetaDataChangeNotification:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WebBookmarkDeviceIdentifier;
  -[WebBookmarkDeviceIdentifier dealloc](&v3, sel_dealloc);
}

uint64_t __60__WebBookmarkDeviceIdentifier__resumeMonitoringMetaDataFile__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_211022000, v2, OS_LOG_TYPE_DEFAULT, "Received a vnode event for bookmarks metadata file", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_createOrLoadMetaData");
}

uint64_t __60__WebBookmarkDeviceIdentifier__resumeMonitoringMetaDataFile__block_invoke_13(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)_metaDataDidChange:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__WebBookmarkDeviceIdentifier__metaDataDidChange___block_invoke;
  block[3] = &unk_24CB315A0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __50__WebBookmarkDeviceIdentifier__metaDataDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_211022000, v2, OS_LOG_TYPE_DEFAULT, "Received bookmarks metadata file change distributed notification", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_createOrLoadMetaData");
}

- (BOOL)encounteredErrorWhileObtainingUUID
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __65__WebBookmarkDeviceIdentifier_encounteredErrorWhileObtainingUUID__block_invoke;
  v5[3] = &unk_24CB31610;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __65__WebBookmarkDeviceIdentifier_encounteredErrorWhileObtainingUUID__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (void)stopObservingChanges
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__WebBookmarkDeviceIdentifier_stopObservingChanges__block_invoke;
  block[3] = &unk_24CB315A0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __51__WebBookmarkDeviceIdentifier_stopObservingChanges__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelMonitoringMetaDataFile");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p' _UUID = %@"), objc_opt_class(), self, self->_UUID);
}

+ (void)clearDeviceIdentifierWithPlistURL:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDBCED8];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithContentsOfURL:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("DeviceUUID"));
  objc_msgSend(v6, "writeToURL:atomically:", v5, 1);
  objc_msgSend(a1, "_postWebBookmarkMetaDataChangeDistributedNotification:", v5);

}

+ (void)_postWebBookmarkMetaDataChangeDistributedNotification:(id)a3
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_211022000, v3, OS_LOG_TYPE_DEFAULT, "Posting bookmarks metadata file change distributed notification", v5, 2u);
  }
  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("com.apple.WebBookmarks.MetaDataDidChangeNotification"), 0);

}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (BOOL)_listensForMetaDataChangeNotification
{
  return self->_listensForMetaDataChangeNotification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_plistURL, 0);
}

@end
