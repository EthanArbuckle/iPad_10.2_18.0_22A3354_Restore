@implementation MediaSocialProfileUpdateOperation

- (void)execute
{
  _TtC16MusicApplication33MediaSocialProfileUpdateOperation *v2;

  v2 = self;
  sub_31B5A0();

}

- (void)finishWithError:(id)a3
{
  void (*v5)(id);
  _TtC16MusicApplication33MediaSocialProfileUpdateOperation *v6;
  id v7;
  void *v8;
  _TtC16MusicApplication33MediaSocialProfileUpdateOperation *v9;
  id v10;
  objc_super v11;

  v5 = *(void (**)(id))&self->MPAsyncOperation_opaque[OBJC_IVAR____TtC16MusicApplication33MediaSocialProfileUpdateOperation_responseHandler];
  if (!v5)
  {
    v9 = self;
    v10 = a3;
    if (a3)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  v6 = self;
  v7 = a3;
  v5(a3);
  if (!a3)
    goto LABEL_5;
LABEL_3:
  v8 = (void *)_convertErrorToNSError(_:)(a3);
LABEL_6:
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for MediaSocialProfileUpdateOperation();
  -[MediaSocialProfileUpdateOperation finishWithError:](&v11, "finishWithError:", v8);

}

- (_TtC16MusicApplication33MediaSocialProfileUpdateOperation)init
{
  _TtC16MusicApplication33MediaSocialProfileUpdateOperation *result;

  result = (_TtC16MusicApplication33MediaSocialProfileUpdateOperation *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.MediaSocialProfileUpdateOperation", 50, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&self->profileUpdate[OBJC_IVAR____TtC16MusicApplication33MediaSocialProfileUpdateOperation_profileUpdate
                                     + 16];
  v4 = *(void **)&self->profileUpdate[OBJC_IVAR____TtC16MusicApplication33MediaSocialProfileUpdateOperation_profileUpdate
                                    + 32];
  swift_bridgeObjectRelease(*(_QWORD *)&self->profileUpdate[OBJC_IVAR____TtC16MusicApplication33MediaSocialProfileUpdateOperation_profileUpdate]);
  swift_bridgeObjectRelease(v3);
  sub_15C188(v4);
  sub_5C198(*(_QWORD *)&self->MPAsyncOperation_opaque[OBJC_IVAR____TtC16MusicApplication33MediaSocialProfileUpdateOperation_responseHandler], *(_QWORD *)&self->profileUpdate[OBJC_IVAR____TtC16MusicApplication33MediaSocialProfileUpdateOperation_responseHandler]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->MPAsyncOperation_opaque[OBJC_IVAR____TtC16MusicApplication33MediaSocialProfileUpdateOperation_photoUploadDictionary]);
}

@end
