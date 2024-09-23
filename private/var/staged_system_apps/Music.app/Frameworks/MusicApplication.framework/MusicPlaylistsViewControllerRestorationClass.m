@implementation MusicPlaylistsViewControllerRestorationClass

+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  v7 = sub_A5C7B8();

  return v7;
}

- (MusicPlaylistsViewControllerRestorationClass)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_s16MusicApplication16RestorationClassCMa_3();
  return -[MusicPlaylistsViewControllerRestorationClass init](&v3, "init");
}

@end
