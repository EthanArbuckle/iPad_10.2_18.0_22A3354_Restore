@implementation SUStringFromInstallationConstraints

void __SUStringFromInstallationConstraints_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(*(_QWORD *)(v3 + 8) + 40))
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v3 = *(_QWORD *)(a1 + 32);
  }
  if (*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(v3 + 8) + 40), "appendString:", CFSTR(", "));
    v3 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(v3 + 8) + 40), "appendString:", v7);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

uint64_t __SUStringFromInstallationConstraints_block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2 > 63)
  {
    if (a2 <= 511)
    {
      if (a2 != 64 && a2 != 128 && a2 != 256)
        return result;
    }
    else if (a2 > 2047)
    {
      if (a2 != 2048 && a2 != 4096)
        return result;
    }
    else if (a2 != 512 && a2 != 1024)
    {
      return result;
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  }
  switch(a2)
  {
    case 0:
    case 1:
    case 2:
    case 4:
    case 8:
      return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
    case 3:
    case 5:
    case 6:
    case 7:
      return result;
    default:
      if (a2 == 16 || a2 == 32)
        return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
      break;
  }
  return result;
}

@end
