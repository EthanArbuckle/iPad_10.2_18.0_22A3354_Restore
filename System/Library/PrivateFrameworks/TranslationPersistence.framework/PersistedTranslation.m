@implementation PersistedTranslation

- (double)ttsPlaybackRateDouble
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___PersistedTranslation_ttsPlaybackRateDouble);
  swift_beginAccess();
  return *v2;
}

- (void)setTtsPlaybackRateDouble:(double)a3
{
  double *v5;
  PersistedTranslation *v6;

  v5 = (double *)((char *)self + OBJC_IVAR___PersistedTranslation_ttsPlaybackRateDouble);
  swift_beginAccess();
  *v5 = a3;
  v6 = self;
  sub_2493CA7D0();
  sub_2493CA6D4();

  swift_release();
}

- (PersistedTranslation)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PersistedTranslation();
  return -[PersistedTranslation initWithEntity:insertIntoManagedObjectContext:](&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a3, a4);
}

- (void).cxx_construct
{
  char *v2;
  uint64_t v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PersistedTranslation_ttsPlaybackRateDouble) = (Class)0x3FF0000000000000;
  v2 = (char *)self + OBJC_IVAR___PersistedTranslation_selfLoggingInvocationId;
  v3 = sub_2493CA614();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
}

- (void).cxx_destruct
{
  sub_2493BFD2C((uint64_t)self + OBJC_IVAR___PersistedTranslation_selfLoggingInvocationId, &qword_257860688);
}

@end
