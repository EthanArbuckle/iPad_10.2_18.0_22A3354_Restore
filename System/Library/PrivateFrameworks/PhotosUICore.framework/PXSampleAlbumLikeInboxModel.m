@implementation PXSampleAlbumLikeInboxModel

- (PXSampleAlbumLikeInboxModel)init
{
  PXSampleAlbumLikeInboxModel *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXSampleAlbumLikeInboxModel;
  v2 = -[PXSampleAlbumLikeInboxModel init](&v5, sel_init);
  if (v2)
  {
    +[PXSampleInboxModel oldDate](PXSampleInboxModel, "oldDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSampleInboxModel setCreationDate:](v2, "setCreationDate:", v3);

    -[PXSampleInboxModel setType:](v2, "setType:", 2);
    -[PXSampleInboxModel setInboxModelTitle:](v2, "setInboxModelTitle:", CFSTR("I like this photo! I like this photo! I like this photo! I like this photo!"));
    -[PXSampleInboxModel setAssetsCount:](v2, "setAssetsCount:", 1);
    -[PXSampleInboxModel setSenderNames:](v2, "setSenderNames:", &unk_1E53EA0B0);
    -[PXSampleInboxModel setUserIsSender:](v2, "setUserIsSender:", 0);
    -[PXSampleInboxModel setSeen:](v2, "setSeen:", 1);
  }
  return v2;
}

@end
