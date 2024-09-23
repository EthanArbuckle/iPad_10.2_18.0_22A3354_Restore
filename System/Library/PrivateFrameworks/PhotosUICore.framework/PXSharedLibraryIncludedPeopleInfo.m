@implementation PXSharedLibraryIncludedPeopleInfo

- (PXSharedLibraryIncludedPeopleInfo)initWithPerson:(id)a3
{
  id v5;
  PXSharedLibraryIncludedPeopleInfo *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

  }
  v6 = -[PXSharedLibraryIncludedPeopleInfo _initWithParticipant:person:](self, "_initWithParticipant:person:", 0, v5);

  return v6;
}

- (PXSharedLibraryIncludedPeopleInfo)initWithParticipant:(id)a3 person:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PXSharedLibraryIncludedPeopleInfo *v10;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = -[PXSharedLibraryIncludedPeopleInfo _initWithParticipant:person:](self, "_initWithParticipant:person:", v7, v9);

  return v10;
}

- (PXSharedLibraryIncludedPeopleInfo)initWithParticipant:(id)a3
{
  id v5;
  PXSharedLibraryIncludedPeopleInfo *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant"));

  }
  v6 = -[PXSharedLibraryIncludedPeopleInfo _initWithParticipant:person:](self, "_initWithParticipant:person:", v5, 0);

  return v6;
}

- (id)_initWithParticipant:(id)a3 person:(id)a4
{
  id v7;
  id v8;
  PXSharedLibraryIncludedPeopleInfo *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXSharedLibraryIncludedPeopleInfo;
  v9 = -[PXSharedLibraryIncludedPeopleInfo init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_participant, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXSharedLibraryIncludedPeopleInfo person](self, "person");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "person");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 | v7)
    {
      objc_msgSend((id)v6, "localIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v7, "localIdentifier");
    }
    else
    {
      -[PXSharedLibraryIncludedPeopleInfo participant](self, "participant");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "participant");
    }
    v9 = objc_claimAutoreleasedReturnValue();
    if (v8 == (void *)v9)
    {
      v10 = 1;
      v11 = v8;
    }
    else
    {
      v11 = (void *)v9;
      v10 = objc_msgSend(v8, "isEqual:", v9);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[PXSharedLibraryIncludedPeopleInfo participant](self, "participant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PXSharedLibraryIncludedPeopleInfo person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)name
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;

  -[PXSharedLibraryIncludedPeopleInfo participant](self, "participant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryIncludedPeopleInfo person](self, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_localizedName");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[__CFString length](v5, "length"))
  {
    objc_msgSend(v3, "name");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (-[__CFString length](v6, "length"))
    {
      v5 = v6;
    }
    else
    {
      objc_msgSend(v3, "appleIDAddress");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  if (!v5)
    v5 = &stru_1E5149688;

  return (NSString *)v5;
}

- (NSPersonNameComponents)nameComponents
{
  void *v3;
  void *v4;
  void *v5;

  -[PXSharedLibraryIncludedPeopleInfo participant](self, "participant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nameComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PXSharedLibraryIncludedPeopleInfo person](self, "person");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_nameComponents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSPersonNameComponents *)v4;
}

- (PXSharedLibraryUIParticipant)participant
{
  return self->_participant;
}

- (PHPerson)person
{
  return self->_person;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_participant, 0);
}

+ (id)personForParticipant:(id)a3
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
  objc_msgSend(a3, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0CD16C0];
    v11[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchPersonsForContacts:options:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
