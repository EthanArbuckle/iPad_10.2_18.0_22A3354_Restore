@implementation PFStoryConcreteTransitionTable

- (PFStoryConcreteTransitionTable)initWithTransitionsByColorGrade:(id)a3 defaultFrequencies:(id)a4
{
  id v7;
  id v8;
  PFStoryConcreteTransitionTable *v9;
  void **p_defaultFrequencies;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PFStoryConcreteTransitionTable;
  v9 = -[PFStoryConcreteTransitionTable init](&v16, sel_init);
  objc_storeStrong((id *)&v9->_transitionsByColorGrade, a3);
  p_defaultFrequencies = (void **)&v9->_defaultFrequencies;
  objc_storeStrong((id *)&v9->_defaultFrequencies, a4);
  if (!v9->_defaultFrequencies)
  {
    v11 = 9;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 9);
    do
    {
      objc_msgSend(v12, "addObject:", &unk_1E45CA070);
      --v11;
    }
    while (v11);
    v13 = objc_msgSend(v12, "copy");

    v14 = *p_defaultFrequencies;
    *p_defaultFrequencies = (void *)v13;

  }
  return v9;
}

- (id)transitionsForColorGrade:(id)a3 songPace:(int64_t)a4
{
  NSArray *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;

  v7 = self->_defaultFrequencies;
  -[NSDictionary objectForKeyedSubscript:](self->_transitionsByColorGrade, "objectForKeyedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = v10;

      v7 = v11;
    }

  }
  return v7;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p transitionsByColorGrade: %@, defaultFrequencies: %@>"), objc_opt_class(), self, self->_transitionsByColorGrade, self->_defaultFrequencies);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultFrequencies, 0);
  objc_storeStrong((id *)&self->_transitionsByColorGrade, 0);
}

@end
