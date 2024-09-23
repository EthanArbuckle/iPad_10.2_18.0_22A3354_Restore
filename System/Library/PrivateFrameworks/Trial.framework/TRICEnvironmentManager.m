@implementation TRICEnvironmentManager

+ (BOOL)validateTrialPath:(id)a3 requireUserPath:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a4;
  objc_msgSend(a3, "pathComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1, "trialDaemonUserName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && !objc_msgSend(v6, "containsObject:", v7))
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v6, "lastObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Trial"));

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (int)resetDaemonProcess
{
  int result;
  int *v3;
  void *v4;
  int v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  if (geteuid())
    +[TRICPrinter printNewlineAndLogErrorWithFormat:](TRICPrinter, "printNewlineAndLogErrorWithFormat:", CFSTR("Warning: Running reset without root access. Please ensure you are running reset as root."));
  +[TRICCommandRunner runCommand:withArgs:](TRICCommandRunner, "runCommand:withArgs:", CFSTR("/bin/launchctl"), &unk_1E3C19430);
  if (getuid())
  {
    result = +[TRICCommandRunner runCommand:withArgs:](TRICCommandRunner, "runCommand:withArgs:", CFSTR("/usr/bin/killall"), &unk_1E3C19448);
    if (!result)
      return result;
    v3 = __error();
    +[TRICPrinter printNewlineAndLogErrorWithFormat:](TRICPrinter, "printNewlineAndLogErrorWithFormat:", CFSTR("Error killing triald. Error: %s"), strerror(*v3));
  }
  else
  {
    v6[0] = CFSTR("unload");
    v6[1] = CFSTR("/System/Library/LaunchDaemons/com.apple.triald.plist");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[TRICCommandRunner runCommand:withArgs:](TRICCommandRunner, "runCommand:withArgs:", CFSTR("/bin/launchctl"), v4);

    if (!v5)
      return 0;
    +[TRICPrinter printNewlineAndLogErrorWithFormat:](TRICPrinter, "printNewlineAndLogErrorWithFormat:", CFSTR("Error unloading triald at %@"), CFSTR("/System/Library/LaunchDaemons/com.apple.triald.plist"));
  }
  return 1;
}

+ (int)checkDeviceUnlocked
{
  int result;

  result = objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked");
  if (result)
  {
    fwrite("Error: Device has not been unlocked since reboot, please unlock to use trialcontroller\n", 0x57uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
    return 3;
  }
  return result;
}

+ (int64_t)currentEnv
{
  void *v2;
  int v3;
  id v4;
  id v5;
  int64_t v6;
  int64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("read");
  v11[1] = CFSTR("com.apple.triald");
  v11[2] = CFSTR("com.apple.triald.ck.serverEnvironment");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = 0;
  v3 = +[TRICCommandRunner runCommandAsTrialDaemonUserName:withArgs:output:error:](TRICCommandRunner, "runCommandAsTrialDaemonUserName:withArgs:output:error:", CFSTR("/usr/bin/defaults"), v2, &v10, &v9);
  v4 = v10;
  v5 = v9;

  if (v3)
  {

    v4 = 0;
  }
  if (objc_msgSend(v4, "length"))
  {
    v8 = 0;
    if (+[TRIMisc convertFromString:usingBase:toI64:](TRIMisc, "convertFromString:usingBase:toI64:", v4, 10, &v8))
    {
      v6 = v8;
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

  if (v3)
    +[TRICPrinter printNewlineAndLogErrorWithFormat:](TRICPrinter, "printNewlineAndLogErrorWithFormat:", CFSTR("Unable to read defaults. Error: %@"), 0);

  return v6;
}

+ (int)checkIfConnectedToVPN:(BOOL *)a3
{
  int v4;
  id v5;
  id v6;
  id v8;
  id v9;

  v8 = 0;
  v9 = 0;
  v4 = +[TRICCommandRunner runCommand:withArgs:output:error:](TRICCommandRunner, "runCommand:withArgs:output:error:", CFSTR("/sbin/ifconfig"), &unk_1E3C19460, &v9, &v8);
  v5 = v9;
  v6 = v8;
  *a3 = objc_msgSend(v5, "rangeOfString:", CFSTR("VPN: Corporate")) != 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

+ (id)envToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return CFSTR("UNKNOWN");
  else
    return off_1E3BFE908[a3 - 1];
}

+ (id)trialDaemonUserName
{
  return CFSTR("mobile");
}

+ (const)getLoginPasswd
{
  const passwd *result;
  FILE *v3;
  int *v4;
  char *v5;
  int *v6;

  *__error() = 0;
  result = getpwnam("mobile");
  if (result)
  {
    if (result->pw_uid)
      return result;
    fwrite("Warning: got pwInfo for uid=0.\n", 0x1FuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
  }
  else
  {
    v3 = (FILE *)*MEMORY[0x1E0C80C10];
    v4 = __error();
    v5 = strerror(*v4);
    v6 = __error();
    fprintf(v3, "Warning: failed to get pwInfo: %s (%d)\n", v5, *v6);
  }
  return 0;
}

@end
