@implementation SFBLEDevice

- (void)encodeWithCoder:(id)a3
{
  NSData *advertisementData;
  NSDictionary *advertisementFields;
  NSData *bluetoothAddress;
  NSUUID *counterpartIdentifier;
  int64_t distance;
  unint64_t foundTicks;
  unint64_t proxPairingTicks;
  NSUUID *identifier;
  NSString *name;
  int64_t rssi;
  int64_t rssiCeiling;
  uint64_t rssiEstimate;
  int64_t rssiFloor;
  void *v17;
  int64_t smoothedRSSI;
  void *v19;
  id v20;

  v20 = a3;
  advertisementData = self->_advertisementData;
  if (advertisementData)
    objc_msgSend(v20, "encodeObject:forKey:", advertisementData, CFSTR("aData"));
  advertisementFields = self->_advertisementFields;
  if (advertisementFields)
    objc_msgSend(v20, "encodeObject:forKey:", advertisementFields, CFSTR("aFields"));
  bluetoothAddress = self->_bluetoothAddress;
  if (bluetoothAddress)
    objc_msgSend(v20, "encodeObject:forKey:", bluetoothAddress, CFSTR("bdAddr"));
  counterpartIdentifier = self->_counterpartIdentifier;
  if (counterpartIdentifier)
    objc_msgSend(v20, "encodeObject:forKey:", counterpartIdentifier, CFSTR("cpid"));
  if (self->_decryptedActivityLevel)
    objc_msgSend(v20, "encodeInteger:forKey:");
  distance = self->_distance;
  if (distance)
    objc_msgSend(v20, "encodeInteger:forKey:", distance, CFSTR("dist"));
  foundTicks = self->_foundTicks;
  if (foundTicks)
    objc_msgSend(v20, "encodeInt64:forKey:", foundTicks, CFSTR("fticks"));
  proxPairingTicks = self->_proxPairingTicks;
  if (proxPairingTicks)
    objc_msgSend(v20, "encodeInt64:forKey:", proxPairingTicks, CFSTR("pticks"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v20, "encodeObject:forKey:", identifier, CFSTR("ident"));
  if (self->_useBTPipe)
    objc_msgSend(v20, "encodeBool:forKey:", 1, CFSTR("btpipe"));
  if (self->_insideBubble)
    objc_msgSend(v20, "encodeBool:forKey:", 1, CFSTR("inBub"));
  if (self->_insideSmallBubble)
    objc_msgSend(v20, "encodeBool:forKey:", 1, CFSTR("inSBub"));
  if (self->_insideMediumBubble)
    objc_msgSend(v20, "encodeBool:forKey:", 1, CFSTR("inMBub"));
  if (self->_lastSeen != 0.0)
    objc_msgSend(v20, "encodeDouble:forKey:", CFSTR("last"));
  name = self->_name;
  if (name)
    objc_msgSend(v20, "encodeObject:forKey:", name, CFSTR("name"));
  if (self->_paired)
    objc_msgSend(v20, "encodeBool:forKey:", 1, CFSTR("paired"));
  rssi = self->_rssi;
  if (rssi)
    objc_msgSend(v20, "encodeInteger:forKey:", rssi, CFSTR("rssi"));
  rssiCeiling = self->_rssiCeiling;
  if (rssiCeiling)
    objc_msgSend(v20, "encodeInteger:forKey:", rssiCeiling, CFSTR("cRSSI"));
  rssiEstimate = self->_rssiEstimate;
  if ((_DWORD)rssiEstimate)
    objc_msgSend(v20, "encodeInteger:forKey:", rssiEstimate, CFSTR("rssiE"));
  rssiFloor = self->_rssiFloor;
  if (rssiFloor)
    objc_msgSend(v20, "encodeInteger:forKey:", rssiFloor, CFSTR("fRSSI"));
  if (self->_rssiHistory[0])
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->_rssiHistory, 8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v17, CFSTR("hRSSI"));

  }
  smoothedRSSI = self->_smoothedRSSI;
  if (smoothedRSSI)
    objc_msgSend(v20, "encodeInteger:forKey:", smoothedRSSI, CFSTR("sRSSI"));
  v19 = v20;
  if (self->_triggered)
  {
    objc_msgSend(v20, "encodeBool:forKey:", 1, CFSTR("trig"));
    v19 = v20;
  }

}

- (int64_t)rssi
{
  return self->_rssi;
}

- (unsigned)decryptedActivityLevel
{
  return self->_decryptedActivityLevel;
}

- (int)rssiEstimate
{
  return self->_rssiEstimate;
}

- (BOOL)insideBubble
{
  return self->_insideBubble;
}

- (SFProximityEstimator)closeProximityEstimatorSmall
{
  return self->_closeProximityEstimatorSmall;
}

- (SFProximityEstimator)closeProximityEstimatorMedium
{
  return self->_closeProximityEstimatorMedium;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setDecryptedActivityLevel:(unsigned __int8)a3
{
  self->_decryptedActivityLevel = a3;
}

- (BOOL)tempPaired
{
  return self->_tempPaired;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)distance
{
  return self->_distance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rpIdentity, 0);
  objc_storeStrong((id *)&self->_setupProximityEstimator, 0);
  objc_storeStrong((id *)&self->_proxPairProximityEstimator, 0);
  objc_storeStrong((id *)&self->_infoProximityEstimator, 0);
  objc_storeStrong((id *)&self->_closeProximityEstimatorMedium, 0);
  objc_storeStrong((id *)&self->_closeProximityEstimatorSmall, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_counterpartIdentifier, 0);
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
  objc_storeStrong((id *)&self->_advertisementFields, 0);
  objc_storeStrong((id *)&self->_advertisementData, 0);
}

- (SFBLEDevice)initWithCoder:(id)a3
{
  id v4;
  SFBLEDevice *v5;
  uint64_t v6;
  NSData *advertisementData;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSDictionary *advertisementFields;
  uint64_t v21;
  NSData *bluetoothAddress;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSUUID *counterpartIdentifier;
  id v28;
  id v29;
  uint64_t v30;
  NSUUID *identifier;
  id v32;
  id v33;
  id v34;
  id v35;
  double v36;
  uint64_t v37;
  NSString *name;
  id v39;
  char *v40;
  unint64_t v41;
  uint64_t v42;
  char *rssiHistory;
  char v44;
  id v45;
  SFBLEDevice *v46;
  objc_super v48;
  uint64_t v49;

  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)SFBLEDevice;
  v5 = -[SFBLEDevice init](&v48, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("aData")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("aData"));
      v6 = objc_claimAutoreleasedReturnValue();
      advertisementData = v5->_advertisementData;
      v5->_advertisementData = (NSData *)v6;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("aFields")))
    {
      v8 = (void *)MEMORY[0x1E0C99E60];
      v9 = objc_opt_class();
      v10 = objc_opt_class();
      v11 = objc_opt_class();
      v12 = objc_opt_class();
      v13 = objc_opt_class();
      v14 = objc_opt_class();
      objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("aFields"));
      v16 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v17 = (void *)MEMORY[0x1E0C99DA0];
        v18 = *MEMORY[0x1E0C99778];
        _NSMethodExceptionProem();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "raise:format:", v18, CFSTR("%@: bad type for key %@ : %@"), v19, CFSTR("aFields"), v16);

      }
      advertisementFields = v5->_advertisementFields;
      v5->_advertisementFields = (NSDictionary *)v16;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("bdAddr")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bdAddr"));
      v21 = objc_claimAutoreleasedReturnValue();
      bluetoothAddress = v5->_bluetoothAddress;
      v5->_bluetoothAddress = (NSData *)v21;

      if (-[NSData length](v5->_bluetoothAddress, "length") != 6)
      {
        v23 = (void *)MEMORY[0x1E0C99DA0];
        v24 = *MEMORY[0x1E0C99778];
        _NSMethodExceptionProem();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "raise:format:", v24, CFSTR("%@: Bad BluetoothAddress length: %ld (not 6)"), v25, -[NSData length](v5->_bluetoothAddress, "length"));

      }
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("cpid")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cpid"));
      v26 = objc_claimAutoreleasedReturnValue();
      counterpartIdentifier = v5->_counterpartIdentifier;
      v5->_counterpartIdentifier = (NSUUID *)v26;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("decAL")))
      v5->_decryptedActivityLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("decAL"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("dist")))
      v5->_distance = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dist"));
    v28 = v4;
    if (objc_msgSend(v28, "containsValueForKey:", CFSTR("fticks")))
      v5->_foundTicks = objc_msgSend(v28, "decodeInt64ForKey:", CFSTR("fticks"));

    v29 = v28;
    if (objc_msgSend(v29, "containsValueForKey:", CFSTR("pticks")))
      v5->_proxPairingTicks = objc_msgSend(v29, "decodeInt64ForKey:", CFSTR("pticks"));

    if (objc_msgSend(v29, "containsValueForKey:", CFSTR("ident")))
    {
      objc_msgSend(v29, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ident"));
      v30 = objc_claimAutoreleasedReturnValue();
      identifier = v5->_identifier;
      v5->_identifier = (NSUUID *)v30;

    }
    v32 = v29;
    if (objc_msgSend(v32, "containsValueForKey:", CFSTR("btpipe")))
      v5->_useBTPipe = objc_msgSend(v32, "decodeBoolForKey:", CFSTR("btpipe"));

    v33 = v32;
    if (objc_msgSend(v33, "containsValueForKey:", CFSTR("inBub")))
      v5->_insideBubble = objc_msgSend(v33, "decodeBoolForKey:", CFSTR("inBub"));

    v34 = v33;
    if (objc_msgSend(v34, "containsValueForKey:", CFSTR("inSBub")))
      v5->_insideSmallBubble = objc_msgSend(v34, "decodeBoolForKey:", CFSTR("inSBub"));

    v35 = v34;
    if (objc_msgSend(v35, "containsValueForKey:", CFSTR("inMBub")))
      v5->_insideMediumBubble = objc_msgSend(v35, "decodeBoolForKey:", CFSTR("inMBub"));

    if (objc_msgSend(v35, "containsValueForKey:", CFSTR("last")))
    {
      objc_msgSend(v35, "decodeDoubleForKey:", CFSTR("last"));
      v5->_lastSeen = v36;
    }
    if (objc_msgSend(v35, "containsValueForKey:", CFSTR("name")))
    {
      objc_msgSend(v35, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
      v37 = objc_claimAutoreleasedReturnValue();
      name = v5->_name;
      v5->_name = (NSString *)v37;

    }
    if (objc_msgSend(v35, "containsValueForKey:", CFSTR("rssi")))
      v5->_rssi = objc_msgSend(v35, "decodeIntegerForKey:", CFSTR("rssi"));
    if (objc_msgSend(v35, "containsValueForKey:", CFSTR("cRSSI")))
      v5->_rssiCeiling = objc_msgSend(v35, "decodeIntegerForKey:", CFSTR("cRSSI"));
    v49 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_rssiEstimate = v49;
    if (objc_msgSend(v35, "containsValueForKey:", CFSTR("fRSSI")))
      v5->_rssiFloor = objc_msgSend(v35, "decodeIntegerForKey:", CFSTR("fRSSI"));
    if (objc_msgSend(v35, "containsValueForKey:", CFSTR("hRSSI")))
    {
      objc_msgSend(v35, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hRSSI"));
      v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v40 = (char *)objc_msgSend(v39, "bytes");
      v41 = objc_msgSend(v39, "length");
      v42 = 8;
      if (v41 < 8)
        v42 = v41;
      if (v42)
      {
        rssiHistory = v5->_rssiHistory;
        do
        {
          v44 = *v40++;
          *rssiHistory++ = v44;
          --v42;
        }
        while (v42);
      }

    }
    if (objc_msgSend(v35, "containsValueForKey:", CFSTR("sRSSI")))
      v5->_smoothedRSSI = objc_msgSend(v35, "decodeIntegerForKey:", CFSTR("sRSSI"));
    v45 = v35;
    if (objc_msgSend(v45, "containsValueForKey:", CFSTR("trig")))
      v5->_triggered = objc_msgSend(v45, "decodeBoolForKey:", CFSTR("trig"));

    v46 = v5;
  }

  return v5;
}

- (NSDictionary)advertisementFields
{
  return self->_advertisementFields;
}

- (SFProximityEstimator)infoProximityEstimator
{
  return self->_infoProximityEstimator;
}

- (NSData)advertisementData
{
  return self->_advertisementData;
}

- (void)setInfoProximityEstimator:(id)a3
{
  objc_storeStrong((id *)&self->_infoProximityEstimator, a3);
}

- (BOOL)updateRSSI:(int64_t)a3
{
  int64_t v4;
  unint64_t rssiIndex;
  size_t v6;
  char *rssiHistory;
  size_t rssiCount;
  BOOL result;
  size_t v10;
  char *v11;
  char v12;
  int v13;
  size_t v14;
  char *v15;
  char v16;
  int v17;
  int v18;
  size_t v19;
  int v20;
  uint64_t v21;
  char *v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  signed int v29;
  int v30;
  int v31;
  signed int v32;
  signed int v33;
  char *v34;
  uint64_t v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  uint64_t v44;
  char *v45;
  unint64_t v46;
  int v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  self->_rssi = a3;
  v4 = 127;
  if (a3 < 127)
    v4 = a3;
  if (v4 <= -128)
    LOBYTE(v4) = 0x80;
  rssiIndex = self->_rssiIndex;
  v6 = gSFBLERSSISampleCount;
  if (gSFBLERSSISampleCount <= rssiIndex)
    LODWORD(rssiIndex) = 0;
  rssiHistory = self->_rssiHistory;
  self->_rssiIndex = rssiIndex + 1;
  self->_rssiHistory[rssiIndex] = v4;
  rssiCount = self->_rssiCount;
  if (v6 > rssiCount)
  {
    LOBYTE(rssiCount) = rssiCount + 1;
    self->_rssiCount = rssiCount;
    rssiCount = rssiCount;
  }
  if (v6 > rssiCount)
    return 0;
  switch(gSFBLERSSIAlgorithm)
  {
    case 1:
      if (!v6)
        goto LABEL_87;
      LOBYTE(v4) = *rssiHistory;
      v10 = v6 - 1;
      if (v6 != 1)
      {
        v11 = &self->_rssiHistory[1];
        do
        {
          v13 = *v11++;
          v12 = v13;
          if (v13 < (char)v4)
            LOBYTE(v4) = v12;
          --v10;
        }
        while (v10);
      }
      goto LABEL_92;
    case 2:
      if (!v6)
        goto LABEL_87;
      LOBYTE(v4) = *rssiHistory;
      v14 = v6 - 1;
      if (v6 != 1)
      {
        v15 = &self->_rssiHistory[1];
        do
        {
          v17 = *v15++;
          v16 = v17;
          if (v17 > (char)v4)
            LOBYTE(v4) = v16;
          --v14;
        }
        while (v14);
      }
      goto LABEL_92;
    case 3:
      if (!v6)
        goto LABEL_87;
      v18 = 0;
      v19 = v6;
      do
      {
        v20 = *rssiHistory++;
        v18 += v20;
        --v19;
      }
      while (v19);
      goto LABEL_91;
    case 4:
      LODWORD(v4) = *rssiHistory;
      if ((int)v6 < 2)
      {
        v23 = *rssiHistory;
      }
      else
      {
        v21 = v6 - 1;
        v22 = &self->_rssiHistory[1];
        LOBYTE(v23) = *rssiHistory;
        do
        {
          v25 = *v22++;
          v24 = v25;
          if (v25 >= (char)v23)
            v23 = (char)v23;
          else
            v23 = v24;
          if (v24 <= (char)v4)
            LODWORD(v4) = (char)v4;
          else
            LODWORD(v4) = v24;
          --v21;
        }
        while (v21);
      }
      v29 = (v6 + 1) >> 1;
      while (1)
      {
        v30 = (int)((char)v4 + (char)v23 + ((((char)v4 + (char)v23) & 0x8000u) >> 15)) >> 1;
        if ((int)v6 < 1)
        {
          v33 = 0;
          v32 = 0;
          v31 = 0;
          v37 = v23;
          v36 = v4;
        }
        else
        {
          v31 = 0;
          v32 = 0;
          v33 = 0;
          v34 = rssiHistory;
          v35 = v6;
          v36 = v4;
          v37 = v23;
          do
          {
            v39 = *v34++;
            v38 = v39;
            v40 = (char)v36;
            if (v39 < (char)v36)
              v40 = v38;
            if (v30 >= v38)
              v41 = v32;
            else
              v41 = v32 + 1;
            if (v30 < v38)
              v42 = v31;
            else
              v42 = v31 + 1;
            if (v30 >= v38)
              v40 = v36;
            v43 = (char)v37;
            if (v38 > (char)v37)
              v43 = v38;
            if (v30 <= v38)
              v32 = v41;
            else
              ++v33;
            if (v30 > v38)
              v37 = v43;
            else
              v31 = v42;
            if (v30 <= v38)
              v36 = v40;
            --v35;
          }
          while (v35);
        }
        if (v33 <= v29 && v32 <= v29)
          break;
        if (v33 > v32)
          LODWORD(v4) = v37;
        else
          v23 = v36;
      }
      if (v31 + v33 >= v29)
        LOBYTE(v4) = (int)((char)v4 + (char)v23 + ((((char)v4 + (char)v23) & 0x8000u) >> 15)) >> 1;
      else
        LOBYTE(v4) = v36;
      if (v33 >= v29)
        LOBYTE(v4) = v37;
      goto LABEL_92;
    case 5:
      v48[0] = 0;
      v26 = gSFBLERSSIRemoveHigh;
      v27 = v6 - (gSFBLERSSIRemoveLow + gSFBLERSSIRemoveHigh);
      if (v6 <= gSFBLERSSIRemoveLow + gSFBLERSSIRemoveHigh)
      {
        if (!v6)
        {
LABEL_87:
          LOBYTE(v4) = 0;
          goto LABEL_92;
        }
        v44 = 0;
        v18 = 0;
        do
          v18 += rssiHistory[v44++];
        while (v6 != v44);
      }
      else if (v27 > 1)
      {
        __memcpy_chk();
        qsort(v48, v6, 1uLL, (int (__cdecl *)(const void *, const void *))_QSortCmpInt8);
        v18 = 0;
        v45 = (char *)v48 + v26;
        v46 = v27;
        do
        {
          v47 = *v45++;
          v18 += v47;
          --v46;
        }
        while (v46);
        LODWORD(v6) = v27;
      }
      else
      {
        v28 = 0;
        v18 = 0;
        do
          v18 += rssiHistory[v28++];
        while (v6 != v28);
      }
LABEL_91:
      LODWORD(v4) = v18 / (int)v6;
LABEL_92:
      result = self->_smoothedRSSI != (char)v4;
      self->_rssiCeiling = (char)v4;
      self->_rssiFloor = (char)v4;
      self->_smoothedRSSI = (char)v4;
      break;
    default:
      goto LABEL_92;
  }
  return result;
}

- (void)setLastSeen:(double)a3
{
  self->_lastSeen = a3;
}

- (void)setAdvertisementFields:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setAdvertisementData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setFoundTicks:(unint64_t)a3
{
  self->_foundTicks = a3;
}

- (void)setConnectedServices:(unsigned int)a3
{
  self->_connectedServices = a3;
}

- (void)setBluetoothAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)paired
{
  return self->_paired;
}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  NSData *bluetoothAddress;
  id v7;
  unsigned __int8 Int64Ranged;
  uint64_t v9;
  uint64_t v10;
  int64_t distance;
  const char *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  const __CFString *name;
  id v19;
  unsigned __int8 v20;
  unsigned __int8 v21;
  const char *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  __int16 v29;
  __int16 v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  unsigned __int8 v46;
  const char *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  uint64_t v67;
  id v68;
  void *v70;
  uint64_t Int64;
  const char *v72;
  uint64_t rssiEstimate;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  double v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  id obj;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  void *v111;
  id v112;
  uint64_t v113;
  int v114;
  _BYTE v115[144];
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  SFShouldLogSensitiveDescriptions();
  v114 = 0;
  v113 = 0;
  NSAppendPrintF();
  v3 = 0;
  v4 = v3;
  if (self->_identifier)
  {
    v112 = v3;
    NSAppendPrintF();
    v5 = v112;

    v4 = v5;
  }
  bluetoothAddress = self->_bluetoothAddress;
  if (bluetoothAddress)
  {
    v111 = v4;
    -[NSData bytes](bluetoothAddress, "bytes");
    NSAppendPrintF();
    v7 = v4;

    v4 = v7;
  }
  Int64Ranged = CFDictionaryGetInt64Ranged();
  v110 = v4;
  if (self->_triggered)
    v9 = 84;
  else
    v9 = 116;
  if (self->_insideBubble)
    v10 = 42;
  else
    v10 = 126;
  distance = self->_distance;
  if (distance > 29)
  {
    if (distance > 49)
    {
      if (distance == 50)
      {
        v12 = "H";
        goto LABEL_28;
      }
      if (distance == 60)
      {
        v12 = "F";
        goto LABEL_28;
      }
    }
    else
    {
      if (distance == 30)
      {
        v12 = "P";
        goto LABEL_28;
      }
      if (distance == 40)
      {
        v12 = "R";
        goto LABEL_28;
      }
    }
    goto LABEL_26;
  }
  if (!distance)
  {
    v12 = "U";
    goto LABEL_28;
  }
  if (distance != 10)
  {
    if (distance == 20)
    {
      v12 = "N";
      goto LABEL_28;
    }
LABEL_26:
    v12 = "?";
    goto LABEL_28;
  }
  v12 = "I";
LABEL_28:
  v76 = v9;
  v78 = v10;
  rssiEstimate = self->_rssiEstimate;
  v80 = v12;
  v81 = Int64Ranged;
  NSAppendPrintF();
  v13 = v110;

  if (self->_insideSmallBubble)
  {
    v109 = v13;
    NSAppendPrintF();
    v14 = v13;

    v13 = v14;
  }
  if (self->_insideMediumBubble)
  {
    v108 = v13;
    NSAppendPrintF();
    v15 = v13;

    v13 = v15;
  }
  if (self->_advertisementData)
  {
    v107 = v13;
    NSAppendPrintF();
    v16 = v13;

    v13 = v16;
  }
  CFDictionaryGetInt64Ranged();
  v106 = v13;
  NSAppendPrintF();
  v17 = v13;

  v105 = v17;
  name = (const __CFString *)self->_name;
  if (!name)
    name = CFSTR("?");
  v70 = (void *)name;
  NSAppendPrintF();
  v19 = v105;

  v20 = CFDictionaryGetInt64Ranged();
  v21 = v20;
  if (v20)
  {
    v104 = v19;
    if (v20 > 0x63u)
    {
      switch(v20)
      {
        case 'd':
          v22 = "B238SetupAfterWiFi";
          break;
        case 'e':
          v22 = "B389SetupFromFindMy";
          break;
        case 'f':
          v22 = "B389SetupDone";
          break;
        default:
LABEL_81:
          v22 = "?";
          break;
      }
    }
    else
    {
      v22 = "ATVSetup";
      switch(v20)
      {
        case 1u:
          break;
        case 4u:
          v22 = "MobileBackup";
          break;
        case 5u:
          v22 = "WatchSetup";
          break;
        case 6u:
          v22 = "ATVPair";
          break;
        case 7u:
          v22 = "InternetRelay";
          break;
        case 8u:
          v22 = "WiFiPassword";
          break;
        case 9u:
          v22 = "iOSSetup";
          break;
        case 0xAu:
          v22 = "Repair";
          break;
        case 0xBu:
          v22 = "LegacyHomePodSetup";
          break;
        case 0xCu:
          v22 = "ApplePay";
          break;
        case 0xDu:
          v22 = "WHASetup";
          break;
        case 0xEu:
          v22 = "DevToolsPair";
          break;
        case 0x11u:
          v22 = "DDPing";
          break;
        case 0x12u:
          v22 = "DDPong";
          break;
        case 0x13u:
          v22 = "RemoteAutoFill";
          break;
        case 0x14u:
          v22 = "CompanionLinkProx";
          break;
        case 0x15u:
          v22 = "RemoteManagement";
          break;
        case 0x16u:
          v22 = "RemoteAutoFillPong";
          break;
        case 0x18u:
          v22 = "AccessorySetup";
          break;
        case 0x19u:
          v22 = "TVLS";
          break;
        case 0x1Bu:
          v22 = "ShareAudio";
          break;
        case 0x1Cu:
          v22 = "AppSignIn";
          break;
        case 0x1Du:
          v22 = "Fitness";
          break;
        case 0x1Eu:
          v22 = "TVCCS";
          break;
        case 0x1Fu:
          v22 = "TVSA";
          break;
        case 0x20u:
          v22 = "AuthenticateAccounts";
          break;
        case 0x21u:
          v22 = "HomePodSetup";
          break;
        case 0x22u:
          v22 = "CompanionAuthentication";
          break;
        case 0x24u:
          v22 = "dovePeace";
          break;
        case 0x2Bu:
          v22 = "AuthenticateAccountsV2";
          break;
        case 0x32u:
          v22 = "NeedsRDLink";
          break;
        case 0x33u:
          v22 = "NeedsCLink";
          break;
        case 0x34u:
          v22 = "Goodbye";
          break;
        case 0x35u:
          v22 = "PointToShare";
          break;
        case 0x37u:
          v22 = "AUAction";
          break;
        case 0x38u:
          v22 = "AcceptedInvitations";
          break;
        case 0x54u:
          v22 = "HasInvitations";
          break;
        default:
          goto LABEL_81;
      }
    }
    v70 = (void *)v22;
    NSAppendPrintF();
    v23 = v104;

    v19 = v23;
  }
  -[NSDictionary objectForKeyedSubscript:](self->_advertisementFields, "objectForKeyedSubscript:", CFSTR("model"), v70, rssiEstimate, v76, v78, v80, v81);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v103 = v19;
    NSAppendPrintF();
    v25 = v19;

    v19 = v25;
  }
  v102 = v19;
  CFDictionaryGetInt64();
  NSAppendPrintF();
  v26 = v19;

  v101 = v26;
  CFDictionaryGetInt64();
  NSAppendPrintF();
  v27 = v26;

  if (CFDictionaryGetInt64())
  {
    v100 = v27;
    NSAppendPrintF();
    v28 = v27;

    v27 = v28;
  }
  v29 = CFDictionaryGetInt64Ranged();
  v30 = v29;
  if ((v29 & 1) != 0)
    v31 = 85;
  else
    v31 = 117;
  v115[133] = v31;
  if ((v29 & 8) != 0)
  {
    v32 = 65;
  }
  else if ((v29 & 2) != 0)
  {
    v32 = 67;
  }
  else if ((v29 & 0x800) != 0)
  {
    v32 = 84;
  }
  else if ((v29 & 4) != 0)
  {
    v32 = 69;
  }
  else
  {
    v32 = 63;
  }
  v115[134] = v32;
  if ((v29 & 0x40) != 0)
  {
    v33 = 65;
  }
  else if ((v29 & 0x10) != 0)
  {
    v33 = 67;
  }
  else if ((v29 & 0x20) != 0)
  {
    v33 = 69;
  }
  else
  {
    v33 = 63;
  }
  v115[135] = v33;
  if ((v29 & 0x80) != 0)
    v34 = 76;
  else
    v34 = 114;
  v115[136] = v34;
  if ((v29 & 0x100) != 0)
    v35 = 80;
  else
    v35 = 115;
  v115[137] = v35;
  if ((v29 & 0x200) != 0)
    v36 = 66;
  else
    v36 = 98;
  v115[138] = v36;
  if (CFDictionaryGetInt64Ranged())
    v37 = 67;
  else
    v37 = 111;
  v115[139] = v37;
  v115[140] = CFDictionaryGetInt64Ranged() + 48;
  v115[141] = CFDictionaryGetInt64Ranged() + 48;
  if ((v30 & 0x400) != 0)
    v38 = 83;
  else
    v38 = 115;
  v115[142] = v38;
  v115[143] = 0;
  v99 = v27;
  NSAppendPrintF();
  v39 = v27;

  v98 = v39;
  CFDictionaryGetInt64Ranged();
  NSAppendPrintF();
  v40 = v39;

  v97 = v40;
  CFDictionaryGetInt64Ranged();
  NSAppendPrintF();
  v41 = v40;

  v42 = v41;
  v96 = v41;
  CFDictionaryGetInt64Ranged();
  NSAppendPrintF();
  v43 = v41;

  v44 = v43;
  if ((unsigned __int16)CFDictionaryGetInt64Ranged())
  {
    v95 = v43;
    NSAppendPrintF();
    v45 = v43;

    v44 = v45;
  }
  v46 = CFDictionaryGetInt64Ranged();
  v94 = v44;
  if (v46 > 2u)
    v47 = "?";
  else
    v47 = off_1E48311C8[(char)v46];
  Int64 = (uint64_t)v47;
  NSAppendPrintF();
  v48 = v94;

  if (CFDictionaryGetInt64())
  {
    v93 = v48;
    NSAppendPrintF();
    v49 = v48;

    v48 = v49;
  }
  if (CFDictionaryGetInt64())
  {
    v92 = v48;
    NSAppendPrintF();
    v50 = v48;

    v48 = v50;
  }
  if (CFDictionaryGetInt64())
  {
    v91 = v48;
    NSAppendPrintF();
    v51 = v48;

    v48 = v51;
  }
  if (v21 == 10)
  {
    v90 = v48;
    Int64 = CFDictionaryGetInt64();
    v74 = &unk_1A2AF78D9;
    NSAppendPrintF();
    v52 = v48;

    v48 = v52;
  }
  -[NSDictionary objectForKeyedSubscript:](self->_advertisementFields, "objectForKeyedSubscript:", CFSTR("batteryInfo"), Int64, v74);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v53, "count"))
  {
    v83 = v24;
    v89 = v48;
    NSAppendPrintF();
    v54 = v48;

    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v82 = v53;
    obj = v53;
    v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v115, 16);
    if (v55)
    {
      v56 = v55;
      v57 = 1;
      v58 = *(_QWORD *)v86;
      do
      {
        v59 = 0;
        v60 = v54;
        do
        {
          if (*(_QWORD *)v86 != v58)
            objc_enumerationMutation(obj);
          v61 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v59);
          v62 = objc_msgSend(v61, "batteryType", v72, v75, v77, *(_QWORD *)&v79);
          if (v57 + v59 <= 1)
            v63 = "";
          else
            v63 = "; ";
          if ((unint64_t)(v62 - 1) >= 3)
          {
            if (v62 == 4)
              v64 = 77;
            else
              v64 = 63;
          }
          else
          {
            v64 = dword_1A2AF79F4[v62 - 1];
          }
          v65 = objc_msgSend(v61, "batteryState");
          objc_msgSend(v61, "batteryLevel");
          v79 = v66 * 100.0;
          v67 = 45;
          if (v65 == 2)
            v67 = 43;
          v75 = v64;
          v77 = v67;
          v72 = v63;
          NSAppendPrintF();
          v54 = v60;

          ++v59;
          v60 = v54;
        }
        while (v56 != v59);
        v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v115, 16, v63, v64, v77, *(_QWORD *)&v79);
        v57 += v59;
      }
      while (v56);
    }

    v48 = v54;
    v53 = v82;
    v24 = v83;
  }
  v68 = v48;

  return v68;
}

- (NSUUID)counterpartIdentifier
{
  return self->_counterpartIdentifier;
}

- (unsigned)connectedServices
{
  return self->_connectedServices;
}

- (NSData)bluetoothAddress
{
  return self->_bluetoothAddress;
}

+ (void)setRSSIEstimatorInfo:(id)a3
{
  id v3;
  uint64_t Int64Ranged;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  _BOOL4 v8;

  v3 = a3;
  Int64Ranged = CFDictionaryGetInt64Ranged();
  v5 = CFDictionaryGetInt64Ranged();
  v6 = CFDictionaryGetInt64Ranged();
  v7 = CFDictionaryGetInt64Ranged();

  if ((unint64_t)((Int64Ranged << 32) - 0x800000000) <= 0xFFFFFFF800000000)
  {
    if (gLogCategory_SFBLERSSI <= 90 && (gLogCategory_SFBLERSSI != -1 || _LogCategory_Initialize()))
      goto LABEL_18;
    return;
  }
  if (v6 > (unint64_t)v5 || v6 + (unint64_t)v5 >= v7)
  {
    if (gLogCategory_SFBLERSSI <= 90 && (gLogCategory_SFBLERSSI != -1 || _LogCategory_Initialize()))
      goto LABEL_18;
    return;
  }
  if (v7 >= 9uLL)
  {
    if (gLogCategory_SFBLERSSI <= 90 && (gLogCategory_SFBLERSSI != -1 || _LogCategory_Initialize()))
      goto LABEL_18;
    return;
  }
  v8 = Int64Ranged != gSFBLERSSIAlgorithm;
  if ((int)Int64Ranged != gSFBLERSSIAlgorithm)
    gSFBLERSSIAlgorithm = (int)Int64Ranged;
  if (v5 != gSFBLERSSIRemoveHigh)
  {
    gSFBLERSSIRemoveHigh = v5;
    v8 = 1;
  }
  if (v6 != gSFBLERSSIRemoveLow)
  {
    gSFBLERSSIRemoveLow = v6;
    if (v7 == gSFBLERSSISampleCount)
      goto LABEL_15;
LABEL_14:
    gSFBLERSSISampleCount = v7;
    goto LABEL_15;
  }
  if (v7 != gSFBLERSSISampleCount)
    goto LABEL_14;
  if (!v8)
    return;
LABEL_15:
  if (gLogCategory_SFBLERSSI <= 30 && (gLogCategory_SFBLERSSI != -1 || _LogCategory_Initialize()))
LABEL_18:
    LogPrintF();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  NSData *advertisementData;
  NSDictionary *advertisementFields;
  NSData *bluetoothAddress;
  NSUUID *counterpartIdentifier;
  int64_t distance;
  unint64_t foundTicks;
  unint64_t proxPairingTicks;
  NSUUID *identifier;
  double lastSeen;
  NSString *name;
  int64_t rssiCeiling;
  int64_t rssiFloor;
  int64_t smoothedRSSI;
  id v19;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    advertisementData = self->_advertisementData;
    if (advertisementData)
      objc_storeStrong((id *)(v4 + 40), advertisementData);
    advertisementFields = self->_advertisementFields;
    if (advertisementFields)
      objc_storeStrong((id *)(v5 + 48), advertisementFields);
    bluetoothAddress = self->_bluetoothAddress;
    if (bluetoothAddress)
      objc_storeStrong((id *)(v5 + 56), bluetoothAddress);
    counterpartIdentifier = self->_counterpartIdentifier;
    if (counterpartIdentifier)
      objc_storeStrong((id *)(v5 + 64), counterpartIdentifier);
    distance = self->_distance;
    if (distance)
      *(_QWORD *)(v5 + 72) = distance;
    foundTicks = self->_foundTicks;
    if (foundTicks)
      *(_QWORD *)(v5 + 80) = foundTicks;
    proxPairingTicks = self->_proxPairingTicks;
    if (proxPairingTicks)
      *(_QWORD *)(v5 + 152) = proxPairingTicks;
    identifier = self->_identifier;
    if (identifier)
      objc_storeStrong((id *)(v5 + 88), identifier);
    *(_BYTE *)(v5 + 20) = self->_insideBubble;
    *(_BYTE *)(v5 + 21) = self->_insideSmallBubble;
    *(_BYTE *)(v5 + 22) = self->_insideMediumBubble;
    lastSeen = self->_lastSeen;
    if (lastSeen != 0.0)
      *(double *)(v5 + 168) = lastSeen;
    name = self->_name;
    if (name)
      objc_storeStrong((id *)(v5 + 96), name);
    if (self->_paired)
      *(_BYTE *)(v5 + 23) = 1;
    *(_QWORD *)(v5 + 104) = self->_rssi;
    *(_DWORD *)(v5 + 28) = self->_rssiEstimate;
    rssiCeiling = self->_rssiCeiling;
    if (rssiCeiling)
      *(_QWORD *)(v5 + 112) = rssiCeiling;
    rssiFloor = self->_rssiFloor;
    if (rssiFloor)
      *(_QWORD *)(v5 + 120) = rssiFloor;
    *(_QWORD *)(v5 + 8) = *(_QWORD *)self->_rssiHistory;
    smoothedRSSI = self->_smoothedRSSI;
    if (smoothedRSSI)
      *(_QWORD *)(v5 + 128) = smoothedRSSI;
    *(_BYTE *)(v5 + 25) = self->_triggered;
    v19 = (id)v5;
  }

  return (id)v5;
}

- (void)setCounterpartIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setDistance:(int64_t)a3
{
  self->_distance = a3;
}

- (unint64_t)foundTicks
{
  return self->_foundTicks;
}

- (BOOL)useBTPipe
{
  return self->_useBTPipe;
}

- (void)setUseBTPipe:(BOOL)a3
{
  self->_useBTPipe = a3;
}

- (void)setInsideBubble:(BOOL)a3
{
  self->_insideBubble = a3;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (void)setRssiEstimate:(int)a3
{
  self->_rssiEstimate = a3;
}

- (int64_t)rssiCeiling
{
  return self->_rssiCeiling;
}

- (void)setRssiCeiling:(int64_t)a3
{
  self->_rssiCeiling = a3;
}

- (int64_t)rssiFloor
{
  return self->_rssiFloor;
}

- (void)setRssiFloor:(int64_t)a3
{
  self->_rssiFloor = a3;
}

- (int64_t)smoothedRSSI
{
  return self->_smoothedRSSI;
}

- (void)setSmoothedRSSI:(int64_t)a3
{
  self->_smoothedRSSI = a3;
}

- (void)setCloseProximityEstimatorSmall:(id)a3
{
  objc_storeStrong((id *)&self->_closeProximityEstimatorSmall, a3);
}

- (void)setCloseProximityEstimatorMedium:(id)a3
{
  objc_storeStrong((id *)&self->_closeProximityEstimatorMedium, a3);
}

- (unint64_t)proxPairingTicks
{
  return self->_proxPairingTicks;
}

- (void)setProxPairingTicks:(unint64_t)a3
{
  self->_proxPairingTicks = a3;
}

- (BOOL)insideSmallBubble
{
  return self->_insideSmallBubble;
}

- (void)setInsideSmallBubble:(BOOL)a3
{
  self->_insideSmallBubble = a3;
}

- (BOOL)insideMediumBubble
{
  return self->_insideMediumBubble;
}

- (void)setInsideMediumBubble:(BOOL)a3
{
  self->_insideMediumBubble = a3;
}

- (double)lastSeen
{
  return self->_lastSeen;
}

- (double)pairCheckTime
{
  return self->_pairCheckTime;
}

- (void)setPairCheckTime:(double)a3
{
  self->_pairCheckTime = a3;
}

- (unsigned)productID2
{
  return self->_productID2;
}

- (void)setProductID2:(unsigned int)a3
{
  self->_productID2 = a3;
}

- (SFProximityEstimator)proxPairProximityEstimator
{
  return self->_proxPairProximityEstimator;
}

- (void)setProxPairProximityEstimator:(id)a3
{
  objc_storeStrong((id *)&self->_proxPairProximityEstimator, a3);
}

- (SFProximityEstimator)setupProximityEstimator
{
  return self->_setupProximityEstimator;
}

- (void)setSetupProximityEstimator:(id)a3
{
  objc_storeStrong((id *)&self->_setupProximityEstimator, a3);
}

- (RPIdentity)rpIdentity
{
  return self->_rpIdentity;
}

- (void)setRpIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_rpIdentity, a3);
}

- (void)setTempPaired:(BOOL)a3
{
  self->_tempPaired = a3;
}

- (BOOL)triggered
{
  return self->_triggered;
}

- (void)setTriggered:(BOOL)a3
{
  self->_triggered = a3;
}

@end
