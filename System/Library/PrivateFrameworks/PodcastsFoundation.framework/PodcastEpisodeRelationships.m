@implementation PodcastEpisodeRelationships

- (_TtC18PodcastsFoundation27PodcastEpisodeRelationships)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation27PodcastEpisodeRelationships_podcast) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC18PodcastsFoundation27PodcastEpisodeRelationships_playbackPosition) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation27PodcastEpisodeRelationships_transcripts) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[PodcastEpisodeRelationships init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18PodcastsFoundation27PodcastEpisodeRelationships_podcast));
  swift_bridgeObjectRelease();
}

@end
