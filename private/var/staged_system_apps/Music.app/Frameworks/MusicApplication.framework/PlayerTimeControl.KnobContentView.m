@implementation PlayerTimeControl.KnobContentView

- (_TtCC16MusicApplication17PlayerTimeControlP33_34DD5DE14C49327190C30DAFD42028F315KnobContentView)initWithFrame:(CGRect)a3
{
  return (_TtCC16MusicApplication17PlayerTimeControlP33_34DD5DE14C49327190C30DAFD42028F315KnobContentView *)sub_665FA0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC16MusicApplication17PlayerTimeControlP33_34DD5DE14C49327190C30DAFD42028F315KnobContentView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtCC16MusicApplication17PlayerTimeControlP33_34DD5DE14C49327190C30DAFD42028F315KnobContentView *result;

  v5 = OBJC_IVAR____TtCC16MusicApplication17PlayerTimeControlP33_34DD5DE14C49327190C30DAFD42028F315KnobContentView_knob;
  v6 = objc_allocWithZone((Class)UIView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtCC16MusicApplication17PlayerTimeControlP33_34DD5DE14C49327190C30DAFD42028F315KnobContentView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/PlayerTimeControl.swift", 40, 2, 522, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtCC16MusicApplication17PlayerTimeControlP33_34DD5DE14C49327190C30DAFD42028F315KnobContentView *v2;

  v2 = self;
  sub_666178();

}

- (void)tintColorDidChange
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlayerTimeControl.KnobContentView();
  v2 = (char *)v5.receiver;
  -[PlayerTimeControl.KnobContentView tintColorDidChange](&v5, "tintColorDidChange");
  v3 = *(void **)&v2[OBJC_IVAR____TtCC16MusicApplication17PlayerTimeControlP33_34DD5DE14C49327190C30DAFD42028F315KnobContentView_knob];
  v4 = objc_msgSend(v2, "tintColor", v5.receiver, v5.super_class);
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication17PlayerTimeControlP33_34DD5DE14C49327190C30DAFD42028F315KnobContentView_knob));
}

@end
