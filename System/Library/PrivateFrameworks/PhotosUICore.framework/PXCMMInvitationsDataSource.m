@implementation PXCMMInvitationsDataSource

- (id)invitationAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;
  _OWORD v5[2];

  v3 = *(_OWORD *)&a3->item;
  v5[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v5[1] = v3;
  -[PXCMMInvitationsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)objectIDAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationsDataSourceManager.m"), 111, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXCMMInvitationsDataSource objectIDAtItemIndexPath:]", v7);

  abort();
}

- (id)invitationForObjectID:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationsDataSourceManager.m"), 115, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXCMMInvitationsDataSource invitationForObjectID:]", v8);

  abort();
}

@end
