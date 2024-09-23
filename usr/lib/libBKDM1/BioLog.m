@implementation BioLog

+ (_TtC5BKDM16BioLog)y
{
  swift_beginAccess();
  return (_TtC5BKDM16BioLog *)(id)qword_2579B7FA0;
}

- (void)dealloc
{
  _TtC5BKDM16BioLog *v2;
  objc_super v3;

  v2 = self;
  MGCancelNotifications();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for BioLog();
  -[BioLog dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t);

  swift_bridgeObjectRelease();

  v3 = (char *)self + OBJC_IVAR____TtC5BKDM16BioLog_logger;
  v4 = sub_24B7F34D8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC5BKDM16BioLog_logURL;
  v6 = sub_24B7F33D0();
  v7 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);

  v7((char *)self + OBJC_IVAR____TtC5BKDM16BioLog_calibrationDataStoreURL, v6);
  v7((char *)self + OBJC_IVAR____TtC5BKDM16BioLog_templateStoreURL, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24B7B2E38((uint64_t)self + OBJC_IVAR____TtC5BKDM16BioLog_state, _s5StateVMa);
  swift_bridgeObjectRelease();
  sub_24B7B2F44((uint64_t)self + OBJC_IVAR____TtC5BKDM16BioLog_sequenceURL, &qword_2579B0360);
  sub_24B7B2F44((uint64_t)self + OBJC_IVAR____TtC5BKDM16BioLog_sequence, &qword_2579B0368);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)logRemoveIdentity:(id)a3 options:(id)a4 client:(id)a5
{
  id v8;
  id v9;
  _TtC5BKDM16BioLog *v10;

  if (a4)
    sub_24B7F3514();
  v8 = a3;
  v9 = a5;
  v10 = self;
  sub_24B7B15FC(v8);

  swift_bridgeObjectRelease();
}

- (void)logRemoveAllIdentitiesWithUserID:(unsigned int)a3 options:(id)a4 client:(id)a5
{
  uint64_t v5;
  id v7;
  _TtC5BKDM16BioLog *v8;

  v5 = *(_QWORD *)&a3;
  v7 = a5;
  v8 = self;
  sub_24B7B17B4(v5);

}

- (void)logUnlockedStateWithIdentities:(id)a3
{
  char *v4;
  _TtC5BKDM16BioLog *v5;

  sub_24B7B2930(0, (unint64_t *)&qword_2579B0480);
  v4 = (char *)sub_24B7F3658();
  v5 = self;
  sub_24B7A0A80(v4);

  swift_bridgeObjectRelease();
}

- (void)logStatusMessage:(unint64_t)a3 data:(id)a4
{
  _TtC5BKDM16BioLog *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC5BKDM16BioLog *v11;

  if (a4)
  {
    v6 = self;
    v7 = a4;
    v8 = sub_24B7F3418();
    v10 = v9;

  }
  else
  {
    v11 = self;
    v8 = 0;
    v10 = 0xF000000000000000;
  }
  sub_24B7A2DF8(a3, v8, v10);
  sub_24B7B2484(v8, v10);

}

- (void)logSystemPowerWithMessage:(unsigned int)a3
{
  _TtC5BKDM16BioLog *v4;

  v4 = self;
  sub_24B7A5030(a3);

}

- (void)logSystemPowerWithState:(unint64_t)a3
{
  _TtC5BKDM16BioLog *v4;

  v4 = self;
  sub_24B7A53B4(a3);

}

- (void)logButtonState:(BOOL)a3
{
  _TtC5BKDM16BioLog *v4;

  v4 = self;
  sub_24B7A5564(a3);

}

- (void)logDisplayState:(BOOL)a3
{
  _TtC5BKDM16BioLog *v4;

  v4 = self;
  sub_24B7A571C(a3);

}

- (void)logSKSLockState:(unsigned __int16)a3 userID:(unsigned int)a4
{
  _TtC5BKDM16BioLog *v6;

  v6 = self;
  sub_24B7A58D4(a3, a4);

}

- (void)logThermalLevel:(int64_t)a3
{
  _TtC5BKDM16BioLog *v4;

  v4 = self;
  sub_24B7A5C6C(a3);

}

- (void)logBackgroundFingerDetectState:(BOOL)a3
{
  _TtC5BKDM16BioLog *v4;

  v4 = self;
  sub_24B7A5E1C(a3);

}

- (void)logEnrollStartWithUserID:(unsigned int)a3 client:(id)a4
{
  id v6;
  _TtC5BKDM16BioLog *v7;

  v6 = a4;
  v7 = self;
  sub_24B7A7A7C(a3, v6);

}

- (void)logMatchStartWithFilter:(id)a3 options:(id)a4 client:(id)a5
{
  uint64_t v6;
  uint64_t v8;
  id v9;
  _TtC5BKDM16BioLog *v10;

  v6 = (uint64_t)a4;
  if (!a3)
  {
    v8 = 0;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v8 = sub_24B7F3514();
  if (v6)
LABEL_3:
    v6 = sub_24B7F3514();
LABEL_4:
  v9 = a5;
  v10 = self;
  sub_24B7A7CCC(v8, v6, a5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)logFingerDetectStartWithOptions:(id)a3 client:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC5BKDM16BioLog *v8;

  if (a3)
    v6 = sub_24B7F3514();
  else
    v6 = 0;
  v7 = a4;
  v8 = self;
  sub_24B7A7FA0(v6, v7);

  swift_bridgeObjectRelease();
}

- (void)logCancelWithClient:(id)a3
{
  id v4;
  _TtC5BKDM16BioLog *v5;

  v4 = a3;
  v5 = self;
  sub_24B7A8E88(v4);

}

- (void)logEnrollResultWithIdentity:(id)a3
{
  id v5;
  _TtC5BKDM16BioLog *v6;

  v5 = a3;
  v6 = self;
  sub_24B7A90C8(a3);

}

- (void)logMatchResultWithIdentity:(id)a3 details:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC5BKDM16BioLog *v8;

  v6 = sub_24B7F3514();
  v7 = a3;
  v8 = self;
  sub_24B7A930C(a3, v6);

  swift_bridgeObjectRelease();
}

- (void)logSensorRecoveryReason:(unint64_t)a3
{
  _TtC5BKDM16BioLog *v4;

  v4 = self;
  sub_24B7A9590(a3);

}

- (void)logCaptureWithData:(id)a3 id:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _TtC5BKDM16BioLog *v10;

  v6 = a3;
  v10 = self;
  v7 = sub_24B7F3418();
  v9 = v8;

  sub_24B7A98F0(v7, v9, a4);
  sub_24B7B18E0(v7, v9);

}

- (void)logImageWithData:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 id:(unint64_t)a6 sourceUUID:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  _TtC5BKDM16BioLog *v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579B0388);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = a3;
  v17 = self;
  v18 = a7;
  v19 = sub_24B7F3418();
  v21 = v20;

  if (v18)
  {
    sub_24B7F3478();

    v22 = sub_24B7F3490();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v15, 0, 1, v22);
  }
  else
  {
    v23 = sub_24B7F3490();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v15, 1, 1, v23);
  }
  sub_24B7AB308(v19, v21, a4, a5, a6, (uint64_t)v15);
  sub_24B7B18E0(v19, v21);

  sub_24B7B2F44((uint64_t)v15, &qword_2579B0388);
}

- (_TtC5BKDM16BioLog)init
{
  _TtC5BKDM16BioLog *result;

  result = (_TtC5BKDM16BioLog *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

+ (void)updateLog
{
  id v0;
  void *v1;
  unsigned int v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;

  if (qword_2579B1680 != -1)
    swift_once();
  if (os_variant_has_internal_diagnostics()
    && (v0 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance),
        v1 = (void *)sub_24B7F3538(),
        v2 = objc_msgSend(v0, sel_BOOLForKey_, v1),
        v0,
        v1,
        v2))
  {
    swift_beginAccess();
    if (qword_2579B7FA0)
    {
      v3 = (id)qword_2579B7FA0;
      sub_24B79D58C();
    }
    else
    {
      v6 = objc_allocWithZone((Class)type metadata accessor for BioLog());
      v7 = sub_24B79AD7C(0x800000024B802630);
      v3 = (id)qword_2579B7FA0;
      qword_2579B7FA0 = v7;
    }
  }
  else
  {
    swift_beginAccess();
    v3 = (id)qword_2579B7FA0;
    qword_2579B7FA0 = 0;
  }

  v4 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_updateBioLogState);

  }
  else
  {
    __break(1u);
  }
}

@end
