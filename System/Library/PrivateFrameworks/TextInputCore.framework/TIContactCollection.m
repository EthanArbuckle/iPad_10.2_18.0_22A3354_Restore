@implementation TIContactCollection

- (TIContactCollection)initWithRelevanceScoreType:(BOOL)a3
{
  TIContactCollection *v4;
  NSMutableArray *v5;
  NSMutableArray *contacts;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIContactCollection;
  v4 = -[TIContactCollection init](&v8, sel_init);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    contacts = v4->_contacts;
    v4->_contacts = v5;

    v4->_sourceHasRelevancyScore = a3;
    v4->_count = 0;
  }
  return v4;
}

- (void)addContact:(id)a3
{
  -[NSMutableArray addObject:](self->_contacts, "addObject:", a3);
  ++self->_count;
}

- (void)enumerateContactsUsingBlock:(id)a3
{
  id v4;
  NSMutableArray *contacts;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  contacts = self->_contacts;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__TIContactCollection_enumerateContactsUsingBlock___block_invoke;
  v7[3] = &unk_1EA1009D8;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](contacts, "enumerateObjectsUsingBlock:", v7);

}

- (BOOL)sourceHasRelevancyScore
{
  return self->_sourceHasRelevancyScore;
}

- (int64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contacts, 0);
}

uint64_t __51__TIContactCollection_enumerateContactsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
