@implementation BKCoverResourceProvider

- (BKCoverResourceProvider)init
{
  BKCoverResourceProvider *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *resourceQueue;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *notifyQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BKCoverResourceProvider;
  v2 = -[BKCoverResourceProvider init](&v12, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("BKCoverResourceProvider.resourceQueue", v4);
    resourceQueue = v2->_resourceQueue;
    v2->_resourceQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("BKCoverResourceProvider.notifyQueue", v8);
    notifyQueue = v2->_notifyQueue;
    v2->_notifyQueue = (OS_dispatch_queue *)v9;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1009F5020 != -1)
    dispatch_once(&qword_1009F5020, &stru_1008EB590);
  return (id)qword_1009F5018;
}

- (id)imageResourceForNaturalSize:(CGSize)a3 contentsScale:(double)a4 instance:(id)a5 options:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  _BKCoverResource *v21;
  uint64_t v22;
  NSObject *v23;
  void *v25;
  NSString *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  CGSize v34;

  height = a3.height;
  width = a3.width;
  v11 = a6;
  v12 = a5;
  v13 = objc_opt_class(NSString);
  v14 = BUDynamicCast(v13, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = objc_opt_class(NSDictionary);
  v17 = BUDynamicCast(v16, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  if (!v15 || (width == CGSizeZero.width ? (v20 = height == CGSizeZero.height) : (v20 = 0), v20))
  {
    v22 = BCImageCacheLog(v19);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "debugDescription"));
      v34.width = width;
      v34.height = height;
      v26 = NSStringFromCGSize(v34);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v28 = 138412802;
      v29 = v15;
      v30 = 2112;
      v31 = v25;
      v32 = 2112;
      v33 = v27;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "BKCoverResourceProvider: Can't generate image resource for assetID %@ with option %@ and size %@", (uint8_t *)&v28, 0x20u);

    }
    v21 = 0;
  }
  else
  {
    v21 = -[_BKCoverResource initWithQueue:notifyQueue:assetID:resourceOptions:naturalSize:contentsScale:]([_BKCoverResource alloc], "initWithQueue:notifyQueue:assetID:resourceOptions:naturalSize:contentsScale:", self->_resourceQueue, self->_notifyQueue, v15, v18, width, height, a4);
  }

  return v21;
}

- (id)intrinsicImageResourceForInstance:(id)a3 options:(id)a4
{
  return -[BKCoverResourceProvider imageResourceForNaturalSize:contentsScale:instance:options:](self, "imageResourceForNaturalSize:contentsScale:instance:options:", a3, a4, 100.0, 156.0, 1.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_resourceQueue, 0);
}

@end
