@implementation RTSourceEventKit(RTEventManager)

- (id)initWithEvent:()RTEventManager
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v24;
  uint64_t v25;
  void *v26;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "sharingStatus");

    if (v7 == 1)
      v8 = 1;
    else
      v8 = 2 * (v7 == 2);
    objc_msgSend(v5, "customObjectForKey:", CFSTR("SuggestionsSchemaOrg"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v25 = v8;
    v26 = v9;
    v24 = a1;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v10, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v5, "eventIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "location");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v5, "isAllDay");
    objc_msgSend(v5, "suggestionInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "opaqueKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    a1 = (id)objc_msgSend(v24, "initWithEventIdentifier:startDate:endDate:title:location:allDay:sharingStatus:suggestionInfo_opaqueKey:suggestionsSchemaOrg:", v15, v16, v17, v18, v19, v20, v25, v22, v13);

    v14 = a1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
