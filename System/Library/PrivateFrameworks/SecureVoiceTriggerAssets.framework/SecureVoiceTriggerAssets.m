uint64_t SecureVoiceTriggerAssets.__allocating_init()()
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0x3FF0000000000000;
  return result;
}

uint64_t SecureVoiceTriggerAssets.init()()
{
  uint64_t v0;
  uint64_t result;

  result = v0;
  *(_QWORD *)(v0 + 16) = 0x3FF0000000000000;
  return result;
}

Swift::Double __swiftcall SecureVoiceTriggerAssets.SecureVoiceTriggerAssetsVersion()()
{
  return 1.0;
}

uint64_t SecureVoiceTriggerAssets.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SecureVoiceTriggerAssets.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SecureVoiceTriggerAssets()
{
  return objc_opt_self();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

