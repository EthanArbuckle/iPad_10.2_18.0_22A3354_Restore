@implementation PXPhotosResultRecordChangeDetails

- (PXPhotosResultRecordChangeDetails)initWithResultRecordBeforeChanges:(id)a3 resultRecordAfterChanges:(id)a4 exposedFetchResultChangeDetails:(id)a5 keyAssetsFetchResultChangeDetails:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PXPhotosResultRecordChangeDetails *v15;
  PXPhotosResultRecordChangeDetails *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PXPhotosResultRecordChangeDetails;
  v15 = -[PXPhotosResultRecordChangeDetails init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_resultRecordBeforeChanges, a3);
    objc_storeStrong((id *)&v16->_resultRecordAfterChanges, a4);
    objc_storeStrong((id *)&v16->_exposedFetchResultChangeDetails, a5);
    objc_storeStrong((id *)&v16->_keyAssetsFetchResultChangeDetails, a6);
  }

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)PXPhotosResultRecordChangeDetails;
  -[PXPhotosResultRecordChangeDetails description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosResultRecordChangeDetails resultRecordBeforeChanges](self, "resultRecordBeforeChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosResultRecordChangeDetails resultRecordAfterChanges](self, "resultRecordAfterChanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosResultRecordChangeDetails exposedFetchResultChangeDetails](self, "exposedFetchResultChangeDetails");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosResultRecordChangeDetails keyAssetsFetchResultChangeDetails](self, "keyAssetsFetchResultChangeDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ beforeChanges:%@ afterChanges:%@ exposedFetchResultChangeDetails:%@ keyAssetsFetchResultChangeDetails:%@>"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (PXPhotosResultRecord)resultRecordBeforeChanges
{
  return self->_resultRecordBeforeChanges;
}

- (PXPhotosResultRecord)resultRecordAfterChanges
{
  return self->_resultRecordAfterChanges;
}

- (PHFetchResultChangeDetails)exposedFetchResultChangeDetails
{
  return self->_exposedFetchResultChangeDetails;
}

- (PHFetchResultChangeDetails)keyAssetsFetchResultChangeDetails
{
  return self->_keyAssetsFetchResultChangeDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetsFetchResultChangeDetails, 0);
  objc_storeStrong((id *)&self->_exposedFetchResultChangeDetails, 0);
  objc_storeStrong((id *)&self->_resultRecordAfterChanges, 0);
  objc_storeStrong((id *)&self->_resultRecordBeforeChanges, 0);
}

+ (id)resultRecordChangeDetailsFor:(id)a3 withChange:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  PXPhotosResultRecordChangeDetails *v39;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  char v46;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "fetchResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changeDetailsForFetchResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "fetchResultAfterChanges");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyAssetsFetchResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changeDetailsForFetchResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "fetchResultAfterChanges");
  v12 = objc_claimAutoreleasedReturnValue();
  v46 = 0;
  objc_msgSend(v5, "curatedRefetchCondition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13
    && (objc_msgSend(v5, "curatedRefetchCondition"),
        v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
        ((void (**)(_QWORD, id, char *))v14)[2](v14, v6, &v46),
        v15 = objc_claimAutoreleasedReturnValue(),
        v14,
        v15))
  {
    v16 = 0;
    if (v9)
      goto LABEL_9;
  }
  else
  {
    objc_msgSend(v5, "curatedFetchResult");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "changeDetailsForFetchResult:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "fetchResultAfterChanges");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v9)
      goto LABEL_9;
  }
  if (!v15 && !v12 && !v46)
  {
LABEL_18:
    v19 = v5;
    goto LABEL_19;
  }
LABEL_9:
  v18 = (void *)objc_msgSend(v5, "copy");
  v19 = v18;
  if (v9)
    objc_msgSend(v18, "setFetchResult:reverseSortOrder:", v9, objc_msgSend(v18, "reverseSortOrder"));
  if (v15)
    objc_msgSend(v19, "setCuratedFetchResult:", v15);
  if (v12)
    objc_msgSend(v19, "setKeyAssetsFetchResult:", v12);
  if (v46)
    objc_msgSend(v19, "setCuratedRefetchCondition:", 0);
  if (!v19)
    goto LABEL_18;
LABEL_19:
  v44 = (void *)v12;
  objc_msgSend(v5, "exposedFetchResult");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "exposedFetchResult");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = v8;
  if (v20 != v21)
  {
    v42 = v6;
    objc_msgSend(v5, "exposedFetchResult");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "exposedFetchResult");
    v43 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v8, "fetchResultBeforeChanges");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23 == v22)
      {
        objc_msgSend(v8, "fetchResultAfterChanges");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29 == (void *)v43)
        {
          v24 = v11;
          v25 = (void *)v15;
          v26 = v16;
          v41 = v8;
          goto LABEL_39;
        }
      }
      else
      {

      }
    }
    if (!v16)
    {
LABEL_29:
      v24 = v11;
      v25 = (void *)v15;
      v26 = v16;
      objc_msgSend(v8, "changedObjects");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v32)
      {
        v34 = v32;
      }
      else
      {
        objc_msgSend(v26, "changedObjects");
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = (void *)v35;
        v37 = (void *)MEMORY[0x1E0C9AA60];
        if (v35)
          v37 = (void *)v35;
        v34 = v37;

      }
      v38 = (void *)v43;

      objc_msgSend(MEMORY[0x1E0CD1588], "changeDetailsFromFetchResult:toFetchResult:changedObjects:", v22, v43, v34);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = v44;
      goto LABEL_35;
    }
    objc_msgSend(v16, "fetchResultBeforeChanges");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30 != v22)
    {

      goto LABEL_29;
    }
    objc_msgSend(v16, "fetchResultAfterChanges");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31 != (void *)v43)
      goto LABEL_29;
    v24 = v11;
    v25 = (void *)v15;
    v26 = v16;
    v41 = v16;
LABEL_39:
    v27 = v41;
    v38 = (void *)v43;
    v28 = v44;
LABEL_35:

    v6 = v42;
    goto LABEL_36;
  }
  v24 = v11;
  v25 = (void *)v15;
  v26 = v16;
  v27 = 0;
  v28 = v44;
LABEL_36:
  v39 = -[PXPhotosResultRecordChangeDetails initWithResultRecordBeforeChanges:resultRecordAfterChanges:exposedFetchResultChangeDetails:keyAssetsFetchResultChangeDetails:]([PXPhotosResultRecordChangeDetails alloc], "initWithResultRecordBeforeChanges:resultRecordAfterChanges:exposedFetchResultChangeDetails:keyAssetsFetchResultChangeDetails:", v5, v19, v27, v24);

  return v39;
}

@end
