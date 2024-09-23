@implementation PDRDevice_Impl

- (NSUUID)pairingID
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (id)valueForProperty:(id)a3
{
  id v4;
  PDRDevice_Impl *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD v13[3];
  uint64_t v14;

  v4 = a3;
  v5 = self;
  Device_Impl.valueFor(property:)((uint64_t)v13);

  v6 = v14;
  if (!v14)
    return 0;
  v7 = __swift_project_boxed_opaque_existential_0(v13, v14);
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v10);
  v11 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  return v11;
}

- (id)propertyNames
{
  PDRDevice_Impl *v2;
  Class isa;

  v2 = self;
  Device_Impl.propertyNames()();

  type metadata accessor for PDRDevicePropertyKey(0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (BOOL)supportsCapabilityRaw:(unsigned int)a3
{
  PDRDevice_Impl *v4;

  v4 = self;
  LOBYTE(a3) = Device_Impl.supportsCapabilityRaw(_:)(a3);

  return a3 & 1;
}

- (PDRDevice_Impl)init
{
  PDRDevice_Impl *result;

  result = (PDRDevice_Impl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  id v5;

  v3 = (char *)self + OBJC_IVAR___PDRDevice_Impl_uuid_;
  v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = *(id *)&self->_anon_0[OBJC_IVAR___PDRDevice_Impl_registryState];

}

@end
