@implementation PHAPhotoStyle

- (PHAPhotoStyle)initWithphotoLibrary:(id)a3
{
  id v3;
  PHAPhotoStyle *v4;

  v3 = a3;
  v4 = (PHAPhotoStyle *)sub_1CAC36154(v3);

  return v4;
}

- (BOOL)updateStyleStreamWithProgressReporter:(id)a3 error:(id *)a4
{
  id v5;
  PHAPhotoStyle *v6;

  v5 = a3;
  v6 = self;
  sub_1CAC344B0(v5);

  return 1;
}

- (PHAPhotoStyle)init
{
  PHAPhotoStyle *result;

  result = (PHAPhotoStyle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___PHAPhotoStyle_logger;
  v4 = sub_1CADC3644();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
