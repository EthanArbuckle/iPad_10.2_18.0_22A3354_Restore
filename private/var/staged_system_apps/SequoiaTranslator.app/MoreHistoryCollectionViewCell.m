@implementation MoreHistoryCollectionViewCell

- (_TtC17SequoiaTranslator29MoreHistoryCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC17SequoiaTranslator29MoreHistoryCollectionViewCell *)sub_10012B9C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17SequoiaTranslator29MoreHistoryCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  char *v8;
  _TtC17SequoiaTranslator29MoreHistoryCollectionViewCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator29MoreHistoryCollectionViewCell_paddingDefault) = (Class)0x4028000000000000;
  v5 = OBJC_IVAR____TtC17SequoiaTranslator29MoreHistoryCollectionViewCell_moreHistoryView;
  v6 = objc_allocWithZone((Class)type metadata accessor for MoreHistoryView());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v8 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator29MoreHistoryCollectionViewCell_delegate;
  *((_QWORD *)v8 + 1) = 0;
  swift_unknownObjectWeakInit(v8, 0);

  result = (_TtC17SequoiaTranslator29MoreHistoryCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001F88D0, "SequoiaTranslator/MoreHistoryCollectionViewCell.swift", 53, 2, 53, 0);
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MoreHistoryCollectionViewCell();
  return -[MoreHistoryCollectionViewCell isHighlighted](&v3, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  unsigned int v6;
  double v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MoreHistoryCollectionViewCell();
  v4 = (char *)v8.receiver;
  -[MoreHistoryCollectionViewCell setHighlighted:](&v8, "setHighlighted:", v3);
  v5 = *(void **)&v4[OBJC_IVAR____TtC17SequoiaTranslator29MoreHistoryCollectionViewCell_moreHistoryView];
  v6 = objc_msgSend(v4, "isHighlighted", v8.receiver, v8.super_class);
  v7 = 1.0;
  if (v6)
    v7 = 0.5;
  objc_msgSend(v5, "setAlpha:", v7);

}

- (void)tapped:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator29MoreHistoryCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_10012CB58();

}

- (void)gestureUpdated:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator29MoreHistoryCollectionViewCell *v5;
  uint64_t Strong;

  v4 = a3;
  v5 = self;
  -[MoreHistoryCollectionViewCell setHighlighted:](v5, "setHighlighted:", objc_msgSend(v4, "state") != (id)3);
  Strong = swift_unknownObjectWeakLoadStrong((char *)v5 + OBJC_IVAR____TtC17SequoiaTranslator29MoreHistoryCollectionViewCell_delegate);

  if (Strong)
    swift_unknownObjectRelease(Strong);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator29MoreHistoryCollectionViewCell_moreHistoryView));
  sub_100011194((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator29MoreHistoryCollectionViewCell_delegate);
}

@end
