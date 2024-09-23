@implementation ValidateAllSymlinksUnderPath

uint64_t ___ValidateAllSymlinksUnderPath_block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t result;

  if (!a2)
    return 1;
  if ((*(_WORD *)(*(_QWORD *)(a2 + 96) + 4) & 0xF000) != 0xA000)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", *(_QWORD *)(a2 + 48), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = _CheckRealpathHasBasePrefix(v6, v7, a3);

  result = 0;
  if ((_DWORD)a3)
    return 1;
  return result;
}

@end
