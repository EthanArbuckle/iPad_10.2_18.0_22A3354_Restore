@implementation PFStoryRecipeLibraryFactory

+ (id)createLibraryWithKind:(int64_t)a3 url:(id)a4
{
  id v5;
  PFStoryConcreteRecipeLibrary *v6;

  v5 = a4;
  v6 = -[PFStoryConcreteRecipeLibrary initWithKind:url:]([PFStoryConcreteRecipeLibrary alloc], "initWithKind:url:", a3, v5);

  return v6;
}

@end
