@implementation _UICommandDiffv1

+ (id)diffWithChanges:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithChanges:", v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UICommandDiffv1)initWithChanges:(id)a3
{
  id v4;
  _UICommandDiffv1 *v5;
  uint64_t v6;
  NSOrderedSet *changes;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UICommandDiffv1;
  v5 = -[_UICommandDiffv1 init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    changes = v5->_changes;
    v5->_changes = (NSOrderedSet *)v6;

  }
  return v5;
}

- (_UICommandDiffv1)initWithCoder:(id)a3
{
  id v4;
  _UICommandDiffv1 *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSOrderedSet *changes;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UICommandDiffv1;
  v5 = -[_UICommandDiffv1 init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("changes"));
    v9 = objc_claimAutoreleasedReturnValue();
    changes = v5->_changes;
    v5->_changes = (NSOrderedSet *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_changes, CFSTR("changes"));
}

- (NSOrderedSet)changes
{
  return self->_changes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changes, 0);
}

@end
