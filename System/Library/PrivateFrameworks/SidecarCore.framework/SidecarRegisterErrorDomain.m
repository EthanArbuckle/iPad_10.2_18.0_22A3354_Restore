@implementation SidecarRegisterErrorDomain

__CFString *__SidecarRegisterErrorDomain_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __CFString *v27;
  __CFString *v28;
  uint64_t v29;
  uint64_t v31;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDD0FC8]))
  {
    if (objc_msgSend(v6, "code") == -999)
    {
      objc_msgSend(v6, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = objc_msgSend(v8, "code");
        SidecarLocalizedString(CFSTR("A miscellaneous error occurred (%ld)."), v10, v11, v12, v13, v14, v15, v16, v9);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_78;
      }
    }
    v19 = objc_msgSend(v6, "code");
    if (v19 > -302)
    {
      switch(v19)
      {
        case -105:
          v28 = CFSTR("SidecarErrorServiceExistingSession");
          break;
        case -104:
          v28 = CFSTR("SidecarErrorServiceRestricted");
          break;
        case -103:
          v28 = CFSTR("SidecarErrorServiceNotSupported");
          break;
        case -102:
          v28 = CFSTR("SidecarErrorServiceNotConnected");
          break;
        case -101:
          v28 = CFSTR("SidecarErrorServiceDisconnected");
          break;
        case -100:
          v28 = CFSTR("SidecarErrorServiceAlreadyInUse");
          break;
        default:
          switch(v19)
          {
            case -203:
              v27 = CFSTR("SidecarErrorDeviceWiFiNotEnabled");
              goto LABEL_71;
            case -202:
              v28 = CFSTR("SidecarErrorDeviceLocked");
              goto LABEL_76;
            case -201:
              v28 = CFSTR("SidecarErrorDeviceTimedOut");
              goto LABEL_76;
            case -200:
              v28 = CFSTR("SidecarErrorDeviceNotFound");
              goto LABEL_76;
            default:
              if (v19 != -301)
                goto LABEL_75;
              v28 = CFSTR("SidecarErrorAccountNoD2DEncryption");
              break;
          }
          break;
      }
    }
    else
    {
      if (v19 <= -404)
      {
        switch(v19)
        {
          case -457:
            v27 = CFSTR("SidecarErrorDisplayRealityDeviceWiFiNotEnabled");
            goto LABEL_71;
          case -456:
            v27 = CFSTR("SidecarErrorDisplayAWDLRetrograde");
            goto LABEL_71;
          case -455:
            v28 = CFSTR("SidecarErrorDisplayAWDLDegraded");
            goto LABEL_76;
          case -454:
            v27 = CFSTR("SidecarErrorDisplayDeviceWiFiNotEnabled");
            goto LABEL_71;
          case -453:
            v28 = CFSTR("SidecarErrorDisplayAirPlayBusy");
            goto LABEL_76;
          case -452:
            v27 = CFSTR("SidecarErrorDisplayHostWiFiNotEnabled");
            goto LABEL_71;
          case -451:
            v27 = CFSTR("SidecarErrorDisplayHostIsHotSpot");
            goto LABEL_71;
          default:
            goto LABEL_75;
        }
      }
      if (v19 > -304)
      {
        if (v19 == -303)
          v27 = CFSTR("SidecarErrorHostWiFiNotEnabled");
        else
          v27 = CFSTR("SidecarErrorHostIsHotSpot");
LABEL_71:
        SidecarLocalizedWirelessString(v27, v20, v21, v22, v23, v24, v25, v26, v31);
        v29 = objc_claimAutoreleasedReturnValue();
        goto LABEL_77;
      }
      if (v19 == -403)
      {
        v28 = CFSTR("SidecarErrorDisplayDeviceSoftwareNotSupported");
      }
      else if (v19 == -402)
      {
        v28 = CFSTR("SidecarErrorDisplayHostSoftwareNotSupported");
      }
      else
      {
LABEL_75:
        v31 = v19;
        v28 = CFSTR("A miscellaneous error occurred (%ld).");
      }
    }
LABEL_76:
    SidecarLocalizedString(v28, v20, v21, v22, v23, v24, v25, v26, v31);
    v29 = objc_claimAutoreleasedReturnValue();
LABEL_77:
    v17 = (__CFString *)v29;
    goto LABEL_78;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDD0BA0]))
  {
    v18 = objc_msgSend(v6, "code");
    v17 = 0;
    if (v18 > -402)
    {
      if (v18 > -302)
      {
        switch(v18)
        {
          case -205:
            v17 = CFSTR("SidecarErrorDeviceUSBDisconnect");
            break;
          case -204:
            v17 = CFSTR("SidecarErrorDeviceUSBConnect");
            break;
          case -203:
            v17 = CFSTR("SidecarErrorDeviceWiFiNotEnabled");
            break;
          case -202:
            v17 = CFSTR("SidecarErrorDeviceLocked");
            break;
          case -201:
            v17 = CFSTR("SidecarErrorDeviceTimedOut");
            break;
          case -200:
            v17 = CFSTR("SidecarErrorDeviceNotFound");
            break;
          default:
            switch(v18)
            {
              case -105:
                v17 = CFSTR("SidecarErrorServiceExistingSession");
                break;
              case -104:
                v17 = CFSTR("SidecarErrorServiceRestricted");
                break;
              case -103:
                v17 = CFSTR("SidecarErrorServiceNotSupported");
                break;
              case -102:
                v17 = CFSTR("SidecarErrorServiceNotConnected");
                break;
              case -101:
                v17 = CFSTR("SidecarErrorServiceDisconnected");
                break;
              case -100:
                v17 = CFSTR("SidecarErrorServiceAlreadyInUse");
                break;
              default:
                if (v18 == -301)
                  v17 = CFSTR("SidecarErrorAccountNoD2DEncryption");
                break;
            }
            break;
        }
      }
      else
      {
        switch(v18)
        {
          case -401:
            v17 = CFSTR("SidecarErrorDisplayVideoStreamInterrupted");
            break;
          case -303:
            v17 = CFSTR("SidecarErrorHostWiFiNotEnabled");
            break;
          case -302:
            v17 = CFSTR("SidecarErrorHostIsHotSpot");
            break;
        }
      }
    }
    else if (v18 > -457)
    {
      switch(v18)
      {
        case -456:
          v17 = CFSTR("SidecarErrorDisplayAWDLRetrograde");
          break;
        case -455:
          v17 = CFSTR("SidecarErrorDisplayAWDLDegraded");
          break;
        case -454:
          v17 = CFSTR("SidecarErrorDisplayDeviceWiFiNotEnabled");
          break;
        case -453:
          v17 = CFSTR("SidecarErrorDisplayAirPlayBusy");
          break;
        case -452:
          v17 = CFSTR("SidecarErrorDisplayHostWiFiNotEnabled");
          break;
        case -451:
          v17 = CFSTR("SidecarErrorDisplayHostIsHotSpot");
          break;
        default:
          if (v18 == -403)
          {
            v17 = CFSTR("SidecarErrorDisplayDeviceSoftwareNotSupported");
          }
          else if (v18 == -402)
          {
            v17 = CFSTR("SidecarErrorDisplayHostSoftwareNotSupported");
          }
          break;
      }
    }
    else if (v18 <= -1001)
    {
      if (v18 > -1011)
      {
        if (v18 == -1010)
        {
          v17 = CFSTR("SidecarErrorProtocolError");
        }
        else if (v18 == -1001)
        {
          v17 = CFSTR("SidecarErrorInvalidArgument");
        }
      }
      else if (v18 == -1020)
      {
        v17 = CFSTR("SidecarErrorSessionNotFound");
      }
      else if (v18 == -1011)
      {
        v17 = CFSTR("SidecarErrorEncodingFailed");
      }
    }
    else if (v18 <= -503)
    {
      if (v18 == -1000)
      {
        v17 = CFSTR("SidecarErrorEntitlementMissing");
      }
      else if (v18 == -999)
      {
        v17 = CFSTR("SidecarErrorGenericError");
      }
    }
    else
    {
      switch(v18)
      {
        case -502:
          v17 = CFSTR("SidecarErrorVirtualDisplayInvalid");
          break;
        case -501:
          v17 = CFSTR("SidecarErrorVirtualDisplayFailed");
          break;
        case -500:
          v17 = CFSTR("SidecarErrorVirtualDisplayBusy");
          break;
      }
    }
  }
  else
  {
    v17 = 0;
  }
LABEL_78:

  return v17;
}

@end
