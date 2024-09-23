@implementation PXPhotosResultTuple

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (PHFetchResult)keyAssetsFetchResult
{
  return self->_keyAssetsFetchResult;
}

- (PHFetchResult)curatedFetchResult
{
  return self->_curatedFetchResult;
}

- (BOOL)fetchedWithReverseSortOrder
{
  return self->_fetchedWithReverseSortOrder;
}

- (id)curatedRefetchCondition
{
  return self->_curatedRefetchCondition;
}

- (PXPhotosResultTuple)initWithFetchResult:(id)a3 fetchedWithReverseSortOrder:(BOOL)a4 curatedFetchResult:(id)a5 curatedRefetchCondition:(id)a6 keyAssetsFetchResult:(id)a7 filterPredicate:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  PXPhotosResultTuple *v19;
  PXPhotosResultTuple *v20;
  uint64_t v21;
  id curatedRefetchCondition;
  id v24;
  objc_super v25;

  v24 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)PXPhotosResultTuple;
  v19 = -[PXPhotosResultTuple init](&v25, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_fetchResult, a3);
    v20->_fetchedWithReverseSortOrder = a4;
    objc_storeStrong((id *)&v20->_curatedFetchResult, a5);
    v21 = objc_msgSend(v16, "copy");
    curatedRefetchCondition = v20->_curatedRefetchCondition;
    v20->_curatedRefetchCondition = (id)v21;

    objc_storeStrong((id *)&v20->_keyAssetsFetchResult, a7);
    objc_storeStrong((id *)&v20->_filterPredicate, a8);
  }

  return v20;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong(&self->_curatedRefetchCondition, 0);
  objc_storeStrong((id *)&self->_keyAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_curatedFetchResult, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
}

- (id)resultTupleUpdatedWithChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PHFetchResult *v8;
  PHFetchResult *v9;
  PHFetchResult *v10;
  PHFetchResult *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  PHFetchResult *v14;
  id curatedRefetchCondition;
  void *v16;
  void *v17;
  PHFetchResult *curatedFetchResult;
  PXPhotosResultTuple *v19;
  _BOOL8 fetchedWithReverseSortOrder;
  PHFetchResult *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  PXPhotosResultTuple *v28;
  char v30;

  v4 = a3;
  v5 = v4;
  if (self->_fetchResult)
  {
    objc_msgSend(v4, "changeDetailsForFetchResult:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (self->_keyAssetsFetchResult)
  {
    objc_msgSend(v5, "changeDetailsForFetchResult:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
LABEL_6:
      objc_msgSend(v6, "fetchResultAfterChanges");
      v8 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else
  {
    v7 = 0;
    if (v6)
      goto LABEL_6;
  }
  v8 = self->_fetchResult;
LABEL_9:
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v7, "fetchResultAfterChanges");
    v10 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = self->_keyAssetsFetchResult;
  }
  v11 = v10;
  v30 = 0;
  -[PXPhotosResultTuple curatedRefetchCondition](self, "curatedRefetchCondition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[PXPhotosResultTuple curatedRefetchCondition](self, "curatedRefetchCondition");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, char *))v13)[2](v13, v5, &v30);
    v14 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  if (v30)
  {
    curatedRefetchCondition = self->_curatedRefetchCondition;
    self->_curatedRefetchCondition = 0;

  }
  if (!v14)
  {
    if (self->_curatedFetchResult)
    {
      objc_msgSend(v5, "changeDetailsForFetchResult:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = v16;
        objc_msgSend(v16, "fetchResultAfterChanges");
        v14 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();

        goto LABEL_24;
      }
      curatedFetchResult = self->_curatedFetchResult;
    }
    else
    {
      curatedFetchResult = 0;
    }
    v14 = curatedFetchResult;
  }
LABEL_24:
  if (v9 == self->_fetchResult && v14 == self->_curatedFetchResult && v11 == self->_keyAssetsFetchResult)
  {
    v28 = self;
  }
  else
  {
    v19 = [PXPhotosResultTuple alloc];
    fetchedWithReverseSortOrder = self->_fetchedWithReverseSortOrder;
    v21 = v11;
    v22 = self->_curatedRefetchCondition;
    -[PXPhotosResultTuple filterPredicate](self, "filterPredicate");
    v23 = v7;
    v24 = v5;
    v25 = v6;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v22;
    v11 = v21;
    v28 = -[PXPhotosResultTuple initWithFetchResult:fetchedWithReverseSortOrder:curatedFetchResult:curatedRefetchCondition:keyAssetsFetchResult:filterPredicate:](v19, "initWithFetchResult:fetchedWithReverseSortOrder:curatedFetchResult:curatedRefetchCondition:keyAssetsFetchResult:filterPredicate:", v9, fetchedWithReverseSortOrder, v14, v27, v21, v26);

    v6 = v25;
    v5 = v24;
    v7 = v23;
  }

  return v28;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)PXPhotosResultTuple;
  -[PXPhotosResultTuple description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosResultTuple fetchResult](self, "fetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosResultTuple curatedFetchResult](self, "curatedFetchResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ fetchResult:%@ curatedFetchResult:%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
