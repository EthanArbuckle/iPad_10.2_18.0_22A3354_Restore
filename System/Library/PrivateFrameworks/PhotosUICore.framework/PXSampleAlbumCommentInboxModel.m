@implementation PXSampleAlbumCommentInboxModel

- (PXSampleAlbumCommentInboxModel)init
{
  PXSampleAlbumCommentInboxModel *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXSampleAlbumCommentInboxModel;
  v2 = -[PXSampleAlbumCommentInboxModel init](&v5, sel_init);
  if (v2)
  {
    +[PXSampleInboxModel oldDate](PXSampleInboxModel, "oldDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSampleInboxModel setCreationDate:](v2, "setCreationDate:", v3);

    -[PXSampleInboxModel setType:](v2, "setType:", 1);
    -[PXSampleInboxModel setInboxModelTitle:](v2, "setInboxModelTitle:", CFSTR("Look a comment! Look a comment! Look a comment! Look a comment!"));
    -[PXSampleInboxModel setAssetsCount:](v2, "setAssetsCount:", 1);
    -[PXSampleInboxModel setSenderNames:](v2, "setSenderNames:", &unk_1E53EA098);
    -[PXSampleInboxModel setUserIsSender:](v2, "setUserIsSender:", 0);
    -[PXSampleInboxModel setSeen:](v2, "setSeen:", 1);
  }
  return v2;
}

@end
