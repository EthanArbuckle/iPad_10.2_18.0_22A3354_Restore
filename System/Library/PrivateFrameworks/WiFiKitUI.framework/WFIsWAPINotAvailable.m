@implementation WFIsWAPINotAvailable

void __WFIsWAPINotAvailable_block_invoke()
{
  uint64_t v0;
  void *v1;
  char v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  NSObject *v6;
  os_log_type_t v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v0 = MGGetProductType();
  MGGetStringAnswer();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = MGGetBoolAnswer();
  if (v0 <= 2516717267)
  {
    if (v0 > 2023824666)
    {
      if (v0 > 2262113698)
      {
        if (v0 == 2262113699)
          goto LABEL_26;
        v3 = 2458172802;
      }
      else
      {
        if (v0 == 2023824667)
          goto LABEL_26;
        v3 = 2158787296;
      }
    }
    else if (v0 > 1353145732)
    {
      if (v0 == 1353145733)
        goto LABEL_26;
      v3 = 1868379043;
    }
    else
    {
      if (v0 == 746003606)
        goto LABEL_26;
      v3 = 1119807502;
    }
LABEL_25:
    if (v0 != v3)
      goto LABEL_31;
    goto LABEL_26;
  }
  if (v0 <= 3054476160)
  {
    if (v0 > 2628394913)
    {
      if (v0 == 2628394914)
        goto LABEL_26;
      v3 = 2903084588;
    }
    else
    {
      if (v0 == 2516717268)
        goto LABEL_26;
      v3 = 2614323575;
    }
    goto LABEL_25;
  }
  if (v0 <= 3397214290)
  {
    if (v0 == 3054476161)
      goto LABEL_26;
    v3 = 3101941570;
    goto LABEL_25;
  }
  if (v0 != 3397214291 && v0 != 3707345671)
  {
    v3 = 3645319985;
    goto LABEL_25;
  }
LABEL_26:
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    v8 = 136315138;
    v9 = "WFIsWAPINotAvailable_block_invoke";
    _os_log_impl(&dword_2196CC000, v4, v5, "%s: wapi capability is disabled for device", (uint8_t *)&v8, 0xCu);
  }

  WFIsWAPINotAvailable___wapiDisabled = 1;
LABEL_31:
  if ((v2 & 1) == 0 && (int)objc_msgSend(v1, "intValue") >= 4377)
  {
    WFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
    {
      v8 = 136315138;
      v9 = "WFIsWAPINotAvailable_block_invoke";
      _os_log_impl(&dword_2196CC000, v6, v7, "%s: wapi capability is disabled for WiFi-only product", (uint8_t *)&v8, 0xCu);
    }

    WFIsWAPINotAvailable___wapiDisabled = 1;
  }

}

@end
