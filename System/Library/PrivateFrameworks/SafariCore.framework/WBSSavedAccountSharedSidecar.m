@implementation WBSSavedAccountSharedSidecar

- (WBSSavedAccountSharedSidecar)initWithUser:(id)a3 protectionSpace:(id)a4 dictionaryRepresentation:(id)a5
{
  id v8;
  id v9;
  id v10;
  WBSSavedAccountSharedSidecar *v11;
  uint64_t v12;
  NSString *user;
  uint64_t v14;
  NSURLProtectionSpace *protectionSpace;
  uint64_t v16;
  NSDictionary *originalKeychainDictionary;
  void *v18;
  WBSTOTPGenerator *v19;
  WBSTOTPGenerator *totpGenerator;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSArray *additionalSites;
  WBSSavedAccountSharedSidecar *v32;
  objc_super v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v34.receiver = self;
  v34.super_class = (Class)WBSSavedAccountSharedSidecar;
  v11 = -[WBSSavedAccountSharedSidecar init](&v34, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    user = v11->_user;
    v11->_user = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    protectionSpace = v11->_protectionSpace;
    v11->_protectionSpace = (NSURLProtectionSpace *)v14;

    v16 = objc_msgSend(v10, "copy");
    originalKeychainDictionary = v11->_originalKeychainDictionary;
    v11->_originalKeychainDictionary = (NSDictionary *)v16;

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("totp"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = -[WBSTOTPGenerator initWithDictionaryRepresentation:]([WBSTOTPGenerator alloc], "initWithDictionaryRepresentation:", v18);
      totpGenerator = v11->_totpGenerator;
      v11->_totpGenerator = v19;

    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("notes"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v21, 4);
      if (objc_msgSend(v22, "length"))
        objc_storeStrong((id *)&v11->_notesEntry, v22);

    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("title"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v23, 4);
      if (objc_msgSend(v24, "length"))
        objc_storeStrong((id *)&v11->_customTitle, v24);

    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ocpid"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v25, 4);
      if (objc_msgSend(v26, "length"))
        objc_storeStrong((id *)&v11->_originalContributorParticipantID, v26);

    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("pidrd"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v27, 4);
      if (objc_msgSend(v28, "length"))
        objc_storeStrong((id *)&v11->_participantIDForUserThatMovedSavedAccountToRecentlyDeleted, v28);

    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("s_as"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v29, "safari_mapObjectsUsingBlock:", &__block_literal_global_55);
      v30 = objc_claimAutoreleasedReturnValue();
      additionalSites = v11->_additionalSites;
      v11->_additionalSites = (NSArray *)v30;
    }
    else
    {
      additionalSites = v11->_additionalSites;
      v11->_additionalSites = (NSArray *)MEMORY[0x1E0C9AA60];
    }

    v32 = v11;
  }

  return v11;
}

WBSSavedAccountAdditionalSite *__86__WBSSavedAccountSharedSidecar_initWithUser_protectionSpace_dictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WBSSavedAccountAdditionalSite *v3;

  v2 = a2;
  v3 = -[WBSSavedAccountAdditionalSite initWithDictionaryRepresentation:]([WBSSavedAccountAdditionalSite alloc], "initWithDictionaryRepresentation:", v2);

  return v3;
}

- (WBSSavedAccountSharedSidecar)initWithPersonalSidecar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  WBSSavedAccountSharedSidecar *v8;
  uint64_t v9;
  WBSTOTPGenerator *totpGenerator;
  void *v11;
  uint64_t v12;
  NSString *notesEntry;
  void *v14;
  uint64_t v15;
  NSString *customTitle;
  WBSSavedAccountSharedSidecar *v17;

  v4 = a3;
  objc_msgSend(v4, "prefixedSharableData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "protectionSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WBSSavedAccountSharedSidecar initWithUser:protectionSpace:dictionaryRepresentation:](self, "initWithUser:protectionSpace:dictionaryRepresentation:", v6, v7, v5);

  if (v8)
  {
    objc_msgSend(v4, "totpGenerator");
    v9 = objc_claimAutoreleasedReturnValue();
    totpGenerator = v8->_totpGenerator;
    v8->_totpGenerator = (WBSTOTPGenerator *)v9;

    objc_msgSend(v4, "notesEntry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    notesEntry = v8->_notesEntry;
    v8->_notesEntry = (NSString *)v12;

    objc_msgSend(v4, "customTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    customTitle = v8->_customTitle;
    v8->_customTitle = (NSString *)v15;

    v17 = v8;
  }

  return v8;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)-[NSDictionary mutableCopy](self->_originalKeychainDictionary, "mutableCopy");
  -[WBSTOTPGenerator dictionaryRepresentation](self->_totpGenerator, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("totp"));

  -[NSString dataUsingEncoding:](self->_notesEntry, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("notes"));

  -[NSString dataUsingEncoding:](self->_customTitle, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("title"));

  -[NSString dataUsingEncoding:](self->_originalContributorParticipantID, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("ocpid"));

  -[NSString dataUsingEncoding:](self->_participantIDForUserThatMovedSavedAccountToRecentlyDeleted, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("pidrd"));

  -[NSArray safari_mapObjectsUsingBlock:](self->_additionalSites, "safari_mapObjectsUsingBlock:", &__block_literal_global_9_1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("s_as"));

  return (NSDictionary *)v3;
}

uint64_t __56__WBSSavedAccountSharedSidecar_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (NSDictionary)prefixedSharableData
{
  return (NSDictionary *)-[NSDictionary safari_mapAndFilterKeysUsingBlock:](self->_originalKeychainDictionary, "safari_mapAndFilterKeysUsingBlock:", &__block_literal_global_11_2);
}

id __52__WBSSavedAccountSharedSidecar_prefixedSharableData__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "hasPrefix:", CFSTR("s_")))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  WBSSavedAccountSharedSidecar *v4;
  WBSSavedAccountSharedSidecar *v5;
  NSString *user;
  void *v7;
  NSURLProtectionSpace *protectionSpace;
  void *v9;
  WBSTOTPGenerator *totpGenerator;
  void *v11;
  NSString *notesEntry;
  void *v13;
  NSString *customTitle;
  void *v15;
  NSString *originalContributorParticipantID;
  void *v17;
  NSArray *additionalSites;
  NSString *participantIDForUserThatMovedSavedAccountToRecentlyDeleted;
  void *v20;
  char v21;
  void *v23;

  v4 = (WBSSavedAccountSharedSidecar *)a3;
  if (self == v4)
  {
    v21 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      user = self->_user;
      -[WBSSavedAccountSharedSidecar user](v5, "user");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (WBSIsEqual(user, v7))
      {
        protectionSpace = self->_protectionSpace;
        -[WBSSavedAccountSharedSidecar protectionSpace](v5, "protectionSpace");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (WBSIsEqual(protectionSpace, v9))
        {
          totpGenerator = self->_totpGenerator;
          -[WBSSavedAccountSharedSidecar totpGenerator](v5, "totpGenerator");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (WBSIsEqual(totpGenerator, v11))
          {
            notesEntry = self->_notesEntry;
            -[WBSSavedAccountSharedSidecar notesEntry](v5, "notesEntry");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (WBSIsEqual(notesEntry, v13))
            {
              customTitle = self->_customTitle;
              -[WBSSavedAccountSharedSidecar customTitle](v5, "customTitle");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (WBSIsEqual(customTitle, v15))
              {
                originalContributorParticipantID = self->_originalContributorParticipantID;
                -[WBSSavedAccountSharedSidecar originalContributorParticipantID](v5, "originalContributorParticipantID");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (WBSIsEqual(originalContributorParticipantID, v17))
                {
                  additionalSites = self->_additionalSites;
                  -[WBSSavedAccountSharedSidecar additionalSites](v5, "additionalSites");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  if (WBSIsEqual(additionalSites, v23))
                  {
                    participantIDForUserThatMovedSavedAccountToRecentlyDeleted = self->_participantIDForUserThatMovedSavedAccountToRecentlyDeleted;
                    -[WBSSavedAccountSharedSidecar participantIDForUserThatMovedSavedAccountToRecentlyDeleted](v5, "participantIDForUserThatMovedSavedAccountToRecentlyDeleted");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    v21 = WBSIsEqual(participantIDForUserThatMovedSavedAccountToRecentlyDeleted, v20);

                  }
                  else
                  {
                    v21 = 0;
                  }

                }
                else
                {
                  v21 = 0;
                }

              }
              else
              {
                v21 = 0;
              }

            }
            else
            {
              v21 = 0;
            }

          }
          else
          {
            v21 = 0;
          }

        }
        else
        {
          v21 = 0;
        }

      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }
  }

  return v21;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;

  v3 = -[NSString hash](self->_user, "hash");
  v4 = -[NSURLProtectionSpace hash](self->_protectionSpace, "hash") ^ v3;
  v5 = -[WBSTOTPGenerator hash](self->_totpGenerator, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_notesEntry, "hash");
  v7 = -[NSString hash](self->_customTitle, "hash");
  v8 = v7 ^ -[NSString hash](self->_originalContributorParticipantID, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_participantIDForUserThatMovedSavedAccountToRecentlyDeleted, "hash");
  return v9 ^ -[NSArray hash](self->_additionalSites, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[WBSSavedAccountSharedSidecar initWithUser:protectionSpace:dictionaryRepresentation:]([WBSSavedAccountSharedSidecar alloc], "initWithUser:protectionSpace:dictionaryRepresentation:", self->_user, self->_protectionSpace, self->_originalKeychainDictionary);
}

- (NSString)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSURLProtectionSpace)protectionSpace
{
  return self->_protectionSpace;
}

- (WBSTOTPGenerator)totpGenerator
{
  return self->_totpGenerator;
}

- (void)setTotpGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_totpGenerator, a3);
}

- (NSString)notesEntry
{
  return self->_notesEntry;
}

- (void)setNotesEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (void)setCustomTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)originalContributorParticipantID
{
  return self->_originalContributorParticipantID;
}

- (void)setOriginalContributorParticipantID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)participantIDForUserThatMovedSavedAccountToRecentlyDeleted
{
  return self->_participantIDForUserThatMovedSavedAccountToRecentlyDeleted;
}

- (void)setParticipantIDForUserThatMovedSavedAccountToRecentlyDeleted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)additionalSites
{
  return self->_additionalSites;
}

- (void)setAdditionalSites:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDictionary)originalKeychainDictionary
{
  return self->_originalKeychainDictionary;
}

- (void)setOriginalKeychainDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_originalKeychainDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalKeychainDictionary, 0);
  objc_storeStrong((id *)&self->_additionalSites, 0);
  objc_storeStrong((id *)&self->_participantIDForUserThatMovedSavedAccountToRecentlyDeleted, 0);
  objc_storeStrong((id *)&self->_originalContributorParticipantID, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_notesEntry, 0);
  objc_storeStrong((id *)&self->_totpGenerator, 0);
  objc_storeStrong((id *)&self->_protectionSpace, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

@end
