@implementation PPTTHInteractiveCanvasControllerBackwardPageTurnTest

- (void)turnPage
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
  +[THTestDriver turnPageWithBookController:direction:](THTestDriver, "turnPageWithBookController:direction:", v2, 0xFFFFFFFFLL);

}

@end
