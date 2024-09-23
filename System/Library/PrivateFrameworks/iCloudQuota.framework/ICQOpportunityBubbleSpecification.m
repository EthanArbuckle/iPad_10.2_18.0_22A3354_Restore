@implementation ICQOpportunityBubbleSpecification

- (ICQOpportunityBubbleSpecification)initWithOpportunityBubble:(id)a3 andOpportunitySheet:(id)a4
{
  id v6;
  id v7;
  ICQOpportunityBubbleSpecification *v8;
  uint64_t v9;
  NSString *appId;
  void *v11;
  ICQOpportunityBubbleDetailsSpecification *v12;
  ICQOpportunityBubbleDetailsSpecification *bubbleDetails;
  void *v14;
  ICQOpportunitySheetDetailsSpecification *v15;
  ICQOpportunitySheetDetailsSpecification *sheetDetails;
  _ICQOpportunityBubbleReportingSpecification *v17;
  _ICQOpportunityBubbleReportingSpecification *reportingDetails;
  ICQOpportunityBubbleSpecification *v19;
  NSObject *v20;
  objc_class *v21;
  const char *Name;
  NSString *v23;
  objc_super v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  NSString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)ICQOpportunityBubbleSpecification;
  v8 = -[ICQOpportunityBubbleSpecification init](&v25, sel_init);
  if (!v8)
  {
LABEL_10:
    v19 = v8;
    goto LABEL_16;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appId"));
  v9 = objc_claimAutoreleasedReturnValue();
  appId = v8->_appId;
  v8->_appId = (NSString *)v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("opportunityBubbleDetails"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[ICQOpportunityFlowSpecification initWithServerDictionary:]([ICQOpportunityBubbleDetailsSpecification alloc], "initWithServerDictionary:", v11);
      bubbleDetails = v8->_bubbleDetails;
      v8->_bubbleDetails = v12;

    }
    if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("opportunitySheetDetails"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = -[ICQOpportunityFlowSpecification initWithServerDictionary:]([ICQOpportunitySheetDetailsSpecification alloc], "initWithServerDictionary:", v14);
        sheetDetails = v8->_sheetDetails;
        v8->_sheetDetails = v15;

      }
    }
    v17 = -[_ICQOpportunityBubbleReportingSpecification initWithServerDictionary:]([_ICQOpportunityBubbleReportingSpecification alloc], "initWithServerDictionary:", v6);
    reportingDetails = v8->_reportingDetails;
    v8->_reportingDetails = v17;

    goto LABEL_10;
  }
  if (v8->_appId)
  {
    _ICQGetLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      Name = class_getName(v21);
      v23 = v8->_appId;
      *(_DWORD *)buf = 136315394;
      v27 = Name;
      v28 = 2112;
      v29 = v23;
      _os_log_impl(&dword_1CDEBD000, v20, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
    }

  }
  v19 = 0;
LABEL_16:

  return v19;
}

- (id)serverUIURL
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[ICQOpportunityBubbleSpecification bubbleDetails](self, "bubbleDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[ICQOpportunityBubbleSpecification bubbleDetails](self, "bubbleDetails", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v3)
    {
      v6 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v3; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v5);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v8, "serverUIURL");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            objc_msgSend(v8, "serverUIURL");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
        }
        v3 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return v3;
}

- (NSString)appId
{
  return self->_appId;
}

- (void)setAppId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (ICQOpportunityBubbleDetailsSpecification)bubbleDetails
{
  return self->_bubbleDetails;
}

- (void)setBubbleDetails:(id)a3
{
  objc_storeStrong((id *)&self->_bubbleDetails, a3);
}

- (ICQOpportunitySheetDetailsSpecification)sheetDetails
{
  return self->_sheetDetails;
}

- (void)setSheetDetails:(id)a3
{
  objc_storeStrong((id *)&self->_sheetDetails, a3);
}

- (_ICQOpportunityBubbleReportingSpecification)reportingDetails
{
  return self->_reportingDetails;
}

- (void)setReportingDetails:(id)a3
{
  objc_storeStrong((id *)&self->_reportingDetails, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingDetails, 0);
  objc_storeStrong((id *)&self->_sheetDetails, 0);
  objc_storeStrong((id *)&self->_bubbleDetails, 0);
  objc_storeStrong((id *)&self->_appId, 0);
}

@end
