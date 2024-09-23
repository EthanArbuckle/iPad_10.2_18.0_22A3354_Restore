@implementation PGNamingQuestion

- (PGNamingQuestion)initWithPerson:(id)a3 contactIdentifier:(id)a4 localFactoryScore:(double)a5 serviceManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  PGNamingQuestion *v14;
  PGNamingQuestion *v15;
  uint64_t v16;
  NSString *entityIdentifier;
  uint64_t v18;
  NSDictionary *additionalInfo;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PGNamingQuestion;
  v14 = -[PGNamingQuestion init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_person, a3);
    -[PHPerson uuid](v15->_person, "uuid");
    v16 = objc_claimAutoreleasedReturnValue();
    entityIdentifier = v15->_entityIdentifier;
    v15->_entityIdentifier = (NSString *)v16;

    v15->_state = 0;
    v15->_localFactoryScore = a5;
    -[PGNamingQuestion _additionalInfoFromContactIdentifier:serviceManager:](v15, "_additionalInfoFromContactIdentifier:serviceManager:", v12, v13);
    v18 = objc_claimAutoreleasedReturnValue();
    additionalInfo = v15->_additionalInfo;
    v15->_additionalInfo = (NSDictionary *)v18;

    objc_storeStrong((id *)&v15->_contactIdentifier, a4);
  }

  return v15;
}

- (PGNamingQuestion)initWithConfirmedPerson:(id)a3 contactIdentifier:(id)a4 localFactoryScore:(double)a5 serviceManager:(id)a6
{
  PGNamingQuestion *result;

  result = -[PGNamingQuestion initWithPerson:contactIdentifier:localFactoryScore:serviceManager:](self, "initWithPerson:contactIdentifier:localFactoryScore:serviceManager:", a3, a4, a6, a5);
  if (result)
    result->_state = 2;
  return result;
}

- (id)_additionalInfoFromContactIdentifier:(id)a3 serviceManager:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v20[2];
  _QWORD v21[2];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  objc_msgSend(v6, "setWithObject:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactsForIdentifiers:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    objc_msgSend(v10, "givenName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setGivenName:](v11, "setGivenName:", v12);

    objc_msgSend(v10, "familyName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setFamilyName:](v11, "setFamilyName:", v13);

    objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v11, 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
    {
      v20[0] = CFSTR("contactName");
      v20[1] = CFSTR("contactIdentifier");
      v21[0] = v14;
      v21[1] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "loggingConnection");
      v18 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v5;
        _os_log_error_impl(&dword_1CA237000, v18, OS_LOG_TYPE_ERROR, "No contact name resolved for contact identifier %@", buf, 0xCu);
      }

      v15 = 0;
    }

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "loggingConnection");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v5;
      _os_log_error_impl(&dword_1CA237000, v11, OS_LOG_TYPE_ERROR, "Contact found to be nil for contact identifier %@", buf, 0xCu);
    }
    v15 = 0;
  }

  return v15;
}

- (unsigned)type
{
  return 1;
}

- (unsigned)displayType
{
  return 2;
}

- (unsigned)entityType
{
  return 1;
}

- (void)persistWithCreationDate:(id)a3 questionVersion:(signed __int16)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PGNamingQuestion additionalInfo](self, "additionalInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CD1728];
    -[PGNamingQuestion entityIdentifier](self, "entityIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PGNamingQuestion type](self, "type");
    v11 = -[PGNamingQuestion state](self, "state");
    v12 = -[PGNamingQuestion entityType](self, "entityType");
    v13 = -[PGNamingQuestion displayType](self, "displayType");
    -[PGSurveyQuestion score](self, "score");
    v15 = v14;
    -[PGNamingQuestion additionalInfo](self, "additionalInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v22) = a4;
    v17 = (id)objc_msgSend(v8, "creationRequestForQuestionWithEntityIdentifier:type:state:entityType:displayType:score:additionalInfo:creationDate:questionVersion:", v9, v10, v11, v12, v13, v16, v15, v6, v22);

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "loggingConnection");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[PGNamingQuestion entityIdentifier](self, "entityIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGNamingQuestion contactIdentifier](self, "contactIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v20;
      v25 = 2112;
      v26 = v21;
      _os_log_error_impl(&dword_1CA237000, v19, OS_LOG_TYPE_ERROR, "Cannot persist PGNamingQuestion (personUUID: %@, contactIdentifier: %@) with a nil additional info dictionary.", buf, 0x16u);

    }
  }

}

- (id)_personForContactSuggestion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[PHPerson photoLibrary](self->_person, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(verifiedType = %d)"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v6 = (void *)MEMORY[0x1E0CD16C0];
  v11[0] = self->_contactIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchPersonsForContactIdentifiers:options:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)additionalInfo
{
  return self->_additionalInfo;
}

- (id)entityIdentifier
{
  return self->_entityIdentifier;
}

- (double)localFactoryScore
{
  return self->_localFactoryScore;
}

- (unsigned)state
{
  return self->_state;
}

- (PHPerson)person
{
  return self->_person;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
}

@end
