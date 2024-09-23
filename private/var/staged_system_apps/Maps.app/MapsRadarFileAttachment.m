@implementation MapsRadarFileAttachment

- (MapsRadarFileAttachment)initWithFileName:(id)a3 fileURL:(id)a4
{
  id v6;
  id v7;
  MapsRadarFileAttachment *v8;
  NSURL *v9;
  NSURL *fileURL;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  char *v21;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v12 = sub_1004318FC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v24 = "-[MapsRadarFileAttachment initWithFileName:fileURL:]";
      v25 = 2080;
      v26 = "MapsRadarAttachment.m";
      v27 = 1024;
      v28 = 167;
      v29 = 2080;
      v30 = "fileURL != nil";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v24 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if ((objc_msgSend(v7, "isFileURL") & 1) == 0)
  {
    v17 = sub_1004318FC();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v24 = "-[MapsRadarFileAttachment initWithFileName:fileURL:]";
      v25 = 2080;
      v26 = "MapsRadarAttachment.m";
      v27 = 1024;
      v28 = 168;
      v29 = 2080;
      v30 = "[fileURL isFileURL]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v19 = sub_1004318FC();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v24 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)MapsRadarFileAttachment;
  v8 = -[MapsRadarAttachment initWithFileName:](&v22, "initWithFileName:", v6);
  if (v8)
  {
    v9 = (NSURL *)objc_msgSend(v7, "copy");
    fileURL = v8->_fileURL;
    v8->_fileURL = v9;

  }
  return v8;
}

+ (id)attachmentWithFileName:(id)a3 fileURL:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithFileName:fileURL:", v7, v6);

  return v8;
}

- (id)temporaryFileURL
{
  NSURL *temporaryFileURL;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  _BOOL4 deleteOnAttach;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  NSURL *v14;
  unsigned int v15;
  id v16;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  NSURL *v21;
  id v23;
  id v24;
  uint8_t buf[4];
  const __CFString *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;

  temporaryFileURL = self->_temporaryFileURL;
  if (!temporaryFileURL)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarAttachment _filePath](self, "_filePath"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v7 = objc_msgSend(v6, "fileExistsAtPath:", v4);

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      objc_msgSend(v8, "removeItemAtPath:error:", v4, 0);

    }
    deleteOnAttach = self->_deleteOnAttach;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarFileAttachment fileURL](self, "fileURL"));
    if (deleteOnAttach)
    {
      v24 = 0;
      v12 = objc_msgSend(v10, "moveItemAtURL:toURL:error:", v11, v5, &v24);
      v13 = v24;

      if ((v12 & 1) != 0)
      {
LABEL_6:
        v14 = v5;
LABEL_14:
        v21 = self->_temporaryFileURL;
        self->_temporaryFileURL = v14;

        temporaryFileURL = self->_temporaryFileURL;
        return temporaryFileURL;
      }
    }
    else
    {
      v23 = 0;
      v15 = objc_msgSend(v10, "copyItemAtURL:toURL:error:", v11, v5, &v23);
      v13 = v23;

      if (v15)
        goto LABEL_6;
    }
    v16 = sub_10088A8D8();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      if (self->_deleteOnAttach)
        v18 = CFSTR("move");
      else
        v18 = CFSTR("copy");
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarAttachment fileName](self, "fileName"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarFileAttachment fileURL](self, "fileURL"));
      *(_DWORD *)buf = 138413314;
      v26 = v18;
      v27 = 2112;
      v28 = v19;
      v29 = 2112;
      v30 = v20;
      v31 = 2112;
      v32 = v4;
      v33 = 2112;
      v34 = v13;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to %@ file with name '%@' from path '%@' to path '%@': %@", buf, 0x34u);

    }
    v14 = 0;
    goto LABEL_14;
  }
  return temporaryFileURL;
}

- (id)description
{
  MapsRadarFileAttachment *v2;
  id v3;
  void ***v4;
  MapsRadarFileAttachment *v5;
  MapsRadarFileAttachment *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;

  v2 = self;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10088C7B0;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[MapsRadarFileAttachment _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
  v5 = v2;
  v6 = v5;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_9;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarFileAttachment performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11, v16, v17, v18, v19));

      goto LABEL_7;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_7:

LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v12, v13));

  return v14;
}

- (id)debugDescription
{
  MapsRadarFileAttachment *v2;
  id v3;
  void ***v4;
  MapsRadarFileAttachment *v5;
  MapsRadarFileAttachment *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  void *v19;
  id v20;

  v2 = self;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10088C930;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[MapsRadarFileAttachment _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
  v5 = v2;
  v6 = v5;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_9;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarFileAttachment performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11, v16, v17, v18, v19));

      goto LABEL_7;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_7:

LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ {\n%@\n}"), v12, v13));

  return v14;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  void (**v4)(id, const __CFString *, NSURL *);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MapsRadarFileAttachment;
  v4 = (void (**)(id, const __CFString *, NSURL *))a3;
  -[MapsRadarAttachment _maps_buildDescriptionWithBlock:](&v5, "_maps_buildDescriptionWithBlock:", v4);
  v4[2](v4, CFSTR("file url"), self->_fileURL);

}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (BOOL)deleteOnAttach
{
  return self->_deleteOnAttach;
}

- (void)setDeleteOnAttach:(BOOL)a3
{
  self->_deleteOnAttach = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_temporaryFileURL, 0);
}

@end
