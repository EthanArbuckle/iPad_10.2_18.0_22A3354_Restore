@implementation FMRecipientTableViewCell

- (_TtC6FindMy24FMRecipientTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC6FindMy24FMRecipientTableViewCell *)sub_1003CF194(a3, (uint64_t)a4, v6);
}

- (_TtC6FindMy24FMRecipientTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003D0E10();
}

- (void)prepareForReuse
{
  _TtC6FindMy24FMRecipientTableViewCell *v2;

  v2 = self;
  sub_1003CFC9C();

}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy24FMRecipientTableViewCell__style);
  v4 = *(void **)&self->_style[OBJC_IVAR____TtC6FindMy24FMRecipientTableViewCell__style];
  v5 = *(void **)&self->_style[OBJC_IVAR____TtC6FindMy24FMRecipientTableViewCell__style + 8];
  v6 = *(void **)&self->_style[OBJC_IVAR____TtC6FindMy24FMRecipientTableViewCell__style + 16];
  v7 = *(void **)&self->_style[OBJC_IVAR____TtC6FindMy24FMRecipientTableViewCell__style + 24];
  swift_bridgeObjectRelease(*(_QWORD *)&self->_style[OBJC_IVAR____TtC6FindMy24FMRecipientTableViewCell__style + 40]);

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMRecipientTableViewCell_monogramImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMRecipientTableViewCell_nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMRecipientTableViewCell_nameLabelLeadingWithoutImageConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMRecipientTableViewCell_nameLabelLeadingWithImageConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMRecipientTableViewCell_handleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMRecipientTableViewCell_isInNetworkOperation));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMRecipientTableViewCell_recipient));
}

@end
