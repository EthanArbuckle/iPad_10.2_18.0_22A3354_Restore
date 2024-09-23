@implementation MSVLyricsAgent

- (BOOL)isEqual:(id)a3
{
  MSVLyricsAgent *v5;
  uint64_t v6;
  uint64_t v7;
  MSVLyricsAgent *v8;
  char v9;
  _OWORD v11[2];

  if (a3)
  {
    v5 = self;
    v7 = swift_unknownObjectRetain(a3, v6);
    _bridgeAnyObjectToAny(_:)(v11, v7);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v8 = self;
  }
  v9 = MSVLyricsAgent.isEqual(_:)((uint64_t)v11);

  sub_10004FF60((uint64_t)v11, &qword_1011E0700);
  return v9 & 1;
}

@end
