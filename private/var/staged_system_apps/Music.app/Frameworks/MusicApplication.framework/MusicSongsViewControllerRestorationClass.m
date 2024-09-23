@implementation MusicSongsViewControllerRestorationClass

+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SongsViewController()), "init");
}

- (MusicSongsViewControllerRestorationClass)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_s16MusicApplication16RestorationClassCMa_1();
  return -[MusicSongsViewControllerRestorationClass init](&v3, "init");
}

@end
