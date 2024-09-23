@implementation RAPBatchSubmissionStatusResult

- (RAPBatchSubmissionStatusResult)initWithRAPInfos:(id)a3
{
  id v5;
  RAPBatchSubmissionStatusResult *v6;
  RAPBatchSubmissionStatusResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPBatchSubmissionStatusResult;
  v6 = -[RAPBatchSubmissionStatusResult init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rapInfos, a3);
    -[RAPBatchSubmissionStatusResult _setupResultWithRAPInfos:](v7, "_setupResultWithRAPInfos:", v5);
  }

  return v7;
}

- (void)_setupResultWithRAPInfos:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  unsigned int v13;
  void *v14;
  NSMutableArray *v15;
  NSArray *v16;
  NSArray *reviewedSubmissionIdentifiers;
  NSArray *v18;
  NSArray *inReviewSubmissionIdentifiers;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v6 = objc_opt_new(NSMutableArray);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v13 = objc_msgSend(v12, "isReviewed", (_QWORD)v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rapId"));
        if (v13)
          v15 = v5;
        else
          v15 = v6;
        -[NSMutableArray addObject:](v15, "addObject:", v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v16 = (NSArray *)-[NSMutableArray copy](v5, "copy");
  reviewedSubmissionIdentifiers = self->_reviewedSubmissionIdentifiers;
  self->_reviewedSubmissionIdentifiers = v16;

  v18 = (NSArray *)-[NSMutableArray copy](v6, "copy");
  inReviewSubmissionIdentifiers = self->_inReviewSubmissionIdentifiers;
  self->_inReviewSubmissionIdentifiers = v18;

}

- (NSArray)reviewedSubmissionIdentifiers
{
  return self->_reviewedSubmissionIdentifiers;
}

- (void)setReviewedSubmissionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_reviewedSubmissionIdentifiers, a3);
}

- (NSArray)inReviewSubmissionIdentifiers
{
  return self->_inReviewSubmissionIdentifiers;
}

- (void)setInReviewSubmissionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_inReviewSubmissionIdentifiers, a3);
}

- (NSArray)rapInfos
{
  return self->_rapInfos;
}

- (void)setRapInfos:(id)a3
{
  objc_storeStrong((id *)&self->_rapInfos, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapInfos, 0);
  objc_storeStrong((id *)&self->_inReviewSubmissionIdentifiers, 0);
  objc_storeStrong((id *)&self->_reviewedSubmissionIdentifiers, 0);
}

@end
