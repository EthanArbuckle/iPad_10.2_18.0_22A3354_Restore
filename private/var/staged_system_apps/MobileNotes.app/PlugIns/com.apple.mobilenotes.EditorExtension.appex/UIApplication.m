@implementation UIApplication

- (void)my_openURL:(id)a3 originatingView:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  id v16;
  UIApplication *v17;
  NSURL *v18;
  uint64_t v19;

  v10 = type metadata accessor for URL(0, a2, a3, a4, a5);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin();
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (v14)
  {
    v15 = swift_allocObject(&unk_100010B50, 24, 7);
    *(_QWORD *)(v15 + 16) = v14;
    v14 = sub_10000D3DC;
  }
  else
  {
    v15 = 0;
  }
  v16 = a4;
  v17 = self;
  sub_10000C438((uint64_t)v16, (uint64_t)v14, v15, v18);
  sub_10000D308((uint64_t)v14, v15);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

@end
