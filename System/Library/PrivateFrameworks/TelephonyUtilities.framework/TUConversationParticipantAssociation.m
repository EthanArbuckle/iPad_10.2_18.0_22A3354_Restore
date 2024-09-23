@implementation TUConversationParticipantAssociation

- (TUConversationParticipantAssociation)initWithParticipantAssociation:(id)a3
{
  id v4;
  TUConversationParticipantAssociation *v5;
  void *v6;
  uint64_t v7;
  NSString *avcIdentifier;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TUConversationParticipantAssociation;
  v5 = -[TUConversationParticipantAssociation init](&v10, sel_init);
  if (v5)
  {
    v5->_identifier = objc_msgSend(v4, "identifier");
    objc_msgSend(v4, "avcIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    avcIdentifier = v5->_avcIdentifier;
    v5->_avcIdentifier = (NSString *)v7;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationParticipantAssociation)initWithCoder:(id)a3
{
  id v4;
  TUConversationParticipantAssociation *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSString *avcIdentifier;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUConversationParticipantAssociation;
  v5 = -[TUConversationParticipantAssociation init](&v12, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_identifier);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_identifier = objc_msgSend(v4, "decodeInt64ForKey:", v6);

    v7 = objc_opt_class();
    NSStringFromSelector(sel_avcIdentifier);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    avcIdentifier = v5->_avcIdentifier;
    v5->_avcIdentifier = (NSString *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = -[TUConversationParticipantAssociation identifier](self, "identifier");
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt64:forKey:", v5, v6);

  -[TUConversationParticipantAssociation avcIdentifier](self, "avcIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_avcIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, v7);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TUConversationParticipantAssociation initWithParticipantAssociation:](+[TUConversationParticipantAssociation allocWithZone:](TUConversationParticipantAssociation, "allocWithZone:", a3), "initWithParticipantAssociation:", self);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" identifier=%llu"), -[TUConversationParticipantAssociation identifier](self, "identifier"));
  -[TUConversationParticipantAssociation avcIdentifier](self, "avcIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TUConversationParticipantAssociation avcIdentifier](self, "avcIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" avcIdentifier=%@"), v5);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[TUConversationParticipantAssociation identifier](self, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TUConversationParticipantAssociation avcIdentifier](self, "avcIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  TUConversationParticipantAssociation *v4;
  BOOL v5;

  v4 = (TUConversationParticipantAssociation *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TUConversationParticipantAssociation isEqualToParticipantAssociation:](self, "isEqualToParticipantAssociation:", v4);
  }

  return v5;
}

- (BOOL)isEqualToParticipantAssociation:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = -[TUConversationParticipantAssociation identifier](self, "identifier");
  if (v5 == objc_msgSend(v4, "identifier"))
  {
    -[TUConversationParticipantAssociation avcIdentifier](self, "avcIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "avcIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = TUStringsAreEqualOrNil((unint64_t)v6, (uint64_t)v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)participantAssociationFromURLComponents:(id)a3 namePrefix:(id)a4
{
  id v6;
  id v7;
  void *v8;
  TUConversationParticipantAssociation *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "identifierFromURLComponents:namePrefix:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc_init(TUConversationParticipantAssociation);
    -[TUConversationParticipantAssociation setIdentifier:](v9, "setIdentifier:", objc_msgSend(v8, "unsignedLongLongValue"));
    if (v9)
    {
      objc_msgSend(a1, "avcIdentifierFromURLComponents:namePrefix:", v6, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUConversationParticipantAssociation setAvcIdentifier:](v9, "setAvcIdentifier:", v10);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)identifierFromURLComponents:(id)a3 namePrefix:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_class();
  NSStringFromSelector(sel_identifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryItemName:prefix:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstQueryItemWithName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v10, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tu_unsignedLongLongNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

+ (id)queryItemName:(id)a3 prefix:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), a4, v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

+ (id)avcIdentifierFromURLComponents:(id)a3 namePrefix:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_class();
  NSStringFromSelector(sel_avcIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryItemName:prefix:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstQueryItemWithName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)queryItemsWithNamePrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  -[TUConversationParticipantAssociation identifierQueryItemWithNamePrefix:](self, "identifierQueryItemWithNamePrefix:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUConversationParticipantAssociation avcIdentifier](self, "avcIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[TUConversationParticipantAssociation avcIdentifierQueryItemWithNamePrefix:](self, "avcIdentifierQueryItemWithNamePrefix:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);

  }
  return v8;
}

- (id)identifierQueryItemWithNamePrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryItemName:prefix:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), -[TUConversationParticipantAssociation identifier](self, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", v7, v8);

  return v9;
}

- (id)avcIdentifierQueryItemWithNamePrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  NSStringFromSelector(sel_avcIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryItemName:prefix:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0CB39D8]);
  -[TUConversationParticipantAssociation avcIdentifier](self, "avcIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", v7, v9);

  return v10;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (NSString)avcIdentifier
{
  return self->_avcIdentifier;
}

- (void)setAvcIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avcIdentifier, 0);
}

@end
