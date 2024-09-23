@implementation SceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC20UniversalControl_iOS13SceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100008380(v8);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC20UniversalControl_iOS13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1000085BC(v4);

}

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  objc_class *v9;
  id v10;
  UIWindowScene v11;
  _TtC20UniversalControl_iOS13SceneDelegate *v12;

  v9 = (objc_class *)a3;
  swift_unknownObjectRetain(a4);
  v10 = a6;
  v12 = self;
  v11.super.super.super.isa = v9;
  sub_1000086D0(v11);

  swift_unknownObjectRelease(a4);
}

- (_TtC20UniversalControl_iOS13SceneDelegate)init
{
  return (_TtC20UniversalControl_iOS13SceneDelegate *)sub_100008784();
}

@end
