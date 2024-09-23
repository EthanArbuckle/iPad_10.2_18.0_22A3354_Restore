@implementation ContentCell

- (_TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002A2090();
}

- (_TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell *)sub_10029DEBC(a3, (uint64_t)a4, v6);
}

- (void)prepareForReuse
{
  void *v2;
  _TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell *v3;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell_titleLabel);
  v3 = self;
  objc_msgSend(v2, "setText:", 0);
  objc_msgSend(*(id *)((char *)&v3->super.super.super.super.isa+ OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell_checkmarkButton), "setImage:forStates:", *(Class *)((char *)&v3->super.super.super.super.isa+ OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell_notCheckedImage), 0);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;
  uint64_t v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ContentCell();
  v6 = v8.receiver;
  -[ContentCell setEditing:animated:](&v8, "setEditing:animated:", v5, v4);
  if (v5)
    v7 = 0;
  else
    v7 = 3;
  objc_msgSend(v6, "setSelectionStyle:", v7, v8.receiver, v8.super_class);
  sub_10029EA60();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell_checkmarkButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell_checkmarkImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell_notCheckedImage));
  sub_100007A28((uint64_t)self + OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell_contentData, &qword_10055AAC8);
}

@end
