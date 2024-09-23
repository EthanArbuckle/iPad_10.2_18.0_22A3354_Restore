@implementation TranscriptionAvailabilityProvider

+ (_TtC10VoiceMemos33TranscriptionAvailabilityProvider)shared
{
  if (qword_1001E8F98 != -1)
    swift_once(&qword_1001E8F98, sub_1000D1EA0);
  return (_TtC10VoiceMemos33TranscriptionAvailabilityProvider *)(id)qword_1001F6C40;
}

+ (void)setShared:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1001E8F98;
  v4 = a3;
  if (v3 != -1)
    swift_once(&qword_1001E8F98, sub_1000D1EA0);
  v5 = (void *)qword_1001F6C40;
  qword_1001F6C40 = (uint64_t)v4;

}

- (BOOL)deviceIsSupported
{
  uint64_t v2;
  _TtC10VoiceMemos33TranscriptionAvailabilityProvider *v3;
  uint64_t v4;
  _BOOL8 v6;

  v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC10VoiceMemos33TranscriptionAvailabilityProvider_deviceIsSupportedSubject);
  v3 = self;
  v4 = swift_retain(v2);
  CurrentValueSubject.value.getter(&v6, v4);

  swift_release(v2);
  return v6;
}

- (_TtC10VoiceMemos33TranscriptionAvailabilityProvider)init
{
  return (_TtC10VoiceMemos33TranscriptionAvailabilityProvider *)sub_1000D1FB4();
}

- (void)updateDeviceIsSupported
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _TtC10VoiceMemos33TranscriptionAvailabilityProvider *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = sub_100014E10(&qword_1001E9BB0);
  __chkstk_darwin(v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor(0);
  v7 = self;
  v8 = static MainActor.shared.getter(v7);
  v9 = (_QWORD *)swift_allocObject(&unk_1001B0520, 40, 7);
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v7;
  v10 = sub_1000F7930((uint64_t)v5, (uint64_t)&unk_1001EB2E0, (uint64_t)v9);

  swift_release(v10);
}

- (void)registerObserver:(id)a3
{
  _TtC10VoiceMemos33TranscriptionAvailabilityProvider *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1000D2568((uint64_t)a3);
  swift_unknownObjectRelease(a3);

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10VoiceMemos33TranscriptionAvailabilityProvider_deviceIsSupportedSubject));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10VoiceMemos33TranscriptionAvailabilityProvider_cancellable));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10VoiceMemos33TranscriptionAvailabilityProvider_observers));
}

@end
