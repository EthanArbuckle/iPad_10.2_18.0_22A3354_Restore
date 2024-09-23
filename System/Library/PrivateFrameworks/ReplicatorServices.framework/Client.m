@implementation Client

- (NSString)description
{
  os_unfair_lock_s *v2;
  _TtC18ReplicatorServicesP33_E12FEAD95517CBB4AB29168F11BCC1CA6Client *v3;
  void *v4;
  uint64_t v6;

  v2 = (os_unfair_lock_s *)(*(char **)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC18ReplicatorServicesP33_E12FEAD95517CBB4AB29168F11BCC1CA6Client_lock)
                          + 16);
  v3 = self;
  os_unfair_lock_lock(v2);
  sub_24542A328(&v6);
  os_unfair_lock_unlock(v2);

  v4 = (void *)sub_245443D78();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC18ReplicatorServicesP33_E12FEAD95517CBB4AB29168F11BCC1CA6Client)init
{
  _TtC18ReplicatorServicesP33_E12FEAD95517CBB4AB29168F11BCC1CA6Client *result;

  result = (_TtC18ReplicatorServicesP33_E12FEAD95517CBB4AB29168F11BCC1CA6Client *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ReplicatorServicesP33_E12FEAD95517CBB4AB29168F11BCC1CA6Client_connection));
  swift_release();
  sub_24542A364((uint64_t)self + OBJC_IVAR____TtC18ReplicatorServicesP33_E12FEAD95517CBB4AB29168F11BCC1CA6Client_delegate);
}

- (id)localDeviceIDAndReturnError:(id *)a3
{
  uint64_t LocalDeviceID;
  uint64_t v5;
  char *v6;
  _TtC18ReplicatorServicesP33_E12FEAD95517CBB4AB29168F11BCC1CA6Client *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v13;

  LocalDeviceID = type metadata accessor for MigrationXPCServerResponse.GetLocalDeviceID();
  MEMORY[0x24BDAC7A8](LocalDeviceID);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_245423ED4((uint64_t)v6);

  sub_245443994();
  swift_allocObject();
  sub_245443988();
  sub_2453B8BF4((unint64_t *)&unk_257465590, (uint64_t (*)(uint64_t))type metadata accessor for MigrationXPCServerResponse.GetLocalDeviceID, (uint64_t)&protocol conformance descriptor for MigrationXPCServerResponse.GetLocalDeviceID);
  v8 = sub_24544397C();
  v10 = v9;
  v11 = (void *)sub_245443A6C();
  sub_2453BDCF8(v8, v10);
  swift_release();
  sub_2453BA3A8((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for MigrationXPCServerResponse.GetLocalDeviceID);
  return v11;
}

- (id)recordsAndReturnError:(id *)a3
{
  _TtC18ReplicatorServicesP33_E12FEAD95517CBB4AB29168F11BCC1CA6Client *v3;
  id v4;

  v3 = self;
  v4 = sub_245424138();

  return v4;
}

- (id)devicesAndReturnError:(id *)a3
{
  _TtC18ReplicatorServicesP33_E12FEAD95517CBB4AB29168F11BCC1CA6Client *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;

  if (MEMORY[0x2495344E8]((char *)self + OBJC_IVAR____TtC18ReplicatorServicesP33_E12FEAD95517CBB4AB29168F11BCC1CA6Client_delegate, a2))
  {
    v5 = self;
    sub_245423334(&OBJC_IVAR____TtC18ReplicatorServices15MigrationServer_deviceProvider, "Returning %{public}ld devices for migration", (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_245421300);

    swift_unknownObjectRelease();
    sub_245443994();
    swift_allocObject();
    sub_245443988();
    sub_24542A2CC();
    v10 = sub_24544397C();
    v12 = v11;
    v13 = (void *)sub_245443A6C();
    sub_2453BDCF8(v10, v12);
    swift_bridgeObjectRelease();
    swift_release();
    return v13;
  }
  else
  {
    sub_24542A244();
    v8 = (void *)swift_allocError();
    *(_BYTE *)v9 = 2;
    *(_QWORD *)(v9 + 8) = 0;
    swift_willThrow();
    if (a3)
    {
      v6 = (void *)sub_2454439AC();

      v7 = v6;
      *a3 = v6;
    }
    else
    {

    }
    return 0;
  }
}

- (id)clientDescriptorsAndReturnError:(id *)a3
{
  _TtC18ReplicatorServicesP33_E12FEAD95517CBB4AB29168F11BCC1CA6Client *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;

  if (MEMORY[0x2495344E8]((char *)self + OBJC_IVAR____TtC18ReplicatorServicesP33_E12FEAD95517CBB4AB29168F11BCC1CA6Client_delegate, a2))
  {
    v5 = self;
    sub_245423334(&OBJC_IVAR____TtC18ReplicatorServices15MigrationServer_clientDescriptorProvider, "Returning %{public}ld client descriptors for migration", (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_245421300);

    swift_unknownObjectRelease();
    sub_245443994();
    swift_allocObject();
    sub_245443988();
    sub_24542A288();
    v10 = sub_24544397C();
    v12 = v11;
    v13 = (void *)sub_245443A6C();
    sub_2453BDCF8(v10, v12);
    swift_bridgeObjectRelease();
    swift_release();
    return v13;
  }
  else
  {
    sub_24542A244();
    v8 = (void *)swift_allocError();
    *(_BYTE *)v9 = 2;
    *(_QWORD *)(v9 + 8) = 0;
    swift_willThrow();
    if (a3)
    {
      v6 = (void *)sub_2454439AC();

      v7 = v6;
      *a3 = v6;
    }
    else
    {

    }
    return 0;
  }
}

- (BOOL)eraseAndReturnError:(id *)a3
{
  _TtC18ReplicatorServicesP33_E12FEAD95517CBB4AB29168F11BCC1CA6Client *v4;

  if (MEMORY[0x2495344E8]((char *)self + OBJC_IVAR____TtC18ReplicatorServicesP33_E12FEAD95517CBB4AB29168F11BCC1CA6Client_delegate, a2))
  {
    v4 = self;
    sub_245423514();

    swift_unknownObjectRelease();
  }
  return 1;
}

@end
