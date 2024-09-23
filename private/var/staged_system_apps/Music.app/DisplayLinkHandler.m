@implementation DisplayLinkHandler

- (void)handleDisplayLinkFired:(id)a3
{
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC14MusicUtilitiesP33_A1FC62D80C043A876151FA559C82DA5918DisplayLinkHandler *v8;

  if (a3)
  {
    v4 = *(void (**)(uint64_t))((char *)&self->super.isa
                                        + OBJC_IVAR____TtC14MusicUtilitiesP33_A1FC62D80C043A876151FA559C82DA5918DisplayLinkHandler__handler);
    v8 = self;
    swift_unknownObjectRetain(a3, v5);
    v6 = objc_opt_self(CADisplayLink);
    v7 = swift_dynamicCastObjCClassUnconditional(a3, v6, 0, 0, 0);
    v4(v7);
    swift_unknownObjectRelease(a3);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC14MusicUtilitiesP33_A1FC62D80C043A876151FA559C82DA5918DisplayLinkHandler)init
{
  _TtC14MusicUtilitiesP33_A1FC62D80C043A876151FA559C82DA5918DisplayLinkHandler *result;

  result = (_TtC14MusicUtilitiesP33_A1FC62D80C043A876151FA559C82DA5918DisplayLinkHandler *)_swift_stdlib_reportUnimplementedInitializer("MusicUtilities.DisplayLinkHandler", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->_handler[OBJC_IVAR____TtC14MusicUtilitiesP33_A1FC62D80C043A876151FA559C82DA5918DisplayLinkHandler__handler]);
}

@end
