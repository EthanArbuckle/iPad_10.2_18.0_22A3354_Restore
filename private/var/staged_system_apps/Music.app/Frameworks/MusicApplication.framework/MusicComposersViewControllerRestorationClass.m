@implementation MusicComposersViewControllerRestorationClass

+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ComposersViewController(0)), "init");
}

- (MusicComposersViewControllerRestorationClass)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RestorationClass();
  return -[MusicComposersViewControllerRestorationClass init](&v3, "init");
}

@end
