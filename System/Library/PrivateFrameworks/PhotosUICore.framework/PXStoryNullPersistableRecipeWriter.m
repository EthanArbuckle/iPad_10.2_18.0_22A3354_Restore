@implementation PXStoryNullPersistableRecipeWriter

- (PXStoryNullPersistableRecipeWriter)init
{
  return -[PXStoryNullPersistableRecipeWriter initWithError:](self, "initWithError:", 0);
}

- (PXStoryNullPersistableRecipeWriter)initWithError:(id)a3
{
  id v5;
  PXStoryNullPersistableRecipeWriter *v6;
  PXStoryNullPersistableRecipeWriter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryNullPersistableRecipeWriter;
  v6 = -[PXStoryNullPersistableRecipeWriter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_error, a3);

  return v7;
}

- (id)writePersistableRecipe:(id)a3 assetEdits:(id)a4 undoManager:(id)a5 resultHandler:(id)a6
{
  id v8;
  void *v9;

  v8 = a6;
  -[PXStoryNullPersistableRecipeWriter error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, void *))a6 + 2))(v8, 0, 0, v9);

  return 0;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
