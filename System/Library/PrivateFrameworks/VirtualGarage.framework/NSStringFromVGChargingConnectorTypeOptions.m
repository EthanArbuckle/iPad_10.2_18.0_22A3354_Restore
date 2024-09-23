@implementation NSStringFromVGChargingConnectorTypeOptions

const __CFString *__NSStringFromVGChargingConnectorTypeOptions_block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFString *result;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a2 > 31)
  {
    if (a2 > 127)
    {
      if (a2 == 128)
        return CFSTR("Mennekes");
      if (a2 == 256)
        return CFSTR("NACS_AC");
    }
    else
    {
      if (a2 == 32)
        return CFSTR("GBT_DC");
      if (a2 == 64)
        return CFSTR("Tesla (NACS_DC)");
    }
LABEL_13:
    VGGetVirtualGarageLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 134217984;
      v7 = v5;
      _os_log_impl(&dword_20A329000, v4, OS_LOG_TYPE_FAULT, "Tried to get a string version of a multiple option bitmask: %lu. This is not supported.", (uint8_t *)&v6, 0xCu);
    }

    return CFSTR("Unknown");
  }
  else
  {
    result = CFSTR("J1772");
    switch(a2)
    {
      case 1:
        return result;
      case 2:
        result = CFSTR("CCS1");
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_13;
      case 4:
        result = CFSTR("CCS2");
        break;
      case 8:
        result = CFSTR("CHAdeMO");
        break;
      default:
        if (a2 != 16)
          goto LABEL_13;
        result = CFSTR("GBT_AC");
        break;
    }
  }
  return result;
}

void __NSStringFromVGChargingConnectorTypeOptions_block_invoke_30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  if ((a2 & ~a3) == 0)
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

@end
