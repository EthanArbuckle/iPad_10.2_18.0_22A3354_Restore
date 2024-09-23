@implementation _UIDragDestinationControllerDropProposalState

- (id)effectiveIndexPath
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    if (objc_msgSend(a1, "_hasDropActionTarget"))
      return (id *)v1[3];
    a1 = 0;
  }
  return a1;
}

- (_UIDragDestinationControllerDropProposalState)init
{
  _UIDragDestinationControllerDropProposalState *v2;
  _UIDragDestinationControllerDropProposalState *v3;
  NSIndexPath *indexPath;
  UICollectionViewDropProposal *v5;
  UICollectionViewDropProposal *proposal;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIDragDestinationControllerDropProposalState;
  v2 = -[_UIDragDestinationControllerDropProposalState init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_didDrop = 0;
    indexPath = v2->_indexPath;
    v2->_indexPath = 0;

    v5 = -[UICollectionViewDropProposal initWithDropOperation:intent:]([UICollectionViewDropProposal alloc], "initWithDropOperation:intent:", 0, 0);
    proposal = v3->_proposal;
    v3->_proposal = v5;

  }
  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSIndexPath *indexPath;
  NSIndexPath *v7;
  void *v8;
  UICollectionViewDropProposal *v9;
  _BOOL8 didDrop;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    indexPath = self->_indexPath;
  else
    indexPath = 0;
  v7 = indexPath;
  __UICVIndexPathDescription(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v9 = self->_proposal;
    didDrop = self->_didDrop;
  }
  else
  {
    v9 = 0;
    didDrop = 0;
  }
  -[_UIDragDestinationControllerDropProposalState effectiveIndexPath]((id *)&self->super.isa);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UICVIndexPathDescription(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: indexPath = %@; proposal = %@; didDrop = %d; effectiveIndexPath = %@>"),
    v5,
    v8,
    v9,
    didDrop,
    v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)_hasDropActionTarget
{
  UICollectionViewDropProposal *proposal;
  UICollectionViewDropProposal *v4;
  UICollectionViewDropProposal *v5;
  uint64_t v6;
  NSIndexPath *indexPath;

  if (self)
    proposal = self->_proposal;
  else
    proposal = 0;
  v4 = proposal;
  if (-[UICollectionViewDropProposal intent](v4, "intent") == UICollectionViewDropIntentInsertAtDestinationIndexPath)
  {

  }
  else
  {
    if (self)
      v5 = self->_proposal;
    else
      v5 = 0;
    v6 = -[UICollectionViewDropProposal intent](v5, "intent");

    if (v6 != 2)
      return 0;
  }
  if (self)
    indexPath = self->_indexPath;
  else
    indexPath = 0;
  return indexPath != 0;
}

- (void)setProposal:(id)a3
{
  objc_storeStrong((id *)&self->_proposal, a3);
}

- (void)setDidDrop:(BOOL)a3
{
  self->_didDrop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_proposal, 0);
}

@end
