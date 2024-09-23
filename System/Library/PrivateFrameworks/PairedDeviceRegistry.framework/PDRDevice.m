@implementation PDRDevice

- (PDRDevice)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDRDevice;
  return -[PDRDevice init](&v3, sel_init);
}

- (BOOL)isPaired
{
  PDRDevice *v2;
  char v3;

  v2 = self;
  v3 = PDRDevice.isPaired()(PDRDevicePropertyKeyIsPaired);

  return v3 & 1;
}

- (BOOL)isActive
{
  PDRDevice *v2;
  char v3;

  v2 = self;
  v3 = PDRDevice.isPaired()(PDRDevicePropertyKeyIsActive);

  return v3 & 1;
}

- (id)pairingStorePath
{
  PDRDevice *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = PDRDevice.localPairingDataStorePath.getter();
  v5 = v4;

  if (v5)
  {
    v6 = (void *)MEMORY[0x2494F7BCC](v3, v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)isSetup
{
  PDRDevice *v2;
  char v3;

  v2 = self;
  v3 = PDRDevice.isPaired()(PDRDevicePropertyKeyIsSetup);

  return v3 & 1;
}

- (BOOL)isArchived
{
  PDRDevice *v2;
  char v3;

  v2 = self;
  v3 = PDRDevice.isPaired()(PDRDevicePropertyKeyIsArchived);

  return v3 & 1;
}

- (BOOL)isAltAccount
{
  PDRDevice *v2;
  char v3;

  v2 = self;
  v3 = PDRDevice.isPaired()(PDRDevicePropertyKeyIsAltAccount);

  return v3 & 1;
}

- (id)lastActiveDate
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  PDRDevice *v6;
  uint64_t v7;
  uint64_t v8;
  Class isa;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  PDRDevice.lastActiveDate()((uint64_t)v5);

  v7 = type metadata accessor for Date();
  v8 = *(_QWORD *)(v7 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return isa;
}

- (id)systemBuildVersion
{
  return @objc PDRDevice.systemBuildVersion()(self, (uint64_t)a2, PDRDevicePropertyKeySystemBuildVersion);
}

- (id)systemName
{
  return @objc PDRDevice.systemBuildVersion()(self, (uint64_t)a2, PDRDevicePropertyKeySystemName);
}

- (id)bluetoothIdentifier
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  PDRDevice *v7;
  id result;
  Class isa;
  _OWORD v10[2];
  __int128 v11;

  v3 = type metadata accessor for UUID();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  result = -[PDRDevice valueForProperty:](v7, sel_valueForProperty_, CFSTR("_bluetoothIdentifier"));
  if (result)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    outlined init with take of Any(v10, &v11);
    swift_dynamicCast();

    isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSUUID)pairingID
{
  NSUUID *result;

  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (id)valueForProperty:(id)a3
{
  id result;

  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (id)propertyNames
{
  id result;

  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

@end
