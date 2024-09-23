@implementation DASCTSMinBatteryLevelKeySymbolLoc

void *__get_DASCTSMinBatteryLevelKeySymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (qword_1EFC6EC78)
  {
    v2 = (void *)qword_1EFC6EC78;
  }
  else
  {
    qword_1EFC6EC78 = _sl_dlopen();
    v2 = (void *)qword_1EFC6EC78;
    if (!qword_1EFC6EC78)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "_DASCTSMinBatteryLevelKey");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  _MergedGlobals_6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
