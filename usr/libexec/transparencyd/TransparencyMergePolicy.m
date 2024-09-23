@implementation TransparencyMergePolicy

- (TransparencyMergePolicy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransparencyMergePolicy;
  return -[TransparencyMergePolicy initWithMergeType:](&v3, "initWithMergeType:", 1);
}

- (void)updateTreeHead:(id)a3 withConflictingHead:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "failures"));
  objc_msgSend(v5, "addFailures:", v7);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "failures", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v13), "setSth:", v5);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "failureEvent"));
  objc_msgSend(v5, "setFailureEvent:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "failureEvent"));
  objc_msgSend(v15, "setSth:", v5);

  if (objc_msgSend(v5, "inclusionVerified") == (id)2)
    objc_msgSend(v5, "setInclusionVerified:", objc_msgSend(v6, "inclusionVerified"));
  if (objc_msgSend(v5, "consistencyVerified") == (id)2)
    objc_msgSend(v5, "setConsistencyVerified:", objc_msgSend(v6, "consistencyVerified"));
  if (objc_msgSend(v5, "mmdVerified") == (id)2)
    objc_msgSend(v5, "setMmdVerified:", objc_msgSend(v6, "mmdVerified"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sth"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sth"));
  v18 = objc_msgSend(v16, "isEqualToData:", v17);

  v19 = objc_msgSend(v5, "signatureVerified");
  if ((v18 & 1) != 0)
  {
    if (v19 != (id)2)
      goto LABEL_21;
    goto LABEL_20;
  }
  if (v19 != (id)1 && objc_msgSend(v6, "signatureVerified") == (id)1)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sth"));
    objc_msgSend(v5, "setSth:", v20);

LABEL_20:
    objc_msgSend(v5, "setSignatureVerified:", objc_msgSend(v6, "signatureVerified"));
  }
LABEL_21:

}

- (void)updateDeviceRecord:(id)a3 withConflictingDevice:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "request"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "responseTime"));
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "request"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "responseTime"));
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v13 = v12;

  if (v9 > v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "loggableData"));
    objc_msgSend(v16, "setLoggableData:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "request"));
    objc_msgSend(v16, "setRequest:", v15);

  }
}

- (void)updateMutation:(id)a3 withConflictingMutation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "failures"));
  objc_msgSend(v5, "addFailures:", v7);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "failures", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v13), "setMutation:", v5);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "failureEvent"));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "failureEvent"));
    objc_msgSend(v5, "setFailureEvent:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "failureEvent"));
    objc_msgSend(v16, "setMutation:", v5);

  }
  if (objc_msgSend(v5, "signatureResult") == (id)2)
    objc_msgSend(v5, "setSignatureResult:", objc_msgSend(v6, "signatureResult"));
  if (objc_msgSend(v5, "mergeResult") == (id)2)
    objc_msgSend(v5, "setMergeResult:", objc_msgSend(v6, "mergeResult"));

}

- (BOOL)resolveConstraintConflicts:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *k;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  id v35;
  id v36;
  uint64_t v37;
  void *m;
  id v39;
  void *v40;
  BOOL v41;
  id obj;
  uint64_t v45;
  objc_super v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];

  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = a3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
  if (v5)
  {
    v6 = v5;
    v45 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v60 != v45)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "databaseObject"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "entity"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[KTTreeHead entity](KTTreeHead, "entity"));
        v12 = objc_msgSend(v10, "isKindOfEntity:", v11);

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "databaseObject"));
        v14 = v13;
        if (v12)
        {
          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "conflictingObjects"));
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v56;
            do
            {
              for (j = 0; j != v17; j = (char *)j + 1)
              {
                if (*(_QWORD *)v56 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(id *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)j);
                -[TransparencyMergePolicy updateTreeHead:withConflictingHead:](self, "updateTreeHead:withConflictingHead:", v14, v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "managedObjectContext"));
                objc_msgSend(v21, "deleteObject:", v20);

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
            }
            while (v17);
          }
        }
        else
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "entity"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[KTDeviceRecord entity](KTDeviceRecord, "entity"));
          v24 = objc_msgSend(v22, "isKindOfEntity:", v23);

          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "databaseObject"));
          v14 = v25;
          if (v24)
          {
            v53 = 0u;
            v54 = 0u;
            v51 = 0u;
            v52 = 0u;
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "conflictingObjects"));
            v26 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v52;
              do
              {
                for (k = 0; k != v27; k = (char *)k + 1)
                {
                  if (*(_QWORD *)v52 != v28)
                    objc_enumerationMutation(v15);
                  v30 = *(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)k);
                  -[TransparencyMergePolicy updateDeviceRecord:withConflictingDevice:](self, "updateDeviceRecord:withConflictingDevice:", v14, v30);
                  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "managedObjectContext"));
                  objc_msgSend(v31, "deleteObject:", v30);

                }
                v27 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
              }
              while (v27);
            }
          }
          else
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "entity"));
            v33 = (void *)objc_claimAutoreleasedReturnValue(+[KTMutation entity](KTMutation, "entity"));
            v34 = objc_msgSend(v32, "isKindOfEntity:", v33);

            if (!v34)
              continue;
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "databaseObject"));
            v47 = 0u;
            v48 = 0u;
            v49 = 0u;
            v50 = 0u;
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "conflictingObjects"));
            v35 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
            if (v35)
            {
              v36 = v35;
              v37 = *(_QWORD *)v48;
              do
              {
                for (m = 0; m != v36; m = (char *)m + 1)
                {
                  if (*(_QWORD *)v48 != v37)
                    objc_enumerationMutation(v15);
                  v39 = *(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)m);
                  -[TransparencyMergePolicy updateMutation:withConflictingMutation:](self, "updateMutation:withConflictingMutation:", v14, v39);
                  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "managedObjectContext"));
                  objc_msgSend(v40, "deleteObject:", v39);

                }
                v36 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
              }
              while (v36);
            }
          }
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
    }
    while (v6);
  }
  v46.receiver = self;
  v46.super_class = (Class)TransparencyMergePolicy;
  v41 = -[TransparencyMergePolicy resolveConstraintConflicts:error:](&v46, "resolveConstraintConflicts:error:", obj, a4);

  return v41;
}

@end
