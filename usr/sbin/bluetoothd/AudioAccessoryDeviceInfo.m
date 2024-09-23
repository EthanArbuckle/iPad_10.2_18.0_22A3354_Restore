@implementation AudioAccessoryDeviceInfo

- (id)xpcObjectRepresentation
{
  xpc_object_t v3;
  uint64_t autoANCCapability;
  id v5;
  void *v6;
  uint64_t autoANCStrength;
  id v8;
  void *v9;
  uint64_t bobbleCapability;
  id v11;
  void *v12;
  uint64_t caseSoundCapability;
  id v14;
  void *v15;
  uint64_t earTipFitTestCapability;
  id v17;
  void *v18;
  uint64_t frequencyBand;
  id v20;
  void *v21;
  int64_t heartRateMonitorEnabled;
  id v23;
  void *v24;
  uint64_t hideEarDetectionCapability;
  id v26;
  void *v27;
  NSString *identifier;
  id v29;
  NSString *v30;
  const char *v31;
  uint64_t siriMultitoneCapability;
  id v33;
  void *v34;
  uint64_t streamStateAoS;
  id v36;
  void *v37;

  v3 = xpc_dictionary_create(0, 0, 0);
  autoANCCapability = self->_autoANCCapability;
  v5 = v3;
  v6 = v5;
  if ((_DWORD)autoANCCapability)
    xpc_dictionary_set_uint64(v5, "aaCp", autoANCCapability);

  autoANCStrength = self->_autoANCStrength;
  v8 = v6;
  v9 = v8;
  if ((_DWORD)autoANCStrength)
    xpc_dictionary_set_uint64(v8, "aaSt", autoANCStrength);

  bobbleCapability = self->_bobbleCapability;
  v11 = v9;
  v12 = v11;
  if (bobbleCapability)
    xpc_dictionary_set_uint64(v11, "bbCp", bobbleCapability);

  caseSoundCapability = self->_caseSoundCapability;
  v14 = v12;
  v15 = v14;
  if (caseSoundCapability)
    xpc_dictionary_set_uint64(v14, "caCp", caseSoundCapability);

  earTipFitTestCapability = self->_earTipFitTestCapability;
  v17 = v15;
  v18 = v17;
  if (earTipFitTestCapability)
    xpc_dictionary_set_uint64(v17, "erFt", earTipFitTestCapability);

  frequencyBand = self->_frequencyBand;
  v20 = v18;
  v21 = v20;
  if (frequencyBand)
    xpc_dictionary_set_uint64(v20, "fqBd", frequencyBand);

  heartRateMonitorEnabled = self->_heartRateMonitorEnabled;
  v23 = v21;
  v24 = v23;
  if (heartRateMonitorEnabled)
    xpc_dictionary_set_int64(v23, "hrmt", heartRateMonitorEnabled);

  hideEarDetectionCapability = self->_hideEarDetectionCapability;
  v26 = v24;
  v27 = v26;
  if (hideEarDetectionCapability)
    xpc_dictionary_set_uint64(v26, "hiED", hideEarDetectionCapability);

  identifier = self->_identifier;
  v29 = v27;
  v30 = objc_retainAutorelease(identifier);
  v31 = -[NSString UTF8String](v30, "UTF8String");
  if (v31)
    xpc_dictionary_set_string(v29, "aaID", v31);

  siriMultitoneCapability = self->_siriMultitoneCapability;
  v33 = v29;
  v34 = v33;
  if (siriMultitoneCapability)
    xpc_dictionary_set_uint64(v33, "smcp", siriMultitoneCapability);

  streamStateAoS = self->_streamStateAoS;
  v36 = v34;
  v37 = v36;
  if (streamStateAoS)
    xpc_dictionary_set_uint64(v36, "aoST", streamStateAoS);

  return v37;
}

- (unint64_t)updateWithClassicDevice:(void *)a3
{
  uint64_t v5;
  unint64_t v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;

  v5 = *((unsigned __int8 *)a3 + 1363);
  if ((_DWORD)v5 == -[AudioAccessoryDeviceInfo streamStateAoS](self, "streamStateAoS"))
  {
    v6 = 0;
  }
  else
  {
    -[AudioAccessoryDeviceInfo setStreamStateAoS:](self, "setStreamStateAoS:", v5);
    v6 = 0x80000000000;
  }
  v7 = sub_10044FF54((uint64_t)a3, 0xB0u);
  if (v7 < 3)
  {
    LODWORD(v8) = v7 + 1;
  }
  else
  {
    if (dword_100978198 <= 90
      && (dword_100978198 != -1 || _LogCategory_Initialize(&dword_100978198, 90)))
    {
      LogPrintF_safe(&dword_100978198, "-[AudioAccessoryDeviceInfo updateWithClassicDevice:]", 90, "Invalid value received. Setting autoANCCapability to Unknown");
    }
    LODWORD(v8) = 0;
  }
  v9 = sub_10044FF54((uint64_t)a3, 0x18u);
  if (v9)
    v8 = (v9 + 1);
  else
    v8 = v8;
  if ((_DWORD)v8 != -[AudioAccessoryDeviceInfo autoANCCapability](self, "autoANCCapability"))
  {
    -[AudioAccessoryDeviceInfo setAutoANCCapability:](self, "setAutoANCCapability:", v8);
    v6 = 0x80000000000;
  }
  v10 = sub_10044FC58((uint64_t)a3);
  if (v10)
  {
    if (v10 == 50 || v10 == 100)
    {
      v11 = (v10 + 1000);
    }
    else
    {
      if (dword_100978198 <= 90
        && (dword_100978198 != -1 || _LogCategory_Initialize(&dword_100978198, 90)))
      {
        LogPrintF_safe(&dword_100978198, "-[AudioAccessoryDeviceInfo updateWithClassicDevice:]", 90, "Invalid value received. Setting autoANCStrength to Unknown");
      }
      v11 = 0;
    }
  }
  else
  {
    v11 = 1000;
  }
  if ((_DWORD)v11 != -[AudioAccessoryDeviceInfo autoANCStrength](self, "autoANCStrength"))
  {
    -[AudioAccessoryDeviceInfo setAutoANCStrength:](self, "setAutoANCStrength:", v11);
    v6 = 0x80000000000;
  }
  if (sub_10044FF54((uint64_t)a3, 0xF0u) == 1)
    v12 = 2;
  else
    v12 = 1;
  if (v12 != -[AudioAccessoryDeviceInfo bobbleCapability](self, "bobbleCapability"))
  {
    -[AudioAccessoryDeviceInfo setBobbleCapability:](self, "setBobbleCapability:", v12);
    v6 = 0x80000000000;
  }
  if (sub_10044FE34((uint64_t)a3, 18))
    v13 = 2;
  else
    v13 = 1;
  if (v13 != -[AudioAccessoryDeviceInfo caseSoundCapability](self, "caseSoundCapability"))
  {
    -[AudioAccessoryDeviceInfo setCaseSoundCapability:](self, "setCaseSoundCapability:", v13);
    v6 |= 0x80000000000uLL;
  }
  if (sub_10044FF54((uint64_t)a3, 0x17u))
    v14 = 2;
  else
    v14 = 1;
  if (v14 != -[AudioAccessoryDeviceInfo earTipFitTestCapability](self, "earTipFitTestCapability"))
  {
    -[AudioAccessoryDeviceInfo setEarTipFitTestCapability:](self, "setEarTipFitTestCapability:", v14);
    v6 |= 0x80000000000uLL;
  }
  if (*((_BYTE *)a3 + 1365))
    v15 = 2;
  else
    v15 = 1;
  if (v15 != -[AudioAccessoryDeviceInfo frequencyBand](self, "frequencyBand"))
  {
    -[AudioAccessoryDeviceInfo setFrequencyBand:](self, "setFrequencyBand:", v15);
    v6 |= 0x80000000000uLL;
  }
  v16 = sub_10044FC9C((uint64_t)a3);
  if (v16 == 1)
    v17 = 1;
  else
    v17 = 2 * (v16 == 2);
  if ((_DWORD)v17 != -[AudioAccessoryDeviceInfo heartRateMonitorEnabled](self, "heartRateMonitorEnabled"))
  {
    -[AudioAccessoryDeviceInfo setHeartRateMonitorEnabled:](self, "setHeartRateMonitorEnabled:", v17);
    v6 |= 0x80000000000uLL;
  }
  if (sub_10044FF54((uint64_t)a3, 0x16u))
    v18 = 2;
  else
    v18 = 1;
  if (v18 != -[AudioAccessoryDeviceInfo hideEarDetectionCapability](self, "hideEarDetectionCapability"))
  {
    -[AudioAccessoryDeviceInfo setHideEarDetectionCapability:](self, "setHideEarDetectionCapability:", v18);
    v6 |= 0x80000000000uLL;
  }
  if (sub_10044FF54((uint64_t)a3, 0x15u) == 1)
    v19 = 2;
  else
    v19 = 1;
  if (v19 != -[AudioAccessoryDeviceInfo siriMultitoneCapability](self, "siriMultitoneCapability"))
  {
    -[AudioAccessoryDeviceInfo setSiriMultitoneCapability:](self, "setSiriMultitoneCapability:", v19);
    v6 |= 0x80000000000uLL;
  }
  return v6;
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

- (char)heartRateMonitorEnabled
{
  return self->_heartRateMonitorEnabled;
}

- (void)setHeartRateMonitorEnabled:(char)a3
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

- (unint64_t)changeFlags
{
  return self->_changeFlags;
}

- (void)setChangeFlags:(unint64_t)a3
{
  self->_changeFlags = a3;
}

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  self->_discoveryFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
