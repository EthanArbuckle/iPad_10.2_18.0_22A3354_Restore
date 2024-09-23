@implementation RideBookingImageCache

+ (id)sharedCache
{
  if (qword_1014D1EE8 != -1)
    dispatch_once(&qword_1014D1EE8, &stru_1011AEE80);
  return (id)qword_1014D1EE0;
}

- (void)cacheINImageData:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  RideBookingImageCache *v8;
  NSMutableDictionary *imageCache;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  uint64_t Log;
  NSObject *v15;
  char *v16;
  id v17;
  NSString *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  char *v22;
  __int16 v23;
  id v24;
  CGSize v25;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = self;
    objc_sync_enter(v8);
    imageCache = v8->_imageCache;
    if (!imageCache)
    {
      v10 = objc_opt_new(NSMutableDictionary);
      v11 = v8->_imageCache;
      v8->_imageCache = v10;

      imageCache = v8->_imageCache;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](imageCache, "objectForKeyedSubscript:", v7));

    if (!v12)
    {
      if (qword_1014D1EF8 != -1)
        dispatch_once(&qword_1014D1EF8, &stru_1011AEEA0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:scale:](UIImage, "imageWithData:scale:", v6, *(double *)&qword_1014D1EF0));
      if (v13)
      {
        Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
        v15 = (id)objc_claimAutoreleasedReturnValue(Log);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/Utils/RideBookingImageCache.m");
          v17 = objc_alloc((Class)NSString);
          objc_msgSend(v13, "size");
          v18 = NSStringFromCGSize(v25);
          v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          v20 = objc_msgSend(v17, "initWithFormat:", CFSTR("Caching image for key %@. Size: %@, Scale: %g"), v7, v19, qword_1014D1EF0);
          *(_DWORD *)buf = 136315394;
          v22 = v16;
          v23 = 2112;
          v24 = v20;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_imageCache, "setObject:forKeyedSubscript:", v13, v7);
      }

    }
    objc_sync_exit(v8);

  }
}

- (id)imageForKey:(id)a3
{
  id v4;
  RideBookingImageCache *v5;
  NSMutableDictionary *imageCache;
  void *v7;
  void *v8;
  id v9;
  uint64_t Log;
  NSObject *v11;
  char *v12;
  id v13;
  int v15;
  char *v16;
  __int16 v17;
  id v18;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    imageCache = v5->_imageCache;
    if (imageCache)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](imageCache, "objectForKey:", v4));
      v8 = v7;
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
        v11 = (id)objc_claimAutoreleasedReturnValue(Log);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/Utils/RideBookingImageCache.m");
          v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("image in the cache is nil."));
          v15 = 136315394;
          v16 = v12;
          v17 = 2112;
          v18 = v13;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{RBError}{%s}: %@", (uint8_t *)&v15, 0x16u);

        }
      }

    }
    else
    {
      v8 = 0;
    }
    objc_sync_exit(v5);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSMutableDictionary)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end
