@implementation DIPHTTPSessionTaskDelegate

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void (**v21)(void *, Class);
  int v22;
  id v23;
  _TtC8coreidvdP33_0866DFB7931A54BC66BDAA51B582B51526DIPHTTPSessionTaskDelegate *v24;
  Class isa;
  id v26;
  id v27;
  id v28;
  _TtC8coreidvdP33_0866DFB7931A54BC66BDAA51B582B51526DIPHTTPSessionTaskDelegate *v29;

  v28 = a5;
  v29 = self;
  v11 = sub_100004828((uint64_t *)&unk_100643FF0);
  v12 = __chkstk_darwin(v11);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v26 - v15;
  v17 = type metadata accessor for URLRequest(0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)&v26 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = (void (**)(void *, Class))_Block_copy(a7);
  static URLRequest._unconditionallyBridgeFromObjectiveC(_:)(a6);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v17);
  sub_1004ECF28((uint64_t)v16, (uint64_t)v14);
  v22 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v14, 1, v17);
  v27 = a3;
  v26 = a4;
  v23 = v28;
  v24 = v29;
  isa = 0;
  if (v22 != 1)
  {
    isa = URLRequest._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v18 + 8))(v14, v17);
  }
  v21[2](v21, isa);

  sub_100008030((uint64_t)v16, (uint64_t *)&unk_100643FF0);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
}

- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4
{
  id v6;
  id v7;
  _TtC8coreidvdP33_0866DFB7931A54BC66BDAA51B582B51526DIPHTTPSessionTaskDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1004EC7E4(v7);

}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6;
  _TtC8coreidvdP33_0866DFB7931A54BC66BDAA51B582B51526DIPHTTPSessionTaskDelegate *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_1004ECB68((uint64_t)a4);

}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC8coreidvdP33_0866DFB7931A54BC66BDAA51B582B51526DIPHTTPSessionTaskDelegate *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_1004ECDCC(v10, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (_TtC8coreidvdP33_0866DFB7931A54BC66BDAA51B582B51526DIPHTTPSessionTaskDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[DIPHTTPSessionTaskDelegate init](&v3, "init");
}

@end
