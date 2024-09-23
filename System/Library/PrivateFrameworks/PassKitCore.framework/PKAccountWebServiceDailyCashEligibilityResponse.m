@implementation PKAccountWebServiceDailyCashEligibilityResponse

- (PKAccountWebServiceDailyCashEligibilityResponse)initWithData:(id)a3
{
  PKAccountWebServiceDailyCashEligibilityResponse *v3;
  PKAccountWebServiceDailyCashEligibilityResponse *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  PKAccountDailyCashDestination *v22;
  PKAccountDailyCashDestinationsSummary *v23;
  void *v24;
  uint64_t v25;
  PKAccountDailyCashDestinationsSummary *summary;
  void *v28;
  void *v29;
  void *v30;
  PKAccountWebServiceDailyCashEligibilityResponse *v31;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)PKAccountWebServiceDailyCashEligibilityResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v38, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "PKArrayForKey:", CFSTR("destinations"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "PKStringForKey:", CFSTR("localizedTitle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "PKStringForKey:", CFSTR("localizedFooter"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "PKStringForKey:", CFSTR("currentDestination"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = PKAccountRewardRedemptionTypeFromString(v9);

      if (objc_msgSend(v6, "count"))
      {
        v28 = v8;
        v30 = v5;
        v31 = v4;
        v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v29 = v6;
        v10 = v6;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v35 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v15, "PKStringForKey:", CFSTR("localizedTitle"));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "PKStringForKey:", CFSTR("localizedSubtitle"));
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "PKStringForKey:", CFSTR("destination"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = PKAccountRewardRedemptionTypeFromString(v18);

                if (v19)
                  v20 = v16 == 0;
                else
                  v20 = 1;
                if (!v20 && v17 != 0)
                {
                  v22 = -[PKAccountDailyCashDestination initWithDestination:isCurrent:localizedTitle:localizedSubtitle:]([PKAccountDailyCashDestination alloc], "initWithDestination:isCurrent:localizedTitle:localizedSubtitle:", v19, v19 == v32, v16, v17);
                  objc_msgSend(v33, "addObject:", v22);

                }
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
          }
          while (v12);
        }

        v23 = [PKAccountDailyCashDestinationsSummary alloc];
        v24 = (void *)objc_msgSend(v33, "copy");
        v8 = v28;
        v25 = -[PKAccountDailyCashDestinationsSummary initWithDestinations:localizedTitle:localizedFooterText:](v23, "initWithDestinations:localizedTitle:localizedFooterText:", v24, v7, v28);
        v4 = v31;
        summary = v31->_summary;
        v31->_summary = (PKAccountDailyCashDestinationsSummary *)v25;

        v6 = v29;
        v5 = v30;
      }

    }
  }
  return v4;
}

- (PKAccountDailyCashDestinationsSummary)summary
{
  return self->_summary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
}

@end
