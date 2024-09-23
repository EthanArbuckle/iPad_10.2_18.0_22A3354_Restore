@implementation ConcretePhotoLibraryObservation

- (id)prepareForPhotoLibraryChange:(id)a3
{
  uint64_t (*v3)(id);
  id v5;
  _TtC12PhotosUICoreP33_91D29F4F2DBCF944653069752757388131ConcretePhotoLibraryObservation *v6;
  uint64_t v7;
  void *v8;

  v3 = *(uint64_t (**)(id))((char *)&self->super.isa
                                    + OBJC_IVAR____TtC12PhotosUICoreP33_91D29F4F2DBCF944653069752757388131ConcretePhotoLibraryObservation_prepareBlock);
  if (v3 && (v5 = a3, v6 = self, v7 = v3(v5), v5, v6, v7))
  {
    v8 = (void *)sub_1A7AE3578();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC12PhotosUICoreP33_91D29F4F2DBCF944653069752757388131ConcretePhotoLibraryObservation *v9;
  _QWORD v10[8];

  if (a4)
    v6 = sub_1A7AE3584();
  else
    v6 = 0;
  v7 = sub_1A7AE3B9C();
  MEMORY[0x1E0C80A78](v7);
  v10[2] = self;
  v10[3] = a3;
  v10[4] = v6;
  v8 = a3;
  v9 = self;
  sub_1A69C9194((void (*)(void))sub_1A6A3625C, (uint64_t)v10);

  swift_bridgeObjectRelease();
}

- (_TtC12PhotosUICoreP33_91D29F4F2DBCF944653069752757388131ConcretePhotoLibraryObservation)init
{
  _TtC12PhotosUICoreP33_91D29F4F2DBCF944653069752757388131ConcretePhotoLibraryObservation *result;

  result = (_TtC12PhotosUICoreP33_91D29F4F2DBCF944653069752757388131ConcretePhotoLibraryObservation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A688D368((uint64_t)self+ OBJC_IVAR____TtC12PhotosUICoreP33_91D29F4F2DBCF944653069752757388131ConcretePhotoLibraryObservation_observer);
  sub_1A6855D80(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12PhotosUICoreP33_91D29F4F2DBCF944653069752757388131ConcretePhotoLibraryObservation_prepareBlock));
  swift_release();
}

@end
