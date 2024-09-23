@implementation TUConversationVirtualParticipant

- (TUConversationVirtualParticipant)initWithIdentifier:(unint64_t)a3 pluginName:(id)a4
{
  id v7;
  TUConversationVirtualParticipant *v8;
  TUConversationVirtualParticipant *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TUConversationVirtualParticipant;
  v8 = -[TUConversationVirtualParticipant init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_identifier = a3;
    objc_storeStrong((id *)&v8->_pluginName, a4);
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" identifier=%llu"), -[TUConversationVirtualParticipant identifier](self, "identifier"));
  -[TUConversationVirtualParticipant pluginName](self, "pluginName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" pluginName=%@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TUConversationVirtualParticipant isEqualToConversationVirtualParticipant:](self, "isEqualToConversationVirtualParticipant:", v4);

  return v5;
}

- (BOOL)isEqualToConversationVirtualParticipant:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = -[TUConversationVirtualParticipant identifier](self, "identifier");
  if (v5 == objc_msgSend(v4, "identifier"))
  {
    -[TUConversationVirtualParticipant pluginName](self, "pluginName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pluginName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[TUConversationVirtualParticipant identifier](self, "identifier");
  -[TUConversationVirtualParticipant pluginName](self, "pluginName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[TUConversationVirtualParticipant identifier](self, "identifier");
  -[TUConversationVirtualParticipant pluginName](self, "pluginName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithIdentifier:pluginName:", v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationVirtualParticipant)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  TUConversationVirtualParticipant *v10;

  v4 = a3;
  NSStringFromSelector(sel_identifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", v5);

  v7 = objc_opt_class();
  NSStringFromSelector(sel_pluginName);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[TUConversationVirtualParticipant initWithIdentifier:pluginName:](self, "initWithIdentifier:pluginName:", v6, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = -[TUConversationVirtualParticipant identifier](self, "identifier");
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt64:forKey:", v5, v6);

  -[TUConversationVirtualParticipant pluginName](self, "pluginName");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_pluginName);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, v7);

}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (NSString)pluginName
{
  return self->_pluginName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginName, 0);
}

@end
