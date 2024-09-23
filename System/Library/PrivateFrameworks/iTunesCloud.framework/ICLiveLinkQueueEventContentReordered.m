@implementation ICLiveLinkQueueEventContentReordered

- (ICLiveLinkQueueEventContentReordered)initWithItemIdentifier:(id)a3
{
  id v4;
  ICLiveLinkQueueEventContentReordered *v5;
  uint64_t v6;
  NSString *itemIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICLiveLinkQueueEventContentReordered;
  v5 = -[ICLiveLinkQueueEventContentReordered init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ICLiveLinkQueueEventContentReordered: %p itemIdentifier=%@>"), self, self->_itemIdentifier);
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
