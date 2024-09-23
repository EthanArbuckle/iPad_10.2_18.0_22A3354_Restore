@implementation PFStoryRecipeFactory

+ (id)createRecipe
{
  return objc_alloc_init(PFStoryConcreteRecipe);
}

@end
