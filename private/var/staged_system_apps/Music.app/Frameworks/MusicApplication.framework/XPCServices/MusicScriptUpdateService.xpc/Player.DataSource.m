@implementation Player.DataSource

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  void *v6;
  id v7;
  _TtCC9MusicCore6PlayerP33_031AD420BBF8BBF113A2662767DAC2BB10DataSource *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_100183994(v7, (uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  id v6;
  id v7;
  _TtCC9MusicCore6PlayerP33_031AD420BBF8BBF113A2662767DAC2BB10DataSource *v8;
  id v9;
  id v10;
  uint64_t v11;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = objc_msgSend(v6, "request");
  if (v9)
  {
    v10 = v9;
    objc_opt_self(MPCPlayerRequest);
    v11 = swift_dynamicCastObjCClass(v10);
    if (v11)
      (*(void (**)(uint64_t, id))((char *)&v8->super.isa
                                          + OBJC_IVAR____TtCC9MusicCore6PlayerP33_031AD420BBF8BBF113A2662767DAC2BB10DataSource_onError))(v11, v7);

    swift_unknownObjectRelease(v10);
  }
  else
  {

  }
  return 1;
}

- (_TtCC9MusicCore6PlayerP33_031AD420BBF8BBF113A2662767DAC2BB10DataSource)init
{
  _TtCC9MusicCore6PlayerP33_031AD420BBF8BBF113A2662767DAC2BB10DataSource *result;

  result = (_TtCC9MusicCore6PlayerP33_031AD420BBF8BBF113A2662767DAC2BB10DataSource *)_swift_stdlib_reportUnimplementedInitializer("MusicCore.DataSource", 20, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC9MusicCore6PlayerP33_031AD420BBF8BBF113A2662767DAC2BB10DataSource_request));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC9MusicCore6PlayerP33_031AD420BBF8BBF113A2662767DAC2BB10DataSource_path));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC9MusicCore6PlayerP33_031AD420BBF8BBF113A2662767DAC2BB10DataSource_controller));
  swift_release(*(_QWORD *)&self->request[OBJC_IVAR____TtCC9MusicCore6PlayerP33_031AD420BBF8BBF113A2662767DAC2BB10DataSource_onResponseChanged]);
  swift_release(*(_QWORD *)&self->request[OBJC_IVAR____TtCC9MusicCore6PlayerP33_031AD420BBF8BBF113A2662767DAC2BB10DataSource_onError]);
}

@end
