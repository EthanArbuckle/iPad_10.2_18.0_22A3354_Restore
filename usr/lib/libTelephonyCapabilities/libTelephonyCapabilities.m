uint64_t capabilities::ct::supportsGemini(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB718);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB718);
    if ((_DWORD)v3)
    {
      byte_2544DB262 = capabilities::ct::sSupportsNVRAMUpdateWithoutBasebandReboot(v3);
      __cxa_guard_release(&qword_2544DB718);
    }
  }
  return byte_2544DB262;
}

void sub_24B9DD5D4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB718);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::shouldLogSIMSlot(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAA58);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAA58))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DA80F = (Radio < 0x12) & (0x3FFD0u >> Radio);
    __cxa_guard_release(&qword_2544DAA58);
  }
  return byte_2544DA80F;
}

void sub_24B9DD660(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAA58);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supports5GSlicing(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB8C0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB8C0);
    if ((_DWORD)v3)
    {
      byte_2544DB294 = capabilities::ct::sSupports5GSlicing(v3);
      __cxa_guard_release(&qword_2544DB8C0);
    }
  }
  return byte_2544DB294;
}

void sub_24B9DD6D4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB8C0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsEnhanced5GCellularHarvesting(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB878);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB878))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB28B = (Radio < 0x12) & (0x23C00u >> Radio);
    __cxa_guard_release(&qword_2544DB878);
  }
  return byte_2544DB28B;
}

void sub_24B9DD760(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB878);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsCoexEur5G(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAAA8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAAA8))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DA817 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_2544DAAA8);
  }
  return byte_2544DA817;
}

void sub_24B9DD7EC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAAA8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsCoexGPSReporting(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAA70);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAA70))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DA812 = (Radio < 0x12) & (0x23F80u >> Radio);
    __cxa_guard_release(&qword_2544DAA70);
  }
  return byte_2544DA812;
}

void sub_24B9DD878(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAA70);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsDynamicSID(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB488);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB488);
    if ((_DWORD)v3)
    {
      byte_2544DB226 = capabilities::ct::sSupportsDynamicSID(v3);
      __cxa_guard_release(&qword_2544DB488);
    }
  }
  return byte_2544DB226;
}

void sub_24B9DD8EC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB488);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsLocalCellularPlanSignup(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB7A0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB7A0))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB272 = (Radio < 0x12) & (0x2FF80u >> Radio);
    __cxa_guard_release(&qword_2544DB7A0);
  }
  return byte_2544DB272;
}

void sub_24B9DD978(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB7A0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::defaultVinylCardTypeToGSMA(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB688);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB688))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB257 = (Radio < 0x12) & (0x3FF90u >> Radio);
    __cxa_guard_release(&qword_2544DB688);
  }
  return byte_2544DB257;
}

void sub_24B9DDA04(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB688);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsSequoia(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB430);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB430);
    if ((_DWORD)v3)
    {
      byte_2544DB222 = capabilities::ct::sSupportsSequoia(v3);
      __cxa_guard_release(&qword_2544DB430);
    }
  }
  return byte_2544DB222;
}

void sub_24B9DDA78(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB430);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsDualSIMSingleStackWithCrossMapping(capabilities::ct *this)
{
  unsigned __int8 v1;
  int Product;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB7B8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB7B8))
  {
    Product = TelephonyRadiosGetProduct();
    byte_2544DB275 = ((Product - 82) < 0x29) & (0x10042007183uLL >> (Product - 82));
    __cxa_guard_release(&qword_2544DB7B8);
  }
  return byte_2544DB275;
}

void sub_24B9DDB0C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB7B8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::dataOnlySingleSIMDevice(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB6E8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB6E8);
    if ((_DWORD)v3)
    {
      byte_2544DB25C = capabilities::ct::sDataOnlySingleSIMDevice(v3);
      __cxa_guard_release(&qword_2544DB6E8);
    }
  }
  return byte_2544DB25C;
}

void sub_24B9DDB80(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB6E8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::defaultVinylSlotID(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB460);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB460))
  {
    v3 = TelephonyRadiosGetRadio() - 2;
    if (v3 > 0xF)
      v4 = 0;
    else
      v4 = dword_24BA00558[v3];
    dword_2544DB2C4 = v4;
    __cxa_guard_release(&qword_2544DB460);
  }
  return dword_2544DB2C4;
}

void sub_24B9DDC14(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB460);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsVoiceCall(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB618);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB618);
    if ((_DWORD)v3)
    {
      byte_2544DB249 = capabilities::ct::sSupportsVoiceCall(v3);
      __cxa_guard_release(&qword_2544DB618);
    }
  }
  return byte_2544DB249;
}

void sub_24B9DDC88(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB618);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsSystemSelectionInternationalCDMARoaming(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB428);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB428))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB221 = (Radio < 0x12) & (0x2378Cu >> Radio);
    __cxa_guard_release(&qword_2544DB428);
  }
  return byte_2544DB221;
}

void sub_24B9DDD14(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB428);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsCapabilityC2KDevice(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB4B0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB4B0);
    if ((_DWORD)v3)
    {
      byte_2544DB228 = capabilities::ct::sSupportsCapabilityC2KDevice(v3);
      __cxa_guard_release(&qword_2544DB4B0);
    }
  }
  return byte_2544DB228;
}

void sub_24B9DDD88(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB4B0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsDataQMIExtensions(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB838);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB838))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB283 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_2544DB838);
  }
  return byte_2544DB283;
}

void sub_24B9DDE14(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB838);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsMultipleThumpers(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB328);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB328))
  {
    byte_2544DB209 = 0;
    __cxa_guard_release(&qword_2544DB328);
  }
  return byte_2544DB209;
}

uint64_t capabilities::ct::supportsThumperService(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB3F0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB3F0);
    if ((_DWORD)v3)
    {
      byte_2544DB21B = capabilities::ct::sSupportsThumperService(v3);
      __cxa_guard_release(&qword_2544DB3F0);
    }
  }
  return byte_2544DB21B;
}

void sub_24B9DDED8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB3F0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::LASDRecordMaxCount(capabilities::ct *this)
{
  unsigned __int8 v1;
  int Radio;
  BOOL v4;
  uint64_t v5;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB588);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB588))
  {
    Radio = TelephonyRadiosGetRadio();
    v4 = Radio == 16 || Radio == 4;
    v5 = 50;
    if (v4)
      v5 = 100;
    qword_2544DB580 = v5;
    __cxa_guard_release(&qword_2544DB588);
  }
  return qword_2544DB580;
}

void sub_24B9DDF5C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB588);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsCellRadio(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB420);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB420);
    if ((_DWORD)v3)
    {
      byte_2544DB220 = capabilities::ct::sSupportsCellRadio(v3);
      __cxa_guard_release(&qword_2544DB420);
    }
  }
  return byte_2544DB220;
}

void sub_24B9DDFD0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB420);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsStewie(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB910);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB910);
    if ((_DWORD)v3)
    {
      byte_2544DB29E = capabilities::ct::sSupportsStewie(v3);
      __cxa_guard_release(&qword_2544DB910);
    }
  }
  return byte_2544DB29E;
}

void sub_24B9DE044(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB910);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsVoNR(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB868);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB868);
    if ((_DWORD)v3)
    {
      byte_2544DB289 = capabilities::ct::sSupportsVoNR(v3);
      __cxa_guard_release(&qword_2544DB868);
    }
  }
  return byte_2544DB289;
}

void sub_24B9DE0B8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB868);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supports5G(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB830);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB830))
  {
    byte_2544DB282 = TelephonyRadiosGetRadio() - 9 < 9;
    __cxa_guard_release(&qword_2544DB830);
  }
  return byte_2544DB282;
}

void sub_24B9DE138(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB830);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::ABMLogEnabled(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA840);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA840))
  {
    _MergedGlobals = 0;
    __cxa_guard_release(&qword_2544DA840);
  }
  return _MergedGlobals;
}

uint64_t capabilities::abs::ABMLogHistory(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA850);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA850))
  {
    qword_2544DA848 = 4;
    __cxa_guard_release(&qword_2544DA850);
  }
  return qword_2544DA848;
}

uint64_t capabilities::abs::TUDebugFlags(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA858);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA858))
  {
    dword_2544DA828 = 10;
    __cxa_guard_release(&qword_2544DA858);
  }
  return dword_2544DA828;
}

uint64_t capabilities::abs::fileSystemFlushInterval(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA868);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA868))
  {
    qword_2544DA860 = 7200;
    __cxa_guard_release(&qword_2544DA868);
  }
  return qword_2544DA860;
}

uint64_t capabilities::abs::shouldForceSyncFileSystem(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA870);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA870))
  {
    byte_2544DA7F1 = 0;
    __cxa_guard_release(&qword_2544DA870);
  }
  return byte_2544DA7F1;
}

uint64_t capabilities::abs::shouldBoot(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA878);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA878))
  {
    byte_2544DA7F2 = 1;
    __cxa_guard_release(&qword_2544DA878);
  }
  return byte_2544DA7F2;
}

uint64_t capabilities::abs::shouldBlockResets(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA880);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA880))
  {
    byte_2544DA7F3 = 0;
    __cxa_guard_release(&qword_2544DA880);
  }
  return byte_2544DA7F3;
}

void capabilities::abs::logScratchPath(std::string *a1@<X8>)
{
  unsigned __int8 v2;
  std::string *v3;
  int v4;

  v2 = atomic_load((unsigned __int8 *)&qword_2544DA888);
  if ((v2 & 1) == 0)
  {
    v3 = a1;
    v4 = __cxa_guard_acquire(&qword_2544DA888);
    a1 = v3;
    if (v4)
    {
      memset(&xmmword_2544DABE8, 170, 24);
      std::string::basic_string[abi:ne180100]<0>(&xmmword_2544DABE8, "/private/var/wireless/Library/Logs/AppleBasebandManager/");
      __cxa_atexit(MEMORY[0x24BEDACF0], &xmmword_2544DABE8, &dword_24B9DC000);
      __cxa_guard_release(&qword_2544DA888);
      a1 = v3;
    }
  }
  if (byte_2544DABFF < 0)
  {
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)xmmword_2544DABE8, *((std::string::size_type *)&xmmword_2544DABE8 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_2544DABE8;
    a1->__r_.__value_.__r.__words[2] = unk_2544DABF8;
  }
}

void sub_24B9DE440(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DA888);
  _Unwind_Resume(a1);
}

void capabilities::abs::logSnapshotPath(std::string *a1@<X8>)
{
  unsigned __int8 v2;
  std::string *v3;
  int v4;

  v2 = atomic_load((unsigned __int8 *)&qword_2544DA890);
  if ((v2 & 1) == 0)
  {
    v3 = a1;
    v4 = __cxa_guard_acquire(&qword_2544DA890);
    a1 = v3;
    if (v4)
    {
      memset(&xmmword_2544DAC00, 170, 24);
      std::string::basic_string[abi:ne180100]<0>(&xmmword_2544DAC00, "/private/var/wireless/Library/Logs/CrashReporter/Baseband/");
      __cxa_atexit(MEMORY[0x24BEDACF0], &xmmword_2544DAC00, &dword_24B9DC000);
      __cxa_guard_release(&qword_2544DA890);
      a1 = v3;
    }
  }
  if (byte_2544DAC17 < 0)
  {
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)xmmword_2544DAC00, *((std::string::size_type *)&xmmword_2544DAC00 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_2544DAC00;
    a1->__r_.__value_.__r.__words[2] = unk_2544DAC10;
  }
}

void sub_24B9DE524(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DA890);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::shouldTriggerCoreDumpOnSoftResetTimeout(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA898);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA898))
  {
    byte_2544DA7F4 = 0;
    __cxa_guard_release(&qword_2544DA898);
  }
  return byte_2544DA7F4;
}

uint64_t capabilities::abs::shouldTriggerStackshotOnShutdownTimeout(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA8A0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA8A0))
  {
    byte_2544DA7F5 = 0;
    __cxa_guard_release(&qword_2544DA8A0);
  }
  return byte_2544DA7F5;
}

uint64_t capabilities::abs::shouldPanicOnBasebandReset(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA8A8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA8A8))
  {
    byte_2544DA7F6 = 0;
    __cxa_guard_release(&qword_2544DA8A8);
  }
  return byte_2544DA7F6;
}

uint64_t capabilities::abs::CPMSDebounceTimer(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA8B8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA8B8))
  {
    qword_2544DA8B0 = 5;
    __cxa_guard_release(&qword_2544DA8B8);
  }
  return qword_2544DA8B0;
}

uint64_t capabilities::abs::dataAggregationProtocol(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA8C0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA8C0))
  {
    byte_2544DA7F7 = 2;
    __cxa_guard_release(&qword_2544DA8C0);
  }
  return byte_2544DA7F7;
}

uint64_t capabilities::abs::defaultDataInterfaceID(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA8C8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA8C8))
  {
    dword_2544DA82C = 4;
    __cxa_guard_release(&qword_2544DA8C8);
  }
  return dword_2544DA82C;
}

uint64_t capabilities::abs::dataAggregationDatagramMaxCount(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA8D8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA8D8))
  {
    qword_2544DA8D0 = 32;
    __cxa_guard_release(&qword_2544DA8D8);
  }
  return qword_2544DA8D0;
}

uint64_t capabilities::abs::dataAggregationMaxSizeBytes(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA8E8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA8E8))
  {
    qword_2544DA8E0 = 0x8000;
    __cxa_guard_release(&qword_2544DA8E8);
  }
  return qword_2544DA8E0;
}

uint64_t capabilities::abs::dataFlowControlEnabled(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA8F0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA8F0))
  {
    byte_2544DA7F8 = 1;
    __cxa_guard_release(&qword_2544DA8F0);
  }
  return byte_2544DA7F8;
}

uint64_t capabilities::abs::dataPowerSaveEnabled(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA8F8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA8F8))
  {
    byte_2544DA7F9 = 1;
    __cxa_guard_release(&qword_2544DA8F8);
  }
  return byte_2544DA7F9;
}

uint64_t capabilities::abs::LLDataInterfaceID(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA900);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA900))
  {
    dword_2544DA830 = 7;
    __cxa_guard_release(&qword_2544DA900);
  }
  return dword_2544DA830;
}

uint64_t capabilities::abs::LLDataAggregationDatagramMaxCount(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA910);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA910))
  {
    qword_2544DA908 = 1;
    __cxa_guard_release(&qword_2544DA910);
  }
  return qword_2544DA908;
}

uint64_t capabilities::abs::LLDataAggregationMaxSizeBytes(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA920);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA920))
  {
    qword_2544DA918 = 2048;
    __cxa_guard_release(&qword_2544DA920);
  }
  return qword_2544DA918;
}

uint64_t capabilities::abs::supportsMagSafe(capabilities::abs *this)
{
  unsigned __int8 v1;
  capabilities::abs *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA928);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::abs *)__cxa_guard_acquire(&qword_2544DA928);
    if ((_DWORD)v3)
    {
      byte_2544DA7FA = capabilities::abs::sSupportsMagSafe(v3);
      __cxa_guard_release(&qword_2544DA928);
    }
  }
  return byte_2544DA7FA;
}

void sub_24B9DE99C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DA928);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::sSupportsMagSafe(capabilities::abs *this)
{
  ctu::Gestalt *v1;
  void *v2;
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  __int128 v13;

  if (!capabilities::abs::supportsAccessoryModule(this))
    return 0;
  v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  v2 = off_2544DA7D8;
  if (!off_2544DA7D8)
  {
    ctu::Gestalt::create_default_global(v1);
    std::shared_ptr<ctu::Gestalt>::operator=[abi:ne180100]((uint64_t)&off_2544DA7D8, &v13);
    v3 = (std::__shared_weak_count *)*((_QWORD *)&v13 + 1);
    if (*((_QWORD *)&v13 + 1))
    {
      v4 = (unint64_t *)(*((_QWORD *)&v13 + 1) + 8);
      do
        v5 = __ldaxr(v4);
      while (__stlxr(v5 - 1, v4));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    v2 = off_2544DA7D8;
  }
  v6 = (std::__shared_weak_count *)off_2544DA7E0;
  if (off_2544DA7E0)
  {
    v7 = (unint64_t *)((char *)off_2544DA7E0 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  v9 = (*(uint64_t (**)(void *))(*(_QWORD *)v2 + 128))(v2);
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return v9;
}

void sub_24B9DEAD0(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsDisplayCoverAccessory(capabilities::abs *this)
{
  unsigned __int8 v1;
  capabilities::abs *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA930);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::abs *)__cxa_guard_acquire(&qword_2544DA930);
    if ((_DWORD)v3)
    {
      byte_2544DA7FB = capabilities::abs::sSupportsDisplayCoverAccessory(v3);
      __cxa_guard_release(&qword_2544DA930);
    }
  }
  return byte_2544DA7FB;
}

void sub_24B9DEB5C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DA930);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::sSupportsDisplayCoverAccessory(capabilities::abs *this)
{
  ctu::Gestalt *v1;
  void *v2;
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  __int128 v13;

  if (!capabilities::abs::supportsAccessoryModule(this))
    return 0;
  v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  v2 = off_2544DA7D8;
  if (!off_2544DA7D8)
  {
    ctu::Gestalt::create_default_global(v1);
    std::shared_ptr<ctu::Gestalt>::operator=[abi:ne180100]((uint64_t)&off_2544DA7D8, &v13);
    v3 = (std::__shared_weak_count *)*((_QWORD *)&v13 + 1);
    if (*((_QWORD *)&v13 + 1))
    {
      v4 = (unint64_t *)(*((_QWORD *)&v13 + 1) + 8);
      do
        v5 = __ldaxr(v4);
      while (__stlxr(v5 - 1, v4));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    v2 = off_2544DA7D8;
  }
  v6 = (std::__shared_weak_count *)off_2544DA7E0;
  if (off_2544DA7E0)
  {
    v7 = (unint64_t *)((char *)off_2544DA7E0 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  v9 = (*(uint64_t (**)(void *))(*(_QWORD *)v2 + 136))(v2);
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return v9;
}

void sub_24B9DEC90(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsSmartConnectorAccessory(capabilities::abs *this)
{
  unsigned __int8 v1;
  capabilities::abs *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA938);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::abs *)__cxa_guard_acquire(&qword_2544DA938);
    if ((_DWORD)v3)
    {
      byte_2544DA7FC = capabilities::abs::sSupportsSmartConnectorAccessory(v3);
      __cxa_guard_release(&qword_2544DA938);
    }
  }
  return byte_2544DA7FC;
}

void sub_24B9DED1C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DA938);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::sSupportsSmartConnectorAccessory(capabilities::abs *this)
{
  ctu::Gestalt *v1;
  void *v2;
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  __int128 v13;

  if (!capabilities::abs::supportsAccessoryModule(this))
    return 0;
  v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  v2 = off_2544DA7D8;
  if (!off_2544DA7D8)
  {
    ctu::Gestalt::create_default_global(v1);
    std::shared_ptr<ctu::Gestalt>::operator=[abi:ne180100]((uint64_t)&off_2544DA7D8, &v13);
    v3 = (std::__shared_weak_count *)*((_QWORD *)&v13 + 1);
    if (*((_QWORD *)&v13 + 1))
    {
      v4 = (unint64_t *)(*((_QWORD *)&v13 + 1) + 8);
      do
        v5 = __ldaxr(v4);
      while (__stlxr(v5 - 1, v4));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    v2 = off_2544DA7D8;
  }
  v6 = (std::__shared_weak_count *)off_2544DA7E0;
  if (off_2544DA7E0)
  {
    v7 = (unint64_t *)((char *)off_2544DA7E0 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  v9 = (*(uint64_t (**)(void *))(*(_QWORD *)v2 + 136))(v2);
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return v9;
}

void sub_24B9DEE50(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::serviceInitTimeoutScalingFactor(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA948);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA948))
  {
    qword_2544DA940 = 1;
    __cxa_guard_release(&qword_2544DA948);
  }
  return qword_2544DA940;
}

uint64_t capabilities::abs::serviceSleepTimeoutScalingFactor(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA958);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA958))
  {
    qword_2544DA950 = 1;
    __cxa_guard_release(&qword_2544DA958);
  }
  return qword_2544DA950;
}

uint64_t capabilities::abs::resetAssertionTimeoutScalingFactor(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA968);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA968))
  {
    qword_2544DA960 = 1;
    __cxa_guard_release(&qword_2544DA968);
  }
  return qword_2544DA960;
}

uint64_t capabilities::abs::shutdownAssertionTimeoutScalingFactor(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA978);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA978))
  {
    qword_2544DA970 = 1;
    __cxa_guard_release(&qword_2544DA978);
  }
  return qword_2544DA970;
}

uint64_t capabilities::abs::supportsCMHandDetection(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA980);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA980))
  {
    byte_2544DA7FD = 1;
    __cxa_guard_release(&qword_2544DA980);
  }
  return byte_2544DA7FD;
}

void capabilities::abs::radarComponentName(std::string *a1@<X8>)
{
  unsigned __int8 v3;
  capabilities::abs *v4;

  v3 = atomic_load((unsigned __int8 *)&qword_2544DA988);
  if ((v3 & 1) == 0)
  {
    v4 = (capabilities::abs *)__cxa_guard_acquire(&qword_2544DA988);
    if ((_DWORD)v4)
    {
      capabilities::abs::sRadarComponentName(v4);
      __cxa_atexit(MEMORY[0x24BEDACF0], &xmmword_2544DAC18, &dword_24B9DC000);
      __cxa_guard_release(&qword_2544DA988);
    }
  }
  if (byte_2544DAC2F < 0)
  {
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)xmmword_2544DAC18, *((std::string::size_type *)&xmmword_2544DAC18 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_2544DAC18;
    a1->__r_.__value_.__r.__words[2] = unk_2544DAC28;
  }
}

void sub_24B9DF0BC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DA988);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::sRadarComponentName(capabilities::abs *this)
{
  __int128 *v1;
  uint64_t result;
  _BYTE *v3;

  v1 = &xmmword_2544DAC18;
  memset(&xmmword_2544DAC18, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_2544DAC18, "Unknown");
  result = TelephonyRadiosGetRadioVendor();
  if ((_DWORD)result == 1)
  {
    if (byte_2544DAC2F < 0)
    {
      *((_QWORD *)&xmmword_2544DAC18 + 1) = 11;
      v1 = (__int128 *)xmmword_2544DAC18;
    }
    else
    {
      byte_2544DAC2F = 11;
    }
    *(_DWORD *)((char *)v1 + 7) = 1465065579;
    *(_QWORD *)v1 = *(_QWORD *)"Maverick SW";
    v3 = (char *)v1 + 11;
  }
  else if ((_DWORD)result == 2)
  {
    if (byte_2544DAC2F < 0)
    {
      *((_QWORD *)&xmmword_2544DAC18 + 1) = 6;
      v1 = (__int128 *)xmmword_2544DAC18;
    }
    else
    {
      byte_2544DAC2F = 6;
    }
    *((_WORD *)v1 + 2) = 22355;
    *(_DWORD *)v1 = 541410121;
    v3 = (char *)v1 + 6;
  }
  else
  {
    if (byte_2544DAC2F < 0)
    {
      *((_QWORD *)&xmmword_2544DAC18 + 1) = 7;
      v1 = (__int128 *)xmmword_2544DAC18;
    }
    else
    {
      byte_2544DAC2F = 7;
    }
    *(_DWORD *)((char *)v1 + 3) = 1853321070;
    *(_DWORD *)v1 = 1852534357;
    v3 = (char *)v1 + 7;
  }
  *v3 = 0;
  return result;
}

void sub_24B9DF1E8(_Unwind_Exception *exception_object)
{
  if (byte_2544DAC2F < 0)
    operator delete((void *)xmmword_2544DAC18);
  _Unwind_Resume(exception_object);
}

uint64_t capabilities::abs::fileSystemFlushTimeout(capabilities::abs *this)
{
  unsigned __int8 v1;
  capabilities::abs *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA998);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::abs *)__cxa_guard_acquire(&qword_2544DA998);
    if ((_DWORD)v3)
    {
      qword_2544DA990 = capabilities::abs::sFileSystemFlushTimeout(v3);
      __cxa_guard_release(&qword_2544DA998);
    }
  }
  return qword_2544DA990;
}

void sub_24B9DF268(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DA998);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::sFileSystemFlushTimeout(capabilities::abs *this)
{
  unsigned int v1;

  v1 = TelephonyRadiosGetProduct() - 33;
  if (v1 > 0xB3)
    return 14;
  else
    return qword_24B9FCF80[v1];
}

uint64_t capabilities::abs::supportsCoex(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int RadioVendor;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA9A0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA9A0))
  {
    RadioVendor = TelephonyRadiosGetRadioVendor();
    byte_2544DA7FE = (RadioVendor < 5) & (0x16u >> RadioVendor);
    __cxa_guard_release(&qword_2544DA9A0);
  }
  return byte_2544DA7FE;
}

void sub_24B9DF324(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DA9A0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsCalibrationQuery(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int RadioVendor;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA9A8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA9A8))
  {
    RadioVendor = TelephonyRadiosGetRadioVendor();
    byte_2544DA7FF = (RadioVendor < 5) & (0x16u >> RadioVendor);
    __cxa_guard_release(&qword_2544DA9A8);
  }
  return byte_2544DA7FF;
}

void sub_24B9DF3AC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DA9A8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsNMEA(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA9B0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA9B0))
  {
    byte_2544DA800 = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_2544DA9B0);
  }
  return byte_2544DA800;
}

void sub_24B9DF428(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DA9B0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsDataTransportService(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int RadioVendor;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA9B8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA9B8))
  {
    RadioVendor = TelephonyRadiosGetRadioVendor();
    byte_2544DA801 = (RadioVendor < 5) & (0x16u >> RadioVendor);
    __cxa_guard_release(&qword_2544DA9B8);
  }
  return byte_2544DA801;
}

void sub_24B9DF4B0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DA9B8);
  _Unwind_Resume(a1);
}

void capabilities::abs::loggingSettingsPListName(std::string *a1@<X8>)
{
  unsigned __int8 v3;
  capabilities::abs *v4;

  v3 = atomic_load((unsigned __int8 *)&qword_2544DA9C0);
  if ((v3 & 1) == 0)
  {
    v4 = (capabilities::abs *)__cxa_guard_acquire(&qword_2544DA9C0);
    if ((_DWORD)v4)
    {
      capabilities::abs::sLoggingSettingsPListName(v4);
      __cxa_atexit(MEMORY[0x24BEDACF0], &xmmword_2544DAC30, &dword_24B9DC000);
      __cxa_guard_release(&qword_2544DA9C0);
    }
  }
  if (byte_2544DAC47 < 0)
  {
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)xmmword_2544DAC30, *((std::string::size_type *)&xmmword_2544DAC30 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_2544DAC30;
    a1->__r_.__value_.__r.__words[2] = *(_QWORD *)&word_2544DAC40;
  }
}

void sub_24B9DF570(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DA9C0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::sLoggingSettingsPListName(capabilities::abs *this)
{
  __int128 *v1;
  uint64_t result;
  const char *v3;

  v1 = &xmmword_2544DAC30;
  memset(&xmmword_2544DAC30, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_2544DAC30, (char *)&unk_24BA0187D);
  result = TelephonyRadiosGetRadio();
  if (result > 0x11)
    goto LABEL_15;
  if (((1 << result) & 0x23E2E) != 0)
  {
    if (byte_2544DAC47 < 0)
    {
      *((_QWORD *)&xmmword_2544DAC30 + 1) = 18;
      v1 = (__int128 *)xmmword_2544DAC30;
    }
    else
    {
      byte_2544DAC47 = 18;
    }
    *((_WORD *)v1 + 8) = 21077;
    v3 = "LoggingSettingsEUR";
LABEL_7:
    *v1 = *(_OWORD *)v3;
    v1 = (__int128 *)((char *)v1 + 18);
    goto LABEL_8;
  }
  if (((1 << result) & 0x180) != 0)
  {
    if (byte_2544DAC47 < 0)
    {
      *((_QWORD *)&xmmword_2544DAC30 + 1) = 18;
      v1 = (__int128 *)xmmword_2544DAC30;
    }
    else
    {
      byte_2544DAC47 = 18;
    }
    *((_WORD *)v1 + 8) = 17731;
    v3 = "LoggingSettingsICE";
    goto LABEL_7;
  }
  if ((_DWORD)result == 4)
  {
    if (byte_2544DAC47 < 0)
    {
      *((_QWORD *)&xmmword_2544DAC30 + 1) = 22;
      v1 = (__int128 *)xmmword_2544DAC30;
    }
    else
    {
      byte_2544DAC47 = 22;
    }
    qmemcpy(v1, "LoggingSettingsNanoICE", 22);
    v1 = (__int128 *)((char *)v1 + 22);
  }
  else
  {
LABEL_15:
    if (byte_2544DAC47 < 0)
    {
      *((_QWORD *)&xmmword_2544DAC30 + 1) = 0;
      v1 = (__int128 *)xmmword_2544DAC30;
    }
    else
    {
      byte_2544DAC47 = 0;
    }
  }
LABEL_8:
  *(_BYTE *)v1 = 0;
  return result;
}

void sub_24B9DF6D4(_Unwind_Exception *exception_object)
{
  if (byte_2544DAC47 < 0)
    operator delete((void *)xmmword_2544DAC30);
  _Unwind_Resume(exception_object);
}

uint64_t capabilities::abs::supportsFieldTestConfig(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA9C8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA9C8))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DA802 = (Radio < 0x12) & (0x23FAEu >> Radio);
    __cxa_guard_release(&qword_2544DA9C8);
  }
  return byte_2544DA802;
}

void sub_24B9DF76C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DA9C8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::shouldAddRFPSSpecifier(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA9D0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA9D0))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DA803 = (Radio < 0x12) & (0x2FFAEu >> Radio);
    __cxa_guard_release(&qword_2544DA9D0);
  }
  return byte_2544DA803;
}

void sub_24B9DF7F8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DA9D0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsRFSelfTest(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA9D8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA9D8))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DA804 = (Radio < 0x12) & (0x2FF80u >> Radio);
    __cxa_guard_release(&qword_2544DA9D8);
  }
  return byte_2544DA804;
}

void sub_24B9DF884(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DA9D8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsDesenseRFSelfTest(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA9E0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DA9E0))
  {
    byte_2544DA805 = ((TelephonyRadiosGetRadio() - 13) & 0xFFFFFFFB) == 0;
    __cxa_guard_release(&qword_2544DA9E0);
  }
  return byte_2544DA805;
}

void sub_24B9DF904(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DA9E0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::resetOnControlMessageTimeout(capabilities::abs *this)
{
  unsigned __int8 v1;
  capabilities::abs *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DA9E8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::abs *)__cxa_guard_acquire(&qword_2544DA9E8);
    if ((_DWORD)v3)
    {
      byte_2544DA806 = capabilities::abs::sResetOnControlMessageTimeout(v3);
      __cxa_guard_release(&qword_2544DA9E8);
    }
  }
  return byte_2544DA806;
}

void sub_24B9DF978(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DA9E8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::sResetOnControlMessageTimeout(capabilities::abs *this)
{
  unsigned int RadioVendor;

  RadioVendor = TelephonyRadiosGetRadioVendor();
  return (RadioVendor < 5) & (0xEu >> RadioVendor);
}

void capabilities::abs::radarComponentVersion(std::string *a1@<X8>)
{
  unsigned __int8 v3;
  capabilities::abs *v4;

  v3 = atomic_load((unsigned __int8 *)&qword_2544DA9F0);
  if ((v3 & 1) == 0)
  {
    v4 = (capabilities::abs *)__cxa_guard_acquire(&qword_2544DA9F0);
    if ((_DWORD)v4)
    {
      capabilities::abs::sRadarComponentVersion(v4);
      __cxa_atexit(MEMORY[0x24BEDACF0], &xmmword_2544DAC48, &dword_24B9DC000);
      __cxa_guard_release(&qword_2544DA9F0);
    }
  }
  if (byte_2544DAC5F < 0)
  {
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)xmmword_2544DAC48, *((std::string::size_type *)&xmmword_2544DAC48 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_2544DAC48;
    a1->__r_.__value_.__r.__words[2] = unk_2544DAC58;
  }
}

void sub_24B9DFA60(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DA9F0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::sRadarComponentVersion(capabilities::abs *this)
{
  __int128 *v1;
  uint64_t result;
  int v3;
  _BYTE *v4;

  v1 = &xmmword_2544DAC48;
  memset(&xmmword_2544DAC48, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_2544DAC48, "Unknown");
  result = TelephonyRadiosGetRadio();
  switch((int)result)
  {
    case 2:
      if (byte_2544DAC5F < 0)
      {
        *((_QWORD *)&xmmword_2544DAC48 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DAC48;
      }
      else
      {
        byte_2544DAC5F = 4;
      }
      v3 = 808334129;
      goto LABEL_48;
    case 3:
      if (byte_2544DAC5F < 0)
      {
        *((_QWORD *)&xmmword_2544DAC48 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DAC48;
      }
      else
      {
        byte_2544DAC5F = 4;
      }
      v3 = 808334897;
      goto LABEL_48;
    case 4:
      if (byte_2544DAC5F < 0)
      {
        *((_QWORD *)&xmmword_2544DAC48 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DAC48;
      }
      else
      {
        byte_2544DAC5F = 4;
      }
      v3 = 1397310025;
      goto LABEL_48;
    case 7:
      if (byte_2544DAC5F < 0)
      {
        *((_QWORD *)&xmmword_2544DAC48 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DAC48;
      }
      else
      {
        byte_2544DAC5F = 4;
      }
      v3 = 808335409;
      goto LABEL_48;
    case 8:
      if (byte_2544DAC5F < 0)
      {
        *((_QWORD *)&xmmword_2544DAC48 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DAC48;
      }
      else
      {
        byte_2544DAC5F = 4;
      }
      v3 = 808335665;
      goto LABEL_48;
    case 9:
      if (byte_2544DAC5F < 0)
      {
        *((_QWORD *)&xmmword_2544DAC48 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DAC48;
      }
      else
      {
        byte_2544DAC5F = 4;
      }
      v3 = 808333362;
      goto LABEL_48;
    case 10:
      if (byte_2544DAC5F < 0)
      {
        *((_QWORD *)&xmmword_2544DAC48 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DAC48;
      }
      else
      {
        byte_2544DAC5F = 4;
      }
      v3 = 808333618;
      goto LABEL_48;
    case 11:
      if (byte_2544DAC5F < 0)
      {
        *((_QWORD *)&xmmword_2544DAC48 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DAC48;
      }
      else
      {
        byte_2544DAC5F = 4;
      }
      v3 = 808333363;
      goto LABEL_48;
    case 12:
      if (byte_2544DAC5F < 0)
      {
        *((_QWORD *)&xmmword_2544DAC48 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DAC48;
      }
      else
      {
        byte_2544DAC5F = 4;
      }
      v3 = 808333874;
      goto LABEL_48;
    case 13:
      if (byte_2544DAC5F < 0)
      {
        *((_QWORD *)&xmmword_2544DAC48 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DAC48;
      }
      else
      {
        byte_2544DAC5F = 4;
      }
      v3 = 808334130;
      goto LABEL_48;
    case 17:
      if (byte_2544DAC5F < 0)
      {
        *((_QWORD *)&xmmword_2544DAC48 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DAC48;
      }
      else
      {
        byte_2544DAC5F = 4;
      }
      v3 = 808334386;
LABEL_48:
      *(_DWORD *)v1 = v3;
      v4 = (char *)v1 + 4;
      break;
    default:
      if (byte_2544DAC5F < 0)
      {
        *((_QWORD *)&xmmword_2544DAC48 + 1) = 7;
        v1 = (__int128 *)xmmword_2544DAC48;
      }
      else
      {
        byte_2544DAC5F = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 1853321070;
      *(_DWORD *)v1 = 1852534357;
      v4 = (char *)v1 + 7;
      break;
  }
  *v4 = 0;
  return result;
}

void sub_24B9DFD54(_Unwind_Exception *exception_object)
{
  if (byte_2544DAC5F < 0)
    operator delete((void *)xmmword_2544DAC48);
  _Unwind_Resume(exception_object);
}

void capabilities::abs::radarComponentID(std::string *a1@<X8>)
{
  unsigned __int8 v3;
  capabilities::abs *v4;

  v3 = atomic_load((unsigned __int8 *)&qword_2544DA9F8);
  if ((v3 & 1) == 0)
  {
    v4 = (capabilities::abs *)__cxa_guard_acquire(&qword_2544DA9F8);
    if ((_DWORD)v4)
    {
      capabilities::abs::sRadarComponentID(v4);
      __cxa_atexit(MEMORY[0x24BEDACF0], &xmmword_2544DAC60, &dword_24B9DC000);
      __cxa_guard_release(&qword_2544DA9F8);
    }
  }
  if (byte_2544DAC77 < 0)
  {
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)xmmword_2544DAC60, *((std::string::size_type *)&xmmword_2544DAC60 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_2544DAC60;
    a1->__r_.__value_.__r.__words[2] = unk_2544DAC70;
  }
}

void sub_24B9DFE20(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DA9F8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::sRadarComponentID(capabilities::abs *this)
{
  __int128 *v1;
  uint64_t result;
  int v3;
  __int16 v4;
  _BYTE *v5;
  int v6;

  v1 = &xmmword_2544DAC60;
  memset(&xmmword_2544DAC60, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_2544DAC60, "Unknown");
  result = TelephonyRadiosGetRadio();
  switch((int)result)
  {
    case 2:
      if (byte_2544DAC77 < 0)
      {
        *((_QWORD *)&xmmword_2544DAC60 + 1) = 6;
        v1 = (__int128 *)xmmword_2544DAC60;
      }
      else
      {
        byte_2544DAC77 = 6;
      }
      *((_WORD *)v1 + 2) = 12345;
      v3 = 842413365;
      goto LABEL_43;
    case 3:
      if (byte_2544DAC77 < 0)
      {
        *((_QWORD *)&xmmword_2544DAC60 + 1) = 6;
        v1 = (__int128 *)xmmword_2544DAC60;
      }
      else
      {
        byte_2544DAC77 = 6;
      }
      *((_WORD *)v1 + 2) = 12594;
      v3 = 926103861;
      goto LABEL_43;
    case 4:
      if (byte_2544DAC77 < 0)
      {
        *((_QWORD *)&xmmword_2544DAC60 + 1) = 6;
        v1 = (__int128 *)xmmword_2544DAC60;
      }
      else
      {
        byte_2544DAC77 = 6;
      }
      v4 = 12851;
      goto LABEL_40;
    case 7:
      if (byte_2544DAC77 < 0)
      {
        *((_QWORD *)&xmmword_2544DAC60 + 1) = 6;
        v1 = (__int128 *)xmmword_2544DAC60;
      }
      else
      {
        byte_2544DAC77 = 6;
      }
      v4 = 12339;
LABEL_40:
      *((_WORD *)v1 + 2) = v4;
      v3 = 909652024;
      goto LABEL_43;
    case 8:
      if (byte_2544DAC77 < 0)
      {
        *((_QWORD *)&xmmword_2544DAC60 + 1) = 6;
        v1 = (__int128 *)xmmword_2544DAC60;
      }
      else
      {
        byte_2544DAC77 = 6;
      }
      *((_WORD *)v1 + 2) = 12343;
      v3 = 909521976;
LABEL_43:
      *(_DWORD *)v1 = v3;
      v5 = (char *)v1 + 6;
      goto LABEL_65;
    case 9:
      if (byte_2544DAC77 < 0)
      {
        *((_QWORD *)&xmmword_2544DAC60 + 1) = 7;
        v1 = (__int128 *)xmmword_2544DAC60;
      }
      else
      {
        byte_2544DAC77 = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 942682932;
      v6 = 875769905;
      goto LABEL_64;
    case 10:
      if (byte_2544DAC77 < 0)
      {
        *((_QWORD *)&xmmword_2544DAC60 + 1) = 7;
        v1 = (__int128 *)xmmword_2544DAC60;
      }
      else
      {
        byte_2544DAC77 = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 892549171;
      v6 = 859385905;
      goto LABEL_64;
    case 11:
      if (byte_2544DAC77 < 0)
      {
        *((_QWORD *)&xmmword_2544DAC60 + 1) = 7;
        v1 = (__int128 *)xmmword_2544DAC60;
      }
      else
      {
        byte_2544DAC77 = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 909521719;
      v6 = 926167345;
      goto LABEL_64;
    case 12:
      if (byte_2544DAC77 < 0)
      {
        *((_QWORD *)&xmmword_2544DAC60 + 1) = 7;
        v1 = (__int128 *)xmmword_2544DAC60;
      }
      else
      {
        byte_2544DAC77 = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 858863413;
      v6 = 892350769;
      goto LABEL_64;
    case 13:
      if (byte_2544DAC77 < 0)
      {
        *((_QWORD *)&xmmword_2544DAC60 + 1) = 7;
        v1 = (__int128 *)xmmword_2544DAC60;
      }
      else
      {
        byte_2544DAC77 = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 808465209;
      v6 = 959591217;
      goto LABEL_64;
    case 14:
      if (byte_2544DAC77 < 0)
      {
        *((_QWORD *)&xmmword_2544DAC60 + 1) = 7;
        v1 = (__int128 *)xmmword_2544DAC60;
      }
      else
      {
        byte_2544DAC77 = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 909521461;
      v6 = 892940337;
      goto LABEL_64;
    case 15:
      if (byte_2544DAC77 < 0)
      {
        *((_QWORD *)&xmmword_2544DAC60 + 1) = 7;
        v1 = (__int128 *)xmmword_2544DAC60;
      }
      else
      {
        byte_2544DAC77 = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 875968823;
      v6 = 926495537;
      goto LABEL_64;
    case 16:
      if (byte_2544DAC77 < 0)
      {
        *((_QWORD *)&xmmword_2544DAC60 + 1) = 7;
        v1 = (__int128 *)xmmword_2544DAC60;
      }
      else
      {
        byte_2544DAC77 = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 875902773;
      v6 = 892548145;
      goto LABEL_64;
    case 17:
      if (byte_2544DAC77 < 0)
      {
        *((_QWORD *)&xmmword_2544DAC60 + 1) = 7;
        v1 = (__int128 *)xmmword_2544DAC60;
      }
      else
      {
        byte_2544DAC77 = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 942944567;
      v6 = 925971761;
      goto LABEL_64;
    default:
      if (byte_2544DAC77 < 0)
      {
        *((_QWORD *)&xmmword_2544DAC60 + 1) = 7;
        v1 = (__int128 *)xmmword_2544DAC60;
      }
      else
      {
        byte_2544DAC77 = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 1853321070;
      v6 = 1852534357;
LABEL_64:
      *(_DWORD *)v1 = v6;
      v5 = (char *)v1 + 7;
LABEL_65:
      *v5 = 0;
      return result;
  }
}

void sub_24B9E0210(_Unwind_Exception *exception_object)
{
  if (byte_2544DAC77 < 0)
    operator delete((void *)xmmword_2544DAC60);
  _Unwind_Resume(exception_object);
}

uint64_t capabilities::abs::supportsRadioHealth(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAA00);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAA00))
  {
    byte_2544DA807 = TelephonyRadiosGetRadio() == 3;
    __cxa_guard_release(&qword_2544DAA00);
  }
  return byte_2544DA807;
}

void sub_24B9E0298(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAA00);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::QMIPacketMaxSizeBytes(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAA10);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAA10))
  {
    v3 = TelephonyRadiosGetRadio() - 2;
    if (v3 > 0xF)
      v4 = 0;
    else
      v4 = qword_24B9FD520[v3];
    qword_2544DAA08 = v4;
    __cxa_guard_release(&qword_2544DAA10);
  }
  return qword_2544DAA08;
}

void sub_24B9E0328(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAA10);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::shouldUseMinBasebandTransportIOReadSize(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAA18);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAA18))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DA808 = (Radio < 8) & (0x8Cu >> Radio);
    __cxa_guard_release(&qword_2544DAA18);
  }
  return byte_2544DA808;
}

void sub_24B9E03B0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAA18);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::shouldUseMinBasebandTransportIOReadCount(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAA20);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAA20))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DA809 = (Radio < 0x11) & (0x1DCu >> Radio);
    __cxa_guard_release(&qword_2544DAA20);
  }
  return byte_2544DA809;
}

void sub_24B9E0438(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAA20);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsBBUSBMux(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAA28);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAA28))
  {
    byte_2544DA80A = (TelephonyRadiosGetRadio() & 0xFFFFFFFE) == 2;
    __cxa_guard_release(&qword_2544DAA28);
  }
  return byte_2544DA80A;
}

void sub_24B9E04B8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAA28);
  _Unwind_Resume(a1);
}

void capabilities::abs::RFTestSettingsPListName(std::string *a1@<X8>)
{
  unsigned __int8 v3;
  capabilities::abs *v4;

  v3 = atomic_load((unsigned __int8 *)&qword_2544DAA30);
  if ((v3 & 1) == 0)
  {
    v4 = (capabilities::abs *)__cxa_guard_acquire(&qword_2544DAA30);
    if ((_DWORD)v4)
    {
      capabilities::abs::sRFTestSettingsPListName(v4);
      __cxa_atexit(MEMORY[0x24BEDACF0], &xmmword_2544DAC78, &dword_24B9DC000);
      __cxa_guard_release(&qword_2544DAA30);
    }
  }
  if (byte_2544DAC8F < 0)
  {
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)xmmword_2544DAC78, *((std::string::size_type *)&xmmword_2544DAC78 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_2544DAC78;
    a1->__r_.__value_.__r.__words[2] = *(_QWORD *)&byte_2544DAC88;
  }
}

void sub_24B9E0578(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAA30);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::sRFTestSettingsPListName(capabilities::abs *this)
{
  __int128 *v1;
  uint64_t result;
  const char *v3;

  v1 = &xmmword_2544DAC78;
  memset(&xmmword_2544DAC78, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_2544DAC78, (char *)&unk_24BA0187D);
  result = TelephonyRadiosGetRadio();
  if (result > 0x11)
  {
LABEL_15:
    if (byte_2544DAC8F < 0)
    {
      *((_QWORD *)&xmmword_2544DAC78 + 1) = 0;
      v1 = (__int128 *)xmmword_2544DAC78;
    }
    else
    {
      byte_2544DAC8F = 0;
    }
    goto LABEL_20;
  }
  if (((1 << result) & 0x23E00) == 0)
  {
    if (((1 << result) & 0x1D0) != 0)
    {
      if (byte_2544DAC8F < 0)
      {
        *((_QWORD *)&xmmword_2544DAC78 + 1) = 17;
        v1 = (__int128 *)xmmword_2544DAC78;
      }
      else
      {
        byte_2544DAC8F = 17;
      }
      *((_BYTE *)v1 + 16) = 69;
      v3 = "RFTestSettingsICE";
LABEL_19:
      *v1 = *(_OWORD *)v3;
      v1 = (__int128 *)((char *)v1 + 17);
      goto LABEL_20;
    }
    if (((1 << result) & 0xC) != 0)
    {
      if (byte_2544DAC8F < 0)
      {
        *((_QWORD *)&xmmword_2544DAC78 + 1) = 17;
        v1 = (__int128 *)xmmword_2544DAC78;
      }
      else
      {
        byte_2544DAC8F = 17;
      }
      *((_BYTE *)v1 + 16) = 82;
      v3 = "RFTestSettingsEUR";
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  if (byte_2544DAC8F < 0)
  {
    *((_QWORD *)&xmmword_2544DAC78 + 1) = 19;
    v1 = (__int128 *)xmmword_2544DAC78;
  }
  else
  {
    byte_2544DAC8F = 19;
  }
  *(_DWORD *)((char *)v1 + 15) = 844517973;
  *v1 = *(_OWORD *)"RFTestSettingsEURV2";
  v1 = (__int128 *)((char *)v1 + 19);
LABEL_20:
  *(_BYTE *)v1 = 0;
  return result;
}

void sub_24B9E06E8(_Unwind_Exception *exception_object)
{
  if (byte_2544DAC8F < 0)
    operator delete((void *)xmmword_2544DAC78);
  _Unwind_Resume(exception_object);
}

uint64_t capabilities::abs::supportsNetworkPolicy(capabilities::abs *this)
{
  unsigned __int8 v1;
  int Radio;
  BOOL v5;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAA38);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAA38))
  {
    Radio = TelephonyRadiosGetRadio();
    v5 = Radio == 4 || Radio == 16;
    byte_2544DA80B = v5;
    __cxa_guard_release(&qword_2544DAA38);
  }
  return byte_2544DA80B;
}

void sub_24B9E0774(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAA38);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsChargerDesense(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAA40);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAA40))
  {
    TelephonyRadiosGetRadio();
    byte_2544DA80C = 0;
    __cxa_guard_release(&qword_2544DAA40);
  }
  return byte_2544DA80C;
}

void sub_24B9E07E8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAA40);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsCPMSConnectedState(capabilities::abs *this)
{
  unsigned __int8 v1;
  int Radio;
  BOOL v5;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAA48);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAA48))
  {
    Radio = TelephonyRadiosGetRadio();
    v5 = Radio == 4 || Radio == 16;
    byte_2544DA80D = v5;
    __cxa_guard_release(&qword_2544DAA48);
  }
  return byte_2544DA80D;
}

void sub_24B9E0868(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAA48);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsTraceBackgroundMode(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAA50);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAA50))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DA80E = (Radio < 0x11) & (0x10110u >> Radio);
    __cxa_guard_release(&qword_2544DAA50);
  }
  return byte_2544DA80E;
}

void sub_24B9E08F4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAA50);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::usesCDC(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAA60);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAA60))
  {
    byte_2544DA810 = ((TelephonyRadiosGetRadioVendor() - 2) & 0xFFFFFFFD) == 0;
    __cxa_guard_release(&qword_2544DAA60);
  }
  return byte_2544DA810;
}

void sub_24B9E0974(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAA60);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::shouldSetRegion(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAA68);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAA68))
  {
    byte_2544DA811 = TelephonyRadiosGetRadio() - 7 < 2;
    __cxa_guard_release(&qword_2544DAA68);
  }
  return byte_2544DA811;
}

void sub_24B9E09F4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAA68);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsETB(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAA78);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAA78))
  {
    byte_2544DA813 = TelephonyRadiosGetRadio() - 7 < 2;
    __cxa_guard_release(&qword_2544DAA78);
  }
  return byte_2544DA813;
}

void sub_24B9E0A74(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAA78);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::shouldAddPeriodicMeasurementPSSpecifier(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAA80);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAA80))
  {
    byte_2544DA814 = TelephonyRadiosGetRadio() - 7 < 2;
    __cxa_guard_release(&qword_2544DAA80);
  }
  return byte_2544DA814;
}

void sub_24B9E0AF4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAA80);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsETSProtocol(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAA88);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAA88))
  {
    byte_2544DA815 = TelephonyRadiosGetRadio() - 7 < 2;
    __cxa_guard_release(&qword_2544DAA88);
  }
  return byte_2544DA815;
}

void sub_24B9E0B74(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAA88);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsETSBypass(capabilities::abs *this)
{
  unsigned __int8 v1;
  capabilities::abs *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAA90);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::abs *)__cxa_guard_acquire(&qword_2544DAA90);
    if ((_DWORD)v3)
    {
      byte_2544DA816 = capabilities::abs::sSupportsETSBypass(v3);
      __cxa_guard_release(&qword_2544DAA90);
    }
  }
  return byte_2544DA816;
}

void sub_24B9E0BE8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAA90);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::sSupportsETSBypass(capabilities::abs *this)
{
  if (TelephonyRadiosGetRadio() - 7 > 1)
    return 0;
  if ((TelephonyUtilIsCarrierBuild() & 1) != 0)
    return 1;
  return TelephonyUtilIsInternalBuild();
}

uint64_t capabilities::abs::nonPrimaryDLServingCellBandwidthMaxValue(capabilities::abs *this)
{
  unsigned __int8 v1;
  capabilities::abs *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAAA0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::abs *)__cxa_guard_acquire(&qword_2544DAAA0);
    if ((_DWORD)v3)
    {
      qword_2544DAA98 = capabilities::abs::sNonPrimaryDLServingCellBandwidthMaxValue(v3);
      __cxa_guard_release(&qword_2544DAAA0);
    }
  }
  return qword_2544DAA98;
}

void sub_24B9E0C98(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAAA0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::sNonPrimaryDLServingCellBandwidthMaxValue(capabilities::abs *this)
{
  ctu::Gestalt *v1;
  void *v2;
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  __int128 v13;

  if (TelephonyRadiosGetRadio() != 8)
    return 0xFFFFFFFFLL;
  v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  v2 = off_2544DA7D8;
  if (!off_2544DA7D8)
  {
    ctu::Gestalt::create_default_global(v1);
    std::shared_ptr<ctu::Gestalt>::operator=[abi:ne180100]((uint64_t)&off_2544DA7D8, &v13);
    v3 = (std::__shared_weak_count *)*((_QWORD *)&v13 + 1);
    if (*((_QWORD *)&v13 + 1))
    {
      v4 = (unint64_t *)(*((_QWORD *)&v13 + 1) + 8);
      do
        v5 = __ldaxr(v4);
      while (__stlxr(v5 - 1, v4));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    v2 = off_2544DA7D8;
  }
  v6 = (std::__shared_weak_count *)off_2544DA7E0;
  if (off_2544DA7E0)
  {
    v7 = (unint64_t *)((char *)off_2544DA7E0 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  if ((*(unsigned int (**)(void *))(*(_QWORD *)v2 + 136))(v2))
    v9 = 5000000;
  else
    v9 = 0xFFFFFFFFLL;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return v9;
}

void sub_24B9E0DE0(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsAccessoryModule(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAAB0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAAB0))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DA818 = (Radio < 0x12) & (0x2FE00u >> Radio);
    __cxa_guard_release(&qword_2544DAAB0);
  }
  return byte_2544DA818;
}

void sub_24B9E0E84(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAAB0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsRFFEScanData(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAAB8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAAB8))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DA819 = (Radio < 0x12) & (0x2FE00u >> Radio);
    __cxa_guard_release(&qword_2544DAAB8);
  }
  return byte_2544DA819;
}

void sub_24B9E0F10(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAAB8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsBatteryInfoMonitoring(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAAC0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAAC0))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DA81A = (Radio < 0x12) & (0x2FE00u >> Radio);
    __cxa_guard_release(&qword_2544DAAC0);
  }
  return byte_2544DA81A;
}

void sub_24B9E0F9C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAAC0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsCellularLogging(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAAC8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAAC8))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DA81B = (Radio < 0x12) & (0x2FE00u >> Radio);
    __cxa_guard_release(&qword_2544DAAC8);
  }
  return byte_2544DA81B;
}

void sub_24B9E1028(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAAC8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::profileBasebandHistoryMB(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAAD8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAAD8))
  {
    v3 = TelephonyRadiosGetRadio() - 9;
    if (v3 > 8)
      v4 = 256;
    else
      v4 = qword_24B9FD5A0[v3];
    qword_2544DAAD0 = v4;
    __cxa_guard_release(&qword_2544DAAD8);
  }
  return qword_2544DAAD0;
}

void sub_24B9E10B8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAAD8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsKIS(capabilities::abs *this)
{
  unsigned __int8 v1;
  capabilities::abs *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAAE0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::abs *)__cxa_guard_acquire(&qword_2544DAAE0);
    if ((_DWORD)v3)
    {
      byte_2544DA81C = capabilities::abs::sSupportsKIS(v3);
      __cxa_guard_release(&qword_2544DAAE0);
    }
  }
  return byte_2544DA81C;
}

void sub_24B9E112C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAAE0);
  _Unwind_Resume(a1);
}

BOOL capabilities::abs::sSupportsKIS(capabilities::abs *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if ((Product - 105) > 0x32 || ((1 << (Product - 105)) & 0x7001C07C06003) == 0)
    return Product == 209 || Product == 211;
  return v1;
}

uint64_t capabilities::abs::BBUSBDelay(capabilities::abs *this)
{
  unsigned __int8 v1;
  capabilities::abs *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAAF0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::abs *)__cxa_guard_acquire(&qword_2544DAAF0);
    if ((_DWORD)v3)
    {
      qword_2544DAAE8 = capabilities::abs::sBBUSBDelay(v3);
      __cxa_guard_release(&qword_2544DAAF0);
    }
  }
  return qword_2544DAAE8;
}

void sub_24B9E1204(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAAF0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::sBBUSBDelay(capabilities::abs *this)
{
  uint64_t v1;
  int Product;
  uint64_t v4;

  v1 = 10;
  Product = TelephonyRadiosGetProduct();
  if ((Product - 105) > 0x32 || ((1 << (Product - 105)) & 0x7001C07C06003) == 0)
  {
    if (Product == 211)
      v4 = 10;
    else
      v4 = 0;
    if (Product != 209)
      return v4;
  }
  return v1;
}

uint64_t capabilities::abs::thermalSensorMaxCount(capabilities::abs *this)
{
  unsigned __int8 v1;
  capabilities::abs *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAB00);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::abs *)__cxa_guard_acquire(&qword_2544DAB00);
    if ((_DWORD)v3)
    {
      qword_2544DAAF8 = capabilities::abs::sThermalSensorMaxCount(v3);
      __cxa_guard_release(&qword_2544DAB00);
    }
  }
  return qword_2544DAAF8;
}

void sub_24B9E12DC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAB00);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::sThermalSensorMaxCount(capabilities::abs *this)
{
  uint64_t v1;
  int Product;
  char v3;

  v1 = 2;
  Product = TelephonyRadiosGetProduct();
  v3 = Product - 114;
  if ((Product - 114) <= 0x2D)
  {
    if (((1 << v3) & 0x78F03C000FLL) != 0)
      return v1;
    if (((1 << v3) & 0x380701801840) != 0)
      return 3;
  }
  if (Product != 212)
    return 0;
  return v1;
}

uint64_t capabilities::abs::supportsSMCThermalReport(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAB08);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAB08))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DA81D = (Radio < 0x12) & (0x23C00u >> Radio);
    __cxa_guard_release(&qword_2544DAB08);
  }
  return byte_2544DA81D;
}

void sub_24B9E13E0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAB08);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::SMCThermalReportInterval(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAB18);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAB18))
  {
    v3 = TelephonyRadiosGetRadio() - 10;
    if (v3 > 7)
      v4 = 0;
    else
      v4 = qword_24B9FD5E8[v3];
    qword_2544DAB10 = v4;
    __cxa_guard_release(&qword_2544DAB18);
  }
  return qword_2544DAB10;
}

void sub_24B9E1470(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAB18);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsResetSPMIEvent(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAB20);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAB20))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DA81E = (Radio < 0x12) & (0x23C00u >> Radio);
    __cxa_guard_release(&qword_2544DAB20);
  }
  return byte_2544DA81E;
}

void sub_24B9E14FC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAB20);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsProtocolNVConfig(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAB28);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAB28))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DA81F = (Radio < 0x12) & (0x23C00u >> Radio);
    __cxa_guard_release(&qword_2544DAB28);
  }
  return byte_2544DA81F;
}

void sub_24B9E1588(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAB28);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsCPMSGetPowerFromBB(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAB30);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAB30))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DA820 = (Radio < 0x12) & (0x23C00u >> Radio);
    __cxa_guard_release(&qword_2544DAB30);
  }
  return byte_2544DA820;
}

void sub_24B9E1614(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAB30);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsDesense(capabilities::abs *this)
{
  unsigned __int8 v1;
  capabilities::abs *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAB38);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::abs *)__cxa_guard_acquire(&qword_2544DAB38);
    if ((_DWORD)v3)
    {
      byte_2544DA821 = capabilities::abs::sSupportsDesense(v3);
      __cxa_guard_release(&qword_2544DAB38);
    }
  }
  return byte_2544DA821;
}

void sub_24B9E1688(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAB38);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::sSupportsDesense(capabilities::abs *this)
{
  int v1;
  uint64_t result;

  v1 = TelephonyRadiosGetProduct() - 118;
  result = 1;
  switch(v1)
  {
    case 0:
    case 1:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 39:
    case 40:
    case 41:
    case 91:
    case 93:
    case 94:
      return result;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::abs::supportsEFSEraseOnBootLoop(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAB40);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAB40))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DA822 = (Radio < 0x12) & (0x23000u >> Radio);
    __cxa_guard_release(&qword_2544DAB40);
  }
  return byte_2544DA822;
}

void sub_24B9E1758(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAB40);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportedSARFeatures(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAB48);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAB48))
  {
    v3 = TelephonyRadiosGetRadio() - 13;
    if (v3 > 4)
      v4 = 1;
    else
      v4 = dword_24B9FD628[v3];
    dword_2544DA834 = v4;
    __cxa_guard_release(&qword_2544DAB48);
  }
  return dword_2544DA834;
}

void sub_24B9E17EC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAB48);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsBasebandInsights(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAB50);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAB50))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DA823 = (Radio < 0x12) & (0x2E000u >> Radio);
    __cxa_guard_release(&qword_2544DAB50);
  }
  return byte_2544DA823;
}

void sub_24B9E1878(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAB50);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsWirelessTelemetryUsingMultiClientModel(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAB58);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAB58))
  {
    byte_2544DA824 = TelephonyRadiosGetRadioVendor() == 4;
    __cxa_guard_release(&qword_2544DAB58);
  }
  return byte_2544DA824;
}

void sub_24B9E18F4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAB58);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::traceTransportTimeoutScalingFactor(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAB60);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAB60))
  {
    v3 = TelephonyRadiosGetProduct() - 200;
    if (v3 > 8)
      v4 = 1;
    else
      v4 = dword_24B9FD63C[v3];
    dword_2544DA838 = v4;
    __cxa_guard_release(&qword_2544DAB60);
  }
  return dword_2544DA838;
}

void sub_24B9E1988(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAB60);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::reducedFeatureSet(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAB68);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAB68))
  {
    byte_2544DA825 = TelephonyRadiosGetRadioVendor() == 3;
    __cxa_guard_release(&qword_2544DAB68);
  }
  return byte_2544DA825;
}

void sub_24B9E1A04(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAB68);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::defaultBasebandTransportTimeout(capabilities::abs *this)
{
  unsigned __int8 v1;
  int RadioVendor;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAB78);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAB78))
  {
    RadioVendor = TelephonyRadiosGetRadioVendor();
    v4 = 10000;
    if (RadioVendor == 3)
      v4 = 3600000;
    qword_2544DAB70 = v4;
    __cxa_guard_release(&qword_2544DAB78);
  }
  return qword_2544DAB70;
}

void sub_24B9E1A88(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAB78);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::supportsCellularCert(capabilities::abs *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAB80);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAB80))
  {
    byte_2544DA826 = TelephonyRadiosGetRadioVendor() == 3;
    __cxa_guard_release(&qword_2544DAB80);
  }
  return byte_2544DA826;
}

void sub_24B9E1B04(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAB80);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::serviceStartTimeoutScalingFactor(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAB90);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAB90))
  {
    v3 = TelephonyRadiosGetProduct() - 200;
    if (v3 > 8)
      v4 = 1;
    else
      v4 = qword_24B9FD660[v3];
    qword_2544DAB88 = v4;
    __cxa_guard_release(&qword_2544DAB90);
  }
  return qword_2544DAB88;
}

void sub_24B9E1B94(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAB90);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::serviceShutdownTimeoutScalingFactor(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DABA0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DABA0))
  {
    v3 = TelephonyRadiosGetProduct() - 200;
    if (v3 > 8)
      v4 = 1;
    else
      v4 = qword_24B9FD6A8[v3];
    qword_2544DAB98 = v4;
    __cxa_guard_release(&qword_2544DABA0);
  }
  return qword_2544DAB98;
}

void sub_24B9E1C24(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DABA0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::bootupAssertionTimeoutScalingFactor(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DABB0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DABB0))
  {
    v3 = TelephonyRadiosGetProduct() - 200;
    if (v3 > 8)
      v4 = 1;
    else
      v4 = qword_24B9FD6F0[v3];
    qword_2544DABA8 = v4;
    __cxa_guard_release(&qword_2544DABB0);
  }
  return qword_2544DABA8;
}

void sub_24B9E1CB4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DABB0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::ARIMessageTimeoutScalingFactor(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DABC0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DABC0))
  {
    v3 = TelephonyRadiosGetProduct() - 200;
    if (v3 > 8)
      v4 = 1;
    else
      v4 = qword_24B9FD738[v3];
    qword_2544DABB8 = v4;
    __cxa_guard_release(&qword_2544DABC0);
  }
  return qword_2544DABB8;
}

void sub_24B9E1D44(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DABC0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::engageTimeoutScalingFactor(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DABD0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DABD0))
  {
    v3 = TelephonyRadiosGetProduct() - 200;
    if (v3 > 8)
      v4 = 1;
    else
      v4 = qword_24B9FD780[v3];
    qword_2544DABC8 = v4;
    __cxa_guard_release(&qword_2544DABD0);
  }
  return qword_2544DABC8;
}

void sub_24B9E1DD4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DABD0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::defaultSystemLogsHistory(capabilities::abs *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DABE0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DABE0))
  {
    v3 = TelephonyRadiosGetProduct() - 200;
    if (v3 > 8)
      v4 = 1800;
    else
      v4 = qword_24B9FD7C8[v3];
    qword_2544DABD8 = v4;
    __cxa_guard_release(&qword_2544DABE0);
  }
  return qword_2544DABD8;
}

void sub_24B9E1E64(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DABE0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::abs::operator&(unsigned int a1, int a2)
{
  return a2 & a1;
}

_DWORD *capabilities::abs::operator&=(_DWORD *result, int a2)
{
  *result &= a2;
  return result;
}

uint64_t capabilities::abs::operator|(unsigned int a1, int a2)
{
  return a2 | a1;
}

_DWORD *capabilities::abs::operator|=(_DWORD *result, int a2)
{
  *result |= a2;
  return result;
}

uint64_t capabilities::abs::operator^(unsigned int a1, int a2)
{
  return a2 ^ a1;
}

_DWORD *capabilities::abs::operator^=(_DWORD *result, int a2)
{
  *result ^= a2;
  return result;
}

uint64_t capabilities::abs::operator~(int a1)
{
  return ~a1;
}

void capabilities::abs::asString(int a1@<W0>, uint64_t a2@<X8>)
{
  std::vector<std::string>::pointer end;
  __int128 v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  std::string *v9;
  std::string *v10;
  __int128 v11;
  std::string *v12;
  std::vector<std::string>::pointer v13;
  __int128 v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  std::string *v18;
  std::string *v19;
  __int128 v20;
  std::string *v21;
  void *__p[2];
  std::string::size_type v23;
  std::vector<std::string> v24;
  void *v25[3];
  std::__split_buffer<std::string> __v;

  memset(v25, 170, sizeof(v25));
  std::string::basic_string[abi:ne180100]<0>(v25, "???");
  memset(&v24, 0, sizeof(v24));
  if (a1 == 1)
  {
    std::string::basic_string[abi:ne180100]<0>((_QWORD *)a2, "kSARLegacy");
    goto LABEL_37;
  }
  if ((a1 & 2) == 0)
    goto LABEL_17;
  std::string::basic_string[abi:ne180100]<0>(__p, "kSARFusion");
  end = v24.__end_;
  if (v24.__end_ < v24.__end_cap_.__value_)
  {
    v5 = *(_OWORD *)__p;
    v24.__end_->__r_.__value_.__r.__words[2] = v23;
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v5;
    v24.__end_ = end + 1;
    if ((a1 & 4) == 0)
      goto LABEL_32;
LABEL_18:
    std::string::basic_string[abi:ne180100]<0>(__p, "kHSAR");
    v13 = v24.__end_;
    if (v24.__end_ >= v24.__end_cap_.__value_)
    {
      v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)v24.__end_ - (char *)v24.__begin_) >> 3);
      v16 = v15 + 1;
      if (v15 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      if (0x5555555555555556 * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3) > v16)
        v16 = 0x5555555555555556 * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3) >= 0x555555555555555)
        v17 = 0xAAAAAAAAAAAAAAALL;
      else
        v17 = v16;
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v24.__end_cap_;
      if (v17)
        v18 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v24.__end_cap_, v17);
      else
        v18 = 0;
      v19 = v18 + v15;
      __v.__first_ = v18;
      __v.__begin_ = v19;
      __v.__end_cap_.__value_ = &v18[v17];
      v20 = *(_OWORD *)__p;
      v19->__r_.__value_.__r.__words[2] = v23;
      *(_OWORD *)&v19->__r_.__value_.__l.__data_ = v20;
      __p[1] = 0;
      v23 = 0;
      __p[0] = 0;
      __v.__end_ = v19 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v24, &__v);
      v21 = v24.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v24.__end_ = v21;
      if (SHIBYTE(v23) < 0)
        operator delete(__p[0]);
    }
    else
    {
      v14 = *(_OWORD *)__p;
      v24.__end_->__r_.__value_.__r.__words[2] = v23;
      *(_OWORD *)&v13->__r_.__value_.__l.__data_ = v14;
      v24.__end_ = v13 + 1;
    }
    goto LABEL_32;
  }
  v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)v24.__end_ - (char *)v24.__begin_) >> 3);
  v7 = v6 + 1;
  if (v6 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  if (0x5555555555555556 * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3) > v7)
    v7 = 0x5555555555555556 * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3);
  v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3) >= 0x555555555555555
     ? 0xAAAAAAAAAAAAAAALL
     : v7;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v24.__end_cap_;
  v9 = v8
     ? (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v24.__end_cap_, v8)
     : 0;
  v10 = v9 + v6;
  __v.__first_ = v9;
  __v.__begin_ = v10;
  __v.__end_cap_.__value_ = &v9[v8];
  v11 = *(_OWORD *)__p;
  v10->__r_.__value_.__r.__words[2] = v23;
  *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
  __p[1] = 0;
  v23 = 0;
  __p[0] = 0;
  __v.__end_ = v10 + 1;
  std::vector<std::string>::__swap_out_circular_buffer(&v24, &__v);
  v12 = v24.__end_;
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  v24.__end_ = v12;
  if (SHIBYTE(v23) < 0)
  {
    operator delete(__p[0]);
    if ((a1 & 4) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_17:
    if ((a1 & 4) != 0)
      goto LABEL_18;
  }
LABEL_32:
  if (v24.__end_ != v24.__begin_)
  {
    ctu::join<std::__wrap_iter<std::string *>>(v24.__begin_, v24.__end_, " | ", 3uLL, (std::string *)&__v);
    if (SHIBYTE(v25[2]) < 0)
      operator delete(v25[0]);
    *(_OWORD *)v25 = *(_OWORD *)&__v.__first_;
    v25[2] = __v.__end_;
  }
  *(_OWORD *)a2 = *(_OWORD *)v25;
  *(void **)(a2 + 16) = v25[2];
  memset(v25, 0, sizeof(v25));
LABEL_37:
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v24;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  if (SHIBYTE(v25[2]) < 0)
    operator delete(v25[0]);
}

void sub_24B9E21F0(_Unwind_Exception *__p, uint64_t a2, int a3, __int16 a4, char a5, char a6, char a7, uint64_t a8, int *__pa, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, std::__split_buffer<std::string> *a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a24);
  if (SHIBYTE(a11) < 0)
    operator delete(__pa);
  __pa = &a12;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  if (a23 < 0)
    operator delete(a18);
  _Unwind_Resume(__p);
}

std::string *ctu::join<std::__wrap_iter<std::string *>>@<X0>(std::string *__str@<X0>, std::string *a2@<X1>, void *a3@<X2>, size_t a4@<X3>, std::string *a5@<X8>)
{
  std::string *v8;
  std::string *i;
  std::string::size_type v11;
  void **v12;
  std::string::size_type v13;
  void **p_p;
  std::string::size_type v15;
  int v16;
  const std::string::value_type *v17;
  std::string::size_type size;
  void *__p;
  std::string::size_type v20;
  uint64_t v21;

  a5->__r_.__value_.__r.__words[0] = 0;
  a5->__r_.__value_.__l.__size_ = 0;
  a5->__r_.__value_.__r.__words[2] = 0;
  if (__str != a2)
  {
    v8 = __str;
    __str = std::string::operator=(a5, __str);
    for (i = v8 + 1; i != a2; ++i)
    {
      if (a3)
      {
        std::string::basic_string[abi:ne180100](&__p, a3, a4);
        v11 = HIBYTE(v21);
        v12 = (void **)__p;
        v13 = v20;
      }
      else
      {
        v13 = 0;
        v12 = 0;
        v11 = 0;
        __p = 0;
        v20 = 0;
        v21 = 0;
      }
      if ((v11 & 0x80u) == 0)
        p_p = &__p;
      else
        p_p = v12;
      if ((v11 & 0x80u) == 0)
        v15 = v11;
      else
        v15 = v13;
      std::string::append(a5, (const std::string::value_type *)p_p, v15);
      if (SHIBYTE(v21) < 0)
        operator delete(__p);
      v16 = SHIBYTE(i->__r_.__value_.__r.__words[2]);
      if (v16 >= 0)
        v17 = (const std::string::value_type *)i;
      else
        v17 = (const std::string::value_type *)i->__r_.__value_.__r.__words[0];
      if (v16 >= 0)
        size = HIBYTE(i->__r_.__value_.__r.__words[2]);
      else
        size = i->__r_.__value_.__l.__size_;
      __str = std::string::append(a5, v17, size);
    }
  }
  return __str;
}

void sub_24B9E234C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  if (*(char *)(v15 + 23) < 0)
    operator delete(*(void **)v15);
  _Unwind_Resume(exception_object);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_251CC8DD8, MEMORY[0x24BEDAAF0]);
}

void sub_24B9E2478(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

uint64_t std::shared_ptr<ctu::Gestalt>::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
{
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return a1;
}

uint64_t std::shared_ptr<ctu::Gestalt>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::string *v4;
  std::string *begin;
  std::string *end;
  std::string *value;

  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void std::vector<std::string>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  _QWORD v12[4];
  __int128 v13;
  __int128 v14;

  v7 = a7;
  *(_QWORD *)&v14 = a6;
  *((_QWORD *)&v14 + 1) = a7;
  v13 = v14;
  v12[0] = a1;
  v12[1] = &v13;
  v12[2] = &v14;
  v12[3] = 0xAAAAAAAAAAAAAA01;
  if (a3 != a5)
  {
    v9 = a7;
    do
    {
      v10 = *(_OWORD *)(a3 - 24);
      *(_QWORD *)(v9 - 8) = *(_QWORD *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 8) = 0;
      *(_QWORD *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((_QWORD *)&v14 + 1) = v9;
  }
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100]((uint64_t)this, (void **)&this->__begin_->__r_.__value_.__l.__data_);
  if (this->__first_)
    operator delete(this->__first_);
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 3;
      *(_QWORD *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0)
      operator delete(*(void **)(i - 24));
  }
  a1[1] = v2;
}

uint64_t ctu::PthreadMutexGuardPolicy<ctu::Gestalt>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  pthread_mutex_lock((pthread_mutex_t *)a1);
  *(_QWORD *)(a1 + 64) = 0;
  v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  std::shared_ptr<ctu::Gestalt>::~shared_ptr[abi:ne180100](a1 + 64);
  return a1;
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__dst, void *__src, size_t __len)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((_BYTE *)__dst + 23) = __len;
    v6 = __dst;
    if (!__len)
      goto LABEL_9;
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

uint64_t __cxx_global_var_init()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ctu::Gestalt>::~PthreadMutexGuardPolicy, &ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance, &dword_24B9DC000);
  }
  return result;
}

uint64_t capabilities::absinternal::wakeReasonDebugEnabled(capabilities::absinternal *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  if ((v1 & 1) == 0
  {
    Radio = TelephonyRadiosGetRadio();
    capabilities::absinternal::wakeReasonDebugEnabled(void)::ret = (Radio < 0x12) & (0x23E00u >> Radio);
  }
  return capabilities::absinternal::wakeReasonDebugEnabled(void)::ret;
}

void sub_24B9E2B0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t capabilities::absinternal::shouldIgnoreResets(capabilities::absinternal *this)
{
  unsigned __int8 v1;
  int Product;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAC98);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAC98))
  {
    Product = TelephonyRadiosGetProduct();
    _MergedGlobals_0 = ((Product - 200) < 9) & (0x183u >> (Product + 56));
    __cxa_guard_release(&qword_2544DAC98);
  }
  return _MergedGlobals_0;
}

void sub_24B9E2B94(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAC98);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::ARICommandTimeout(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAD80);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAD80))
  {
    qword_2544DAD78 = 2000;
    __cxa_guard_release(&qword_2544DAD80);
  }
  return qword_2544DAD78;
}

uint64_t capabilities::updater::resetDelay(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAD90);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAD90))
  {
    qword_2544DAD88 = 0;
    __cxa_guard_release(&qword_2544DAD90);
  }
  return qword_2544DAD88;
}

uint64_t capabilities::updater::versionReadDelay(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DADA0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DADA0))
  {
    qword_2544DAD98 = 0;
    __cxa_guard_release(&qword_2544DADA0);
  }
  return qword_2544DAD98;
}

uint64_t capabilities::updater::manifestCheckRetryCount(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DADB0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DADB0))
  {
    qword_2544DADA8 = 2;
    __cxa_guard_release(&qword_2544DADB0);
  }
  return qword_2544DADA8;
}

uint64_t capabilities::updater::supportsSingleStageFusing(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DADB8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DADB8))
  {
    _MergedGlobals_1 = 1;
    __cxa_guard_release(&qword_2544DADB8);
  }
  return _MergedGlobals_1;
}

uint64_t capabilities::updater::repersonalizeLimitCount(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DADC8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DADC8))
  {
    qword_2544DADC0 = 2;
    __cxa_guard_release(&qword_2544DADC8);
  }
  return qword_2544DADC0;
}

uint64_t capabilities::updater::EUICCAttemptCount(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DADD8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DADD8))
  {
    qword_2544DADD0 = 3;
    __cxa_guard_release(&qword_2544DADD8);
  }
  return qword_2544DADD0;
}

uint64_t capabilities::updater::shouldBailOnEUICCError(capabilities::updater *this)
{
  unsigned __int8 v1;
  capabilities::euicc *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DADE0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::euicc *)__cxa_guard_acquire(&qword_2544DADE0);
    if ((_DWORD)v3)
    {
      byte_2544DACA1 = capabilities::euicc::supportsLegacyUpdater(v3);
      __cxa_guard_release(&qword_2544DADE0);
    }
  }
  return byte_2544DACA1;
}

void sub_24B9E2E34(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DADE0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::flashBased(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DADE8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DADE8))
  {
    byte_2544DACA2 = 0;
    __cxa_guard_release(&qword_2544DADE8);
  }
  return byte_2544DACA2;
}

uint64_t capabilities::updater::EFSFileSizeBytes(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DADF8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DADF8))
  {
    qword_2544DADF0 = 0x100000;
    __cxa_guard_release(&qword_2544DADF8);
  }
  return qword_2544DADF0;
}

uint64_t capabilities::updater::shouldFDRDataInstanceIncludeChipID(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAE00);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAE00))
  {
    byte_2544DACA3 = 1;
    __cxa_guard_release(&qword_2544DAE00);
  }
  return byte_2544DACA3;
}

uint64_t capabilities::updater::shouldRecreateTransportAfterPBL(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAE08);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAE08))
  {
    byte_2544DACA4 = 1;
    __cxa_guard_release(&qword_2544DAE08);
  }
  return byte_2544DACA4;
}

uint64_t capabilities::updater::shouldOverrideChipID(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAE10);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAE10))
  {
    byte_2544DACA5 = 0;
    __cxa_guard_release(&qword_2544DAE10);
  }
  return byte_2544DACA5;
}

void capabilities::updater::CALFileName(std::string *a1@<X8>)
{
  unsigned __int8 v3;
  capabilities::updater *v4;

  v3 = atomic_load((unsigned __int8 *)&qword_2544DAE18);
  if ((v3 & 1) == 0)
  {
    v4 = (capabilities::updater *)__cxa_guard_acquire(&qword_2544DAE18);
    if ((_DWORD)v4)
    {
      capabilities::updater::sCALFileName(v4);
      __cxa_atexit(MEMORY[0x24BEDACF0], &xmmword_2544DB120, &dword_24B9DC000);
      __cxa_guard_release(&qword_2544DAE18);
    }
  }
  if (byte_2544DB137 < 0)
  {
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)xmmword_2544DB120, *((std::string::size_type *)&xmmword_2544DB120 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_2544DB120;
    a1->__r_.__value_.__r.__words[2] = unk_2544DB130;
  }
}

void sub_24B9E308C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAE18);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::sCALFileName(capabilities::updater *this)
{
  __int128 *v1;
  uint64_t result;
  _BYTE *v3;
  int v4;

  v1 = &xmmword_2544DB120;
  memset(&xmmword_2544DB120, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_2544DB120, "unknown");
  result = TelephonyRadiosGetRadioVendor();
  if ((_DWORD)result == 1)
  {
    if (byte_2544DB137 < 0)
    {
      *((_QWORD *)&xmmword_2544DB120 + 1) = 7;
      v1 = (__int128 *)xmmword_2544DB120;
    }
    else
    {
      byte_2544DB137 = 7;
    }
    *(_DWORD *)((char *)v1 + 3) = 1919247406;
    v4 = 778854755;
    goto LABEL_15;
  }
  if ((_DWORD)result != 2)
  {
    if (byte_2544DB137 < 0)
    {
      *((_QWORD *)&xmmword_2544DB120 + 1) = 7;
      v1 = (__int128 *)xmmword_2544DB120;
    }
    else
    {
      byte_2544DB137 = 7;
    }
    *(_DWORD *)((char *)v1 + 3) = 1853321070;
    v4 = 1852534389;
LABEL_15:
    *(_DWORD *)v1 = v4;
    v3 = (char *)v1 + 7;
    goto LABEL_16;
  }
  if (byte_2544DB137 < 0)
  {
    *((_QWORD *)&xmmword_2544DB120 + 1) = 9;
    v1 = (__int128 *)xmmword_2544DB120;
  }
  else
  {
    byte_2544DB137 = 9;
  }
  *((_BYTE *)v1 + 8) = 109;
  *(_QWORD *)v1 = *(_QWORD *)"calib.nvm";
  v3 = (char *)v1 + 9;
LABEL_16:
  *v3 = 0;
  return result;
}

void sub_24B9E31B0(_Unwind_Exception *exception_object)
{
  if (byte_2544DB137 < 0)
    operator delete((void *)xmmword_2544DB120);
  _Unwind_Resume(exception_object);
}

void capabilities::updater::PROVFileName(std::string *a1@<X8>)
{
  unsigned __int8 v3;
  capabilities::updater *v4;

  v3 = atomic_load((unsigned __int8 *)&qword_2544DAE20);
  if ((v3 & 1) == 0)
  {
    v4 = (capabilities::updater *)__cxa_guard_acquire(&qword_2544DAE20);
    if ((_DWORD)v4)
    {
      capabilities::updater::sPROVFileName(v4);
      __cxa_atexit(MEMORY[0x24BEDACF0], &xmmword_2544DB138, &dword_24B9DC000);
      __cxa_guard_release(&qword_2544DAE20);
    }
  }
  if (byte_2544DB14F < 0)
  {
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)xmmword_2544DB138, *((std::string::size_type *)&xmmword_2544DB138 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_2544DB138;
    a1->__r_.__value_.__r.__words[2] = unk_2544DB148;
  }
}

void sub_24B9E327C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAE20);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::sPROVFileName(capabilities::updater *this)
{
  __int128 *v1;
  uint64_t result;
  _BYTE *v3;

  v1 = &xmmword_2544DB138;
  memset(&xmmword_2544DB138, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_2544DB138, "unknown");
  result = TelephonyRadiosGetRadioVendor();
  if ((result - 1) >= 2)
  {
    if (byte_2544DB14F < 0)
    {
      *((_QWORD *)&xmmword_2544DB138 + 1) = 7;
      v1 = (__int128 *)xmmword_2544DB138;
    }
    else
    {
      byte_2544DB14F = 7;
    }
    *(_DWORD *)((char *)v1 + 3) = 1853321070;
    *(_DWORD *)v1 = 1852534389;
    v3 = (char *)v1 + 7;
  }
  else
  {
    if (byte_2544DB14F < 0)
    {
      *((_QWORD *)&xmmword_2544DB138 + 1) = 8;
      v1 = (__int128 *)xmmword_2544DB138;
    }
    else
    {
      byte_2544DB14F = 8;
    }
    *(_QWORD *)v1 = 0x7265642E766F7270;
    v3 = (char *)v1 + 8;
  }
  *v3 = 0;
  return result;
}

void sub_24B9E3354(_Unwind_Exception *exception_object)
{
  if (byte_2544DB14F < 0)
    operator delete((void *)xmmword_2544DB138);
  _Unwind_Resume(exception_object);
}

void capabilities::updater::PACFileName(std::string *a1@<X8>)
{
  unsigned __int8 v3;
  capabilities::updater *v4;

  v3 = atomic_load((unsigned __int8 *)&qword_2544DAE28);
  if ((v3 & 1) == 0)
  {
    v4 = (capabilities::updater *)__cxa_guard_acquire(&qword_2544DAE28);
    if ((_DWORD)v4)
    {
      capabilities::updater::sPACFileName(v4);
      __cxa_atexit(MEMORY[0x24BEDACF0], &xmmword_2544DB150, &dword_24B9DC000);
      __cxa_guard_release(&qword_2544DAE28);
    }
  }
  if (byte_2544DB167 < 0)
  {
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)xmmword_2544DB150, *((std::string::size_type *)&xmmword_2544DB150 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_2544DB150;
    a1->__r_.__value_.__r.__words[2] = unk_2544DB160;
  }
}

void sub_24B9E3420(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAE28);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::sPACFileName(capabilities::updater *this)
{
  __int128 *v1;
  uint64_t result;
  _BYTE *v3;

  v1 = &xmmword_2544DB150;
  memset(&xmmword_2544DB150, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_2544DB150, "unknown");
  result = TelephonyRadiosGetRadioVendor();
  if ((result - 1) >= 2)
  {
    if (byte_2544DB167 < 0)
    {
      *((_QWORD *)&xmmword_2544DB150 + 1) = 7;
      v1 = (__int128 *)xmmword_2544DB150;
    }
    else
    {
      byte_2544DB167 = 7;
    }
    *(_DWORD *)((char *)v1 + 3) = 1853321070;
    *(_DWORD *)v1 = 1852534389;
    v3 = (char *)v1 + 7;
  }
  else
  {
    if (byte_2544DB167 < 0)
    {
      *((_QWORD *)&xmmword_2544DB150 + 1) = 9;
      v1 = (__int128 *)xmmword_2544DB150;
    }
    else
    {
      byte_2544DB167 = 9;
    }
    *((_BYTE *)v1 + 8) = 114;
    *(_QWORD *)v1 = *(_QWORD *)"bbpac.der";
    v3 = (char *)v1 + 9;
  }
  *v3 = 0;
  return result;
}

void sub_24B9E3504(_Unwind_Exception *exception_object)
{
  if (byte_2544DB167 < 0)
    operator delete((void *)xmmword_2544DB150);
  _Unwind_Resume(exception_object);
}

uint64_t capabilities::updater::loaderConnectAttempts(capabilities::updater *this)
{
  unsigned __int8 v1;
  int v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAE30);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAE30))
  {
    if (TelephonyRadiosGetRadioVendor() - 1 >= 2)
      v3 = 4;
    else
      v3 = 2;
    dword_2544DACC0 = v3;
    __cxa_guard_release(&qword_2544DAE30);
  }
  return dword_2544DACC0;
}

void sub_24B9E3598(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAE30);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::shouldRetryBootOnUpdateFailure(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAE38);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAE38))
  {
    TelephonyRadiosGetRadioVendor();
    byte_2544DACA6 = 0;
    __cxa_guard_release(&qword_2544DAE38);
  }
  return byte_2544DACA6;
}

void sub_24B9E360C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAE38);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::NVRestoreTimeout(capabilities::updater *this)
{
  unsigned __int8 v1;
  int RadioVendor;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAE48);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAE48))
  {
    RadioVendor = TelephonyRadiosGetRadioVendor();
    v4 = 4000;
    if ((RadioVendor - 1) >= 2)
      v4 = 0;
    qword_2544DAE40 = v4;
    __cxa_guard_release(&qword_2544DAE48);
  }
  return qword_2544DAE40;
}

void sub_24B9E368C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAE48);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::provisioningCommandTimeout(capabilities::updater *this)
{
  unsigned __int8 v1;
  int RadioVendor;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAE58);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAE58))
  {
    RadioVendor = TelephonyRadiosGetRadioVendor();
    v4 = 3000;
    if ((RadioVendor - 1) >= 2)
      v4 = 0;
    qword_2544DAE50 = v4;
    __cxa_guard_release(&qword_2544DAE58);
  }
  return qword_2544DAE50;
}

void sub_24B9E370C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAE58);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::personalizationCommandTimeout(capabilities::updater *this)
{
  unsigned __int8 v1;
  int RadioVendor;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAE68);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAE68))
  {
    RadioVendor = TelephonyRadiosGetRadioVendor();
    v4 = 2000;
    if ((RadioVendor - 1) >= 2)
      v4 = 0;
    qword_2544DAE60 = v4;
    __cxa_guard_release(&qword_2544DAE68);
  }
  return qword_2544DAE60;
}

void sub_24B9E378C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAE68);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::SPCUnlockDelay(capabilities::updater *this)
{
  unsigned __int8 v1;
  int RadioVendor;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAE78);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAE78))
  {
    RadioVendor = TelephonyRadiosGetRadioVendor();
    v4 = 10000;
    if ((RadioVendor - 1) >= 2)
      v4 = 0;
    qword_2544DAE70 = v4;
    __cxa_guard_release(&qword_2544DAE78);
  }
  return qword_2544DAE70;
}

void sub_24B9E380C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAE78);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::supportsPowerdown(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAE80);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAE80))
  {
    byte_2544DACA7 = TelephonyRadiosGetRadioVendor() - 1 < 2;
    __cxa_guard_release(&qword_2544DAE80);
  }
  return byte_2544DACA7;
}

void sub_24B9E388C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAE80);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::supportsProvisioning(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAE88);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAE88))
  {
    byte_2544DACA8 = TelephonyRadiosGetRadioVendor() - 1 < 2;
    __cxa_guard_release(&qword_2544DAE88);
  }
  return byte_2544DACA8;
}

void sub_24B9E390C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAE88);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::shouldBailOnNoManifestHashes(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAE90);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAE90))
  {
    byte_2544DACA9 = TelephonyRadiosGetRadioVendor() - 1 < 2;
    __cxa_guard_release(&qword_2544DAE90);
  }
  return byte_2544DACA9;
}

void sub_24B9E398C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAE90);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::switchPingCount(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAEA0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAEA0))
  {
    qword_2544DAE98 = TelephonyRadiosGetRadioVendor() - 1 < 2;
    __cxa_guard_release(&qword_2544DAEA0);
  }
  return qword_2544DAE98;
}

void sub_24B9E3A08(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAEA0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::pingAttemptCount(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAEB0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAEB0))
  {
    v3 = TelephonyRadiosGetRadioVendor() - 1;
    if (v3 > 2)
      v4 = 0;
    else
      v4 = qword_24B9FD8B8[v3];
    qword_2544DAEA8 = v4;
    __cxa_guard_release(&qword_2544DAEB0);
  }
  return qword_2544DAEA8;
}

void sub_24B9E3A98(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAEB0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::pingTimeout(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAEC0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAEC0))
  {
    v3 = TelephonyRadiosGetRadio() - 1;
    if (v3 > 0x10)
      v4 = 0;
    else
      v4 = qword_24B9FD8D0[v3];
    qword_2544DAEB8 = v4;
    __cxa_guard_release(&qword_2544DAEC0);
  }
  return qword_2544DAEB8;
}

void sub_24B9E3B28(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAEC0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::initialStagePingAttemptCount(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAED0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAED0))
  {
    qword_2544DAEC8 = 2 * (TelephonyRadiosGetRadioVendor() - 1 < 2);
    __cxa_guard_release(&qword_2544DAED0);
  }
  return qword_2544DAEC8;
}

void sub_24B9E3BA8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAED0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::intermittentFailureRetryCount(capabilities::updater *this)
{
  unsigned __int8 v1;
  int v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAED8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAED8))
  {
    if (TelephonyRadiosGetRadioVendor() - 1 >= 2)
      v3 = 1;
    else
      v3 = 2;
    dword_2544DACC4 = v3;
    __cxa_guard_release(&qword_2544DAED8);
  }
  return dword_2544DACC4;
}

void sub_24B9E3C2C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAED8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::loaderCommandTimeout(capabilities::updater *this)
{
  unsigned __int8 v1;
  int RadioVendor;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAEE8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAEE8))
  {
    RadioVendor = TelephonyRadiosGetRadioVendor();
    v4 = 1000;
    if ((RadioVendor - 1) >= 2)
      v4 = 0;
    qword_2544DAEE0 = v4;
    __cxa_guard_release(&qword_2544DAEE8);
  }
  return qword_2544DAEE0;
}

void sub_24B9E3CAC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAEE8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::supportsBbcfgImage(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAEF0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAEF0))
  {
    byte_2544DACAA = TelephonyRadiosGetRadioVendor() - 1 < 2;
    __cxa_guard_release(&qword_2544DAEF0);
  }
  return byte_2544DACAA;
}

void sub_24B9E3D2C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAEF0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::shouldSkipRestoreForUnfused(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAEF8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAEF8))
  {
    byte_2544DACAB = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_2544DAEF8);
  }
  return byte_2544DACAB;
}

void sub_24B9E3DA8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAEF8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getCommunicationType(capabilities::updater *this)
{
  unsigned __int8 v1;
  int RadioVendor;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAF00);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAF00))
  {
    RadioVendor = TelephonyRadiosGetRadioVendor();
    if (RadioVendor == 2)
      v4 = 2;
    else
      v4 = 3;
    if (RadioVendor == 1)
      v4 = 1;
    dword_2544DACC8 = v4;
    __cxa_guard_release(&qword_2544DAF00);
  }
  return dword_2544DACC8;
}

void sub_24B9E3E30(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAF00);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getInitializerVersion(capabilities::updater *this)
{
  unsigned __int8 v1;
  int RadioVendor;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAF08);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAF08))
  {
    RadioVendor = TelephonyRadiosGetRadioVendor();
    if (RadioVendor == 2)
      v4 = 2;
    else
      v4 = 3;
    if (RadioVendor == 1)
      v4 = 1;
    dword_2544DACCC = v4;
    __cxa_guard_release(&qword_2544DAF08);
  }
  return dword_2544DACCC;
}

void sub_24B9E3EB8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAF08);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getPersonalizationParameters(capabilities::updater *this)
{
  unsigned __int8 v1;
  int RadioVendor;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAF10);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAF10))
  {
    RadioVendor = TelephonyRadiosGetRadioVendor();
    if (RadioVendor == 2)
      v4 = 1;
    else
      v4 = 2;
    if (RadioVendor == 1)
      v4 = 0;
    dword_2544DACD0 = v4;
    __cxa_guard_release(&qword_2544DAF10);
  }
  return dword_2544DACD0;
}

void sub_24B9E3F40(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAF10);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getLoaderProgressBarTimesType(capabilities::updater *this)
{
  unsigned __int8 v1;
  int RadioVendor;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAF18);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAF18))
  {
    RadioVendor = TelephonyRadiosGetRadioVendor();
    if (RadioVendor == 2)
      v4 = 1;
    else
      v4 = 2;
    if (RadioVendor == 1)
      v4 = 0;
    dword_2544DACD4 = v4;
    __cxa_guard_release(&qword_2544DAF18);
  }
  return dword_2544DACD4;
}

void sub_24B9E3FC8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAF18);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getProvisionerType(capabilities::updater *this)
{
  unsigned __int8 v1;
  int RadioVendor;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAF20);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAF20))
  {
    RadioVendor = TelephonyRadiosGetRadioVendor();
    if (RadioVendor == 2)
      v4 = 1;
    else
      v4 = 2;
    if (RadioVendor == 1)
      v4 = 0;
    dword_2544DACD8 = v4;
    __cxa_guard_release(&qword_2544DAF20);
  }
  return dword_2544DACD8;
}

void sub_24B9E4050(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAF20);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getBasebandMigrationDataType(capabilities::updater *this)
{
  unsigned __int8 v1;
  int RadioVendor;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAF28);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAF28))
  {
    RadioVendor = TelephonyRadiosGetRadioVendor();
    if (RadioVendor == 2)
      v4 = 1;
    else
      v4 = 2;
    if (RadioVendor == 1)
      v4 = 0;
    dword_2544DACDC = v4;
    __cxa_guard_release(&qword_2544DAF28);
  }
  return dword_2544DACDC;
}

void sub_24B9E40D8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAF28);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getTransportType(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAF30);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAF30))
  {
    v3 = TelephonyRadiosGetRadioVendor() - 1;
    if (v3 > 2)
      v4 = 3;
    else
      v4 = dword_24B9FD958[v3];
    dword_2544DACE0 = v4;
    __cxa_guard_release(&qword_2544DAF30);
  }
  return dword_2544DACE0;
}

void sub_24B9E416C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAF30);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getSBLType(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAF38);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAF38))
  {
    dword_2544DACE4 = TelephonyRadiosGetRadioVendor() != 1;
    __cxa_guard_release(&qword_2544DAF38);
  }
  return dword_2544DACE4;
}

void sub_24B9E41E8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAF38);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getAPPSType(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAF40);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAF40))
  {
    dword_2544DACE8 = TelephonyRadiosGetRadioVendor() != 1;
    __cxa_guard_release(&qword_2544DAF40);
  }
  return dword_2544DACE8;
}

void sub_24B9E4264(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAF40);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getQDSP6SWType(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAF48);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAF48))
  {
    dword_2544DACEC = TelephonyRadiosGetRadioVendor() != 1;
    __cxa_guard_release(&qword_2544DAF48);
  }
  return dword_2544DACEC;
}

void sub_24B9E42E0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAF48);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getTZType(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAF50);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAF50))
  {
    dword_2544DACF0 = TelephonyRadiosGetRadioVendor() != 1;
    __cxa_guard_release(&qword_2544DAF50);
  }
  return dword_2544DACF0;
}

void sub_24B9E435C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAF50);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getACDBType(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAF58);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAF58))
  {
    dword_2544DACF4 = TelephonyRadiosGetRadioVendor() != 1;
    __cxa_guard_release(&qword_2544DAF58);
  }
  return dword_2544DACF4;
}

void sub_24B9E43D8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAF58);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getEFS1Type(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAF60);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAF60))
  {
    dword_2544DACF8 = TelephonyRadiosGetRadioVendor() != 1;
    __cxa_guard_release(&qword_2544DAF60);
  }
  return dword_2544DACF8;
}

void sub_24B9E4454(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAF60);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getEFS2Type(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAF68);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAF68))
  {
    dword_2544DACFC = TelephonyRadiosGetRadioVendor() != 1;
    __cxa_guard_release(&qword_2544DAF68);
  }
  return dword_2544DACFC;
}

void sub_24B9E44D0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAF68);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getEFS3Type(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAF70);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAF70))
  {
    dword_2544DAD00 = TelephonyRadiosGetRadioVendor() != 1;
    __cxa_guard_release(&qword_2544DAF70);
  }
  return dword_2544DAD00;
}

void sub_24B9E454C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAF70);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getCalType(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAF78);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAF78))
  {
    dword_2544DAD04 = TelephonyRadiosGetRadioVendor() != 1;
    __cxa_guard_release(&qword_2544DAF78);
  }
  return dword_2544DAD04;
}

void sub_24B9E45C8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAF78);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getProvType(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAF80);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAF80))
  {
    dword_2544DAD08 = TelephonyRadiosGetRadioVendor() != 1;
    __cxa_guard_release(&qword_2544DAF80);
  }
  return dword_2544DAD08;
}

void sub_24B9E4644(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAF80);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getPacType(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAF88);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAF88))
  {
    dword_2544DAD0C = TelephonyRadiosGetRadioVendor() != 1;
    __cxa_guard_release(&qword_2544DAF88);
  }
  return dword_2544DAD0C;
}

void sub_24B9E46C0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAF88);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getBBCFGType(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAF90);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAF90))
  {
    dword_2544DAD10 = TelephonyRadiosGetRadioVendor() != 1;
    __cxa_guard_release(&qword_2544DAF90);
  }
  return dword_2544DAD10;
}

void sub_24B9E473C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAF90);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::EUICCVinylSuccessStatus(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int RadioVendor;
  unint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAF98);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAF98))
  {
    RadioVendor = TelephonyRadiosGetRadioVendor();
    v4 = 0x100uLL >> (8 * RadioVendor);
    if (RadioVendor >= 5)
      LOBYTE(v4) = 0;
    byte_2544DACAC = v4;
    __cxa_guard_release(&qword_2544DAF98);
  }
  return byte_2544DACAC;
}

void sub_24B9E47C4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAF98);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::shouldResetToPBLAfterReset(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAFA0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAFA0))
  {
    byte_2544DACAD = TelephonyRadiosGetRadioVendor() - 1 < 2;
    __cxa_guard_release(&qword_2544DAFA0);
  }
  return byte_2544DACAD;
}

void sub_24B9E4844(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAFA0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::supportsEUICCUpdate(capabilities::updater *this)
{
  unsigned __int8 v1;
  capabilities::updater *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAFA8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::updater *)__cxa_guard_acquire(&qword_2544DAFA8);
    if ((_DWORD)v3)
    {
      byte_2544DACAE = capabilities::updater::sSupportsEUICCUpdate(v3);
      __cxa_guard_release(&qword_2544DAFA8);
    }
  }
  return byte_2544DACAE;
}

void sub_24B9E48B8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAFA8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::sSupportsEUICCUpdate(capabilities::updater *this)
{
  uint64_t v1;
  ctu::Gestalt *v3;
  void *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  __int128 v13;

  v1 = 1;
  switch(TelephonyRadiosGetProduct())
  {
    case 0x34u:
    case 0x35u:
    case 0x3Cu:
    case 0x3Du:
    case 0x4Fu:
    case 0x50u:
    case 0x51u:
    case 0x52u:
    case 0x53u:
    case 0x54u:
    case 0x57u:
    case 0x58u:
    case 0x59u:
    case 0x5Au:
    case 0x5Bu:
    case 0x5Cu:
    case 0x5Du:
    case 0x5Eu:
    case 0x5Fu:
    case 0x60u:
    case 0x61u:
    case 0x63u:
    case 0x64u:
    case 0x65u:
    case 0x66u:
    case 0x67u:
    case 0x68u:
    case 0x69u:
    case 0x6Au:
    case 0x6Bu:
    case 0x6Cu:
    case 0x6Du:
    case 0x6Eu:
    case 0x6Fu:
    case 0x70u:
    case 0x72u:
    case 0x73u:
    case 0x74u:
    case 0x75u:
    case 0x76u:
    case 0x77u:
    case 0x78u:
    case 0x7Au:
    case 0x7Bu:
    case 0x7Cu:
    case 0x7Du:
    case 0x7Eu:
    case 0x7Fu:
    case 0x80u:
    case 0x84u:
    case 0x85u:
    case 0x86u:
    case 0x87u:
    case 0x88u:
    case 0x89u:
    case 0x8Au:
    case 0x8Eu:
    case 0x8Fu:
    case 0x90u:
    case 0x91u:
    case 0x92u:
    case 0x93u:
    case 0x94u:
    case 0x95u:
    case 0x96u:
    case 0x97u:
    case 0x98u:
    case 0x9Du:
    case 0x9Eu:
    case 0x9Fu:
    case 0xCBu:
    case 0xD4u:
      return v1;
    case 0x81u:
    case 0x82u:
    case 0x83u:
    case 0x8Bu:
    case 0x8Cu:
    case 0x8Du:
    case 0x99u:
    case 0x9Au:
    case 0x9Bu:
    case 0xD1u:
    case 0xD3u:
      v3 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
      v4 = off_2544DA7D8;
      if (!off_2544DA7D8)
      {
        ctu::Gestalt::create_default_global(v3);
        std::shared_ptr<ctu::Gestalt>::operator=[abi:ne180100]((uint64_t)&off_2544DA7D8, &v13);
        v5 = (std::__shared_weak_count *)*((_QWORD *)&v13 + 1);
        if (*((_QWORD *)&v13 + 1))
        {
          v6 = (unint64_t *)(*((_QWORD *)&v13 + 1) + 8);
          do
            v7 = __ldaxr(v6);
          while (__stlxr(v7 - 1, v6));
          if (!v7)
          {
            ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
            std::__shared_weak_count::__release_weak(v5);
          }
        }
        v4 = off_2544DA7D8;
      }
      v8 = (std::__shared_weak_count *)off_2544DA7E0;
      if (off_2544DA7E0)
      {
        v9 = (unint64_t *)((char *)off_2544DA7E0 + 8);
        do
          v10 = __ldxr(v9);
        while (__stxr(v10 + 1, v9));
      }
      pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
      v1 = (*(unsigned int (**)(void *))(*(_QWORD *)v4 + 120))(v4) ^ 1;
      if (v8)
      {
        p_shared_owners = (unint64_t *)&v8->__shared_owners_;
        do
          v12 = __ldaxr(p_shared_owners);
        while (__stlxr(v12 - 1, p_shared_owners));
        if (!v12)
        {
          ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
          std::__shared_weak_count::__release_weak(v8);
        }
      }
      break;
    default:
      v1 = 0;
      break;
  }
  return v1;
}

void sub_24B9E4A14(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::BBUFSPartitionSizeMB(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAFB8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAFB8))
  {
    v3 = TelephonyRadiosGetRadio() - 2;
    if (v3 > 0xF)
      v4 = 0;
    else
      v4 = qword_24B9FD968[v3];
    qword_2544DAFB0 = v4;
    __cxa_guard_release(&qword_2544DAFB8);
  }
  return qword_2544DAFB0;
}

void sub_24B9E4ABC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAFB8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getDigestType(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAFC0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAFC0))
  {
    v3 = TelephonyRadiosGetRadio() - 7;
    if (v3 > 0xA)
      v4 = 1;
    else
      v4 = dword_24B9FD9E8[v3];
    dword_2544DAD14 = v4;
    __cxa_guard_release(&qword_2544DAFC0);
  }
  return dword_2544DAD14;
}

void sub_24B9E4B50(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAFC0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getFusingType(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAFC8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAFC8))
  {
    v3 = TelephonyRadiosGetRadio() - 2;
    if (v3 > 0xF)
      v4 = 2;
    else
      v4 = dword_24B9FDAD4[v3];
    dword_2544DAD18 = v4;
    __cxa_guard_release(&qword_2544DAFC8);
  }
  return dword_2544DAD18;
}

void sub_24B9E4BE4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAFC8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getLoaderType(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAFD0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAFD0))
  {
    v3 = TelephonyRadiosGetRadio() - 2;
    if (v3 > 0xF)
      v4 = 4;
    else
      v4 = dword_24B9FDA14[v3];
    dword_2544DAD1C = v4;
    __cxa_guard_release(&qword_2544DAFD0);
  }
  return dword_2544DAD1C;
}

void sub_24B9E4C78(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAFD0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getProgrammerType(capabilities::updater *this)
{
  unsigned __int8 v1;
  capabilities::updater *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAFD8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::updater *)__cxa_guard_acquire(&qword_2544DAFD8);
    if ((_DWORD)v3)
    {
      dword_2544DAD20 = capabilities::updater::sGetProgrammerType(v3);
      __cxa_guard_release(&qword_2544DAFD8);
    }
  }
  return dword_2544DAD20;
}

void sub_24B9E4CEC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAFD8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::sGetProgrammerType(capabilities::updater *this)
{
  unsigned int v1;

  v1 = TelephonyRadiosGetRadio() - 2;
  if (v1 > 0xF)
    return 4;
  else
    return dword_24B9FDA54[v1];
}

uint64_t capabilities::updater::getProgrammerProgressBarTimesType(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAFE0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAFE0))
  {
    v3 = TelephonyRadiosGetRadio() - 2;
    if (v3 > 0xF)
      v4 = 3;
    else
      v4 = dword_24B9FDA94[v3];
    dword_2544DAD24 = v4;
    __cxa_guard_release(&qword_2544DAFE0);
  }
  return dword_2544DAD24;
}

void sub_24B9E4DB4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAFE0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getFusingProgramType(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAFE8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAFE8))
  {
    v3 = TelephonyRadiosGetRadio() - 2;
    if (v3 > 0xF)
      v4 = 2;
    else
      v4 = dword_24B9FDAD4[v3];
    dword_2544DAD28 = v4;
    __cxa_guard_release(&qword_2544DAFE8);
  }
  return dword_2544DAD28;
}

void sub_24B9E4E48(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAFE8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getUpdateSourceType(capabilities::updater *this)
{
  unsigned __int8 v1;
  capabilities::updater *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAFF0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::updater *)__cxa_guard_acquire(&qword_2544DAFF0);
    if ((_DWORD)v3)
    {
      dword_2544DAD2C = capabilities::updater::sGetUpdateSourceType(v3);
      __cxa_guard_release(&qword_2544DAFF0);
    }
  }
  return dword_2544DAD2C;
}

void sub_24B9E4EBC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAFF0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::sGetUpdateSourceType(capabilities::updater *this)
{
  unsigned int v1;

  v1 = TelephonyRadiosGetRadio() - 2;
  if (v1 > 0xF)
    return 5;
  else
    return dword_24B9FDB14[v1];
}

uint64_t capabilities::updater::getRPMType(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DAFF8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DAFF8))
  {
    dword_2544DAD30 = (TelephonyRadiosGetRadio() & 0xFFFFFFFE) != 2;
    __cxa_guard_release(&qword_2544DAFF8);
  }
  return dword_2544DAD30;
}

void sub_24B9E4F70(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DAFF8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getDSP3Type(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB000);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB000))
  {
    dword_2544DAD34 = (TelephonyRadiosGetRadio() & 0xFFFFFFFE) != 2;
    __cxa_guard_release(&qword_2544DB000);
  }
  return dword_2544DAD34;
}

void sub_24B9E4FF0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB000);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getMBAType(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB008);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB008))
  {
    dword_2544DAD38 = (TelephonyRadiosGetRadio() & 0xFFFFFFFE) != 2;
    __cxa_guard_release(&qword_2544DB008);
  }
  return dword_2544DAD38;
}

void sub_24B9E5070(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB008);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getWDTType(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB010);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB010))
  {
    dword_2544DAD3C = (TelephonyRadiosGetRadio() & 0xFFFFFFFE) != 2;
    __cxa_guard_release(&qword_2544DB010);
  }
  return dword_2544DAD3C;
}

void sub_24B9E50F0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB010);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getActType(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB018);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB018))
  {
    dword_2544DAD40 = (TelephonyRadiosGetRadio() & 0xFFFFFFFE) != 2;
    __cxa_guard_release(&qword_2544DB018);
  }
  return dword_2544DAD40;
}

void sub_24B9E5170(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB018);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::bootupTimeMaxValue(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB028);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB028))
  {
    v3 = TelephonyRadiosGetRadio() - 2;
    if (v3 > 0xF)
      v4 = 3500;
    else
      v4 = qword_24B9FDB58[v3];
    qword_2544DB020 = v4;
    __cxa_guard_release(&qword_2544DB028);
  }
  return qword_2544DB020;
}

void sub_24B9E5200(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB028);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getFirmwareVersion(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB030);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB030))
  {
    v3 = TelephonyRadiosGetRadio() - 2;
    if (v3 > 0xF)
      v4 = 3;
    else
      v4 = dword_24B9FDBD8[v3];
    dword_2544DAD44 = v4;
    __cxa_guard_release(&qword_2544DB030);
  }
  return dword_2544DAD44;
}

void sub_24B9E5294(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB030);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::supportsFATPCalibrationManifestStatus(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB038);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB038))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DACAF = (Radio < 0x12) & (0x2FE08u >> Radio);
    __cxa_guard_release(&qword_2544DB038);
  }
  return byte_2544DACAF;
}

void sub_24B9E5320(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB038);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::hasMEID(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB040);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB040))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DACB0 = (Radio < 9) & (0x190u >> Radio);
    __cxa_guard_release(&qword_2544DB040);
  }
  return byte_2544DACB0;
}

void sub_24B9E53A8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB040);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::supportsDualIMEIProvision(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB048);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB048))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DACB1 = (Radio < 0x12) & (0x23F80u >> Radio);
    __cxa_guard_release(&qword_2544DB048);
  }
  return byte_2544DACB1;
}

void sub_24B9E5434(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB048);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::supportsEBLXor(capabilities::updater *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB050);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB050))
  {
    byte_2544DACB2 = TelephonyRadiosGetRadio() - 9 < 0xFFFFFFFE;
    __cxa_guard_release(&qword_2544DB050);
  }
  return byte_2544DACB2;
}

void sub_24B9E54B4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB050);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::supportsHashSha384(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB058);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB058))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DACB3 = (Radio < 0x12) & (0x23F80u >> Radio);
    __cxa_guard_release(&qword_2544DB058);
  }
  return byte_2544DACB3;
}

void sub_24B9E5540(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB058);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::shouldOnlySyncDynamicOnShutdown(capabilities::updater *this)
{
  unsigned __int8 v1;
  capabilities::updater *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB060);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::updater *)__cxa_guard_acquire(&qword_2544DB060);
    if ((_DWORD)v3)
    {
      byte_2544DACB4 = capabilities::updater::sShouldOnlySyncDynamicOnShutdown(v3);
      __cxa_guard_release(&qword_2544DB060);
    }
  }
  return byte_2544DACB4;
}

void sub_24B9E55B4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB060);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::sShouldOnlySyncDynamicOnShutdown(capabilities::updater *this)
{
  uint64_t v1;
  int Product;
  BOOL v3;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  v3 = (Product - 91) > 6 || ((1 << (Product - 91)) & 0x47) == 0;
  if (v3
    && ((Product - 156) > 0x2F || ((1 << (Product + 100)) & 0xC00000000001) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::updater::shouldStripFDRDataOnAP(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB068);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB068))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DACB5 = (Radio < 0x12) & (0x23F00u >> Radio);
    __cxa_guard_release(&qword_2544DB068);
  }
  return byte_2544DACB5;
}

void sub_24B9E56A8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB068);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::shouldWaitForReadyAfterBoot(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB070);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB070))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DACB6 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_2544DB070);
  }
  return byte_2544DACB6;
}

void sub_24B9E5734(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB070);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::pingDelay(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB080);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB080))
  {
    v3 = TelephonyRadiosGetRadio() - 9;
    if (v3 > 8)
      v4 = 0;
    else
      v4 = qword_24B9FDC18[v3];
    qword_2544DB078 = v4;
    __cxa_guard_release(&qword_2544DB080);
  }
  return qword_2544DB078;
}

void sub_24B9E57C4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB080);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::supportsNVSettingOQCMagic(capabilities::updater *this)
{
  unsigned __int8 v1;
  capabilities::updater *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB088);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::updater *)__cxa_guard_acquire(&qword_2544DB088);
    if ((_DWORD)v3)
    {
      byte_2544DACB7 = capabilities::updater::sSupportsNVSettingOQCMagic(v3);
      __cxa_guard_release(&qword_2544DB088);
    }
  }
  return byte_2544DACB7;
}

void sub_24B9E5838(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB088);
  _Unwind_Resume(a1);
}

BOOL capabilities::updater::sSupportsNVSettingOQCMagic(capabilities::updater *this)
{
  unsigned int v1;

  v1 = TelephonyRadiosGetProduct() - 99;
  return v1 > 0x3C || ((1 << v1) & 0x1C0380E00F279E0FLL) == 0;
}

uint64_t capabilities::updater::supportsDDRDataSaving(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB090);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB090))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DACB8 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_2544DB090);
  }
  return byte_2544DACB8;
}

void sub_24B9E5930(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB090);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::DDRDataMaxSizeBytes(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB098);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB098))
  {
    v3 = TelephonyRadiosGetRadio() - 9;
    if (v3 > 8)
      v4 = 0x4000;
    else
      v4 = dword_24B9FDC60[v3];
    dword_2544DAD48 = v4;
    __cxa_guard_release(&qword_2544DB098);
  }
  return dword_2544DAD48;
}

void sub_24B9E59C4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB098);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::supportsBBFusing(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB0A0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB0A0))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DACB9 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_2544DB0A0);
  }
  return byte_2544DACB9;
}

void sub_24B9E5A50(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB0A0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getMDMDDRType(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB0A8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB0A8))
  {
    v3 = TelephonyRadiosGetRadio() - 9;
    if (v3 > 8)
      v4 = 1;
    else
      v4 = dword_24B9FDC84[v3];
    dword_2544DAD4C = v4;
    __cxa_guard_release(&qword_2544DB0A8);
  }
  return dword_2544DAD4C;
}

void sub_24B9E5AE4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB0A8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getAPDPType(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB0B0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB0B0))
  {
    v3 = TelephonyRadiosGetRadio() - 9;
    if (v3 > 8)
      v4 = 1;
    else
      v4 = dword_24B9FDC84[v3];
    dword_2544DAD50 = v4;
    __cxa_guard_release(&qword_2544DB0B0);
  }
  return dword_2544DAD50;
}

void sub_24B9E5B78(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB0B0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getDEVCFGType(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB0B8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB0B8))
  {
    v3 = TelephonyRadiosGetRadio() - 9;
    if (v3 > 8)
      v4 = 1;
    else
      v4 = dword_24B9FDC84[v3];
    dword_2544DAD54 = v4;
    __cxa_guard_release(&qword_2544DB0B8);
  }
  return dword_2544DAD54;
}

void sub_24B9E5C0C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB0B8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getSECType(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB0C0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB0C0))
  {
    v3 = TelephonyRadiosGetRadio() - 9;
    if (v3 > 8)
      v4 = 1;
    else
      v4 = dword_24B9FDC84[v3];
    dword_2544DAD58 = v4;
    __cxa_guard_release(&qword_2544DB0C0);
  }
  return dword_2544DAD58;
}

void sub_24B9E5CA0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB0C0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getHYPType(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB0C8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB0C8))
  {
    v3 = TelephonyRadiosGetRadio() - 9;
    if (v3 > 8)
      v4 = 1;
    else
      v4 = dword_24B9FDC84[v3];
    dword_2544DAD5C = v4;
    __cxa_guard_release(&qword_2544DB0C8);
  }
  return dword_2544DAD5C;
}

void sub_24B9E5D34(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB0C8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getAOPType(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB0D0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB0D0))
  {
    v3 = TelephonyRadiosGetRadio() - 9;
    if (v3 > 8)
      v4 = 1;
    else
      v4 = dword_24B9FDC84[v3];
    dword_2544DAD60 = v4;
    __cxa_guard_release(&qword_2544DB0D0);
  }
  return dword_2544DAD60;
}

void sub_24B9E5DC8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB0D0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getOEMMiscType(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB0D8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB0D8))
  {
    v3 = TelephonyRadiosGetRadio() - 9;
    if (v3 > 8)
      v4 = 1;
    else
      v4 = dword_24B9FDC84[v3];
    dword_2544DAD64 = v4;
    __cxa_guard_release(&qword_2544DB0D8);
  }
  return dword_2544DAD64;
}

void sub_24B9E5E5C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB0D8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getQTIMiscType(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB0E0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB0E0))
  {
    v3 = TelephonyRadiosGetRadio() - 9;
    if (v3 > 8)
      v4 = 1;
    else
      v4 = dword_24B9FDC84[v3];
    dword_2544DAD68 = v4;
    __cxa_guard_release(&qword_2544DB0E0);
  }
  return dword_2544DAD68;
}

void sub_24B9E5EF0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB0E0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getXblCfgType(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB0E8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB0E8))
  {
    v3 = TelephonyRadiosGetRadio() - 10;
    if (v3 > 7)
      v4 = 1;
    else
      v4 = dword_24B9FDCA8[v3];
    dword_2544DAD6C = v4;
    __cxa_guard_release(&qword_2544DB0E8);
  }
  return dword_2544DAD6C;
}

void sub_24B9E5F84(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB0E8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::supportsXblCfgImage(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB0F0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB0F0))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DACBA = (Radio < 0x12) & (0x23C00u >> Radio);
    __cxa_guard_release(&qword_2544DB0F0);
  }
  return byte_2544DACBA;
}

void sub_24B9E6010(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB0F0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::supportsUEFIImage(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB0F8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB0F8))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DACBB = (Radio < 0x12) & (0x23000u >> Radio);
    __cxa_guard_release(&qword_2544DB0F8);
  }
  return byte_2544DACBB;
}

void sub_24B9E609C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB0F8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::supportsXblSupportImage(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB100);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB100))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DACBC = (Radio < 0x12) & (0x23000u >> Radio);
    __cxa_guard_release(&qword_2544DB100);
  }
  return byte_2544DACBC;
}

void sub_24B9E6128(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB100);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getUEFIType(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB108);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB108))
  {
    v3 = TelephonyRadiosGetRadio() - 12;
    if (v3 > 5)
      v4 = 1;
    else
      v4 = dword_24B9FDCC8[v3];
    dword_2544DAD70 = v4;
    __cxa_guard_release(&qword_2544DB108);
  }
  return dword_2544DAD70;
}

void sub_24B9E61BC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB108);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::getXblSupportType(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB110);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB110))
  {
    v3 = TelephonyRadiosGetRadio() - 12;
    if (v3 > 5)
      v4 = 1;
    else
      v4 = dword_24B9FDCC8[v3];
    dword_2544DAD74 = v4;
    __cxa_guard_release(&qword_2544DB110);
  }
  return dword_2544DAD74;
}

void sub_24B9E6250(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB110);
  _Unwind_Resume(a1);
}

uint64_t capabilities::updater::supportsMHIBootLogger(capabilities::updater *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB118);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB118))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DACBD = (Radio < 0x12) & (0x23000u >> Radio);
    __cxa_guard_release(&qword_2544DB118);
  }
  return byte_2544DACBD;
}

void sub_24B9E62DC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB118);
  _Unwind_Resume(a1);
}

_QWORD *capabilities::updater::asString@<X0>(unsigned int a1@<W0>, _QWORD *a2@<X8>)
{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = off_251CC8F08[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = off_251CC8F20[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 3)
    v2 = "???";
  else
    v2 = off_251CC8F38[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 3)
    v2 = "???";
  else
    v2 = off_251CC8F58[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 3)
    v2 = "???";
  else
    v2 = off_251CC90A8[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = off_251CC8F78[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = off_251CC8F90[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 4)
    v2 = "???";
  else
    v2 = off_251CC8FA8[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 4)
    v2 = "???";
  else
    v2 = off_251CC8FD0[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 3)
    v2 = "???";
  else
    v2 = off_251CC8FF8[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = off_251CC9018[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = off_251CC9030[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = off_251CC9048[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 5)
    v2 = "???";
  else
    v2 = off_251CC9060[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = off_251CC9090[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 3)
    v2 = "???";
  else
    v2 = off_251CC90A8[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

_QWORD *capabilities::updater::asString@<X0>(int a1@<W0>, _QWORD *a2@<X8>)
{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav10_SBL1";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav10_RPM";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav10_APPS";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav10_DSP3";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav10_MBA";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav10_QDSP6SW";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav10_TZ";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav10_WDT";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav10_ACDB";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav10_EFS1";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav10_EFS2";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav10_EFS3";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav10_CAL";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav10_PROV";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav10_PAC";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav10_ACT";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav10_BBCFG";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav20_MDMDDR";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav20_APDP";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav20_DEVCFG";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav20_SEC";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav20_HYP";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav20_AOP";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav20_OEMMisc";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav20_QTIMisc";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav21_XblCfg";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav22_UEFI";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kInvalid";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kEURMav22_XblSupport";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

uint64_t __cxx_global_var_init_0()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ctu::Gestalt>::~PthreadMutexGuardPolicy, &ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance, &dword_24B9DC000);
  }
  return result;
}

uint64_t capabilities::abs::wakeReasonDebugEnabled(capabilities::abs *this)
{
  capabilities::absinternal::wakeReasonDebugEnabled(this);
  if ((TelephonyUtilIsInternalBuild() & 1) == 0)
    TelephonyUtilIsCarrierBuild();
  return 0;
}

uint64_t capabilities::abs::shouldIgnoreResets(capabilities::abs *this)
{
  return 0;
}

uint64_t capabilities::abs::getCPMSVariant(capabilities::abs *this)
{
  _BOOL8 v1;
  const char *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (qword_2544DB170 != -1)
    dispatch_once(&qword_2544DB170, &__block_literal_global);
  v1 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (_MergedGlobals_2)
      v2 = "true";
    else
      v2 = "false";
    v4 = 136315138;
    v5 = v2;
    _os_log_impl(&dword_24B9DC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Kernel CPMS Supported: %s", (uint8_t *)&v4, 0xCu);
  }
  if (_MergedGlobals_2)
    return 2;
  else
    return capabilities::txpower::userSpaceCPMSVariant((capabilities::txpower *)v1);
}

void ___ZL19_supportsKernelCPMSv_block_invoke()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  io_service_t MatchingService;
  io_object_t v3;
  const __CFData *CFProperty;
  const __CFData *v5;
  CFTypeID v6;
  CFIndex Length;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  const char *v11;
  uint32_t v12;
  CFIndex v13;
  UInt8 buffer[4];
  uint8_t buf[4];
  const char *CStringPtr;
  __int16 v17;
  CFIndex v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;
  CFRange v22;

  v21 = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDD8B18];
  v1 = IOServiceNameMatching("baseband");
  MatchingService = IOServiceGetMatchingService(v0, v1);
  if (!MatchingService)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136315138;
    CStringPtr = "baseband";
    v8 = MEMORY[0x24BDACB70];
    v9 = "Failed to get %s service\n";
LABEL_10:
    _os_log_impl(&dword_24B9DC000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
    return;
  }
  v3 = MatchingService;
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("supports-cpms-via-spmi"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (!CFProperty)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136315138;
    CStringPtr = CFStringGetCStringPtr(CFSTR("supports-cpms-via-spmi"), 0);
    v8 = MEMORY[0x24BDACB70];
    v9 = "Failed to get property of %s\n";
    goto LABEL_10;
  }
  v5 = CFProperty;
  v6 = CFGetTypeID(CFProperty);
  if (v6 != CFDataGetTypeID())
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 136315138;
    CStringPtr = CFStringGetCStringPtr(CFSTR("supports-cpms-via-spmi"), 0);
    v10 = MEMORY[0x24BDACB70];
    v11 = "Property (%s) is not data type\n";
    v12 = 12;
LABEL_15:
    _os_log_impl(&dword_24B9DC000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, v12);
    goto LABEL_16;
  }
  *(_DWORD *)buffer = 0;
  Length = CFDataGetLength(v5);
  if (Length <= 3)
  {
    v13 = Length;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 136315650;
    CStringPtr = CFStringGetCStringPtr(CFSTR("supports-cpms-via-spmi"), 0);
    v17 = 2048;
    v18 = v13;
    v19 = 2048;
    v20 = 4;
    v10 = MEMORY[0x24BDACB70];
    v11 = "%s: Returned data length %ld is less than %ld needed\n";
    v12 = 32;
    goto LABEL_15;
  }
  v22.location = 0;
  v22.length = 4;
  CFDataGetBytes(v5, v22, buffer);
  _MergedGlobals_2 = *(_DWORD *)buffer != 0;
LABEL_16:
  CFRelease(v5);
  IOObjectRelease(v3);
}

uint64_t capabilities::updaterinternal::dynamicICENVMFSizeBytes(capabilities::updaterinternal *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  if ((v1 & 1) == 0
  {
    v3 = TelephonyRadiosGetRadio() - 4;
    if (v3 > 4)
      v4 = 0;
    else
      v4 = qword_24B9FDCF0[v3];
    capabilities::updaterinternal::dynamicICENVMFSizeBytes(void)::ret = v4;
  }
  return capabilities::updaterinternal::dynamicICENVMFSizeBytes(void)::ret;
}

void sub_24B9E6F40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t capabilities::updaterinternal::requiresMRCTraining(capabilities::updaterinternal *this)
{
  unsigned __int8 v1;

  if ((v1 & 1) == 0
  {
    capabilities::updaterinternal::requiresMRCTraining(void)::ret = TelephonyRadiosGetRadio() - 7 < 2;
  }
  return capabilities::updaterinternal::requiresMRCTraining(void)::ret;
}

void sub_24B9E6FBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t capabilities::updaterinternal::supportsAudioOverPCIe(capabilities::updaterinternal *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  if ((v1 & 1) == 0
  {
    Radio = TelephonyRadiosGetRadio();
    capabilities::updaterinternal::supportsAudioOverPCIe(void)::ret = (Radio < 0x12) & (0x23C00u >> Radio);
  }
  return capabilities::updaterinternal::supportsAudioOverPCIe(void)::ret;
}

void sub_24B9E7044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t capabilities::updaterinternal::shouldAllowUnfused(capabilities::updaterinternal *this)
{
  unsigned __int8 v1;
  int Product;

  if ((v1 & 1) == 0
  {
    Product = TelephonyRadiosGetProduct();
    capabilities::updaterinternal::shouldAllowUnfused(void)::ret = ((Product - 158) < 0x37) & (0x41C00000000003uLL >> (Product + 98));
  }
  return capabilities::updaterinternal::shouldAllowUnfused(void)::ret;
}

void sub_24B9E70D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t capabilities::euicc::supportsVinylRestore(capabilities::euicc *this)
{
  unsigned __int8 v1;
  capabilities::euicc *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB180);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::euicc *)__cxa_guard_acquire(&qword_2544DB180);
    if ((_DWORD)v3)
    {
      _MergedGlobals_3 = capabilities::euicc::sSupportsVinylRestore(v3);
      __cxa_guard_release(&qword_2544DB180);
    }
  }
  return _MergedGlobals_3;
}

void sub_24B9E7144(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB180);
  _Unwind_Resume(a1);
}

uint64_t capabilities::euicc::sSupportsVinylRestore(capabilities::euicc *this)
{
  uint64_t v1;
  int Product;

  v1 = 0;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 0:
    case 52:
    case 53:
    case 60:
    case 61:
    case 73:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 127:
    case 128:
    case 136:
    case 203:
      return v1;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 85:
    case 86:
    case 98:
    case 113:
    case 121:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 200:
    case 201:
    case 202:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 209:
    case 210:
    case 211:
    case 212:
      goto LABEL_2;
    default:
      if ((Product - 0x8000) >= 3)
LABEL_2:
        v1 = 1;
      break;
  }
  return v1;
}

uint64_t capabilities::euicc::supportsGenericUpdater(capabilities::euicc *this)
{
  unsigned __int8 v1;
  capabilities::euicc *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB188);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::euicc *)__cxa_guard_acquire(&qword_2544DB188);
    if ((_DWORD)v3)
    {
      byte_2544DB179 = capabilities::euicc::sSupportsGenericUpdater(v3);
      __cxa_guard_release(&qword_2544DB188);
    }
  }
  return byte_2544DB179;
}

void sub_24B9E7214(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB188);
  _Unwind_Resume(a1);
}

uint64_t capabilities::euicc::sSupportsGenericUpdater(capabilities::euicc *this)
{
  uint64_t v1;
  int Product;

  v1 = 0;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 0:
    case 33:
    case 38:
    case 52:
    case 53:
    case 57:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 73:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 157:
    case 158:
    case 159:
    case 200:
    case 201:
    case 202:
    case 203:
    case 204:
    case 205:
    case 206:
    case 209:
    case 212:
      return v1;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 34:
    case 35:
    case 36:
    case 37:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 54:
    case 55:
    case 56:
    case 58:
    case 59:
    case 69:
    case 70:
    case 71:
    case 72:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 85:
    case 86:
    case 98:
    case 113:
    case 121:
    case 155:
    case 156:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 207:
    case 208:
    case 210:
    case 211:
      goto LABEL_4;
    default:
      if ((Product - 0x8000) >= 3)
LABEL_4:
        v1 = 1;
      break;
  }
  return v1;
}

uint64_t capabilities::euicc::supportsLegacyUpdater(capabilities::euicc *this)
{
  unsigned __int8 v1;
  capabilities::euicc *v3;

  if ((v1 & 1) == 0)
  {
    if ((_DWORD)v3)
    {
      capabilities::euicc::supportsLegacyUpdater(void)::ret = capabilities::euicc::sSupportsLegacyUpdater(v3);
    }
  }
  return capabilities::euicc::supportsLegacyUpdater(void)::ret;
}

void sub_24B9E72E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t capabilities::euicc::sSupportsLegacyUpdater(capabilities::euicc *this)
{
  uint64_t v1;
  capabilities::euicc *Product;

  v1 = 0;
  Product = (capabilities::euicc *)TelephonyRadiosGetProduct();
  switch((int)Product)
  {
    case 33:
    case 38:
    case 52:
    case 53:
    case 57:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 157:
    case 158:
    case 159:
    case 200:
    case 203:
    case 207:
    case 208:
    case 209:
    case 211:
    case 212:
      v1 = capabilities::euicc::supportsEOS(Product) ^ 1;
      break;
    default:
      return v1;
  }
  return v1;
}

uint64_t capabilities::euicc::supportsInstallReplace(capabilities::euicc *this)
{
  unsigned __int8 v1;
  unint64_t v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB190);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB190))
  {
    HIDWORD(v3) = TelephonyRadiosGetRadio() - 1;
    LODWORD(v3) = HIDWORD(v3);
    byte_2544DB17A = ((v3 >> 2) < 5) & (0x1Bu >> (v3 >> 2));
    __cxa_guard_release(&qword_2544DB190);
  }
  return byte_2544DB17A;
}

void sub_24B9E73BC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB190);
  _Unwind_Resume(a1);
}

uint64_t capabilities::euicc::shouldEnableEUICCDetectPullDown(capabilities::euicc *this)
{
  unsigned __int8 v1;
  capabilities::euicc *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB198);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::euicc *)__cxa_guard_acquire(&qword_2544DB198);
    if ((_DWORD)v3)
    {
      byte_2544DB17B = capabilities::euicc::sShouldEnableEUICCDetectPullDown(v3);
      __cxa_guard_release(&qword_2544DB198);
    }
  }
  return byte_2544DB17B;
}

void sub_24B9E7430(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB198);
  _Unwind_Resume(a1);
}

uint64_t capabilities::euicc::sShouldEnableEUICCDetectPullDown(capabilities::euicc *this)
{
  capabilities::euicc *RadioVendor;

  RadioVendor = (capabilities::euicc *)TelephonyRadiosGetRadioVendor();
  if (((_DWORD)RadioVendor - 1) > 3)
    return 1;
  else
    return capabilities::euicc::supportsEOS(RadioVendor) ^ 1;
}

uint64_t capabilities::euicc::supportsEOS(capabilities::euicc *this)
{
  unsigned __int8 v1;
  capabilities::euicc *v3;

  if ((v1 & 1) == 0)
  {
    if ((_DWORD)v3)
    {
      capabilities::euicc::supportsEOS(void)::ret = capabilities::euicc::sSupportsEOS(v3);
    }
  }
  return capabilities::euicc::supportsEOS(void)::ret;
}

void sub_24B9E74D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t capabilities::euicc::sSupportsEOS(capabilities::euicc *this)
{
  int Product;
  uint64_t v2;
  ctu::Gestalt *v3;
  void *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  __int128 v14;

  Product = TelephonyRadiosGetProduct();
  if ((Product - 129) > 0x1B)
  {
LABEL_19:
    if (Product != 211 && Product != 209)
      return 0;
    goto LABEL_3;
  }
  v2 = 1;
  if (((1 << (Product + 127)) & 0x7001C07) == 0)
  {
    if (Product == 156)
      return v2;
    goto LABEL_19;
  }
LABEL_3:
  v3 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  v4 = off_2544DA7D8;
  if (!off_2544DA7D8)
  {
    ctu::Gestalt::create_default_global(v3);
    std::shared_ptr<ctu::Gestalt>::operator=[abi:ne180100]((uint64_t)&off_2544DA7D8, &v14);
    v5 = (std::__shared_weak_count *)*((_QWORD *)&v14 + 1);
    if (*((_QWORD *)&v14 + 1))
    {
      v6 = (unint64_t *)(*((_QWORD *)&v14 + 1) + 8);
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 - 1, v6));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    v4 = off_2544DA7D8;
  }
  v8 = (std::__shared_weak_count *)off_2544DA7E0;
  if (off_2544DA7E0)
  {
    v9 = (unint64_t *)((char *)off_2544DA7E0 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  v2 = (*(uint64_t (**)(void *))(*(_QWORD *)v4 + 120))(v4);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  return v2;
}

void sub_24B9E763C(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  _Unwind_Resume(a1);
}

uint64_t __cxx_global_var_init_1()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ctu::Gestalt>::~PthreadMutexGuardPolicy, &ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance, &dword_24B9DC000);
  }
  return result;
}

uint64_t capabilities::coredump::coredumpInterface(capabilities::coredump *this)
{
  unsigned __int8 v1;
  capabilities::coredump *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB1B0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::coredump *)__cxa_guard_acquire(&qword_2544DB1B0);
    if ((_DWORD)v3)
    {
      dword_2544DB1A4 = capabilities::coredump::sCoredumpInterface(v3);
      __cxa_guard_release(&qword_2544DB1B0);
    }
  }
  return dword_2544DB1A4;
}

void sub_24B9E76FC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB1B0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::coredump::sCoredumpInterface(capabilities::coredump *this)
{
  capabilities::diag *Radio;

  capabilities::diag::interfaceAfterBoot(this);
  Radio = (capabilities::diag *)TelephonyRadiosGetRadio();
  if (((_DWORD)Radio - 1) < 0x11 && ((0x17FD7u >> ((_BYTE)Radio - 1)) & 1) != 0)
    return 8;
  else
    return capabilities::diag::interfaceAfterBoot(Radio);
}

uint64_t capabilities::coredump::captureTime(capabilities::coredump *this)
{
  unsigned __int8 v1;
  capabilities::coredump *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB1C0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::coredump *)__cxa_guard_acquire(&qword_2544DB1C0);
    if ((_DWORD)v3)
    {
      qword_2544DB1B8 = capabilities::coredump::sCaptureTime(v3);
      __cxa_guard_release(&qword_2544DB1C0);
    }
  }
  return qword_2544DB1B8;
}

void sub_24B9E77B0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB1C0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::coredump::sCaptureTime(capabilities::coredump *this)
{
  unsigned int v1;

  v1 = TelephonyRadiosGetRadioVendor() - 1;
  if (v1 > 3)
    return 240000;
  else
    return qword_24B9FDF78[v1];
}

uint64_t capabilities::coredump::getPersonality(capabilities::coredump *this)
{
  unsigned __int8 v1;
  capabilities::coredump *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB1C8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::coredump *)__cxa_guard_acquire(&qword_2544DB1C8);
    if ((_DWORD)v3)
    {
      dword_2544DB1A8 = capabilities::coredump::sGetPersonality(v3);
      __cxa_guard_release(&qword_2544DB1C8);
    }
  }
  return dword_2544DB1A8;
}

void sub_24B9E785C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB1C8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::coredump::sGetPersonality(capabilities::coredump *this)
{
  unsigned int v1;

  v1 = TelephonyRadiosGetRadioVendor() - 1;
  if (v1 > 3)
    return 0;
  else
    return dword_24B9FE2B0[v1];
}

uint64_t capabilities::coredump::recoveryForControlMessageTimeout(capabilities::coredump *this)
{
  unsigned __int8 v1;
  capabilities::coredump *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB1D0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::coredump *)__cxa_guard_acquire(&qword_2544DB1D0);
    if ((_DWORD)v3)
    {
      dword_2544DB1AC = capabilities::coredump::sRecoveryForControlMessageTimeout(v3);
      __cxa_guard_release(&qword_2544DB1D0);
    }
  }
  return dword_2544DB1AC;
}

void sub_24B9E7904(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB1D0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::coredump::sRecoveryForControlMessageTimeout(capabilities::coredump *this)
{
  unsigned int v1;

  v1 = TelephonyRadiosGetProduct() - 33;
  if (v1 > 0xB3)
    return 0;
  else
    return dword_24B9FDF98[v1];
}

uint64_t capabilities::coredump::commandTimeout(capabilities::coredump *this)
{
  unsigned __int8 v1;
  int RadioVendor;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB1E0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB1E0))
  {
    RadioVendor = TelephonyRadiosGetRadioVendor();
    v4 = 10000;
    if ((RadioVendor - 1) >= 4)
      v4 = 0;
    qword_2544DB1D8 = v4;
    __cxa_guard_release(&qword_2544DB1E0);
  }
  return qword_2544DB1D8;
}

void sub_24B9E79B8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB1E0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::coredump::supportsGPIOSignalling(capabilities::coredump *this)
{
  unsigned __int8 v1;
  capabilities::coredump *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB1E8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::coredump *)__cxa_guard_acquire(&qword_2544DB1E8);
    if ((_DWORD)v3)
    {
      _MergedGlobals_4 = capabilities::coredump::sSupportsGPIOSignalling(v3);
      __cxa_guard_release(&qword_2544DB1E8);
    }
  }
  return _MergedGlobals_4;
}

void sub_24B9E7A2C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB1E8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::coredump::sSupportsGPIOSignalling(capabilities::coredump *this)
{
  unsigned int RadioVendor;

  RadioVendor = TelephonyRadiosGetRadioVendor();
  return (RadioVendor < 5) & (0x16u >> RadioVendor);
}

uint64_t capabilities::coredump::coredumpAttemptCount(capabilities::coredump *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB1F8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB1F8))
  {
    v3 = TelephonyRadiosGetRadio() - 9;
    if (v3 > 8)
      v4 = 2;
    else
      v4 = qword_24B9FE268[v3];
    qword_2544DB1F0 = v4;
    __cxa_guard_release(&qword_2544DB1F8);
  }
  return qword_2544DB1F0;
}

void sub_24B9E7AE4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB1F8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::coredump::supportsSPMISignalling(capabilities::coredump *this)
{
  unsigned __int8 v1;
  int Product;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB200);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB200))
  {
    Product = TelephonyRadiosGetProduct();
    byte_2544DB1A1 = ((Product - 156) < 0x35) & (0x18700000000001uLL >> (Product + 100));
    __cxa_guard_release(&qword_2544DB200);
  }
  return byte_2544DB1A1;
}

void sub_24B9E7B74(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB200);
  _Unwind_Resume(a1);
}

uint64_t capabilities::coredump::operator&(unsigned int a1, int a2)
{
  return a2 & a1;
}

_DWORD *capabilities::coredump::operator&=(_DWORD *result, int a2)
{
  *result &= a2;
  return result;
}

uint64_t capabilities::coredump::operator|(unsigned int a1, int a2)
{
  return a2 | a1;
}

_DWORD *capabilities::coredump::operator|=(_DWORD *result, int a2)
{
  *result |= a2;
  return result;
}

uint64_t capabilities::coredump::operator^(unsigned int a1, int a2)
{
  return a2 ^ a1;
}

_DWORD *capabilities::coredump::operator^=(_DWORD *result, int a2)
{
  *result ^= a2;
  return result;
}

uint64_t capabilities::coredump::operator~(int a1)
{
  return ~a1;
}

void capabilities::coredump::asString(int a1@<W0>, uint64_t a2@<X8>)
{
  std::vector<std::string>::pointer end;
  __int128 v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  std::string *v9;
  std::string *v10;
  __int128 v11;
  std::string *v12;
  std::vector<std::string>::pointer v13;
  __int128 v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  std::string *v18;
  std::string *v19;
  __int128 v20;
  std::string *v21;
  void *__p[2];
  std::string::size_type v23;
  std::vector<std::string> v24;
  void *v25[3];
  std::__split_buffer<std::string> __v;

  memset(v25, 170, sizeof(v25));
  std::string::basic_string[abi:ne180100]<0>(v25, "???");
  memset(&v24, 0, sizeof(v24));
  if (!a1)
  {
    std::string::basic_string[abi:ne180100]<0>((_QWORD *)a2, "kNone");
    goto LABEL_37;
  }
  if ((a1 & 1) == 0)
    goto LABEL_17;
  std::string::basic_string[abi:ne180100]<0>(__p, "kResetModem");
  end = v24.__end_;
  if (v24.__end_ < v24.__end_cap_.__value_)
  {
    v5 = *(_OWORD *)__p;
    v24.__end_->__r_.__value_.__r.__words[2] = v23;
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v5;
    v24.__end_ = end + 1;
    if ((a1 & 2) == 0)
      goto LABEL_32;
LABEL_18:
    std::string::basic_string[abi:ne180100]<0>(__p, "kTailspin");
    v13 = v24.__end_;
    if (v24.__end_ >= v24.__end_cap_.__value_)
    {
      v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)v24.__end_ - (char *)v24.__begin_) >> 3);
      v16 = v15 + 1;
      if (v15 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      if (0x5555555555555556 * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3) > v16)
        v16 = 0x5555555555555556 * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3) >= 0x555555555555555)
        v17 = 0xAAAAAAAAAAAAAAALL;
      else
        v17 = v16;
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v24.__end_cap_;
      if (v17)
        v18 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v24.__end_cap_, v17);
      else
        v18 = 0;
      v19 = v18 + v15;
      __v.__first_ = v18;
      __v.__begin_ = v19;
      __v.__end_cap_.__value_ = &v18[v17];
      v20 = *(_OWORD *)__p;
      v19->__r_.__value_.__r.__words[2] = v23;
      *(_OWORD *)&v19->__r_.__value_.__l.__data_ = v20;
      __p[1] = 0;
      v23 = 0;
      __p[0] = 0;
      __v.__end_ = v19 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v24, &__v);
      v21 = v24.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v24.__end_ = v21;
      if (SHIBYTE(v23) < 0)
        operator delete(__p[0]);
    }
    else
    {
      v14 = *(_OWORD *)__p;
      v24.__end_->__r_.__value_.__r.__words[2] = v23;
      *(_OWORD *)&v13->__r_.__value_.__l.__data_ = v14;
      v24.__end_ = v13 + 1;
    }
    goto LABEL_32;
  }
  v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)v24.__end_ - (char *)v24.__begin_) >> 3);
  v7 = v6 + 1;
  if (v6 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  if (0x5555555555555556 * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3) > v7)
    v7 = 0x5555555555555556 * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3);
  v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3) >= 0x555555555555555
     ? 0xAAAAAAAAAAAAAAALL
     : v7;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v24.__end_cap_;
  v9 = v8
     ? (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v24.__end_cap_, v8)
     : 0;
  v10 = v9 + v6;
  __v.__first_ = v9;
  __v.__begin_ = v10;
  __v.__end_cap_.__value_ = &v9[v8];
  v11 = *(_OWORD *)__p;
  v10->__r_.__value_.__r.__words[2] = v23;
  *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
  __p[1] = 0;
  v23 = 0;
  __p[0] = 0;
  __v.__end_ = v10 + 1;
  std::vector<std::string>::__swap_out_circular_buffer(&v24, &__v);
  v12 = v24.__end_;
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  v24.__end_ = v12;
  if (SHIBYTE(v23) < 0)
  {
    operator delete(__p[0]);
    if ((a1 & 2) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_17:
    if ((a1 & 2) != 0)
      goto LABEL_18;
  }
LABEL_32:
  if (v24.__end_ != v24.__begin_)
  {
    ctu::join<std::__wrap_iter<std::string *>>(v24.__begin_, v24.__end_, " | ", 3uLL, (std::string *)&__v);
    if (SHIBYTE(v25[2]) < 0)
      operator delete(v25[0]);
    *(_OWORD *)v25 = *(_OWORD *)&__v.__first_;
    v25[2] = __v.__end_;
  }
  *(_OWORD *)a2 = *(_OWORD *)v25;
  *(void **)(a2 + 16) = v25[2];
  memset(v25, 0, sizeof(v25));
LABEL_37:
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v24;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  if (SHIBYTE(v25[2]) < 0)
    operator delete(v25[0]);
}

void sub_24B9E7EFC(_Unwind_Exception *__p, uint64_t a2, int a3, __int16 a4, char a5, char a6, char a7, uint64_t a8, int *__pa, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, std::__split_buffer<std::string> *a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a24);
  if (SHIBYTE(a11) < 0)
    operator delete(__pa);
  __pa = &a12;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  if (a23 < 0)
    operator delete(a18);
  _Unwind_Resume(__p);
}

uint64_t capabilities::txpower::timeoutConfig(capabilities::txpower *this)
{
  uint8_t v2[16];

  if (TelephonyRadiosGetRadio())
    return 0xBB800000BB8;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl(&dword_24B9DC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "unknown radio type detected", v2, 2u);
  }
  __TUAssertTrigger();
  return 0;
}

BOOL capabilities::txpower::maxPowerConfig(__n128 *a1)
{
  if (a1)
    _getUnsupported(a1);
  return a1 != 0;
}

__n128 _getUnsupported(__n128 *a1)
{
  __n128 result;

  result.n128_u64[0] = 0x7F0000007FLL;
  result.n128_u64[1] = 0x7F0000007FLL;
  *a1 = result;
  a1[1] = result;
  a1[2] = result;
  a1[3] = result;
  a1[4] = result;
  a1[5] = result;
  a1[6] = result;
  a1[7] = result;
  a1[8] = result;
  a1[9] = result;
  a1[10] = result;
  a1[11] = result;
  a1[12] = result;
  a1[13].n128_u64[0] = 0x7F0000007FLL;
  return result;
}

BOOL capabilities::txpower::proxPowerConfig(__n128 *a1)
{
  if (a1)
    _getUnsupported(a1);
  return a1 != 0;
}

double capabilities::txpower::unsupportedPowerConfig(__n128 *a1)
{
  double result;

  if (a1)
    *(_QWORD *)&result = _getUnsupported(a1).n128_u64[0];
  return result;
}

uint64_t capabilities::txpower::asString@<X0>(_BYTE *a1@<X8>)
{
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  std::ios_base *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  size_t v19;
  uint64_t v20;
  const void **v21;
  const void *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  _QWORD v28[2];
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void *__p[2];
  __int128 v35;
  unint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;

  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v46 = v2;
  v36 = 0xAAAAAAAAAAAAAAAALL;
  v45 = v2;
  v44 = v2;
  v43 = v2;
  v42 = v2;
  v41 = v2;
  v40 = v2;
  v39 = v2;
  v38 = v2;
  v35 = v2;
  *(_OWORD *)__p = v2;
  v33 = v2;
  v32 = v2;
  v31 = v2;
  v30 = v2;
  v3 = MEMORY[0x24BEDB858];
  v4 = MEMORY[0x24BEDB858] + 104;
  v37 = MEMORY[0x24BEDB858] + 104;
  v5 = (_QWORD *)MEMORY[0x24BEDB7F0];
  v6 = MEMORY[0x24BEDB858] + 64;
  v7 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 16);
  v8 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 24);
  v29 = MEMORY[0x24BEDB858] + 64;
  v28[0] = v7;
  *(_QWORD *)((char *)v28 + *(_QWORD *)(v7 - 24)) = v8;
  v28[1] = 0;
  v9 = (std::ios_base *)((char *)v28 + *(_QWORD *)(v28[0] - 24));
  std::ios_base::init(v9, &v30);
  v9[1].__vftable = 0;
  v9[1].__fmtflags_ = -1;
  v10 = v5[5];
  v29 = v5[4];
  *(uint64_t *)((char *)&v29 + *(_QWORD *)(v29 - 24)) = v10;
  v28[0] = v5[1];
  *(_QWORD *)((char *)v28 + *(_QWORD *)(v28[0] - 24)) = v5[6];
  v37 = v4;
  v28[0] = v3 + 24;
  v29 = v6;
  std::streambuf::basic_streambuf();
  v11 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v30 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v35 = 0u;
  LODWORD(v36) = 24;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v29, (uint64_t)"t1Timeout = ", 12);
  v12 = (_QWORD *)std::ostream::operator<<();
  v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" ms, ", 5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"resetTimeout = ", 15);
  v14 = (_QWORD *)std::ostream::operator<<();
  v15 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)" ms, ", 5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"txCapDuration = ", 16);
  v16 = (_QWORD *)std::ostream::operator<<();
  v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)" ms, ", 5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)"txNoCapDuration = ", 18);
  v18 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)" ms", 3);
  if ((v36 & 0x10) != 0)
  {
    v20 = *((_QWORD *)&v35 + 1);
    if (*((_QWORD *)&v35 + 1) < (unint64_t)v33)
    {
      *((_QWORD *)&v35 + 1) = v33;
      v20 = v33;
    }
    v21 = (const void **)&v32 + 1;
  }
  else
  {
    if ((v36 & 8) == 0)
    {
      v19 = 0;
      a1[23] = 0;
      goto LABEL_16;
    }
    v21 = (const void **)&v31;
    v20 = v32;
  }
  v22 = *v21;
  v19 = v20 - (_QWORD)*v21;
  if (v19 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v19 >= 0x17)
  {
    v23 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v19 | 7) != 0x17)
      v23 = v19 | 7;
    v24 = v23 + 1;
    v25 = operator new(v23 + 1);
    *((_QWORD *)a1 + 1) = v19;
    *((_QWORD *)a1 + 2) = v24 | 0x8000000000000000;
    *(_QWORD *)a1 = v25;
    a1 = v25;
    goto LABEL_15;
  }
  a1[23] = v19;
  if (v19)
LABEL_15:
    memmove(a1, v22, v19);
LABEL_16:
  a1[v19] = 0;
  v28[0] = *v5;
  v26 = v5[9];
  *(_QWORD *)((char *)v28 + *(_QWORD *)(v28[0] - 24)) = v5[8];
  v29 = v26;
  *(_QWORD *)&v30 = v11 + 16;
  if (SBYTE7(v35) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x24BD2B800](&v37);
}

void sub_24B9E8394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  std::iostream::~basic_iostream();
  MEMORY[0x24BD2B800](a10);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = MEMORY[0x24BEDB7F0];
  v3 = *MEMORY[0x24BEDB7F0];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB7F0];
  v4 = *(_QWORD *)(v2 + 72);
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_QWORD *)(a1 + 16) = v4;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x24BD2B800](a1 + 128);
  return a1;
}

BOOL capabilities::txpower::operator<(_DWORD *a1, _DWORD *a2)
{
  return *a1 < *a2 || a1[1] < a2[1] || a1[2] < a2[2] || a1[3] < a2[3];
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  char *v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  size_t v16;
  std::locale::__imp *v17;
  uint64_t v18;
  uint64_t v19;
  std::locale *v20;
  uint64_t v21;
  _QWORD v23[2];
  std::locale __b[3];

  v23[0] = 0xAAAAAAAAAAAAAAAALL;
  v23[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x24BD2B77C](v23, a1);
  if (LOBYTE(v23[0]))
  {
    v6 = (char *)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *((_QWORD *)v6 + 5);
    v8 = *((_DWORD *)v6 + 2);
    v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(__b, MEMORY[0x24BEDB350]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(__b);
      *((_DWORD *)v6 + 36) = v9;
    }
    v11 = a2 + a3;
    if ((v8 & 0xB0) == 0x20)
      v12 = a2 + a3;
    else
      v12 = a2;
    if (!v7)
      goto LABEL_29;
    v13 = *((_QWORD *)v6 + 3);
    v14 = v13 <= a3;
    v15 = v13 - a3;
    v16 = v14 ? 0 : v15;
    if (v12 - a2 >= 1
      && (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 96))(v7, a2, v12 - a2) != v12 - a2)
    {
      goto LABEL_29;
    }
    if ((uint64_t)v16 >= 1)
    {
      memset(__b, 170, sizeof(__b));
      if (v16 >= 0x7FFFFFFFFFFFFFF8)
        std::string::__throw_length_error[abi:ne180100]();
      if (v16 >= 0x17)
      {
        v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v16 | 7) != 0x17)
          v18 = v16 | 7;
        v19 = v18 + 1;
        v17 = (std::locale::__imp *)operator new(v18 + 1);
        __b[1].__locale_ = (std::locale::__imp *)v16;
        __b[2].__locale_ = (std::locale::__imp *)(v19 | 0x8000000000000000);
        __b[0].__locale_ = v17;
      }
      else
      {
        HIBYTE(__b[2].__locale_) = v16;
        v17 = (std::locale::__imp *)__b;
      }
      memset(v17, v9, v16);
      *((_BYTE *)v17 + v16) = 0;
      v20 = SHIBYTE(__b[2].__locale_) >= 0 ? __b : (std::locale *)__b[0].__locale_;
      v21 = (*(uint64_t (**)(uint64_t, std::locale *, size_t))(*(_QWORD *)v7 + 96))(v7, v20, v16);
      if (SHIBYTE(__b[2].__locale_) < 0)
        operator delete(__b[0].__locale_);
      if (v21 != v16)
        goto LABEL_29;
    }
    if (v11 - v12 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 96))(v7, v12, v11 - v12) == v11 - v12)
    {
      *((_QWORD *)v6 + 3) = 0;
    }
    else
    {
LABEL_29:
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x24BD2B788](v23);
  return a1;
}

void sub_24B9E86D8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  _QWORD *v17;

  if (a17 < 0)
    operator delete(__p);
  MEMORY[0x24BD2B788](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(_QWORD *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x24B9E86A8);
}

void sub_24B9E8738(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::getRadioModuleType(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB308);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB308);
    if ((_DWORD)v3)
    {
      dword_2544DB2B0 = capabilities::ct::sGetRadioModuleType(v3);
      __cxa_guard_release(&qword_2544DB308);
    }
  }
  return dword_2544DB2B0;
}

void sub_24B9E87A8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB308);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sGetRadioModuleType(capabilities::ct *this)
{
  int v1;
  uint64_t result;

  v1 = TelephonyRadiosGetProduct() - 33;
  result = 0;
  switch(v1)
  {
    case 0:
    case 5:
    case 19:
    case 20:
    case 24:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 40:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 167:
    case 169:
    case 170:
    case 174:
    case 175:
    case 176:
    case 178:
    case 179:
      result = 2;
      break;
    case 1:
    case 2:
    case 3:
    case 4:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 21:
    case 22:
    case 23:
    case 25:
    case 26:
    case 36:
    case 37:
    case 38:
    case 39:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 52:
    case 53:
    case 65:
    case 80:
    case 88:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 168:
    case 171:
    case 172:
    case 173:
    case 177:
      return result;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::ct::supportsP2P(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;
  capabilities::ct *v4;
  char v5;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB310);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB310);
    if ((_DWORD)v3)
    {
      v4 = (capabilities::ct *)capabilities::ct::supportsP2PAsPhone(v3);
      if ((v4 & 1) != 0)
        v5 = 1;
      else
        v5 = capabilities::ct::supportsP2PAsGizmo(v4);
      _MergedGlobals_5 = v5;
      __cxa_guard_release(&qword_2544DB310);
    }
  }
  return _MergedGlobals_5;
}

void sub_24B9E8880(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB310);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::LASDLocationTimeout(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB320);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB320))
  {
    qword_2544DB318 = 20;
    __cxa_guard_release(&qword_2544DB320);
  }
  return qword_2544DB318;
}

uint64_t capabilities::ct::signalStrengthDisplayMaxValue(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB338);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB338))
  {
    qword_2544DB330 = 4;
    __cxa_guard_release(&qword_2544DB338);
  }
  return qword_2544DB330;
}

uint64_t capabilities::ct::supportsEMBMS(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB340);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB340))
  {
    byte_2544DB20A = 0;
    __cxa_guard_release(&qword_2544DB340);
  }
  return byte_2544DB20A;
}

uint64_t capabilities::ct::emulatedEMBMS(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB348);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB348))
  {
    byte_2544DB20B = 0;
    __cxa_guard_release(&qword_2544DB348);
  }
  return byte_2544DB20B;
}

uint64_t capabilities::ct::supportsVegaInEmergencyMode(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB350);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB350))
  {
    byte_2544DB20C = 0;
    __cxa_guard_release(&qword_2544DB350);
  }
  return byte_2544DB20C;
}

uint64_t capabilities::ct::supportsMultiphaseBundleSetup(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB358);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB358))
  {
    byte_2544DB20D = 0;
    __cxa_guard_release(&qword_2544DB358);
  }
  return byte_2544DB20D;
}

uint64_t capabilities::ct::supportsPhysicalSIMToESIMTransferFromLegacyDevice(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB360);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB360))
  {
    byte_2544DB20E = 0;
    __cxa_guard_release(&qword_2544DB360);
  }
  return byte_2544DB20E;
}

uint64_t capabilities::ct::supportsLASDGSMDatabase(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB368);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB368);
    if ((_DWORD)v3)
    {
      byte_2544DB20F = capabilities::ct::sSupportsLASDGSMDatabase(v3);
      __cxa_guard_release(&qword_2544DB368);
    }
  }
  return byte_2544DB20F;
}

void sub_24B9E8B24(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB368);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsLASDGSMDatabase(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 33:
    case 38:
    case 52:
    case 53:
    case 57:
    case 62:
    case 63:
    case 64:
    case 68:
    case 73:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 114:
    case 115:
    case 116:
    case 117:
    case 120:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 156:
    case 157:
    case 158:
    case 159:
    case 200:
    case 201:
    case 202:
    case 203:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 212:
      return v1;
    case 34:
    case 35:
    case 36:
    case 37:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 54:
    case 55:
    case 56:
    case 58:
    case 59:
    case 60:
    case 61:
    case 65:
    case 66:
    case 67:
    case 69:
    case 70:
    case 71:
    case 72:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 85:
    case 86:
    case 87:
    case 88:
    case 98:
    case 103:
    case 104:
    case 105:
    case 106:
    case 113:
    case 118:
    case 119:
    case 121:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 139:
    case 140:
    case 141:
    case 153:
    case 154:
    case 155:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 209:
    case 210:
    case 211:
      goto LABEL_4;
    default:
      if ((Product - 0x8000) >= 3)
LABEL_4:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsEmptyNITZIndication(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB370);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB370);
    if ((_DWORD)v3)
    {
      byte_2544DB210 = capabilities::ct::sSupportsEmptyNITZIndication(v3);
      __cxa_guard_release(&qword_2544DB370);
    }
  }
  return byte_2544DB210;
}

void sub_24B9E8BF4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB370);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsEmptyNITZIndication(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if (Product > 211)
  {
    if ((Product - 0x8000) >= 3 && Product != 212)
      return 0;
  }
  else
  {
    switch(Product)
    {
      case 52:
      case 53:
      case 57:
      case 62:
      case 63:
      case 64:
      case 68:
      case 73:
      case 99:
      case 100:
      case 101:
      case 102:
      case 108:
      case 109:
      case 110:
      case 111:
      case 114:
      case 115:
      case 116:
      case 117:
      case 120:
      case 123:
      case 124:
      case 125:
      case 126:
      case 132:
      case 133:
      case 134:
      case 135:
      case 136:
      case 137:
      case 138:
      case 142:
      case 143:
      case 144:
      case 145:
      case 146:
      case 147:
      case 148:
      case 149:
      case 150:
      case 151:
      case 152:
      case 157:
      case 158:
      case 159:
        return v1;
      case 54:
      case 55:
      case 56:
      case 58:
      case 59:
      case 60:
      case 61:
      case 65:
      case 66:
      case 67:
      case 69:
      case 70:
      case 71:
      case 72:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 112:
      case 113:
      case 118:
      case 119:
      case 121:
      case 122:
      case 127:
      case 128:
      case 129:
      case 130:
      case 131:
      case 139:
      case 140:
      case 141:
      case 153:
      case 154:
      case 155:
      case 156:
        return 0;
      default:
        if (Product != 33 && Product != 38)
          return 0;
        break;
    }
  }
  return v1;
}

uint64_t capabilities::ct::shouldRadioInitInAirplaneMode(capabilities::ct *this)
{
  unsigned __int8 v1;
  int RadioVendor;
  BOOL v5;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB378);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB378))
  {
    RadioVendor = TelephonyRadiosGetRadioVendor();
    v5 = RadioVendor == 1 || RadioVendor == 4;
    byte_2544DB211 = v5;
    __cxa_guard_release(&qword_2544DB378);
  }
  return byte_2544DB211;
}

void sub_24B9E8CF4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB378);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::shouldWaitForDeviceRegistrationWhenPlacingEmergencyCall(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB380);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB380))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB212 = (Radio < 0x12) & (0x33E3Eu >> Radio);
    __cxa_guard_release(&qword_2544DB380);
  }
  return byte_2544DB212;
}

void sub_24B9E8D80(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB380);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::shouldSetCellularTextModemForRTT(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB388);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB388);
    if ((_DWORD)v3)
    {
      byte_2544DB213 = capabilities::ct::sShouldSetCellularTextModemForRTT(v3);
      __cxa_guard_release(&qword_2544DB388);
    }
  }
  return byte_2544DB213;
}

void sub_24B9E8DF4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB388);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sShouldSetCellularTextModemForRTT(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 0;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 60:
    case 61:
    case 65:
    case 66:
    case 67:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 112:
    case 118:
    case 119:
    case 122:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 139:
    case 140:
    case 141:
    case 153:
    case 154:
    case 155:
    case 156:
      goto LABEL_5;
    case 62:
    case 63:
    case 64:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 85:
    case 86:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 108:
    case 109:
    case 110:
    case 111:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 120:
    case 121:
    case 123:
    case 124:
    case 125:
    case 126:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
      return v1;
    default:
      if ((Product - 200) <= 0xB && Product != 210 || (Product - 0x8000) < 3)
LABEL_5:
        v1 = 1;
      break;
  }
  return v1;
}

void capabilities::ct::minFirmwareVersion(std::string *a1@<X8>)
{
  unsigned __int8 v3;
  capabilities::ct *v4;

  v3 = atomic_load((unsigned __int8 *)&qword_2544DB390);
  if ((v3 & 1) == 0)
  {
    v4 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB390);
    if ((_DWORD)v4)
    {
      capabilities::ct::sMinFirmwareVersion(v4);
      __cxa_atexit(MEMORY[0x24BEDACF0], &xmmword_2544DB998, &dword_24B9DC000);
      __cxa_guard_release(&qword_2544DB390);
    }
  }
  if (byte_2544DB9AF < 0)
  {
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)xmmword_2544DB998, *((std::string::size_type *)&xmmword_2544DB998 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_2544DB998;
    a1->__r_.__value_.__r.__words[2] = unk_2544DB9A8;
  }
}

void sub_24B9E8F20(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB390);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sMinFirmwareVersion(capabilities::ct *this)
{
  __int128 *v1;
  uint64_t result;

  v1 = &xmmword_2544DB998;
  memset(&xmmword_2544DB998, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_2544DB998, (char *)&unk_24BA0187D);
  result = TelephonyRadiosGetRadioVendor();
  if (result <= 4 && ((1 << result) & 0x16) != 0)
  {
    if (byte_2544DB9AF < 0)
    {
      *((_QWORD *)&xmmword_2544DB998 + 1) = 7;
      v1 = (__int128 *)xmmword_2544DB998;
    }
    else
    {
      byte_2544DB9AF = 7;
    }
    *(_DWORD *)((char *)v1 + 3) = 808463920;
    *(_DWORD *)v1 = 808463920;
    v1 = (__int128 *)((char *)v1 + 7);
  }
  else if (byte_2544DB9AF < 0)
  {
    *((_QWORD *)&xmmword_2544DB998 + 1) = 0;
    v1 = (__int128 *)xmmword_2544DB998;
  }
  else
  {
    byte_2544DB9AF = 0;
  }
  *(_BYTE *)v1 = 0;
  return result;
}

void sub_24B9E8FEC(_Unwind_Exception *exception_object)
{
  if (byte_2544DB9AF < 0)
    operator delete((void *)xmmword_2544DB998);
  _Unwind_Resume(exception_object);
}

uint64_t capabilities::ct::getAWDBasebandComponent(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB398);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB398);
    if ((_DWORD)v3)
    {
      dword_2544DB2B4 = capabilities::ct::sGetAWDBasebandComponent(v3);
      __cxa_guard_release(&qword_2544DB398);
    }
  }
  return dword_2544DB2B4;
}

void sub_24B9E906C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB398);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sGetAWDBasebandComponent(capabilities::ct *this)
{
  unsigned int v1;

  v1 = TelephonyRadiosGetRadioVendor() - 1;
  if (v1 > 3)
    return 0;
  else
    return dword_24B9FFCFC[v1];
}

uint64_t capabilities::ct::supportsSHA2Signature(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB3A0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB3A0))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB214 = (Radio < 0x12) & (0x23E3Eu >> Radio);
    __cxa_guard_release(&qword_2544DB3A0);
  }
  return byte_2544DB214;
}

void sub_24B9E912C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB3A0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsIncrementalNetworkScan(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB3A8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB3A8))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB215 = (Radio < 0x12) & (0x2FFAEu >> Radio);
    __cxa_guard_release(&qword_2544DB3A8);
  }
  return byte_2544DB215;
}

void sub_24B9E91B8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB3A8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsCapabilitySIM(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB3B0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB3B0);
    if ((_DWORD)v3)
    {
      byte_2544DB216 = capabilities::ct::sSupportsCapabilitySIM(v3);
      __cxa_guard_release(&qword_2544DB3B0);
    }
  }
  return byte_2544DB216;
}

void sub_24B9E922C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB3B0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsCapabilitySIM(capabilities::ct *this)
{
  int v1;
  uint64_t result;

  v1 = TelephonyRadiosGetProduct() - 33;
  result = 1;
  switch(v1)
  {
    case 0:
    case 5:
    case 19:
    case 20:
    case 24:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 40:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 167:
    case 169:
    case 170:
    case 174:
    case 176:
    case 178:
    case 179:
      return result;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::ct::supportsCellularHealthDiagnostics(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB3B8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB3B8);
    if ((_DWORD)v3)
    {
      byte_2544DB217 = capabilities::ct::sSupportsCellularHealthDiagnostics(v3);
      __cxa_guard_release(&qword_2544DB3B8);
    }
  }
  return byte_2544DB217;
}

void sub_24B9E92E4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB3B8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsCellularHealthDiagnostics(capabilities::ct *this)
{
  int v1;
  uint64_t result;

  v1 = TelephonyRadiosGetProduct() - 33;
  result = 1;
  switch(v1)
  {
    case 0:
    case 5:
    case 24:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 46:
    case 47:
    case 48:
    case 51:
    case 58:
    case 59:
    case 60:
    case 64:
    case 66:
    case 67:
    case 68:
    case 69:
    case 81:
    case 82:
    case 83:
    case 84:
    case 91:
    case 99:
    case 100:
    case 101:
    case 102:
    case 109:
    case 110:
    case 111:
    case 112:
    case 116:
    case 117:
    case 118:
    case 119:
    case 123:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 179:
      return result;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::ct::supportsDownlinkDTMFDetection(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB3C0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB3C0))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB218 = (Radio < 0x12) & (0x3FE3Eu >> Radio);
    __cxa_guard_release(&qword_2544DB3C0);
  }
  return byte_2544DB218;
}

void sub_24B9E93B0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB3C0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsDERFileFormat(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB3C8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB3C8))
  {
    byte_2544DB219 = TelephonyRadiosGetRadioVendor() - 1 < 4;
    __cxa_guard_release(&qword_2544DB3C8);
  }
  return byte_2544DB219;
}

void sub_24B9E9430(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB3C8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::shouldSaveVinylInfo(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB3D0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB3D0))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB21A = (Radio < 0x12) & (0x3FFF2u >> Radio);
    __cxa_guard_release(&qword_2544DB3D0);
  }
  return byte_2544DB21A;
}

void sub_24B9E94BC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB3D0);
  _Unwind_Resume(a1);
}

void capabilities::ct::compatibleHardwareConfigurationString(std::string *a1@<X8>)
{
  unsigned __int8 v3;
  capabilities::ct *v4;

  v3 = atomic_load((unsigned __int8 *)&qword_2544DB3D8);
  if ((v3 & 1) == 0)
  {
    v4 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB3D8);
    if ((_DWORD)v4)
    {
      capabilities::ct::sCompatibleHardwareConfigurationString(v4);
      __cxa_atexit(MEMORY[0x24BEDACF0], &xmmword_2544DB9B0, &dword_24B9DC000);
      __cxa_guard_release(&qword_2544DB3D8);
    }
  }
  if (byte_2544DB9C7 < 0)
  {
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)xmmword_2544DB9B0, *((std::string::size_type *)&xmmword_2544DB9B0 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_2544DB9B0;
    a1->__r_.__value_.__r.__words[2] = unk_2544DB9C0;
  }
}

void sub_24B9E957C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB3D8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sCompatibleHardwareConfigurationString(capabilities::ct *this)
{
  __int128 *v1;
  uint64_t result;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  char v9;
  int v10;
  char v11;
  __int16 v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;

  v1 = &xmmword_2544DB9B0;
  memset(&xmmword_2544DB9B0, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_2544DB9B0, (char *)&unk_24BA0187D);
  result = TelephonyRadiosGetProduct();
  switch((int)result)
  {
    case 52:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v4 = 825373002;
      goto LABEL_257;
    case 53:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v4 = 942682698;
      goto LABEL_257;
    case 60:
    case 61:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 5;
      }
      *((_BYTE *)v1 + 4) = 115;
      v3 = 825504078;
      goto LABEL_196;
    case 73:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v4 = 1647458122;
      goto LABEL_257;
    case 79:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v4 = 825373508;
      goto LABEL_257;
    case 80:
    case 81:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v4 = 825439044;
      goto LABEL_257;
    case 82:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v4 = 942748490;
      goto LABEL_257;
    case 83:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v4 = 825373514;
      goto LABEL_257;
    case 84:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v4 = 825505870;
      goto LABEL_257;
    case 87:
    case 88:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 5;
      }
      *((_BYTE *)v1 + 4) = 115;
      v3 = 909390158;
      goto LABEL_196;
    case 89:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v4 = 825307722;
      goto LABEL_257;
    case 90:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v5 = 942682698;
      goto LABEL_173;
    case 91:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v4 = 875573582;
      goto LABEL_257;
    case 92:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v4 = 825373764;
      goto LABEL_257;
    case 93:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v7 = 825439044;
      goto LABEL_235;
    case 94:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v4 = 842477898;
      goto LABEL_257;
    case 95:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v8 = 825373002;
      goto LABEL_238;
    case 96:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v7 = 942748490;
      goto LABEL_235;
    case 97:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 3;
      }
      v9 = 57;
      goto LABEL_232;
    case 99:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v4 = 1731343684;
      goto LABEL_257;
    case 100:
    case 101:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v5 = 1731343684;
LABEL_173:
      v4 = v5 | 0x10000;
      goto LABEL_257;
    case 102:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v4 = 1882469700;
      goto LABEL_257;
    case 103:
    case 104:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 5;
      }
      *((_BYTE *)v1 + 4) = 115;
      v3 = 842281294;
      goto LABEL_196;
    case 105:
    case 106:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 5;
      }
      *((_BYTE *)v1 + 4) = 115;
      v3 = 943010126;
      goto LABEL_196;
    case 107:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v10 = 942682698;
      goto LABEL_209;
    case 108:
    case 109:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v6 = 942748490;
      goto LABEL_214;
    case 110:
    case 111:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v4 = 858928458;
      goto LABEL_257;
    case 112:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 5;
      }
      *((_BYTE *)v1 + 4) = 97;
      v3 = 842477898;
      goto LABEL_196;
    case 114:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 3;
      }
      v11 = 54;
      goto LABEL_201;
    case 115:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 3;
      }
      v11 = 55;
LABEL_201:
      *((_BYTE *)v1 + 2) = v11;
      v12 = 12612;
      goto LABEL_268;
    case 116:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 3;
      }
      v13 = 51;
      goto LABEL_206;
    case 117:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 3;
      }
      v13 = 52;
LABEL_206:
      *((_BYTE *)v1 + 2) = v13;
      v12 = 13892;
      goto LABEL_268;
    case 118:
    case 119:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 5;
      }
      *((_BYTE *)v1 + 4) = 115;
      v3 = 943206734;
      goto LABEL_196;
    case 120:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v10 = 825307722;
LABEL_209:
      v4 = v10 | 0x100;
      goto LABEL_257;
    case 122:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v4 = 842543434;
      goto LABEL_257;
    case 123:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v6 = 942682698;
LABEL_214:
      v4 = v6 + 512;
      goto LABEL_257;
    case 124:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 3;
      }
      v14 = 57;
      goto LABEL_262;
    case 125:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v8 = 942748490;
      goto LABEL_238;
    case 126:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v4 = 825374282;
      goto LABEL_257;
    case 127:
    case 128:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 5;
      }
      *((_BYTE *)v1 + 4) = 115;
      v3 = 959721806;
      goto LABEL_196;
    case 129:
    case 130:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 5;
      }
      *((_BYTE *)v1 + 4) = 115;
      v3 = 943272270;
      goto LABEL_196;
    case 131:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v4 = 960049486;
      goto LABEL_257;
    case 132:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 3;
      }
      v15 = 55;
      goto LABEL_227;
    case 133:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 3;
      }
      v15 = 56;
LABEL_227:
      *((_BYTE *)v1 + 2) = v15;
      v12 = 12868;
      goto LABEL_268;
    case 134:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 3;
      }
      v9 = 51;
      goto LABEL_232;
    case 135:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 3;
      }
      v9 = 52;
LABEL_232:
      *((_BYTE *)v1 + 2) = v9;
      v12 = 14148;
      goto LABEL_268;
    case 136:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v7 = 842477898;
LABEL_235:
      v4 = v7 + 256;
      goto LABEL_257;
    case 137:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v8 = 942682698;
LABEL_238:
      v4 = v8 + 768;
      goto LABEL_257;
    case 138:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v4 = 942880074;
      goto LABEL_257;
    case 139:
    case 140:
    case 209:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 5;
      }
      *((_BYTE *)v1 + 4) = 115;
      v3 = 942682702;
      goto LABEL_196;
    case 141:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v4 = 808530510;
      goto LABEL_257;
    case 142:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 3;
      }
      v16 = 55;
      goto LABEL_247;
    case 143:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 3;
      }
      v16 = 56;
LABEL_247:
      *((_BYTE *)v1 + 2) = v16;
      v12 = 13124;
      goto LABEL_268;
    case 144:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 3;
      }
      v17 = 51;
      goto LABEL_252;
    case 145:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 3;
      }
      v17 = 52;
LABEL_252:
      *((_BYTE *)v1 + 2) = v17;
      v12 = 14404;
      goto LABEL_268;
    case 147:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v4 = 942749514;
      goto LABEL_257;
    case 148:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 4;
      }
      v4 = 825374538;
LABEL_257:
      *(_DWORD *)v1 = v4;
      v1 = (__int128 *)((char *)v1 + 4);
      break;
    case 149:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 3;
      }
      v14 = 55;
      goto LABEL_262;
    case 150:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 3;
      }
      v14 = 56;
LABEL_262:
      *((_BYTE *)v1 + 2) = v14;
      v12 = 13380;
      goto LABEL_268;
    case 151:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 3;
      }
      v18 = 51;
      goto LABEL_267;
    case 152:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 3;
      }
      v18 = 52;
LABEL_267:
      *((_BYTE *)v1 + 2) = v18;
      v12 = 14660;
LABEL_268:
      *(_WORD *)v1 = v12;
      v1 = (__int128 *)((char *)v1 + 3);
      break;
    case 153:
    case 154:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 5;
      }
      *((_BYTE *)v1 + 4) = 115;
      v3 = 942748238;
LABEL_196:
      *(_DWORD *)v1 = v3;
      v1 = (__int128 *)((char *)v1 + 5);
      break;
    default:
      if (byte_2544DB9C7 < 0)
      {
        *((_QWORD *)&xmmword_2544DB9B0 + 1) = 0;
        v1 = (__int128 *)xmmword_2544DB9B0;
      }
      else
      {
        byte_2544DB9C7 = 0;
      }
      break;
  }
  *(_BYTE *)v1 = 0;
  return result;
}

void sub_24B9EA23C(_Unwind_Exception *exception_object)
{
  if (byte_2544DB9C7 < 0)
    operator delete((void *)xmmword_2544DB9B0);
  _Unwind_Resume(exception_object);
}

void capabilities::ct::deviceName(std::string *a1@<X8>)
{
  unsigned __int8 v3;
  capabilities::ct *v4;

  v3 = atomic_load((unsigned __int8 *)&qword_2544DB3E0);
  if ((v3 & 1) == 0)
  {
    v4 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB3E0);
    if ((_DWORD)v4)
    {
      capabilities::ct::sDeviceName(v4);
      __cxa_atexit(MEMORY[0x24BEDACF0], &xmmword_2544DB9C8, &dword_24B9DC000);
      __cxa_guard_release(&qword_2544DB3E0);
    }
  }
  if (byte_2544DB9DF < 0)
  {
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)xmmword_2544DB9C8, *((std::string::size_type *)&xmmword_2544DB9C8 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_2544DB9C8;
    a1->__r_.__value_.__r.__words[2] = unk_2544DB9D8;
  }
}

void sub_24B9EA308(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB3E0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sDeviceName(capabilities::ct *this)
{
  __int128 *v1;
  uint64_t result;
  int v3;
  char v4;
  int v5;
  char v6;
  int v7;
  int v8;
  int v9;
  char v10;
  int v11;
  char v12;
  char v13;
  int v14;
  int v15;
  unsigned __int16 v16;
  char v17;
  __int16 v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;
  char v27;
  char v28;
  char v29;

  v1 = &xmmword_2544DB9C8;
  memset(&xmmword_2544DB9C8, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_2544DB9C8, (char *)&unk_24BA0187D);
  result = TelephonyRadiosGetProduct();
  switch((int)result)
  {
    case 52:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v3 = 825373002;
      goto LABEL_315;
    case 53:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v3 = 942682698;
      goto LABEL_315;
    case 60:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 5;
      }
      v4 = 98;
      goto LABEL_165;
    case 61:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 5;
      }
      v4 = 115;
LABEL_165:
      *((_BYTE *)v1 + 4) = v4;
      v5 = 825504078;
      goto LABEL_335;
    case 73:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v3 = 1647458122;
      goto LABEL_315;
    case 79:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v3 = 825373508;
      goto LABEL_315;
    case 80:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v3 = 825439044;
      goto LABEL_315;
    case 81:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 5;
      }
      *((_BYTE *)v1 + 4) = 112;
      v5 = 825439044;
      goto LABEL_335;
    case 82:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v3 = 942748490;
      goto LABEL_315;
    case 83:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v3 = 825373514;
      goto LABEL_315;
    case 84:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v3 = 825505870;
      goto LABEL_315;
    case 87:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 5;
      }
      v6 = 115;
      goto LABEL_184;
    case 88:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 5;
      }
      v6 = 98;
LABEL_184:
      *((_BYTE *)v1 + 4) = v6;
      v5 = 909390158;
      goto LABEL_335;
    case 89:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v3 = 825307722;
      goto LABEL_315;
    case 90:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v7 = 942682698;
      goto LABEL_207;
    case 91:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v3 = 875573582;
      goto LABEL_315;
    case 92:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v3 = 825373764;
      goto LABEL_315;
    case 93:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v8 = 825439044;
      goto LABEL_288;
    case 94:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v3 = 842477898;
      goto LABEL_315;
    case 95:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v9 = 825373002;
      goto LABEL_291;
    case 96:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v8 = 942748490;
      goto LABEL_288;
    case 97:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 3;
      }
      v10 = 57;
      goto LABEL_285;
    case 99:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v3 = 1731343684;
      goto LABEL_315;
    case 100:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v7 = 1731343684;
LABEL_207:
      v3 = v7 | 0x10000;
      goto LABEL_315;
    case 101:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v3 = 1882404164;
      goto LABEL_315;
    case 102:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v11 = 1882404164;
      goto LABEL_254;
    case 103:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 5;
      }
      v12 = 115;
      goto LABEL_216;
    case 104:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 5;
      }
      v12 = 98;
LABEL_216:
      *((_BYTE *)v1 + 4) = v12;
      v5 = 842281294;
      goto LABEL_335;
    case 105:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 5;
      }
      v13 = 115;
      goto LABEL_221;
    case 106:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 5;
      }
      v13 = 98;
LABEL_221:
      *((_BYTE *)v1 + 4) = v13;
      v5 = 943010126;
      goto LABEL_335;
    case 107:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v14 = 942682698;
      goto LABEL_251;
    case 108:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v15 = 942748490;
      goto LABEL_257;
    case 109:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 5;
      }
      *((_BYTE *)v1 + 4) = 120;
      v16 = 13642;
      goto LABEL_332;
    case 110:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v3 = 858928458;
      goto LABEL_315;
    case 111:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 5;
      }
      *((_BYTE *)v1 + 4) = 120;
      v5 = 858928458;
      goto LABEL_335;
    case 112:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 5;
      }
      *((_BYTE *)v1 + 4) = 97;
      v5 = 842477898;
      goto LABEL_335;
    case 114:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 3;
      }
      v17 = 54;
      goto LABEL_238;
    case 115:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 3;
      }
      v17 = 55;
LABEL_238:
      *((_BYTE *)v1 + 2) = v17;
      v18 = 12612;
      goto LABEL_326;
    case 116:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 3;
      }
      v19 = 51;
      goto LABEL_243;
    case 117:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 3;
      }
      v19 = 52;
LABEL_243:
      *((_BYTE *)v1 + 2) = v19;
      v18 = 13892;
      goto LABEL_326;
    case 118:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 5;
      }
      v20 = 115;
      goto LABEL_248;
    case 119:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 5;
      }
      v20 = 98;
LABEL_248:
      *((_BYTE *)v1 + 4) = v20;
      v5 = 943206734;
      goto LABEL_335;
    case 120:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v14 = 825307722;
LABEL_251:
      v3 = v14 | 0x100;
      goto LABEL_315;
    case 122:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v11 = 842477898;
LABEL_254:
      v3 = v11 + 0x10000;
      goto LABEL_315;
    case 123:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v15 = 942682698;
LABEL_257:
      v3 = v15 + 512;
      goto LABEL_315;
    case 124:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 3;
      }
      v21 = 57;
      goto LABEL_320;
    case 125:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v9 = 942748490;
      goto LABEL_291;
    case 126:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v3 = 825374282;
      goto LABEL_315;
    case 127:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 5;
      }
      v22 = 115;
      goto LABEL_268;
    case 128:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 5;
      }
      v22 = 98;
LABEL_268:
      *((_BYTE *)v1 + 4) = v22;
      v5 = 959721806;
      goto LABEL_335;
    case 129:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 5;
      }
      v23 = 115;
      goto LABEL_273;
    case 130:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 5;
      }
      v23 = 98;
LABEL_273:
      *((_BYTE *)v1 + 4) = v23;
      v5 = 943272270;
      goto LABEL_335;
    case 131:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v3 = 960049486;
      goto LABEL_315;
    case 132:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 3;
      }
      v24 = 55;
      goto LABEL_280;
    case 133:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 3;
      }
      v24 = 56;
LABEL_280:
      *((_BYTE *)v1 + 2) = v24;
      v18 = 12868;
      goto LABEL_326;
    case 134:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 3;
      }
      v10 = 51;
      goto LABEL_285;
    case 135:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 3;
      }
      v10 = 52;
LABEL_285:
      *((_BYTE *)v1 + 2) = v10;
      v18 = 14148;
      goto LABEL_326;
    case 136:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v8 = 842477898;
LABEL_288:
      v3 = v8 + 256;
      goto LABEL_315;
    case 137:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v9 = 942682698;
LABEL_291:
      v3 = v9 + 768;
      goto LABEL_315;
    case 138:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v3 = 942880074;
      goto LABEL_315;
    case 139:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 5;
      }
      v25 = 115;
      goto LABEL_298;
    case 140:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 5;
      }
      v25 = 98;
LABEL_298:
      *((_BYTE *)v1 + 4) = v25;
      v5 = 942682702;
      goto LABEL_335;
    case 141:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v3 = 808530510;
      goto LABEL_315;
    case 142:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 3;
      }
      v26 = 55;
      goto LABEL_305;
    case 143:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 3;
      }
      v26 = 56;
LABEL_305:
      *((_BYTE *)v1 + 2) = v26;
      v18 = 13124;
      goto LABEL_326;
    case 144:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 3;
      }
      v27 = 51;
      goto LABEL_310;
    case 145:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 3;
      }
      v27 = 52;
LABEL_310:
      *((_BYTE *)v1 + 2) = v27;
      v18 = 14404;
      goto LABEL_326;
    case 147:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v3 = 942749514;
      goto LABEL_315;
    case 148:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 4;
      }
      v3 = 825374538;
LABEL_315:
      *(_DWORD *)v1 = v3;
      v1 = (__int128 *)((char *)v1 + 4);
      break;
    case 149:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 3;
      }
      v21 = 55;
      goto LABEL_320;
    case 150:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 3;
      }
      v21 = 56;
LABEL_320:
      *((_BYTE *)v1 + 2) = v21;
      v18 = 13380;
      goto LABEL_326;
    case 151:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 3;
      }
      v28 = 51;
      goto LABEL_325;
    case 152:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 3;
      }
      v28 = 52;
LABEL_325:
      *((_BYTE *)v1 + 2) = v28;
      v18 = 14660;
LABEL_326:
      *(_WORD *)v1 = v18;
      v1 = (__int128 *)((char *)v1 + 3);
      break;
    case 153:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 5;
      }
      v29 = 115;
      goto LABEL_331;
    case 154:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 5;
      }
      v29 = 98;
LABEL_331:
      *((_BYTE *)v1 + 4) = v29;
      v16 = 12878;
LABEL_332:
      v5 = v16 | 0x38310000;
      goto LABEL_335;
    case 209:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 5;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 5;
      }
      *((_BYTE *)v1 + 4) = 51;
      v5 = 892416340;
LABEL_335:
      *(_DWORD *)v1 = v5;
      v1 = (__int128 *)((char *)v1 + 5);
      break;
    default:
      if (byte_2544DB9DF < 0)
      {
        *((_QWORD *)&xmmword_2544DB9C8 + 1) = 0;
        v1 = (__int128 *)xmmword_2544DB9C8;
      }
      else
      {
        byte_2544DB9DF = 0;
      }
      break;
  }
  *(_BYTE *)v1 = 0;
  return result;
}

void sub_24B9EB260(_Unwind_Exception *exception_object)
{
  if (byte_2544DB9DF < 0)
    operator delete((void *)xmmword_2544DB9C8);
  _Unwind_Resume(exception_object);
}

uint64_t capabilities::ct::bootstrapProvisioningSupportedOnSlotID(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB3E8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB3E8);
    if ((_DWORD)v3)
    {
      dword_2544DB2B8 = capabilities::ct::sBootstrapProvisioningSupportedOnSlotID(v3);
      __cxa_guard_release(&qword_2544DB3E8);
    }
  }
  return dword_2544DB2B8;
}

void sub_24B9EB2E0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB3E8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sBootstrapProvisioningSupportedOnSlotID(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 2;
  Product = TelephonyRadiosGetProduct();
  if (((Product - 120) > 0x27 || ((1 << (Product - 120)) & 0xE01C070069) == 0)
    && ((Product - 52) > 0x3B || ((1 << (Product - 52)) & 0xF00000000200003) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::ct::sSupportsThumperService(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if (Product > 208)
  {
    if ((Product - 0x8000) >= 3 && Product != 209 && Product != 211)
      return 0;
  }
  else
  {
    switch(Product)
    {
      case 52:
      case 53:
      case 60:
      case 61:
      case 73:
      case 82:
      case 83:
      case 87:
      case 88:
      case 89:
      case 90:
      case 94:
      case 95:
      case 96:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 110:
      case 111:
      case 112:
      case 118:
      case 119:
      case 120:
      case 122:
      case 123:
      case 125:
      case 126:
      case 127:
      case 128:
      case 129:
      case 130:
      case 131:
      case 136:
      case 137:
      case 138:
      case 139:
      case 140:
      case 141:
      case 146:
      case 147:
      case 148:
      case 153:
      case 154:
      case 155:
      case 157:
      case 158:
      case 159:
        return v1;
      default:
        return 0;
    }
  }
  return v1;
}

uint64_t capabilities::ct::getBasebandBootStrategy(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB3F8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB3F8);
    if ((_DWORD)v3)
    {
      dword_2544DB2BC = capabilities::ct::sGetBasebandBootStrategy(v3);
      __cxa_guard_release(&qword_2544DB3F8);
    }
  }
  return dword_2544DB2BC;
}

void sub_24B9EB444(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB3F8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sGetBasebandBootStrategy(capabilities::ct *this)
{
  unsigned int v1;

  v1 = TelephonyRadiosGetProduct() - 52;
  if (v1 > 0xA0)
    return 0;
  else
    return dword_24B9FFD0C[v1];
}

uint64_t capabilities::ct::supportsCarrierSpace(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB400);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB400);
    if ((_DWORD)v3)
    {
      byte_2544DB21C = capabilities::ct::sSupportsCarrierSpace(v3);
      __cxa_guard_release(&qword_2544DB400);
    }
  }
  return byte_2544DB21C;
}

void sub_24B9EB4EC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB400);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsCarrierSpace(capabilities::ct *this)
{
  int v1;
  uint64_t result;

  v1 = TelephonyRadiosGetProduct() - 52;
  result = 1;
  switch(v1)
  {
    case 0:
    case 1:
    case 21:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 47:
    case 48:
    case 49:
    case 50:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 62:
    case 63:
    case 64:
    case 65:
    case 68:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 104:
    case 105:
    case 106:
    case 107:
    case 148:
    case 150:
    case 151:
    case 155:
    case 160:
      return result;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::ct::supportsWirelessModem(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB408);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB408);
    if ((_DWORD)v3)
    {
      byte_2544DB21D = capabilities::ct::sSupportsWirelessModem(v3);
      __cxa_guard_release(&qword_2544DB408);
    }
  }
  return byte_2544DB21D;
}

void sub_24B9EB5A4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB408);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsWirelessModem(capabilities::ct *this)
{
  int v1;
  uint64_t result;

  v1 = TelephonyRadiosGetProduct() - 52;
  result = 1;
  switch(v1)
  {
    case 0:
    case 1:
    case 21:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 47:
    case 48:
    case 49:
    case 50:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 62:
    case 63:
    case 64:
    case 65:
    case 68:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 104:
    case 105:
    case 106:
    case 107:
    case 148:
    case 150:
    case 151:
    case 155:
    case 160:
      return result;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::ct::supportsCapabilityAPN(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB410);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB410);
    if ((_DWORD)v3)
    {
      byte_2544DB21E = capabilities::ct::sSupportsCapabilityAPN(v3);
      __cxa_guard_release(&qword_2544DB410);
    }
  }
  return byte_2544DB21E;
}

void sub_24B9EB65C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB410);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsCapabilityAPN(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 52:
    case 53:
    case 60:
    case 61:
    case 73:
    case 82:
    case 83:
    case 87:
    case 88:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 118:
    case 119:
    case 120:
    case 122:
    case 123:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 146:
    case 147:
    case 148:
    case 153:
    case 154:
    case 155:
    case 157:
    case 158:
    case 159:
      return v1;
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 84:
    case 85:
    case 86:
    case 91:
    case 92:
    case 93:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 121:
    case 124:
    case 132:
    case 133:
    case 134:
    case 135:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 156:
      goto LABEL_5;
    default:
      if (Product != 209 && Product != 211)
LABEL_5:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsCambioModeQuery(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB418);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB418);
    if ((_DWORD)v3)
    {
      byte_2544DB21F = capabilities::ct::sSupportsCambioModeQuery(v3);
      __cxa_guard_release(&qword_2544DB418);
    }
  }
  return byte_2544DB21F;
}

void sub_24B9EB730(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB418);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsCambioModeQuery(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 52:
    case 53:
    case 60:
    case 61:
    case 73:
    case 82:
    case 83:
    case 87:
    case 88:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 118:
    case 119:
    case 120:
    case 122:
    case 123:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 146:
    case 147:
    case 148:
    case 153:
    case 154:
    case 155:
    case 157:
    case 158:
    case 159:
      return v1;
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 84:
    case 85:
    case 86:
    case 91:
    case 92:
    case 93:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 121:
    case 124:
    case 132:
    case 133:
    case 134:
    case 135:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 156:
      goto LABEL_5;
    default:
      if (Product != 209 && Product != 211)
LABEL_5:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::sSupportsCellRadio(capabilities::ct *this)
{
  int v1;
  uint64_t result;

  v1 = TelephonyRadiosGetProduct() - 52;
  result = 1;
  switch(v1)
  {
    case 0:
    case 1:
    case 8:
    case 9:
    case 21:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 148:
    case 150:
    case 151:
    case 155:
    case 157:
    case 159:
    case 160:
      return result;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::ct::sSupportsSequoia(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if (((Product - 52) > 0x3C || ((1 << (Product - 52)) & 0x1F801C60C0200003) == 0)
    && ((Product - 120) > 0x27 || ((1 << (Product - 120)) & 0xE01C07006DLL) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::ct::supportsRegulatoryRestriction(capabilities::ct *this)
{
  unsigned __int8 v1;
  int Product;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB438);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB438))
  {
    Product = TelephonyRadiosGetProduct();
    byte_2544DB223 = ((Product - 136) < 0x18) & (0xE01C07u >> (Product + 120));
    __cxa_guard_release(&qword_2544DB438);
  }
  return byte_2544DB223;
}

void sub_24B9EB8E4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB438);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::getCarrierBundleBaseDir(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB440);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB440);
    if ((_DWORD)v3)
    {
      dword_2544DB2C0 = capabilities::ct::sGetCarrierBundleBaseDir(v3);
      __cxa_guard_release(&qword_2544DB440);
    }
  }
  return dword_2544DB2C0;
}

void sub_24B9EB958(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB440);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sGetCarrierBundleBaseDir(capabilities::ct *this)
{
  unsigned int v1;

  v1 = TelephonyRadiosGetProduct() - 52;
  if (v1 > 0xA0)
    return 3;
  else
    return dword_24B9FFF90[v1];
}

void capabilities::ct::getSupportedMessageModes(_QWORD *a1@<X8>)
{
  unsigned __int8 v3;
  const void *v4;
  int64_t v5;
  char *v6;
  capabilities::ct *v7;

  v3 = atomic_load((unsigned __int8 *)&qword_2544DB448);
  if ((v3 & 1) == 0)
  {
    v7 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB448);
    if ((_DWORD)v7)
    {
      capabilities::ct::sGetSupportedMessageModes(v7);
      __cxa_atexit((void (*)(void *))std::vector<capabilities::ct::SupportedMessageMode>::~vector[abi:ne180100], &qword_2544DB9E0, &dword_24B9DC000);
      __cxa_guard_release(&qword_2544DB448);
    }
  }
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v4 = (const void *)qword_2544DB9E0;
  v5 = qword_2544DB9E8 - qword_2544DB9E0;
  if (qword_2544DB9E8 != qword_2544DB9E0)
  {
    std::vector<capabilities::ct::SupportedMessageMode>::__vallocate[abi:ne180100](a1, v5 >> 2);
    v6 = (char *)a1[1];
    memmove(v6, v4, v5);
    a1[1] = &v6[4 * (v5 >> 2)];
  }
}

void sub_24B9EBA64(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB448);
  _Unwind_Resume(a1);
}

char *capabilities::ct::sGetSupportedMessageModes(capabilities::ct *this)
{
  _OWORD *v1;
  int Product;
  char *result;
  __int128 __src;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  qword_2544DB9E8 = 0;
  qword_2544DB9F0 = 0;
  qword_2544DB9E0 = 0;
  v1 = operator new(0x10uLL);
  qword_2544DB9E0 = (uint64_t)v1;
  *v1 = xmmword_24BA00DC0;
  qword_2544DB9E8 = (uint64_t)(v1 + 1);
  qword_2544DB9F0 = (uint64_t)(v1 + 1);
  Product = TelephonyRadiosGetProduct();
  if (Product > 208)
  {
    if ((Product - 0x8000) >= 3 && (Product == 209 || Product == 211))
    {
LABEL_7:
      LODWORD(__src) = 4;
      return std::vector<capabilities::ct::SupportedMessageMode>::__assign_with_size[abi:ne180100]<capabilities::ct::SupportedMessageMode const*,capabilities::ct::SupportedMessageMode const*>((char *)&__src, (uint64_t)&__src + 4, 1uLL);
    }
    else
    {
LABEL_9:
      __src = xmmword_24BA00DC0;
      return std::vector<capabilities::ct::SupportedMessageMode>::__assign_with_size[abi:ne180100]<capabilities::ct::SupportedMessageMode const*,capabilities::ct::SupportedMessageMode const*>((char *)&__src, (uint64_t)v5, 4uLL);
    }
  }
  else
  {
    switch(Product)
    {
      case 52:
      case 53:
      case 73:
      case 82:
      case 83:
      case 89:
      case 90:
      case 94:
      case 95:
      case 96:
      case 107:
      case 108:
      case 109:
      case 110:
      case 111:
      case 112:
      case 120:
      case 122:
      case 123:
      case 125:
      case 126:
      case 136:
      case 137:
      case 138:
      case 146:
      case 147:
      case 148:
      case 157:
      case 158:
      case 159:
        LODWORD(__src) = 2;
        result = std::vector<capabilities::ct::SupportedMessageMode>::__assign_with_size[abi:ne180100]<capabilities::ct::SupportedMessageMode const*,capabilities::ct::SupportedMessageMode const*>((char *)&__src, (uint64_t)&__src + 4, 1uLL);
        break;
      case 60:
      case 61:
      case 87:
      case 88:
      case 103:
      case 104:
      case 105:
      case 106:
      case 118:
      case 119:
      case 127:
      case 128:
      case 129:
      case 130:
      case 131:
      case 139:
      case 140:
      case 141:
      case 153:
      case 154:
      case 155:
        goto LABEL_7;
      default:
        goto LABEL_9;
    }
  }
  return result;
}

void sub_24B9EBBD8(_Unwind_Exception *exception_object)
{
  if (qword_2544DB9E0)
  {
    qword_2544DB9E8 = qword_2544DB9E0;
    operator delete((void *)qword_2544DB9E0);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<capabilities::ct::SupportedMessageMode>::~vector[abi:ne180100](uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    *(_QWORD *)(a1 + 8) = v2;
    operator delete(v2);
  }
  return a1;
}

uint64_t capabilities::ct::supportedVinylSlotCount(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB458);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB458))
  {
    v3 = TelephonyRadiosGetRadio() - 2;
    if (v3 > 0xF)
      v4 = 0;
    else
      v4 = qword_24BA00218[v3];
    qword_2544DB450 = v4;
    __cxa_guard_release(&qword_2544DB458);
  }
  return qword_2544DB450;
}

void sub_24B9EBCB4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB458);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsDataSubscriptionController(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB468);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB468);
    if ((_DWORD)v3)
    {
      byte_2544DB224 = capabilities::ct::sSupportsDataSubscriptionController(v3);
      __cxa_guard_release(&qword_2544DB468);
    }
  }
  return byte_2544DB224;
}

void sub_24B9EBD28(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB468);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsDataSubscriptionController(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 99:
    case 100:
    case 101:
    case 102:
    case 108:
    case 109:
    case 110:
    case 111:
    case 114:
    case 115:
    case 116:
    case 117:
    case 120:
    case 123:
    case 124:
    case 125:
    case 126:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 156:
    case 200:
    case 201:
    case 202:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 212:
      return v1;
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 112:
    case 113:
    case 118:
    case 119:
    case 121:
    case 122:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 146:
    case 147:
    case 148:
    case 153:
    case 154:
    case 155:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 203:
    case 209:
    case 210:
    case 211:
      goto LABEL_4;
    default:
      if ((Product - 52) >= 2)
LABEL_4:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::firmwarePreflightVinylSlotID(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB470);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB470);
    if ((_DWORD)v3)
    {
      dword_2544DB2C8 = capabilities::ct::sFirmwarePreflightVinylSlotID(v3);
      __cxa_guard_release(&qword_2544DB470);
    }
  }
  return dword_2544DB2C8;
}

void sub_24B9EBDF8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB470);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sFirmwarePreflightVinylSlotID(capabilities::ct *this)
{
  unsigned int v1;

  v1 = TelephonyRadiosGetProduct() - 52;
  if (v1 > 0xA0)
    return 0;
  else
    return dword_24BA00298[v1];
}

uint64_t capabilities::ct::defaultMobileEquipmentInfoCSNSlotID(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB478);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB478))
  {
    v3 = TelephonyRadiosGetRadio() - 2;
    if (v3 > 0xF)
      v4 = 0;
    else
      v4 = dword_24BA00558[v3];
    dword_2544DB2CC = v4;
    __cxa_guard_release(&qword_2544DB478);
  }
  return dword_2544DB2CC;
}

void sub_24B9EBEC0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB478);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsVinylFirmwareUpdate(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB480);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB480))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB225 = (Radio < 0x12) & (0x3FF98u >> Radio);
    __cxa_guard_release(&qword_2544DB480);
  }
  return byte_2544DB225;
}

void sub_24B9EBF4C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB480);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsDynamicSID(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 121:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 200:
    case 201:
    case 202:
    case 203:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 209:
    case 210:
    case 211:
    case 212:
      goto LABEL_2;
    case 82:
    case 83:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 120:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
      return v1;
    default:
      if ((Product - 52) >= 2)
LABEL_2:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::cellularPlanDeleteSupportedOnVinylSlotID(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB490);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB490))
  {
    v3 = TelephonyRadiosGetRadio() - 3;
    if (v3 > 0xE)
      v4 = 0;
    else
      v4 = dword_24BA0051C[v3];
    dword_2544DB2D0 = v4;
    __cxa_guard_release(&qword_2544DB490);
  }
  return dword_2544DB2D0;
}

void sub_24B9EC03C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB490);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsPCOForCambioTrigger(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB498);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB498))
  {
    byte_2544DB227 = TelephonyRadiosGetRadio() == 3;
    __cxa_guard_release(&qword_2544DB498);
  }
  return byte_2544DB227;
}

void sub_24B9EC0B8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB498);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::defaultDebugVinylSlotID(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB4A0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB4A0))
  {
    v3 = TelephonyRadiosGetRadio() - 2;
    if (v3 > 0xF)
      v4 = 0;
    else
      v4 = dword_24BA00558[v3];
    dword_2544DB2D4 = v4;
    __cxa_guard_release(&qword_2544DB4A0);
  }
  return dword_2544DB2D4;
}

void sub_24B9EC14C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB4A0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::getCDMASettingsSupport(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB4A8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB4A8))
  {
    v3 = TelephonyRadiosGetRadio() - 2;
    if (v3 > 8)
      v4 = 0;
    else
      v4 = dword_24BA00598[v3];
    dword_2544DB2D8 = v4;
    __cxa_guard_release(&qword_2544DB4A8);
  }
  return dword_2544DB2D8;
}

void sub_24B9EC1E0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB4A8);
  _Unwind_Resume(a1);
}

BOOL capabilities::ct::sSupportsCapabilityC2KDevice(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if ((Product - 73) > 0x3F || ((1 << (Product - 73)) & 0x80049E783D1C09C1) == 0)
    return (Product - 52) < 2 || Product == 203;
  return v1;
}

uint64_t capabilities::ct::supportedLPASVN(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB4B8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB4B8);
    if ((_DWORD)v3)
    {
      dword_2544DB2DC = capabilities::ct::sSupportedLPASVN(v3);
      __cxa_guard_release(&qword_2544DB4B8);
    }
  }
  return dword_2544DB2DC;
}

void sub_24B9EC2BC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB4B8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportedLPASVN(capabilities::ct *this)
{
  unsigned int v1;

  v1 = TelephonyRadiosGetProduct() - 60;
  if (v1 > 0x98)
    return 0x20000;
  else
    return dword_24BA005BC[v1];
}

uint64_t capabilities::ct::supportedSIMAllianceProfileVersion(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB4C0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB4C0);
    if ((_DWORD)v3)
    {
      dword_2544DB2E0 = capabilities::ct::sSupportedSIMAllianceProfileVersion(v3);
      __cxa_guard_release(&qword_2544DB4C0);
    }
  }
  return dword_2544DB2E0;
}

void sub_24B9EC364(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB4C0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportedSIMAllianceProfileVersion(capabilities::ct *this)
{
  unsigned int v1;

  v1 = TelephonyRadiosGetProduct() - 60;
  if (v1 > 0x98)
    return 0x20000;
  else
    return dword_24BA00820[v1];
}

uint64_t capabilities::ct::getCLTMInterfaceSupport(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB4C8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB4C8);
    if ((_DWORD)v3)
    {
      dword_2544DB2E4 = capabilities::ct::sGetCLTMInterfaceSupport(v3);
      __cxa_guard_release(&qword_2544DB4C8);
    }
  }
  return dword_2544DB2E4;
}

void sub_24B9EC40C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB4C8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sGetCLTMInterfaceSupport(capabilities::ct *this)
{
  uint64_t v1;
  int Product;
  char v3;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  v3 = Product - 60;
  if ((Product - 60) <= 0x3E)
  {
    if (((1 << v3) & 0x4010000461F82000) != 0)
      return v1;
    if (((1 << v3) & 3) != 0)
      return 2;
  }
  if ((Product - 156) > 0x34 || ((1 << (Product + 100)) & 0x1F700000000001) == 0)
    return (Product - 52) < 2;
  return v1;
}

uint64_t capabilities::ct::getSignalStrengthPersonality(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB4D0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB4D0))
  {
    v3 = TelephonyRadiosGetRadio() - 2;
    if (v3 > 0xF)
      v4 = 0;
    else
      v4 = dword_24BA00A84[v3];
    dword_2544DB2E8 = v4;
    __cxa_guard_release(&qword_2544DB4D0);
  }
  return dword_2544DB2E8;
}

void sub_24B9EC53C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB4D0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsNASCallEndReason(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB4D8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB4D8);
    if ((_DWORD)v3)
    {
      byte_2544DB229 = capabilities::ct::sSupportsNASCallEndReason(v3);
      __cxa_guard_release(&qword_2544DB4D8);
    }
  }
  return byte_2544DB229;
}

void sub_24B9EC5B0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB4D8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsNASCallEndReason(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 52:
    case 53:
    case 60:
    case 61:
    case 65:
    case 66:
    case 67:
    case 73:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 112:
    case 118:
    case 119:
    case 122:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 139:
    case 140:
    case 141:
    case 153:
    case 154:
    case 155:
    case 156:
      return v1;
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 62:
    case 63:
    case 64:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 85:
    case 86:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 108:
    case 109:
    case 110:
    case 111:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 120:
    case 121:
    case 123:
    case 124:
    case 125:
    case 126:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
      goto LABEL_6;
    default:
      if (((Product - 200) > 0xB || Product == 210) && (Product - 0x8000) >= 3)
LABEL_6:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsThermalMonitor(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB4E0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB4E0))
  {
    byte_2544DB22A = (TelephonyRadiosGetRadio() & 0xFFFFFFFE) == 2;
    __cxa_guard_release(&qword_2544DB4E0);
  }
  return byte_2544DB22A;
}

void sub_24B9EC6A0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB4E0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsCapabilityeHRPDDevice(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB4E8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB4E8);
    if ((_DWORD)v3)
    {
      byte_2544DB22B = capabilities::ct::sSupportsCapabilityeHRPDDevice(v3);
      __cxa_guard_release(&qword_2544DB4E8);
    }
  }
  return byte_2544DB22B;
}

void sub_24B9EC714(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB4E8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsCapabilityeHRPDDevice(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 52:
    case 53:
    case 73:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 114:
    case 115:
    case 116:
    case 117:
    case 120:
    case 122:
    case 123:
    case 136:
      return v1;
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 85:
    case 86:
    case 87:
    case 88:
    case 98:
    case 103:
    case 104:
    case 105:
    case 106:
    case 113:
    case 118:
    case 119:
    case 121:
    case 124:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
      goto LABEL_5;
    default:
      if (Product != 203 && Product != 32770)
LABEL_5:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsCapabilityTDSCDMADevice(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB4F0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB4F0))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB22C = (Radio < 9) & (0x18Cu >> Radio);
    __cxa_guard_release(&qword_2544DB4F0);
  }
  return byte_2544DB22C;
}

void sub_24B9EC800(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB4F0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::requireVinylManagerInd(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB4F8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB4F8);
    if ((_DWORD)v3)
    {
      byte_2544DB22D = capabilities::ct::sRequireVinylManagerInd(v3);
      __cxa_guard_release(&qword_2544DB4F8);
    }
  }
  return byte_2544DB22D;
}

void sub_24B9EC874(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB4F8);
  _Unwind_Resume(a1);
}

BOOL capabilities::ct::sRequireVinylManagerInd(capabilities::ct *this)
{
  int Product;

  Product = TelephonyRadiosGetProduct();
  return (Product - 52) <= 0x15 && ((1 << (Product - 52)) & 0x200003) != 0
      || (Product - 0x8000) < 3;
}

uint64_t capabilities::ct::shouldEnableDesense(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB500);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB500);
    if ((_DWORD)v3)
    {
      byte_2544DB22E = capabilities::ct::sShouldEnableDesense(v3);
      __cxa_guard_release(&qword_2544DB500);
    }
  }
  return byte_2544DB22E;
}

void sub_24B9EC930(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB500);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sShouldEnableDesense(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 52:
    case 53:
    case 60:
    case 61:
    case 65:
    case 66:
    case 67:
    case 73:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 122:
    case 123:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 136:
    case 139:
    case 140:
    case 141:
    case 153:
    case 154:
    case 155:
    case 203:
    case 209:
    case 211:
      return v1;
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 62:
    case 63:
    case 64:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 85:
    case 86:
    case 98:
    case 113:
    case 121:
    case 125:
    case 126:
    case 132:
    case 133:
    case 134:
    case 135:
    case 137:
    case 138:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 156:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 200:
    case 201:
    case 202:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 0x8000) >= 3)
LABEL_4:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::activationSIMInfoHardwareSlotBased(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB508);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB508);
    if ((_DWORD)v3)
    {
      byte_2544DB22F = capabilities::ct::sActivationSIMInfoHardwareSlotBased(v3);
      __cxa_guard_release(&qword_2544DB508);
    }
  }
  return byte_2544DB22F;
}

void sub_24B9ECA00(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB508);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sActivationSIMInfoHardwareSlotBased(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 52:
    case 53:
    case 60:
    case 61:
    case 65:
    case 66:
    case 67:
    case 73:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 118:
    case 119:
    case 122:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 139:
    case 140:
    case 141:
    case 153:
    case 154:
    case 155:
    case 203:
    case 209:
    case 211:
      return v1;
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 62:
    case 63:
    case 64:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 85:
    case 86:
    case 98:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 120:
    case 121:
    case 123:
    case 124:
    case 125:
    case 126:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 156:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 200:
    case 201:
    case 202:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 0x8000) >= 3)
LABEL_4:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::getRUIMDeprecationStrategy(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB510);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB510);
    if ((_DWORD)v3)
    {
      dword_2544DB2EC = capabilities::ct::sGetRUIMDeprecationStrategy(v3);
      __cxa_guard_release(&qword_2544DB510);
    }
  }
  return dword_2544DB2EC;
}

void sub_24B9ECAD0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB510);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sGetRUIMDeprecationStrategy(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 0;
  Product = TelephonyRadiosGetProduct();
  if (Product <= 72)
  {
    if (Product > 0x3D || ((1 << Product) & 0x3030000000000000) == 0)
      return 2;
  }
  else
  {
    switch(Product)
    {
      case 73:
      case 87:
      case 88:
      case 103:
      case 104:
      case 105:
      case 106:
      case 108:
      case 109:
      case 110:
      case 111:
      case 118:
      case 119:
      case 120:
      case 123:
      case 125:
      case 126:
      case 127:
      case 128:
      case 129:
      case 130:
      case 131:
      case 136:
      case 137:
      case 138:
      case 139:
      case 140:
      case 141:
      case 146:
      case 147:
      case 148:
      case 153:
      case 154:
      case 155:
      case 157:
      case 158:
      case 159:
        return v1;
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
      case 99:
      case 100:
      case 101:
      case 102:
      case 107:
      case 112:
      case 113:
      case 114:
      case 115:
      case 116:
      case 117:
      case 121:
      case 122:
      case 124:
      case 132:
      case 133:
      case 134:
      case 135:
      case 142:
      case 143:
      case 144:
      case 145:
      case 149:
      case 150:
      case 151:
      case 152:
      case 156:
        return 2;
      default:
        if (Product != 209 && Product != 211)
          return 2;
        break;
    }
  }
  return v1;
}

uint64_t capabilities::ct::getDeviceEvoType(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB518);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB518);
    if ((_DWORD)v3)
    {
      dword_2544DB2F0 = capabilities::ct::sGetDeviceEvoType(v3);
      __cxa_guard_release(&qword_2544DB518);
    }
  }
  return dword_2544DB2F0;
}

void sub_24B9ECBD0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB518);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sGetDeviceEvoType(capabilities::ct *this)
{
  unsigned int v1;

  v1 = TelephonyRadiosGetProduct() - 79;
  if (v1 > 0x85)
    return 0;
  else
    return dword_24BA00AC4[v1];
}

uint64_t capabilities::ct::supportsBB2GMitigation(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB520);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB520))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB230 = (Radio < 0x12) & (0x2FF8Cu >> Radio);
    __cxa_guard_release(&qword_2544DB520);
  }
  return byte_2544DB230;
}

void sub_24B9ECC90(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB520);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportedPDPContextCount(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB530);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB530);
    if ((_DWORD)v3)
    {
      qword_2544DB528 = capabilities::ct::sSupportedPDPContextCount(v3);
      __cxa_guard_release(&qword_2544DB530);
    }
  }
  return qword_2544DB528;
}

void sub_24B9ECD04(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB530);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportedPDPContextCount(capabilities::ct *this)
{
  int v1;
  uint64_t result;

  v1 = TelephonyRadiosGetProduct() - 52;
  result = 4;
  switch(v1)
  {
    case 0:
    case 1:
    case 21:
      return result;
    case 8:
    case 9:
    case 35:
    case 36:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 56:
    case 57:
    case 58:
    case 59:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 71:
    case 72:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 84:
    case 87:
    case 88:
    case 89:
    case 101:
    case 102:
    case 103:
    case 157:
    case 159:
      result = 6;
      break;
    case 27:
    case 28:
    case 29:
    case 32:
    case 39:
    case 40:
    case 41:
    case 45:
    case 151:
      result = 8;
      break;
    case 30:
    case 31:
    case 37:
    case 38:
    case 42:
    case 43:
    case 44:
    case 55:
    case 60:
    case 70:
      result = 5;
      break;
    case 73:
    case 74:
    case 80:
    case 81:
    case 82:
    case 83:
    case 85:
    case 86:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 104:
    case 105:
    case 106:
    case 107:
    case 148:
    case 149:
    case 150:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 160:
      result = 10;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::ct::hardwareRequiresOMADM(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB538);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB538))
  {
    byte_2544DB231 = (TelephonyRadiosGetRadio() & 0xFFFFFFFE) == 2;
    __cxa_guard_release(&qword_2544DB538);
  }
  return byte_2544DB231;
}

void sub_24B9ECDF8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB538);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsDataSystemDetermination(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB540);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB540))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB232 = (Radio < 0x12) & (0x23E08u >> Radio);
    __cxa_guard_release(&qword_2544DB540);
  }
  return byte_2544DB232;
}

void sub_24B9ECE84(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB540);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supports2StepDataCallBringUp(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB548);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB548))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB233 = (Radio < 0x12) & (0x23E08u >> Radio);
    __cxa_guard_release(&qword_2544DB548);
  }
  return byte_2544DB233;
}

void sub_24B9ECF10(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB548);
  _Unwind_Resume(a1);
}

void capabilities::ct::SARValue(std::string *a1@<X8>)
{
  unsigned __int8 v3;
  capabilities::ct *v4;

  v3 = atomic_load((unsigned __int8 *)&qword_2544DB550);
  if ((v3 & 1) == 0)
  {
    v4 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB550);
    if ((_DWORD)v4)
    {
      capabilities::ct::sSARValue(v4);
      __cxa_atexit(MEMORY[0x24BEDACF0], &xmmword_2544DB9F8, &dword_24B9DC000);
      __cxa_guard_release(&qword_2544DB550);
    }
  }
  if (byte_2544DBA0F < 0)
  {
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)xmmword_2544DB9F8, *((std::string::size_type *)&xmmword_2544DB9F8 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_2544DB9F8;
    a1->__r_.__value_.__r.__words[2] = unk_2544DBA08;
  }
}

void sub_24B9ECFD0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB550);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSARValue(capabilities::ct *this)
{
  __int128 *v1;
  uint64_t result;
  const char *v3;
  const char *v4;

  v1 = &xmmword_2544DB9F8;
  memset(&xmmword_2544DB9F8, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_2544DB9F8, (char *)&unk_24BA0187D);
  result = TelephonyRadiosGetProduct();
  switch((int)result)
  {
    case 60:
    case 61:
      if (byte_2544DBA0F < 0)
      {
        *((_QWORD *)&xmmword_2544DB9F8 + 1) = 12;
        v1 = (__int128 *)xmmword_2544DB9F8;
      }
      else
      {
        byte_2544DBA0F = 12;
      }
      *((_DWORD *)v1 + 2) = 694628648;
      v3 = "0.8 W/Kg(1g)";
      goto LABEL_8;
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 146:
    case 147:
    case 148:
      goto LABEL_16;
    case 79:
    case 80:
    case 81:
    case 84:
    case 92:
    case 93:
    case 99:
    case 100:
    case 101:
    case 102:
    case 114:
    case 115:
    case 116:
    case 117:
    case 124:
    case 132:
    case 133:
    case 134:
    case 135:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
      goto LABEL_2;
    case 87:
    case 88:
    case 103:
    case 104:
    case 105:
    case 106:
    case 118:
    case 119:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
      if (byte_2544DBA0F < 0)
      {
        *((_QWORD *)&xmmword_2544DB9F8 + 1) = 13;
        v1 = (__int128 *)xmmword_2544DB9F8;
      }
      else
      {
        byte_2544DBA0F = 13;
      }
      v4 = "0.99 W/Kg(1g)";
      goto LABEL_11;
    case 91:
      if (byte_2544DBA0F < 0)
      {
        *((_QWORD *)&xmmword_2544DB9F8 + 1) = 13;
        v1 = (__int128 *)xmmword_2544DB9F8;
      }
      else
      {
        byte_2544DBA0F = 13;
      }
      v4 = "1.18 W/Kg(1g)";
      goto LABEL_11;
    case 97:
      if (byte_2544DBA0F < 0)
      {
        *((_QWORD *)&xmmword_2544DB9F8 + 1) = 13;
        v1 = (__int128 *)xmmword_2544DB9F8;
      }
      else
      {
        byte_2544DBA0F = 13;
      }
      v4 = "1.15 W/Kg(1g)";
LABEL_11:
      *(_QWORD *)v1 = *(_QWORD *)v4;
      *(_QWORD *)((char *)v1 + 5) = *(_QWORD *)(v4 + 5);
      v1 = (__int128 *)((char *)v1 + 13);
      break;
    default:
      if ((_DWORD)result == 212)
      {
LABEL_2:
        if (byte_2544DBA0F < 0)
        {
          *((_QWORD *)&xmmword_2544DB9F8 + 1) = 12;
          v1 = (__int128 *)xmmword_2544DB9F8;
        }
        else
        {
          byte_2544DBA0F = 12;
        }
        *((_DWORD *)v1 + 2) = 694628648;
        v3 = "1.2 W/Kg(1g)";
LABEL_8:
        *(_QWORD *)v1 = *(_QWORD *)v3;
        v1 = (__int128 *)((char *)v1 + 12);
      }
      else
      {
LABEL_16:
        if (byte_2544DBA0F < 0)
        {
          *((_QWORD *)&xmmword_2544DB9F8 + 1) = 0;
          v1 = (__int128 *)xmmword_2544DB9F8;
        }
        else
        {
          byte_2544DBA0F = 0;
        }
      }
      break;
  }
  *(_BYTE *)v1 = 0;
  return result;
}

void sub_24B9ED198(_Unwind_Exception *exception_object)
{
  if (byte_2544DBA0F < 0)
    operator delete((void *)xmmword_2544DB9F8);
  _Unwind_Resume(exception_object);
}

uint64_t capabilities::ct::supportsVoLTE(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB558);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB558);
    if ((_DWORD)v3)
    {
      byte_2544DB234 = capabilities::ct::sSupportsVoLTE(v3);
      __cxa_guard_release(&qword_2544DB558);
    }
  }
  return byte_2544DB234;
}

void sub_24B9ED218(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB558);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsVoLTE(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 200:
    case 202:
    case 203:
    case 207:
    case 209:
    case 211:
    case 212:
      return v1;
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 201:
    case 204:
    case 205:
    case 206:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 60) >= 2)
LABEL_4:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::getDefaultEmergencyNumberList(capabilities::ct *this)
{
  unsigned __int8 v1;
  int Radio;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB560);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB560))
  {
    Radio = TelephonyRadiosGetRadio();
    v4 = 2 * (Radio == 16);
    if (Radio == 4)
      v4 = 1;
    dword_2544DB2F4 = v4;
    __cxa_guard_release(&qword_2544DB560);
  }
  return dword_2544DB2F4;
}

void sub_24B9ED2FC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB560);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsBasebandVoiceLinkQualityNotification(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB568);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB568);
    if ((_DWORD)v3)
    {
      byte_2544DB235 = capabilities::ct::sSupportsBasebandVoiceLinkQualityNotification(v3);
      __cxa_guard_release(&qword_2544DB568);
    }
  }
  return byte_2544DB235;
}

void sub_24B9ED370(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB568);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsBasebandVoiceLinkQualityNotification(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 200:
    case 202:
    case 203:
    case 207:
    case 209:
    case 211:
    case 212:
      return v1;
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 201:
    case 204:
    case 205:
    case 206:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 60) >= 2)
LABEL_4:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsBasebandAddressFormationNotification(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB570);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB570);
    if ((_DWORD)v3)
    {
      byte_2544DB236 = capabilities::ct::sSupportsBasebandAddressFormationNotification(v3);
      __cxa_guard_release(&qword_2544DB570);
    }
  }
  return byte_2544DB236;
}

void sub_24B9ED440(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB570);
  _Unwind_Resume(a1);
}

BOOL capabilities::ct::sSupportsBasebandAddressFormationNotification(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if (((Product - 79) > 0x3E || ((1 << (Product - 79)) & 0x701F01800F047327) == 0)
    && ((Product - 153) > 0x3A || ((1 << (Product + 103)) & 0x5FF80000000000FLL) == 0))
  {
    return (Product - 60) < 2;
  }
  return v1;
}

uint64_t capabilities::ct::supportsCMASCampOnlyMode(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB578);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB578);
    if ((_DWORD)v3)
    {
      byte_2544DB237 = capabilities::ct::sSupportsCMASCampOnlyMode(v3);
      __cxa_guard_release(&qword_2544DB578);
    }
  }
  return byte_2544DB237;
}

void sub_24B9ED538(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB578);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsCMASCampOnlyMode(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 120:
    case 121:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 155:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 201:
    case 203:
    case 204:
    case 205:
    case 206:
    case 208:
    case 210:
    case 211:
    case 212:
      goto LABEL_2;
    case 87:
    case 88:
    case 103:
    case 104:
    case 105:
    case 106:
    case 118:
    case 119:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 139:
    case 140:
    case 141:
    case 153:
    case 154:
    case 156:
    case 200:
    case 202:
    case 207:
    case 209:
      return v1;
    default:
      if ((Product - 60) >= 2)
LABEL_2:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::shouldAWDWakeAP(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB590);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB590);
    if ((_DWORD)v3)
    {
      byte_2544DB238 = capabilities::ct::sShouldAWDWakeAP(v3);
      __cxa_guard_release(&qword_2544DB590);
    }
  }
  return byte_2544DB238;
}

void sub_24B9ED608(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB590);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sShouldAWDWakeAP(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 200:
    case 202:
    case 203:
    case 207:
    case 209:
    case 211:
    case 212:
      return v1;
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 201:
    case 204:
    case 205:
    case 206:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 60) >= 2)
LABEL_4:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsOnlineModeDueToUserPowerCycle(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB598);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB598);
    if ((_DWORD)v3)
    {
      byte_2544DB239 = capabilities::ct::sSupportsOnlineModeDueToUserPowerCycle(v3);
      __cxa_guard_release(&qword_2544DB598);
    }
  }
  return byte_2544DB239;
}

void sub_24B9ED6D8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB598);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsOnlineModeDueToUserPowerCycle(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 120:
    case 121:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 156:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 200:
    case 201:
    case 202:
    case 203:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 210:
    case 212:
      goto LABEL_2;
    case 87:
    case 88:
    case 103:
    case 104:
    case 105:
    case 106:
    case 118:
    case 119:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 139:
    case 140:
    case 141:
    case 153:
    case 154:
    case 155:
    case 209:
    case 211:
      return v1;
    default:
      if ((Product - 60) >= 2)
LABEL_2:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsEnhancedLQMLinkPowerCost(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB5A0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB5A0);
    if ((_DWORD)v3)
    {
      byte_2544DB23A = capabilities::ct::sSupportsEnhancedLQMLinkPowerCost(v3);
      __cxa_guard_release(&qword_2544DB5A0);
    }
  }
  return byte_2544DB23A;
}

void sub_24B9ED7A8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB5A0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsEnhancedLQMLinkPowerCost(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 200:
    case 202:
    case 203:
    case 207:
    case 209:
    case 211:
    case 212:
      return v1;
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 201:
    case 204:
    case 205:
    case 206:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 60) >= 2)
LABEL_4:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsBIPController(capabilities::ct *this)
{
  unsigned __int8 v1;
  int Radio;
  BOOL v5;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB5A8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB5A8))
  {
    Radio = TelephonyRadiosGetRadio();
    v5 = Radio == 4 || Radio == 16;
    byte_2544DB23B = v5;
    __cxa_guard_release(&qword_2544DB5A8);
  }
  return byte_2544DB23B;
}

void sub_24B9ED884(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB5A8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsEcoDataMode(capabilities::ct *this)
{
  unsigned __int8 v1;
  int Radio;
  BOOL v5;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB5B0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB5B0))
  {
    Radio = TelephonyRadiosGetRadio();
    v5 = Radio == 4 || Radio == 16;
    byte_2544DB23C = v5;
    __cxa_guard_release(&qword_2544DB5B0);
  }
  return byte_2544DB23C;
}

void sub_24B9ED904(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB5B0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsOTABundleUpdateDemoModeOnly(capabilities::ct *this)
{
  unsigned __int8 v1;
  int Radio;
  BOOL v5;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB5B8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB5B8))
  {
    Radio = TelephonyRadiosGetRadio();
    v5 = Radio == 4 || Radio == 16;
    byte_2544DB23D = v5;
    __cxa_guard_release(&qword_2544DB5B8);
  }
  return byte_2544DB23D;
}

void sub_24B9ED984(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB5B8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::shouldUseLastPDPsForHighPriorityMedia(capabilities::ct *this)
{
  unsigned __int8 v1;
  int Radio;
  BOOL v5;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB5C0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB5C0))
  {
    Radio = TelephonyRadiosGetRadio();
    v5 = Radio == 4 || Radio == 16;
    byte_2544DB23E = v5;
    __cxa_guard_release(&qword_2544DB5C0);
  }
  return byte_2544DB23E;
}

void sub_24B9EDA04(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB5C0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsNormalEmergencySetup(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB5C8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB5C8);
    if ((_DWORD)v3)
    {
      byte_2544DB23F = capabilities::ct::sSupportsBasebandAddressFormationNotification(v3);
      __cxa_guard_release(&qword_2544DB5C8);
    }
  }
  return byte_2544DB23F;
}

void sub_24B9EDA78(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB5C8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsSetVoLTEAudioCodec(capabilities::ct *this)
{
  unsigned __int8 v1;
  int Radio;
  BOOL v5;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB5D0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB5D0))
  {
    Radio = TelephonyRadiosGetRadio();
    v5 = Radio == 4 || Radio == 16;
    byte_2544DB240 = v5;
    __cxa_guard_release(&qword_2544DB5D0);
  }
  return byte_2544DB240;
}

void sub_24B9EDAF8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB5D0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsSilenceAssertion(capabilities::ct *this)
{
  unsigned __int8 v1;
  int Radio;
  BOOL v5;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB5D8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB5D8))
  {
    Radio = TelephonyRadiosGetRadio();
    v5 = Radio == 4 || Radio == 16;
    byte_2544DB241 = v5;
    __cxa_guard_release(&qword_2544DB5D8);
  }
  return byte_2544DB241;
}

void sub_24B9EDB78(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB5D8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsFallbackToBrickAfterEmergency(capabilities::ct *this)
{
  unsigned __int8 v1;
  int Radio;
  BOOL v5;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB5E0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB5E0))
  {
    Radio = TelephonyRadiosGetRadio();
    v5 = Radio == 4 || Radio == 16;
    byte_2544DB242 = v5;
    __cxa_guard_release(&qword_2544DB5E0);
  }
  return byte_2544DB242;
}

void sub_24B9EDBF8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB5E0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsSignalStrengthOnIMSVoiceNetwork(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB5E8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB5E8);
    if ((_DWORD)v3)
    {
      byte_2544DB243 = capabilities::ct::sSupportsSignalStrengthOnIMSVoiceNetwork(v3);
      __cxa_guard_release(&qword_2544DB5E8);
    }
  }
  return byte_2544DB243;
}

void sub_24B9EDC6C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB5E8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsSignalStrengthOnIMSVoiceNetwork(capabilities::ct *this)
{
  int v1;
  uint64_t result;

  v1 = TelephonyRadiosGetProduct() - 60;
  result = 1;
  switch(v1)
  {
    case 0:
    case 1:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 52:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 62:
    case 64:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 151:
    case 152:
      return result;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::ct::supportsWidgetMode(capabilities::ct *this)
{
  unsigned __int8 v1;
  int Radio;
  BOOL v5;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB5F0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB5F0))
  {
    Radio = TelephonyRadiosGetRadio();
    v5 = Radio == 4 || Radio == 16;
    byte_2544DB244 = v5;
    __cxa_guard_release(&qword_2544DB5F0);
  }
  return byte_2544DB244;
}

void sub_24B9EDD30(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB5F0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsSTKSendIMSRegEvent(capabilities::ct *this)
{
  unsigned __int8 v1;
  int Radio;
  BOOL v5;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB5F8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB5F8))
  {
    Radio = TelephonyRadiosGetRadio();
    v5 = Radio == 4 || Radio == 16;
    byte_2544DB245 = v5;
    __cxa_guard_release(&qword_2544DB5F8);
  }
  return byte_2544DB245;
}

void sub_24B9EDDB0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB5F8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsBundleUpdateFromVinylInfo(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB600);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB600);
    if ((_DWORD)v3)
    {
      byte_2544DB246 = capabilities::ct::sSupportsBundleUpdateFromVinylInfo(v3);
      __cxa_guard_release(&qword_2544DB600);
    }
  }
  return byte_2544DB246;
}

void sub_24B9EDE24(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB600);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsBundleUpdateFromVinylInfo(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 200:
    case 202:
    case 203:
    case 207:
    case 209:
    case 211:
    case 212:
      return v1;
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 201:
    case 204:
    case 205:
    case 206:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 60) >= 2)
LABEL_4:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsNanoRegistryDevices(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB608);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB608);
    if ((_DWORD)v3)
    {
      byte_2544DB247 = capabilities::ct::sSupportsNanoRegistryDevices(v3);
      __cxa_guard_release(&qword_2544DB608);
    }
  }
  return byte_2544DB247;
}

void sub_24B9EDEF4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB608);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsNanoRegistryDevices(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 200:
    case 202:
    case 203:
    case 207:
    case 209:
    case 211:
    case 212:
      return v1;
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 201:
    case 204:
    case 205:
    case 206:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 60) >= 2)
LABEL_4:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsWEAGeofencing(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB610);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB610);
    if ((_DWORD)v3)
    {
      byte_2544DB248 = capabilities::ct::sSupportsWEAGeofencing(v3);
      __cxa_guard_release(&qword_2544DB610);
    }
  }
  return byte_2544DB248;
}

void sub_24B9EDFC4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB610);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsWEAGeofencing(capabilities::ct *this)
{
  int v1;
  uint64_t result;

  v1 = TelephonyRadiosGetProduct() - 60;
  result = 1;
  switch(v1)
  {
    case 0:
    case 1:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 52:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 62:
    case 64:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 151:
    case 152:
      return result;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::ct::sSupportsVoiceCall(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 200:
    case 202:
    case 203:
    case 207:
    case 209:
    case 211:
    case 212:
      return v1;
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 201:
    case 204:
    case 205:
    case 206:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 60) >= 2)
LABEL_4:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsMeadowMode(capabilities::ct *this)
{
  unsigned __int8 v1;
  int Radio;
  BOOL v5;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB620);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB620))
  {
    Radio = TelephonyRadiosGetRadio();
    v5 = Radio == 4 || Radio == 16;
    byte_2544DB24A = v5;
    __cxa_guard_release(&qword_2544DB620);
  }
  return byte_2544DB24A;
}

void sub_24B9EE0E4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB620);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsWakingEmergencyCellIndication(capabilities::ct *this)
{
  unsigned __int8 v1;
  int Radio;
  BOOL v5;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB628);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB628))
  {
    Radio = TelephonyRadiosGetRadio();
    v5 = Radio == 4 || Radio == 16;
    byte_2544DB24B = v5;
    __cxa_guard_release(&qword_2544DB628);
  }
  return byte_2544DB24B;
}

void sub_24B9EE164(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB628);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::requiresIMSFeatureMasking(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB630);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB630);
    if ((_DWORD)v3)
    {
      byte_2544DB24C = capabilities::ct::sRequiresIMSFeatureMasking(v3);
      __cxa_guard_release(&qword_2544DB630);
    }
  }
  return byte_2544DB24C;
}

void sub_24B9EE1D8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB630);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sRequiresIMSFeatureMasking(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 87:
    case 88:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 200:
    case 201:
    case 202:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 209:
    case 211:
    case 212:
      return v1;
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 203:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 60) >= 2)
LABEL_4:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsPhoneNumberRegistration(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB638);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB638);
    if ((_DWORD)v3)
    {
      byte_2544DB24D = capabilities::ct::sSupportsPhoneNumberRegistration(v3);
      __cxa_guard_release(&qword_2544DB638);
    }
  }
  return byte_2544DB24D;
}

void sub_24B9EE2A8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB638);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsPhoneNumberRegistration(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 200:
    case 202:
    case 203:
    case 207:
    case 209:
    case 211:
    case 212:
      return v1;
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 201:
    case 204:
    case 205:
    case 206:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 60) >= 2)
LABEL_4:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsHandoverPDN(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB640);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB640);
    if ((_DWORD)v3)
    {
      byte_2544DB24E = capabilities::ct::sSupportsHandoverPDN(v3);
      __cxa_guard_release(&qword_2544DB640);
    }
  }
  return byte_2544DB24E;
}

void sub_24B9EE378(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB640);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsHandoverPDN(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 200:
    case 202:
    case 203:
    case 207:
    case 209:
    case 211:
    case 212:
      return v1;
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 201:
    case 204:
    case 205:
    case 206:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 60) >= 2)
LABEL_4:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsSystemSelectionDataRoaming(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB648);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB648);
    if ((_DWORD)v3)
    {
      byte_2544DB24F = capabilities::ct::sSupportsSystemSelectionDataRoaming(v3);
      __cxa_guard_release(&qword_2544DB648);
    }
  }
  return byte_2544DB24F;
}

void sub_24B9EE448(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB648);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsSystemSelectionDataRoaming(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 60:
    case 61:
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
      return v1;
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
      goto LABEL_5;
    default:
      if ((Product - 203) > 9 || ((1 << (Product + 53)) & 0x341) == 0)
LABEL_5:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsBatterySaverMode(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB650);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB650);
    if ((_DWORD)v3)
    {
      byte_2544DB250 = capabilities::ct::sSupportsBatterySaverMode(v3);
      __cxa_guard_release(&qword_2544DB650);
    }
  }
  return byte_2544DB250;
}

void sub_24B9EE52C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB650);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsBatterySaverMode(capabilities::ct *this)
{
  int v1;
  uint64_t result;

  v1 = TelephonyRadiosGetProduct() - 60;
  result = 1;
  switch(v1)
  {
    case 0:
    case 1:
    case 19:
    case 20:
    case 21:
    case 24:
    case 27:
    case 28:
    case 31:
    case 32:
    case 33:
    case 37:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 48:
    case 49:
    case 50:
    case 51:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 151:
    case 152:
      return result;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::ct::supportsMidCallSRVCC(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB658);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB658);
    if ((_DWORD)v3)
    {
      byte_2544DB251 = capabilities::ct::sSupportsMidCallSRVCC(v3);
      __cxa_guard_release(&qword_2544DB658);
    }
  }
  return byte_2544DB251;
}

void sub_24B9EE5E4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB658);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsMidCallSRVCC(capabilities::ct *this)
{
  int v1;
  uint64_t result;

  v1 = TelephonyRadiosGetProduct() - 60;
  result = 1;
  switch(v1)
  {
    case 0:
    case 1:
    case 19:
    case 20:
    case 21:
    case 24:
    case 27:
    case 28:
    case 31:
    case 32:
    case 33:
    case 37:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 64:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 151:
    case 152:
      return result;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::ct::supportsP2PAsGizmo(capabilities::ct *this)
{
  unsigned __int8 v1;
  int Radio;
  BOOL v5;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB660);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB660))
  {
    Radio = TelephonyRadiosGetRadio();
    v5 = Radio == 4 || Radio == 16;
    byte_2544DB252 = v5;
    __cxa_guard_release(&qword_2544DB660);
  }
  return byte_2544DB252;
}

void sub_24B9EE6A8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB660);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::debugIsGizmoWithVinyl(capabilities::ct *this)
{
  unsigned __int8 v1;
  int Radio;
  BOOL v5;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB668);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB668))
  {
    Radio = TelephonyRadiosGetRadio();
    v5 = Radio == 4 || Radio == 16;
    byte_2544DB253 = v5;
    __cxa_guard_release(&qword_2544DB668);
  }
  return byte_2544DB253;
}

void sub_24B9EE728(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB668);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::dormancyWatchMode(capabilities::ct *this)
{
  unsigned __int8 v1;
  int Radio;
  BOOL v5;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB670);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB670))
  {
    Radio = TelephonyRadiosGetRadio();
    v5 = Radio == 4 || Radio == 16;
    byte_2544DB254 = v5;
    __cxa_guard_release(&qword_2544DB670);
  }
  return byte_2544DB254;
}

void sub_24B9EE7A8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB670);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsSIMProvisioningAsSignupDestination(capabilities::ct *this)
{
  unsigned __int8 v1;
  int Radio;
  BOOL v5;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB678);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB678))
  {
    Radio = TelephonyRadiosGetRadio();
    v5 = Radio == 4 || Radio == 16;
    byte_2544DB255 = v5;
    __cxa_guard_release(&qword_2544DB678);
  }
  return byte_2544DB255;
}

void sub_24B9EE828(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB678);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsPacketFilterCallType(capabilities::ct *this)
{
  unsigned __int8 v1;
  int Radio;
  BOOL v5;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB680);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB680))
  {
    Radio = TelephonyRadiosGetRadio();
    v5 = Radio == 4 || Radio == 16;
    byte_2544DB256 = v5;
    __cxa_guard_release(&qword_2544DB680);
  }
  return byte_2544DB256;
}

void sub_24B9EE8A8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB680);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::vinylOperationRequiresBasebandBoot(capabilities::ct *this)
{
  unsigned __int8 v1;
  int Radio;
  BOOL v5;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB690);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB690))
  {
    Radio = TelephonyRadiosGetRadio();
    v5 = Radio == 4 || Radio == 16;
    byte_2544DB258 = v5;
    __cxa_guard_release(&qword_2544DB690);
  }
  return byte_2544DB258;
}

void sub_24B9EE928(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB690);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsEmergencySoSOverCell(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB698);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB698);
    if ((_DWORD)v3)
    {
      byte_2544DB259 = capabilities::ct::sSupportsEmergencySoSOverCell(v3);
      __cxa_guard_release(&qword_2544DB698);
    }
  }
  return byte_2544DB259;
}

void sub_24B9EE99C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB698);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsEmergencySoSOverCell(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 200:
    case 202:
    case 203:
    case 207:
    case 209:
    case 211:
    case 212:
      return v1;
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 201:
    case 204:
    case 205:
    case 206:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 60) >= 2)
LABEL_4:
        v1 = 0;
      break;
  }
  return v1;
}

void capabilities::ct::getSupportedMTSMSTypes(_QWORD *a1@<X8>)
{
  unsigned __int8 v3;
  const void *v4;
  int64_t v5;
  char *v6;
  capabilities::ct *v7;

  v3 = atomic_load((unsigned __int8 *)&qword_2544DB6A0);
  if ((v3 & 1) == 0)
  {
    v7 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB6A0);
    if ((_DWORD)v7)
    {
      capabilities::ct::sGetSupportedMTSMSTypes(v7);
      __cxa_atexit((void (*)(void *))std::vector<capabilities::ct::SupportedMTSMSTypes>::~vector[abi:ne180100], &qword_2544DBA10, &dword_24B9DC000);
      __cxa_guard_release(&qword_2544DB6A0);
    }
  }
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v4 = (const void *)qword_2544DBA10;
  v5 = qword_2544DBA18 - qword_2544DBA10;
  if (qword_2544DBA18 != qword_2544DBA10)
  {
    std::vector<capabilities::ct::SupportedMessageMode>::__vallocate[abi:ne180100](a1, v5 >> 2);
    v6 = (char *)a1[1];
    memmove(v6, v4, v5);
    a1[1] = &v6[4 * (v5 >> 2)];
  }
}

void sub_24B9EEAD0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB6A0);
  _Unwind_Resume(a1);
}

char *capabilities::ct::sGetSupportedMTSMSTypes(capabilities::ct *this)
{
  _DWORD *v1;
  int Radio;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  qword_2544DBA18 = 0;
  qword_2544DBA20 = 0;
  qword_2544DBA10 = 0;
  v1 = operator new(4uLL);
  qword_2544DBA10 = (uint64_t)v1;
  *v1 = 0;
  qword_2544DBA18 = (uint64_t)(v1 + 1);
  qword_2544DBA20 = (uint64_t)(v1 + 1);
  Radio = TelephonyRadiosGetRadio();
  if (Radio == 4 || Radio == 16)
  {
    v4 = 0x100000002;
    return std::vector<capabilities::ct::SupportedMTSMSTypes>::__assign_with_size[abi:ne180100]<capabilities::ct::SupportedMTSMSTypes const*,capabilities::ct::SupportedMTSMSTypes const*>((char *)&v4, (uint64_t)&v5, 2uLL);
  }
  else
  {
    LODWORD(v4) = 0;
    return std::vector<capabilities::ct::SupportedMTSMSTypes>::__assign_with_size[abi:ne180100]<capabilities::ct::SupportedMTSMSTypes const*,capabilities::ct::SupportedMTSMSTypes const*>((char *)&v4, (uint64_t)&v4 + 4, 1uLL);
  }
}

void sub_24B9EEBC0(_Unwind_Exception *exception_object)
{
  if (qword_2544DBA10)
  {
    qword_2544DBA18 = qword_2544DBA10;
    operator delete((void *)qword_2544DBA10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<capabilities::ct::SupportedMTSMSTypes>::~vector[abi:ne180100](uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    *(_QWORD *)(a1 + 8) = v2;
    operator delete(v2);
  }
  return a1;
}

uint64_t capabilities::ct::getCardProvisioningStatusVersion(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB6A8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB6A8);
    if ((_DWORD)v3)
    {
      dword_2544DB2F8 = capabilities::ct::sGetCardProvisioningStatusVersion(v3);
      __cxa_guard_release(&qword_2544DB6A8);
    }
  }
  return dword_2544DB2F8;
}

void sub_24B9EEC78(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB6A8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sGetCardProvisioningStatusVersion(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 2;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 60:
    case 61:
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
      return v1;
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
      goto LABEL_5;
    default:
      if ((Product - 203) > 9 || ((1 << (Product + 53)) & 0x341) == 0)
LABEL_5:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::callManagerSearchRoundsMaxValue(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB6B8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB6B8))
  {
    v3 = TelephonyRadiosGetRadio() - 4;
    if (v3 > 0xD)
      v4 = 2;
    else
      v4 = qword_24BA00CE0[v3];
    qword_2544DB6B0 = v4;
    __cxa_guard_release(&qword_2544DB6B8);
  }
  return qword_2544DB6B0;
}

void sub_24B9EED78(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB6B8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsAudioLoggingUserConsent(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB6C0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB6C0);
    if ((_DWORD)v3)
    {
      byte_2544DB25A = capabilities::ct::sSupportsAudioLoggingUserConsent(v3);
      __cxa_guard_release(&qword_2544DB6C0);
    }
  }
  return byte_2544DB25A;
}

void sub_24B9EEDEC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB6C0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsAudioLoggingUserConsent(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 200:
    case 202:
    case 203:
    case 207:
    case 209:
    case 211:
    case 212:
      return v1;
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 201:
    case 204:
    case 205:
    case 206:
    case 208:
    case 210:
      goto LABEL_5;
    default:
      if ((Product - 60) >= 2 && (Product - 0x8000) >= 2)
LABEL_5:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsLazuli(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB6C8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB6C8);
    if ((_DWORD)v3)
    {
      byte_2544DB25B = capabilities::ct::sSupportsLazuli(v3);
      __cxa_guard_release(&qword_2544DB6C8);
    }
  }
  return byte_2544DB25B;
}

void sub_24B9EEEC8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB6C8);
  _Unwind_Resume(a1);
}

BOOL capabilities::ct::sSupportsLazuli(capabilities::ct *this)
{
  int Product;

  Product = TelephonyRadiosGetProduct();
  return (Product - 84) <= 0x3D && ((1 << (Product - 84)) & 0x3C0F0103C007A381) != 0
      || (Product - 149) <= 0x3F
      && ((1 << (Product + 107)) & 0x8FF800000000008FLL) != 0
      || (Product - 79) < 3;
}

uint64_t capabilities::ct::integratedPDPStatisticsInterval(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB6D8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB6D8))
  {
    v3 = TelephonyRadiosGetRadio() - 4;
    if (v3 > 0xD)
      v4 = 0;
    else
      v4 = qword_24BA00D50[v3];
    qword_2544DB6D0 = v4;
    __cxa_guard_release(&qword_2544DB6D8);
  }
  return qword_2544DB6D0;
}

void sub_24B9EEFD4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB6D8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::getProvisioningProfileSupport(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB6E0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB6E0);
    if ((_DWORD)v3)
    {
      dword_2544DB2FC = capabilities::ct::sGetProvisioningProfileSupport(v3);
      __cxa_guard_release(&qword_2544DB6E0);
    }
  }
  return dword_2544DB2FC;
}

void sub_24B9EF048(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB6E0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sGetProvisioningProfileSupport(capabilities::ct *this)
{
  int v1;
  uint64_t result;

  v1 = TelephonyRadiosGetProduct() - 73;
  result = 2;
  switch(v1)
  {
    case 0:
      return result;
    case 9:
    case 10:
    case 16:
    case 17:
    case 21:
    case 22:
    case 23:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 47:
    case 49:
    case 50:
    case 52:
    case 53:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 83:
    case 84:
    case 85:
    case 86:
      result = 1;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

BOOL capabilities::ct::sDataOnlySingleSIMDevice(capabilities::ct *this)
{
  int Product;

  Product = TelephonyRadiosGetProduct();
  return (Product - 137) <= 0x16 && ((1 << (Product + 119)) & 0x700E03) != 0 || Product == 73;
}

uint64_t capabilities::ct::supportsWiFiEnhancedThroughput(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB6F0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB6F0);
    if ((_DWORD)v3)
    {
      byte_2544DB25D = capabilities::ct::sSupportsWiFiEnhancedThroughput(v3);
      __cxa_guard_release(&qword_2544DB6F0);
    }
  }
  return byte_2544DB25D;
}

void sub_24B9EF16C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB6F0);
  _Unwind_Resume(a1);
}

BOOL capabilities::ct::sSupportsWiFiEnhancedThroughput(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if (((Product - 84) > 0x3D || ((1 << (Product - 84)) & 0x3C0F0103C007A381) == 0)
    && ((Product - 149) > 0x3F || ((1 << (Product + 107)) & 0x846800000000008FLL) == 0))
  {
    return (Product - 79) < 3;
  }
  return v1;
}

uint64_t capabilities::ct::requiresIMSStatusUpdateInCSFB(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB6F8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB6F8);
    if ((_DWORD)v3)
    {
      byte_2544DB25E = capabilities::ct::sRequiresIMSStatusUpdateInCSFB(v3);
      __cxa_guard_release(&qword_2544DB6F8);
    }
  }
  return byte_2544DB25E;
}

void sub_24B9EF260(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB6F8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sRequiresIMSStatusUpdateInCSFB(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if (((Product - 156) > 0x34 || ((1 << (Product + 100)) & 0x1FF00000000001) == 0)
    && ((Product - 79) > 0x12 || ((1 << (Product - 79)) & 0x47027) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::ct::supportsNVRAMUpdateWithoutBasebandReboot(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB700);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB700);
    if ((_DWORD)v3)
    {
      byte_2544DB25F = capabilities::ct::sSupportsNVRAMUpdateWithoutBasebandReboot(v3);
      __cxa_guard_release(&qword_2544DB700);
    }
  }
  return byte_2544DB25F;
}

void sub_24B9EF348(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB700);
  _Unwind_Resume(a1);
}

BOOL capabilities::ct::sSupportsNVRAMUpdateWithoutBasebandReboot(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if (((Product - 84) > 0x3D || ((1 << (Product - 84)) & 0x3C0F0103C007A381) == 0)
    && ((Product - 149) > 0x3F || ((1 << (Product + 107)) & 0x8FF800000000008FLL) == 0))
  {
    return (Product - 79) < 3;
  }
  return v1;
}

uint64_t capabilities::ct::supportsDualPhysicalSIM(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB708);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB708);
    if ((_DWORD)v3)
    {
      byte_2544DB260 = capabilities::ct::sSupportsDualPhysicalSIM(v3);
      __cxa_guard_release(&qword_2544DB708);
    }
  }
  return byte_2544DB260;
}

void sub_24B9EF43C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB708);
  _Unwind_Resume(a1);
}

BOOL capabilities::ct::sSupportsDualPhysicalSIM(capabilities::ct *this)
{
  uint64_t v1;
  int Product;
  uint64_t v3;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  v3 = (Product - 84);
  if (v3 <= 0x3D)
  {
    if (((1 << (Product - 84)) & 0x3C0F0003C0070381) != 0)
      return v1;
    if (v3 == 13)
      return 0;
  }
  if ((Product - 149) > 0x3F || ((1 << (Product + 107)) & 0x8FF800000000008FLL) == 0)
    return (Product - 79) < 3;
  return v1;
}

uint64_t capabilities::ct::supportsSIMDetectionInterrupt(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB710);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB710);
    if ((_DWORD)v3)
    {
      byte_2544DB261 = capabilities::ct::sSupportsSIMDetectionInterrupt(v3);
      __cxa_guard_release(&qword_2544DB710);
    }
  }
  return byte_2544DB261;
}

void sub_24B9EF540(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB710);
  _Unwind_Resume(a1);
}

BOOL capabilities::ct::sSupportsSIMDetectionInterrupt(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if (((Product - 84) > 0x3D || ((1 << (Product - 84)) & 0x3C0F0103C007A381) == 0)
    && ((Product - 149) > 0x3F || ((1 << (Product + 107)) & 0x804000000000000FLL) == 0))
  {
    return (Product - 79) < 3;
  }
  return v1;
}

uint64_t capabilities::ct::supportsThumperSourcing(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB720);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB720);
    if ((_DWORD)v3)
    {
      byte_2544DB263 = capabilities::ct::sSupportsWiFiEnhancedThroughput(v3);
      __cxa_guard_release(&qword_2544DB720);
    }
  }
  return byte_2544DB263;
}

void sub_24B9EF634(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB720);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsActivationPushRegistration(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB728);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB728);
    if ((_DWORD)v3)
    {
      byte_2544DB264 = capabilities::ct::sSupportsActivationPushRegistration(v3);
      __cxa_guard_release(&qword_2544DB728);
    }
  }
  return byte_2544DB264;
}

void sub_24B9EF6A8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB728);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsActivationPushRegistration(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 114:
    case 115:
    case 116:
    case 117:
    case 124:
    case 132:
    case 133:
    case 134:
    case 135:
    case 137:
    case 138:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 156:
    case 157:
    case 158:
    case 159:
      return v1;
    case 82:
    case 83:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 118:
    case 119:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 136:
    case 139:
    case 140:
    case 141:
    case 153:
    case 154:
    case 155:
      goto LABEL_5;
    default:
      if ((Product - 200) > 0xC || ((1 << (Product + 56)) & 0x108D) == 0)
LABEL_5:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsBasebandPLMNPriorityList(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB730);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB730);
    if ((_DWORD)v3)
    {
      byte_2544DB265 = capabilities::ct::sSupportsWiFiEnhancedThroughput(v3);
      __cxa_guard_release(&qword_2544DB730);
    }
  }
  return byte_2544DB265;
}

void sub_24B9EF78C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB730);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsTEMS(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB738);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB738);
    if ((_DWORD)v3)
    {
      byte_2544DB266 = capabilities::ct::sSupportsWiFiEnhancedThroughput(v3);
      __cxa_guard_release(&qword_2544DB738);
    }
  }
  return byte_2544DB266;
}

void sub_24B9EF800(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB738);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::shouldSendWiFiCallStatus(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB740);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB740);
    if ((_DWORD)v3)
    {
      byte_2544DB267 = capabilities::ct::sSupportsWiFiEnhancedThroughput(v3);
      __cxa_guard_release(&qword_2544DB740);
    }
  }
  return byte_2544DB267;
}

void sub_24B9EF874(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB740);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsCellularPlanInfoInCloud(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB748);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB748);
    if ((_DWORD)v3)
    {
      byte_2544DB268 = capabilities::ct::sSupportsCellularPlanInfoInCloud(v3);
      __cxa_guard_release(&qword_2544DB748);
    }
  }
  return byte_2544DB268;
}

void sub_24B9EF8E8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB748);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsCellularPlanInfoInCloud(capabilities::ct *this)
{
  int v1;
  uint64_t result;

  v1 = TelephonyRadiosGetProduct() - 79;
  result = 1;
  switch(v1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 20:
    case 21:
    case 22:
    case 23:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 35:
    case 36:
    case 37:
    case 38:
    case 41:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 77:
    case 78:
    case 79:
    case 80:
    case 121:
    case 123:
    case 124:
    case 128:
    case 133:
      return result;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::ct::supportsQualityIndication(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB750);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB750);
    if ((_DWORD)v3)
    {
      byte_2544DB269 = capabilities::ct::sSupportsWiFiEnhancedThroughput(v3);
      __cxa_guard_release(&qword_2544DB750);
    }
  }
  return byte_2544DB269;
}

void sub_24B9EF9A0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB750);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsAudioPolicyForTopAntenna(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB758);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB758);
    if ((_DWORD)v3)
    {
      byte_2544DB26A = capabilities::ct::sSupportsWiFiEnhancedThroughput(v3);
      __cxa_guard_release(&qword_2544DB758);
    }
  }
  return byte_2544DB26A;
}

void sub_24B9EFA14(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB758);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsAudioPolicyForBottomAntenna(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB760);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB760);
    if ((_DWORD)v3)
    {
      byte_2544DB26B = capabilities::ct::sSupportsWiFiEnhancedThroughput(v3);
      __cxa_guard_release(&qword_2544DB760);
    }
  }
  return byte_2544DB26B;
}

void sub_24B9EFA88(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB760);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::getAntennaSwitchCommandType(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB768);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB768);
    if ((_DWORD)v3)
    {
      dword_2544DB300 = capabilities::ct::sGetAntennaSwitchCommandType(v3);
      __cxa_guard_release(&qword_2544DB768);
    }
  }
  return dword_2544DB300;
}

void sub_24B9EFAFC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB768);
  _Unwind_Resume(a1);
}

BOOL capabilities::ct::sGetAntennaSwitchCommandType(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 0;
  Product = TelephonyRadiosGetProduct();
  if (((Product - 84) > 0x3D || ((1 << (Product - 84)) & 0x3C0F0103C007A381) == 0)
    && ((Product - 149) > 0x3F || ((1 << (Product + 107)) & 0x846800000000008FLL) == 0))
  {
    return (Product - 79) >= 3;
  }
  return v1;
}

uint64_t capabilities::ct::supportsP2PAsPhone(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB770);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB770);
    if ((_DWORD)v3)
    {
      byte_2544DB26C = capabilities::ct::sSupportsWiFiEnhancedThroughput(v3);
      __cxa_guard_release(&qword_2544DB770);
    }
  }
  return byte_2544DB26C;
}

void sub_24B9EFBF4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB770);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsRemoteCellularPlan(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB778);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB778);
    if ((_DWORD)v3)
    {
      byte_2544DB26D = capabilities::ct::sSupportsWiFiEnhancedThroughput(v3);
      __cxa_guard_release(&qword_2544DB778);
    }
  }
  return byte_2544DB26D;
}

void sub_24B9EFC68(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB778);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsSIMProvisioningAsSignupSource(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB780);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB780);
    if ((_DWORD)v3)
    {
      byte_2544DB26E = capabilities::ct::sSupportsWiFiEnhancedThroughput(v3);
      __cxa_guard_release(&qword_2544DB780);
    }
  }
  return byte_2544DB26E;
}

void sub_24B9EFCDC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB780);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::tempUpdateAudioCatWhenSubSwitch(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB788);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB788))
  {
    byte_2544DB26F = TelephonyRadiosGetRadio() - 7 < 3;
    __cxa_guard_release(&qword_2544DB788);
  }
  return byte_2544DB26F;
}

void sub_24B9EFD5C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB788);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsRegisteredIDSService(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB790);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB790))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB270 = (Radio < 0x12) & (0x2FF80u >> Radio);
    __cxa_guard_release(&qword_2544DB790);
  }
  return byte_2544DB270;
}

void sub_24B9EFDE8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB790);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsEnhancedLQMDataStall(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB798);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB798))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB271 = (Radio < 0x12) & (0x2FF80u >> Radio);
    __cxa_guard_release(&qword_2544DB798);
  }
  return byte_2544DB271;
}

void sub_24B9EFE74(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB798);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsECDSASignatures(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB7A8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB7A8))
  {
    byte_2544DB273 = TelephonyRadiosGetRadio() - 7 < 0xB;
    __cxa_guard_release(&qword_2544DB7A8);
  }
  return byte_2544DB273;
}

void sub_24B9EFEF4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB7A8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsSMSIMSStack(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB7B0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB7B0);
    if ((_DWORD)v3)
    {
      byte_2544DB274 = capabilities::ct::sSupportsSMSIMSStack(v3);
      __cxa_guard_release(&qword_2544DB7B0);
    }
  }
  return byte_2544DB274;
}

void sub_24B9EFF68(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB7B0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsSMSIMSStack(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if (((Product - 82) > 0x38 || ((1 << (Product - 82)) & 0x1C01B407E007183) == 0)
    && ((Product - 146) > 0xD || ((1 << (Product + 110)) & 0x3807) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::ct::supportsDataPlanNotifications(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB7C0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB7C0);
    if ((_DWORD)v3)
    {
      byte_2544DB276 = capabilities::ct::sSupportsSMSIMSStack(v3);
      __cxa_guard_release(&qword_2544DB7C0);
    }
  }
  return byte_2544DB276;
}

void sub_24B9F0054(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB7C0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsSIMTransferWithSecureIntent(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB7C8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB7C8);
    if ((_DWORD)v3)
    {
      byte_2544DB277 = capabilities::ct::sSupportsSIMTransferWithSecureIntent(v3);
      __cxa_guard_release(&qword_2544DB7C8);
    }
  }
  return byte_2544DB277;
}

void sub_24B9F00C8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB7C8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsSIMTransferWithSecureIntent(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 91:
    case 92:
    case 93:
    case 95:
    case 96:
    case 99:
    case 100:
    case 101:
    case 102:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 114:
    case 115:
    case 116:
    case 117:
    case 120:
    case 123:
    case 124:
    case 125:
    case 126:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 156:
    case 157:
    case 158:
    case 159:
      return v1;
    case 94:
    case 97:
    case 98:
    case 103:
    case 104:
    case 105:
    case 106:
    case 112:
    case 113:
    case 118:
    case 119:
    case 121:
    case 122:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 139:
    case 140:
    case 141:
    case 153:
    case 154:
    case 155:
      goto LABEL_4;
    default:
      if (Product != 212)
LABEL_4:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsSecurityStatus(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB7D0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB7D0);
    if ((_DWORD)v3)
    {
      byte_2544DB278 = capabilities::ct::sSupportsSecurityStatus(v3);
      __cxa_guard_release(&qword_2544DB7D0);
    }
  }
  return byte_2544DB278;
}

void sub_24B9F0194(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB7D0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsSecurityStatus(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if (((Product - 156) > 0x34 || ((1 << (Product + 100)) & 0x1FF00000000001) == 0)
    && ((Product - 91) > 6 || ((1 << (Product - 91)) & 0x47) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::ct::nonPrimaryDLServingCellBandwidthMaxValue(capabilities::ct *this)
{
  unsigned __int8 v1;
  int Product;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB7E0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB7E0))
  {
    Product = TelephonyRadiosGetProduct();
    v4 = 0xFFFFFFFFLL;
    if ((Product - 95) < 2)
      v4 = 5000000;
    qword_2544DB7D8 = v4;
    __cxa_guard_release(&qword_2544DB7E0);
  }
  return qword_2544DB7D8;
}

void sub_24B9F0288(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB7E0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsMultiClientDesense(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB7E8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB7E8);
    if ((_DWORD)v3)
    {
      byte_2544DB279 = capabilities::ct::sSupportsMultiClientDesense(v3);
      __cxa_guard_release(&qword_2544DB7E8);
    }
  }
  return byte_2544DB279;
}

void sub_24B9F02FC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB7E8);
  _Unwind_Resume(a1);
}

BOOL capabilities::ct::sSupportsMultiClientDesense(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if ((Product - 120) > 0x27 || ((1 << (Product - 120)) & 0xE01C070069) == 0)
    return (Product - 95) < 2;
  return v1;
}

uint64_t capabilities::ct::supportsDisableICCIDCommand(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB7F0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB7F0))
  {
    byte_2544DB27A = TelephonyRadiosGetProduct() - 99 < 4;
    __cxa_guard_release(&qword_2544DB7F0);
  }
  return byte_2544DB27A;
}

void sub_24B9F03D8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB7F0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsCompleteCleanupOnFilePushFailure(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB7F8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB7F8);
    if ((_DWORD)v3)
    {
      byte_2544DB27B = capabilities::ct::sSupportsCompleteCleanupOnFilePushFailure(v3);
      __cxa_guard_release(&qword_2544DB7F8);
    }
  }
  return byte_2544DB27B;
}

void sub_24B9F044C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB7F8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsCompleteCleanupOnFilePushFailure(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if (((Product - 99) > 0x39 || ((1 << (Product - 99)) & 0x23C781E0207800FLL) == 0)
    && ((Product - 200) > 0xC || ((1 << (Product + 56)) & 0x11F7) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::ct::supportsEmergencyQMIExtensions(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB800);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB800);
    if ((_DWORD)v3)
    {
      byte_2544DB27C = capabilities::ct::sSupportsEmergencyQMIExtensions(v3);
      __cxa_guard_release(&qword_2544DB800);
    }
  }
  return byte_2544DB27C;
}

void sub_24B9F0538(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB800);
  _Unwind_Resume(a1);
}

BOOL capabilities::ct::sSupportsEmergencyQMIExtensions(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if ((Product - 99) > 0x35 || ((1 << (Product - 99)) & 0x3C781E0207800FLL) == 0)
    return Product == 212;
  return v1;
}

uint64_t capabilities::ct::supportsSIMAPNSingleFile(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB808);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB808);
    if ((_DWORD)v3)
    {
      byte_2544DB27D = capabilities::ct::sSupportsEmergencyQMIExtensions(v3);
      __cxa_guard_release(&qword_2544DB808);
    }
  }
  return byte_2544DB27D;
}

void sub_24B9F0608(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB808);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsPrivateNetwork(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB810);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB810);
    if ((_DWORD)v3)
    {
      byte_2544DB27E = capabilities::ct::sSupportsPrivateNetwork(v3);
      __cxa_guard_release(&qword_2544DB810);
    }
  }
  return byte_2544DB27E;
}

void sub_24B9F067C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB810);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsPrivateNetwork(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 114:
    case 115:
    case 116:
    case 117:
    case 120:
    case 123:
    case 124:
    case 125:
    case 126:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 156:
    case 157:
    case 158:
    case 159:
    case 200:
    case 201:
    case 202:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 212:
      return v1;
    case 118:
    case 119:
    case 121:
    case 122:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 139:
    case 140:
    case 141:
    case 153:
    case 154:
    case 155:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 203:
    case 209:
    case 210:
    case 211:
      goto LABEL_4;
    default:
      if ((Product - 99) >= 4)
LABEL_4:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsForceUserConfirmationForSTKCalls(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB818);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB818);
    if ((_DWORD)v3)
    {
      byte_2544DB27F = capabilities::ct::sSupportsEmergencyQMIExtensions(v3);
      __cxa_guard_release(&qword_2544DB818);
    }
  }
  return byte_2544DB27F;
}

void sub_24B9F074C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB818);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsVoicemailIndicationInCS(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB820);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB820);
    if ((_DWORD)v3)
    {
      byte_2544DB280 = capabilities::ct::sSupportsCompleteCleanupOnFilePushFailure(v3);
      __cxa_guard_release(&qword_2544DB820);
    }
  }
  return byte_2544DB280;
}

void sub_24B9F07C0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB820);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsXcapForUncertifiedCarriers(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB828);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB828);
    if ((_DWORD)v3)
    {
      byte_2544DB281 = capabilities::ct::sSupportsXcapForUncertifiedCarriers(v3);
      __cxa_guard_release(&qword_2544DB828);
    }
  }
  return byte_2544DB281;
}

void sub_24B9F0834(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB828);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsXcapForUncertifiedCarriers(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if (((Product - 99) > 0x39 || ((1 << (Product - 99)) & 0x23C781E0207800FLL) == 0)
    && ((Product - 200) > 0xC || ((1 << (Product + 56)) & 0x1085) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::ct::supportsReportingTetheringStateToBaseband(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB840);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB840))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB284 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_2544DB840);
  }
  return byte_2544DB284;
}

void sub_24B9F0938(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB840);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsSIMMomentaryPowerDown(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB848);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB848))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB285 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_2544DB848);
  }
  return byte_2544DB285;
}

void sub_24B9F09C4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB848);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsDisableLPANR(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB850);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB850))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB286 = (Radio < 0x12) & (0x2FE00u >> Radio);
    __cxa_guard_release(&qword_2544DB850);
  }
  return byte_2544DB286;
}

void sub_24B9F0A50(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB850);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsCerberus(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB858);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB858);
    if ((_DWORD)v3)
    {
      byte_2544DB287 = capabilities::ct::sSupportsCerberus(v3);
      __cxa_guard_release(&qword_2544DB858);
    }
  }
  return byte_2544DB287;
}

void sub_24B9F0AC4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB858);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsCerberus(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if (((Product - 99) > 0x3C || ((1 << (Product - 99)) & 0x1E3FF8FE0F279E0FLL) == 0)
    && ((Product - 200) > 0xC || ((1 << (Product + 56)) & 0x1085) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::ct::supportsHydra(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB860);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB860);
    if ((_DWORD)v3)
    {
      byte_2544DB288 = capabilities::ct::sSupportsHydra(v3);
      __cxa_guard_release(&qword_2544DB860);
    }
  }
  return byte_2544DB288;
}

void sub_24B9F0BB0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB860);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsHydra(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if (((Product - 114) > 0x2A || ((1 << (Product - 114)) & 0x478F03C040FLL) == 0)
    && ((Product - 200) > 0xC || ((1 << (Product + 56)) & 0x11F7) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::ct::sSupportsVoNR(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if (((Product - 114) > 0x2A || ((1 << (Product - 114)) & 0x678F03C040FLL) == 0)
    && ((Product - 200) > 0xC || ((1 << (Product + 56)) & 0x19F7) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::ct::supportsPCOOptions(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB870);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB870);
    if ((_DWORD)v3)
    {
      byte_2544DB28A = capabilities::ct::sSupportsPCOOptions(v3);
      __cxa_guard_release(&qword_2544DB870);
    }
  }
  return byte_2544DB28A;
}

void sub_24B9F0D0C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB870);
  _Unwind_Resume(a1);
}

BOOL capabilities::ct::sSupportsPCOOptions(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if ((Product - 114) > 0x26 || ((1 << (Product - 114)) & 0x78F03C040FLL) == 0)
    return Product == 212;
  return v1;
}

uint64_t capabilities::ct::supportsVinylTestMode(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB880);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB880))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB28C = (Radio < 0x12) & (0x23C00u >> Radio);
    __cxa_guard_release(&qword_2544DB880);
  }
  return byte_2544DB28C;
}

void sub_24B9F0DF0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB880);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsExclusiveAssertions(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB888);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB888))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB28D = (Radio < 0x12) & (0x23C00u >> Radio);
    __cxa_guard_release(&qword_2544DB888);
  }
  return byte_2544DB28D;
}

void sub_24B9F0E7C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB888);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsLLFilters(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB890);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB890))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB28E = (Radio < 0x12) & (0x2FC00u >> Radio);
    __cxa_guard_release(&qword_2544DB890);
  }
  return byte_2544DB28E;
}

void sub_24B9F0F08(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB890);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsDynamicRRCReleaseVersionUpdate(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB898);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB898))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB28F = (Radio < 0x12) & (0x2F800u >> Radio);
    __cxa_guard_release(&qword_2544DB898);
  }
  return byte_2544DB28F;
}

void sub_24B9F0F94(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB898);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsSimultaneousNRStandaloneInDualSIMMode(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB8A0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB8A0);
    if ((_DWORD)v3)
    {
      byte_2544DB290 = capabilities::ct::sSupportsSimultaneousNRStandaloneInDualSIMMode(v3);
      __cxa_guard_release(&qword_2544DB8A0);
    }
  }
  return byte_2544DB290;
}

void sub_24B9F1008(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB8A0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::sSupportsSimultaneousNRStandaloneInDualSIMMode(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if (((Product - 124) > 0x23 || ((1 << (Product - 124)) & 0xF1FFC6F07) == 0)
    && ((Product - 200) > 0xC || ((1 << (Product + 56)) & 0x1085) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::ct::supportsQMIWakeUpForDFC(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB8A8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB8A8))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB291 = (Radio < 0x12) & (0x23000u >> Radio);
    __cxa_guard_release(&qword_2544DB8A8);
  }
  return byte_2544DB291;
}

void sub_24B9F1108(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB8A8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsThroughputEngineering(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB8B0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB8B0))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB292 = (Radio < 0x12) & (0x2F000u >> Radio);
    __cxa_guard_release(&qword_2544DB8B0);
  }
  return byte_2544DB292;
}

void sub_24B9F1194(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB8B0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsLLFiltersIMS(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB8B8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB8B8))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB293 = (Radio < 0x12) & (0x2F000u >> Radio);
    __cxa_guard_release(&qword_2544DB8B8);
  }
  return byte_2544DB293;
}

void sub_24B9F1220(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB8B8);
  _Unwind_Resume(a1);
}

BOOL capabilities::ct::sSupports5GSlicing(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if ((Product - 125) > 0x22 || ((1 << (Product - 125)) & 0x78FFE3783) == 0)
    return Product == 202 || Product == 212;
  return v1;
}

uint64_t capabilities::ct::supportsCSFBFastSAReturn(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB8C8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB8C8))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB295 = (Radio < 0x12) & (0x23000u >> Radio);
    __cxa_guard_release(&qword_2544DB8C8);
  }
  return byte_2544DB295;
}

void sub_24B9F130C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB8C8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsUplinkHealthUpdate(capabilities::ct *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB8D0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB8D0))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DB296 = (Radio < 0x12) & (0x23000u >> Radio);
    __cxa_guard_release(&qword_2544DB8D0);
  }
  return byte_2544DB296;
}

void sub_24B9F1398(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB8D0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::allowChinaWSKUWatchesToProvisionROWPlans(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB8D8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB8D8);
    if ((_DWORD)v3)
    {
      byte_2544DB297 = capabilities::ct::sAllowChinaWSKUWatchesToProvisionROWPlans(v3);
      __cxa_guard_release(&qword_2544DB8D8);
    }
  }
  return byte_2544DB297;
}

void sub_24B9F140C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB8D8);
  _Unwind_Resume(a1);
}

BOOL capabilities::ct::sAllowChinaWSKUWatchesToProvisionROWPlans(capabilities::ct *this)
{
  int Product;
  unsigned int v2;
  _BOOL4 v3;
  BOOL v4;
  int v5;

  Product = TelephonyRadiosGetProduct();
  v2 = Product - 127;
  v3 = Product == 211;
  if (Product == 209)
    v3 = 1;
  v4 = v2 > 0x1C;
  v5 = (1 << v2) & 0x1C00701F;
  return !v4 && v5 != 0 || v3;
}

uint64_t capabilities::ct::disallowROWWSKUWatchesToProvisionChinaPlans(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB8E0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB8E0);
    if ((_DWORD)v3)
    {
      byte_2544DB298 = capabilities::ct::sAllowChinaWSKUWatchesToProvisionROWPlans(v3);
      __cxa_guard_release(&qword_2544DB8E0);
    }
  }
  return byte_2544DB298;
}

void sub_24B9F14D0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB8E0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsEOS(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB8E8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB8E8);
    if ((_DWORD)v3)
    {
      byte_2544DB299 = capabilities::ct::sSupportsEOS(v3);
      __cxa_guard_release(&qword_2544DB8E8);
    }
  }
  return byte_2544DB299;
}

void sub_24B9F1544(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB8E8);
  _Unwind_Resume(a1);
}

BOOL capabilities::ct::sSupportsEOS(capabilities::ct *this)
{
  int Product;
  _BOOL4 v2;

  Product = TelephonyRadiosGetProduct();
  v2 = Product == 211;
  if (Product == 209)
    v2 = 1;
  return (Product - 129) <= 0x1B && ((1 << (Product + 127)) & 0xF001C07) != 0 || v2;
}

uint64_t capabilities::ct::requiresSeparateOperatingModeForStewie(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB8F0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB8F0);
    if ((_DWORD)v3)
    {
      byte_2544DB29A = capabilities::ct::sRequiresSeparateOperatingModeForStewie(v3);
      __cxa_guard_release(&qword_2544DB8F0);
    }
  }
  return byte_2544DB29A;
}

void sub_24B9F1608(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB8F0);
  _Unwind_Resume(a1);
}

BOOL capabilities::ct::sRequiresSeparateOperatingModeForStewie(capabilities::ct *this)
{
  int Product;

  Product = TelephonyRadiosGetProduct();
  return (Product - 132) <= 0x14 && ((1 << (Product + 124)) & 0x1E3C0F) != 0 || Product == 212;
}

uint64_t capabilities::ct::supportsSARAveraging(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB8F8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB8F8);
    if ((_DWORD)v3)
    {
      byte_2544DB29B = capabilities::ct::sRequiresSeparateOperatingModeForStewie(v3);
      __cxa_guard_release(&qword_2544DB8F8);
    }
  }
  return byte_2544DB29B;
}

void sub_24B9F16C4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB8F8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsCampOnlyMode(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB900);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB900);
    if ((_DWORD)v3)
    {
      byte_2544DB29C = capabilities::ct::sSupportsCampOnlyMode(v3);
      __cxa_guard_release(&qword_2544DB900);
    }
  }
  return byte_2544DB29C;
}

void sub_24B9F1738(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB900);
  _Unwind_Resume(a1);
}

BOOL capabilities::ct::sSupportsCampOnlyMode(capabilities::ct *this)
{
  int Product;

  Product = TelephonyRadiosGetProduct();
  return (Product - 132) <= 0x1B && ((1 << (Product + 124)) & 0xE9FFC6F) != 0
      || (Product - 211) < 2;
}

uint64_t capabilities::ct::supportsTurnOffCellular(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB908);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB908);
    if ((_DWORD)v3)
    {
      byte_2544DB29D = capabilities::ct::sRequiresSeparateOperatingModeForStewie(v3);
      __cxa_guard_release(&qword_2544DB908);
    }
  }
  return byte_2544DB29D;
}

void sub_24B9F17F8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB908);
  _Unwind_Resume(a1);
}

BOOL capabilities::ct::sSupportsStewie(capabilities::ct *this)
{
  int Product;
  _BOOL4 v2;

  Product = TelephonyRadiosGetProduct();
  v2 = Product == 212;
  if (Product == 202)
    v2 = 1;
  return (Product - 132) <= 0x18 && ((1 << (Product + 124)) & 0x11E3C0F) != 0 || v2;
}

uint64_t capabilities::ct::supportsSubwayDetection(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB918);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB918);
    if ((_DWORD)v3)
    {
      byte_2544DB29F = capabilities::ct::sRequiresSeparateOperatingModeForStewie(v3);
      __cxa_guard_release(&qword_2544DB918);
    }
  }
  return byte_2544DB29F;
}

void sub_24B9F18BC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB918);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::basebandGlobalSKU(capabilities::ct *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB920);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DB920);
    if ((_DWORD)v3)
    {
      byte_2544DB2A0 = capabilities::ct::sBasebandGlobalSKU(v3);
      __cxa_guard_release(&qword_2544DB920);
    }
  }
  return byte_2544DB2A0;
}

void sub_24B9F1930(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB920);
  _Unwind_Resume(a1);
}

BOOL capabilities::ct::sBasebandGlobalSKU(capabilities::ct *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if ((Product - 153) > 0x3A || ((1 << (Product + 103)) & 0x500000000000007) == 0)
    return (Product - 139) < 3;
  return v1;
}

uint64_t capabilities::ct::latestAndGreatestDevice(capabilities::ct *this)
{
  unsigned __int8 v1;
  int Product;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB928);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB928))
  {
    Product = TelephonyRadiosGetProduct();
    byte_2544DB2A1 = ((Product - 146) < 0xE) & (0x307Fu >> (Product + 110));
    __cxa_guard_release(&qword_2544DB928);
  }
  return byte_2544DB2A1;
}

void sub_24B9F1A10(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB928);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsHiSpeedFiler(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB930);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB930))
  {
    byte_2544DB2A2 = TelephonyRadiosGetRadioVendor() - 3 < 2;
    __cxa_guard_release(&qword_2544DB930);
  }
  return byte_2544DB2A2;
}

void sub_24B9F1A90(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB930);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsNewPhonebook(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB938);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB938))
  {
    byte_2544DB2A3 = TelephonyRadiosGetRadioVendor() == 3;
    __cxa_guard_release(&qword_2544DB938);
  }
  return byte_2544DB2A3;
}

void sub_24B9F1B0C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB938);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsNRFlowInformation(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB940);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB940))
  {
    byte_2544DB2A4 = TelephonyRadiosGetRadioVendor() == 3;
    __cxa_guard_release(&qword_2544DB940);
  }
  return byte_2544DB2A4;
}

void sub_24B9F1B88(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB940);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsIPCInterfaceConfig(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB948);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB948))
  {
    byte_2544DB2A5 = TelephonyRadiosGetRadioVendor() == 3;
    __cxa_guard_release(&qword_2544DB948);
  }
  return byte_2544DB2A5;
}

void sub_24B9F1C04(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB948);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsIPCInterfaceConfigStage2(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB950);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB950))
  {
    byte_2544DB2A6 = TelephonyRadiosGetRadioVendor() == 3;
    __cxa_guard_release(&qword_2544DB950);
  }
  return byte_2544DB2A6;
}

void sub_24B9F1C80(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB950);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsBBTimePrecisionInMilliseconds(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB958);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB958))
  {
    byte_2544DB2A7 = TelephonyRadiosGetRadioVendor() == 3;
    __cxa_guard_release(&qword_2544DB958);
  }
  return byte_2544DB2A7;
}

void sub_24B9F1CFC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB958);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsBBTimePrecisionInMillisecondsWithMCT(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB960);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB960))
  {
    byte_2544DB2A8 = TelephonyRadiosGetRadioVendor() == 3;
    __cxa_guard_release(&qword_2544DB960);
  }
  return byte_2544DB2A8;
}

void sub_24B9F1D78(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB960);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsHOVirtualInterfaces(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB968);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB968))
  {
    byte_2544DB2A9 = TelephonyRadiosGetRadioVendor() == 3;
    __cxa_guard_release(&qword_2544DB968);
  }
  return byte_2544DB2A9;
}

void sub_24B9F1DF4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB968);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::shouldEnableSystemDeterminationWatchdog(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB970);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB970))
  {
    byte_2544DB2AA = TelephonyRadiosGetRadioVendor() != 3;
    __cxa_guard_release(&qword_2544DB970);
  }
  return byte_2544DB2AA;
}

void sub_24B9F1E70(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB970);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::shouldSaveInCallIMSPrefForCSCall(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB978);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB978))
  {
    byte_2544DB2AB = TelephonyRadiosGetRadioVendor() == 3;
    __cxa_guard_release(&qword_2544DB978);
  }
  return byte_2544DB2AB;
}

void sub_24B9F1EEC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB978);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsCachedNetworkTimeQuery(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB980);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB980))
  {
    byte_2544DB2AC = TelephonyRadiosGetRadioVendor() == 3;
    __cxa_guard_release(&qword_2544DB980);
  }
  return byte_2544DB2AC;
}

void sub_24B9F1F68(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB980);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::useLegacyPhoneNumberSelectionMethod(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB988);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB988))
  {
    byte_2544DB2AD = (TelephonyRadiosGetProduct() & 0xFFFFFFFE) == 0x8000;
    __cxa_guard_release(&qword_2544DB988);
  }
  return byte_2544DB2AD;
}

void sub_24B9F1FE8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB988);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ct::supportsLogDumpForFailedBundlePush(capabilities::ct *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DB990);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DB990))
  {
    byte_2544DB2AE = TelephonyRadiosGetProduct() == 32770;
    __cxa_guard_release(&qword_2544DB990);
  }
  return byte_2544DB2AE;
}

void sub_24B9F2068(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DB990);
  _Unwind_Resume(a1);
}

_QWORD *capabilities::ct::asString@<X0>(unsigned int a1@<W0>, _QWORD *a2@<X8>)
{
  char *v2;

  if (a1 > 3)
    v2 = "???";
  else
    v2 = off_251CC9108[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = off_251CC9128[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = off_251CC9140[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = off_251CC9158[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = off_251CC9170[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 4)
    v2 = "???";
  else
    v2 = off_251CC9188[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = off_251CC91B0[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = off_251CC91C8[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = off_251CC91E0[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = off_251CC91F8[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = off_251CC9210[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = off_251CC9228[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = (&off_251CC9580)[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 3)
    v2 = "???";
  else
    v2 = (&off_251CC9598)[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 3)
    v2 = "???";
  else
    v2 = (&off_251CC95B8)[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

_QWORD *capabilities::ct::asString@<X0>(int a1@<W0>, _QWORD *a2@<X8>)
{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kNone";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kMicPreferred";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  char *v2;

  if (a1 <= 131584)
  {
    if (a1 == 0x20000)
    {
      v2 = "kV2_0";
      return std::string::basic_string[abi:ne180100]<0>(a2, v2);
    }
    if (a1 == 131584)
    {
      v2 = "kV2_2";
      return std::string::basic_string[abi:ne180100]<0>(a2, v2);
    }
LABEL_13:
    v2 = "???";
    return std::string::basic_string[abi:ne180100]<0>(a2, v2);
  }
  if (a1 == 131585)
  {
    v2 = "kV2_2_1";
    return std::string::basic_string[abi:ne180100]<0>(a2, v2);
  }
  if (a1 == 131586)
  {
    v2 = "kV2_2_2";
    return std::string::basic_string[abi:ne180100]<0>(a2, v2);
  }
  if (a1 != 131840)
    goto LABEL_13;
  v2 = "kV2_3";
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  const char *v2;
  const char *v3;
  char *v4;

  v2 = "kV2_3_1";
  v3 = "???";
  if (a1 == 131328)
    v3 = "kV2_1";
  if (a1 != 131841)
    v2 = v3;
  if (a1 == 0x20000)
    v4 = "kV2_0";
  else
    v4 = (char *)v2;
  return std::string::basic_string[abi:ne180100]<0>(a2, v4);
}

char *std::vector<capabilities::ct::SupportedMessageMode>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;

  if (a2 >> 62)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(4 * a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * a2];
  return result;
}

char *std::vector<capabilities::ct::SupportedMessageMode>::__assign_with_size[abi:ne180100]<capabilities::ct::SupportedMessageMode const*,capabilities::ct::SupportedMessageMode const*>(char *__src, uint64_t a2, unint64_t a3)
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  size_t v12;
  void *v13;
  char *v14;

  v5 = __src;
  v6 = qword_2544DB9F0;
  v7 = qword_2544DB9E0;
  if (a3 > (qword_2544DB9F0 - qword_2544DB9E0) >> 2)
  {
    if (qword_2544DB9E0)
    {
      qword_2544DB9E8 = qword_2544DB9E0;
      operator delete((void *)qword_2544DB9E0);
      v6 = 0;
      qword_2544DB9E0 = 0;
      qword_2544DB9E8 = 0;
      qword_2544DB9F0 = 0;
    }
    v8 = v6 >> 1;
    if (v6 >> 1 <= a3)
      v8 = a3;
    if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFFCLL)
      v9 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v9 = v8;
    __src = std::vector<capabilities::ct::SupportedMessageMode>::__vallocate[abi:ne180100](&qword_2544DB9E0, v9);
    v7 = qword_2544DB9E8;
LABEL_15:
    v12 = a2 - (_QWORD)v5;
    if (v12)
    {
      v13 = (void *)v7;
      v14 = v5;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v10 = (qword_2544DB9E8 - qword_2544DB9E0) >> 2;
  if (v10 >= a3)
    goto LABEL_15;
  v11 = &__src[4 * v10];
  if (qword_2544DB9E8 != qword_2544DB9E0)
  {
    __src = (char *)memmove((void *)qword_2544DB9E0, __src, qword_2544DB9E8 - qword_2544DB9E0);
    v7 = qword_2544DB9E8;
  }
  v12 = a2 - (_QWORD)v11;
  if (v12)
  {
    v13 = (void *)v7;
    v14 = v11;
LABEL_17:
    __src = (char *)memmove(v13, v14, v12);
  }
LABEL_18:
  qword_2544DB9E8 = v7 + v12;
  return __src;
}

char *std::vector<capabilities::ct::SupportedMTSMSTypes>::__assign_with_size[abi:ne180100]<capabilities::ct::SupportedMTSMSTypes const*,capabilities::ct::SupportedMTSMSTypes const*>(char *__src, uint64_t a2, unint64_t a3)
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  size_t v12;
  void *v13;
  char *v14;

  v5 = __src;
  v6 = qword_2544DBA20;
  v7 = qword_2544DBA10;
  if (a3 > (qword_2544DBA20 - qword_2544DBA10) >> 2)
  {
    if (qword_2544DBA10)
    {
      qword_2544DBA18 = qword_2544DBA10;
      operator delete((void *)qword_2544DBA10);
      v6 = 0;
      qword_2544DBA10 = 0;
      qword_2544DBA18 = 0;
      qword_2544DBA20 = 0;
    }
    v8 = v6 >> 1;
    if (v6 >> 1 <= a3)
      v8 = a3;
    if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFFCLL)
      v9 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v9 = v8;
    __src = std::vector<capabilities::ct::SupportedMessageMode>::__vallocate[abi:ne180100](&qword_2544DBA10, v9);
    v7 = qword_2544DBA18;
LABEL_15:
    v12 = a2 - (_QWORD)v5;
    if (v12)
    {
      v13 = (void *)v7;
      v14 = v5;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v10 = (qword_2544DBA18 - qword_2544DBA10) >> 2;
  if (v10 >= a3)
    goto LABEL_15;
  v11 = &__src[4 * v10];
  if (qword_2544DBA18 != qword_2544DBA10)
  {
    __src = (char *)memmove((void *)qword_2544DBA10, __src, qword_2544DBA18 - qword_2544DBA10);
    v7 = qword_2544DBA18;
  }
  v12 = a2 - (_QWORD)v11;
  if (v12)
  {
    v13 = (void *)v7;
    v14 = v11;
LABEL_17:
    __src = (char *)memmove(v13, v14, v12);
  }
LABEL_18:
  qword_2544DBA18 = v7 + v12;
  return __src;
}

uint64_t capabilities::debug::shouldTriggerStackshotOnSnapshot(capabilities::debug *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBA30);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBA30))
  {
    _MergedGlobals_6 = 0;
    __cxa_guard_release(&qword_2544DBA30);
  }
  return _MergedGlobals_6;
}

uint64_t capabilities::debug::environment(capabilities::debug *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBA38);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBA38))
  {
    dword_2544DBA2C = 0;
    __cxa_guard_release(&qword_2544DBA38);
  }
  return dword_2544DBA2C;
}

uint64_t capabilities::debug::operator&(unsigned int a1, int a2)
{
  return a2 & a1;
}

_DWORD *capabilities::debug::operator&=(_DWORD *result, int a2)
{
  *result &= a2;
  return result;
}

uint64_t capabilities::debug::operator|(unsigned int a1, int a2)
{
  return a2 | a1;
}

_DWORD *capabilities::debug::operator|=(_DWORD *result, int a2)
{
  *result |= a2;
  return result;
}

uint64_t capabilities::debug::operator^(unsigned int a1, int a2)
{
  return a2 ^ a1;
}

_DWORD *capabilities::debug::operator^=(_DWORD *result, int a2)
{
  *result ^= a2;
  return result;
}

uint64_t capabilities::debug::operator~(int a1)
{
  return ~a1;
}

void capabilities::debug::asString(int a1@<W0>, uint64_t a2@<X8>)
{
  std::vector<std::string>::pointer end;
  __int128 v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  std::string *v9;
  std::string *v10;
  __int128 v11;
  std::string *v12;
  std::vector<std::string>::pointer v13;
  __int128 v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  std::string *v18;
  std::string *v19;
  __int128 v20;
  std::string *v21;
  void *__p[2];
  std::string::size_type v23;
  std::vector<std::string> v24;
  void *v25[3];
  std::__split_buffer<std::string> __v;

  memset(v25, 170, sizeof(v25));
  std::string::basic_string[abi:ne180100]<0>(v25, "???");
  memset(&v24, 0, sizeof(v24));
  if (!a1)
  {
    std::string::basic_string[abi:ne180100]<0>((_QWORD *)a2, "kNone");
    goto LABEL_37;
  }
  if ((a1 & 2) == 0)
    goto LABEL_17;
  std::string::basic_string[abi:ne180100]<0>(__p, "kBoot");
  end = v24.__end_;
  if (v24.__end_ < v24.__end_cap_.__value_)
  {
    v5 = *(_OWORD *)__p;
    v24.__end_->__r_.__value_.__r.__words[2] = v23;
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v5;
    v24.__end_ = end + 1;
    if ((a1 & 4) == 0)
      goto LABEL_32;
LABEL_18:
    std::string::basic_string[abi:ne180100]<0>(__p, "kShutdown");
    v13 = v24.__end_;
    if (v24.__end_ >= v24.__end_cap_.__value_)
    {
      v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)v24.__end_ - (char *)v24.__begin_) >> 3);
      v16 = v15 + 1;
      if (v15 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      if (0x5555555555555556 * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3) > v16)
        v16 = 0x5555555555555556 * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3) >= 0x555555555555555)
        v17 = 0xAAAAAAAAAAAAAAALL;
      else
        v17 = v16;
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v24.__end_cap_;
      if (v17)
        v18 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v24.__end_cap_, v17);
      else
        v18 = 0;
      v19 = v18 + v15;
      __v.__first_ = v18;
      __v.__begin_ = v19;
      __v.__end_cap_.__value_ = &v18[v17];
      v20 = *(_OWORD *)__p;
      v19->__r_.__value_.__r.__words[2] = v23;
      *(_OWORD *)&v19->__r_.__value_.__l.__data_ = v20;
      __p[1] = 0;
      v23 = 0;
      __p[0] = 0;
      __v.__end_ = v19 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v24, &__v);
      v21 = v24.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v24.__end_ = v21;
      if (SHIBYTE(v23) < 0)
        operator delete(__p[0]);
    }
    else
    {
      v14 = *(_OWORD *)__p;
      v24.__end_->__r_.__value_.__r.__words[2] = v23;
      *(_OWORD *)&v13->__r_.__value_.__l.__data_ = v14;
      v24.__end_ = v13 + 1;
    }
    goto LABEL_32;
  }
  v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)v24.__end_ - (char *)v24.__begin_) >> 3);
  v7 = v6 + 1;
  if (v6 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  if (0x5555555555555556 * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3) > v7)
    v7 = 0x5555555555555556 * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3);
  v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3) >= 0x555555555555555
     ? 0xAAAAAAAAAAAAAAALL
     : v7;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v24.__end_cap_;
  v9 = v8
     ? (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v24.__end_cap_, v8)
     : 0;
  v10 = v9 + v6;
  __v.__first_ = v9;
  __v.__begin_ = v10;
  __v.__end_cap_.__value_ = &v9[v8];
  v11 = *(_OWORD *)__p;
  v10->__r_.__value_.__r.__words[2] = v23;
  *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
  __p[1] = 0;
  v23 = 0;
  __p[0] = 0;
  __v.__end_ = v10 + 1;
  std::vector<std::string>::__swap_out_circular_buffer(&v24, &__v);
  v12 = v24.__end_;
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  v24.__end_ = v12;
  if (SHIBYTE(v23) < 0)
  {
    operator delete(__p[0]);
    if ((a1 & 4) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_17:
    if ((a1 & 4) != 0)
      goto LABEL_18;
  }
LABEL_32:
  if (v24.__end_ != v24.__begin_)
  {
    ctu::join<std::__wrap_iter<std::string *>>(v24.__begin_, v24.__end_, " | ", 3uLL, (std::string *)&__v);
    if (SHIBYTE(v25[2]) < 0)
      operator delete(v25[0]);
    *(_OWORD *)v25 = *(_OWORD *)&__v.__first_;
    v25[2] = __v.__end_;
  }
  *(_OWORD *)a2 = *(_OWORD *)v25;
  *(void **)(a2 + 16) = v25[2];
  memset(v25, 0, sizeof(v25));
LABEL_37:
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v24;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  if (SHIBYTE(v25[2]) < 0)
    operator delete(v25[0]);
}

void sub_24B9F29F0(_Unwind_Exception *__p, uint64_t a2, int a3, __int16 a4, char a5, char a6, char a7, uint64_t a8, int *__pa, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, std::__split_buffer<std::string> *a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a24);
  if (SHIBYTE(a11) < 0)
    operator delete(__pa);
  __pa = &a12;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  if (a23 < 0)
    operator delete(a18);
  _Unwind_Resume(__p);
}

uint64_t capabilities::diag::supportsDrainTimer(capabilities::diag *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBA58);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBA58))
  {
    _MergedGlobals_7 = 0;
    __cxa_guard_release(&qword_2544DBA58);
  }
  return _MergedGlobals_7;
}

uint64_t capabilities::diag::supportsMultipleMasks(capabilities::diag *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBA60);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBA60))
  {
    byte_2544DBA41 = ((TelephonyRadiosGetRadioVendor() - 1) & 0xFFFFFFFD) == 0;
    __cxa_guard_release(&qword_2544DBA60);
  }
  return byte_2544DBA41;
}

void sub_24B9F2B08(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBA60);
  _Unwind_Resume(a1);
}

uint64_t capabilities::diag::supportedDuringAPSleep(capabilities::diag *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBA68);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBA68))
  {
    byte_2544DBA42 = ((TelephonyRadiosGetRadioVendor() - 1) & 0xFFFFFFFD) == 0;
    __cxa_guard_release(&qword_2544DBA68);
  }
  return byte_2544DBA42;
}

void sub_24B9F2B84(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBA68);
  _Unwind_Resume(a1);
}

uint64_t capabilities::diag::supportsBuffering(capabilities::diag *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBA70);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBA70))
  {
    byte_2544DBA43 = ((TelephonyRadiosGetRadioVendor() - 1) & 0xFFFFFFFD) == 0;
    __cxa_guard_release(&qword_2544DBA70);
  }
  return byte_2544DBA43;
}

void sub_24B9F2C00(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBA70);
  _Unwind_Resume(a1);
}

uint64_t capabilities::diag::supportedInterfaces(capabilities::diag *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBA78);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBA78))
  {
    dword_2544DBA4C = 8 * (TelephonyRadiosGetRadioVendor() - 1 < 4);
    __cxa_guard_release(&qword_2544DBA78);
  }
  return dword_2544DBA4C;
}

void sub_24B9F2C80(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBA78);
  _Unwind_Resume(a1);
}

uint64_t capabilities::diag::interfaceAfterBoot(capabilities::diag *this)
{
  unsigned __int8 v1;
  int v3;

  {
    if (TelephonyRadiosGetRadioVendor() - 1 >= 4)
      v3 = 1;
    else
      v3 = 8;
    capabilities::diag::interfaceAfterBoot(void)::ret = v3;
  }
  return capabilities::diag::interfaceAfterBoot(void)::ret;
}

void sub_24B9F2D00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t capabilities::diag::preferredInterface(capabilities::diag *this)
{
  unsigned __int8 v1;

  {
    capabilities::diag::preferredInterface(void)::ret = 8 * (TelephonyRadiosGetRadioVendor() - 1 < 4);
  }
  return capabilities::diag::preferredInterface(void)::ret;
}

void sub_24B9F2D80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t capabilities::diag::supportsCompression(capabilities::diag *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBA80);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBA80))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBA44 = (Radio < 0x12) & (0x23E0Cu >> Radio);
    __cxa_guard_release(&qword_2544DBA80);
  }
  return byte_2544DBA44;
}

void sub_24B9F2E08(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBA80);
  _Unwind_Resume(a1);
}

uint64_t capabilities::diag::supportsQShrink4(capabilities::diag *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBA88);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBA88))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBA45 = (Radio < 0x12) & (0x23E08u >> Radio);
    __cxa_guard_release(&qword_2544DBA88);
  }
  return byte_2544DBA45;
}

void sub_24B9F2E90(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBA88);
  _Unwind_Resume(a1);
}

uint64_t capabilities::diag::supportsBSPFlagSet(capabilities::diag *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBA90);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBA90))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBA46 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_2544DBA90);
  }
  return byte_2544DBA46;
}

void sub_24B9F2F18(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBA90);
  _Unwind_Resume(a1);
}

uint64_t capabilities::diag::diagVersion(capabilities::diag *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBA98);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBA98))
  {
    v3 = TelephonyRadiosGetRadio() - 9;
    if (v3 > 8)
      v4 = 1;
    else
      v4 = dword_24BA00DD8[v3];
    dword_2544DBA50 = v4;
    __cxa_guard_release(&qword_2544DBA98);
  }
  return dword_2544DBA50;
}

void sub_24B9F2FA8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBA98);
  _Unwind_Resume(a1);
}

uint64_t capabilities::diag::supportsQDSS(capabilities::diag *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBAA0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBAA0))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBA47 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_2544DBAA0);
  }
  return byte_2544DBA47;
}

void sub_24B9F3030(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBAA0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::diag::supportsADPL(capabilities::diag *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBAA8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBAA8))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBA48 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_2544DBAA8);
  }
  return byte_2544DBA48;
}

void sub_24B9F30B8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBAA8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::diag::operator&(unsigned int a1, int a2)
{
  return a2 & a1;
}

{
  return a2 & a1;
}

_DWORD *capabilities::diag::operator&=(_DWORD *result, int a2)
{
  *result &= a2;
  return result;
}

{
  *result &= a2;
  return result;
}

uint64_t capabilities::diag::operator|(unsigned int a1, int a2)
{
  return a2 | a1;
}

{
  return a2 | a1;
}

_DWORD *capabilities::diag::operator|=(_DWORD *result, int a2)
{
  *result |= a2;
  return result;
}

{
  *result |= a2;
  return result;
}

uint64_t capabilities::diag::operator^(unsigned int a1, int a2)
{
  return a2 ^ a1;
}

{
  return a2 ^ a1;
}

_DWORD *capabilities::diag::operator^=(_DWORD *result, int a2)
{
  *result ^= a2;
  return result;
}

{
  *result ^= a2;
  return result;
}

uint64_t capabilities::diag::operator~(int a1)
{
  return ~a1;
}

{
  return ~a1;
}

void capabilities::diag::asString(int a1@<W0>, uint64_t a2@<X8>)
{
  std::vector<std::string>::pointer end;
  __int128 v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  std::string *v9;
  std::string *v10;
  __int128 v11;
  std::string *v12;
  std::vector<std::string>::pointer v13;
  __int128 v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  std::string *v18;
  std::string *v19;
  __int128 v20;
  std::string *v21;
  std::vector<std::string>::pointer v22;
  __int128 v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  std::string *v27;
  std::string *v28;
  __int128 v29;
  std::string *v30;
  std::vector<std::string>::pointer v31;
  __int128 v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  std::string *v36;
  std::string *v37;
  __int128 v38;
  std::string *v39;
  void *__p[2];
  std::string::size_type v41;
  std::vector<std::string> v42;
  void *v43[3];
  std::__split_buffer<std::string> __v;

  memset(v43, 170, sizeof(v43));
  std::string::basic_string[abi:ne180100]<0>(v43, "???");
  memset(&v42, 0, sizeof(v42));
  if (!a1)
  {
    std::string::basic_string[abi:ne180100]<0>((_QWORD *)a2, "kNone");
    goto LABEL_66;
  }
  if ((a1 & 1) == 0)
    goto LABEL_17;
  std::string::basic_string[abi:ne180100]<0>(__p, "kUART");
  end = v42.__end_;
  if (v42.__end_ < v42.__end_cap_.__value_)
  {
    v5 = *(_OWORD *)__p;
    v42.__end_->__r_.__value_.__r.__words[2] = v41;
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v5;
    v42.__end_ = end + 1;
    if ((a1 & 2) == 0)
      goto LABEL_32;
LABEL_18:
    std::string::basic_string[abi:ne180100]<0>(__p, "kUSB");
    v13 = v42.__end_;
    if (v42.__end_ >= v42.__end_cap_.__value_)
    {
      v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_ - (char *)v42.__begin_) >> 3);
      v16 = v15 + 1;
      if (v15 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      if (0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) > v16)
        v16 = 0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) >= 0x555555555555555)
        v17 = 0xAAAAAAAAAAAAAAALL;
      else
        v17 = v16;
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v42.__end_cap_;
      if (v17)
        v18 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v42.__end_cap_, v17);
      else
        v18 = 0;
      v19 = v18 + v15;
      __v.__first_ = v18;
      __v.__begin_ = v19;
      __v.__end_cap_.__value_ = &v18[v17];
      v20 = *(_OWORD *)__p;
      v19->__r_.__value_.__r.__words[2] = v41;
      *(_OWORD *)&v19->__r_.__value_.__l.__data_ = v20;
      __p[1] = 0;
      v41 = 0;
      __p[0] = 0;
      __v.__end_ = v19 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v42, &__v);
      v21 = v42.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v42.__end_ = v21;
      if (SHIBYTE(v41) < 0)
        operator delete(__p[0]);
    }
    else
    {
      v14 = *(_OWORD *)__p;
      v42.__end_->__r_.__value_.__r.__words[2] = v41;
      *(_OWORD *)&v13->__r_.__value_.__l.__data_ = v14;
      v42.__end_ = v13 + 1;
    }
    goto LABEL_32;
  }
  v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_ - (char *)v42.__begin_) >> 3);
  v7 = v6 + 1;
  if (v6 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  if (0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) > v7)
    v7 = 0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3);
  v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) >= 0x555555555555555
     ? 0xAAAAAAAAAAAAAAALL
     : v7;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v42.__end_cap_;
  v9 = v8
     ? (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v42.__end_cap_, v8)
     : 0;
  v10 = v9 + v6;
  __v.__first_ = v9;
  __v.__begin_ = v10;
  __v.__end_cap_.__value_ = &v9[v8];
  v11 = *(_OWORD *)__p;
  v10->__r_.__value_.__r.__words[2] = v41;
  *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
  __p[1] = 0;
  v41 = 0;
  __p[0] = 0;
  __v.__end_ = v10 + 1;
  std::vector<std::string>::__swap_out_circular_buffer(&v42, &__v);
  v12 = v42.__end_;
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  v42.__end_ = v12;
  if (SHIBYTE(v41) < 0)
  {
    operator delete(__p[0]);
    if ((a1 & 2) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_17:
    if ((a1 & 2) != 0)
      goto LABEL_18;
  }
  if ((a1 & 4) == 0)
    goto LABEL_46;
LABEL_32:
  std::string::basic_string[abi:ne180100]<0>(__p, "kHSIC");
  v22 = v42.__end_;
  if (v42.__end_ < v42.__end_cap_.__value_)
  {
    v23 = *(_OWORD *)__p;
    v42.__end_->__r_.__value_.__r.__words[2] = v41;
    *(_OWORD *)&v22->__r_.__value_.__l.__data_ = v23;
    v42.__end_ = v22 + 1;
    if ((a1 & 8) == 0)
      goto LABEL_61;
LABEL_47:
    std::string::basic_string[abi:ne180100]<0>(__p, "kPCI");
    v31 = v42.__end_;
    if (v42.__end_ >= v42.__end_cap_.__value_)
    {
      v33 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_ - (char *)v42.__begin_) >> 3);
      v34 = v33 + 1;
      if (v33 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      if (0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) > v34)
        v34 = 0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) >= 0x555555555555555)
        v35 = 0xAAAAAAAAAAAAAAALL;
      else
        v35 = v34;
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v42.__end_cap_;
      if (v35)
        v36 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v42.__end_cap_, v35);
      else
        v36 = 0;
      v37 = v36 + v33;
      __v.__first_ = v36;
      __v.__begin_ = v37;
      __v.__end_cap_.__value_ = &v36[v35];
      v38 = *(_OWORD *)__p;
      v37->__r_.__value_.__r.__words[2] = v41;
      *(_OWORD *)&v37->__r_.__value_.__l.__data_ = v38;
      __p[1] = 0;
      v41 = 0;
      __p[0] = 0;
      __v.__end_ = v37 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v42, &__v);
      v39 = v42.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v42.__end_ = v39;
      if (SHIBYTE(v41) < 0)
        operator delete(__p[0]);
    }
    else
    {
      v32 = *(_OWORD *)__p;
      v42.__end_->__r_.__value_.__r.__words[2] = v41;
      *(_OWORD *)&v31->__r_.__value_.__l.__data_ = v32;
      v42.__end_ = v31 + 1;
    }
    goto LABEL_61;
  }
  v24 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_ - (char *)v42.__begin_) >> 3);
  v25 = v24 + 1;
  if (v24 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  if (0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) > v25)
    v25 = 0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3);
  v26 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) >= 0x555555555555555
      ? 0xAAAAAAAAAAAAAAALL
      : v25;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v42.__end_cap_;
  v27 = v26
      ? (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v42.__end_cap_, v26): 0;
  v28 = v27 + v24;
  __v.__first_ = v27;
  __v.__begin_ = v28;
  __v.__end_cap_.__value_ = &v27[v26];
  v29 = *(_OWORD *)__p;
  v28->__r_.__value_.__r.__words[2] = v41;
  *(_OWORD *)&v28->__r_.__value_.__l.__data_ = v29;
  __p[1] = 0;
  v41 = 0;
  __p[0] = 0;
  __v.__end_ = v28 + 1;
  std::vector<std::string>::__swap_out_circular_buffer(&v42, &__v);
  v30 = v42.__end_;
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  v42.__end_ = v30;
  if (SHIBYTE(v41) < 0)
  {
    operator delete(__p[0]);
    if ((a1 & 8) != 0)
      goto LABEL_47;
  }
  else
  {
LABEL_46:
    if ((a1 & 8) != 0)
      goto LABEL_47;
  }
LABEL_61:
  if (v42.__end_ != v42.__begin_)
  {
    ctu::join<std::__wrap_iter<std::string *>>(v42.__begin_, v42.__end_, " | ", 3uLL, (std::string *)&__v);
    if (SHIBYTE(v43[2]) < 0)
      operator delete(v43[0]);
    *(_OWORD *)v43 = *(_OWORD *)&__v.__first_;
    v43[2] = __v.__end_;
  }
  *(_OWORD *)a2 = *(_OWORD *)v43;
  *(void **)(a2 + 16) = v43[2];
  memset(v43, 0, sizeof(v43));
LABEL_66:
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v42;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  if (SHIBYTE(v43[2]) < 0)
    operator delete(v43[0]);
}

void sub_24B9F36C4(_Unwind_Exception *__p, uint64_t a2, int a3, __int16 a4, char a5, char a6, char a7, uint64_t a8, int *__pa, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, std::__split_buffer<std::string> *a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a24);
  if (SHIBYTE(a11) < 0)
    operator delete(__pa);
  __pa = &a12;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  if (a23 < 0)
    operator delete(a18);
  _Unwind_Resume(__p);
}

void capabilities::diag::asString(char a1@<W0>, void **a2@<X8>)
{
  std::vector<std::string>::pointer end;
  __int128 v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  std::string *v9;
  std::string *v10;
  __int128 v11;
  std::string *v12;
  std::vector<std::string>::pointer v13;
  __int128 v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  std::string *v18;
  std::string *v19;
  __int128 v20;
  std::string *v21;
  std::vector<std::string>::pointer v22;
  __int128 v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  std::string *v27;
  std::string *v28;
  __int128 v29;
  std::string *v30;
  void *__p[2];
  std::string::size_type v32;
  std::vector<std::string> v33;
  std::__split_buffer<std::string> __v;

  memset(a2, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(a2, "???");
  memset(&v33, 0, sizeof(v33));
  if ((a1 & 1) == 0)
    goto LABEL_15;
  std::string::basic_string[abi:ne180100]<0>(__p, "kStreaming");
  end = v33.__end_;
  if (v33.__end_ < v33.__end_cap_.__value_)
  {
    v5 = *(_OWORD *)__p;
    v33.__end_->__r_.__value_.__r.__words[2] = v32;
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v5;
    v33.__end_ = end + 1;
    if ((a1 & 2) == 0)
      goto LABEL_30;
    goto LABEL_16;
  }
  v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)v33.__end_ - (char *)v33.__begin_) >> 3);
  v7 = v6 + 1;
  if (v6 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  if (0x5555555555555556 * (((char *)v33.__end_cap_.__value_ - (char *)v33.__begin_) >> 3) > v7)
    v7 = 0x5555555555555556 * (((char *)v33.__end_cap_.__value_ - (char *)v33.__begin_) >> 3);
  v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v33.__end_cap_.__value_ - (char *)v33.__begin_) >> 3) >= 0x555555555555555
     ? 0xAAAAAAAAAAAAAAALL
     : v7;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v33.__end_cap_;
  v9 = v8
     ? (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v33.__end_cap_, v8)
     : 0;
  v10 = v9 + v6;
  __v.__first_ = v9;
  __v.__begin_ = v10;
  __v.__end_cap_.__value_ = &v9[v8];
  v11 = *(_OWORD *)__p;
  v10->__r_.__value_.__r.__words[2] = v32;
  *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
  __p[1] = 0;
  v32 = 0;
  __p[0] = 0;
  __v.__end_ = v10 + 1;
  std::vector<std::string>::__swap_out_circular_buffer(&v33, &__v);
  v12 = v33.__end_;
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  v33.__end_ = v12;
  if (SHIBYTE(v32) < 0)
  {
    operator delete(__p[0]);
    if ((a1 & 2) == 0)
      goto LABEL_30;
  }
  else
  {
LABEL_15:
    if ((a1 & 2) == 0)
      goto LABEL_30;
  }
LABEL_16:
  std::string::basic_string[abi:ne180100]<0>(__p, "kThreshold");
  v13 = v33.__end_;
  if (v33.__end_ >= v33.__end_cap_.__value_)
  {
    v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)v33.__end_ - (char *)v33.__begin_) >> 3);
    v16 = v15 + 1;
    if (v15 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    if (0x5555555555555556 * (((char *)v33.__end_cap_.__value_ - (char *)v33.__begin_) >> 3) > v16)
      v16 = 0x5555555555555556 * (((char *)v33.__end_cap_.__value_ - (char *)v33.__begin_) >> 3);
    if (0xAAAAAAAAAAAAAAABLL * (((char *)v33.__end_cap_.__value_ - (char *)v33.__begin_) >> 3) >= 0x555555555555555)
      v17 = 0xAAAAAAAAAAAAAAALL;
    else
      v17 = v16;
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v33.__end_cap_;
    if (v17)
      v18 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v33.__end_cap_, v17);
    else
      v18 = 0;
    v19 = v18 + v15;
    __v.__first_ = v18;
    __v.__begin_ = v19;
    __v.__end_cap_.__value_ = &v18[v17];
    v20 = *(_OWORD *)__p;
    v19->__r_.__value_.__r.__words[2] = v32;
    *(_OWORD *)&v19->__r_.__value_.__l.__data_ = v20;
    __p[1] = 0;
    v32 = 0;
    __p[0] = 0;
    __v.__end_ = v19 + 1;
    std::vector<std::string>::__swap_out_circular_buffer(&v33, &__v);
    v21 = v33.__end_;
    std::__split_buffer<std::string>::~__split_buffer(&__v);
    v33.__end_ = v21;
    if (SHIBYTE(v32) < 0)
      operator delete(__p[0]);
  }
  else
  {
    v14 = *(_OWORD *)__p;
    v33.__end_->__r_.__value_.__r.__words[2] = v32;
    *(_OWORD *)&v13->__r_.__value_.__l.__data_ = v14;
    v33.__end_ = v13 + 1;
  }
LABEL_30:
  if ((a1 & 4) != 0)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "kCircular");
    v22 = v33.__end_;
    if (v33.__end_ >= v33.__end_cap_.__value_)
    {
      v24 = 0xAAAAAAAAAAAAAAABLL * (((char *)v33.__end_ - (char *)v33.__begin_) >> 3);
      v25 = v24 + 1;
      if (v24 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      if (0x5555555555555556 * (((char *)v33.__end_cap_.__value_ - (char *)v33.__begin_) >> 3) > v25)
        v25 = 0x5555555555555556 * (((char *)v33.__end_cap_.__value_ - (char *)v33.__begin_) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v33.__end_cap_.__value_ - (char *)v33.__begin_) >> 3) >= 0x555555555555555)
        v26 = 0xAAAAAAAAAAAAAAALL;
      else
        v26 = v25;
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v33.__end_cap_;
      if (v26)
        v27 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v33.__end_cap_, v26);
      else
        v27 = 0;
      v28 = v27 + v24;
      __v.__first_ = v27;
      __v.__begin_ = v28;
      __v.__end_cap_.__value_ = &v27[v26];
      v29 = *(_OWORD *)__p;
      v28->__r_.__value_.__r.__words[2] = v32;
      *(_OWORD *)&v28->__r_.__value_.__l.__data_ = v29;
      __p[1] = 0;
      v32 = 0;
      __p[0] = 0;
      __v.__end_ = v28 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v33, &__v);
      v30 = v33.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v33.__end_ = v30;
      if (SHIBYTE(v32) < 0)
        operator delete(__p[0]);
    }
    else
    {
      v23 = *(_OWORD *)__p;
      v33.__end_->__r_.__value_.__r.__words[2] = v32;
      *(_OWORD *)&v22->__r_.__value_.__l.__data_ = v23;
      v33.__end_ = v22 + 1;
    }
  }
  if (v33.__end_ != v33.__begin_)
  {
    ctu::join<std::__wrap_iter<std::string *>>(v33.__begin_, v33.__end_, " | ", 3uLL, (std::string *)&__v);
    if (*((char *)a2 + 23) < 0)
      operator delete(*a2);
    *(_OWORD *)a2 = *(_OWORD *)&__v.__first_;
    a2[2] = __v.__end_;
  }
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v33;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
}

void sub_24B9F3B38(_Unwind_Exception *a1, void *__p, uint64_t a3, int a4, __int16 a5, char a6, char a7, char a8, uint64_t a9, char *__pa, std::__split_buffer<std::string> *a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v19;

  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a19);
  if (a15 < 0)
    operator delete(__pa);
  __pa = &a16;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  if (*(char *)(v19 + 23) < 0)
    operator delete(*(void **)v19);
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::supportsBBCrashExt(capabilities::etl *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBAF0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBAF0))
  {
    _MergedGlobals_8 = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_2544DBAF0);
  }
  return _MergedGlobals_8;
}

void sub_24B9F3C08(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBAF0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::supportsBBAppsCrash(capabilities::etl *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBAF8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBAF8))
  {
    byte_2544DBAB1 = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_2544DBAF8);
  }
  return byte_2544DBAB1;
}

void sub_24B9F3C80(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBAF8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::maverickTxPowerUsesRFSubsys(capabilities::etl *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBB00);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBB00))
  {
    byte_2544DBAB2 = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_2544DBB00);
  }
  return byte_2544DBAB2;
}

void sub_24B9F3CF8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBB00);
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::supportsMaverickEraseEFSCommand(capabilities::etl *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBB08);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBB08))
  {
    TelephonyRadiosGetRadioVendor();
    byte_2544DBAB3 = 0;
    __cxa_guard_release(&qword_2544DBB08);
  }
  return byte_2544DBAB3;
}

void sub_24B9F3D68(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBB08);
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::getNVRAMExtItemIDDIAGoverHSCoreType(capabilities::etl *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBB10);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBB10))
  {
    dword_2544DBAC0 = 2 * (TelephonyRadiosGetRadioVendor() != 1);
    __cxa_guard_release(&qword_2544DBB10);
  }
  return dword_2544DBAC0;
}

void sub_24B9F3DE4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBB10);
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::getNVRAMExtItemIDHSICEnabledType(capabilities::etl *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBB18);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBB18))
  {
    dword_2544DBAC4 = 2 * (TelephonyRadiosGetRadioVendor() != 1);
    __cxa_guard_release(&qword_2544DBB18);
  }
  return dword_2544DBAC4;
}

void sub_24B9F3E60(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBB18);
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::getNVRAMExtItemIDLTEBandPreferenceType(capabilities::etl *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBB20);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBB20))
  {
    dword_2544DBAC8 = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_2544DBB20);
  }
  return dword_2544DBAC8;
}

void sub_24B9F3ED8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBB20);
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::getNVRAMExtItemGNSSMainWWANTxAntennaIMJammingPowerType(capabilities::etl *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBB28);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBB28))
  {
    dword_2544DBACC = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_2544DBB28);
  }
  return dword_2544DBACC;
}

void sub_24B9F3F50(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBB28);
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::getNVRAMExtItemGNSSAuxWWANTxAntennaIMJammingPowerType(capabilities::etl *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBB30);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBB30))
  {
    dword_2544DBAD0 = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_2544DBB30);
  }
  return dword_2544DBAD0;
}

void sub_24B9F3FC8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBB30);
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::getNVRAMExtItemGNSSWLANBTDeltaTxAntennaIMJammingPowerType(capabilities::etl *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBB38);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBB38))
  {
    dword_2544DBAD4 = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_2544DBB38);
  }
  return dword_2544DBAD4;
}

void sub_24B9F4040(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBB38);
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::getNVRAMExtItemIDHDRAcqDivEnableType(capabilities::etl *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBB40);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBB40))
  {
    dword_2544DBAD8 = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_2544DBB40);
  }
  return dword_2544DBAD8;
}

void sub_24B9F40B8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBB40);
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::getNVRAMExtItemIDHDRAcqDivThresh0Type(capabilities::etl *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBB48);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBB48))
  {
    dword_2544DBADC = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_2544DBB48);
  }
  return dword_2544DBADC;
}

void sub_24B9F4130(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBB48);
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::getNVRAMExtItemIDHDRAcqDivThresh1Type(capabilities::etl *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBB50);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBB50))
  {
    dword_2544DBAE0 = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_2544DBB50);
  }
  return dword_2544DBAE0;
}

void sub_24B9F41A8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBB50);
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::supportsMaverickGetICCIDV2(capabilities::etl *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBB58);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBB58))
  {
    byte_2544DBAB4 = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_2544DBB58);
  }
  return byte_2544DBAB4;
}

void sub_24B9F4220(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBB58);
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::shouldDoMaverickIsSimPresentExt(capabilities::etl *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBB60);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBB60))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBAB5 = (Radio < 0x12) & (0x23E0Cu >> Radio);
    __cxa_guard_release(&qword_2544DBB60);
  }
  return byte_2544DBAB5;
}

void sub_24B9F42A8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBB60);
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::getMavSHAHashLenType(capabilities::etl *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBB68);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBB68))
  {
    v3 = TelephonyRadiosGetRadio() - 2;
    if (v3 > 0xF)
      v4 = 2;
    else
      v4 = dword_24BA00DFC[v3];
    dword_2544DBAE4 = v4;
    __cxa_guard_release(&qword_2544DBB68);
  }
  return dword_2544DBAE4;
}

void sub_24B9F4338(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBB68);
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::shouldDoLegacyCalibrationCheck(capabilities::etl *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBB70);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBB70))
  {
    byte_2544DBAB6 = (TelephonyRadiosGetRadio() & 0xFFFFFFFE) == 2;
    __cxa_guard_release(&qword_2544DBB70);
  }
  return byte_2544DBAB6;
}

void sub_24B9F43B4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBB70);
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::supportsM20PlusFusing(capabilities::etl *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBB78);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBB78))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBAB7 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_2544DBB78);
  }
  return byte_2544DBAB7;
}

void sub_24B9F443C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBB78);
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::supportsM20PlusIMEI(capabilities::etl *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBB80);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBB80))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBAB8 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_2544DBB80);
  }
  return byte_2544DBAB8;
}

void sub_24B9F44C4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBB80);
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::shouldDoIPALoopbackV2(capabilities::etl *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBB88);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBB88))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBAB9 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_2544DBB88);
  }
  return byte_2544DBAB9;
}

void sub_24B9F454C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBB88);
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::shouldDoMHIPeriodicRemoteWakeV2(capabilities::etl *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBB90);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBB90))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBABA = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_2544DBB90);
  }
  return byte_2544DBABA;
}

void sub_24B9F45D4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBB90);
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::shouldUseQueryGUIDV3(capabilities::etl *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBB98);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBB98))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBABB = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_2544DBB98);
  }
  return byte_2544DBABB;
}

void sub_24B9F465C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBB98);
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::supportsDoGetSIMType(capabilities::etl *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBBA0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBBA0))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBABC = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_2544DBBA0);
  }
  return byte_2544DBABC;
}

void sub_24B9F46E4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBBA0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::supportsDoGetRFCStatus(capabilities::etl *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBBA8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBBA8))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBABD = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_2544DBBA8);
  }
  return byte_2544DBABD;
}

void sub_24B9F476C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBBA8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::getMaverickIPALoopbackV2ParametersType(capabilities::etl *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBBB0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBBB0))
  {
    v3 = TelephonyRadiosGetRadio() - 9;
    if (v3 > 8)
      v4 = 2;
    else
      v4 = dword_24BA00E3C[v3];
    dword_2544DBAE8 = v4;
    __cxa_guard_release(&qword_2544DBBB0);
  }
  return dword_2544DBAE8;
}

void sub_24B9F47FC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBBB0);
  _Unwind_Resume(a1);
}

_QWORD *capabilities::etl::asString@<X0>(unsigned int a1@<W0>, _QWORD *a2@<X8>)
{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = off_251CC9240[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = off_251CC9258[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = off_251CC9270[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = off_251CC9270[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

_QWORD *capabilities::etl::asString@<X0>(int a1@<W0>, _QWORD *a2@<X8>)
{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kPrimary";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kNotFound";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kPrimary";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kNotFound";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kPrimary";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kNotFound";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kPrimary";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kNotFound";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kPrimary";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kNotFound";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kPrimary";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kNotFound";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kPrimary";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kNotFound";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

uint64_t capabilities::fusing::supportsCertIDFromSerialNumber(capabilities::fusing *this)
{
  unsigned __int8 v1;
  unint64_t v2;
  int v4;

  v2 = 0x2579B9000uLL;
  if ((v1 & 1) == 0)
  {
    v2 = 0x2579B9000uLL;
    if (v4)
    {
      capabilities::fusing::supportsCertIDFromSerialNumber(void)::ret = 0;
      v2 = 0x2579B9000;
    }
  }
  return *(unsigned __int8 *)(v2 + 400);
}

uint64_t capabilities::fusing::modeSetTimeout(capabilities::fusing *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBBC0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBBC0))
  {
    _MergedGlobals_9 = 4000;
    __cxa_guard_release(&qword_2544DBBC0);
  }
  return _MergedGlobals_9;
}

uint64_t capabilities::fusing::commandTimeout(capabilities::fusing *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBBD0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBBD0))
  {
    qword_2544DBBC8 = 2000;
    __cxa_guard_release(&qword_2544DBBD0);
  }
  return qword_2544DBBC8;
}

uint64_t capabilities::fusing::supportsCertIDFromPublicKeyHash(capabilities::fusing *this)
{
  unsigned __int8 v1;
  unsigned int RadioVendor;

  if ((v1 & 1) == 0
  {
    RadioVendor = TelephonyRadiosGetRadioVendor();
    capabilities::fusing::supportsCertIDFromPublicKeyHash(void)::ret = (RadioVendor < 5) & (0x16u >> RadioVendor);
  }
  return capabilities::fusing::supportsCertIDFromPublicKeyHash(void)::ret;
}

void sub_24B9F4B74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t capabilities::fusing::defaultCertID(capabilities::fusing *this)
{
  unsigned __int8 v1;
  capabilities::fusing *v3;

  if ((v1 & 1) == 0)
  {
    if ((_DWORD)v3)
    {
      capabilities::fusing::defaultCertID(void)::ret = capabilities::fusing::sDefaultCertID(v3);
    }
  }
  return capabilities::fusing::defaultCertID(void)::ret;
}

void sub_24B9F4BE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t capabilities::fusing::sDefaultCertID(capabilities::fusing *this)
{
  int Product;
  int v2;
  uint64_t result;

  Product = TelephonyRadiosGetProduct();
  v2 = Product;
  if (Product > 201)
  {
    if (Product == 212)
      return 3557748310;
    else
      return 0;
  }
  else
  {
    result = 3425784744;
    switch(v2)
    {
      case 73:
      case 120:
      case 123:
      case 136:
        return result;
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 112:
      case 113:
      case 118:
      case 119:
      case 121:
      case 122:
      case 127:
      case 128:
      case 129:
      case 130:
      case 131:
      case 139:
      case 140:
      case 141:
      case 153:
      case 154:
      case 155:
      case 156:
        return 0;
      case 99:
      case 100:
      case 101:
      case 102:
      case 108:
      case 109:
      case 110:
      case 111:
      case 114:
      case 115:
      case 116:
      case 117:
      case 124:
      case 125:
      case 126:
      case 132:
      case 133:
      case 134:
      case 135:
      case 137:
      case 138:
      case 142:
      case 143:
      case 144:
      case 145:
      case 146:
      case 147:
      case 148:
      case 149:
      case 150:
      case 151:
      case 152:
      case 157:
      case 158:
      case 159:
        return 3557748310;
      default:
        if ((v2 - 52) >= 2)
          return 0;
        break;
    }
  }
  return result;
}

_QWORD *capabilities::fusing::asString@<X0>(unsigned int a1@<W0>, _QWORD *a2@<X8>)
{
  char *v2;

  if (a1 > 3)
    v2 = "???";
  else
    v2 = off_251CC9288[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

uint64_t capabilities::fusing::getFusingState(char **a1, int a2)
{
  const unsigned int *v3;
  uint64_t v4;
  void *__p[3];
  int v7;

  v7 = a2;
  if (!capabilities::fusing::supportsCertIDFromSerialNumber((capabilities::fusing *)a1))
    return ctu::TelephonyUtilRadioFusingInferFusingStateFromCertID((ctu *)&v7, v3);
  memset(__p, 170, sizeof(__p));
  std::string::__init_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>(__p, *a1, a1[1], a1[1] - *a1);
  v4 = ctu::TelephonyUtilRadioFusingInferFusingStateFromSerialNumber();
  if (SHIBYTE(__p[2]) < 0)
    operator delete(__p[0]);
  return v4;
}

void sub_24B9F4D20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t capabilities::fusing::getFusingStateStr@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  switch((_DWORD)result)
  {
    case 1:
      *(_BYTE *)(a2 + 23) = 8;
      *(_QWORD *)a2 = 0x64657375462D6E55;
      break;
    case 2:
      *(_BYTE *)(a2 + 23) = 20;
      *(_DWORD *)(a2 + 16) = 1852795252;
      *(_OWORD *)a2 = *(_OWORD *)"Fused Pre Validation";
      break;
    case 3:
      *(_BYTE *)(a2 + 23) = 5;
      *(_DWORD *)a2 = 1702065478;
      *(_BYTE *)(a2 + 4) = 100;
      break;
    default:
      *(_BYTE *)(a2 + 23) = 7;
      *(_DWORD *)a2 = 1852534357;
      *(_DWORD *)(a2 + 3) = 1853321070;
      break;
  }
  return result;
}

uint64_t capabilities::fusing::inferFusingStateFromSerialNumber(capabilities::fusing *a1)
{
  uint64_t result;
  unint64_t v3;
  int v4;
  uint64_t v5;
  capabilities::fusing *v6;
  unsigned int v7;

  result = capabilities::fusing::supportsCertIDFromSerialNumber(a1);
  if ((_DWORD)result)
  {
    v3 = *((unsigned __int8 *)a1 + 23);
    v4 = (char)v3;
    if ((v3 & 0x80u) != 0)
      v3 = *((_QWORD *)a1 + 1);
    if (v3)
    {
      v5 = 0;
      if (v4 >= 0)
        v6 = a1;
      else
        v6 = *(capabilities::fusing **)a1;
      v7 = 1;
      while (!*((_BYTE *)v6 + v5))
      {
        v5 = v7;
        if (v3 <= v7++)
          return 1;
      }
      return 3;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t capabilities::fusing::inferFusingStateFromSerialNumber(capabilities::fusing *this)
{
  int v1;
  int v2;
  unsigned int v3;

  v1 = (int)this;
  v2 = capabilities::fusing::supportsCertIDFromSerialNumber(this);
  if (v1)
    v3 = 3;
  else
    v3 = 1;
  if (v2)
    return v3;
  else
    return 0;
}

uint64_t capabilities::fusing::inferFusingStateFromCertID(capabilities::fusing *this)
{
  int v1;
  uint64_t result;

  v1 = (int)this;
  result = capabilities::fusing::supportsCertIDFromPublicKeyHash(this);
  if ((_DWORD)result)
  {
    if (v1)
    {
      if (capabilities::fusing::defaultCertID((capabilities::fusing *)result) == v1)
        return 1;
      else
        return 3;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t capabilities::fusing::getState(char **a1, capabilities::fusing *a2)
{
  uint64_t v4;
  void *__p[3];

  if (!capabilities::fusing::supportsCertIDFromSerialNumber((capabilities::fusing *)a1))
    return capabilities::fusing::inferFusingStateFromCertID(a2);
  memset(__p, 170, sizeof(__p));
  std::string::__init_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>(__p, *a1, a1[1], a1[1] - *a1);
  v4 = capabilities::fusing::inferFusingStateFromSerialNumber((capabilities::fusing *)__p);
  if (SHIBYTE(__p[2]) < 0)
    operator delete(__p[0]);
  return v4;
}

_QWORD *std::string::__init_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>(_QWORD *result, char *a2, char *a3, unint64_t a4)
{
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (a4 > 0x16)
  {
    v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17)
      v8 = a4 | 7;
    v9 = v8 + 1;
    result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    *v4 = result;
    v4 = result;
  }
  else
  {
    *((_BYTE *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    v10 = *a2++;
    *(_BYTE *)v4 = v10;
    v4 = (_QWORD *)((char *)v4 + 1);
  }
  *(_BYTE *)v4 = 0;
  return result;
}

uint64_t capabilities::ipc::supportsRouter(capabilities::ipc *this)
{
  unsigned __int8 v1;
  capabilities::ipc *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBBE8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ipc *)__cxa_guard_acquire(&qword_2544DBBE8);
    if ((_DWORD)v3)
    {
      _MergedGlobals_10 = capabilities::ipc::typeInternal(v3) & 1;
      __cxa_guard_release(&qword_2544DBBE8);
    }
  }
  return _MergedGlobals_10;
}

void sub_24B9F5050(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBBE8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ipc::supportsHSIC(capabilities::ipc *this)
{
  unsigned __int8 v1;
  capabilities::ipc *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBBF0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ipc *)__cxa_guard_acquire(&qword_2544DBBF0);
    if ((_DWORD)v3)
    {
      byte_2544DBBD9 = (capabilities::ipc::typeInternal(v3) & 4) != 0;
      __cxa_guard_release(&qword_2544DBBF0);
    }
  }
  return byte_2544DBBD9;
}

void sub_24B9F50C4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBBF0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ipc::supportsUART(capabilities::ipc *this)
{
  unsigned __int8 v1;
  capabilities::ipc *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBBF8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ipc *)__cxa_guard_acquire(&qword_2544DBBF8);
    if ((_DWORD)v3)
    {
      byte_2544DBBDA = (capabilities::ipc::typeInternal(v3) & 8) != 0;
      __cxa_guard_release(&qword_2544DBBF8);
    }
  }
  return byte_2544DBBDA;
}

void sub_24B9F5138(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBBF8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ipc::supportsPCI(capabilities::ipc *this)
{
  unsigned __int8 v1;
  capabilities::ipc *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBC00);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ipc *)__cxa_guard_acquire(&qword_2544DBC00);
    if ((_DWORD)v3)
    {
      byte_2544DBBDB = (capabilities::ipc::typeInternal(v3) & 0x10) != 0;
      __cxa_guard_release(&qword_2544DBC00);
    }
  }
  return byte_2544DBBDB;
}

void sub_24B9F51AC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBC00);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ipc::controlDataPrintSizeBytes(capabilities::ipc *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBC10);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBC10))
  {
    qword_2544DBC08 = 20;
    __cxa_guard_release(&qword_2544DBC10);
  }
  return qword_2544DBC08;
}

uint64_t capabilities::ipc::supportsUnifiedQMux(capabilities::ipc *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBC18);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBC18))
  {
    byte_2544DBBDC = 0;
    __cxa_guard_release(&qword_2544DBC18);
  }
  return byte_2544DBBDC;
}

uint64_t capabilities::ipc::typeInternal(capabilities::ipc *this)
{
  unsigned __int8 v1;
  int v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBC20);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBC20))
  {
    if (TelephonyRadiosGetRadioVendor() - 1 >= 4)
      v3 = 0;
    else
      v3 = 17;
    dword_2544DBBE0 = v3;
    __cxa_guard_release(&qword_2544DBC20);
  }
  return dword_2544DBBE0;
}

void sub_24B9F52C8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBC20);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ipc::supportsUnifiedQMuxV2(capabilities::ipc *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBC28);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBC28))
  {
    byte_2544DBBDD = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_2544DBC28);
  }
  return byte_2544DBBDD;
}

void sub_24B9F5340(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBC28);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ipc::QMIInstanceCount(capabilities::ipc *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBC38);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBC38))
  {
    v3 = TelephonyRadiosGetRadio() - 2;
    if (v3 > 0xF)
      v4 = 0;
    else
      v4 = qword_24BA00EB8[v3];
    qword_2544DBC30 = v4;
    __cxa_guard_release(&qword_2544DBC38);
  }
  return qword_2544DBC30;
}

void sub_24B9F53D0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBC38);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ipc::supportsIPMetadataTrailer(capabilities::ipc *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBC40);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBC40))
  {
    byte_2544DBBDE = (TelephonyRadiosGetRadio() & 0xFFFFFFFE) == 2;
    __cxa_guard_release(&qword_2544DBC40);
  }
  return byte_2544DBBDE;
}

void sub_24B9F544C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBC40);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ipc::defaultPCIBinaryTraceHistorySizeMB(capabilities::ipc *this)
{
  unsigned __int8 v1;
  int Radio;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBC50);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBC50))
  {
    Radio = TelephonyRadiosGetRadio();
    v4 = 64;
    if ((Radio & 0xFFFFFFFE) == 0xE)
      v4 = 256;
    qword_2544DBC48 = v4;
    __cxa_guard_release(&qword_2544DBC50);
  }
  return qword_2544DBC48;
}

void sub_24B9F54D0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBC50);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ipc::defaultHistorySizeMB(capabilities::ipc *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBC60);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBC60))
  {
    v3 = TelephonyRadiosGetRadio() - 9;
    if (v3 > 8)
      v4 = 8;
    else
      v4 = qword_24BA00F38[v3];
    qword_2544DBC58 = v4;
    __cxa_guard_release(&qword_2544DBC60);
  }
  return qword_2544DBC58;
}

void sub_24B9F5560(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBC60);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ipc::defaultLogLevel(capabilities::ipc *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBC68);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBC68))
  {
    v3 = TelephonyRadiosGetRadio() - 9;
    if (v3 > 8)
      v4 = -1;
    else
      v4 = dword_24BA00F80[v3];
    dword_2544DBBE4 = v4;
    __cxa_guard_release(&qword_2544DBC68);
  }
  return dword_2544DBBE4;
}

void sub_24B9F55F0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBC68);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ipc::defaultMHIConfigPayloadSizeBytes(capabilities::ipc *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBC78);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBC78))
  {
    v3 = TelephonyRadiosGetRadio() - 9;
    if (v3 > 8)
      v4 = -1;
    else
      v4 = qword_24BA00FA8[v3];
    qword_2544DBC70 = v4;
    __cxa_guard_release(&qword_2544DBC78);
  }
  return qword_2544DBC70;
}

void sub_24B9F5680(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBC78);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ipc::supportsCoalescing(capabilities::ipc *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBC80);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBC80))
  {
    byte_2544DBBDF = ((TelephonyRadiosGetRadio() - 13) & 0xFFFFFFFB) == 0;
    __cxa_guard_release(&qword_2544DBC80);
  }
  return byte_2544DBBDF;
}

void sub_24B9F56FC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBC80);
  _Unwind_Resume(a1);
}

uint64_t capabilities::ipc::operator&(unsigned int a1, int a2)
{
  return a2 & a1;
}

_DWORD *capabilities::ipc::operator&=(_DWORD *result, int a2)
{
  *result &= a2;
  return result;
}

uint64_t capabilities::ipc::operator|(unsigned int a1, int a2)
{
  return a2 | a1;
}

_DWORD *capabilities::ipc::operator|=(_DWORD *result, int a2)
{
  *result |= a2;
  return result;
}

uint64_t capabilities::ipc::operator^(unsigned int a1, int a2)
{
  return a2 ^ a1;
}

_DWORD *capabilities::ipc::operator^=(_DWORD *result, int a2)
{
  *result ^= a2;
  return result;
}

uint64_t capabilities::ipc::operator~(int a1)
{
  return ~a1;
}

void capabilities::ipc::asString(int a1@<W0>, uint64_t a2@<X8>)
{
  std::vector<std::string>::pointer end;
  __int128 v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  std::string *v9;
  std::string *v10;
  __int128 v11;
  std::string *v12;
  std::vector<std::string>::pointer v13;
  __int128 v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  std::string *v18;
  std::string *v19;
  __int128 v20;
  std::string *v21;
  std::vector<std::string>::pointer v22;
  __int128 v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  std::string *v27;
  std::string *v28;
  __int128 v29;
  std::string *v30;
  std::vector<std::string>::pointer v31;
  __int128 v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  std::string *v36;
  std::string *v37;
  __int128 v38;
  std::string *v39;
  void *__p[2];
  std::string::size_type v41;
  std::vector<std::string> v42;
  void *v43[3];
  std::__split_buffer<std::string> __v;

  memset(v43, 170, sizeof(v43));
  std::string::basic_string[abi:ne180100]<0>(v43, "???");
  memset(&v42, 0, sizeof(v42));
  if (!a1)
  {
    std::string::basic_string[abi:ne180100]<0>((_QWORD *)a2, "kNone");
    goto LABEL_66;
  }
  if ((a1 & 1) == 0)
    goto LABEL_17;
  std::string::basic_string[abi:ne180100]<0>(__p, "kRouter");
  end = v42.__end_;
  if (v42.__end_ < v42.__end_cap_.__value_)
  {
    v5 = *(_OWORD *)__p;
    v42.__end_->__r_.__value_.__r.__words[2] = v41;
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v5;
    v42.__end_ = end + 1;
    if ((a1 & 4) == 0)
      goto LABEL_32;
LABEL_18:
    std::string::basic_string[abi:ne180100]<0>(__p, "kHSIC");
    v13 = v42.__end_;
    if (v42.__end_ >= v42.__end_cap_.__value_)
    {
      v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_ - (char *)v42.__begin_) >> 3);
      v16 = v15 + 1;
      if (v15 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      if (0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) > v16)
        v16 = 0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) >= 0x555555555555555)
        v17 = 0xAAAAAAAAAAAAAAALL;
      else
        v17 = v16;
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v42.__end_cap_;
      if (v17)
        v18 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v42.__end_cap_, v17);
      else
        v18 = 0;
      v19 = v18 + v15;
      __v.__first_ = v18;
      __v.__begin_ = v19;
      __v.__end_cap_.__value_ = &v18[v17];
      v20 = *(_OWORD *)__p;
      v19->__r_.__value_.__r.__words[2] = v41;
      *(_OWORD *)&v19->__r_.__value_.__l.__data_ = v20;
      __p[1] = 0;
      v41 = 0;
      __p[0] = 0;
      __v.__end_ = v19 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v42, &__v);
      v21 = v42.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v42.__end_ = v21;
      if (SHIBYTE(v41) < 0)
        operator delete(__p[0]);
    }
    else
    {
      v14 = *(_OWORD *)__p;
      v42.__end_->__r_.__value_.__r.__words[2] = v41;
      *(_OWORD *)&v13->__r_.__value_.__l.__data_ = v14;
      v42.__end_ = v13 + 1;
    }
    goto LABEL_32;
  }
  v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_ - (char *)v42.__begin_) >> 3);
  v7 = v6 + 1;
  if (v6 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  if (0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) > v7)
    v7 = 0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3);
  v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) >= 0x555555555555555
     ? 0xAAAAAAAAAAAAAAALL
     : v7;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v42.__end_cap_;
  v9 = v8
     ? (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v42.__end_cap_, v8)
     : 0;
  v10 = v9 + v6;
  __v.__first_ = v9;
  __v.__begin_ = v10;
  __v.__end_cap_.__value_ = &v9[v8];
  v11 = *(_OWORD *)__p;
  v10->__r_.__value_.__r.__words[2] = v41;
  *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
  __p[1] = 0;
  v41 = 0;
  __p[0] = 0;
  __v.__end_ = v10 + 1;
  std::vector<std::string>::__swap_out_circular_buffer(&v42, &__v);
  v12 = v42.__end_;
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  v42.__end_ = v12;
  if (SHIBYTE(v41) < 0)
  {
    operator delete(__p[0]);
    if ((a1 & 4) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_17:
    if ((a1 & 4) != 0)
      goto LABEL_18;
  }
  if ((a1 & 8) == 0)
    goto LABEL_46;
LABEL_32:
  std::string::basic_string[abi:ne180100]<0>(__p, "kUART");
  v22 = v42.__end_;
  if (v42.__end_ < v42.__end_cap_.__value_)
  {
    v23 = *(_OWORD *)__p;
    v42.__end_->__r_.__value_.__r.__words[2] = v41;
    *(_OWORD *)&v22->__r_.__value_.__l.__data_ = v23;
    v42.__end_ = v22 + 1;
    if ((a1 & 0x10) == 0)
      goto LABEL_61;
LABEL_47:
    std::string::basic_string[abi:ne180100]<0>(__p, "kPCI");
    v31 = v42.__end_;
    if (v42.__end_ >= v42.__end_cap_.__value_)
    {
      v33 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_ - (char *)v42.__begin_) >> 3);
      v34 = v33 + 1;
      if (v33 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      if (0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) > v34)
        v34 = 0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) >= 0x555555555555555)
        v35 = 0xAAAAAAAAAAAAAAALL;
      else
        v35 = v34;
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v42.__end_cap_;
      if (v35)
        v36 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v42.__end_cap_, v35);
      else
        v36 = 0;
      v37 = v36 + v33;
      __v.__first_ = v36;
      __v.__begin_ = v37;
      __v.__end_cap_.__value_ = &v36[v35];
      v38 = *(_OWORD *)__p;
      v37->__r_.__value_.__r.__words[2] = v41;
      *(_OWORD *)&v37->__r_.__value_.__l.__data_ = v38;
      __p[1] = 0;
      v41 = 0;
      __p[0] = 0;
      __v.__end_ = v37 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v42, &__v);
      v39 = v42.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v42.__end_ = v39;
      if (SHIBYTE(v41) < 0)
        operator delete(__p[0]);
    }
    else
    {
      v32 = *(_OWORD *)__p;
      v42.__end_->__r_.__value_.__r.__words[2] = v41;
      *(_OWORD *)&v31->__r_.__value_.__l.__data_ = v32;
      v42.__end_ = v31 + 1;
    }
    goto LABEL_61;
  }
  v24 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_ - (char *)v42.__begin_) >> 3);
  v25 = v24 + 1;
  if (v24 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  if (0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) > v25)
    v25 = 0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3);
  v26 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) >= 0x555555555555555
      ? 0xAAAAAAAAAAAAAAALL
      : v25;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v42.__end_cap_;
  v27 = v26
      ? (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v42.__end_cap_, v26): 0;
  v28 = v27 + v24;
  __v.__first_ = v27;
  __v.__begin_ = v28;
  __v.__end_cap_.__value_ = &v27[v26];
  v29 = *(_OWORD *)__p;
  v28->__r_.__value_.__r.__words[2] = v41;
  *(_OWORD *)&v28->__r_.__value_.__l.__data_ = v29;
  __p[1] = 0;
  v41 = 0;
  __p[0] = 0;
  __v.__end_ = v28 + 1;
  std::vector<std::string>::__swap_out_circular_buffer(&v42, &__v);
  v30 = v42.__end_;
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  v42.__end_ = v30;
  if (SHIBYTE(v41) < 0)
  {
    operator delete(__p[0]);
    if ((a1 & 0x10) != 0)
      goto LABEL_47;
  }
  else
  {
LABEL_46:
    if ((a1 & 0x10) != 0)
      goto LABEL_47;
  }
LABEL_61:
  if (v42.__end_ != v42.__begin_)
  {
    ctu::join<std::__wrap_iter<std::string *>>(v42.__begin_, v42.__end_, " | ", 3uLL, (std::string *)&__v);
    if (SHIBYTE(v43[2]) < 0)
      operator delete(v43[0]);
    *(_OWORD *)v43 = *(_OWORD *)&__v.__first_;
    v43[2] = __v.__end_;
  }
  *(_OWORD *)a2 = *(_OWORD *)v43;
  *(void **)(a2 + 16) = v43[2];
  memset(v43, 0, sizeof(v43));
LABEL_66:
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v42;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  if (SHIBYTE(v43[2]) < 0)
    operator delete(v43[0]);
}

void sub_24B9F5CB8(_Unwind_Exception *__p, uint64_t a2, int a3, __int16 a4, char a5, char a6, char a7, uint64_t a8, int *__pa, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, std::__split_buffer<std::string> *a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a24);
  if (SHIBYTE(a11) < 0)
    operator delete(__pa);
  __pa = &a12;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  if (a23 < 0)
    operator delete(a18);
  _Unwind_Resume(__p);
}

_QWORD *capabilities::ipc::asString@<X0>(unsigned int a1@<W0>, _QWORD *a2@<X8>)
{
  char *v2;

  if (a1 > 5)
    v2 = "???";
  else
    v2 = off_251CC92A8[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

_QWORD *capabilities::diag::QMuxName@<X0>(_QWORD *a1@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a1, "qmux2");
}

uint64_t capabilities::diag::interfaceToUSBLocationID()
{
  return 0xFFFFLL;
}

BOOL capabilities::diag::interfaceIsUSB(int a1)
{
  return a1 != 1;
}

uint64_t capabilities::pci::controlChannelCount(capabilities::pci *this)
{
  unsigned __int8 v1;
  capabilities::pci *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBC98);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::pci *)__cxa_guard_acquire(&qword_2544DBC98);
    if ((_DWORD)v3)
    {
      qword_2544DBC90 = capabilities::pci::sControlChannelCount(v3);
      __cxa_guard_release(&qword_2544DBC98);
    }
  }
  return qword_2544DBC90;
}

void sub_24B9F5DE8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBC98);
  _Unwind_Resume(a1);
}

uint64_t capabilities::pci::sControlChannelCount(capabilities::pci *this)
{
  unsigned int v1;

  v1 = TelephonyRadiosGetRadioVendor() - 1;
  if (v1 > 3)
    return 0;
  else
    return qword_24BA00FF0[v1];
}

uint64_t capabilities::pci::supportsPCIAudio(capabilities::pci *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBCA0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DBCA0);
    if ((_DWORD)v3)
    {
      _MergedGlobals_11 = capabilities::ct::sSupportsHydra(v3);
      __cxa_guard_release(&qword_2544DBCA0);
    }
  }
  return _MergedGlobals_11;
}

void sub_24B9F5E90(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBCA0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::trace::allowed(capabilities::trace *this)
{
  if (qword_2544DBCB0 != -1)
    dispatch_once(&qword_2544DBCB0, &__block_literal_global_0);
  return _MergedGlobals_12;
}

uint64_t ___ZN12capabilities5trace7allowedEv_block_invoke()
{
  uint64_t result;
  char v1;

  result = TelephonyUtilTraceAllowed();
  if ((_DWORD)result)
  {
    result = os_variant_uses_ephemeral_storage();
    v1 = result ^ 1;
  }
  else
  {
    v1 = 0;
  }
  _MergedGlobals_12 = v1;
  return result;
}

uint64_t capabilities::trace::supportsBasebandIPCTrace(capabilities::trace *this)
{
  if (qword_2544DBCB8 != -1)
    dispatch_once(&qword_2544DBCB8, &__block_literal_global_3);
  return byte_2544DBCA9;
}

uint64_t ___ZN12capabilities5trace24supportsBasebandIPCTraceEv_block_invoke(capabilities::traceinternal *a1)
{
  uint64_t result;

  if (qword_2544DBCB0 != -1)
    dispatch_once(&qword_2544DBCB0, &__block_literal_global_0);
  if (_MergedGlobals_12)
    result = capabilities::traceinternal::supportsBasebandIPCTrace(a1);
  else
    result = 0;
  byte_2544DBCA9 = result;
  return result;
}

uint64_t capabilities::trace::supportsKernelPCITrace(capabilities::trace *this)
{
  if (qword_2544DBCC0 != -1)
    dispatch_once(&qword_2544DBCC0, &__block_literal_global_5);
  return byte_2544DBCAA;
}

uint64_t ___ZN12capabilities5trace22supportsKernelPCITraceEv_block_invoke(capabilities::traceinternal *a1)
{
  uint64_t result;

  if (qword_2544DBCB0 != -1)
    dispatch_once(&qword_2544DBCB0, &__block_literal_global_0);
  if (_MergedGlobals_12)
    result = capabilities::traceinternal::supportsKernelPCITrace(a1);
  else
    result = 0;
  byte_2544DBCAA = result;
  return result;
}

uint64_t capabilities::trace::supportsKernelPCIBinaryTrace(capabilities::trace *this)
{
  if (qword_2544DBCC8 != -1)
    dispatch_once(&qword_2544DBCC8, &__block_literal_global_7);
  return byte_2544DBCAB;
}

uint64_t ___ZN12capabilities5trace28supportsKernelPCIBinaryTraceEv_block_invoke(capabilities::traceinternal *a1)
{
  uint64_t result;

  if (qword_2544DBCB0 != -1)
    dispatch_once(&qword_2544DBCB0, &__block_literal_global_0);
  if (_MergedGlobals_12)
    result = capabilities::traceinternal::supportsKernelPCIBinaryTrace(a1);
  else
    result = 0;
  byte_2544DBCAB = result;
  return result;
}

uint64_t capabilities::trace::supportsCoreDumpStatus(capabilities::trace *this)
{
  if (qword_2544DBCD0 != -1)
    dispatch_once(&qword_2544DBCD0, &__block_literal_global_9);
  return byte_2544DBCAC;
}

uint64_t ___ZN12capabilities5trace22supportsCoreDumpStatusEv_block_invoke(capabilities::traceinternal *a1)
{
  uint64_t result;

  if (qword_2544DBCB0 != -1)
    dispatch_once(&qword_2544DBCB0, &__block_literal_global_0);
  if (_MergedGlobals_12)
    result = capabilities::traceinternal::supportsCoreDumpStatus(a1);
  else
    result = 0;
  byte_2544DBCAC = result;
  return result;
}

uint64_t capabilities::trace::supportsDumpLogIndication(capabilities::trace *this)
{
  uint64_t result;

  result = TelephonyUtilIsInternalBuild();
  if ((result & 1) != 0)
    return capabilities::traceinternal::supportsDumpLogIndication((capabilities::traceinternal *)result);
  result = TelephonyUtilIsCarrierBuild();
  if ((_DWORD)result)
    return capabilities::traceinternal::supportsDumpLogIndication((capabilities::traceinternal *)result);
  return result;
}

uint64_t capabilities::trace::enabledByDefault(capabilities::trace *this)
{
  if (qword_2544DBCD8 != -1)
    dispatch_once(&qword_2544DBCD8, &__block_literal_global_11);
  return byte_2544DBCAD;
}

uint64_t ___ZN12capabilities5trace16enabledByDefaultEv_block_invoke(capabilities::traceinternal *a1)
{
  uint64_t result;

  if (qword_2544DBCB0 != -1)
    dispatch_once(&qword_2544DBCB0, &__block_literal_global_0);
  if (_MergedGlobals_12)
    result = capabilities::traceinternal::enabledByDefault(a1);
  else
    result = 0;
  byte_2544DBCAD = result;
  return result;
}

uint64_t capabilities::trace::supportsHighTPutByDefault(capabilities::trace *this)
{
  uint64_t result;

  result = capabilities::traceinternal::supportsHighTPutByDefault(this);
  if ((_DWORD)result)
  {
    if (qword_2544DBCD8 != -1)
      dispatch_once(&qword_2544DBCD8, &__block_literal_global_11);
    return byte_2544DBCAD != 0;
  }
  return result;
}

uint64_t capabilities::trace::supportsDataLoggingByDefault(capabilities::trace *this)
{
  uint64_t result;

  result = capabilities::traceinternal::supportsDataLoggingByDefault(this);
  if ((_DWORD)result)
  {
    if (qword_2544DBCD8 != -1)
      dispatch_once(&qword_2544DBCD8, &__block_literal_global_11);
    return byte_2544DBCAD != 0;
  }
  return result;
}

_QWORD *capabilities::trace::asString@<X0>(unsigned int a1@<W0>, _QWORD *a2@<X8>)
{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = off_251CC9458[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = (&off_251CC9568)[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

uint64_t capabilities::programmer::productID(capabilities::programmer *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBCE8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBCE8))
  {
    _MergedGlobals_13 = 0;
    __cxa_guard_release(&qword_2544DBCE8);
  }
  return _MergedGlobals_13;
}

uint64_t capabilities::programmer::connectTimeout(capabilities::programmer *this)
{
  unsigned __int8 v1;
  int RadioVendor;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBCF8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBCF8))
  {
    RadioVendor = TelephonyRadiosGetRadioVendor();
    v4 = 10000;
    if ((RadioVendor - 1) >= 4)
      v4 = 0;
    qword_2544DBCF0 = v4;
    __cxa_guard_release(&qword_2544DBCF8);
  }
  return qword_2544DBCF0;
}

void sub_24B9F63C0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBCF8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::programmer::connectAttemptCount(capabilities::programmer *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBD08);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBD08))
  {
    qword_2544DBD00 = 8 * (TelephonyRadiosGetRadioVendor() - 1 < 4);
    __cxa_guard_release(&qword_2544DBD08);
  }
  return qword_2544DBD00;
}

void sub_24B9F6440(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBD08);
  _Unwind_Resume(a1);
}

uint64_t capabilities::programmer::commandTimeout(capabilities::programmer *this)
{
  unsigned __int8 v1;
  int RadioVendor;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBD18);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBD18))
  {
    RadioVendor = TelephonyRadiosGetRadioVendor();
    v4 = 1000;
    if ((RadioVendor - 1) >= 4)
      v4 = 0;
    qword_2544DBD10 = v4;
    __cxa_guard_release(&qword_2544DBD18);
  }
  return qword_2544DBD10;
}

void sub_24B9F64C0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBD18);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::radioUnknown(capabilities::radio *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBD58);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBD58))
  {
    _MergedGlobals_14 = TelephonyRadiosGetRadioVendor() == 0;
    __cxa_guard_release(&qword_2544DBD58);
  }
  return _MergedGlobals_14;
}

void sub_24B9F6538(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBD58);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::vendor(capabilities::radio *this)
{
  unsigned __int8 v1;

  {
    capabilities::radio::vendor(void)::ret = TelephonyRadiosGetRadioVendor();
  }
  return capabilities::radio::vendor(void)::ret;
}

void sub_24B9F65A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::type(capabilities::radio *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBD60);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBD60))
  {
    dword_2544DBD40 = TelephonyRadiosGetRadio();
    __cxa_guard_release(&qword_2544DBD60);
  }
  return dword_2544DBD40;
}

void sub_24B9F661C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBD60);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::product(capabilities::radio *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBD68);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBD68))
  {
    dword_2544DBD44 = TelephonyRadiosGetProduct();
    __cxa_guard_release(&qword_2544DBD68);
  }
  return dword_2544DBD44;
}

void sub_24B9F6690(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBD68);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::supportsLTECounterIndication(capabilities::radio *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBD70);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBD70))
  {
    byte_2544DBD21 = 0;
    __cxa_guard_release(&qword_2544DBD70);
  }
  return byte_2544DBD21;
}

uint64_t capabilities::radio::supportsFlashless(capabilities::radio *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBD78);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBD78))
  {
    byte_2544DBD22 = 1;
    __cxa_guard_release(&qword_2544DBD78);
  }
  return byte_2544DBD22;
}

uint64_t capabilities::radio::supportsAccessoryTypeDetectionForARTD(capabilities::radio *this)
{
  unsigned __int8 v1;
  capabilities::radio *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBD80);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::radio *)__cxa_guard_acquire(&qword_2544DBD80);
    if ((_DWORD)v3)
    {
      byte_2544DBD23 = capabilities::radio::supportsAccessoryDetectionForARTD(v3);
      __cxa_guard_release(&qword_2544DBD80);
    }
  }
  return byte_2544DBD23;
}

void sub_24B9F67A0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBD80);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::getStartupMode(capabilities::radio *this)
{
  unsigned __int8 v1;
  capabilities::radio *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBD88);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::radio *)__cxa_guard_acquire(&qword_2544DBD88);
    if ((_DWORD)v3)
    {
      dword_2544DBD48 = capabilities::radio::sGetStartupMode(v3);
      __cxa_guard_release(&qword_2544DBD88);
    }
  }
  return dword_2544DBD48;
}

void sub_24B9F6814(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBD88);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::sGetStartupMode(capabilities::radio *this)
{
  unsigned int v1;

  v1 = TelephonyRadiosGetRadioVendor() - 1;
  if (v1 > 3)
    return 0;
  else
    return dword_24BA012F0[v1];
}

uint64_t capabilities::radio::maverick(capabilities::radio *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBD90);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBD90))
  {
    byte_2544DBD24 = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_2544DBD90);
  }
  return byte_2544DBD24;
}

void sub_24B9F68C0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBD90);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::C2KDevice(capabilities::radio *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBD98);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBD98))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBD25 = (Radio < 0x12) & (0x2FFAEu >> Radio);
    __cxa_guard_release(&qword_2544DBD98);
  }
  return byte_2544DBD25;
}

void sub_24B9F6948(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBD98);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::safeResetTime(capabilities::radio *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBDA8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBDA8))
  {
    v3 = TelephonyRadiosGetRadio() - 1;
    if (v3 > 0x10)
      v4 = 0;
    else
      v4 = qword_24BA010D0[v3];
    qword_2544DBDA0 = v4;
    __cxa_guard_release(&qword_2544DBDA8);
  }
  return qword_2544DBDA0;
}

void sub_24B9F69D8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBDA8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::supportsRemoteFilesystem(capabilities::radio *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBDB0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBDB0))
  {
    byte_2544DBD26 = TelephonyRadiosGetRadioVendor() - 1 < 4;
    __cxa_guard_release(&qword_2544DBDB0);
  }
  return byte_2544DBD26;
}

void sub_24B9F6A54(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBDB0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::supportsUMTS(capabilities::radio *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBDB8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBDB8))
  {
    byte_2544DBD27 = TelephonyRadiosGetRadioVendor() - 1 < 4;
    __cxa_guard_release(&qword_2544DBDB8);
  }
  return byte_2544DBD27;
}

void sub_24B9F6AD0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBDB8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::supportsLTE(capabilities::radio *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBDC0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBDC0))
  {
    byte_2544DBD28 = TelephonyRadiosGetRadioVendor() - 1 < 4;
    __cxa_guard_release(&qword_2544DBDC0);
  }
  return byte_2544DBD28;
}

void sub_24B9F6B4C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBDC0);
  _Unwind_Resume(a1);
}

void capabilities::radio::firmwarePath(std::string *a1@<X8>)
{
  unsigned __int8 v3;
  capabilities::radio *v4;

  v3 = atomic_load((unsigned __int8 *)&qword_2544DBDC8);
  if ((v3 & 1) == 0)
  {
    v4 = (capabilities::radio *)__cxa_guard_acquire(&qword_2544DBDC8);
    if ((_DWORD)v4)
    {
      capabilities::radio::sFirmwarePath(v4);
      __cxa_atexit(MEMORY[0x24BEDACF0], &xmmword_2544DBED8, &dword_24B9DC000);
      __cxa_guard_release(&qword_2544DBDC8);
    }
  }
  if (byte_2544DBEEF < 0)
  {
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)xmmword_2544DBED8, *((std::string::size_type *)&xmmword_2544DBED8 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_2544DBED8;
    a1->__r_.__value_.__r.__words[2] = unk_2544DBEE8;
  }
}

void sub_24B9F6C0C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBDC8);
  _Unwind_Resume(a1);
}

std::string *capabilities::radio::sFirmwarePath(capabilities::radio *this)
{
  __int128 *v1;
  std::string *result;
  std::string::size_type v3;
  int v4;

  v1 = &xmmword_2544DBED8;
  memset(&xmmword_2544DBED8, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_2544DBED8, (char *)&unk_24BA0187D);
  result = (std::string *)TelephonyRadiosGetRadio();
  v4 = (_DWORD)result - 2;
  if (((_DWORD)result - 2) < 0x10 && ((0x8FE7u >> v4) & 1) != 0)
    return std::string::__assign_external((std::string *)off_251CC9470[v4], *((const std::string::value_type **)&unk_24BA01158 + v4), v3);
  if (byte_2544DBEEF < 0)
  {
    *((_QWORD *)&xmmword_2544DBED8 + 1) = 0;
    v1 = (__int128 *)xmmword_2544DBED8;
  }
  else
  {
    byte_2544DBEEF = 0;
  }
  *(_BYTE *)v1 = 0;
  return result;
}

void sub_24B9F6CBC(_Unwind_Exception *exception_object)
{
  if (byte_2544DBEEF < 0)
    operator delete((void *)xmmword_2544DBED8);
  _Unwind_Resume(exception_object);
}

void capabilities::radio::firmwarePrefix(std::string *a1@<X8>)
{
  unsigned __int8 v3;
  capabilities::radio *v4;

  v3 = atomic_load((unsigned __int8 *)&qword_2544DBDD0);
  if ((v3 & 1) == 0)
  {
    v4 = (capabilities::radio *)__cxa_guard_acquire(&qword_2544DBDD0);
    if ((_DWORD)v4)
    {
      capabilities::radio::sFirmwarePrefix(v4);
      __cxa_atexit(MEMORY[0x24BEDACF0], &xmmword_2544DBEF0, &dword_24B9DC000);
      __cxa_guard_release(&qword_2544DBDD0);
    }
  }
  if (byte_2544DBF07 < 0)
  {
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)xmmword_2544DBEF0, *((std::string::size_type *)&xmmword_2544DBEF0 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_2544DBEF0;
    a1->__r_.__value_.__r.__words[2] = unk_2544DBF00;
  }
}

void sub_24B9F6D88(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBDD0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::sFirmwarePrefix(capabilities::radio *this)
{
  __int128 *v1;
  uint64_t result;
  __int16 v3;
  int v4;
  __int16 v5;
  __int16 v6;

  v1 = &xmmword_2544DBEF0;
  memset(&xmmword_2544DBEF0, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_2544DBEF0, (char *)&unk_24BA0187D);
  result = TelephonyRadiosGetRadio();
  switch((int)result)
  {
    case 2:
      if (byte_2544DBF07 < 0)
      {
        *((_QWORD *)&xmmword_2544DBEF0 + 1) = 6;
        v1 = (__int128 *)xmmword_2544DBEF0;
      }
      else
      {
        byte_2544DBF07 = 6;
      }
      v3 = 11571;
      goto LABEL_30;
    case 3:
      if (byte_2544DBF07 < 0)
      {
        *((_QWORD *)&xmmword_2544DBEF0 + 1) = 6;
        v1 = (__int128 *)xmmword_2544DBEF0;
      }
      else
      {
        byte_2544DBF07 = 6;
      }
      v3 = 11574;
LABEL_30:
      *((_WORD *)v1 + 2) = v3;
      v4 = 829841741;
      goto LABEL_51;
    case 4:
      if (byte_2544DBF07 < 0)
      {
        *((_QWORD *)&xmmword_2544DBEF0 + 1) = 7;
        v1 = (__int128 *)xmmword_2544DBEF0;
      }
      else
      {
        byte_2544DBF07 = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 758657363;
      *(_DWORD *)v1 = 1397310025;
      v1 = (__int128 *)((char *)v1 + 7);
      break;
    case 7:
      if (byte_2544DBF07 < 0)
      {
        *((_QWORD *)&xmmword_2544DBEF0 + 1) = 6;
        v1 = (__int128 *)xmmword_2544DBEF0;
      }
      else
      {
        byte_2544DBF07 = 6;
      }
      v5 = 11576;
      goto LABEL_37;
    case 8:
      if (byte_2544DBF07 < 0)
      {
        *((_QWORD *)&xmmword_2544DBEF0 + 1) = 6;
        v1 = (__int128 *)xmmword_2544DBEF0;
      }
      else
      {
        byte_2544DBF07 = 6;
      }
      v5 = 11577;
LABEL_37:
      *((_WORD *)v1 + 2) = v5;
      v4 = 826622793;
      goto LABEL_51;
    case 9:
      if (byte_2544DBF07 < 0)
      {
        *((_QWORD *)&xmmword_2544DBEF0 + 1) = 6;
        v1 = (__int128 *)xmmword_2544DBEF0;
      }
      else
      {
        byte_2544DBF07 = 6;
      }
      v6 = 11568;
      goto LABEL_50;
    case 10:
      if (byte_2544DBF07 < 0)
      {
        *((_QWORD *)&xmmword_2544DBEF0 + 1) = 6;
        v1 = (__int128 *)xmmword_2544DBEF0;
      }
      else
      {
        byte_2544DBF07 = 6;
      }
      v6 = 11569;
      goto LABEL_50;
    case 11:
      if (byte_2544DBF07 < 0)
      {
        *((_QWORD *)&xmmword_2544DBEF0 + 1) = 6;
        v1 = (__int128 *)xmmword_2544DBEF0;
      }
      else
      {
        byte_2544DBF07 = 6;
      }
      *((_WORD *)v1 + 2) = 11568;
      v4 = 863396173;
      goto LABEL_51;
    case 12:
      if (byte_2544DBF07 < 0)
      {
        *((_QWORD *)&xmmword_2544DBEF0 + 1) = 6;
        v1 = (__int128 *)xmmword_2544DBEF0;
      }
      else
      {
        byte_2544DBF07 = 6;
      }
      v6 = 11570;
      goto LABEL_50;
    case 13:
      if (byte_2544DBF07 < 0)
      {
        *((_QWORD *)&xmmword_2544DBEF0 + 1) = 6;
        v1 = (__int128 *)xmmword_2544DBEF0;
      }
      else
      {
        byte_2544DBF07 = 6;
      }
      v6 = 11571;
      goto LABEL_50;
    case 17:
      if (byte_2544DBF07 < 0)
      {
        *((_QWORD *)&xmmword_2544DBEF0 + 1) = 6;
        v1 = (__int128 *)xmmword_2544DBEF0;
      }
      else
      {
        byte_2544DBF07 = 6;
      }
      v6 = 11572;
LABEL_50:
      *((_WORD *)v1 + 2) = v6;
      v4 = 846618957;
LABEL_51:
      *(_DWORD *)v1 = v4;
      v1 = (__int128 *)((char *)v1 + 6);
      break;
    default:
      if (byte_2544DBF07 < 0)
      {
        *((_QWORD *)&xmmword_2544DBEF0 + 1) = 0;
        v1 = (__int128 *)xmmword_2544DBEF0;
      }
      else
      {
        byte_2544DBF07 = 0;
      }
      break;
  }
  *(_BYTE *)v1 = 0;
  return result;
}

void sub_24B9F7050(_Unwind_Exception *exception_object)
{
  if (byte_2544DBF07 < 0)
    operator delete((void *)xmmword_2544DBEF0);
  _Unwind_Resume(exception_object);
}

void capabilities::radio::firmwarePathSuffix(std::string *a1@<X8>)
{
  unsigned __int8 v3;
  capabilities::radio *v4;

  if ((v3 & 1) == 0)
  {
    if ((_DWORD)v4)
    {
      capabilities::radio::sFirmwarePathSuffix(v4);
      __cxa_atexit(MEMORY[0x24BEDACF0], &capabilities::radio::firmwarePathSuffix(void)::ret, &dword_24B9DC000);
    }
  }
  if (byte_2579B91B7 < 0)
  {
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)capabilities::radio::firmwarePathSuffix(void)::ret, *((std::string::size_type *)&capabilities::radio::firmwarePathSuffix(void)::ret + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = capabilities::radio::firmwarePathSuffix(void)::ret;
    a1->__r_.__value_.__r.__words[2] = unk_2579B91B0;
  }
}

void sub_24B9F7120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::sFirmwarePathSuffix(capabilities::radio *this)
{
  __int128 *v1;
  uint64_t result;
  __int16 v3;
  __int16 v4;
  int v5;

  v1 = &capabilities::radio::firmwarePathSuffix(void)::ret;
  memset(&capabilities::radio::firmwarePathSuffix(void)::ret, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&capabilities::radio::firmwarePathSuffix(void)::ret, (char *)&unk_24BA0187D);
  result = TelephonyRadiosGetRadio();
  switch((int)result)
  {
    case 2:
      if (byte_2579B91B7 < 0)
      {
        *((_QWORD *)&capabilities::radio::firmwarePathSuffix(void)::ret + 1) = 6;
        v1 = (__int128 *)capabilities::radio::firmwarePathSuffix(void)::ret;
      }
      else
      {
        byte_2579B91B7 = 6;
      }
      v3 = 13105;
      goto LABEL_50;
    case 3:
      if (byte_2579B91B7 < 0)
      {
        *((_QWORD *)&capabilities::radio::firmwarePathSuffix(void)::ret + 1) = 6;
        v1 = (__int128 *)capabilities::radio::firmwarePathSuffix(void)::ret;
      }
      else
      {
        byte_2579B91B7 = 6;
      }
      v3 = 13873;
      goto LABEL_50;
    case 4:
      if (byte_2579B91B7 < 0)
      {
        *((_QWORD *)&capabilities::radio::firmwarePathSuffix(void)::ret + 1) = 7;
        v1 = (__int128 *)capabilities::radio::firmwarePathSuffix(void)::ret;
      }
      else
      {
        byte_2579B91B7 = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 942756681;
      *(_DWORD *)v1 = 1229080879;
      v1 = (__int128 *)((char *)v1 + 7);
      break;
    case 7:
      if (byte_2579B91B7 < 0)
      {
        *((_QWORD *)&capabilities::radio::firmwarePathSuffix(void)::ret + 1) = 6;
        v1 = (__int128 *)capabilities::radio::firmwarePathSuffix(void)::ret;
      }
      else
      {
        byte_2579B91B7 = 6;
      }
      v4 = 14385;
      goto LABEL_37;
    case 8:
      if (byte_2579B91B7 < 0)
      {
        *((_QWORD *)&capabilities::radio::firmwarePathSuffix(void)::ret + 1) = 6;
        v1 = (__int128 *)capabilities::radio::firmwarePathSuffix(void)::ret;
      }
      else
      {
        byte_2579B91B7 = 6;
      }
      v4 = 14641;
LABEL_37:
      *((_WORD *)v1 + 2) = v4;
      v5 = 1162037551;
      goto LABEL_51;
    case 9:
      if (byte_2579B91B7 < 0)
      {
        *((_QWORD *)&capabilities::radio::firmwarePathSuffix(void)::ret + 1) = 6;
        v1 = (__int128 *)capabilities::radio::firmwarePathSuffix(void)::ret;
      }
      else
      {
        byte_2579B91B7 = 6;
      }
      v3 = 12338;
      goto LABEL_50;
    case 10:
      if (byte_2579B91B7 < 0)
      {
        *((_QWORD *)&capabilities::radio::firmwarePathSuffix(void)::ret + 1) = 6;
        v1 = (__int128 *)capabilities::radio::firmwarePathSuffix(void)::ret;
      }
      else
      {
        byte_2579B91B7 = 6;
      }
      v3 = 12594;
      goto LABEL_50;
    case 11:
      if (byte_2579B91B7 < 0)
      {
        *((_QWORD *)&capabilities::radio::firmwarePathSuffix(void)::ret + 1) = 6;
        v1 = (__int128 *)capabilities::radio::firmwarePathSuffix(void)::ret;
      }
      else
      {
        byte_2579B91B7 = 6;
      }
      v3 = 12339;
      goto LABEL_50;
    case 12:
      if (byte_2579B91B7 < 0)
      {
        *((_QWORD *)&capabilities::radio::firmwarePathSuffix(void)::ret + 1) = 6;
        v1 = (__int128 *)capabilities::radio::firmwarePathSuffix(void)::ret;
      }
      else
      {
        byte_2579B91B7 = 6;
      }
      v3 = 12850;
      goto LABEL_50;
    case 13:
      if (byte_2579B91B7 < 0)
      {
        *((_QWORD *)&capabilities::radio::firmwarePathSuffix(void)::ret + 1) = 6;
        v1 = (__int128 *)capabilities::radio::firmwarePathSuffix(void)::ret;
      }
      else
      {
        byte_2579B91B7 = 6;
      }
      v3 = 13106;
      goto LABEL_50;
    case 17:
      if (byte_2579B91B7 < 0)
      {
        *((_QWORD *)&capabilities::radio::firmwarePathSuffix(void)::ret + 1) = 6;
        v1 = (__int128 *)capabilities::radio::firmwarePathSuffix(void)::ret;
      }
      else
      {
        byte_2579B91B7 = 6;
      }
      v3 = 13362;
LABEL_50:
      *((_WORD *)v1 + 2) = v3;
      v5 = 1986088239;
LABEL_51:
      *(_DWORD *)v1 = v5;
      v1 = (__int128 *)((char *)v1 + 6);
      break;
    default:
      if (byte_2579B91B7 < 0)
      {
        *((_QWORD *)&capabilities::radio::firmwarePathSuffix(void)::ret + 1) = 0;
        v1 = (__int128 *)capabilities::radio::firmwarePathSuffix(void)::ret;
      }
      else
      {
        byte_2579B91B7 = 0;
      }
      break;
  }
  *(_BYTE *)v1 = 0;
  return result;
}

void sub_24B9F73D0(_Unwind_Exception *exception_object)
{
  if (byte_2579B91B7 < 0)
    operator delete((void *)capabilities::radio::firmwarePathSuffix(void)::ret);
  _Unwind_Resume(exception_object);
}

void capabilities::radio::radioType(std::string *a1@<X8>)
{
  unsigned __int8 v3;
  capabilities::radio *v4;

  v3 = atomic_load((unsigned __int8 *)&qword_2544DBDD8);
  if ((v3 & 1) == 0)
  {
    v4 = (capabilities::radio *)__cxa_guard_acquire(&qword_2544DBDD8);
    if ((_DWORD)v4)
    {
      capabilities::radio::sRadioType(v4);
      __cxa_atexit(MEMORY[0x24BEDACF0], &xmmword_2544DBF08, &dword_24B9DC000);
      __cxa_guard_release(&qword_2544DBDD8);
    }
  }
  if (byte_2544DBF1F < 0)
  {
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)xmmword_2544DBF08, *((std::string::size_type *)&xmmword_2544DBF08 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_2544DBF08;
    a1->__r_.__value_.__r.__words[2] = unk_2544DBF18;
  }
}

void sub_24B9F749C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBDD8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::sRadioType(capabilities::radio *this)
{
  __int128 *v1;
  uint64_t result;
  char v3;
  __int16 v4;
  _BYTE *v5;
  char v6;
  char v7;

  v1 = &xmmword_2544DBF08;
  memset(&xmmword_2544DBF08, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_2544DBF08, "Unknown");
  result = TelephonyRadiosGetRadio();
  switch((int)result)
  {
    case 2:
      if (byte_2544DBF1F < 0)
      {
        *((_QWORD *)&xmmword_2544DBF08 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DBF08;
      }
      else
      {
        byte_2544DBF1F = 3;
      }
      v3 = 51;
      goto LABEL_30;
    case 3:
      if (byte_2544DBF1F < 0)
      {
        *((_QWORD *)&xmmword_2544DBF08 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DBF08;
      }
      else
      {
        byte_2544DBF1F = 3;
      }
      v3 = 54;
LABEL_30:
      *((_BYTE *)v1 + 2) = v3;
      v4 = 12621;
      goto LABEL_51;
    case 4:
      if (byte_2544DBF1F < 0)
      {
        *((_QWORD *)&xmmword_2544DBF08 + 1) = 4;
        v1 = (__int128 *)xmmword_2544DBF08;
      }
      else
      {
        byte_2544DBF1F = 4;
      }
      *(_DWORD *)v1 = 942752329;
      v5 = (char *)v1 + 4;
      break;
    case 7:
      if (byte_2544DBF1F < 0)
      {
        *((_QWORD *)&xmmword_2544DBF08 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DBF08;
      }
      else
      {
        byte_2544DBF1F = 3;
      }
      v6 = 56;
      goto LABEL_37;
    case 8:
      if (byte_2544DBF1F < 0)
      {
        *((_QWORD *)&xmmword_2544DBF08 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DBF08;
      }
      else
      {
        byte_2544DBF1F = 3;
      }
      v6 = 57;
LABEL_37:
      *((_BYTE *)v1 + 2) = v6;
      v4 = 12617;
      goto LABEL_51;
    case 9:
      if (byte_2544DBF1F < 0)
      {
        *((_QWORD *)&xmmword_2544DBF08 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DBF08;
      }
      else
      {
        byte_2544DBF1F = 3;
      }
      v7 = 48;
      goto LABEL_50;
    case 10:
      if (byte_2544DBF1F < 0)
      {
        *((_QWORD *)&xmmword_2544DBF08 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DBF08;
      }
      else
      {
        byte_2544DBF1F = 3;
      }
      v7 = 49;
      goto LABEL_50;
    case 11:
      if (byte_2544DBF1F < 0)
      {
        *((_QWORD *)&xmmword_2544DBF08 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DBF08;
      }
      else
      {
        byte_2544DBF1F = 3;
      }
      *((_BYTE *)v1 + 2) = 48;
      v4 = 13133;
      goto LABEL_51;
    case 12:
      if (byte_2544DBF1F < 0)
      {
        *((_QWORD *)&xmmword_2544DBF08 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DBF08;
      }
      else
      {
        byte_2544DBF1F = 3;
      }
      v7 = 50;
      goto LABEL_50;
    case 13:
      if (byte_2544DBF1F < 0)
      {
        *((_QWORD *)&xmmword_2544DBF08 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DBF08;
      }
      else
      {
        byte_2544DBF1F = 3;
      }
      v7 = 51;
      goto LABEL_50;
    case 17:
      if (byte_2544DBF1F < 0)
      {
        *((_QWORD *)&xmmword_2544DBF08 + 1) = 3;
        v1 = (__int128 *)xmmword_2544DBF08;
      }
      else
      {
        byte_2544DBF1F = 3;
      }
      v7 = 52;
LABEL_50:
      *((_BYTE *)v1 + 2) = v7;
      v4 = 12877;
LABEL_51:
      *(_WORD *)v1 = v4;
      v5 = (char *)v1 + 3;
      break;
    default:
      if (byte_2544DBF1F < 0)
      {
        *((_QWORD *)&xmmword_2544DBF08 + 1) = 7;
        v1 = (__int128 *)xmmword_2544DBF08;
      }
      else
      {
        byte_2544DBF1F = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 1853321070;
      *(_DWORD *)v1 = 1852534357;
      v5 = (char *)v1 + 7;
      break;
  }
  *v5 = 0;
  return result;
}

void sub_24B9F7768(_Unwind_Exception *exception_object)
{
  if (byte_2544DBF1F < 0)
    operator delete((void *)xmmword_2544DBF08);
  _Unwind_Resume(exception_object);
}

uint64_t capabilities::radio::chipID(capabilities::radio *this)
{
  unsigned __int8 v1;
  capabilities::radio *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBDE0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::radio *)__cxa_guard_acquire(&qword_2544DBDE0);
    if ((_DWORD)v3)
    {
      dword_2544DBD4C = capabilities::radio::sChipID(v3);
      __cxa_guard_release(&qword_2544DBDE0);
    }
  }
  return dword_2544DBD4C;
}

void sub_24B9F77E8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBDE0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::sChipID(capabilities::radio *this)
{
  unsigned int v1;

  v1 = TelephonyRadiosGetRadio() - 2;
  if (v1 > 0xF)
    return 0;
  else
    return dword_24BA011D8[v1];
}

uint64_t capabilities::radio::supportsAccessoryTypeDetectionForRF(capabilities::radio *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBDE8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBDE8))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBD29 = (Radio < 9) & (0x188u >> Radio);
    __cxa_guard_release(&qword_2544DBDE8);
  }
  return byte_2544DBD29;
}

void sub_24B9F78A0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBDE8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::supportsAccessoryDetection(capabilities::radio *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBDF0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBDF0))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBD2A = (Radio < 9) & (0x188u >> Radio);
    __cxa_guard_release(&qword_2544DBDF0);
  }
  return byte_2544DBD2A;
}

void sub_24B9F7924(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBDF0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::supportsFactoryCalibrationV2(capabilities::radio *this)
{
  unsigned __int8 v1;
  capabilities::radio *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBDF8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::radio *)__cxa_guard_acquire(&qword_2544DBDF8);
    if ((_DWORD)v3)
    {
      byte_2544DBD2B = capabilities::radio::sSupportsFactoryCalibrationV2(v3);
      __cxa_guard_release(&qword_2544DBDF8);
    }
  }
  return byte_2544DBD2B;
}

void sub_24B9F7998(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBDF8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::sSupportsFactoryCalibrationV2(capabilities::radio *this)
{
  uint64_t v1;
  int Product;
  uint64_t v3;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if (Product > 201)
  {
    if (Product == 212)
      return v1;
    return 0;
  }
  v3 = (Product - 99);
  if (v3 > 0x39)
  {
LABEL_8:
    if ((Product - 52) < 2)
      return v1;
    return 0;
  }
  if (((1 << (Product - 99)) & 0x3C781E0207800FLL) == 0)
  {
    if (v3 == 57)
      return 0;
    goto LABEL_8;
  }
  return v1;
}

uint64_t capabilities::radio::supportsAccessoryDetectionForARTD(capabilities::radio *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBE00);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBE00))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBD2C = (Radio < 0x12) & (0x18Cu >> Radio);
    __cxa_guard_release(&qword_2544DBE00);
  }
  return byte_2544DBD2C;
}

void sub_24B9F7AA0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBE00);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::mavLegacy(capabilities::radio *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBE08);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBE08))
  {
    byte_2544DBD2D = (TelephonyRadiosGetRadio() & 0xFFFFFFFE) == 2;
    __cxa_guard_release(&qword_2544DBE08);
  }
  return byte_2544DBD2D;
}

void sub_24B9F7B1C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBE08);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::supportsMESA(capabilities::radio *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBE10);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBE10))
  {
    byte_2544DBD2E = (TelephonyRadiosGetRadio() & 0xFFFFFFFE) == 2;
    __cxa_guard_release(&qword_2544DBE10);
  }
  return byte_2544DBD2E;
}

void sub_24B9F7B98(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBE10);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::getPacketFilteringVersion(capabilities::radio *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBE18);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBE18))
  {
    v3 = TelephonyRadiosGetRadio() - 2;
    if (v3 > 0xF)
      v4 = 0;
    else
      v4 = dword_24BA01218[v3];
    dword_2544DBD50 = v4;
    __cxa_guard_release(&qword_2544DBE18);
  }
  return dword_2544DBD50;
}

void sub_24B9F7C28(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBE18);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::supportsBBTraceV2(capabilities::radio *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBE20);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBE20))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBD2F = (Radio < 0x11) & (0x10190u >> Radio);
    __cxa_guard_release(&qword_2544DBE20);
  }
  return byte_2544DBD2F;
}

void sub_24B9F7CB0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBE20);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::supportsDeviceMaterial(capabilities::radio *this)
{
  unsigned __int8 v1;
  int Radio;
  BOOL v5;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBE28);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBE28))
  {
    Radio = TelephonyRadiosGetRadio();
    v5 = Radio == 4 || Radio == 16;
    byte_2544DBD30 = v5;
    __cxa_guard_release(&qword_2544DBE28);
  }
  return byte_2544DBD30;
}

void sub_24B9F7D2C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBE28);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::supportsAutomaticRadarFiling(capabilities::radio *this)
{
  unsigned __int8 v1;
  capabilities::radio *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBE30);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::radio *)__cxa_guard_acquire(&qword_2544DBE30);
    if ((_DWORD)v3)
    {
      byte_2544DBD31 = capabilities::radio::sSupportsAutomaticRadarFiling(v3);
      __cxa_guard_release(&qword_2544DBE30);
    }
  }
  return byte_2544DBD31;
}

void sub_24B9F7DA0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBE30);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::sSupportsAutomaticRadarFiling(capabilities::radio *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 73:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 118:
    case 119:
    case 120:
    case 122:
    case 123:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 146:
    case 147:
    case 148:
    case 153:
    case 154:
    case 155:
    case 157:
    case 158:
    case 159:
    case 203:
    case 209:
    case 211:
      return v1;
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 85:
    case 86:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 121:
    case 124:
    case 132:
    case 133:
    case 134:
    case 135:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 156:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 200:
    case 201:
    case 202:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 60) >= 2)
LABEL_4:
        v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::radio::supportsMultiClientAWD(capabilities::radio *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBE38);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBE38))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBD32 = (Radio < 0x12) & (0x3FFD0u >> Radio);
    __cxa_guard_release(&qword_2544DBE38);
  }
  return byte_2544DBD32;
}

void sub_24B9F7E88(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBE38);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::ice(capabilities::radio *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBE40);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBE40))
  {
    byte_2544DBD33 = TelephonyRadiosGetRadioVendor() == 2;
    __cxa_guard_release(&qword_2544DBE40);
  }
  return byte_2544DBD33;
}

void sub_24B9F7F04(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBE40);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::QMuxPendingRequestLimitCount(capabilities::radio *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBE50);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBE50))
  {
    v3 = TelephonyRadiosGetRadio() - 9;
    if (v3 > 8)
      v4 = 0;
    else
      v4 = qword_24BA01258[v3];
    qword_2544DBE48 = v4;
    __cxa_guard_release(&qword_2544DBE50);
  }
  return qword_2544DBE48;
}

void sub_24B9F7F94(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBE50);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::mav20Plus(capabilities::radio *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBE58);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBE58))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBD34 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_2544DBE58);
  }
  return byte_2544DBD34;
}

void sub_24B9F8020(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBE58);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::supportsSDIReset(capabilities::radio *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBE60);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBE60))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBD35 = (Radio < 0x12) & (0x2FE00u >> Radio);
    __cxa_guard_release(&qword_2544DBE60);
  }
  return byte_2544DBD35;
}

void sub_24B9F80AC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBE60);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::supportsBasebandStateController(capabilities::radio *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBE68);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBE68))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBD36 = (Radio < 0x12) & (0x2FE00u >> Radio);
    __cxa_guard_release(&qword_2544DBE68);
  }
  return byte_2544DBD36;
}

void sub_24B9F8138(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBE68);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::supportsDataService(capabilities::radio *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBE70);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBE70))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBD37 = (Radio < 0x12) & (0x2FE00u >> Radio);
    __cxa_guard_release(&qword_2544DBE70);
  }
  return byte_2544DBD37;
}

void sub_24B9F81C4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBE70);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::supportsGetWakeReasonV2(capabilities::radio *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBE78);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBE78))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBD38 = (Radio < 0x12) & (0x2FE00u >> Radio);
    __cxa_guard_release(&qword_2544DBE78);
  }
  return byte_2544DBD38;
}

void sub_24B9F8250(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBE78);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::supportsQMuxSendWindow(capabilities::radio *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBE80);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBE80))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBD39 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_2544DBE80);
  }
  return byte_2544DBD39;
}

void sub_24B9F82DC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBE80);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::supportsLowLatencyData(capabilities::radio *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBE88);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBE88))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBD3A = (Radio < 0x12) & (0x23C00u >> Radio);
    __cxa_guard_release(&qword_2544DBE88);
  }
  return byte_2544DBD3A;
}

void sub_24B9F8368(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBE88);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::mav21Plus(capabilities::radio *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBE90);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBE90))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBD3B = (Radio < 0x12) & (0x23C00u >> Radio);
    __cxa_guard_release(&qword_2544DBE90);
  }
  return byte_2544DBD3B;
}

void sub_24B9F83F4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBE90);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::supportsRel16(capabilities::radio *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBE98);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBE98))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBD3C = (Radio < 0x12) & (0x23000u >> Radio);
    __cxa_guard_release(&qword_2544DBE98);
  }
  return byte_2544DBD3C;
}

void sub_24B9F8480(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBE98);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::shouldEnableEUICCDetectPullDown(capabilities::radio *this)
{
  unsigned __int8 v1;
  capabilities::radio *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBEA0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::radio *)__cxa_guard_acquire(&qword_2544DBEA0);
    if ((_DWORD)v3)
    {
      byte_2544DBD3D = capabilities::radio::sShouldEnableEUICCDetectPullDown(v3);
      __cxa_guard_release(&qword_2544DBEA0);
    }
  }
  return byte_2544DBD3D;
}

void sub_24B9F84F4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBEA0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::sShouldEnableEUICCDetectPullDown(capabilities::radio *this)
{
  uint64_t v1;
  int Product;
  BOOL v3;
  ctu::Gestalt *v4;
  void *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  __int128 v15;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  v3 = (Product - 129) > 0x1A || ((1 << (Product + 127)) & 0x7001C07) == 0;
  if (!v3 || Product == 211 || Product == 209)
  {
    v4 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
    v5 = off_2544DA7D8;
    if (!off_2544DA7D8)
    {
      ctu::Gestalt::create_default_global(v4);
      std::shared_ptr<ctu::Gestalt>::operator=[abi:ne180100]((uint64_t)&off_2544DA7D8, &v15);
      v6 = (std::__shared_weak_count *)*((_QWORD *)&v15 + 1);
      if (*((_QWORD *)&v15 + 1))
      {
        v7 = (unint64_t *)(*((_QWORD *)&v15 + 1) + 8);
        do
          v8 = __ldaxr(v7);
        while (__stlxr(v8 - 1, v7));
        if (!v8)
        {
          ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
          std::__shared_weak_count::__release_weak(v6);
        }
      }
      v5 = off_2544DA7D8;
    }
    v9 = (std::__shared_weak_count *)off_2544DA7E0;
    if (off_2544DA7E0)
    {
      v10 = (unint64_t *)((char *)off_2544DA7E0 + 8);
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
    v1 = (*(unsigned int (**)(void *))(*(_QWORD *)v5 + 120))(v5) ^ 1;
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v13 = __ldaxr(p_shared_owners);
      while (__stlxr(v13 - 1, p_shared_owners));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }
  return v1;
}

void sub_24B9F8654(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::ARITransportTimeout(capabilities::radio *this)
{
  unsigned __int8 v1;
  capabilities::radio *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBEB0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::radio *)__cxa_guard_acquire(&qword_2544DBEB0);
    if ((_DWORD)v3)
    {
      qword_2544DBEA8 = capabilities::radio::sARITransportTimeout(v3);
      __cxa_guard_release(&qword_2544DBEB0);
    }
  }
  return qword_2544DBEA8;
}

void sub_24B9F86E0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBEB0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::sARITransportTimeout(capabilities::radio *this)
{
  unsigned int v1;

  v1 = TelephonyRadiosGetProduct() - 200;
  if (v1 > 8)
    return 10000;
  else
    return qword_24BA012A0[v1];
}

uint64_t capabilities::radio::ARITransportReadSizeBytes(capabilities::radio *this)
{
  unsigned __int8 v1;
  int RadioVendor;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBEC0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBEC0))
  {
    RadioVendor = TelephonyRadiosGetRadioVendor();
    v4 = 4096;
    if (RadioVendor == 3)
      v4 = 0x4000;
    qword_2544DBEB8 = v4;
    __cxa_guard_release(&qword_2544DBEC0);
  }
  return qword_2544DBEB8;
}

void sub_24B9F8794(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBEC0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::radio::ARITransportReadCount(capabilities::radio *this)
{
  unsigned __int8 v1;
  int RadioVendor;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBED0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBED0))
  {
    RadioVendor = TelephonyRadiosGetRadioVendor();
    v4 = 4;
    if (RadioVendor == 3)
      v4 = 16;
    qword_2544DBEC8 = v4;
    __cxa_guard_release(&qword_2544DBED0);
  }
  return qword_2544DBEC8;
}

void sub_24B9F8814(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBED0);
  _Unwind_Resume(a1);
}

_QWORD *capabilities::radio::asString@<X0>(int a1@<W0>, _QWORD *a2@<X8>)
{
  const char *v2;
  char *v3;

  v2 = "???";
  if (a1 == 1)
    v2 = "kRFDisabled";
  if (a1)
    v3 = (char *)v2;
  else
    v3 = "kOnline";
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

_QWORD *capabilities::radio::asString@<X0>(unsigned int a1@<W0>, _QWORD *a2@<X8>)
{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = off_251CC94F0[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 3)
    v2 = "???";
  else
    v2 = off_251CC9508[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  std::string::size_type v4;
  std::string::size_type v5;
  std::string *result;
  uint64_t v7;

  if ((byte_2544DBEEF & 0x80000000) == 0)
  {
    v4 = byte_2544DBEEF;
    v5 = 22;
LABEL_5:
    std::string::__grow_by_and_replace((std::string *)&xmmword_2544DBED8, v5, (std::string::size_type)&__s[-v5], v4, 0, v4, (std::string::size_type)__s, (const std::string::value_type *)this);
    return result;
  }
  v5 = (unk_2544DBEE8 & 0x7FFFFFFFFFFFFFFFLL) - 1;
  if (v5 < (unint64_t)__s)
  {
    v4 = *((_QWORD *)&xmmword_2544DBED8 + 1);
    goto LABEL_5;
  }
  v7 = xmmword_2544DBED8;
  result = (std::string *)memmove((void *)xmmword_2544DBED8, this, (size_t)__s);
  if (byte_2544DBEEF < 0)
    *((_QWORD *)&xmmword_2544DBED8 + 1) = __s;
  else
    byte_2544DBEEF = __s & 0x7F;
  __s[v7] = 0;
  return result;
}

uint64_t __cxx_global_var_init_2()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ctu::Gestalt>::~PthreadMutexGuardPolicy, &ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance, &dword_24B9DC000);
  }
  return result;
}

uint64_t capabilities::updater::shouldAllowUnfused(capabilities::updater *this)
{
  capabilities::updaterinternal *HardwareConfig;

  HardwareConfig = (capabilities::updaterinternal *)TelephonyRadiosGetHardwareConfig();
  if ((_DWORD)HardwareConfig == 2)
    return capabilities::updaterinternal::shouldAllowUnfused(HardwareConfig);
  else
    return 1;
}

uint64_t capabilities::updater::supportsAudioOverPCIe(capabilities::updater *this)
{
  uint64_t result;

  result = capabilities::updaterinternal::supportsAudioOverPCIe(this);
  if ((_DWORD)result)
  {
    if (qword_2544DBF28 != -1)
      dispatch_once(&qword_2544DBF28, &__block_literal_global_1);
    return _MergedGlobals_15 != 0;
  }
  return result;
}

uint64_t ___ZN12capabilities7updater21supportsAudioOverPCIeEv_block_invoke()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  uint64_t result;

  v0 = *MEMORY[0x24BDD8B18];
  v1 = IOServiceNameMatching("Baseband Voice");
  result = IOServiceGetMatchingService(v0, v1);
  _MergedGlobals_15 = (_DWORD)result == 0;
  if ((_DWORD)result)
    return IOObjectRelease(result);
  return result;
}

uint64_t capabilities::updater::ICENVMFSizeBytes(capabilities::updaterinternal *a1)
{
  if ((_DWORD)a1 == 2)
    return 0;
  if ((_DWORD)a1 == 1)
    return capabilities::updaterinternal::dynamicICENVMFSizeBytes(a1);
  return 0x20000;
}

BOOL capabilities::updater::supportsEUICCGSMAMastering(capabilities::updater *this)
{
  return this > 4;
}

uint64_t capabilities::updater::EUICCCertIDSizeBytes(capabilities::updater *this)
{
  if (this <= 4)
    return 4;
  else
    return 20;
}

void capabilities::radio::personalizedFirmwarePath(void **a1@<X8>)
{
  capabilities::radio *v3;
  void *v4;
  uint64_t v5;
  int v6;
  size_t v7;
  int v8;
  size_t size;
  unint64_t v10;
  _OWORD *v11;
  uint8_t *v12;
  char *v13;
  std::string *p_p;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  std::string __p;
  _OWORD __dst[2];
  uint8_t buf[24];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  memset(a1, 170, 24);
  v3 = (capabilities::radio *)std::string::basic_string[abi:ne180100]<0>(a1, (char *)&unk_24BA0187D);
  capabilities::radio::vendor(v3);
  v4 = operator new[](0x400uLL);
  bzero(v4, 0x400uLL);
  v5 = lookupPathForPersonalizedData();
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = v4;
      _os_log_error_impl(&dword_24B9DC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "MSU error: 0x%lx, FW base path: \"%{public}s\"", buf, 0x16u);
    }
    goto LABEL_39;
  }
  memset(buf, 170, sizeof(buf));
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)v4);
  memset(&__p, 170, sizeof(__p));
  capabilities::radio::firmwarePathSuffix(&__p);
  v6 = (char)buf[23];
  if ((buf[23] & 0x80u) == 0)
    v7 = buf[23];
  else
    v7 = *(_QWORD *)&buf[8];
  v8 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  v10 = size + v7;
  memset(__dst, 170, 24);
  if (size + v7 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v10 > 0x16)
  {
    v16 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17)
      v16 = v10 | 7;
    v17 = v16 + 1;
    v11 = operator new(v16 + 1);
    *((_QWORD *)&__dst[0] + 1) = size + v7;
    *(_QWORD *)&__dst[1] = v17 | 0x8000000000000000;
    *(_QWORD *)&__dst[0] = v11;
    if (!v7)
      goto LABEL_17;
    goto LABEL_13;
  }
  memset(__dst, 0, 24);
  v11 = __dst;
  BYTE7(__dst[1]) = size + v7;
  if (v7)
  {
LABEL_13:
    if (v6 >= 0)
      v12 = buf;
    else
      v12 = *(uint8_t **)buf;
    memmove(v11, v12, v7);
  }
LABEL_17:
  v13 = (char *)v11 + v7;
  if (size)
  {
    if (v8 >= 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    memmove(v13, p_p, size);
  }
  v13[size] = 0;
  if (*((char *)a1 + 23) < 0)
    operator delete(*a1);
  *(_OWORD *)a1 = __dst[0];
  a1[2] = *(void **)&__dst[1];
  if (ctu::fs::file_exists())
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      if (*((char *)a1 + 23) >= 0)
        v15 = a1;
      else
        v15 = *a1;
      LODWORD(__dst[0]) = 136446210;
      *(_QWORD *)((char *)__dst + 4) = v15;
      _os_log_impl(&dword_24B9DC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "FW path \"%{public}s\" exists", (uint8_t *)__dst, 0xCu);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    if (*((char *)a1 + 23) >= 0)
      v18 = a1;
    else
      v18 = *a1;
    LODWORD(__dst[0]) = 136446210;
    *(_QWORD *)((char *)__dst + 4) = v18;
    _os_log_error_impl(&dword_24B9DC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "FW path \"%{public}s\" does not exist (did you remember to enable update baseband?)", (uint8_t *)__dst, 0xCu);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if ((char)buf[23] < 0)
    operator delete(*(void **)buf);
LABEL_39:
  operator delete[](v4);
}

void sub_24B9F8E18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  void *v25;
  uint64_t v26;

  if (a15 < 0)
    operator delete(__p);
  if (a25 < 0)
    operator delete(a20);
  operator delete[](v25);
  if (*(char *)(v26 + 23) < 0)
    operator delete(*(void **)v26);
  _Unwind_Resume(a1);
}

uint64_t capabilities::trace::defaultHistorySizeMB(capabilities::trace *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBF48);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBF48))
  {
    v3 = TelephonyRadiosGetRadio() - 4;
    if (v3 > 0xD)
      v4 = 256;
    else
      v4 = qword_24BA01310[v3];
    qword_2544DBF40 = v4;
    __cxa_guard_release(&qword_2544DBF48);
  }
  return qword_2544DBF40;
}

void sub_24B9F8EF8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBF48);
  _Unwind_Resume(a1);
}

uint64_t capabilities::trace::defaultMemoryFileMaxCount(capabilities::trace *this)
{
  unsigned __int8 v1;
  unsigned int v3;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBF58);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBF58))
  {
    v3 = TelephonyRadiosGetRadio() - 9;
    if (v3 > 8)
      v4 = 4;
    else
      v4 = qword_24BA01380[v3];
    qword_2544DBF50 = v4;
    __cxa_guard_release(&qword_2544DBF58);
  }
  return qword_2544DBF50;
}

void sub_24B9F8F88(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBF58);
  _Unwind_Resume(a1);
}

uint64_t capabilities::trace::defaultSleepTraceMode(capabilities::trace *this)
{
  unsigned __int8 v1;
  int Product;
  int v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBF60);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBF60))
  {
    Product = TelephonyRadiosGetProduct();
    if ((Product - 156) <= 0x34)
    {
      if (((1 << (Product + 100)) & 0x1F700000000000) != 0)
      {
        v4 = 1;
LABEL_7:
        dword_2544DBF34 = v4;
        __cxa_guard_release(&qword_2544DBF60);
        return dword_2544DBF34;
      }
      if (Product == 156)
      {
        v4 = 2;
        goto LABEL_7;
      }
    }
    v4 = 0;
    goto LABEL_7;
  }
  return dword_2544DBF34;
}

void sub_24B9F9034(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBF60);
  _Unwind_Resume(a1);
}

uint64_t capabilities::trace::defaultFileSizeBytes(capabilities::trace *this)
{
  unsigned __int8 v1;
  int RadioVendor;
  uint64_t v4;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBF70);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBF70))
  {
    RadioVendor = TelephonyRadiosGetRadioVendor();
    v4 = 0x100000;
    if (RadioVendor == 3)
      v4 = 0x400000;
    qword_2544DBF68 = v4;
    __cxa_guard_release(&qword_2544DBF70);
  }
  return qword_2544DBF68;
}

void sub_24B9F90B4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBF70);
  _Unwind_Resume(a1);
}

uint64_t capabilities::trace::supportsDuplicateSignatureDetection(capabilities::trace *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBF78);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBF78))
  {
    _MergedGlobals_16 = TelephonyRadiosGetRadioVendor() != 3;
    __cxa_guard_release(&qword_2544DBF78);
  }
  return _MergedGlobals_16;
}

void sub_24B9F912C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBF78);
  _Unwind_Resume(a1);
}

uint64_t capabilities::trace::getCompressionMode(capabilities::trace *this)
{
  unsigned __int8 v1;
  int v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBF80);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBF80))
  {
    if (TelephonyRadiosGetRadioVendor() == 3)
      v3 = 2;
    else
      v3 = 1;
    dword_2544DBF38 = v3;
    __cxa_guard_release(&qword_2544DBF80);
  }
  return dword_2544DBF38;
}

void sub_24B9F91A8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBF80);
  _Unwind_Resume(a1);
}

uint64_t capabilities::trace::supportsCoredumpCrashReasonOnCustomerBuild(capabilities::trace *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBF88);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBF88))
  {
    byte_2544DBF31 = TelephonyRadiosGetRadioVendor() == 3;
    __cxa_guard_release(&qword_2544DBF88);
  }
  return byte_2544DBF31;
}

void sub_24B9F9220(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBF88);
  _Unwind_Resume(a1);
}

uint64_t capabilities::traceinternal::supportsBasebandIPCTrace(capabilities::traceinternal *this)
{
  unsigned __int8 v1;
  unsigned int RadioVendor;

  if ((v1 & 1) == 0
  {
    RadioVendor = TelephonyRadiosGetRadioVendor();
    capabilities::traceinternal::supportsBasebandIPCTrace(void)::ret = (RadioVendor < 5) & (0x16u >> RadioVendor);
  }
  return capabilities::traceinternal::supportsBasebandIPCTrace(void)::ret;
}

void sub_24B9F92D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t capabilities::traceinternal::supportsKernelPCITrace(capabilities::traceinternal *this)
{
  unsigned __int8 v1;

  if ((v1 & 1) == 0
  {
    capabilities::traceinternal::supportsKernelPCITrace(void)::ret = TelephonyRadiosGetRadioVendor() - 1 < 2;
  }
  return capabilities::traceinternal::supportsKernelPCITrace(void)::ret;
}

void sub_24B9F934C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t capabilities::traceinternal::supportsDumpLogIndication(capabilities::traceinternal *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  if ((v1 & 1) == 0
  {
    Radio = TelephonyRadiosGetRadio();
    capabilities::traceinternal::supportsDumpLogIndication(void)::ret = (Radio < 0x12) & (0x23FAEu >> Radio);
  }
  return capabilities::traceinternal::supportsDumpLogIndication(void)::ret;
}

void sub_24B9F93D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t capabilities::traceinternal::supportsKernelPCIBinaryTrace(capabilities::traceinternal *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  if ((v1 & 1) == 0
  {
    Radio = TelephonyRadiosGetRadio();
    capabilities::traceinternal::supportsKernelPCIBinaryTrace(void)::ret = (Radio < 0x11) & (0x1C090u >> Radio);
  }
  return capabilities::traceinternal::supportsKernelPCIBinaryTrace(void)::ret;
}

void sub_24B9F945C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t capabilities::traceinternal::enabledByDefault(capabilities::traceinternal *this)
{
  unsigned __int8 v1;
  capabilities::traceinternal *v3;

  if ((v1 & 1) == 0)
  {
    if ((_DWORD)v3)
    {
      capabilities::traceinternal::enabledByDefault(void)::ret = capabilities::traceinternal::sEnabledByDefault(v3);
    }
  }
  return capabilities::traceinternal::enabledByDefault(void)::ret;
}

void sub_24B9F94CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t capabilities::traceinternal::sEnabledByDefault(capabilities::traceinternal *this)
{
  uint64_t v1;

  v1 = 0;
  switch(TelephonyRadiosGetProduct())
  {
    case 0x63u:
    case 0x64u:
    case 0x65u:
    case 0x66u:
    case 0x6Cu:
    case 0x6Du:
    case 0x6Eu:
    case 0x6Fu:
    case 0x72u:
    case 0x73u:
    case 0x74u:
    case 0x75u:
    case 0x78u:
    case 0x7Bu:
    case 0x7Cu:
    case 0x7Du:
    case 0x7Eu:
    case 0x84u:
    case 0x85u:
    case 0x86u:
    case 0x87u:
    case 0x88u:
    case 0x89u:
    case 0x8Au:
    case 0x8Bu:
    case 0x8Cu:
    case 0x8Du:
    case 0x8Eu:
    case 0x8Fu:
    case 0x90u:
    case 0x91u:
    case 0x92u:
    case 0x93u:
    case 0x94u:
    case 0x95u:
    case 0x96u:
    case 0x97u:
    case 0x98u:
    case 0x99u:
    case 0x9Au:
    case 0x9Bu:
    case 0x9Cu:
    case 0x9Du:
    case 0x9Eu:
    case 0x9Fu:
    case 0xC8u:
    case 0xC9u:
    case 0xCAu:
    case 0xCCu:
    case 0xCDu:
    case 0xCEu:
    case 0xCFu:
    case 0xD0u:
    case 0xD1u:
    case 0xD3u:
    case 0xD4u:
      v1 = 1;
      break;
    default:
      return v1;
  }
  return v1;
}

uint64_t capabilities::traceinternal::supportsCoreDumpStatus(capabilities::traceinternal *this)
{
  unsigned __int8 v1;

  if ((v1 & 1) == 0
  {
    capabilities::traceinternal::supportsCoreDumpStatus(void)::ret = TelephonyRadiosGetRadio() == 2;
  }
  return capabilities::traceinternal::supportsCoreDumpStatus(void)::ret;
}

void sub_24B9F9590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t capabilities::traceinternal::supportsHighTPutByDefault(capabilities::traceinternal *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  if ((v1 & 1) == 0
  {
    Radio = TelephonyRadiosGetRadio();
    capabilities::traceinternal::supportsHighTPutByDefault(void)::ret = (Radio < 0x12) & (0x23E00u >> Radio);
  }
  return capabilities::traceinternal::supportsHighTPutByDefault(void)::ret;
}

void sub_24B9F9618(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t capabilities::traceinternal::supportsDataLoggingByDefault(capabilities::traceinternal *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  if ((v1 & 1) == 0
  {
    Radio = TelephonyRadiosGetRadio();
    capabilities::traceinternal::supportsDataLoggingByDefault(void)::ret = (Radio < 0x12) & (0x23E00u >> Radio);
  }
  return capabilities::traceinternal::supportsDataLoggingByDefault(void)::ret;
}

void sub_24B9F96A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t capabilities::txpower::supportsRFCalCLTM(capabilities::txpower *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBFB0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBFB0))
  {
    _MergedGlobals_17 = 1;
    __cxa_guard_release(&qword_2544DBFB0);
  }
  return _MergedGlobals_17;
}

uint64_t capabilities::txpower::LTEBandsV2(capabilities::txpower *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBFB8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBFB8))
  {
    byte_2544DBF91 = 0;
    __cxa_guard_release(&qword_2544DBFB8);
  }
  return byte_2544DBF91;
}

uint64_t capabilities::txpower::supportsDelayProximityTimeoutReset(capabilities::txpower *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBFC0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBFC0))
  {
    byte_2544DBF92 = 0;
    __cxa_guard_release(&qword_2544DBFC0);
  }
  return byte_2544DBF92;
}

uint64_t capabilities::txpower::techConfig(capabilities::txpower *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBFC8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBFC8))
  {
    byte_2544DBF93 = TelephonyRadiosGetRadioVendor() - 1 < 4;
    __cxa_guard_release(&qword_2544DBFC8);
  }
  return byte_2544DBF93;
}

void sub_24B9F9888(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBFC8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::txpower::supportsConfig(capabilities::txpower *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBFD0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBFD0))
  {
    byte_2544DBF94 = TelephonyRadiosGetRadioVendor() - 1 < 4;
    __cxa_guard_release(&qword_2544DBFD0);
  }
  return byte_2544DBF94;
}

void sub_24B9F9904(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBFD0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::txpower::supportsMotion(capabilities::txpower *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBFD8);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DBFD8);
    if ((_DWORD)v3)
    {
      byte_2544DBF95 = capabilities::ct::sSupportsSequoia(v3);
      __cxa_guard_release(&qword_2544DBFD8);
    }
  }
  return byte_2544DBF95;
}

void sub_24B9F9978(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBFD8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::txpower::supportedControlInput(capabilities::txpower *this)
{
  unsigned __int8 v1;
  capabilities::txpower *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBFE0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::txpower *)__cxa_guard_acquire(&qword_2544DBFE0);
    if ((_DWORD)v3)
    {
      dword_2544DBFA4 = capabilities::txpower::sSupportedControlInput(v3);
      __cxa_guard_release(&qword_2544DBFE0);
    }
  }
  return dword_2544DBFA4;
}

void sub_24B9F99EC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBFE0);
  _Unwind_Resume(a1);
}

uint64_t capabilities::txpower::sSupportedControlInput(capabilities::txpower *this)
{
  unsigned int v1;

  v1 = TelephonyRadiosGetProduct() - 52;
  if (v1 > 0xA0)
    return 0;
  else
    return dword_24BA01540[v1];
}

uint64_t capabilities::txpower::supportsAudioSpeaker(capabilities::txpower *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBFE8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBFE8))
  {
    byte_2544DBF96 = TelephonyRadiosGetRadio() == 3;
    __cxa_guard_release(&qword_2544DBFE8);
  }
  return byte_2544DBF96;
}

void sub_24B9F9A98(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBFE8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::txpower::supportsKeyboard(capabilities::txpower *this)
{
  unsigned __int8 v1;
  capabilities::txpower *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBFF0);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::txpower *)__cxa_guard_acquire(&qword_2544DBFF0);
    if ((_DWORD)v3)
    {
      byte_2544DBF97 = capabilities::txpower::sSupportsKeyboard(v3);
      __cxa_guard_release(&qword_2544DBFF0);
    }
  }
  return byte_2544DBF97;
}

void sub_24B9F9B0C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBFF0);
  _Unwind_Resume(a1);
}

BOOL capabilities::txpower::sSupportsKeyboard(capabilities::txpower *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if ((Product - 82) > 0x36 || ((1 << (Product - 82)) & 0x40034002007103) == 0)
    return Product == 53;
  return v1;
}

uint64_t capabilities::txpower::supportsPowerChargerDesense(capabilities::txpower *this)
{
  unsigned __int8 v1;
  int Radio;
  BOOL v5;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DBFF8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DBFF8))
  {
    Radio = TelephonyRadiosGetRadio();
    v5 = Radio == 4 || Radio == 16;
    byte_2544DBF98 = v5;
    __cxa_guard_release(&qword_2544DBFF8);
  }
  return byte_2544DBF98;
}

void sub_24B9F9BE4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DBFF8);
  _Unwind_Resume(a1);
}

uint64_t capabilities::txpower::supportsAudioJackReport(capabilities::txpower *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DC000);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DC000))
  {
    byte_2544DBF99 = TelephonyRadiosGetRadio() == 2;
    __cxa_guard_release(&qword_2544DC000);
  }
  return byte_2544DBF99;
}

void sub_24B9F9C5C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DC000);
  _Unwind_Resume(a1);
}

uint64_t capabilities::txpower::supportsPPM(capabilities::txpower *this)
{
  unsigned __int8 v1;
  int Product;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DC008);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DC008))
  {
    Product = TelephonyRadiosGetProduct();
    byte_2544DBF9A = ((Product - 79) < 6) & (0x27u >> (Product - 79));
    __cxa_guard_release(&qword_2544DC008);
  }
  return byte_2544DBF9A;
}

void sub_24B9F9CE4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DC008);
  _Unwind_Resume(a1);
}

uint64_t capabilities::txpower::supportsAntennaFreeSpaceConfig(capabilities::txpower *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DC010);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DC010);
    if ((_DWORD)v3)
    {
      byte_2544DBF9B = capabilities::ct::sSupportsSIMDetectionInterrupt(v3);
      __cxa_guard_release(&qword_2544DC010);
    }
  }
  return byte_2544DBF9B;
}

void sub_24B9F9D58(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DC010);
  _Unwind_Resume(a1);
}

uint64_t capabilities::txpower::supportsMotionAlways(capabilities::txpower *this)
{
  unsigned __int8 v1;
  capabilities::txpower *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DC018);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::txpower *)__cxa_guard_acquire(&qword_2544DC018);
    if ((_DWORD)v3)
    {
      byte_2544DBF9C = capabilities::txpower::sSupportsMotionAlways(v3);
      __cxa_guard_release(&qword_2544DC018);
    }
  }
  return byte_2544DBF9C;
}

void sub_24B9F9DCC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DC018);
  _Unwind_Resume(a1);
}

uint64_t capabilities::txpower::sSupportsMotionAlways(capabilities::txpower *this)
{
  uint64_t v1;
  int Product;
  int v3;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if (Product > 141)
  {
    if ((Product - 142) > 0xE)
      goto LABEL_8;
    v3 = 1 << (Product + 114);
    if ((v3 & 0x4780) != 0)
      return 0;
    if ((v3 & 0xF) == 0)
    {
LABEL_8:
      switch(Product)
      {
        case 200:
        case 201:
        case 202:
        case 204:
        case 205:
        case 206:
        case 207:
          return 0;
        case 203:
          return v1;
        default:
          if (Product != 212)
            return 0;
          break;
      }
    }
  }
  else if ((Product - 79) > 0x38 || ((1 << (Product - 79)) & 0x1E0207800F47027) == 0)
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::txpower::supportsHandDetection(capabilities::txpower *this)
{
  unsigned __int8 v1;
  capabilities::ct *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DC020);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::ct *)__cxa_guard_acquire(&qword_2544DC020);
    if ((_DWORD)v3)
    {
      byte_2544DBF9D = capabilities::ct::sSupportsWiFiEnhancedThroughput(v3);
      __cxa_guard_release(&qword_2544DC020);
    }
  }
  return byte_2544DBF9D;
}

void sub_24B9F9EF8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DC020);
  _Unwind_Resume(a1);
}

uint64_t capabilities::txpower::supportsWristDetection(capabilities::txpower *this)
{
  unsigned __int8 v1;
  capabilities::txpower *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DC028);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::txpower *)__cxa_guard_acquire(&qword_2544DC028);
    if ((_DWORD)v3)
    {
      byte_2544DBF9E = capabilities::txpower::sSupportsWristDetection(v3);
      __cxa_guard_release(&qword_2544DC028);
    }
  }
  return byte_2544DBF9E;
}

void sub_24B9F9F6C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DC028);
  _Unwind_Resume(a1);
}

uint64_t capabilities::txpower::sSupportsWristDetection(capabilities::txpower *this)
{
  uint64_t v1;
  int Product;

  v1 = 1;
  Product = TelephonyRadiosGetProduct();
  if (((Product - 87) > 0x36 || ((1 << (Product - 87)) & 0x701F01800F0003) == 0)
    && ((Product - 153) > 0x3A || ((1 << (Product + 103)) & 0x500000000000007) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::txpower::supportsPowerSourceDetection(capabilities::txpower *this)
{
  unsigned __int8 v1;
  capabilities::txpower *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DC030);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::txpower *)__cxa_guard_acquire(&qword_2544DC030);
    if ((_DWORD)v3)
    {
      byte_2544DBF9F = capabilities::txpower::sSupportsPowerSourceDetection(v3);
      __cxa_guard_release(&qword_2544DC030);
    }
  }
  return byte_2544DBF9F;
}

void sub_24B9FA05C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DC030);
  _Unwind_Resume(a1);
}

uint64_t capabilities::txpower::sSupportsPowerSourceDetection(capabilities::txpower *this)
{
  int v1;
  uint64_t result;

  v1 = TelephonyRadiosGetProduct() - 87;
  result = 1;
  switch(v1)
  {
    case 0:
    case 1:
    case 16:
    case 17:
    case 18:
    case 19:
    case 31:
    case 32:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 52:
    case 53:
    case 54:
    case 66:
    case 67:
    case 68:
    case 122:
    case 124:
      return result;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::txpower::userSpaceCPMSVariant(capabilities::txpower *this)
{
  unsigned __int8 v1;
  capabilities::txpower *v3;

  if ((v1 & 1) == 0)
  {
    if ((_DWORD)v3)
    {
      capabilities::txpower::userSpaceCPMSVariant(void)::ret = capabilities::txpower::sUserSpaceCPMSVariant(v3);
    }
  }
  return capabilities::txpower::userSpaceCPMSVariant(void)::ret;
}

void sub_24B9FA10C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t capabilities::txpower::sUserSpaceCPMSVariant(capabilities::txpower *this)
{
  int v1;
  uint64_t result;

  v1 = TelephonyRadiosGetProduct() - 87;
  result = 1;
  switch(v1)
  {
    case 0:
    case 1:
    case 4:
    case 5:
    case 6:
    case 8:
    case 9:
    case 10:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 52:
    case 53:
    case 54:
    case 66:
    case 67:
    case 68:
    case 116:
    case 122:
    case 124:
      return result;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::txpower::supportsVideoAntennaSwitching(capabilities::txpower *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DC038);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DC038))
  {
    byte_2544DBFA0 = TelephonyRadiosGetRadio() != 8;
    __cxa_guard_release(&qword_2544DC038);
  }
  return byte_2544DBFA0;
}

void sub_24B9FA1C8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DC038);
  _Unwind_Resume(a1);
}

uint64_t capabilities::txpower::supportedFaceID(capabilities::txpower *this)
{
  unsigned __int8 v1;
  capabilities::txpower *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DC040);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::txpower *)__cxa_guard_acquire(&qword_2544DC040);
    if ((_DWORD)v3)
    {
      dword_2544DBFA8 = capabilities::txpower::sSupportedFaceID(v3);
      __cxa_guard_release(&qword_2544DC040);
    }
  }
  return dword_2544DBFA8;
}

void sub_24B9FA23C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DC040);
  _Unwind_Resume(a1);
}

uint64_t capabilities::txpower::sSupportedFaceID(capabilities::txpower *this)
{
  int Product;
  char v2;

  Product = TelephonyRadiosGetProduct();
  if (Product > 199)
  {
    if (Product >= 208 && Product == 212)
      return 2;
  }
  else
  {
    v2 = Product - 95;
    if ((Product - 95) <= 0x3D)
    {
      if (((1 << v2) & 0x3C781E000780000) != 0)
        return 2;
      if (((1 << v2) & 3) != 0)
        return 1;
    }
  }
  return 0;
}

void capabilities::txpower::settingsPlistName(std::string *a1@<X8>)
{
  unsigned __int8 v3;
  capabilities::txpower *v4;

  v3 = atomic_load((unsigned __int8 *)&qword_2544DC048);
  if ((v3 & 1) == 0)
  {
    v4 = (capabilities::txpower *)__cxa_guard_acquire(&qword_2544DC048);
    if ((_DWORD)v4)
    {
      capabilities::txpower::sSettingsPlistName(v4);
      __cxa_atexit(MEMORY[0x24BEDACF0], &xmmword_2544DC060, &dword_24B9DC000);
      __cxa_guard_release(&qword_2544DC048);
    }
  }
  if (byte_2544DC077 < 0)
  {
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)xmmword_2544DC060, *((std::string::size_type *)&xmmword_2544DC060 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_2544DC060;
    a1->__r_.__value_.__r.__words[2] = unk_2544DC070;
  }
}

void sub_24B9FA394(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DC048);
  _Unwind_Resume(a1);
}

uint64_t capabilities::txpower::sSettingsPlistName(capabilities::txpower *this)
{
  __int128 *v1;
  uint64_t result;
  _BYTE *v3;

  v1 = &xmmword_2544DC060;
  memset(&xmmword_2544DC060, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_2544DC060, "TxPowerSettings");
  result = TelephonyRadiosGetProduct();
  if ((result - 105) <= 0x32 && ((1 << (result - 105)) & 0x7001C07C06003) != 0
    || (_DWORD)result == 209
    || (_DWORD)result == 211)
  {
    if (byte_2544DC077 < 0)
    {
      *((_QWORD *)&xmmword_2544DC060 + 1) = 19;
      v1 = (__int128 *)xmmword_2544DC060;
    }
    else
    {
      byte_2544DC077 = 19;
    }
    *(_DWORD *)((char *)v1 + 15) = 1869504846;
    *v1 = *(_OWORD *)"TxPowerSettingsNano";
    v3 = (char *)v1 + 19;
  }
  else
  {
    if (byte_2544DC077 < 0)
    {
      *((_QWORD *)&xmmword_2544DC060 + 1) = 15;
      v1 = (__int128 *)xmmword_2544DC060;
    }
    else
    {
      byte_2544DC077 = 15;
    }
    qmemcpy(v1, "TxPowerSettings", 15);
    v3 = (char *)v1 + 15;
  }
  *v3 = 0;
  return result;
}

void sub_24B9FA4B0(_Unwind_Exception *exception_object)
{
  if (byte_2544DC077 < 0)
    operator delete((void *)xmmword_2544DC060);
  _Unwind_Resume(exception_object);
}

uint64_t capabilities::txpower::supportsFrontCamera(capabilities::txpower *this)
{
  unsigned __int8 v1;
  capabilities::txpower *v3;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DC050);
  if ((v1 & 1) == 0)
  {
    v3 = (capabilities::txpower *)__cxa_guard_acquire(&qword_2544DC050);
    if ((_DWORD)v3)
    {
      byte_2544DBFA1 = capabilities::txpower::sSupportsFrontCamera(v3);
      __cxa_guard_release(&qword_2544DC050);
    }
  }
  return byte_2544DBFA1;
}

void sub_24B9FA530(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DC050);
  _Unwind_Resume(a1);
}

BOOL capabilities::txpower::sSupportsFrontCamera(capabilities::txpower *this)
{
  unsigned int v1;

  v1 = TelephonyRadiosGetProduct() - 114;
  return v1 <= 0x2A && ((1 << v1) & 0x18300C000FLL) != 0;
}

uint64_t capabilities::txpower::supportsUSBCDetection(capabilities::txpower *this)
{
  unsigned __int8 v1;
  unsigned int Radio;

  v1 = atomic_load((unsigned __int8 *)&qword_2544DC058);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2544DC058))
  {
    Radio = TelephonyRadiosGetRadio();
    byte_2544DBFA2 = (Radio < 0x12) & (0x2E000u >> Radio);
    __cxa_guard_release(&qword_2544DC058);
  }
  return byte_2544DBFA2;
}

void sub_24B9FA624(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2544DC058);
  _Unwind_Resume(a1);
}

uint64_t capabilities::txpower::operator&(unsigned int a1, int a2)
{
  return a2 & a1;
}

_DWORD *capabilities::txpower::operator&=(_DWORD *result, int a2)
{
  *result &= a2;
  return result;
}

uint64_t capabilities::txpower::operator|(unsigned int a1, int a2)
{
  return a2 | a1;
}

_DWORD *capabilities::txpower::operator|=(_DWORD *result, int a2)
{
  *result |= a2;
  return result;
}

uint64_t capabilities::txpower::operator^(unsigned int a1, int a2)
{
  return a2 ^ a1;
}

_DWORD *capabilities::txpower::operator^=(_DWORD *result, int a2)
{
  *result ^= a2;
  return result;
}

uint64_t capabilities::txpower::operator~(int a1)
{
  return ~a1;
}

void capabilities::txpower::asString(int a1@<W0>, uint64_t a2@<X8>)
{
  std::vector<std::string>::pointer end;
  __int128 v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  std::string *v9;
  std::string *v10;
  __int128 v11;
  std::string *v12;
  std::vector<std::string>::pointer v13;
  __int128 v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  std::string *v18;
  std::string *v19;
  __int128 v20;
  std::string *v21;
  std::vector<std::string>::pointer v22;
  __int128 v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  std::string *v27;
  std::string *v28;
  __int128 v29;
  std::string *v30;
  std::vector<std::string>::pointer v31;
  __int128 v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  std::string *v36;
  std::string *v37;
  __int128 v38;
  std::string *v39;
  void *__p[2];
  std::string::size_type v41;
  std::vector<std::string> v42;
  void *v43[3];
  std::__split_buffer<std::string> __v;

  memset(v43, 170, sizeof(v43));
  std::string::basic_string[abi:ne180100]<0>(v43, "???");
  memset(&v42, 0, sizeof(v42));
  if (!a1)
  {
    std::string::basic_string[abi:ne180100]<0>((_QWORD *)a2, "kNone");
    goto LABEL_66;
  }
  if ((a1 & 1) == 0)
    goto LABEL_17;
  std::string::basic_string[abi:ne180100]<0>(__p, "kAudio");
  end = v42.__end_;
  if (v42.__end_ < v42.__end_cap_.__value_)
  {
    v5 = *(_OWORD *)__p;
    v42.__end_->__r_.__value_.__r.__words[2] = v41;
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v5;
    v42.__end_ = end + 1;
    if ((a1 & 2) == 0)
      goto LABEL_32;
LABEL_18:
    std::string::basic_string[abi:ne180100]<0>(__p, "kMotion");
    v13 = v42.__end_;
    if (v42.__end_ >= v42.__end_cap_.__value_)
    {
      v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_ - (char *)v42.__begin_) >> 3);
      v16 = v15 + 1;
      if (v15 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      if (0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) > v16)
        v16 = 0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) >= 0x555555555555555)
        v17 = 0xAAAAAAAAAAAAAAALL;
      else
        v17 = v16;
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v42.__end_cap_;
      if (v17)
        v18 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v42.__end_cap_, v17);
      else
        v18 = 0;
      v19 = v18 + v15;
      __v.__first_ = v18;
      __v.__begin_ = v19;
      __v.__end_cap_.__value_ = &v18[v17];
      v20 = *(_OWORD *)__p;
      v19->__r_.__value_.__r.__words[2] = v41;
      *(_OWORD *)&v19->__r_.__value_.__l.__data_ = v20;
      __p[1] = 0;
      v41 = 0;
      __p[0] = 0;
      __v.__end_ = v19 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v42, &__v);
      v21 = v42.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v42.__end_ = v21;
      if (SHIBYTE(v41) < 0)
        operator delete(__p[0]);
    }
    else
    {
      v14 = *(_OWORD *)__p;
      v42.__end_->__r_.__value_.__r.__words[2] = v41;
      *(_OWORD *)&v13->__r_.__value_.__l.__data_ = v14;
      v42.__end_ = v13 + 1;
    }
    goto LABEL_32;
  }
  v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_ - (char *)v42.__begin_) >> 3);
  v7 = v6 + 1;
  if (v6 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  if (0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) > v7)
    v7 = 0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3);
  v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) >= 0x555555555555555
     ? 0xAAAAAAAAAAAAAAALL
     : v7;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v42.__end_cap_;
  v9 = v8
     ? (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v42.__end_cap_, v8)
     : 0;
  v10 = v9 + v6;
  __v.__first_ = v9;
  __v.__begin_ = v10;
  __v.__end_cap_.__value_ = &v9[v8];
  v11 = *(_OWORD *)__p;
  v10->__r_.__value_.__r.__words[2] = v41;
  *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
  __p[1] = 0;
  v41 = 0;
  __p[0] = 0;
  __v.__end_ = v10 + 1;
  std::vector<std::string>::__swap_out_circular_buffer(&v42, &__v);
  v12 = v42.__end_;
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  v42.__end_ = v12;
  if (SHIBYTE(v41) < 0)
  {
    operator delete(__p[0]);
    if ((a1 & 2) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_17:
    if ((a1 & 2) != 0)
      goto LABEL_18;
  }
  if ((a1 & 4) == 0)
    goto LABEL_46;
LABEL_32:
  std::string::basic_string[abi:ne180100]<0>(__p, "kVoiceCall");
  v22 = v42.__end_;
  if (v42.__end_ < v42.__end_cap_.__value_)
  {
    v23 = *(_OWORD *)__p;
    v42.__end_->__r_.__value_.__r.__words[2] = v41;
    *(_OWORD *)&v22->__r_.__value_.__l.__data_ = v23;
    v42.__end_ = v22 + 1;
    if ((a1 & 8) == 0)
      goto LABEL_61;
LABEL_47:
    std::string::basic_string[abi:ne180100]<0>(__p, "kMotionHand");
    v31 = v42.__end_;
    if (v42.__end_ >= v42.__end_cap_.__value_)
    {
      v33 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_ - (char *)v42.__begin_) >> 3);
      v34 = v33 + 1;
      if (v33 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      if (0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) > v34)
        v34 = 0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) >= 0x555555555555555)
        v35 = 0xAAAAAAAAAAAAAAALL;
      else
        v35 = v34;
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v42.__end_cap_;
      if (v35)
        v36 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v42.__end_cap_, v35);
      else
        v36 = 0;
      v37 = v36 + v33;
      __v.__first_ = v36;
      __v.__begin_ = v37;
      __v.__end_cap_.__value_ = &v36[v35];
      v38 = *(_OWORD *)__p;
      v37->__r_.__value_.__r.__words[2] = v41;
      *(_OWORD *)&v37->__r_.__value_.__l.__data_ = v38;
      __p[1] = 0;
      v41 = 0;
      __p[0] = 0;
      __v.__end_ = v37 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v42, &__v);
      v39 = v42.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v42.__end_ = v39;
      if (SHIBYTE(v41) < 0)
        operator delete(__p[0]);
    }
    else
    {
      v32 = *(_OWORD *)__p;
      v42.__end_->__r_.__value_.__r.__words[2] = v41;
      *(_OWORD *)&v31->__r_.__value_.__l.__data_ = v32;
      v42.__end_ = v31 + 1;
    }
    goto LABEL_61;
  }
  v24 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_ - (char *)v42.__begin_) >> 3);
  v25 = v24 + 1;
  if (v24 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  if (0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) > v25)
    v25 = 0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3);
  v26 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) >= 0x555555555555555
      ? 0xAAAAAAAAAAAAAAALL
      : v25;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v42.__end_cap_;
  v27 = v26
      ? (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v42.__end_cap_, v26): 0;
  v28 = v27 + v24;
  __v.__first_ = v27;
  __v.__begin_ = v28;
  __v.__end_cap_.__value_ = &v27[v26];
  v29 = *(_OWORD *)__p;
  v28->__r_.__value_.__r.__words[2] = v41;
  *(_OWORD *)&v28->__r_.__value_.__l.__data_ = v29;
  __p[1] = 0;
  v41 = 0;
  __p[0] = 0;
  __v.__end_ = v28 + 1;
  std::vector<std::string>::__swap_out_circular_buffer(&v42, &__v);
  v30 = v42.__end_;
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  v42.__end_ = v30;
  if (SHIBYTE(v41) < 0)
  {
    operator delete(__p[0]);
    if ((a1 & 8) != 0)
      goto LABEL_47;
  }
  else
  {
LABEL_46:
    if ((a1 & 8) != 0)
      goto LABEL_47;
  }
LABEL_61:
  if (v42.__end_ != v42.__begin_)
  {
    ctu::join<std::__wrap_iter<std::string *>>(v42.__begin_, v42.__end_, " | ", 3uLL, (std::string *)&__v);
    if (SHIBYTE(v43[2]) < 0)
      operator delete(v43[0]);
    *(_OWORD *)v43 = *(_OWORD *)&__v.__first_;
    v43[2] = __v.__end_;
  }
  *(_OWORD *)a2 = *(_OWORD *)v43;
  *(void **)(a2 + 16) = v43[2];
  memset(v43, 0, sizeof(v43));
LABEL_66:
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v42;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  if (SHIBYTE(v43[2]) < 0)
    operator delete(v43[0]);
}

void sub_24B9FABE0(_Unwind_Exception *__p, uint64_t a2, int a3, __int16 a4, char a5, char a6, char a7, uint64_t a8, int *__pa, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, std::__split_buffer<std::string> *a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a24);
  if (SHIBYTE(a11) < 0)
    operator delete(__pa);
  __pa = &a12;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  if (a23 < 0)
    operator delete(a18);
  _Unwind_Resume(__p);
}

_QWORD *capabilities::txpower::asString@<X0>(unsigned int a1@<W0>, _QWORD *a2@<X8>)
{
  char *v2;

  if (a1 > 2)
    v2 = "???";
  else
    v2 = (&off_251CC95D8)[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89B0](name);
}

uint64_t TelephonyRadiosGetHardwareConfig()
{
  return MEMORY[0x24BED96D0]();
}

uint64_t TelephonyRadiosGetProduct()
{
  return MEMORY[0x24BED96D8]();
}

uint64_t TelephonyRadiosGetRadio()
{
  return MEMORY[0x24BED96E0]();
}

uint64_t TelephonyRadiosGetRadioVendor()
{
  return MEMORY[0x24BED96E8]();
}

uint64_t TelephonyUtilIsCarrierBuild()
{
  return MEMORY[0x24BED9720]();
}

uint64_t TelephonyUtilIsInternalBuild()
{
  return MEMORY[0x24BED9728]();
}

uint64_t TelephonyUtilTraceAllowed()
{
  return MEMORY[0x24BED9798]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t ctu::fs::file_exists()
{
  return MEMORY[0x24BED9B38]();
}

uint64_t ctu::TelephonyUtilRadioFusingInferFusingStateFromCertID(ctu *this, const unsigned int *a2)
{
  return MEMORY[0x24BED9C48](this, a2);
}

uint64_t ctu::TelephonyUtilRadioFusingInferFusingStateFromSerialNumber()
{
  return MEMORY[0x24BED9C50]();
}

uint64_t ctu::Gestalt::create_default_global(ctu::Gestalt *this)
{
  return MEMORY[0x24BED9C78](this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
  MEMORY[0x24BEDAC08](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add, __p_new_stuff);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF50]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete[](void *__p)
{
  off_251CC8E08(__p);
}

void operator delete(void *__p)
{
  off_251CC8E10(__p);
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_251CC8E18(__sz);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_251CC8E20(__sz);
}

uint64_t __TUAssertTrigger()
{
  return MEMORY[0x24BED9EF0]();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

uint64_t lookupPathForPersonalizedData()
{
  return MEMORY[0x24BE63550]();
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_uses_ephemeral_storage()
{
  return MEMORY[0x24BDAF4F8]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

