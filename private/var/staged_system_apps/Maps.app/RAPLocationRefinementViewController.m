@implementation RAPLocationRefinementViewController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RAPLocationRefinementViewController;
  -[LocationRefinementViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
  objc_msgSend(v3, "setMapType:", 2);

}

@end
