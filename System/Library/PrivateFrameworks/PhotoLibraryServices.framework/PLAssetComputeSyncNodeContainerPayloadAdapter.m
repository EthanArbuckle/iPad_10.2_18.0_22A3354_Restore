@implementation PLAssetComputeSyncNodeContainerPayloadAdapter

- (PLAssetComputeSyncNodeContainerPayloadAdapter)initWithManagedObject:(id)a3
{
  id v4;
  PLAssetComputeSyncNodeContainerPayloadAdapter *v5;
  id v6;
  uint64_t v7;
  PLGraphNodeContainer *v8;
  PLGraphNodeContainer *nodeContainer;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLAssetComputeSyncNodeContainerPayloadAdapter;
  v5 = -[PLJournalEntryPayloadUpdateAdapter initWithManagedObject:](&v11, sel_initWithManagedObject_, v4);
  if (v5)
  {
    v6 = v4;
    v7 = objc_msgSend(v6, "nodeContainerClass");
    if (v7)
    {
      v8 = +[PLGraphNodeContainer newNodeContainerWithNode:containerClass:](PLGraphNodeContainer, "newNodeContainerWithNode:containerClass:", v6, v7);
      nodeContainer = v5->_nodeContainer;
      v5->_nodeContainer = v8;

    }
  }

  return v5;
}

- (id)sourceObject
{
  return self->_nodeContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodeContainer, 0);
}

@end
