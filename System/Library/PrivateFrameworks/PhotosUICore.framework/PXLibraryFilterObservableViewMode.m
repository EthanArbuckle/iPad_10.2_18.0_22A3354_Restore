@implementation PXLibraryFilterObservableViewMode

- (int64_t)viewMode
{
  _TtC12PhotosUICore33PXLibraryFilterObservableViewMode *v3;
  int64_t v4;

  swift_getKeyPath();
  sub_1A68ABCA8();
  v3 = self;
  sub_1A7ADCCB4();
  swift_release();
  v4 = *(int64_t *)((char *)&v3->super.isa
                         + OBJC_IVAR____TtC12PhotosUICore33PXLibraryFilterObservableViewMode___viewMode);

  return v4;
}

- (void)setViewMode:(int64_t)a3
{
  _TtC12PhotosUICore33PXLibraryFilterObservableViewMode *v4;

  v4 = self;
  sub_1A68ABA34(a3);

}

- (_TtC12PhotosUICore33PXLibraryFilterObservableViewMode)initWithViewMode:(int64_t)a3
{
  objc_class *ObjectType;
  _TtC12PhotosUICore33PXLibraryFilterObservableViewMode *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = self;
  sub_1A7ADCCD8();
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR____TtC12PhotosUICore33PXLibraryFilterObservableViewMode___viewMode) = (Class)a3;

  v8.receiver = v6;
  v8.super_class = ObjectType;
  return -[PXLibraryFilterObservableViewMode init](&v8, sel_init);
}

- (_TtC12PhotosUICore33PXLibraryFilterObservableViewMode)init
{
  _TtC12PhotosUICore33PXLibraryFilterObservableViewMode *result;

  result = (_TtC12PhotosUICore33PXLibraryFilterObservableViewMode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC12PhotosUICore33PXLibraryFilterObservableViewMode___observationRegistrar;
  v3 = sub_1A7ADCCE4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
