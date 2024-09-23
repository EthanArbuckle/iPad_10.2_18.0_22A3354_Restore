@implementation FREditorialItemCreator

- (FREditorialItemCreator)initWithThumbnailCreator:(id)a3
{
  id v5;
  FREditorialItemCreator *v6;
  FREditorialItemCreator *v7;
  objc_super v9;

  v5 = a3;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100079F24();
  v9.receiver = self;
  v9.super_class = (Class)FREditorialItemCreator;
  v6 = -[FREditorialItemCreator init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_thumbnailCreator, a3);

  return v7;
}

- (FREditorialItemCreator)init
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FREditorialItemCreator init]";
    v7 = 2080;
    v8 = "FREditorialItemCreator.m";
    v9 = 1024;
    v10 = 27;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FREditorialItemCreator init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (id)createEditorialItemFromCachedEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "image"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialItemCreator thumbnailCreator](self, "thumbnailCreator"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "image"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "editorialThumbnailImageWith:", v8));

    }
    else
    {
      v9 = 0;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    if (objc_msgSend(v5, "showBadge"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
      objc_msgSend(v11, "addObject:", v12);

    }
    v13 = objc_alloc((Class)TSEditorialItem);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorialItemID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subtitle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subtitleColorString"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actionUrlString"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v18));
    v10 = objc_msgSend(v13, "initWithIdentifier:title:subtitle:subtitleColor:attributes:actionURL:thumbnailImage:backingTag:headline:", v14, v15, v16, v17, v11, v19, v9, 0, 0);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (FREditorialItemThumbnailCreator)thumbnailCreator
{
  return self->_thumbnailCreator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailCreator, 0);
}

@end
