@implementation MapsRadarDataAttachment

- (MapsRadarDataAttachment)initWithFileName:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  MapsRadarDataAttachment *v8;
  NSData *v9;
  NSData *data;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v12 = sub_1004318FC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "-[MapsRadarDataAttachment initWithFileName:data:]";
      v20 = 2080;
      v21 = "MapsRadarAttachment.m";
      v22 = 1024;
      v23 = 117;
      v24 = 2080;
      v25 = "data != nil";
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
        v19 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)MapsRadarDataAttachment;
  v8 = -[MapsRadarAttachment initWithFileName:](&v17, "initWithFileName:", v6);
  if (v8)
  {
    v9 = (NSData *)objc_msgSend(v7, "copy");
    data = v8->_data;
    v8->_data = v9;

  }
  return v8;
}

+ (id)attachmentWithFileName:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithFileName:data:", v7, v6);

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
  void *v9;
  unsigned int v10;
  id v11;
  NSURL *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSURL *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;

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
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDataAttachment data](self, "data"));
    v19 = 0;
    v10 = objc_msgSend(v9, "writeToURL:options:error:", v5, 1, &v19);
    v11 = v19;

    if (v10)
    {
      v12 = v5;
    }
    else
    {
      v13 = sub_10088A8D8();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarAttachment fileName](self, "fileName"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDataAttachment data](self, "data"));
        *(_DWORD *)buf = 138413058;
        v21 = v15;
        v22 = 2112;
        v23 = v16;
        v24 = 2112;
        v25 = v4;
        v26 = 2112;
        v27 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to save file with name '%@' from data '%@' at path '%@': %@", buf, 0x2Au);

      }
      v12 = 0;
    }
    v17 = self->_temporaryFileURL;
    self->_temporaryFileURL = v12;

    temporaryFileURL = self->_temporaryFileURL;
  }
  return temporaryFileURL;
}

- (id)description
{
  MapsRadarDataAttachment *v2;
  id v3;
  void ***v4;
  MapsRadarDataAttachment *v5;
  MapsRadarDataAttachment *v6;
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
  -[MapsRadarDataAttachment _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDataAttachment performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
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
  MapsRadarDataAttachment *v2;
  id v3;
  void ***v4;
  MapsRadarDataAttachment *v5;
  MapsRadarDataAttachment *v6;
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
  -[MapsRadarDataAttachment _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDataAttachment performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
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
  void (**v4)(id, const __CFString *, NSData *);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MapsRadarDataAttachment;
  v4 = (void (**)(id, const __CFString *, NSData *))a3;
  -[MapsRadarAttachment _maps_buildDescriptionWithBlock:](&v5, "_maps_buildDescriptionWithBlock:", v4);
  v4[2](v4, CFSTR("data"), self->_data);

}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_temporaryFileURL, 0);
}

@end
