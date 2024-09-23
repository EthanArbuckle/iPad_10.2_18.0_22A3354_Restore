@implementation ICLiveLinkQueueEventContentReplaced

- (ICLiveLinkQueueEventContentReplaced)initWithStartItemIdentifier:(id)a3
{
  id v4;
  ICLiveLinkQueueEventContentReplaced *v5;
  uint64_t v6;
  NSString *startItemIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICLiveLinkQueueEventContentReplaced;
  v5 = -[ICLiveLinkQueueEventContentReplaced init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    startItemIdentifier = v5->_startItemIdentifier;
    v5->_startItemIdentifier = (NSString *)v6;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ICLiveLinkQueueEventContentReplaced: %p startItemID=%@>"), self, self->_startItemIdentifier);
}

- (NSString)startItemIdentifier
{
  return self->_startItemIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startItemIdentifier, 0);
}

@end
