@implementation NSBundle(PersonaUI)

+ (id)pr_personaUIBundle
{
  if (pr_personaUIBundle_onceToken != -1)
    dispatch_once(&pr_personaUIBundle_onceToken, &__block_literal_global_1);
  return (id)pr_personaUIBundle_personaUIBundle;
}

@end
