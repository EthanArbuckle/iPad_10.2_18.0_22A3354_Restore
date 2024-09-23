@implementation GetMailIntentHandler

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004938;
  block[3] = &unk_10000C3A0;
  block[4] = a1;
  if (qword_100012348 != -1)
    dispatch_once(&qword_100012348, block);
  return (id)qword_100012340;
}

- (void)confirmGetMail:(id)a3 completion:(id)a4
{
  id v4;
  void (**v5)(id, id);

  v5 = (void (**)(id, id))a4;
  v4 = objc_msgSend(objc_alloc((Class)MSGetMailIntentResponse), "initWithCode:userActivity:", 1, 0);
  v5[2](v5, v4);

}

- (void)handleGetMail:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id completionHandler;
  id v41;

  v41 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableArray);
  if (objc_msgSend(v41, "readStatus"))
  {
    v8 = objc_alloc((Class)MSCriterion);
    v9 = objc_msgSend(v41, "readStatus");
    v10 = &MSCriterionExpressionRead;
    if (v9 != (id)2)
      v10 = &MSCriterionExpressionUnread;
    v11 = objc_msgSend(v8, "initWithType:qualifier:expression:", MSCriterionTypeReadStatus, MSCriterionQualifierContains, *v10);
    objc_msgSend(v7, "addObject:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "sender"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "personHandle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value"));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "sender"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "personHandle"));
    v17 = objc_msgSend(v16, "type");

    if (v17 != (id)1)
      goto LABEL_9;
    v18 = objc_alloc((Class)MSCriterion);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "sender"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "personHandle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value"));
    v20 = objc_msgSend(v18, "initWithType:qualifier:expression:", MSCriterionTypeSender, MSCriterionQualifierContains, v19);
    objc_msgSend(v7, "addObject:", v20);

  }
LABEL_9:
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "recipient"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "personHandle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "value"));
  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "recipient"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "personHandle"));
    v26 = objc_msgSend(v25, "type");

    if (v26 != (id)1)
      goto LABEL_13;
    v27 = objc_alloc((Class)MSCriterion);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "recipient"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "personHandle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "value"));
    v29 = objc_msgSend(v27, "initWithType:qualifier:expression:", MSCriterionTypeAnyRecipient, MSCriterionQualifierContains, v28);
    objc_msgSend(v7, "addObject:", v29);

  }
LABEL_13:
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "subject"));
  v31 = objc_msgSend(v30, "length");

  if (v31)
  {
    v32 = objc_alloc((Class)MSCriterion);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "subject"));
    v34 = objc_msgSend(v32, "initWithType:qualifier:expression:", MSCriterionTypeSubject, MSCriterionQualifierContains, v33);
    objc_msgSend(v7, "addObject:", v34);

  }
  if (objc_msgSend(v7, "count") == (id)1)
    v35 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  else
    v35 = objc_msgSend(objc_alloc((Class)MSCriterion), "initWithCriteria:allRequired:", v7, 1);
  v36 = v35;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", MSResultsKeyMessageReference, MSResultsKeyDateSent, MSResultsKeySender, MSResultsKeyRecipientTo, MSResultsKeyRecipientCc, MSResultsKeyRecipientBcc, MSResultsKeySubject, MSResultsKeyBodySummary, 0));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[MSSearch findMessageData:matchingCriterion:options:delegate:](MSSearch, "findMessageData:matchingCriterion:options:delegate:", v37, v36, 4, self));

  if (v38)
  {
    objc_storeStrong((id *)&self->_currentSearch, v38);
    v39 = objc_retainBlock(v6);
    completionHandler = self->_completionHandler;
    self->_completionHandler = v39;
  }
  else
  {
    completionHandler = objc_msgSend(objc_alloc((Class)MSGetMailIntentResponse), "initWithCode:userActivity:", 5, 0);
    (*((void (**)(id, id))v6 + 2))(v6, completionHandler);
  }

}

- (BOOL)search:(id)a3 didFindResults:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  NSMutableArray *results;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a3;
  v7 = a4;
  if (!self->_results)
  {
    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    results = self->_results;
    self->_results = v8;

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v10);
        -[NSMutableArray ef_insertObject:usingComparator:allowDuplicates:](self->_results, "ef_insertObject:usingComparator:allowDuplicates:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), &stru_10000C678, 1, (_QWORD)v17);
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GetMailIntentHandler results](self, "results"));
  v15 = (unint64_t)objc_msgSend(v14, "count") < 0x1A;

  return v15;
}

- (void)search:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  void (**completionHandler)(id, id);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  MSSearch *currentSearch;
  id v13;
  NSMutableArray *results;
  id v15;

  v15 = a3;
  v6 = a4;
  if (v6)
  {
    completionHandler = (void (**)(id, id))self->_completionHandler;
    v8 = objc_msgSend(objc_alloc((Class)MSGetMailIntentResponse), "initWithCode:userActivity:", 5, 0);
    completionHandler[2](completionHandler, v8);
  }
  else
  {
    v8 = objc_msgSend(objc_alloc((Class)MSGetMailIntentResponse), "initWithCode:userActivity:", 4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GetMailIntentHandler results](self, "results"));
    v10 = v9;
    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ef_map:", &stru_10000C6B8));
      objc_msgSend(v8, "setMails:", v11);

    }
    (*((void (**)(void))self->_completionHandler + 2))();

  }
  currentSearch = self->_currentSearch;
  self->_currentSearch = 0;

  v13 = self->_completionHandler;
  self->_completionHandler = 0;

  results = self->_results;
  self->_results = 0;

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (MSSearch)currentSearch
{
  return self->_currentSearch;
}

- (void)setCurrentSearch:(id)a3
{
  objc_storeStrong((id *)&self->_currentSearch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSearch, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
