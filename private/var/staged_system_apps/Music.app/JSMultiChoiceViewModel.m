@implementation JSMultiChoiceViewModel

- (void).cxx_destruct
{
  uint64_t v3;

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore22JSMultiChoiceViewModel_selectedItem));
  sub_10013C71C((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore22JSMultiChoiceViewModel_delegate, v3);
}

@end
