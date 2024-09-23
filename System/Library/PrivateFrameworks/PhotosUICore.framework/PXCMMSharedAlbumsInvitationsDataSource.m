@implementation PXCMMSharedAlbumsInvitationsDataSource

- (PXCMMSharedAlbumsInvitationsDataSource)initWithState:(id)a3
{
  id v5;
  PXCMMSharedAlbumsInvitationsDataSource *v6;
  PXCMMSharedAlbumsInvitationsDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXCMMSharedAlbumsInvitationsDataSource;
  v6 = -[PXCMMSharedAlbumsInvitationsDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->__state, a3);

  return v7;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[PXCMMSharedAlbumsInvitationsDataSource _state](self, "_state", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedAlbums");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  int64_t item;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXCMMSharedAlbumsInvitationsDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMSharedAlbumsInvitationsDataSourceManager.m"), 355, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMSharedAlbumsInvitationsDataSourceManager.m"), 367, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  item = a3->item;
  if (a3->section == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_12;
  }
  else if (item == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = CFSTR("PXCMMSharedAlbumsInvitationsDataSourceSection");
    return v8;
  }
  if (a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_12;
  -[PXCMMSharedAlbumsInvitationsDataSource _state](self, "_state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sharedAlbums");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchedObjectIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", a3->item);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXCMMSharedAlbumsInvitationsDataSource invitationForObjectID:](self, "invitationForObjectID:", v12);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)invitationAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;
  _OWORD v5[2];

  v3 = *(_OWORD *)&a3->item;
  v5[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v5[1] = v3;
  -[PXCMMSharedAlbumsInvitationsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)objectIDAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  unint64_t item;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  item = a3->item;
  -[PXCMMSharedAlbumsInvitationsDataSource _state](self, "_state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sharedAlbums");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchedObjectIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (item >= v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMSharedAlbumsInvitationsDataSourceManager.m"), 379, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.item < self._state.sharedAlbums.fetchedObjectIDs.count"));

  }
  -[PXCMMSharedAlbumsInvitationsDataSource _state](self, "_state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sharedAlbums");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchedObjectIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", a3->item);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)invitationForObjectID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMSharedAlbumsInvitationsDataSourceManager.m"), 385, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharedAlbumObjectID"));

  }
  -[PXCMMSharedAlbumsInvitationsDataSource _state](self, "_state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invitationsBySharedAlbumObjectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0CD1620]);
    v17[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v9, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v10, v11, v12, 0, 0, 1);

    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXCMMSharedAlbumInvitation invitationWithAssetCollection:](PXCMMSharedAlbumInvitation, "invitationWithAssetCollection:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v6;
  uint64_t v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  PXSimpleIndexPath *result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;
  __int128 v21;
  __int128 v22;

  v6 = a4;
  v21 = 0u;
  v22 = 0u;
  v20.receiver = self;
  v20.super_class = (Class)PXCMMSharedAlbumsInvitationsDataSource;
  -[PXSimpleIndexPath indexPathForObjectReference:](&v20, sel_indexPathForObjectReference_, v6);
  v7 = v21;
  if ((_QWORD)v21 == *(_QWORD *)off_1E50B7E98)
  {
    if (v6)
    {
      objc_msgSend(v6, "indexPath");
      if (v17 != v7 && v18 != 0x7FFFFFFFFFFFFFFFLL && v19 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v6, "itemObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          -[PXCMMSharedAlbumsInvitationsDataSource _state](self, "_state");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "sharedAlbums");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "itemObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "assetCollection");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v11, "indexOfObject:", v13);

          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v21 = (unint64_t)-[PXCMMSharedAlbumsInvitationsDataSource identifier](self, "identifier");
            *(_QWORD *)&v22 = v14;
            *((_QWORD *)&v22 + 1) = 0x7FFFFFFFFFFFFFFFLL;
          }
        }
      }
    }
  }
  v15 = v22;
  *(_OWORD *)&retstr->dataSourceIdentifier = v21;
  *(_OWORD *)&retstr->item = v15;

  return result;
}

- (PXCMMSharedAlbumsInvitationsDataSourceState)_state
{
  return self->__state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__state, 0);
}

@end
