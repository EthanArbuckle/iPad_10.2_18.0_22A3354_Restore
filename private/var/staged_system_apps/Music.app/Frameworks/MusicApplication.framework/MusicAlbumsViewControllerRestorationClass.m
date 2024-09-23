@implementation MusicAlbumsViewControllerRestorationClass

+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  v7 = (void *)sub_3270FC(v6);

  return v7;
}

- (MusicAlbumsViewControllerRestorationClass)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_s16MusicApplication16RestorationClassCMa_0();
  return -[MusicAlbumsViewControllerRestorationClass init](&v3, "init");
}

@end
