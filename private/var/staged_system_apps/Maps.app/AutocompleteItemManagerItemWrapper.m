@implementation AutocompleteItemManagerItemWrapper

- (AutocompleteItemManagerItemWrapper)initWithItem:(id)a3 compoundItem:(id)a4
{
  id v7;
  id v8;
  AutocompleteItemManagerItemWrapper *v9;
  AutocompleteItemManagerItemWrapper *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AutocompleteItemManagerItemWrapper;
  v9 = -[AutocompleteItemManagerItemWrapper init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_item, a3);
    objc_storeStrong((id *)&v10->_compoundItem, a4);
  }

  return v10;
}

- (PersonalizedAutocompleteItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (PersonalizedCompoundItem)compoundItem
{
  return self->_compoundItem;
}

- (void)setCompoundItem:(id)a3
{
  objc_storeStrong((id *)&self->_compoundItem, a3);
}

- (double)clientRankingScore
{
  return self->_clientRankingScore;
}

- (void)setClientRankingScore:(double)a3
{
  self->_clientRankingScore = a3;
}

- (double)poiRelevanceScore
{
  return self->_poiRelevanceScore;
}

- (void)setPoiRelevanceScore:(double)a3
{
  self->_poiRelevanceScore = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (AutocompleteMutableSection)section
{
  return (AutocompleteMutableSection *)objc_loadWeakRetained((id *)&self->_section);
}

- (void)setSection:(id)a3
{
  objc_storeWeak((id *)&self->_section, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_section);
  objc_storeStrong((id *)&self->_compoundItem, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
