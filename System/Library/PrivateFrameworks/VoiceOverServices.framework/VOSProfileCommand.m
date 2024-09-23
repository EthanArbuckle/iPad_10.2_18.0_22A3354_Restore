@implementation VOSProfileCommand

BOOL __53___VOSProfileCommand_secondaryCommandsForPressCount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pressCount") == *(_QWORD *)(a1 + 32);
}

@end
