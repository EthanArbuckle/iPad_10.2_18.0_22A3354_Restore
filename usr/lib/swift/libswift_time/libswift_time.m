uint64_t timespec.init(_:)()
{
  return Duration.components.getter();
}

void Duration.init(_:)()
{
  JUMPOUT(0x24BD2EDCCLL);
}

uint64_t Duration.components.getter()
{
  return MEMORY[0x24BEE4828]();
}

