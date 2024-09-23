@implementation MSVLyricsAgent

- (BOOL)isEqual:(id)a3
{
  MSVLyricsAgent *v5;
  uint64_t v6;
  MSVLyricsAgent *v7;
  char v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = MSVLyricsAgent.isEqual(_:)((uint64_t)v10);

  sub_100008758((uint64_t)v10, &qword_10049B130);
  return v8 & 1;
}

@end
