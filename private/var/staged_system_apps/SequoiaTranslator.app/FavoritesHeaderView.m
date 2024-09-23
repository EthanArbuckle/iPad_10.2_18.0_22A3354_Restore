@implementation FavoritesHeaderView

- (_TtC17SequoiaTranslator19FavoritesHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC17SequoiaTranslator19FavoritesHeaderView *)sub_1000C3CDC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17SequoiaTranslator19FavoritesHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000C44E8();
}

- (void)buttonPressed
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC17SequoiaTranslator19FavoritesHeaderView *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC17SequoiaTranslator19FavoritesHeaderView_buttonAction);
  if (v2)
  {
    v3 = *(_QWORD *)&self->label[OBJC_IVAR____TtC17SequoiaTranslator19FavoritesHeaderView_buttonAction];
    v5 = self;
    v4 = sub_100016244((uint64_t)v2, v3);
    v2(v4);
    sub_10002BA44((uint64_t)v2, v3);

  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator19FavoritesHeaderView_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator19FavoritesHeaderView_button));
  sub_10002BA44(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC17SequoiaTranslator19FavoritesHeaderView_buttonAction), *(_QWORD *)&self->label[OBJC_IVAR____TtC17SequoiaTranslator19FavoritesHeaderView_buttonAction]);
}

@end
