@implementation _UISceneRenderingEnvironmentSettings

+ (id)protocol
{
  return &unk_1EE0CEB28;
}

+ (void)configureSetting:(id)a3
{
  id v3;

  v3 = a3;
  if ((objc_msgSend(v3, "matchesProperty:", sel_modern_isCapturingContentForAdditionalRenderingDestination) & 1) != 0
    || objc_msgSend(v3, "matchesProperty:", sel_systemDisplayIdentifier))
  {
    objc_msgSend(v3, "setPropagating:", 1);
    objc_msgSend(v3, "setNullPreserving:", 1);
  }

}

@end
