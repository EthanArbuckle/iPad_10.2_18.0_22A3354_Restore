@implementation VUIFPSKeyInfoManagedObject

- (void)populateFromKeyRequest:(id)a3 video:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;

  v6 = a3;
  v7 = a4;
  -[VUIFPSKeyInfoManagedObject setIsInvalid:](self, "setIsInvalid:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFPSKeyInfoManagedObject setRetrievalDate:](self, "setRetrievalDate:", v8);

  objc_msgSend(v6, "keyIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFPSKeyInfoManagedObject setKeyURI:](self, "setKeyURI:", v9);

  objc_msgSend(v6, "keyResponseData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFPSKeyInfoManagedObject setKeyData:](self, "setKeyData:", v10);

  objc_msgSend(v6, "expirationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFPSKeyInfoManagedObject setExpirationDate:](self, "setExpirationDate:", v11);

  objc_msgSend(v6, "contentID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFPSKeyInfoManagedObject setContentID:](self, "setContentID:", v12);

  objc_msgSend(v6, "renewalDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFPSKeyInfoManagedObject setRenewalDate:](self, "setRenewalDate:", v13);

  objc_msgSend(v6, "renewalInterval");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFPSKeyInfoManagedObject setRenewalInterval:](self, "setRenewalInterval:", v14);

  -[VUIFPSKeyInfoManagedObject setIsLowValue:](self, "setIsLowValue:", objc_msgSend(v6, "isLowValueKey"));
  objc_msgSend(v6, "playbackDuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFPSKeyInfoManagedObject setPlaybackDuration:](self, "setPlaybackDuration:", v15);

  -[VUIFPSKeyInfoManagedObject setAllowsManualRenewal:](self, "setAllowsManualRenewal:", objc_msgSend(v6, "allowManualRenewal"));
  -[VUIFPSKeyInfoManagedObject setVideo:](self, "setVideo:", v7);
  if ((objc_msgSend(v7, "markedAsDeleted") & 1) == 0)
  {
    objc_msgSend(v6, "availabilityEndDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAvailabilityEndDate:", v16);

    objc_msgSend(v6, "expirationDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      objc_msgSend(v7, "setHasExpirationDate:", 1);
    objc_msgSend(v7, "setAllowsManualRenewal:", objc_msgSend(v6, "allowManualRenewal"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v6, "offlineKeyRenewalPolicy"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOfflineKeyRenewalPolicy:", v18);

  objc_msgSend(v6, "additionalRequestParamsFromResponse");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "additionalFPSRequestParams");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
    v22 = (id)objc_msgSend(v20, "mutableCopy");
  else
    v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v23 = v22;
  if (v19)
    objc_msgSend(v22, "addEntriesFromDictionary:", v19);
  if (objc_msgSend(v23, "count") && objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v23))
  {
    v26 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v23, 0, &v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v26;
    if (objc_msgSend(v24, "length"))
    {
      objc_msgSend(v7, "setAdditionalFPSRequestParamsJSONData:", v24);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[VUIFPSKeyInfoManagedObject(VideosUIAdditions) populateFromKeyRequest:video:].cold.1((uint64_t)v25);
    }

  }
}

@end
