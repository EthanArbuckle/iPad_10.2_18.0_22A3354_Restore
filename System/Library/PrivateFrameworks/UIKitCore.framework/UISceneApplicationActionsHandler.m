@implementation UISceneApplicationActionsHandler

uint64_t __99___UISceneApplicationActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke(_QWORD *a1)
{
  return objc_msgSend((id)UIApp, "_handleNonLaunchSpecificActions:forScene:withTransitionContext:completion:", a1[4], a1[5], a1[6], 0);
}

@end
