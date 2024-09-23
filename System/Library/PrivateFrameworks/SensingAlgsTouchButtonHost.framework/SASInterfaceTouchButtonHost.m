@implementation SASInterfaceTouchButtonHost

- (SASInterfaceTouchButtonHost)initWithStreamSize:(unint64_t)a3 platformId:(unint64_t)a4 streamCallback:(id)a5
{
  id v7;
  SASInterfaceTouchButtonHost *v8;
  uint64_t v9;
  NSMutableData *outputBuffer;
  uint64_t v11;
  NSMutableData *inputBuffer;
  uint64_t v13;
  objc_super v15;

  v7 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SASInterfaceTouchButtonHost;
  v8 = -[SASInterfaceTouchButtonHost init](&v15, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", a3);
    v9 = objc_claimAutoreleasedReturnValue();
    outputBuffer = v8->_outputBuffer;
    v8->_outputBuffer = (NSMutableData *)v9;

    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", a3);
    v11 = objc_claimAutoreleasedReturnValue();
    inputBuffer = v8->_inputBuffer;
    v8->_inputBuffer = (NSMutableData *)v11;

    *(_BYTE *)-[NSMutableData mutableBytes](v8->_outputBuffer, "mutableBytes") = 90;
    v13 = MEMORY[0x249543B94](v7);
    OUTLINED_FUNCTION_29(v13);
    OUTLINED_FUNCTION_28();
    operator new();
    NovaHost::NovaHostAlgsDevice::NovaHostAlgsDevice();
  }

  return 0;
}

- (void)initProperties
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *propertyDatabase;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[4];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[5];
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v34[0] = CFSTR("WorkNodeId");
  v34[1] = CFSTR("DataNodeId");
  v35[0] = &unk_2516DE938;
  v35[1] = &unk_2516DE950;
  v34[2] = CFSTR("Type");
  v35[2] = &unk_2516DE968;
  v36[0] = CFSTR("MaybeStageEnabled");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v25, "mutableCopy");
  v36[1] = CFSTR("AccelerationEnabled");
  v32[0] = CFSTR("WorkNodeId");
  v32[1] = CFSTR("DataNodeId");
  v33[0] = &unk_2516DE938;
  v33[1] = &unk_2516DE980;
  v32[2] = CFSTR("Type");
  v33[2] = &unk_2516DE968;
  v24 = (void *)v37;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v23, "mutableCopy");
  v36[2] = CFSTR("ActiveMode");
  v30[0] = CFSTR("WorkNodeId");
  v30[1] = CFSTR("DataNodeId");
  v31[0] = &unk_2516DE998;
  v31[1] = &unk_2516DE9B0;
  v30[2] = CFSTR("Type");
  v31[2] = &unk_2516DE968;
  v21 = (void *)v38;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v22, "mutableCopy");
  v39 = v20;
  v36[3] = CFSTR("HalfPressThresholdModifier");
  v28[0] = CFSTR("WorkNodeId");
  v28[1] = CFSTR("DataNodeId");
  v29[0] = &unk_2516DE9C8;
  v29[1] = &unk_2516DE9E0;
  v28[2] = CFSTR("Type");
  v28[3] = CFSTR("IsExternalNode");
  v3 = MEMORY[0x24BDBD1C8];
  v29[2] = &unk_2516DE9F8;
  v29[3] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v19, "mutableCopy");
  v40 = v4;
  v36[4] = CFSTR("NovaCaseAttachState");
  v26[0] = CFSTR("WorkNodeId");
  v26[1] = CFSTR("DataNodeId");
  v27[0] = &unk_2516DE9C8;
  v27[1] = &unk_2516DEA10;
  v26[2] = CFSTR("Type");
  v26[3] = CFSTR("IsExternalNode");
  v27[2] = &unk_2516DE968;
  v27[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v41 = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, v36, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (NSMutableDictionary *)objc_msgSend(v7, "mutableCopy");
  propertyDatabase = self->_propertyDatabase;
  self->_propertyDatabase = v8;

  OUTLINED_FUNCTION_18(v10, v11, v12, v13, v14, v15, v16, v17, v18, (uint64_t)v19, (uint64_t)v20, v21);
}

- (BOOL)handleInputStream:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  unsigned int v5;
  id v7;
  _BOOL8 v8;
  NSObject *v9;
  void *v10;
  id v11;
  _BYTE *v12;
  BOOL v13;
  _BYTE *v15;
  char v16;
  char *v17;
  AlgsDevice *device;
  id v19;
  BOOL v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  int v25;
  uint64_t v26;
  NSMutableDictionary *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t i;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  unsigned __int16 v37;
  void *v38;
  unint64_t v39;
  unsigned __int8 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint8_t v44[128];
  uint8_t v45[32];
  uint8_t buf[8];
  _BYTE *v47;
  unint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = -[SACaseConnectionInfoProvider caseConnected](self->_caseConnectionInfoProvider, "caseConnected");
  if (self->_caseAttached != v8)
  {
    SALoggingGeneral();
    v9 = objc_claimAutoreleasedReturnValue();
    if (OUTLINED_FUNCTION_26(v9))
    {
      __os_log_helper_16_0_1_4_0(buf, v8);
      _os_log_impl(&dword_245BE5000, v3, OS_LOG_TYPE_DEFAULT, "[SASInterfaceTouchButtonHost] updating case attach state to %d", buf, 8u);
    }

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASInterfaceTouchButtonHost injectProperty:value:](self, "injectProperty:value:", CFSTR("NovaCaseAttachState"), v10);

    self->_caseAttached = v8;
  }
  v11 = objc_retainAutorelease(v7);
  v12 = (_BYTE *)objc_msgSend(v11, "bytes");
  if (!objc_msgSend(v11, "length") || *v12 != 90)
  {
    v13 = 1;
    goto LABEL_10;
  }
  StreamingParser::StreamingParser((uint64_t)buf, (uint64_t)(v12 + 1), objc_msgSend(v11, "length") - 1, 0);
  if (v48 <= 1)
  {
    v41 = 0;
    v42 = 0;
    v43 = 0;
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_21();
  if (!v16 || v15[1] != 1 || !self->_active)
  {
    v41 = 0;
    v42 = 0;
    v43 = 0;
    goto LABEL_18;
  }
  -[SASInterfaceTouchButtonHost cleanup](self, "cleanup");
  v15 = v47;
  v41 = 0;
  v42 = 0;
  v43 = 0;
  if (v48 >= 2)
  {
LABEL_18:
    if (*v15 == 1 && v15[1] == 2)
    {
      StreamingParser::parseRun((uint64_t)buf, (uint64_t)&v41, 0, 0);
      if ((_DWORD)v41 == 0x2000)
      {
        v5 = *(_DWORD *)(v43 + 8);
        v4 = *(_QWORD *)(v43 + 16);
        self->_lastFrameId = v5;
      }
    }
  }
LABEL_22:
  v40 = 0;
  v39 = 0;
  v39 = -[NSMutableData length](self->_outputBuffer, "length") - 1;
  v17 = -[NSMutableData mutableBytes](self->_outputBuffer, "mutableBytes");
  v38 = 0;
  v37 = 0;
  v35 = 0;
  v36 = 0;
  mach_get_times();
  device = (AlgsDevice *)self->_device;
  v19 = objc_retainAutorelease(v11);
  AlgsDevice::handleInputStream(device, (const void *)(objc_msgSend(v19, "bytes") + 1), objc_msgSend(v19, "length") - 1, v17 + 1, &v39, &v40, &v37, (const void **)&v38);
  v13 = v20;
  if (v48 >= 2)
  {
    OUTLINED_FUNCTION_21();
    if (v16)
    {
      if (*(_BYTE *)(v21 + 1) == 2)
      {
        SALoggingHIDEventSignpost();
        v22 = objc_claimAutoreleasedReturnValue();
        SALoggingHIDEventSignpost();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = os_signpost_id_generate(v23);

        if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
        {
          __os_log_helper_16_0_3_8_2_8_0_4_0((uint64_t)v45, v36, v4, v5);
          _os_signpost_emit_with_name_impl(&dword_245BE5000, v22, OS_SIGNPOST_EVENT, v24, "HandleInputStream", "%{public, signpost.description:begin_time}llu timestamp:%llu frameId:%d ", v45, 0x1Cu);
        }

      }
    }
  }
  -[SASInterfaceTouchButtonHost callStreamCallback:](self, "callStreamCallback:", v39);
  -[SASInterfaceTouchButtonHost callEventCallback](self, "callEventCallback");
  v25 = v40;
  if (v40 == 1)
  {
    -[SASInterfaceTouchButtonHost callResetRequestCallback:arg_ptr:](self, "callResetRequestCallback:arg_ptr:", v37, v38);
    v25 = v40;
  }
  if (v25 == 2)
    -[SASInterfaceTouchButtonHost defaultStreamingConfiguration](self, "defaultStreamingConfiguration");
  if (v48 >= 2)
  {
    OUTLINED_FUNCTION_21();
    if (v16)
    {
      if (*(_BYTE *)(v26 + 1) == 1)
      {
        -[SASInterfaceTouchButtonHost configureCallbacks](self, "configureCallbacks");
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v27 = self->_propertyDatabase;
        v28 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
        if (v28)
        {
          v29 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i < v28; ++i)
            {
              if (*(_QWORD *)v32 != v29)
                objc_enumerationMutation(v27);
              -[SASInterfaceTouchButtonHost injectAlgsProperty:](self, "injectAlgsProperty:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i), (_QWORD)v31);
            }
            v28 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
          }
          while (v28);
        }

      }
    }
  }
LABEL_10:

  return v13;
}

- (void)defaultStreamingConfiguration
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  _BYTE v27[96];

  OUTLINED_FUNCTION_16((uint64_t)v27, 3);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_14(v3, v4, v5, v6, v7, v8, v9, v10);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_14(v11, v12, v13, v14, v15, v16, v17, v18);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_14(v19, v20, v21, 1, v22, v23, v24, v25);
  v26 = -[NSMutableData length](self->_outputBuffer, "length") - 1;
  AlgsDevice::configureStreaming((AlgsDevice::StreamingClient **)self->_device, 0, (AlgDataExtractor *)v27, -[NSMutableData mutableBytes](self->_outputBuffer, "mutableBytes") + 1, &v26);
}

- (void)callStreamCallback:(unint64_t)a3
{
  id v4;

  if (a3 && self->_streamCallback)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", -[NSMutableData mutableBytes](self->_outputBuffer, "mutableBytes"), a3 + 1, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))self->_streamCallback + 2))();

  }
  else
  {
    OUTLINED_FUNCTION_20();
  }
}

- (void)configureCallbacks
{
  uint64_t v1;
  id v2;

  v2 = OUTLINED_FUNCTION_32(a1);
  objc_msgSend(v2, "setForceStageEventsDescriptor:", *(_QWORD *)(v1 + 40));
  objc_msgSend(v2, "setForceStageEvents:", *(_QWORD *)(v1 + 56));
  OUTLINED_FUNCTION_0_1(v2);
}

- (void)callResetRequestCallback:(unsigned __int16)a3 arg_ptr:(const void *)a4
{
  void (**resetRequestCallback)(id, _QWORD);
  uint64_t v5;

  resetRequestCallback = (void (**)(id, _QWORD))self->_resetRequestCallback;
  if (resetRequestCallback)
  {
    if (a3 == 1)
      v5 = *(unsigned __int8 *)a4;
    else
      v5 = 0;
    resetRequestCallback[2](resetRequestCallback, v5);
  }
}

- (void)callEventCallback
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  void *v7;
  NSObject *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int16 v17[8];

  if (self->_eventCallback
    && self->_touchSensitiveButtonEvents
    && self->_touchSensitiveButtonEventsDescriptor
    && self->_forceStageEvents
    && self->_forceStageEventsDescriptor)
  {
    v3 = (void *)objc_opt_new();
    v4 = 0;
    v5 = 0;
    for (i = 0; i < self->_touchSensitiveButtonEventsDescriptor->var3; ++i)
    {
      -[SASInterfaceTouchButtonHost generateNovaEvent:force_stage_event:](self, "generateNovaEvent:force_stage_event:", &self->_touchSensitiveButtonEvents[v4], &self->_forceStageEvents[v5]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v3, "addObject:", v7);
      }
      else
      {
        SALoggingGeneral();
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = OUTLINED_FUNCTION_1_0(v8);
        if (v9)
        {
          OUTLINED_FUNCTION_31(v9, v10, v11, v12, v13, v14, v15, v16, v17[0]);
          _os_log_error_impl(&dword_245BE5000, v8, OS_LOG_TYPE_ERROR, "Error creating TouchSensitiveButton event!", (uint8_t *)v17, 2u);
        }

      }
      ++v5;
      ++v4;
    }
    (*((void (**)(void))self->_eventCallback + 2))();
    -[SASInterfaceTouchButtonHost cleanupExtractions](self, "cleanupExtractions");

  }
  else
  {
    -[SASInterfaceTouchButtonHost cleanupExtractions](self, "cleanupExtractions");
  }
}

- (void)callConfigurationCallback:(unint64_t)a3
{
  void *v4;
  NSObject *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int16 v15[8];

  if (a3 && self->_configurationCallback)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", -[NSMutableData mutableBytes](self->_outputBuffer, "mutableBytes"), a3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (((*((uint64_t (**)(void))self->_configurationCallback + 2))() & 1) == 0)
    {
      SALoggingGeneral();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = OUTLINED_FUNCTION_1_0(v5);
      if (v6)
      {
        OUTLINED_FUNCTION_31(v6, v7, v8, v9, v10, v11, v12, v13, v15[0]);
        OUTLINED_FUNCTION_11(&dword_245BE5000, v5, v14, "Error calling configuration callback", (uint8_t *)v15);
      }

    }
  }
  OUTLINED_FUNCTION_20();
}

- (void)cleanupExtractions
{
  *(_OWORD *)&self->_touchSensitiveButtonEvents = 0u;
  *(_OWORD *)&self->_touchSensitiveButtonEventsDescriptor = 0u;
}

- (id)generateNovaEvent:(const TouchSensitiveButtonEventPacket *)a3 force_stage_event:(const ForceStageEventPacket *)a4
{
  unint64_t v7;
  void *TouchSensitiveButtonEventWithRadius;
  void *ForceStageEvent;
  uint64_t v10;
  double var1;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  uint64_t v17;
  uint64_t v18;
  double var2;
  uint8_t buf[8];
  float64x2_t v21;
  double var4;
  double v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = -[SASInterfaceTouchButtonHost timestampUsToAbsoluteMach:](self, "timestampUsToAbsoluteMach:", a3->var0);
  if (self->_touchSensitiveButtonEventsEnabled)
  {
    TouchSensitiveButtonEventWithRadius = (void *)IOHIDEventCreateTouchSensitiveButtonEventWithRadius();
    IOHIDEventSetPhase();
    ForceStageEvent = (void *)IOHIDEventCreateForceStageEvent();
    IOHIDEventSetPhase();
    OUTLINED_FUNCTION_30();

  }
  else
  {
    v10 = *(_QWORD *)&a4->var5;
    v21 = vcvtq_f64_f32(*(float32x2_t *)&a4->var2);
    var1 = a4->var1;
    var4 = a4->var4;
    v23 = var1;
    v24 = 0x7FF8000000000000;
    var2 = a3->var2;
    *(_QWORD *)buf = v10;
    LODWORD(v17) = 0;
    objc_msgSend(MEMORY[0x24BDD8A40], "vendorDefinedEvent:usagePage:usage:version:data:length:options:", v7, self->_usagePage, self->_usage, 0, &var2, 8, v17);
    TouchSensitiveButtonEventWithRadius = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = 0;
    objc_msgSend(MEMORY[0x24BDD8A40], "vendorDefinedEvent:usagePage:usage:version:data:length:options:", v7, 65280, 17, 0, buf, 48, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    IOHIDEventSetPhase();
    IOHIDEventSetPhase();
    OUTLINED_FUNCTION_30();

  }
  SALoggingHIDEventSignpost();
  v13 = objc_claimAutoreleasedReturnValue();
  SALoggingHIDEventSignpost();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_generate(v14);

  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    __os_log_helper_16_0_7_8_2_8_0_8_0_4_0_4_0_4_0_4_0((uint64_t)buf, -[SASInterfaceTouchButtonHost timestampUsToContinuousMach:](self, "timestampUsToContinuousMach:", a3->var0), COERCE__INT64(a3->var1), COERCE__INT64(a3->var2), a4->var5, a4->var6, a4->var7, a3->var6);
    _os_signpost_emit_with_name_impl(&dword_245BE5000, v13, OS_SIGNPOST_EVENT, v15, "GenerateTouchSensitiveButtonEvent", "%{public, signpost.description:begin_time}llu position=%3f positionDelta=%3f forceStage:%d forceTransition:%d phase:0x%x touching:%d", buf, 0x38u);
  }

  return TouchSensitiveButtonEventWithRadius;
}

- (unint64_t)timestampUsToContinuousMach:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v4;

  HIDWORD(v4) = 1083129856;
  LODWORD(v3) = self->_timebase.numer;
  LODWORD(v4) = self->_timebase.denom;
  return (unint64_t)((double)a3 * 1000.0 * (double)v4 / (double)v3);
}

- (unint64_t)timestampUsToAbsoluteMach:(unint64_t)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_7();
  return v6 - v7 + objc_msgSend(v4, "timestampUsToContinuousMach:", v3);
}

- (unint64_t)timestampAbsoluteMachToUs:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_7();
  LODWORD(v5) = *(_DWORD *)(v4 + 84);
  return (unint64_t)((double)((v8 + v3 - v7) * (unint64_t)*(unsigned int *)(v4 + 80)) / (double)v5 / 1000.0);
}

- (void)cleanup
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __int16 v16[8];
  _BYTE v17[80];

  -[SASInterfaceTouchButtonHost injectProperty:value:](self, "injectProperty:value:", CFSTR("ActiveMode"), MEMORY[0x24BDBD1C0]);
  OUTLINED_FUNCTION_15((uint64_t)v17, 0);
  v3 = -[SASInterfaceTouchButtonHost runAlgs:timestamp:](self, "runAlgs:timestamp:", v17, -[SASInterfaceTouchButtonHost timestampAbsoluteMachToUs:](self, "timestampAbsoluteMachToUs:", mach_absolute_time()));
  if ((v3 & 1) == 0)
  {
    SALoggingGeneral();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = OUTLINED_FUNCTION_1_0(v5);
    if (v6)
    {
      OUTLINED_FUNCTION_31(v6, v7, v8, v9, v10, v11, v12, v13, v16[0]);
      OUTLINED_FUNCTION_11(&dword_245BE5000, v5, v15, "[SASInterfaceTouchButtonHost] Failed to run cleanup!", (uint8_t *)v16);
    }

  }
  if (self->_active)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASInterfaceTouchButtonHost injectProperty:value:](self, "injectProperty:value:", CFSTR("ActiveMode"), v14);

  }
  OUTLINED_FUNCTION_17(v3, v4);
  OUTLINED_FUNCTION_27();
}

- (BOOL)injectProperty:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  id v11;
  id v13;
  __int16 v14;
  uint64_t v15;
  NSObject *v16;
  uint8_t v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_propertyDatabase, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    if ((OUTLINED_FUNCTION_5_0() & 1) != 0 || OUTLINED_FUNCTION_5_0())
    {
      v11 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        isKindOfClass = -[SASInterfaceTouchButtonHost fullPressEngaged:timestamp:](self, "fullPressEngaged:timestamp:", OUTLINED_FUNCTION_5_0(), objc_msgSend(v11, "unsignedLongLongValue"));
      else
        isKindOfClass = 0;
LABEL_8:

      goto LABEL_9;
    }
    if (OUTLINED_FUNCTION_5_0())
    {
      v11 = v7;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
        -[SASInterfaceTouchButtonHost setActive:](self, "setActive:", objc_msgSend(v11, "BOOLValue"));
      goto LABEL_8;
    }
    if (OUTLINED_FUNCTION_5_0())
    {
      v13 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = objc_msgSend(v13, "unsignedIntValue");
        v15 = 12;
LABEL_19:
        *(_WORD *)((char *)&self->super.isa + v15) = v14;

        SALoggingGeneral();
        v16 = objc_claimAutoreleasedReturnValue();
        if (OUTLINED_FUNCTION_26(v16))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v17, (uint64_t)v6, (uint64_t)v7);
          _os_log_impl(&dword_245BE5000, &self->super, OS_LOG_TYPE_DEFAULT, "[SASInterfaceTouchButtonHost] Injected property: %@ : %@", v17, 0x16u);
        }

        goto LABEL_22;
      }
    }
    else
    {
      if (!OUTLINED_FUNCTION_5_0())
      {
LABEL_22:
        isKindOfClass = 1;
        goto LABEL_9;
      }
      v13 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = objc_msgSend(v13, "unsignedIntValue");
        v15 = 14;
        goto LABEL_19;
      }
    }

    isKindOfClass = 0;
    goto LABEL_9;
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("Value"));
  isKindOfClass = -[SASInterfaceTouchButtonHost injectAlgsProperty:](self, "injectAlgsProperty:", v6);
LABEL_9:

  return isKindOfClass & 1;
}

- (id)getProperty:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_propertyDatabase, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SASInterfaceTouchButtonHost extractAlgsState:](self, "extractAlgsState:", v4);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else if (OUTLINED_FUNCTION_5_0())
  {
    v6 = self->_forceStages;
  }
  else
  {
    if (!OUTLINED_FUNCTION_5_0())
    {
      v7 = 0;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_active);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
LABEL_8:

  return v7;
}

- (BOOL)fullPressEngaged:(BOOL)a3 timestamp:(unint64_t)a4
{
  _BOOL4 v4;
  SASInterfaceTouchButtonHost *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[80];
  _BYTE v13[84];
  _BOOL4 v14;

  v4 = a3;
  v5 = self;
  v6 = -[SASInterfaceTouchButtonHost timestampAbsoluteMachToUs:](self, "timestampAbsoluteMachToUs:", a4);
  v14 = v4;
  OUTLINED_FUNCTION_15((uint64_t)v13, 1);
  OUTLINED_FUNCTION_6_0();
  AlgDataPacket::AlgDataPacket(v7, v8, v9, 20480, 1, 1, v10, 4, 0, 0);
  AlgDataInjector::add((AlgDataInjector *)v13, (const AlgDataPacket *)v12);
  AlgDataPacket::~AlgDataPacket((AlgDataPacket *)v12);
  LOBYTE(v5) = -[SASInterfaceTouchButtonHost runAlgs:timestamp:](v5, "runAlgs:timestamp:", v13, v6);
  PacketCollection::~PacketCollection((PacketCollection *)v13);
  return (char)v5;
}

- (BOOL)runAlgs:(void *)a3 timestamp:(unint64_t)a4
{
  NSUInteger v7;
  __int128 v8;
  unint64_t *v9;
  unint64_t v10;
  unsigned int lastFrameId;
  int v12;
  unint64_t v13;

  lastFrameId = self->_lastFrameId;
  v12 = 0;
  v13 = a4;
  v8 = xmmword_245BF2850;
  LODWORD(v8) = 0x2000;
  v9 = &v10;
  v10 = a4;
  v7 = -[NSMutableData length](self->_outputBuffer, "length") - 1;
  LOBYTE(a3) = (*(uint64_t (**)(void *, __int128 *, void *, void *, NSUInteger *))(*(_QWORD *)self->_device
                                                                                           + 24))(self->_device, &v8, a3, -[NSMutableData mutableBytes](self->_outputBuffer, "mutableBytes") + 1, &v7);
  -[SASInterfaceTouchButtonHost callStreamCallback:](self, "callStreamCallback:", v7);
  -[SASInterfaceTouchButtonHost callEventCallback](self, "callEventCallback");
  return (char)a3;
}

- (BOOL)injectAlgsProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  char *v19;
  void *v20;
  int v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  objc_class *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  objc_class *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  __int16 v53;
  uint64_t v54;
  _BYTE v55[96];
  uint8_t v56[80];
  uint8_t buf[24];
  uint64_t v58;
  _QWORD v59[12];

  v59[10] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_propertyDatabase, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15((uint64_t)v56, 1);
  OUTLINED_FUNCTION_16((uint64_t)v55, 0);
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WorkNodeId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedLongLongValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DataNodeId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedLongLongValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedShortValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Value"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      switch(v11)
      {
        case 20480:
        case 20486:
          v14 = v12;
          objc_opt_class();
          if ((OUTLINED_FUNCTION_25() & 1) != 0)
          {
            LODWORD(v59[0]) = 0;
            LODWORD(v59[0]) = -[NSObject unsignedIntValue](v14, "unsignedIntValue");
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v59, 4);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = 4;
            goto LABEL_14;
          }
          SALoggingGeneral();
          v24 = objc_claimAutoreleasedReturnValue();
          if (OUTLINED_FUNCTION_1_0(v24))
          {
            v40 = (objc_class *)objc_opt_class();
            NSStringFromClass(v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            __os_log_helper_16_2_2_8_64_4_0((uint64_t)v59, (uint64_t)v41, v11);
            OUTLINED_FUNCTION_12(&dword_245BE5000, v42, v43, "[SASInterfaceTouchButtonHost] InjectProperty: unexpected id %@ for type 0x%x");

          }
          goto LABEL_22;
        case 20483:
          v14 = v12;
          objc_opt_class();
          if ((OUTLINED_FUNCTION_25() & 1) != 0)
          {
            LOBYTE(v59[0]) = 0;
            LOBYTE(v59[0]) = -[NSObject charValue](v14, "charValue");
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v59, 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = 1;
            goto LABEL_14;
          }
          SALoggingGeneral();
          v24 = objc_claimAutoreleasedReturnValue();
          if (OUTLINED_FUNCTION_1_0(v24))
          {
            v44 = (objc_class *)objc_opt_class();
            NSStringFromClass(v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            __os_log_helper_16_2_2_8_64_4_0((uint64_t)v59, (uint64_t)v45, 20483);
            OUTLINED_FUNCTION_12(&dword_245BE5000, v46, v47, "[SASInterfaceTouchButtonHost] InjectProperty: unexpected id %@ for type 0x%x");

          }
LABEL_22:

          goto LABEL_28;
        case 20488:
          v14 = v12;
          objc_opt_class();
          if ((OUTLINED_FUNCTION_25() & 1) != 0)
          {
            v59[0] = 0;
            v59[0] = -[NSObject unsignedLongLongValue](v14, "unsignedLongLongValue");
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v59, 8);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = 8;
LABEL_14:

            v52 = objc_retainAutorelease(v15);
            AlgDataPacket::AlgDataPacket((uint64_t)v59, v7, v9, v11, 1, 1, objc_msgSend(v52, "bytes"), v16, 0, 0);
            AlgDataInjector::add((AlgDataInjector *)v56, (const AlgDataPacket *)v59);
            v18 = -[NSMutableData length](self->_outputBuffer, "length") - 1;
            v54 = v18;
            v19 = -[NSMutableData mutableBytes](self->_outputBuffer, "mutableBytes");
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IsExternalNode"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "BOOLValue");

            if (v21)
            {
              StreamingWriter::StreamingWriter((StreamingWriter *)buf, v19 + 1, v18, 0);
              StreamingWriter::writeInjext((StreamingWriter *)buf, 0, (AlgDataInjector *)v56, 0, 0, 0);
              v17 = v22;
              if (v22)
              {
                -[SASInterfaceTouchButtonHost callConfigurationCallback:](self, "callConfigurationCallback:", v58 + 1);
              }
              else
              {
                SALoggingGeneral();
                v25 = objc_claimAutoreleasedReturnValue();
                if (OUTLINED_FUNCTION_1_0(v25))
                {
                  __os_log_helper_16_0_0(&v53);
                  OUTLINED_FUNCTION_11(&dword_245BE5000, v25, v48, "[SASInterfaceTouchButtonHost] failed to write injext data", (uint8_t *)&v53);
                }

              }
            }
            else
            {
              v17 = (*(uint64_t (**)(void *, uint8_t *, _BYTE *, char *, uint64_t *))(*(_QWORD *)self->_device
                                                                                             + 32))(self->_device, v56, v55, v19 + 1, &v54);
              -[SASInterfaceTouchButtonHost callStreamCallback:](self, "callStreamCallback:", v54);
            }
            SALoggingGeneral();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              if (v17)
                v27 = "OK";
              else
                v27 = "Error";
              __os_log_helper_16_2_6_8_64_4_0_8_0_8_0_8_64_8_32((uint64_t)buf, (uint64_t)v4, v21, v7, v9, (uint64_t)v13, (uint64_t)v27);
              _os_log_impl(&dword_245BE5000, v26, OS_LOG_TYPE_DEFAULT, "[SASInterfaceTouchButtonHost] InjectProperty: %@, External: %d, (%llu,%llu)=%@ result %s", buf, 0x3Au);
            }

            AlgDataPacket::~AlgDataPacket((AlgDataPacket *)v59);
            OUTLINED_FUNCTION_18(v28, v29, v30, v31, v32, v33, v34, v35, v49, v50, v51, v52);
          }
          else
          {

LABEL_28:
            LOBYTE(v17) = 0;
            v13 = v14;
          }
          break;
        default:
          SALoggingGeneral();
          v23 = objc_claimAutoreleasedReturnValue();
          if (OUTLINED_FUNCTION_1_0(v23))
          {
            __os_log_helper_16_0_1_4_0(v59, v11);
            OUTLINED_FUNCTION_22(&dword_245BE5000, v23, v39, "[SASInterfaceTouchButtonHost] InjectProperty: cannot handle type 0x%x", (uint8_t *)v59);
          }

          goto LABEL_8;
      }
    }
    else
    {
      LOBYTE(v17) = 1;
    }
  }
  else
  {
    SALoggingGeneral();
    v13 = objc_claimAutoreleasedReturnValue();
    if (OUTLINED_FUNCTION_1_0(v13))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v59, (uint64_t)v4);
      OUTLINED_FUNCTION_19(&dword_245BE5000, v37, v38, "[SASInterfaceTouchButtonHost] InjectProperty: %@ key config not found", (uint8_t *)v59);
    }
LABEL_8:
    LOBYTE(v17) = 0;
  }

  PacketCollection::~PacketCollection((PacketCollection *)v55);
  PacketCollection::~PacketCollection((PacketCollection *)v56);

  return v17;
}

- (id)extractAlgsState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  _BOOL8 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint8_t buf[48];
  uint8_t v78[88];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_propertyDatabase, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15((uint64_t)&v67, 0);
  OUTLINED_FUNCTION_16((uint64_t)&v55, 1);
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IsExternalNode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if (v7)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Value"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WorkNodeId"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "unsignedLongLongValue");

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DataNodeId"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedLongLongValue");

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Type"));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = -[NSObject unsignedShortValue](v14, "unsignedShortValue");

      AlgDataPacket::AlgDataPacket((uint64_t)v78, v11, v13, v15, 2, 2, 0, 0, 0, 0);
      AlgDataExtractor::add((AlgDataExtractor *)&v55, (const AlgDataPacket *)v78);
      v54 = 0;
      v16 = (*(uint64_t (**)(void *, uint64_t *, uint64_t *, _QWORD, uint64_t *))(*(_QWORD *)self->_device + 32))(self->_device, &v67, &v55, 0, &v54);
      if ((v16 & 1) != 0)
      {
        switch(v15)
        {
          case 20480:
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", **(unsigned __int8 **)(OUTLINED_FUNCTION_8(v16, v17, v18, v19) + 56));
            v20 = objc_claimAutoreleasedReturnValue();
            break;
          case 20483:
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithChar:", **(char **)(OUTLINED_FUNCTION_8(v16, v17, v18, v19) + 56));
            v20 = objc_claimAutoreleasedReturnValue();
            break;
          case 20486:
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", **(unsigned int **)(OUTLINED_FUNCTION_8(v16, v17, v18, v19) + 56));
            v20 = objc_claimAutoreleasedReturnValue();
            break;
          case 20488:
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", **(_QWORD **)(OUTLINED_FUNCTION_8(v16, v17, v18, v19) + 56));
            v20 = objc_claimAutoreleasedReturnValue();
            break;
          default:
            SALoggingGeneral();
            v14 = objc_claimAutoreleasedReturnValue();
            if (OUTLINED_FUNCTION_1_0(v14))
            {
              __os_log_helper_16_0_1_4_0(buf, v15);
              OUTLINED_FUNCTION_22(&dword_245BE5000, v14, v50, "[SASInterfaceTouchButtonHost] ExtractProperty: cannot handle type 0x%x", buf);
            }
            goto LABEL_16;
        }
        v8 = (void *)v20;
        SALoggingGeneral();
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = OUTLINED_FUNCTION_23(v34);
        if (v35)
        {
          v43 = OUTLINED_FUNCTION_24(v35, v36, v37, v38, v39, v40, v41, v42, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61,
                  v62,
                  v63,
                  v64,
                  v65,
                  v66,
                  v67,
                  v68,
                  v69,
                  v70,
                  v71,
                  v72,
                  v73,
                  v74,
                  v75,
                  v76,
                  buf[0]);
          __os_log_helper_16_2_4_8_64_8_0_8_0_8_64((uint64_t)v43, v44, v45, v46, (uint64_t)v8);
          _os_log_impl(&dword_245BE5000, v14, OS_LOG_TYPE_INFO, "[SASInterfaceTouchButtonHost] ExtractProperty: %@, (%llu,%llu)=%@", buf, 0x2Au);
        }
      }
      else
      {
        SALoggingGeneral();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = OUTLINED_FUNCTION_23(v21);
        if (v22)
        {
          v30 = OUTLINED_FUNCTION_24(v22, v23, v24, v25, v26, v27, v28, v29, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61,
                  v62,
                  v63,
                  v64,
                  v65,
                  v66,
                  v67,
                  v68,
                  v69,
                  v70,
                  v71,
                  v72,
                  v73,
                  v74,
                  v75,
                  v76,
                  buf[0]);
          __os_log_helper_16_2_3_8_64_8_0_8_0((uint64_t)v30, v31, v32, v33);
          _os_log_impl(&dword_245BE5000, v14, OS_LOG_TYPE_INFO, "[SASInterfaceTouchButtonHost] ExtractProperty: %@, (%llu,%llu) extraction failed", buf, 0x20u);
        }
LABEL_16:
        v8 = 0;
      }

      AlgDataPacket::~AlgDataPacket((AlgDataPacket *)v78);
    }
  }
  else
  {
    SALoggingGeneral();
    v9 = objc_claimAutoreleasedReturnValue();
    if (OUTLINED_FUNCTION_1_0(v9))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v78, (uint64_t)v4);
      OUTLINED_FUNCTION_19(&dword_245BE5000, v48, v49, "[SASInterfaceTouchButtonHost] ExtractProperty: %@ key config not found", v78);
    }

    v8 = 0;
  }
  PacketCollection::~PacketCollection((PacketCollection *)&v55);
  PacketCollection::~PacketCollection((PacketCollection *)&v67);

  return v8;
}

- (void)addVersion:(id)a3
{
  id v4;
  AlgsDevice *device;
  id v6;

  v4 = a3;
  -[NSMutableArray addObject:](self->_versions, "addObject:", v4);
  device = (AlgsDevice *)self->_device;
  v6 = objc_retainAutorelease(v4);
  AlgsDevice::addVersion(device, (const char *)objc_msgSend(v6, "UTF8String"));
  OUTLINED_FUNCTION_0_1(v6);
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  uint8_t v5[8];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (self->_active != a3)
  {
    v3 = a3;
    self->_active = a3;
    if (a3)
      -[SASInterfaceTouchButtonHost injectProperty:value:](self, "injectProperty:value:", CFSTR("ActiveMode"), MEMORY[0x24BDBD1C8]);
    else
      -[SASInterfaceTouchButtonHost cleanup](self, "cleanup");
    SALoggingGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_1_4_0(v5, v3);
      _os_log_impl(&dword_245BE5000, v4, OS_LOG_TYPE_INFO, "[SASInterfaceTouchButtonHost] active state switched to: %d", v5, 8u);
    }

  }
}

- (id)streamCallback
{
  return self->_streamCallback;
}

- (void)setStreamCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)eventCallback
{
  return self->_eventCallback;
}

- (void)setEventCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)resetRequestCallback
{
  return self->_resetRequestCallback;
}

- (void)setResetRequestCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)coreAnalyticsCallback
{
  return self->_coreAnalyticsCallback;
}

- (void)setCoreAnalyticsCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)configurationCallback
{
  return self->_configurationCallback;
}

- (void)setConfigurationCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSMutableData)outputBuffer
{
  return self->_outputBuffer;
}

- (void)setOutputBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_outputBuffer, a3);
}

- (NSMutableData)inputBuffer
{
  return self->_inputBuffer;
}

- (void)setInputBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_inputBuffer, a3);
}

- (mach_timebase_info)timebase
{
  return self->_timebase;
}

- (void)setTimebase:(mach_timebase_info)a3
{
  self->_timebase = a3;
}

- (void)device
{
  return self->_device;
}

- (void)setDevice:(void *)a3
{
  self->_device = a3;
}

- (unsigned)usagePage
{
  return self->_usagePage;
}

- (void)setUsagePage:(unsigned __int16)a3
{
  self->_usagePage = a3;
}

- (unsigned)usage
{
  return self->_usage;
}

- (void)setUsage:(unsigned __int16)a3
{
  self->_usage = a3;
}

- (unsigned)planId
{
  return self->_planId;
}

- (void)setPlanId:(unsigned __int8)a3
{
  self->_planId = a3;
}

- (NSMutableArray)versions
{
  return self->_versions;
}

- (void)setVersions:(id)a3
{
  objc_storeStrong((id *)&self->_versions, a3);
}

- (unsigned)lastFrameId
{
  return self->_lastFrameId;
}

- (void)setLastFrameId:(unsigned int)a3
{
  self->_lastFrameId = a3;
}

- (const)touchSensitiveButtonEventsDescriptor
{
  return self->_touchSensitiveButtonEventsDescriptor;
}

- (void)setTouchSensitiveButtonEventsDescriptor:(const _SADynamicArrayDescriptor *)a3
{
  self->_touchSensitiveButtonEventsDescriptor = a3;
}

- (const)forceStageEventsDescriptor
{
  return self->_forceStageEventsDescriptor;
}

- (void)setForceStageEventsDescriptor:(const _SADynamicArrayDescriptor *)a3
{
  self->_forceStageEventsDescriptor = a3;
}

- (const)touchSensitiveButtonEvents
{
  return self->_touchSensitiveButtonEvents;
}

- (void)setTouchSensitiveButtonEvents:(const TouchSensitiveButtonEventPacket *)a3
{
  self->_touchSensitiveButtonEvents = a3;
}

- (const)forceStageEvents
{
  return self->_forceStageEvents;
}

- (void)setForceStageEvents:(const ForceStageEventPacket *)a3
{
  self->_forceStageEvents = a3;
}

- (NSArray)forceStages
{
  return self->_forceStages;
}

- (NSMutableDictionary)propertyDatabase
{
  return self->_propertyDatabase;
}

- (void)setPropertyDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_propertyDatabase, a3);
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)caseAttached
{
  return self->_caseAttached;
}

- (void)setCaseAttached:(BOOL)a3
{
  self->_caseAttached = a3;
}

- (BOOL)touchSensitiveButtonEventsEnabled
{
  return self->_touchSensitiveButtonEventsEnabled;
}

- (void)setTouchSensitiveButtonEventsEnabled:(BOOL)a3
{
  self->_touchSensitiveButtonEventsEnabled = a3;
}

- (SACaseConnectionInfoProvider)caseConnectionInfoProvider
{
  return self->_caseConnectionInfoProvider;
}

- (void)setCaseConnectionInfoProvider:(id)a3
{
  objc_storeStrong((id *)&self->_caseConnectionInfoProvider, a3);
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_2_0((id *)&self->_caseConnectionInfoProvider);
  OUTLINED_FUNCTION_2_0((id *)&self->_propertyDatabase);
  OUTLINED_FUNCTION_2_0((id *)&self->_forceStages);
  OUTLINED_FUNCTION_2_0((id *)&self->_versions);
  OUTLINED_FUNCTION_2_0((id *)&self->_inputBuffer);
  OUTLINED_FUNCTION_2_0((id *)&self->_outputBuffer);
  OUTLINED_FUNCTION_2_0(&self->_configurationCallback);
  OUTLINED_FUNCTION_2_0(&self->_coreAnalyticsCallback);
  OUTLINED_FUNCTION_2_0(&self->_resetRequestCallback);
  OUTLINED_FUNCTION_2_0(&self->_eventCallback);
  objc_storeStrong(&self->_streamCallback, 0);
}

@end
