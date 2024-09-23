@implementation PlatterCellView

- (_TtC16MusicMessagesApp15PlatterCellView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicMessagesApp15PlatterCellView *)sub_10001135C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicMessagesApp15PlatterCellView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100011D48();
}

- (void)layoutSubviews
{
  _TtC16MusicMessagesApp15PlatterCellView *v2;

  v2 = self;
  sub_100011760();

}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PlatterCellView();
  return -[PlatterCellView isHighlighted](&v3, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC16MusicMessagesApp15PlatterCellView *v4;

  v4 = self;
  sub_100011944(a3);

}

- (void)prepareForReuse
{
  _TtC16MusicMessagesApp15PlatterCellView *v2;

  v2 = self;
  sub_100011A58();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp15PlatterCellView_platterView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp15PlatterCellView_customBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp15PlatterCellView_highlightDimmingView));
}

@end
