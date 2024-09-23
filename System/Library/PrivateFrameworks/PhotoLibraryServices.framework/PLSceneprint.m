@implementation PLSceneprint

+ (id)entityName
{
  return CFSTR("Sceneprint");
}

- (void)setDuplicateMatchingData:(id)a3 duplicateMatchingAlternateData:(id)a4
{
  unint64_t v6;
  PLSceneprint *v7;
  unint64_t v8;
  unint64_t v9;

  v9 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  if (!(v9 | v6))
  {
    -[PLSceneprint setDuplicateMatchingData:](self, "setDuplicateMatchingData:", 0);
    v7 = self;
    v8 = 0;
LABEL_7:
    -[PLSceneprint setDuplicateMatchingAlternateData:](v7, "setDuplicateMatchingAlternateData:", v8);
    goto LABEL_8;
  }
  if (v9)
    -[PLSceneprint setDuplicateMatchingData:](self, "setDuplicateMatchingData:", v9);
  if (v6)
  {
    v7 = self;
    v8 = v6;
    goto LABEL_7;
  }
LABEL_8:

}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLSceneprint;
  -[PLManagedObject willSave](&v7, sel_willSave);
  -[PLSceneprint changedValues](self, "changedValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[PLSceneprint isDeleted](self, "isDeleted") & 1) == 0 && (MEMORY[0x19AEC0720]() & 1) == 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("duplicateMatchingData"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {

LABEL_6:
      -[PLManagedObject photoLibrary](self, "photoLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLDuplicateProcessor signalBackgroundJobServiceDuplicateProcessingWithLibrary:](PLDuplicateProcessor, "signalBackgroundJobServiceDuplicateProcessingWithLibrary:", v6);

      goto LABEL_7;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("duplicateMatchingAlternateData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      goto LABEL_6;
  }
LABEL_7:

}

+ (id)insertInCurrentManagedObjectContext:(id)a3 withAdditionalAssetAttributes:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[PLManagedObject insertInManagedObjectContext:](PLSceneprint, "insertInManagedObjectContext:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "setAdditionalAssetAttributes:", v5);

  return v7;
}

@end
