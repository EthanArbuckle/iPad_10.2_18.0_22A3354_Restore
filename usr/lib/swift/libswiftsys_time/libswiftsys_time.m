uint64_t timeval.init(_:)()
{
  return Duration.components.getter();
}

void Duration.init(_:)()
{
  JUMPOUT(0x24BD2EDECLL);
}

uint64_t Duration.components.getter()
{
  return MEMORY[0x24BEE4828]();
}

