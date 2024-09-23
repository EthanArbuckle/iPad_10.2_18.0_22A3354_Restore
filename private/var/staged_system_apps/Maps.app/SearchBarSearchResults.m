@implementation SearchBarSearchResults

- (SearchBarSearchResults)init
{
  SearchBarSearchResults *v2;
  NSArray *v3;
  NSArray *resultSets;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchBarSearchResults;
  v2 = -[SearchBarSearchResults init](&v6, "init");
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init((Class)NSArray);
    resultSets = v2->_resultSets;
    v2->_resultSets = v3;

  }
  return v2;
}

- (id)filteredResultsWithBackfill:(int64_t)a3
{
  NSUInteger v5;
  NSArray *v6;
  id v7;
  id v8;
  char *v9;
  uint64_t v10;
  void *v11;
  char *v12;
  void *v13;
  void *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  id v25;
  id v26;
  char *v27;
  uint64_t v28;
  void *v29;
  char *v30;
  uint64_t v31;
  void *v32;
  _QWORD v34[2];
  char *v35;
  char *v36;
  char *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];

  if (self->_resultSets)
  {
    v38 = objc_alloc_init((Class)NSMutableArray);
    v5 = -[NSArray count](self->_resultSets, "count");
    v34[1] = v34;
    v35 = (char *)&v34[-2 * v5];
    bzero(v35, 16 * v5);
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v34[0] = self;
    v6 = self->_resultSets;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v47;
      v36 = v35 + 8;
      do
      {
        v11 = 0;
        v37 = v9;
        v12 = &v36[16 * (_QWORD)v9];
        do
        {
          if (*(_QWORD *)v47 != v10)
            objc_enumerationMutation(v6);
          v13 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "results"));
          v15 = (char *)objc_msgSend(v14, "count");

          v16 = (char *)objc_msgSend(v13, "count");
          if (v15 >= v16)
            v17 = v16;
          else
            v17 = v15;
          *((_QWORD *)v12 - 1) = v17;
          *(_QWORD *)v12 = v15 - v17;
          v12 += 16;
          v11 = (char *)v11 + 1;
        }
        while (v8 != v11);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        v9 = (char *)v11 + (_QWORD)v37;
      }
      while (v8);
    }

    v18 = v34[0];
    if (a3 >= 1)
    {
      v19 = v35 + 8;
      do
      {
        if (!objc_msgSend(*(id *)(v18 + 8), "count"))
          break;
        v20 = 0;
        v21 = 1;
        v22 = (uint64_t *)v19;
        do
        {
          v23 = *v22;
          if (*v22)
            v24 = a3 < 1;
          else
            v24 = 1;
          if (!v24)
          {
            v21 = 0;
            ++*(v22 - 1);
            *v22 = v23 - 1;
            --a3;
          }
          ++v20;
          v22 += 2;
        }
        while (v20 < (unint64_t)objc_msgSend(*(id *)(v18 + 8), "count"));
      }
      while ((v21 & 1) == 0 && a3 >= 1);
    }
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v37 = (char *)*(id *)(v18 + 8);
    v25 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v25)
    {
      v26 = v25;
      v27 = 0;
      v28 = *(_QWORD *)v43;
      do
      {
        v29 = 0;
        v36 = v27;
        v30 = &v35[16 * (_QWORD)v27];
        do
        {
          if (*(_QWORD *)v43 != v28)
            objc_enumerationMutation(v37);
          v31 = *(_QWORD *)v30;
          v30 += 16;
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v29), "results"));
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_10035D0AC;
          v39[3] = &unk_1011B2A18;
          v41 = v31;
          v40 = v38;
          objc_msgSend(v32, "enumerateObjectsUsingBlock:", v39);

          v29 = (char *)v29 + 1;
        }
        while (v26 != v29);
        v26 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        v27 = (char *)v29 + (_QWORD)v36;
      }
      while (v26);
    }

  }
  else
  {
    v38 = 0;
  }
  return v38;
}

- (void)addResultSet:(id)a3 withMaxCount:(unint64_t)a4
{
  NSArray *resultSets;
  id v7;
  SearchBarSearchResultSet *v8;
  NSArray *v9;
  NSArray *v10;
  id v11;

  resultSets = self->_resultSets;
  v7 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", resultSets));
  v8 = -[SearchBarSearchResultSet initWithResults:maxCount:]([SearchBarSearchResultSet alloc], "initWithResults:maxCount:", v7, a4);

  objc_msgSend(v11, "addObject:", v8);
  v9 = (NSArray *)objc_msgSend(v11, "copy");
  v10 = self->_resultSets;
  self->_resultSets = v9;

}

- (id)copy
{
  SearchBarSearchResults *v3;

  v3 = objc_alloc_init(SearchBarSearchResults);
  -[SearchBarSearchResults setResultSets:](v3, "setResultSets:", self->_resultSets);
  return v3;
}

- (NSArray)resultSets
{
  return self->_resultSets;
}

- (void)setResultSets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultSets, 0);
}

@end
