@implementation TPSActionableContent

- (TPSActionableContent)initWithDictionary:(id)a3 metadata:(id)a4
{
  id v6;
  TPSActionableContent *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  TPSURLAction *v17;
  TPSURLAction *v18;
  uint64_t v19;
  NSArray *actions;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)TPSActionableContent;
  v7 = -[TPSContent initWithDictionary:metadata:](&v26, sel_initWithDictionary_metadata_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "TPSSafeArrayForKey:", CFSTR("actions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v11 = v8;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v23;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v23 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15);
            v17 = [TPSURLAction alloc];
            v18 = -[TPSURLAction initWithDictionary:](v17, "initWithDictionary:", v16, (_QWORD)v22);
            if (v18)
              objc_msgSend(v10, "addObject:", v18);

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v13);
      }

      v19 = objc_msgSend(v10, "copy");
      actions = v7->_actions;
      v7->_actions = (NSArray *)v19;

    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSActionableContent;
  v4 = a3;
  -[TPSContent encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[TPSActionableContent actions](self, "actions", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("actions"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSActionableContent;
  v4 = -[TPSContent copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[TPSActionableContent actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActions:", v5);

  return v4;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (TPSActionableContent)initWithCoder:(id)a3
{
  id v4;
  TPSActionableContent *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *actions;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSActionableContent;
  v5 = -[TPSContent initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("actions"));
    v9 = objc_claimAutoreleasedReturnValue();
    actions = v5->_actions;
    v5->_actions = (NSArray *)v9;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v10.receiver = self;
  v10.super_class = (Class)TPSActionableContent;
  -[TPSContent debugDescription](&v10, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSActionableContent actions](self, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TPSActionableContent actions](self, "actions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ = %@"), CFSTR("actions"), v8);

  }
  return v5;
}

@end
