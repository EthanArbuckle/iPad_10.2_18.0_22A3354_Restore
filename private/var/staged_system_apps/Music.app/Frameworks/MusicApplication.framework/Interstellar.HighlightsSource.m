@implementation Interstellar.HighlightsSource

- (_TtCO16MusicApplication12Interstellar16HighlightsSource)init
{
  return (_TtCO16MusicApplication12Interstellar16HighlightsSource *)sub_9A5814();
}

- (void)highlightCenter:(id)a3 didRemoveHighlights:(id)a4
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtCO16MusicApplication12Interstellar16HighlightsSource *v11;
  id v12;

  v6 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtCO16MusicApplication12Interstellar16HighlightsSource_resolver);
  v7 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCO16MusicApplication12Interstellar16HighlightsSource_resolver);
  v8 = *(_QWORD *)&self->center[OBJC_IVAR____TtCO16MusicApplication12Interstellar16HighlightsSource_resolver];
  v9 = *(_QWORD *)&self->isSeeAllButtonHidden[OBJC_IVAR____TtCO16MusicApplication12Interstellar16HighlightsSource_resolver];
  v6[1] = 0;
  v6[2] = 0;
  *v6 = 0;
  v10 = a3;
  v12 = a4;
  v11 = self;
  sub_9AA964(v7, v8, v9);
  sub_9A74AC();

}

- (void)highlightCenterDidAddHighlights:(void *)a3
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  char *v9;

  v4 = &a1[OBJC_IVAR____TtCO16MusicApplication12Interstellar16HighlightsSource_resolver];
  v5 = *(_QWORD *)&a1[OBJC_IVAR____TtCO16MusicApplication12Interstellar16HighlightsSource_resolver];
  v6 = *(_QWORD *)&a1[OBJC_IVAR____TtCO16MusicApplication12Interstellar16HighlightsSource_resolver + 8];
  v7 = *(_QWORD *)&a1[OBJC_IVAR____TtCO16MusicApplication12Interstellar16HighlightsSource_resolver + 16];
  *((_QWORD *)v4 + 1) = 0;
  *((_QWORD *)v4 + 2) = 0;
  *(_QWORD *)v4 = 0;
  v8 = a3;
  v9 = a1;
  sub_9AA964(v5, v6, v7);
  sub_9A74AC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCO16MusicApplication12Interstellar16HighlightsSource_center));
  sub_9AA964(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtCO16MusicApplication12Interstellar16HighlightsSource_resolver), *(_QWORD *)&self->center[OBJC_IVAR____TtCO16MusicApplication12Interstellar16HighlightsSource_resolver], *(_QWORD *)&self->isSeeAllButtonHidden[OBJC_IVAR____TtCO16MusicApplication12Interstellar16HighlightsSource_resolver]);
  sub_56024((uint64_t)self + OBJC_IVAR____TtCO16MusicApplication12Interstellar16HighlightsSource_importResultAssertions, (uint64_t *)&unk_14AD640);
}

@end
