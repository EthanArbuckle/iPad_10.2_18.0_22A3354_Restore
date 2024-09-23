@implementation PXPeopleBootstrapContext

- (PXPeopleBootstrapContext)init
{
  PXPeopleBootstrapContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPeopleBootstrapContext;
  result = -[PXPeopleBootstrapContext init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_wantsNaming = 257;
    result->_wantsPostNaming = 1;
  }
  return result;
}

- (NSString)localizedName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXPeopleBootstrapContext nameSelection](self, "nameSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "localizedName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PXPeopleBootstrapContext sourcePerson](self, "sourcePerson");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_localizedName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  __CFString *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  __CFString *v36;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)PXPeopleBootstrapContext;
  -[PXPeopleBootstrapContext description](&v38, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[PXPeopleBootstrapContext sourcePerson](self, "sourcePerson");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\nsourcePerson: %@,\n"), v5);

  -[PXPeopleBootstrapContext targetPerson](self, "targetPerson");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("targetPerson: %@,\n"), v6);

  v7 = -[PXPeopleBootstrapContext bootstrapType](self, "bootstrapType");
  if (v7 - 1 > 2)
    v8 = CFSTR("PXPeopleBootstrapTypeFavorite");
  else
    v8 = off_1E513CE90[v7 - 1];
  objc_msgSend(v4, "appendFormat:", CFSTR("bootstrapType: %@,\n"), v8);
  -[PXPeopleBootstrapContext nameSelection](self, "nameSelection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("nameSelection: %@,\n"), v9);

  -[PXPeopleBootstrapContext suggestionManager](self, "suggestionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("suggestionManager: %@,\n"), v10);

  if (-[PXPeopleBootstrapContext skipInitialAction](self, "skipInitialAction"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v12 = v11;
  objc_msgSend(v4, "appendFormat:", CFSTR("skipInitialAction: %@,\n"), v12);

  -[PXPeopleBootstrapContext onInitBlock](self, "onInitBlock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = _Block_copy(v13);
  objc_msgSend(v4, "appendFormat:", CFSTR("onInitBlock: %@,\n"), v14);

  -[PXPeopleBootstrapContext cancelBlock](self, "cancelBlock");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = _Block_copy(v15);
  objc_msgSend(v4, "appendFormat:", CFSTR("cancelBlock: %@,\n"), v16);

  if (-[PXPeopleBootstrapContext wantsNaming](self, "wantsNaming"))
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  v18 = v17;
  objc_msgSend(v4, "appendFormat:", CFSTR("wantsNaming: %@,\n"), v18);

  if (-[PXPeopleBootstrapContext wantsMergeCandidateSuggestions](self, "wantsMergeCandidateSuggestions"))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  v20 = v19;
  objc_msgSend(v4, "appendFormat:", CFSTR("wantsMergeCandidateSuggestions: %@,\n"), v20);

  if (-[PXPeopleBootstrapContext wantsPostNaming](self, "wantsPostNaming"))
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  v22 = v21;
  objc_msgSend(v4, "appendFormat:", CFSTR("wantsPostNaming: %@,\n"), v22);

  if (-[PXPeopleBootstrapContext wantsToBeAddedToPeopleAlbum](self, "wantsToBeAddedToPeopleAlbum"))
    v23 = CFSTR("YES");
  else
    v23 = CFSTR("NO");
  v24 = v23;
  objc_msgSend(v4, "appendFormat:", CFSTR("wantsToBeAddedToPeopleAlbum: %@,\n"), v24);

  -[PXPeopleBootstrapContext prefetchedDataSource](self, "prefetchedDataSource");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("prefetchedDataSource: %@,\n"), v25);

  -[PXPeopleBootstrapContext callerInfo](self, "callerInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("callerInfo: %@,\n"), v26);

  -[PXPeopleBootstrapContext localizedName](self, "localizedName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("localizedName: %@,\n"), v27);

  -[PXPeopleBootstrapContext personSuggestion](self, "personSuggestion");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("personSuggestion: %@,\n"), v28);

  -[PXPeopleBootstrapContext face](self, "face");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("face: %@\n"), v29);

  -[PXPeopleBootstrapContext backingScaleFactor](self, "backingScaleFactor");
  objc_msgSend(v4, "appendFormat:", CFSTR("backingScaleFactor: %f\n"), v30);
  if (-[PXPeopleBootstrapContext didCommitPreBootstrapAction](self, "didCommitPreBootstrapAction"))
    v31 = CFSTR("YES");
  else
    v31 = CFSTR("NO");
  v32 = v31;
  objc_msgSend(v4, "appendFormat:", CFSTR("didCommitPreBootstrapAction: %@\n"), v32);

  -[PXPeopleBootstrapContext keyAsset](self, "keyAsset");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "localIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("keyAsset: %@\n"), v34);

  if (-[PXPeopleBootstrapContext wantsContactUnlinkage](self, "wantsContactUnlinkage"))
    v35 = CFSTR("YES");
  else
    v35 = CFSTR("NO");
  v36 = v35;
  objc_msgSend(v4, "appendFormat:", CFSTR("wantsContactUnlinkage: %@"), v36);

  return v4;
}

- (PXPerson)sourcePerson
{
  return (PXPerson *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSourcePerson:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (PXPerson)targetPerson
{
  return (PXPerson *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTargetPerson:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)bootstrapType
{
  return self->_bootstrapType;
}

- (void)setBootstrapType:(unint64_t)a3
{
  self->_bootstrapType = a3;
}

- (PXPeopleNameSelection)nameSelection
{
  return (PXPeopleNameSelection *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNameSelection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (PXPeopleSuggestionManager)suggestionManager
{
  return (PXPeopleSuggestionManager *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSuggestionManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)skipInitialAction
{
  return self->_skipInitialAction;
}

- (void)setSkipInitialAction:(BOOL)a3
{
  self->_skipInitialAction = a3;
}

- (id)onInitBlock
{
  return self->_onInitBlock;
}

- (void)setOnInitBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)wantsNaming
{
  return self->_wantsNaming;
}

- (void)setWantsNaming:(BOOL)a3
{
  self->_wantsNaming = a3;
}

- (BOOL)wantsMergeCandidateSuggestions
{
  return self->_wantsMergeCandidateSuggestions;
}

- (void)setWantsMergeCandidateSuggestions:(BOOL)a3
{
  self->_wantsMergeCandidateSuggestions = a3;
}

- (BOOL)wantsPostNaming
{
  return self->_wantsPostNaming;
}

- (void)setWantsPostNaming:(BOOL)a3
{
  self->_wantsPostNaming = a3;
}

- (BOOL)wantsToBeAddedToPeopleAlbum
{
  return self->_wantsToBeAddedToPeopleAlbum;
}

- (void)setWantsToBeAddedToPeopleAlbum:(BOOL)a3
{
  self->_wantsToBeAddedToPeopleAlbum = a3;
}

- (PXPeopleSuggestionManagerDataSource)prefetchedDataSource
{
  return self->_prefetchedDataSource;
}

- (void)setPrefetchedDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_prefetchedDataSource, a3);
}

- (NSString)callerInfo
{
  return self->_callerInfo;
}

- (void)setCallerInfo:(id)a3
{
  objc_storeStrong((id *)&self->_callerInfo, a3);
}

- (PXPersonSuggestion)personSuggestion
{
  return self->_personSuggestion;
}

- (void)setPersonSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_personSuggestion, a3);
}

- (PHFace)face
{
  return self->_face;
}

- (void)setFace:(id)a3
{
  objc_storeStrong((id *)&self->_face, a3);
}

- (double)backingScaleFactor
{
  return self->_backingScaleFactor;
}

- (void)setBackingScaleFactor:(double)a3
{
  self->_backingScaleFactor = a3;
}

- (BOOL)didCommitPreBootstrapAction
{
  return self->_didCommitPreBootstrapAction;
}

- (void)setDidCommitPreBootstrapAction:(BOOL)a3
{
  self->_didCommitPreBootstrapAction = a3;
}

- (PHAsset)keyAsset
{
  return self->_keyAsset;
}

- (void)setKeyAsset:(id)a3
{
  objc_storeStrong((id *)&self->_keyAsset, a3);
}

- (BOOL)wantsContactUnlinkage
{
  return self->_wantsContactUnlinkage;
}

- (void)setWantsContactUnlinkage:(BOOL)a3
{
  self->_wantsContactUnlinkage = a3;
}

- (id)delayedPersonBlock
{
  return self->_delayedPersonBlock;
}

- (void)setDelayedPersonBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_delayedPersonBlock, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_personSuggestion, 0);
  objc_storeStrong((id *)&self->_callerInfo, 0);
  objc_storeStrong((id *)&self->_prefetchedDataSource, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong(&self->_onInitBlock, 0);
  objc_storeStrong((id *)&self->_suggestionManager, 0);
  objc_storeStrong((id *)&self->_nameSelection, 0);
  objc_storeStrong((id *)&self->_targetPerson, 0);
  objc_storeStrong((id *)&self->_sourcePerson, 0);
}

+ (PXPeopleBootstrapContext)contextWithPerson:(id)a3 type:(unint64_t)a4
{
  id v7;
  PXPeopleBootstrapContext *v8;
  void *v10;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeopleBootstrapContext.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

  }
  v8 = objc_alloc_init(PXPeopleBootstrapContext);
  -[PXPeopleBootstrapContext setSourcePerson:](v8, "setSourcePerson:", v7);
  -[PXPeopleBootstrapContext setBootstrapType:](v8, "setBootstrapType:", a4);

  return v8;
}

+ (PXPeopleBootstrapContext)contextWithFace:(id)a3 type:(unint64_t)a4 delayedPersonBlock:(id)a5
{
  id v9;
  id v10;
  void *v11;
  PXPeopleBootstrapContext *v12;
  void *v14;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeopleBootstrapContext.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("face"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeopleBootstrapContext.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delayedPersonBlock"));

LABEL_3:
  if (a4 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeopleBootstrapContext.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type == PXPeopleBootstrapTypeName"));

  }
  v12 = objc_alloc_init(PXPeopleBootstrapContext);
  -[PXPeopleBootstrapContext setBootstrapType:](v12, "setBootstrapType:", a4);
  -[PXPeopleBootstrapContext setWantsMergeCandidateSuggestions:](v12, "setWantsMergeCandidateSuggestions:", 0);
  -[PXPeopleBootstrapContext setFace:](v12, "setFace:", v9);
  -[PXPeopleBootstrapContext setDelayedPersonBlock:](v12, "setDelayedPersonBlock:", v11);

  return v12;
}

+ (PXPeopleBootstrapContext)contextWithPersonSuggestion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeopleBootstrapContext.m"), 68, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("personSuggestion"), v11);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeopleBootstrapContext.m"), 68, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("personSuggestion"), v11, v13);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v5, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPeopleBootstrapContext contextWithPerson:type:](PXPeopleBootstrapContext, "contextWithPerson:type:", v6, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPersonSuggestion:", v5);

  return (PXPeopleBootstrapContext *)v7;
}

@end
