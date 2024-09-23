@implementation _UIScenePresenterGeometryDriverStorage

- (_UIScenePresenterGeometryDriverStorage)initWithScenePresentationView:(id)a3
{
  uint64_t v5;
  _QWORD *v6;
  _UIScenePresenterGeometryDriverStorage *v7;
  _UIScenePresenterGeometryDriverStorage *v8;
  objc_super v10;

  v5 = OBJC_IVAR____UIScenePresenterGeometryDriverStorage_driver;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIScenePresenterGeometryDriverStorage_driver) = 0;
  type metadata accessor for _UIScenePresenterGeometryDriver();
  swift_allocObject();
  v6 = a3;
  v7 = self;
  *(Class *)((char *)&self->super.isa + v5) = (Class)sub_18576B3F4(v6);

  swift_release();
  v10.receiver = v7;
  v10.super_class = (Class)_UIScenePresenterGeometryDriverStorage;
  v8 = -[_UIScenePresenterGeometryDriverStorage init](&v10, sel_init);

  return v8;
}

- (void)scenePresentationViewIsLayingOutSubviews
{
  _UIScenePresenterGeometryDriverStorage *v2;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____UIScenePresenterGeometryDriverStorage_driver))
  {
    v2 = self;
    swift_retain();
    sub_18576B140();

    swift_release();
  }
}

- (void).cxx_destruct
{
  swift_release();
}

- (_UIScenePresenterGeometryDriverStorage)init
{
  _UIScenePresenterGeometryDriverStorage *result;

  result = (_UIScenePresenterGeometryDriverStorage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
