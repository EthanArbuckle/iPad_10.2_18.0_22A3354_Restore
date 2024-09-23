@implementation PXSharedLibraryRulePerson

- (NSString)displayName
{
  __CFString *v3;
  PXSharedLibraryParticipant *participant;
  PHPerson *person;

  if (-[PXSharedLibraryParticipant isCurrentUser](self->_participant, "isCurrentUser"))
  {
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_Rules_You"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    participant = self->_participant;
    if (participant)
    {
      PXSharedLibraryShortNameForParticipant(participant);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      person = self->_person;
      if (person)
      {
        -[PHPerson px_localizedName](person, "px_localizedName");
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = &stru_1E5149688;
      }
    }
  }
  return (NSString *)v3;
}

- (PHPerson)person
{
  void *v3;
  PHPerson *v4;
  PHPerson *person;
  PHPerson *v6;

  -[PXSharedLibraryParticipant person](self->_participant, "person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    v4 = 0;
    person = self->_person;
    goto LABEL_7;
  }
  v4 = v3;

  person = v4;
  if (!v4)
    goto LABEL_6;
LABEL_7:
  v6 = person;

  return v6;
}

- (void)fetchStatusWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD block[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryRulePerson.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[PXSharedLibraryRulePerson person](self, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "sharedLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sourceLibraryInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rule");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __55__PXSharedLibraryRulePerson_fetchStatusWithCompletion___block_invoke;
    v20[3] = &unk_1E51346C0;
    v21 = v5;
    v16 = v5;
    objc_msgSend(v11, "fetchEstimatedAssetsCountsForStartDate:personUUIDs:completion:", v13, v15, v20);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__PXSharedLibraryRulePerson_fetchStatusWithCompletion___block_invoke_2;
    block[3] = &unk_1E5148A40;
    v19 = v5;
    v9 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v10 = v19;
  }

}

- (BOOL)isEqual:(id)a3
{
  PXSharedLibraryRulePerson *v4;
  PXSharedLibraryRulePerson *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;

  v4 = (PXSharedLibraryRulePerson *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXSharedLibraryRulePerson participant](v5, "participant");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[PXSharedLibraryRulePerson participant](self, "participant");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = objc_msgSend(v6, "isEqual:", v7);

        if ((v9 & 1) == 0)
        {
          v10 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      -[PXSharedLibraryRulePerson person](v5, "person");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSharedLibraryRulePerson person](self, "person");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
        v10 = 1;
      else
        v10 = objc_msgSend(v11, "isEqual:", v12);

      goto LABEL_13;
    }
    v10 = 0;
  }
LABEL_14:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[PXSharedLibraryRulePerson participant](self, "participant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[PXSharedLibraryRulePerson person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (PXSharedLibraryParticipant)participant
{
  return self->_participant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_participant, 0);
}

void __55__PXSharedLibraryRulePerson_fetchStatusWithCompletion___block_invoke(uint64_t a1, __int128 *a2)
{
  id v3;
  __int128 v4;
  uint64_t v5;

  v4 = *a2;
  v5 = *((_QWORD *)a2 + 2);
  PXSharedLibraryTitleForCounts(&v4);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __55__PXSharedLibraryRulePerson_fetchStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)rulePersonWithParticipant:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = (void *)v5[1];
  v5[1] = v4;

  return v5;
}

+ (id)rulePersonWithPerson:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = (void *)v5[2];
  v5[2] = v4;

  return v5;
}

@end
