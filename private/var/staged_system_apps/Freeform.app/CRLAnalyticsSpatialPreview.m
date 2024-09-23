@implementation CRLAnalyticsSpatialPreview

+ (void)sendSpatialPreviewAnalyticsWithPreviewItem:(id)a3 isSharedWithSpatialParticipants:(BOOL)a4
{
  _QWORD *v5;

  v5 = a3;
  sub_100DAEB7C(v5, a4);

}

- (_TtC8Freeform26CRLAnalyticsSpatialPreview)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLAnalyticsSpatialPreview();
  return -[CRLAnalyticsSpatialPreview init](&v3, "init");
}

@end
