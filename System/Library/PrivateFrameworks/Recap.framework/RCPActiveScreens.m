@implementation RCPActiveScreens

void ___RCPActiveScreens_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  RCPEventScreen *v4;
  id v5;
  double v6;
  float v7;
  double v8;
  float v9;
  float v10;
  void *v11;
  double v12;
  float v13;
  float v14;
  float v15;

  v3 = a2;
  v4 = objc_alloc_init(RCPEventScreen);
  objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
  {
    BKSDisplayServicesGetMainScreenInfo();
    v10 = v13;
    v7 = 0.0;
    v9 = 0.0;
  }
  else
  {
    objc_msgSend(v3, "bounds");
    v7 = v6;
    v9 = v8;
    BKSDisplayServicesGetExternalDisplayScale();
    v13 = v10;
  }
  v14 = v9 / v10;
  v15 = v7 / v10;
  objc_msgSend(v3, "uniqueId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPEventScreen setDisplayUUID:](v4, "setDisplayUUID:", v11);

  -[RCPEventScreen setDisplayID:](v4, "setDisplayID:", objc_msgSend(v3, "displayId"));
  -[RCPEventScreen setPointSize:](v4, "setPointSize:", v15, v14);
  -[RCPEventScreen setScale:](v4, "setScale:", v13);
  if (v15 != 0.0)
  {
    *(float *)&v12 = v14;
    if (v14 != 0.0)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v4, v12);
  }

}

@end
