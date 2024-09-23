@implementation PKPayLaterDynamicContent

- (PKPayLaterDynamicContent)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  PKPayLaterDynamicContent *v6;
  uint64_t v7;
  NSDictionary *contentByPageType;
  PKPayLaterDynamicContent *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_contentByPageTypeFromDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v11.receiver = self;
    v11.super_class = (Class)PKPayLaterDynamicContent;
    v6 = -[PKPayLaterDynamicContent init](&v11, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(v5, "copy");
      contentByPageType = v6->_contentByPageType;
      v6->_contentByPageType = (NSDictionary *)v7;

    }
    self = v6;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_contentByPageTypeFromDictionary:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__PKPayLaterDynamicContent__contentByPageTypeFromDictionary___block_invoke;
  v9[3] = &unk_1E2AC28F0;
  v6 = v5;
  v10 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

  if (objc_msgSend(v6, "count"))
    v7 = (void *)objc_msgSend(v6, "copy");
  else
    v7 = 0;

  return v7;
}

void __61__PKPayLaterDynamicContent__contentByPageTypeFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  __CFString *v7;
  char v8;
  uint64_t v9;
  PKPayLaterDynamicContentPage *v10;
  __CFString *v11;
  __CFString *v12;
  char v13;
  __CFString *v14;
  __CFString *v15;
  char v16;
  __CFString *v17;
  __CFString *v18;
  char v19;
  __CFString *v20;
  __CFString *v21;
  char v22;
  __CFString *v23;
  __CFString *v24;
  char v25;
  __CFString *v26;
  __CFString *v27;
  char v28;
  __CFString *v29;
  __CFString *v30;
  char v31;
  __CFString *v32;
  __CFString *v33;
  char v34;
  __CFString *v35;
  __CFString *v36;
  char v37;
  __CFString *v38;
  __CFString *v39;
  char v40;
  __CFString *v41;
  __CFString *v42;
  char v43;
  __CFString *v44;
  __CFString *v45;
  char v46;
  __CFString *v47;
  __CFString *v48;
  char v49;
  __CFString *v50;
  __CFString *v51;
  char v52;
  __CFString *v53;
  __CFString *v54;
  char v55;
  __CFString *v56;
  int v57;
  void *v58;
  void *v59;
  __CFString *v60;

  v5 = a2;
  v6 = a3;
  v7 = (__CFString *)v5;
  v60 = v7;
  if (v7 == CFSTR("payLaterTab"))
  {
    v9 = 1;
  }
  else
  {
    if (!v7)
    {
      v10 = 0;
      goto LABEL_58;
    }
    v8 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("payLaterTab"));

    if ((v8 & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      v11 = v60;
      if (v11 == CFSTR("splashScreen")
        || (v12 = v11,
            v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("splashScreen")),
            v12,
            (v13 & 1) != 0))
      {
        v9 = 2;
      }
      else
      {
        v14 = v12;
        if (v14 == CFSTR("paymentPlan")
          || (v15 = v14,
              v16 = -[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("paymentPlan")),
              v15,
              (v16 & 1) != 0))
        {
          v9 = 4;
        }
        else
        {
          v17 = v15;
          if (v17 == CFSTR("paymentMethod")
            || (v18 = v17,
                v19 = -[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("paymentMethod")),
                v18,
                (v19 & 1) != 0))
          {
            v9 = 5;
          }
          else
          {
            v20 = v18;
            if (v20 == CFSTR("paymentOptions")
              || (v21 = v20,
                  v22 = -[__CFString isEqualToString:](v20, "isEqualToString:", CFSTR("paymentOptions")),
                  v21,
                  (v22 & 1) != 0))
            {
              v9 = 6;
            }
            else
            {
              v23 = v21;
              if (v23 == CFSTR("selectedFinancingOption")
                || (v24 = v23,
                    v25 = -[__CFString isEqualToString:](v23, "isEqualToString:", CFSTR("selectedFinancingOption")),
                    v24,
                    (v25 & 1) != 0))
              {
                v9 = 7;
              }
              else
              {
                v26 = v24;
                if (v26 == CFSTR("selectedFinancingOptionLineItems")
                  || (v27 = v26,
                      v28 = -[__CFString isEqualToString:](v26, "isEqualToString:", CFSTR("selectedFinancingOptionLineItems")), v27, (v28 & 1) != 0))
                {
                  v9 = 8;
                }
                else
                {
                  v29 = v27;
                  if (v29 == CFSTR("moreInformation")
                    || (v30 = v29,
                        v31 = -[__CFString isEqualToString:](v29, "isEqualToString:", CFSTR("moreInformation")),
                        v30,
                        (v31 & 1) != 0))
                  {
                    v9 = 9;
                  }
                  else
                  {
                    v32 = v30;
                    if (v32 == CFSTR("userEnteredAmount")
                      || (v33 = v32,
                          v34 = -[__CFString isEqualToString:](v32, "isEqualToString:", CFSTR("userEnteredAmount")),
                          v33,
                          (v34 & 1) != 0))
                    {
                      v9 = 10;
                    }
                    else
                    {
                      v35 = v33;
                      if (v35 == CFSTR("approvalScreen")
                        || (v36 = v35,
                            v37 = -[__CFString isEqualToString:](v35, "isEqualToString:", CFSTR("approvalScreen")),
                            v36,
                            (v37 & 1) != 0))
                      {
                        v9 = 11;
                      }
                      else
                      {
                        v38 = v36;
                        if (v38 == CFSTR("loadingScreen")
                          || (v39 = v38,
                              v40 = -[__CFString isEqualToString:](v38, "isEqualToString:", CFSTR("loadingScreen")),
                              v39,
                              (v40 & 1) != 0))
                        {
                          v9 = 3;
                        }
                        else
                        {
                          v41 = v39;
                          if (v41 == CFSTR("disputeTopicExplanation")
                            || (v42 = v41,
                                v43 = -[__CFString isEqualToString:](v41, "isEqualToString:", CFSTR("disputeTopicExplanation")), v42, (v43 & 1) != 0))
                          {
                            v9 = 12;
                          }
                          else
                          {
                            v44 = v42;
                            if (v44 == CFSTR("languageDisclosure")
                              || (v45 = v44,
                                  v46 = -[__CFString isEqualToString:](v44, "isEqualToString:", CFSTR("languageDisclosure")), v45, (v46 & 1) != 0))
                            {
                              v9 = 13;
                            }
                            else
                            {
                              v47 = v45;
                              if (v47 == CFSTR("dashboardDispute")
                                || (v48 = v47,
                                    v49 = -[__CFString isEqualToString:](v47, "isEqualToString:", CFSTR("dashboardDispute")), v48, (v49 & 1) != 0))
                              {
                                v9 = 14;
                              }
                              else
                              {
                                v50 = v48;
                                if (v50 == CFSTR("changeShippingMethod")
                                  || (v51 = v50,
                                      v52 = -[__CFString isEqualToString:](v50, "isEqualToString:", CFSTR("changeShippingMethod")), v51, (v52 & 1) != 0))
                                {
                                  v9 = 15;
                                }
                                else
                                {
                                  v53 = v51;
                                  if (v53 == CFSTR("currentObligations")
                                    || (v54 = v53,
                                        v55 = -[__CFString isEqualToString:](v53, "isEqualToString:", CFSTR("currentObligations")), v54, (v55 & 1) != 0))
                                  {
                                    v9 = 16;
                                  }
                                  else
                                  {
                                    v56 = v54;
                                    if (v56 != CFSTR("financingPlanCancellationReasons"))
                                    {
                                      v10 = (PKPayLaterDynamicContentPage *)v56;
                                      v57 = -[__CFString isEqualToString:](v56, "isEqualToString:", CFSTR("financingPlanCancellationReasons"));

                                      if (!v57)
                                        goto LABEL_58;
                                    }
                                    v9 = 17;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    v7 = v60;
  }

  v10 = -[PKPayLaterDynamicContentPage initWithDictionary:pageType:]([PKPayLaterDynamicContentPage alloc], "initWithDictionary:pageType:", v6, v9);
  if (v10)
  {
    v58 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setObject:forKey:", v10, v59);

  }
LABEL_58:

}

- (id)dynamicContentPageForPageType:(unint64_t)a3
{
  NSDictionary *contentByPageType;
  void *v4;
  void *v5;

  contentByPageType = self->_contentByPageType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](contentByPageType, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dynamicContentPageForPageType:(unint64_t)a3 productType:(unint64_t)a4 optionIdentifier:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a5;
  -[PKPayLaterDynamicContent dynamicContentPageForPageType:](self, "dynamicContentPageForPageType:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dynamicContentPageForProductType:optionIdentifier:", a4, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)description
{
  void *v3;
  NSDictionary *contentByPageType;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  contentByPageType = self->_contentByPageType;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__PKPayLaterDynamicContent_description__block_invoke;
  v8[3] = &unk_1E2ACF1C8;
  v9 = v3;
  v5 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](contentByPageType, "enumerateKeysAndObjectsUsingBlock:", v8);
  objc_msgSend(v5, "appendFormat:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void __39__PKPayLaterDynamicContent_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  PKPayLaterDynamicContentPageTypeToString(objc_msgSend(a2, "integerValue"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("pageString: '%@'; => %@"), v6, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentByPageType, 0);
}

@end
