@implementation CardActions

- (_TtC17SequoiaTranslator11CardActions)initWithFrame:(CGRect)a3
{
  return (_TtC17SequoiaTranslator11CardActions *)sub_100022280(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17SequoiaTranslator11CardActions)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000238E8();
}

- (void).cxx_destruct
{

  sub_10000A020((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator11CardActions_delegate, (uint64_t *)&unk_10028C080);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator11CardActions____lazy_storage___stack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator11CardActions____lazy_storage___expandAction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator11CardActions____lazy_storage___starAction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator11CardActions____lazy_storage___bookClosedAction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator11CardActions____lazy_storage___playButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator11CardActions_playLongPress));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator11CardActions____lazy_storage___playbackRateLabel));
}

@end
