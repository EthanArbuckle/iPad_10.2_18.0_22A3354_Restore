@implementation MGNotificationRegistration

- (MGNotificationRegistration)initWithQueue:(id)global_queue block:(id)a4
{
  MGNotificationRegistration *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MGNotificationRegistration;
  v6 = -[MGNotificationRegistration init](&v12, sel_init);
  if (v6)
  {
    v6->_observers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (!global_queue)
      global_queue = dispatch_get_global_queue(0, 0);
    v6->_queue = (OS_dispatch_queue *)global_queue;
    dispatch_retain((dispatch_object_t)global_queue);
    v6->_block = (id)objc_msgSend_copy(a4, v7, v8, v9, v10);
    v6->_requestedRegistrations = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v6;
}

- (BOOL)start
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *context;
  NSMutableDictionary *obj;
  _QWORD v43[6];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD block[7];
  int v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  uint64_t v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1A859AD80](self, a2);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = self->_requestedRegistrations;
  v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v3, (uint64_t)&v44, (uint64_t)v56, 16);
  if (v4)
  {
    v8 = v4;
    v9 = MEMORY[0x1E0C809B0];
    v10 = *(_QWORD *)v45;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v45 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v11);
        v13 = (void *)objc_msgSend_objectAtIndexedSubscript_(v12, v5, 0, v6, v7);
        v18 = objc_msgSend_intValue(v13, v14, v15, v16, v17);
        v22 = objc_msgSend_objectAtIndexedSubscript_(v12, v19, 1, v20, v21);
        v26 = (void *)objc_msgSend_objectForKey_(self->_requestedRegistrations, v23, (uint64_t)v12, v24, v25);
        v31 = objc_msgSend_allObjects(v26, v27, v28, v29, v30);
        v43[0] = v9;
        v43[1] = 3221225472;
        v43[2] = sub_1A40C2818;
        v43[3] = &unk_1E4BA10E0;
        v43[4] = self;
        v43[5] = v31;
        v36 = (void *)objc_msgSend_copy(v43, v32, v33, v34, v35);
        if (qword_1ECDA0C10 != -1)
          dispatch_once(&qword_1ECDA0C10, &unk_1E4BA0F90);
        v50 = 0;
        v51 = &v50;
        v52 = 0x3052000000;
        v53 = sub_1A40C1930;
        v54 = sub_1A40C1918;
        v55 = 0;
        block[0] = v9;
        block[1] = 3221225472;
        block[2] = sub_1A40C2A48;
        block[3] = &unk_1E4BA1128;
        v49 = v18;
        block[5] = v36;
        block[6] = &v50;
        block[4] = v22;
        dispatch_sync((dispatch_queue_t)qword_1ECDA0C00, block);
        v37 = (void *)v51[5];
        _Block_object_dispose(&v50, 8);
        objc_msgSend_setObject_forKey_(self->_observers, v38, (uint64_t)v36, (uint64_t)v37, v39);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v44, (uint64_t)v56, 16);
    }
    while (v8);
  }

  self->_requestedRegistrations = 0;
  self->_deliverNotifications = 1;
  objc_autoreleasePoolPop(context);
  return 1;
}

- (BOOL)registerForNotification:(int)a3 argument:(const char *)a4 question:(id)a5
{
  uint64_t v7;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  _QWORD v27[3];

  v7 = *(_QWORD *)&a3;
  v27[2] = *MEMORY[0x1E0C80C00];
  v12 = (void *)MEMORY[0x1A859AD80](self, a2);
  if (a4)
    v13 = (const __CFString *)objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v9, (uint64_t)a4, v10, v11);
  else
    v13 = &stru_1E4BA1AD8;
  v27[0] = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v9, v7, v10, v11);
  v27[1] = v13;
  v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v14, (uint64_t)v27, 2, v15);
  v23 = (id)objc_msgSend_objectForKeyedSubscript_(self->_requestedRegistrations, v17, v16, v18, v19);
  if (!v23)
  {
    v23 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend_setObject_forKeyedSubscript_(self->_requestedRegistrations, v24, (uint64_t)v23, v16, v25);

  }
  objc_msgSend_addObject_(v23, v20, (uint64_t)a5, v21, v22);
  objc_autoreleasePoolPop(v12);
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MGNotificationRegistration;
  -[MGNotificationRegistration dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  void *v3;
  _QWORD block[5];

  v3 = (void *)MEMORY[0x1A859AD80](self, a2);
  self->_deliverNotifications = 0;
  if (qword_1ECDA0C00)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A40C2910;
    block[3] = &unk_1E4BA1048;
    block[4] = self;
    dispatch_async((dispatch_queue_t)qword_1ECDA0C00, block);
  }
  objc_autoreleasePoolPop(v3);
}

@end
