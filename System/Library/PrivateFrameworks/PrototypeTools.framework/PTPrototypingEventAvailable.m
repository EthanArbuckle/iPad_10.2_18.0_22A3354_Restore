@implementation PTPrototypingEventAvailable

uint64_t __PTPrototypingEventAvailable_block_invoke()
{
  id v0;
  void *v1;
  uint64_t result;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)PTPrototypingEventAvailable___availableEvents;
  PTPrototypingEventAvailable___availableEvents = (uint64_t)v0;

  if (MGGetBoolAnswer())
  {
    objc_msgSend((id)PTPrototypingEventAvailable___availableEvents, "addObject:", &unk_1E70624A0);
    objc_msgSend((id)PTPrototypingEventAvailable___availableEvents, "addObject:", &unk_1E70624B8);
  }
  result = MGGetBoolAnswer();
  if ((_DWORD)result)
    return objc_msgSend((id)PTPrototypingEventAvailable___availableEvents, "addObject:", &unk_1E70624D0);
  return result;
}

@end
