@implementation PBBridgeAkashiReporter

+ (id)descriptionForSetUpType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  id result;
  uint8_t v7[16];
  uint64_t v8;
  uint64_t v9;

  switch(a3)
  {
    case 0uLL:
      v8 = v3;
      v9 = v4;
      pbb_shared_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "Unexpcted PBCAAkashiEvent.", v7, 2u);
      }

      result = &stru_24CBBF548;
      break;
    case 1uLL:
      result = CFSTR("CellularPaneShown");
      break;
    case 2uLL:
      result = CFSTR("CellularPaneSkippedAreadySetUp");
      break;
    case 3uLL:
      result = CFSTR("CellularPaneSkippedBlocked");
      break;
    case 4uLL:
      result = CFSTR("CellularShownSpinner");
      break;
    case 5uLL:
      result = CFSTR("CellularShownSetUpNow");
      break;
    case 6uLL:
      result = CFSTR("CellularShownContinue");
      break;
    case 7uLL:
      result = CFSTR("CellularShownPreinstallSpinner");
      break;
    case 8uLL:
      result = CFSTR("CellularShownTrialOffer");
      break;
    case 9uLL:
      result = CFSTR("CellularShownError");
      break;
    case 0xAuLL:
      result = CFSTR("CellularShownConsentRequest");
      break;
    case 0xBuLL:
      result = CFSTR("CellularUserTappedSkip");
      break;
    case 0xCuLL:
      result = CFSTR("CellularUserTappedSetUpNow");
      break;
    case 0xDuLL:
      result = CFSTR("CellularUserTappedNext");
      break;
    case 0xEuLL:
      result = CFSTR("CellularUserTappedConsent");
      break;
    case 0xFuLL:
      result = CFSTR("CellularUserTappedTransfer");
      break;
    case 0x10uLL:
      result = CFSTR("CellularUserTappedSetUpNew");
      break;
    default:
      result = &stru_24CBBF548;
      break;
  }
  return result;
}

+ (void)incrementSetUpEvent:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("setUpType");
  +[PBBridgeAkashiReporter descriptionForSetUpType:](PBBridgeAkashiReporter, "descriptionForSetUpType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  AnalyticsSendEvent();
}

@end
