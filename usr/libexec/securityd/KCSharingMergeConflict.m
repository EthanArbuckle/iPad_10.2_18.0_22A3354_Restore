@implementation KCSharingMergeConflict

- (KCSharingMergeConflict)initWithRemotelyChangedIncomingDatabaseItem:(SecDbItem *)a3 locallyDeletedOutgoingDatabaseItem:(SecDbItem *)a4
{
  KCSharingMergeConflict *v6;
  KCSharingMergeConflict *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)KCSharingMergeConflict;
  v6 = -[KCSharingMergeConflict init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->_type = 1;
    objc_storeStrong(&v6->_incomingDatabaseItem, a3);
    objc_storeStrong(&v7->_outgoingDatabaseItem, a4);
  }
  return v7;
}

- (KCSharingMergeConflict)initWithRemotelyChangedIncomingDatabaseItem:(SecDbItem *)a3 locallyChangedOutgoingDatabaseItem:(SecDbItem *)a4
{
  KCSharingMergeConflict *v6;
  KCSharingMergeConflict *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)KCSharingMergeConflict;
  v6 = -[KCSharingMergeConflict init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->_type = 3;
    objc_storeStrong(&v6->_incomingDatabaseItem, a3);
    objc_storeStrong(&v7->_outgoingDatabaseItem, a4);
  }
  return v7;
}

- (KCSharingMergeConflict)initWithRemotelyDeletedIncomingDatabaseItem:(SecDbItem *)a3 locallyChangedOutgoingDatabaseItem:(SecDbItem *)a4 mirrorDatabaseItem:(SecDbItem *)a5
{
  KCSharingMergeConflict *v8;
  KCSharingMergeConflict *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)KCSharingMergeConflict;
  v8 = -[KCSharingMergeConflict init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_type = 2;
    objc_storeStrong(&v8->_incomingDatabaseItem, a3);
    objc_storeStrong(&v9->_outgoingDatabaseItem, a4);
    objc_storeStrong(&v9->_mirrorDatabaseItem, a5);
  }
  return v9;
}

- (KCSharingMergeConflict)initWithRemotelyDeletedIncomingDatabaseItem:(SecDbItem *)a3 locallyDeletedOutgoingDatabaseItem:(SecDbItem *)a4 mirrorDatabaseItem:(SecDbItem *)a5
{
  KCSharingMergeConflict *v8;
  KCSharingMergeConflict *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)KCSharingMergeConflict;
  v8 = -[KCSharingMergeConflict init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_type = 0;
    objc_storeStrong(&v8->_incomingDatabaseItem, a3);
    objc_storeStrong(&v9->_outgoingDatabaseItem, a4);
    objc_storeStrong(&v9->_mirrorDatabaseItem, a5);
  }
  return v9;
}

- (id)resolveWithAccessGroups:(id)a3 error:(id *)a4
{
  id v6;
  KCSharingDatabaseUpdatePlan *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  KCSharingIncomingEntry *v12;
  KCSharingOutgoingDeletion *v13;
  KCSharingIncomingEntry *v14;
  void *v15;
  KCSharingOutgoingDeletion *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  KCSharingDatabaseUpdatePlan *v22;
  void *v23;
  uint64_t v24;
  KCSharingIncomingEntry *v25;
  void *v26;
  KCSharingOutgoingEntry *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  KCSharingMirrorEntry *v36;
  void *v37;
  KCSharingMirrorEntry *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unsigned int v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  KCSharingMirrorEntry *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;

  v6 = a3;
  v7 = objc_alloc_init(KCSharingDatabaseUpdatePlan);
  switch(-[KCSharingMergeConflict type](self, "type"))
  {
    case 0:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDatabaseUpdatePlan itemsToDelete](v7, "itemsToDelete"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingMergeConflict mirrorDatabaseItem](self, "mirrorDatabaseItem"));
      objc_msgSend(v8, "addObject:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDatabaseUpdatePlan itemsToDelete](v7, "itemsToDelete"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingMergeConflict incomingDatabaseItem](self, "incomingDatabaseItem"));
      objc_msgSend(v10, "addObject:", v11);

      goto LABEL_3;
    case 1:
      v14 = [KCSharingIncomingEntry alloc];
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingMergeConflict incomingDatabaseItem](self, "incomingDatabaseItem"));
      v12 = -[KCSharingIncomingRow initWithIncomingDatabaseItem:error:](v14, "initWithIncomingDatabaseItem:error:", v15, a4);

      if (!v12)
        goto LABEL_16;
      v16 = [KCSharingOutgoingDeletion alloc];
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingMergeConflict outgoingDatabaseItem](self, "outgoingDatabaseItem"));
      v13 = -[KCSharingOutgoingDeletion initWithPlaceholderOutgoingDatabaseItem:error:](v16, "initWithPlaceholderOutgoingDatabaseItem:error:", v17, a4);

      if (!v13)
        goto LABEL_17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingIncomingEntry record](v12, "record"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "recordChangeTag"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingOutgoingDeletion recordChangeTag](v13, "recordChangeTag"));
      v21 = objc_msgSend(v19, "isEqual:", v20);

      v22 = v7;
      if (!v21)
        goto LABEL_12;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDatabaseUpdatePlan itemsToDelete](v7, "itemsToDelete"));
      v24 = objc_claimAutoreleasedReturnValue(-[KCSharingMergeConflict incomingDatabaseItem](self, "incomingDatabaseItem"));
      goto LABEL_13;
    case 2:
LABEL_3:
      v12 = (KCSharingIncomingEntry *)objc_claimAutoreleasedReturnValue(-[KCSharingDatabaseUpdatePlan itemsToDelete](v7, "itemsToDelete"));
      v13 = (KCSharingOutgoingDeletion *)objc_claimAutoreleasedReturnValue(-[KCSharingMergeConflict outgoingDatabaseItem](self, "outgoingDatabaseItem"));
      -[KCSharingIncomingEntry addObject:](v12, "addObject:", v13);
      goto LABEL_14;
    case 3:
      v25 = [KCSharingIncomingEntry alloc];
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingMergeConflict incomingDatabaseItem](self, "incomingDatabaseItem"));
      v12 = -[KCSharingIncomingRow initWithIncomingDatabaseItem:error:](v25, "initWithIncomingDatabaseItem:error:", v26, a4);

      if (!v12)
        goto LABEL_16;
      v27 = [KCSharingOutgoingEntry alloc];
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingMergeConflict outgoingDatabaseItem](self, "outgoingDatabaseItem"));
      v13 = -[KCSharingOutgoingRow initWithOutgoingDatabaseItem:error:](v27, "initWithOutgoingDatabaseItem:error:", v28, a4);

      if (!v13)
      {
LABEL_17:

        goto LABEL_18;
      }
      if ((id)-[KCSharingIncomingEntry type](v12, "type") == (id)3)
      {
        v22 = v7;
LABEL_12:
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDatabaseUpdatePlan insertIntoLocalAndMirror](v22, "insertIntoLocalAndMirror"));
        objc_msgSend(v29, "addObject:", v12);

        v30 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDatabaseUpdatePlan itemsToDelete](v7, "itemsToDelete"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingMergeConflict incomingDatabaseItem](self, "incomingDatabaseItem"));
        objc_msgSend(v30, "addObject:", v31);

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDatabaseUpdatePlan itemsToDelete](v7, "itemsToDelete"));
        v24 = objc_claimAutoreleasedReturnValue(-[KCSharingMergeConflict outgoingDatabaseItem](self, "outgoingDatabaseItem"));
LABEL_13:
        v32 = (void *)v24;
        objc_msgSend(v23, "addObject:", v24);

LABEL_14:
        goto LABEL_15;
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingIncomingEntry remoteItemWithAccessGroups:error:](v12, "remoteItemWithAccessGroups:error:", v6, a4));
      if (!v34)
      {
        v44 = 1;
        goto LABEL_34;
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingOutgoingDeletion remoteItemWithAccessGroups:error:](v13, "remoteItemWithAccessGroups:error:", v6, a4));
      if (!v35)
      {
        v44 = 1;
        goto LABEL_33;
      }
      if (objc_msgSend(v34, "isEqual:", v35))
      {
        v36 = [KCSharingMirrorEntry alloc];
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingIncomingEntry record](v12, "record"));
        v38 = -[KCSharingMirrorEntry initWithSavedRecord:forOutgoingEntry:flags:](v36, "initWithSavedRecord:forOutgoingEntry:flags:", v37, v13, 0);

        v39 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDatabaseUpdatePlan insertIntoMirror](v7, "insertIntoMirror"));
        objc_msgSend(v39, "addObject:", v38);

        v40 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDatabaseUpdatePlan itemsToDelete](v7, "itemsToDelete"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingMergeConflict incomingDatabaseItem](self, "incomingDatabaseItem"));
        objc_msgSend(v40, "addObject:", v41);

        v42 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDatabaseUpdatePlan itemsToDelete](v7, "itemsToDelete"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingMergeConflict outgoingDatabaseItem](self, "outgoingDatabaseItem"));
        objc_msgSend(v42, "addObject:", v43);

        goto LABEL_32;
      }
      v63 = v35;
      v64 = v34;
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingIncomingEntry record](v12, "record"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "recordChangeTag"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingOutgoingDeletion record](v13, "record"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "recordChangeTag"));
      v49 = objc_msgSend(v46, "isEqualToString:", v48);

      if (v49)
      {
        v38 = (KCSharingMirrorEntry *)objc_claimAutoreleasedReturnValue(-[KCSharingDatabaseUpdatePlan itemsToDelete](v7, "itemsToDelete"));
        v50 = objc_claimAutoreleasedReturnValue(-[KCSharingMergeConflict incomingDatabaseItem](self, "incomingDatabaseItem"));
LABEL_29:
        v42 = (void *)v50;
        -[KCSharingMirrorEntry addObject:](v38, "addObject:", v50);
        goto LABEL_31;
      }
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingIncomingEntry modificationDate](v12, "modificationDate"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingOutgoingDeletion modificationDate](v13, "modificationDate"));
      v53 = objc_msgSend(v51, "compare:", v52);

      if (v53 != (id)-1)
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDatabaseUpdatePlan insertIntoLocalAndMirror](v7, "insertIntoLocalAndMirror"));
        objc_msgSend(v54, "addObject:", v12);

        v55 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDatabaseUpdatePlan itemsToDelete](v7, "itemsToDelete"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingMergeConflict incomingDatabaseItem](self, "incomingDatabaseItem"));
        objc_msgSend(v55, "addObject:", v56);

        v38 = (KCSharingMirrorEntry *)objc_claimAutoreleasedReturnValue(-[KCSharingDatabaseUpdatePlan itemsToDelete](v7, "itemsToDelete"));
        v50 = objc_claimAutoreleasedReturnValue(-[KCSharingMergeConflict outgoingDatabaseItem](self, "outgoingDatabaseItem"));
        goto LABEL_29;
      }
      v57 = [KCSharingMirrorEntry alloc];
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingIncomingEntry record](v12, "record"));
      v38 = -[KCSharingMirrorEntry initWithSavedRecord:forOutgoingEntry:flags:](v57, "initWithSavedRecord:forOutgoingEntry:flags:", v58, v13, 1);

      v59 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDatabaseUpdatePlan insertIntoMirror](v7, "insertIntoMirror"));
      objc_msgSend(v59, "addObject:", v38);

      v60 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDatabaseUpdatePlan itemsToDelete](v7, "itemsToDelete"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingMergeConflict incomingDatabaseItem](self, "incomingDatabaseItem"));
      objc_msgSend(v60, "addObject:", v61);

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDatabaseUpdatePlan itemsToDelete](v7, "itemsToDelete"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingMergeConflict outgoingDatabaseItem](self, "outgoingDatabaseItem"));
      objc_msgSend(v42, "addObject:", v62);

LABEL_31:
      v35 = v63;
      v34 = v64;
LABEL_32:

      v44 = 2;
LABEL_33:

LABEL_34:
      if (v44 == 2)
      {
LABEL_15:
        v12 = v7;
        goto LABEL_16;
      }
LABEL_18:
      v12 = 0;
LABEL_16:

      return v12;
    default:
      goto LABEL_15;
  }
}

- (int64_t)type
{
  return self->_type;
}

- (id)incomingDatabaseItem
{
  return self->_incomingDatabaseItem;
}

- (id)outgoingDatabaseItem
{
  return self->_outgoingDatabaseItem;
}

- (id)mirrorDatabaseItem
{
  return self->_mirrorDatabaseItem;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mirrorDatabaseItem, 0);
  objc_storeStrong(&self->_outgoingDatabaseItem, 0);
  objc_storeStrong(&self->_incomingDatabaseItem, 0);
}

@end
