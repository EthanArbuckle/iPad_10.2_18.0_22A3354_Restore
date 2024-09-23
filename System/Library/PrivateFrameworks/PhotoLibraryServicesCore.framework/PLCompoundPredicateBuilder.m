@implementation PLCompoundPredicateBuilder

- (PLCompoundPredicateBuilder)init
{
  PLCompoundPredicateBuilder *v2;
  NSMutableArray *v3;
  NSMutableArray *subpredicates;
  PLCompoundPredicateBuilder *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLCompoundPredicateBuilder;
  v2 = -[PLCompoundPredicateBuilder init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    subpredicates = v2->_subpredicates;
    v2->_subpredicates = v3;

    v5 = v2;
  }

  return v2;
}

- (void)addSubpredicate:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](self->_subpredicates, "addObject:");
}

- (id)buildAndCompoundPredicate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__PLCompoundPredicateBuilder_buildAndCompoundPredicate__block_invoke;
  v3[3] = &unk_1E376C050;
  v3[4] = self;
  -[PLCompoundPredicateBuilder _joinSubpredicatesWithBlock:](self, "_joinSubpredicatesWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)buildOrCompoundPredicate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__PLCompoundPredicateBuilder_buildOrCompoundPredicate__block_invoke;
  v3[3] = &unk_1E376C050;
  v3[4] = self;
  -[PLCompoundPredicateBuilder _joinSubpredicatesWithBlock:](self, "_joinSubpredicatesWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_joinSubpredicatesWithBlock:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  void *v6;

  v4 = (void (**)(_QWORD))a3;
  if (-[NSMutableArray count](self->_subpredicates, "count"))
  {
    if (-[NSMutableArray count](self->_subpredicates, "count") == 1)
      -[NSMutableArray firstObject](self->_subpredicates, "firstObject");
    else
      v4[2](v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subpredicates, 0);
}

uint64_t __54__PLCompoundPredicateBuilder_buildOrCompoundPredicate__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __55__PLCompoundPredicateBuilder_buildAndCompoundPredicate__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

@end
