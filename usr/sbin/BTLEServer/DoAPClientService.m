@implementation DoAPClientService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDDoAPServiceString);
}

- (DoAPClientService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  DoAPClientService *v5;
  DoAPClientService *v6;
  NSMutableArray *v7;
  NSMutableArray *codecList;
  NSMutableArray *v9;
  NSMutableArray *doapDevices;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)DoAPClientService;
  v5 = -[ClientService initWithManager:peripheral:service:](&v12, "initWithManager:peripheral:service:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[ClientService setIsPrimary:](v5, "setIsPrimary:", 1);
    -[ClientService setPriority:](v6, "setPriority:", 3);
    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    codecList = v6->_codecList;
    v6->_codecList = v7;

    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    doapDevices = v6->_doapDevices;
    v6->_doapDevices = v9;

    v6->_isStartStreamingNotificationEnabled = 0;
    v6->_isStopStreamingNotificationEnabled = 0;
    v6->_isSendDataNotificationEnabled = 0;
    v6->_isEventIndicatorNotificationEnabled = 0;
  }
  return v6;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  _QWORD v13[6];

  v12.receiver = self;
  v12.super_class = (Class)DoAPClientService;
  -[ClientService start](&v12, "start");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDSupportedCodecsCharacteristicString));
  v13[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDSelectedCodecCharacteristicString));
  v13[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDStartStreamingCharacteristicString));
  v13[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDStopStreamingCharacteristicString));
  v13[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDSendDataCharacteristicString));
  v13[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDEventIndicatorCharacteristicString));
  v13[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 6));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService service](self, "service"));
  objc_msgSend(v10, "discoverCharacteristics:forService:", v9, v11);

}

- (void)stop
{
  objc_super v3;

  -[DoAPClientService destroyDoAPDevice](self, "destroyDoAPDevice");
  v3.receiver = self;
  v3.super_class = (Class)DoAPClientService;
  -[ClientService stop](&v3, "stop");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)DoAPClientService;
  -[DoAPClientService dealloc](&v4, "dealloc");
}

- (void)parseTLVCodecValue:(char *)a3 dataLength:(unsigned __int8)a4 codecStruct:(id *)a5
{
  unsigned int v6;
  int v8;
  unint64_t v9;
  unsigned int v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  unsigned __int16 v13;
  uint64_t v14;
  unsigned int var1;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint64_t v19;
  unsigned int var2;
  uint64_t v21;
  unsigned int var3;
  uint64_t v23;
  unsigned int var4;
  uint64_t v25;
  unsigned int var5;
  uint64_t v27;
  unsigned int var6;
  uint64_t v29;
  unsigned int var7;
  uint64_t v31;
  unsigned int var8;
  uint64_t v33;
  unsigned int var9;
  uint64_t v35;
  unsigned int var10;
  NSObject *v37;
  uint8_t buf[4];
  unsigned int v39;

  if (a4)
  {
    v6 = a4;
    v8 = 0;
    v9 = a4;
    while (2)
    {
      v10 = a3[v8];
      v11 = v8 + 2;
      switch(a3[v8])
      {
        case 1:
          if (v6 <= v11)
          {
            if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
              sub_10006E81C();
          }
          else
          {
            v12 = v8 + 3;
            v13 = a3[(v8 + 2)];
            a5->var1 = v13;
            if (v6 > (v8 + 3))
            {
              v8 += 4;
              a5->var1 = v13 | (a3[v12] << 8);
              v14 = qword_1000C9178;
              if (!os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
                goto LABEL_39;
              var1 = a5->var1;
              *(_DWORD *)buf = 67109120;
              v39 = var1;
              v16 = v14;
              v17 = "kDoAPCodecAttributeIDSampleFrequency %u";
              goto LABEL_38;
            }
            if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
              sub_10006E7BC();
          }
          break;
        case 2:
          if (v6 > v11)
          {
            v8 += 3;
            a5->var2 = a3[v11];
            v19 = qword_1000C9178;
            if (!os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
              goto LABEL_39;
            var2 = a5->var2;
            *(_DWORD *)buf = 67109120;
            v39 = var2;
            v16 = v19;
            v17 = "kDoAPCodecAttributeIDChannel %u";
            goto LABEL_38;
          }
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
            sub_10006E87C();
          break;
        case 3:
          if (v6 > v11)
          {
            v8 += 3;
            a5->var3 = a3[v11];
            v21 = qword_1000C9178;
            if (!os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
              goto LABEL_39;
            var3 = a5->var3;
            *(_DWORD *)buf = 67109120;
            v39 = var3;
            v16 = v21;
            v17 = "kDoAPCodecAttributeIDAllocMethod %u";
            goto LABEL_38;
          }
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
            sub_10006E8DC();
          break;
        case 4:
          if ((unint64_t)(v8 + 2) + 4 < v9)
          {
            a5->var4 = a3[(v8 + 2)] | (a3[(v8 + 2)
                                                                                           + 1] << 8) | (a3[(v8 + 2) + 2] << 16) | (a3[(v8 + 2) + 3] << 24);
            v8 += 6;
            v23 = qword_1000C9178;
            if (!os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
              goto LABEL_39;
            var4 = a5->var4;
            *(_DWORD *)buf = 67109120;
            v39 = var4;
            v16 = v23;
            v17 = "kDoAPCodecAttributeIDBitrate %u";
            goto LABEL_38;
          }
          v37 = qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
            sub_10006E93C(v6, (v8 + 2), v37);
          break;
        case 5:
          if (v6 > v11)
          {
            v8 += 3;
            a5->var5 = a3[v11];
            v25 = qword_1000C9178;
            if (!os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
              goto LABEL_39;
            var5 = a5->var5;
            *(_DWORD *)buf = 67109120;
            v39 = var5;
            v16 = v25;
            v17 = "kDoAPCodecAttributeIDBlocks %u";
            goto LABEL_38;
          }
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
            sub_10006E9B4();
          break;
        case 6:
          if (v6 > v11)
          {
            v8 += 3;
            a5->var6 = a3[v11];
            v27 = qword_1000C9178;
            if (!os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
              goto LABEL_39;
            var6 = a5->var6;
            *(_DWORD *)buf = 67109120;
            v39 = var6;
            v16 = v27;
            v17 = "kDoAPCodecAttributeIDSubbands %u";
            goto LABEL_38;
          }
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
            sub_10006EA14();
          break;
        case 7:
          if (v6 > v11)
          {
            v8 += 3;
            a5->var7 = a3[v11];
            v29 = qword_1000C9178;
            if (!os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
              goto LABEL_39;
            var7 = a5->var7;
            *(_DWORD *)buf = 67109120;
            v39 = var7;
            v16 = v29;
            v17 = "kDoAPCodecAttributeIDMinBitpool %u";
            goto LABEL_38;
          }
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
            sub_10006EA74();
          break;
        case 8:
          if (v6 > v11)
          {
            v8 += 3;
            a5->var8 = a3[v11];
            v31 = qword_1000C9178;
            if (!os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
              goto LABEL_39;
            var8 = a5->var8;
            *(_DWORD *)buf = 67109120;
            v39 = var8;
            v16 = v31;
            v17 = "kDoAPCodecAttributeIDMaxBitpool %u";
            goto LABEL_38;
          }
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
            sub_10006EAD4();
          break;
        case 9:
          if (v6 > v11)
          {
            v8 += 3;
            a5->var9 = a3[v11];
            v33 = qword_1000C9178;
            if (!os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
              goto LABEL_39;
            var9 = a5->var9;
            *(_DWORD *)buf = 67109120;
            v39 = var9;
            v16 = v33;
            v17 = "kDoAPCodecAttributeIDObjectType %u";
            goto LABEL_38;
          }
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
            sub_10006EB34();
          break;
        case 10:
          if (v6 > v11)
          {
            v8 += 3;
            a5->var10 = a3[v11];
            v35 = qword_1000C9178;
            if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
            {
              var10 = a5->var10;
              *(_DWORD *)buf = 67109120;
              v39 = var10;
              v16 = v35;
              v17 = "kDoAPCodecAttributeIDVBR %u";
LABEL_38:
              _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, v17, buf, 8u);
            }
            goto LABEL_39;
          }
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
            sub_10006EB94();
          break;
        default:
          v18 = qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            v39 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error wrong DoAP attributeID %u", buf, 8u);
          }
          v8 += 2;
LABEL_39:
          if (v6 > v8)
            continue;
          break;
      }
      break;
    }
  }
}

- (void)parseTLVCodecList:(char *)a3 dataLength:(unsigned __int8)a4 streamID:(unsigned __int16)a5
{
  uint64_t v5;
  unsigned int v6;
  int v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  DoAPCodec *v13;
  void *v14;
  __int128 v15;
  int v16;
  uint8_t buf[16];
  int v18;

  if (a4)
  {
    v5 = a5;
    v6 = a4;
    v9 = 0;
    while (1)
    {
      v15 = 0uLL;
      v16 = 0;
      LOBYTE(v15) = a3[v9];
      v10 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v15;
        _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "DoAPCodecType %u", buf, 8u);
      }
      if (v6 <= (v9 + 1))
        break;
      v11 = v9 + 2;
      v12 = a3[v9 + 1];
      -[DoAPClientService parseTLVCodecValue:dataLength:codecStruct:](self, "parseTLVCodecValue:dataLength:codecStruct:", &a3[(v9 + 2)], v12, &v15);
      v13 = -[DoAPCodec initWithID:]([DoAPCodec alloc], "initWithID:", v5);
      *(_OWORD *)buf = v15;
      v18 = v16;
      -[DoAPCodec addCodec:](v13, "addCodec:", buf);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService codecList](self, "codecList"));
      objc_msgSend(v14, "addObject:", v13);

      v9 = v12 + v11;
      if (v6 <= (v12 + v11))
        return;
    }
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006EBF4();
  }
}

- (void)createDoAPDevice
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  unsigned __int8 *v10;
  unsigned __int16 *v11;
  unsigned int v12;
  unsigned int v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint8_t v28;
  _BYTE v29[15];
  uint8_t buf[4];
  int v31;

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService SupportedCodecsCharacteristic](self, "SupportedCodecsCharacteristic"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "value"));
  if (!v3
    || !-[DoAPClientService isStartStreamingNotificationEnabled](self, "isStartStreamingNotificationEnabled")
    || !-[DoAPClientService isStopStreamingNotificationEnabled](self, "isStopStreamingNotificationEnabled")
    || !-[DoAPClientService isSendDataNotificationEnabled](self, "isSendDataNotificationEnabled"))
  {

    return;
  }
  v4 = -[DoAPClientService isEventIndicatorNotificationEnabled](self, "isEventIndicatorNotificationEnabled");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService SupportedCodecsCharacteristic](self, "SupportedCodecsCharacteristic"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
    v7 = objc_msgSend(v6, "length");

    if ((unint64_t)v7 >= 7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService SupportedCodecsCharacteristic](self, "SupportedCodecsCharacteristic"));
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "value")));
      v10 = (unsigned __int8 *)objc_msgSend(v9, "bytes");

      v13 = *v10;
      v11 = (unsigned __int16 *)(v10 + 1);
      v12 = v13;
      v14 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
      {
        sub_10006EC90(v12, v14);
        if (!v12)
          return;
      }
      else if (!v12)
      {
        return;
      }
      v15 = 0;
      do
      {
        v16 = *v11;
        v17 = qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          v31 = v16;
          _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "DoAP StreamID 0x%02x", buf, 8u);
        }
        v18 = *((unsigned __int8 *)v11 + 2);
        v19 = qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          v31 = v18;
          _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "DoAPCodec list length is %u", buf, 8u);
        }
        v11 = (unsigned __int16 *)((char *)v11 + 3);
        if ((_DWORD)v18)
        {
          -[DoAPClientService parseTLVCodecList:dataLength:streamID:](self, "parseTLVCodecList:dataLength:streamID:", v11, v18, v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService codecList](self, "codecList"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[DoAPDevice doapDeviceWithCodecs:streamID:](DoAPDevice, "doapDeviceWithCodecs:streamID:", v20, v16));

          if (v21)
          {
            objc_msgSend(v21, "setService:", self);
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
            objc_msgSend(v21, "setPeripheral:", v22);

            v23 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService doapDevices](self, "doapDevices"));
            objc_msgSend(v23, "addObject:", v21);

            objc_msgSend(v21, "start");
          }
          else
          {
            v25 = qword_1000C9178;
            if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
              sub_10006EC54(&v28, v29, v25);
          }
          v11 = (unsigned __int16 *)((char *)v11 + v18);
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService codecList](self, "codecList"));
          objc_msgSend(v26, "removeAllObjects");

        }
        else
        {
          v24 = qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            v31 = v16;
            _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "DoAP Error No codeclist for streamID%u", buf, 8u);
          }
        }
        ++v15;
      }
      while (v12 > v15);
    }
  }
}

- (void)destroyDoAPDevice
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService doapDevices](self, "doapDevices", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "stop");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)notifyDidStartIfEverythingReady
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService doapDevices](self, "doapDevices"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7), "state") != 2)
        {

          return;
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }

  v8 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DoAPService didStart", v9, 2u);
  }
  -[ClientService notifyDidStart](self, "notifyDidStart");
}

- (void)setNotificationEnabled:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDStartStreamingCharacteristicString));
  v5 = objc_msgSend(v12, "isEqual:", v4);

  if (v5)
  {
    -[DoAPClientService setIsStartStreamingNotificationEnabled:](self, "setIsStartStreamingNotificationEnabled:", 1);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDStopStreamingCharacteristicString));
    v7 = objc_msgSend(v12, "isEqual:", v6);

    if (v7)
    {
      -[DoAPClientService setIsStopStreamingNotificationEnabled:](self, "setIsStopStreamingNotificationEnabled:", 1);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDSendDataCharacteristicString));
      v9 = objc_msgSend(v12, "isEqual:", v8);

      if (v9)
      {
        -[DoAPClientService setIsSendDataNotificationEnabled:](self, "setIsSendDataNotificationEnabled:", 1);
      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDEventIndicatorCharacteristicString));
        v11 = objc_msgSend(v12, "isEqual:", v10);

        if (v11)
          -[DoAPClientService setIsEventIndicatorNotificationEnabled:](self, "setIsEventIndicatorNotificationEnabled:", 1);
      }
    }
  }

}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  id obj;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];

  v8 = a3;
  v9 = v8;
  if (a5)
    goto LABEL_2;
  v51 = v8;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "characteristics"));
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v56;
    v53 = CBUUIDSupportedCodecsCharacteristicString;
    v52 = CBUUIDSelectedCodecCharacteristicString;
    v50 = CBUUIDStartStreamingCharacteristicString;
    v48 = CBUUIDSendDataCharacteristicString;
    v49 = CBUUIDStopStreamingCharacteristicString;
    v47 = CBUUIDEventIndicatorCharacteristicString;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v56 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService SupportedCodecsCharacteristic](self, "SupportedCodecsCharacteristic", v47));
        if (v16)
        {

        }
        else
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUID"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v53));
          v19 = objc_msgSend(v17, "isEqual:", v18);

          if (v19)
          {
            -[DoAPClientService setSupportedCodecsCharacteristic:](self, "setSupportedCodecsCharacteristic:", v15);
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "value"));

            if (!v20)
              objc_msgSend(v51, "readValueForCharacteristic:", v15);
            goto LABEL_38;
          }
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService SelectedCodecCharacteristic](self, "SelectedCodecCharacteristic"));
        if (v21)
        {

        }
        else
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUID"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v52));
          v24 = objc_msgSend(v22, "isEqual:", v23);

          if (v24)
          {
            -[DoAPClientService setSelectedCodecCharacteristic:](self, "setSelectedCodecCharacteristic:", v15);
            goto LABEL_38;
          }
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService StartStreamingCharacteristic](self, "StartStreamingCharacteristic"));
        if (v25)
        {

        }
        else
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUID"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v50));
          v28 = objc_msgSend(v26, "isEqual:", v27);

          if (v28)
          {
            -[DoAPClientService setStartStreamingCharacteristic:](self, "setStartStreamingCharacteristic:", v15);
            if ((v12 & 1) == 0)
              goto LABEL_21;
            goto LABEL_22;
          }
        }
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService StopStreamingCharacteristic](self, "StopStreamingCharacteristic"));
        if (v29)
        {

        }
        else
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUID"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v49));
          v32 = objc_msgSend(v30, "isEqual:", v31);

          if (v32)
          {
            -[DoAPClientService setStopStreamingCharacteristic:](self, "setStopStreamingCharacteristic:", v15);
            if ((v12 & 1) == 0)
              goto LABEL_21;
            goto LABEL_22;
          }
        }
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService SendDataCharacteristic](self, "SendDataCharacteristic"));
        if (v33)
        {

        }
        else
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUID"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v48));
          v36 = objc_msgSend(v34, "isEqual:", v35);

          if (v36)
          {
            -[DoAPClientService setSendDataCharacteristic:](self, "setSendDataCharacteristic:", v15);
            if ((v12 & 1) == 0)
              goto LABEL_21;
            goto LABEL_22;
          }
        }
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService EventIndicatorCharacteristic](self, "EventIndicatorCharacteristic"));
        if (v37)
        {

        }
        else
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUID"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v47));
          v40 = objc_msgSend(v38, "isEqual:", v39);

          if (v40)
          {
            -[DoAPClientService setEventIndicatorCharacteristic:](self, "setEventIndicatorCharacteristic:", v15);
            if ((v12 & 1) != 0)
              goto LABEL_22;
LABEL_21:
            objc_msgSend(v51, "discoverDescriptorsForCharacteristic:", v15);
LABEL_22:
            v12 = 1;
          }
        }
LABEL_38:
        v14 = (char *)v14 + 1;
      }
      while (v11 != v14);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    }
    while (v11);
  }

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService SupportedCodecsCharacteristic](self, "SupportedCodecsCharacteristic"));
  if (v41)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService SelectedCodecCharacteristic](self, "SelectedCodecCharacteristic"));

    v9 = v51;
    if (v42)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService StartStreamingCharacteristic](self, "StartStreamingCharacteristic"));

      if (v43)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService StopStreamingCharacteristic](self, "StopStreamingCharacteristic"));

        if (v44)
        {
          v45 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService SendDataCharacteristic](self, "SendDataCharacteristic"));

          if (v45)
          {
            v46 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService EventIndicatorCharacteristic](self, "EventIndicatorCharacteristic"));

            if (!v46 && os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
              sub_10006EDE0();
          }
          else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          {
            sub_10006EDB4();
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        {
          sub_10006ED88();
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        sub_10006ED5C();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    {
      sub_10006ED30();
    }
  }
  else
  {
    v9 = v51;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006ED04();
  }
LABEL_2:

}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v7;
  int v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  void *v34;
  unsigned int v35;
  int v36;
  id v37;
  id v38;
  DoAPClientService *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  unsigned __int8 *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *j;
  void *v53;
  unsigned int v54;
  void *v55;
  id obj;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  unsigned __int16 v65;
  _BYTE v66[128];
  _BYTE v67[128];

  v7 = a4;
  if (!a5)
  {
    v8 = _os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP");
    v9 = (id)objc_claimAutoreleasedReturnValue(-[DoAPClientService SupportedCodecsCharacteristic](self, "SupportedCodecsCharacteristic"));

    if (v8)
    {
      if (v9 != v7)
      {
        v10 = objc_claimAutoreleasedReturnValue(-[DoAPClientService StartStreamingCharacteristic](self, "StartStreamingCharacteristic"));
        v11 = v7;
        if ((id)v10 != v7)
        {
          v12 = (void *)v10;
          v13 = objc_claimAutoreleasedReturnValue(-[DoAPClientService StopStreamingCharacteristic](self, "StopStreamingCharacteristic"));
          v14 = v7;
          if ((id)v13 != v7)
          {
            v15 = (void *)v13;
            v16 = objc_claimAutoreleasedReturnValue(-[DoAPClientService SendDataCharacteristic](self, "SendDataCharacteristic"));
            if ((id)v16 != v7)
            {
              v17 = (void *)v16;
              v18 = (id)objc_claimAutoreleasedReturnValue(-[DoAPClientService EventIndicatorCharacteristic](self, "EventIndicatorCharacteristic"));

              if (v18 != v7)
                goto LABEL_2;
              goto LABEL_20;
            }

            v14 = v15;
          }

          v11 = v12;
        }

LABEL_20:
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:byteOrder:](DataInputStream, "inputStreamWithData:byteOrder:", v28, 1));

        v65 = 0;
        v55 = v29;
        objc_msgSend(v29, "readUint16:", &v65);
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue(-[DoAPClientService doapDevices](self, "doapDevices"));
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
        if (!v30)
          goto LABEL_37;
        v31 = v30;
        v32 = *(_QWORD *)v62;
        while (1)
        {
          for (i = 0; i != v31; i = (char *)i + 1)
          {
            if (*(_QWORD *)v62 != v32)
              objc_enumerationMutation(obj);
            v34 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
            v35 = objc_msgSend(v34, "streamID");
            v36 = v65;
            v37 = (id)objc_claimAutoreleasedReturnValue(-[DoAPClientService StopStreamingCharacteristic](self, "StopStreamingCharacteristic"));

            if (v37 != v7)
            {
              v38 = (id)objc_claimAutoreleasedReturnValue(-[DoAPClientService SendDataCharacteristic](self, "SendDataCharacteristic"));

              if (v38 != v7)
              {
                v39 = self;
                v40 = (id)objc_claimAutoreleasedReturnValue(-[DoAPClientService EventIndicatorCharacteristic](self, "EventIndicatorCharacteristic"));

                if (v40 == v7
                  && (v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value")),
                      v42 = objc_msgSend(v41, "length"),
                      v41,
                      (unint64_t)v42 >= 3))
                {
                  v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value")));
                  v44 = (unsigned __int8 *)objc_msgSend(v43, "bytes");

                  v45 = v44[2];
                  self = v39;
                  if (v45 != 3 && v35 != v36)
                    continue;
                }
                else
                {
                  self = v39;
                  if (v35 != v36)
                    continue;
                }
              }
            }
            if (objc_msgSend(v34, "state") >= 2)
              -[DoAPClientService handleInputData:targetDevice:](self, "handleInputData:targetDevice:", v7, v34);
          }
          v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
          if (!v31)
          {
LABEL_37:

            goto LABEL_2;
          }
        }
      }
LABEL_16:
      -[DoAPClientService createDoAPDevice](self, "createDoAPDevice");
      goto LABEL_2;
    }
    if (v9 == v7)
      goto LABEL_16;
    v19 = objc_claimAutoreleasedReturnValue(-[DoAPClientService StartStreamingCharacteristic](self, "StartStreamingCharacteristic"));
    v20 = v7;
    if ((id)v19 != v7)
    {
      v21 = (void *)v19;
      v22 = objc_claimAutoreleasedReturnValue(-[DoAPClientService StopStreamingCharacteristic](self, "StopStreamingCharacteristic"));
      v23 = v7;
      if ((id)v22 != v7)
      {
        v24 = (void *)v22;
        v25 = objc_claimAutoreleasedReturnValue(-[DoAPClientService SendDataCharacteristic](self, "SendDataCharacteristic"));
        if ((id)v25 != v7)
        {
          v26 = (void *)v25;
          v27 = (id)objc_claimAutoreleasedReturnValue(-[DoAPClientService EventIndicatorCharacteristic](self, "EventIndicatorCharacteristic"));

          if (v27 != v7)
            goto LABEL_2;
LABEL_41:
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:byteOrder:](DataInputStream, "inputStreamWithData:byteOrder:", v46, 1));

          v65 = 0;
          objc_msgSend(v47, "readUint16:", &v65);
          v57 = 0u;
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService doapDevices](self, "doapDevices"));
          v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
          if (v49)
          {
            v50 = v49;
            v51 = *(_QWORD *)v58;
            do
            {
              for (j = 0; j != v50; j = (char *)j + 1)
              {
                if (*(_QWORD *)v58 != v51)
                  objc_enumerationMutation(v48);
                v53 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)j);
                v54 = objc_msgSend(v53, "streamID");
                if (v54 == v65)
                {
                  if (objc_msgSend(v53, "state") >= 2)
                    -[DoAPClientService handleInputData:targetDevice:](self, "handleInputData:targetDevice:", v7, v53);
                  goto LABEL_52;
                }
              }
              v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
            }
            while (v50);
          }
LABEL_52:

          goto LABEL_2;
        }

        v23 = v24;
      }

      v20 = v21;
    }

    goto LABEL_41;
  }
LABEL_2:

}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)qword_1000C9178;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService uuidToString:](self, "uuidToString:", v13));
      v16 = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "DoAP Error starting notifications on %@ characteristic: %@", (uint8_t *)&v16, 0x16u);

    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
      sub_10006EE0C(v11, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
    -[DoAPClientService setNotificationEnabled:](self, "setNotificationEnabled:", v15);

    -[DoAPClientService createDoAPDevice](self, "createDoAPDevice");
  }

}

- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];

  v8 = a3;
  v9 = a4;
  if (a5)
    goto LABEL_2;
  v10 = objc_claimAutoreleasedReturnValue(-[DoAPClientService StartStreamingCharacteristic](self, "StartStreamingCharacteristic"));
  v11 = v9;
  if ((id)v10 != v9)
  {
    v12 = (void *)v10;
    v13 = objc_claimAutoreleasedReturnValue(-[DoAPClientService StopStreamingCharacteristic](self, "StopStreamingCharacteristic"));
    v14 = v9;
    if ((id)v13 != v9)
    {
      v15 = (void *)v13;
      v16 = objc_claimAutoreleasedReturnValue(-[DoAPClientService SendDataCharacteristic](self, "SendDataCharacteristic"));
      if ((id)v16 != v9)
      {
        v17 = (void *)v16;
        v18 = (id)objc_claimAutoreleasedReturnValue(-[DoAPClientService EventIndicatorCharacteristic](self, "EventIndicatorCharacteristic"));

        if (v18 != v9)
          goto LABEL_2;
        goto LABEL_11;
      }

      v14 = v15;
    }

    v11 = v12;
  }

LABEL_11:
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "descriptors", self));
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v22)
          objc_enumerationMutation(v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i), "UUID"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDClientCharacteristicConfigurationString));
        v26 = objc_msgSend(v24, "isEqual:", v25);

        if ((v26 & 1) != 0)
        {

          v28 = (void *)qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
            sub_10006EF5C(v28, v9);
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "StartStreamingCharacteristic"));

          if (v29)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "StartStreamingCharacteristic"));
            objc_msgSend(v8, "setNotifyValue:forCharacteristic:", 1, v30);

          }
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "StopStreamingCharacteristic"));

          if (v31)
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "StopStreamingCharacteristic"));
            objc_msgSend(v8, "setNotifyValue:forCharacteristic:", 1, v32);

          }
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "SendDataCharacteristic"));

          if (v33)
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "SendDataCharacteristic"));
            objc_msgSend(v8, "setNotifyValue:forCharacteristic:", 1, v34);

          }
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "EventIndicatorCharacteristic"));

          if (v35)
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "EventIndicatorCharacteristic"));
            objc_msgSend(v8, "setNotifyValue:forCharacteristic:", 1, v36);

          }
          goto LABEL_2;
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v21)
        continue;
      break;
    }
  }

  v27 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_10006EEAC(v27, v9);
LABEL_2:

}

- (void)doapDeviceDidStop
{
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[8];
  _BYTE v16[128];

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DoAPService didStop", buf, 2u);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService doapDevices](self, "doapDevices", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
LABEL_5:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v4);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "state") != 8)
        break;
      if (v6 == (id)++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
        if (v6)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:

    v9 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Remove all DoAP devices", buf, 2u);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService codecList](self, "codecList"));
    objc_msgSend(v10, "removeAllObjects");

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPClientService doapDevices](self, "doapDevices"));
    objc_msgSend(v4, "removeAllObjects");
  }

}

- (void)selectCodec:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DoAPClientService SelectedCodecCharacteristic](self, "SelectedCodecCharacteristic"));
  -[DoAPClientService writeData:forCharacteristic:withResponse:](self, "writeData:forCharacteristic:withResponse:", v4, v5, 0);

}

- (void)startStreaming:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DoAPClientService StartStreamingCharacteristic](self, "StartStreamingCharacteristic"));
  -[DoAPClientService writeData:forCharacteristic:withResponse:](self, "writeData:forCharacteristic:withResponse:", v4, v5, 0);

}

- (void)stopStreaming:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DoAPClientService StopStreamingCharacteristic](self, "StopStreamingCharacteristic"));
  -[DoAPClientService writeData:forCharacteristic:withResponse:](self, "writeData:forCharacteristic:withResponse:", v4, v5, 0);

}

- (void)eventIndicator:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DoAPClientService EventIndicatorCharacteristic](self, "EventIndicatorCharacteristic"));
  -[DoAPClientService writeData:forCharacteristic:withResponse:](self, "writeData:forCharacteristic:withResponse:", v4, v5, 0);

}

- (void)writeData:(id)a3 forCharacteristic:(id)a4 withResponse:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
  {
    sub_10006EFFC();
    if (a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (!a5)
  {
LABEL_3:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    objc_msgSend(v10, "writeValue:forCharacteristic:type:", v8, v9, 1);

  }
LABEL_4:

}

- (void)setHighPriorityLink:(BOOL)a3 burstTime:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];

  v4 = a3;
  v6 = a4;
  v7 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DoAPService setHighPriorityLink %d", (uint8_t *)v9, 8u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  objc_msgSend(v8, "setHighPriorityStream:duration:", v4, v6);

}

- (void)handleInputData:(id)a3 targetDevice:(id)a4
{
  id v5;
  id v6;
  id v7;
  unsigned __int8 *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  unsigned int v22;
  char *v23;
  uint64_t v24;
  unsigned int v25;
  NSObject *v26;

  v5 = a3;
  v6 = a4;
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value")));
  v8 = (unsigned __int8 *)objc_msgSend(v7, "bytes");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
  v10 = objc_msgSend(v9, "length");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDStartStreamingCharacteristicString));
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if (v13)
  {
    objc_msgSend(v6, "handleStartStreaming");
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDStopStreamingCharacteristicString));
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (v16)
    {
      if (v10 < 3)
      {
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          sub_10006F034();
      }
      else
      {
        objc_msgSend(v6, "handleStopStreaming:", v8[2]);
      }
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDSendDataCharacteristicString));
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (v19)
      {
        if (v10 > 4)
        {
          v24 = *(unsigned __int16 *)(v8 + 3);
          v25 = v10 - 5;
          v26 = qword_1000C9178;
          if (v25 == (_DWORD)v24)
          {
            if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
              sub_10006F0F4((uint64_t)v8, v24, v26);
            objc_msgSend(v6, "handleAudioData:dataLength:", v8 + 5, v24);
          }
          else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          {
            sub_10006F178();
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        {
          sub_10006F094();
        }
      }
      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUID"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDEventIndicatorCharacteristicString));
        v22 = objc_msgSend(v20, "isEqual:", v21);

        if (v22)
        {
          if (v10 < 3)
          {
            if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
              sub_10006F1E4();
          }
          else
          {
            if (v10 <= 4)
              v23 = 0;
            else
              v23 = (char *)(v8 + 4);
            objc_msgSend(v6, "handleEventIndicator:eventValue:", v8[2], v23);
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        {
          sub_10006F244();
        }
      }
    }
  }

}

- (id)uuidToString:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  const __CFString *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  unsigned int v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDSupportedCodecsCharacteristicString));
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = CFSTR("SupportedCodecs");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDSelectedCodecCharacteristicString));
    v8 = objc_msgSend(v3, "isEqual:", v7);

    if ((v8 & 1) != 0)
    {
      v6 = CFSTR("SelectedCodec");
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDStartStreamingCharacteristicString));
      v10 = objc_msgSend(v3, "isEqual:", v9);

      if ((v10 & 1) != 0)
      {
        v6 = CFSTR("StartStreaming");
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDStopStreamingCharacteristicString));
        v12 = objc_msgSend(v3, "isEqual:", v11);

        if ((v12 & 1) != 0)
        {
          v6 = CFSTR("StopStreaming");
        }
        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDSendDataCharacteristicString));
          v14 = objc_msgSend(v3, "isEqual:", v13);

          if ((v14 & 1) != 0)
          {
            v6 = CFSTR("SendData");
          }
          else
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDEventIndicatorCharacteristicString));
            v16 = objc_msgSend(v3, "isEqual:", v15);

            if (v16)
              v6 = CFSTR("EventIndicator");
            else
              v6 = CFSTR("Invalid UUID");
          }
        }
      }
    }
  }

  return (id)v6;
}

- (CBCharacteristic)SupportedCodecsCharacteristic
{
  return self->_SupportedCodecsCharacteristic;
}

- (void)setSupportedCodecsCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_SupportedCodecsCharacteristic, a3);
}

- (CBCharacteristic)SelectedCodecCharacteristic
{
  return self->_SelectedCodecCharacteristic;
}

- (void)setSelectedCodecCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_SelectedCodecCharacteristic, a3);
}

- (CBCharacteristic)StartStreamingCharacteristic
{
  return self->_StartStreamingCharacteristic;
}

- (void)setStartStreamingCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_StartStreamingCharacteristic, a3);
}

- (CBCharacteristic)StopStreamingCharacteristic
{
  return self->_StopStreamingCharacteristic;
}

- (void)setStopStreamingCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_StopStreamingCharacteristic, a3);
}

- (CBCharacteristic)SendDataCharacteristic
{
  return self->_SendDataCharacteristic;
}

- (void)setSendDataCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_SendDataCharacteristic, a3);
}

- (CBCharacteristic)EventIndicatorCharacteristic
{
  return self->_EventIndicatorCharacteristic;
}

- (void)setEventIndicatorCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_EventIndicatorCharacteristic, a3);
}

- (NSMutableArray)codecList
{
  return self->_codecList;
}

- (void)setCodecList:(id)a3
{
  objc_storeStrong((id *)&self->_codecList, a3);
}

- (NSMutableArray)doapDevices
{
  return self->_doapDevices;
}

- (void)setDoapDevices:(id)a3
{
  objc_storeStrong((id *)&self->_doapDevices, a3);
}

- (BOOL)isStartStreamingNotificationEnabled
{
  return self->_isStartStreamingNotificationEnabled;
}

- (void)setIsStartStreamingNotificationEnabled:(BOOL)a3
{
  self->_isStartStreamingNotificationEnabled = a3;
}

- (BOOL)isStopStreamingNotificationEnabled
{
  return self->_isStopStreamingNotificationEnabled;
}

- (void)setIsStopStreamingNotificationEnabled:(BOOL)a3
{
  self->_isStopStreamingNotificationEnabled = a3;
}

- (BOOL)isSendDataNotificationEnabled
{
  return self->_isSendDataNotificationEnabled;
}

- (void)setIsSendDataNotificationEnabled:(BOOL)a3
{
  self->_isSendDataNotificationEnabled = a3;
}

- (BOOL)isEventIndicatorNotificationEnabled
{
  return self->_isEventIndicatorNotificationEnabled;
}

- (void)setIsEventIndicatorNotificationEnabled:(BOOL)a3
{
  self->_isEventIndicatorNotificationEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doapDevices, 0);
  objc_storeStrong((id *)&self->_codecList, 0);
  objc_storeStrong((id *)&self->_EventIndicatorCharacteristic, 0);
  objc_storeStrong((id *)&self->_SendDataCharacteristic, 0);
  objc_storeStrong((id *)&self->_StopStreamingCharacteristic, 0);
  objc_storeStrong((id *)&self->_StartStreamingCharacteristic, 0);
  objc_storeStrong((id *)&self->_SelectedCodecCharacteristic, 0);
  objc_storeStrong((id *)&self->_SupportedCodecsCharacteristic, 0);
}

@end
