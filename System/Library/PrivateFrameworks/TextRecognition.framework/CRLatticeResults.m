@implementation CRLatticeResults

- (CRLatticeResults)init
{
  CRLatticeResults *v2;
  uint64_t v3;
  NSMutableArray *mutableResults;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLatticeResults;
  v2 = -[CRLatticeResults init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    mutableResults = v2->_mutableResults;
    v2->_mutableResults = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)addResult:(id)a3
{
  NSMutableArray *mutableResults;
  id v5;

  v5 = a3;
  mutableResults = self->_mutableResults;
  if (mutableResults)
    -[NSMutableArray addObject:](mutableResults, "addObject:", v5);

}

- (NSArray)results
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_mutableResults);
}

- (NSMutableArray)mutableResults
{
  return self->_mutableResults;
}

- (void)setMutableResults:(id)a3
{
  objc_storeStrong((id *)&self->_mutableResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableResults, 0);
}

@end
