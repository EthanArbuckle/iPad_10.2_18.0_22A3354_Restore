@implementation OmniSearchService

- (_TtC10OmniSearch17OmniSearchService)init
{
  return (_TtC10OmniSearch17OmniSearchService *)OmniSearchService.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10OmniSearch17OmniSearchService_searchResultRanker);
  outlined destroy of MobileSMSDocument?((uint64_t)self + OBJC_IVAR____TtC10OmniSearch17OmniSearchService_requestRouter, &demangling cache variable for type metadata for RequestRouting?);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10OmniSearch17OmniSearchService_answerComposer);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed String) -> ())?(*(uint64_t *)((char *)&self->super.isa
                                                                                            + OBJC_IVAR____TtC10OmniSearch17OmniSearchService_intermediateCallback));
}

@end
