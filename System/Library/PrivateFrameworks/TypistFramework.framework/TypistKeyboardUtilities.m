@implementation TypistKeyboardUtilities

+ (CGPoint)generateGaussianPoint:(CGPoint)a3 withSeed:(int64_t)a4 andSigma:(double)a5
{
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double y;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  srand48(a4);
  do
  {
    v7 = drand48() * 2.0 + -1.0;
    v8 = drand48() * 2.0 + -1.0;
    v9 = v8 * v8 + v7 * v7;
  }
  while (v9 >= 1.0);
  v10 = sqrt(log(v8 * v8 + v7 * v7) * -2.0 / v9);
  v11 = v8 * v10;
  v12 = x + v7 * v10 * a5;
  v13 = y + v11 * a5;
  result.y = v13;
  result.x = v12;
  return result;
}

+ (CGPoint)generateGaussianPointWithMean:(CGPoint)a3 andSigma:(double)a4
{
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double y;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  do
  {
    v6 = drand48() * 2.0 + -1.0;
    v7 = drand48() * 2.0 + -1.0;
    v8 = v7 * v7 + v6 * v6;
  }
  while (v8 >= 1.0);
  v9 = sqrt(log(v7 * v7 + v6 * v6) * -2.0 / v8);
  v10 = v7 * v9;
  v11 = x + v6 * v9 * a4;
  v12 = y + v10 * a4;
  result.y = v12;
  result.x = v11;
  return result;
}

+ (CGPoint)generateUniformPointWithMean:(CGPoint)a3 andRange:(unsigned int)a4
{
  double v4;
  double v5;
  CGPoint result;

  objc_msgSend(a1, "generateUniformPointWithMean:andBounds:", a3.x, a3.y, (double)a4, (double)a4);
  result.y = v5;
  result.x = v4;
  return result;
}

+ (CGPoint)generateUniformPointWithMean:(CGPoint)a3 andBounds:(CGVector)a4
{
  double dy;
  double y;
  double x;
  double v7;
  uint32_t v8;
  double v9;
  double v10;
  CGPoint result;

  dy = a4.dy;
  y = a3.y;
  x = a3.x;
  v7 = (double)(int)(arc4random_uniform((a4.dx + a4.dx)) - (int)a4.dx);
  v8 = arc4random_uniform((dy + dy));
  v9 = x + v7;
  v10 = y + (double)(int)(v8 - (int)dy);
  result.y = v10;
  result.x = v9;
  return result;
}

+ (id)validateProbability:(id)a3
{
  double v3;

  objc_msgSend(a3, "doubleValue");
  if (v3 < 0.0)
    return &unk_251A94D10;
  if (v3 > 1.0)
    return &unk_251A94D20;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)logToSTDERR:(BOOL)a3
{
  +[TYLogger logToSTDERR:](TYLogger, "logToSTDERR:", a3);
}

+ (void)logToFile:(BOOL)a3
{
  +[TYLogger logToFile:](TYLogger, "logToFile:", a3);
}

+ (void)waitFor:(double)a3
{
  void *v4;
  id v5;

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "runUntilDate:", v4);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", a3);
  }
}

+ (void)runOnMainThread:(id)a3
{
  void *v3;
  void (**block)(void);

  v3 = (void *)MEMORY[0x24BDD17F0];
  block = (void (**)(void))a3;
  if (objc_msgSend(v3, "isMainThread"))
    block[2]();
  else
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

}

+ (id)canonicalConversion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "decomposedStringWithCanonicalMapping");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "precomposedStringWithCanonicalMapping");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "precomposedStringWithCompatibilityMapping");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("–"), CFSTR("-"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)timeInStringFromTimeInterval:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02ld:%02ld:%02ld"), (uint64_t)a3 / 3600, (uint64_t)a3 / 60 % 60, (uint64_t)a3 % 60);
}

+ (void)runCommandLineProcess:(char *)a3
{
  char *v3;
  pid_t v4;

  if (a3)
  {
    v3 = *a3;
    if (*a3)
    {
      v4 = 0;
      posix_spawn(&v4, v3, 0, 0, a3, (char *const *)*MEMORY[0x24BDAE198]);
      waitpid(v4, 0, 0);
    }
  }
}

+ (void)killKbd
{
  int v2;
  int v3;
  FILE *v4;
  char *v5;
  pid_t v6;
  char *__argv[2];
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)__argv = xmmword_251A7C9B0;
  v8 = *(_OWORD *)&off_251A7C9C0;
  v6 = 0;
  posix_spawn(&v6, "/usr/bin/killall", 0, 0, __argv, (char *const *)*MEMORY[0x24BDAE198]);
  waitpid(v6, 0, 0);
  v2 = 19;
  do
  {
    v3 = v2;
    +[TypistKeyboardUtilities waitFor:](TypistKeyboardUtilities, "waitFor:", 0.2);
    v4 = popen("/usr/local/bin/pidof kbd", "r");
    v5 = fgets(killKbd_buffer, 128, v4);
    pclose(v4);
    if (!v5)
      break;
    v2 = v3 - 1;
  }
  while (v3);
}

+ (id)generateKeyboardList
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = (id)objc_opt_new();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__TypistKeyboardUtilities_generateKeyboardList__block_invoke;
  v4[3] = &unk_251A7C9D8;
  v4[4] = &v5;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __47__TypistKeyboardUtilities_generateKeyboardList__block_invoke(uint64_t a1)
{
  uint64_t CurrentIdiom;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  CurrentIdiom = UIKeyboardGetCurrentIdiom();
  UIKeyboardGetSupportedInputModes();
  obj = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(CurrentIdiom + 1) > 4 || ((1 << (CurrentIdiom + 1)) & 0x19) == 0)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v26)
    {
      v28 = a1;
      v24 = *(_QWORD *)v34;
      v10 = (void *)MEMORY[0x24BDBD1A8];
      v25 = CurrentIdiom;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v34 != v24)
            objc_enumerationMutation(obj);
          UIKeyboardGetSupportedHardwareKeyboardsForInputMode();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          UIKeyboardGetSupportedSoftwareKeyboardsForInputModeAndIdiom();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12 || !objc_msgSend(v12, "count"))
          {

            v12 = &unk_251A98F40;
          }
          v27 = v11;
          if (CurrentIdiom == 1)
          {
            objc_msgSend(v10, "arrayByAddingObjectsFromArray:", &unk_251A98F28);
            v14 = objc_claimAutoreleasedReturnValue();

            v10 = (void *)v14;
          }
          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          v15 = v13;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v30;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v30 != v18)
                  objc_enumerationMutation(v15);
                objc_msgSend(v12, "objectAtIndexedSubscript:", 0, obj);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                UIKeyboardInputModeWithNewHWLayout();
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                UIKeyboardInputModeWithNewSWLayout();
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v10, "containsObject:", v22) & 1) == 0)
                  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v28 + 32) + 8) + 40), "addObject:", v22);

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            }
            while (v17);
          }

          v11 = v27 + 1;
          CurrentIdiom = v25;
        }
        while (v27 + 1 != v26);
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v26);
    }
    else
    {
      v10 = (void *)MEMORY[0x24BDBD1A8];
    }

  }
  else
  {
    TYLogl(OS_LOG_TYPE_ERROR, CFSTR("ERROR: The device under test does not appear to have software input support known to Typist"), v3, v4, v5, v6, v7, v8, (char)obj);
  }

}

+ (int)touchScanRate
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x24BE7CE30], "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "touchScanRate");

  return v3;
}

+ (id)getMobileGestalt:(id)a3
{
  id v3;
  uint64_t v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  v4 = MGCopyAnswer();
  if (v4)
  {
    v5 = (__CFString *)v4;
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("HWModelStr")))
    {
      v6 = -[__CFString rangeOfString:options:](v5, "rangeOfString:options:", CFSTR("AP"), 4);
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[__CFString stringByReplacingCharactersInRange:withString:](v5, "stringByReplacingCharactersInRange:withString:", v6, v7, &stru_251A7DE60);
        v8 = objc_claimAutoreleasedReturnValue();

        v5 = (__CFString *)v8;
      }
    }
  }
  else
  {
    v5 = CFSTR("_Cannot_Obtain_");
  }

  return v5;
}

+ (id)getHwRevision
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;

  v2 = (void *)MGCopyAnswer();
  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("CFG#"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithData:encoding:", v4, 4);

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("/-"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    v11 = CFSTR("MP");
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@/%@"), v9, v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

+ (id)getNandCapacity
{
  mach_port_t v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  uint64_t v7;
  __CFString *v8;

  v2 = *MEMORY[0x24BDD8B18];
  v3 = IOServiceMatching("IOMedia");
  MatchingService = IOServiceGetMatchingService(v2, v3);
  v5 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", CFSTR("Controller Characteristics"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 3u);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend((id)CFDictionaryGetValue(v5, CFSTR("capacity")), "integerValue") / 1000000000;
    IOObjectRelease(MatchingService);
    CFRelease(v6);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ldGB"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("_Cannot_Obtain_");
  }
  return v8;
}

+ (id)getTrainBuildVersion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  int v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scanInteger:", &v11);
  v10 = 0;
  objc_msgSend(v5, "scanCharactersFromSet:intoString:", v4, &v10);
  objc_msgSend(v5, "scanInteger:", &v11);
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("15A")) & 1) != 0)
  {
    v6 = CFSTR("Tigris");
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("15B")) & 1) != 0)
  {
    v6 = CFSTR("Bursa");
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("15C")) & 1) != 0)
  {
    v6 = CFSTR("Cinar");
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("15D")) & 1) != 0)
  {
    v6 = CFSTR("Dalaman");
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("15E")) & 1) != 0)
  {
    v6 = CFSTR("Emet");
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("15F")) & 1) != 0)
  {
    v6 = CFSTR("Fatsa");
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("15G")) & 1) != 0)
  {
    v6 = CFSTR("TigrisG");
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("16A")) & 1) != 0)
  {
    v6 = CFSTR("Peace");
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("16B")) & 1) != 0)
  {
    v6 = CFSTR("PeaceB");
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("16C")) & 1) != 0)
  {
    v6 = CFSTR("PeaceC");
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("16D")) & 1) != 0)
  {
    v6 = CFSTR("PeaceD");
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("16E")) & 1) != 0)
  {
    v6 = CFSTR("PeaceE");
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("17A")) & 1) != 0)
  {
    v6 = CFSTR("Yukon");
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("17B")) & 1) != 0)
  {
    v6 = CFSTR("YukonB");
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("17C")) & 1) != 0)
  {
    v6 = CFSTR("YukonC");
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("17D")) & 1) != 0)
  {
    v6 = CFSTR("YukonD");
  }
  else
  {
    v7 = objc_msgSend(v3, "hasPrefix:", CFSTR("17E"));
    v6 = &stru_251A7DE60;
    if (v7)
      v6 = CFSTR("YukonE");
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v6, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)getSameScreenSizeModel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "getScreenSize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_251A99240, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)deviceInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  _QWORD v18[9];
  _QWORD v19[11];
  CGSize v20;

  v19[9] = *MEMORY[0x24BDAC8D0];
  +[TypistKeyboardUtilities getMobileGestalt:](TypistKeyboardUtilities, "getMobileGestalt:", CFSTR("BuildVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v2;
  v18[0] = CFSTR("buildVersion");
  v18[1] = CFSTR("serialNumber");
  +[TypistKeyboardUtilities getMobileGestalt:](TypistKeyboardUtilities, "getMobileGestalt:", CFSTR("SerialNumber"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v17;
  v18[2] = CFSTR("hardwareModel");
  +[TypistKeyboardUtilities getMobileGestalt:](TypistKeyboardUtilities, "getMobileGestalt:", CFSTR("HWModelStr"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v16;
  v18[3] = CFSTR("regionInfo");
  +[TypistKeyboardUtilities getMobileGestalt:](TypistKeyboardUtilities, "getMobileGestalt:", CFSTR("RegionInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v3;
  v18[4] = CFSTR("nandCapacity");
  +[TypistKeyboardUtilities getNandCapacity](TypistKeyboardUtilities, "getNandCapacity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v4;
  v18[5] = CFSTR("hardwareRevision");
  +[TypistKeyboardUtilities getHwRevision](TypistKeyboardUtilities, "getHwRevision");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v5;
  v18[6] = CFSTR("build");
  +[TypistKeyboardUtilities getTrainBuildVersion:](TypistKeyboardUtilities, "getTrainBuildVersion:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v6;
  v18[7] = CFSTR("dateGenerated");
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v9;
  v18[8] = CFSTR("displaySize");
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v20.width = v11;
  v20.height = v12;
  NSStringFromCGSize(v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (BOOL)hasFaceID
{
  return MGGetBoolAnswer();
}

+ (BOOL)hasHomeButton
{
  return MGGetBoolAnswer();
}

+ (BOOL)supportsPencil
{
  return MGGetBoolAnswer();
}

+ (id)getScreenSize
{
  void *v2;
  double v3;
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v2 = (void *)MEMORY[0x24BDD17C8];
  GSMainScreenPixelSize();
  v4 = (int)v3;
  GSMainScreenPixelSize();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%dx%d"), v4, (int)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("1536x2048")))
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    +[TypistKeyboardUtilities getMobileGestalt:](TypistKeyboardUtilities, "getMobileGestalt:", CFSTR("main-screen-pitch"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isEqualToString:", CFSTR("326")))
    {
      objc_msgSend(v6, "stringByAppendingString:", CFSTR("Mini"));
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v10;
    }

  }
  return v6;
}

+ (int64_t)toUIDeviceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 4)
    return 0;
  else
    return a3;
}

+ (int64_t)toUIInterfaceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 4)
    return 0;
  else
    return a3;
}

+ (id)sharedFBSOrientationObserver
{
  if (sharedFBSOrientationObserver_sharedFBSOrientationObserverToken != -1)
    dispatch_once(&sharedFBSOrientationObserver_sharedFBSOrientationObserverToken, &__block_literal_global_0);
  return (id)sharedFBSOrientationObserver_sharedFBSOrientationObserver;
}

void __71__TypistKeyboardUtilities_SystemSettings__sharedFBSOrientationObserver__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BE38498]);
  v1 = (void *)sharedFBSOrientationObserver_sharedFBSOrientationObserver;
  sharedFBSOrientationObserver_sharedFBSOrientationObserver = (uint64_t)v0;

}

+ (int64_t)getUIInterfaceOrientation
{
  void *v2;
  int64_t v3;

  objc_msgSend(a1, "sharedFBSOrientationObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "activeInterfaceOrientation");

  if ((unint64_t)(v3 - 1) >= 4)
    return 0;
  else
    return v3;
}

+ (id)getUIDeviceOrientationAsString
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "getUIInterfaceOrientation");
  if ((unint64_t)(v2 - 1) > 3)
    return CFSTR("Unknown");
  else
    return off_251A7CA18[v2 - 1];
}

+ (int64_t)getUIDeviceOrientationFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("Portrait")))
  {
    if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("PortraitUpsideDown")))
    {
      if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("LandscapeLeft")))
        v4 = 4 * (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("LandscapeRight")) == 0);
      else
        v4 = 3;
    }
    else
    {
      v4 = 2;
    }
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (void)setDoNotDisturb:(BOOL)a3
{
  const char *v3;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x24BDAC8D0];
  v3 = "0";
  if (a3)
    v3 = "1";
  v4[0] = "/usr/local/bin/coreautomationd";
  v4[1] = "-command";
  v4[2] = "settings.setDNDManualEnabled:";
  v4[3] = "-int";
  v4[4] = v3;
  v4[5] = 0;
  +[TypistKeyboardUtilities runCommandLineProcess:](TypistKeyboardUtilities, "runCommandLineProcess:", v4);
}

+ (void)setAirplaneMode:(BOOL)a3
{
  const char *v3;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x24BDAC8D0];
  v3 = "NO";
  if (a3)
    v3 = "YES";
  v4[0] = "/usr/local/bin/coreautomationd";
  v4[1] = "-command";
  v4[2] = "networking.setAirplaneModeEnabled:";
  v4[3] = "-BOOL";
  v4[4] = v3;
  v4[5] = 0;
  +[TypistKeyboardUtilities runCommandLineProcess:](TypistKeyboardUtilities, "runCommandLineProcess:", v4);
}

+ (id)sharedRecapInlinePlayer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  char v12;

  v8 = (void *)_inlinePlayer;
  if (!_inlinePlayer)
  {
    TYLog(CFSTR("Creating a new instance of Recap's inline player"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v12);
    v9 = objc_alloc_init(MEMORY[0x24BE7CE40]);
    v10 = (void *)_inlinePlayer;
    _inlinePlayer = (uint64_t)v9;

    v8 = (void *)_inlinePlayer;
  }
  return v8;
}

+ (void)tearDownRecapInlinePlayer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;

  if (_inlinePlayer)
  {
    TYLog(CFSTR("Tearing down Recap's inline player"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
    objc_msgSend((id)_inlinePlayer, "tearDown");
    v8 = (void *)_inlinePlayer;
    _inlinePlayer = 0;

  }
}

+ (void)setTapTouchRadius:(id)a3
{
  objc_storeStrong((id *)&_touchRadiusOverride, a3);
}

+ (void)setRecapFastMode:(BOOL)a3
{
  objc_msgSend(MEMORY[0x24BE7CE40], "setIgnoresCompletionDelay:", a3);
}

+ (void)launchRecap:(id)a3
{
  +[TypistKeyboardUtilities launchRecap:completion:](TypistKeyboardUtilities, "launchRecap:completion:", a3, 0);
}

+ (void)launchRecap:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void (**v26)(_QWORD);
  id v27;
  dispatch_semaphore_t v28;
  _QWORD v29[4];
  NSObject *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  v28 = dispatch_semaphore_create(0);
  if (v5 && objc_msgSend(v5, "count"))
  {
    v26 = v6;
    v7 = (void *)objc_opt_new();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v27 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v32;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v12);
          +[TypistKeyboardUtilities formattedKeyplaneName](TypistKeyboardUtilities, "formattedKeyplaneName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "commandType"))
          {
            TYLog(CFSTR("\n### Recap Command [%@]:\n%@\n###"), v15, v16, v17, v18, v19, v20, v21, (char)v14);
            +[TypistKeyboardUtilities sharedRecapInlinePlayer](TypistKeyboardUtilities, "sharedRecapInlinePlayer");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "eventStream");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "prewarmForEventStream:completion:", v23, 0);

            objc_msgSend(v13, "eventStream");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v29[0] = MEMORY[0x24BDAC760];
            v29[1] = 3221225472;
            v29[2] = __66__TypistKeyboardUtilities_RecapUtilities__launchRecap_completion___block_invoke;
            v29[3] = &unk_251A7C8B0;
            v25 = v28;
            v30 = v25;
            objc_msgSend(v22, "playEventStream:options:completion:", v24, v7, v29);

            dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
          }
          else if (!+[TypistKeyboardUtilities waitForKeyboardPlane:](TypistKeyboardUtilities, "waitForKeyboardPlane:", v13))
          {

            v6 = v26;
            v5 = v27;
            goto LABEL_17;
          }

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v10)
          continue;
        break;
      }
    }

    v6 = v26;
    v5 = v27;
  }
  if (v6)
    v6[2](v6);
LABEL_17:

}

intptr_t __66__TypistKeyboardUtilities_RecapUtilities__launchRecap_completion___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)launchRecapWithSyntheticEventStream:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD v14[5];
  _QWORD v15[3];
  char v16;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = objc_alloc_init(MEMORY[0x24BDD1648]);
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v6 = MEMORY[0x24BDAC760];
  v16 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __79__TypistKeyboardUtilities_RecapUtilities__launchRecapWithSyntheticEventStream___block_invoke;
  v14[3] = &unk_251A7C9D8;
  v14[4] = v15;
  v7 = (void (**)(_QWORD))MEMORY[0x2495B14D4](v14);
  +[TypistKeyboardUtilities sharedRecapInlinePlayer](TypistKeyboardUtilities, "sharedRecapInlinePlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prewarmForEventStream:completion:", v3, 0);

  +[TypistKeyboardUtilities sharedRecapInlinePlayer](TypistKeyboardUtilities, "sharedRecapInlinePlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __79__TypistKeyboardUtilities_RecapUtilities__launchRecapWithSyntheticEventStream___block_invoke_2;
  v11[3] = &unk_251A7CA40;
  v10 = v5;
  v12 = v10;
  v13 = v15;
  objc_msgSend(v9, "playEventStream:options:completion:", v3, v4, v11);

  v7[2](v7);
  _Block_object_dispose(v15, 8);

}

uint64_t __79__TypistKeyboardUtilities_RecapUtilities__launchRecapWithSyntheticEventStream___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
  {
    v1 = result;
    do
      result = +[TypistKeyboardUtilities waitFor:](TypistKeyboardUtilities, "waitFor:", 0.02);
    while (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24));
  }
  return result;
}

uint64_t __79__TypistKeyboardUtilities_RecapUtilities__launchRecapWithSyntheticEventStream___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "tryLock");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    return objc_msgSend(*(id *)(a1 + 32), "unlock");
  }
  return result;
}

+ (id)convertRecapCommands:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)MEMORY[0x2495B1348]();
  v5 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("actions"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8 && objc_msgSend(v8, "count"))
        objc_msgSend(v5, "addObjectsFromArray:", v9);

      ++v6;
    }
    while (objc_msgSend(v3, "count") > v6);
  }
  +[TypistKeyboardUtilities convertRecapCommandsFromListOfActions:](TypistKeyboardUtilities, "convertRecapCommandsFromListOfActions:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v10;
}

+ (id)convertRecapCommandsFromListOfActions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  TYRecapCommand *v7;
  TYRecapCommand *v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t *v19;
  _QWORD v20[3];
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v5 = (void *)objc_opt_new();
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__0;
    v32 = __Block_byref_object_dispose__0;
    v33 = (id)objc_opt_new();
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__0;
    v26 = __Block_byref_object_dispose__0;
    v27 = (id)objc_opt_new();
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v21 = 0;
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __81__TypistKeyboardUtilities_RecapUtilities__convertRecapCommandsFromListOfActions___block_invoke;
    v15 = &unk_251A7CA68;
    v17 = v20;
    v18 = &v28;
    v19 = &v22;
    v6 = v5;
    v16 = v6;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v12);
    if (objc_msgSend((id)v29[5], "length", v12, v13, v14, v15))
    {
      v7 = [TYRecapCommand alloc];
      v8 = -[TYRecapCommand initWithCommandType:commandString:commandDescription:](v7, "initWithCommandType:commandString:commandDescription:", 1, v29[5], v23[5]);
      objc_msgSend(v6, "addObject:", v8);

    }
    v9 = v16;
    v10 = v6;

    _Block_object_dispose(v20, 8);
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(&v28, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __81__TypistKeyboardUtilities_RecapUtilities__convertRecapCommandsFromListOfActions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  TYRecapCommand *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  TYRecapCommand *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  const __CFString *v52;
  void *v53;
  void *v54;
  id v55;

  v55 = a2;
  objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("action"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("waitfor")))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length"))
    {
      v4 = -[TYRecapCommand initWithCommandType:commandString:commandDescription:]([TYRecapCommand alloc], "initWithCommandType:commandString:commandDescription:", 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
      v5 = objc_opt_new();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      v8 = objc_opt_new();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
    v11 = [TYRecapCommand alloc];
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("plane"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ %@ "), v3, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("plane"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Waiting for plane: %@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[TYRecapCommand initWithCommandType:commandString:commandDescription:](v11, "initWithCommandType:commandString:commandDescription:", 0, v14, v17);

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v18);
    goto LABEL_7;
  }
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("wait")))
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("drag")))
    {
      v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("x"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("y"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("time"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("time"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "appendFormat:", CFSTR("d %@ %@ %@ "), v21, v22, v24);

      }
      else
      {
        objc_msgSend(v20, "appendFormat:", CFSTR("d %@ %@ %@ "), v21, v22, CFSTR("0.7"));
      }

      v30 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("key"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "appendFormat:", CFSTR(", dragging to %@"), v31);
    }
    else
    {
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("flick")) & 1) == 0
        && (objc_msgSend(v3, "isEqualToString:", CFSTR("flick-down")) & 1) == 0
        && (objc_msgSend(v3, "isEqualToString:", CFSTR("flick-down-left")) & 1) == 0
        && (objc_msgSend(v3, "isEqualToString:", CFSTR("flick-down-right")) & 1) == 0
        && (objc_msgSend(v3, "isEqualToString:", CFSTR("flick-up")) & 1) == 0
        && (objc_msgSend(v3, "isEqualToString:", CFSTR("flick-left")) & 1) == 0
        && !objc_msgSend(v3, "isEqualToString:", CFSTR("flick-right")))
      {
        if (objc_msgSend(v3, "isEqualToString:", CFSTR("taphold")))
        {
          if (_touchRadiusOverride)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("r %@ "), _touchRadiusOverride);
            v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v18 = &stru_251A7DE60;
          }
          v39 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("x"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("y"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("time"));
          v42 = objc_claimAutoreleasedReturnValue();
          v43 = (void *)v42;
          v44 = CFSTR("0.75");
          if (v42)
            v44 = (const __CFString *)v42;
          objc_msgSend(v39, "appendFormat:", CFSTR("t %@ %@ %@%@ "), v40, v41, v18, v44);

          if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "length"))
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "appendString:", CFSTR(", "));
          v45 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("key"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "appendFormat:", CFSTR("Tap+hold %@"), v46);

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
          goto LABEL_7;
        }
        if (objc_msgSend(v3, "isEqualToString:", CFSTR("mt")))
        {
          v33 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("argumentList"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "appendFormat:", CFSTR("mt %@"), v34);

          v35 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          v36 = CFSTR("multitouch: ");
        }
        else
        {
          if (!objc_msgSend(v3, "isEqualToString:", CFSTR("st")))
          {
            if (_touchRadiusOverride)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("r %@ "), _touchRadiusOverride);
              v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v18 = &stru_251A7DE60;
            }
            v47 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
            objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("x"));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("y"));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "appendFormat:", CFSTR("t %@ %@ %@"), v48, v49, v18);

            if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
            {
              v50 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
              v51 = objc_msgSend(v50, "length");
              v52 = CFSTR(", ");
              if (!v51)
                v52 = &stru_251A7DE60;
              objc_msgSend(v50, "appendFormat:", CFSTR("%@Tapping "), v52);
            }
            v53 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
            objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("key"));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "appendFormat:", CFSTR("%@"), v54);

            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
            goto LABEL_7;
          }
          v37 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("argumentList"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "appendFormat:", CFSTR("st %@"), v38);

          v35 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          v36 = CFSTR("stylustouch: ");
        }
        objc_msgSend(v35, "appendFormat:", v36);
LABEL_25:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
        goto LABEL_26;
      }
      v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("x"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("y"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("time"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("time"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "appendFormat:", CFSTR("f %@ %@ %@ "), v26, v27, v29);

      }
      else
      {
        objc_msgSend(v25, "appendFormat:", CFSTR("f %@ %@ %@ "), v26, v27, CFSTR("0.1"));
      }

      v32 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("key"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "appendFormat:", CFSTR(", flicking to %@"), v31);
    }

    goto LABEL_25;
  }
  v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("time"));
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "appendFormat:", CFSTR("%@ %@ "), v3, v18);
LABEL_7:

LABEL_26:
}

+ (BOOL)waitForKeyboardPlane:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char IsSameAs;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v26;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commandString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class switchToPlane:](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "switchToPlane:", v8);
  v9 = 20;
  while (1)
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", 0.15);
    if (currentKeyboardPlaneIsSameAs(v8))
      break;
    if (!--v9)
      goto LABEL_6;
  }
  TYLog(CFSTR("Waiting done. Expected keyboard plane has been detected."), v10, v11, v12, v13, v14, v15, v16, v26);
LABEL_6:
  IsSameAs = currentKeyboardPlaneIsSameAs(v8);
  if ((IsSameAs & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 3.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    TYLogl(OS_LOG_TYPE_ERROR, CFSTR("### Expected keyboard plane not detected! Timeout after %@ seconds; Recap operation aborted!"),
      v19,
      v20,
      v21,
      v22,
      v23,
      v24,
      (char)v18);

  }
  return IsSameAs;
}

+ (id)replaceWaitForKeyboardPlane:(id)a3 withWait:(double)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (id)objc_msgSend(a3, "copy");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (!objc_msgSend(v10, "commandType"))
        {
          v11 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", CFSTR("wait %@ "), v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Waiting %f in lieu of detecting keyplane availability"), *(_QWORD *)&a4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "updateCommand:commandString:commandDescription:", 1, v13, v14);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v5;
}

+ (BOOL)setPrefSettings:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  v4 = (id)-[objc_class setTIPreferences:](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "setTIPreferences:", v3);
  v5 = (id)-[objc_class setKeyboardUISettings:](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "setKeyboardUISettings:", v3);

  return 1;
}

+ (id)getKeyboardsForKeyboardSetting
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)setKeyboardForKeyboardSetting:(id)a3
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = +[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v3, 0);

  -[objc_class setKeyboards:](v4, "setKeyboards:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)appendKeyboardForKeyboardSetting:(id)a3
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = +[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v3, 0);

  -[objc_class addKeyboards:](v4, "addKeyboards:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)removeKeyboardForKeyboardSetting:(id)a3
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = +[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v3, 0);

  -[objc_class removeKeyboards:](v4, "removeKeyboards:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)setKeyboardDictation:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v3 = a3;
  v4 = +[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData");
  v5 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithObject:forKey:", v6, CFSTR("dictation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class setKeyboardUISettings:](v4, "setKeyboardUISettings:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dictation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 != 0;

  return v10;
}

+ (BOOL)isDictationSupported:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_4;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("_"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("-"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(MEMORY[0x24BE091B8], "dictationIsSupportedForLanguageCode:error:", v8, 0);

  }
  else
  {
LABEL_4:
    v9 = 0;
  }

  return v9;
}

+ (BOOL)shouldShowDictationKey
{
  void *v2;
  void *v3;
  char v4;

  -[objc_class getKeyboardUISettings](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getKeyboardUISettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("shouldShowDictationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)shouldShowGlobeKey
{
  void *v2;
  void *v3;
  char v4;

  -[objc_class getKeyboardUISettings](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getKeyboardUISettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("shouldShowGlobeKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)allOneTimeActionsAlreadyTriggered
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "oneTimeActionCompleted:", *MEMORY[0x24BEB4F30]))
  {
    objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "oneTimeActionCompleted:", *MEMORY[0x24BEB5230]))
    {
      objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "oneTimeActionCompleted:", *MEMORY[0x24BEB4F80]))
      {
        objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "oneTimeActionCompleted:", *MEMORY[0x24BEB4F28]);

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)triggerAllTIOneTimeActions
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v13;

  TYLogl(OS_LOG_TYPE_DEFAULT, CFSTR("Triggering all one time actions to YES"), v2, v3, v4, v5, v6, v7, v13);
  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didTriggerOneTimeAction:", *MEMORY[0x24BEB4F30]);

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didTriggerOneTimeAction:", *MEMORY[0x24BEB5230]);

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didTriggerOneTimeAction:", *MEMORY[0x24BEB4F80]);

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didTriggerOneTimeAction:", *MEMORY[0x24BEB4F28]);

  return +[TypistKeyboardUtilities allOneTimeActionsAlreadyTriggered](TypistKeyboardUtilities, "allOneTimeActionsAlreadyTriggered");
}

+ (BOOL)inhibitGlobalAlerts:(BOOL)a3
{
  uint64_t v3;

  v3 = assertion;
  if (a3)
  {
    if (!assertion)
    {
      v3 = SBSAlertItemsSuppressionAssertionCreate();
LABEL_6:
      assertion = v3;
    }
  }
  else if (assertion)
  {
    CFRelease((CFTypeRef)assertion);
    v3 = 0;
    goto LABEL_6;
  }
  return v3 != 0;
}

+ (BOOL)getAutoCapitalizationPrefSetting
{
  void *v2;
  void *v3;
  char v4;

  -[objc_class getTIPreferences](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getTIPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BEB5058]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)getAutoCorrectionPrefSetting
{
  void *v2;
  void *v3;
  char v4;

  -[objc_class getTIPreferences](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getTIPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BEB5060]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)getCheckSpellingPrefSetting
{
  void *v2;
  void *v3;
  char v4;

  -[objc_class getTIPreferences](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getTIPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BEB5078]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)getPeriodShortcutPrefSetting
{
  void *v2;
  void *v3;
  char v4;

  -[objc_class getTIPreferences](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getTIPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BEB50C0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)getCapsLockPrefSetting
{
  void *v2;
  void *v3;
  char v4;

  -[objc_class getTIPreferences](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getTIPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BEB5070]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)getPredictivePrefSetting
{
  void *v2;
  void *v3;
  char v4;

  -[objc_class getTIPreferences](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getTIPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BEB50C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)getFuzzyPinyinPrefSetting
{
  void *v2;
  void *v3;
  char v4;

  -[objc_class getTIPreferences](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getTIPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BEB4F58]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)getKeyPaddlePrefSetting
{
  void *v2;
  void *v3;
  char v4;

  -[objc_class getTIPreferences](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getTIPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BEB5050]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)getSmartQuotesPrefSetting
{
  void *v2;
  void *v3;
  char v4;

  -[objc_class getTIPreferences](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getTIPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BEB5118]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)getSmartDashesPrefSetting
{
  void *v2;
  void *v3;
  char v4;

  -[objc_class getTIPreferences](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getTIPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BEB5108]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)getGestureKeyPrefSetting
{
  void *v2;
  void *v3;
  char v4;

  -[objc_class getKeyboardUISettings](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getKeyboardUISettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDF7960]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)getSmallDisplayPrefSetting
{
  void *v2;
  void *v3;
  char v4;

  -[objc_class getKeyboardUISettings](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getKeyboardUISettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("LowerCaseKeyboard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)getTypologyEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[objc_class getTIPreferences](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getTIPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BEB5228]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)getDictationEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[objc_class getKeyboardUISettings](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getKeyboardUISettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("dictation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)getSmartFullWidthSetting
{
  void *v2;
  void *v3;
  char v4;

  -[objc_class getTIPreferences](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getTIPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BEB5110]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (int)getShuangpinPrefSetting
{
  void *v2;
  void *v3;
  int v4;

  -[objc_class getTIPreferences](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getTIPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BEB5100]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

+ (BOOL)getHWKeyboardCapsLockRomanSwitchPrefSetting
{
  void *v2;
  void *v3;
  char v4;

  -[objc_class getTIPreferences](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getTIPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BEB4F70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (int)getWubiPrefSetting
{
  void *v2;
  void *v3;
  int v4;

  -[objc_class getTIPreferences](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getTIPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BEB5238]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

+ (id)getAggregatedTIPreferences
{
  return (id)-[objc_class getTIPreferences](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getTIPreferences");
}

+ (id)getOneHandedKeyboardHandBias
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[objc_class getKeyboardUISettings](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getKeyboardUISettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BEB5068]);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("Unknown");
  v5 = v3;

  return v5;
}

+ (id)setOneHandedKeyboardHandBias:(id)a3
{
  id v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = +[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData");
  v5 = *MEMORY[0x24BEB5068];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v3, *MEMORY[0x24BEB5068]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[objc_class setKeyboardUISettings:](v4, "setKeyboardUISettings:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)isFloating
{
  void *v2;
  void *v3;
  char v4;

  -[objc_class getKeyboardUISettings](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getKeyboardUISettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("floatingKeyboard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (void)setFloatingKeyboard:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  v4 = +[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData");
  v5 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithObject:forKey:", v8, CFSTR("floatingKeyboard"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)-[objc_class setKeyboardUISettings:](v4, "setKeyboardUISettings:", v6);

}

+ (CGPoint)floatingKeyboardDraggablePoint
{
  double v2;
  double v3;
  CGPoint result;

  -[objc_class floatingKeyboardDraggablePoint](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "floatingKeyboardDraggablePoint");
  result.y = v3;
  result.x = v2;
  return result;
}

+ (id)getRegionCodeFromKeyboardID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("@"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17E8];
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchText:withPattern:", v5, CFSTR("_[a-zA-Z]+-"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "range");
    objc_msgSend(v7, "substringWithRange:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("-_"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDD17E8];
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "matchText:withPattern:", v14, CFSTR("[a-zA-Z]+_[a-zA-Z]+"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v12 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v10, "range");
    objc_msgSend(v15, "substringWithRange:", v16, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("_"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_6:

  return v12;
}

+ (void)correctForRotation:(CGVector *)a3 orientation:(int64_t)a4
{
  double dy;
  double dx;

  switch(a4)
  {
    case 4:
      dy = a3->dy;
      dx = -a3->dx;
LABEL_7:
      a3->dx = dy;
      a3->dy = dx;
      return;
    case 3:
      dx = a3->dx;
      dy = -a3->dy;
      goto LABEL_7;
    case 2:
      *(float64x2_t *)a3 = vnegq_f64(*(float64x2_t *)a3);
      break;
  }
}

+ (id)formattedKeyplaneName
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  -[objc_class getVisibleKeyplaneName](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getVisibleKeyplaneName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "containsString:", CFSTR("_")))
  {
    objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("_"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lowercaseString");
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
  }
  return v2;
}

+ (id)searchForWindow:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__4;
  v14 = __Block_byref_object_dispose__4;
  v15 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__TypistKeyboardUtilities_KeyboardUI__searchForWindow___block_invoke;
  v7[3] = &unk_251A7CA40;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __55__TypistKeyboardUtilities_KeyboardUI__searchForWindow___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6FF8], "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        NSClassFromString(*(NSString **)(a1 + 32));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

+ (id)searchForViewInKeyboardWindow:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__4;
  v14 = __Block_byref_object_dispose__4;
  v15 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__TypistKeyboardUtilities_KeyboardUI__searchForViewInKeyboardWindow___block_invoke;
  v7[3] = &unk_251A7CA40;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __69__TypistKeyboardUtilities_KeyboardUI__searchForViewInKeyboardWindow___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  +[TypistKeyboardUtilities searchForWindow:](TypistKeyboardUtilities, "searchForWindow:", CFSTR("UIRemoteKeyboardWindow"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allSubViews");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        NSClassFromString(*(NSString **)(a1 + 32));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v8);
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

+ (CGRect)findKeyBoundsInKeyboard:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v3 = a3;
  -[objc_class findKeyBoundsInKeyboard:](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "findKeyBoundsInKeyboard:", v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

+ (id)getRootViewControllerViaScene
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectedScenes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__TypistKeyboardUtilities_KeyboardUI__getRootViewControllerViaScene__block_invoke;
  v6[3] = &unk_251A7CD10;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __68__TypistKeyboardUtilities_KeyboardUI__getRootViewControllerViaScene__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!objc_msgSend(v3, "activationState") || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "windows");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v9, "isKeyWindow", (_QWORD)v13))
          {
            objc_msgSend(v9, "rootViewController");
            v10 = objc_claimAutoreleasedReturnValue();
            v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
            v12 = *(void **)(v11 + 40);
            *(_QWORD *)(v11 + 40) = v10;

            goto LABEL_13;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

  }
}

+ (id)captureCurrentKeyboardImage
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  UIImage *v27;
  void *v28;
  _QWORD v30[5];
  _QWORD v31[7];
  _QWORD v32[6];
  uint64_t v33;
  double *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  double *v46;
  uint64_t v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  double *v52;
  uint64_t v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  CGSize v63;

  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__4;
  v61 = __Block_byref_object_dispose__4;
  v62 = 0;
  v51 = 0;
  v52 = (double *)&v51;
  v53 = 0x4010000000;
  v54 = &unk_2494BA09E;
  v55 = 0u;
  v56 = 0u;
  v45 = 0;
  v46 = (double *)&v45;
  v47 = 0x4010000000;
  v48 = &unk_2494BA09E;
  v49 = 0u;
  v50 = 0u;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__4;
  v43 = __Block_byref_object_dispose__4;
  v44 = 0;
  v33 = 0;
  v34 = (double *)&v33;
  v35 = 0x3010000000;
  v37 = 0;
  v38 = 0;
  v36 = &unk_2494BA09E;
  v2 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __66__TypistKeyboardUtilities_KeyboardUI__captureCurrentKeyboardImage__block_invoke;
  v32[3] = &unk_251A7CD38;
  v32[4] = &v57;
  v32[5] = &v45;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v32);
  if (v58[5])
  {
    v31[0] = v2;
    v31[1] = 3221225472;
    v31[2] = __66__TypistKeyboardUtilities_KeyboardUI__captureCurrentKeyboardImage__block_invoke_2;
    v31[3] = &unk_251A7CD60;
    v31[4] = &v51;
    v31[5] = &v57;
    v31[6] = &v33;
    +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v31);
    v30[0] = v2;
    v30[1] = 3221225472;
    v30[2] = __66__TypistKeyboardUtilities_KeyboardUI__captureCurrentKeyboardImage__block_invoke_3;
    v30[3] = &unk_251A7C9D8;
    v30[4] = &v39;
    +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v30);
    objc_msgSend((id)v40[5], "size");
    v10 = v9;
    objc_msgSend((id)v40[5], "size");
    if (v10 >= v11)
    {
      objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "model");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("iPhone"));

      if (v19)
      {
        v20 = v34[4];
        objc_msgSend((id)v40[5], "size");
        v14 = v21;
        objc_msgSend((id)v40[5], "size");
        v13 = -v20;
        v15 = v22 - v34[4];
        v12 = 0.0;
      }
      else
      {
        v23 = v34[5];
        objc_msgSend((id)v40[5], "size");
        v12 = v23 - v24;
        v13 = -v34[4];
        v14 = v52[6];
        v15 = v52[7];
      }
    }
    else
    {
      v12 = -v34[4];
      v13 = -v34[5];
      v14 = v52[6];
      v15 = v52[7] + v46[6];
    }
    objc_msgSend((id)v40[5], "scale");
    v26 = v25;
    v63.width = v14;
    v63.height = v15;
    UIGraphicsBeginImageContextWithOptions(v63, 0, v26);
    objc_msgSend((id)v40[5], "drawAtPoint:", v12, v13);
    UIGraphicsGetImageFromCurrentImageContext();
    v27 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    UIImagePNGRepresentation(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      UIImagePNGRepresentation(v27);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    TYLogl(OS_LOG_TYPE_ERROR, CFSTR("ERROR: No active keyboard found to capture"), v3, v4, v5, v6, v7, v8, v30[0]);
    v16 = 0;
  }
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);

  return v16;
}

void __66__TypistKeyboardUtilities_KeyboardUI__captureCurrentKeyboardImage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  objc_msgSend(MEMORY[0x24BDF6B18], "activeKeyboard");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaInsets");
  v7 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v7[4] = v8;
  v7[5] = v9;
  v7[6] = v10;
  v7[7] = v11;

}

void __66__TypistKeyboardUtilities_KeyboardUI__captureCurrentKeyboardImage__block_invoke_2(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "bounds");
  v2 = *(_QWORD **)(a1[4] + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  v7 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  objc_msgSend(v7, "origin");
  v9 = v8;
  v11 = v10;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rootViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertPoint:toView:", v15, v9, v11);
  v16 = *(_QWORD *)(a1[6] + 8);
  *(_QWORD *)(v16 + 32) = v17;
  *(_QWORD *)(v16 + 40) = v18;

}

void __66__TypistKeyboardUtilities_KeyboardUI__captureCurrentKeyboardImage__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6AA0], "defaultFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(MEMORY[0x24BDF6FF8], "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v6);
        v8 = objc_alloc(MEMORY[0x24BDF6A98]);
        objc_msgSend(v7, "layer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bounds");
        v12 = (void *)objc_msgSend(v8, "initWithSize:format:", v2, v10, v11);

        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = __66__TypistKeyboardUtilities_KeyboardUI__captureCurrentKeyboardImage__block_invoke_4;
        v17[3] = &unk_251A7CD88;
        v17[4] = v7;
        objc_msgSend(v12, "imageWithActions:", v17);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v15 = *(void **)(v14 + 40);
        *(_QWORD *)(v14 + 40) = v13;

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }

}

void __66__TypistKeyboardUtilities_KeyboardUI__captureCurrentKeyboardImage__block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  objc_msgSend(v1, "drawViewHierarchyInRect:afterScreenUpdates:", 1);

}

+ (BOOL)hasMarkedText
{
  return -[objc_class hasMarkedText](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "hasMarkedText");
}

+ (id)markedText
{
  return (id)-[objc_class markedText](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "markedText");
}

@end
