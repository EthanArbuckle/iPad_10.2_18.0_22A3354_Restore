@implementation JSStoreFlowSegue

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;

  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__url;
  v4 = sub_100007E8C(&qword_1011E9858);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v6 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__sourceApplicationBundleIdentifier;
  v7 = sub_100007E8C(&qword_10119F090);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__referrerURL, v4);
  v8 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__userInfo;
  v9 = sub_100007E8C(&qword_1011EA2F8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__scriptingMetricsOverlay;
  v11 = sub_100007E8C(&qword_1011EA160);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  v12 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__didCompleteSubscriptionPurchase;
  v13 = sub_100007E8C(&qword_1011EA310);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  v14 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__subscriptionStatus;
  v15 = sub_100007E8C(&qword_1011EA328);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
  v16 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__didFinishLinkingWithCarrier;
  v17 = sub_100007E8C((uint64_t *)&unk_1011A3380);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);
}

@end
