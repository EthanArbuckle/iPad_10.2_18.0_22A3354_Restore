@implementation _PXStoryTimeBasedAssetInfo

- (_PXStoryTimeBasedAssetInfo)initWithDate:(id)a3 uuid:(id)a4
{
  id v7;
  id v8;
  _PXStoryTimeBasedAssetInfo *v9;
  _PXStoryTimeBasedAssetInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PXStoryTimeBasedAssetInfo;
  v9 = -[_PXStoryTimeBasedAssetInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_date, a3);
    objc_storeStrong((id *)&v10->_uuid, a4);
  }

  return v10;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
