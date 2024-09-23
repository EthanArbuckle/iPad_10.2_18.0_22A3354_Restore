@implementation SectionHeader

- (_TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2313SectionHeader)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2313SectionHeader *result;

  v4 = (char *)self
     + OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2313SectionHeader_firstContentDataInSection;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2313SectionHeader *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x726F707075736E75, 0xEB00000000646574, "Podcasts/MTTestActionContentPicker.swift", 40, 2, 495, 0);
  __break(1u);
  return result;
}

- (_TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2313SectionHeader)initWithReuseIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (_TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2313SectionHeader *)sub_10029F488(v3, v4);
}

- (void).cxx_destruct
{
  sub_100007A28((uint64_t)self+ OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2313SectionHeader_firstContentDataInSection, &qword_10055AAC8);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2313SectionHeader_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2313SectionHeader_podcastTitleLabel));
}

@end
