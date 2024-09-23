@implementation PGWallpaperSuggestionInformer

- (PGWallpaperSuggestionInformer)initWithWorkingContext:(id)a3
{
  id v5;
  PGWallpaperSuggestionInformer *v6;
  PGWallpaperSuggestionInformer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGWallpaperSuggestionInformer;
  v6 = -[PGWallpaperSuggestionInformer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_workingContext, a3);

  return v7;
}

- (id)personLocalIdentifiersForTopPeople:(BOOL)a3
{
  _BOOL4 v3;
  PGSuggestionSession *v4;
  __objc2_class **v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = -[PGSuggestionSession initWithProfile:workingContext:]([PGSuggestionSession alloc], "initWithProfile:workingContext:", 2, self->_workingContext);
  v5 = off_1E83FB4D8;
  if (!v3)
    v5 = off_1E83FAF30;
  v6 = (void *)objc_msgSend(objc_alloc(*v5), "initWithSession:", v4);
  objc_msgSend(v6, "personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress:", &__block_literal_global_30522);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workingContext, 0);
}

@end
