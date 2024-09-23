@implementation PXCMMMomentShareInvitationsDataSource

- (PXCMMMomentShareInvitationsDataSource)initWithState:(id)a3
{
  id v6;
  PXCMMMomentShareInvitationsDataSource *v7;
  PXCMMMomentShareInvitationsDataSource *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMMomentShareInvitationsDataSourceManager.m"), 445, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXCMMMomentShareInvitationsDataSource;
  v7 = -[PXCMMMomentShareInvitationsDataSource init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_state, a3);

  return v8;
}

- (PXCMMMomentShareInvitationsDataSource)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMMomentShareInvitationsDataSourceManager.m"), 454, CFSTR("%s is not available as initializer"), "-[PXCMMMomentShareInvitationsDataSource init]");

  abort();
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[PXCMMMomentShareInvitationsDataSourceState momentShares](self->_state, "momentShares", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  int64_t item;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXCMMMomentShareInvitationsDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMMomentShareInvitationsDataSourceManager.m"), 471, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMMomentShareInvitationsDataSourceManager.m"), 482, CFSTR("Code which should be unreachable has been reached"));

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
    v8 = CFSTR("PXCMMMomentShareInvitationsDataSourceSection");
    return v8;
  }
  if (a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_12;
  -[PXCMMMomentShareInvitationsDataSourceState momentShares](self->_state, "momentShares");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchedObjectIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", a3->item);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXCMMMomentShareInvitationsDataSource invitationForObjectID:](self, "invitationForObjectID:", v11);
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
  -[PXCMMMomentShareInvitationsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)objectIDAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  unint64_t item;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  item = a3->item;
  -[PXCMMMomentShareInvitationsDataSourceState momentShares](self->_state, "momentShares");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchedObjectIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (item >= v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMMomentShareInvitationsDataSourceManager.m"), 494, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.item < _state.momentShares.fetchedObjectIDs.count"));

  }
  -[PXCMMMomentShareInvitationsDataSourceState momentShares](self->_state, "momentShares");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchedObjectIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", a3->item);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)invitationForObjectID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
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
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMMomentShareInvitationsDataSourceManager.m"), 500, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("momentShareObjectID"));

  }
  -[PXCMMMomentShareInvitationsDataSourceState invitationsByMomentShareObjectID](self->_state, "invitationsByMomentShareObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[PXCMMMomentShareInvitationsDataSourceState momentShares](self->_state, "momentShares");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc(MEMORY[0x1E0CD1620]);
    v17[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1680], "fetchType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v11, v9, v12, 0, 0, 1);

    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXCMMMomentShareInvitation invitationWithMomentShare:](PXCMMMomentShareInvitation, "invitationWithMomentShare:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
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
  uint64_t v13;
  __int128 v14;
  PXSimpleIndexPath *result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;
  __int128 v20;
  __int128 v21;

  v6 = a4;
  v20 = 0u;
  v21 = 0u;
  v19.receiver = self;
  v19.super_class = (Class)PXCMMMomentShareInvitationsDataSource;
  -[PXSimpleIndexPath indexPathForObjectReference:](&v19, sel_indexPathForObjectReference_, v6);
  v7 = v20;
  if ((_QWORD)v20 == *(_QWORD *)off_1E50B7E98)
  {
    if (v6)
    {
      objc_msgSend(v6, "indexPath");
      if (v16 != v7 && v17 != 0x7FFFFFFFFFFFFFFFLL && v18 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v6, "itemObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          -[PXCMMMomentShareInvitationsDataSourceState momentShares](self->_state, "momentShares");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "itemObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "momentShare");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v10, "indexOfObject:", v12);

          if (v13 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v20 = (unint64_t)-[PXCMMMomentShareInvitationsDataSource identifier](self, "identifier");
            *(_QWORD *)&v21 = v13;
            *((_QWORD *)&v21 + 1) = 0x7FFFFFFFFFFFFFFFLL;
          }
        }
      }
    }
  }
  v14 = v21;
  *(_OWORD *)&retstr->dataSourceIdentifier = v20;
  *(_OWORD *)&retstr->item = v14;

  return result;
}

- (PXCMMMomentShareInvitationsDataSourceState)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
}

+ (PXCMMMomentShareInvitationsDataSource)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCMMMomentShareInvitationsDataSourceManager.m"), 458, CFSTR("%s is not available as initializer"), "+[PXCMMMomentShareInvitationsDataSource new]");

  abort();
}

@end
