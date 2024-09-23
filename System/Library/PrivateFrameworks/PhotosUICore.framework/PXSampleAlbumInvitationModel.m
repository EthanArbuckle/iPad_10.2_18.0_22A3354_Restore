@implementation PXSampleAlbumInvitationModel

- (PXSampleAlbumInvitationModel)init
{
  PXSampleAlbumInvitationModel *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXSampleAlbumInvitationModel;
  v2 = -[PXSampleAlbumInvitationModel init](&v5, sel_init);
  if (v2)
  {
    +[PXSampleInboxModel oldDate](PXSampleInboxModel, "oldDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSampleInboxModel setCreationDate:](v2, "setCreationDate:", v3);

    -[PXSampleInboxModel setType:](v2, "setType:", 6);
    -[PXSampleInboxModel setInboxModelTitle:](v2, "setInboxModelTitle:", CFSTR("You are invited to an album."));
    -[PXSampleInboxModel setAssetsCount:](v2, "setAssetsCount:", 3);
    -[PXSampleInboxModel setSenderNames:](v2, "setSenderNames:", &unk_1E53EA0F8);
    -[PXSampleInboxModel setUserIsSender:](v2, "setUserIsSender:", 0);
    -[PXSampleInboxModel setSeen:](v2, "setSeen:", 1);
  }
  return v2;
}

- (id)leftPreviewItems
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = self;
  v3[1] = self;
  v3[2] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
