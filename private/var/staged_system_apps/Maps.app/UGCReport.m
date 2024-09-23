@implementation UGCReport

- (UGCReviewedPlace)newReviewedPlace
{
  _TtC4Maps9UGCReport *v2;
  UGCReviewedPlace *v3;

  v2 = self;
  v3 = (UGCReviewedPlace *)sub_1000137C0();

  return v3;
}

- (void)setNewReviewedPlace:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps9UGCReport____lazy_storage___newReviewedPlace);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps9UGCReport____lazy_storage___newReviewedPlace) = (Class)a3;
  v3 = a3;

}

- (BOOL)isComplete
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps9UGCReport_initialForm), "isComplete");
}

- (FeedbackSubmissionManager)submitter
{
  return (FeedbackSubmissionManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                              + OBJC_IVAR____TtC4Maps9UGCReport_submitter));
}

- (void)setSubmitter:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps9UGCReport_submitter);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps9UGCReport_submitter) = (Class)a3;
  v3 = a3;

}

- (MKMapItem)mapItem
{
  return (MKMapItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC4Maps9UGCReport_mapItem));
}

- (void)setMapItem:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps9UGCReport_mapItem);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps9UGCReport_mapItem) = (Class)a3;
  v3 = a3;

}

- (BOOL)shouldMigrateRatingsWithICloud
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps9UGCReport_shouldMigrateRatingsWithICloud);
}

- (void)setShouldMigrateRatingsWithICloud:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps9UGCReport_shouldMigrateRatingsWithICloud) = a3;
}

- (_TtC4Maps9UGCReport)initWithReportType:(int64_t)a3 initialForm:(id)a4 mapItem:(id)a5 submitter:(id)a6
{
  id v9;
  id v10;
  id v11;
  _TtC4Maps9UGCReport *v12;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (_TtC4Maps9UGCReport *)sub_10001602C(a3, v9, v10, v11);

  return v12;
}

- (_TtC4Maps9UGCReport)init
{
  _TtC4Maps9UGCReport *result;

  result = (_TtC4Maps9UGCReport *)_swift_stdlib_reportUnimplementedInitializer("Maps.UGCReport", 14, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

- (void)submitRatingsAndPhotosSimultaneouslyUsingDSIDWithUploadPolicy:(int64_t)a3 progressBlock:(id)a4 completion:(id)a5
{
  void (*v8)(id);
  uint64_t (*v9)();
  uint64_t (*v10)();
  uint64_t v11;
  uint64_t v12;
  _TtC4Maps9UGCReport *v13;

  v8 = (void (*)(id))_Block_copy(a4);
  v9 = (uint64_t (*)())_Block_copy(a5);
  v10 = v9;
  if (!v8)
  {
    v11 = 0;
    if (v9)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  v11 = swift_allocObject(&unk_10119C130, 24, 7);
  *(_QWORD *)(v11 + 16) = v8;
  v8 = (void (*)(id))sub_100016B1C;
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v12 = swift_allocObject(&unk_10119C108, 24, 7);
  *(_QWORD *)(v12 + 16) = v10;
  v10 = sub_100016AA8;
LABEL_6:
  v13 = self;
  sub_100013C7C(a3, v8, v11, (void (*)(_QWORD, uint64_t))v10, v12);
  sub_10000BF74((uint64_t)v10, v12);
  sub_10000BF74((uint64_t)v8, v11);

}

- (void)submitRatingsAndPhotosWithUploadPolicy:(int64_t)a3 progressBlock:(id)a4 completion:(id)a5
{
  void (*v8)(id);
  uint64_t (*v9)();
  uint64_t (*v10)();
  uint64_t v11;
  uint64_t v12;
  _TtC4Maps9UGCReport *v13;

  v8 = (void (*)(id))_Block_copy(a4);
  v9 = (uint64_t (*)())_Block_copy(a5);
  v10 = v9;
  if (!v8)
  {
    v11 = 0;
    if (v9)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  v11 = swift_allocObject(&unk_10119BE38, 24, 7);
  *(_QWORD *)(v11 + 16) = v8;
  v8 = (void (*)(id))sub_10000BF64;
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v12 = swift_allocObject(&unk_10119BE10, 24, 7);
  *(_QWORD *)(v12 + 16) = v10;
  v10 = sub_100016AA8;
LABEL_6:
  v13 = self;
  sub_10001445C(a3, v8, v11, (uint64_t)v10, v12);
  sub_10000BF74((uint64_t)v10, v12);
  sub_10000BF74((uint64_t)v8, v11);

}

- (id)buildSubmissionParameters
{
  return sub_100015874(self, (uint64_t)a2, (SEL *)&selRef_fillSubmissionFields_);
}

- (id)buildRatingSubmissionParameters
{
  return sub_100015874(self, (uint64_t)a2, (SEL *)&selRef_fillSubmissionFieldsForRatings_);
}

- (id)buildPhotosSubmissionParameters
{
  id v3;
  _TtC4Maps9UGCReport *v4;
  id v5;
  id v6;
  id v7;

  v3 = objc_allocWithZone((Class)UGCSubmissionFields);
  v4 = self;
  v5 = objc_msgSend(v3, "init");
  v6 = objc_msgSend((id)objc_opt_self(UGCRatingsForm), "emptyRatingForm");
  objc_msgSend(v6, "fillSubmissionFields:", v5);
  objc_msgSend(*(id *)((char *)&v4->super.isa + OBJC_IVAR____TtC4Maps9UGCReport_initialForm), "fillSubmissionFieldsForPhotos:", v5);
  v7 = -[UGCReport buildSubmissionParametersWithSubmissionFields:](v4, "buildSubmissionParametersWithSubmissionFields:", v5);

  return v7;
}

- (id)buildSubmissionParametersWithSubmissionFields:(id)a3
{
  id v4;
  _TtC4Maps9UGCReport *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1000159DC(v4);

  return v6;
}

- (void)fetchCoarsenedDeviceLocationWithCompletion:(id)a3
{
  void *v4;
  _TtC4Maps9UGCReport *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_100016114((uint64_t)v5, (void (**)(_QWORD, _QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)persistSubmissionWithUpdatedReviewedPlace:(id)a3 communityIdentifier:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _TtC4Maps9UGCReport *v13;

  v8 = _Block_copy(a5);
  if (a4)
  {
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  v11 = swift_allocObject(&unk_10119BD20, 24, 7);
  *(_QWORD *)(v11 + 16) = v8;
  v12 = a3;
  v13 = self;
  sub_1000162C4(v12, v9, (uint64_t)a4, (uint64_t)sub_100016024, v11);

  swift_release(v11);
  swift_bridgeObjectRelease(a4);
}

@end
