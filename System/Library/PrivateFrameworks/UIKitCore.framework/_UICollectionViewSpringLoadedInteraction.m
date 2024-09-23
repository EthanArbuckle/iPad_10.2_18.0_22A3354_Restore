@implementation _UICollectionViewSpringLoadedInteraction

+ (id)collectionViewSpringLoadedInteraction
{
  UISpringLoadedInteraction *v2;
  void *v3;
  void *v4;
  UISpringLoadedInteraction *v5;

  v2 = [UISpringLoadedInteraction alloc];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = -[UISpringLoadedInteraction initWithInteractionBehavior:interactionEffect:activationHandler:](v2, "initWithInteractionBehavior:interactionEffect:activationHandler:", v3, v4, &__block_literal_global_118);

  return v5;
}

@end
