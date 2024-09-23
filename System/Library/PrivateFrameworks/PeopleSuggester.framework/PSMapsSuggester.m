@implementation PSMapsSuggester

uint64_t __40___PSMapsSuggester_provideMapsFeedback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "feedbackPayload");
}

uint64_t __99___PSMapsSuggester_deleteMapsFeedbackEventsMatchingHandle_contactId_startLocationId_endLocationId___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  _BOOL4 v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = a1[4] != 0;
    objc_msgSend(v4, "handle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 != (v6 == 0))
    {
      v7 = a1[5] != 0;
      objc_msgSend(v4, "startLocationId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (((v7 ^ (v8 == 0)) & 1) != 0)
      {
        v9 = a1[6] != 0;
        objc_msgSend(v4, "endLocationId");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (((v9 ^ (v10 == 0)) & 1) != 0)
        {
          v12 = a1[7] == 0;
          objc_msgSend(v4, "contactId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v12 ^ (v13 == 0);

          if ((v14 & 1) != 0)
            goto LABEL_21;
          v15 = (void *)a1[4];
          if (v15)
          {
            objc_msgSend(v4, "handle");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v15, "isEqualToString:", v16);

            if (!v17)
              goto LABEL_21;
          }
          v18 = (void *)a1[5];
          if (v18)
          {
            objc_msgSend(v4, "startLocationId");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v18, "isEqualToString:", v19);

            if (!v20)
              goto LABEL_21;
          }
          v21 = (void *)a1[6];
          if (v21)
          {
            objc_msgSend(v4, "endLocationId");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v21, "isEqualToString:", v22);

            if (!v23)
            {
LABEL_21:
              v25 = 0;
              goto LABEL_19;
            }
          }
          v24 = (void *)a1[7];
          if (!v24)
          {
            v25 = 1;
            goto LABEL_19;
          }
          objc_msgSend(v4, "contactId");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "isEqualToString:", v6);
LABEL_18:

LABEL_19:
          goto LABEL_20;
        }

      }
    }
    v25 = 0;
    goto LABEL_18;
  }
  v25 = 0;
LABEL_20:

  return v25;
}

@end
