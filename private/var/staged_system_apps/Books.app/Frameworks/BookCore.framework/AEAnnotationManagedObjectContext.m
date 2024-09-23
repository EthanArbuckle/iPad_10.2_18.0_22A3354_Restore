@implementation AEAnnotationManagedObjectContext

- (AEAnnotationManagedObjectContext)initWithConcurrencyType:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AEAnnotationManagedObjectContext;
  return -[AEAnnotationManagedObjectContext initWithConcurrencyType:](&v4, "initWithConcurrencyType:", a3);
}

- (BOOL)saveAnnotationProvider
{
  AEAnnotationManagedObjectContext *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationManagedObjectContext annotationProvider](self, "annotationProvider"));
  LOBYTE(v2) = objc_msgSend(v3, "saveManagedObjectContext:", v2);

  return (char)v2;
}

- (int)sessionContextType
{
  return self->_sessionContextType;
}

- (void)setSessionContextType:(int)a3
{
  self->_sessionContextType = a3;
}

- (AEAnnotationProvider)annotationProvider
{
  return (AEAnnotationProvider *)objc_loadWeakRetained((id *)&self->_annotationProvider);
}

- (void)setAnnotationProvider:(id)a3
{
  objc_storeWeak((id *)&self->_annotationProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_annotationProvider);
}

@end
