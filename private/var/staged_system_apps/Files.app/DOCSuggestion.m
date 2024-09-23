@implementation DOCSuggestion

- (_TtC5Files13DOCSuggestion)init
{
  return (_TtC5Files13DOCSuggestion *)sub_1000DA448();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->matchingInputRange[OBJC_IVAR____TtC5Files13DOCSuggestion_title]);
  sub_10007EB54((uint64_t)self + OBJC_IVAR____TtC5Files13DOCSuggestion_representedObject);
  swift_bridgeObjectRelease(*(_QWORD *)&self->matchingInputRange[OBJC_IVAR____TtC5Files13DOCSuggestion_atomTitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->matchingInputRange[OBJC_IVAR____TtC5Files13DOCSuggestion_textReplacement]);

  sub_100087534(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files13DOCSuggestion_customImageGenerator), *(_QWORD *)&self->matchingInputRange[OBJC_IVAR____TtC5Files13DOCSuggestion_customImageGenerator]);
  sub_100087534(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files13DOCSuggestion_customAtomImageGenerator), *(_QWORD *)&self->matchingInputRange[OBJC_IVAR____TtC5Files13DOCSuggestion_customAtomImageGenerator]);
}

@end
