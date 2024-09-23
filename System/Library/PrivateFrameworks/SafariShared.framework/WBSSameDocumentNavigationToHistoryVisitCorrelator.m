@implementation WBSSameDocumentNavigationToHistoryVisitCorrelator

- (WBSSameDocumentNavigationToHistoryVisitCorrelator)init
{
  WBSSameDocumentNavigationToHistoryVisitCorrelator *v2;
  uint64_t v3;
  NSMutableArray *visits;
  WBSSameDocumentNavigationToHistoryVisitCorrelator *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WBSSameDocumentNavigationToHistoryVisitCorrelator;
  v2 = -[WBSSameDocumentNavigationToHistoryVisitCorrelator init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
    v3 = objc_claimAutoreleasedReturnValue();
    visits = v2->_visits;
    v2->_visits = (NSMutableArray *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)noteVisit:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    if ((unint64_t)-[NSMutableArray count](self->_visits, "count") >= 5)
      -[NSMutableArray removeObjectAtIndex:](self->_visits, "removeObjectAtIndex:", 0);
    -[NSMutableArray addObject:](self->_visits, "addObject:", v5);
    v4 = v5;
  }

}

- (id)visitForSameDocumentNavigationToURL:(id)a3
{
  id v4;
  NSMutableArray *visits;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  visits = self->_visits;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __89__WBSSameDocumentNavigationToHistoryVisitCorrelator_visitForSameDocumentNavigationToURL___block_invoke;
  v11[3] = &unk_1E4B3F4F0;
  v6 = v4;
  v12 = v6;
  v7 = -[NSMutableArray indexOfObjectPassingTest:](visits, "indexOfObjectPassingTest:", v11);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = v7;
    -[NSMutableArray objectAtIndexedSubscript:](self->_visits, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectsInRange:](self->_visits, "removeObjectsInRange:", 0, v9 + 1);
  }

  return v8;
}

uint64_t __89__WBSSameDocumentNavigationToHistoryVisitCorrelator_visitForSameDocumentNavigationToURL___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visits, 0);
}

@end
