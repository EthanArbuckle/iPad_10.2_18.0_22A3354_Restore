@implementation DOCTokenChainView.DOCTextTokenView

- (_TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v7;
  uint64_t v8;
  _TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView *v9;
  _OWORD *v10;
  __int128 v11;
  _TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = OBJC_IVAR____TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView_padding;
  v8 = qword_100641008;
  v9 = self;
  if (v8 != -1)
    swift_once(&qword_100641008, sub_10033C988);
  v10 = (_OWORD *)((char *)v9 + v7);
  v11 = unk_10064F3E0;
  *v10 = unk_10064F3D0;
  v10[1] = v11;

  v14.receiver = v9;
  v14.super_class = (Class)type metadata accessor for DOCTokenChainView.DOCTextTokenView();
  v12 = -[DOCTokenChainView.DOCTextTokenView initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  -[DOCTokenChainView.DOCTextTokenView setOpaque:](v12, "setOpaque:", 0);
  return v12;
}

- (_TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  _OWORD *v7;
  __int128 v8;
  _TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView *result;

  v4 = OBJC_IVAR____TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView_padding;
  v5 = qword_100641008;
  v6 = a3;
  if (v5 != -1)
    swift_once(&qword_100641008, sub_10033C988);
  v7 = (_OWORD *)((char *)self + v4);
  v8 = unk_10064F3E0;
  *v7 = unk_10064F3D0;
  v7[1] = v8;

  result = (_TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010050DA60, "Files/UIKit+DOCAdditionsCore.swift", 34, 2, 12, 0);
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCTokenChainView.DOCTextTokenView();
  return -[DOCTokenChainView.DOCTextTokenView isHighlighted](&v3, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCTokenChainView.DOCTextTokenView();
  v4 = v5.receiver;
  -[DOCTokenChainView.DOCTextTokenView setHighlighted:](&v5, "setHighlighted:", v3);
  sub_10033CC44();

}

- (void)layoutSubviews
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCTokenChainView.DOCTextTokenView();
  v2 = v4.receiver;
  -[DOCTokenChainView.DOCTextTokenView layoutSubviews](&v4, "layoutSubviews");
  v3 = objc_msgSend(v2, "layer", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setCornerRadius:", 4.0);

}

- (CGSize)intrinsicContentSize
{
  char *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for DOCTokenChainView.DOCTextTokenView();
  v2 = (char *)v11.receiver;
  -[DOCTokenChainView.DOCTextTokenView intrinsicContentSize](&v11, "intrinsicContentSize");
  v4 = v3;
  v5 = *(double *)&v2[OBJC_IVAR____TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView_padding];
  v6 = *(double *)&v2[OBJC_IVAR____TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView_padding
                    + 16];
  v8 = v7
     + *(double *)&v2[OBJC_IVAR____TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView_padding
                    + 8]
     + *(double *)&v2[OBJC_IVAR____TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView_padding
                    + 24];

  v9 = v4 + v5 + v6;
  v10 = v8;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView *v11;
  objc_super v12;

  v4 = sub_10007EAFC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *(double *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView_padding), *(double *)&self->padding[OBJC_IVAR____TtCC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView16DOCTextTokenView_padding]);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for DOCTokenChainView.DOCTextTokenView();
  v11 = self;
  -[DOCTokenChainView.DOCTextTokenView drawTextInRect:](&v12, "drawTextInRect:", v4, v6, v8, v10);

}

@end
