@implementation FBSceneWorkspace(PosterUIFoundation)

+ (id)pui_posterWorkspace
{
  if (pui_posterWorkspace_onceToken != -1)
    dispatch_once(&pui_posterWorkspace_onceToken, &__block_literal_global_2);
  return (id)pui_posterWorkspace___PosterWorkspace;
}

@end
