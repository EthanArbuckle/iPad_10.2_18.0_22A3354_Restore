@implementation SCUIReportSensitiveMedia

- (SCUIReportSensitiveMedia)initWithURL:(id)a3 kind:(int64_t)a4 dateReceived:(id)a5
{
  id v9;
  id v10;
  SCUIReportSensitiveMedia *v11;
  SCUIReportSensitiveMedia *v12;
  uint64_t v13;
  NSDate *dateReceived;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SCUIReportSensitiveMedia;
  v11 = -[SCUIReportSensitiveMedia init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_url, a3);
    v12->_kind = a4;
    v13 = objc_msgSend(v10, "copy");
    dateReceived = v12->_dateReceived;
    v12->_dateReceived = (NSDate *)v13;

  }
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  SCUIReportSensitiveMedia *v4;
  SCUIReportSensitiveMedia *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = (SCUIReportSensitiveMedia *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SCUIReportSensitiveMedia;
    if (-[SCUIReportSensitiveMedia isEqual:](&v13, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[SCUIReportSensitiveMedia url](self, "url");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCUIReportSensitiveMedia url](v5, "url");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7)
        && (v8 = -[SCUIReportSensitiveMedia kind](self, "kind"), v8 == -[SCUIReportSensitiveMedia kind](v5, "kind")))
      {
        -[SCUIReportSensitiveMedia dateReceived](self, "dateReceived");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCUIReportSensitiveMedia dateReceived](v5, "dateReceived");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  return -[NSURL hash](self->_url, "hash");
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)kind
{
  return self->_kind;
}

- (NSDate)dateReceived
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
