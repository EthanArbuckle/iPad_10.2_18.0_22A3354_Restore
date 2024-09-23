@implementation PPTTHInteractiveCanvasControllerForwardPageTurnTest

- (void)turnPage
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
  +[THTestDriver turnPageWithBookController:direction:](THTestDriver, "turnPageWithBookController:direction:", v2, 1);

}

@end
