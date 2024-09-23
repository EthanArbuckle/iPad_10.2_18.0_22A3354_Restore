@implementation CRLPKImageRendererPool

- (CRLPKImageRendererPool)init
{
  CRLPKImageRendererPool *v2;
  uint64_t v3;
  NSMutableArray *rendererContainers;
  dispatch_queue_t v5;
  OS_dispatch_queue *containerAccessQueue;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CRLPKImageRendererPool;
  v2 = -[CRLPKImageRendererPool init](&v11, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    rendererContainers = v2->_rendererContainers;
    v2->_rendererContainers = (NSMutableArray *)v3;

    v5 = dispatch_queue_create("com.apple.freeform.CRLPKImageRendererPool", 0);
    containerAccessQueue = v2->_containerAccessQueue;
    v2->_containerAccessQueue = (OS_dispatch_queue *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, "p_didReceiveMemoryWarning:", UIApplicationDidReceiveMemoryWarningNotification, v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, "p_applicationDidEnterBackground:", UIApplicationDidEnterBackgroundNotification, v9);

  }
  return v2;
}

+ (CRLPKImageRendererPool)sharedPool
{
  if (qword_101415760 != -1)
    dispatch_once(&qword_101415760, &stru_101257BB0);
  return (CRLPKImageRendererPool *)(id)qword_101415758;
}

- (void)asyncFlushAllUnlockedRenderers
{
  NSObject *containerAccessQueue;
  _QWORD block[5];

  containerAccessQueue = self->_containerAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003A5D08;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_async(containerAccessQueue, block);
}

- (void)provideImageRendererOfMinimumSize:(CGSize)a3 sixChannelBlending:(BOOL)a4 inBlock:(id)a5
{
  double height;
  double width;
  void (**v9)(id, void *);
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *containerAccessQueue;
  void *v16;
  _QWORD block[8];
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[24];

  height = a3.height;
  width = a3.width;
  v9 = (void (**)(id, void *))a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1003A5FFC;
  v23 = sub_1003A600C;
  v24 = 0;
  if ((sub_100061860(width, height) & 1) == 0)
  {
    v10 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257BD0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2AB84();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257BF0);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100E02830(v12, buf, v10, (os_log_t)v11);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKImageRendererPool provideImageRendererOfMinimumSize:sixChannelBlending:inBlock:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPencilKitRenderer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 194, 0, "Can't provide an image renderer for a non-finite size");

  }
  containerAccessQueue = self->_containerAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003A6074;
  block[3] = &unk_101257C58;
  *(double *)&block[6] = width;
  *(double *)&block[7] = height;
  v18 = a4;
  block[4] = self;
  block[5] = &v19;
  dispatch_sync(containerAccessQueue, block);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v20[5], "imageRenderer"));
  v9[2](v9, v16);

  objc_msgSend((id)v20[5], "unlockRenderer");
  _Block_object_dispose(&v19, 8);

}

- (void)p_flushUnlockedRenderersLeavingMaxCount:(unint64_t)a3
{
  char *v5;
  char *v6;
  char *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  unint64_t v13;
  void *v14;
  id v15;

  v5 = (char *)-[NSMutableArray count](self->_rendererContainers, "count");
  if ((unint64_t)v5 > a3)
  {
    v6 = v5;
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
    v7 = 0;
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_rendererContainers, "objectAtIndexedSubscript:", v7));
      if (objc_msgSend(v8, "tryLockingRenderer"))
        objc_msgSend(v15, "addIndex:", v7);

      ++v7;
    }
    while (v6 != v7);
    v9 = objc_msgSend(v15, "count");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
    v11 = objc_msgSend(v15, "firstIndex");
    if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = v11;
      v13 = (unint64_t)v9 - a3;
      do
      {
        if ((unint64_t)objc_msgSend(v10, "count") >= v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_rendererContainers, "objectAtIndexedSubscript:", v12));
          objc_msgSend(v14, "unlockRenderer");

        }
        else
        {
          objc_msgSend(v10, "addIndex:", v12);
        }
        v12 = objc_msgSend(v15, "indexGreaterThanIndex:", v12);
      }
      while (v12 != (id)0x7FFFFFFFFFFFFFFFLL);
    }
    -[NSMutableArray removeObjectsAtIndexes:](self->_rendererContainers, "removeObjectsAtIndexes:", v10);

  }
}

- (void)p_didReceiveMemoryWarning:(id)a3
{
  -[CRLPKImageRendererPool asyncFlushAllUnlockedRenderers](self, "asyncFlushAllUnlockedRenderers", a3);
}

- (void)p_applicationDidEnterBackground:(id)a3
{
  -[CRLPKImageRendererPool asyncFlushAllUnlockedRenderers](self, "asyncFlushAllUnlockedRenderers", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerAccessQueue, 0);
  objc_storeStrong((id *)&self->_rendererContainers, 0);
}

@end
