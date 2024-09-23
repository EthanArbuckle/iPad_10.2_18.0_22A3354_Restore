@implementation WBSReaderFont

void __66__WBSReaderFont_SafariSharedUI__isInstalledWithCompletionHandler___block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t __66__WBSReaderFont_SafariSharedUI__isInstalledWithCompletionHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t result;

  if (a2 == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    return 0;
  }
  else if (a2 == 7)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    result = 1;
    *(_BYTE *)(v2 + 24) = 1;
  }
  else
  {
    return 1;
  }
  return result;
}

@end
