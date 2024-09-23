@implementation PXPeopleConfirmationInfo

- (PXPeopleConfirmationInfo)initWithSourcePerson:(id)a3 targetPerson:(id)a4 confirmedSuggestions:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXPeopleConfirmationInfo *v12;
  PXPeopleConfirmationInfo *v13;
  void *v14;
  uint64_t v15;
  NSSet *otherPersons;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PXPeopleConfirmationInfo;
  v12 = -[PXPeopleConfirmationInfo init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sourcePerson, a3);
    objc_storeStrong((id *)&v13->_targetPerson, a4);
    v14 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v14, "removeObject:", v13->_sourcePerson);
    objc_msgSend(v14, "removeObject:", v13->_targetPerson);
    v15 = objc_msgSend(v14, "copy");
    otherPersons = v13->_otherPersons;
    v13->_otherPersons = (NSSet *)v15;

  }
  return v13;
}

- (PXPeopleConfirmationInfo)initWithBootstrapContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PXPeopleConfirmationInfo *v11;
  uint64_t v12;
  NSString *localizedName;
  uint64_t v15;
  PXPeopleConfirmationInfo *v16;

  v4 = a3;
  objc_msgSend(v4, "sourcePerson");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetPerson");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentSuggestions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = self;
  PXMap();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9, v15, 3221225472, __53__PXPeopleConfirmationInfo_initWithBootstrapContext___block_invoke, &unk_1E513C378);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PXPeopleConfirmationInfo initWithSourcePerson:targetPerson:confirmedSuggestions:](v16, "initWithSourcePerson:targetPerson:confirmedSuggestions:", v5, v6, v10);
  if (v11)
  {
    v11->_wasNaming = objc_msgSend(v4, "bootstrapType") == 1;
    objc_msgSend(v4, "localizedName");
    v12 = objc_claimAutoreleasedReturnValue();
    localizedName = v11->_localizedName;
    v11->_localizedName = (NSString *)v12;

  }
  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PXPeopleConfirmationInfo;
  -[PXPeopleConfirmationInfo description](&v23, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[PXPeopleConfirmationInfo sourcePerson](self, "sourcePerson");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("\nsourcePerson: %@\n"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[PXPeopleConfirmationInfo targetPerson](self, "targetPerson");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("targetPerson: %@\n"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  -[PXPeopleConfirmationInfo otherPersons](self, "otherPersons");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("otherPersons: %@\n"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = -[PXPeopleConfirmationInfo wasNaming](self, "wasNaming");
  v16 = CFSTR("NO");
  if (v15)
    v16 = CFSTR("YES");
  v17 = v16;
  objc_msgSend(v14, "stringWithFormat:", CFSTR("wasNaming: %@\n"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v18);

  v19 = (void *)MEMORY[0x1E0CB3940];
  -[PXPeopleConfirmationInfo localizedName](self, "localizedName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("localizedName: %@\n"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v21);

  return v4;
}

- (PHPerson)sourcePerson
{
  return self->_sourcePerson;
}

- (PHPerson)targetPerson
{
  return self->_targetPerson;
}

- (NSSet)otherPersons
{
  return self->_otherPersons;
}

- (BOOL)wasNaming
{
  return self->_wasNaming;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_otherPersons, 0);
  objc_storeStrong((id *)&self->_targetPerson, 0);
  objc_storeStrong((id *)&self->_sourcePerson, 0);
}

id __53__PXPeopleConfirmationInfo_initWithBootstrapContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, CFSTR("PXPeopleConfirmationInfo.m"), 38, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("person"), v9);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v10, v11, CFSTR("PXPeopleConfirmationInfo.m"), 38, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("person"), v9, v13);

    goto LABEL_6;
  }
LABEL_3:

  return v3;
}

@end
