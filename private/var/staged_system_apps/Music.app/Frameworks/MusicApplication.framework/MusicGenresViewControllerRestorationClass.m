@implementation MusicGenresViewControllerRestorationClass

+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for GenresViewController(0)), "init");
}

- (MusicGenresViewControllerRestorationClass)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_s16MusicApplication16RestorationClassCMa_2();
  return -[MusicGenresViewControllerRestorationClass init](&v3, "init");
}

@end
