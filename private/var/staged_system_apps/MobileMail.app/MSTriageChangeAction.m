@implementation MSTriageChangeAction

+ (id)mf_indicatorPreviewChangeWithAction:(int64_t)a3 interaction:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  char v15;
  uint64_t v16;

  v5 = a4;
  v6 = v5;
  v7 = 0;
  switch(a3)
  {
    case 2:
    case 10:
    case 11:
      v7 = objc_msgSend(objc_alloc((Class)MSTriageChangeAction), "initWithChangeAction:flagState:", a3, objc_msgSend(v5, "flagState") ^ objc_msgSend(v5, "shouldOverrideFlagState"));
      goto LABEL_14;
    case 3:
      v8 = objc_alloc((Class)MSTriageChangeAction);
      v9 = objc_msgSend(v6, "hasReadLater");
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectedDate"));
      v11 = objc_msgSend(v8, "initWithChangeAction:flagState:readLaterDate:", 3, v9, v10);
      goto LABEL_13;
    case 6:
      v12 = objc_msgSend(v5, "flagState");
      v13 = objc_opt_class(MFFlagColorTriageInteraction);
      if ((objc_opt_isKindOfClass(v6, v13) & 1) != 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "flagColor"));

        if (v14)
          v15 = v12;
        else
          v15 = 0;
        if ((v15 & 1) == 0)
          goto LABEL_9;
      }
      else if (!v12)
      {
LABEL_9:
        v10 = 0;
        v16 = 0;
        goto LABEL_12;
      }
      v10 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndex:", +[MFFlagTriageInteraction defaultColor](MFFlagTriageInteraction, "defaultColor"));
      v16 = 1;
LABEL_12:
      v11 = objc_msgSend(objc_alloc((Class)MSTriageChangeAction), "initWithChangeAction:flagState:flagColors:", 6, v16, v10);
LABEL_13:
      v7 = v11;

LABEL_14:
      return v7;
    default:
      goto LABEL_14;
  }
}

@end
