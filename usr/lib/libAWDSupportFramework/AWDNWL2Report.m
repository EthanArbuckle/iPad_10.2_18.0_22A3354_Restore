@implementation AWDNWL2Report

- (void)dealloc
{
  objc_super v3;

  -[AWDNWL2Report setCellularCellType:](self, "setCellularCellType:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDNWL2Report;
  -[AWDNWL2Report dealloc](&v3, sel_dealloc);
}

- (void)setCellularLqm:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_cellularLqm = a3;
}

- (void)setHasCellularLqm:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($133CEF432F59EB34B5FA3C53177D61FE)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasCellularLqm
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (int)cellularPowerCostDownload
{
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    return self->_cellularPowerCostDownload;
  else
    return 0;
}

- (void)setCellularPowerCostDownload:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_cellularPowerCostDownload = a3;
}

- (void)setHasCellularPowerCostDownload:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($133CEF432F59EB34B5FA3C53177D61FE)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasCellularPowerCostDownload
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (id)cellularPowerCostDownloadAsString:(int)a3
{
  id result;

  result = CFSTR("NW_L2_POWER_COST_UNKNOWN");
  switch(a3)
  {
    case 0:
      return result;
    case 1:
      result = CFSTR("NW_L2_POWER_COST_LOW");
      break;
    case 2:
      result = CFSTR("NW_L2_POWER_COST_MEDIUM");
      break;
    case 3:
      result = CFSTR("NW_L2_POWER_COST_HIGH");
      break;
    default:
      if (a3 == 255)
        result = CFSTR("NW_L2_POWER_COST_NOTSET");
      else
        result = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      break;
  }
  return result;
}

- (int)StringAsCellularPowerCostDownload:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_POWER_COST_UNKNOWN")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_POWER_COST_LOW")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_POWER_COST_MEDIUM")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_POWER_COST_HIGH")) & 1) != 0)
    return 3;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_POWER_COST_NOTSET")))
    return 255;
  return 0;
}

- (int)cellularPowerCostUpload
{
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
    return self->_cellularPowerCostUpload;
  else
    return 0;
}

- (void)setCellularPowerCostUpload:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_cellularPowerCostUpload = a3;
}

- (void)setHasCellularPowerCostUpload:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($133CEF432F59EB34B5FA3C53177D61FE)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasCellularPowerCostUpload
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (id)cellularPowerCostUploadAsString:(int)a3
{
  id result;

  result = CFSTR("NW_L2_POWER_COST_UNKNOWN");
  switch(a3)
  {
    case 0:
      return result;
    case 1:
      result = CFSTR("NW_L2_POWER_COST_LOW");
      break;
    case 2:
      result = CFSTR("NW_L2_POWER_COST_MEDIUM");
      break;
    case 3:
      result = CFSTR("NW_L2_POWER_COST_HIGH");
      break;
    default:
      if (a3 == 255)
        result = CFSTR("NW_L2_POWER_COST_NOTSET");
      else
        result = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      break;
  }
  return result;
}

- (int)StringAsCellularPowerCostUpload:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_POWER_COST_UNKNOWN")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_POWER_COST_LOW")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_POWER_COST_MEDIUM")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_POWER_COST_HIGH")) & 1) != 0)
    return 3;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_POWER_COST_NOTSET")))
    return 255;
  return 0;
}

- (void)setCellularKnownGood:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_cellularKnownGood = a3;
}

- (void)setHasCellularKnownGood:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($133CEF432F59EB34B5FA3C53177D61FE)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasCellularKnownGood
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (int)cellularRadioTechnology
{
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
    return self->_cellularRadioTechnology;
  else
    return 0;
}

- (void)setCellularRadioTechnology:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_cellularRadioTechnology = a3;
}

- (void)setHasCellularRadioTechnology:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($133CEF432F59EB34B5FA3C53177D61FE)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasCellularRadioTechnology
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (id)cellularRadioTechnologyAsString:(int)a3
{
  id result;

  result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_UNKNOWN");
  switch(a3)
  {
    case 0:
      return result;
    case 1:
      result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLOTHERS");
      break;
    case 2:
      result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLLTE");
      break;
    case 3:
      result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLGSM");
      break;
    case 4:
      result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLUTRAN");
      break;
    case 5:
      result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLCDMA1X");
      break;
    case 6:
      result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLCDMAEVDO");
      break;
    case 7:
      result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLCDMAHYBRID");
      break;
    case 8:
      result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLTDSCDMA");
      break;
    case 9:
      result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLUMTS");
      break;
    case 10:
      result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_DUAL");
      break;
    case 11:
      result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_BEYOND");
      break;
    default:
      switch(a3)
      {
        case 128:
          result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11A");
          break;
        case 129:
          result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11B");
          break;
        case 130:
          result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11G");
          break;
        case 131:
          result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11N");
          break;
        case 132:
          result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFITURBOA");
          break;
        case 133:
          result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFITURBOG");
          break;
        case 134:
          result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11AC");
          break;
        case 135:
          result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11AX");
          break;
        default:
          result = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
          break;
      }
      break;
  }
  return result;
}

- (int)StringAsCellularRadioTechnology:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_UNKNOWN")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLOTHERS")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLLTE")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLGSM")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLUTRAN")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLCDMA1X")) & 1) != 0)
    return 5;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLCDMAEVDO")) & 1) != 0)
    return 6;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLCDMAHYBRID")) & 1) != 0)
    return 7;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLTDSCDMA")) & 1) != 0)
    return 8;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLUMTS")) & 1) != 0)
    return 9;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_DUAL")) & 1) != 0)
    return 10;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_BEYOND")) & 1) != 0)
    return 11;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11A")) & 1) != 0)
    return 128;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11B")) & 1) != 0)
    return 129;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11G")) & 1) != 0)
    return 130;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11N")) & 1) != 0)
    return 131;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFITURBOA")) & 1) != 0)
    return 132;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFITURBOG")) & 1) != 0)
    return 133;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11AC")) & 1) != 0)
    return 134;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11AX")))
    return 135;
  return 0;
}

- (void)setWifiLqm:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_wifiLqm = a3;
}

- (void)setHasWifiLqm:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($133CEF432F59EB34B5FA3C53177D61FE)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasWifiLqm
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setWifiRssi:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_wifiRssi = a3;
}

- (void)setHasWifiRssi:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($133CEF432F59EB34B5FA3C53177D61FE)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasWifiRssi
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setWifiKnownGood:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_wifiKnownGood = a3;
}

- (void)setHasWifiKnownGood:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($133CEF432F59EB34B5FA3C53177D61FE)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasWifiKnownGood
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (int)wifiRadioTechnology
{
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    return self->_wifiRadioTechnology;
  else
    return 0;
}

- (void)setWifiRadioTechnology:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_wifiRadioTechnology = a3;
}

- (void)setHasWifiRadioTechnology:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($133CEF432F59EB34B5FA3C53177D61FE)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasWifiRadioTechnology
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (id)wifiRadioTechnologyAsString:(int)a3
{
  id result;

  result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_UNKNOWN");
  switch(a3)
  {
    case 0:
      return result;
    case 1:
      result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLOTHERS");
      break;
    case 2:
      result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLLTE");
      break;
    case 3:
      result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLGSM");
      break;
    case 4:
      result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLUTRAN");
      break;
    case 5:
      result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLCDMA1X");
      break;
    case 6:
      result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLCDMAEVDO");
      break;
    case 7:
      result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLCDMAHYBRID");
      break;
    case 8:
      result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLTDSCDMA");
      break;
    case 9:
      result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLUMTS");
      break;
    case 10:
      result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_DUAL");
      break;
    case 11:
      result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_BEYOND");
      break;
    default:
      switch(a3)
      {
        case 128:
          result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11A");
          break;
        case 129:
          result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11B");
          break;
        case 130:
          result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11G");
          break;
        case 131:
          result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11N");
          break;
        case 132:
          result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFITURBOA");
          break;
        case 133:
          result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFITURBOG");
          break;
        case 134:
          result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11AC");
          break;
        case 135:
          result = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11AX");
          break;
        default:
          result = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
          break;
      }
      break;
  }
  return result;
}

- (int)StringAsWifiRadioTechnology:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_UNKNOWN")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLOTHERS")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLLTE")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLGSM")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLUTRAN")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLCDMA1X")) & 1) != 0)
    return 5;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLCDMAEVDO")) & 1) != 0)
    return 6;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLCDMAHYBRID")) & 1) != 0)
    return 7;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLTDSCDMA")) & 1) != 0)
    return 8;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLUMTS")) & 1) != 0)
    return 9;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_DUAL")) & 1) != 0)
    return 10;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_BEYOND")) & 1) != 0)
    return 11;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11A")) & 1) != 0)
    return 128;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11B")) & 1) != 0)
    return 129;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11G")) & 1) != 0)
    return 130;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11N")) & 1) != 0)
    return 131;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFITURBOA")) & 1) != 0)
    return 132;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFITURBOG")) & 1) != 0)
    return 133;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11AC")) & 1) != 0)
    return 134;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11AX")))
    return 135;
  return 0;
}

- (void)setCellularMnc:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_cellularMnc = a3;
}

- (void)setHasCellularMnc:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($133CEF432F59EB34B5FA3C53177D61FE)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasCellularMnc
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setCellularMcc:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_cellularMcc = a3;
}

- (void)setHasCellularMcc:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($133CEF432F59EB34B5FA3C53177D61FE)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasCellularMcc
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setCellularUarfcn:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_cellularUarfcn = a3;
}

- (void)setHasCellularUarfcn:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($133CEF432F59EB34B5FA3C53177D61FE)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasCellularUarfcn
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setCellularPid:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_cellularPid = a3;
}

- (void)setHasCellularPid:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($133CEF432F59EB34B5FA3C53177D61FE)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasCellularPid
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setCellularBandInfo:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_cellularBandInfo = a3;
}

- (void)setHasCellularBandInfo:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($133CEF432F59EB34B5FA3C53177D61FE)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCellularBandInfo
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasCellularCellType
{
  return self->_cellularCellType != 0;
}

- (void)setCellularBandwidth:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_cellularBandwidth = a3;
}

- (void)setHasCellularBandwidth:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($133CEF432F59EB34B5FA3C53177D61FE)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCellularBandwidth
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCellularTac:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_cellularTac = a3;
}

- (void)setHasCellularTac:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($133CEF432F59EB34B5FA3C53177D61FE)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasCellularTac
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setCellularBars:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_cellularBars = a3;
}

- (void)setHasCellularBars:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($133CEF432F59EB34B5FA3C53177D61FE)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCellularBars
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)cellularBand
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_cellularBand;
  else
    return 0;
}

- (void)setCellularBand:(int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_cellularBand = a3;
}

- (void)setHasCellularBand:(BOOL)a3
{
  self->_has = ($133CEF432F59EB34B5FA3C53177D61FE)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasCellularBand
{
  return *(_DWORD *)&self->_has & 1;
}

- (id)cellularBandAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DD80[a3];
}

- (int)StringAsCellularBand:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_BAND_UNKNOWN")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_BAND_LESS")) & 1) != 0)
    return 1;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NW_L2_BAND_MORE")))
    return 2;
  return 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDNWL2Report;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDNWL2Report description](&v3, sel_description), -[AWDNWL2Report dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $133CEF432F59EB34B5FA3C53177D61FE has;
  NSString *cellularCellType;
  $133CEF432F59EB34B5FA3C53177D61FE v6;
  int cellularPowerCostDownload;
  const __CFString *v8;
  uint64_t cellularBand;
  __CFString *v10;
  int cellularPowerCostUpload;
  const __CFString *v13;
  int cellularRadioTechnology;
  const __CFString *v15;
  int wifiRadioTechnology;
  const __CFString *v17;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_cellularLqm), CFSTR("cellular_lqm"));
    has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_40;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  cellularPowerCostDownload = self->_cellularPowerCostDownload;
  v8 = CFSTR("NW_L2_POWER_COST_UNKNOWN");
  switch(cellularPowerCostDownload)
  {
    case 0:
      break;
    case 1:
      v8 = CFSTR("NW_L2_POWER_COST_LOW");
      break;
    case 2:
      v8 = CFSTR("NW_L2_POWER_COST_MEDIUM");
      break;
    case 3:
      v8 = CFSTR("NW_L2_POWER_COST_HIGH");
      break;
    default:
      if (cellularPowerCostDownload == 255)
        v8 = CFSTR("NW_L2_POWER_COST_NOTSET");
      else
        v8 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_cellularPowerCostDownload);
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("cellular_power_cost_download"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_5;
    goto LABEL_48;
  }
LABEL_40:
  cellularPowerCostUpload = self->_cellularPowerCostUpload;
  v13 = CFSTR("NW_L2_POWER_COST_UNKNOWN");
  switch(cellularPowerCostUpload)
  {
    case 0:
      break;
    case 1:
      v13 = CFSTR("NW_L2_POWER_COST_LOW");
      break;
    case 2:
      v13 = CFSTR("NW_L2_POWER_COST_MEDIUM");
      break;
    case 3:
      v13 = CFSTR("NW_L2_POWER_COST_HIGH");
      break;
    default:
      if (cellularPowerCostUpload == 255)
        v13 = CFSTR("NW_L2_POWER_COST_NOTSET");
      else
        v13 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_cellularPowerCostUpload);
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("cellular_power_cost_upload"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_cellularKnownGood), CFSTR("cellular_known_good"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_72;
  }
LABEL_49:
  cellularRadioTechnology = self->_cellularRadioTechnology;
  v15 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_UNKNOWN");
  switch(cellularRadioTechnology)
  {
    case 0:
      break;
    case 1:
      v15 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLOTHERS");
      break;
    case 2:
      v15 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLLTE");
      break;
    case 3:
      v15 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLGSM");
      break;
    case 4:
      v15 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLUTRAN");
      break;
    case 5:
      v15 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLCDMA1X");
      break;
    case 6:
      v15 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLCDMAEVDO");
      break;
    case 7:
      v15 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLCDMAHYBRID");
      break;
    case 8:
      v15 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLTDSCDMA");
      break;
    case 9:
      v15 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLUMTS");
      break;
    case 10:
      v15 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_DUAL");
      break;
    case 11:
      v15 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_BEYOND");
      break;
    default:
      switch(cellularRadioTechnology)
      {
        case 128:
          v15 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11A");
          break;
        case 129:
          v15 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11B");
          break;
        case 130:
          v15 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11G");
          break;
        case 131:
          v15 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11N");
          break;
        case 132:
          v15 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFITURBOA");
          break;
        case 133:
          v15 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFITURBOG");
          break;
        case 134:
          v15 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11AC");
          break;
        case 135:
          v15 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11AX");
          break;
        default:
          v15 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_cellularRadioTechnology);
          break;
      }
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("cellular_radio_technology"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_8;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_wifiLqm), CFSTR("wifi_lqm"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_wifiRssi), CFSTR("wifi_rssi"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_75;
  }
LABEL_74:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_wifiKnownGood), CFSTR("wifi_known_good"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_98;
  }
LABEL_75:
  wifiRadioTechnology = self->_wifiRadioTechnology;
  v17 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_UNKNOWN");
  switch(wifiRadioTechnology)
  {
    case 0:
      break;
    case 1:
      v17 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLOTHERS");
      break;
    case 2:
      v17 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLLTE");
      break;
    case 3:
      v17 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLGSM");
      break;
    case 4:
      v17 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLUTRAN");
      break;
    case 5:
      v17 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLCDMA1X");
      break;
    case 6:
      v17 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLCDMAEVDO");
      break;
    case 7:
      v17 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLCDMAHYBRID");
      break;
    case 8:
      v17 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLTDSCDMA");
      break;
    case 9:
      v17 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_CELLUMTS");
      break;
    case 10:
      v17 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_DUAL");
      break;
    case 11:
      v17 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_BEYOND");
      break;
    default:
      switch(wifiRadioTechnology)
      {
        case 128:
          v17 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11A");
          break;
        case 129:
          v17 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11B");
          break;
        case 130:
          v17 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11G");
          break;
        case 131:
          v17 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11N");
          break;
        case 132:
          v17 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFITURBOA");
          break;
        case 133:
          v17 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFITURBOG");
          break;
        case 134:
          v17 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11AC");
          break;
        case 135:
          v17 = CFSTR("NW_L2_RADIO_TECHNOLOGY_TYPE_WIFI11AX");
          break;
        default:
          v17 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_wifiRadioTechnology);
          break;
      }
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("wifi_radio_technology"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_99;
  }
LABEL_98:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_cellularMnc), CFSTR("cellular_mnc"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_100;
  }
LABEL_99:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_cellularMcc), CFSTR("cellular_mcc"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_101;
  }
LABEL_100:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_cellularUarfcn), CFSTR("cellular_uarfcn"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_101:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_cellularPid), CFSTR("cellular_pid"));
  if ((*(_DWORD *)&self->_has & 2) != 0)
LABEL_15:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_cellularBandInfo), CFSTR("cellular_band_info"));
LABEL_16:
  cellularCellType = self->_cellularCellType;
  if (cellularCellType)
    objc_msgSend(v3, "setObject:forKey:", cellularCellType, CFSTR("cellular_cell_type"));
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_cellularBandwidth), CFSTR("cellular_bandwidth"));
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x800) == 0)
    {
LABEL_20:
      if ((*(_BYTE *)&v6 & 8) == 0)
        goto LABEL_21;
LABEL_28:
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_cellularBars), CFSTR("cellular_bars"));
      if ((*(_DWORD *)&self->_has & 1) == 0)
        return v3;
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&v6 & 0x800) == 0)
  {
    goto LABEL_20;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_cellularTac), CFSTR("cellular_tac"));
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 8) != 0)
    goto LABEL_28;
LABEL_21:
  if ((*(_BYTE *)&v6 & 1) == 0)
    return v3;
LABEL_29:
  cellularBand = self->_cellularBand;
  if (cellularBand >= 3)
    v10 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_cellularBand);
  else
    v10 = off_24C10DD80[cellularBand];
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("cellular_band"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNWL2ReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $133CEF432F59EB34B5FA3C53177D61FE has;
  $133CEF432F59EB34B5FA3C53177D61FE v5;

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_5;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_8;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_35:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 2) != 0)
LABEL_15:
    PBDataWriterWriteInt32Field();
LABEL_16:
  if (self->_cellularCellType)
    PBDataWriterWriteStringField();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = self->_has;
    if ((*(_WORD *)&v5 & 0x800) == 0)
    {
LABEL_20:
      if ((*(_BYTE *)&v5 & 8) == 0)
        goto LABEL_21;
      goto LABEL_39;
    }
  }
  else if ((*(_WORD *)&v5 & 0x800) == 0)
  {
    goto LABEL_20;
  }
  PBDataWriterWriteInt32Field();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 8) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v5 & 1) == 0)
      return;
LABEL_40:
    PBDataWriterWriteInt32Field();
    return;
  }
LABEL_39:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 1) != 0)
    goto LABEL_40;
}

- (void)copyTo:(id)a3
{
  $133CEF432F59EB34B5FA3C53177D61FE has;
  $133CEF432F59EB34B5FA3C53177D61FE v6;

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_cellularLqm;
    *((_DWORD *)a3 + 21) |= 0x10u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 12) = self->_cellularPowerCostDownload;
  *((_DWORD *)a3 + 21) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 13) = self->_cellularPowerCostUpload;
  *((_DWORD *)a3 + 21) |= 0x200u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  *((_BYTE *)a3 + 80) = self->_cellularKnownGood;
  *((_DWORD *)a3 + 21) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)a3 + 14) = self->_cellularRadioTechnology;
  *((_DWORD *)a3 + 21) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)a3 + 17) = self->_wifiLqm;
  *((_DWORD *)a3 + 21) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)a3 + 19) = self->_wifiRssi;
  *((_DWORD *)a3 + 21) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  *((_BYTE *)a3 + 81) = self->_wifiKnownGood;
  *((_DWORD *)a3 + 21) |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)a3 + 18) = self->_wifiRadioTechnology;
  *((_DWORD *)a3 + 21) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)a3 + 10) = self->_cellularMnc;
  *((_DWORD *)a3 + 21) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)a3 + 9) = self->_cellularMcc;
  *((_DWORD *)a3 + 21) |= 0x20u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)a3 + 16) = self->_cellularUarfcn;
  *((_DWORD *)a3 + 21) |= 0x1000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_36:
  *((_DWORD *)a3 + 11) = self->_cellularPid;
  *((_DWORD *)a3 + 21) |= 0x80u;
  if ((*(_DWORD *)&self->_has & 2) != 0)
  {
LABEL_15:
    *((_DWORD *)a3 + 3) = self->_cellularBandInfo;
    *((_DWORD *)a3 + 21) |= 2u;
  }
LABEL_16:
  if (self->_cellularCellType)
    objc_msgSend(a3, "setCellularCellType:");
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 4) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_cellularBandwidth;
    *((_DWORD *)a3 + 21) |= 4u;
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x800) == 0)
    {
LABEL_20:
      if ((*(_BYTE *)&v6 & 8) == 0)
        goto LABEL_21;
      goto LABEL_40;
    }
  }
  else if ((*(_WORD *)&v6 & 0x800) == 0)
  {
    goto LABEL_20;
  }
  *((_DWORD *)a3 + 15) = self->_cellularTac;
  *((_DWORD *)a3 + 21) |= 0x800u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 8) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v6 & 1) == 0)
      return;
    goto LABEL_22;
  }
LABEL_40:
  *((_DWORD *)a3 + 5) = self->_cellularBars;
  *((_DWORD *)a3 + 21) |= 8u;
  if ((*(_DWORD *)&self->_has & 1) == 0)
    return;
LABEL_22:
  *((_DWORD *)a3 + 2) = self->_cellularBand;
  *((_DWORD *)a3 + 21) |= 1u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $133CEF432F59EB34B5FA3C53177D61FE has;
  $133CEF432F59EB34B5FA3C53177D61FE v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_cellularLqm;
    *(_DWORD *)(v5 + 84) |= 0x10u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 48) = self->_cellularPowerCostDownload;
  *(_DWORD *)(v5 + 84) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 52) = self->_cellularPowerCostUpload;
  *(_DWORD *)(v5 + 84) |= 0x200u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  *(_BYTE *)(v5 + 80) = self->_cellularKnownGood;
  *(_DWORD *)(v5 + 84) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v5 + 56) = self->_cellularRadioTechnology;
  *(_DWORD *)(v5 + 84) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v5 + 68) = self->_wifiLqm;
  *(_DWORD *)(v5 + 84) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v5 + 76) = self->_wifiRssi;
  *(_DWORD *)(v5 + 84) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  *(_BYTE *)(v5 + 81) = self->_wifiKnownGood;
  *(_DWORD *)(v5 + 84) |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  *(_DWORD *)(v5 + 72) = self->_wifiRadioTechnology;
  *(_DWORD *)(v5 + 84) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  *(_DWORD *)(v5 + 40) = self->_cellularMnc;
  *(_DWORD *)(v5 + 84) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  *(_DWORD *)(v5 + 36) = self->_cellularMcc;
  *(_DWORD *)(v5 + 84) |= 0x20u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  *(_DWORD *)(v5 + 64) = self->_cellularUarfcn;
  *(_DWORD *)(v5 + 84) |= 0x1000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_34:
  *(_DWORD *)(v5 + 44) = self->_cellularPid;
  *(_DWORD *)(v5 + 84) |= 0x80u;
  if ((*(_DWORD *)&self->_has & 2) != 0)
  {
LABEL_15:
    *(_DWORD *)(v5 + 12) = self->_cellularBandInfo;
    *(_DWORD *)(v5 + 84) |= 2u;
  }
LABEL_16:

  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_cellularCellType, "copyWithZone:", a3);
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 4) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_cellularBandwidth;
    *(_DWORD *)(v6 + 84) |= 4u;
    v8 = self->_has;
    if ((*(_WORD *)&v8 & 0x800) == 0)
    {
LABEL_18:
      if ((*(_BYTE *)&v8 & 8) == 0)
        goto LABEL_19;
LABEL_38:
      *(_DWORD *)(v6 + 20) = self->_cellularBars;
      *(_DWORD *)(v6 + 84) |= 8u;
      if ((*(_DWORD *)&self->_has & 1) == 0)
        return (id)v6;
      goto LABEL_20;
    }
  }
  else if ((*(_WORD *)&v8 & 0x800) == 0)
  {
    goto LABEL_18;
  }
  *(_DWORD *)(v6 + 60) = self->_cellularTac;
  *(_DWORD *)(v6 + 84) |= 0x800u;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 8) != 0)
    goto LABEL_38;
LABEL_19:
  if ((*(_BYTE *)&v8 & 1) != 0)
  {
LABEL_20:
    *(_DWORD *)(v6 + 8) = self->_cellularBand;
    *(_DWORD *)(v6 + 84) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $133CEF432F59EB34B5FA3C53177D61FE has;
  int v7;
  NSString *cellularCellType;
  int v9;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = self->_has;
  v7 = *((_DWORD *)a3 + 21);
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_cellularLqm != *((_DWORD *)a3 + 8))
      goto LABEL_100;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_cellularPowerCostDownload != *((_DWORD *)a3 + 12))
      goto LABEL_100;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_cellularPowerCostUpload != *((_DWORD *)a3 + 13))
      goto LABEL_100;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0)
      goto LABEL_100;
    if (self->_cellularKnownGood)
    {
      if (!*((_BYTE *)a3 + 80))
        goto LABEL_100;
    }
    else if (*((_BYTE *)a3 + 80))
    {
      goto LABEL_100;
    }
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_cellularRadioTechnology != *((_DWORD *)a3 + 14))
      goto LABEL_100;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_wifiLqm != *((_DWORD *)a3 + 17))
      goto LABEL_100;
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_wifiRssi != *((_DWORD *)a3 + 19))
      goto LABEL_100;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
    if ((v7 & 0x20000) != 0)
      goto LABEL_100;
    goto LABEL_48;
  }
  if ((v7 & 0x20000) == 0)
    goto LABEL_100;
  if (self->_wifiKnownGood)
  {
    if (!*((_BYTE *)a3 + 81))
      goto LABEL_100;
    goto LABEL_48;
  }
  if (*((_BYTE *)a3 + 81))
  {
LABEL_100:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_48:
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_wifiRadioTechnology != *((_DWORD *)a3 + 18))
      goto LABEL_100;
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_cellularMnc != *((_DWORD *)a3 + 10))
      goto LABEL_100;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_cellularMcc != *((_DWORD *)a3 + 9))
      goto LABEL_100;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_cellularUarfcn != *((_DWORD *)a3 + 16))
      goto LABEL_100;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_cellularPid != *((_DWORD *)a3 + 11))
      goto LABEL_100;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_cellularBandInfo != *((_DWORD *)a3 + 3))
      goto LABEL_100;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_100;
  }
  cellularCellType = self->_cellularCellType;
  if ((unint64_t)cellularCellType | *((_QWORD *)a3 + 3))
  {
    v5 = -[NSString isEqual:](cellularCellType, "isEqual:");
    if (!v5)
      return v5;
    has = self->_has;
  }
  v9 = *((_DWORD *)a3 + 21);
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_cellularBandwidth != *((_DWORD *)a3 + 4))
      goto LABEL_100;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v9 & 0x800) == 0 || self->_cellularTac != *((_DWORD *)a3 + 15))
      goto LABEL_100;
  }
  else if ((v9 & 0x800) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_cellularBars != *((_DWORD *)a3 + 5))
      goto LABEL_100;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_100;
  }
  LOBYTE(v5) = (*((_DWORD *)a3 + 21) & 1) == 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_cellularBand != *((_DWORD *)a3 + 2))
      goto LABEL_100;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  $133CEF432F59EB34B5FA3C53177D61FE has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  $133CEF432F59EB34B5FA3C53177D61FE v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    v24 = 2654435761 * self->_cellularLqm;
    if ((*(_WORD *)&has & 0x100) != 0)
    {
LABEL_3:
      v23 = 2654435761 * self->_cellularPowerCostDownload;
      if ((*(_WORD *)&has & 0x200) != 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else
  {
    v24 = 0;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_3;
  }
  v23 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_4:
    v22 = 2654435761 * self->_cellularPowerCostUpload;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  v22 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_5:
    v21 = 2654435761 * self->_cellularKnownGood;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  v21 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_6:
    v20 = 2654435761 * self->_cellularRadioTechnology;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  v20 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_7:
    v19 = 2654435761 * self->_wifiLqm;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  v19 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_8:
    v18 = 2654435761 * self->_wifiRssi;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  v18 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_9:
    v4 = 2654435761 * self->_wifiKnownGood;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  v4 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_10:
    v5 = 2654435761 * self->_wifiRadioTechnology;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  v5 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_11:
    v6 = 2654435761 * self->_cellularMnc;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  v6 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_12:
    v7 = 2654435761 * self->_cellularMcc;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  v7 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_13:
    v8 = 2654435761 * self->_cellularUarfcn;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_14;
LABEL_28:
    v9 = 0;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_15;
    goto LABEL_29;
  }
LABEL_27:
  v8 = 0;
  if ((*(_BYTE *)&has & 0x80) == 0)
    goto LABEL_28;
LABEL_14:
  v9 = 2654435761 * self->_cellularPid;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_15:
    v10 = 2654435761 * self->_cellularBandInfo;
    goto LABEL_30;
  }
LABEL_29:
  v10 = 0;
LABEL_30:
  v11 = -[NSString hash](self->_cellularCellType, "hash");
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 4) != 0)
  {
    v13 = 2654435761 * self->_cellularBandwidth;
    if ((*(_WORD *)&v12 & 0x800) != 0)
    {
LABEL_32:
      v14 = 2654435761 * self->_cellularTac;
      if ((*(_BYTE *)&v12 & 8) != 0)
        goto LABEL_33;
LABEL_37:
      v15 = 0;
      if ((*(_BYTE *)&v12 & 1) != 0)
        goto LABEL_34;
LABEL_38:
      v16 = 0;
      return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v11;
    }
  }
  else
  {
    v13 = 0;
    if ((*(_WORD *)&v12 & 0x800) != 0)
      goto LABEL_32;
  }
  v14 = 0;
  if ((*(_BYTE *)&v12 & 8) == 0)
    goto LABEL_37;
LABEL_33:
  v15 = 2654435761 * self->_cellularBars;
  if ((*(_BYTE *)&v12 & 1) == 0)
    goto LABEL_38;
LABEL_34:
  v16 = 2654435761 * self->_cellularBand;
  return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  int v5;
  int v6;

  v5 = *((_DWORD *)a3 + 21);
  if ((v5 & 0x10) != 0)
  {
    self->_cellularLqm = *((_DWORD *)a3 + 8);
    *(_DWORD *)&self->_has |= 0x10u;
    v5 = *((_DWORD *)a3 + 21);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((v5 & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_cellularPowerCostDownload = *((_DWORD *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)a3 + 21);
  if ((v5 & 0x200) == 0)
  {
LABEL_4:
    if ((v5 & 0x10000) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  self->_cellularPowerCostUpload = *((_DWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)a3 + 21);
  if ((v5 & 0x10000) == 0)
  {
LABEL_5:
    if ((v5 & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  self->_cellularKnownGood = *((_BYTE *)a3 + 80);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)a3 + 21);
  if ((v5 & 0x400) == 0)
  {
LABEL_6:
    if ((v5 & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  self->_cellularRadioTechnology = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)a3 + 21);
  if ((v5 & 0x2000) == 0)
  {
LABEL_7:
    if ((v5 & 0x8000) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  self->_wifiLqm = *((_DWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = *((_DWORD *)a3 + 21);
  if ((v5 & 0x8000) == 0)
  {
LABEL_8:
    if ((v5 & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  self->_wifiRssi = *((_DWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)a3 + 21);
  if ((v5 & 0x20000) == 0)
  {
LABEL_9:
    if ((v5 & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  self->_wifiKnownGood = *((_BYTE *)a3 + 81);
  *(_DWORD *)&self->_has |= 0x20000u;
  v5 = *((_DWORD *)a3 + 21);
  if ((v5 & 0x4000) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  self->_wifiRadioTechnology = *((_DWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = *((_DWORD *)a3 + 21);
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  self->_cellularMnc = *((_DWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)a3 + 21);
  if ((v5 & 0x20) == 0)
  {
LABEL_12:
    if ((v5 & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  self->_cellularMcc = *((_DWORD *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)a3 + 21);
  if ((v5 & 0x1000) == 0)
  {
LABEL_13:
    if ((v5 & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  self->_cellularUarfcn = *((_DWORD *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)a3 + 21);
  if ((v5 & 0x80) == 0)
  {
LABEL_14:
    if ((v5 & 2) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_36:
  self->_cellularPid = *((_DWORD *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x80u;
  if ((*((_DWORD *)a3 + 21) & 2) != 0)
  {
LABEL_15:
    self->_cellularBandInfo = *((_DWORD *)a3 + 3);
    *(_DWORD *)&self->_has |= 2u;
  }
LABEL_16:
  if (*((_QWORD *)a3 + 3))
    -[AWDNWL2Report setCellularCellType:](self, "setCellularCellType:");
  v6 = *((_DWORD *)a3 + 21);
  if ((v6 & 4) != 0)
  {
    self->_cellularBandwidth = *((_DWORD *)a3 + 4);
    *(_DWORD *)&self->_has |= 4u;
    v6 = *((_DWORD *)a3 + 21);
    if ((v6 & 0x800) == 0)
    {
LABEL_20:
      if ((v6 & 8) == 0)
        goto LABEL_21;
      goto LABEL_40;
    }
  }
  else if ((v6 & 0x800) == 0)
  {
    goto LABEL_20;
  }
  self->_cellularTac = *((_DWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x800u;
  v6 = *((_DWORD *)a3 + 21);
  if ((v6 & 8) == 0)
  {
LABEL_21:
    if ((v6 & 1) == 0)
      return;
    goto LABEL_22;
  }
LABEL_40:
  self->_cellularBars = *((_DWORD *)a3 + 5);
  *(_DWORD *)&self->_has |= 8u;
  if ((*((_DWORD *)a3 + 21) & 1) == 0)
    return;
LABEL_22:
  self->_cellularBand = *((_DWORD *)a3 + 2);
  *(_DWORD *)&self->_has |= 1u;
}

- (int)cellularLqm
{
  return self->_cellularLqm;
}

- (BOOL)cellularKnownGood
{
  return self->_cellularKnownGood;
}

- (int)wifiLqm
{
  return self->_wifiLqm;
}

- (int)wifiRssi
{
  return self->_wifiRssi;
}

- (BOOL)wifiKnownGood
{
  return self->_wifiKnownGood;
}

- (int)cellularMnc
{
  return self->_cellularMnc;
}

- (int)cellularMcc
{
  return self->_cellularMcc;
}

- (int)cellularUarfcn
{
  return self->_cellularUarfcn;
}

- (int)cellularPid
{
  return self->_cellularPid;
}

- (int)cellularBandInfo
{
  return self->_cellularBandInfo;
}

- (NSString)cellularCellType
{
  return self->_cellularCellType;
}

- (void)setCellularCellType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int)cellularBandwidth
{
  return self->_cellularBandwidth;
}

- (int)cellularTac
{
  return self->_cellularTac;
}

- (int)cellularBars
{
  return self->_cellularBars;
}

@end
