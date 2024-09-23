@implementation _ICLLReactionAction

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_ICLLReactionAction;
  -[_ICLLReactionAction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICLLReactionAction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *reactionId;
  NSString *reaction;
  NSString *itemId;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  reactionId = self->_reactionId;
  if (reactionId)
    objc_msgSend(v3, "setObject:forKey:", reactionId, CFSTR("reactionId"));
  reaction = self->_reaction;
  if (reaction)
    objc_msgSend(v4, "setObject:forKey:", reaction, CFSTR("reaction"));
  itemId = self->_itemId;
  if (itemId)
    objc_msgSend(v4, "setObject:forKey:", itemId, CFSTR("itemId"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLReactionActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_reactionId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_reaction)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_itemId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_reactionId, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_reaction, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_itemId, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *reactionId;
  NSString *reaction;
  NSString *itemId;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((reactionId = self->_reactionId, !((unint64_t)reactionId | v4[3]))
     || -[NSString isEqual:](reactionId, "isEqual:"))
    && ((reaction = self->_reaction, !((unint64_t)reaction | v4[2]))
     || -[NSString isEqual:](reaction, "isEqual:")))
  {
    itemId = self->_itemId;
    if ((unint64_t)itemId | v4[1])
      v8 = -[NSString isEqual:](itemId, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_reactionId, "hash");
  v4 = -[NSString hash](self->_reaction, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_itemId, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reactionId, 0);
  objc_storeStrong((id *)&self->_reaction, 0);
  objc_storeStrong((id *)&self->_itemId, 0);
}

@end
