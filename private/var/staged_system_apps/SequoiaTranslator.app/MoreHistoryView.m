@implementation MoreHistoryView

- (_TtC17SequoiaTranslator15MoreHistoryView)initWithFrame:(CGRect)a3
{
  return (_TtC17SequoiaTranslator15MoreHistoryView *)sub_10012C464(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17SequoiaTranslator15MoreHistoryView)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  _TtC17SequoiaTranslator15MoreHistoryView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC17SequoiaTranslator15MoreHistoryView_paddingDefault) = (Class)0x4028000000000000;
  v4 = OBJC_IVAR____TtC17SequoiaTranslator15MoreHistoryView_moreHistoryLabel;
  v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_10012C1EC();
  v6 = OBJC_IVAR____TtC17SequoiaTranslator15MoreHistoryView_disclosureIndictor;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)sub_10012C36C();

  result = (_TtC17SequoiaTranslator15MoreHistoryView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001F88D0, "SequoiaTranslator/MoreHistoryCollectionViewCell.swift", 53, 2, 114, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15MoreHistoryView_moreHistoryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15MoreHistoryView_disclosureIndictor));
}

@end
