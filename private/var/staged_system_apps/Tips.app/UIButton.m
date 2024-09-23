@implementation UIButton

- (void)setupActionButtonConfigurationWithTitle:(id)a3 isEnabled:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  UIButton *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a4;
  v7 = sub_1000187A4(&qword_1000B4940);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;
  v13 = (void *)objc_opt_self(UIColor);
  v14 = self;
  v15 = objc_msgSend(v13, "systemBlueColor");
  v16 = objc_msgSend(v13, "secondarySystemBackgroundColor");
  sub_100037FEC(v10, v12, v15, v16, 0, 0, v4);

  v17 = type metadata accessor for UIButton.Configuration(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v9, 0, 1, v17);
  UIButton.configuration.setter(v9);

  swift_bridgeObjectRelease(v12);
}

- (void)setupActionButtonConfigurationWithTitle:(id)a3 foregroundColor:(id)a4 backgroundColor:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  UIButton *v17;
  uint64_t v18;
  uint64_t v19;

  v9 = sub_1000187A4(&qword_1000B4940);
  __chkstk_darwin(v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v14 = v13;
  v15 = a4;
  v16 = a5;
  v17 = self;
  sub_100037FEC(v12, v14, v15, v16, 0, 0, 1);
  v18 = type metadata accessor for UIButton.Configuration(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v11, 0, 1, v18);
  UIButton.configuration.setter(v11);

  swift_bridgeObjectRelease(v14);
}

- (void)setupActionButtonConfigurationWithTitle:(id)a3 foregroundColor:(id)a4 backgroundColor:(id)a5 symbolName:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  UIButton *v22;
  uint64_t v23;
  uint64_t v24;

  v11 = sub_1000187A4(&qword_1000B4940);
  __chkstk_darwin(v11);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v16 = v15;
  v17 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v19 = v18;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_100037FEC(v14, v16, v20, v21, v17, v19, 1);
  v23 = type metadata accessor for UIButton.Configuration(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v13, 0, 1, v23);
  UIButton.configuration.setter(v13);

  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v19);
}

- (void)setupActionButtonConfigurationWithTitle:(id)a3 foregroundColor:(id)a4 backgroundColor:(id)a5 symbolName:(id)a6 fontWeight:(double)a7
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  UIButton *v23;
  uint64_t v24;
  UILabel *v25;
  uint64_t v26;

  v12 = sub_1000187A4(&qword_1000B4940);
  __chkstk_darwin(v12);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v17 = v16;
  v18 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v20 = v19;
  v21 = a4;
  v22 = a5;
  v23 = self;
  sub_100037FEC(v15, v17, v21, v22, v18, v20, 1);
  v24 = type metadata accessor for UIButton.Configuration(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v14, 0, 1, v24);
  UIButton.configuration.setter(v14);
  v25 = -[UIButton titleLabel](v23, "titleLabel");
  -[UILabel setAdjustsFontForContentSizeCategory:](v25, "setAdjustsFontForContentSizeCategory:", 1);

  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v20);

}

- (void)setupReplayButtonConfiguration
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  UIButton *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = sub_1000187A4(&qword_1000B4940);
  __chkstk_darwin(v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_100038B50((uint64_t)v5);
  v7 = type metadata accessor for UIButton.Configuration(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5, 0, 1, v7);
  UIButton.configuration.setter(v5);

}

@end
