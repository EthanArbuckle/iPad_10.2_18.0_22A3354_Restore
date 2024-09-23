@implementation BAUnhandledDownloadEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classesForSerialization
{
  if (qword_1000655B0 != -1)
    dispatch_once(&qword_1000655B0, &stru_100059740);
  return (id)qword_1000655A8;
}

- (BAUnhandledDownloadEvent)initWithEventType:(int64_t)a3 download:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  BAUnhandledDownloadEvent *v11;
  BAUnhandledDownloadEvent *v12;
  BAUnhandledDownloadEvent *result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v21;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3 == 2 && !v9)
  {
    result = (BAUnhandledDownloadEvent *)os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if ((_DWORD)result)
      sub_100037860((uint64_t)result, v14, v15, v16, v17, v18, v19, v20);
    qword_1000654C8 = (uint64_t)"BUG IN BackgroundAssets: BAUnhandledDownloadEvent initialized with a failure event but a nil error.";
    qword_1000654F8 = 6;
    __break(1u);
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)BAUnhandledDownloadEvent;
    v11 = -[BAUnhandledDownloadEvent init](&v21, "init");
    v12 = v11;
    if (v11)
    {
      -[BAUnhandledDownloadEvent setType:](v11, "setType:", a3);
      -[BAUnhandledDownloadEvent setDownload:](v12, "setDownload:", v8);
      -[BAUnhandledDownloadEvent setEventError:](v12, "setEventError:", v10);
    }

    return v12;
  }
  return result;
}

- (BAUnhandledDownloadEvent)initWithCoder:(id)a3
{
  id v4;
  BAUnhandledDownloadEvent *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  void *v11;
  void *v12;
  BAUnhandledDownloadEvent *result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BAUnhandledDownloadEvent;
  v5 = -[BAUnhandledDownloadEvent init](&v21, "init");
  if (!v5)
    goto LABEL_6;
  -[BAUnhandledDownloadEvent setType:](v5, "setType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BADownload classesForSerialization](BADownload, "classesForSerialization"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("download")));
  -[BAUnhandledDownloadEvent setDownload:](v5, "setDownload:", v7);

  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("eventError")))
  {
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v8), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("eventError")));
    -[BAUnhandledDownloadEvent setEventError:](v5, "setEventError:", v11);

  }
  if ((id)-[BAUnhandledDownloadEvent type](v5, "type") == (id)2
    && (v12 = (void *)objc_claimAutoreleasedReturnValue(-[BAUnhandledDownloadEvent eventError](v5, "eventError")),
        v12,
        !v12))
  {
    result = (BAUnhandledDownloadEvent *)os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if ((_DWORD)result)
      sub_1000378D8((uint64_t)result, v14, v15, v16, v17, v18, v19, v20);
    qword_1000654C8 = (uint64_t)"BUG IN BackgroundAssets: BAUnhandledDownloadEvent initialized from coder as a failure eve"
                               "nt but with a nil error.";
    qword_1000654F8 = 6;
    __break(1u);
  }
  else
  {
LABEL_6:

    return v5;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", -[BAUnhandledDownloadEvent type](self, "type"), CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAUnhandledDownloadEvent download](self, "download"));
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("download"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAUnhandledDownloadEvent eventError](self, "eventError"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAUnhandledDownloadEvent eventError](self, "eventError"));
    objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("eventError"));

  }
}

- (id)typeString
{
  int64_t v2;
  const __CFString *v3;

  v2 = -[BAUnhandledDownloadEvent type](self, "type");
  v3 = CFSTR("Unknown");
  if (v2 == 2)
    v3 = CFSTR("Download Failed");
  if (v2 == 1)
    return CFSTR("Download Finished");
  else
    return (id)v3;
}

- (id)description
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[BAUnhandledDownloadEvent type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAUnhandledDownloadEvent typeString](self, "typeString"));
  if (v3 == 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAUnhandledDownloadEvent eventError](self, "eventError"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAUnhandledDownloadEvent download](self, "download"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Event: %@ - Error %@ - Download %@"), v4, v5, v7));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAUnhandledDownloadEvent download](self, "download"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Event: %@ - Download %@"), v4, v6));
  }

  return v8;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BADownload)download
{
  return (BADownload *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDownload:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSError)eventError
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEventError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventError, 0);
  objc_storeStrong((id *)&self->_download, 0);
}

@end
