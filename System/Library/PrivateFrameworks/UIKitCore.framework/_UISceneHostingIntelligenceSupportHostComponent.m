@implementation _UISceneHostingIntelligenceSupportHostComponent

- (void)collectRemoteContentInVisibleRect:(CGRect)a3 withRemoteContextWrapper:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  +[_UISceneHostingIntelligenceSupportActionToClient actionForCollectRemoteContentInVisibleRect:withRemoteContextWrapper:](_UISceneHostingIntelligenceSupportActionToClient, "actionForCollectRemoteContentInVisibleRect:withRemoteContextWrapper:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSSceneComponent scene](self, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendPrivateActions:", v6);

}

@end
