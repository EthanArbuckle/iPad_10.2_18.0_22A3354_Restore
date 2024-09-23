@implementation SPCoreSpotlightResult

- (SPCoreSpotlightResult)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SPCoreSpotlightResult;
  return -[SFSearchResult_SpotlightExtras init](&v3, sel_init);
}

- (void)setCompatibilityDescriptions:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  SPCoreSpotlightResult *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v15 = self;
  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("formatted_text"), v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", CFSTR("text"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("text_maxlines"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_alloc_init(MEMORY[0x24BE85018]);
        objc_msgSend(v14, "setText:", v12);
        objc_msgSend(v14, "setMaxLines:", (int)objc_msgSend(v13, "intValue"));
        objc_msgSend(v4, "addObject:", v14);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  -[SPCoreSpotlightResult setDescriptions:](v15, "setDescriptions:", v4);
}

- (BOOL)hasDetail
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x2199AE17C](self, a2);
  -[SPCoreSpotlightResult secondaryTitle](self, "secondaryTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    -[SPCoreSpotlightResult descriptions](self, "descriptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v5 = 1;
    }
    else
    {
      -[SPCoreSpotlightResult auxiliaryTopText](self, "auxiliaryTopText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v5 = 1;
      }
      else
      {
        -[SPCoreSpotlightResult auxiliaryMiddleText](self, "auxiliaryMiddleText");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v5 = 1;
        }
        else
        {
          -[SPCoreSpotlightResult auxiliaryBottomText](self, "auxiliaryBottomText");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v9 != 0;

        }
      }

    }
  }

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (void)setTitle_maxlines:(int)a3
{
  void *v5;
  id v6;
  id v7;

  -[SPCoreSpotlightResult title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BE85018]);
    -[SPCoreSpotlightResult setTitle:](self, "setTitle:", v6);

  }
  -[SPCoreSpotlightResult title](self, "title");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaxLines:", a3);

}

- (int)title_maxlines
{
  void *v2;
  int v3;

  -[SPCoreSpotlightResult title](self, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maxLines");

  return v3;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)SPCoreSpotlightResult;
  -[SFSearchResult_Compatibility debugDescription](&v9, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCoreSpotlightResult identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCoreSpotlightResult interestingDate](self, "interestingDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)containerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setContainerIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (NSString)relatedUniqueIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setRelatedUniqueIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (NSString)accountIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (uint64_t)buddyScore
{
  uint64_t v2;

  objc_copyStruct(&v2, (const void *)(a1 + 1136), 16, 1, 0);
  return v2;
}

- (void)setBuddyScore:(SPCoreSpotlightResult *)self
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = v2;
  v5 = v3;
  objc_copyStruct(self->_buddyScore, &v4, 16, 1, 0);
}

- (NSString)itemIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setItemIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1048);
}

- (NSDate)interestingDate
{
  return (NSDate *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setInterestingDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1056);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (NSString)domainIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setDomainIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1064);
}

- (int64_t)incomingCount
{
  return self->_incomingCount;
}

- (void)setIncomingCount:(int64_t *)a3
{
  self->_incomingCount = a3;
}

- (int64_t)outgoingCount
{
  return self->_outgoingCount;
}

- (void)setOutgoingCount:(int64_t *)a3
{
  self->_outgoingCount = a3;
}

- (NSString)relatedBundleID
{
  return (NSString *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setRelatedBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1088);
}

- (NSString)mailConversationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setMailConversationIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1096);
}

- (NSString)stringForDedupe
{
  return (NSString *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setStringForDedupe:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1104);
}

- (BOOL)bestInContainer
{
  return self->_bestInContainer;
}

- (void)setBestInContainer:(BOOL)a3
{
  self->_bestInContainer = a3;
}

- (BOOL)hasAssociatedUserActivity
{
  return self->_hasAssociatedUserActivity;
}

- (void)setHasAssociatedUserActivity:(BOOL)a3
{
  self->_hasAssociatedUserActivity = a3;
}

- (NSArray)launchDates
{
  return self->_launchDates;
}

- (void)setLaunchDates:(id)a3
{
  objc_storeStrong((id *)&self->_launchDates, a3);
}

- (NSDate)contentCreationDate
{
  return self->_contentCreationDate;
}

- (void)setContentCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_contentCreationDate, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_contentCreationDate, 0);
  objc_storeStrong((id *)&self->_launchDates, 0);
  objc_storeStrong((id *)&self->_stringForDedupe, 0);
  objc_storeStrong((id *)&self->_mailConversationIdentifier, 0);
  objc_storeStrong((id *)&self->_relatedBundleID, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_interestingDate, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_relatedUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end
