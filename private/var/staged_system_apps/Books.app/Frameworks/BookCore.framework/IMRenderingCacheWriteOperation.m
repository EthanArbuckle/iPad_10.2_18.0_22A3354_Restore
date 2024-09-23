@implementation IMRenderingCacheWriteOperation

- (IMRenderingCacheWriteOperation)initWithImage:(id)a3 key:(id)a4 format:(int)a5 persistentCachePath:(id)a6
{
  id v10;
  id v11;
  id v12;
  IMRenderingCacheWriteOperation *v13;
  IMRenderingCacheWriteOperation *v14;
  NSString *v15;
  NSString *path;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = -[IMRenderingCacheWriteOperation init](self, "init");
  v14 = v13;
  if (v13)
  {
    -[IMRenderingCacheWriteOperation setImage:](v13, "setImage:", v10);
    objc_storeStrong((id *)&v14->_key, a4);
    v15 = (NSString *)objc_msgSend(v12, "copy");
    path = v14->_path;
    v14->_path = v15;

    v14->_serializeFormat = a5;
    if (!-[NSString length](v14->_key, "length"))
      +[NSException raise:format:](NSException, "raise:format:", CFSTR("NSIllegalState"), CFSTR("IMRenderingCacheWriteOperation does not have _key"));
    if (!v14->_image)
      +[NSException raise:format:](NSException, "raise:format:", CFSTR("NSIllegalState"), CFSTR("IMRenderingCacheWriteOperation does not have _image"));
    if (!v14->_path)
      +[NSException raise:format:](NSException, "raise:format:", CFSTR("NSIllegalState"), CFSTR("IMRenderingCacheWriteOperation does not have _persistentCachePath"));
    -[IMRenderingCacheWriteOperation setCompressionQuality:](v14, "setCompressionQuality:", 0.699999988);
  }

  return v14;
}

- (void)cancel
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)IMRenderingCacheWriteOperation;
  -[IMRenderingCacheWriteOperation cancel](&v2, "cancel");
}

- (void)dealloc
{
  NSString *path;
  objc_super v4;

  path = self->_path;
  self->_path = 0;

  v4.receiver = self;
  v4.super_class = (Class)IMRenderingCacheWriteOperation;
  -[IMRenderingCacheWriteOperation dealloc](&v4, "dealloc");
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  unsigned __int8 v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  CFStringRef v14;
  _UNKNOWN **v15;

  if ((-[IMRenderingCacheWriteOperation isCancelled](self, "isCancelled") & 1) == 0
    && -[IMRenderingCacheWriteOperation serializeFormat](self, "serializeFormat") != -1)
  {
    -[IMRenderingCacheWriteOperation setThreadPriority:](self, "setThreadPriority:", 0.1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMRenderingCacheWriteOperation mimeForIMRenderingCacheSerializeFormat:](IMRenderingCacheWriteOperation, "mimeForIMRenderingCacheSerializeFormat:", -[IMRenderingCacheWriteOperation serializeFormat](self, "serializeFormat")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMPersistentCacheManager sharedInstance](IMPersistentCacheManager, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cacheForPath:maxSize:", self->_path, 0));

    -[IMRenderingCacheWriteOperation serializeFormat](self, "serializeFormat");
    if ((-[IMRenderingCacheWriteOperation isCancelled](self, "isCancelled") & 1) != 0)
      goto LABEL_10;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCacheWriteOperation key](self, "key"));
    v7 = objc_msgSend(v5, "hasItemForKey:", v6);

    if ((v7 & 1) != 0)
      goto LABEL_10;
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[IMRenderingCacheWriteOperation image](self, "image")));
    if (objc_msgSend(v8, "CGImage") && objc_msgSend(v3, "length"))
    {
      v9 = -[IMRenderingCacheWriteOperation isCancelled](self, "isCancelled");

      if ((v9 & 1) != 0)
      {
LABEL_10:
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMPersistentCacheManager sharedInstance](IMPersistentCacheManager, "sharedInstance"));
        objc_msgSend(v13, "purgeFromCache:", self->_path);

        -[IMRenderingCacheWriteOperation setImage:](self, "setImage:", 0);
        return;
      }
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[IMRenderingCacheWriteOperation image](self, "image")));
      v10 = objc_msgSend(v8, "CGImage");
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCacheWriteOperation key](self, "key"));
      v14 = kCGImageDestinationLossyCompressionQuality;
      v15 = &off_2B2FD0;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
      objc_msgSend(v5, "insertCGImage:forKey:mimeType:properties:", v10, v11, v3, v12);

    }
    goto LABEL_10;
  }
}

+ (id)mimeForIMRenderingCacheSerializeFormat:(int)a3
{
  if (a3 > 2)
    return 0;
  else
    return *off_28DDB8[a3];
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> [Image: %p] [AssetID: %@] [Key: %@]"), objc_opt_class(self), self, self->_image, self->_assetID, self->_key);
}

- (NSString)key
{
  return self->_key;
}

- (int)serializeFormat
{
  return self->_serializeFormat;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (double)compressionQuality
{
  return self->_compressionQuality;
}

- (void)setCompressionQuality:(double)a3
{
  self->_compressionQuality = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
