@implementation TIKeyboardCandidateGroup

- (TIKeyboardCandidateGroup)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardCandidateGroup *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSOrderedSet *candidates;
  uint64_t v11;
  NSString *title;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TIKeyboardCandidateGroup;
  v5 = -[TIKeyboardCandidateGroup init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("candidates"));
    v9 = objc_claimAutoreleasedReturnValue();
    candidates = v5->_candidates;
    v5->_candidates = (NSOrderedSet *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v11 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[TIKeyboardCandidateGroup candidates](self, "candidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TIKeyboardCandidateGroup candidates](self, "candidates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("candidates"));

  }
  -[TIKeyboardCandidateGroup title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TIKeyboardCandidateGroup title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("title"));

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  TIKeyboardCandidateGroup *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = -[TIKeyboardCandidateGroup init](+[TIKeyboardCandidateGroup allocWithZone:](TIKeyboardCandidateGroup, "allocWithZone:", a3), "init");
  -[TIKeyboardCandidateGroup title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardCandidateGroup setTitle:](v4, "setTitle:", v5);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TIKeyboardCandidateGroup candidates](self, "candidates", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[TIKeyboardCandidateGroup addCandidate:](v4, "addCandidate:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  return v4;
}

- (TIKeyboardCandidateGroup)initWithTitle:(id)a3 candidates:(id)a4
{
  id v6;
  id v7;
  TIKeyboardCandidateGroup *v8;
  TIKeyboardCandidateGroup *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardCandidateGroup;
  v8 = -[TIKeyboardCandidateGroup init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[TIKeyboardCandidateGroup setTitle:](v8, "setTitle:", v6);
    -[TIKeyboardCandidateGroup setCandidates:](v9, "setCandidates:", v7);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  TIKeyboardCandidateGroup *v4;
  TIKeyboardCandidateGroup *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (TIKeyboardCandidateGroup *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[TIKeyboardCandidateGroup title](self, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardCandidateGroup title](v5, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        -[TIKeyboardCandidateGroup candidates](self, "candidates");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardCandidateGroup candidates](v5, "candidates");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToOrderedSet:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  objc_super v8;

  -[TIKeyboardCandidateGroup title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (id)objc_msgSend(v3, "hash");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardCandidateGroup;
    v5 = -[TIKeyboardCandidateGroup hash](&v8, sel_hash);
  }
  v6 = (unint64_t)v5;

  return v6;
}

- (id)mutableCandidates
{
  NSOrderedSet **p_candidates;
  NSOrderedSet *v3;
  NSOrderedSet *v4;

  p_candidates = &self->_candidates;
  if (!self->_candidates)
  {
    v4 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
LABEL_6:
    v3 = v4;
    objc_storeStrong((id *)p_candidates, v4);
    return v3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = (NSOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithOrderedSet:", *p_candidates);
    goto LABEL_6;
  }
  v3 = *p_candidates;
  return v3;
}

- (BOOL)hasAlternativeText
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[NSOrderedSet count](self->_candidates, "count"))
    return 0;
  -[NSOrderedSet objectAtIndex:](self->_candidates, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alternativeText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length") != 0;

  return v5;
}

- (void)addCandidate:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[TIKeyboardCandidateGroup mutableCandidates](self, "mutableCandidates");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25.receiver = self;
  v25.super_class = (Class)TIKeyboardCandidateGroup;
  -[TIKeyboardCandidateGroup description](&v25, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardCandidateGroup title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardCandidateGroup candidates](self, "candidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[TIKeyboardCandidateGroup candidates](self, "candidates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = CFSTR("\n");
  if (!v9)
    v10 = &stru_1E243B990;
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: Group '%@' (%d candidates)%@"), v4, v5, v7, v10);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[TIKeyboardCandidateGroup candidates](self, "candidates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v16, "candidate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "label");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "alternativeText");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\tcandidate='%@'; label='%@'; alternativeText='%@'\n"), v17, v18, v19);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v13);
  }

  return v3;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSOrderedSet)candidates
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCandidates:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
