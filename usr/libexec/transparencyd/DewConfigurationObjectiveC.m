@implementation DewConfigurationObjectiveC

- (_TtC13transparencyd26DewConfigurationObjectiveC)init
{
  uint64_t v3;
  uint64_t v4;
  _TtC13transparencyd26DewConfigurationObjectiveC *v5;
  objc_super v7;

  v3 = type metadata accessor for DewConfiguration();
  v4 = swift_allocObject(v3, 32, 7);
  v5 = self;
  *(_QWORD *)(v4 + 16) = sub_10006FDB0((uint64_t)&_swiftEmptyArrayStorage);
  *(_QWORD *)(v4 + 24) = 0;
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_config) = (Class)v4;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for DewConfigurationObjectiveC();
  return -[DewConfigurationObjectiveC init](&v7, "init");
}

- (_TtC13transparencyd26DewConfigurationObjectiveC)initWithPublicCloudDatabase:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  _TtC13transparencyd26DewConfigurationObjectiveC *v8;
  _TtC13transparencyd26DewConfigurationObjectiveC *v9;
  objc_super v11;

  v5 = type metadata accessor for DewConfiguration();
  v6 = swift_allocObject(v5, 32, 7);
  v7 = a3;
  v8 = self;
  *(_QWORD *)(v6 + 16) = sub_10006FDB0((uint64_t)&_swiftEmptyArrayStorage);
  *(_QWORD *)(v6 + 24) = a3;
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_config) = (Class)v6;

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for DewConfigurationObjectiveC();
  v9 = -[DewConfigurationObjectiveC init](&v11, "init");

  return v9;
}

- (double)selfValidationEnrollment
{
  uint64_t v2;
  uint64_t v3;
  _TtC13transparencyd26DewConfigurationObjectiveC *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(double *__return_ptr, _QWORD *, ValueMetadata *, _UNKNOWN **);
  _QWORD v10[7];
  __int128 v11;
  uint64_t v12;
  double v13;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_config);
  v3 = qword_1002A4B60;
  v4 = self;
  swift_retain(v2);
  if (v3 != -1)
    swift_once(&qword_1002A4B60, sub_100070D30);
  v5 = unk_1002A7C90;
  v6 = unk_1002A7CA0;
  v7 = unk_1002A7CB0;
  v10[0] = qword_1002A7C88;
  v10[1] = unk_1002A7C90;
  v10[2] = qword_1002A7C98;
  v10[3] = unk_1002A7CA0;
  v10[4] = qword_1002A7CA8;
  v10[5] = unk_1002A7CB0;
  v10[6] = qword_1002A7CB8;
  v11 = unk_1002A7CC0;
  v12 = qword_1002A7CD0;
  v8 = *(void (**)(double *__return_ptr, _QWORD *, ValueMetadata *, _UNKNOWN **))(*(_QWORD *)v2 + 128);
  swift_bridgeObjectRetain(unk_1002A7C90);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  v8(&v13, v10, &type metadata for DewConfigurationTimeInterval, &off_10029F070);

  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v5);
  swift_release(v2);
  return v13;
}

- (void)overrideSelfValidationEnrollmentWithTimeInterval:(double)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC13transparencyd26DewConfigurationObjectiveC *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(_QWORD *, double *, ValueMetadata *, _UNKNOWN **);
  double v11;
  _QWORD v12[7];
  __int128 v13;
  uint64_t v14;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_config);
  v5 = qword_1002A4B60;
  v6 = self;
  swift_retain(v4);
  if (v5 != -1)
    swift_once(&qword_1002A4B60, sub_100070D30);
  v7 = unk_1002A7C90;
  v8 = unk_1002A7CA0;
  v9 = unk_1002A7CB0;
  v12[0] = qword_1002A7C88;
  v12[1] = unk_1002A7C90;
  v12[2] = qword_1002A7C98;
  v12[3] = unk_1002A7CA0;
  v12[4] = qword_1002A7CA8;
  v12[5] = unk_1002A7CB0;
  v12[6] = qword_1002A7CB8;
  v13 = unk_1002A7CC0;
  v14 = qword_1002A7CD0;
  v11 = a3;
  v10 = *(void (**)(_QWORD *, double *, ValueMetadata *, _UNKNOWN **))(*(_QWORD *)v4 + 136);
  swift_bridgeObjectRetain(unk_1002A7C90);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  v10(v12, &v11, &type metadata for DewConfigurationTimeInterval, &off_10029F070);

  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v7);
  swift_release(v4);
}

- (double)coreDataInitialDelaySync
{
  uint64_t v2;
  uint64_t v3;
  _TtC13transparencyd26DewConfigurationObjectiveC *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(double *__return_ptr, _QWORD *, ValueMetadata *, _UNKNOWN **);
  _QWORD v10[7];
  __int128 v11;
  uint64_t v12;
  double v13;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_config);
  v3 = qword_1002A4B68;
  v4 = self;
  swift_retain(v2);
  if (v3 != -1)
    swift_once(&qword_1002A4B68, sub_100070E78);
  v5 = unk_1002A7CE0;
  v6 = unk_1002A7CF0;
  v7 = unk_1002A7D00;
  v10[0] = qword_1002A7CD8;
  v10[1] = unk_1002A7CE0;
  v10[2] = qword_1002A7CE8;
  v10[3] = unk_1002A7CF0;
  v10[4] = qword_1002A7CF8;
  v10[5] = unk_1002A7D00;
  v10[6] = qword_1002A7D08;
  v11 = *(_OWORD *)algn_1002A7D10;
  v12 = qword_1002A7D20;
  v8 = *(void (**)(double *__return_ptr, _QWORD *, ValueMetadata *, _UNKNOWN **))(*(_QWORD *)v2 + 128);
  swift_bridgeObjectRetain(unk_1002A7CE0);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  v8(&v13, v10, &type metadata for DewConfigurationTimeInterval, &off_10029F070);

  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v5);
  swift_release(v2);
  return v13;
}

- (void)overrideCoreDataInitialDelaySyncWithTimeInterval:(double)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC13transparencyd26DewConfigurationObjectiveC *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(_QWORD *, double *, ValueMetadata *, _UNKNOWN **);
  double v11;
  _QWORD v12[7];
  __int128 v13;
  uint64_t v14;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_config);
  v5 = qword_1002A4B68;
  v6 = self;
  swift_retain(v4);
  if (v5 != -1)
    swift_once(&qword_1002A4B68, sub_100070E78);
  v7 = unk_1002A7CE0;
  v8 = unk_1002A7CF0;
  v9 = unk_1002A7D00;
  v12[0] = qword_1002A7CD8;
  v12[1] = unk_1002A7CE0;
  v12[2] = qword_1002A7CE8;
  v12[3] = unk_1002A7CF0;
  v12[4] = qword_1002A7CF8;
  v12[5] = unk_1002A7D00;
  v12[6] = qword_1002A7D08;
  v13 = *(_OWORD *)algn_1002A7D10;
  v14 = qword_1002A7D20;
  v11 = a3;
  v10 = *(void (**)(_QWORD *, double *, ValueMetadata *, _UNKNOWN **))(*(_QWORD *)v4 + 136);
  swift_bridgeObjectRetain(unk_1002A7CE0);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  v10(v12, &v11, &type metadata for DewConfigurationTimeInterval, &off_10029F070);

  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v7);
  swift_release(v4);
}

- (unint64_t)validatePendingURILimit
{
  uint64_t v2;
  uint64_t v3;
  _TtC13transparencyd26DewConfigurationObjectiveC *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(unint64_t *__return_ptr, _QWORD *, ValueMetadata *, _UNKNOWN **);
  _QWORD v10[6];
  __int128 v11;
  __int128 v12;
  unint64_t v13;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_config);
  v3 = qword_1002A4B70;
  v4 = self;
  swift_retain(v2);
  if (v3 != -1)
    swift_once(&qword_1002A4B70, sub_100070FC4);
  v5 = unk_1002A7D30;
  v6 = unk_1002A7D40;
  v7 = unk_1002A7D50;
  v10[0] = qword_1002A7D28;
  v10[1] = unk_1002A7D30;
  v10[2] = qword_1002A7D38;
  v10[3] = unk_1002A7D40;
  v10[4] = qword_1002A7D48;
  v10[5] = unk_1002A7D50;
  v11 = xmmword_1002A7D58;
  v12 = unk_1002A7D68;
  v8 = *(void (**)(unint64_t *__return_ptr, _QWORD *, ValueMetadata *, _UNKNOWN **))(*(_QWORD *)v2 + 128);
  swift_bridgeObjectRetain(unk_1002A7D30);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  v8(&v13, v10, &type metadata for DewConfigurationUInt, &off_10029F0C0);

  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v5);
  swift_release(v2);
  return v13;
}

- (unint64_t)validatePendingSMTLimit
{
  uint64_t v2;
  uint64_t v3;
  _TtC13transparencyd26DewConfigurationObjectiveC *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(unint64_t *__return_ptr, _QWORD *, ValueMetadata *, _UNKNOWN **);
  _QWORD v10[6];
  __int128 v11;
  __int128 v12;
  unint64_t v13;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_config);
  v3 = qword_1002A4B78;
  v4 = self;
  swift_retain(v2);
  if (v3 != -1)
    swift_once(&qword_1002A4B78, sub_1000710F4);
  v5 = unk_1002A7D80;
  v6 = unk_1002A7D90;
  v7 = unk_1002A7DA0;
  v10[0] = qword_1002A7D78;
  v10[1] = unk_1002A7D80;
  v10[2] = qword_1002A7D88;
  v10[3] = unk_1002A7D90;
  v10[4] = qword_1002A7D98;
  v10[5] = unk_1002A7DA0;
  v11 = xmmword_1002A7DA8;
  v12 = unk_1002A7DB8;
  v8 = *(void (**)(unint64_t *__return_ptr, _QWORD *, ValueMetadata *, _UNKNOWN **))(*(_QWORD *)v2 + 128);
  swift_bridgeObjectRetain(unk_1002A7D80);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  v8(&v13, v10, &type metadata for DewConfigurationUInt, &off_10029F0C0);

  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v5);
  swift_release(v2);
  return v13;
}

- (double)selfValidateCloudKitTimeout
{
  uint64_t v2;
  uint64_t v3;
  _TtC13transparencyd26DewConfigurationObjectiveC *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(double *__return_ptr, _QWORD *, ValueMetadata *, _UNKNOWN **);
  _QWORD v10[7];
  __int128 v11;
  uint64_t v12;
  double v13;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_config);
  v3 = qword_1002A4B80;
  v4 = self;
  swift_retain(v2);
  if (v3 != -1)
    swift_once(&qword_1002A4B80, sub_100071224);
  v5 = unk_1002A7DD0;
  v6 = unk_1002A7DE0;
  v7 = unk_1002A7DF0;
  v10[0] = qword_1002A7DC8;
  v10[1] = unk_1002A7DD0;
  v10[2] = qword_1002A7DD8;
  v10[3] = unk_1002A7DE0;
  v10[4] = qword_1002A7DE8;
  v10[5] = unk_1002A7DF0;
  v10[6] = qword_1002A7DF8;
  v11 = unk_1002A7E00;
  v12 = qword_1002A7E10;
  v8 = *(void (**)(double *__return_ptr, _QWORD *, ValueMetadata *, _UNKNOWN **))(*(_QWORD *)v2 + 128);
  swift_bridgeObjectRetain(unk_1002A7DD0);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  v8(&v13, v10, &type metadata for DewConfigurationTimeInterval, &off_10029F070);

  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v5);
  swift_release(v2);
  return v13;
}

- (void)overrideSelfValidateCloudKitTimeoutWithTimeInterval:(double)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC13transparencyd26DewConfigurationObjectiveC *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(_QWORD *, double *, ValueMetadata *, _UNKNOWN **);
  double v11;
  _QWORD v12[7];
  __int128 v13;
  uint64_t v14;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_config);
  v5 = qword_1002A4B80;
  v6 = self;
  swift_retain(v4);
  if (v5 != -1)
    swift_once(&qword_1002A4B80, sub_100071224);
  v7 = unk_1002A7DD0;
  v8 = unk_1002A7DE0;
  v9 = unk_1002A7DF0;
  v12[0] = qword_1002A7DC8;
  v12[1] = unk_1002A7DD0;
  v12[2] = qword_1002A7DD8;
  v12[3] = unk_1002A7DE0;
  v12[4] = qword_1002A7DE8;
  v12[5] = unk_1002A7DF0;
  v12[6] = qword_1002A7DF8;
  v13 = unk_1002A7E00;
  v14 = qword_1002A7E10;
  v11 = a3;
  v10 = *(void (**)(_QWORD *, double *, ValueMetadata *, _UNKNOWN **))(*(_QWORD *)v4 + 136);
  swift_bridgeObjectRetain(unk_1002A7DD0);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  v10(v12, &v11, &type metadata for DewConfigurationTimeInterval, &off_10029F070);

  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v7);
  swift_release(v4);
}

- (double)resetEnvLogClientNetworkTimeout
{
  uint64_t v2;
  uint64_t v3;
  _TtC13transparencyd26DewConfigurationObjectiveC *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(double *__return_ptr, _QWORD *, ValueMetadata *, _UNKNOWN **);
  _QWORD v10[7];
  __int128 v11;
  uint64_t v12;
  double v13;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_config);
  v3 = qword_1002A4B88;
  v4 = self;
  swift_retain(v2);
  if (v3 != -1)
    swift_once(&qword_1002A4B88, sub_100071370);
  v5 = unk_1002A7E20;
  v6 = unk_1002A7E30;
  v7 = unk_1002A7E40;
  v10[0] = qword_1002A7E18;
  v10[1] = unk_1002A7E20;
  v10[2] = qword_1002A7E28;
  v10[3] = unk_1002A7E30;
  v10[4] = qword_1002A7E38;
  v10[5] = unk_1002A7E40;
  v10[6] = qword_1002A7E48;
  v11 = *(_OWORD *)algn_1002A7E50;
  v12 = qword_1002A7E60;
  v8 = *(void (**)(double *__return_ptr, _QWORD *, ValueMetadata *, _UNKNOWN **))(*(_QWORD *)v2 + 128);
  swift_bridgeObjectRetain(unk_1002A7E20);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  v8(&v13, v10, &type metadata for DewConfigurationTimeInterval, &off_10029F070);

  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v5);
  swift_release(v2);
  return v13;
}

- (BOOL)fastWatchdogExit
{
  uint64_t v2;
  uint64_t v3;
  _TtC13transparencyd26DewConfigurationObjectiveC *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BOOL8 *__return_ptr, _QWORD *, ValueMetadata *, _UNKNOWN **);
  _QWORD v10[7];
  char v11;
  _BOOL8 v12;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_config);
  v3 = qword_1002A4B90;
  v4 = self;
  swift_retain(v2);
  if (v3 != -1)
    swift_once(&qword_1002A4B90, sub_1000714BC);
  v5 = unk_1002A7E70;
  v6 = unk_1002A7E80;
  v7 = unk_1002A7E90;
  v10[0] = qword_1002A7E68;
  v10[1] = unk_1002A7E70;
  v10[2] = qword_1002A7E78;
  v10[3] = unk_1002A7E80;
  v10[4] = qword_1002A7E88;
  v10[5] = unk_1002A7E90;
  v10[6] = qword_1002A7E98;
  v11 = byte_1002A7EA0;
  v8 = *(void (**)(_BOOL8 *__return_ptr, _QWORD *, ValueMetadata *, _UNKNOWN **))(*(_QWORD *)v2 + 128);
  swift_bridgeObjectRetain(unk_1002A7E70);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  v8(&v12, v10, &type metadata for DewConfigurationBool, &off_10029F110);

  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v5);
  swift_release(v2);
  return v12;
}

- (void)printAllDescriptions
{
  uint64_t v2;
  _TtC13transparencyd26DewConfigurationObjectiveC *v3;

  v2 = qword_1002A4B50;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_1002A4B50, sub_1000706F8);
  (*(void (**)(void))(*(_QWORD *)qword_1002A4B58 + 160))();

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_config));
}

@end
