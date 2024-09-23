@implementation TCMessageContext

+ (void)initialize
{
  uint64_t v2;

  if ((id)objc_opt_class(TCMessageContext, a2) == a1 && (byte_543364 & 1) == 0)
  {
    byte_543364 = 1;
    objc_opt_class(TCCommonMessages, v2);
  }
}

- (TCMessageContext)init
{
  TCMessageContext *v2;
  NSMutableDictionary *v3;
  NSMutableSet *m_warnings;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TCMessageContext;
  v2 = -[TCMessageContext init](&v6, "init");
  if (v2)
  {
    v2->m_warnings = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v2->m_errors = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v2->m_currentObjectStack = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    byte_540CA0 = 1;
    v2->m_placeholderToObjectIdMap = v3;
    v2->m_delegate = 0;
    v2->mMessageSyncQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iWork.TCMessageContext", 0);
    m_warnings = v2->m_warnings;
    if (!m_warnings || !v2->m_errors || !v2->m_currentObjectStack)
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  NSObject *mMessageSyncQueue;
  objc_super v4;

  mMessageSyncQueue = self->mMessageSyncQueue;
  if (mMessageSyncQueue)
  {
    dispatch_release(mMessageSyncQueue);
    self->mMessageSyncQueue = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TCMessageContext;
  -[TCMessageContext dealloc](&v4, "dealloc");
}

+ (void)reportObjectOrPlaceholder:(id)a3 withWarning:(TCTaggedMessageStructure *)a4 parameters:(char *)a5
{
  id v8;

  if (a4)
  {
    v8 = -[NSMutableDictionary objectForKey:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "objectForKey:", CFSTR("TCMessageContext Instance"));
    if (v8)
      objc_msgSend(v8, "reportWarningForObject:affectedObject:warning:parameterList:", a3, 0, a4, a5);
  }
}

+ (id)currentObjectOrPlaceholder
{
  return objc_msgSend(-[NSMutableDictionary objectForKey:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "objectForKey:", CFSTR("TCMessageContext Instance")), "currentObject");
}

+ (void)reportObject:(id)a3 withWarning:(TCTaggedMessageStructure *)a4
{
  uint64_t v7;

  if (a4
    && (!objc_msgSend(a1, "conformsToProtocol:", &OBJC_PROTOCOL___TCEnhancedWarningReporting)
     || (objc_msgSend(a1, "enhancedReportObject:withWarning:parameters:", a3, a4, &v7) & 1) == 0))
  {
    objc_msgSend(a1, "reportObjectOrPlaceholder:withWarning:parameters:", a3, a4, &v7);
  }
}

+ (void)reportWarning:(TCTaggedMessageStructure *)a3
{
  uint64_t v5;

  if (a3
    && (!objc_msgSend(a1, "conformsToProtocol:", &OBJC_PROTOCOL___TCEnhancedWarningReporting)
     || (objc_msgSend(a1, "enhancedReportObject:withWarning:parameters:", 0, a3, &v5) & 1) == 0))
  {
    objc_msgSend(a1, "reportObjectOrPlaceholder:withWarning:parameters:", objc_msgSend(a1, "currentObjectOrPlaceholder"), a3, &v5);
  }
}

+ (void)reportError:(TCTaggedMessageStructure *)a3
{
  id v4;
  void *v5;
  TCMessageEntry *v6;
  uint64_t v7;

  if (a3)
  {
    v4 = -[NSMutableDictionary objectForKey:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "objectForKey:", CFSTR("TCMessageContext Instance"));
    if (v4)
    {
      v5 = v4;
      v6 = -[TCMessageEntry initWithTag:affectedObject:text:parameters:]([TCMessageEntry alloc], "initWithTag:affectedObject:text:parameters:", a3->var0, 0, a3->var1, &v7);
      objc_msgSend(v5, "addErrorMessageEntry:", v6);

    }
  }
}

+ (void)reportWarningException:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  TCMessageEntry *v16;

  v5 = -[NSMutableDictionary objectForKey:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "objectForKey:", CFSTR("TCMessageContext Instance"));
  if (v5)
  {
    v13 = v5;
    v16 = sub_1C7524(a3, v6, v7, v8, v9, v10, v11, v12, v15);
    v14 = objc_msgSend(a1, "currentObjectOrPlaceholder");
    if ((objc_opt_respondsToSelector(v14, "identifier") & 1) != 0)
      v14 = objc_msgSend(v14, "performSelector:", "identifier");
    -[TCMessageEntry addAffectedObject:](v16, "addAffectedObject:", v14);
    objc_msgSend(v13, "addWarningMessageEntry:", v16);

  }
}

+ (void)reportErrorException:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  TCMessageEntry *v14;

  v4 = -[NSMutableDictionary objectForKey:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "objectForKey:", CFSTR("TCMessageContext Instance"));
  if (v4)
  {
    v12 = v4;
    v14 = sub_1C7524(a3, v5, v6, v7, v8, v9, v10, v11, v13);
    objc_msgSend(v12, "addErrorMessageEntry:", v14);

  }
}

+ (void)createContextForCurrentThread
{
  TCMessageContext *v2;

  v2 = objc_alloc_init(TCMessageContext);
  -[NSMutableDictionary setObject:forKey:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "setObject:forKey:", v2, CFSTR("TCMessageContext Instance"));

}

+ (void)createContextForCurrentThreadWithDelegate:(id)a3
{
  _QWORD *v4;

  objc_msgSend(a1, "createContextForCurrentThread");
  v4 = -[NSMutableDictionary objectForKey:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "objectForKey:", CFSTR("TCMessageContext Instance"));
  if (v4)
    v4[5] = a3;
}

+ (id)delegateForCurrentContext
{
  id result;

  result = -[NSMutableDictionary objectForKey:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "objectForKey:", CFSTR("TCMessageContext Instance"));
  if (result)
    return (id)*((_QWORD *)result + 5);
  return result;
}

+ (void)removeContextForCurrentThread
{
  -[NSMutableDictionary removeObjectForKey:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "removeObjectForKey:", CFSTR("TCMessageContext Instance"));
}

+ (id)getWarningArray
{
  id result;

  result = -[NSMutableDictionary objectForKey:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "objectForKey:", CFSTR("TCMessageContext Instance"));
  if (result)
    return objc_msgSend(objc_msgSend(*((id *)result + 1), "allObjects"), "sortedArrayUsingSelector:", "timeStampCompare:");
  return result;
}

+ (id)getErrorArray
{
  id result;

  result = -[NSMutableDictionary objectForKey:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "objectForKey:", CFSTR("TCMessageContext Instance"));
  if (result)
    return objc_msgSend(objc_msgSend(*((id *)result + 2), "allObjects"), "sortedArrayUsingSelector:", "timeStampCompare:");
  return result;
}

+ (void)setIsFileStructuredStorage:(BOOL)a3
{
  byte_540CA0 = a3;
}

+ (BOOL)isFileStructuredStorage
{
  return byte_540CA0;
}

+ (void)pushCurrentObject:(id)a3
{
  objc_msgSend(-[NSMutableDictionary objectForKey:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "objectForKey:", CFSTR("TCMessageContext Instance")), "pushObject:", a3);
}

+ (void)popCurrentObject
{
  objc_msgSend(-[NSMutableDictionary objectForKey:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "objectForKey:", CFSTR("TCMessageContext Instance")), "popObject");
}

+ (id)pushCurrentPlaceholder
{
  return objc_msgSend(-[NSMutableDictionary objectForKey:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "objectForKey:", CFSTR("TCMessageContext Instance")), "pushPlaceholder");
}

+ (void)popCurrentPlaceholder:(id)a3
{
  objc_msgSend(-[NSMutableDictionary objectForKey:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "objectForKey:", CFSTR("TCMessageContext Instance")), "popPlaceholder:", a3);
}

+ (void)replacePlaceholdersWithObjects
{
  objc_msgSend(-[NSMutableDictionary objectForKey:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "objectForKey:", CFSTR("TCMessageContext Instance")), "replacePlaceholdersWithObjects");
}

+ (unint64_t)saveObjectStack
{
  unint64_t result;

  result = (unint64_t)-[NSMutableDictionary objectForKey:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "objectForKey:", CFSTR("TCMessageContext Instance"));
  if (result)
    return (unint64_t)objc_msgSend(*(id *)(result + 24), "count");
  return result;
}

+ (void)restoreObjectStack:(unsigned int)a3
{
  id *v5;
  id *v6;
  unint64_t v7;
  id v8;
  uint64_t v9;

  v5 = (id *)-[NSMutableDictionary objectForKey:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "objectForKey:", CFSTR("TCMessageContext Instance"));
  if (v5)
  {
    v6 = v5;
    if ((unint64_t)objc_msgSend(v5[3], "count") > a3)
    {
      v7 = a3;
      do
      {
        v8 = objc_msgSend(v6[3], "lastObject");
        v9 = objc_opt_class(TCMessagePlaceholderInfo);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
          objc_msgSend(a1, "popCurrentPlaceholder:", 0);
        else
          objc_msgSend(a1, "popCurrentObject");
      }
      while ((unint64_t)objc_msgSend(v6[3], "count") > v7);
    }
  }
}

- (void)reportWarningForObject:(id)a3 affectedObject:(id)a4 warning:(TCTaggedMessageStructure *)a5 parameterList:(char *)a6
{
  NSObject *mMessageSyncQueue;
  _QWORD v7[8];

  if (a5)
  {
    mMessageSyncQueue = self->mMessageSyncQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1C7AA4;
    v7[3] = &unk_42BEC8;
    v7[4] = self;
    v7[5] = a4;
    v7[6] = a5;
    v7[7] = a6;
    dispatch_sync(mMessageSyncQueue, v7);
  }
}

- (void)reportIncompatibleMovieInfo:(id)a3 withCompatibilityLevel:(int64_t)a4
{
  NSObject *mMessageSyncQueue;
  _QWORD block[7];

  mMessageSyncQueue = self->mMessageSyncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1C7B88;
  block[3] = &unk_42BEF0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(mMessageSyncQueue, block);
}

- (id)currentObject
{
  NSObject *mMessageSyncQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_1C8750;
  v10 = sub_1C8760;
  v11 = 0;
  mMessageSyncQueue = self->mMessageSyncQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1C876C;
  v5[3] = &unk_42BF18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mMessageSyncQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)addErrorMessageEntry:(id)a3
{
  NSObject *mMessageSyncQueue;
  _QWORD v4[6];

  mMessageSyncQueue = self->mMessageSyncQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1C8890;
  v4[3] = &unk_426E28;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(mMessageSyncQueue, v4);
}

- (void)addWarningMessageEntry:(id)a3
{
  NSObject *mMessageSyncQueue;
  _QWORD v4[6];

  mMessageSyncQueue = self->mMessageSyncQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1C88F4;
  v4[3] = &unk_426E28;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(mMessageSyncQueue, v4);
}

- (void)pushObject:(id)a3
{
  NSObject *mMessageSyncQueue;
  _QWORD v4[6];

  mMessageSyncQueue = self->mMessageSyncQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1C8958;
  v4[3] = &unk_426E28;
  v4[4] = a3;
  v4[5] = self;
  dispatch_sync(mMessageSyncQueue, v4);
}

- (void)popObject
{
  NSObject *mMessageSyncQueue;
  _QWORD block[5];

  mMessageSyncQueue = self->mMessageSyncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1C89EC;
  block[3] = &unk_426DD0;
  block[4] = self;
  dispatch_sync(mMessageSyncQueue, block);
}

- (id)pushPlaceholder
{
  NSObject *mMessageSyncQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_1C8750;
  v10 = sub_1C8760;
  v11 = 0;
  mMessageSyncQueue = self->mMessageSyncQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1C8AF8;
  v5[3] = &unk_427768;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mMessageSyncQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)popPlaceholder:(id)a3
{
  NSObject *mMessageSyncQueue;
  _QWORD v4[6];

  mMessageSyncQueue = self->mMessageSyncQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1C8BA4;
  v4[3] = &unk_426E28;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(mMessageSyncQueue, v4);
}

- (void)setObject:(id)a3 forPlaceholderKey:(id)a4
{
  NSObject *mMessageSyncQueue;
  _QWORD block[7];

  mMessageSyncQueue = self->mMessageSyncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1C8C80;
  block[3] = &unk_426F18;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_sync(mMessageSyncQueue, block);
}

- (void)replacePlaceholdersWithObjects
{
  NSObject *mMessageSyncQueue;
  _QWORD block[5];

  mMessageSyncQueue = self->mMessageSyncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1C8D2C;
  block[3] = &unk_426DD0;
  block[4] = self;
  dispatch_sync(mMessageSyncQueue, block);
}

@end
