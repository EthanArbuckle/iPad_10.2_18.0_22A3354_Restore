@implementation ICThumbnailGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (ICThumbnailGenerator)initWithManagedObjectContext:(id)a3
{
  id v5;
  ICThumbnailGenerator *v6;
  ICThumbnailGenerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICThumbnailGenerator;
  v6 = -[ICThumbnailGenerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_managedObjectContext, a3);

  return v7;
}

@end
