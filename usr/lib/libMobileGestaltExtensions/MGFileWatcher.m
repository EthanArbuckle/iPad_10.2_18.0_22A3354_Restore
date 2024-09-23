@implementation MGFileWatcher

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MGFileWatcher;
  -[MGFileWatcher dealloc](&v3, sel_dealloc);
}

- (BOOL)updateWatcher
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  int v8;
  int v9;
  unint64_t inode;
  BOOL v11;
  NSObject *src;
  OS_dispatch_source *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v17[4];
  int v18;
  _QWORD handler[5];
  stat v20;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = (const char *)objc_msgSend_fileSystemRepresentation(self->_path, v3, v4, v5, v6);
  v8 = open(v7, 0x8000);
  if (v8 == -1)
    return 0;
  v9 = v8;
  memset(&v20, 0, sizeof(v20));
  if (fstat(v8, &v20) == -1)
  {
    close(v9);
    return 0;
  }
  inode = self->_inode;
  v11 = v20.st_ino != inode;
  if (v20.st_ino == inode)
  {
    close(v9);
  }
  else
  {
    src = self->_src;
    if (src)
    {
      dispatch_source_cancel(src);
      dispatch_release((dispatch_object_t)self->_src);
    }
    v13 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DE8], v9, 0x7FuLL, (dispatch_queue_t)self->_queue);
    v14 = MEMORY[0x1E0C809B0];
    self->_src = v13;
    handler[0] = v14;
    handler[1] = 3221225472;
    handler[2] = sub_1A40C1EE4;
    handler[3] = &unk_1E4BA1048;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v13, handler);
    v15 = self->_src;
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = sub_1A40C1F24;
    v17[3] = &unk_1E4BA1068;
    v18 = v9;
    dispatch_source_set_cancel_handler(v15, v17);
    dispatch_resume((dispatch_object_t)self->_src);
    self->_inode = v20.st_ino;
  }
  if (v20.st_mtimespec.tv_sec != self->_mtime.tv_sec || v20.st_mtimespec.tv_nsec != self->_mtime.tv_nsec)
  {
    self->_mtime = v20.st_mtimespec;
    return 1;
  }
  return v11;
}

- (MGFileWatcher)initWithPath:(id)a3 block:(id)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *PathComponent;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  int v18;
  int v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  _QWORD block[5];
  _QWORD v39[4];
  int v40;
  _QWORD handler[5];
  objc_super v42;
  uint8_t buf[4];
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1A859AD80](self, a2);
  PathComponent = (void *)objc_msgSend_stringByDeletingLastPathComponent(a3, v8, v9, v10, v11);
  v17 = (const char *)objc_msgSend_fileSystemRepresentation(PathComponent, v13, v14, v15, v16);
  v18 = open(v17, 0x8000);
  if (v18 == -1)
  {
    v30 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
    if (v30)
      v36 = v30 + 1;
    else
      v36 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
    sub_1A40C0884((uint64_t)v36, 106, (uint64_t)CFSTR("can't open parent for %@"), v31, v32, v33, v34, v35, (char)a3);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v44 = a3;
      _os_log_impl(&dword_1A40BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "can't open parent for %@", buf, 0xCu);
    }
    v20 = 0;
  }
  else
  {
    v19 = v18;
    v42.receiver = self;
    v42.super_class = (Class)MGFileWatcher;
    v20 = -[MGFileWatcher init](&v42, sel_init);
    if (v20)
    {
      *((_QWORD *)v20 + 1) = a3;
      *((_QWORD *)v20 + 8) = objc_msgSend_copy(a4, v21, v22, v23, v24);
      v25 = dispatch_queue_create("com.apple.MobileGestalt.MGFileWatcher", 0);
      *((_QWORD *)v20 + 5) = v25;
      v26 = dispatch_source_create(MEMORY[0x1E0C80DE8], v19, 2uLL, v25);
      v27 = MEMORY[0x1E0C809B0];
      *((_QWORD *)v20 + 7) = v26;
      handler[0] = v27;
      handler[1] = 3221225472;
      handler[2] = sub_1A40C214C;
      handler[3] = &unk_1E4BA1048;
      handler[4] = v20;
      dispatch_source_set_event_handler(v26, handler);
      v28 = *((_QWORD *)v20 + 7);
      v39[0] = v27;
      v39[1] = 3221225472;
      v39[2] = sub_1A40C218C;
      v39[3] = &unk_1E4BA1068;
      v40 = v19;
      dispatch_source_set_cancel_handler(v28, v39);
      v29 = *((_QWORD *)v20 + 5);
      block[0] = v27;
      block[1] = 3221225472;
      block[2] = sub_1A40C2194;
      block[3] = &unk_1E4BA1048;
      block[4] = v20;
      dispatch_sync(v29, block);
      dispatch_resume(*((dispatch_object_t *)v20 + 7));
    }
  }
  objc_autoreleasePoolPop(v7);
  return (MGFileWatcher *)v20;
}

- (void)cancel
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A40C21F4;
  block[3] = &unk_1E4BA1048;
  block[4] = self;
  dispatch_sync(queue, block);
}

@end
