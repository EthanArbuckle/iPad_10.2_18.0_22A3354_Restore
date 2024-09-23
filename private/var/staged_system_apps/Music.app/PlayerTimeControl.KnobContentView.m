@implementation PlayerTimeControl.KnobContentView

- (_TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E95831815KnobContentView)initWithFrame:(CGRect)a3
{
  return (_TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E95831815KnobContentView *)sub_1002DCD90(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E95831815KnobContentView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E95831815KnobContentView *result;

  v5 = OBJC_IVAR____TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E95831815KnobContentView_knob;
  v6 = objc_allocWithZone((Class)UIView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E95831815KnobContentView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/PlayerTimeControl.swift", 29, 2, 522, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E95831815KnobContentView *v2;

  v2 = self;
  sub_1002DCF70();

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
  v3 = *(void **)&v2[OBJC_IVAR____TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E95831815KnobContentView_knob];
  v4 = objc_msgSend(v2, "tintColor", v5.receiver, v5.super_class);
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E95831815KnobContentView_knob));
}

@end
