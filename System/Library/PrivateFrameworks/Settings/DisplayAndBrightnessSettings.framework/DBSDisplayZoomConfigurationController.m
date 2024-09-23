@implementation DBSDisplayZoomConfigurationController

+ (DBSDisplayZoomConfigurationController)defaultController
{
  if (defaultController_onceToken != -1)
    dispatch_once(&defaultController_onceToken, &__block_literal_global_4);
  return (DBSDisplayZoomConfigurationController *)(id)defaultController__defaultController;
}

void __58__DBSDisplayZoomConfigurationController_defaultController__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)defaultController__defaultController;
  defaultController__defaultController = v0;

}

- (id)currentDisplayZoomMode
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__DBSDisplayZoomConfigurationController_currentDisplayZoomMode__block_invoke;
  block[3] = &unk_24F025E70;
  block[4] = self;
  if (currentDisplayZoomMode_onceToken != -1)
    dispatch_once(&currentDisplayZoomMode_onceToken, block);
  return (id)currentDisplayZoomMode__currentDisplayZoomMode;
}

void __63__DBSDisplayZoomConfigurationController_currentDisplayZoomMode__block_invoke()
{
  NSObject *v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  if (DBSGetMobileFrameBuffer())
  {
    v2 = 0;
    v1 = 0;
    IOMobileFramebufferGetCanvasSizes();
    DBSLogForCategory(1uLL);
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      __63__DBSDisplayZoomConfigurationController_currentDisplayZoomMode__block_invoke_cold_1(v0);

  }
}

- (id)displayZoomModes
{
  if (displayZoomModes_onceToken != -1)
    dispatch_once(&displayZoomModes_onceToken, &__block_literal_global_10);
  return (id)displayZoomModes__displayZoomModes;
}

void __57__DBSDisplayZoomConfigurationController_displayZoomModes__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  float v6;
  double v7;
  void *v8;
  float v9;
  double v10;
  void *v11;
  float v12;
  double v13;
  void *v14;
  float v15;
  double v16;
  DBSDisplayZoomMode *v17;
  void *v18;
  DBSDisplayZoomMode *v19;
  void *v20;
  void *v21;
  float v22;
  double v23;
  void *v24;
  float v25;
  double v26;
  void *v27;
  float v28;
  double v29;
  void *v30;
  float v31;
  double v32;
  DBSDisplayZoomMode *v33;
  void *v34;
  DBSDisplayZoomMode *v35;
  void *v36;
  void *v37;
  float v38;
  double v39;
  void *v40;
  float v41;
  double v42;
  void *v43;
  float v44;
  double v45;
  void *v46;
  float v47;
  double v48;
  DBSDisplayZoomMode *v49;
  void *v50;
  DBSDisplayZoomMode *v51;
  void *v52;
  void *v53;
  float v54;
  double v55;
  void *v56;
  float v57;
  double v58;
  void *v59;
  float v60;
  double v61;
  void *v62;
  float v63;
  double v64;
  DBSDisplayZoomMode *v65;
  void *v66;
  DBSDisplayZoomMode *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  id v81;

  v81 = (id)MGCopyAnswer();
  objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("default"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("zoomed"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("dense"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("denser"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  if (objc_msgSend(v0, "count") == 4)
  {
    objc_msgSend(v0, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = v6;

    objc_msgSend(v0, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v10 = v9;

    objc_msgSend(v0, "objectAtIndexedSubscript:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    v13 = v12;

    objc_msgSend(v0, "objectAtIndexedSubscript:", 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    v16 = v15;

    v17 = [DBSDisplayZoomMode alloc];
    DBS_LocalizedStringForMagnify(CFSTR("STANDARD"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[DBSDisplayZoomMode initWithDisplayZoomOption:localizedName:size:](v17, "initWithDisplayZoomOption:localizedName:size:", 0, v18, v7 * v10, v13 * v16);

    DBSStringForDisplayZoomOption(0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, v20);

  }
  if (objc_msgSend(v1, "count") == 4)
  {
    objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "floatValue");
    v23 = v22;

    objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "floatValue");
    v26 = v25;

    objc_msgSend(v1, "objectAtIndexedSubscript:", 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "floatValue");
    v29 = v28;

    objc_msgSend(v1, "objectAtIndexedSubscript:", 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "floatValue");
    v32 = v31;

    v33 = [DBSDisplayZoomMode alloc];
    DBS_LocalizedStringForMagnify(CFSTR("ZOOMED"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[DBSDisplayZoomMode initWithDisplayZoomOption:localizedName:size:](v33, "initWithDisplayZoomOption:localizedName:size:", 1, v34, v23 * v26, v29 * v32);

    DBSStringForDisplayZoomOption(1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, v36);

  }
  if (DBSReverseZoomEnabled())
  {
    if (objc_msgSend(v2, "count") == 4)
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "floatValue");
      v39 = v38;

      objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "floatValue");
      v42 = v41;

      objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "floatValue");
      v45 = v44;

      objc_msgSend(v2, "objectAtIndexedSubscript:", 3);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "floatValue");
      v48 = v47;

      v49 = [DBSDisplayZoomMode alloc];
      DBS_LocalizedStringForMagnify(CFSTR("DENSE"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = -[DBSDisplayZoomMode initWithDisplayZoomOption:localizedName:size:](v49, "initWithDisplayZoomOption:localizedName:size:", 2, v50, v39 * v42, v45 * v48);

      DBSStringForDisplayZoomOption(2);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v51, v52);

    }
    if (DBSMostDisplaySpaceEnabled() && objc_msgSend(v3, "count") == 4)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "floatValue");
      v55 = v54;

      objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "floatValue");
      v58 = v57;

      objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "floatValue");
      v61 = v60;

      objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "floatValue");
      v64 = v63;

      v65 = [DBSDisplayZoomMode alloc];
      DBS_LocalizedStringForMagnify(CFSTR("DENSER"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = -[DBSDisplayZoomMode initWithDisplayZoomOption:localizedName:size:](v65, "initWithDisplayZoomOption:localizedName:size:", 3, v66, v55 * v58, v61 * v64);

      DBSStringForDisplayZoomOption(3);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v67, v68);

    }
  }
  DBSStringForDisplayZoomOption(1);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  DBSStringForDisplayZoomOption(2);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v70, "size");
  v74 = v73;
  v76 = v75;
  objc_msgSend(v72, "size");
  if (v74 == v78 && v76 == v77)
  {
    DBSStringForDisplayZoomOption(1);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", v79);

  }
  v80 = (void *)displayZoomModes__displayZoomModes;
  displayZoomModes__displayZoomModes = (uint64_t)v4;

}

- (void)setDisplayZoomMode:(id)a3 withRelaunchURL:(id)a4
{
  -[DBSDisplayZoomConfigurationController setDisplayZoomMode:withRelaunchURL:transitionWithScreenshot:](self, "setDisplayZoomMode:withRelaunchURL:transitionWithScreenshot:", a3, a4, 0);
}

- (void)setDisplayZoomMode:(id)a3 withRelaunchURL:(id)a4 transitionWithScreenshot:(BOOL)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v13;
  _QWORD v14[4];
  id v15;
  BOOL v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;
  CGSize v24;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  DBSLogForCategory(1uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    DBSStringForDisplayZoomOption(objc_msgSend(v7, "displayZoomOption"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "size");
    NSStringFromCGSize(v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v18 = "-[DBSDisplayZoomConfigurationController setDisplayZoomMode:withRelaunchURL:transitionWithScreenshot:]";
    v19 = 2114;
    v20 = v10;
    v21 = 2114;
    v22 = v11;
    _os_log_impl(&dword_227A37000, v9, OS_LOG_TYPE_DEFAULT, "%s: Setting new canvas size (option: '%{public}@', size: '%{public}@').", buf, 0x20u);

  }
  DBSGetMobileFrameBuffer();
  objc_msgSend(v7, "size");
  IOMobileFramebufferSetCanvasSize();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("DBSMagnifyModeDidChangeNotification"), 0, 0, 1u);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __101__DBSDisplayZoomConfigurationController_setDisplayZoomMode_withRelaunchURL_transitionWithScreenshot___block_invoke;
  v14[3] = &unk_24F026090;
  v16 = a5;
  v15 = v8;
  v13 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

void __101__DBSDisplayZoomConfigurationController_setDisplayZoomMode_withRelaunchURL_transitionWithScreenshot___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  if (*(_BYTE *)(a1 + 40))
    v1 = 3;
  else
    v1 = 1;
  objc_msgSend(MEMORY[0x24BEB0AB8], "actionWithReason:options:targetURL:", CFSTR("magnify mode"), v1, *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE38508], "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendActions:withResult:", v3, 0);

}

void __63__DBSDisplayZoomConfigurationController_currentDisplayZoomMode__block_invoke_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[DBSDisplayZoomConfigurationController currentDisplayZoomMode]_block_invoke";
  _os_log_error_impl(&dword_227A37000, log, OS_LOG_TYPE_ERROR, "%s: Failed to establish connection to framebuffer (device, no error).", (uint8_t *)&v1, 0xCu);
}

@end
