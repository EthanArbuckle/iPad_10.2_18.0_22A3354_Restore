@implementation PodcastsMediaLibrary.TaskMetricsDelegate

- (_TtCC18PodcastsFoundation20PodcastsMediaLibrary19TaskMetricsDelegate)init
{
  _TtCC18PodcastsFoundation20PodcastsMediaLibrary19TaskMetricsDelegate *v2;
  void *v3;
  _TtCC18PodcastsFoundation20PodcastsMediaLibrary19TaskMetricsDelegate *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCC18PodcastsFoundation20PodcastsMediaLibrary19TaskMetricsDelegate_strongRef) = 0;
  v6.receiver = self;
  v6.super_class = (Class)_s19TaskMetricsDelegateCMa();
  v2 = -[PodcastsMediaLibrary.TaskMetricsDelegate init](&v6, sel_init);
  v3 = *(Class *)((char *)&v2->super.isa
                + OBJC_IVAR____TtCC18PodcastsFoundation20PodcastsMediaLibrary19TaskMetricsDelegate_strongRef);
  *(Class *)((char *)&v2->super.isa
           + OBJC_IVAR____TtCC18PodcastsFoundation20PodcastsMediaLibrary19TaskMetricsDelegate_strongRef) = (Class)v2;
  v4 = v2;

  return v4;
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtCC18PodcastsFoundation20PodcastsMediaLibrary19TaskMetricsDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1A923D004(v10);

}

- (void).cxx_destruct
{
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;

  v2 = *(char **)((char *)&self->super.isa
                + OBJC_IVAR____TtCC18PodcastsFoundation20PodcastsMediaLibrary19TaskMetricsDelegate_strongRef);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCC18PodcastsFoundation20PodcastsMediaLibrary19TaskMetricsDelegate_strongRef) = 0;
  v3 = v2;
  if (v2)
  {
    while (1)
    {
      v6 = v3;
      if (!swift_isUniquelyReferenced())
        break;
      v4 = *(char **)&v6[OBJC_IVAR____TtCC18PodcastsFoundation20PodcastsMediaLibrary19TaskMetricsDelegate_strongRef];
      v5 = v4;

      v3 = v4;
      if (!v4)
        goto LABEL_6;
    }
    v3 = v6;
  }
LABEL_6:

}

@end
