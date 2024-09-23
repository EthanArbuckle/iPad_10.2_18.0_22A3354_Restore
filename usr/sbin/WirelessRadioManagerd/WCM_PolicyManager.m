@implementation WCM_PolicyManager

- (BOOL)hpCellNeed2SetBTAFH
{
  return self->_hpCellNeed2SetBTAFH;
}

- (void)configureWifiAntennaSelectionForCoex
{
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  const char *v11;
  unsigned int v12;
  char v13;
  char v14;
  _QWORD *v15;
  _QWORD *v16;
  unsigned int v17;
  unsigned int v18;
  __int16 v19;
  unsigned __int16 v20;
  unsigned __int16 v21;
  unsigned __int16 v22;
  unsigned __int16 v23;
  unsigned __int16 v24;
  unsigned __int16 v25;
  unsigned __int16 v26;
  unsigned __int16 v27;
  _QWORD v28[9];
  _QWORD v29[9];
  _QWORD v30[9];
  _QWORD v31[9];
  _QWORD v32[9];
  _QWORD v33[9];
  _QWORD v34[9];
  _QWORD v35[9];
  _QWORD v36[9];
  _QWORD v37[9];
  _QWORD v38[9];
  _QWORD v39[9];
  _QWORD v40[9];
  _QWORD v41[9];
  _QWORD v42[9];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("YYDebug_ configureWifiAntennaSelectionForCoex: wifi state = %d, "), -[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState"));
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("AntennaSelectionCoex"))|| (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("AntennaSelectionV2Coex"))|| -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("AntennaSelectionV1_1Coex")))&& !-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport")))
  {
    -[WCM_PolicyManager updateWifiAntennaSelectionV1V2Configs](self, "updateWifiAntennaSelectionV1V2Configs");
  }
  else if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("AntennaSelectionV2Coex"))&& -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport")))
  {
    if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("PencilCoexSupport")))
    {
      if (self->_pencilCoexActive)
      {
        v3 = -[WCM_PolicyManager getWifiAntennaBitmapForPencilCoexByPlatform](self, "getWifiAntennaBitmapForPencilCoexByPlatform");
        v4 = v3 | 0x800;
        v18 = v3 | 0x1800;
        v5 = v3 | 0x2800;
        v6 = v3 | 0x3800;
        v7 = v3 | 0x4800;
        v8 = v3 | 0x5800;
        v9 = v3 | 0x6800;
        v10 = v3 | 0x7800;
      }
      else
      {
        v4 = 0;
        v18 = 4096;
        v5 = 0x2000;
        v6 = 12288;
        v7 = 0x4000;
        v8 = 20480;
        v9 = 24576;
        v10 = 28672;
      }
      if (-[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState"))
      {
        if (-[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState") == 1)
        {
          v11 = "ENABLED";
        }
        else if (-[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState") == 2)
        {
          v11 = "ASSOCIATED_2G";
        }
        else if (-[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState") == 3)
        {
          v11 = "ASSOCIATED_5G";
        }
        else
        {
          v12 = -[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState");
          v11 = "INVALID_STATE!!!";
          if (v12 == 4)
            v11 = "ASSOCIATED_6G";
        }
      }
      else
      {
        v11 = "DISABLED";
      }
      v17 = v5;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("YYDebug_ configureAntennaForCoex: with WiFi State (%s), Pencil coex antenna selection for band 2G, bitmaps 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x"), v11, v4, v18, v5, v6, v7, v8, v9, v10);
    }
    else
    {
      v4 = 0;
      v10 = 28672;
      v9 = 24576;
      v8 = 20480;
      v7 = 0x4000;
      v6 = 12288;
      v17 = 0x2000;
      v18 = 4096;
    }
    v27 = 0;
    v26 = 4096;
    v25 = 0x2000;
    v24 = 12288;
    v23 = 0x4000;
    v22 = 20480;
    v21 = 24576;
    v20 = 28672;
    v19 = 0;
    -[WCM_PolicyManager getUpdatedWifiAntennaSelectionEnhConfigsWithbmWifiEnhAntTx000:bmWiFiEnhAntTx001:bmWiFiEnhAntTx010:bmWiFiEnhAntTx011:bmWiFiEnhAntTx100:bmWiFiEnhAntTx101:bmWiFiEnhAntTx110:bmWiFiEnhAntTx111:bmWiFiBand:](self, "getUpdatedWifiAntennaSelectionEnhConfigsWithbmWifiEnhAntTx000:bmWiFiEnhAntTx001:bmWiFiEnhAntTx010:bmWiFiEnhAntTx011:bmWiFiEnhAntTx100:bmWiFiEnhAntTx101:bmWiFiEnhAntTx110:bmWiFiEnhAntTx111:bmWiFiBand:", &v27, &v26, &v25, &v24, &v23, &v22, &v21, &v20, &v19);
    if (self->_pencilCoexActive)
    {
      v27 = 0;
      v26 = 4096;
      v25 = 0x2000;
      v24 = 12288;
      v23 = 0x4000;
      v22 = 20480;
      v21 = 24576;
      v20 = 28672;
      v42[0] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 2);
      v42[1] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v27);
      v42[2] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v26);
      v42[3] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v25);
      v42[4] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v24);
      v42[5] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v23);
      v42[6] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v22);
      v42[7] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v21);
      v42[8] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v20);
      -[WCM_WiFiController updateAntennaSelectionWiFiEnh5G:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateAntennaSelectionWiFiEnh5G:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 9));
      v41[0] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 3);
      v41[1] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v27);
      v41[2] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v26);
      v41[3] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v25);
      v41[4] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v24);
      v41[5] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v23);
      v41[6] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v22);
      v41[7] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v21);
      v41[8] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v20);
      -[WCM_WiFiController updateAntennaSelectionWiFiEnh6G:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateAntennaSelectionWiFiEnh6G:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 9));
      v40[0] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 1);
      v40[1] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v4);
      v40[2] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v18);
      v40[3] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v17);
      v40[4] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v6);
      v40[5] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v7);
      v40[6] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v8);
      v40[7] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v9);
      v40[8] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v10);
      v15 = v40;
LABEL_27:
      -[WCM_WiFiController updateAntennaSelectionWiFiEnh2G:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateAntennaSelectionWiFiEnh2G:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 9));
    }
    else if (!v14 & v13)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("YYDebug_ Unknown WiFi band for WiFi antenna selection"));
    }
    else
    {
      switch(v19)
      {
        case 0:
          v27 = 0;
          v26 = 4096;
          v25 = 0x2000;
          v24 = 12288;
          v23 = 0x4000;
          v22 = 20480;
          v21 = 24576;
          v20 = 28672;
          v39[0] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 1);
          v39[1] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v27);
          v39[2] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v26);
          v39[3] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v25);
          v39[4] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v24);
          v39[5] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v23);
          v39[6] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v22);
          v39[7] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v21);
          v39[8] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v20);
          -[WCM_WiFiController updateAntennaSelectionWiFiEnh2G:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateAntennaSelectionWiFiEnh2G:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 9));
          v38[0] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 2);
          v38[1] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v27);
          v38[2] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v26);
          v38[3] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v25);
          v38[4] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v24);
          v38[5] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v23);
          v38[6] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v22);
          v38[7] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v21);
          v38[8] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v20);
          -[WCM_WiFiController updateAntennaSelectionWiFiEnh5G:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateAntennaSelectionWiFiEnh5G:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 9));
          v37[0] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 3);
          v37[1] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v27);
          v37[2] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v26);
          v37[3] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v25);
          v37[4] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v24);
          v37[5] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v23);
          v37[6] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v22);
          v37[7] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v21);
          v37[8] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v20);
          v16 = v37;
          goto LABEL_34;
        case 1:
          v36[0] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 1);
          v36[1] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v27);
          v36[2] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v26);
          v36[3] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v25);
          v36[4] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v24);
          v36[5] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v23);
          v36[6] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v22);
          v36[7] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v21);
          v36[8] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v20);
          -[WCM_WiFiController updateAntennaSelectionWiFiEnh2G:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateAntennaSelectionWiFiEnh2G:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 9));
          v27 = 0;
          v26 = 4096;
          v25 = 0x2000;
          v24 = 12288;
          v23 = 0x4000;
          v22 = 20480;
          v21 = 24576;
          v20 = 28672;
          v35[0] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 2);
          v35[1] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v27);
          v35[2] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v26);
          v35[3] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v25);
          v35[4] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v24);
          v35[5] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v23);
          v35[6] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v22);
          v35[7] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v21);
          v35[8] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v20);
          -[WCM_WiFiController updateAntennaSelectionWiFiEnh2G:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateAntennaSelectionWiFiEnh2G:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 9));
          v34[0] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 3);
          v34[1] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v27);
          v34[2] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v26);
          v34[3] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v25);
          v34[4] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v24);
          v34[5] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v23);
          v34[6] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v22);
          v34[7] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v21);
          v34[8] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v20);
          v15 = v34;
          goto LABEL_27;
        case 2:
          v33[0] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 2);
          v33[1] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v27);
          v33[2] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v26);
          v33[3] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v25);
          v33[4] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v24);
          v33[5] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v23);
          v33[6] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v22);
          v33[7] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v21);
          v33[8] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v20);
          -[WCM_WiFiController updateAntennaSelectionWiFiEnh5G:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateAntennaSelectionWiFiEnh5G:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 9));
          v27 = 0;
          v26 = 4096;
          v25 = 0x2000;
          v24 = 12288;
          v23 = 0x4000;
          v22 = 20480;
          v21 = 24576;
          v20 = 28672;
          v32[0] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 1);
          v32[1] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v27);
          v32[2] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v26);
          v32[3] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v25);
          v32[4] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v24);
          v32[5] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v23);
          v32[6] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v22);
          v32[7] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v21);
          v32[8] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v20);
          -[WCM_WiFiController updateAntennaSelectionWiFiEnh2G:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateAntennaSelectionWiFiEnh2G:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 9));
          v31[0] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 3);
          v31[1] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v27);
          v31[2] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v26);
          v31[3] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v25);
          v31[4] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v24);
          v31[5] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v23);
          v31[6] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v22);
          v31[7] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v21);
          v31[8] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v20);
          v16 = v31;
LABEL_34:
          -[WCM_WiFiController updateAntennaSelectionWiFiEnh6G:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateAntennaSelectionWiFiEnh6G:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 9));
          break;
        case 3:
          v30[0] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 3);
          v30[1] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v27);
          v30[2] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v26);
          v30[3] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v25);
          v30[4] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v24);
          v30[5] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v23);
          v30[6] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v22);
          v30[7] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v21);
          v30[8] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v20);
          -[WCM_WiFiController updateAntennaSelectionWiFiEnh6G:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateAntennaSelectionWiFiEnh6G:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 9));
          v27 = 0;
          v26 = 4096;
          v25 = 0x2000;
          v24 = 12288;
          v23 = 0x4000;
          v22 = 20480;
          v21 = 24576;
          v20 = 28672;
          v29[0] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 1);
          v29[1] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v27);
          v29[2] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v26);
          v29[3] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v25);
          v29[4] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v24);
          v29[5] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v23);
          v29[6] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v22);
          v29[7] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v21);
          v29[8] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v20);
          -[WCM_WiFiController updateAntennaSelectionWiFiEnh2G:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateAntennaSelectionWiFiEnh2G:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 9));
          v28[0] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 2);
          v28[1] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v27);
          v28[2] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v26);
          v28[3] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v25);
          v28[4] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v24);
          v28[5] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v23);
          v28[6] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v22);
          v28[7] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v21);
          v28[8] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v20);
          -[WCM_WiFiController updateAntennaSelectionWiFiEnh5G:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateAntennaSelectionWiFiEnh5G:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 9));
          break;
        default:
          return;
      }
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("YYDebug_ WiFi antenna selection is not supported"));
  }
}

- (void)updateControllerState:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100018014;
  v3[3] = &unk_100201BB8;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async((dispatch_queue_t)objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getQueue"), v3);
}

- (void)updateBTCatsState:(unsigned __int8)a3 bitmap:(unint64_t)a4 band:(int)a5 desiredBtDc:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v9 = a3;
  if (-[WCM_PolicyManager btController](self, "btController"))
    -[WCM_BTController updateWiFiCatsState:bitmap:band:desiredBtDc:](-[WCM_PolicyManager btController](self, "btController"), "updateWiFiCatsState:bitmap:band:desiredBtDc:", v9, a4, v7, v6);
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("BT Controller is not alloc'd"));
}

- (void)handleWiFiBTCatsChange:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v5 = -[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState");
  v6 = -[WCM_WiFiController catsAppPriority](-[WCM_PolicyManager wifiController](self, "wifiController"), "catsAppPriority");
  v7 = -[WCM_WiFiController catsAppBitmap](-[WCM_PolicyManager wifiController](self, "wifiController"), "catsAppBitmap");
  if (v3)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("handleWiFiBTCatsChange WiFi is turning off"));
    v6 = 0;
    v8 = 0;
    v5 = 0;
  }
  else
  {
    v8 = v7;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("handleWiFiBTCatsChange catsState(%d -> %d) bitmap(0x%x -> 0x%x) wifiState(%d -> %d)"), byte_1002713C8, v6, qword_1002713D0, v8, dword_1002713C4, v5);
  if (byte_1002713C8 != (_DWORD)v6 || qword_1002713D0 != v8 || dword_1002713C4 != (_DWORD)v5)
  {
    if ((v5 - 1) > 3)
      v9 = 0;
    else
      v9 = dword_1001DEEC0[(int)v5 - 1];
    if ((_DWORD)v6 == 2)
      v10 = 3;
    else
      v10 = 0;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("handleWiFiBTCatsChange updating cats state to BT"));
    -[WCM_PolicyManager updateBTCatsState:bitmap:band:desiredBtDc:](self, "updateBTCatsState:bitmap:band:desiredBtDc:", v6, v8, v9, v10);
    dword_1002713C4 = v5;
    byte_1002713C8 = v6;
    qword_1002713D0 = v8;
  }
}

- (void)handleWiFiBTCoexChange
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  WCM_WiFiController *v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  unsigned int v12;
  const char *v13;
  unsigned int v14;
  unsigned int v15;
  char v16;
  uint64_t v17;
  WCM_WiFiController *v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  const char *v22;
  _BOOL8 v23;
  _BOOL8 v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  int v34;
  int v35;
  int v36;
  int v37;
  unsigned int v38;
  const char *v39;
  unsigned int v40;
  const char *v41;
  uint64_t v42;
  unsigned __int8 v43;
  __int128 v44;
  unint64_t v45;
  unint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  unint64_t v50;

  v43 = -[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState");
  *((_QWORD *)&v44 + 1) = -[WCM_BTController numSCODevice](-[WCM_PolicyManager btController](self, "btController"), "numSCODevice");
  *(_QWORD *)&v44 = -[WCM_BTController numeSCODevice](-[WCM_PolicyManager btController](self, "btController"), "numeSCODevice");
  v3 = -[WCM_BTController getNum2GHzAclA2DPDevices](-[WCM_PolicyManager btController](self, "btController"), "getNum2GHzAclA2DPDevices");
  v4 = -[WCM_BTController numHIDDevice](-[WCM_PolicyManager btController](self, "btController"), "numHIDDevice");
  v45 = -[WCM_BTController numLEDevice](-[WCM_PolicyManager btController](self, "btController"), "numLEDevice");
  v46 = -[WCM_BTController numLEADevice](-[WCM_PolicyManager btController](self, "btController"), "numLEADevice");
  v5 = -[WCM_BTController numLLADevice](-[WCM_PolicyManager btController](self, "btController"), "numLLADevice");
  -[WCM_BTController isBtAntennaDesensed](-[WCM_PolicyManager btController](self, "btController"), "isBtAntennaDesensed");
  -[WCM_WiFiController isSideCarInProgress](-[WCM_PolicyManager wifiController](self, "wifiController"), "isSideCarInProgress");
  -[WCM_WiFiController isEnsembleInProgress](-[WCM_PolicyManager wifiController](self, "wifiController"), "isEnsembleInProgress");
  -[WCM_WiFiController isAutoUnlockRangingInProgress](-[WCM_PolicyManager wifiController](self, "wifiController"), "isAutoUnlockRangingInProgress");
  v6 = -[WCM_WiFiController getPhyMode](-[WCM_PolicyManager wifiController](self, "wifiController"), "getPhyMode");
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("RCU2SupportIntegrated")))v7 = -[WCM_CtrXPCClient getRCU2Status](-[WCM_RCU2Controller threadClient](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "threadClient"), "getRCU2Status");
  else
    v7 = 0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("threadActive is %d"), v7);
  if (self->_forceRealTimeAWDL)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Forcing AWDL RTG Active due to defaults write"));
    -[WCM_BTController updateAWDLRTGActive:](-[WCM_PolicyManager btController](self, "btController"), "updateAWDLRTGActive:", 1);
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Handle WiFi/BT Coex change phyMode11ax: %d"), (_DWORD)v6 == 6);
  self->_coexProfile2GTDDReason = 0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Handle WiFi/BT Coex change %d"), self->_findMyPencilScanActive);
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiBtProfile"))&& -[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Handle WiFi/BT Coex change"));
    if (-[WCM_BTController powerState](-[WCM_PolicyManager btController](self, "btController"), "powerState")
      && (v44 != 0 || v3 || v4 || v45))
    {
      if (*((_QWORD *)&v44 + 1) || !(v4 | v45) || (_QWORD)v44 || v3 || v46)
      {
        if (v44 == 0 || v4 || v45)
        {
          v8 = -[WCM_PolicyManager wifiController](self, "wifiController");
          if (v3 != 1 || v4 || v45)
            v9 = 4;
          else
            v9 = 3;
        }
        else
        {
          v8 = -[WCM_PolicyManager wifiController](self, "wifiController");
          v9 = 2;
        }
      }
      else
      {
        v8 = -[WCM_PolicyManager wifiController](self, "wifiController");
        v9 = 1;
      }
    }
    else
    {
      v8 = -[WCM_PolicyManager wifiController](self, "wifiController");
      v9 = 0;
    }
    v10 = 0;
    goto LABEL_29;
  }
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiBt5GProfile"))&& -[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Handle WiFi/BT Coex change"));
    if (!-[WCM_BTController powerState](-[WCM_PolicyManager btController](self, "btController"), "powerState"))
      goto LABEL_27;
    if (!self->_pencilCoexActive && !v7 && !self->_findMyPencilScanActive)
    {
      if (-[WCM_BTController getAny2GHzBTDevicesConnected](-[WCM_PolicyManager btController](self, "btController"), "getAny2GHzBTDevicesConnected"))
      {
        if (!(v4 | v45)
          || -[WCM_BTController get2GHzSub15msAudioDevicesConnected](-[WCM_PolicyManager btController](self, "btController"), "get2GHzSub15msAudioDevicesConnected")|| v3|| v46)
        {
          if (!-[WCM_BTController get2GHzSub15msAudioDevicesConnected](-[WCM_PolicyManager btController](self, "btController"), "get2GHzSub15msAudioDevicesConnected")|| v4|| v45)
          {
            v8 = -[WCM_PolicyManager wifiController](self, "wifiController");
            if (v3 != 1 || v4 || v45)
              v9 = 4;
            else
              v9 = 3;
          }
          else
          {
            v8 = -[WCM_PolicyManager wifiController](self, "wifiController");
            v9 = 2;
          }
        }
        else
        {
          v8 = -[WCM_PolicyManager wifiController](self, "wifiController");
          v9 = 1;
        }
        goto LABEL_28;
      }
LABEL_27:
      v8 = -[WCM_PolicyManager wifiController](self, "wifiController");
      v9 = 0;
LABEL_28:
      v10 = 6;
LABEL_29:
      -[WCM_WiFiController updateWiFiBTCoexActiveProfileFor2G:and5G:](v8, "updateWiFiBTCoexActiveProfileFor2G:and5G:", v9, v10);
      goto LABEL_30;
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Setting TDD profile for 2.4GHz - pencilCoexActive || _findMyPencilScanActive || threadActive is (%d || %d || %d)"), self->_pencilCoexActive, self->_findMyPencilScanActive, v7);
    -[WCM_WiFiController updateWiFiBTCoexActiveProfileFor2G:and5G:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateWiFiBTCoexActiveProfileFor2G:and5G:", 4, 6);
    if (self->_pencilCoexActive)
    {
      v37 = 1;
    }
    else if (self->_findMyPencilScanActive)
    {
      v37 = 3;
    }
    else
    {
      v37 = 2;
    }
    self->_coexProfile2GTDDReason = v37;
  }
LABEL_30:
  if (-[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState"))
  {
    if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiBTeSCOLimitedAggregation")))
    {
      if (-[WCM_BTController get2GHzSub15msNonSCOConnected](-[WCM_PolicyManager btController](self, "btController"), "get2GHzSub15msNonSCOConnected"))
      {
        v11 = CFSTR("Sub15msBTAudio link active sending Wifi controller eSCO traffic status");
LABEL_58:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, v11);
        v16 = 1;
        goto LABEL_59;
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Sub15msBTAudio link not active sending Wifi controller eSCO traffic status"), v42);
LABEL_53:
      v16 = 0;
LABEL_59:
      byte_100271370 = v16;
      goto LABEL_60;
    }
    if (!objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiBTeSCOLimitedAggregation11ax"))|| !objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiBTLimitedAggregation")))
    {
      if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiBTeSCOLimitedAggregation11ax")))
      {
        v15 = -[WCM_BTController get2GHzSub15msNonSCOConnected](-[WCM_PolicyManager btController](self, "btController"), "get2GHzSub15msNonSCOConnected");
        if ((_DWORD)v6 == 6 && v15)
        {
          v11 = CFSTR("Handle WiFi/BT Coex 11ax AND Sub15msBTAudio active");
          goto LABEL_58;
        }
        v38 = -[WCM_BTController get2GHzSub15msNonSCOConnected](-[WCM_PolicyManager btController](self, "btController"), "get2GHzSub15msNonSCOConnected");
        v39 = "InActive";
        if (v38)
          v39 = "Active";
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Handle WiFi/BT Coex 11ax(%d) OR Sub15msBTAudio(%s) link not active"), (_DWORD)v6 == 6, v39);
      }
      else
      {
        if (!objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiBTLimitedAggregation")))goto LABEL_60;
        if (-[WCM_BTController get2GHzSub15msNonSCOConnected](-[WCM_PolicyManager btController](self, "btController"), "get2GHzSub15msNonSCOConnected")&& v4 >= 2)
        {
          v11 = CFSTR("Handle WiFi/BT Coex eSCOplus2HID true");
          goto LABEL_58;
        }
        v40 = -[WCM_BTController get2GHzSub15msNonSCOConnected](-[WCM_PolicyManager btController](self, "btController"), "get2GHzSub15msNonSCOConnected");
        v41 = "InActive";
        if (v40)
          v41 = "Active";
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Handle WiFi/BT Coex Sub15msBTAudio: %s, numHID: %lu"), v41, v4);
      }
      if (-[WCM_BTController get2GHzSub15msNonSCOConnected](-[WCM_PolicyManager btController](self, "btController"), "get2GHzSub15msNonSCOConnected"))
      {
        goto LABEL_60;
      }
      goto LABEL_53;
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Handle WiFi/BT Coex eSCOplus2HID state %d"), byte_100271371);
    if (-[WCM_BTController get2GHzSub15msNonSCOConnected](-[WCM_PolicyManager btController](self, "btController"), "get2GHzSub15msNonSCOConnected")&& v4 >= 2&& (byte_100271371 & 1) == 0)
    {
      byte_100271371 = 1;
      v12 = -[WCM_BTController get2GHzSub15msNonSCOConnected](-[WCM_PolicyManager btController](self, "btController"), "get2GHzSub15msNonSCOConnected");
      v13 = "InActive";
      if (v12)
        v13 = "Active";
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Handle WiFi/BT Coex Sub15msBTAudio: %s, numHID: %lu"), v13, v4);
      byte_100271370 = 1;
    }
    v14 = -[WCM_BTController get2GHzSub15msNonSCOConnected](-[WCM_PolicyManager btController](self, "btController"), "get2GHzSub15msNonSCOConnected");
    if ((_DWORD)v6 == 6 && v14 && (byte_100271371 & 1) == 0)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Handle WiFi/BT Coex 11ax AND eSCO link active"));
      byte_100271370 = 1;
    }
    if (!-[WCM_BTController get2GHzSub15msNonSCOConnected](-[WCM_PolicyManager btController](self, "btController"), "get2GHzSub15msNonSCOConnected"))
    {
      byte_100271371 = 0;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Handle WiFi/BT Coex Sub15msBTAudio: InActive, numHID: %lu"), v4);
      goto LABEL_53;
    }
  }
LABEL_60:
  v17 = byte_100271370;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Handle WiFi/BT Coex LA final enable(%d) useCase(%d)"), byte_100271370, byte_100271370);
  v18 = -[WCM_PolicyManager wifiController](self, "wifiController");
  -[WCM_WiFiController updateWiFiLimitedAggregationActiveStatus:andUseCase:](v18, "updateWiFiLimitedAggregationActiveStatus:andUseCase:", byte_100271370, v17);
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiBTA2DPIndication"))&& -[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState")&& byte_100271372 != (v3 != 0))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Handle WiFi/BT Coex send Wifi controller A2DP status to %d"), v3 != 0);
    -[WCM_WiFiController updateWiFiA2DPActiveStatus:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateWiFiA2DPActiveStatus:", v3 != 0);
    byte_100271372 = v3 != 0;
  }
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiBTA2DPLLAIndication"))&& -[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState")&& byte_100271373 != (v5 != 0))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Handle WiFi/BT Coex send Wifi controller LLA status to %d"), v5 != 0);
    -[WCM_WiFiController updateWiFiA2DPLLAActiveStatus:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateWiFiA2DPLLAActiveStatus:", v5 != 0);
    byte_100271373 = v5 != 0;
  }
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("LPSCOffload"))&& -[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState"))
  {
    v19 = -[WCM_BTController get2GHzSub15msAudioDevicesConnected](-[WCM_PolicyManager btController](self, "btController"), "get2GHzSub15msAudioDevicesConnected");
    if (v3)
      v20 = 1;
    else
      v20 = v19;
    if (v46)
      v21 = 1;
    else
      v21 = v20;
    v22 = "disable";
    if (!(_DWORD)v21)
      v22 = "enable";
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Handle WiFi/BT Coex change LPSC Beacon Offload %s, LPSC Scan Offload: %s"), v22, v22);
    -[WCM_WiFiController updateLPSCBeaconOffload:andScanOffload:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateLPSCBeaconOffload:andScanOffload:", v21, v21);
  }
  v23 = -[WCM_BTController get2GHzSub15msNonSCOConnected](-[WCM_PolicyManager btController](self, "btController"), "get2GHzSub15msNonSCOConnected");
  if (byte_100271374 != v23)
  {
    v24 = v23;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Handle WiFi/BT Coex change sending Wifi controller sub15msNonSCO traffic status to %d"), v23);
    -[WCM_WiFiController updateWiFieSCOActiveStatus:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateWiFieSCOActiveStatus:", v24);
    byte_100271374 = v24;
  }
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("RCU2Support")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("handleWiFiBTCoexChange updating 3way RC2 grant status for WiFi/BT"));
    -[WCM_PolicyManager updateBTRCU2TimingArray](self, "updateBTRCU2TimingArray");
    -[WCM_PolicyManager updateWiFiRCU2TimingArray](self, "updateWiFiRCU2TimingArray");
  }
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("RCU1Support")))-[WCM_PolicyManager handleWiFiRCU1Change](self, "handleWiFiRCU1Change");
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiAntennaFallback")))
  {
    v25 = -[WCM_WiFiController getNumberOfSpatialStreamOnAccessPoint](-[WCM_PolicyManager wifiController](self, "wifiController"), "getNumberOfSpatialStreamOnAccessPoint");
    if (-[WCM_WiFiController isAWDLInProgress](-[WCM_PolicyManager wifiController](self, "wifiController"), "isAWDLInProgress"))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Defer WiFi antenna fallback wifiAWDLInProgress(%d)"), 1);
      return;
    }
    if (-[WCM_BTController powerState](-[WCM_PolicyManager btController](self, "btController"), "powerState")
      && ((v6 & 0xFFFFFFFE) == 2 || v25 == 1))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("phyMode(%d) numNSSOnAP(%d)"), v6, v25);
      v26 = 1;
    }
    else
    {
      v26 = 0;
    }
    -[WCM_WiFiController disableAntennaSharedByBluetooth:andReassociate:](-[WCM_PolicyManager wifiController](self, "wifiController"), "disableAntennaSharedByBluetooth:andReassociate:", v26, 0);
  }
  v50 = 0;
  v48 = 0u;
  v49 = 0u;
  v47 = 0u;
  if (-[WCM_BTController powerState](-[WCM_PolicyManager btController](self, "btController"), "powerState"))
  {
    *(_QWORD *)&v47 = v3;
    *((_QWORD *)&v47 + 1) = v5;
    v27 = *((_QWORD *)&v44 + 1);
    *(_QWORD *)&v48 = v4;
    *((_QWORD *)&v48 + 1) = *((_QWORD *)&v44 + 1);
    v28 = v46;
    v29 = v45;
    v30 = v44;
    *(_QWORD *)&v49 = v44;
    *((_QWORD *)&v49 + 1) = v45;
    v31 = v4;
    v32 = v5;
    v33 = v3;
    v50 = v46;
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("updateBTConnectedDevices with btPower=off"));
    v28 = 0;
    v29 = 0;
    v30 = 0;
    v27 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
  }
  if (unk_100271378 != v33
    || xmmword_100271380 != __PAIR128__(v31, v32)
    || qword_100271390 != v27
    || unk_100271398 != v30
    || xmmword_1002713A0 != __PAIR128__(v28, v29))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("updateBTConnectedDevices with numA2DP=%lu, numLLA=%lu, numHID=%lu, numSCO=%lu, numeSCO=%lu, numLE=%lu, numLEA=%lu"), v3, v5, v4, *((_QWORD *)&v44 + 1), (_QWORD)v44, v45, v46);
    -[WCM_PolicyManager handleBTCoexConnectedDevicesEvent_numA2DP:numLLA:numHID:numSCO:numeSCO:numLE:numLEA:](self, "handleBTCoexConnectedDevicesEvent_numA2DP:numLLA:numHID:numSCO:numeSCO:numLE:numLEA:", v3, v5, v4, *((_QWORD *)&v44 + 1), (_QWORD)v44, v45, v46);
    objc_msgSend(+[WCM_UCMClientManager WCM_UCMClientManagerSingleton](WCM_UCMClientManager, "WCM_UCMClientManagerSingleton"), "updateBTConnectedDevices:", &v47);
    unk_100271378 = v47;
    *(__int128 *)((char *)&xmmword_100271380 + 8) = v48;
    unk_100271398 = v49;
    *((_QWORD *)&xmmword_1002713A0 + 1) = v50;
  }
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("RCU2SupportIntegrated")))-[WCM_CtrXPCClient updateWiFiBand:](-[WCM_RCU2Controller threadClient](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "threadClient"), "updateWiFiBand:", v43);
  if (_os_feature_enabled_impl("CoreWiFi", "Figaro5GTDD"))
  {
    if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiFigaroCoex")))
    {
      v34 = dword_1002713B0;
      if (v34 != -[WCM_WiFiController wifiChannel](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiChannel")|| (v35 = dword_1002713B4, v35 != -[WCM_WiFiController channelBandwidthMHz](-[WCM_PolicyManager wifiController](self, "wifiController"), "channelBandwidthMHz"))|| (v36 = dword_1002713B8, v36 != -[WCM_WiFiController channelCenterFreqMHz](-[WCM_PolicyManager wifiController](self, "wifiController"), "channelCenterFreqMHz")))
      {
        -[WCM_BTController updateWiFiChannelInfo:bandwidth:regBand:](-[WCM_PolicyManager btController](self, "btController"), "updateWiFiChannelInfo:bandwidth:regBand:", -[WCM_WiFiController wifiChannel](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiChannel"), -[WCM_WiFiController channelBandwidthMHz](-[WCM_PolicyManager wifiController](self, "wifiController"), "channelBandwidthMHz"), -[WCM_PolicyManager parseCenterFreqtoUNIIBand:](self, "parseCenterFreqtoUNIIBand:", -[WCM_WiFiController channelCenterFreqMHz](-[WCM_PolicyManager wifiController](self, "wifiController"), "channelCenterFreqMHz")));
        dword_1002713B0 = -[WCM_WiFiController wifiChannel](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiChannel");
        dword_1002713B4 = -[WCM_WiFiController channelBandwidthMHz](-[WCM_PolicyManager wifiController](self, "wifiController"), "channelBandwidthMHz");
        dword_1002713B8 = -[WCM_WiFiController channelCenterFreqMHz](-[WCM_PolicyManager wifiController](self, "wifiController"), "channelCenterFreqMHz");
      }
    }
  }
}

- (WCM_WiFiController)wifiController
{
  return self->_wifiController;
}

- (NSSet)activeCoexFeatures
{
  return self->_activeCoexFeatures;
}

- (WCM_BTController)btController
{
  return self->_btController;
}

- (WCM_RCU2Controller)rcu2Controller
{
  return self->_rcu2Controller;
}

- (void)updateGPSBandsInfo:(id)a3 CLUpdate:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  id v11;
  id v12;
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  _QWORD block[6];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v4 = a4;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("updateGPSBandsInfo - counts %d %d"), objc_msgSend(a3, "count"), -[NSMutableArray count](-[WCM_PolicyManager gpsBandInfoList](self, "gpsBandInfoList"), "count"));
  if (v4)
  {
    v7 = -[NSSet isEqualToSet:](+[NSSet setWithArray:](NSSet, "setWithArray:", a3), "isEqualToSet:", +[NSSet setWithArray:](NSSet, "setWithArray:", -[WCM_PolicyManager gpsBandInfoList](self, "gpsBandInfoList")));
    if (!v7)
    {
      -[NSMutableArray removeAllObjects](-[WCM_PolicyManager gpsBandInfoList](self, "gpsBandInfoList"), "removeAllObjects");
      -[WCM_PolicyManager setGpsBandInfoList:](self, "setGpsBandInfoList:", a3);
    }
    v8 = !v7;
  }
  else
  {
    v7 = 0;
    v8 = 1;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("updateGPSBandsInfo-2 CLUpdate %d updateDriver %d %d"), v4, v8, v7);
  v9 = -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("CTSacDriverNeedGpsFreq"));
  v10 = v8 ^ 1;
  if (((v8 ^ 1) & 1) == 0)
  {
    if (v9)
    {
      -[WCM_PolicyManager updateCTSacDriverRemoveAllFrequenciesFromClient:](self, "updateCTSacDriverRemoveAllFrequenciesFromClient:", 2);
      if (-[NSMutableArray count](-[WCM_PolicyManager gpsBandInfoList](self, "gpsBandInfoList"), "count"))
      {
        v11 = objc_alloc_init((Class)NSMutableArray);
        v12 = objc_alloc_init((Class)NSMutableArray);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v13 = -[WCM_PolicyManager gpsBandInfoList](self, "gpsBandInfoList");
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v25;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v25 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v17);
              v22 = 0u;
              v23 = 0u;
              objc_msgSend(v18, "getValue:", &v22);
              objc_msgSend(v11, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *((double *)&v22 + 1)));
              objc_msgSend(v12, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&v23));
              v17 = (char *)v17 + 1;
            }
            while (v15 != v17);
            v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          }
          while (v15);
        }
        if (objc_msgSend(v11, "count"))
          -[WCM_PolicyManager updateCTSacDriver:frequencyToAdd:frequencyToAddBw:frequencytoRemove:client:](self, "updateCTSacDriver:frequencyToAdd:frequencyToAddBw:frequencytoRemove:client:", 1, v11, v12, 0, 2);
        objc_msgSend(v11, "removeAllObjects");
        objc_msgSend(v12, "removeAllObjects");

      }
    }
  }
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("SacPolicySupport"))&& ((-[WCM_SacManager isTestMode](self->_sacManager, "isTestMode") | v10) & 1) == 0)
  {
    v19 = -[NSMutableArray copy](-[WCM_PolicyManager gpsBandInfoList](self, "gpsBandInfoList"), "copy");
    v20 = -[WCM_SacManager getQueue](self->_sacManager, "getQueue");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100010B6C;
    block[3] = &unk_100201B18;
    block[4] = self;
    block[5] = v19;
    dispatch_async(v20, block);

  }
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("AntennaTuningForGpsBB20")))
  {
    if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("EnhancedCoreLocationGnssBandUse")))
    {
      -[WCM_PolicyManager updateGpsbandsInfoForBBv2](self, "updateGpsbandsInfoForBBv2");
    }
    else
    {
      -[WCM_PolicyManager updateGpsbandsInfoForBB](self, "updateGpsbandsInfoForBB");
    }
  }
}

- (NSMutableArray)gpsBandInfoList
{
  return self->_gpsBandInfoList;
}

- (void)updateGpsbandsInfoForBB
{
  WCM_CellularController *v3;
  int v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  int v8;
  char v9;
  uint64_t v10;
  int v11;
  void *i;
  void *v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  unsigned int v19;
  char v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v3 = -[WCM_PolicyManager cellularController](self, "cellularController");
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("AntennaTuningForGpsBB20")))
  {
    LOBYTE(v4) = 4;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB20: updateGpsbandsInfoForBB: Count =  %d\n"), -[NSMutableArray count](-[WCM_PolicyManager gpsBandInfoList](self, "gpsBandInfoList"), "count"));
    if (-[NSMutableArray count](-[WCM_PolicyManager gpsBandInfoList](self, "gpsBandInfoList"), "count"))
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v5 = -[WCM_PolicyManager gpsBandInfoList](self, "gpsBandInfoList");
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v6)
      {
        v7 = v6;
        v8 = 0;
        v9 = 0;
        v21 = 0;
        v10 = *(_QWORD *)v25;
        v4 = 4;
        v11 = 4;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v25 != v10)
              objc_enumerationMutation(v5);
            v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
            v22 = 0u;
            v23 = 0u;
            objc_msgSend(v13, "getValue:", &v22);
            if ((_DWORD)v22 == 2)
            {
              v8 |= 2u;
              if (DWORD2(v23) == 512)
                v15 = 2;
              else
                v15 = v4;
              v21 = 1;
              if (DWORD2(v23) == 256)
                v4 = 1;
              else
                v4 = v15;
            }
            else if ((_DWORD)v22 == 1)
            {
              v8 |= 1u;
              if (DWORD2(v23) == 512)
                v14 = 2;
              else
                v14 = v11;
              if (DWORD2(v23) == 256)
                v11 = 1;
              else
                v11 = v14;
              v9 = 1;
            }
          }
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v7);
      }
      else
      {
        LOBYTE(v8) = 0;
        v9 = 0;
        v21 = 0;
        LOBYTE(v4) = 4;
        LOBYTE(v11) = 4;
      }
      v16 = v9 & 1;
      v17 = v21 & 1;
    }
    else
    {
      LOBYTE(v8) = 0;
      v16 = 0;
      v17 = 0;
      LOBYTE(v11) = 4;
    }
    v18 = -[WCM_BTController getNum2GHzAclA2DPDevices](-[WCM_PolicyManager btController](self, "btController"), "getNum2GHzAclA2DPDevices") != 0;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("BB20: updateGpsbandsInfoForBB: L1enabled = %d, L5Enabled = %d, btA2DPEnabled = %d, l5Level = %d, l1Level = %d\n"), v16, v17, v18, v4, v11);
    -[WCM_CellularController setGpsBandInfoToBB:l5Enabled:btA2DPEnabled:l5Level:](v3, "setGpsBandInfoToBB:l5Enabled:btA2DPEnabled:l5Level:", v16, v17, v18, v4);
    if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("CoexBBUnifiedSensorInfoSupport")))
    {
      v19 = -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("AntennaTunningForGpsL1Level"));
      v20 = 16 * v11;
      if (!v19)
        v20 = 0;
      -[WCM_CellularController sendBBCoexSensorMessage:band:usecase:](v3, "sendBBCoexSensorMessage:band:usecase:", 0, v8, v20 & 0xF0 | v4 & 0xFu);
    }
  }
}

- (void)setGpsBandInfoList:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 488);
}

- (WCM_CellularController)cellularController
{
  return self->_cellularController;
}

- (WCM_PlatformManager)platformManager
{
  return self->_platformManager;
}

- (unint64_t)wcmCellular_CC2_Tech
{
  return self->_wcmCellular_CC2_Tech;
}

- (unint64_t)wcmCellular_CC1_Tech
{
  return self->_wcmCellular_CC1_Tech;
}

- (BOOL)wcmCellularCCSetToBB
{
  return self->_wcmCellularCCSetToBB;
}

- (WCM_SacManager)sacManager
{
  return self->_sacManager;
}

+ (id)singleton
{
  _BYTE *v3;
  id v4;
  const __CFArray *v5;
  const __CFArray *v6;
  _BOOL4 v7;
  const char *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v10;
  id v11;
  id v12;
  uint64_t v13;
  objc_super v15;

  objc_sync_enter(a1);
  v3 = (_BYTE *)qword_100271368;
  if (!qword_100271368)
  {
    v15.receiver = a1;
    v15.super_class = (Class)&OBJC_METACLASS___WCM_PolicyManager;
    qword_100271368 = (uint64_t)objc_msgSend(objc_msgSendSuper2(&v15, "allocWithZone:", 0), "init");
    v4 = objc_msgSend(objc_msgSend((id)qword_100271368, "platformManager"), "wcmWiFiCellCoexIssueTable");
    if (v4)
    {
      v5 = (const __CFArray *)CLCopyTechnologiesInUse(v4);
      v6 = v5;
      if (v5)
      {
        v7 = sub_10000C6E4(v5);
        CFRelease(v6);
        v8 = "inactive";
        if (v7)
          v8 = "active";
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("activeTechs is null"));
        LOBYTE(v7) = 0;
        v8 = "inactive";
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("GPS is %s initially"), v8);
      *(_BYTE *)(qword_100271368 + 11) = v7;
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_10000A840, CLTechStatusChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    if ((objc_msgSend(objc_msgSend((id)qword_100271368, "activeCoexFeatures"), "containsObject:", CFSTR("CTSacDriverNeedGpsFreq")) & 1) != 0|| (objc_msgSend(objc_msgSend((id)qword_100271368, "activeCoexFeatures"), "containsObject:", CFSTR("AntennaTuningForGpsBB20")) & 1) != 0|| objc_msgSend(objc_msgSend((id)qword_100271368, "activeCoexFeatures"), "containsObject:", CFSTR("SacPolicySupport")))
    {
      v10 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v10, 0, (CFNotificationCallback)sub_100004FD4, CLGnssBandsChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("Sac driver: added notification gpsRadioActive %d"), *(unsigned __int8 *)(qword_100271368 + 11));
      sub_100009020();
    }
    v11 = objc_msgSend(objc_msgSend((id)qword_100271368, "activeCoexFeatures"), "containsObject:", CFSTR("EnableULCA"));
    objc_msgSend((id)qword_100271368, "setWcmCellularWCI2Mode_Ext_Enable:", v11);
    objc_msgSend((id)qword_100271368, "setWcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap:", 1);
    if (objc_msgSend(objc_msgSend((id)qword_100271368, "activeCoexFeatures"), "containsObject:", CFSTR("Bb20PolicyConversion")))
    {
      objc_msgSend((id)qword_100271368, "setWcmCellularCCSetToBB:", 0);
      objc_msgSend((id)qword_100271368, "setWcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap:", 0);
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("ULCA Init-0-ULCA critical bitmap %d"), objc_msgSend((id)qword_100271368, "wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap"));
    if (objc_msgSend(objc_msgSend((id)qword_100271368, "activeCoexFeatures"), "containsObject:", CFSTR("RCU2SupportIntegrated")))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("RCU2: Creating the controller"));
      objc_msgSend((id)qword_100271368, "setRcu2Controller:", objc_opt_new(WCM_RCU2ControllerIOS));
      objc_msgSend(objc_msgSend((id)qword_100271368, "rcu2Controller"), "initWithConnection:processId:", 0, 30);
      objc_msgSend((id)qword_100271368, "updateControllerSession:ofId:", objc_msgSend((id)qword_100271368, "rcu2Controller"), 30);
    }
    if (objc_msgSend(objc_msgSend((id)qword_100271368, "activeCoexFeatures"), "containsObject:", CFSTR("UseWCMAriDriver")))
    {
      v12 = +[WCM_AriCoexCommandDriver singleton](WCM_AriCoexCommandDriver, "singleton");
      if (v12)
      {
        if ((objc_msgSend(objc_msgSend((id)qword_100271368, "activeCoexFeatures"), "containsObject:", CFSTR("AriInterfaceVer1")) & 1) != 0)
        {
          v13 = 1;
        }
        else
        {
          if (!objc_msgSend(objc_msgSend((id)qword_100271368, "activeCoexFeatures"), "containsObject:", CFSTR("AriInterfaceVer2")))
          {
LABEL_26:
            objc_msgSend(v12, "connectBaseband");
            goto LABEL_27;
          }
          v13 = 2;
        }
        objc_msgSend(v12, "createCommandHandlerForAriVersion:", v13);
        goto LABEL_26;
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Failed to create ARI driver!"));
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("ARI driver is not created as feature is not enabled"));
    }
LABEL_27:
    objc_msgSend((id)qword_100271368, "startHomeKitTimer");
    v3 = (_BYTE *)qword_100271368;
  }
  v3[30] = 0;
  objc_sync_exit(a1);
  return v3;
}

- (void)handleSessionNotification:(unint64_t)a3
{
  if ((uint64_t)a3 > 999)
  {
    if ((uint64_t)a3 > 1900)
    {
      if ((uint64_t)a3 > 2702)
      {
        switch(a3)
        {
          case 0xA8FuLL:
            -[WCM_PolicyManager handleWiFiNANChange](self, "handleWiFiNANChange");
            break;
          case 0xAF0uLL:
            -[WCM_PolicyManager handleCameraStateIndication](self, "handleCameraStateIndication");
            break;
          case 0xAF1uLL:
            -[WCM_PolicyManager handlePencilStateIndication](self, "handlePencilStateIndication");
            break;
        }
      }
      else
      {
        switch(a3)
        {
          case 0x76DuLL:
            -[WCM_PolicyManager handleWiFiBTAirplayChange](self, "handleWiFiBTAirplayChange");
            break;
          case 0x898uLL:
            -[WCM_PolicyManager handleWiFiBTCatsChange:](self, "handleWiFiBTCatsChange:", 0);
            break;
          case 0xA8EuLL:
            -[WCM_PolicyManager handleWiFiAWDLChange](self, "handleWiFiAWDLChange");
            break;
        }
      }
    }
    else if ((uint64_t)a3 > 1299)
    {
      switch(a3)
      {
        case 0x514uLL:
          -[WCM_PolicyManager handleWiFiBTULOFDMAChange](self, "handleWiFiBTULOFDMAChange");
          break;
        case 0x57CuLL:
          -[WCM_PolicyManager handleWiFiRCU2Change](self, "handleWiFiRCU2Change");
          break;
        case 0x708uLL:
          -[WCM_PolicyManager handleCCConnectionUpdate](self, "handleCCConnectionUpdate");
          break;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x3E8uLL:
          -[WCM_PolicyManager handleWiFiBTCoexChange](self, "handleWiFiBTCoexChange");
          break;
        case 0x44CuLL:
          -[WCM_PolicyManager handleWiFiRCU1Change](self, "handleWiFiRCU1Change");
          break;
        case 0x4B0uLL:
          -[WCM_PolicyManager handleMedtronicConnection](self, "handleMedtronicConnection");
          break;
      }
    }
  }
  else if ((uint64_t)a3 > 299)
  {
    if ((uint64_t)a3 > 505)
    {
      switch(a3)
      {
        case 0x1FAuLL:
          -[WCM_PolicyManager handleBTPowerStateChange](self, "handleBTPowerStateChange");
          break;
        case 0x202uLL:
          -[WCM_PolicyManager handleBTScanConfigChange](self, "handleBTScanConfigChange");
          break;
        case 0x206uLL:
          -[WCM_PolicyManager handleBTLeDiscoveryScanStateChange](self, "handleBTLeDiscoveryScanStateChange");
          break;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x12CuLL:
          -[WCM_PolicyManager handleCellularNetworkUpdate](self, "handleCellularNetworkUpdate");
          break;
        case 0x1F4uLL:
          -[WCM_PolicyManager handleBTConnectionChange](self, "handleBTConnectionChange");
          break;
        case 0x1F5uLL:
LABEL_15:
          -[WCM_PolicyManager handleFTCall](self, "handleFTCall");
          break;
      }
    }
  }
  else
  {
    switch(a3)
    {
      case 'd':
        -[WCM_PolicyManager handleWiFiConfigChange](self, "handleWiFiConfigChange");
        break;
      case 'e':
      case 'f':
      case 'j':
      case 'k':
        return;
      case 'g':
        -[WCM_PolicyManager handleWiFiPowerStateChange](self, "handleWiFiPowerStateChange");
        break;
      case 'h':
        -[WCM_PolicyManager handleRCU2ContentionChange](self, "handleRCU2ContentionChange");
        break;
      case 'i':
        -[WCM_PolicyManager handleCallLQMStateChange](self, "handleCallLQMStateChange");
        break;
      case 'l':
        -[WCM_PolicyManager handleBTLeConn](self, "handleBTLeConn");
        break;
      default:
        if (a3 == 200)
          goto LABEL_15;
        break;
    }
  }
}

- (void)updateGPSRadioActiveState:(BOOL)a3
{
  _BOOL8 v3;
  const char *v5;
  _QWORD block[5];

  v3 = a3;
  if (-[WCM_PolicyManager gpsRadioActive](self, "gpsRadioActive") != a3)
  {
    v5 = "inactive";
    if (v3)
      v5 = "active";
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("GPS is %s now"), v5);
    -[WCM_PolicyManager setGpsRadioActive:](self, "setGpsRadioActive:", v3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007FD0;
    block[3] = &unk_1002019E8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getQueue"), block);
  }
}

- (BOOL)gpsRadioActive
{
  return self->_gpsRadioActive;
}

- (unint64_t)wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap
{
  return self->_wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap;
}

- (void)updateCellTxPowerLimit
{
  WCM_PlatformManager *v3;
  WCM_CellularController *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  unsigned int v32;
  WCM_WiFiCellCoexIssueBandTable *v33;
  uint64_t v34;
  id v35;
  void *v36;
  double v37;
  __int16 v38;

  v3 = -[WCM_PolicyManager platformManager](self, "platformManager");
  v4 = -[WCM_PolicyManager cellularController](self, "cellularController");
  LODWORD(v5) = -[NSNumber intValue](-[WCM_PlatformManager wcmCellularWCI2ModeLTEMaxTxPowerHigh](v3, "wcmCellularWCI2ModeLTEMaxTxPowerHigh"), "intValue");
  if (!-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v3, "wcmWiFiCellCoexIssueTable"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Platform doesn't have wcmWiFiCellCoexIssueTable initialized"));
    return;
  }
  v5 = (id)(int)v5;
  if (-[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState") < 2)goto LABEL_24;
  -[WCM_CellularController dlCenterFreq](v4, "dlCenterFreq");
  if (v6 == 0.0)
    goto LABEL_24;
  -[WCM_CellularController dlBandwidth](v4, "dlBandwidth");
  if (v7 == 0.0)
    goto LABEL_24;
  -[WCM_CellularController ulCenterFreq](v4, "ulCenterFreq");
  if (v8 != 0.0)
  {
    -[WCM_CellularController ulBandwidth](v4, "ulBandwidth");
    if (v9 != 0.0)
    {
      v10 = (id)-[WCM_CellularController bandInfoType](v4, "bandInfoType");
      -[WCM_CellularController dlCenterFreq](v4, "dlCenterFreq");
      v37 = v11;
      -[WCM_CellularController dlBandwidth](v4, "dlBandwidth");
      v13 = v12 * 0.5;
      -[WCM_CellularController dlCenterFreq](v4, "dlCenterFreq");
      v15 = v14;
      -[WCM_CellularController dlBandwidth](v4, "dlBandwidth");
      v17 = v16 * 0.5;
      -[WCM_CellularController ulCenterFreq](v4, "ulCenterFreq");
      v19 = v18;
      -[WCM_CellularController ulBandwidth](v4, "ulBandwidth");
      v21 = v20;
      -[WCM_CellularController ulCenterFreq](v4, "ulCenterFreq");
      v23 = v22;
      -[WCM_CellularController ulBandwidth](v4, "ulBandwidth");
      v25 = v24;
      if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("EnableULCA")))
      {
        v26 = v19 - v21 * 0.5;
        v27 = v23 + v25 * 0.5;
      }
      else
      {
        -[WCM_CellularController getCombinedUplinkFreqRange](v4, "getCombinedUplinkFreqRange");
        v26 = v28;
        v27 = v28 + v29;
      }
      v30 = v37 - v13;
      v31 = v15 + v17;
      v38 = 0;
      v32 = -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport"));
      v33 = -[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v3, "wcmWiFiCellCoexIssueTable");
      v34 = -[WCM_WiFiController wifiChannel](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiChannel");
      if (v32)
        v35 = -[WCM_WiFiCellCoexIssueBandTable findWiFiAntennaOrCellTxPowerConstraintWiFiEnhCoexIssueByCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:wifiCenterFreq:wifiBandwidth:gpsRadioActive:wifiAntennaConstraint:cellTxPowerConstraint:](v33, "findWiFiAntennaOrCellTxPowerConstraintWiFiEnhCoexIssueByCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:wifiCenterFreq:wifiBandwidth:gpsRadioActive:wifiAntennaConstraint:cellTxPowerConstraint:", v10, v34, -[WCM_WiFiController channelCenterFreqMHz](-[WCM_PolicyManager wifiController](self, "wifiController"), "channelCenterFreqMHz"), -[WCM_WiFiController channelBandwidthMHz](-[WCM_PolicyManager wifiController](self, "wifiController"), "channelBandwidthMHz"), -[WCM_PolicyManager gpsRadioActive](self, "gpsRadioActive"), (char *)&v38 + 1, v30, v31, v26, v27, &v38);
      else
        v35 = -[WCM_WiFiCellCoexIssueBandTable findWiFiAntennaOrCellTxPowerConstraintCoexIssueByCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:gpsRadioActive:wifiAntennaConstraint:cellTxPowerConstraint:](v33, "findWiFiAntennaOrCellTxPowerConstraintCoexIssueByCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:gpsRadioActive:wifiAntennaConstraint:cellTxPowerConstraint:", v10, v34, -[WCM_PolicyManager gpsRadioActive](self, "gpsRadioActive"), (char *)&v38 + 1, &v38, v30, v31, v26, v27);
      v36 = v35;
      if (v35 && (_BYTE)v38)
      {
        if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("CellularPowerLimiting"))&& -[WCM_WiFiController wifiChannel](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiChannel") == 13&& !-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport")))
        {
          v5 = objc_msgSend(v36, "cellTxPowerLimit");
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("on channel 13 apply Cell Tx power limit to %lld dBm"), v5);
        }
        else if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("CellularPowerLimiting")))
        {
          if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport")))
          {
            v5 = objc_msgSend(v36, "cellTxPowerLimit");
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WiFiEnh_: Apply Cell Tx power limit to %lld dBm"), v5);
          }
        }
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("apply Cell Tx power limit to %lld dBm"), v5);
      }
LABEL_24:
      -[WCM_CellularController updateControllerTxPower:](v4, "updateControllerTxPower:", v5);
    }
  }
}

- (void)setGpsRadioActive:(BOOL)a3
{
  self->_gpsRadioActive = a3;
}

- (void)getUpdatedWifiAntennaSelectionEnhConfigsWithbmWifiEnhAntTx000:(unsigned __int16 *)a3 bmWiFiEnhAntTx001:(unsigned __int16 *)a4 bmWiFiEnhAntTx010:(unsigned __int16 *)a5 bmWiFiEnhAntTx011:(unsigned __int16 *)a6 bmWiFiEnhAntTx100:(unsigned __int16 *)a7 bmWiFiEnhAntTx101:(unsigned __int16 *)a8 bmWiFiEnhAntTx110:(unsigned __int16 *)a9 bmWiFiEnhAntTx111:(unsigned __int16 *)a10 bmWiFiBand:(unsigned __int16 *)a11
{
  WCM_PlatformManager *v17;
  WCM_CellularController *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id v41;
  void *v42;
  const __CFString *v43;
  unsigned __int16 v44;
  const char *v45;
  unsigned int v46;
  unsigned int v47;
  _WORD v49[5];

  v17 = -[WCM_PolicyManager platformManager](self, "platformManager");
  v18 = -[WCM_PolicyManager cellularController](self, "cellularController");
  if (-[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState") < 2)goto LABEL_48;
  -[WCM_CellularController dlCenterFreq](v18, "dlCenterFreq");
  if (v19 == 0.0)
    goto LABEL_48;
  -[WCM_CellularController dlBandwidth](v18, "dlBandwidth");
  if (v20 == 0.0)
    goto LABEL_48;
  -[WCM_CellularController ulCenterFreq](v18, "ulCenterFreq");
  if (v21 == 0.0)
    return;
  -[WCM_CellularController ulBandwidth](v18, "ulBandwidth");
  if (v22 == 0.0)
    return;
  v47 = -[WCM_CellularController bandInfoType](v18, "bandInfoType");
  -[WCM_CellularController dlCenterFreq](v18, "dlCenterFreq");
  v24 = v23;
  -[WCM_CellularController dlBandwidth](v18, "dlBandwidth");
  v26 = v24 - v25 * 0.5;
  -[WCM_CellularController dlCenterFreq](v18, "dlCenterFreq");
  v28 = v27;
  -[WCM_CellularController dlBandwidth](v18, "dlBandwidth");
  v30 = v28 + v29 * 0.5;
  -[WCM_CellularController ulCenterFreq](v18, "ulCenterFreq");
  v32 = v31;
  -[WCM_CellularController ulBandwidth](v18, "ulBandwidth");
  v34 = v32 - v33 * 0.5;
  -[WCM_CellularController ulCenterFreq](v18, "ulCenterFreq");
  v36 = v35;
  -[WCM_CellularController ulBandwidth](v18, "ulBandwidth");
  v38 = v36 + v37 * 0.5;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("YYDebug_ configure wifi antenna selection with ul freq = (%f, %f) and dl freq = (%f, %f) "), *(_QWORD *)&v34, *(_QWORD *)&v38, *(_QWORD *)&v26, *(_QWORD *)&v30);
  if (!-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("EnableULCA")))
  {
    -[WCM_CellularController getCombinedUplinkFreqRange](v18, "getCombinedUplinkFreqRange");
    v34 = v39;
    v38 = v39 + v40;
  }
  v49[0] = 0;
  if (!-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport")))
  {
    v43 = CFSTR("YYDebug_ updating wifi antenna selection for Enh without WiFiEnhCoexSupport");
LABEL_47:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, v43);
    goto LABEL_48;
  }
  v41 = -[WCM_WiFiCellCoexIssueBandTable findWiFiAntennaOrCellTxPowerConstraintWiFiEnhCoexIssueByCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:wifiCenterFreq:wifiBandwidth:gpsRadioActive:wifiAntennaConstraint:cellTxPowerConstraint:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v17, "wcmWiFiCellCoexIssueTable"), "findWiFiAntennaOrCellTxPowerConstraintWiFiEnhCoexIssueByCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:wifiCenterFreq:wifiBandwidth:gpsRadioActive:wifiAntennaConstraint:cellTxPowerConstraint:", v47, -[WCM_WiFiController wifiChannel](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiChannel"), -[WCM_WiFiController channelCenterFreqMHz](-[WCM_PolicyManager wifiController](self, "wifiController"), "channelCenterFreqMHz"), -[WCM_WiFiController channelBandwidthMHz](-[WCM_PolicyManager wifiController](self, "wifiController"), "channelBandwidthMHz"), -[WCM_PolicyManager gpsRadioActive](self, "gpsRadioActive"), (char *)v49 + 1, v26, v30, v34, v38, v49);
  if (!v41 || !HIBYTE(v49[0]))
    goto LABEL_48;
  v42 = v41;
  if (!-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("AntennaSelectionV2Coex"))|| !-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport")))
  {
    v43 = CFSTR("YYDebug_ unhandled antenna selection case in Enh antenna selection");
    goto LABEL_47;
  }
  if (objc_msgSend(v42, "wifiUlAntennaBitmapOnCellAntBitmap000"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFiEnh_: apply WiFi UL antenna constraint for Cellular Antenna Bitmap 000"));
    *a3 |= (unsigned __int16)((unsigned __int16)objc_msgSend(v42, "wifiUlAntennaBitmapOnCellAntBitmap000") << 6) | 0x800;
  }
  if (objc_msgSend(v42, "wifiUlAntennaBitmapOnCellAntBitmap001"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFiEnh_: apply WiFi UL antenna constraint for Cellular Antenna bitmap 001"));
    *a4 |= (unsigned __int16)((unsigned __int16)objc_msgSend(v42, "wifiUlAntennaBitmapOnCellAntBitmap001") << 6) | 0x800;
  }
  if (objc_msgSend(v42, "wifiUlAntennaBitmapOnCellAntBitmap010"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFiEnh_: apply WiFi UL antenna constraint for Cellular Antenna bitmap 010"));
    *a5 |= (unsigned __int16)((unsigned __int16)objc_msgSend(v42, "wifiUlAntennaBitmapOnCellAntBitmap010") << 6) | 0x800;
  }
  if (objc_msgSend(v42, "wifiUlAntennaBitmapOnCellAntBitmap011"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFiEnh_: apply WiFi UL antenna constraint for Cellular Antenna bitmap 011"));
    *a6 |= (unsigned __int16)((unsigned __int16)objc_msgSend(v42, "wifiUlAntennaBitmapOnCellAntBitmap011") << 6) | 0x800;
  }
  if (objc_msgSend(v42, "wifiUlAntennaBitmapOnCellAntBitmap100"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFiEnh_: apply WiFi UL antenna constraint for Cellular Antenna bitmap 100"));
    *a7 |= (unsigned __int16)((unsigned __int16)objc_msgSend(v42, "wifiUlAntennaBitmapOnCellAntBitmap100") << 6) | 0x800;
  }
  if (objc_msgSend(v42, "wifiUlAntennaBitmapOnCellAntBitmap101"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFiEnh_: apply WiFi UL antenna constraint for Cellular Antenna bitmap 101"));
    *a8 |= (unsigned __int16)((unsigned __int16)objc_msgSend(v42, "wifiUlAntennaBitmapOnCellAntBitmap101") << 6) | 0x800;
  }
  if (objc_msgSend(v42, "wifiUlAntennaBitmapOnCellAntBitmap110"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFiEnh_: apply WiFi UL antenna constraint for Cellular Antenna bitmap 110"));
    *a9 |= (unsigned __int16)((unsigned __int16)objc_msgSend(v42, "wifiUlAntennaBitmapOnCellAntBitmap110") << 6) | 0x800;
  }
  if (objc_msgSend(v42, "wifiUlAntennaBitmapOnCellAntBitmap111"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFiEnh_: apply WiFi UL antenna constraint for Cellular Antenna bitmap 111"));
    *a10 |= (unsigned __int16)((unsigned __int16)objc_msgSend(v42, "wifiUlAntennaBitmapOnCellAntBitmap111") << 6) | 0x800;
  }
  if (objc_msgSend(v42, "wifiDlAntennaBitmapOnCellAntBitmap000"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFiEnh_: apply WiFi DL antenna constraint for Cellular Antenna Bitmap 000"));
    *a3 |= (unsigned __int16)objc_msgSend(v42, "wifiDlAntennaBitmapOnCellAntBitmap000") | 0x20;
  }
  if (objc_msgSend(v42, "wifiDlAntennaBitmapOnCellAntBitmap001"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFiEnh_: apply WiFi DL antenna constraint for Cellular Antenna bitmap 001"));
    *a4 |= (unsigned __int16)objc_msgSend(v42, "wifiDlAntennaBitmapOnCellAntBitmap001") | 0x20;
  }
  if (objc_msgSend(v42, "wifiDlAntennaBitmapOnCellAntBitmap010"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFiEnh_: apply WiFi DL antenna constraint for Cellular Antenna bitmap 010"));
    *a5 |= (unsigned __int16)objc_msgSend(v42, "wifiDlAntennaBitmapOnCellAntBitmap010") | 0x20;
  }
  if (objc_msgSend(v42, "wifiDlAntennaBitmapOnCellAntBitmap011"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFiEnh_: apply WiFi DL antenna constraint for Cellular Antenna bitmap 011"));
    *a6 |= (unsigned __int16)objc_msgSend(v42, "wifiDlAntennaBitmapOnCellAntBitmap011") | 0x20;
  }
  if (objc_msgSend(v42, "wifiDlAntennaBitmapOnCellAntBitmap100"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFiEnh_: apply WiFi DL antenna constraint for Cellular Antenna bitmap 100"));
    *a7 |= (unsigned __int16)objc_msgSend(v42, "wifiDlAntennaBitmapOnCellAntBitmap100") | 0x20;
  }
  if (objc_msgSend(v42, "wifiDlAntennaBitmapOnCellAntBitmap101"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFiEnh_: apply WiFi DL antenna constraint for Cellular Antenna bitmap 101"));
    *a8 |= (unsigned __int16)objc_msgSend(v42, "wifiDlAntennaBitmapOnCellAntBitmap101") | 0x20;
  }
  if (objc_msgSend(v42, "wifiDlAntennaBitmapOnCellAntBitmap110"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFiEnh_: apply WiFi DL antenna constraint for Cellular Antenna bitmap 110"));
    *a9 |= (unsigned __int16)objc_msgSend(v42, "wifiDlAntennaBitmapOnCellAntBitmap110") | 0x20;
  }
  if (objc_msgSend(v42, "wifiDlAntennaBitmapOnCellAntBitmap111"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WiFiEnh_: apply WiFi DL antenna constraint for Cellular Antenna bitmap 111"));
    *a10 |= (unsigned __int16)objc_msgSend(v42, "wifiDlAntennaBitmapOnCellAntBitmap111") | 0x20;
  }
LABEL_48:
  *a11 = 0;
  if (-[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState") == 2)
  {
    v44 = 1;
LABEL_54:
    *a11 = v44;
    goto LABEL_55;
  }
  if (-[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState") == 3)
  {
    v44 = 2;
    goto LABEL_54;
  }
  if (-[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState") == 4)
  {
    v44 = 3;
    goto LABEL_54;
  }
LABEL_55:
  if (-[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState"))
  {
    if (-[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState") == 1)
    {
      v45 = "ENABLED";
    }
    else if (-[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState") == 2)
    {
      v45 = "ASSOCIATED_2G";
    }
    else if (-[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState") == 3)
    {
      v45 = "ASSOCIATED_5G";
    }
    else
    {
      v46 = -[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState");
      v45 = "INVALID_STATE!!!";
      if (v46 == 4)
        v45 = "ASSOCIATED_6G";
    }
  }
  else
  {
    v45 = "DISABLED";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("WiFiEnh_: with WiFi State (%s), calculated bmWiFiBand %d bitmaps 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x"), v45, *a11, *a3, *a4, *a5, *a6, *a7, *a8, *a9, *a10);
}

- (BOOL)coexSupported
{
  return self->_coexSupported;
}

- (unint64_t)cellularWCI2CoexPolicyBitmap
{
  return self->_cellularWCI2CoexPolicyBitmap;
}

- (NSData)btPreferredChannelMapOnGpsRadioActive
{
  return self->_btPreferredChannelMapOnGpsRadioActive;
}

- (NSData)btPreferredChannelMapHPCellularActive
{
  return self->_btPreferredChannelMapHPCellularActive;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return objc_msgSend(a1, "singleton", a3);
}

- (WCM_PolicyManager)init
{
  unsigned __int8 *v2;
  void *v3;
  NSSet *v4;
  id v5;
  unsigned int v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  NSMutableArray *v13;
  NSMutableArray *v14;
  NSMutableArray *v15;
  NSMutableArray *v16;
  NSMutableArray *v17;
  NSMutableArray *v18;
  NSMutableArray *v19;
  NSMutableArray *v20;
  NSMutableArray *v21;
  NSMutableArray *v22;
  NSMutableArray *v23;
  NSMutableArray *v24;
  NSMutableArray *v25;
  NSMutableArray *v26;
  NSMutableArray *v27;
  NSMutableArray *v28;
  NSMutableArray *v29;
  NSMutableArray *v30;
  NSMutableArray *v31;
  NSMutableArray *v32;
  NSMutableArray *v33;
  NSMutableArray *v34;
  unsigned int v35;
  id v36;
  WCM_CellularRc1PolicyManager *v37;
  id v38;
  void *v39;
  WCM_MavAntennaPolicy *v40;
  WCM_IOKitWrapper *v41;
  unsigned int v42;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)WCM_PolicyManager;
  v2 = -[WCM_PolicyManager init](&v44, "init");
  if (!v2)
  {
LABEL_36:
    objc_msgSend(v2, "setWifiAntselPolicyStatsArray:", objc_alloc_init((Class)NSMutableArray));
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(v2, "setPreviousStartTime:");
    objc_msgSend(v2, "setLockObjectWifiAntselPolicyStats:", objc_alloc_init((Class)NSObject));
    objc_msgSend(v2, "setPrevNR7xRFEnabled:", 0);
    objc_msgSend(v2, "setPrevNR41RFEnabled:", 0);
    objc_msgSend(v2, "setPrevULFrequencyUpdate:", objc_alloc_init((Class)NSMutableDictionary));
    return (WCM_PolicyManager *)v2;
  }
  *((_QWORD *)v2 + 9) = objc_alloc_init(WCM_PlatformManager);
  *((_QWORD *)v2 + 22) = +[WCM_BSPMonitor create](WCM_BSPMonitor, "create");
  *((_QWORD *)v2 + 11) = objc_alloc_init(WCM_HPCellularStateMonitor);
  v3 = (void *)*((_QWORD *)v2 + 9);
  if (v3 && *((_QWORD *)v2 + 22))
  {
    v2[9] = objc_msgSend(v3, "coexSupported");
    v2[10] = objc_msgSend(*((id *)v2 + 9), "iRATSupported");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCM_PolicyManager: platformId %d coexSupported %d iRATSupported %d"), objc_msgSend(*((id *)v2 + 9), "wrmPlatformId"), v2[9], v2[10]);
    v2[8] = 0;
    v4 = +[NSSet setWithSet:](NSSet, "setWithSet:", objc_msgSend(*((id *)v2 + 9), "wcmCoexFeatures"));
    *((_QWORD *)v2 + 25) = v4;
    if (-[NSSet containsObject:](v4, "containsObject:", CFSTR("WCI2Mode")))
      v5 = objc_msgSend(objc_msgSend(*((id *)v2 + 9), "wcmCellularWCI2ModePolicy"), "unsignedLongValue");
    else
      v5 = 0;
    *((_QWORD *)v2 + 26) = v5;
    v6 = objc_msgSend(*((id *)v2 + 25), "containsObject:", CFSTR("BTDiversityAFHMap"));
    v7 = objc_msgSend(*((id *)v2 + 9), "wcmBTAFHMapDefault");
    if (v6)
    {
      *((_QWORD *)v2 + 32) = v7;
      *((_QWORD *)v2 + 33) = objc_msgSend(*((id *)v2 + 9), "wcmBTAFHMapDefault");
      *((_QWORD *)v2 + 34) = objc_msgSend(*((id *)v2 + 9), "wcmBTAFHMapDefault");
      *((_QWORD *)v2 + 35) = objc_msgSend(*((id *)v2 + 9), "wcmBTAFHMapDefault");
      *((_QWORD *)v2 + 36) = objc_msgSend(*((id *)v2 + 9), "wcmBTAFHMapDefault");
      *((_QWORD *)v2 + 37) = objc_msgSend(*((id *)v2 + 9), "wcmBTAFHMapDefault");
      *((_QWORD *)v2 + 38) = objc_msgSend(*((id *)v2 + 9), "wcmBTAFHMapDefault");
      v8 = objc_msgSend(*((id *)v2 + 9), "wcmBTAFHMapDefault");
      v9 = 312;
    }
    else
    {
      *((_QWORD *)v2 + 27) = v7;
      *((_QWORD *)v2 + 28) = objc_msgSend(*((id *)v2 + 9), "wcmBTAFHMapDefault");
      v8 = objc_msgSend(*((id *)v2 + 9), "wcmHPCellularBTAFHMapFixed");
      v9 = 232;
    }
    *(_QWORD *)&v2[v9] = v8;
    if (_os_feature_enabled_impl("wirelessradiomanager", "HFBTEnhancement")
      && objc_msgSend(objc_msgSend(v2, "activeCoexFeatures"), "containsObject:", CFSTR("HFBTCoex")))
    {
      *((_QWORD *)v2 + 30) = objc_msgSend(*((id *)v2 + 9), "wcmHFBTChannelMapDefault");
      *((_QWORD *)v2 + 40) = (int)objc_msgSend(objc_msgSend(*((id *)v2 + 9), "wcmBTAntBlockDuration"), "intValue");
      *((_QWORD *)v2 + 31) = objc_msgSend(*((id *)v2 + 9), "wcmBTAntBlockEnableBandsDefault");
    }
    if (!objc_msgSend(*((id *)v2 + 25), "containsObject:", CFSTR("MedtronicSupport"))
      || (v10 = +[WCM_ExternalAccessory create](WCM_ExternalAccessory, "create"),
          (*((_QWORD *)v2 + 21) = v10) != 0))
    {
      *((_DWORD *)v2 + 10) = objc_msgSend(objc_msgSend(*((id *)v2 + 9), "wcmBTPreferredRole"), "intValue");
      *((_QWORD *)v2 + 41) = &off_100241EE0;
      *((_QWORD *)v2 + 42) = &off_100241EF8;
      v11 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", &off_100241F10);
      *((_QWORD *)v2 + 43) = v11;
      v12 = v11;
      v13 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", &off_100241F28);
      *((_QWORD *)v2 + 44) = v13;
      v14 = v13;
      v15 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", &off_100241F40);
      *((_QWORD *)v2 + 45) = v15;
      v16 = v15;
      v17 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", &off_100241F58);
      *((_QWORD *)v2 + 46) = v17;
      v18 = v17;
      v19 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", &off_100241F70);
      *((_QWORD *)v2 + 48) = v19;
      v20 = v19;
      v21 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", &off_100241F88);
      *((_QWORD *)v2 + 49) = v21;
      v22 = v21;
      v23 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", &off_100241FA0);
      *((_QWORD *)v2 + 50) = v23;
      v24 = v23;
      v25 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", &off_100241FB8);
      *((_QWORD *)v2 + 47) = v25;
      v26 = v25;
      *((_QWORD *)v2 + 61) = objc_alloc_init((Class)NSMutableArray);
      *((_QWORD *)v2 + 53) = &off_100241FD0;
      v27 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", &off_100241FE8);
      *((_QWORD *)v2 + 54) = v27;
      v28 = v27;
      v29 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", &off_100242000);
      *((_QWORD *)v2 + 55) = v29;
      v30 = v29;
      v31 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", &off_100242018);
      *((_QWORD *)v2 + 51) = v31;
      v32 = v31;
      v33 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", &off_100242030);
      *((_QWORD *)v2 + 52) = v33;
      v34 = v33;
      *((_QWORD *)v2 + 56) = &off_1002308A0;
      *((_QWORD *)v2 + 67) = &off_1002308A0;
      *((_QWORD *)v2 + 68) = &off_1002308A0;
      *((_WORD *)v2 + 17) = 0;
      *((_QWORD *)v2 + 69) = 0;
      *((_QWORD *)v2 + 7) = 0;
      *(_WORD *)(v2 + 13) = 25600;
      v2[16] = 0;
      *((_WORD *)v2 + 10) = 0;
      *((_WORD *)v2 + 14) = 0;
      *((_QWORD *)v2 + 24) = 0;
      *((_WORD *)v2 + 12) = 0;
      *((_DWORD *)v2 + 11) = 0;
      v2[26] = 0;
      *((_DWORD *)v2 + 13) = 0;
      *((_OWORD *)v2 + 31) = 0u;
      *((_OWORD *)v2 + 32) = 0u;
      v35 = objc_msgSend(*((id *)v2 + 25), "containsObject:", CFSTR("CellularRC1PolicyManager"));
      v36 = objc_msgSend(*((id *)v2 + 9), "wrmPlatformId");
      if (v35)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Initialize WCM_CellularRc1PolicyManager on PlatformId(%d)..."), v36);
        v37 = objc_alloc_init(WCM_CellularRc1PolicyManager);
        *((_QWORD *)v2 + 8) = v37;
        -[WCM_CellularRc1PolicyManager setPlatformManager:](v37, "setPlatformManager:", *((_QWORD *)v2 + 9));
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCM_CellularRc1PolicyManager not created on PlatformId(%d)...feature not enabled"), v36);
        *((_QWORD *)v2 + 8) = 0;
      }
      if (objc_msgSend(*((id *)v2 + 25), "containsObject:", CFSTR("UseWCMAriDriver")))
      {
        v38 = +[WCM_AriCoexCommandDriver singleton](WCM_AriCoexCommandDriver, "singleton");
        if (v38)
        {
          v39 = v38;
          objc_msgSend(v2, "updateControllerSession:ofId:", objc_opt_new(WCM_CellularController), 3);
          objc_msgSend(v39, "setCellularController:", *((_QWORD *)v2 + 10));
        }
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("USE_WCM_ARI_DRIVER feature not enabled.  _ariDriver=nil"));
      }
      if (objc_msgSend(*((id *)v2 + 25), "containsObject:", CFSTR("MavAntPolicyFramework")))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Initialize WCM_MavAntennaPolicy on PlatformId(%d)..."), objc_msgSend(*((id *)v2 + 9), "wrmPlatformId"));
        v40 = objc_alloc_init(WCM_MavAntennaPolicy);
        *((_QWORD *)v2 + 24) = v40;
        if (v40)
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Created WCM_MavAntennaPolicy instance successfully"));
          objc_msgSend(*((id *)v2 + 24), "applyMavAntennaPolicyForPlatformId:sku:", objc_msgSend(*((id *)v2 + 9), "wrmPlatformId"), objc_msgSend(*((id *)v2 + 9), "wrmSku"));
        }
        else
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Failed to create WCM_MavAntennaPolicy instance"));
        }
      }
      if ((objc_msgSend(*((id *)v2 + 25), "containsObject:", CFSTR("IOKitCameraStateEvent")) & 1) != 0
        || objc_msgSend(*((id *)v2 + 25), "containsObject:", CFSTR("AccessoryStateEvent")))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Initialize WCM_IOKitWrapper on PlatformId(%d)..."), objc_msgSend(*((id *)v2 + 9), "wrmPlatformId"));
        v41 = -[WCM_IOKitWrapper initWithPlatformId:]([WCM_IOKitWrapper alloc], "initWithPlatformId:", objc_msgSend(*((id *)v2 + 9), "wrmPlatformId"));
        *((_QWORD *)v2 + 70) = v41;
        -[WCM_IOKitWrapper registerIOkitStateEvent](v41, "registerIOkitStateEvent");
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCM_IOKitWrapper not created on PlatformId(%d)...feature not enabled"), objc_msgSend(*((id *)v2 + 9), "wrmPlatformId"));
        *((_QWORD *)v2 + 70) = 0;
      }
      *((_QWORD *)v2 + 23) = 0;
      if (objc_msgSend(*((id *)v2 + 25), "containsObject:", CFSTR("SacPolicySupport")))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("SAC Initialize WCM_SacManager on PlatformId(%d)..."), objc_msgSend(*((id *)v2 + 9), "wrmPlatformId"));
        *((_QWORD *)v2 + 23) = -[WCM_SacManager initWithPlatformId:]([WCM_SacManager alloc], "initWithPlatformId:", objc_msgSend(*((id *)v2 + 9), "wrmPlatformId"));
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("SAC feature not enabled. _sacManager=nil"));
      }
      v42 = objc_msgSend(v2, "fetchWRMdebugPlistForceRTG");
      v2[31] = v42;
      if (v42)
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Forcing AWDL RTG Active with defaults write"));
      goto LABEL_36;
    }
  }

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  if (-[WCM_PolicyManager sacManager](self, "sacManager"))
  if (-[WCM_PolicyManager mavAntPolicy](self, "mavAntPolicy"))

  -[WCM_PolicyManager stopHomeKitTimer](self, "stopHomeKitTimer");
  v3.receiver = self;
  v3.super_class = (Class)WCM_PolicyManager;
  -[WCM_PolicyManager dealloc](&v3, "dealloc");
}

- (void)audioRouteChanged
{
  _QWORD block[5];

  if (-[WCM_PolicyManager audioBuiltInReceiver](self, "audioBuiltInReceiver"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("audioBuiltInReceiver is %s now"), "false");
    -[WCM_PolicyManager setAudioBuiltInReceiver:](self, "setAudioBuiltInReceiver:", 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BDBF4;
    block[3] = &unk_1002019E8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getQueue"), block);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("audioBuiltInReceiver is already %s"), "false");
  }
}

- (BOOL)fetchWRMdebugPlistForceRTG
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  CFTypeID TypeID;
  CFComparisonResult v5;
  const char *v6;
  BOOL v7;
  const __CFString *v8;
  void *value;

  v2 = (const __CFDictionary *)CFPreferencesCopyAppValue(CFSTR("CoexDebug"), CFSTR("com.apple.WirelessRadioManager.debug"));
  if (v2)
  {
    v3 = v2;
    TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v3))
    {
      value = 0;
      if (CFDictionaryGetValueIfPresent(v3, CFSTR("ForceRTGActive"), (const void **)&value))
      {
        v5 = CFStringCompare(CFSTR("TRUE"), (CFStringRef)value, 0);
        v6 = "FALSE";
        v7 = v5 == kCFCompareEqualTo;
        if (v5 == kCFCompareEqualTo)
          v6 = "TRUE";
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("In fetchWRMdebugPlistForceRTG: Reading value %s"), v6);
        goto LABEL_11;
      }
      v8 = CFSTR("In fetchWRMdebugPlistForceRTG: Reading value FAILED");
    }
    else
    {
      v8 = CFSTR("In fetchWRMdebugPlistForceTDD: dict does not exist");
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, v8);
    v7 = 0;
LABEL_11:
    CFRelease(v3);
    return v7;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("In fetchWRMdebugPlistForceTDD: dict does not exist"));
  return 0;
}

- (void)updateClamshellState:(BOOL)a3
{
  _BOOL8 v3;
  const char *v5;

  v3 = a3;
  if (-[WCM_PolicyManager clamshellState](self, "clamshellState") != a3)
  {
    v5 = "off";
    if (v3)
      v5 = "on";
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("ClamshellState is %s now"), v5);
    -[WCM_PolicyManager setClamshellState:](self, "setClamshellState:", v3);
    objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 1000);
  }
}

- (void)updateOnOperatorBundleChanged
{
  const __CFBoolean *v3;
  const __CFBoolean *v4;
  CFTypeID v5;
  _BOOL4 v6;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("Operator Bundle Changed : Prev = %d"), self->mWCI2DisabledForOperator);
  if (!-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WCI2Mode")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCI2 is disabled already"));
    return;
  }
  v3 = (const __CFBoolean *)CFPreferencesCopyAppValue(CFSTR("DisableCoex"), CFSTR("com.apple.operator"));
  if (!v3)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("%@ not found in %@"), CFSTR("DisableCoex"), CFSTR("com.apple.operator"));
    if (!self->mWCI2DisabledForOperator)
      return;
    self->mWCI2DisabledForOperator = 0;
LABEL_13:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("Enabling WCI2"));
    -[WCM_PolicyManager setCellularWCI2CoexPolicyBitmap:](self, "setCellularWCI2CoexPolicyBitmap:", -[NSNumber unsignedLongValue](-[WCM_PlatformManager wcmCellularWCI2ModePolicy](-[WCM_PolicyManager platformManager](self, "platformManager"), "wcmCellularWCI2ModePolicy"), "unsignedLongValue"));
    -[WCM_PolicyManager handleCellularNetworkUpdate](self, "handleCellularNetworkUpdate");
    return;
  }
  v4 = v3;
  v5 = CFGetTypeID(v3);
  v6 = v5 == CFBooleanGetTypeID() && CFBooleanGetValue(v4) != 0;
  CFRelease(v4);
  if (self->mWCI2DisabledForOperator != v6)
  {
    self->mWCI2DisabledForOperator = v6;
    if (v6)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("Disabling WCI2"));
      -[WCM_PolicyManager configureAllWCI2:](self, "configureAllWCI2:", 0);
      -[WCM_PolicyManager setCellularWCI2CoexPolicyBitmap:](self, "setCellularWCI2CoexPolicyBitmap:", 0);
      return;
    }
    goto LABEL_13;
  }
}

- (int)cellularCoexBand
{
  WCM_CellularController *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  WCM_PlatformManager *v12;

  v3 = -[WCM_PolicyManager cellularController](self, "cellularController");
  -[WCM_CellularController ulCenterFreq](v3, "ulCenterFreq");
  v5 = v4;
  -[WCM_CellularController ulBandwidth](v3, "ulBandwidth");
  v7 = v6;
  -[WCM_CellularController dlCenterFreq](v3, "dlCenterFreq");
  v9 = v8;
  -[WCM_CellularController dlBandwidth](v3, "dlBandwidth");
  v11 = v10;
  LODWORD(v3) = -[WCM_CellularController tddBand](v3, "tddBand");
  v12 = -[WCM_PolicyManager platformManager](self, "platformManager");
  if ((_DWORD)v3)
  {
    if (-[WCM_PlatformManager isBand40ACoexActiveForULFreq:ulBW:dlFreq:dlBW:](v12, "isBand40ACoexActiveForULFreq:ulBW:dlFreq:dlBW:", v5, v7, v9, v11))
    {
      return 1;
    }
    if (-[WCM_PlatformManager isBand40BCoexActiveForULFreq:ulBW:dlFreq:dlBW:](-[WCM_PolicyManager platformManager](self, "platformManager"), "isBand40BCoexActiveForULFreq:ulBW:dlFreq:dlBW:", v5, v7, v9, v11))
    {
      return 2;
    }
    if (-[WCM_PlatformManager isBand41A1CoexActiveForULFreq:ulBW:dlFreq:dlBW:](-[WCM_PolicyManager platformManager](self, "platformManager"), "isBand41A1CoexActiveForULFreq:ulBW:dlFreq:dlBW:", v5, v7, v9, v11))
    {
      return 3;
    }
    if (-[WCM_PlatformManager isBand41A2CoexActiveForULFreq:ulBW:dlFreq:dlBW:](-[WCM_PolicyManager platformManager](self, "platformManager"), "isBand41A2CoexActiveForULFreq:ulBW:dlFreq:dlBW:", v5, v7, v9, v11))
    {
      return 4;
    }
  }
  else if (-[WCM_PlatformManager isBand7CoexActiveForULFreq:ulBW:dlFreq:dlBW:](v12, "isBand7CoexActiveForULFreq:ulBW:dlFreq:dlBW:", v5, v7, v9, v11))
  {
    return 0;
  }
  if (!-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("Bb20PolicyConversion"))&& !-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("LegacyNonCoexBandBitmapFix")))
  {
    return 7;
  }
  if (-[WCM_PolicyManager wcmCellularCoexBand](self, "wcmCellularCoexBand"))
    return 6;
  return 7;
}

- (BOOL)isCellularOnGPSIMDBand
{
  WCM_CellularController *v2;
  double v3;
  double v4;
  double v5;
  BOOL result;

  v2 = -[WCM_PolicyManager cellularController](self, "cellularController");
  -[WCM_CellularController cachedULCenterFreq](v2, "cachedULCenterFreq");
  result = 0;
  if (v3 != 0.0)
  {
    -[WCM_CellularController cachedULCenterFreq](v2, "cachedULCenterFreq");
    if (v4 >= 800.0)
    {
      -[WCM_CellularController cachedULCenterFreq](v2, "cachedULCenterFreq");
      if (v5 <= 915.0)
        return 1;
    }
  }
  return result;
}

- (BOOL)isCellularOnWiFi3FoBand
{
  WCM_CellularController *v2;
  double v3;
  double v4;
  double v5;
  BOOL result;

  v2 = -[WCM_PolicyManager cellularController](self, "cellularController");
  -[WCM_CellularController cachedULCenterFreq](v2, "cachedULCenterFreq");
  result = 0;
  if (v3 != 0.0)
  {
    -[WCM_CellularController cachedULCenterFreq](v2, "cachedULCenterFreq");
    if (v4 >= 806.0)
    {
      -[WCM_CellularController cachedULCenterFreq](v2, "cachedULCenterFreq");
      if (v5 <= 901.0)
        return 1;
    }
  }
  return result;
}

- (BOOL)isCellularOnIMD3CellBand
{
  WCM_CellularController *v2;
  double v3;
  double v4;
  double v5;
  BOOL result;

  v2 = -[WCM_PolicyManager cellularController](self, "cellularController");
  -[WCM_CellularController cachedULCenterFreq](v2, "cachedULCenterFreq");
  result = 0;
  if (v3 != 0.0 && !-[WCM_CellularController tddBand](v2, "tddBand"))
  {
    -[WCM_CellularController cachedULCenterFreq](v2, "cachedULCenterFreq");
    if (v4 >= 2500.0)
    {
      -[WCM_CellularController cachedULCenterFreq](v2, "cachedULCenterFreq");
      if (v5 >= 2570.0)
        return 1;
    }
  }
  return result;
}

- (id)getControllerOfId:(int)a3
{
  id result;

  switch(a3)
  {
    case 29:
      result = -[WCM_PolicyManager rcu1Controller](self, "rcu1Controller");
      break;
    case 30:
      result = -[WCM_PolicyManager rcu2Controller](self, "rcu2Controller");
      break;
    case 31:
      result = -[WCM_PolicyManager airplayController](self, "airplayController");
      break;
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
LABEL_5:
      result = 0;
      break;
    case 38:
      result = -[WCM_PolicyManager p2pAwdlController](self, "p2pAwdlController");
      break;
    case 39:
      result = -[WCM_PolicyManager p2pNanController](self, "p2pNanController");
      break;
    default:
      switch(a3)
      {
        case 1:
          result = -[WCM_PolicyManager wifiController](self, "wifiController");
          break;
        case 2:
          result = -[WCM_PolicyManager ftController](self, "ftController");
          break;
        case 3:
          result = -[WCM_PolicyManager cellularController](self, "cellularController");
          break;
        case 4:
          result = -[WCM_PolicyManager btController](self, "btController");
          break;
        default:
          goto LABEL_5;
      }
      break;
  }
  return result;
}

- (void)updateControllerSession:(id)a3 ofId:(int)a4
{
  uint64_t v4;
  WCM_CellularRc1PolicyManager *cellularRc1PolicyManager;

  v4 = *(_QWORD *)&a4;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Policy Manager update processId=%d with Controller = %p"), *(_QWORD *)&a4, a3);
  switch((int)v4)
  {
    case 29:
      -[WCM_PolicyManager setRcu1Controller:](self, "setRcu1Controller:", a3);
      break;
    case 30:
      -[WCM_PolicyManager setRcu2Controller:](self, "setRcu2Controller:", a3);
      break;
    case 31:
      -[WCM_PolicyManager setAirplayController:](self, "setAirplayController:", a3);
      break;
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
      break;
    case 38:
      -[WCM_PolicyManager setP2pAwdlController:](self, "setP2pAwdlController:", a3);
      break;
    case 39:
      -[WCM_PolicyManager setP2pNanController:](self, "setP2pNanController:", a3);
      break;
    default:
      switch((int)v4)
      {
        case 1:
          if (-[WCM_PolicyManager wifiController](self, "wifiController"))
          {

            -[WCM_PolicyManager setWifiController:](self, "setWifiController:", 0);
          }
          if (a3)
            -[WCM_PolicyManager setWifiController:](self, "setWifiController:", a3);
          break;
        case 2:
          -[WCM_PolicyManager setFtController:](self, "setFtController:", a3);
          break;
        case 3:
          -[WCM_PolicyManager setCellularController:](self, "setCellularController:", a3);
          break;
        case 4:
          -[WCM_PolicyManager setBtController:](self, "setBtController:", a3);
          break;
        default:
          goto LABEL_15;
      }
      break;
  }
LABEL_15:
  cellularRc1PolicyManager = self->_cellularRc1PolicyManager;
  if (cellularRc1PolicyManager)
    -[WCM_CellularRc1PolicyManager updateControllerSession:ofId:](cellularRc1PolicyManager, "updateControllerSession:ofId:", a3, v4);
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RC1 Policy Manager failed to update processId=%d with Controller = %p due to nil object"), v4, a3);
  -[WCM_PolicyManager handleControllerAvailability:](self, "handleControllerAvailability:", v4);
  -[WCM_PolicyManager updateCoexMonitorState:](self, "updateCoexMonitorState:", -[WCM_PolicyManager cellularCoexBand](self, "cellularCoexBand"));
}

- (void)handleErrorReport:(int)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("AggdRemoval_ Since Aggd related keys ave been disabled on the server side, we will stop submitting metrics to Aggd. (handleErrorReport)"));
}

- (void)handleControllerAvailability:(unint64_t)a3
{
  const char *v5;
  _QWORD block[6];

  if (a3 < 0x2A && ((0x3EEEFFFFFFFuLL >> a3) & 1) != 0)
  {
    v5 = off_1002052E0[a3];
  }
  else
  {
    v5 = "INVALID_PROC_ID!!!";
    if (a3 == 42)
      v5 = "WRMSOS";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Handle controller availability for %s"), v5);
  if (!-[WCM_PolicyManager cellularController](self, "cellularController"))
    -[WCM_PolicyManager configureAllWCI2:](self, "configureAllWCI2:", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BE5C4;
  block[3] = &unk_100201BB8;
  block[4] = self;
  block[5] = a3;
  dispatch_async((dispatch_queue_t)objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getQueue"), block);
  if (a3 == 2)
    -[WCM_FTController getFaceTimeCallConfig](-[WCM_PolicyManager ftController](self, "ftController"), "getFaceTimeCallConfig");
}

- (void)initControllerPolicy:(int)a3
{
  _BOOL4 forceRealTimeAWDL;
  WCM_BTController *v5;
  _BOOL8 v6;

  if (a3 == 4)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("BT Crashed or init - resending WiFi states"));
    -[WCM_PolicyManager handleWiFiBTCatsChange:](self, "handleWiFiBTCatsChange:", 0);
    if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiFigaroCoex")))
    {
      -[WCM_BTController update5GHzHostAP:](-[WCM_PolicyManager btController](self, "btController"), "update5GHzHostAP:", -[WCM_WiFiController hostAP5GHzActive](-[WCM_PolicyManager wifiController](self, "wifiController"), "hostAP5GHzActive"));
      if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("RCU1Support")))-[WCM_BTController updateUWB5GHzActive:](-[WCM_PolicyManager btController](self, "btController"), "updateUWB5GHzActive:", -[WCM_R1Controller mRCU15GHzInUse](-[WCM_PolicyManager rcu1Controller](self, "rcu1Controller"), "mRCU15GHzInUse"));
      if (_os_feature_enabled_impl("CoreWiFi", "Figaro5GTDD"))
      {
        forceRealTimeAWDL = self->_forceRealTimeAWDL;
        v5 = -[WCM_PolicyManager btController](self, "btController");
        v6 = forceRealTimeAWDL
          || -[WCM_P2PAWDLController mRealTimeAwdlTrafficEnabled](-[WCM_PolicyManager p2pAwdlController](self, "p2pAwdlController"), "mRealTimeAwdlTrafficEnabled");
        -[WCM_BTController updateAWDLRTGActive:](v5, "updateAWDLRTGActive:", v6);
        -[WCM_BTController updateWiFiChannelInfo:bandwidth:regBand:](-[WCM_PolicyManager btController](self, "btController"), "updateWiFiChannelInfo:bandwidth:regBand:", -[WCM_WiFiController wifiChannel](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiChannel"), -[WCM_WiFiController channelBandwidthMHz](-[WCM_PolicyManager wifiController](self, "wifiController"), "channelBandwidthMHz"), -[WCM_PolicyManager parseCenterFreqtoUNIIBand:](self, "parseCenterFreqtoUNIIBand:", -[WCM_WiFiController channelCenterFreqMHz](-[WCM_PolicyManager wifiController](self, "wifiController"), "channelCenterFreqMHz")));
        -[WCM_BTController updateLowWiFi5GRates:](-[WCM_PolicyManager btController](self, "btController"), "updateLowWiFi5GRates:", 0);
        -[WCM_PolicyManager handleLow5GRate:](self, "handleLow5GRate:", 0);
      }
      else
      {
        -[WCM_BTController updateNANActive:](-[WCM_PolicyManager btController](self, "btController"), "updateNANActive:", -[WCM_P2PNANController mNanEnabled](-[WCM_PolicyManager p2pNanController](self, "p2pNanController"), "mNanEnabled"));
        -[WCM_BTController updateAWDLActive:](-[WCM_PolicyManager btController](self, "btController"), "updateAWDLActive:", -[WCM_P2PAWDLController mAwdlEnabled](-[WCM_PolicyManager p2pAwdlController](self, "p2pAwdlController"), "mAwdlEnabled"));
      }
    }
  }
}

- (void)handleCellularNetworkUpdate
{
  uint64_t v3;
  WCM_CellularController *v4;
  WCM_PlatformManager *v5;
  WCM_WiFiController *v6;
  $03B45E325E2BEB6367864A8B9A334110 *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  NSArray *v36;
  NSArray *v37;
  NSData *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t var8;
  double var2;
  double v43;
  double v44;
  double v45;
  double var0;
  double v47;
  double v48;
  double v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  void *j;
  uint64_t v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  void *k;
  uint64_t v64;
  NSData *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  uint64_t v70;
  void *jj;
  uint64_t v72;
  id v73;
  id v74;
  id v75;
  uint64_t v76;
  void *kk;
  uint64_t v78;
  id v79;
  id v80;
  id v81;
  uint64_t v82;
  void *mm;
  uint64_t v84;
  id v85;
  id v86;
  uint64_t v87;
  void *nn;
  uint64_t v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  NSMutableArray *v96;
  id v97;
  id v98;
  uint64_t v99;
  void *n;
  uint64_t v101;
  NSMutableArray *v102;
  id v103;
  id v104;
  uint64_t v105;
  void *m;
  uint64_t v107;
  NSMutableArray *v108;
  id v109;
  id v110;
  uint64_t v111;
  void *ii;
  uint64_t v113;
  uint64_t v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  unsigned int v123;
  WCM_WiFiCellCoexIssueBandTable *v124;
  unsigned int v125;
  unsigned int v126;
  _UNKNOWN **v127;
  _UNKNOWN **v128;
  _UNKNOWN **v129;
  WCM_PolicyManager *v130;
  WCM_PlatformManager *v131;
  WCM_CellularController *v132;
  uint64_t v133;
  unsigned int v134;
  WCM_WiFiController *v135;
  uint64_t v136;
  NSMutableArray *v137;
  id v138;
  id v139;
  uint64_t v140;
  void *i;
  uint64_t v142;
  uint64_t v143;
  double v144;
  double v145;
  WCM_PlatformManager *v146;
  WCM_CellularController *v147;
  uint64_t v148;
  WCM_WiFiController *v149;
  WCM_CellularController *v150;
  WCM_WiFiController *v151;
  unsigned int v152;
  WCM_WiFiCellCoexIssueBandTable *v153;
  id v154;
  NSMutableArray *v155;
  NSMutableArray *v156;
  id v157;
  void *v158;
  NSNumber *v159;
  int v160;
  unsigned int v161;
  unsigned int v162;
  WCM_BTController *v163;
  NSData *v164;
  NSData *v165;
  NSData *v166;
  NSData *v167;
  NSData *v168;
  NSData *v169;
  NSData *v170;
  unsigned int v171;
  WCM_BTController *v172;
  unint64_t v173;
  id v174;
  id v175;
  int v176;
  uint64_t v177;
  unsigned int v178;
  unsigned int v179;
  unsigned int v180;
  unsigned int v181;
  NSArray *v182;
  unsigned int v183;
  unsigned int v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  WCM_CellularController *v188;
  unsigned int v189;
  void *context;
  unsigned int contexta;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  unsigned __int16 v236;
  unsigned __int16 v237;
  unsigned __int8 v238;
  uint64_t v239;
  uint64_t v240;
  _BYTE v241[128];
  _BYTE v242[128];
  _BYTE v243[128];
  _BYTE v244[128];
  _BYTE v245[128];
  _BYTE v246[128];
  _BYTE v247[128];
  _BYTE v248[128];
  _BYTE v249[128];
  _BYTE v250[128];

  v3 = -[WCM_PolicyManager cellularCoexBand](self, "cellularCoexBand");
  v4 = -[WCM_PolicyManager cellularController](self, "cellularController");
  v5 = -[WCM_PolicyManager platformManager](self, "platformManager");
  v6 = -[WCM_PolicyManager wifiController](self, "wifiController");
  v7 = -[WCM_CellularController getActiveULCAConfig](v4, "getActiveULCAConfig");
  v8 = (_DWORD)v3 != 7;
  v240 = 0;
  v239 = 0;
  v182 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_1002308B8, &off_1002308D0, &off_1002308E8, &off_100230900, &off_100230918, &off_100230930, &off_100230948, 0);
  v238 = 0;
  v237 = 0;
  v236 = 0;
  if ((v3 - 1) >= 2)
    v9 = 255;
  else
    v9 = 0;
  -[WCM_PolicyManager setBtPreferredRole:](self, "setBtPreferredRole:", v9);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Handling Cellular Network Update"));
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("BLEActiveScanPwrLmtEnabled")))
  {
    if ((v3 & 0xFFFFFFFE) == 2)
      v10 = 5;
    else
      v10 = 0;
    v11 = -[WCM_PolicyManager BLEActiveScanPwrLmtAssrInt](self, "BLEActiveScanPwrLmtAssrInt");
    v12 = -[WCM_PolicyManager BLEActiveScanPwrLmtAssrInt](self, "BLEActiveScanPwrLmtAssrInt");
    if (v10 == v11)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebugBLEIntervalTooOften_ updateBLEActiveScanPwrLmtAssertionInterval is called by handleCellularNetworkUpdate. No Need to update with same value --- new interval (%d), old interval (%d)"), v10, v12);
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebugBLEIntervalTooOften_ updateBLEActiveScanPwrLmtAssertionInterval is called by handleCellularNetworkUpdate. Updating with new interval (%d), old interval (%d)"), v10, v12);
      -[WCM_PolicyManager setBLEActiveScanPwrLmtAssrInt:](self, "setBLEActiveScanPwrLmtAssrInt:", v10);
      -[WCM_BTController updateBLEActiveScanPwrLmtAssertionInterval:](-[WCM_PolicyManager btController](self, "btController"), "updateBLEActiveScanPwrLmtAssertionInterval:", -[WCM_PolicyManager BLEActiveScanPwrLmtAssrInt](self, "BLEActiveScanPwrLmtAssrInt"));
    }
    v8 = (_DWORD)v3 != 7;
  }
  context = objc_autoreleasePoolPush();
  if (-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"))
  {
    v13 = -[WCM_CellularController bandInfoType](v4, "bandInfoType");
    -[WCM_CellularController dlCenterFreq](v4, "dlCenterFreq");
    v15 = v14;
    -[WCM_CellularController dlBandwidth](v4, "dlBandwidth");
    v17 = v15 - v16 * 0.5;
    -[WCM_CellularController dlCenterFreq](v4, "dlCenterFreq");
    v19 = v18;
    -[WCM_CellularController dlBandwidth](v4, "dlBandwidth");
    v21 = v19 + v20 * 0.5;
    -[WCM_CellularController ulCenterFreq](v4, "ulCenterFreq");
    v23 = v22;
    -[WCM_CellularController ulBandwidth](v4, "ulBandwidth");
    v25 = v23 - v24 * 0.5;
    -[WCM_CellularController ulCenterFreq](v4, "ulCenterFreq");
    v27 = v26;
    -[WCM_CellularController ulBandwidth](v4, "ulBandwidth");
    v29 = v27 + v28 * 0.5;
    v181 = -[WCM_WiFiController wifiChannel](v6, "wifiChannel");
    v180 = -[WCM_WiFiController channelBandwidthMHz](v6, "channelBandwidthMHz");
    v179 = -[WCM_WiFiController channelCenterFreqMHz](v6, "channelCenterFreqMHz");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("V2BtimapDebug_ handleCellularNetworkUpdate gets called with dlLowFreq = %f, dlHighFreq = %f, ulLowFreq = %f, ulHighFreq = %f."), *(_QWORD *)&v17, *(_QWORD *)&v21, *(_QWORD *)&v25, *(_QWORD *)&v29);
    -[WCM_PolicyManager sendNRFrequencyBandUpdateForMic:dlHighFreq:ulLowFreq:ulHighFreq:](self, "sendNRFrequencyBandUpdateForMic:dlHighFreq:ulLowFreq:ulHighFreq:", v17, v21, v25, v29);
    -[WCM_CellularController ulCenterFreq](v4, "ulCenterFreq");
    if (v30 != 0.0)
    {
      -[WCM_CellularController ulCenterFreq](v4, "ulCenterFreq");
      v32 = v31;
      -[WCM_CellularController ulBandwidth](v4, "ulBandwidth");
      -[WCM_PolicyManager sendULFrequencyUpdates:ulCenterFreq:ulBandwidth:](self, "sendULFrequencyUpdates:ulCenterFreq:ulBandwidth:", v13, v32, v33);
    }
    if (!-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("EnableULCA")))
    {
      -[WCM_CellularController getCombinedUplinkFreqRange](v4, "getCombinedUplinkFreqRange");
      v25 = v34;
      v29 = v34 + v35;
    }
    v183 = v13;
    if (!v7)
    {
LABEL_170:
      v123 = -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("BTSeparateAGCCoexMode"));
      v124 = -[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable");
      if (v123)
        v125 = -[WCM_WiFiCellCoexIssueBandTable wifiBtAgcCoexModeEnableCheckBandCombinationV2:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:channelCenterFreqMHz:channelBandwidthMHz:coexModeWifiLevel:coexModeBTLevel:](v124, "wifiBtAgcCoexModeEnableCheckBandCombinationV2:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:channelCenterFreqMHz:channelBandwidthMHz:coexModeWifiLevel:coexModeBTLevel:", v13, v181, v179, v180, &v240, &v239, v17, v21, v25, v29);
      else
        v125 = -[WCM_WiFiCellCoexIssueBandTable wifiBtAgcCoexModeEnableCheckBandCombination:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:coexModeWifiLevel:](v124, "wifiBtAgcCoexModeEnableCheckBandCombination:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:coexModeWifiLevel:", v13, &v240, v17, v21, v25, v29);
      v126 = v125;
      if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("CellularWatchFcmBcmAntennaPref")))
      {
        -[WCM_PolicyManager setWatchCellularAntPref:](self, "setWatchCellularAntPref:", -[WCM_WiFiCellCoexIssueBandTable watchAntennaPreferenceEnableCheckBandCombination:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "watchAntennaPreferenceEnableCheckBandCombination:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:", v13, v17, v21, v25, v29));
      }
      if (v126)
      {
        if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("BTSeparateAGCCoexMode")))
        {
          v127 = &off_1002308A0;
          if (v240 == 3)
            v127 = &off_100230C30;
          if (v240 == 2)
            v128 = &off_100230C18;
          else
            v128 = v127;
          -[WCM_PolicyManager setWifiAgcCoexModeLevel:](self, "setWifiAgcCoexModeLevel:", v128);
          if (v239 == 2)
          {
            v129 = &off_100230C30;
            goto LABEL_192;
          }
          if (v239 == 1)
          {
            v129 = &off_100230C18;
LABEL_192:
            v130 = self;
            goto LABEL_193;
          }
LABEL_191:
          v129 = &off_1002308A0;
          goto LABEL_192;
        }
        if (v240 == 3)
        {
          -[WCM_PolicyManager setWifiAgcCoexModeLevel:](self, "setWifiAgcCoexModeLevel:", &off_100230C30);
          goto LABEL_191;
        }
        if (v240 == 2)
        {
          -[WCM_PolicyManager setWifiAgcCoexModeLevel:](self, "setWifiAgcCoexModeLevel:", &off_100230C18);
          v130 = self;
          v129 = &off_100230C18;
LABEL_193:
          -[WCM_PolicyManager setBtAgcCoexModeEnable:](v130, "setBtAgcCoexModeEnable:", v129);
          goto LABEL_194;
        }
      }
      -[WCM_PolicyManager setBtAgcCoexModeEnable:](self, "setBtAgcCoexModeEnable:", &off_1002308A0);
      -[WCM_PolicyManager setWifiAgcCoexModeLevel:](self, "setWifiAgcCoexModeLevel:", &off_1002308A0);
LABEL_194:
      if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WifiBtAgcCoexMode"))&& -[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("1st place self.wifiAgcCoexModeLevel is %d"), -[NSNumber integerValue](-[WCM_PolicyManager wifiAgcCoexModeLevel](self, "wifiAgcCoexModeLevel"), "integerValue"));
        -[WCM_WiFiController setWifiAgcCoexMode:](-[WCM_PolicyManager wifiController](self, "wifiController"), "setWifiAgcCoexMode:", -[WCM_PolicyManager wifiAgcCoexModeLevel](self, "wifiAgcCoexModeLevel"));
      }
      if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("CellularWatchFcmBcmAntennaPref")))
      {
        -[WCM_CellularController updateWatchAntennaPref:watchAntPref:](-[WCM_PolicyManager cellularController](self, "cellularController"), "updateWatchAntennaPref:watchAntPref:", v3, -[WCM_PolicyManager watchCellularAntPref](self, "watchCellularAntPref"));
      }
      if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiAWDWCI2CoexBitmap"))&& -[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState"))
      {
        if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiWCI2BitmapV2Enabled")))
        {
          v131 = v5;
          v132 = v4;
          v133 = v8;
          v134 = -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport"));
          v135 = -[WCM_PolicyManager wifiController](self, "wifiController");
          if (v134)
            -[WCM_WiFiController updateChannelsToEnableWCI2WiFiEnh:WiFiEnhChannels:](v135, "updateChannelsToEnableWCI2WiFiEnh:WiFiEnhChannels:", -[WCM_PolicyManager wifiChannelsToEnableWCI2Gand5G](self, "wifiChannelsToEnableWCI2Gand5G"), -[WCM_PolicyManager wifiChannelsToEnableWCI2WiFiEnh](self, "wifiChannelsToEnableWCI2WiFiEnh"));
          else
            -[WCM_WiFiController updateChannelsToEnableWCI2V2:](v135, "updateChannelsToEnableWCI2V2:", -[WCM_PolicyManager wifiChannelsToEnableWCI2V2](self, "wifiChannelsToEnableWCI2V2"));
          v8 = v133;
          v4 = v132;
          v5 = v131;
        }
        else
        {
          -[WCM_WiFiController updateChannelsToEnableWCI2:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateChannelsToEnableWCI2:", -[WCM_PolicyManager wifiChannelsToEnableWCI2](self, "wifiChannelsToEnableWCI2"));
        }
      }
      if (-[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState")
        && (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"))|| -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiType7LTEMBAntBlocking"))))
      {
        v195 = v3;
        v188 = v4;
        v136 = v8;
        if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("Type72GWiFiSupport")))
        {
          v214 = 0u;
          v215 = 0u;
          v212 = 0u;
          v213 = 0u;
          v137 = -[WCM_PolicyManager wifi2GHzLTEB7IMD3ChannelsEnableType7](self, "wifi2GHzLTEB7IMD3ChannelsEnableType7");
          v138 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v137, "countByEnumeratingWithState:objects:count:", &v212, v245, 16);
          if (v138)
          {
            v139 = v138;
            v140 = *(_QWORD *)v213;
            do
            {
              for (i = 0; i != v139; i = (char *)i + 1)
              {
                if (*(_QWORD *)v213 != v140)
                  objc_enumerationMutation(v137);
                v142 = *(_QWORD *)(*((_QWORD *)&v212 + 1) + 8 * (_QWORD)i);
                if ((-[NSMutableArray containsObject:](-[WCM_PolicyManager wifi2GHzChannelsToEnableType7MSGCombined](self, "wifi2GHzChannelsToEnableType7MSGCombined"), "containsObject:", v142) & 1) == 0&& objc_msgSend(&off_100242090, "containsObject:", v142))
                {
                  -[NSMutableArray addObject:](-[WCM_PolicyManager wifi2GHzChannelsToEnableType7MSGCombined](self, "wifi2GHzChannelsToEnableType7MSGCombined"), "addObject:", v142);
                }
              }
              v139 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v137, "countByEnumeratingWithState:objects:count:", &v212, v245, 16);
            }
            while (v139);
          }
        }
        if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport")))
        {
          -[WCM_PolicyManager handleCallLQMStateChangeType7WiFiEnh:](self, "handleCallLQMStateChangeType7WiFiEnh:", 1);
        }
        else
        {
          -[WCM_PolicyManager handleCallLQMStateChangeType7:](self, "handleCallLQMStateChangeType7:", 1);
        }
        v8 = v136;
        v4 = v188;
        v3 = v195;
        v13 = v183;
      }
      if (!-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("ProtectWiFiRanging")))goto LABEL_235;
      if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiWCI2BitmapV2Enabled")))
      {
        if ((-[NSMutableArray containsObject:](-[WCM_PolicyManager wifiChannelsToEnableWCI2V2](self, "wifiChannelsToEnableWCI2V2"), "containsObject:", &off_100230C90) & 1) == 0)
        {
LABEL_228:
          v143 = 0;
LABEL_231:
          if (-[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState"))
          {
            -[WCM_CellularController ulCenterFreq](v4, "ulCenterFreq");
            if (v144 != 0.0)
            {
              -[WCM_CellularController ulBandwidth](v4, "ulBandwidth");
              if (v145 != 0.0)
              {
                v146 = v5;
                v147 = v4;
                v148 = v8;
                v149 = -[WCM_PolicyManager wifiController](self, "wifiController");
                v150 = -[WCM_PolicyManager cellularController](self, "cellularController");
                v151 = v149;
                v8 = v148;
                v4 = v147;
                v5 = v146;
                -[WCM_WiFiController updateCellularFrequencyConfig:withWiFiRangingDesenseFlag:](v151, "updateCellularFrequencyConfig:withWiFiRangingDesenseFlag:", v150, v143);
              }
            }
          }
LABEL_235:
          if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiOCLSupport")))
          {
            v152 = -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport"));
            v153 = -[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable");
            if (v152)
            {
              v154 = -[WCM_WiFiCellCoexIssueBandTable wifiChannelsToDisableOCLWiFiEnhForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:](v153, "wifiChannelsToDisableOCLWiFiEnhForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:", v13, v17, v21, v25, v29);
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("OCLDisable_WiFiEnh: wifiChannelEnhDict = %@"), v154);
              -[WCM_PolicyManager setWifiChannelsToDisableOCL2G5G:](self, "setWifiChannelsToDisableOCL2G5G:", objc_msgSend(v154, "objectForKey:", CFSTR("wifiChannels2Gand5G")));
              -[WCM_PolicyManager setWifiChannelsToDisableOCLEnh:](self, "setWifiChannelsToDisableOCLEnh:", objc_msgSend(v154, "objectForKey:", CFSTR("wifiChannelsEnh")));
            }
            else
            {
              -[WCM_PolicyManager setWifiChannelsToDisableOCL:](self, "setWifiChannelsToDisableOCL:", -[WCM_WiFiCellCoexIssueBandTable wifiChannelsToDisableOCLForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:](v153, "wifiChannelsToDisableOCLForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:", v13, v17, v21, v25, v29));
            }
            if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiOCLSupportFix")))
            {
              if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport")))
              {
                v155 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", -[WCM_PolicyManager wifiChannelsToDisableOCL2G5G](self, "wifiChannelsToDisableOCL2G5G"));
                -[NSMutableArray removeObjectsInArray:](v155, "removeObjectsInArray:", v182);
                -[WCM_PolicyManager setWifiChannelsToDisableOCL2G5G:](self, "setWifiChannelsToDisableOCL2G5G:", v155);
                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("OCLDisable_WiFiEnh: WiFi channels to disble OCL -- fixed version %@"), -[WCM_PolicyManager wifiChannelsToDisableOCL2G5G](self, "wifiChannelsToDisableOCL2G5G"));
              }
              else
              {
                v156 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", -[WCM_PolicyManager wifiChannelsToDisableOCL](self, "wifiChannelsToDisableOCL"));
                -[NSMutableArray removeObjectsInArray:](v156, "removeObjectsInArray:", v182);
                -[WCM_PolicyManager setWifiChannelsToDisableOCL:](self, "setWifiChannelsToDisableOCL:", v156);
                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("WiFi channels to disble OCL -- fixed version %@"), -[WCM_PolicyManager wifiChannelsToDisableOCL](self, "wifiChannelsToDisableOCL"));
              }
            }
          }
          if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("BTDiversityAFHMap")))
          {
            -[WCM_PolicyManager setBtDiversityChannelMapForC0B0:](self, "setBtDiversityChannelMapForC0B0:", -[WCM_WiFiCellCoexIssueBandTable btDiversityChannelMapForCellBTAntennaCombination:cellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "btDiversityChannelMapForCellBTAntennaCombination:cellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:", 0, v13, 0, v17, v21, v25, v29));
            -[WCM_PolicyManager setBtDiversityChannelMapForC0B1:](self, "setBtDiversityChannelMapForC0B1:", -[WCM_WiFiCellCoexIssueBandTable btDiversityChannelMapForCellBTAntennaCombination:cellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "btDiversityChannelMapForCellBTAntennaCombination:cellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:", 1, v13, 0, v17, v21, v25, v29));
            -[WCM_PolicyManager setBtDiversityChannelMapForC1B0:](self, "setBtDiversityChannelMapForC1B0:", -[WCM_WiFiCellCoexIssueBandTable btDiversityChannelMapForCellBTAntennaCombination:cellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "btDiversityChannelMapForCellBTAntennaCombination:cellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:", 2, v13, 0, v17, v21, v25, v29));
            -[WCM_PolicyManager setBtDiversityChannelMapForC1B1:](self, "setBtDiversityChannelMapForC1B1:", -[WCM_WiFiCellCoexIssueBandTable btDiversityChannelMapForCellBTAntennaCombination:cellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "btDiversityChannelMapForCellBTAntennaCombination:cellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:", 3, v13, 0, v17, v21, v25, v29));
            -[WCM_PolicyManager setBtDiversityChannelMapOnGpsRadioActiveForC0B0:](self, "setBtDiversityChannelMapOnGpsRadioActiveForC0B0:", -[WCM_WiFiCellCoexIssueBandTable btDiversityChannelMapForCellBTAntennaCombination:cellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "btDiversityChannelMapForCellBTAntennaCombination:cellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:", 0, v13, 1, v17, v21, v25, v29));
            -[WCM_PolicyManager setBtDiversityChannelMapOnGpsRadioActiveForC0B1:](self, "setBtDiversityChannelMapOnGpsRadioActiveForC0B1:", -[WCM_WiFiCellCoexIssueBandTable btDiversityChannelMapForCellBTAntennaCombination:cellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "btDiversityChannelMapForCellBTAntennaCombination:cellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:", 1, v13, 1, v17, v21, v25, v29));
            -[WCM_PolicyManager setBtDiversityChannelMapOnGpsRadioActiveForC1B0:](self, "setBtDiversityChannelMapOnGpsRadioActiveForC1B0:", -[WCM_WiFiCellCoexIssueBandTable btDiversityChannelMapForCellBTAntennaCombination:cellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "btDiversityChannelMapForCellBTAntennaCombination:cellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:", 2, v13, 1, v17, v21, v25, v29));
            -[WCM_PolicyManager setBtDiversityChannelMapOnGpsRadioActiveForC1B1:](self, "setBtDiversityChannelMapOnGpsRadioActiveForC1B1:", -[WCM_WiFiCellCoexIssueBandTable btDiversityChannelMapForCellBTAntennaCombination:cellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "btDiversityChannelMapForCellBTAntennaCombination:cellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:", 3, v13, 1, v17, v21, v25, v29));
          }
          else if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("BTUseC0B1AntennaConfig")))
          {
            -[WCM_PolicyManager setBtPreferredChannelMap:](self, "setBtPreferredChannelMap:", -[WCM_WiFiCellCoexIssueBandTable btPreferredChannelMapForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "btPreferredChannelMapForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:", v13, 0, v17, v21, v25, v29));
            -[WCM_PolicyManager setBtPreferredChannelMapOnGpsRadioActive:](self, "setBtPreferredChannelMapOnGpsRadioActive:", -[WCM_WiFiCellCoexIssueBandTable btPreferredChannelMapForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "btPreferredChannelMapForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:", v13, 1, v17, v21, v25, v29));
            if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("hpcellularstatemonitorsupport")))
            {
              -[WCM_PolicyManager setBtPreferredChannelMapHPCellularActive:](self, "setBtPreferredChannelMapHPCellularActive:", -[WCM_PlatformManager wcmHPCellularBTAFHMapFixed](v5, "wcmHPCellularBTAFHMapFixed"));
            }
          }
          else
          {
            if (-[WCM_PlatformManager wcmBTMaxNumberOfChannelsToAvoidForCellOOB](v5, "wcmBTMaxNumberOfChannelsToAvoidForCellOOB"))
            {
              v157 = (id)-[NSNumber intValue](-[WCM_PlatformManager wcmBTMaxNumberOfChannelsToAvoidForCellOOB](v5, "wcmBTMaxNumberOfChannelsToAvoidForCellOOB"), "intValue");
            }
            else
            {
              v157 = 0;
            }
            -[WCM_PolicyManager setBtPreferredChannelMap:](self, "setBtPreferredChannelMap:", -[WCM_WiFiCellCoexIssueBandTable btPreferredChannelMapFromLegacyWiFiConfigForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:maxChannelsToAvoidForCellOOB:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "btPreferredChannelMapFromLegacyWiFiConfigForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:maxChannelsToAvoidForCellOOB:", v13, 0, v157, v17, v21, v25, v29));
            -[WCM_PolicyManager setBtPreferredChannelMapOnGpsRadioActive:](self, "setBtPreferredChannelMapOnGpsRadioActive:", -[WCM_WiFiCellCoexIssueBandTable btPreferredChannelMapFromLegacyWiFiConfigForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:maxChannelsToAvoidForCellOOB:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "btPreferredChannelMapFromLegacyWiFiConfigForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:maxChannelsToAvoidForCellOOB:", v13, 1, v157, v17, v21, v25, v29));
          }
          v158 = objc_autoreleasePoolPush();
          if (_os_feature_enabled_impl("wirelessradiomanager", "HFBTEnhancement")
            && -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("HFBTCoex")))
          {
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("HFAFHDebug_ Recaculate channel bitmap"));
            -[WCM_PolicyManager setBtPreferred5GChannelMap:](self, "setBtPreferred5GChannelMap:", -[WCM_WiFiCellCoexIssueBandTable HFBTPreferredChannelMapForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "HFBTPreferredChannelMapForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:gpsRadioActive:", v13, self->_gpsRadioActive, v17, v21, v25, v29));
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("HFBTAntBlkDebug_ update ant blocking configs"));
            -[WCM_PolicyManager setHFBTAntBlkEnableBands:](self, "setHFBTAntBlkEnableBands:", -[WCM_WiFiCellCoexIssueBandTable HFBTAntBlockingBandsFromWiFiConfigForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "HFBTAntBlockingBandsFromWiFiConfigForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:", v13, v17, v21, v25, v29));
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HFBTAntBlkDebug_ Updated enabled bands = %@"), -[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands"));
          }
          objc_autoreleasePoolPop(v158);
          goto LABEL_256;
        }
      }
      else if (!-[NSArray containsObject:](-[WCM_PolicyManager wifiChannelsToEnableWCI2](self, "wifiChannelsToEnableWCI2"), "containsObject:", &off_100230C90))
      {
        goto LABEL_228;
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Cellular UL frequency desenses WiFi ranging channel #6"));
      v143 = 1;
      v8 = 1;
      goto LABEL_231;
    }
    if (self->_cellularRc1PolicyManager)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Cellular RC1 policy manager handleCellularNetworkUpdate."));
      -[WCM_CellularRc1PolicyManager handleCellularNetworkUpdate](self->_cellularRc1PolicyManager, "handleCellularNetworkUpdate");
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Cellular RC1 policy manager is NULL"));
    }
    if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("LegacyNonCoexBandBitmapFix")))
    {
      -[WCM_PolicyManager setWcmCellularCoexBand:](self, "setWcmCellularCoexBand:", -[WCM_WiFiCellCoexIssueBandTable coexBandCheckBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "coexBandCheckBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:", v13, v17, v21, v25, v29));
      v39 = -[WCM_PolicyManager cellularCoexBand](self, "cellularCoexBand");
      if ((_DWORD)v39 == 7)
        v40 = v8;
      else
        v40 = 1;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("InCoexBandCheck %d %d %d"), -[WCM_PolicyManager wcmCellularCoexBand](self, "wcmCellularCoexBand"), v39, v40);
      v8 = v40;
      v3 = v39;
    }
    if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiWCI2BitmapV2Enabled"))|| -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiType7LTEMBAntBlocking"))|| -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiFVGHzPDHLS")))
    {
      var8 = v7->var6.var8;
      var2 = v7->var6.var2;
      v43 = v7->var6.var3 * 0.5;
      v44 = var2 - v43;
      v45 = var2 + v43;
      var0 = v7->var6.var0;
      v47 = v7->var6.var1 * 0.5;
      v48 = var0 - v47;
      v49 = var0 + v47;
      if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport")))
      {
        if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport")))
        {
          v50 = -[WCM_WiFiCellCoexIssueBandTable wifiChannelsToEnableWCI2WiFiEnhForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:pissueBandMatch:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "wifiChannelsToEnableWCI2WiFiEnhForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:pissueBandMatch:", var8, &v238, v44, v45, v48, v49);
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_WiFiEnh: wifiChannelEnhDict = %@"), v50);
          -[WCM_PolicyManager setWifiChannelsToEnableWCI2Gand5G:](self, "setWifiChannelsToEnableWCI2Gand5G:", objc_msgSend(v50, "objectForKey:", CFSTR("wifiChannels2Gand5G")));
          -[WCM_PolicyManager setWifiChannelsToEnableWCI2WiFiEnh:](self, "setWifiChannelsToEnableWCI2WiFiEnh:", objc_msgSend(v50, "objectForKey:", CFSTR("wifiChannelsEnh")));
        }
      }
      else
      {
        -[WCM_PolicyManager setWifiChannelsToEnableWCI2V2:](self, "setWifiChannelsToEnableWCI2V2:", -[WCM_WiFiCellCoexIssueBandTable wifiChannelsToEnableWCI2V2ForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:pissueBandMatch:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "wifiChannelsToEnableWCI2V2ForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:pissueBandMatch:", var8, &v238, v44, v45, v48, v49));
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2_V2: self.wifiChannelsToEnableWCI2V2 = %@"), -[WCM_PolicyManager wifiChannelsToEnableWCI2V2](self, "wifiChannelsToEnableWCI2V2"));
      }
      -[WCM_PolicyManager setWcmCellularCoexBand:](self, "setWcmCellularCoexBand:", v238);
      v3 = -[WCM_PolicyManager cellularCoexBand](self, "cellularCoexBand");
      if ((_DWORD)v3 == 7)
        v8 = v8;
      else
        v8 = 1;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("InCoexBandCheck %d %d %d"), -[WCM_PolicyManager wcmCellularCoexBand](self, "wcmCellularCoexBand"), v3, v8);
      if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiType7LTEMBAntBlocking")))
      {
        -[WCM_PolicyManager setWifiChannelsToEnableLTEMBType7:](self, "setWifiChannelsToEnableLTEMBType7:", -[WCM_WiFiCellCoexIssueBandTable wifiChannelsToEnableLTEMBType7ForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:pissueBandMatchAntIdx:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "wifiChannelsToEnableLTEMBType7ForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:pissueBandMatchAntIdx:", var8, &v237, v44, v45, v48, v49));
        -[WCM_PolicyManager setType7CellAntBlkIdx:](self, "setType7CellAntBlkIdx:", v237);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("LTEMB_Type7 matching band found and issueBandMatchLTEMBType7AntIdx = %d"), v237);
      }
      else
      {
        -[NSMutableArray addObject:](-[WCM_PolicyManager wifiChannelsToEnableLTEMBType7](self, "wifiChannelsToEnableLTEMBType7"), "addObject:", &off_1002308A0);
      }
      if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport")))
      {
        -[WCM_PolicyManager setWifiEnhChannelsToEnableType7MSG:](self, "setWifiEnhChannelsToEnableType7MSG:", -[WCM_WiFiCellCoexIssueBandTable wifiChannelsToEnableType7WiFiEnhForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:pissueBandMatchAntIdx:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "wifiChannelsToEnableType7WiFiEnhForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:pissueBandMatchAntIdx:", var8, &v236, v44, v45, v48, v49));
        -[WCM_PolicyManager setType7WiFiEnhCellAntBlkIdx:](self, "setType7WiFiEnhCellAntBlkIdx:", v236);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WiFiType7_WiFiEnh matching band found and issueBandMatchWiFiEnhType7AntIdx = %d"), v236);
      }
      if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiFVGHzPDHLS")))
      {
        v185 = v8;
        v51 = (id)v13;
        v52 = +[NSMutableArray array](NSMutableArray, "array");
        v53 = -[WCM_WiFiCellCoexIssueBandTable wifiPHSChannelsToBlocklistForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "wifiPHSChannelsToBlocklistForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:", v51, v17, v21, v25, v29);
        v193 = v3;
        if (objc_msgSend(v53, "count"))
        {
          v178 = var8;
          v234 = 0u;
          v235 = 0u;
          v232 = 0u;
          v233 = 0u;
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v232, v250, 16);
          if (v54)
          {
            v55 = v54;
            v56 = *(_QWORD *)v233;
            do
            {
              for (j = 0; j != v55; j = (char *)j + 1)
              {
                if (*(_QWORD *)v233 != v56)
                  objc_enumerationMutation(v53);
                v58 = *(_QWORD *)(*((_QWORD *)&v232 + 1) + 8 * (_QWORD)j);
                if ((objc_msgSend(v52, "containsObject:", v58) & 1) == 0)
                  objc_msgSend(v52, "addObject:", v58);
              }
              v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v232, v250, 16);
            }
            while (v55);
          }
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("PDHLSV2: channel blocklist after combining channels for CC1 %@"), v52);
          v3 = v193;
          var8 = v178;
        }
        v59 = -[WCM_WiFiCellCoexIssueBandTable wifiPHSChannelsToBlocklistV2ForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "wifiPHSChannelsToBlocklistV2ForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:", var8, v44, v45, v48, v49);
        if (objc_msgSend(v59, "count"))
        {
          v230 = 0u;
          v231 = 0u;
          v228 = 0u;
          v229 = 0u;
          v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v228, v249, 16);
          if (v60)
          {
            v61 = v60;
            v62 = *(_QWORD *)v229;
            do
            {
              for (k = 0; k != v61; k = (char *)k + 1)
              {
                if (*(_QWORD *)v229 != v62)
                  objc_enumerationMutation(v59);
                v64 = *(_QWORD *)(*((_QWORD *)&v228 + 1) + 8 * (_QWORD)k);
                if ((objc_msgSend(v52, "containsObject:", v64) & 1) == 0)
                  objc_msgSend(v52, "addObject:", v64);
              }
              v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v228, v249, 16);
            }
            while (v61);
          }
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("PDHLSV2: channel blocklist after combining channels for CC2 %@"), v52);
          v3 = v193;
        }
        -[WCM_PolicyManager setWifiChannelsToBlocklist:](self, "setWifiChannelsToBlocklist:", v52);
        v8 = v185;
        goto LABEL_125;
      }
    }
    else
    {
      -[WCM_PolicyManager setWifiChannelsToEnableWCI2:](self, "setWifiChannelsToEnableWCI2:", -[WCM_WiFiCellCoexIssueBandTable wifiChannelsToEnableWCI2ForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "wifiChannelsToEnableWCI2ForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:", v13, v17, v21, v25, v29));
      -[NSMutableArray addObject:](-[WCM_PolicyManager wifiChannelsToEnableLTEMBType7](self, "wifiChannelsToEnableLTEMBType7"), "addObject:", &off_1002308A0);
    }
    -[WCM_PolicyManager setWifiChannelsToBlocklist:](self, "setWifiChannelsToBlocklist:", -[WCM_WiFiCellCoexIssueBandTable wifiPHSChannelsToBlocklistForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "wifiPHSChannelsToBlocklistForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:", v13, v17, v21, v25, v29));
LABEL_125:
    v194 = v3;
    v187 = v8;
    if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFi5GHzType7NR79AntBlocking")))
    {
      v90 = v7->var7.var2;
      v91 = v7->var7.var3 * 0.5;
      v92 = v90 - v91;
      v93 = v90 + v91;
      v94 = v7->var7.var0;
      v95 = v7->var7.var1 * 0.5;
      -[WCM_PolicyManager setWifi5GHzChannelsToEnableType7MSG:](self, "setWifi5GHzChannelsToEnableType7MSG:", -[WCM_WiFiCellCoexIssueBandTable wifi5GHzChannelsToEnableType7MSGForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "wifi5GHzChannelsToEnableType7MSGForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:", v7->var7.var8, v92, v93, v94 - v95, v94 + v95));
    }
    if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"))|| -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiType7LTEMBAntBlocking")))
    {
      if ((-[NSMutableArray containsObject:](-[WCM_PolicyManager wifiChannelsToEnableLTEMBType7](self, "wifiChannelsToEnableLTEMBType7"), "containsObject:", &off_1002308A0) & 1) != 0)
      {
        if ((-[NSMutableArray containsObject:](-[WCM_PolicyManager wifi5GHzChannelsToEnableType7MSG](self, "wifi5GHzChannelsToEnableType7MSG"), "containsObject:", &off_1002308A0) & 1) != 0)
        {
          if (!-[NSMutableArray count](-[WCM_PolicyManager wifi5GHzChannelsToEnableType7MSGCombined](self, "wifi5GHzChannelsToEnableType7MSGCombined"), "count"))-[NSMutableArray addObject:](-[WCM_PolicyManager wifi5GHzChannelsToEnableType7MSGCombined](self, "wifi5GHzChannelsToEnableType7MSGCombined"), "addObject:", &off_1002308A0);
        }
        else
        {
          -[WCM_PolicyManager setWifi5GHzChannelsToEnableType7MSGCombined:](self, "setWifi5GHzChannelsToEnableType7MSGCombined:", -[WCM_PolicyManager wifi5GHzChannelsToEnableType7MSG](self, "wifi5GHzChannelsToEnableType7MSG"));
          v222 = 0u;
          v223 = 0u;
          v220 = 0u;
          v221 = 0u;
          v102 = -[WCM_PolicyManager wifiChannelsToEnableLTEMBType7](self, "wifiChannelsToEnableLTEMBType7");
          v103 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v102, "countByEnumeratingWithState:objects:count:", &v220, v247, 16);
          if (v103)
          {
            v104 = v103;
            v105 = *(_QWORD *)v221;
            do
            {
              for (m = 0; m != v104; m = (char *)m + 1)
              {
                if (*(_QWORD *)v221 != v105)
                  objc_enumerationMutation(v102);
                v107 = *(_QWORD *)(*((_QWORD *)&v220 + 1) + 8 * (_QWORD)m);
                if ((-[NSMutableArray containsObject:](-[WCM_PolicyManager wifi5GHzChannelsToEnableType7MSGCombined](self, "wifi5GHzChannelsToEnableType7MSGCombined"), "containsObject:", v107) & 1) == 0&& objc_msgSend(&off_100242060, "containsObject:", v107))
                {
                  -[NSMutableArray addObject:](-[WCM_PolicyManager wifi5GHzChannelsToEnableType7MSGCombined](self, "wifi5GHzChannelsToEnableType7MSGCombined"), "addObject:", v107);
                }
              }
              v104 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v102, "countByEnumeratingWithState:objects:count:", &v220, v247, 16);
            }
            while (v104);
          }
        }
      }
      else
      {
        -[WCM_PolicyManager setWifi5GHzChannelsToEnableType7MSGCombined:](self, "setWifi5GHzChannelsToEnableType7MSGCombined:", -[WCM_PolicyManager wifiChannelsToEnableLTEMBType7](self, "wifiChannelsToEnableLTEMBType7"));
        v226 = 0u;
        v227 = 0u;
        v224 = 0u;
        v225 = 0u;
        v96 = -[WCM_PolicyManager wifi5GHzChannelsToEnableType7MSG](self, "wifi5GHzChannelsToEnableType7MSG");
        v97 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v96, "countByEnumeratingWithState:objects:count:", &v224, v248, 16);
        if (v97)
        {
          v98 = v97;
          v99 = *(_QWORD *)v225;
          do
          {
            for (n = 0; n != v98; n = (char *)n + 1)
            {
              if (*(_QWORD *)v225 != v99)
                objc_enumerationMutation(v96);
              v101 = *(_QWORD *)(*((_QWORD *)&v224 + 1) + 8 * (_QWORD)n);
              if ((-[NSMutableArray containsObject:](-[WCM_PolicyManager wifi5GHzChannelsToEnableType7MSGCombined](self, "wifi5GHzChannelsToEnableType7MSGCombined"), "containsObject:", v101) & 1) == 0&& objc_msgSend(&off_100242048, "containsObject:", v101))
              {
                -[NSMutableArray addObject:](-[WCM_PolicyManager wifi5GHzChannelsToEnableType7MSGCombined](self, "wifi5GHzChannelsToEnableType7MSGCombined"), "addObject:", v101);
              }
            }
            v98 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v96, "countByEnumeratingWithState:objects:count:", &v224, v248, 16);
          }
          while (v98);
        }
      }
      if ((-[NSMutableArray containsObject:](-[WCM_PolicyManager wifiChannelsToEnableLTEMBType7](self, "wifiChannelsToEnableLTEMBType7"), "containsObject:", &off_1002308A0) & 1) != 0)
      {
        if (!-[NSMutableArray count](-[WCM_PolicyManager wifi2GHzChannelsToEnableType7MSGCombined](self, "wifi2GHzChannelsToEnableType7MSGCombined"), "count"))-[NSMutableArray addObject:](-[WCM_PolicyManager wifi2GHzChannelsToEnableType7MSGCombined](self, "wifi2GHzChannelsToEnableType7MSGCombined"), "addObject:", &off_1002308A0);
      }
      else
      {
        v218 = 0u;
        v219 = 0u;
        v216 = 0u;
        v217 = 0u;
        v108 = -[WCM_PolicyManager wifiChannelsToEnableLTEMBType7](self, "wifiChannelsToEnableLTEMBType7");
        v109 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v108, "countByEnumeratingWithState:objects:count:", &v216, v246, 16);
        if (v109)
        {
          v110 = v109;
          v111 = *(_QWORD *)v217;
          do
          {
            for (ii = 0; ii != v110; ii = (char *)ii + 1)
            {
              if (*(_QWORD *)v217 != v111)
                objc_enumerationMutation(v108);
              v113 = *(_QWORD *)(*((_QWORD *)&v216 + 1) + 8 * (_QWORD)ii);
              if ((-[NSMutableArray containsObject:](-[WCM_PolicyManager wifi2GHzChannelsToEnableType7MSGCombined](self, "wifi2GHzChannelsToEnableType7MSGCombined"), "containsObject:", v113) & 1) == 0&& objc_msgSend(&off_100242078, "containsObject:", v113))
              {
                -[NSMutableArray addObject:](-[WCM_PolicyManager wifi2GHzChannelsToEnableType7MSGCombined](self, "wifi2GHzChannelsToEnableType7MSGCombined"), "addObject:", v113);
              }
            }
            v110 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v108, "countByEnumeratingWithState:objects:count:", &v216, v246, 16);
          }
          while (v110);
        }
      }
    }
    if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("Type72GWiFiSupport")))
    {
      v114 = v7->var8.var8;
      v115 = v7->var8.var2;
      v116 = v7->var8.var3 * 0.5;
      v117 = v115 - v116;
      v118 = v115 + v116;
      v119 = v7->var8.var0;
      v120 = v7->var8.var1 * 0.5;
      v121 = v119 - v120;
      v122 = v119 + v120;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("TYPE7_2GWIFI_SUPPORT_: Band7 Cell info: BandType: bandinfoType(0x%x) downlink(%lf ~ %lf) uplink(%lf ~ %lf)"), v114, *(_QWORD *)&v117, *(_QWORD *)&v118, v119 - v120, v119 + v120);
      -[WCM_PolicyManager setWifi2GHzLTEB7IMD3ChannelsEnableType7:](self, "setWifi2GHzLTEB7IMD3ChannelsEnableType7:", -[WCM_WiFiCellCoexIssueBandTable wifi2GHzLTEB7IMD3EnableType7ForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v5, "wcmWiFiCellCoexIssueTable"), "wifi2GHzLTEB7IMD3EnableType7ForCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:", v114, v117, v118, v121, v122));
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("TYPE7_2GWIFI_SUPPORT_: 2.4GHz Channels to enable Type7 MSG due to LTEB7 IMD issue = %@"), -[WCM_PolicyManager wifi2GHzLTEB7IMD3ChannelsEnableType7](self, "wifi2GHzLTEB7IMD3ChannelsEnableType7"));
    }
    v8 = v187;
    v3 = v194;
    v13 = v183;
    goto LABEL_170;
  }
  v192 = v3;
  switch((int)v3)
  {
    case 0:
      v36 = -[WCM_PlatformManager wcmWiFiB7BlocklistChannels](v5, "wcmWiFiB7BlocklistChannels");
      v37 = -[WCM_PlatformManager wcmWiFiB7WCI2EnabledChannels](v5, "wcmWiFiB7WCI2EnabledChannels");
      v38 = -[WCM_PlatformManager wcmBTB7AFHMap](v5, "wcmBTB7AFHMap");
      goto LABEL_72;
    case 1:
      v36 = -[WCM_PlatformManager wcmWiFiB40ABlocklistChannels](v5, "wcmWiFiB40ABlocklistChannels");
      v37 = -[WCM_PlatformManager wcmWiFiB40AWCI2EnabledChannels](v5, "wcmWiFiB40AWCI2EnabledChannels");
      v38 = -[WCM_PlatformManager wcmBTB40AAFHMap](v5, "wcmBTB40AAFHMap");
      goto LABEL_72;
    case 2:
      v36 = -[WCM_PlatformManager wcmWiFiB40BBlocklistChannels](v5, "wcmWiFiB40BBlocklistChannels");
      v37 = -[WCM_PlatformManager wcmWiFiB40BWCI2EnabledChannels](v5, "wcmWiFiB40BWCI2EnabledChannels");
      v38 = -[WCM_PlatformManager wcmBTB40BAFHMap](v5, "wcmBTB40BAFHMap");
      goto LABEL_72;
    case 3:
      v36 = -[WCM_PlatformManager wcmWiFiB41A1BlocklistChannels](v5, "wcmWiFiB41A1BlocklistChannels");
      v37 = -[WCM_PlatformManager wcmWiFiB41A1WCI2EnabledChannels](v5, "wcmWiFiB41A1WCI2EnabledChannels");
      v38 = -[WCM_PlatformManager wcmBTB41A1AFHMap](v5, "wcmBTB41A1AFHMap");
      goto LABEL_72;
    case 4:
      v36 = -[WCM_PlatformManager wcmWiFiB41A2BlocklistChannels](v5, "wcmWiFiB41A2BlocklistChannels");
      v37 = -[WCM_PlatformManager wcmWiFiB41A2WCI2EnabledChannels](v5, "wcmWiFiB41A2WCI2EnabledChannels");
      v38 = -[WCM_PlatformManager wcmBTB41A2AFHMap](v5, "wcmBTB41A2AFHMap");
LABEL_72:
      v65 = v38;
      break;
    default:
      v65 = -[WCM_PlatformManager wcmBTAFHMapDefault](v5, "wcmBTAFHMapDefault");
      v36 = (NSArray *)&off_1002420A8;
      v37 = (NSArray *)&off_1002420C0;
      break;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("BT AFH channel bitmap %@"), v65);
  -[WCM_PolicyManager setBtPreferredChannelMap:](self, "setBtPreferredChannelMap:", v65);
  -[WCM_PolicyManager setBtPreferredChannelMapOnGpsRadioActive:](self, "setBtPreferredChannelMapOnGpsRadioActive:", v65);
  v186 = v8;
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiWCI2BitmapV2Enabled")))
  {
    -[WCM_PolicyManager setWifiChannelsToEnableWCI2V2:](self, "setWifiChannelsToEnableWCI2V2:", +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v37));
  }
  else
  {
    -[WCM_PolicyManager setWifiChannelsToEnableWCI2:](self, "setWifiChannelsToEnableWCI2:", v37);
  }
  v66 = +[NSMutableArray array](NSMutableArray, "array");
  v67 = -[WCM_PolicyManager legacyWiFiChannelsToAvoidForIMD3Cell](self, "legacyWiFiChannelsToAvoidForIMD3Cell");
  if (objc_msgSend(v67, "count"))
  {
    v210 = 0u;
    v211 = 0u;
    v208 = 0u;
    v209 = 0u;
    v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v208, v244, 16);
    if (v68)
    {
      v69 = v68;
      v70 = *(_QWORD *)v209;
      do
      {
        for (jj = 0; jj != v69; jj = (char *)jj + 1)
        {
          if (*(_QWORD *)v209 != v70)
            objc_enumerationMutation(v67);
          v72 = *(_QWORD *)(*((_QWORD *)&v208 + 1) + 8 * (_QWORD)jj);
          if ((objc_msgSend(v66, "containsObject:", v72) & 1) == 0)
            objc_msgSend(v66, "addObject:", v72);
        }
        v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v208, v244, 16);
      }
      while (v69);
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("blocklist channels after combining channels for IMD3 Cell %@"), v66);
  }
  v73 = -[WCM_PolicyManager legacyWiFiChannelsToAvoidFor3FoWiFi](self, "legacyWiFiChannelsToAvoidFor3FoWiFi");
  if (objc_msgSend(v73, "count"))
  {
    v206 = 0u;
    v207 = 0u;
    v204 = 0u;
    v205 = 0u;
    v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v204, v243, 16);
    if (v74)
    {
      v75 = v74;
      v76 = *(_QWORD *)v205;
      do
      {
        for (kk = 0; kk != v75; kk = (char *)kk + 1)
        {
          if (*(_QWORD *)v205 != v76)
            objc_enumerationMutation(v73);
          v78 = *(_QWORD *)(*((_QWORD *)&v204 + 1) + 8 * (_QWORD)kk);
          if ((objc_msgSend(v66, "containsObject:", v78) & 1) == 0)
            objc_msgSend(v66, "addObject:", v78);
        }
        v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v204, v243, 16);
      }
      while (v75);
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("blocklist channels after combining channels for 3Fo WiFi %@"), v66);
  }
  -[WCM_PolicyManager setLegacyWiFiBlocklistChannelsFor3FoWiFi:](self, "setLegacyWiFiBlocklistChannelsFor3FoWiFi:", v73);
  v79 = -[WCM_PolicyManager legacyWiFiChannelsToAvoidForIMD2GPS](self, "legacyWiFiChannelsToAvoidForIMD2GPS");
  v200 = 0u;
  v201 = 0u;
  v202 = 0u;
  v203 = 0u;
  v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v200, v242, 16);
  if (v80)
  {
    v81 = v80;
    v82 = *(_QWORD *)v201;
    do
    {
      for (mm = 0; mm != v81; mm = (char *)mm + 1)
      {
        if (*(_QWORD *)v201 != v82)
          objc_enumerationMutation(v79);
        v84 = *(_QWORD *)(*((_QWORD *)&v200 + 1) + 8 * (_QWORD)mm);
        if ((objc_msgSend(v66, "containsObject:", v84) & 1) == 0)
          objc_msgSend(v66, "addObject:", v84);
      }
      v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v200, v242, 16);
    }
    while (v81);
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("blocklist channels after combining channels for IMD2 GPS %@"), v66);
  if (!-[NSArray isEqualToArray:](v36, "isEqualToArray:", &off_1002420D8))
  {
    v198 = 0u;
    v199 = 0u;
    v196 = 0u;
    v197 = 0u;
    v85 = -[NSArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v196, v241, 16);
    if (v85)
    {
      v86 = v85;
      v87 = *(_QWORD *)v197;
      do
      {
        for (nn = 0; nn != v86; nn = (char *)nn + 1)
        {
          if (*(_QWORD *)v197 != v87)
            objc_enumerationMutation(v36);
          v89 = *(_QWORD *)(*((_QWORD *)&v196 + 1) + 8 * (_QWORD)nn);
          if ((objc_msgSend(v66, "containsObject:", v89) & 1) == 0)
            objc_msgSend(v66, "addObject:", v89);
        }
        v86 = -[NSArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v196, v241, 16);
      }
      while (v86);
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("blocklist channels after combined with wifiBlocklistChannelsForOOB: %@"), v66);
  }
  if (sub_10007C264(v66))
  {
    objc_msgSend(v66, "removeObject:", &off_100230D08);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("removed channel 11, now blocklist is %@"), v66);
  }
  objc_msgSend(v66, "sortUsingComparator:", &stru_1002051E0);
  v8 = v186;
  if (!objc_msgSend(v66, "count"))
    objc_msgSend(v66, "addObject:", &off_1002308A0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("WiFi channels to blocklist %@"), v66);
  -[WCM_PolicyManager setWifiChannelsToBlocklist:](self, "setWifiChannelsToBlocklist:", v66);
  v3 = v192;
LABEL_256:
  objc_autoreleasePoolPop(context);
  if ((_DWORD)v3 == 1)
    v159 = -[WCM_PlatformManager wcmCellularWCI2ModeRBThresholdHigh](v5, "wcmCellularWCI2ModeRBThresholdHigh");
  else
    v159 = -[WCM_PlatformManager wcmCellularWCI2ModeRBThresholdLow](v5, "wcmCellularWCI2ModeRBThresholdLow");
  -[WCM_CellularController updateRBThreshold:](v4, "updateRBThreshold:", -[NSNumber intValue](v159, "intValue"));
  -[WCM_PolicyManager configureForLTECDRXWiFiTimeSharing](self, "configureForLTECDRXWiFiTimeSharing");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("configureAllWCI2 gets called with input (inCoexBand: %d)"), v8);
  -[WCM_PolicyManager configureAllWCI2:](self, "configureAllWCI2:", v8);
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("PencilCoexSupport")))
  {
    -[WCM_PolicyManager updatePencilCoexActivationCondition](self, "updatePencilCoexActivationCondition");
    -[WCM_PolicyManager handleWiFiBTCoexChange](self, "handleWiFiBTCoexChange");
    -[WCM_PolicyManager configureWifiAntennaSelectionForCoex](self, "configureWifiAntennaSelectionForCoex");
    -[WCM_PolicyManager configureBTAntennaSelection](self, "configureBTAntennaSelection");
  }
  else
  {
    -[WCM_PolicyManager configureWifiAntennaSelectionForCoex](self, "configureWifiAntennaSelectionForCoex");
  }
  -[WCM_PolicyManager updateCellTxPowerLimit](self, "updateCellTxPowerLimit");
  if (-[WCM_BTController powerState](-[WCM_PolicyManager btController](self, "btController"), "powerState"))
  {
    v160 = v8;
    v161 = -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("BTDiversityAFHMap"));
    v162 = -[WCM_PolicyManager gpsRadioActive](self, "gpsRadioActive");
    if (v161)
    {
      v163 = -[WCM_PolicyManager btController](self, "btController");
      if (v162)
      {
        v164 = -[WCM_PolicyManager btDiversityChannelMapOnGpsRadioActiveForC0B0](self, "btDiversityChannelMapOnGpsRadioActiveForC0B0");
        v165 = -[WCM_PolicyManager btDiversityChannelMapOnGpsRadioActiveForC0B1](self, "btDiversityChannelMapOnGpsRadioActiveForC0B1");
        v166 = -[WCM_PolicyManager btDiversityChannelMapOnGpsRadioActiveForC1B0](self, "btDiversityChannelMapOnGpsRadioActiveForC1B0");
        v167 = -[WCM_PolicyManager btDiversityChannelMapOnGpsRadioActiveForC1B1](self, "btDiversityChannelMapOnGpsRadioActiveForC1B1");
      }
      else
      {
        v164 = -[WCM_PolicyManager btDiversityChannelMapForC0B0](self, "btDiversityChannelMapForC0B0");
        v165 = -[WCM_PolicyManager btDiversityChannelMapForC0B1](self, "btDiversityChannelMapForC0B1");
        v166 = -[WCM_PolicyManager btDiversityChannelMapForC1B0](self, "btDiversityChannelMapForC1B0");
        v167 = -[WCM_PolicyManager btDiversityChannelMapForC1B1](self, "btDiversityChannelMapForC1B1");
      }
      -[WCM_BTController updateDiversityAFHMapForC0B0:C0B1:C1B0:C1B1:](v163, "updateDiversityAFHMapForC0B0:C0B1:C1B0:C1B1:", v164, v165, v166, v167);
    }
    else
    {
      if (v162)
        v168 = -[WCM_PolicyManager btPreferredChannelMapOnGpsRadioActive](self, "btPreferredChannelMapOnGpsRadioActive");
      else
        v168 = -[WCM_PolicyManager btPreferredChannelMap](self, "btPreferredChannelMap");
      v169 = v168;
      if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("hpcellularstatemonitorsupport")))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HPCellular (handleCellularNetworkUpdate): Bool flag self.hpCellNeed2SetBTAFH = (%d), Fixed AFH self.btPreferredChannelMapHPCellularActive = (%@)."), -[WCM_PolicyManager hpCellNeed2SetBTAFH](self, "hpCellNeed2SetBTAFH"), -[WCM_PolicyManager btPreferredChannelMapHPCellularActive](self, "btPreferredChannelMapHPCellularActive"));
        if (-[WCM_PolicyManager hpCellNeed2SetBTAFH](self, "hpCellNeed2SetBTAFH"))
          v169 = -[WCM_PolicyManager btPreferredChannelMapHPCellularActive](self, "btPreferredChannelMapHPCellularActive");
      }
      -[WCM_BTController updatePreferredAFHMap:](-[WCM_PolicyManager btController](self, "btController"), "updatePreferredAFHMap:", v169);
    }
    if (_os_feature_enabled_impl("wirelessradiomanager", "HFBTEnhancement")
      && -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("HFBTCoex")))
    {
      v170 = -[WCM_PolicyManager btPreferred5GChannelMap](self, "btPreferred5GChannelMap");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("HFAFHDebug_ Update channel bitmap"));
      -[WCM_BTController updatePreferredHFBTChannelMap:](-[WCM_PolicyManager btController](self, "btController"), "updatePreferredHFBTChannelMap:", v170);
    }
    if (_os_feature_enabled_impl("wirelessradiomanager", "HFBTEnhancement")
      && -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("HFBTCoex")))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HFBTAntBlkDebug_ Current enabled bands = %@"), -[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands"));
      v171 = -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("HFBTConditionId"));
      v172 = -[WCM_PolicyManager btController](self, "btController");
      v173 = -[WCM_PolicyManager btAntBlockDuration](self, "btAntBlockDuration");
      v174 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands"), "objectForKeyedSubscript:", CFSTR("AntBlkBandUnii1Enabled")), "BOOLValue");
      v175 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands"), "objectForKeyedSubscript:", CFSTR("AntBlkBandUnii3Enabled")), "BOOLValue");
      contexta = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands"), "objectForKeyedSubscript:", CFSTR("AntBlkBandUnii5aEnabled")), "BOOLValue");
      v189 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands"), "objectForKeyedSubscript:", CFSTR("AntBlkBandUnii5bEnabled")), "BOOLValue");
      v184 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands"), "objectForKeyedSubscript:", CFSTR("AntBlkBandUnii5cEnabled")), "BOOLValue");
      LOBYTE(v177) = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands"), "objectForKeyedSubscript:", CFSTR("AntBlkBandUnii5dEnabled")), "BOOLValue");
      if (v171)
        -[WCM_BTController updateHFBtAntennaRequestWithDuration:unii1Enabled:unii3Enabled:unii5aEnabled:unii5bEnabled:unii5cEnabled:unii5dEnabled:unii1ConditionId:unii3ConditionId:unii5aConditionId:unii5bConditionId:unii5cConditionId:unii5dConditionId:](v172, "updateHFBtAntennaRequestWithDuration:unii1Enabled:unii3Enabled:unii5aEnabled:unii5bEnabled:unii5cEnabled:unii5dEnabled:unii1ConditionId:unii3ConditionId:unii5aConditionId:unii5bConditionId:unii5cConditionId:unii5dConditionId:", v173, v174, v175, contexta, v189, v184, v177, objc_msgSend(&off_100230CC0, "unsignedIntValue"), objc_msgSend(&off_100230CC0, "unsignedIntValue"), objc_msgSend(&off_100230CD8, "unsignedIntValue"), objc_msgSend(&off_100230CD8, "unsignedIntValue"), objc_msgSend(&off_100230CD8, "unsignedIntValue"), objc_msgSend(&off_100230CD8, "unsignedIntValue"));
      else
        -[WCM_BTController updateHFBtAntennaRequestWithDuration:unii1Enabled:unii3Enabled:unii5aEnabled:unii5bEnabled:unii5cEnabled:unii5dEnabled:](v172, "updateHFBtAntennaRequestWithDuration:unii1Enabled:unii3Enabled:unii5aEnabled:unii5bEnabled:unii5cEnabled:unii5dEnabled:", v173, v174, v175, contexta, v189, v184, v177);
    }
    if (-[WCM_BTController getBTState](-[WCM_PolicyManager btController](self, "btController"), "getBTState") == 2)
      -[WCM_BTController updatePreferredRole:](-[WCM_PolicyManager btController](self, "btController"), "updatePreferredRole:", -[WCM_PolicyManager btPreferredRole](self, "btPreferredRole"));
    if (-[WCM_PolicyManager cellularWCI2CoexPolicyBitmap](self, "cellularWCI2CoexPolicyBitmap"))
      v176 = v160;
    else
      v176 = 0;
    if (v176 == 1)
      -[WCM_BTController updateMWSFrameConfig:](-[WCM_PolicyManager btController](self, "btController"), "updateMWSFrameConfig:", v4);
    -[WCM_BTController updateMWSChannelParameters:](-[WCM_PolicyManager btController](self, "btController"), "updateMWSChannelParameters:", v4);
    if ((v160 & 1) == 0)
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("ZeroFreqDebug: For non-coex scenario (including RRC idle), WRM pass actual frequences instead of zeros to BT, inCoexBand= %d"), 0);
    if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WifiBtAgcCoexMode")))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("CrashDebug_ 1st place self.btAgcCoexModeEnable is %ld"), -[NSNumber integerValue](-[WCM_PolicyManager btAgcCoexModeEnable](self, "btAgcCoexModeEnable"), "integerValue"));
      -[WCM_BTController updateCoexRxGainMode:](-[WCM_PolicyManager btController](self, "btController"), "updateCoexRxGainMode:", -[WCM_PolicyManager btAgcCoexModeEnable](self, "btAgcCoexModeEnable"));
    }
  }
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WifiGen9rFemConfig")))
  {
    -[WCM_PolicyManager evaluateGen9rFemConfig](self, "evaluateGen9rFemConfig");
  }
  if (-[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState"))
    -[WCM_PolicyManager handleWiFiConfigChange](self, "handleWiFiConfigChange");
  -[WCM_PolicyManager handleFTCall](self, "handleFTCall");
  -[WCM_PolicyManager updateCoexMonitorState:](self, "updateCoexMonitorState:", v3);
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("hpcellularstatemonitorsupport")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HPCellular: Calling [self queryHPCellularInitialState] from handleCellularNetworkUpdate."));
    -[WCM_PolicyManager queryHPCellularInitialState](self, "queryHPCellularInitialState");
  }
}

- (void)queryHPCellularInitialState
{
  WCM_HPCellularStateMonitor *v3;
  WCM_HPCellularStateMonitor *v4;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HPCellular: queryHPCellularInitialState getting called."));
  v3 = -[WCM_PolicyManager hpCellularMonitor](self, "hpCellularMonitor");
  if (v3)
  {
    v4 = v3;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HPCellular: Accessing WCM_HPCellularStateMonitor intance self.hpCellularMonitor in WCM_PolicyManager.m is successful."));
    if (-[WCM_HPCellularStateMonitor start](v4, "start"))
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HPCellular: Initial queryHPCellularInitialState is success. HPCellular status printed"), 1);
  }
}

- (void)handleHPCellularStateUpdate:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSData *v6;
  NSData *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a3;
  if (-[WCM_PolicyManager isInHpSession](self, "isInHpSession") || !v3)
  {
    if (-[WCM_PolicyManager isInHpSession](self, "isInHpSession") && !v3)
      -[WCM_PolicyManager handleHPCellularSessionEnd](self, "handleHPCellularSessionEnd");
  }
  else
  {
    -[WCM_PolicyManager handleHPCellularSessionStart](self, "handleHPCellularSessionStart");
  }
  -[WCM_PolicyManager setIsInHpSession:](self, "setIsInHpSession:", v3);
  v5 = objc_autoreleasePoolPush();
  if (-[WCM_PolicyManager hpCellNeed2SetBTAFH](self, "hpCellNeed2SetBTAFH") == v3)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HPCellular: Duplicated indications: self.hpCellNeed2SetBTAFH=%d is equal to hpCellularStateActive=%d. Skip sending indication to BT host."), -[WCM_PolicyManager hpCellNeed2SetBTAFH](self, "hpCellNeed2SetBTAFH"), v3);
  }
  else if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("hpcellularstatemonitorsupport")))
  {
    -[WCM_PolicyManager setHpCellNeed2SetBTAFH:](self, "setHpCellNeed2SetBTAFH:", v3);
    if (-[WCM_PolicyManager gpsRadioActive](self, "gpsRadioActive"))
      v6 = -[WCM_PolicyManager btPreferredChannelMapOnGpsRadioActive](self, "btPreferredChannelMapOnGpsRadioActive");
    else
      v6 = -[WCM_PolicyManager btPreferredChannelMap](self, "btPreferredChannelMap");
    v7 = v6;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HPCellular (handleHPCellularStateUpdate): Bool flag self.hpCellNeed2SetBTAFH = (%d), Fixed AFH self.btPreferredChannelMapHPCellularActive = (%@)."), -[WCM_PolicyManager hpCellNeed2SetBTAFH](self, "hpCellNeed2SetBTAFH"), -[WCM_PolicyManager btPreferredChannelMapHPCellularActive](self, "btPreferredChannelMapHPCellularActive"));
    if (-[WCM_PolicyManager hpCellNeed2SetBTAFH](self, "hpCellNeed2SetBTAFH"))
      v7 = -[WCM_PolicyManager btPreferredChannelMapHPCellularActive](self, "btPreferredChannelMapHPCellularActive");
    -[WCM_BTController updatePreferredAFHMap:](-[WCM_PolicyManager btController](self, "btController"), "updatePreferredAFHMap:", v7);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HPCellular: Sending indication to BT host with HPCellular session status as %d."), v3);
    -[WCM_BTController updateHPCellularSessionStatus:](-[WCM_PolicyManager btController](self, "btController"), "updateHPCellularSessionStatus:", -[WCM_PolicyManager hpCellNeed2SetBTAFH](self, "hpCellNeed2SetBTAFH"));
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("HPCellular: handleHPCellularStateUpdate gets called but HPCellularStateMonitorSupport feature flag is missing for this device. Not expected."), v8, v9);
  }
  objc_autoreleasePoolPop(v5);
}

- (void)updateHPCellularMetric
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HPCellularCA: Update HPCellular Metric"));
  if (-[WCM_PolicyManager btController](self, "btController"))
  {
    v3 = -[NSMutableArray count](-[WCM_BTController btConnections](-[WCM_PolicyManager btController](self, "btController"), "btConnections"), "count");
    v4 = -[WCM_BTController getNum2GHzAclA2DPDevices](-[WCM_PolicyManager btController](self, "btController"), "getNum2GHzAclA2DPDevices");
    v5 = -[WCM_BTController numeSCODevice](-[WCM_PolicyManager btController](self, "btController"), "numeSCODevice");
    v6 = -[WCM_BTController numSCODevice](-[WCM_PolicyManager btController](self, "btController"), "numSCODevice");
    v7 = -[WCM_BTController numHIDDevice](-[WCM_PolicyManager btController](self, "btController"), "numHIDDevice");
    v8 = -[WCM_BTController numLEDevice](-[WCM_PolicyManager btController](self, "btController"), "numLEDevice");
    v9 = -[WCM_BTController numLEADevice](-[WCM_PolicyManager btController](self, "btController"), "numLEADevice");
    v10 = -[WCM_BTController numLLADevice](-[WCM_PolicyManager btController](self, "btController"), "numLLADevice");
  }
  else
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v3 = 0;
  }
  objc_msgSend(+[WCM_HPCellular_CoreAnalyticsService singleton](WCM_HPCellular_CoreAnalyticsService, "singleton"), "updateHPCellularCoexStatsWithBtDeviceCount:a2dpDeviceCount:escoDeviceCount:scoDeviceCount:hidDeviceCount:leDeviceCount:leaDeviceCount:llaDeviceCount:", v3, v4, v5, v6, v7, v8, v9, v10);
}

- (void)handleHPCellularSessionStart
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HPCellularCA: Handle session start."));
  objc_msgSend(+[WCM_HPCellular_CoreAnalyticsService singleton](WCM_HPCellular_CoreAnalyticsService, "singleton"), "resetHPCellularCoexStatsMetrics");
  -[WCM_PolicyManager updateHPCellularMetric](self, "updateHPCellularMetric");
}

- (void)handleHPCellularSessionEnd
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HPCellularCA: Handle session end."));
  -[WCM_PolicyManager updateHPCellularMetric](self, "updateHPCellularMetric");
  objc_msgSend(+[WCM_HPCellular_CoreAnalyticsService singleton](WCM_HPCellular_CoreAnalyticsService, "singleton"), "submitHPCellularCoexStats");
}

- (void)handleCallLQMStateChangeType7:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableArray *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  _BOOL8 v9;
  uint64_t v10;
  id v11;
  id v12;
  int v13;
  unsigned __int8 v14;
  NSMutableArray *v15;
  NSMutableArray *v16;
  const __CFString *v17;
  NSMutableArray *v18;
  NSMutableArray *v19;

  v3 = a3;
  v5 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", -[WCM_PolicyManager wifi2GHzChannelsToEnableType7MSGCombined](self, "wifi2GHzChannelsToEnableType7MSGCombined"));
  v6 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", -[WCM_PolicyManager wifi5GHzChannelsToEnableType7MSGCombined](self, "wifi5GHzChannelsToEnableType7MSGCombined"));
  v7 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", &off_1002420F0);
  v8 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", &off_100242108);
  v9 = -[WCM_PolicyManager callActiveState](self, "callActiveState");
  v10 = -[WCM_PolicyManager dataLqmState](self, "dataLqmState");
  if (v3)
  {
    v11 = -[NSMutableArray isEqualToArray:](v5, "isEqualToArray:", v7);
    v12 = -[NSMutableArray isEqualToArray:](v6, "isEqualToArray:", v8);
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR(" handleCallLQMStateChangeType7 : %d %d %d %d "), v9, (int)v10, v11, v12);
  v13 = (int)v10 < 50 || v9;
  v14 = -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"));
  v19 = v7;
  if (v13 != 1)
  {
    if ((v14 & 1) == 0
      && !-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiType7LTEMBAntBlocking")))
    {
      v15 = v5;
      v16 = v6;
      v17 = CFSTR("Combined WiFi bitmap for Type7 MSG (extended from LTEMB Only):: callActiveState=%d, lqmCurrent = %d compared to lqmThreshold = %d. Thus using Snapshot version instead of NoProtection version: wifi2GHzChannelType7Snapshot=%@, wifi5GHzChannelType7Snapshot=%@, wifi2GHzChannelType7NoProtection=%@, wifi5GHzChannelType7NoProtection=%@, skipIOVARAssert_2GHz=%d, skipIOVARAssert_5GHz=%d");
      goto LABEL_22;
    }
    v15 = v5;
    if ((v12 & 1) == 0)
      -[WCM_WiFiController updateChannelsToEnableType7MSG:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateChannelsToEnableType7MSG:", v6);
    v16 = v6;
    v17 = CFSTR("Combined WiFi bitmap for Type7 MSG (extended from LTEMB Only):: callActiveState=%d, lqmCurrent = %d compared to lqmThreshold = %d. Thus using Snapshot version instead of NoProtection version: wifi2GHzChannelType7Snapshot=%@, wifi5GHzChannelType7Snapshot=%@, wifi2GHzChannelType7NoProtection=%@, wifi5GHzChannelType7NoProtection=%@, skipIOVARAssert_2GHz=%d, skipIOVARAssert_5GHz=%d");
    v18 = v15;
    if ((v11 & 1) != 0)
      goto LABEL_22;
LABEL_19:
    -[WCM_WiFiController updateChannelsToEnableType7MSG2GWiFi:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateChannelsToEnableType7MSG2GWiFi:", v18);
    goto LABEL_22;
  }
  v15 = v5;
  if ((v14 & 1) == 0
    && !-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiType7LTEMBAntBlocking")))
  {
    v16 = v6;
    v17 = CFSTR("Combined WiFi bitmap for Type7 MSG (extended from LTEMB Only): callActiveState=%d, lqmCurrent = %d compared to lqmThreshold = %d. Thus using NoProtection instead of Snapshot version: wifi2GHzChannelType7Snapshot=%@, wifi5GHzChannelType7Snapshot=%@, wifi2GHzChannelType7NoProtection=%@, wifi5GHzChannelType7NoProtection=%@, skipIOVARAssert_2GHz=%d, skipIOVARAssert_5GHz=%d");
    goto LABEL_22;
  }
  v16 = v6;
  if ((v12 & 1) == 0)
    -[WCM_WiFiController updateChannelsToEnableType7MSG:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateChannelsToEnableType7MSG:", v8);
  v17 = CFSTR("Combined WiFi bitmap for Type7 MSG (extended from LTEMB Only): callActiveState=%d, lqmCurrent = %d compared to lqmThreshold = %d. Thus using NoProtection instead of Snapshot version: wifi2GHzChannelType7Snapshot=%@, wifi5GHzChannelType7Snapshot=%@, wifi2GHzChannelType7NoProtection=%@, wifi5GHzChannelType7NoProtection=%@, skipIOVARAssert_2GHz=%d, skipIOVARAssert_5GHz=%d");
  v18 = v19;
  if ((v11 & 1) == 0)
    goto LABEL_19;
LABEL_22:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, v17, v9, v10, 50, v15, v16, v19, v8, v11, v12);
}

- (void)handleCallLQMStateChangeType7WiFiEnh:(BOOL)a3
{
  id v3;
  NSMutableArray *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  _BOOL8 v9;
  uint64_t v10;
  id v11;
  int v12;
  const __CFString *v13;

  v3 = (id)a3;
  v5 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", -[WCM_PolicyManager wifi2GHzChannelsToEnableType7MSGCombined](self, "wifi2GHzChannelsToEnableType7MSGCombined"));
  -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", -[WCM_PolicyManager wifi5GHzChannelsToEnableType7MSGCombined](self, "wifi5GHzChannelsToEnableType7MSGCombined"));
  v6 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", -[WCM_PolicyManager wifiEnhChannelsToEnableType7MSG](self, "wifiEnhChannelsToEnableType7MSG"));
  v7 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", &off_100242120);
  v8 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", &off_100242138);
  v9 = -[WCM_PolicyManager callActiveState](self, "callActiveState");
  v10 = -[WCM_PolicyManager dataLqmState](self, "dataLqmState");
  if ((_DWORD)v3)
  {
    v3 = -[NSMutableArray isEqualToArray:](v5, "isEqualToArray:", v7);
    v11 = -[NSMutableArray isEqualToArray:](v6, "isEqualToArray:", v8);
  }
  else
  {
    v11 = 0;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WiFiType7_WiFiEnh: handleCallLQMStateChangeType7Enh: callActiveState=%d, lqmCurrent=%d, skipIOVARAssert_2G5G=%d, skipIOVARAssert_Enh=%d, skipIOVARAssert_Enh=%d"), v9, (int)v10, v3, v11);
  if ((-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"))|| -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiType7LTEMBAntBlocking"))|| -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("Type72GWiFiSupport")))&& -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport")))
  {
    v12 = (int)v10 < 50 || v9;
    if (v12 == 1)
    {
      if ((v3 & v11 & 1) == 0)
        -[WCM_WiFiController updateChannelsToEnableType7MSGWiFiEnh:WiFiEnhChannels:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateChannelsToEnableType7MSGWiFiEnh:WiFiEnhChannels:", v7, v8);
      v13 = CFSTR("WiFiType7_WiFiEnh Combined WiFi bitmap for Type7 MSG: callActiveState=%d, lqmCurrent = %d compared to lqmThreshold = %d. Thus using NoProtection instead of Snapshot version: wifi2G5GChannelType7Snapshot=%@, wifiEnhChannelType7Snapshot=%@, wifi2G5GChannelType7NoProtection=%@, wifiEnhChannelType7NoProtection=%@, skipIOVARAssert_2G5G=%d, skipIOVARAssert_Enh=%d");
    }
    else
    {
      if ((v3 & v11 & 1) == 0)
        -[WCM_WiFiController updateChannelsToEnableType7MSGWiFiEnh:WiFiEnhChannels:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateChannelsToEnableType7MSGWiFiEnh:WiFiEnhChannels:", v5, v6);
      v13 = CFSTR("Combined WiFi bitmap for Type7 MSG (extended from LTEMB Only):: callActiveState=%d, lqmCurrent = %d compared to lqmThreshold = %d. Thus using Snapshot version instead of NoProtection version: wifi2G5GChannelType7Snapshot=%@, wifiEnhChannelType7Snapshot=%@, wifi2G5GChannelType7NoProtection=%@, wifiEnhChannelType7NoProtection=%@, skipIOVARAssert_2G5G=%d, skipIOVARAssert_Enh=%d");
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, v13, v9, v10, 50, v5, v6, v7, v8, v3, v11);
  }
}

- (void)handleFTCall
{
  uint64_t v3;
  WCM_CellularController *v4;
  const char *v5;
  unsigned int v6;
  unsigned int v7;
  WCM_WiFiController *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = -[WCM_PolicyManager cellularCoexBand](self, "cellularCoexBand");
  v4 = -[WCM_PolicyManager cellularController](self, "cellularController");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Facetime update coexBand(%d)"), v3);
  v5 = "FT off";
  if (-[WCM_PolicyManager ftController](self, "ftController")
    && -[WCM_FTController getFTState](-[WCM_PolicyManager ftController](self, "ftController"), "getFTState"))
  {
    v5 = "FT on";
  }
  if (-[WCM_PolicyManager btController](self, "btController"))
  {
    v6 = -[WCM_BTController getBTState](-[WCM_PolicyManager btController](self, "btController"), "getBTState");
    v7 = -[WCM_BTController audioType](-[WCM_PolicyManager btController](self, "btController"), "audioType");
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  v8 = -[WCM_PolicyManager wifiController](self, "wifiController");
  if (v8)
    LODWORD(v8) = -[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState");
  v9 = "BT on, not HFP";
  if (v7 == 3)
    v9 = "BT on, HFP";
  if (!v6)
    v9 = "BT off";
  v10 = "WiFi on, associated";
  if ((_DWORD)v8 == 1)
    v10 = "WiFi on, not associated";
  if (!(_DWORD)v8)
    v10 = "WiFi off";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("Current radio states are %s, %s, %s"), v9, v10, v5);
  -[WCM_PolicyManager updateCoexMonitorState:](self, "updateCoexMonitorState:", v3);
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("CoexBBUnifiedSensorInfoSupport")))
  {
    if (-[WCM_PolicyManager btController](self, "btController"))
    {
      if (-[WCM_BTController getNum2GHzAclA2DPDevices](-[WCM_PolicyManager btController](self, "btController"), "getNum2GHzAclA2DPDevices"))
      {
        v11 = 2;
        v12 = 4;
      }
      else
      {
        if (-[WCM_BTController numeSCODevice](-[WCM_PolicyManager btController](self, "btController"), "numeSCODevice"))
        {
          v12 = 2;
        }
        else
        {
          if (-[WCM_BTController numSCODevice](-[WCM_PolicyManager btController](self, "btController"), "numSCODevice"))
          {
            v11 = 2;
            v12 = 1;
            goto LABEL_27;
          }
          if (-[WCM_BTController numLEADevice](-[WCM_PolicyManager btController](self, "btController"), "numLEADevice"))
            v12 = 5;
          else
            v12 = 0;
        }
        v11 = 2;
      }
    }
    else
    {
      v12 = 0;
      v11 = 0;
    }
LABEL_27:
    -[WCM_CellularController sendBBCoexSensorMessage:band:usecase:](v4, "sendBBCoexSensorMessage:band:usecase:", 2, v11, v12);
  }
  if (-[WCM_PolicyManager isInHpSession](self, "isInHpSession"))
    -[WCM_PolicyManager updateHPCellularMetric](self, "updateHPCellularMetric");
}

- (void)handleBTConnectionChange
{
  uint64_t v3;

  v3 = -[WCM_BTController getBTState](-[WCM_PolicyManager btController](self, "btController"), "getBTState");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Handle BT connection change btState(%d)"), v3);
  if ((_DWORD)v3 == 2)
    -[WCM_BTController updatePreferredRole:](-[WCM_PolicyManager btController](self, "btController"), "updatePreferredRole:", -[WCM_PolicyManager btPreferredRole](self, "btPreferredRole"));
  -[WCM_PolicyManager handleFTCall](self, "handleFTCall");
}

- (void)handleBTPowerStateChange
{
  unsigned int v3;
  const char *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  WCM_BTController *v8;
  NSData *v9;
  NSData *v10;
  NSData *v11;
  NSData *v12;
  NSData *v13;
  NSData *v14;
  NSData *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unsigned int v19;
  WCM_BTController *v20;
  WCM_PlatformManager *v21;
  NSArray *v22;
  unsigned int v23;
  WCM_BTController *v24;
  unint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  unsigned int v31;
  uint64_t v32;
  unsigned __int8 v33;
  unint64_t v34;
  uint64_t v35;

  v3 = -[WCM_BTController powerState](-[WCM_PolicyManager btController](self, "btController"), "powerState");
  v4 = "off";
  if (v3)
    v4 = "on";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Updating policy for BT power %s"), v4);
  v5 = -[WCM_PolicyManager cellularCoexBand](self, "cellularCoexBand");
  if (-[WCM_BTController powerState](-[WCM_PolicyManager btController](self, "btController"), "powerState"))
  {
    -[WCM_BTController updateWCI2Mode:](-[WCM_PolicyManager btController](self, "btController"), "updateWCI2Mode:", 0);
    -[WCM_BTController updateMWSSignalingConfig](-[WCM_PolicyManager btController](self, "btController"), "updateMWSSignalingConfig");
    v6 = -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("BTDiversityAFHMap"));
    v7 = -[WCM_PolicyManager gpsRadioActive](self, "gpsRadioActive");
    if (v6)
    {
      v8 = -[WCM_PolicyManager btController](self, "btController");
      if (v7)
      {
        v9 = -[WCM_PolicyManager btDiversityChannelMapOnGpsRadioActiveForC0B0](self, "btDiversityChannelMapOnGpsRadioActiveForC0B0");
        v10 = -[WCM_PolicyManager btDiversityChannelMapOnGpsRadioActiveForC0B1](self, "btDiversityChannelMapOnGpsRadioActiveForC0B1");
        v11 = -[WCM_PolicyManager btDiversityChannelMapOnGpsRadioActiveForC1B0](self, "btDiversityChannelMapOnGpsRadioActiveForC1B0");
        v12 = -[WCM_PolicyManager btDiversityChannelMapOnGpsRadioActiveForC1B1](self, "btDiversityChannelMapOnGpsRadioActiveForC1B1");
      }
      else
      {
        v9 = -[WCM_PolicyManager btDiversityChannelMapForC0B0](self, "btDiversityChannelMapForC0B0");
        v10 = -[WCM_PolicyManager btDiversityChannelMapForC0B1](self, "btDiversityChannelMapForC0B1");
        v11 = -[WCM_PolicyManager btDiversityChannelMapForC1B0](self, "btDiversityChannelMapForC1B0");
        v12 = -[WCM_PolicyManager btDiversityChannelMapForC1B1](self, "btDiversityChannelMapForC1B1");
      }
      -[WCM_BTController updateDiversityAFHMapForC0B0:C0B1:C1B0:C1B1:](v8, "updateDiversityAFHMapForC0B0:C0B1:C1B0:C1B1:", v9, v10, v11, v12);
    }
    else
    {
      if (v7)
        v13 = -[WCM_PolicyManager btPreferredChannelMapOnGpsRadioActive](self, "btPreferredChannelMapOnGpsRadioActive");
      else
        v13 = -[WCM_PolicyManager btPreferredChannelMap](self, "btPreferredChannelMap");
      v14 = v13;
      if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("hpcellularstatemonitorsupport")))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HPCellular (handleBTPowerStateChange): Bool flag self.hpCellNeed2SetBTAFH = (%d), Fixed AFH self.btPreferredChannelMapHPCellularActive = (%@)."), -[WCM_PolicyManager hpCellNeed2SetBTAFH](self, "hpCellNeed2SetBTAFH"), -[WCM_PolicyManager btPreferredChannelMapHPCellularActive](self, "btPreferredChannelMapHPCellularActive"));
        if (-[WCM_PolicyManager hpCellNeed2SetBTAFH](self, "hpCellNeed2SetBTAFH"))
          v14 = -[WCM_PolicyManager btPreferredChannelMapHPCellularActive](self, "btPreferredChannelMapHPCellularActive");
      }
      -[WCM_BTController updatePreferredAFHMap:](-[WCM_PolicyManager btController](self, "btController"), "updatePreferredAFHMap:", v14);
    }
    if (_os_feature_enabled_impl("wirelessradiomanager", "HFBTEnhancement")
      && -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("HFBTCoex")))
    {
      v15 = -[WCM_PolicyManager btPreferred5GChannelMap](self, "btPreferred5GChannelMap");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("HFAFHDebug_ Update channel bitmap"));
      -[WCM_BTController updatePreferredHFBTChannelMap:](-[WCM_PolicyManager btController](self, "btController"), "updatePreferredHFBTChannelMap:", v15);
    }
    if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("BLEActiveScanPwrLmtEnabled")))
    {
      if ((v5 & 0xFFFFFFFE) == 2)
        v16 = 5;
      else
        v16 = 0;
      v17 = -[WCM_PolicyManager BLEActiveScanPwrLmtAssrInt](self, "BLEActiveScanPwrLmtAssrInt");
      v18 = -[WCM_PolicyManager BLEActiveScanPwrLmtAssrInt](self, "BLEActiveScanPwrLmtAssrInt");
      if (v16 == v17)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebugBLEIntervalTooOften_ updateBLEActiveScanPwrLmtAssertionInterval is called by handleBTPowerStateChange. No Need to update with same value --- new interval (%lld), old interval (%lld)"), v16, v18);
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebugBLEIntervalTooOften_ updateBLEActiveScanPwrLmtAssertionInterval is called by handleBTPowerStateChange. Updating with new interval (%lld), old interval (%lld)"), v16, v18);
        -[WCM_PolicyManager setBLEActiveScanPwrLmtAssrInt:](self, "setBLEActiveScanPwrLmtAssrInt:", v16);
        -[WCM_BTController updateBLEActiveScanPwrLmtAssertionInterval:](-[WCM_PolicyManager btController](self, "btController"), "updateBLEActiveScanPwrLmtAssertionInterval:", -[WCM_PolicyManager BLEActiveScanPwrLmtAssrInt](self, "BLEActiveScanPwrLmtAssrInt"));
      }
    }
    -[WCM_BTController updatePreferredRole:](-[WCM_PolicyManager btController](self, "btController"), "updatePreferredRole:", -[WCM_PolicyManager btPreferredRole](self, "btPreferredRole"));
    if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("PencilCoexSupport")))
    {
      -[WCM_PolicyManager configureBTAntennaSelection](self, "configureBTAntennaSelection");
    }
    -[WCM_PolicyManager updateCellTxPowerLimit](self, "updateCellTxPowerLimit");
    if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("LTEScanProtection")))
    {
      v19 = -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("LTEScanProtectionBTseparate"));
      v20 = -[WCM_PolicyManager btController](self, "btController");
      v21 = -[WCM_PolicyManager platformManager](self, "platformManager");
      if (v19)
        v22 = -[WCM_PlatformManager wcmCellularScanProtectionCellFrequenciesforBT](v21, "wcmCellularScanProtectionCellFrequenciesforBT");
      else
        v22 = -[WCM_PlatformManager wcmCellularScanProtectionCellFrequencies](v21, "wcmCellularScanProtectionCellFrequencies");
      -[WCM_BTController updateMWSScanFrequencyTable:](v20, "updateMWSScanFrequencyTable:", v22);
    }
    if (_os_feature_enabled_impl("wirelessradiomanager", "HFBTEnhancement")
      && -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("HFBTCoex")))
    {
      -[WCM_BTController updateHFBtTxIndication:](-[WCM_PolicyManager btController](self, "btController"), "updateHFBtTxIndication:", 1);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HFBTAntBlkDebug_ Current enabled bands = %@"), -[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands"));
      v23 = -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("HFBTConditionId"));
      v24 = -[WCM_PolicyManager btController](self, "btController");
      v25 = -[WCM_PolicyManager btAntBlockDuration](self, "btAntBlockDuration");
      v26 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands"), "objectForKeyedSubscript:", CFSTR("AntBlkBandUnii1Enabled")), "BOOLValue");
      v27 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands"), "objectForKeyedSubscript:", CFSTR("AntBlkBandUnii3Enabled")), "BOOLValue");
      v28 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands"), "objectForKeyedSubscript:", CFSTR("AntBlkBandUnii5aEnabled")), "BOOLValue");
      v29 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands"), "objectForKeyedSubscript:", CFSTR("AntBlkBandUnii5bEnabled")), "BOOLValue");
      v30 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands"), "objectForKeyedSubscript:", CFSTR("AntBlkBandUnii5cEnabled")), "BOOLValue");
      LOBYTE(v35) = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[WCM_PolicyManager HFBTAntBlkEnableBands](self, "HFBTAntBlkEnableBands"), "objectForKeyedSubscript:", CFSTR("AntBlkBandUnii5dEnabled")), "BOOLValue");
      if (v23)
        -[WCM_BTController updateHFBtAntennaRequestWithDuration:unii1Enabled:unii3Enabled:unii5aEnabled:unii5bEnabled:unii5cEnabled:unii5dEnabled:unii1ConditionId:unii3ConditionId:unii5aConditionId:unii5bConditionId:unii5cConditionId:unii5dConditionId:](v24, "updateHFBtAntennaRequestWithDuration:unii1Enabled:unii3Enabled:unii5aEnabled:unii5bEnabled:unii5cEnabled:unii5dEnabled:unii1ConditionId:unii3ConditionId:unii5aConditionId:unii5bConditionId:unii5cConditionId:unii5dConditionId:", v25, v26, v27, v28, v29, v30, v35, objc_msgSend(&off_100230CC0, "unsignedIntValue"), objc_msgSend(&off_100230CC0, "unsignedIntValue"), objc_msgSend(&off_100230CD8, "unsignedIntValue"), objc_msgSend(&off_100230CD8, "unsignedIntValue"), objc_msgSend(&off_100230CD8, "unsignedIntValue"), objc_msgSend(&off_100230CD8, "unsignedIntValue"));
      else
        -[WCM_BTController updateHFBtAntennaRequestWithDuration:unii1Enabled:unii3Enabled:unii5aEnabled:unii5bEnabled:unii5cEnabled:unii5dEnabled:](v24, "updateHFBtAntennaRequestWithDuration:unii1Enabled:unii3Enabled:unii5aEnabled:unii5bEnabled:unii5cEnabled:unii5dEnabled:", v25, v26, v27, v28, v29, v30, v35);
    }
    v31 = -[WCM_PolicyManager cellularCoexBand](self, "cellularCoexBand");
    -[WCM_BTController updateMWSChannelParameters:](-[WCM_PolicyManager btController](self, "btController"), "updateMWSChannelParameters:", -[WCM_PolicyManager cellularController](self, "cellularController"));
    if (v31 == 7)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("ZeroFreqDebug: For non-coex scenario (including RRC idle), WRM pass actual frequences instead of zeros to BT. ([self cellularCoexBand] != WRM_BNON_COEX) as a BOOL is %d."), -[WCM_PolicyManager cellularCoexBand](self, "cellularCoexBand") != 7);
    }
    else
    {
      -[WCM_PolicyManager configureAllWCI2:](self, "configureAllWCI2:", 1);
      if (-[WCM_PolicyManager cellularWCI2CoexPolicyBitmap](self, "cellularWCI2CoexPolicyBitmap"))
        -[WCM_BTController updateMWSFrameConfig:](-[WCM_PolicyManager btController](self, "btController"), "updateMWSFrameConfig:", -[WCM_PolicyManager cellularController](self, "cellularController"));
    }
    -[WCM_PolicyManager updateCoexMonitorState:](self, "updateCoexMonitorState:", -[WCM_PolicyManager cellularCoexBand](self, "cellularCoexBand"));
    if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WifiBtAgcCoexMode"))&& -[WCM_PolicyManager btAgcCoexModeEnable](self, "btAgcCoexModeEnable"))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("CrashDebug_ 2nd place self.btAgcCoexModeEnable is %d"), -[NSNumber integerValue](-[WCM_PolicyManager btAgcCoexModeEnable](self, "btAgcCoexModeEnable"), "integerValue"));
      -[WCM_BTController updateCoexRxGainMode:](-[WCM_PolicyManager btController](self, "btController"), "updateCoexRxGainMode:", -[WCM_PolicyManager btAgcCoexModeEnable](self, "btAgcCoexModeEnable"));
    }
    -[WCM_PolicyManager sendRCU2UpdateMessage](self, "sendRCU2UpdateMessage");
  }
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("CoexBBUnifiedSensorInfoSupport")))
  {
    if (-[WCM_PolicyManager btController](self, "btController"))
    {
      if (-[WCM_BTController getNum2GHzAclA2DPDevices](-[WCM_PolicyManager btController](self, "btController"), "getNum2GHzAclA2DPDevices"))
      {
        v32 = 4;
      }
      else if (-[WCM_BTController numeSCODevice](-[WCM_PolicyManager btController](self, "btController"), "numeSCODevice"))
      {
        v32 = 2;
      }
      else if (-[WCM_BTController numSCODevice](-[WCM_PolicyManager btController](self, "btController"), "numSCODevice"))
      {
        v32 = 1;
      }
      else if (-[WCM_BTController numLEADevice](-[WCM_PolicyManager btController](self, "btController"), "numLEADevice"))
      {
        v32 = 5;
      }
      else
      {
        v32 = 0;
      }
      if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("UseWCMAriDriver")))
      {
        if (-[WCM_BTController num2GHzAoSBiAudioDevice](-[WCM_PolicyManager btController](self, "btController"), "num2GHzAoSBiAudioDevice"))
        {
          v33 = 2;
        }
        else
        {
          if (-[WCM_BTController num2GHzAoSUniAudioDevice](-[WCM_PolicyManager btController](self, "btController"), "num2GHzAoSUniAudioDevice"))
          {
            v33 = 2;
            v32 = 6;
            goto LABEL_63;
          }
          if (!-[WCM_BTController num5GHzAoSBiAudioDevice](-[WCM_PolicyManager btController](self, "btController"), "num5GHzAoSBiAudioDevice"))
          {
            v34 = -[WCM_BTController num5GHzAoSUniAudioDevice](-[WCM_PolicyManager btController](self, "btController"), "num5GHzAoSUniAudioDevice");
            if (v34)
              v32 = 6;
            else
              v32 = v32;
            if (v34)
              v33 = 3;
            else
              v33 = 2;
            goto LABEL_63;
          }
          v33 = 3;
        }
        v32 = 7;
      }
      else
      {
        v33 = 2;
      }
    }
    else
    {
      v32 = 0;
      v33 = 0;
    }
LABEL_63:
    -[WCM_CellularController sendBBCoexSensorMessage:band:usecase:](-[WCM_PolicyManager cellularController](self, "cellularController"), "sendBBCoexSensorMessage:band:usecase:", 2, v33, v32);
  }
  if (-[WCM_PolicyManager isInHpSession](self, "isInHpSession"))
    -[WCM_PolicyManager updateHPCellularMetric](self, "updateHPCellularMetric");
}

- (void)sendRCU2UpdateMessage
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR(" In sendRCU2UpdateMessage.. enter"));
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("RCU2Support")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR(" BT power state change - Set RCU2 parameters"));
    -[WCM_RCU2Controller setMRCU2PowerOn:](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "setMRCU2PowerOn:", -[WCM_CtrXPCClient threadCOEXStatus](-[WCM_RCU2Controller threadClient](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "threadClient"), "threadCOEXStatus"));
    -[WCM_RCU2Controller setMRCU2ChannelNum:](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "setMRCU2ChannelNum:", -[WCM_CtrXPCClient getChannel](-[WCM_RCU2Controller threadClient](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "threadClient"), "getChannel"));
    -[WCM_RCU2Controller setMRCU2ChannelActivity:](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "setMRCU2ChannelActivity:", -[WCM_CtrXPCClient getChannelActivity](-[WCM_RCU2Controller threadClient](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "threadClient"), "getChannelActivity"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WIFI/RCU2 - Setting values status = %d channelno =%d channel activity =%lld "), -[WCM_RCU2Controller mRCU2PowerOn](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "mRCU2PowerOn"), -[WCM_RCU2Controller mRCU2ChannelNum](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "mRCU2ChannelNum"), -[WCM_RCU2Controller mRCU2ChannelActivity](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "mRCU2ChannelActivity"));
    if (-[WCM_BTController powerState](-[WCM_PolicyManager btController](self, "btController"), "powerState"))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR(" Setting AFH Map for RCU2 channel %d"), -[WCM_RCU2Controller mRCU2ChannelNum](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "mRCU2ChannelNum"));
      -[WCM_BTController updatePreferredAFHMapRCU2:](-[WCM_PolicyManager btController](self, "btController"), "updatePreferredAFHMapRCU2:", -[WCM_RCU2Controller mRCU2ChannelNum](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "mRCU2ChannelNum"));
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("BT power state off - not sending afh map"));
    }
    -[WCM_RCU2Controller handleRCU2Connection](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "handleRCU2Connection");
  }
}

- (void)handleBTScanConfigChange
{
  uint64_t v3;
  _BOOL8 v4;
  uint64_t v5;

  v3 = -[WCM_BTController getBTState](-[WCM_PolicyManager btController](self, "btController"), "getBTState");
  v4 = -[WCM_WiFiController isCarPlaySessionInProgress](-[WCM_PolicyManager wifiController](self, "wifiController"), "isCarPlaySessionInProgress");
  v5 = -[WCM_WiFiController getCarPlayScanRelaxReason](-[WCM_PolicyManager wifiController](self, "wifiController"), "getCarPlayScanRelaxReason");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("handleBTScanConfigChange Handle BT radio state (%d)"), v3);
  if (!(_DWORD)v3 || (_DWORD)v5)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("BT controller is off or Carplay is not a reason, didnt send Carplay scan param changes btState(%d) reason (%d)"), v3, v5);
  }
  else
  {
    -[WCM_BTController updateCarplayBTScanParams:reason:](-[WCM_PolicyManager btController](self, "btController"), "updateCarplayBTScanParams:reason:", v4, 0);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Sent message to BT controller about Carplay scan param changes carPlayState(%d) carPlayReason(%d)"), v4, 0);
  }
}

- (void)handleRCU2ContentionChange
{
  _BOOL8 v3;
  id v4;
  const __CFString *v5;

  v3 = -[WCM_RCU2Controller mRCU2PowerOn](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "mRCU2PowerOn");
  v4 = -[WCM_WiFiController getLeastCongestedWifiParam](-[WCM_PolicyManager wifiController](self, "wifiController"), "getLeastCongestedWifiParam");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("handleRCU2ContentionChange Handle RC2 radio state (%d)"), v3);
  if (!objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("RCU2Support")))
  {
    v5 = CFSTR("handleRCU2ContentionChange RCU2 feature not enabed");
    goto LABEL_5;
  }
  if (v3)
  {
    -[WCM_RCU2Controller updateContentionFreeWiFiInfoToRC2:count:](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "updateContentionFreeWiFiInfoToRC2:count:", objc_msgSend(objc_msgSend(v4, "objectAtIndex:", 0), "unsignedIntValue"), objc_msgSend(objc_msgSend(v4, "objectAtIndex:", 1), "unsignedIntValue"));
    v5 = CFSTR("Sent message to RC2 controller about least contested WiFi channel");
LABEL_5:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, v5);
    return;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("RC2 controller is off (%d)"), v3);
}

- (BOOL)deviceIsMacBookAir
{
  return -[WCM_PlatformManager wrmPlatformId](-[WCM_PolicyManager platformManager](self, "platformManager"), "wrmPlatformId") == 308|| -[WCM_PlatformManager wrmPlatformId](-[WCM_PolicyManager platformManager](self, "platformManager"), "wrmPlatformId") == 309|| -[WCM_PlatformManager wrmPlatformId](-[WCM_PolicyManager platformManager](self, "platformManager"), "wrmPlatformId") == 307|| -[WCM_PlatformManager wrmPlatformId](-[WCM_PolicyManager platformManager](self, "platformManager"), "wrmPlatformId") == 305|| -[WCM_PlatformManager wrmPlatformId](-[WCM_PolicyManager platformManager](self, "platformManager"), "wrmPlatformId") == 306|| -[WCM_PlatformManager wrmPlatformId](-[WCM_PolicyManager platformManager](self, "platformManager"), "wrmPlatformId") == 342|| -[WCM_PlatformManager wrmPlatformId](-[WCM_PolicyManager platformManager](self, "platformManager"),
           "wrmPlatformId") == 343;
}

- (int)parseCenterFreqtoUNIIBand:(unsigned int)a3
{
  if (a3 - 1 < 0x9AF)
    return 1;
  if (a3 - 5150 < 0x65)
    return 2;
  if (a3 - 5250 < 0x65)
    return 3;
  if (a3 - 5470 < 0x100)
    return 4;
  if (a3 - 5725 < 0x65)
    return 5;
  if (a3 - 5850 < 0x4C)
    return 6;
  if (a3 - 5925 < 0x7E)
    return 7;
  if (a3 - 6051 < 0x7D)
    return 8;
  if (a3 - 6176 < 0x7D)
    return 9;
  if (a3 - 6301 < 0x7D)
    return 10;
  if (a3 - 6425 < 0x65)
    return 11;
  if (a3 - 6525 < 0x15F)
    return 12;
  if (a3 - 6875 >= 0xFB)
    return 0;
  return 13;
}

- (void)updateWiFiBTConnectionReport
{
  _QWORD v3[7];
  _QWORD v4[7];

  if (-[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState"))
  {
    v3[0] = CFSTR("2GAoSUni");
    v4[0] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WCM_BTController num2GHzAoSUniAudioDevice](-[WCM_PolicyManager btController](self, "btController"), "num2GHzAoSUniAudioDevice"));
    v3[1] = CFSTR("2GAoSBi");
    v4[1] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WCM_BTController num2GHzAoSBiAudioDevice](-[WCM_PolicyManager btController](self, "btController"), "num2GHzAoSBiAudioDevice"));
    v3[2] = CFSTR("5GAoSUni");
    v4[2] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WCM_BTController num5GHzAoSUniAudioDevice](-[WCM_PolicyManager btController](self, "btController"), "num5GHzAoSUniAudioDevice"));
    v3[3] = CFSTR("5GAoSBi");
    v4[3] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WCM_BTController num5GHzAoSBiAudioDevice](-[WCM_PolicyManager btController](self, "btController"), "num5GHzAoSBiAudioDevice"));
    v3[4] = CFSTR("ACL-A2DP");
    v4[4] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WCM_BTController getNum2GHzAclA2DPDevices](-[WCM_PolicyManager btController](self, "btController"), "getNum2GHzAclA2DPDevices"));
    v3[5] = CFSTR("ESCO");
    v4[5] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)-[WCM_BTController numeSCODevice](-[WCM_PolicyManager btController](self, "btController"), "numeSCODevice")+ -[WCM_BTController numSCODevice](-[WCM_PolicyManager btController](self, "btController"), "numSCODevice"));
    v3[6] = CFSTR("HID");
    v4[6] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WCM_BTController numHIDDevice](-[WCM_PolicyManager btController](self, "btController"), "numHIDDevice"));
    -[WCM_WiFiController updateWiFiBTConnectionReport:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateWiFiBTConnectionReport:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 7));
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCM_PolicyManager WiFi Power Off - Not sending BTConnectionReport"));
  }
}

- (void)handleWiFiBTULOFDMAChange
{
  unsigned int v3;
  _BOOL8 v4;
  const char *v5;
  uint64_t v6;
  int v7;

  if ((objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiBtULOFDMA")) & 1) == 0&& !objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiBtULOFDMADesense")))
  {
    return;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Handle WiFi BT UL_OFDMA Coex change"));
  if (!-[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState"))
  {
    byte_1002713BC = 0;
    return;
  }
  v3 = -[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState");
  v4 = -[WCM_WiFiController didWiFiDeviceReset](-[WCM_PolicyManager wifiController](self, "wifiController"), "didWiFiDeviceReset");
  if (v3 >= 4)
  {
    v5 = "INVALID_STATE!!!";
    if (v3 == 4)
      v5 = "ASSOCIATED_6G";
  }
  else
  {
    v5 = off_100205430[v3];
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFiState(%s)"), v5);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFiReset(%d)"), v4);
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiBtULOFDMADesense")))
  {
    if (v3 == 2)
    {
      if (!-[WCM_BTController getAny2GHzBTDevicesConnected](-[WCM_PolicyManager btController](self, "btController"), "getAny2GHzBTDevicesConnected")|| !-[WCM_BTController isBtAntennaDesensed](-[WCM_PolicyManager btController](self, "btController"), "isBtAntennaDesensed"))
      {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
LABEL_17:
    if (v3 - 3 > 1
      || !-[WCM_BTController getAny5GHzBTDevicesConnected](-[WCM_PolicyManager btController](self, "btController"), "getAny5GHzBTDevicesConnected"))
    {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (v3 != 2)
    goto LABEL_17;
  if (!-[WCM_BTController getAny2GHzBTDevicesConnected](-[WCM_PolicyManager btController](self, "btController"), "getAny2GHzBTDevicesConnected"))
  {
LABEL_20:
    v6 = 0;
    goto LABEL_21;
  }
LABEL_19:
  v6 = 1;
LABEL_21:
  v7 = byte_1002713BC != (_DWORD)v6 || v4;
  if (v7 == 1)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFi/BT UL OFDMA disable state change prev (%d) current (%d) wifiReset (%d)"), byte_1002713BC, v6, v4);
    byte_1002713BC = v6;
    -[WCM_WiFiController updateWiFiBTULOFDMAstate:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateWiFiBTULOFDMAstate:", v6);
  }
}

- (void)handleWiFiRCU1PowerOff
{
  _BOOL8 v3;

  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("RCU1Support")))
  {
    if (-[WCM_PolicyManager rcu1Controller](self, "rcu1Controller"))
    {
      v3 = -[WCM_BTController getAny5GHzBTDevicesConnected](-[WCM_PolicyManager btController](self, "btController"), "getAny5GHzBTDevicesConnected");
      -[WCM_R1Controller setMRCU1CurrentMode:](-[WCM_PolicyManager rcu1Controller](self, "rcu1Controller"), "setMRCU1CurrentMode:", 0);
      -[WCM_R1Controller sendRCU1Message:wifiBand:btPowerState:btBand:isForce:](-[WCM_PolicyManager rcu1Controller](self, "rcu1Controller"), "sendRCU1Message:wifiBand:btPowerState:btBand:isForce:", 0, 0, -[WCM_BTController powerState](-[WCM_PolicyManager btController](self, "btController"), "powerState"), v3, 0);
    }
  }
}

- (void)handleWiFiRCU2PowerOff
{
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("RCU2Support")))-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller");
}

- (void)updateWiFiRCU1ULOFDMAStatus
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  const char *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  int v13;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Handle WiFi NR UL_OFDMA Coex change"));
  if (-[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState"))
  {
    v3 = objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("RCU1R2Support"));
    v4 = -[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState");
    v5 = -[WCM_WiFiController didWiFiDeviceReset](-[WCM_PolicyManager wifiController](self, "wifiController"), "didWiFiDeviceReset");
    if (v4 >= 4)
    {
      v6 = "INVALID_STATE!!!";
      if (v4 == 4)
        v6 = "ASSOCIATED_6G";
    }
    else
    {
      v6 = off_100205430[v4];
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFiState(%s)"), v6);
    v7 = -[WCM_R1Controller mRCU1PowerOn](-[WCM_PolicyManager rcu1Controller](self, "rcu1Controller"), "mRCU1PowerOn");
    v8 = -[WCM_R1Controller mRCU1ChannelNum](-[WCM_PolicyManager rcu1Controller](self, "rcu1Controller"), "mRCU1ChannelNum");
    v9 = v8 << 16;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("NR State : Power:(%d) ChannelNo:(%d)"), v7, (__int16)v8);
    if (v9 == 327680)
      v10 = v7;
    else
      v10 = 0;
    if (v4 != 3)
      v10 = 0;
    if (v4 - 3 < 2)
      v11 = v7;
    else
      v11 = 0;
    if (v3)
      v12 = v11;
    else
      v12 = v10;
    if (byte_1002713BD == (_DWORD)v12)
      v13 = v5;
    else
      v13 = 1;
    if (v13 == 1)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFi/RCU1 UL OFDMA disable state change prev (%d) current (%d) wifiReset (%d)"), byte_1002713BD, v12, v5);
      byte_1002713BD = v12;
      -[WCM_WiFiController updateWiFiRCU1ULOFDMAstate:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateWiFiRCU1ULOFDMAstate:", v12);
    }
  }
  else
  {
    byte_1002713BD = 0;
  }
}

- (void)updateWiFiRCU1Status
{
  _BOOL8 v3;
  unsigned int v4;
  uint64_t v5;
  _BOOL8 v6;
  _BOOL8 v7;

  if (!-[WCM_PolicyManager rcu1Controller](self, "rcu1Controller"))
    return;
  if (!-[WCM_PolicyManager wifiController](self, "wifiController"))
  {
    v3 = 0;
LABEL_9:
    v5 = 0;
    goto LABEL_11;
  }
  v3 = -[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState");
  v4 = -[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState");
  if (v4 == 4 || v4 == 3)
  {
    v5 = 2;
    goto LABEL_11;
  }
  if (v4 != 2)
    goto LABEL_9;
  v5 = 1;
LABEL_11:
  if (-[WCM_PolicyManager btController](self, "btController"))
  {
    v6 = -[WCM_BTController powerState](-[WCM_PolicyManager btController](self, "btController"), "powerState");
    v7 = -[WCM_BTController getAny5GHzBTDevicesConnected](-[WCM_PolicyManager btController](self, "btController"), "getAny5GHzBTDevicesConnected");
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  -[WCM_R1Controller sendRCU1Message:wifiBand:btPowerState:btBand:isForce:](-[WCM_PolicyManager rcu1Controller](self, "rcu1Controller"), "sendRCU1Message:wifiBand:btPowerState:btBand:isForce:", v3, v5, v6, v7, 0);
}

- (void)updateWiFiRCU1ModeChange
{
  _BOOL8 v3;
  signed __int16 v4;
  unsigned int v5;
  _BOOL8 v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;

  v3 = -[WCM_R1Controller mRCU1PowerOn](-[WCM_PolicyManager rcu1Controller](self, "rcu1Controller"), "mRCU1PowerOn");
  v4 = (unsigned __int16)-[WCM_R1Controller mRCU1ChannelNum](-[WCM_PolicyManager rcu1Controller](self, "rcu1Controller"), "mRCU1ChannelNum");
  v5 = -[WCM_R1Controller mRCU1NbBandMask](-[WCM_PolicyManager rcu1Controller](self, "rcu1Controller"), "mRCU1NbBandMask");
  v6 = -[WCM_R1Controller mRCU15GHzInUse](-[WCM_PolicyManager rcu1Controller](self, "rcu1Controller"), "mRCU15GHzInUse");
  v7 = -[WCM_R1Controller mRCU1CurrentMode](-[WCM_PolicyManager rcu1Controller](self, "rcu1Controller"), "mRCU1CurrentMode");
  if (!-[WCM_PolicyManager wifiController](self, "wifiController"))
  {
    v12 = 0;
    goto LABEL_17;
  }
  v8 = objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("RCU1R2Support"));
  v9 = -[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState");
  v10 = -[WCM_WiFiController didWiFiDeviceReset](-[WCM_PolicyManager wifiController](self, "wifiController"), "didWiFiDeviceReset");
  v11 = -[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState");
  if (v8)
  {
    if (v11 & v3)
    {
      if (v5)
        v4 = 5;
      v12 = 257;
      if ((v10 & 1) != 0)
        goto LABEL_19;
LABEL_17:
      v14 = 0;
      goto LABEL_20;
    }
LABEL_18:
    v12 = 0;
    v14 = 0;
    if (!v10)
      goto LABEL_20;
    goto LABEL_19;
  }
  if (v9 == 3)
    v13 = v11;
  else
    v13 = 0;
  if (v13 != 1)
    goto LABEL_18;
  v12 = v4 == 5 && v3;
  if ((v10 & 1) == 0)
    goto LABEL_17;
LABEL_19:
  v14 = 1;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("updateWiFiRCU1ModeChange wifiReset (%d)"), 1);
LABEL_20:
  v15 = v14;
  if ((_DWORD)v12 != (_DWORD)v7)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("updateWiFiRCU1ModeChange mode change old (0x%04x) new (0x%04x)"), v7, v12);
    -[WCM_R1Controller setMRCU1CurrentMode:](-[WCM_PolicyManager rcu1Controller](self, "rcu1Controller"), "setMRCU1CurrentMode:", v12);
    v15 = 1;
  }
  if (word_100270DF8 != v4)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("updateWiFiRCU1ModeChange chan change old (%d) new (%d)"), word_100270DF8, v4);
    word_100270DF8 = v4;
    v14 = 1;
  }
  if (v3 != word_1002713BE)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("updateWiFiRCU1ModeChange pwr change old (%d) new (%d)"), (unsigned __int16)word_1002713BE, v3);
    word_1002713BE = v3;
    if (!v3)
      v4 = 0;
    v14 = 1;
    goto LABEL_30;
  }
  if ((v15 | v14) == 1)
LABEL_30:
    -[WCM_WiFiController updateWiFiRCU1ModeChanged:andChannelChanged:andMode:andChannel:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateWiFiRCU1ModeChanged:andChannelChanged:andMode:andChannel:", v15, v14, +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v12), +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", v4));
  if (word_1002713C0 != v6)
  {
    if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiFigaroCoex")))
    {
      -[WCM_BTController updateUWB5GHzActive:](-[WCM_PolicyManager btController](self, "btController"), "updateUWB5GHzActive:", v6);
      word_1002713C0 = v6;
    }
  }
}

- (void)handleWiFiRCU1Change
{
  unsigned int v3;
  WCM_CellularController *v4;
  WCM_R1Controller *v5;
  unsigned __int8 v6;

  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("RCU1Support")))
  {
    -[WCM_PolicyManager updateWiFiRCU1ULOFDMAStatus](self, "updateWiFiRCU1ULOFDMAStatus");
    -[WCM_PolicyManager updateWiFiRCU1ModeChange](self, "updateWiFiRCU1ModeChange");
    -[WCM_PolicyManager updateWiFiRCU1Status](self, "updateWiFiRCU1Status");
    if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("LTELAACoexSupport"))&& -[WCM_PolicyManager cellularController](self, "cellularController"))
    {
      -[WCM_CellularController updateBBRC1Params:channel:duration:priority:](-[WCM_PolicyManager cellularController](self, "cellularController"), "updateBBRC1Params:channel:duration:priority:", -[WCM_R1Controller mRCU1PowerOn](-[WCM_PolicyManager rcu1Controller](self, "rcu1Controller"), "mRCU1PowerOn"), -[WCM_R1Controller mRCU1ChannelNum](-[WCM_PolicyManager rcu1Controller](self, "rcu1Controller"), "mRCU1ChannelNum"), -[WCM_R1Controller mRCU1OnDuration](-[WCM_PolicyManager rcu1Controller](self, "rcu1Controller"), "mRCU1OnDuration"), -[WCM_R1Controller mRCU1UseCaseNum](-[WCM_PolicyManager rcu1Controller](self, "rcu1Controller"), "mRCU1UseCaseNum"));
    }
    if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("CoexBBUnifiedSensorInfoSupport")))
    {
      v3 = -[WCM_R1Controller mRCU1PowerOn](-[WCM_PolicyManager rcu1Controller](self, "rcu1Controller"), "mRCU1PowerOn");
      v4 = -[WCM_PolicyManager cellularController](self, "cellularController");
      v5 = -[WCM_PolicyManager rcu1Controller](self, "rcu1Controller");
      if (v3)
        v6 = -[WCM_R1Controller mRCU1ChannelNum](v5, "mRCU1ChannelNum");
      else
        v6 = -[WCM_R1Controller mRCU1PowerOn](v5, "mRCU1PowerOn");
      -[WCM_CellularController sendBBCoexSensorMessage:band:usecase:](v4, "sendBBCoexSensorMessage:band:usecase:", 3, v6, -[WCM_R1Controller mRCU1UseCaseNum](-[WCM_PolicyManager rcu1Controller](self, "rcu1Controller"), "mRCU1UseCaseNum"));
    }
  }
}

- (void)handleBTLeConn
{
  unsigned int v3;
  WCM_BTController *v4;
  uint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  unsigned int v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const __CFString *v12;
  unint64_t v13;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("handleBTLeConn updating state to WiFi"));
  if (-[WCM_PolicyManager wifiController](self, "wifiController"))
  {
    v3 = -[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState");
    v4 = -[WCM_PolicyManager btController](self, "btController");
    v5 = &qword_100271000;
    if (v4)
    {
      v6 = -[WCM_BTController getLeConnDutyCycle](-[WCM_PolicyManager btController](self, "btController"), "getLeConnDutyCycle");
      v7 = -[WCM_BTController getLeConnDuration](-[WCM_PolicyManager btController](self, "btController"), "getLeConnDuration");
      v13 = -[WCM_BTController getLeConnReason](-[WCM_PolicyManager btController](self, "btController"), "getLeConnReason");
      v8 = v6 - 1;
      if ((_DWORD)v6 == 1)
        v9 = v7;
      else
        v9 = 30;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("LastSent: EN(%d) DC(%d) DUR(%d) Peak(%d)"), byte_1002713E4, dword_1002713D8, dword_1002713DC, dword_1002713E0);
      v10 = "DISABLED";
      switch(v3)
      {
        case 0u:
          goto LABEL_18;
        case 1u:
          v10 = "ENABLED";
          goto LABEL_18;
        case 2u:
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("CurrState: wifi(%s) EN(%d) DC(%d) DUR(%d) Peak(%d) "), "ASSOCIATED_2G", v8 < 4, v6, v7, v9);
          if (v8 >= 4)
          {
            v4 = (WCM_BTController *)v9;
            v5 = &qword_100271000;
            goto LABEL_22;
          }
          v11 = 1;
          v12 = CFSTR("Set ON due to WiFi in 2G, current enable=1, and DC or DUR changed");
          if (dword_1002713D8 == (_DWORD)v6)
          {
            v5 = &qword_100271000;
            if (dword_1002713DC == (_DWORD)v7)
              return;
          }
          else
          {
            v5 = &qword_100271000;
          }
          break;
        case 3u:
          v10 = "ASSOCIATED_5G";
          goto LABEL_18;
        default:
          v10 = "INVALID_STATE!!!";
          if (v3 == 4)
            v10 = "ASSOCIATED_6G";
LABEL_18:
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("CurrState: wifi(%s) EN(%d) DC(%d) DUR(%d) Peak(%d) "), v10, v8 < 4, v6, v7, v9);
          v5 = &qword_100271000;
          goto LABEL_19;
      }
    }
    else
    {
      v13 = 0;
      v9 = 0;
      v7 = 0;
      v6 = 0;
      if (v3 == 2)
      {
LABEL_22:
        if (!byte_1002713E4)
          return;
        v11 = 0;
        v12 = CFSTR("Set OFF due to WiFi in 2G, current enable=0, and lastSent enable=1");
        v9 = (uint64_t)v4;
      }
      else
      {
LABEL_19:
        if (!byte_1002713E4)
          return;
        v11 = 0;
        v12 = CFSTR("Set OFF due to WiFi NOT 2G and lastSent enable=1");
      }
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, v12);
    -[WCM_WiFiController updateWiFiBTLeConnEnable:andPeakOutageMs:andDurationMs:andDutyCycle:andReason:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateWiFiBTLeConnEnable:andPeakOutageMs:andDurationMs:andDutyCycle:andReason:", v11, v9, v7, v6, v13);
    byte_1002713E4 = v11;
    dword_1002713E0 = v9;
    *((_DWORD *)v5 + 247) = v7;
    dword_1002713D8 = v6;
  }
}

- (void)handleBTLeDiscoveryScanStateChange
{
  const char *v3;
  const char *v4;
  int64_t v5;
  int64_t v6;
  BOOL v7;
  _BOOL4 v8;
  unsigned int v9;

  v3 = "Other";
  v4 = "stopped";
  if (-[WCM_PolicyManager btController](self, "btController"))
  {
    v5 = -[WCM_BTController getLeDiscoveryScanState](-[WCM_PolicyManager btController](self, "btController"), "getLeDiscoveryScanState");
    v6 = -[WCM_BTController getLeDiscoveryScanUseCase](-[WCM_PolicyManager btController](self, "btController"), "getLeDiscoveryScanUseCase");
    v7 = v5 == 1;
    if (v7)
      v4 = "started";
    v8 = v6 == 1;
    if (v6 == 1)
      v3 = "FindMyPencil";
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("handleBTLeDiscoveryScanStateChange - Scan %s, Use Case %s"), v4, v3);
  v9 = objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("CFUseTddModeDuringFindMy"));
  if (v8 && v9)
    self->_findMyPencilScanActive = v7;
  -[WCM_PolicyManager handleWiFiBTCoexChange](self, "handleWiFiBTCoexChange");
}

- (void)handleWiFiBTAirplayChange
{
  unsigned int v3;
  unsigned int v4;
  _BOOL4 v5;
  uint64_t v6;
  const char *v7;

  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("AirplayCriticalSupport")))
  {
    v3 = -[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState");
    v4 = -[WCM_AirplayController mAirplayIsCritical](-[WCM_PolicyManager airplayController](self, "airplayController"), "mAirplayIsCritical");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("handleWiFiBTAirplayChange updating Airplay Critical to WiFi and BT"));
    v5 = v3 - 2 < 3;
    v6 = v4 & v5;
    if ((v4 & v5) != 0)
      v7 = "on";
    else
      v7 = "off";
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Updating critical wifi state for AirPlay to %s"), v7);
    -[WCM_PolicyManager updateWiFiAirplayCriticalState:](self, "updateWiFiAirplayCriticalState:", v6);
    -[WCM_PolicyManager updateBTAirplayCriticalState:](self, "updateBTAirplayCriticalState:", v6);
  }
}

- (void)updateWiFiAirplayCriticalState:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[WCM_PolicyManager wifiController](self, "wifiController")
    && -[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState"))
  {
    -[WCM_WiFiController setCriticalWiFiTraffic:duration:criticalityPercentage:forProcessID:](-[WCM_PolicyManager wifiController](self, "wifiController"), "setCriticalWiFiTraffic:duration:criticalityPercentage:forProcessID:", v3, -[WCM_AirplayController mAirplayDuration](-[WCM_PolicyManager airplayController](self, "airplayController"), "mAirplayDuration"), -[WCM_AirplayController mAirplayCriticalityPercentage](-[WCM_PolicyManager airplayController](self, "airplayController"), "mAirplayCriticalityPercentage"), -[WCM_Controller getProcessId](-[WCM_PolicyManager airplayController](self, "airplayController"), "getProcessId"));
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFi is OFF"));
  }
}

- (void)updateWiFiCatsState:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (-[WCM_PolicyManager wifiController](self, "wifiController")
    && -[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState"))
  {
    -[WCM_WiFiController setHPovrLEscanGrantDuration:](-[WCM_PolicyManager wifiController](self, "wifiController"), "setHPovrLEscanGrantDuration:", v3);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFi is OFF"));
  }
}

- (void)updateBTAirplayCriticalState:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[WCM_PolicyManager btController](self, "btController")
    && -[WCM_BTController powerState](-[WCM_PolicyManager btController](self, "btController"), "powerState"))
  {
    -[WCM_BTController updateWiFiCriticalEnabled:](-[WCM_PolicyManager btController](self, "btController"), "updateWiFiCriticalEnabled:", v3);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("BT is OFF"));
  }
}

- (void)handleWiFiNANChange
{
  if ((_os_feature_enabled_impl("CoreWiFi", "Figaro5GTDD") & 1) == 0)
  {
    if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiFigaroCoex")))-[WCM_BTController updateNANActive:](-[WCM_PolicyManager btController](self, "btController"), "updateNANActive:", -[WCM_P2PNANController mNanEnabled](-[WCM_PolicyManager p2pNanController](self, "p2pNanController"), "mNanEnabled"));
  }
}

- (void)handleWiFiAWDLChange
{
  _BOOL4 forceRealTimeAWDL;
  WCM_BTController *v4;
  WCM_BTController *v5;
  _BOOL8 v6;

  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiFigaroCoex")))
  {
    if (_os_feature_enabled_impl("CoreWiFi", "Figaro5GTDD"))
    {
      forceRealTimeAWDL = self->_forceRealTimeAWDL;
      v4 = -[WCM_PolicyManager btController](self, "btController");
      v5 = v4;
      if (forceRealTimeAWDL)
      {
        v6 = 1;
      }
      else
      {
        v6 = -[WCM_P2PAWDLController mRealTimeAwdlTrafficEnabled](-[WCM_PolicyManager p2pAwdlController](self, "p2pAwdlController"), "mRealTimeAwdlTrafficEnabled");
        v4 = v5;
      }
      -[WCM_BTController updateAWDLRTGActive:](v4, "updateAWDLRTGActive:", v6);
    }
    else
    {
      -[WCM_BTController updateAWDLActive:](-[WCM_PolicyManager btController](self, "btController"), "updateAWDLActive:", -[WCM_P2PAWDLController mAwdlEnabled](-[WCM_PolicyManager p2pAwdlController](self, "p2pAwdlController"), "mAwdlEnabled"));
    }
  }
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("RCU2SupportIntegrated")))-[WCM_CtrXPCClient updateAWDLRealTimeMode:](-[WCM_RCU2Controller threadClient](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "threadClient"), "updateAWDLRealTimeMode:", -[WCM_P2PAWDLController mRealTimeAwdlTrafficEnabled](-[WCM_PolicyManager p2pAwdlController](self, "p2pAwdlController"), "mRealTimeAwdlTrafficEnabled"));
}

- (void)updateWiFiRCU2CoexMode
{
  if (-[WCM_PolicyManager wifiController](self, "wifiController"))
  {
    if (-[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState"))
      -[WCM_WiFiController updateWiFiRCU2CoexMode:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateWiFiRCU2CoexMode:", -[WCM_RCU2Controller getRC2CoexMode](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "getRC2CoexMode"));
  }
}

- (void)updateWiFiRCU2PMProtectionMode
{
  if (-[WCM_PolicyManager wifiController](self, "wifiController"))
  {
    if (-[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState"))
      -[WCM_WiFiController updateWiFiRCU2PMProtectionMode:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateWiFiRCU2PMProtectionMode:", -[WCM_RCU2Controller getRC2PMProtectionMode](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "getRC2PMProtectionMode"));
  }
}

- (void)updateWiFiRCU2ULOFDMAStatus
{
  unsigned int v3;
  unsigned int v4;
  const char *v5;
  int v6;
  int v7;
  _BOOL8 v8;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Handle WiFi RC2 UL_OFDMA state change"));
  if (-[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState"))
  {
    v3 = -[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState");
    v4 = -[WCM_WiFiController didWiFiDeviceReset](-[WCM_PolicyManager wifiController](self, "wifiController"), "didWiFiDeviceReset");
    if (v3 >= 4)
    {
      v5 = "INVALID_STATE!!!";
      if (v3 == 4)
        v5 = "ASSOCIATED_6G";
    }
    else
    {
      v5 = off_100205430[v3];
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFiState(%s)"), v5);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFiState : Power:(%d) ChannelNo:(%d)"), -[WCM_RCU2Controller mRCU2PowerOn](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "mRCU2PowerOn"), (__int16)-[WCM_RCU2Controller mRCU2ChannelNum](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "mRCU2ChannelNum"));
    v6 = v3 == 2;
    if (byte_1002713E5 == v6)
      v7 = v4;
    else
      v7 = 1;
    if (v7 == 1)
    {
      v8 = v3 == 2;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFi/RCU2 UL OFDMA disable state change prev (%d) current (%d) wifiReset (%d)"), byte_1002713E5, v8, v4);
      byte_1002713E5 = v6;
      -[WCM_WiFiController updateWiFiRCU2ULOFDMAstate:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateWiFiRCU2ULOFDMAstate:", v8);
    }
  }
  else
  {
    byte_1002713E5 = 0;
  }
}

- (void)updateBTRCU2TimingArray
{
  unsigned int v3;
  unsigned __int8 v4;
  unsigned int v5;
  unint64_t v6;
  unsigned int v7;
  id v8;
  _UNKNOWN **v9;
  _UNKNOWN **v10;
  _UNKNOWN **v11;
  _QWORD v12[3];

  if (-[WCM_PolicyManager wifiController](self, "wifiController"))
    v3 = -[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState");
  else
    v3 = 0;
  if (-[WCM_PolicyManager btController](self, "btController"))
    v4 = -[WCM_BTController powerState](-[WCM_PolicyManager btController](self, "btController"), "powerState");
  else
    v4 = 0;
  if (!-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"))
  {
    v5 = 0;
    if ((v4 & 1) != 0)
      goto LABEL_9;
LABEL_19:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("BT is OFF"));
    return;
  }
  v5 = -[WCM_RCU2Controller mRCU2PowerOn](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "mRCU2PowerOn");
  if ((v4 & 1) == 0)
    goto LABEL_19;
LABEL_9:
  v6 = -[WCM_BTController getNumberOfBTGameCtrlDev](-[WCM_PolicyManager btController](self, "btController"), "getNumberOfBTGameCtrlDev");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Getting RCU2 radio status %d total controllers >= 2 ? %d"), v5, v6 > 1);
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("RCU2DisableCTS2S"))&& !-[WCM_RCU2Controller mRCU2ChannelActivity](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "mRCU2ChannelActivity"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Disabling RCU2 CTS2S"));
LABEL_21:
    v11 = &off_1002308A0;
    v9 = &off_1002308A0;
    v10 = &off_1002308A0;
    goto LABEL_22;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Enabling RCU2 CTS2S"));
  if (v6 > 1)
    v7 = v5;
  else
    v7 = 0;
  if (v7 != 1
    || v3
    && -[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState") == 2)
  {
    goto LABEL_21;
  }
  v8 = -[WCM_RCU2Controller getRC2BTTimingParam](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "getRC2BTTimingParam");
  v9 = (_UNKNOWN **)objc_msgSend(v8, "objectAtIndex:", 0);
  v10 = (_UNKNOWN **)objc_msgSend(v8, "objectAtIndex:", 1);
  v11 = (_UNKNOWN **)objc_msgSend(v8, "objectAtIndex:", 2);
LABEL_22:
  v12[0] = v11;
  v12[1] = v9;
  v12[2] = v10;
  -[WCM_BTController updateBTRCU2TimingArray:](-[WCM_PolicyManager btController](self, "btController"), "updateBTRCU2TimingArray:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 3));
}

- (void)updateWiFiRCU2TimingArray
{
  unsigned __int8 v3;
  unsigned int v4;
  unsigned int v5;
  _BOOL8 v6;
  _BOOL4 v7;
  id v8;
  _UNKNOWN **v9;
  _UNKNOWN **v10;
  _UNKNOWN **v11;
  _UNKNOWN **v12;
  _UNKNOWN **v13;
  uint64_t v14;
  _QWORD v15[3];

  if (-[WCM_PolicyManager wifiController](self, "wifiController"))
    v3 = -[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState");
  else
    v3 = 0;
  if (-[WCM_PolicyManager btController](self, "btController"))
    v4 = -[WCM_BTController powerState](-[WCM_PolicyManager btController](self, "btController"), "powerState");
  else
    v4 = 0;
  if (-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"))
    v5 = -[WCM_RCU2Controller mRCU2PowerOn](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "mRCU2PowerOn");
  else
    v5 = 0;
  v6 = -[WCM_WiFiService getP2pRCU2CoexEventStatus](-[WCM_WiFiController wifiService](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiService"), "getP2pRCU2CoexEventStatus");
  -[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState");
  if (v4)
    v7 = -[WCM_BTController getNumberOfBTGameCtrlDev](-[WCM_PolicyManager btController](self, "btController"), "getNumberOfBTGameCtrlDev") > 1;
  else
    v7 = 0;
  if ((v3 & 1) == 0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFi is OFF"));
    return;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Channel activity %lld"), -[WCM_RCU2Controller mRCU2ChannelActivity](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "mRCU2ChannelActivity"));
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("RCU2DisableCTS2S"))&& !-[WCM_RCU2Controller mRCU2ChannelActivity](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "mRCU2ChannelActivity"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Disabling RCU2 CTS2S"), v14);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Enabling RCU2 CTS2S"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("P2pRCU2CoexEventInProgress(%d)"), v6);
    if (v5 & v6)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Disabling CTS2S due to P2pRCU2CoexEventInProgress(%d)"), v6);
    }
    else if (v5)
    {
      v8 = -[WCM_RCU2Controller getRC2WiFiTimingParam](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "getRC2WiFiTimingParam");
      v9 = (_UNKNOWN **)objc_msgSend(v8, "objectAtIndex:", 0);
      v10 = (_UNKNOWN **)objc_msgSend(v8, "objectAtIndex:", 1);
      v11 = (_UNKNOWN **)objc_msgSend(v8, "objectAtIndex:", 2);
      v12 = (_UNKNOWN **)objc_msgSend(v8, "objectAtIndex:", 3);
      if (v7)
        v13 = v12;
      else
        v13 = v11;
      goto LABEL_25;
    }
  }
  v13 = &off_1002308A0;
  v9 = &off_1002308A0;
  v10 = &off_1002308A0;
LABEL_25:
  v15[0] = v13;
  v15[1] = v9;
  v15[2] = v10;
  -[WCM_WiFiController updateWiFiRCU2TimingArray:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateWiFiRCU2TimingArray:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 3));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Sent message to WiFi: RC2 grant params, updated GCs"));
}

- (void)updateWiFiRCU2CoexParams
{
  id v3;
  _UNKNOWN **v4;
  _UNKNOWN **v5;
  _QWORD v6[4];

  if (-[WCM_PolicyManager wifiController](self, "wifiController")
    && -[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState"))
  {
    if (-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller")
      && -[WCM_RCU2Controller mRCU2PowerOn](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "mRCU2PowerOn"))
    {
      v3 = -[WCM_RCU2Controller getRC2WiFiTimingParam](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "getRC2WiFiTimingParam");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("updateWiFiRCU2CoexParams - not ignoring t3/t4 as channel activity is not 0"));
      v4 = (_UNKNOWN **)objc_msgSend(v3, "objectAtIndex:", 0);
      v5 = (_UNKNOWN **)objc_msgSend(v3, "objectAtIndex:", 1);
    }
    else
    {
      v5 = &off_1002308A0;
      v4 = &off_1002308A0;
    }
    v6[0] = -[WCM_RCU2Controller getRC2CoexMode](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "getRC2CoexMode");
    v6[1] = v4;
    v6[2] = v5;
    v6[3] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[WCM_RCU2Controller mRCU2ChannelNum](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "mRCU2ChannelNum"));
    -[WCM_WiFiController updateRCU2CoexParams:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateRCU2CoexParams:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 4));
  }
}

- (void)handleWiFiRCU2Change
{
  unsigned int v3;

  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("RCU2Support")))
  {
    if (-[WCM_PolicyManager wifiController](self, "wifiController"))
    {
      -[WCM_WiFiController didWiFiDeviceReset](-[WCM_PolicyManager wifiController](self, "wifiController"), "didWiFiDeviceReset");
      v3 = -[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("handleWiFiRCU2Change state change WiFi (%d) and RC2 (%d)"), -[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState"), -[WCM_RCU2Controller mRCU2PowerOn](-[WCM_PolicyManager rcu2Controller](self, "rcu2Controller"), "mRCU2PowerOn"));
      if (v3)
      {
        -[WCM_PolicyManager updateWiFiRCU2CoexParams](self, "updateWiFiRCU2CoexParams");
        -[WCM_PolicyManager updateWiFiRCU2CoexMode](self, "updateWiFiRCU2CoexMode");
        -[WCM_PolicyManager updateWiFiRCU2PMProtectionMode](self, "updateWiFiRCU2PMProtectionMode");
        -[WCM_PolicyManager updateWiFiRCU2ULOFDMAStatus](self, "updateWiFiRCU2ULOFDMAStatus");
      }
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("handleWiFiRCU2Change WiFi state change wifiReset (%d)"), 0);
    }
  }
}

- (id)getLTErFemFrequencyRanges:(BOOL)a3
{
  _BOOL4 v3;
  WCM_PlatformManager *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  double *v11;
  double v12;
  double v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  double *v19;
  double v20;
  double v21;
  NSNumber *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _BYTE v34[128];
  _QWORD v35[2];
  _QWORD v36[2];
  _BYTE v37[128];

  v3 = a3;
  v4 = -[WCM_PolicyManager platformManager](self, "platformManager");
  v5 = objc_alloc_init((Class)NSMutableArray);
  if (v3)
  {
    v6 = -[NSDictionary objectForKey:](-[WCM_PlatformManager wcmGen9rFemDefaultMode2gWiFiCellularbands](v4, "wcmGen9rFemDefaultMode2gWiFiCellularbands"), "objectForKey:", CFSTR("LTE"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(v6);
          v11 = (double *)((char *)&unk_1001DC7E8
                         + 32
                         * objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), "unsignedIntValue"));
          v12 = v11[2];
          v13 = v11[3];
          v35[0] = CFSTR("frequency_lower");
          v36[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12);
          v35[1] = CFSTR("frequency_upper");
          v36[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13);
          objc_msgSend(v5, "addObject:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 2));
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      }
      while (v8);
    }
  }
  else
  {
    v14 = -[NSDictionary objectForKey:](-[WCM_PlatformManager wcmGen9rFemDefaultMode5gWiFiCellularbands](v4, "wcmGen9rFemDefaultMode5gWiFiCellularbands"), "objectForKey:", CFSTR("LTE"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v14);
          v19 = (double *)((char *)&unk_1001DC7E8
                         + 32
                         * objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j), "unsignedIntValue"));
          v20 = v19[2];
          v21 = v19[3];
          v32[0] = CFSTR("frequency_lower");
          v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20);
          v32[1] = CFSTR("frequency_upper");
          v33[0] = v22;
          v33[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v21);
          objc_msgSend(v5, "addObject:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 2));
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      }
      while (v16);
    }
  }
  return v5;
}

- (id)getNRrFemFrequencyRanges:(BOOL)a3
{
  _BOOL4 v3;
  WCM_PlatformManager *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  double *v11;
  double v12;
  double v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  double *v19;
  double v20;
  double v21;
  NSNumber *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _BYTE v34[128];
  _QWORD v35[2];
  _QWORD v36[2];
  _BYTE v37[128];

  v3 = a3;
  v4 = -[WCM_PolicyManager platformManager](self, "platformManager");
  v5 = objc_alloc_init((Class)NSMutableArray);
  if (v3)
  {
    v6 = -[NSDictionary objectForKey:](-[WCM_PlatformManager wcmGen9rFemDefaultMode2gWiFiCellularbands](v4, "wcmGen9rFemDefaultMode2gWiFiCellularbands"), "objectForKey:", CFSTR("NR"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(v6);
          v11 = (double *)((char *)&unk_1001DBDE8
                         + 32
                         * objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), "unsignedIntValue"));
          v12 = v11[2];
          v13 = v11[3];
          v35[0] = CFSTR("frequency_lower");
          v36[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12);
          v35[1] = CFSTR("frequency_upper");
          v36[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13);
          objc_msgSend(v5, "addObject:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 2));
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      }
      while (v8);
    }
  }
  else
  {
    v14 = -[NSDictionary objectForKey:](-[WCM_PlatformManager wcmGen9rFemDefaultMode5gWiFiCellularbands](v4, "wcmGen9rFemDefaultMode5gWiFiCellularbands"), "objectForKey:", CFSTR("NR"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v14);
          v19 = (double *)((char *)&unk_1001DBDE8
                         + 32
                         * objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j), "unsignedIntValue"));
          v20 = v19[2];
          v21 = v19[3];
          v32[0] = CFSTR("frequency_lower");
          v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20);
          v32[1] = CFSTR("frequency_upper");
          v33[0] = v22;
          v33[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v21);
          objc_msgSend(v5, "addObject:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 2));
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      }
      while (v16);
    }
  }
  return v5;
}

- (void)evaluateGen9rFemConfig
{
  WCM_CellularController *v2;
  WCM_CellularController *v3;
  $03B45E325E2BEB6367864A8B9A334110 *v4;
  $03B45E325E2BEB6367864A8B9A334110 *v5;
  uint64_t v6;
  $DA5954C7369382CD05C4DA3E529A5348 *v7;
  double var1;
  double var2;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unsigned int var8;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  float v22;
  double v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *j;
  void *v34;
  float v35;
  double v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  float v48;
  double v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  float v60;
  double v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  char v70;
  $03B45E325E2BEB6367864A8B9A334110 *v71;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];

  v2 = -[WCM_PolicyManager cellularController](self, "cellularController");
  if (v2)
  {
    v3 = v2;
    v4 = -[WCM_CellularController getActiveULCAConfig](v2, "getActiveULCAConfig");
    if (v4)
    {
      v5 = v4;
      -[WCM_CellularController bandInfoType](v3, "bandInfoType");
      if (v5->var1)
      {
        v6 = 0;
        v69 = 1;
        v70 = 1;
        v71 = v5;
        while (1)
        {
          v7 = &v5->var0[v6];
          var1 = v7->var1;
          var2 = v7->var2;
          v10 = v7->var0 - var1 * 0.5;
          v11 = v7->var0 + var1 * 0.5;
          v12 = v7->var3 * 0.5;
          v13 = var2 - v12;
          v14 = var2 + v12;
          var8 = v7->var8;
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("evaluateGen9rFemConfig, cellBandInfoType = %d ulCFreq %f ulBw %f"), var8, *(_QWORD *)&v7->var0, *(_QWORD *)&var1);
          if (var8 == 64)
            break;
          if (var8 == 1)
          {
            v16 = -[WCM_PolicyManager getLTErFemFrequencyRanges:](self, "getLTErFemFrequencyRanges:", 1);
            v85 = 0u;
            v86 = 0u;
            v87 = 0u;
            v88 = 0u;
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v85, v92, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v86;
              while (2)
              {
                for (i = 0; i != v18; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v86 != v19)
                    objc_enumerationMutation(v16);
                  v21 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)i);
                  objc_msgSend(objc_msgSend(v21, "objectForKey:", CFSTR("frequency_lower")), "floatValue");
                  v23 = v22;
                  objc_msgSend(objc_msgSend(v21, "objectForKey:", CFSTR("frequency_upper")), "floatValue");
                  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("evaluateGen9rFemConfig wifi 2g %f %f %f %f"), *(_QWORD *)&v10, *(_QWORD *)&v11, *(_QWORD *)&v23, v24);
                  objc_msgSend(objc_msgSend(v21, "objectForKey:", CFSTR("frequency_lower")), "floatValue");
                  if (v10 < v25
                    || (objc_msgSend(objc_msgSend(v21, "objectForKey:", CFSTR("frequency_upper")), "floatValue"),
                        v10 > v26))
                  {
                    objc_msgSend(objc_msgSend(v21, "objectForKey:", CFSTR("frequency_lower")), "floatValue");
                    if (v11 < v27)
                      continue;
                    objc_msgSend(objc_msgSend(v21, "objectForKey:", CFSTR("frequency_upper")), "floatValue");
                    if (v11 > v28)
                      continue;
                  }
                  v69 = 0;
                  goto LABEL_32;
                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v85, v92, 16);
                if (v18)
                  continue;
                break;
              }
            }
LABEL_32:

            v42 = -[WCM_PolicyManager getLTErFemFrequencyRanges:](self, "getLTErFemFrequencyRanges:", 0);
            v81 = 0u;
            v82 = 0u;
            v83 = 0u;
            v84 = 0u;
            v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
            if (v43)
            {
              v44 = v43;
              v45 = *(_QWORD *)v82;
LABEL_34:
              v46 = 0;
              while (1)
              {
                if (*(_QWORD *)v82 != v45)
                  objc_enumerationMutation(v42);
                v47 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v46);
                objc_msgSend(objc_msgSend(v47, "objectForKey:", CFSTR("frequency_lower")), "floatValue");
                v49 = v48;
                objc_msgSend(objc_msgSend(v47, "objectForKey:", CFSTR("frequency_upper")), "floatValue");
                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("evaluateGen9rFemConfig wifi 5g %f %f %f %f"), *(_QWORD *)&v13, *(_QWORD *)&v14, *(_QWORD *)&v49, v50);
                objc_msgSend(objc_msgSend(v47, "objectForKey:", CFSTR("frequency_lower")), "floatValue");
                if (v13 >= v51)
                {
                  objc_msgSend(objc_msgSend(v47, "objectForKey:", CFSTR("frequency_upper")), "floatValue");
                  if (v13 <= v52)
                    goto LABEL_57;
                }
                objc_msgSend(objc_msgSend(v47, "objectForKey:", CFSTR("frequency_lower")), "floatValue");
                if (v14 >= v53)
                {
                  objc_msgSend(objc_msgSend(v47, "objectForKey:", CFSTR("frequency_upper")), "floatValue");
                  if (v14 <= v54)
                    goto LABEL_57;
                }
                if (v44 == (id)++v46)
                {
                  v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
                  if (v44)
                    goto LABEL_34;
                  goto LABEL_58;
                }
              }
            }
            goto LABEL_58;
          }
LABEL_59:
          if (++v6 >= (unint64_t)v5->var1)
            goto LABEL_63;
        }
        v29 = -[WCM_PolicyManager getNRrFemFrequencyRanges:](self, "getNRrFemFrequencyRanges:", 1);
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v80 = 0u;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v78;
          while (2)
          {
            for (j = 0; j != v31; j = (char *)j + 1)
            {
              if (*(_QWORD *)v78 != v32)
                objc_enumerationMutation(v29);
              v34 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)j);
              objc_msgSend(objc_msgSend(v34, "objectForKey:", CFSTR("frequency_lower")), "floatValue");
              v36 = v35;
              objc_msgSend(objc_msgSend(v34, "objectForKey:", CFSTR("frequency_upper")), "floatValue");
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("evaluateGen9rFemConfig wifi 2g %f %f %f %f"), *(_QWORD *)&v10, *(_QWORD *)&v11, *(_QWORD *)&v36, v37);
              objc_msgSend(objc_msgSend(v34, "objectForKey:", CFSTR("frequency_lower")), "floatValue");
              if (v10 < v38
                || (objc_msgSend(objc_msgSend(v34, "objectForKey:", CFSTR("frequency_upper")), "floatValue"), v10 > v39))
              {
                objc_msgSend(objc_msgSend(v34, "objectForKey:", CFSTR("frequency_lower")), "floatValue");
                if (v11 < v40)
                  continue;
                objc_msgSend(objc_msgSend(v34, "objectForKey:", CFSTR("frequency_upper")), "floatValue");
                if (v11 > v41)
                  continue;
              }
              v69 = 0;
              goto LABEL_45;
            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
            if (v31)
              continue;
            break;
          }
        }
LABEL_45:

        v42 = -[WCM_PolicyManager getNRrFemFrequencyRanges:](self, "getNRrFemFrequencyRanges:", 0);
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v76 = 0u;
        v55 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v73, v89, 16);
        if (v55)
        {
          v56 = v55;
          v57 = *(_QWORD *)v74;
LABEL_47:
          v58 = 0;
          while (1)
          {
            if (*(_QWORD *)v74 != v57)
              objc_enumerationMutation(v42);
            v59 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v58);
            objc_msgSend(objc_msgSend(v59, "objectForKey:", CFSTR("frequency_lower")), "floatValue");
            v61 = v60;
            objc_msgSend(objc_msgSend(v59, "objectForKey:", CFSTR("frequency_upper")), "floatValue");
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("evaluateGen9rFemConfig wifi 5g %f %f %f %f"), *(_QWORD *)&v13, *(_QWORD *)&v14, *(_QWORD *)&v61, v62);
            objc_msgSend(objc_msgSend(v59, "objectForKey:", CFSTR("frequency_lower")), "floatValue");
            if (v13 >= v63)
            {
              objc_msgSend(objc_msgSend(v59, "objectForKey:", CFSTR("frequency_upper")), "floatValue");
              if (v13 <= v64)
                break;
            }
            objc_msgSend(objc_msgSend(v59, "objectForKey:", CFSTR("frequency_lower")), "floatValue");
            if (v14 >= v65)
            {
              objc_msgSend(objc_msgSend(v59, "objectForKey:", CFSTR("frequency_upper")), "floatValue");
              if (v14 <= v66)
                break;
            }
            if (v56 == (id)++v58)
            {
              v56 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v73, v89, 16);
              if (v56)
                goto LABEL_47;
              goto LABEL_58;
            }
          }
LABEL_57:
          v70 = 0;
        }
LABEL_58:

        v5 = v71;
        goto LABEL_59;
      }
      v69 = 1;
      v70 = 1;
LABEL_63:
      v67 = v69 & 1;
      v68 = v70 & 1;
    }
    else
    {
      v67 = 1;
      v68 = 1;
    }
    -[WCM_PolicyManager setWcmGen9rFemLpmMode2g:](self, "setWcmGen9rFemLpmMode2g:", v67);
    -[WCM_PolicyManager setWcmGen9rFemLpmMode5g:](self, "setWcmGen9rFemLpmMode5g:", v68);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("evaluateGen9rFemConfig 2g Flag %d, 5g Flag %d"), -[WCM_PolicyManager wcmGen9rFemLpmMode2g](self, "wcmGen9rFemLpmMode2g"), -[WCM_PolicyManager wcmGen9rFemLpmMode5g](self, "wcmGen9rFemLpmMode5g"));
  }
}

- (void)evaluateULCARestrictions
{
  WCM_PlatformManager *v3;
  WCM_CellularController *v4;
  $03B45E325E2BEB6367864A8B9A334110 *v5;
  $03B45E325E2BEB6367864A8B9A334110 *v6;
  unint64_t v7;
  id *p_var5;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  unsigned int v19;
  WCM_WiFiCellCoexIssueBandTable *v20;
  _BOOL8 v21;
  id v22;
  unsigned int v23;
  id v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unint64_t var4;
  unsigned int v29;
  unint64_t var5;
  int var3;
  int v32;
  int v33;
  $DA5954C7369382CD05C4DA3E529A5348 *v34;
  __int128 v35;
  __int128 v36;
  $DA5954C7369382CD05C4DA3E529A5348 *v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  $DA5954C7369382CD05C4DA3E529A5348 *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  int var2;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int v52;
  unsigned int v53;
  id v54;
  unsigned int v55;
  __int16 v56;

  v3 = -[WCM_PolicyManager platformManager](self, "platformManager");
  v4 = -[WCM_PolicyManager cellularController](self, "cellularController");
  v55 = -[WCM_WiFiController wifiChannel](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiChannel");
  v53 = -[WCM_WiFiController channelCenterFreqMHz](-[WCM_PolicyManager wifiController](self, "wifiController"), "channelCenterFreqMHz");
  v52 = -[WCM_WiFiController channelBandwidthMHz](-[WCM_PolicyManager wifiController](self, "wifiController"), "channelBandwidthMHz");
  if (v4)
  {
    v5 = -[WCM_CellularController getActiveULCAConfig](v4, "getActiveULCAConfig");
    if (v5)
    {
      v6 = v5;
      -[WCM_CellularController bandInfoType](v4, "bandInfoType");
      *(_QWORD *)&v6->var3 = 0;
      v6->var5 = 0;
      v6->var9 = 0;
      if (v6->var1)
      {
        v7 = 0;
        v54 = 0;
        p_var5 = &v6->var0[0].var5;
        v9 = 99;
        while (1)
        {
          v10 = *((double *)p_var5 - 3);
          v11 = *((double *)p_var5 - 2);
          v12 = *((double *)p_var5 - 5);
          v13 = *((double *)p_var5 - 4);
          v14 = v10 - v11 * 0.5;
          v15 = v10 + v11 * 0.5;
          v16 = v12 - v13 * 0.5;
          v17 = v12 + v13 * 0.5;
          v56 = 0;
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("YYDebug_ evaluateULCARestrictions Carrier %d, UL (%f, %f)"), v7, *(_QWORD *)&v16, *(_QWORD *)&v17);
          *((_BYTE *)p_var5 + 28) = 0;
          v18 = *((unsigned int *)p_var5 + 6);
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_ CC2UnitTest cellBandInfoType: In function evaluateULCARestrictions, ulcaConfig->scell_config[%d].cellBandInfoType = %d"), v7, v18);
          v19 = -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport"));
          v20 = -[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v3, "wcmWiFiCellCoexIssueTable");
          v21 = -[WCM_PolicyManager gpsRadioActive](self, "gpsRadioActive");
          if (v19)
            v22 = -[WCM_WiFiCellCoexIssueBandTable findWiFiAntennaOrCellTxPowerConstraintWiFiEnhCoexIssueByCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:wifiCenterFreq:wifiBandwidth:gpsRadioActive:wifiAntennaConstraint:cellTxPowerConstraint:](v20, "findWiFiAntennaOrCellTxPowerConstraintWiFiEnhCoexIssueByCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:wifiCenterFreq:wifiBandwidth:gpsRadioActive:wifiAntennaConstraint:cellTxPowerConstraint:", v18, v55, v53, v52, v21, (char *)&v56 + 1, v14, v15, v16, v17, &v56);
          else
            v22 = -[WCM_WiFiCellCoexIssueBandTable findWiFiAntennaOrCellTxPowerConstraintCoexIssueByCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:gpsRadioActive:wifiAntennaConstraint:cellTxPowerConstraint:](v20, "findWiFiAntennaOrCellTxPowerConstraintCoexIssueByCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:gpsRadioActive:wifiAntennaConstraint:cellTxPowerConstraint:", v18, v55, v21, (char *)&v56 + 1, &v56, v14, v15, v16, v17);
          *p_var5 = v22;
          if (v22)
          {
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("evaluateULCARestrictions - ULCA Priority %d"), objc_msgSend(v22, "ulcaPriority"));
            if (!v6->var10)
            {
              v6->var2 = v7;
              v6->var10 = 1;
              goto LABEL_14;
            }
            v23 = objc_msgSend(*p_var5, "ulcaPriority");
            if (v23 < objc_msgSend(v54, "ulcaPriority"))
            {
              v6->var2 = v7;
LABEL_14:
              v54 = *p_var5;
            }
          }
          else
          {
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("evaluateULCARestrictions - ULCA NO Coex issue"));
          }
          if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiWCI2BitmapV2Enabled")))
          {
            v24 = -[WCM_WiFiCellCoexIssueBandTable findWiFiVictimCoexIssueByCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v3, "wcmWiFiCellCoexIssueTable"), "findWiFiVictimCoexIssueByCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:", v18, v14, v15, v16, v17);
            p_var5[1] = v24;
            if (v24)
            {
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_ CC2UnitTest: for ulcaConfig->scell_config[%d], currentPri_CCWiFi (%d) > ulcaConfig->scell_config[%d].coexIssueCCWiFi.ulcaPriorityCCWiFi (%d)"), v7, v9, v7, objc_msgSend(v24, "ulcaPriorityCCWiFi"));
              v25 = objc_msgSend(p_var5[1], "ulcaPriorityCCWiFi");
              v24 = p_var5[1];
              if (v25)
              {
                v26 = objc_msgSend(v24, "ulcaPriorityCCWiFi");
                v24 = p_var5[1];
                if (v9 > v26)
                {
                  v9 = (uint64_t)objc_msgSend(v24, "ulcaPriorityCCWiFi");
                  v6->var3 = v7;
                  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_ CC2UnitTest: if condition (currentPri_CCWiFi > ulcaConfig->scell_config[%d].coexIssueCCWiFi.ulcaPriorityCCWiFi) is true. After assignment, currentPri_CCWiFi = (%d) and ulcaConfig->scell_config[i].coexIssueCCWiFi.ulcaPriorityCCWiFi=(%d)"), v7, v9, objc_msgSend(p_var5[1], "ulcaPriorityCCWiFi"));
                  v24 = p_var5[1];
                }
              }
            }
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_ CC2UnitTest: Upon finishing single iteration (%d), ulcaConfig->scell_config[%d].coexIssueCCWiFi.ulcaPriorityCCWiFi=%d and currentPri_CCWiFi=(%d)"), v7, v7, objc_msgSend(v24, "ulcaPriorityCCWiFi"), v9);
          }
          if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFi5GHzType7NR79AntBlocking")))
          {
            v27 = -[WCM_WiFiCellCoexIssueBandTable isNR79FoundForCellUlLowFreq:cellUlHighFreq:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v3, "wcmWiFiCellCoexIssueTable"), "isNR79FoundForCellUlLowFreq:cellUlHighFreq:", v16, v17);
            *((_BYTE *)p_var5 + 28) = v27;
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_ CC2UnitTest: ulcaConfig->scell_config[%d].nr79Found=%d"), v7, v27);
            var4 = v6->var4;
            if (*((_BYTE *)p_var5 + 28) && v17 > v6->var0[(int)var4].var0 + v6->var0[(int)var4].var1 * 0.5)
            {
              v6->var4 = v7;
              var4 = v7;
            }
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("DLDebug_ CC2UnitTest: for ulcaConfig->scell_config[%d], ulcaConfig->criticalCarrieridxNR79=%d"), v7, var4);
          }
          if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("Type72GWiFiSupport")))
          {
            v29 = -[WCM_WiFiCellCoexIssueBandTable isLTEB7FoundForCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v3, "wcmWiFiCellCoexIssueTable"), "isLTEB7FoundForCellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:", v14, v15, v16, v17);
            *((_BYTE *)p_var5 + 29) = v29;
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("TYPE7_2GWIFI_SUPPORT_ : ulcaConfig->scell_config[%d].lteB7Found=%d"), v7, v29);
            var5 = v6->var5;
            if (*((_BYTE *)p_var5 + 29) && v11 > v6->var0[(int)var5].var3 && v6->var0[(int)var5].var10)
            {
              v6->var5 = v7;
              var5 = v7;
            }
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("TYPE7_2GWIFI_SUPPORT_ for ulcaConfig->scell_config[%d], ulcaConfig->criticalCarrieridxLTEB7=%d"), v7, var5);
          }
          ++v7;
          p_var5 += 9;
          if (v7 >= v6->var1)
          {
            var3 = v6->var3;
            v32 = v6->var4;
            v33 = v6->var5;
            goto LABEL_35;
          }
        }
      }
      v33 = 0;
      v32 = 0;
      var3 = 0;
      v9 = 99;
LABEL_35:
      v34 = &v6->var0[var3];
      v35 = *(_OWORD *)&v34->var2;
      *(_QWORD *)&v6->var6.var8 = *(_QWORD *)&v34->var8;
      *(_OWORD *)&v6->var6.var6 = *(_OWORD *)&v34->var6;
      *(_OWORD *)&v6->var6.var0 = *(_OWORD *)&v34->var0;
      v36 = *(_OWORD *)&v34->var4;
      *(_OWORD *)&v6->var6.var2 = v35;
      *(_OWORD *)&v6->var6.var4 = v36;
      v37 = &v6->var0[v32];
      *(_OWORD *)&v6->var7.var0 = *(_OWORD *)&v37->var0;
      v38 = *(_OWORD *)&v37->var6;
      v39 = *(_QWORD *)&v37->var8;
      v40 = *(_OWORD *)&v37->var2;
      *(_OWORD *)&v6->var7.var4 = *(_OWORD *)&v37->var4;
      *(_OWORD *)&v6->var7.var2 = v40;
      *(_QWORD *)&v6->var7.var8 = v39;
      *(_OWORD *)&v6->var7.var6 = v38;
      v41 = &v6->var0[v33];
      *(_OWORD *)&v6->var8.var0 = *(_OWORD *)&v41->var0;
      v42 = *(_OWORD *)&v41->var2;
      v43 = *(_OWORD *)&v41->var4;
      v44 = *(_OWORD *)&v41->var6;
      *(_QWORD *)&v6->var8.var8 = *(_QWORD *)&v41->var8;
      *(_OWORD *)&v6->var8.var4 = v43;
      *(_OWORD *)&v6->var8.var6 = v44;
      *(_OWORD *)&v6->var8.var2 = v42;
      var2 = v6->var2;
      if (var2 == -1)
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("evaluateULCARestrictions -ULCA NO Coex issue to report"), v47, v49);
      else
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("evaluateULCARestrictions - ULCA Priority - Selected coex Priority = %d and Critical Carrier Index = %d"), objc_msgSend(v6->var0[var2].var5, "ulcaPriority"), v6->var2);
      if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiWCI2BitmapV2Enabled")))
      {
        v46 = v6->var3;
        if (v46 == -1)
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("WCI2V2 - ULCA NO Coex issue to report"), v48, v50, v51);
        else
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WCI2V2 - CC_WiFi priority is %d (self test value (currentPri_CCWiFi): %d) and CC_WiFi Index = %d"), objc_msgSend(v6->var0[v46].var6, "ulcaPriorityCCWiFi"), v9, v6->var3);
      }
    }
  }
}

- (unsigned)getWifiAntennaBitmapForPencilCoexByPlatform
{
  if (-[WCM_PlatformManager wrmPlatformId](-[WCM_PolicyManager platformManager](self, "platformManager"), "wrmPlatformId") == 170|| -[WCM_PlatformManager wrmPlatformId](-[WCM_PolicyManager platformManager](self, "platformManager"), "wrmPlatformId") == 168)
  {
    return 512;
  }
  if (-[WCM_PlatformManager wrmPlatformId](-[WCM_PolicyManager platformManager](self, "platformManager"), "wrmPlatformId") == 162|| -[WCM_PlatformManager wrmPlatformId](-[WCM_PolicyManager platformManager](self, "platformManager"), "wrmPlatformId") == 164|| -[WCM_PlatformManager wrmPlatformId](-[WCM_PolicyManager platformManager](self, "platformManager"), "wrmPlatformId") == 166)
  {
    return 128;
  }
  return 0;
}

- (unsigned)getBtBlockedAntennaForPencilCoexByPlatform
{
  if (-[WCM_PlatformManager wrmPlatformId](-[WCM_PolicyManager platformManager](self, "platformManager"), "wrmPlatformId") == 170|| -[WCM_PlatformManager wrmPlatformId](-[WCM_PolicyManager platformManager](self, "platformManager"), "wrmPlatformId") == 168)
  {
    return 14;
  }
  if (-[WCM_PlatformManager wrmPlatformId](-[WCM_PolicyManager platformManager](self, "platformManager"), "wrmPlatformId") == 162|| -[WCM_PlatformManager wrmPlatformId](-[WCM_PolicyManager platformManager](self, "platformManager"), "wrmPlatformId") == 164|| -[WCM_PlatformManager wrmPlatformId](-[WCM_PolicyManager platformManager](self, "platformManager"), "wrmPlatformId") == 166)
  {
    return 13;
  }
  return 0;
}

- (void)updatePencilCoexActivationCondition
{
  WCM_CellularController *v3;
  $03B45E325E2BEB6367864A8B9A334110 *v4;
  $03B45E325E2BEB6367864A8B9A334110 *v5;
  unint64_t v6;
  int v7;
  double *p_var1;
  double v9;
  double v10;
  double v11;
  double v12;
  unsigned int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _BOOL4 v28;
  const __CFString *v29;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("YYDebug_ check pencil coex activation condition"));
  v3 = -[WCM_PolicyManager cellularController](self, "cellularController");
  if (!-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("EnableULCA")))goto LABEL_14;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("YYDebug_ ENABLED_UL_CA"));
  if (!v3 || (v4 = -[WCM_CellularController getActiveULCAConfig](v3, "getActiveULCAConfig")) == 0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("YYDebug_ pencil coex Error: No ULCA config"));
    goto LABEL_14;
  }
  v5 = v4;
  if (!v4->var1)
  {
LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
  v6 = 0;
  v7 = 0;
  p_var1 = &v4->var0[0].var1;
  do
  {
    v9 = *(p_var1 - 1);
    v10 = *p_var1 * 0.5;
    v11 = v9 - v10;
    v12 = v9 + v10;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("YYDebug_ Carrier %d, UL (%f, %f)"), v6, v9 - v10, v9 + v10);
    if (v11 <= 2315.0 && v12 >= 2305.0)
      v7 = 1;
    ++v6;
    p_var1 += 9;
  }
  while (v6 < v5->var1);
  v14 = v7;
LABEL_15:
  -[WCM_CellularController ulCenterFreq](v3, "ulCenterFreq");
  if (v15 != 0.0)
  {
    -[WCM_CellularController ulBandwidth](v3, "ulBandwidth");
    if (v16 != 0.0)
    {
      -[WCM_CellularController ulCenterFreq](v3, "ulCenterFreq");
      v18 = v17;
      -[WCM_CellularController ulBandwidth](v3, "ulBandwidth");
      v20 = v19;
      -[WCM_CellularController ulCenterFreq](v3, "ulCenterFreq");
      v22 = v21;
      -[WCM_CellularController ulBandwidth](v3, "ulBandwidth");
      v24 = v23;
      if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("EnableULCA")))
      {
        v25 = v18 - v20 * 0.5;
        v26 = v22 + v24 * 0.5;
      }
      else
      {
        -[WCM_CellularController getCombinedUplinkFreqRange](v3, "getCombinedUplinkFreqRange");
        v26 = v25 + v27;
      }
      v28 = v26 >= 2305.0;
      if (v25 > 2315.0)
        v28 = 0;
      v14 |= v28;
    }
  }
  if (self->_pencilCoexActive == v14)
  {
    v29 = CFSTR("YYDebug_ No need to update pencil coex activation condition. Current condition is %d");
  }
  else
  {
    self->_pencilCoexActive = v14;
    v29 = CFSTR("YYDebug_ Need to update pencil coex activation condition to %d");
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, v29, v14);
}

- (void)updateWifiAntennaSelectionV1V2Configs
{
  WCM_PlatformManager *v3;
  WCM_CellularController *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  unsigned int v27;
  unsigned __int16 v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned __int16 v32;
  uint64_t v33;
  uint64_t v34;
  unsigned __int16 v35;
  WCM_WiFiController *v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  WCM_WiFiController *v46;
  double v47;
  double v48;
  __int16 v49;
  __int16 v50;
  __int16 v51;
  __int16 v52;
  __int16 v53;
  int v54;
  int v55;
  int v56;
  __int16 v57;
  id v58;
  void *v59;
  unsigned int v60;
  int v61;
  __int16 v62;
  void *v63;
  unsigned int v64;
  __int16 v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  unsigned int v69;
  unsigned int v70;
  unsigned int v71;
  unsigned int v72;
  __int16 v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  unsigned int v77;
  __int16 v78;
  unsigned int v79;
  unsigned int v80;
  unsigned int v81;
  unsigned int v82;
  unsigned int v83;
  unsigned int v84;
  unsigned int v85;
  unsigned int v86;
  unsigned int v87;
  unsigned int v88;
  unsigned int v89;
  uint64_t v90;
  int v91;
  int v92;
  int v93;
  unsigned int v94;
  int v95;
  __int16 v96;
  unsigned int v97;
  int v98;
  unsigned int v99;
  unsigned int v100;
  int v101;
  unsigned int v102;
  int v103;
  unsigned __int16 v104;
  __int16 v105;
  unsigned __int16 v106;
  __int16 v107;
  unsigned __int16 v108;
  __int16 v109;
  unsigned __int16 v110;
  __int16 v111;
  unsigned __int16 v112;
  __int16 v113;
  unsigned __int16 v114;
  unsigned int v115;
  double v116;
  unsigned __int16 v117;
  __int16 v118;
  _QWORD v119[16];
  _QWORD v120[4];

  v3 = -[WCM_PolicyManager platformManager](self, "platformManager");
  v4 = -[WCM_PolicyManager cellularController](self, "cellularController");
  if (!-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v3, "wcmWiFiCellCoexIssueTable"))
    return;
  if (-[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState") < 2|| (-[WCM_CellularController dlCenterFreq](v4, "dlCenterFreq"), v5 == 0.0)|| (-[WCM_CellularController dlBandwidth](v4, "dlBandwidth"), v6 == 0.0))
  {
    v115 = 0;
    v27 = 0;
    v104 = -4096;
    v106 = -8192;
    v108 = -12288;
    v110 = -20480;
    v112 = -24576;
    v28 = -28672;
    v97 = 28672;
    v99 = 24576;
    v102 = 20480;
    v29 = 12288;
    v30 = 0x2000;
    v31 = 4096;
    v32 = -16384;
    v117 = 0x8000;
    v33 = 0x4000;
    LODWORD(v34) = 0x4000;
    v114 = 0x8000;
    v35 = -16384;
    goto LABEL_10;
  }
  -[WCM_CellularController ulCenterFreq](v4, "ulCenterFreq");
  if (v7 == 0.0)
    return;
  -[WCM_CellularController ulBandwidth](v4, "ulBandwidth");
  if (v8 == 0.0)
    return;
  v9 = (id)-[WCM_CellularController bandInfoType](v4, "bandInfoType");
  -[WCM_CellularController dlCenterFreq](v4, "dlCenterFreq");
  v116 = v10;
  -[WCM_CellularController dlBandwidth](v4, "dlBandwidth");
  v12 = v11;
  -[WCM_CellularController dlCenterFreq](v4, "dlCenterFreq");
  v14 = v13;
  -[WCM_CellularController dlBandwidth](v4, "dlBandwidth");
  v16 = v15;
  -[WCM_CellularController ulCenterFreq](v4, "ulCenterFreq");
  v18 = v17;
  -[WCM_CellularController ulBandwidth](v4, "ulBandwidth");
  v20 = v19;
  -[WCM_CellularController ulCenterFreq](v4, "ulCenterFreq");
  v22 = v21;
  -[WCM_CellularController ulBandwidth](v4, "ulBandwidth");
  v24 = v23;
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("EnableULCA")))
  {
    v25 = v18 - v20 * 0.5;
    v26 = v22 + v24 * 0.5;
  }
  else
  {
    -[WCM_CellularController getCombinedUplinkFreqRange](v4, "getCombinedUplinkFreqRange");
    v25 = v47;
    v26 = v47 + v48;
  }
  v118 = 0;
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("YYDebug_ executing v1/v2 wifi antenna selection in WiFiEnh platforms"));
    v115 = 0;
    v27 = 0;
    v49 = -4096;
    v50 = -8192;
    v51 = -12288;
    v52 = -20480;
    v53 = -24576;
    v28 = -28672;
    v54 = 28672;
    v55 = 24576;
    v56 = 20480;
    v29 = 12288;
    v30 = 0x2000;
    v31 = 4096;
    v32 = -16384;
    v117 = 0x8000;
    v33 = 0x4000;
    goto LABEL_47;
  }
  v58 = -[WCM_WiFiCellCoexIssueBandTable findWiFiAntennaOrCellTxPowerConstraintCoexIssueByCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:gpsRadioActive:wifiAntennaConstraint:cellTxPowerConstraint:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v3, "wcmWiFiCellCoexIssueTable"), "findWiFiAntennaOrCellTxPowerConstraintCoexIssueByCellBandInfoType:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:gpsRadioActive:wifiAntennaConstraint:cellTxPowerConstraint:", v9, -[WCM_WiFiController wifiChannel](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiChannel"), -[WCM_PolicyManager gpsRadioActive](self, "gpsRadioActive"), (char *)&v118 + 1, &v118, v116 - v12 * 0.5, v14 + v16 * 0.5, v25, v26);
  v27 = 0;
  v49 = -4096;
  v50 = -8192;
  v51 = -12288;
  v52 = -20480;
  v53 = -24576;
  v28 = -28672;
  v54 = 28672;
  v55 = 24576;
  v56 = 20480;
  v29 = 12288;
  v30 = 0x2000;
  v31 = 4096;
  v32 = -16384;
  v33 = 0x4000;
  v115 = 0;
  v117 = 0x8000;
  if (!v58)
  {
    LODWORD(v34) = 0x4000;
    v114 = 0x8000;
    v57 = -16384;
    goto LABEL_49;
  }
  LODWORD(v34) = 0x4000;
  v114 = 0x8000;
  v57 = -16384;
  if (HIBYTE(v118))
  {
    v59 = v58;
    if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("AntennaSelectionCoex")))
    {
      if (objc_msgSend(v59, "wifiUlAntennaBitmapOnCellLAT"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("apply WiFi UL antenna constraint for Cellular primary antenna"));
        v60 = objc_msgSend(v59, "wifiUlAntennaBitmapOnCellLAT");
        v61 = (v60 << 7) | 0x2000;
        v62 = ((_WORD)v60 << 7) | 0xA000;
      }
      else
      {
        v61 = 0;
        v62 = 0x8000;
      }
      v117 = v62;
      if (objc_msgSend(v59, "wifiUlAntennaBitmapOnCellUAT"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("apply WiFi UL antenna constraint for Cellular secondary antenna"));
        v66 = objc_msgSend(v59, "wifiUlAntennaBitmapOnCellUAT") << 7;
        v33 = v66 | 0x6000;
        v32 = v66 | 0xE000;
      }
      else
      {
        v32 = -16384;
      }
      if (objc_msgSend(v59, "wifiDlAntennaBitmapOnCellLAT"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("apply WiFi DL antenna constraint for Cellular primary antenna"));
        v67 = objc_msgSend(v59, "wifiDlAntennaBitmapOnCellLAT") | 0x40;
        v61 |= v67;
        v117 |= v67;
      }
      v115 = v61;
      if (objc_msgSend(v59, "wifiDlAntennaBitmapOnCellUAT"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("apply WiFi DL antenna constraint for Cellular secondary antenna"));
        v68 = objc_msgSend(v59, "wifiDlAntennaBitmapOnCellUAT");
        v27 = 0;
        v33 = v33 | v68 | 0x40;
        v32 |= (unsigned __int16)v68 | 0x40;
      }
      else
      {
        v27 = 0;
      }
      v49 = -4096;
      v50 = -8192;
      v51 = -12288;
      v57 = -16384;
      v52 = -20480;
      v53 = -24576;
      v28 = -28672;
      v114 = 0x8000;
      v54 = 28672;
      v55 = 24576;
      v56 = 20480;
      v29 = 12288;
      goto LABEL_49;
    }
    v63 = v59;
    if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("AntennaSelectionV1_1Coex")))
    {
      if (objc_msgSend(v59, "wifiUlAntennaBitmapOnCellLAT"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("apply WiFi UL antenna constraint for Cellular primary antenna"));
        v64 = objc_msgSend(v59, "wifiUlAntennaBitmapOnCellLAT");
        v27 = (v64 << 6) | 0x800;
        v65 = ((_WORD)v64 << 6) | 0x8800;
      }
      else
      {
        v27 = 0;
        v65 = 0x8000;
      }
      if (objc_msgSend(v63, "wifiUlAntennaBitmapOnCellUAT"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("apply WiFi UL antenna constraint for Cellular secondary antenna"));
        v69 = objc_msgSend(v63, "wifiUlAntennaBitmapOnCellUAT");
        v31 = (v69 << 6) | 0x1800;
        v28 = ((_WORD)v69 << 6) | 0x9800;
      }
      else
      {
        v28 = -28672;
      }
      if (objc_msgSend(v63, "wifiDlAntennaBitmapOnCellLAT"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("apply WiFi DL antenna constraint for Cellular primary antenna"));
        v70 = objc_msgSend(v63, "wifiDlAntennaBitmapOnCellLAT") | 0x20;
        v27 |= v70;
        v65 |= v70;
      }
      v114 = v65;
      if (objc_msgSend(v63, "wifiDlAntennaBitmapOnCellUAT"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("apply WiFi DL antenna constraint for Cellular secondary antenna"));
        v71 = objc_msgSend(v63, "wifiDlAntennaBitmapOnCellUAT");
        v115 = 0;
        v31 |= v71 | 0x20;
        v28 |= (unsigned __int16)v71 | 0x20;
      }
      else
      {
        v115 = 0;
      }
      v49 = -4096;
      v50 = -8192;
      v51 = -12288;
      v52 = -20480;
      v53 = -24576;
      v54 = 28672;
      v55 = 24576;
      v56 = 20480;
      v32 = -16384;
      v117 = 0x8000;
      LODWORD(v34) = 0x4000;
      goto LABEL_48;
    }
    if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("AntennaSelectionV2Coex"))&& !-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport")))
    {
      if (objc_msgSend(v59, "wifiUlAntennaBitmapOnCellAntBitmap000"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("apply WiFi UL antenna constraint for Cellular Antenna Bitmap 000"));
        v72 = objc_msgSend(v59, "wifiUlAntennaBitmapOnCellAntBitmap000");
        v27 = (v72 << 6) | 0x800;
        v73 = ((_WORD)v72 << 6) | 0x8800;
      }
      else
      {
        v27 = 0;
        v73 = 0x8000;
      }
      if (objc_msgSend(v59, "wifiUlAntennaBitmapOnCellAntBitmap001"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("apply WiFi UL antenna constraint for Cellular Antenna bitmap 001"));
        v74 = objc_msgSend(v59, "wifiUlAntennaBitmapOnCellAntBitmap001");
        v95 = (v74 << 6) | 0x1800;
        v96 = ((_WORD)v74 << 6) | 0x9800;
      }
      else
      {
        v96 = -28672;
        v95 = 4096;
      }
      if (objc_msgSend(v59, "wifiUlAntennaBitmapOnCellAntBitmap010"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("apply WiFi UL antenna constraint for Cellular Antenna bitmap 010"));
        v75 = objc_msgSend(v59, "wifiUlAntennaBitmapOnCellAntBitmap010");
        v93 = (v75 << 6) | 0x2800;
        v113 = ((_WORD)v75 << 6) | 0xA800;
      }
      else
      {
        v113 = -24576;
        v93 = 0x2000;
      }
      if (objc_msgSend(v59, "wifiUlAntennaBitmapOnCellAntBitmap011"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("apply WiFi UL antenna constraint for Cellular Antenna bitmap 011"));
        v76 = objc_msgSend(v59, "wifiUlAntennaBitmapOnCellAntBitmap011");
        v92 = (v76 << 6) | 0x3800;
        v111 = ((_WORD)v76 << 6) | 0xB800;
      }
      else
      {
        v111 = -20480;
        v92 = 12288;
      }
      if (objc_msgSend(v59, "wifiUlAntennaBitmapOnCellAntBitmap100"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("apply WiFi UL antenna constraint for Cellular Antenna bitmap 100"));
        v77 = objc_msgSend(v59, "wifiUlAntennaBitmapOnCellAntBitmap100");
        v91 = (v77 << 6) | 0x4800;
        v78 = ((_WORD)v77 << 6) | 0xC800;
      }
      else
      {
        v78 = -16384;
        v91 = 0x4000;
      }
      if (objc_msgSend(v63, "wifiUlAntennaBitmapOnCellAntBitmap101"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("apply WiFi UL antenna constraint for Cellular Antenna bitmap 101"));
        v79 = objc_msgSend(v63, "wifiUlAntennaBitmapOnCellAntBitmap101");
        v103 = (v79 << 6) | 0x5800;
        v109 = ((_WORD)v79 << 6) | 0xD800;
      }
      else
      {
        v109 = -12288;
        v103 = 20480;
      }
      if (objc_msgSend(v63, "wifiUlAntennaBitmapOnCellAntBitmap110"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("apply WiFi UL antenna constraint for Cellular Antenna bitmap 110"));
        v80 = objc_msgSend(v63, "wifiUlAntennaBitmapOnCellAntBitmap110");
        v101 = (v80 << 6) | 0x6800;
        v107 = ((_WORD)v80 << 6) | 0xE800;
      }
      else
      {
        v107 = -8192;
        v101 = 24576;
      }
      if (objc_msgSend(v63, "wifiUlAntennaBitmapOnCellAntBitmap111"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("apply WiFi UL antenna constraint for Cellular Antenna bitmap 111"));
        v81 = objc_msgSend(v63, "wifiUlAntennaBitmapOnCellAntBitmap111");
        v98 = (v81 << 6) | 0x7800;
        v105 = ((_WORD)v81 << 6) | 0xF800;
      }
      else
      {
        v105 = -4096;
        v98 = 28672;
      }
      if (objc_msgSend(v63, "wifiDlAntennaBitmapOnCellAntBitmap000"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("apply WiFi DL antenna constraint for Cellular Antenna Bitmap 000"));
        v82 = objc_msgSend(v63, "wifiDlAntennaBitmapOnCellAntBitmap000") | 0x20;
        v27 |= v82;
        v73 |= v82;
      }
      if (objc_msgSend(v63, "wifiDlAntennaBitmapOnCellAntBitmap001"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("apply WiFi DL antenna constraint for Cellular Antenna bitmap 001"));
        v83 = objc_msgSend(v63, "wifiDlAntennaBitmapOnCellAntBitmap001") | 0x20;
        v95 |= v83;
        v96 |= v83;
      }
      if (objc_msgSend(v63, "wifiDlAntennaBitmapOnCellAntBitmap010"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("apply WiFi DL antenna constraint for Cellular Antenna bitmap 010"));
        v84 = objc_msgSend(v63, "wifiDlAntennaBitmapOnCellAntBitmap010") | 0x20;
        v93 |= v84;
        v113 |= v84;
      }
      if (objc_msgSend(v63, "wifiDlAntennaBitmapOnCellAntBitmap011"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("apply WiFi DL antenna constraint for Cellular Antenna bitmap 011"));
        v85 = objc_msgSend(v63, "wifiDlAntennaBitmapOnCellAntBitmap011") | 0x20;
        v92 |= v85;
        v111 |= v85;
      }
      if (objc_msgSend(v63, "wifiDlAntennaBitmapOnCellAntBitmap100"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("apply WiFi DL antenna constraint for Cellular Antenna bitmap 100"));
        v86 = objc_msgSend(v63, "wifiDlAntennaBitmapOnCellAntBitmap100") | 0x20;
        v91 |= v86;
        v78 |= v86;
      }
      if (objc_msgSend(v63, "wifiDlAntennaBitmapOnCellAntBitmap101"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("apply WiFi DL antenna constraint for Cellular Antenna bitmap 101"));
        v87 = objc_msgSend(v63, "wifiDlAntennaBitmapOnCellAntBitmap101") | 0x20;
        v103 |= v87;
        v109 |= v87;
      }
      if (objc_msgSend(v63, "wifiDlAntennaBitmapOnCellAntBitmap110"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("apply WiFi DL antenna constraint for Cellular Antenna bitmap 110"));
        v88 = objc_msgSend(v63, "wifiDlAntennaBitmapOnCellAntBitmap110") | 0x20;
        v101 |= v88;
        v107 |= v88;
      }
      v114 = v73;
      if (objc_msgSend(v63, "wifiDlAntennaBitmapOnCellAntBitmap111"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("apply WiFi DL antenna constraint for Cellular Antenna bitmap 111"));
        v89 = objc_msgSend(v63, "wifiDlAntennaBitmapOnCellAntBitmap111");
        v115 = 0;
        v55 = v101;
        v54 = v98 | v89 | 0x20;
        v50 = v107;
        v49 = v105 | v89 | 0x20;
        v32 = -16384;
        v117 = 0x8000;
        v28 = v96;
        v52 = v111;
        v53 = v113;
        v30 = v93;
        v31 = v95;
        v51 = v109;
        v29 = v92;
        v56 = v103;
      }
      else
      {
        v115 = 0;
        v32 = -16384;
        v117 = 0x8000;
        v28 = v96;
        v52 = v111;
        v53 = v113;
        v30 = v93;
        v31 = v95;
        v50 = v107;
        v51 = v109;
        v49 = v105;
        v29 = v92;
        v55 = v101;
        v56 = v103;
        v54 = v98;
      }
      LODWORD(v34) = v91;
      v57 = v78;
      goto LABEL_49;
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("YYDebug_ WiFi antenna selection is not supported"));
    v115 = 0;
    v27 = 0;
    v49 = -4096;
    v50 = -8192;
    v51 = -12288;
    v52 = -20480;
    v53 = -24576;
    v28 = -28672;
    v54 = 28672;
    v55 = 24576;
    v56 = 20480;
    v32 = -16384;
    v117 = 0x8000;
LABEL_47:
    LODWORD(v34) = 0x4000;
    v114 = 0x8000;
LABEL_48:
    v57 = -16384;
  }
LABEL_49:
  v99 = v55;
  v102 = v56;
  v35 = v57;
  v97 = v54;
  v104 = v49;
  v106 = v50;
  v108 = v51;
  v110 = v52;
  v112 = v53;
LABEL_10:
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("AntennaSelectionCoex")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Trying to update antenna selection bitmaps 0x%x 0x%x 0x%x 0x%x"), v115, v33, v117, v32);
    v36 = -[WCM_PolicyManager wifiController](self, "wifiController");
    v120[0] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v115);
    v120[1] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v33);
    v120[2] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v117);
    v120[3] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v32);
    -[WCM_WiFiController updateAntennaSelection:](v36, "updateAntennaSelection:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v120, 4));
  }
  else if ((-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("AntennaSelectionV2Coex"))|| -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("AntennaSelectionV1_1Coex")))&& !-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport")))
  {
    if (-[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState") == 2)
    {
      v104 = -4096;
      v106 = -8192;
      v108 = -12288;
      v35 = -16384;
      v110 = -20480;
      v112 = -24576;
      v28 = -28672;
      v114 = 0x8000;
    }
    v37 = -[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState");
    if (v37 == 3)
      v38 = 0;
    else
      v38 = v27;
    if (v37 == 3)
      v39 = 4096;
    else
      v39 = v31;
    if (v37 == 3)
      v40 = 0x2000;
    else
      v40 = v30;
    if (v37 == 3)
      v41 = 12288;
    else
      v41 = v29;
    if (v37 == 3)
      v34 = 0x4000;
    else
      v34 = v34;
    if (v37 == 3)
      v42 = 20480;
    else
      v42 = v102;
    if (v37 == 3)
      v43 = 24576;
    else
      v43 = v99;
    if (v37 == 3)
      v44 = 28672;
    else
      v44 = v97;
    v94 = v28;
    v100 = v35;
    v90 = v28;
    v45 = v44;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("Trying to update antenna selection V2 bitmaps 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x"), v38, v39, v40, v41, v34, v42, v43, v44, v114, v90, v112, v110, v35, v108, v106,
      v104);
    v46 = -[WCM_PolicyManager wifiController](self, "wifiController");
    v119[0] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v38);
    v119[1] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v39);
    v119[2] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v40);
    v119[3] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v41);
    v119[4] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v34);
    v119[5] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v42);
    v119[6] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v43);
    v119[7] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v45);
    v119[8] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v114);
    v119[9] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v94);
    v119[10] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v112);
    v119[11] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v110);
    v119[12] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v100);
    v119[13] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v108);
    v119[14] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v106);
    v119[15] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v104);
    -[WCM_WiFiController updateAntennaSelectionV2:](v46, "updateAntennaSelectionV2:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v119, 16));
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("YYDebug_ WiFi antenna selection is not supported"));
  }
}

- (void)configureBTAntennaSelection
{
  uint64_t v3;
  WCM_BTController *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("YYDebug_ configureBTAntennaSelection: BT power state = %d, "), -[WCM_BTController powerState](-[WCM_PolicyManager btController](self, "btController"), "powerState"));
  if (self->_pencilCoexActive)
  {
    v3 = -[WCM_PolicyManager getBtBlockedAntennaForPencilCoexByPlatform](self, "getBtBlockedAntennaForPencilCoexByPlatform");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("YYDebug_ enable BT pencil coex mitigation config"));
    v4 = -[WCM_PolicyManager btController](self, "btController");
    v5 = 1;
    v6 = v3;
    v7 = v3;
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("YYDebug_ disable BT pencil coex mitigation config"));
    v4 = -[WCM_PolicyManager btController](self, "btController");
    v5 = 0;
    v6 = 0;
    v7 = 0;
  }
  -[WCM_BTController updatePencilCoexAntennaSelectionPolicy:param1:param2:](v4, "updatePencilCoexAntennaSelectionPolicy:param1:param2:", v5, v6, v7);
}

- (void)handleWiFiPowerStateChange
{
  unsigned int v3;
  const char *v4;
  WCM_CellularController *v5;

  v3 = -[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState");
  v4 = "off";
  if (v3)
    v4 = "on";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("Updating policy for WiFi power %s"), v4);
  v5 = -[WCM_PolicyManager cellularController](self, "cellularController");
  -[WCM_PolicyManager configureForLTECDRXWiFiTimeSharing](self, "configureForLTECDRXWiFiTimeSharing");
  if (-[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState")
    || -[WCM_BTController powerState](-[WCM_PolicyManager btController](self, "btController"), "powerState"))
  {
    -[WCM_CellularController updateWCI2CoexPolicy:](v5, "updateWCI2CoexPolicy:", -[WCM_PolicyManager cellularWCI2CoexPolicyBitmap](self, "cellularWCI2CoexPolicyBitmap"));
    -[WCM_PolicyManager sendRCU2UpdateMessage](self, "sendRCU2UpdateMessage");
  }
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WifiBtAgcCoexMode"))&& -[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("2nd place self.wifiAgcCoexModeLevel is %d"), -[NSNumber intValue](-[WCM_PolicyManager wifiAgcCoexModeLevel](self, "wifiAgcCoexModeLevel"), "intValue"));
    -[WCM_WiFiController setWifiAgcCoexMode:](-[WCM_PolicyManager wifiController](self, "wifiController"), "setWifiAgcCoexMode:", -[WCM_PolicyManager wifiAgcCoexModeLevel](self, "wifiAgcCoexModeLevel"));
  }
  if (-[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState"))
  {
    -[WCM_PolicyManager updateWiFiBTConnectionReport](self, "updateWiFiBTConnectionReport");
  }
  else if (_os_feature_enabled_impl("CoreWiFi", "Figaro5GTDD"))
  {
    -[WCM_BTController updateWiFiChannelInfo:bandwidth:regBand:](-[WCM_PolicyManager btController](self, "btController"), "updateWiFiChannelInfo:bandwidth:regBand:", 0, 0, 0);
  }
  -[WCM_PolicyManager handleWiFiConfigChange](self, "handleWiFiConfigChange");
}

- (BOOL)processDynamicAntennaBlocking
{
  WCM_WiFiController *v3;
  WCM_CellularController *v4;
  $03B45E325E2BEB6367864A8B9A334110 *v5;
  WCM_PlatformManager *v6;
  void *v7;
  uint64_t var8;
  double var2;
  double v10;
  double v11;
  double v12;
  double var0;
  double v14;
  double v15;
  double v16;
  id v17;
  unsigned int v18;
  BOOL v19;
  unsigned int v20;
  unsigned int v21;
  __int16 v23;
  unsigned __int16 v24;

  if ((objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("BB22_N79_DYNAMIC_ANTENNA_BLOCKING")) & 1) == 0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("ERROR: This should never happen. processDynamicAntennaBlocking"));
    objc_exception_throw(NSInternalInconsistencyException);
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("YYDebug_ processDynamicAntennaBlocking"));
  v3 = -[WCM_PolicyManager wifiController](self, "wifiController");
  v4 = -[WCM_PolicyManager cellularController](self, "cellularController");
  v5 = -[WCM_CellularController getActiveULCAConfig](v4, "getActiveULCAConfig");
  v6 = -[WCM_PolicyManager platformManager](self, "platformManager");
  v7 = objc_autoreleasePoolPush();
  if (!v4)
    goto LABEL_12;
  -[WCM_CellularController getActiveULCAConfig](v4, "getActiveULCAConfig");
  if (!v5)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("YYDebug_ processDynamicAntennaBlocking activeULCAConfig->cellConfigNR79 is NULL"));
LABEL_12:
    v19 = 0;
    goto LABEL_13;
  }
  var8 = v5->var7.var8;
  var2 = v5->var7.var2;
  v10 = v5->var7.var3 * 0.5;
  v11 = var2 - v10;
  v12 = var2 + v10;
  var0 = v5->var7.var0;
  v14 = v5->var7.var1 * 0.5;
  v15 = var0 - v14;
  v16 = var0 + v14;
  v17 = (id)-[WCM_WiFiController wifiChannel](v3, "wifiChannel");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("YYDebug_ processDynamicAntennaBlocking gets wifiChannel = %d, channelBandwidthMHz = %d, channelCenterFreqMHz = %d."), v17, -[WCM_WiFiController channelBandwidthMHz](v3, "channelBandwidthMHz"), -[WCM_WiFiController channelCenterFreqMHz](v3, "channelCenterFreqMHz"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("YYDebug_ processDynamicAntennaBlocking gets ccNR79 info dlLowFreq = %lf, dlHighFreq = %lf, ulLowFreq = %lf, ulHighFreq = %lf, nr79Found = %d."), *(_QWORD *)&v11, *(_QWORD *)&v12, *(_QWORD *)&v15, *(_QWORD *)&v16, v5->var7.var9);
  v24 = 0;
  v23 = 0;
  -[WCM_WiFiCellCoexIssueBandTable getCellDynamicAntBlockingIndex:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:pissueBandMatchAntIdx:cellAntBlkEnableIdx1:cellAntBlkEnableIdx2:](-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](v6, "wcmWiFiCellCoexIssueTable"), "getCellDynamicAntBlockingIndex:cellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:wifiChannel:pissueBandMatchAntIdx:cellAntBlkEnableIdx1:cellAntBlkEnableIdx2:", var8, v17, &v24, (char *)&v23 + 1, &v23, v11, v12, v15, v16);
  v18 = -[WCM_PolicyManager dynamicAntBlkingBand](self, "dynamicAntBlkingBand");
  v19 = v18 != v24;
  if (v18 != v24)
    -[WCM_PolicyManager setDynamicAntBlkingBand:](self, "setDynamicAntBlkingBand:");
  v20 = -[WCM_PolicyManager dynamicCellAntBlkEnableIdx1](self, "dynamicCellAntBlkEnableIdx1");
  if (v20 != HIBYTE(v23))
  {
    -[WCM_PolicyManager setDynamicCellAntBlkEnableIdx1:](self, "setDynamicCellAntBlkEnableIdx1:");
    v19 = 1;
  }
  v21 = -[WCM_PolicyManager dynamicCellAntBlkEnableIdx2](self, "dynamicCellAntBlkEnableIdx2");
  if (v21 != v23)
  {
    -[WCM_PolicyManager setDynamicCellAntBlkEnableIdx2:](self, "setDynamicCellAntBlkEnableIdx2:");
    v19 = 1;
    v21 = v23;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("YYDebug_ processDynamicAntennaBlocking dynamicAntBlkingBand = %d, ant1 = %d, ant2 = %d"), v24, HIBYTE(v23), v21);
LABEL_13:
  objc_autoreleasePoolPop(v7);
  return v19;
}

- (void)handleWiFiConfigChange
{
  WCM_WiFiController *v3;
  WCM_CellularController *v4;
  unsigned int v5;
  id v6;
  unsigned int v7;
  NSNumber *v8;
  NSObject *v9;
  _QWORD block[6];

  v3 = -[WCM_PolicyManager wifiController](self, "wifiController");
  v4 = -[WCM_PolicyManager cellularController](self, "cellularController");
  v5 = -[WCM_WiFiController wifiState](v3, "wifiState");
  v6 = (id)-[WCM_WiFiController wifiChannel](v3, "wifiChannel");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR(" YYDebug_ Handling WIFI Network Config change"));
  if (!-[WCM_PlatformManager wcmWiFiCellCoexIssueTable](-[WCM_PolicyManager platformManager](self, "platformManager"), "wcmWiFiCellCoexIssueTable"))
  {
    v8 = v5 == 2
      && v6 >= 0xB
      && -[WCM_CellularController isInCoexBand7LowerEdge](v4, "isInCoexBand7LowerEdge")
       ? -[WCM_PlatformManager wcmCellularWCI2ModeLTEMaxTxPowerLow](-[WCM_PolicyManager platformManager](self, "platformManager"), "wcmCellularWCI2ModeLTEMaxTxPowerLow"): -[WCM_PlatformManager wcmCellularWCI2ModeLTEMaxTxPowerHigh](-[WCM_PolicyManager platformManager](self, "platformManager"), "wcmCellularWCI2ModeLTEMaxTxPowerHigh");
    -[WCM_CellularController updateControllerTxPower:](v4, "updateControllerTxPower:", -[NSNumber intValue](v8, "intValue"));
    if (v5 == 2
      && (_DWORD)v6
      && -[WCM_PolicyManager isWiFiChannel:inChannelMap:](self, "isWiFiChannel:inChannelMap:", v6, -[WCM_PolicyManager legacyWiFiBlocklistChannelsFor3FoWiFi](self, "legacyWiFiBlocklistChannelsFor3FoWiFi")))
    {
      -[WCM_PolicyManager setWifiRxPriThreshold:](self, "setWifiRxPriThreshold:", -[WCM_PlatformManager wcmWiFiPriThresholdMed](-[WCM_PolicyManager platformManager](self, "platformManager"), "wcmWiFiPriThresholdMed"));
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("WiFi associated on 3Fo Impacted channel %d"), v6);
    }
  }
  -[WCM_PolicyManager configureWiFiChannelMap](self, "configureWiFiChannelMap");
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("PencilCoexSupport")))
  {
    -[WCM_PolicyManager handleWiFiBTCoexChange](self, "handleWiFiBTCoexChange");
  }
  -[WCM_PolicyManager configureWifiAntennaSelectionForCoex](self, "configureWifiAntennaSelectionForCoex");
  -[WCM_PolicyManager updateCellTxPowerLimit](self, "updateCellTxPowerLimit");
  -[WCM_WiFiController updateMWSFrameConfig:](v3, "updateMWSFrameConfig:", v4);
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("CellularNeedWiFiStatus")))
  {
    if (-[WCM_PolicyManager audioBuiltInReceiver](self, "audioBuiltInReceiver"))
      v7 = -[WCM_WiFiController headTxPowerCapdBm](v3, "headTxPowerCapdBm");
    else
      v7 = -[WCM_WiFiController bodyTxPowerCapdBm](v3, "bodyTxPowerCapdBm");
    -[WCM_CellularController updateWiFiStatusCenterFreq:bandwidth:txPower:](v4, "updateWiFiStatusCenterFreq:bandwidth:txPower:", -[WCM_WiFiController channelCenterFreqMHz](v3, "channelCenterFreqMHz"), -[WCM_WiFiController channelBandwidthMHz](v3, "channelBandwidthMHz"), v7);
  }
  -[WCM_PolicyManager updateCoexMonitorState:](self, "updateCoexMonitorState:", -[WCM_PolicyManager cellularCoexBand](self, "cellularCoexBand"));
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("BB22_N79_DYNAMIC_ANTENNA_BLOCKING")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR(" YYDebug_ DynamicBlockingEnh enabled"));
    if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("BB22_N79_DYNAMIC_ANTENNA_BLOCKING")))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("YYDebug_ BB22_N79_DYNAMIC_ANTENNA_BLOCKING is active"));
      if (-[WCM_PolicyManager processDynamicAntennaBlocking](self, "processDynamicAntennaBlocking"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("YYDebug_ reconfigure antenna blocking to idx 1 %d and idx 2 %d"), self->_dynamicCellAntBlkEnableIdx1, self->_dynamicCellAntBlkEnableIdx2);
        -[WCM_MavAntennaPolicy reconfigureClientAntBlockingParamsWithCellAntBlkEnableIdx1:cellAntBlkEnableIdx2:](-[WCM_PolicyManager mavAntPolicy](self, "mavAntPolicy"), "reconfigureClientAntBlockingParamsWithCellAntBlkEnableIdx1:cellAntBlkEnableIdx2:", self->_dynamicCellAntBlkEnableIdx1, self->_dynamicCellAntBlkEnableIdx2);
      }
    }
  }
  -[WCM_PolicyManager updateWiFiCoexState](self, "updateWiFiCoexState");
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("CTSacDriverNeedWiFiFreq")))
  {
    -[WCM_PolicyManager updateCTSacDriverWifiInfo](self, "updateCTSacDriverWifiInfo");
  }
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("CoexBBUnifiedSensorInfoSupport")))
  {
    -[WCM_CellularController sendBBCoexSensorMessage:band:usecase:](-[WCM_PolicyManager cellularController](self, "cellularController"), "sendBBCoexSensorMessage:band:usecase:", 1, v5, 0);
  }
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("SacPolicySupport"))&& !-[WCM_SacManager isTestMode](self->_sacManager, "isTestMode"))
  {
    v9 = -[WCM_SacManager getQueue](self->_sacManager, "getQueue");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C711C;
    block[3] = &unk_100201B18;
    block[4] = self;
    block[5] = v3;
    dispatch_async(v9, block);
  }
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WifiGen9rFemConfig")))
  {
    -[WCM_WiFiController updateGen9rFemConfiguration](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateGen9rFemConfiguration");
  }
}

- (void)configureAllWCI2:(BOOL)a3
{
  _BOOL4 v3;
  WCM_WiFiController *v5;
  WCM_BTController *v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("configureAllWCI2 gets called with input (BOOL)enable =%d"), a3);
  v5 = -[WCM_PolicyManager wifiController](self, "wifiController");
  v6 = -[WCM_PolicyManager btController](self, "btController");
  if (v3)
  {
    if (-[WCM_WiFiController powerState](v5, "powerState"))
    {
      if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("KeepBTAwake")))
      {
        -[WCM_BTController updateAwakeMode:](v6, "updateAwakeMode:", 1);
      }
      if (-[WCM_PolicyManager cellularWCI2CoexPolicyBitmap](self, "cellularWCI2CoexPolicyBitmap"))
      {
        if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiWCI2BitmapV2Enabled")))
        {
          if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport")))
          {
            -[WCM_WiFiController updateChannelsToEnableWCI2WiFiEnh:WiFiEnhChannels:](v5, "updateChannelsToEnableWCI2WiFiEnh:WiFiEnhChannels:", -[WCM_PolicyManager wifiChannelsToEnableWCI2Gand5G](self, "wifiChannelsToEnableWCI2Gand5G"), -[WCM_PolicyManager wifiChannelsToEnableWCI2WiFiEnh](self, "wifiChannelsToEnableWCI2WiFiEnh"));
          }
          else
          {
            -[WCM_WiFiController updateChannelsToEnableWCI2V2:](v5, "updateChannelsToEnableWCI2V2:", -[WCM_PolicyManager wifiChannelsToEnableWCI2V2](self, "wifiChannelsToEnableWCI2V2"));
          }
        }
        else
        {
          -[WCM_WiFiController updateChannelsToEnableWCI2:](v5, "updateChannelsToEnableWCI2:", -[WCM_PolicyManager wifiChannelsToEnableWCI2](self, "wifiChannelsToEnableWCI2"));
        }
      }
      -[WCM_CellularController updateWCI2CoexPolicy:](-[WCM_PolicyManager cellularController](self, "cellularController"), "updateWCI2CoexPolicy:", -[WCM_PolicyManager cellularWCI2CoexPolicyBitmap](self, "cellularWCI2CoexPolicyBitmap"));
      if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"))|| -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiType7LTEMBAntBlocking")))
      {
        if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("Type72GWiFiSupport")))
        {
          v15 = 0u;
          v16 = 0u;
          v13 = 0u;
          v14 = 0u;
          v7 = -[WCM_PolicyManager wifi2GHzLTEB7IMD3ChannelsEnableType7](self, "wifi2GHzLTEB7IMD3ChannelsEnableType7");
          v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v14;
            do
            {
              v11 = 0;
              do
              {
                if (*(_QWORD *)v14 != v10)
                  objc_enumerationMutation(v7);
                v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11);
                if ((-[NSMutableArray containsObject:](-[WCM_PolicyManager wifi2GHzChannelsToEnableType7MSGCombined](self, "wifi2GHzChannelsToEnableType7MSGCombined"), "containsObject:", v12) & 1) == 0&& objc_msgSend(&off_100242150, "containsObject:", v12))
                {
                  -[NSMutableArray addObject:](-[WCM_PolicyManager wifi2GHzChannelsToEnableType7MSGCombined](self, "wifi2GHzChannelsToEnableType7MSGCombined"), "addObject:", v12);
                }
                v11 = (char *)v11 + 1;
              }
              while (v9 != v11);
              v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
            }
            while (v9);
          }
        }
        if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport")))
        {
          -[WCM_PolicyManager handleCallLQMStateChangeType7WiFiEnh:](self, "handleCallLQMStateChangeType7WiFiEnh:", 1);
        }
        else
        {
          -[WCM_PolicyManager handleCallLQMStateChangeType7:](self, "handleCallLQMStateChangeType7:", 1);
        }
      }
    }
    if (-[WCM_BTController getBTState](v6, "getBTState"))
    {
      if (-[WCM_PolicyManager cellularWCI2CoexPolicyBitmap](self, "cellularWCI2CoexPolicyBitmap"))
        -[WCM_BTController updateWCI2Mode:](v6, "updateWCI2Mode:", 1);
      -[WCM_CellularController updateWCI2CoexPolicy:](-[WCM_PolicyManager cellularController](self, "cellularController"), "updateWCI2CoexPolicy:", -[WCM_PolicyManager cellularWCI2CoexPolicyBitmap](self, "cellularWCI2CoexPolicyBitmap"));
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("updateWCI2CoexPolicy gets called by configureAllWCI2 with input 0 due to (BOOL)enable is False as input to configureAllWCI2"));
    -[WCM_CellularController updateWCI2CoexPolicy:](-[WCM_PolicyManager cellularController](self, "cellularController"), "updateWCI2CoexPolicy:", 0);
    -[WCM_BTController powerState](v6, "powerState");
    -[WCM_WiFiController updateChannelsToEnableWCI2:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateChannelsToEnableWCI2:", &off_100242168);
    if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("KeepBTAwake")))
    {
      -[WCM_BTController updateAwakeMode:](v6, "updateAwakeMode:", 0);
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("AggdRemoval_ Since Aggd related keys ave been disabled on the server side, we will stop submitting metrics to Aggd. (configureAllWCI2)"));
  }
}

- (void)updateCoexMonitorState:(int)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("AggdRemoval_ Since Aggd related keys ave been disabled on the server side, we will stop submitting metrics to Aggd. (updateCoexMonitorState)"));
}

- (BOOL)isWiFiChannel:(int)a3 inChannelMap:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(a4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "intValue") == a3)
        {
          LOBYTE(v6) = 1;
          return (char)v6;
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v7 = v6;
      if (v6)
        continue;
      break;
    }
  }
  return (char)v6;
}

- (void)configureWiFiChannelMap
{
  WCM_PlatformManager *v3;
  WCM_WiFiController *v4;
  unsigned int v5;
  NSNumber *v6;
  NSNumber *v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = -[WCM_PolicyManager platformManager](self, "platformManager");
  v4 = -[WCM_PolicyManager wifiController](self, "wifiController");
  v5 = -[WCM_PolicyManager cellularCoexBand](self, "cellularCoexBand");
  switch(v5)
  {
    case 0u:
    case 1u:
    case 3u:
    case 4u:
      if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("DisablePhyRateBasedRxPriReq")))
      {
        goto LABEL_3;
      }
      v7 = -[WCM_PlatformManager wcmWiFiPriThresholdLow](v3, "wcmWiFiPriThresholdLow");
      goto LABEL_5;
    case 2u:
      if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("DisablePhyRateBasedRxPriReq")))
      {
        goto LABEL_3;
      }
      v7 = -[WCM_PlatformManager wcmWiFiPriThresholdHigh](v3, "wcmWiFiPriThresholdHigh");
LABEL_5:
      v6 = v7;
      break;
    default:
LABEL_3:
      v6 = (NSNumber *)&off_1002308A0;
      break;
  }
  -[WCM_PolicyManager setWifiRxPriThreshold:](self, "setWifiRxPriThreshold:", v6);
  -[WCM_WiFiController updateChannelsToBlocklist:](v4, "updateChannelsToBlocklist:", -[WCM_PolicyManager wifiChannelsToBlocklist](self, "wifiChannelsToBlocklist"));
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiOCLSupport")))
  {
    if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport")))
    {
      -[WCM_WiFiController updateChannelsToDisableOCLWiFiEnh:WiFiEnhChannels:](v4, "updateChannelsToDisableOCLWiFiEnh:WiFiEnhChannels:", -[WCM_PolicyManager wifiChannelsToDisableOCL2G5G](self, "wifiChannelsToDisableOCL2G5G"), -[WCM_PolicyManager wifiChannelsToDisableOCLEnh](self, "wifiChannelsToDisableOCLEnh"));
    }
    else
    {
      -[WCM_WiFiController updateChannelsToDisableOCL:](v4, "updateChannelsToDisableOCL:", -[WCM_PolicyManager wifiChannelsToDisableOCL](self, "wifiChannelsToDisableOCL"));
    }
  }
  if (v5 == 7)
  {
    -[WCM_WiFiController updateChannelsToEnableWCI2:](v4, "updateChannelsToEnableWCI2:", &off_100242180);
  }
  else if (-[WCM_PolicyManager cellularWCI2CoexPolicyBitmap](self, "cellularWCI2CoexPolicyBitmap"))
  {
    if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiWCI2BitmapV2Enabled")))
    {
      if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport")))
      {
        -[WCM_WiFiController updateChannelsToEnableWCI2WiFiEnh:WiFiEnhChannels:](v4, "updateChannelsToEnableWCI2WiFiEnh:WiFiEnhChannels:", -[WCM_PolicyManager wifiChannelsToEnableWCI2Gand5G](self, "wifiChannelsToEnableWCI2Gand5G"), -[WCM_PolicyManager wifiChannelsToEnableWCI2WiFiEnh](self, "wifiChannelsToEnableWCI2WiFiEnh"));
      }
      else
      {
        -[WCM_WiFiController updateChannelsToEnableWCI2V2:](v4, "updateChannelsToEnableWCI2V2:", -[WCM_PolicyManager wifiChannelsToEnableWCI2V2](self, "wifiChannelsToEnableWCI2V2"));
      }
    }
    else
    {
      -[WCM_WiFiController updateChannelsToEnableWCI2:](v4, "updateChannelsToEnableWCI2:", -[WCM_PolicyManager wifiChannelsToEnableWCI2](self, "wifiChannelsToEnableWCI2"));
    }
    if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFi5GHzType7NR79AntBlocking"))|| -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiType7LTEMBAntBlocking")))
    {
      if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("Type72GWiFiSupport")))
      {
        v16 = 0u;
        v17 = 0u;
        v14 = 0u;
        v15 = 0u;
        v8 = -[WCM_PolicyManager wifi2GHzLTEB7IMD3ChannelsEnableType7](self, "wifi2GHzLTEB7IMD3ChannelsEnableType7", 0);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v15;
          do
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(_QWORD *)v15 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
              if ((-[NSMutableArray containsObject:](-[WCM_PolicyManager wifi2GHzChannelsToEnableType7MSGCombined](self, "wifi2GHzChannelsToEnableType7MSGCombined"), "containsObject:", v13) & 1) == 0&& objc_msgSend(&off_100242198, "containsObject:", v13))
              {
                -[NSMutableArray addObject:](-[WCM_PolicyManager wifi2GHzChannelsToEnableType7MSGCombined](self, "wifi2GHzChannelsToEnableType7MSGCombined"), "addObject:", v13);
              }
            }
            v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          }
          while (v10);
        }
      }
      if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport")))
      {
        -[WCM_PolicyManager handleCallLQMStateChangeType7WiFiEnh:](self, "handleCallLQMStateChangeType7WiFiEnh:", 1);
      }
      else
      {
        -[WCM_PolicyManager handleCallLQMStateChangeType7:](self, "handleCallLQMStateChangeType7:", 1);
      }
    }
  }
  if (-[WCM_PolicyManager cellularWCI2CoexPolicyBitmap](self, "cellularWCI2CoexPolicyBitmap"))
    -[WCM_WiFiController updateRxPriorityThreshold:](v4, "updateRxPriorityThreshold:", -[WCM_PolicyManager wifiRxPriThreshold](self, "wifiRxPriThreshold"));
}

- (id)legacyWiFiChannelsToAvoidForIMD2GPS
{
  id v3;
  uint64_t v4;
  WCM_PlatformManager *v5;
  double v6;
  double v7;
  double v8;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  if (-[WCM_PolicyManager isCellularOnGPSIMDBand](self, "isCellularOnGPSIMDBand"))
  {
    LODWORD(v4) = 0;
    do
    {
      v5 = -[WCM_PolicyManager platformManager](self, "platformManager");
      -[WCM_CellularController cachedULCenterFreq](-[WCM_PolicyManager cellularController](self, "cellularController"), "cachedULCenterFreq");
      v7 = v6;
      -[WCM_CellularController cachedULBandwidth](-[WCM_PolicyManager cellularController](self, "cellularController"), "cachedULBandwidth");
      if (-[WCM_PlatformManager isIMD2ForFirstFreq:firstBW:secondFreq:secondBW:resultantFreq:resultantBW:](v5, "isIMD2ForFirstFreq:firstBW:secondFreq:secondBW:resultantFreq:resultantBW:", v7, v8, (double)(5 * (int)v4 + 2412), 20.0, 1575.42, 4.092))
      {
        v4 = (v4 + 1);
        objc_msgSend(v3, "addObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
      }
      else
      {
        LODWORD(v4) = v4 + 1;
      }
    }
    while ((_DWORD)v4 != 13);
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Block Listed Channels for IMD2 GPS: %@"), v3);
  return v3;
}

- (id)legacyWiFiChannelsToAvoidFor3FoWiFi
{
  id v3;
  uint64_t v4;
  WCM_PlatformManager *v5;
  double v6;
  double v7;
  double v8;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  if (-[WCM_PolicyManager isCellularOnWiFi3FoBand](self, "isCellularOnWiFi3FoBand"))
  {
    LODWORD(v4) = 0;
    do
    {
      v5 = -[WCM_PolicyManager platformManager](self, "platformManager");
      -[WCM_CellularController cachedULCenterFreq](-[WCM_PolicyManager cellularController](self, "cellularController"), "cachedULCenterFreq");
      v7 = v6;
      -[WCM_CellularController cachedULBandwidth](-[WCM_PolicyManager cellularController](self, "cellularController"), "cachedULBandwidth");
      if (-[WCM_PlatformManager is3FoForFreq:bw:resultantFreq:resultantBW:](v5, "is3FoForFreq:bw:resultantFreq:resultantBW:", v7, v8, (double)(5 * (int)v4 + 2412), 20.0))
      {
        v4 = (v4 + 1);
        objc_msgSend(v3, "addObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
      }
      else
      {
        LODWORD(v4) = v4 + 1;
      }
    }
    while ((_DWORD)v4 != 13);
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Block Listed Channels for 3Fo WiFi: %@"), v3);
  return v3;
}

- (id)legacyWiFiChannelsToAvoidForIMD3Cell
{
  WCM_CellularController *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _UNKNOWN **v13;

  v3 = -[WCM_PolicyManager cellularController](self, "cellularController");
  v4 = +[NSMutableArray array](NSMutableArray, "array");
  if (-[WCM_PolicyManager isCellularOnIMD3CellBand](self, "isCellularOnIMD3CellBand"))
  {
    -[WCM_CellularController cachedULCenterFreq](v3, "cachedULCenterFreq");
    v6 = v5;
    -[WCM_CellularController cachedULBandwidth](v3, "cachedULBandwidth");
    v8 = v7;
    -[WCM_CellularController dlCenterFreq](v3, "dlCenterFreq");
    v10 = v9;
    -[WCM_CellularController dlBandwidth](v3, "dlBandwidth");
    v12 = v11;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Find Block Listed Channels for IMD3 Cell UlCenterFreq(%lf) UlBandwidth(%lf) DlCenterFreq(%lf) DlBandwidth(%lf)"), *(_QWORD *)&v6, *(_QWORD *)&v8, *(_QWORD *)&v10, *(_QWORD *)&v11);
    LODWORD(v3) = 0;
    do
    {
      if (-[WCM_PlatformManager isIMD3ForFirstFreq:firstBW:secondFreq:secondBW:resultantFreq:resultantBW:](-[WCM_PolicyManager platformManager](self, "platformManager"), "isIMD3ForFirstFreq:firstBW:secondFreq:secondBW:resultantFreq:resultantBW:", v6, v8, (double)(5 * (int)v3 + 2412), 20.0, v10, v12))
      {
        v3 = (WCM_CellularController *)((_DWORD)v3 + 1);
        objc_msgSend(v4, "addObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
      }
      else
      {
        LODWORD(v3) = (_DWORD)v3 + 1;
      }
    }
    while ((_DWORD)v3 != 13);
    if (sub_10007C264(v4))
    {
      if (v6 >= 2550.0)
        v13 = &off_100230C18;
      else
        v13 = &off_100230D08;
      objc_msgSend(v4, "removeObject:", v13);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("removing channel %@ for UlCenterFreq %lf"), v13, *(_QWORD *)&v6);
    }
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Block Listed Channels for IMD3 Cell: %@"), v4);
  return v4;
}

- (void)configureForLTECDRXWiFiTimeSharing
{
  unsigned int v3;
  _UNKNOWN **v4;
  _UNKNOWN **v5;
  _UNKNOWN **v6;
  _BOOL4 v7;
  objc_class *v8;
  unint64_t v9;
  objc_class *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t timesharingBw_subId0;
  WCM_CellularController *v14;
  uint64_t v15;
  uint64_t v16;
  WCM_CellularController *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (!-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("LTECDRXWiFiTimeSharing")))return;
  if (-[WCM_PolicyManager cellularCoexBand](self, "cellularCoexBand") == 2)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Time Sharing triggered by WRM_B40B_COEX"));
    -[WCM_PolicyManager setCellularWCI2CoexPolicyBitmap:](self, "setCellularWCI2CoexPolicyBitmap:", -[WCM_PolicyManager cellularWCI2CoexPolicyBitmap](self, "cellularWCI2CoexPolicyBitmap") | 0x1030);
    v3 = -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("LTEWiFiTimeSharingBand40bCh13"));
    v4 = &off_1002421C8;
    v5 = &off_1002421B0;
  }
  else
  {
    if (-[WCM_PolicyManager cellularCoexBand](self, "cellularCoexBand") != 3
      && -[WCM_PolicyManager cellularCoexBand](self, "cellularCoexBand") != 4
      || !-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("LTEWiFiTimeSharingBand41"))&& !-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("LTEWiFiTimeSharingBand41Ch1113")))
    {
      -[WCM_PolicyManager setCellularWCI2CoexPolicyBitmap:](self, "setCellularWCI2CoexPolicyBitmap:", -[WCM_PolicyManager cellularWCI2CoexPolicyBitmap](self, "cellularWCI2CoexPolicyBitmap") & ((unsigned __int16)-[NSNumber unsignedLongValue](-[WCM_PlatformManager wcmCellularWCI2ModePolicy](-[WCM_PolicyManager platformManager](self, "platformManager"), "wcmCellularWCI2ModePolicy"), "unsignedLongValue") | 0xFFFFFFFFFFFFEFCFLL));
      v7 = 0;
      v6 = &off_100242210;
      goto LABEL_14;
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Time Sharing triggered by WRM_B41A1+A2_Coex"));
    -[WCM_PolicyManager setCellularWCI2CoexPolicyBitmap:](self, "setCellularWCI2CoexPolicyBitmap:", -[WCM_PolicyManager cellularWCI2CoexPolicyBitmap](self, "cellularWCI2CoexPolicyBitmap") | 0x1030);
    v3 = -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("LTEWiFiTimeSharingBand41Ch1113"));
    v4 = &off_1002421F8;
    v5 = &off_1002421E0;
  }
  if (v3)
    v6 = v5;
  else
    v6 = v4;
  -[WCM_PolicyManager cellularCoexBand](self, "cellularCoexBand");
  v7 = 1;
LABEL_14:
  if (-[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController"), "powerState"))
    -[WCM_WiFiController updateChannelsForTimeSharingMode:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateChannelsForTimeSharingMode:", v6);
  if (v7)
  {
    if (-[WCM_PolicyManager cellularCoexBand](self, "cellularCoexBand") == 2)
    {
      v8 = -[WCM_PlatformManager getBand40BUlCenterFreq](-[WCM_PolicyManager platformManager](self, "platformManager"), "getBand40BUlCenterFreq");
      v9 = -[WCM_PlatformManager getBand40BUlBw](-[WCM_PolicyManager platformManager](self, "platformManager"), "getBand40BUlBw");
    }
    else if (-[WCM_PolicyManager cellularCoexBand](self, "cellularCoexBand") == 3)
    {
      v8 = -[WCM_PlatformManager getBand41A1UlCenterFreq](-[WCM_PolicyManager platformManager](self, "platformManager"), "getBand41A1UlCenterFreq");
      v9 = -[WCM_PlatformManager getBand41A1UlBw](-[WCM_PolicyManager platformManager](self, "platformManager"), "getBand41A1UlBw");
    }
    else
    {
      if (-[WCM_PolicyManager cellularCoexBand](self, "cellularCoexBand") != 4)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("We should never reach here. No matching coex band to enable time sharing"));
        return;
      }
      v8 = -[WCM_PlatformManager getBand41A2UlCenterFreq](-[WCM_PolicyManager platformManager](self, "platformManager"), "getBand41A2UlCenterFreq");
      v9 = -[WCM_PlatformManager getBand41A2UlBw](-[WCM_PolicyManager platformManager](self, "platformManager"), "getBand41A2UlBw");
    }
    v10 = (objc_class *)v9;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Time Sharing will be configured for central freq %llu and bw %llu"), v8, v9);
  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("UseWCMAriDriver")))
  {
    v11 = -[WCM_CellularController activeSubId](-[WCM_PolicyManager cellularController](self, "cellularController"), "activeSubId");
    v12 = v11;
    if (v11 == 1)
    {
      if (self->_timesharingEnabled_subId1 == v7 && v8 == (objc_class *)self->_timesharingFreq_subId1)
      {
        if (v10 == (objc_class *)self->_timesharingBw_subId1)
          return;
      }
      else
      {
        self->_timesharingEnabled_subId1 = v7;
      }
      v15 = 520;
      v16 = 512;
    }
    else
    {
      if (v11)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Configure Timesharing: Invalid active SubId %llu"), v11);
        return;
      }
      if (self->_timesharingEnabled_subId0 == v7 && v8 == (objc_class *)self->_timesharingFreq_subId0)
      {
        timesharingBw_subId0 = self->_timesharingBw_subId0;
        self->_timesharingEnabled_subId0 = v7;
        if (v10 == (objc_class *)timesharingBw_subId0)
          return;
      }
      else
      {
        self->_timesharingEnabled_subId0 = v7;
      }
      v15 = 504;
      v16 = 496;
    }
    *(Class *)((char *)&self->super.isa + v16) = v8;
    *(Class *)((char *)&self->super.isa + v15) = v10;
    v17 = -[WCM_PolicyManager cellularController](self, "cellularController");
    if (v7)
      -[WCM_CellularController configureCellularTimeShareConfigReqParamsWithCenterFreq:CoexTech:bandwidth:subId:](v17, "configureCellularTimeShareConfigReqParamsWithCenterFreq:CoexTech:bandwidth:subId:", v8, 0, v10, v12);
    else
      -[WCM_CellularController disableCellularTimeShareConfigReqSubId:](v17, "disableCellularTimeShareConfigReqSubId:", v12, v18, v19, v20);
  }
  else if (v7
         && -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("Bb20PolicyConversion")))
  {
    v14 = -[WCM_PolicyManager cellularController](self, "cellularController");
    -[WCM_CellularController configureCellularTimeShareConfigReqParamsWithCenterFreq:bandwidth:](v14, "configureCellularTimeShareConfigReqParamsWithCenterFreq:bandwidth:", v8, v10, v21, v22);
  }
}

- (void)submitWiFiBTCoexMetrics:(unsigned __int16)a3
{
  if (-[WCM_WiFiController powerState](-[WCM_PolicyManager wifiController](self, "wifiController", a3), "powerState"))
    -[WCM_WiFiController getWiFiBTSharedAntennaDisabledStatus](-[WCM_PolicyManager wifiController](self, "wifiController"), "getWiFiBTSharedAntennaDisabledStatus");
  -[WCM_BTController powerState](-[WCM_PolicyManager btController](self, "btController"), "powerState");
}

- (void)handleMedtronicConnection
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("External : In handleMBTConnection; connection status = %d"),
    -[WCM_ExternalAccessory eaConnection](self->_extAccessory, "eaConnection"));
  -[WCM_WiFiController updateMedtronicState:](-[WCM_PolicyManager wifiController](self, "wifiController"), "updateMedtronicState:", -[WCM_ExternalAccessory eaConnection](self->_extAccessory, "eaConnection"));
}

- (void)updateWiFiCoexState
{
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiBtULOFDMA")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("In handleWiFiConfigChange call handleWiFiBTULOFDMAChange"));
    -[WCM_PolicyManager handleWiFiBTULOFDMAChange](self, "handleWiFiBTULOFDMAChange");
  }
  if ((objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiBtProfile")) & 1) != 0|| objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiBt5GProfile")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("In updateWiFiCoexState call handleWiFiBTCoexChange"));
    -[WCM_PolicyManager handleWiFiBTCoexChange](self, "handleWiFiBTCoexChange");
  }
  -[WCM_WiFiController handleWiFiResetFlag](-[WCM_PolicyManager wifiController](self, "wifiController"), "handleWiFiResetFlag");
}

- (void)handleCCConnectionUpdate
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Sac Driver: handleCCConnectionUpdate"));
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("CTSacDriverNeedWiFiFreq")))
  {
    -[WCM_PolicyManager setSacWifiFrequency:](self, "setSacWifiFrequency:", 0);
    -[WCM_PolicyManager updateCTSacDriverRemoveAllFrequenciesFromClient:](self, "updateCTSacDriverRemoveAllFrequenciesFromClient:", 1);
    -[WCM_PolicyManager updateCTSacDriverWifiInfo](self, "updateCTSacDriverWifiInfo");
  }
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("CTSacDriverNeedGpsFreq"))|| -[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("AntennaTuningForGpsBB20")))
  {
    -[WCM_PolicyManager updateGPSBandsInfo:CLUpdate:](self, "updateGPSBandsInfo:CLUpdate:", 0, 0);
  }
}

- (void)updateCTSacDriverWifiInfo
{
  WCM_WiFiController *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v3 = -[WCM_PolicyManager wifiController](self, "wifiController");
  v4 = (id)-[WCM_WiFiController wifiState](v3, "wifiState");
  v5 = (id)-[WCM_WiFiController wifiChannel](v3, "wifiChannel");
  v6 = (id)-[WCM_WiFiController reportedChannelCenterFreqMHz](v3, "reportedChannelCenterFreqMHz");
  v7 = objc_alloc_init((Class)NSMutableArray);
  v13 = objc_alloc_init((Class)NSMutableArray);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Sac Driver: updateCTSacDriverWifiInfo Wifi frequency details wifistate = %d channel = %d st.frequency = %d re.Frequency = %d recal.frequency = %d\n"), v4, v5, self->_sacWifiFrequency, v6, -[WCM_WiFiController channelCenterFreqMHz](v3, "channelCenterFreqMHz"));
  if (-[WCM_PolicyManager sacWifiFrequency](self, "sacWifiFrequency") == (_DWORD)v6)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Sac Driver:_conditions did not match for initiating SAC access"), v10, v11, v12);
    goto LABEL_12;
  }
  if (-[WCM_PolicyManager sacWifiFrequency](self, "sacWifiFrequency"))
  {
    v8 = -[WCM_PolicyManager sacWifiFrequency](self, "sacWifiFrequency");
    -[WCM_PolicyManager setSacWifiFrequency:](self, "setSacWifiFrequency:", 0);
    if (!(_DWORD)v6)
    {
      v9 = 2;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Sac Driver: updateCTSacDriverWifiInfo-2 F.remove %d F.add %d Oper %d\n"), v8, 0, 2);
      goto LABEL_11;
    }
    v9 = 3;
  }
  else
  {
    if (!(_DWORD)v6)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Sac Driver: updateCTSacDriverWifiInfo-2 F.remove %d F.add %d Oper %d\n"), 0, 0, 0);
      goto LABEL_12;
    }
    v8 = 0;
    v9 = 1;
  }
  objc_msgSend(v7, "addObject:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6));
  objc_msgSend(v13, "addObject:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 20));
  -[WCM_PolicyManager setSacWifiFrequency:](self, "setSacWifiFrequency:", v6);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Sac Driver: updateCTSacDriverWifiInfo-2 F.remove %d F.add %d Oper %d\n"), v8, v6, v9);
LABEL_11:
  -[WCM_PolicyManager updateCTSacDriver:frequencyToAdd:frequencyToAddBw:frequencytoRemove:client:](self, "updateCTSacDriver:frequencyToAdd:frequencyToAddBw:frequencytoRemove:client:", v9, v7, v13, v8, 1);
LABEL_12:
  objc_msgSend(v7, "removeAllObjects");
  objc_msgSend(v13, "removeAllObjects");

}

- (void)updateCTSacDriver:(int)a3 frequencyToAdd:(id)a4 frequencyToAddBw:(id)a5 frequencytoRemove:(unsigned int)a6 client:(unsigned __int8)a7
{
  uint64_t v7;
  uint64_t v8;
  char v11;
  const void *v12;
  unint64_t v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  unsigned int v19;
  _OWORD v20[2];
  uint64_t v21;
  char v22;

  v7 = a7;
  v8 = *(_QWORD *)&a6;
  v11 = a3;
  v22 = 0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Sac Driver: updateCTSacDriver Operation = %d\n"), *(_QWORD *)&a3);
  v21 = 0;
  memset(v20, 0, sizeof(v20));
  v12 = (const void *)_CTServerConnectionCreate(kCFAllocatorDefault, nullsub_36, v20);
  _CTServerConnectionGetCommCenterInitializationState(v12, &v22);
  _CTServerConnectionSendBarrier(v12, 0);
  if (v22)
  {
    if (v12)
      goto LABEL_3;
LABEL_17:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Sac Driver: Unable to create connection to CTServer - may be CommCenter is unloaded?\n"));
    return;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Sac Driver: WARNING!!! CommCenter is in a reset state!!"));
  if (!v12)
    goto LABEL_17;
LABEL_3:
  if ((v11 & 2) != 0)
  {
    if ((_DWORD)v8)
    {
      v13 = _CTServerConnectionRemoveVictimFreq(v12, v7, 1000000 * v8);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Sac Driver: Removing frequency %lu for client %d \n"), v8, v7);
      if (HIDWORD(v13))
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Sac Driver:_CTServerConnectionRemoveVictimFreq: error: %d, domain: %d"), HIDWORD(v13), v13);
    }
  }
  _CTServerConnectionSendBarrier(v12, 0);
  if (objc_msgSend(a4, "count"))
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    do
    {
      v18 = objc_msgSend(objc_msgSend(a4, "objectAtIndex:", v14), "unsignedIntValue");
      v19 = objc_msgSend(objc_msgSend(a5, "objectAtIndex:", v14), "unsignedIntValue");
      if ((v11 & 1) != 0 && (_DWORD)v18)
      {
        v16 = _CTServerConnectionAddVictimFreq(v12, v7, 1000000 * v18, 500000 * v19, 0);
        v17 = HIDWORD(v16);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Sac Driver: Adding frequency  %d for client %d\n"), v18, v7);
      }
      if ((_DWORD)v17)
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Sac Driver:_CTServerConnectionAddVictimFreq: error: %d, domain: %d"), v17, v16);
      v14 = ++v15;
    }
    while ((unint64_t)objc_msgSend(a4, "count") > v15);
  }
  CFRelease(v12);
}

- (void)updateCTSacDriverRemoveAllFromWifiClient
{
  if (-[WCM_PolicyManager sacWifiFrequency](self, "sacWifiFrequency"))
  {
    -[WCM_PolicyManager updateCTSacDriverRemoveAllFrequenciesFromClient:](self, "updateCTSacDriverRemoveAllFrequenciesFromClient:", 1);
    -[WCM_PolicyManager setSacWifiFrequency:](self, "setSacWifiFrequency:", 0);
  }
}

- (void)updateCTSacDriverRemoveAllFrequenciesFromClient:(unsigned __int8)a3
{
  uint64_t v3;
  const void *v4;
  unint64_t v5;
  _OWORD v6[2];
  uint64_t v7;
  char v8;

  v3 = a3;
  v8 = 0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Sac Driver: Removing all frequencies"));
  v7 = 0;
  memset(v6, 0, sizeof(v6));
  v4 = (const void *)_CTServerConnectionCreate(kCFAllocatorDefault, nullsub_36, v6);
  _CTServerConnectionGetCommCenterInitializationState(v4, &v8);
  _CTServerConnectionSendBarrier(v4, 0);
  if (!v8)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Sac Driver: WARNING!!! CommCenter is in a reset state!!"));
    if (v4)
      goto LABEL_3;
LABEL_7:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Sac Driver: Unable to create connection to CTServer - may be CommCenter is unloaded?\n"));
    return;
  }
  if (!v4)
    goto LABEL_7;
LABEL_3:
  v5 = _CTServerConnectionClearVictimFreq(v4, v3);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Sac Driver: Clearning frequency for client %d"), v3);
  if (HIDWORD(v5))
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Sac Driver:_CTServerConnectionRemoveVictimFreq: error: %d, domain: %d"), HIDWORD(v5), v5);
  CFRelease(v4);
}

- (void)updateGpsbandsInfoForBBv2
{
  WCM_PolicyManager *v2;
  uint64_t v3;
  id v4;
  id v5;
  int v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  WCM_PolicyManager *v20;
  WCM_CellularController *v21;
  NSMutableArray *obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v2 = self;
  v21 = -[WCM_PolicyManager cellularController](self, "cellularController");
  v3 = 4;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("BB20: updateGpsbandsInfoForBBv2: Count =  %lu\n"), -[NSMutableArray count](-[WCM_PolicyManager gpsBandInfoList](v2, "gpsBandInfoList"), "count"));
  if (-[NSMutableArray count](-[WCM_PolicyManager gpsBandInfoList](v2, "gpsBandInfoList"), "count"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v20 = v2;
    obj = -[WCM_PolicyManager gpsBandInfoList](v2, "gpsBandInfoList");
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = 0;
      v8 = 0;
      v9 = *(_QWORD *)v26;
      v3 = 4;
      v10 = 4;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          v12 = v10;
          v13 = v3;
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          v23 = 0u;
          v24 = 0u;
          objc_msgSend(v14, "getValue:", &v23);
          v15 = v23;
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("updateGpsbandsInfoForBBv2:gpsBandInfoList band = %u, bandUsePriority = %u\n"), v23, DWORD2(v24));
          if (v15 == 2)
          {
            v6 |= 2u;
            HIDWORD(v17) = DWORD2(v24);
            LODWORD(v17) = DWORD2(v24) - 256;
            v8 = 1;
            v3 = 1;
            switch((v17 >> 8))
            {
              case 0u:
                continue;
              case 1u:
                v8 = 1;
                v3 = 2;
                break;
              case 3u:
                v8 = 1;
                v3 = 3;
                break;
              case 7u:
                v8 = 1;
                v3 = 5;
                break;
              default:
                v8 = 1;
                goto LABEL_18;
            }
          }
          else if (v15 == 1)
          {
            v6 |= 1u;
            HIDWORD(v16) = DWORD2(v24);
            LODWORD(v16) = DWORD2(v24) - 256;
            v10 = 1;
            v7 = 1;
            v3 = v13;
            switch((v16 >> 8))
            {
              case 0u:
                continue;
              case 1u:
              case 3u:
                v10 = 2;
                goto LABEL_19;
              case 7u:
                v10 = 5;
                goto LABEL_19;
              default:
                v7 = 1;
                goto LABEL_18;
            }
          }
          else
          {
LABEL_18:
            v10 = v12;
LABEL_19:
            v3 = v13;
          }
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v5);
    }
    else
    {
      LOBYTE(v6) = 0;
      v7 = 0;
      v8 = 0;
      v3 = 4;
      v10 = 4;
    }
    v18 = v7 & 1;
    v19 = v8 & 1;
    v2 = v20;
  }
  else
  {
    LOBYTE(v6) = 0;
    v18 = 0;
    v19 = 0;
    v10 = 4;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, CFSTR("updateGpsbandsInfoForBBv2: L1enabled = %d, L5Enabled = %d, l1Level = %llu, l5Level = %llu\n"), v18, v19, v10, v3);
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](v2, "activeCoexFeatures"), "containsObject:", CFSTR("CoexBBUnifiedSensorInfoSupport")))
  {
    if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](v2, "activeCoexFeatures"), "containsObject:", CFSTR("UseWCMAriDriver")))
    {
      -[WCM_CellularController sendBBCoexSensorMessage:band:usecase:](v21, "sendBBCoexSensorMessage:band:usecase:", 0, v6, v3 & 0xF | (16 * v10));
    }
  }
}

- (void)handleCallLQMStateChange
{
  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("WiFiEnhCoexSupport")))
  {
    -[WCM_PolicyManager handleCallLQMStateChangeType7WiFiEnh:](self, "handleCallLQMStateChangeType7WiFiEnh:", 1);
  }
  else
  {
    -[WCM_PolicyManager handleCallLQMStateChangeType7:](self, "handleCallLQMStateChangeType7:", 1);
  }
}

- (void)updateCallStateActive:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("BB20: updateCallStateActive: callActive = %d self.callActive %d"), a3, -[WCM_PolicyManager callActiveState](self, "callActiveState"));
  if (-[WCM_PolicyManager callActiveState](self, "callActiveState") != v3)
  {
    -[WCM_PolicyManager setCallActiveState:](self, "setCallActiveState:", v3);
    objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 105);
  }
}

- (void)updateLqmState:(int)a3 deviceRRCState:(unsigned __int8)a4 subscriptionSlot:(int64_t)a5
{
  _QWORD block[6];
  int v6;
  unsigned __int8 v7;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C8E00;
  block[3] = &unk_100201F28;
  v6 = a3;
  v7 = a4;
  block[4] = self;
  block[5] = a5;
  dispatch_async((dispatch_queue_t)objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getQueue"), block);
}

- (void)updateAntselPolicyStatsArray:(id)a3
{
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  unsigned int v10;
  unsigned int v11;
  char *v12;
  NSMutableDictionary *v13;
  NSObject *obj;
  WCM_PolicyManager *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  obj = -[WCM_PolicyManager lockObjectWifiAntselPolicyStats](self, "lockObjectWifiAntselPolicyStats");
  objc_sync_enter(obj);
  v15 = self;
  v5 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", -[WCM_PolicyManager wifiAntselPolicyStatsArray](self, "wifiAntselPolicyStatsArray"));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("IsCoexBand"), obj), "BOOLValue");
        if (v10 == objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("IsCoexBand")), "BOOLValue"))
        {
          v11 = objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("HasAntConstraint")), "BOOLValue");
          if (v11 == objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("HasAntConstraint")), "BOOLValue")&& objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("IssueBand")), "isEqualToString:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("IssueBand")))&& objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("IssueType")), "isEqualToString:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("IssueType"))))
          {
            v12 = (char *)objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("count")), "integerValue");
            v13 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v9);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v12 + 1), CFSTR("count"));
            -[NSMutableArray removeObject:](-[WCM_PolicyManager wifiAntselPolicyStatsArray](v15, "wifiAntselPolicyStatsArray"), "removeObject:", v9);
            -[NSMutableArray addObject:](-[WCM_PolicyManager wifiAntselPolicyStatsArray](v15, "wifiAntselPolicyStatsArray"), "addObject:", v13);
            goto LABEL_14;
          }
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  -[NSMutableArray addObject:](-[WCM_PolicyManager wifiAntselPolicyStatsArray](v15, "wifiAntselPolicyStatsArray", obj), "addObject:", a3);
LABEL_14:
  objc_sync_exit(obj);
}

- (void)submitWifiAntselPolicyStats
{
  NSArray *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  WCM_PolicyManager *v8;
  NSObject *obj;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  obj = -[WCM_PolicyManager lockObjectWifiAntselPolicyStats](self, "lockObjectWifiAntselPolicyStats");
  objc_sync_enter(obj);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("submitWifiAntselPolicyStats"));
  v3 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", -[WCM_PolicyManager wifiAntselPolicyStatsArray](self, "wifiAntselPolicyStatsArray"));
  v8 = self;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("Sending AntSelPolicyStates: issueBand %@, issueType %@, isCoexBand %@, hasAntConstraint %@ issuecount %@"), objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("IssueBand")), objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("IssueType")), objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("IsCoexBand")), objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HasAntConstraint")), objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("count")));
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_1000C93E8;
        v10[3] = &unk_100203A30;
        v10[4] = v7;
        AnalyticsSendEventLazy(CFSTR("com.apple.WRMCellCoex.AntSelPolicyStates_V2"), v10);
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  -[NSMutableArray removeAllObjects](-[WCM_PolicyManager wifiAntselPolicyStatsArray](v8, "wifiAntselPolicyStatsArray"), "removeAllObjects");
  objc_sync_exit(obj);
}

- (void)wRMCACoexSubmit_AntSelPolicyStates:(unsigned int)a3 IssueType:(unsigned int)a4 IsCoexBand:(BOOL)a5 HasAntConstraint:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  const char *v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[5];
  _QWORD v16[5];

  v6 = a6;
  v7 = a5;
  v11 = sub_100082BCC(a3);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("AntSelPolicyStates: issueBand %s, issueType %s, isCoexBand %d, hasAntConstraint %d"), v11, sub_10007E508(a4), v7, v6);
  v15[0] = CFSTR("IsCoexBand");
  v16[0] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7);
  v15[1] = CFSTR("HasAntConstraint");
  v16[1] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6);
  v15[2] = CFSTR("IssueBand");
  v16[2] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sub_100082BCC(a3));
  v15[3] = CFSTR("IssueType");
  v15[4] = CFSTR("count");
  v16[3] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sub_10007E508(a4));
  v16[4] = &off_100230C18;
  -[WCM_PolicyManager updateAntselPolicyStatsArray:](self, "updateAntselPolicyStatsArray:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 5));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v13 = v12;
  -[WCM_PolicyManager previousStartTime](self, "previousStartTime");
  if (v13 - v14 > 300.0)
  {
    -[WCM_PolicyManager submitWifiAntselPolicyStats](self, "submitWifiAntselPolicyStats");
    -[WCM_PolicyManager setPreviousStartTime:](self, "setPreviousStartTime:", v13);
  }
}

- (void)wRMCACoexSubmit_ULCACoexStates:(BOOL)a3 ULCAPrimaryCarrierULFreq:(unsigned int)a4 ULCAPrimaryCarrierDLFreq:(unsigned int)a5 ULCAPrimaryCarrierULBW:(unsigned int)a6 ULCAPrimaryCarrierDLBW:(unsigned int)a7 ULCACriticalCarrierULFreq:(unsigned int)a8 ULCACriticalCarrierDLFreq:(unsigned int)a9 ULCACriticalCarrierULBW:(unsigned int)a10 ULCACriticalCarrierDLBW:(unsigned int)a11
{
  _QWORD v11[4];
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  BOOL v19;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000C975C;
  v11[3] = &unk_100205200;
  v19 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = *(_QWORD *)&a9;
  v18 = a11;
  AnalyticsSendEventLazy(CFSTR("com.apple.WRMCellCoex.ULCACoexStats"), v11);
}

- (void)handleBTCoexWiFiStateEvent:(int)a3 wifiChannel:(unsigned int)a4
{
  _QWORD block[4];
  int v5;
  unsigned int v6;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C9934;
  block[3] = &unk_100203228;
  v5 = a3;
  v6 = a4;
  dispatch_async((dispatch_queue_t)objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getQueue"), block);
}

- (void)handle5GHzHostAPStateEvent:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;

  v3 = a3;
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiFigaroCoex")))v5 = byte_1002713E6 == v3;
  else
    v5 = 1;
  if (!v5)
  {
    -[WCM_BTController update5GHzHostAP:](-[WCM_PolicyManager btController](self, "btController"), "update5GHzHostAP:", v3);
    byte_1002713E6 = v3;
  }
}

- (void)handleLow5GRate:(BOOL)a3
{
  _BOOL4 v3;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;

  v3 = a3;
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("WiFiFigaroCoex")))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("PolicyManager: handleLow5GRate %d"), v3);
    if (v3)
    {
      v5 = CFSTR("PolicyManager: WiFi 5G rates dropped, moved any AoS to 2G");
      v6 = 2;
LABEL_4:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", v6, v5);
      v7 = 1;
      goto LABEL_11;
    }
    if (-[WCM_BTController getAnyAoSLinkActive](-[WCM_PolicyManager btController](self, "btController"), "getAnyAoSLinkActive"))
    {
      if (-[WCM_WiFiController wifiState](-[WCM_PolicyManager wifiController](self, "wifiController"), "wifiState") > 2)
      {
        if (!-[WCM_BTController getAny5GHzBTDevicesConnected](-[WCM_PolicyManager btController](self, "btController"), "getAny5GHzBTDevicesConnected"))
        {
          v5 = CFSTR("PolicyManager: WiFi 5G rates recovered, keep AoS in 2G");
          v6 = 3;
          goto LABEL_4;
        }
        v8 = CFSTR("PolicyManager: rates are high and 5G AoS is connected, keep 5G TDD active");
        v9 = 3;
LABEL_10:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", v9, v8);
        v7 = 0;
LABEL_11:
        if (byte_1002713E7 != (_DWORD)v7)
        {
          -[WCM_BTController updateLowWiFi5GRates:](-[WCM_PolicyManager btController](self, "btController"), "updateLowWiFi5GRates:", v7);
          byte_1002713E7 = v7;
        }
        return;
      }
      v8 = CFSTR("PolicyManager: WiFi 5G is not connected, allow AoS in 5GHz");
    }
    else
    {
      v8 = CFSTR("PolicyManager: WiFi 5G rates recovered and no AoS link, allow AoS 5GHz");
    }
    v9 = 2;
    goto LABEL_10;
  }
}

- (void)handleBTCoexConnectedDevicesEvent_numA2DP:(unint64_t)a3 numLLA:(unint64_t)a4 numHID:(unint64_t)a5 numSCO:(unint64_t)a6 numeSCO:(unint64_t)a7 numLE:(unint64_t)a8 numLEA:(unint64_t)a9
{
  _QWORD block[11];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C9BCC;
  block[3] = &unk_100205220;
  block[4] = a3;
  block[5] = a4;
  block[6] = a5;
  block[7] = a6;
  block[8] = a7;
  block[9] = a8;
  block[10] = a9;
  dispatch_async((dispatch_queue_t)objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getQueue"), block);
}

- (void)handleBTCoexStatsEvent_tddCnt:(unsigned int)a3 hybridCnt:(unsigned int)a4 btDurMs:(unsigned int)a5 totDurMs:(unsigned int)a6 parallelCnt:(unsigned int)a7 btDurAirMs:(unsigned int)a8 wlrssiCoex:(char)a9 btrssiCoex:(char)a10
{
  _QWORD block[5];
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  char v17;
  char v18;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C9CFC;
  block[3] = &unk_100205248;
  block[4] = self;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  v18 = a10;
  dispatch_async((dispatch_queue_t)objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getQueue"), block);
}

- (void)handleCameraStateIndication
{
  xpc_object_t v3;

  if (-[NSSet containsObject:](-[WCM_PolicyManager activeCoexFeatures](self, "activeCoexFeatures"), "containsObject:", CFSTR("UseWCMAriDriver")))
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v3, "kWCMCellularSetCameraState", self->_cameraState);
    -[WCM_CellularController sendMessage:withArgs:](-[WCM_PolicyManager cellularController](self, "cellularController"), "sendMessage:withArgs:", 1233, v3);
    xpc_release(v3);
  }
  else
  {
    -[WCM_PolicyManager handleMavCameraStateIndication](self, "handleMavCameraStateIndication");
  }
}

- (void)handleMavCameraStateIndication
{
  unsigned int cameraState;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("PolicyManager handle camera state indication, new camera state = 0x%X"), self->_cameraState);
  cameraState = self->_cameraState;
  if (-[WCM_IOKitWrapper isFrontCameraSupported](self->_iokitWrapper, "isFrontCameraSupported"))
    -[WCM_CellularController sendBBCameraState:state:](-[WCM_PolicyManager cellularController](self, "cellularController"), "sendBBCameraState:state:", 41, (cameraState >> 3) & 1);
  if (-[WCM_IOKitWrapper isFaceIdSupported](self->_iokitWrapper, "isFaceIdSupported"))
    -[WCM_CellularController sendBBCameraState:state:](-[WCM_PolicyManager cellularController](self, "cellularController"), "sendBBCameraState:state:", 40, cameraState & 1);
  if (-[WCM_IOKitWrapper isBackTeleCameraSupported](self->_iokitWrapper, "isBackTeleCameraSupported"))
    -[WCM_CellularController sendBBCameraState:state:](-[WCM_PolicyManager cellularController](self, "cellularController"), "sendBBCameraState:state:", 44, (cameraState >> 6) & 1);
  if (-[WCM_IOKitWrapper isBackSuperWideCameraSupported](self->_iokitWrapper, "isBackSuperWideCameraSupported"))
    -[WCM_CellularController sendBBCameraState:state:](-[WCM_PolicyManager cellularController](self, "cellularController"), "sendBBCameraState:state:", 43, (cameraState >> 9) & 1);
}

- (void)handlePencilStateIndication
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("YYDebug_ PolicyManager handle pencil state indication, new pencil state = %d"), self->_pencilState);
}

- (void)sendWirelessBtLoad:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("sendWirelessBtLoad Load:%u"), *(_QWORD *)&a3);
  objc_msgSend(+[WCM_UCMClientManager WCM_UCMClientManagerSingleton](WCM_UCMClientManager, "WCM_UCMClientManagerSingleton"), "updateWirelessBtLoad:", v3);
}

- (void)startHomeKitTimer
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("startHomeKitTimer"));
  objc_msgSend(+[WCM_UCMClientManager WCM_UCMClientManagerSingleton](WCM_UCMClientManager, "WCM_UCMClientManagerSingleton"), "startHomeKitTimer:", 300.0);
}

- (void)stopHomeKitTimer
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("stopHomeKitTimer"));
  objc_msgSend(+[WCM_UCMClientManager WCM_UCMClientManagerSingleton](WCM_UCMClientManager, "WCM_UCMClientManagerSingleton"), "stopHomeKitTimer");
}

- (void)sendNRFrequencyBandUpdateForMic:(double)a3 dlHighFreq:(double)a4 ulLowFreq:(double)a5 ulHighFreq:(double)a6
{
  BOOL v11;
  _BOOL8 v15;
  BOOL v16;
  _BOOL8 v18;

  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", CFSTR("COEX_MIC_RF_SUPPORT")))
  {
    v11 = a3 < 3300.0 || a4 > 4200.0;
    v15 = 1;
    if (v11 && (a5 < 3300.0 || a6 > 4200.0) && (a3 < 4400.0 || a4 > 5000.0) && (a5 < 4400.0 || a6 > 5000.0))
      v15 = 0;
    v16 = a3 < 2496.0 || a4 > 2690.0;
    v18 = 1;
    if (v16 && (a5 < 2496.0 || a6 > 2690.0))
      v18 = 0;
    if (v15 != -[WCM_PolicyManager prevNR7xRFEnabled](self, "prevNR7xRFEnabled", 2496.0, 2690.0)
      || v18 != -[WCM_PolicyManager prevNR41RFEnabled](self, "prevNR41RFEnabled"))
    {
      objc_msgSend(+[WCM_UCMClientManager WCM_UCMClientManagerSingleton](WCM_UCMClientManager, "WCM_UCMClientManagerSingleton"), "sendNRFrequencyUpdateForMic:NR7xenabled:", v18, v15);
      -[WCM_PolicyManager setPrevNR7xRFEnabled:](self, "setPrevNR7xRFEnabled:", v15);
      -[WCM_PolicyManager setPrevNR41RFEnabled:](self, "setPrevNR41RFEnabled:", v18);
    }
  }
}

- (void)sendULFrequencyUpdates:(int64_t)a3 ulCenterFreq:(double)a4 ulBandwidth:(double)a5
{
  NSDictionary *v8;
  NSDictionary *v9;
  _QWORD v10[3];
  _QWORD v11[3];

  v10[0] = CFSTR("BandInfoType");
  v11[0] = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3);
  v10[1] = CFSTR("ULCenterFrequency");
  v11[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4);
  v10[2] = CFSTR("ULBandwidth");
  v11[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5);
  v8 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  if (v8)
  {
    v9 = v8;
    if (!-[WCM_PolicyManager prevULFrequencyUpdate](self, "prevULFrequencyUpdate")
      || !-[NSDictionary isEqualToDictionary:](v9, "isEqualToDictionary:", -[WCM_PolicyManager prevULFrequencyUpdate](self, "prevULFrequencyUpdate")))
    {
      objc_msgSend(+[WCM_UCMClientManager WCM_UCMClientManagerSingleton](WCM_UCMClientManager, "WCM_UCMClientManagerSingleton"), "sendULFrequencyUpdates:", v9);

      -[WCM_PolicyManager setPrevULFrequencyUpdate:](self, "setPrevULFrequencyUpdate:", -[NSDictionary copy](v9, "copy"));
    }
  }
}

- (WCM_CellularRc1PolicyManager)cellularRc1PolicyManager
{
  return self->_cellularRc1PolicyManager;
}

- (void)setCoexSupported:(BOOL)a3
{
  self->_coexSupported = a3;
}

- (BOOL)iRATSupported
{
  return self->_iRATSupported;
}

- (void)setIRATSupported:(BOOL)a3
{
  self->_iRATSupported = a3;
}

- (void)setPlatformManager:(id)a3
{
  self->_platformManager = (WCM_PlatformManager *)a3;
}

- (void)setCellularController:(id)a3
{
  self->_cellularController = (WCM_CellularController *)a3;
}

- (WCM_HPCellularStateMonitor)hpCellularMonitor
{
  return self->_hpCellularMonitor;
}

- (void)setHpCellularMonitor:(id)a3
{
  self->_hpCellularMonitor = (WCM_HPCellularStateMonitor *)a3;
}

- (void)setWifiController:(id)a3
{
  self->_wifiController = (WCM_WiFiController *)a3;
}

- (void)setBtController:(id)a3
{
  self->_btController = (WCM_BTController *)a3;
}

- (WCM_FTController)ftController
{
  return self->_ftController;
}

- (void)setFtController:(id)a3
{
  self->_ftController = (WCM_FTController *)a3;
}

- (WCM_R1Controller)rcu1Controller
{
  return self->_rcu1Controller;
}

- (void)setRcu1Controller:(id)a3
{
  self->_rcu1Controller = (WCM_R1Controller *)a3;
}

- (void)setRcu2Controller:(id)a3
{
  self->_rcu2Controller = (WCM_RCU2Controller *)a3;
}

- (WCM_P2PAWDLController)p2pAwdlController
{
  return self->_p2pAwdlController;
}

- (void)setP2pAwdlController:(id)a3
{
  self->_p2pAwdlController = (WCM_P2PAWDLController *)a3;
}

- (WCM_P2PNANController)p2pNanController
{
  return self->_p2pNanController;
}

- (void)setP2pNanController:(id)a3
{
  self->_p2pNanController = (WCM_P2PNANController *)a3;
}

- (WCM_AirplayController)airplayController
{
  return self->_airplayController;
}

- (void)setAirplayController:(id)a3
{
  self->_airplayController = (WCM_AirplayController *)a3;
}

- (WCM_CoexMonitor)coexMonitor
{
  return self->_coexMonitor;
}

- (void)setCoexMonitor:(id)a3
{
  self->_coexMonitor = (WCM_CoexMonitor *)a3;
}

- (WCM_ExternalAccessory)extAccessory
{
  return self->_extAccessory;
}

- (void)setExtAccessory:(id)a3
{
  self->_extAccessory = (WCM_ExternalAccessory *)a3;
}

- (WCM_BSPMonitor)bspMonitor
{
  return self->_bspMonitor;
}

- (void)setBspMonitor:(id)a3
{
  self->_bspMonitor = (WCM_BSPMonitor *)a3;
}

- (WCM_MavAntennaPolicy)mavAntPolicy
{
  return self->_mavAntPolicy;
}

- (void)setActiveCoexFeatures:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (void)setCellularWCI2CoexPolicyBitmap:(unint64_t)a3
{
  self->_cellularWCI2CoexPolicyBitmap = a3;
}

- (NSData)btPreferredChannelMap
{
  return self->_btPreferredChannelMap;
}

- (void)setBtPreferredChannelMap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (void)setBtPreferredChannelMapOnGpsRadioActive:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (void)setBtPreferredChannelMapHPCellularActive:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 232);
}

- (NSData)btPreferred5GChannelMap
{
  return self->_btPreferred5GChannelMap;
}

- (void)setBtPreferred5GChannelMap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 240);
}

- (NSDictionary)HFBTAntBlkEnableBands
{
  return self->_HFBTAntBlkEnableBands;
}

- (void)setHFBTAntBlkEnableBands:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 248);
}

- (NSData)btDiversityChannelMapForC0B0
{
  return self->_btDiversityChannelMapForC0B0;
}

- (void)setBtDiversityChannelMapForC0B0:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 256);
}

- (NSData)btDiversityChannelMapForC0B1
{
  return self->_btDiversityChannelMapForC0B1;
}

- (void)setBtDiversityChannelMapForC0B1:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 264);
}

- (NSData)btDiversityChannelMapForC1B0
{
  return self->_btDiversityChannelMapForC1B0;
}

- (void)setBtDiversityChannelMapForC1B0:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 272);
}

- (NSData)btDiversityChannelMapForC1B1
{
  return self->_btDiversityChannelMapForC1B1;
}

- (void)setBtDiversityChannelMapForC1B1:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 280);
}

- (NSData)btDiversityChannelMapOnGpsRadioActiveForC0B0
{
  return self->_btDiversityChannelMapOnGpsRadioActiveForC0B0;
}

- (void)setBtDiversityChannelMapOnGpsRadioActiveForC0B0:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

- (NSData)btDiversityChannelMapOnGpsRadioActiveForC0B1
{
  return self->_btDiversityChannelMapOnGpsRadioActiveForC0B1;
}

- (void)setBtDiversityChannelMapOnGpsRadioActiveForC0B1:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 296);
}

- (NSData)btDiversityChannelMapOnGpsRadioActiveForC1B0
{
  return self->_btDiversityChannelMapOnGpsRadioActiveForC1B0;
}

- (void)setBtDiversityChannelMapOnGpsRadioActiveForC1B0:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

- (NSData)btDiversityChannelMapOnGpsRadioActiveForC1B1
{
  return self->_btDiversityChannelMapOnGpsRadioActiveForC1B1;
}

- (void)setBtDiversityChannelMapOnGpsRadioActiveForC1B1:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 312);
}

- (int)btPreferredRole
{
  return self->_btPreferredRole;
}

- (void)setBtPreferredRole:(int)a3
{
  self->_btPreferredRole = a3;
}

- (unint64_t)btAntBlockDuration
{
  return self->_btAntBlockDuration;
}

- (NSArray)wifiChannelsToBlocklist
{
  return self->_wifiChannelsToBlocklist;
}

- (void)setWifiChannelsToBlocklist:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 328);
}

- (NSArray)wifiChannelsToEnableWCI2
{
  return self->_wifiChannelsToEnableWCI2;
}

- (void)setWifiChannelsToEnableWCI2:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 336);
}

- (NSMutableArray)wifiChannelsToEnableWCI2V2
{
  return self->_wifiChannelsToEnableWCI2V2;
}

- (void)setWifiChannelsToEnableWCI2V2:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 344);
}

- (NSMutableArray)wifiChannelsToEnableWCI2Gand5G
{
  return self->_wifiChannelsToEnableWCI2Gand5G;
}

- (void)setWifiChannelsToEnableWCI2Gand5G:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 352);
}

- (NSMutableArray)wifiChannelsToEnableWCI2WiFiEnh
{
  return self->_wifiChannelsToEnableWCI2WiFiEnh;
}

- (void)setWifiChannelsToEnableWCI2WiFiEnh:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 360);
}

- (NSMutableArray)wifiChannelsToEnableLTEMBType7
{
  return self->_wifiChannelsToEnableLTEMBType7;
}

- (void)setWifiChannelsToEnableLTEMBType7:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 368);
}

- (NSMutableArray)wifi5GHzChannelsToEnableType7MSG
{
  return self->_wifi5GHzChannelsToEnableType7MSG;
}

- (void)setWifi5GHzChannelsToEnableType7MSG:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 376);
}

- (NSMutableArray)wifi5GHzChannelsToEnableType7MSGCombined
{
  return self->_wifi5GHzChannelsToEnableType7MSGCombined;
}

- (void)setWifi5GHzChannelsToEnableType7MSGCombined:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 384);
}

- (NSMutableArray)wifi2GHzChannelsToEnableType7MSGCombined
{
  return self->_wifi2GHzChannelsToEnableType7MSGCombined;
}

- (void)setWifi2GHzChannelsToEnableType7MSGCombined:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 392);
}

- (NSMutableArray)wifi2GHzLTEB7IMD3ChannelsEnableType7
{
  return self->_wifi2GHzLTEB7IMD3ChannelsEnableType7;
}

- (void)setWifi2GHzLTEB7IMD3ChannelsEnableType7:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 400);
}

- (NSMutableArray)wifi2G5GChannelsToEnableType7MSG
{
  return self->_wifi2G5GChannelsToEnableType7MSG;
}

- (void)setWifi2G5GChannelsToEnableType7MSG:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 408);
}

- (NSMutableArray)wifiEnhChannelsToEnableType7MSG
{
  return self->_wifiEnhChannelsToEnableType7MSG;
}

- (void)setWifiEnhChannelsToEnableType7MSG:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 416);
}

- (unsigned)type7CellAntBlkIdx
{
  return self->_type7CellAntBlkIdx;
}

- (void)setType7CellAntBlkIdx:(unsigned __int16)a3
{
  self->_type7CellAntBlkIdx = a3;
}

- (NSArray)wifiChannelsToDisableOCL
{
  return self->_wifiChannelsToDisableOCL;
}

- (void)setWifiChannelsToDisableOCL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 424);
}

- (NSMutableArray)wifiChannelsToDisableOCL2G5G
{
  return self->_wifiChannelsToDisableOCL2G5G;
}

- (void)setWifiChannelsToDisableOCL2G5G:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 432);
}

- (NSMutableArray)wifiChannelsToDisableOCLEnh
{
  return self->_wifiChannelsToDisableOCLEnh;
}

- (void)setWifiChannelsToDisableOCLEnh:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 440);
}

- (NSNumber)wifiRxPriThreshold
{
  return self->_wifiRxPriThreshold;
}

- (void)setWifiRxPriThreshold:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 448);
}

- (BOOL)audioBuiltInReceiver
{
  return self->_audioBuiltInReceiver;
}

- (void)setAudioBuiltInReceiver:(BOOL)a3
{
  self->_audioBuiltInReceiver = a3;
}

- (BOOL)callActiveState
{
  return self->_callActiveState;
}

- (void)setCallActiveState:(BOOL)a3
{
  self->_callActiveState = a3;
}

- (char)dataLqmState
{
  return self->_dataLqmState;
}

- (void)setDataLqmState:(char)a3
{
  self->_dataLqmState = a3;
}

- (unsigned)callType
{
  return self->_callType;
}

- (unsigned)CTRrcState
{
  return self->_CTRrcState;
}

- (void)setCTRrcState:(unsigned __int8)a3
{
  self->_CTRrcState = a3;
}

- (BOOL)clamshellState
{
  return self->_clamshellState;
}

- (void)setClamshellState:(BOOL)a3
{
  self->_clamshellState = a3;
}

- (BOOL)wcmCellularWCI2Mode_Ext_Enable
{
  return self->_wcmCellularWCI2Mode_Ext_Enable;
}

- (void)setWcmCellularWCI2Mode_Ext_Enable:(BOOL)a3
{
  self->_wcmCellularWCI2Mode_Ext_Enable = a3;
}

- (void)setWcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap:(unint64_t)a3
{
  self->_wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap = a3;
}

- (void)setWcmCellularCCSetToBB:(BOOL)a3
{
  self->_wcmCellularCCSetToBB = a3;
}

- (unint64_t)wcmCellularWCI2Mode_CC2
{
  return self->_wcmCellularWCI2Mode_CC2;
}

- (void)setWcmCellularWCI2Mode_CC2:(unint64_t)a3
{
  self->_wcmCellularWCI2Mode_CC2 = a3;
}

- (void)setWcmCellular_CC1_Tech:(unint64_t)a3
{
  self->_wcmCellular_CC1_Tech = a3;
}

- (void)setWcmCellular_CC2_Tech:(unint64_t)a3
{
  self->_wcmCellular_CC2_Tech = a3;
}

- (void)setHpCellNeed2SetBTAFH:(BOOL)a3
{
  self->_hpCellNeed2SetBTAFH = a3;
}

- (BOOL)isInHpSession
{
  return self->_isInHpSession;
}

- (void)setIsInHpSession:(BOOL)a3
{
  self->_isInHpSession = a3;
}

- (unsigned)dynamicAntBlkingBand
{
  return self->_dynamicAntBlkingBand;
}

- (void)setDynamicAntBlkingBand:(unsigned __int16)a3
{
  self->_dynamicAntBlkingBand = a3;
}

- (unsigned)dynamicCellAntBlkEnableIdx1
{
  return self->_dynamicCellAntBlkEnableIdx1;
}

- (void)setDynamicCellAntBlkEnableIdx1:(unsigned __int8)a3
{
  self->_dynamicCellAntBlkEnableIdx1 = a3;
}

- (unsigned)dynamicCellAntBlkEnableIdx2
{
  return self->_dynamicCellAntBlkEnableIdx2;
}

- (void)setDynamicCellAntBlkEnableIdx2:(unsigned __int8)a3
{
  self->_dynamicCellAntBlkEnableIdx2 = a3;
}

- (BOOL)wcmGen9rFemLpmMode2g
{
  return self->_wcmGen9rFemLpmMode2g;
}

- (void)setWcmGen9rFemLpmMode2g:(BOOL)a3
{
  self->_wcmGen9rFemLpmMode2g = a3;
}

- (BOOL)wcmGen9rFemLpmMode5g
{
  return self->_wcmGen9rFemLpmMode5g;
}

- (void)setWcmGen9rFemLpmMode5g:(BOOL)a3
{
  self->_wcmGen9rFemLpmMode5g = a3;
}

- (unsigned)cameraState
{
  return self->_cameraState;
}

- (void)setCameraState:(unsigned int)a3
{
  self->_cameraState = a3;
}

- (unsigned)pencilState
{
  return self->_pencilState;
}

- (void)setPencilState:(unsigned int)a3
{
  self->_pencilState = a3;
}

- (BOOL)pencilCoexActive
{
  return self->_pencilCoexActive;
}

- (BOOL)findMyPencilScanActive
{
  return self->_findMyPencilScanActive;
}

- (int)coexProfile2GTDDReason
{
  return self->_coexProfile2GTDDReason;
}

- (BOOL)timesharingEnabled_subId0
{
  return self->_timesharingEnabled_subId0;
}

- (BOOL)timesharingEnabled_subId1
{
  return self->_timesharingEnabled_subId1;
}

- (unint64_t)timesharingFreq_subId0
{
  return self->_timesharingFreq_subId0;
}

- (unint64_t)timesharingBw_subId0
{
  return self->_timesharingBw_subId0;
}

- (unint64_t)timesharingFreq_subId1
{
  return self->_timesharingFreq_subId1;
}

- (unint64_t)timesharingBw_subId1
{
  return self->_timesharingBw_subId1;
}

- (unsigned)type7WiFiEnhCellAntBlkIdx
{
  return self->_type7WiFiEnhCellAntBlkIdx;
}

- (void)setType7WiFiEnhCellAntBlkIdx:(unsigned __int16)a3
{
  self->_type7WiFiEnhCellAntBlkIdx = a3;
}

- (NSArray)legacyWiFiBlocklistChannelsFor3FoWiFi
{
  return self->_legacyWiFiBlocklistChannelsFor3FoWiFi;
}

- (void)setLegacyWiFiBlocklistChannelsFor3FoWiFi:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 528);
}

- (int)watchCellularAntPref
{
  return self->_watchCellularAntPref;
}

- (void)setWatchCellularAntPref:(int)a3
{
  self->_watchCellularAntPref = a3;
}

- (NSNumber)btAgcCoexModeEnable
{
  return self->_btAgcCoexModeEnable;
}

- (void)setBtAgcCoexModeEnable:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 536);
}

- (NSNumber)wifiAgcCoexModeLevel
{
  return self->_wifiAgcCoexModeLevel;
}

- (void)setWifiAgcCoexModeLevel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 544);
}

- (unsigned)sacWifiFrequency
{
  return self->_sacWifiFrequency;
}

- (void)setSacWifiFrequency:(unsigned int)a3
{
  self->_sacWifiFrequency = a3;
}

- (unint64_t)BLEActiveScanPwrLmtAssrInt
{
  return self->_BLEActiveScanPwrLmtAssrInt;
}

- (void)setBLEActiveScanPwrLmtAssrInt:(unint64_t)a3
{
  self->_BLEActiveScanPwrLmtAssrInt = a3;
}

- (BOOL)wcmCellularCoexBand
{
  return self->_wcmCellularCoexBand;
}

- (void)setWcmCellularCoexBand:(BOOL)a3
{
  self->_wcmCellularCoexBand = a3;
}

- (WCM_IOKitWrapper)iokitWrapper
{
  return self->_iokitWrapper;
}

- (void)setIokitWrapper:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 560);
}

- (BOOL)forceRealTimeAWDL
{
  return self->_forceRealTimeAWDL;
}

- (void)setForceRealTimeAWDL:(BOOL)a3
{
  self->_forceRealTimeAWDL = a3;
}

- (NSMutableArray)wifiAntselPolicyStatsArray
{
  return self->_wifiAntselPolicyStatsArray;
}

- (void)setWifiAntselPolicyStatsArray:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 568);
}

- (double)previousStartTime
{
  return self->_previousStartTime;
}

- (void)setPreviousStartTime:(double)a3
{
  self->_previousStartTime = a3;
}

- (NSObject)lockObjectWifiAntselPolicyStats
{
  return self->_lockObjectWifiAntselPolicyStats;
}

- (void)setLockObjectWifiAntselPolicyStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 584);
}

- (BOOL)prevNR7xRFEnabled
{
  return self->_prevNR7xRFEnabled;
}

- (void)setPrevNR7xRFEnabled:(BOOL)a3
{
  self->_prevNR7xRFEnabled = a3;
}

- (BOOL)prevNR41RFEnabled
{
  return self->_prevNR41RFEnabled;
}

- (void)setPrevNR41RFEnabled:(BOOL)a3
{
  self->_prevNR41RFEnabled = a3;
}

- (NSMutableDictionary)prevULFrequencyUpdate
{
  return self->_prevULFrequencyUpdate;
}

- (void)setPrevULFrequencyUpdate:(id)a3
{
  self->_prevULFrequencyUpdate = (NSMutableDictionary *)a3;
}

@end
