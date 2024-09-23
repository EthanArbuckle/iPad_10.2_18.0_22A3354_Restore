@implementation Interstellar.HeaderView

- (_TtCO16MusicApplication12Interstellar10HeaderView)initWithFrame:(CGRect)a3
{
  return (_TtCO16MusicApplication12Interstellar10HeaderView *)sub_628E58(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCO16MusicApplication12Interstellar10HeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_6305E0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCO16MusicApplication12Interstellar10HeaderView_contentView), "sizeThatFits:", a3.width, a3.height);
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  _TtCO16MusicApplication12Interstellar10HeaderView *v2;

  v2 = self;
  sub_6290E8();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCO16MusicApplication12Interstellar10HeaderView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCO16MusicApplication12Interstellar10HeaderView_seeAllButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCO16MusicApplication12Interstellar10HeaderView_separator));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCO16MusicApplication12Interstellar10HeaderView_buttonSelectionHandler), *(_QWORD *)&self->contentView[OBJC_IVAR____TtCO16MusicApplication12Interstellar10HeaderView_buttonSelectionHandler]);
}

@end
