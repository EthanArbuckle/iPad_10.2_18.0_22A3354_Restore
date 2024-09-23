@implementation BKLibraryImportStatus

+ (id)statusWithAssetID:(id)a3 progressValue:(double)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithAssetID:progressValue:", v6, a4);

  return v7;
}

- (BKLibraryImportStatus)initWithAssetID:(id)a3 progressValue:(double)a4
{
  id v6;
  BKLibraryImportStatus *v7;
  NSString *v8;
  NSString *assetID;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKLibraryImportStatus;
  v7 = -[BKLibraryImportStatus init](&v11, "init");
  if (v7)
  {
    v8 = (NSString *)objc_msgSend(v6, "copy");
    assetID = v7->_assetID;
    v7->_assetID = v8;

    v7->_progressValue = a4;
  }

  return v7;
}

- (void)updateWithStatus:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  double v7;
  double v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "assetID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryImportStatus assetID](self, "assetID"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    objc_msgSend(v9, "progressValue");
    if (v7 != self->_progressValue)
    {
      -[BKLibraryImportStatus willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("progressValue"));
      objc_msgSend(v9, "progressValue");
      self->_progressValue = v8;
      -[BKLibraryImportStatus didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("progressValue"));
    }
  }

}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p assetID=%@ progressValue=%f>"), v5, self, self->_assetID, *(_QWORD *)&self->_progressValue));

  return (NSString *)v6;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (double)progressValue
{
  return self->_progressValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
