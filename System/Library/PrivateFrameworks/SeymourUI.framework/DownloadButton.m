@implementation DownloadButton

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DownloadButton();
  return -[DownloadButton isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DownloadButton();
  v4 = v5.receiver;
  -[DownloadButton setHighlighted:](&v5, sel_setHighlighted_, v3);
  sub_22BA23AB4((char)objc_msgSend(v4, sel_isHighlighted, v5.receiver, v5.super_class));

}

- (_TtC9SeymourUI14DownloadButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI14DownloadButton *)sub_22BA22ABC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI14DownloadButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22BA2571C();
}

- (void)layoutSubviews
{
  _TtC9SeymourUI14DownloadButton *v2;

  v2 = self;
  sub_22BA2322C();

}

- (void)tintColorDidChange
{
  _TtC9SeymourUI14DownloadButton *v2;

  v2 = self;
  sub_22BA2343C();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC9SeymourUI14DownloadButton *v6;

  v5 = a3;
  v6 = self;
  sub_22BA235E8(a3);

}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI14DownloadButton_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI14DownloadButton_backgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI14DownloadButton_contentLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI14DownloadButton_contentView));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI14DownloadButton_alphaAnimator));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI14DownloadButton_contentWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI14DownloadButton_propertyAnimator));
}

- (int64_t)accessibilityState
{
  int v2;
  uint64_t v3;
  int64_t result;

  v2 = *((unsigned __int8 *)&self->super.super.super._responderFlags
       + OBJC_IVAR____TtC9SeymourUI14DownloadButton_currentState);
  v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI14DownloadButton_currentState);
  result = 3;
  switch(v2)
  {
    case 0:
      result = v3 == 3;
      break;
    case 1:
      if ((v3 & 1) != 0)
        result = 6;
      else
        result = 5;
      break;
    case 2:
      return result;
    case 3:
      result = qword_22BAC4AB0[v3];
      break;
    default:
      result = 7;
      break;
  }
  return result;
}

@end
