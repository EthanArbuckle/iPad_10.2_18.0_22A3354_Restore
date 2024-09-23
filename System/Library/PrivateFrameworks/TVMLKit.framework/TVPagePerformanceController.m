@implementation TVPagePerformanceController

uint64_t __54___TVPagePerformanceController_isPerformanceUIEnabled__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  isPerformanceUIEnabled_internalBuild = result;
  if ((result & 1) == 0)
  {
    result = CFPreferencesGetAppBooleanValue(CFSTR("PagePerformanceUIEnabled"), CFSTR("com.apple.TVMLKit"), 0);
    isPerformanceUIEnabled_uiEnabled = (_DWORD)result != 0;
  }
  return result;
}

void __80___TVPagePerformanceController_postNotificationForImageProxy_withLoadingStatus___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", a1[4], a1[5], a1[6]);

}

id __39___TVPagePerformanceController_metrics__block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v3;

  v3 = _TVPagePerformanceConvertMachAbsoluteTimeToMicroseconds(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), a2);
  if (v3)
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", (*(_QWORD *)(a1 + 40) + v3) / 0x3E8);
  else
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __56___TVPagePerformanceController_buildPagePerformanceView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = objc_msgSend(a3, "unsignedLongLongValue");
  if (v5 >= 0x3E9)
  {
    if (v5 >> 4 > 0x270)
    {
      if (v5 > 0x7A11F)
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.2fs"), (double)v5 / 1000000.0);
      else
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lums"), v5 / 0x3E8uLL);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.2fms"), (double)v5 / 1000.0);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56));
    objc_msgSend(v8, "setText:", v7);
    objc_msgSend(*(id *)(a1 + 32), "addSubview:", v8);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 40)
                                                                + 60.0;

  }
}

@end
