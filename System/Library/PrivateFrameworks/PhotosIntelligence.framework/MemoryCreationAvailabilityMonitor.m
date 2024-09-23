@implementation MemoryCreationAvailabilityMonitor

- (_TtC18PhotosIntelligence33MemoryCreationAvailabilityMonitor)init
{
  MemoryCreationAvailabilityMonitor.init()();
}

- (void).cxx_destruct
{
  uint64_t v3;

  sub_243EB11CC((uint64_t)self + OBJC_IVAR____TtC18PhotosIntelligence33MemoryCreationAvailabilityMonitor_configuration);
  OUTLINED_FUNCTION_83_15(OBJC_IVAR____TtC18PhotosIntelligence33MemoryCreationAvailabilityMonitor_photoLibrary);
  OUTLINED_FUNCTION_83_15(OBJC_IVAR____TtC18PhotosIntelligence33MemoryCreationAvailabilityMonitor__listeners);
  OUTLINED_FUNCTION_83_15(OBJC_IVAR____TtC18PhotosIntelligence33MemoryCreationAvailabilityMonitor_workQueue);
  swift_unknownObjectRelease();
  v3 = OUTLINED_FUNCTION_122_10();
  OUTLINED_FUNCTION_37_16(*(_QWORD *)(v3 - 8));
  swift_release();
  OUTLINED_FUNCTION_83_15(OBJC_IVAR____TtC18PhotosIntelligence33MemoryCreationAvailabilityMonitor_processingAvailabilityReporter);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18PhotosIntelligence33MemoryCreationAvailabilityMonitor__processingAvailability));
}

@end
