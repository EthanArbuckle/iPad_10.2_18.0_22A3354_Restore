@implementation TICharacterSetDescription

- (id)awakeAfterUsingCoder:(id)a3
{
  id v4;
  TICharacterSetDescription *v5;

  if ((-[TICharacterSetDescription isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    if (awakeAfterUsingCoder__onceToken != -1)
      dispatch_once(&awakeAfterUsingCoder__onceToken, &__block_literal_global_1006);
    v4 = (id)awakeAfterUsingCoder____decodedInstances;
    objc_sync_enter(v4);
    objc_msgSend((id)awakeAfterUsingCoder____decodedInstances, "member:", self);
    v5 = (TICharacterSetDescription *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend((id)awakeAfterUsingCoder____decodedInstances, "addObject:", self);
      v5 = self;
    }
    objc_sync_exit(v4);

  }
  else
  {
    v5 = self;
  }

  return v5;
}

- (unint64_t)hash
{
  int64_t v3;
  int64_t v4;
  void *v5;
  int64_t v6;
  void *v7;
  unint64_t v8;

  v3 = 257 * -[TICharacterSetDescription baseIdentifier](self, "baseIdentifier");
  v4 = 257 * (v3 + -[TICharacterSetDescription inverted](self, "inverted"));
  -[TICharacterSetDescription charactersAddedToBase](self, "charactersAddedToBase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 + objc_msgSend(v5, "hash");

  -[TICharacterSetDescription charactersRemovedFromBase](self, "charactersRemovedFromBase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") + 257 * v6;

  return v8;
}

- (NSString)charactersRemovedFromBase
{
  return self->_charactersRemovedFromBase;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v14 = 0;
    goto LABEL_9;
  }
  v5 = v4;
  v6 = -[TICharacterSetDescription baseIdentifier](self, "baseIdentifier");
  if (v6 != objc_msgSend(v5, "baseIdentifier"))
    goto LABEL_6;
  v7 = -[TICharacterSetDescription inverted](self, "inverted");
  if (v7 != objc_msgSend(v5, "inverted"))
    goto LABEL_6;
  -[TICharacterSetDescription charactersAddedToBase](self, "charactersAddedToBase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "charactersAddedToBase");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v8 == (void *)v9)
  {

    goto LABEL_11;
  }
  v10 = (void *)v9;
  -[TICharacterSetDescription charactersAddedToBase](self, "charactersAddedToBase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "charactersAddedToBase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if (v13)
  {
LABEL_11:
    -[TICharacterSetDescription charactersRemovedFromBase](self, "charactersRemovedFromBase");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "charactersRemovedFromBase");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 == v17)
    {
      v14 = 1;
    }
    else
    {
      -[TICharacterSetDescription charactersRemovedFromBase](self, "charactersRemovedFromBase");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "charactersRemovedFromBase");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v18, "isEqualToString:", v19);

    }
    goto LABEL_7;
  }
LABEL_6:
  v14 = 0;
LABEL_7:

LABEL_9:
  return v14;
}

- (NSString)charactersAddedToBase
{
  return self->_charactersAddedToBase;
}

- (int64_t)baseIdentifier
{
  return self->_baseIdentifier;
}

- (BOOL)inverted
{
  return self->_inverted;
}

- (TICharacterSetDescription)initWithCoder:(id)a3
{
  id v4;
  TICharacterSetDescription *v5;
  void *v6;
  uint64_t v7;
  NSString *charactersAddedToBase;
  void *v9;
  uint64_t v10;
  NSString *charactersRemovedFromBase;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TICharacterSetDescription;
  v5 = -[TICharacterSetDescription init](&v13, sel_init);
  if (v5)
  {
    v5->_baseIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("baseIdentifier"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("charactersAddedToBase"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    charactersAddedToBase = v5->_charactersAddedToBase;
    v5->_charactersAddedToBase = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("charactersRemovedFromBase"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    charactersRemovedFromBase = v5->_charactersRemovedFromBase;
    v5->_charactersRemovedFromBase = (NSString *)v10;

    v5->_inverted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("inverted"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t baseIdentifier;
  NSString *charactersAddedToBase;
  NSString *charactersRemovedFromBase;
  id v8;

  v4 = a3;
  baseIdentifier = self->_baseIdentifier;
  v8 = v4;
  if (baseIdentifier)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", baseIdentifier, CFSTR("baseIdentifier"));
    v4 = v8;
  }
  charactersAddedToBase = self->_charactersAddedToBase;
  if (charactersAddedToBase)
  {
    objc_msgSend(v8, "encodeObject:forKey:", charactersAddedToBase, CFSTR("charactersAddedToBase"));
    v4 = v8;
  }
  charactersRemovedFromBase = self->_charactersRemovedFromBase;
  if (charactersRemovedFromBase)
  {
    objc_msgSend(v8, "encodeObject:forKey:", charactersRemovedFromBase, CFSTR("charactersRemovedFromBase"));
    v4 = v8;
  }
  if (self->_inverted)
  {
    objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("inverted"));
    v4 = v8;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_charactersRemovedFromBase, 0);
  objc_storeStrong((id *)&self->_charactersAddedToBase, 0);
  objc_storeStrong((id *)&self->_characterSet, 0);
}

void __50__TICharacterSetDescription_awakeAfterUsingCoder___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)awakeAfterUsingCoder____decodedInstances;
  awakeAfterUsingCoder____decodedInstances = (uint64_t)v0;

}

- (TICharacterSetDescription)initWithBaseCharacterSet:(int64_t)a3
{
  return -[TICharacterSetDescription initWithBase:additionalCharacters:removedCharacters:inverted:](self, "initWithBase:additionalCharacters:removedCharacters:inverted:", a3, 0, 0, 0);
}

- (TICharacterSetDescription)initWithCharactersInString:(id)a3
{
  return -[TICharacterSetDescription initWithBase:additionalCharacters:removedCharacters:inverted:](self, "initWithBase:additionalCharacters:removedCharacters:inverted:", 0, a3, 0, 0);
}

- (TICharacterSetDescription)initWithBase:(int64_t)a3 additionalCharacters:(id)a4 removedCharacters:(id)a5 inverted:(BOOL)a6
{
  id v10;
  id v11;
  TICharacterSetDescription *v12;
  TICharacterSetDescription *v13;
  uint64_t v14;
  NSString *charactersAddedToBase;
  uint64_t v16;
  NSString *charactersRemovedFromBase;
  objc_super v19;

  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)TICharacterSetDescription;
  v12 = -[TICharacterSetDescription init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_baseIdentifier = a3;
    v14 = objc_msgSend(v10, "copy");
    charactersAddedToBase = v13->_charactersAddedToBase;
    v13->_charactersAddedToBase = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    charactersRemovedFromBase = v13->_charactersRemovedFromBase;
    v13->_charactersRemovedFromBase = (NSString *)v16;

    v13->_inverted = a6;
  }

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v16.receiver = self;
  v16.super_class = (Class)TICharacterSetDescription;
  -[TICharacterSetDescription description](&v16, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "rangeOfString:options:", CFSTR(">"), 4);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v5, "replaceCharactersInRange:withString:", v6, v7, &stru_1E243B990);
  if (-[TICharacterSetDescription baseIdentifier](self, "baseIdentifier"))
  {
    v8 = -[TICharacterSetDescription baseIdentifier](self, "baseIdentifier");
    if (v8 == 3)
    {
      v9 = sel_whitespaceAndNewlineCharacterSet;
    }
    else if (v8 == 10)
    {
      v9 = sel_alphanumericCharacterSet;
    }
    else
    {
      v9 = 0;
    }
    NSStringFromSelector(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(", base: %@"), v10);

  }
  -[TICharacterSetDescription charactersAddedToBase](self, "charactersAddedToBase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[TICharacterSetDescription charactersAddedToBase](self, "charactersAddedToBase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(", characters: <%@>"), v12);

  }
  -[TICharacterSetDescription charactersRemovedFromBase](self, "charactersRemovedFromBase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[TICharacterSetDescription charactersRemovedFromBase](self, "charactersRemovedFromBase");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(", without: <%@>"), v14);

  }
  if (-[TICharacterSetDescription inverted](self, "inverted"))
    objc_msgSend(v5, "appendFormat:", CFSTR(", inverted"));
  objc_msgSend(v5, "appendString:", CFSTR(">"));
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TIMutableCharacterSetDescription *v4;
  int64_t v5;
  void *v6;
  void *v7;
  TIMutableCharacterSetDescription *v8;

  v4 = +[TIMutableCharacterSetDescription allocWithZone:](TIMutableCharacterSetDescription, "allocWithZone:", a3);
  v5 = -[TICharacterSetDescription baseIdentifier](self, "baseIdentifier");
  -[TICharacterSetDescription charactersAddedToBase](self, "charactersAddedToBase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TICharacterSetDescription charactersRemovedFromBase](self, "charactersRemovedFromBase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TICharacterSetDescription initWithBase:additionalCharacters:removedCharacters:inverted:](v4, "initWithBase:additionalCharacters:removedCharacters:inverted:", v5, v6, v7, -[TICharacterSetDescription inverted](self, "inverted"));

  return v8;
}

- (id)invertedSetDescription
{
  TICharacterSetDescription *v3;
  int64_t v4;
  void *v5;
  void *v6;
  TICharacterSetDescription *v7;

  v3 = [TICharacterSetDescription alloc];
  v4 = -[TICharacterSetDescription baseIdentifier](self, "baseIdentifier");
  -[TICharacterSetDescription charactersAddedToBase](self, "charactersAddedToBase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TICharacterSetDescription charactersRemovedFromBase](self, "charactersRemovedFromBase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TICharacterSetDescription initWithBase:additionalCharacters:removedCharacters:inverted:](v3, "initWithBase:additionalCharacters:removedCharacters:inverted:", v4, v5, v6, -[TICharacterSetDescription inverted](self, "inverted") ^ 1);

  return v7;
}

- (id)newCharacterSetFromDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  if (-[TICharacterSetDescription baseIdentifier](self, "baseIdentifier"))
  {
    CFCharacterSetGetPredefined((CFCharacterSetPredefinedSet)-[TICharacterSetDescription baseIdentifier](self, "baseIdentifier"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[TICharacterSetDescription charactersAddedToBase](self, "charactersAddedToBase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (v3)
    {
      v5 = (void *)objc_msgSend(v3, "mutableCopy");
      -[TICharacterSetDescription charactersAddedToBase](self, "charactersAddedToBase");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addCharactersInString:", v6);

      v7 = objc_msgSend(v5, "copy");
      v3 = (void *)v7;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB3500];
      -[TICharacterSetDescription charactersAddedToBase](self, "charactersAddedToBase");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "characterSetWithCharactersInString:", v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  -[TICharacterSetDescription charactersRemovedFromBase](self, "charactersRemovedFromBase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)objc_msgSend(v3, "mutableCopy");
    -[TICharacterSetDescription charactersRemovedFromBase](self, "charactersRemovedFromBase");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeCharactersInString:", v11);

    v12 = objc_msgSend(v10, "copy");
    v3 = (void *)v12;
  }
  if (-[TICharacterSetDescription inverted](self, "inverted"))
  {
    objc_msgSend(v3, "invertedSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", 0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "invertedSet");
      v15 = (id)objc_claimAutoreleasedReturnValue();

      v3 = v16;
    }

    return v15;
  }
  return v3;
}

- (NSCharacterSet)characterSet
{
  NSCharacterSet *characterSet;
  NSCharacterSet *v4;
  NSCharacterSet *v5;

  characterSet = self->_characterSet;
  if (!characterSet)
  {
    v4 = -[TICharacterSetDescription newCharacterSetFromDescription](self, "newCharacterSetFromDescription");
    v5 = self->_characterSet;
    self->_characterSet = v4;

    characterSet = self->_characterSet;
  }
  return characterSet;
}

- (void)clearCachedCharacterSet
{
  NSCharacterSet *characterSet;

  characterSet = self->_characterSet;
  self->_characterSet = 0;

}

- (void)setCharactersAddedToBase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setCharactersRemovedFromBase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
