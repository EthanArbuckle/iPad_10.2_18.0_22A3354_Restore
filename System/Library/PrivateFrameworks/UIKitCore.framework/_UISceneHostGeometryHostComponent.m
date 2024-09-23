@implementation _UISceneHostGeometryHostComponent

- (void).cxx_destruct
{
  swift_release();
  sub_1855D38F8((uint64_t)self + OBJC_IVAR____TtC5UIKit33_UISceneHostGeometryHostComponent_geometryDriver);
}

- (void)sceneDidInvalidate:(id)a3
{
  id v4;
  _TtC5UIKit33_UISceneHostGeometryHostComponent *v5;
  uint64_t v6;
  _OWORD v7[2];
  uint64_t v8;

  v8 = 0;
  memset(v7, 0, sizeof(v7));
  v4 = a3;
  v5 = self;
  sub_1855D320C((uint64_t)v7);
  v6 = (uint64_t)v5 + OBJC_IVAR____TtC5UIKit33_UISceneHostGeometryHostComponent_geometryDriver;
  swift_beginAccess();
  sub_1855D38B0((uint64_t)v7, v6);
  swift_endAccess();

}

- (_TtC5UIKit33_UISceneHostGeometryHostComponent)init
{
  objc_class *ObjectType;
  char *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit33_UISceneHostGeometryHostComponent_currentHandle) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC5UIKit33_UISceneHostGeometryHostComponent_geometryDriver;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[_UISceneHostGeometryHostComponent init](&v6, sel_init);
}

- (_TtC5UIKit33_UISceneHostGeometryHostComponent)initWithScene:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit33_UISceneHostGeometryHostComponent_currentHandle) = 0;
  v6 = (char *)self + OBJC_IVAR____TtC5UIKit33_UISceneHostGeometryHostComponent_geometryDriver;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_QWORD *)v6 + 4) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[FBSSceneComponent initWithScene:](&v8, sel_initWithScene_, a3);
}

@end
