@implementation UAFAssetSetStatus

- (UAFAssetSetStatus)initWithStatus:(unint64_t)a3 percent:(double)a4 completedBytes:(unint64_t)a5 totalBytes:(unint64_t)a6
{
  UAFAssetSetStatus *v10;
  UAFAssetSetStatus *v11;
  UAFAssetSetStatus *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UAFAssetSetStatus;
  v10 = -[UAFAssetSetStatus init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_totalBytes = a6;
    v10->_downloadStatus = a3;
    v10->_completedPercent = a4;
    v10->_completedBytes = a5;
    v12 = v10;
  }

  return v11;
}

- (double)completedPercent
{
  return self->_completedPercent;
}

- (unint64_t)completedBytes
{
  return self->_completedBytes;
}

- (unint64_t)totalBytes
{
  return self->_totalBytes;
}

- (unint64_t)downloadStatus
{
  return self->_downloadStatus;
}

@end
