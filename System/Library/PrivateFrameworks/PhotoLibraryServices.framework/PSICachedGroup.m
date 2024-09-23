@implementation PSICachedGroup

- (PSICachedGroup)initWithText:(id)a3 identifier:(id)a4 category:(unint64_t)a5 owningGroupId:(unint64_t)a6
{
  id v10;
  id v11;
  PSICachedGroup *v12;
  uint64_t v13;
  NSString *text;
  uint64_t v15;
  NSString *identifier;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PSICachedGroup;
  v12 = -[PSICachedGroup init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    text = v12->_text;
    v12->_text = (NSString *)v13;

    v15 = objc_msgSend(v11, "copy");
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v15;

    v12->_category = a5;
    v12->_owningGroupId = a6;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_text, "hash");
  return -[NSString hash](self->_identifier, "hash") ^ v3 ^ self->_category ^ (self->_owningGroupId << 32);
}

- (BOOL)isEqual:(id)a3
{
  PSICachedGroup *v4;
  uint64_t v5;
  char v6;
  PSICachedGroup *v7;
  PSICachedGroup *v8;
  NSString *text;
  NSString *identifier;

  v4 = (PSICachedGroup *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      v8 = v7;
      if (self->_category == v7->_category
        && self->_owningGroupId == v7->_owningGroupId
        && ((text = self->_text, text == v8->_text) || -[NSString isEqualToString:](text, "isEqualToString:")))
      {
        identifier = self->_identifier;
        if (identifier == v8->_identifier)
          v6 = 1;
        else
          v6 = -[NSString isEqualToString:](identifier, "isEqualToString:");
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  NSString *text;
  const __CFString *v3;

  text = self->_text;
  if (text)
  {
    v3 = CFSTR("text");
  }
  else
  {
    text = self->_identifier;
    v3 = CFSTR("identifier");
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@' (%@, %d) -> %d"), text, v3, self->_category, self->_owningGroupId);
}

- (NSString)text
{
  return self->_text;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)category
{
  return self->_category;
}

- (unint64_t)owningGroupId
{
  return self->_owningGroupId;
}

- (unint64_t)groupId
{
  return self->_groupId;
}

- (void)setGroupId:(unint64_t)a3
{
  self->_groupId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
