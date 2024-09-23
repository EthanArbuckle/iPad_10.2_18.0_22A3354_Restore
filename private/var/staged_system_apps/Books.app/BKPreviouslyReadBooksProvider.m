@implementation BKPreviouslyReadBooksProvider

- (BKPreviouslyReadBooksProvider)init
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  BKPreviouslyReadBooksProvider *v8;
  objc_super v10;
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager fetchRequestForPreviouslyRead](BKLibraryManager, "fetchRequestForPreviouslyRead"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIAsset propertiesNeededFromBKLibraryAsset](BSUIAsset, "propertiesNeededFromBKLibraryAsset"));
  objc_msgSend(v3, "setPropertiesToFetch:", v4);

  v6 = BCCurrentBookLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Initializing previously read books provider", buf, 2u);
  }

  v10.receiver = self;
  v10.super_class = (Class)BKPreviouslyReadBooksProvider;
  v8 = -[BKLibraryProvider initWithFetchRequest:name:](&v10, "initWithFetchRequest:name:", v3, CFSTR("previouslyRead"));

  return v8;
}

+ (id)getInstance
{
  return objc_alloc_init((Class)a1);
}

@end
