@implementation PPContactNameRecordChangeHistoryAccumulator

- (void)visitDropEverythingEvent:(id)a3
{
  self->_truncated = 1;
}

- (void)visitAddContactEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!self->_truncated)
  {
    objc_msgSend(a3, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPContactNameRecordChangeHistoryAccumulator _nameRecordWithContactIdentifier:changeType:]((uint64_t)self, v5, 1u);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v7;
    if (v7)
    {
      -[NSMutableArray addObject:](self->_records, "addObject:", v7);
      v6 = v7;
    }

  }
}

- (void)visitUpdateContactEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!self->_truncated)
  {
    objc_msgSend(a3, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPContactNameRecordChangeHistoryAccumulator _nameRecordWithContactIdentifier:changeType:]((uint64_t)self, v5, 2u);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v7;
    if (v7)
    {
      -[NSMutableArray addObject:](self->_records, "addObject:", v7);
      v6 = v7;
    }

  }
}

- (void)visitDeleteContactEvent:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (!self->_truncated)
  {
    objc_msgSend(a3, "contactIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPContactNameRecordChangeHistoryAccumulator _nameRecordWithContactIdentifier:changeType:]((uint64_t)self, v4, 3u);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v5 = v6;
    if (v6)
    {
      -[NSMutableArray addObject:](self->_records, "addObject:", v6);
      v5 = v6;
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_keysToFetch, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (PPInternalContactNameRecord)_nameRecordWithContactIdentifier:(unsigned int)a3 changeType:
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PPInternalContactNameRecord *v24;
  NSObject *v25;
  id v26;
  unsigned int v27;
  PPInternalContactNameRecord *v28;
  void *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v30 = a2;
  if (!a1)
  {
    v28 = 0;
    goto LABEL_8;
  }
  if (a3 == 3)
  {
    v27 = 3;
    v5 = 0;
    v26 = 0;
  }
  else
  {
    v6 = *(void **)(a1 + 8);
    v7 = *(_QWORD *)(a1 + 16);
    v31 = 0;
    objc_msgSend(v6, "unifiedContactWithIdentifier:keysToFetch:error:", v30, v7, &v31);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v31;
    v9 = v8;
    if (!v5)
    {
      pp_contacts_log_handle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v33 = v30;
        v34 = 2112;
        v35 = v9;
        _os_log_error_impl(&dword_1C392E000, v16, OS_LOG_TYPE_ERROR, "unifiedContactWithIdentifier failed for id: %@ error: %@", buf, 0x16u);
      }
      v28 = 0;
      v5 = 0;
      goto LABEL_7;
    }
    v27 = a3;
    v26 = v8;
  }
  v24 = [PPInternalContactNameRecord alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v25 = objc_claimAutoreleasedReturnValue();
  -[NSObject UUIDString](v25, "UUIDString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "givenName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "phoneticGivenName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "middleName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "phoneticMiddleName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "familyName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "phoneticFamilyName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "organizationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jobTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nickname");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PPRelatedNamesForContact(v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PPStreetNamesForContact(v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PPCityNamesForContact(v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[PPInternalContactNameRecord initWithIdentifier:score:source:sourceIdentifier:changeType:firstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relatedNames:streetNames:cityNames:](v24, "initWithIdentifier:score:source:sourceIdentifier:changeType:firstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relatedNames:streetNames:cityNames:", v23, 1, v30, v27, v22, v21, 0.0, v29, v20, v19, v10, v11, v18, v12, v13, v14,
          v15);

  v16 = v25;
  v9 = v26;
LABEL_7:

LABEL_8:
  return v28;
}

@end
