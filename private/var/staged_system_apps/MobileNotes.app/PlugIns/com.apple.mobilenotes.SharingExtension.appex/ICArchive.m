@implementation ICArchive

+ (id)packageExtension
{
  uint64_t v2;
  NSString v3;

  if (qword_1000EB630 != -1)
    swift_once(&qword_1000EB630, sub_10002F50C);
  v2 = *(_QWORD *)algn_1000F6918;
  swift_bridgeObjectRetain(*(_QWORD *)algn_1000F6918);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return v3;
}

@end
