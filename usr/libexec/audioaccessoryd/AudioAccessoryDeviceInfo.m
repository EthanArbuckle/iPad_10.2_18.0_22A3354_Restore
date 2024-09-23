@implementation AudioAccessoryDeviceInfo

- (AudioAccessoryDeviceInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  AudioAccessoryDeviceInfo *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  AudioAccessoryDeviceInfo *v18;
  NSErrorDomain v20;
  const char *v21;
  uint64_t v22;
  objc_super v23;
  uint64_t v24;

  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)AudioAccessoryDeviceInfo;
  v7 = -[AudioAccessoryDeviceInfo init](&v23, "init");
  if (!v7)
  {
    if (!a4)
      goto LABEL_41;
    v20 = NSOSStatusErrorDomain;
    v21 = "AADeviceInfo super init failed";
LABEL_40:
    v22 = NSErrorF(v20, 4294960540, v21);
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v22);
    goto LABEL_35;
  }
  if (xpc_get_type(v6) != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (!a4)
      goto LABEL_41;
    v20 = NSOSStatusErrorDomain;
    v21 = "XPC non-dict";
    goto LABEL_40;
  }
  v24 = 0;
  v8 = CUXPCDecodeUInt64RangedEx(v6, "aaCp", 0, 0xFFFFFFFFLL, &v24, a4);
  if (v8 == 6)
  {
    v7->_autoANCCapability = v24;
  }
  else if (v8 == 5)
  {
    goto LABEL_41;
  }
  v24 = 0;
  v9 = CUXPCDecodeUInt64RangedEx(v6, "aaSt", 0, 0xFFFFFFFFLL, &v24, a4);
  if (v9 == 6)
  {
    v7->_autoANCStrength = v24;
  }
  else if (v9 == 5)
  {
    goto LABEL_41;
  }
  v24 = 0;
  v10 = CUXPCDecodeUInt64RangedEx(v6, "bbCp", 0, 255, &v24, a4);
  if (v10 == 6)
  {
    v7->_bobbleCapability = v24;
  }
  else if (v10 == 5)
  {
    goto LABEL_41;
  }
  v24 = 0;
  v11 = CUXPCDecodeUInt64RangedEx(v6, "caCp", 0, 255, &v24, a4);
  if (v11 == 6)
  {
    v7->_caseSoundCapability = v24;
  }
  else if (v11 == 5)
  {
    goto LABEL_41;
  }
  v24 = 0;
  v12 = CUXPCDecodeUInt64RangedEx(v6, "erFt", 0, 255, &v24, a4);
  if (v12 == 6)
  {
    v7->_earTipFitTestCapability = v24;
  }
  else if (v12 == 5)
  {
    goto LABEL_41;
  }
  v24 = 0;
  v13 = CUXPCDecodeUInt64RangedEx(v6, "fqBd", 0, 255, &v24, a4);
  if (v13 == 6)
  {
    v7->_frequencyBand = v24;
  }
  else if (v13 == 5)
  {
    goto LABEL_41;
  }
  v24 = 0;
  v14 = CUXPCDecodeUInt64RangedEx(v6, "hrmt", 0, 255, &v24, a4);
  if (v14 == 6)
  {
    v7->_heartRateMonitorEnabled = v24;
  }
  else if (v14 == 5)
  {
    goto LABEL_41;
  }
  v24 = 0;
  v15 = CUXPCDecodeUInt64RangedEx(v6, "hiED", 0, 255, &v24, a4);
  if (v15 == 6)
  {
    v7->_hideEarDetectionCapability = v24;
  }
  else if (v15 == 5)
  {
    goto LABEL_41;
  }
  if (!CUXPCDecodeNSString(v6, "aaID", &v7->_identifier, a4))
    goto LABEL_41;
  v24 = 0;
  v16 = CUXPCDecodeUInt64RangedEx(v6, "smcp", 0, 255, &v24, a4);
  if (v16 == 6)
  {
    v7->_siriMultitoneCapability = v24;
  }
  else if (v16 == 5)
  {
    goto LABEL_41;
  }
  v24 = 0;
  v17 = CUXPCDecodeUInt64RangedEx(v6, "aoST", 0, 255, &v24, a4);
  if (v17 != 6)
  {
    if (v17 != 5)
      goto LABEL_34;
LABEL_41:
    v18 = 0;
    goto LABEL_35;
  }
  v7->_streamStateAoS = v24;
LABEL_34:
  v18 = v7;
LABEL_35:

  return v18;
}

- (unsigned)autoANCCapability
{
  return self->_autoANCCapability;
}

- (void)setAutoANCCapability:(unsigned int)a3
{
  self->_autoANCCapability = a3;
}

- (unsigned)autoANCStrength
{
  return self->_autoANCStrength;
}

- (void)setAutoANCStrength:(unsigned int)a3
{
  self->_autoANCStrength = a3;
}

- (unsigned)bobbleCapability
{
  return self->_bobbleCapability;
}

- (void)setBobbleCapability:(unsigned __int8)a3
{
  self->_bobbleCapability = a3;
}

- (unsigned)caseSoundCapability
{
  return self->_caseSoundCapability;
}

- (void)setCaseSoundCapability:(unsigned __int8)a3
{
  self->_caseSoundCapability = a3;
}

- (unsigned)earTipFitTestCapability
{
  return self->_earTipFitTestCapability;
}

- (void)setEarTipFitTestCapability:(unsigned __int8)a3
{
  self->_earTipFitTestCapability = a3;
}

- (unsigned)frequencyBand
{
  return self->_frequencyBand;
}

- (void)setFrequencyBand:(unsigned __int8)a3
{
  self->_frequencyBand = a3;
}

- (unsigned)heartRateMonitorEnabled
{
  return self->_heartRateMonitorEnabled;
}

- (void)setHeartRateMonitorEnabled:(unsigned __int8)a3
{
  self->_heartRateMonitorEnabled = a3;
}

- (unsigned)hideEarDetectionCapability
{
  return self->_hideEarDetectionCapability;
}

- (void)setHideEarDetectionCapability:(unsigned __int8)a3
{
  self->_hideEarDetectionCapability = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)siriMultitoneCapability
{
  return self->_siriMultitoneCapability;
}

- (void)setSiriMultitoneCapability:(unsigned __int8)a3
{
  self->_siriMultitoneCapability = a3;
}

- (unsigned)streamStateAoS
{
  return self->_streamStateAoS;
}

- (void)setStreamStateAoS:(unsigned __int8)a3
{
  self->_streamStateAoS = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
