@implementation ICLiveLinkQueueEventContentAdded

- (ICLiveLinkQueueEventContentAdded)initWithItemIdentifiers:(id)a3 containerKind:(int64_t)a4 containerIdentifier:(id)a5 containerMediaIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  ICLiveLinkQueueEventContentAdded *v13;
  uint64_t v14;
  NSArray *itemIdentifiers;
  uint64_t v16;
  NSString *containerIdentifier;
  uint64_t v18;
  NSString *containerMediaIdentifier;
  objc_super v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)ICLiveLinkQueueEventContentAdded;
  v13 = -[ICLiveLinkQueueEventContentAdded init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    itemIdentifiers = v13->_itemIdentifiers;
    v13->_itemIdentifiers = (NSArray *)v14;

    v16 = objc_msgSend(v11, "copy");
    containerIdentifier = v13->_containerIdentifier;
    v13->_containerIdentifier = (NSString *)v16;

    v13->_containerKind = a4;
    v18 = objc_msgSend(v12, "copy");
    containerMediaIdentifier = v13->_containerMediaIdentifier;
    v13->_containerMediaIdentifier = (NSString *)v18;

  }
  return v13;
}

- (id)description
{
  unint64_t containerKind;
  void *v4;
  void *v5;
  void *v6;

  containerKind = self->_containerKind;
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (containerKind)
  {
    _NSStringFromICSharedListeningContainerKind(containerKind);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<ICLiveLinkQueueEventContentAdded: %p %@(%@)=%@ itemIdentifiers=%@>"), self, v5, self->_containerIdentifier, self->_containerMediaIdentifier, self->_itemIdentifiers);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ICLiveLinkQueueEventContentAdded: %p unknown itemIdentifiers=%@>"), self, self->_itemIdentifiers);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (int64_t)containerKind
{
  return self->_containerKind;
}

- (NSString)containerMediaIdentifier
{
  return self->_containerMediaIdentifier;
}

- (NSArray)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_containerMediaIdentifier, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end
