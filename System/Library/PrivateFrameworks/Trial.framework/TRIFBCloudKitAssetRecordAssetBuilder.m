@implementation TRIFBCloudKitAssetRecordAssetBuilder

- (void)dealloc
{
  CloudKitAssetRecordAssetBuilder *bldr;
  objc_super v4;

  bldr = self->_bldr;
  if (bldr)
    MEMORY[0x1A1AC6820](bldr, 0x1020C403A5D3213);
  v4.receiver = self;
  v4.super_class = (Class)TRIFBCloudKitAssetRecordAssetBuilder;
  -[TRIFBCloudKitAssetRecordAssetBuilder dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owner, 0);
}

@end
