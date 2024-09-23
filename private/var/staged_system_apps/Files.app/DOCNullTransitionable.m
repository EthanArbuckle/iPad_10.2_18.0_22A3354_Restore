@implementation DOCNullTransitionable

- (void)getTransitionControllerForURL:(id)a3 completionBlock:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  void (*v12)(_QWORD *, _QWORD);
  _TtC5Files21DOCNullTransitionable *v13;
  uint64_t v14;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = (void (*)(_QWORD *, _QWORD))v11[2];
  v13 = self;
  v12(v11, 0);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)getViewFor:(id)a3 waitForNewThumbnail:(BOOL)a4 :(id)a5
{
  _QWORD *v7;
  void (*v8)(_QWORD *, _QWORD, _QWORD);
  id v9;
  _TtC5Files21DOCNullTransitionable *v10;

  v7 = _Block_copy(a5);
  v8 = (void (*)(_QWORD *, _QWORD, _QWORD))v7[2];
  v9 = a3;
  v10 = self;
  v8(v7, 0, 0);
  _Block_release(v7);

}

- (void)getTransitionControllerForItem:(void *)a3 completionBlock:(void *)aBlock
{
  _QWORD *v6;
  void (*v7)(_QWORD *, _QWORD);
  id v8;
  id v9;

  v6 = _Block_copy(aBlock);
  v7 = (void (*)(_QWORD *, _QWORD))v6[2];
  v8 = a3;
  v9 = a1;
  v7(v6, 0);
  _Block_release(v6);

}

- (void)revealWithItems:(id)a3 selectEvenIfVisible:(BOOL)a4 completionBlock:(id)a5
{
  void (**v6)(void *, _QWORD);
  _TtC5Files21DOCNullTransitionable *v7;

  v6 = (void (**)(void *, _QWORD))_Block_copy(a5);
  v7 = self;
  sub_10012B03C(0xD000000000000028, 0x8000000100523CC0);
  v6[2](v6, 0);
  _Block_release(v6);

}

- (_TtC5Files21DOCNullTransitionable)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCNullTransitionable();
  return -[DOCNullTransitionable init](&v3, "init");
}

@end
