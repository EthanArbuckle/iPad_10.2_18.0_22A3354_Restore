@implementation CHIntentHandler

- (id)handlerForIntent:(id)a3
{
  id v5;
  id v6;
  CHIntentHandler *v7;
  id v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  _OWORD v17[2];
  _QWORD v18[3];
  uint64_t v19;

  v5 = objc_allocWithZone((Class)type metadata accessor for IntentDispatcher(0, a2));
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, "init");
  v9 = objc_msgSend(v8, "handlerForIntent:", v6);

  if (v9)
  {
    _bridgeAnyObjectToAny(_:)(v17, v9);
    swift_unknownObjectRelease(v9);
  }
  else
  {
    memset(v17, 0, sizeof(v17));
  }
  sub_100003CFC((uint64_t)v17, (uint64_t)v18);

  v10 = v19;
  if (!v19)
    return 0;
  v11 = sub_100003D84(v18, v19);
  v12 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v11, v11);
  v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v12 + 16))(v14);
  v15 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v14, v10);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v10);
  sub_100003DA8(v18);
  return v15;
}

- (CHIntentHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IntentHandler();
  return -[CHIntentHandler init](&v3, "init");
}

@end
