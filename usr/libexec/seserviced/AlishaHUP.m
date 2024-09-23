@implementation AlishaHUP

- (_TtC10seserviced9AlishaHUP)init
{
  return (_TtC10seserviced9AlishaHUP *)sub_1000EB4B4();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC10seserviced9AlishaHUP_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced9AlishaHUP_sessions));
}

- (void)pairingSession:(id)a3 requestedPairingWithDeviceAddress:(id)a4 forIntent:(unint64_t)a5 c192:(id)a6 r192:(id)a7 c256:(id)a8 r256:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  _TtC10seserviced9AlishaHUP *v38;
  id v39;

  v39 = a3;
  v14 = a4;
  v38 = self;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v35 = v20;
  v36 = v19;

  if (v15)
  {
    v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v15);
    v33 = v22;
    v34 = v21;

    if (v16)
      goto LABEL_3;
  }
  else
  {
    v33 = 0xF000000000000000;
    v34 = 0;
    if (v16)
    {
LABEL_3:
      v23 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a7);
      v31 = v24;
      v32 = v23;

      if (v17)
        goto LABEL_4;
LABEL_8:
      v25 = 0;
      v27 = 0xF000000000000000;
      if (v18)
        goto LABEL_5;
LABEL_9:
      v28 = 0;
      v30 = 0xF000000000000000;
      goto LABEL_10;
    }
  }
  v31 = 0xF000000000000000;
  v32 = 0;
  if (!v17)
    goto LABEL_8;
LABEL_4:
  v25 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a8);
  v27 = v26;

  if (!v18)
    goto LABEL_9;
LABEL_5:
  v28 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a9);
  v30 = v29;

LABEL_10:
  sub_1000EEF30(v39, v36, v35, (void *)a5, v34, v33, v32, v31, v25, v27, v28, v30);
  sub_10006B9B4(v28, v30);
  sub_10006B9B4(v25, v27);
  sub_10006B9B4(v32, v31);
  sub_10006B9B4(v34, v33);
  sub_100063CD0(v36, v35);

}

- (void)pairingSession:(id)a3 completedWithResult:(unint64_t)a4
{
  id v6;
  _TtC10seserviced9AlishaHUP *v7;

  v6 = a3;
  v7 = self;
  sub_1000F02F4(v6, a4);

}

@end
