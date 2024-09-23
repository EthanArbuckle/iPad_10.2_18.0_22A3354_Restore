@implementation _UIScenePresenterGeometryDriver.GeometryChangeObserver

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  uint64_t v7;
  id v8;

  swift_beginAccess();
  v7 = *(_QWORD *)self->driver;
  swift_unownedRetainStrong();
  if (v7)
  {
    v8 = a4;
    swift_retain();
    sub_18576C1E0((uint64_t *)a3);

    swift_release();
    swift_release();
  }
}

@end
