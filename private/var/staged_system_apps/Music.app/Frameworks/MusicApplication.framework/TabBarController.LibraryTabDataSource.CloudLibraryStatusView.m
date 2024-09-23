@implementation TabBarController.LibraryTabDataSource.CloudLibraryStatusView

- (_TtCCC16MusicApplication16TabBarController20LibraryTabDataSourceP33_DFCA1141F8762042AD5A48E578AC0BD722CloudLibraryStatusView)initWithCoder:(id)a3
{
  char *v4;
  id v10;
  _TtCCC16MusicApplication16TabBarController20LibraryTabDataSourceP33_DFCA1141F8762042AD5A48E578AC0BD722CloudLibraryStatusView *result;

  v4 = (char *)self
     + OBJC_IVAR____TtCCC16MusicApplication16TabBarController20LibraryTabDataSourceP33_DFCA1141F8762042AD5A48E578AC0BD722CloudLibraryStatusView_state;
  *((_WORD *)v4 + 2) = 0;
  *(_DWORD *)v4 = 0;
  v4[6] = 1;
  __asm { FMOV            V0.2D, #24.0 }
  *(_OWORD *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtCCC16MusicApplication16TabBarController20LibraryTabDataSourceP33_DFCA1141F8762042AD5A48E578AC0BD722CloudLibraryStatusView_defaultIntrinsicContentSize) = _Q0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCCC16MusicApplication16TabBarController20LibraryTabDataSourceP33_DFCA1141F8762042AD5A48E578AC0BD722CloudLibraryStatusView_spinner) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCCC16MusicApplication16TabBarController20LibraryTabDataSourceP33_DFCA1141F8762042AD5A48E578AC0BD722CloudLibraryStatusView_enablementButton) = 0;
  v10 = a3;

  result = (_TtCCC16MusicApplication16TabBarController20LibraryTabDataSourceP33_DFCA1141F8762042AD5A48E578AC0BD722CloudLibraryStatusView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/LibraryTabDataSource.swift", 43, 2, 419, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtCCC16MusicApplication16TabBarController20LibraryTabDataSourceP33_DFCA1141F8762042AD5A48E578AC0BD722CloudLibraryStatusView *v2;

  v2 = self;
  sub_901FC();

}

- (CGSize)intrinsicContentSize
{
  _TtCCC16MusicApplication16TabBarController20LibraryTabDataSourceP33_DFCA1141F8762042AD5A48E578AC0BD722CloudLibraryStatusView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_90324();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtCCC16MusicApplication16TabBarController20LibraryTabDataSourceP33_DFCA1141F8762042AD5A48E578AC0BD722CloudLibraryStatusView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = sub_903DC();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtCCC16MusicApplication16TabBarController20LibraryTabDataSourceP33_DFCA1141F8762042AD5A48E578AC0BD722CloudLibraryStatusView)initWithFrame:(CGRect)a3
{
  _TtCCC16MusicApplication16TabBarController20LibraryTabDataSourceP33_DFCA1141F8762042AD5A48E578AC0BD722CloudLibraryStatusView *result;

  result = (_TtCCC16MusicApplication16TabBarController20LibraryTabDataSourceP33_DFCA1141F8762042AD5A48E578AC0BD722CloudLibraryStatusView *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.CloudLibraryStatusView", 39, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->enablementHandler[OBJC_IVAR____TtCCC16MusicApplication16TabBarController20LibraryTabDataSourceP33_DFCA1141F8762042AD5A48E578AC0BD722CloudLibraryStatusView_enablementHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC16MusicApplication16TabBarController20LibraryTabDataSourceP33_DFCA1141F8762042AD5A48E578AC0BD722CloudLibraryStatusView_spinner));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC16MusicApplication16TabBarController20LibraryTabDataSourceP33_DFCA1141F8762042AD5A48E578AC0BD722CloudLibraryStatusView_enablementButton));
}

@end
