@implementation JSMultiChoiceViewModel

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore22JSMultiChoiceViewModel_selectedItem));
  sub_64880((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore22JSMultiChoiceViewModel_delegate);
}

@end
