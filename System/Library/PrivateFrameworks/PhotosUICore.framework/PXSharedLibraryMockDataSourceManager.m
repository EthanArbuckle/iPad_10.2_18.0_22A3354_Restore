@implementation PXSharedLibraryMockDataSourceManager

- (PXSharedLibraryMockDataSourceManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryMockDataSource.m"), 87, CFSTR("%s is not available as initializer"), "-[PXSharedLibraryMockDataSourceManager init]");

  abort();
}

- (PXSharedLibraryMockDataSourceManager)initWithDataSourceType:(int64_t)a3
{
  PXSharedLibraryMockDataSourceManager *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXSharedLibraryMockDataSourceManager;
  result = -[PXSectionedDataSourceManager init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (void)fetchSharedLibraryForURL:(id)a3 completionHandler:(id)a4
{
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryMockDataSource.m"), 144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shareURL"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryMockDataSource.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Failed to shared library for URL in the PXSharedLibraryMockDataSourceManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, 0, v8);

}

- (id)fetchPreview
{
  void *v5;

  if ((unint64_t)(self->_type - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryMockDataSource.m"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(_type == _PXSharedLibraryMockDataSourceTypePreviewOwner) || (_type == _PXSharedLibraryMockDataSourceTypePreviewParticipant)"));

  }
  return (id)objc_msgSend((id)objc_opt_class(), "_sharedLibraryMockWithType:", self->_type);
}

- (id)fetchSharedLibrary
{
  void *v5;

  if ((unint64_t)(self->_type - 5) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryMockDataSource.m"), 159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(_type == _PXSharedLibraryMockDataSourceTypeSharedLibraryOwner) || (_type == _PXSharedLibraryMockDataSourceTypeSharedLibraryParticipant)"));

  }
  return (id)objc_msgSend((id)objc_opt_class(), "_sharedLibraryMockWithType:", self->_type);
}

- (id)fetchExiting
{
  void *v5;

  if ((unint64_t)(self->_type - 7) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryMockDataSource.m"), 166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_type == _PXSharedLibraryMockDataSourceTypeExitingOwner || _type == _PXSharedLibraryMockDataSourceTypeExitingParticipant"));

  }
  return (id)objc_msgSend((id)objc_opt_class(), "_sharedLibraryMockWithType:", self->_type);
}

- (id)createInitialDataSource
{
  void *v2;
  PXSharedLibraryMockDataSource *v3;
  void *v4;
  PXSharedLibraryMockDataSource *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_sharedLibraryMockWithType:", self->_type);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [PXSharedLibraryMockDataSource alloc];
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXSharedLibraryMockDataSource initWithMocks:](v3, "initWithMocks:", v4);

  return v5;
}

+ (PXSharedLibraryMockDataSourceManager)invitationsDataSourceManager
{
  return (PXSharedLibraryMockDataSourceManager *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDataSourceType:", 0);
}

+ (PXSharedLibraryMockDataSourceManager)ownerPreviewDataSourceManager
{
  return (PXSharedLibraryMockDataSourceManager *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDataSourceType:", 1);
}

+ (PXSharedLibraryMockDataSourceManager)participantPreviewDataSourceManager
{
  return (PXSharedLibraryMockDataSourceManager *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDataSourceType:", 2);
}

+ (PXSharedLibraryMockDataSourceManager)ownerSharedLibraryDataSourceManager
{
  return (PXSharedLibraryMockDataSourceManager *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDataSourceType:", 3);
}

+ (PXSharedLibraryMockDataSourceManager)participantSharedLibraryDataSourceManager
{
  return (PXSharedLibraryMockDataSourceManager *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDataSourceType:", 4);
}

+ (PXSharedLibraryMockDataSourceManager)ownerExitingDataSourceManager
{
  return (PXSharedLibraryMockDataSourceManager *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDataSourceType:", 5);
}

+ (PXSharedLibraryMockDataSourceManager)participantExitingDataSourceManager
{
  return (PXSharedLibraryMockDataSourceManager *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDataSourceType:", 6);
}

+ (id)_sharedLibraryMockWithType:(int64_t)a3
{
  PXSharedLibraryMock *v4;
  PXSharedLibraryMock *v5;
  PXSharedLibraryMockParticipant *v6;
  id v7;
  PXSharedLibraryMockParticipant *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(PXSharedLibraryMock);
  v5 = v4;
  switch(a3)
  {
    case 0:
    case 4:
      goto LABEL_5;
    case 1:
      -[PXSharedLibraryMock setIsInPreview:](v4, "setIsInPreview:", 1);
      goto LABEL_7;
    case 2:
      -[PXSharedLibraryMock setIsInPreview:](v4, "setIsInPreview:", 1);
      break;
    case 3:
      -[PXSharedLibraryMock setIsOwned:](v4, "setIsOwned:", 1);
LABEL_5:
      -[PXSharedLibraryMock setIsPublished:](v5, "setIsPublished:", 1);
      break;
    case 5:
      -[PXSharedLibraryMock setIsPublished:](v4, "setIsPublished:", 1);
      -[PXSharedLibraryMock setIsExiting:](v5, "setIsExiting:", 1);
LABEL_7:
      -[PXSharedLibraryMock setIsOwned:](v5, "setIsOwned:", 1);
      break;
    case 6:
      -[PXSharedLibraryMock setIsPublished:](v4, "setIsPublished:", 1);
      -[PXSharedLibraryMock setIsExiting:](v5, "setIsExiting:", 1);
      break;
    default:
      break;
  }
  v6 = objc_alloc_init(PXSharedLibraryMockParticipant);
  -[PXSharedLibraryMockParticipant setEmailAddress:](v6, "setEmailAddress:", CFSTR("owner.doe@email.com"));
  v7 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  objc_msgSend(v7, "setGivenName:", CFSTR("Sender"));
  objc_msgSend(v7, "setFamilyName:", CFSTR("Doe"));
  -[PXSharedLibraryMockParticipant setNameComponents:](v6, "setNameComponents:", v7);
  -[PXSharedLibraryMockParticipant setIsCurrentUser:](v6, "setIsCurrentUser:", -[PXSharedLibraryMock isOwned](v5, "isOwned"));
  v8 = objc_alloc_init(PXSharedLibraryMockParticipant);
  -[PXSharedLibraryMockParticipant setEmailAddress:](v8, "setEmailAddress:", CFSTR("receiver.doe@email.com"));
  v9 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  objc_msgSend(v9, "setGivenName:", CFSTR("Receiver"));
  objc_msgSend(v9, "setFamilyName:", CFSTR("Doe"));
  -[PXSharedLibraryMockParticipant setNameComponents:](v8, "setNameComponents:", v9);
  -[PXSharedLibraryMockParticipant setIsCurrentUser:](v8, "setIsCurrentUser:", -[PXSharedLibraryMock isOwned](v5, "isOwned") ^ 1);
  -[PXSharedLibraryMock setOwner:](v5, "setOwner:", v6);
  v14[0] = v6;
  v14[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryMock setParticipants:](v5, "setParticipants:", v10);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -604800.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSharedLibraryRule customizedRuleWithStartDate:personUUIDs:](PXSharedLibraryRule, "customizedRuleWithStartDate:personUUIDs:", v11, &unk_1E53E8EC8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryMock setRule:](v5, "setRule:", v12);

  return v5;
}

@end
