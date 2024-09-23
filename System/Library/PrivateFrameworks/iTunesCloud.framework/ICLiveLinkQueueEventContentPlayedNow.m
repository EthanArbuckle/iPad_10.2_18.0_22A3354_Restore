@implementation ICLiveLinkQueueEventContentPlayedNow

- (ICLiveLinkQueueEventContentPlayedNow)initWithItemIdentifiers:(id)a3 containerKind:(int64_t)a4 containerIdentifier:(id)a5 containerMediaIdentifier:(id)a6 startItemIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  ICLiveLinkQueueEventContentPlayedNow *v16;
  uint64_t v17;
  NSArray *itemIdentifiers;
  uint64_t v19;
  NSString *containerIdentifier;
  uint64_t v21;
  NSString *containerMediaIdentifier;
  uint64_t v23;
  NSString *startItemIdentifier;
  objc_super v26;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)ICLiveLinkQueueEventContentPlayedNow;
  v16 = -[ICLiveLinkQueueEventContentPlayedNow init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    itemIdentifiers = v16->_itemIdentifiers;
    v16->_itemIdentifiers = (NSArray *)v17;

    v19 = objc_msgSend(v13, "copy");
    containerIdentifier = v16->_containerIdentifier;
    v16->_containerIdentifier = (NSString *)v19;

    v16->_containerKind = a4;
    v21 = objc_msgSend(v14, "copy");
    containerMediaIdentifier = v16->_containerMediaIdentifier;
    v16->_containerMediaIdentifier = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    startItemIdentifier = v16->_startItemIdentifier;
    v16->_startItemIdentifier = (NSString *)v23;

  }
  return v16;
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
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<ICLiveLinkQueueEventContentPlayedNow: %p %@(%@)=%@ itemIdentifiers=%@ startItemID=%@>"), self, v5, self->_containerIdentifier, self->_containerMediaIdentifier, self->_itemIdentifiers, self->_startItemIdentifier);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ICLiveLinkQueueEventContentPlayedNow: %p unknown itemIdentifiers=%@ startItemID=%@>"), self, self->_itemIdentifiers, self->_startItemIdentifier);
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

- (NSString)startItemIdentifier
{
  return self->_startItemIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startItemIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_containerMediaIdentifier, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end
