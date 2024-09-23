@implementation APPCMediaMetricsHelper

- (id)visiblePercentageChanged
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___APPCMediaMetricsHelper_visiblePercentageChanged);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B1230368;
  aBlock[3] = &unk_1E62E41C8;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void)setVisiblePercentageChanged:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1B1235754;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___APPCMediaMetricsHelper_visiblePercentageChanged);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1B11E40EC(v7);
}

- (int64_t)visiblePercentage
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___APPCMediaMetricsHelper__visiblePercentage);
}

- (void)setVisiblePercentage:(int64_t)a3
{
  APPCMediaMetricsHelper *v4;

  v4 = self;
  sub_1B1230690(a3);

}

- (void)registerHandlerForAllMetricsWithClosure:(id)a3
{
  void *v4;
  uint64_t v5;
  APPCMediaMetricsHelper *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1B1230948((uint64_t)sub_1B1235728, v5);

  swift_release();
}

- (void)removeHandler
{
  APPCMediaMetricsHelper *v2;

  v2 = self;
  sub_1B1230B44();

}

- (void)mediaLoaded
{
  APPCMediaMetricsHelper *v2;

  v2 = self;
  sub_1B12319D8();

}

- (void)videoChosenWithVideoWidth:(float)a3 videoHeight:(float)a4
{
  APPCMediaMetricsHelper *v4;

  v4 = self;
  sub_1B1231F64();

}

- (void)videoChosen
{
  APPCMediaMetricsHelper *v2;

  v2 = self;
  sub_1B1231F64();

}

- (void)mediaPlayedAtPosition:(double)a3
{
  APPCMediaMetricsHelper *v4;

  v4 = self;
  sub_1B1232290(a3);

}

- (void)mediaPausedAtPosition:(double)a3
{
  APPCMediaMetricsHelper *v4;

  v4 = self;
  sub_1B1232644(a3);

}

- (void)mediaSkippedAtPosition:(double)a3
{
  APPCMediaMetricsHelper *v4;

  v4 = self;
  sub_1B12329E8(a3);

}

- (void)mediaVolumeChangedAtPosition:(double)a3 volume:(float)a4
{
  APPCMediaMetricsHelper *v6;

  v6 = self;
  sub_1B1232CF0(a3, a4);

}

- (void)mediaExpandedAtPosition:(double)a3 fullScreen:(BOOL)a4
{
  APPCMediaMetricsHelper *v6;

  v6 = self;
  sub_1B1233150(a4, a3);

}

- (void)mediaContractedAtPosition:(double)a3 fullScreen:(BOOL)a4
{
  APPCMediaMetricsHelper *v6;

  v6 = self;
  sub_1B1233540(a4, a3);

}

- (void)mediaShowControlsAtPosition:(double)a3
{
  APPCMediaMetricsHelper *v4;

  v4 = self;
  sub_1B1233930(a3);

}

- (void)mediaStarted
{
  APPCMediaMetricsHelper *v2;

  v2 = self;
  sub_1B1233CD4();

}

- (void)mediaFinished
{
  APPCMediaMetricsHelper *v2;

  v2 = self;
  sub_1B1233E84(100);

}

- (void)mediaProgress:(int64_t)a3
{
  APPCMediaMetricsHelper *v4;

  v4 = self;
  sub_1B1233E84(a3);

}

- (void)mediaUserExitedArticle
{
  -[APPCMediaMetricsHelper mediaComplete](self, sel_mediaComplete);
}

- (APPCMediaMetricsHelper)init
{
  APPCMediaMetricsHelper *result;

  result = (APPCMediaMetricsHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_1B11DF5D8((uint64_t)self + OBJC_IVAR___APPCMediaMetricsHelper_videoURL, (uint64_t *)&unk_1ED391290);
  sub_1B11DF5D8((uint64_t)self + OBJC_IVAR___APPCMediaMetricsHelper_mediaStartedTimestamp, (uint64_t *)&unk_1ED391840);
  sub_1B121CA90((uint64_t)self + OBJC_IVAR___APPCMediaMetricsHelper_promotedContent);
  sub_1B11E40EC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___APPCMediaMetricsHelper_visiblePercentageChanged));
}

- (void)mediaComplete
{
  if (*((_BYTE *)&self->super.isa + OBJC_IVAR___APPCMediaMetricsHelper_mediaHasStarted) == 1)
    objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___APPCMediaMetricsHelper_primitiveCreator), sel_recordMetric_forPurpose_properties_internalProperties_order_options_, 77003, -1, 0, 0, 0, 0);
}

@end
