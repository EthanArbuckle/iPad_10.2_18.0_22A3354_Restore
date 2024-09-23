@implementation FMModernPlatterTableView

- (CGSize)contentSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMModernPlatterTableView();
  -[FMModernPlatterTableView contentSize](&v4, "contentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  double height;
  double width;
  id v5;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMModernPlatterTableView();
  v5 = v6.receiver;
  -[FMModernPlatterTableView setContentSize:](&v6, "setContentSize:", width, height);
  sub_10042CE8C();

}

- (_TtC6FindMyP33_CC23E81230DC16D325E739DF41B02D5424FMModernPlatterTableView)init
{
  return (_TtC6FindMyP33_CC23E81230DC16D325E739DF41B02D5424FMModernPlatterTableView *)sub_10042CF78();
}

- (_TtC6FindMyP33_CC23E81230DC16D325E739DF41B02D5424FMModernPlatterTableView)initWithCoder:(id)a3
{
  id v4;
  _TtC6FindMyP33_CC23E81230DC16D325E739DF41B02D5424FMModernPlatterTableView *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMyP33_CC23E81230DC16D325E739DF41B02D5424FMModernPlatterTableView_heightConstraint) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMyP33_CC23E81230DC16D325E739DF41B02D5424FMModernPlatterTableView_resizeBlockCount) = 0;
  v4 = a3;

  result = (_TtC6FindMyP33_CC23E81230DC16D325E739DF41B02D5424FMModernPlatterTableView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMModernPlatterView.swift", 32, 2, 47, 0);
  __break(1u);
  return result;
}

- (_TtC6FindMyP33_CC23E81230DC16D325E739DF41B02D5424FMModernPlatterTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  _TtC6FindMyP33_CC23E81230DC16D325E739DF41B02D5424FMModernPlatterTableView *result;

  result = (_TtC6FindMyP33_CC23E81230DC16D325E739DF41B02D5424FMModernPlatterTableView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMModernPlatterTableView", 31, "init(frame:style:)", 18, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMyP33_CC23E81230DC16D325E739DF41B02D5424FMModernPlatterTableView_heightConstraint));
}

@end
