@implementation PPCoalescedScoredNamedEntity

- (PPCoalescedScoredNamedEntity)initWithScoredNamedEntity:(id)a3 occurrencesInSource:(unsigned __int16)a4
{
  id v7;
  PPCoalescedScoredNamedEntity *v8;
  PPCoalescedScoredNamedEntity *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPCoalescedScoredNamedEntity;
  v8 = -[PPCoalescedScoredNamedEntity init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_scoredNamedEntity, a3);
    v9->_occurrencesInSource = a4;
  }

  return v9;
}

- (PPScoredItem)scoredNamedEntity
{
  return self->_scoredNamedEntity;
}

- (unsigned)occurrencesInSource
{
  return self->_occurrencesInSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoredNamedEntity, 0);
}

@end
