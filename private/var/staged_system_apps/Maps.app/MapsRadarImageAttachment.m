@implementation MapsRadarImageAttachment

- (MapsRadarImageAttachment)initWithFileName:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  MapsRadarImageAttachment *v8;
  MapsRadarImageAttachment *v9;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  char *v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v11 = sub_1004318FC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v18 = "-[MapsRadarImageAttachment initWithFileName:image:]";
      v19 = 2080;
      v20 = "MapsRadarAttachment.m";
      v21 = 1024;
      v22 = 223;
      v23 = 2080;
      v24 = "image != nil";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v13 = sub_1004318FC();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v18 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)MapsRadarImageAttachment;
  v8 = -[MapsRadarAttachment initWithFileName:](&v16, "initWithFileName:", v6);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_image, a4);

  return v9;
}

+ (MapsRadarImageAttachment)attachmentWithFileName:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithFileName:image:", v7, v6);

  return (MapsRadarImageAttachment *)v8;
}

- (id)temporaryFileURL
{
  NSURL *temporaryFileURL;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  UIImage *v9;
  NSData *v10;
  void *v11;
  unsigned int v12;
  id v13;
  NSURL *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSURL *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;

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
    v9 = (UIImage *)objc_claimAutoreleasedReturnValue(-[MapsRadarImageAttachment image](self, "image"));
    v10 = UIImagePNGRepresentation(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v21 = 0;
    v12 = objc_msgSend(v11, "writeToURL:options:error:", v5, 1, &v21);
    v13 = v21;

    if (v12)
    {
      v14 = v5;
    }
    else
    {
      v15 = sub_10088A8D8();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarAttachment fileName](self, "fileName"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarImageAttachment image](self, "image"));
        *(_DWORD *)buf = 138413058;
        v23 = v17;
        v24 = 2112;
        v25 = v18;
        v26 = 2112;
        v27 = v4;
        v28 = 2112;
        v29 = v13;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to save file with name '%@' from image '%@' at path '%@': %@", buf, 0x2Au);

      }
      v14 = 0;
    }
    v19 = self->_temporaryFileURL;
    self->_temporaryFileURL = v14;

    temporaryFileURL = self->_temporaryFileURL;
  }
  return temporaryFileURL;
}

- (id)description
{
  MapsRadarImageAttachment *v2;
  id v3;
  void ***v4;
  MapsRadarImageAttachment *v5;
  MapsRadarImageAttachment *v6;
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
  -[MapsRadarImageAttachment _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarImageAttachment performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
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
  MapsRadarImageAttachment *v2;
  id v3;
  void ***v4;
  MapsRadarImageAttachment *v5;
  MapsRadarImageAttachment *v6;
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
  -[MapsRadarImageAttachment _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarImageAttachment performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
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
  void (**v4)(id, const __CFString *, UIImage *);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MapsRadarImageAttachment;
  v4 = (void (**)(id, const __CFString *, UIImage *))a3;
  -[MapsRadarAttachment _maps_buildDescriptionWithBlock:](&v5, "_maps_buildDescriptionWithBlock:", v4);
  v4[2](v4, CFSTR("image"), self->_image);

}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_temporaryFileURL, 0);
}

@end
