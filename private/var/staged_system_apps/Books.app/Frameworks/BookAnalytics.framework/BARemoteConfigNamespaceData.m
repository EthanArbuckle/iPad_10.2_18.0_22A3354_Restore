@implementation BARemoteConfigNamespaceData

- (BARemoteConfigNamespaceData)init
{
  BARemoteConfigNamespaceData *result;

  result = (BARemoteConfigNamespaceData *)_swift_stdlib_reportUnimplementedInitializer("BookAnalytics.BridgedRemoteConfigNamespaceData", 46, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->name[OBJC_IVAR___BARemoteConfigNamespaceData_name]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BARemoteConfigNamespaceData_treatmentIDs));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BARemoteConfigNamespaceData_segmentIDs));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BARemoteConfigNamespaceData_segmentSetIDs));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___BARemoteConfigNamespaceData_previousTreatmentIDs));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___BARemoteConfigNamespaceData_previousSegmentIDs));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___BARemoteConfigNamespaceData_previousSegmentSetIDs));
}

@end
