@implementation ICLiveLinkReactionEvent

- (ICLiveLinkReactionEvent)initWithReaction:(id)a3 reactionIdentifier:(id)a4 itemIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICLiveLinkReactionEvent *v11;
  uint64_t v12;
  NSString *reaction;
  uint64_t v14;
  NSString *reactionIdentifier;
  uint64_t v16;
  NSString *itemIdentifier;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ICLiveLinkReactionEvent;
  v11 = -[ICLiveLinkReactionEvent init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    reaction = v11->_reaction;
    v11->_reaction = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    reactionIdentifier = v11->_reactionIdentifier;
    v11->_reactionIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    itemIdentifier = v11->_itemIdentifier;
    v11->_itemIdentifier = (NSString *)v16;

  }
  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ICLiveLinkReactionEvent: %p reaction=\"%@\" reactionID=%@ itemID=%@>"), self, self->_reaction, self->_reactionIdentifier, self->_itemIdentifier);
}

- (NSString)reactionIdentifier
{
  return self->_reactionIdentifier;
}

- (NSString)reaction
{
  return self->_reaction;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_reaction, 0);
  objc_storeStrong((id *)&self->_reactionIdentifier, 0);
}

@end
