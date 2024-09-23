@implementation MediaSocialProfileRequestOperation

- (void)execute
{
  _TtC16MusicApplication34MediaSocialProfileRequestOperation *v2;

  v2 = self;
  sub_356BA8();

}

- (void)finishWithError:(id)a3
{
  void (*v5)(_QWORD *, id);
  _TtC16MusicApplication34MediaSocialProfileRequestOperation *v6;
  id v7;
  void *v8;
  objc_super v9;
  _QWORD v10[19];

  v5 = *(void (**)(_QWORD *, id))&self->MPAsyncOperation_opaque[OBJC_IVAR____TtC16MusicApplication34MediaSocialProfileRequestOperation_responseHandler];
  sub_195948((uint64_t)&self->MPAsyncOperation_opaque[OBJC_IVAR____TtC16MusicApplication34MediaSocialProfileRequestOperation_loadedProfile], (uint64_t)v10);
  v6 = self;
  sub_1EADE4(v10, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1EAD34);
  v7 = a3;
  v5(v10, a3);
  sub_1EADE4(v10, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_195A08);
  if (a3)
    v8 = (void *)_convertErrorToNSError(_:)(v7);
  else
    v8 = 0;
  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for MediaSocialProfileRequestOperation();
  -[MediaSocialProfileRequestOperation finishWithError:](&v9, "finishWithError:", v8);

}

- (_TtC16MusicApplication34MediaSocialProfileRequestOperation)init
{
  _TtC16MusicApplication34MediaSocialProfileRequestOperation *result;

  result = (_TtC16MusicApplication34MediaSocialProfileRequestOperation *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.MediaSocialProfileRequestOperation", 51, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _QWORD v3[19];

  swift_release(*(_QWORD *)&self->responseHandler[OBJC_IVAR____TtC16MusicApplication34MediaSocialProfileRequestOperation_responseHandler]);
  sub_195948((uint64_t)&self->MPAsyncOperation_opaque[OBJC_IVAR____TtC16MusicApplication34MediaSocialProfileRequestOperation_loadedProfile], (uint64_t)v3);
  sub_1EADE4(v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_195A08);
}

@end
