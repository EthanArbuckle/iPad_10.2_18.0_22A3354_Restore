@implementation PTCinematographyDetection

+ (void)registerForSerialization
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PTCinematographyDetection_Serialization__registerForSerialization__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (registerForSerialization_onceToken != -1)
    dispatch_once(&registerForSerialization_onceToken, block);
}

void __68__PTCinematographyDetection_Serialization__registerForSerialization__block_invoke(uint64_t a1)
{
  PTSerializationTypeInfo *v2;

  +[PTSerialization registerType:providerClass:](PTSerialization, "registerType:providerClass:", 1685349236, *(_QWORD *)(a1 + 32));
  v2 = -[PTSerializationTypeInfo initWithType:providerClass:]([PTSerializationTypeInfo alloc], "initWithType:providerClass:", 1685349235, *(_QWORD *)(a1 + 32));
  -[PTSerializationTypeInfo setIsAtomContainerType:](v2, "setIsAtomContainerType:", 1);
  +[PTSerialization registerTypeInfo:](PTSerialization, "registerTypeInfo:", v2);

}

- (id)_initWithDetectionData_0:(DetectionData_0 *)a3
{
  PTCinematographyDetection *v4;
  PTCinematographyDetection *v5;
  double v6;
  double Float;
  double v8;
  double v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PTCinematographyDetection;
  v4 = -[PTCinematographyDetection init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    -[PTCinematographyDetection setTrackIdentifier:](v4, "setTrackIdentifier:", bswap64(a3->var0));
    -[PTCinematographyDetection setGroupIdentifier:](v5, "setGroupIdentifier:", bswap64(a3->var1));
    -[PTCinematographyDetection setDetectionType:](v5, "setDetectionType:", bswap32(a3->var2));
    *(float *)&v6 = _PTSwapBigGetFloat((unsigned int *)&a3->var3);
    -[PTCinematographyDetection setFocusDistance:](v5, "setFocusDistance:", v6);
    Float = _PTSwapBigGetFloat((unsigned int *)a3->var4);
    v8 = _PTSwapBigGetFloat((unsigned int *)&a3->var4[1]);
    v9 = _PTSwapBigGetFloat((unsigned int *)&a3->var4[2]);
    -[PTCinematographyDetection setRect:](v5, "setRect:", Float, v8, v9, _PTSwapBigGetFloat((unsigned int *)&a3->var4[3]));
  }
  return v5;
}

- (BOOL)_copyToDetectionData_0:(DetectionData_0 *)a3
{
  float v5;
  double v6;
  double v7;
  float v8;
  double v9;
  float v10;
  double v11;
  float v12;

  a3->var0 = bswap64(-[PTCinematographyDetection trackIdentifier](self, "trackIdentifier"));
  a3->var1 = bswap64(-[PTCinematographyDetection groupIdentifier](self, "groupIdentifier"));
  a3->var2 = bswap32(-[PTCinematographyDetection detectionType](self, "detectionType"));
  -[PTCinematographyDetection focusDistance](self, "focusDistance");
  _PTSwapBigAssignFloat(&a3->var3, v5);
  -[PTCinematographyDetection rect](self, "rect");
  *(float *)&v6 = v6;
  _PTSwapBigAssignFloat(a3->var4, *(float *)&v6);
  -[PTCinematographyDetection rect](self, "rect");
  v8 = v7;
  _PTSwapBigAssignFloat(&a3->var4[1], v8);
  -[PTCinematographyDetection rect](self, "rect");
  v10 = v9;
  _PTSwapBigAssignFloat(&a3->var4[2], v10);
  -[PTCinematographyDetection rect](self, "rect");
  v12 = v11;
  _PTSwapBigAssignFloat(&a3->var4[3], v12);
  return 1;
}

- (BOOL)supportsVersion:(unint64_t)a3
{
  return a3 == 0;
}

- (unint64_t)sizeOfSerializedObjectWithOptions:(id)a3
{
  return 52;
}

- (BOOL)writeToAtomWriter:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;
  _OWORD v9[2];
  uint64_t v10;

  v5 = a3;
  v10 = 0;
  memset(v9, 0, sizeof(v9));
  if (-[PTCinematographyDetection _copyToDetectionData_0:](self, "_copyToDetectionData_0:", v9))
  {
    objc_msgSend(v5, "beginAtomOfType:", 1685349236);
    objc_msgSend(v5, "appendVersion:flags:", 0, 0);
    objc_msgSend(v5, "appendBytes:size:", v9, 40);
    objc_msgSend(v5, "endAtom");
    objc_msgSend(v5, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)objectFromAtomStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _OWORD v9[2];
  uint64_t v10;

  v4 = a3;
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    || objc_msgSend(v4, "atomType") != 1685349236
    || (objc_msgSend(v4, "readCurrentAtomVersionAndFlags"), objc_msgSend(v4, "atomVersion"))
    || (v10 = 0,
        memset(v9, 0, sizeof(v9)),
        objc_msgSend(v4, "readCurrentAtomDataBytes:size:offset:", v9, 40, 0),
        objc_msgSend(v4, "error"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    v7 = 0;
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithDetectionData_0:", v9);
  }

  return v7;
}

+ (id)objectsFromAtomStream:(id)a3
{
  id v4;
  PTAtomStream *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "atomType") != 1685349235
    || (objc_msgSend(v4, "readCurrentAtomVersionAndFlags"), objc_msgSend(v4, "atomVersion")))
  {
    v6 = 0;
    v5 = 0;
  }
  else
  {
    v5 = -[PTAtomStream initWithParent:]([PTAtomStream alloc], "initWithParent:", v4);
    objc_msgSend(a1, "_detectionsFromInnerAtomStream:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)_detectionsFromInnerAtomStream:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (!objc_msgSend(v4, "hasAtom"))
    goto LABEL_10;
  while (objc_msgSend(v4, "atomType") != 1685349236)
  {
LABEL_5:
    objc_msgSend(v4, "advanceToNextAtom");
    if ((objc_msgSend(v4, "hasAtom") & 1) == 0)
      goto LABEL_10;
  }
  objc_msgSend(a1, "objectFromAtomStream:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v5, "addObject:", v6);

    goto LABEL_5;
  }
  _PTLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    +[PTCinematographyDetection(Serialization) _detectionsFromInnerAtomStream:].cold.1(v8);

LABEL_10:
  v9 = (void *)objc_msgSend(v5, "copy");

  return v9;
}

+ (unint64_t)sizeOfSerializedArray:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    v10 = 12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v10 += objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "sizeOfSerializedObjectWithOptions:", v6);
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 12;
  }

  return v10;
}

+ (BOOL)writeArray:(id)a3 toAtomWriter:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  id v9;
  PTAtomWriter *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "beginAtomOfType:", 1685349235);
  objc_msgSend(v8, "appendVersion:flags:", 0, 0);
  v10 = -[PTAtomWriter initWithParent:]([PTAtomWriter alloc], "initWithParent:", v8);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "writeToAtomWriter:options:", v10, v9, (_QWORD)v19))
        {
          v17 = 0;
          v16 = v11;
          goto LABEL_11;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v13)
        continue;
      break;
    }
  }

  objc_msgSend(v8, "endAtom");
  objc_msgSend(v8, "error");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 == 0;
LABEL_11:

  return v17;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    +[PTSerialization registerSerializationClass:](PTSerialization, "registerSerializationClass:", a1);
}

- (PTCinematographyDetection)initWithTime:(id *)a3 rect:(CGRect)a4 focusDistance:(float)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  PTCinematographyDetection *result;
  __int128 v12;
  objc_super v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)PTCinematographyDetection;
  result = -[PTCinematographyDetection init](&v13, sel_init);
  if (result)
  {
    v12 = *(_OWORD *)&a3->var0;
    result->_time.epoch = a3->var3;
    *(_OWORD *)&result->_time.value = v12;
    result->_rect.origin.x = x;
    result->_rect.origin.y = y;
    result->_rect.size.width = width;
    result->_rect.size.height = height;
    result->_focusDistance = a5;
    result->_groupIdentifier = -1;
  }
  return result;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  void *v9;
  CMTime v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PTCinematographyDetection focusIdentifier](self, "focusIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyDetection time](self, "time");
  NSStringFromCMTime(&v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3B18];
  -[PTCinematographyDetection rect](self, "rect");
  objc_msgSend(v6, "valueWithRect:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyDetection focusDistance](self, "focusDistance");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@: %@ focus: %g"), v4, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PTCinematographyDetection description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3B18];
  -[PTCinematographyDetection rect](self, "rect");
  objc_msgSend(v5, "valueWithRect:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[PTCinematographyDetection focusDistance](self, "focusDistance");
  objc_msgSend(v7, "numberWithFloat:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyDetection trackNumber](self, "trackNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, rect: %@, focusDistance: %@, trackID: %@"), v4, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (BOOL)isEqual:(id)a3
{
  PTCinematographyDetection *v4;
  PTCinematographyDetection *v5;
  int64_t v6;
  unint64_t v7;
  float v8;
  float v9;
  float v10;
  BOOL v11;
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
  float v24;
  double v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  CMTime v32;
  CMTime time1;

  v4 = (PTCinematographyDetection *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PTCinematographyDetection trackIdentifier](self, "trackIdentifier");
      if (v6 != -[PTCinematographyDetection trackIdentifier](v5, "trackIdentifier"))
        goto LABEL_12;
      v7 = -[PTCinematographyDetection detectionType](self, "detectionType");
      if (v7 != -[PTCinematographyDetection detectionType](v5, "detectionType"))
        goto LABEL_12;
      -[PTCinematographyDetection focusDistance](self, "focusDistance");
      v9 = v8;
      -[PTCinematographyDetection focusDistance](v5, "focusDistance");
      if (v9 != v10)
        goto LABEL_12;
      -[PTCinematographyDetection time](self, "time");
      if (v5)
        -[PTCinematographyDetection time](v5, "time");
      else
        memset(&v32, 0, sizeof(v32));
      if (CMTimeCompare(&time1, &v32))
        goto LABEL_12;
      -[PTCinematographyDetection rect](self, "rect");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      -[PTCinematographyDetection rect](v5, "rect");
      v24 = v14;
      *(float *)&v25 = v25;
      if (v24 != *(float *)&v25)
        goto LABEL_12;
      v26 = v16;
      v27 = v21;
      if (v26 == v27 && (v28 = v18, v29 = v22, v28 == v29))
      {
        v30 = v20;
        v31 = v23;
        v11 = v30 == v31;
      }
      else
      {
LABEL_12:
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  int64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CMTime time;

  v3 = -[PTCinematographyDetection trackIdentifier](self, "trackIdentifier");
  v4 = (double)(-[PTCinematographyDetection detectionType](self, "detectionType") + v3);
  -[PTCinematographyDetection time](self, "time");
  v5 = v4 + CMTimeGetSeconds(&time) * 600.0;
  -[PTCinematographyDetection rect](self, "rect");
  v7 = v5 + v6;
  -[PTCinematographyDetection rect](self, "rect");
  return (unint64_t)(v7 + v8);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PTCinematographyDetection *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  double v14;
  PTCinematographyDetection *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BYTE v21[24];

  v4 = [PTCinematographyDetection alloc];
  -[PTCinematographyDetection time](self, "time");
  -[PTCinematographyDetection rect](self, "rect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PTCinematographyDetection focusDistance](self, "focusDistance");
  LODWORD(v14) = v13;
  v15 = -[PTCinematographyDetection initWithTime:rect:focusDistance:](v4, "initWithTime:rect:focusDistance:", v21, v6, v8, v10, v12, v14);
  if (v15)
  {
    -[PTCinematographyDetection setDetectionType:](v15, "setDetectionType:", -[PTCinematographyDetection detectionType](self, "detectionType"));
    -[PTCinematographyDetection trackNumber](self, "trackNumber");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTCinematographyDetection setTrackNumber:](v15, "setTrackNumber:", v16);

    -[PTCinematographyDetection setGroupIdentifier:](v15, "setGroupIdentifier:", -[PTCinematographyDetection groupIdentifier](self, "groupIdentifier"));
    -[PTCinematographyDetection _namedSignals](self, "_namedSignals");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    -[PTCinematographyDetection set_namedSignals:](v15, "set_namedSignals:", v18);

    if (-[PTCinematographyDetection cachedFocusIdentifierWasSetByClient](self, "cachedFocusIdentifierWasSetByClient"))
    {
      -[PTCinematographyDetection setCachedFocusIdentifierWasSetByClient:](v15, "setCachedFocusIdentifierWasSetByClient:", -[PTCinematographyDetection cachedFocusIdentifierWasSetByClient](self, "cachedFocusIdentifierWasSetByClient"));
      -[PTCinematographyDetection cachedFocusIdentifier](self, "cachedFocusIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PTCinematographyDetection setCachedFocusIdentifier:](v15, "setCachedFocusIdentifier:", v19);

    }
  }
  return v15;
}

- (void)setDetectionType:(unint64_t)a3
{
  if (self->_detectionType != a3)
  {
    self->_detectionType = a3;
    -[PTCinematographyDetection _clearCachedFocusIdentifier](self, "_clearCachedFocusIdentifier");
  }
}

- (int64_t)trackIdentifier
{
  void *v2;
  int64_t v3;

  -[PTCinematographyDetection trackNumber](self, "trackNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PTTrackIDFromNumber(v2);

  return v3;
}

- (void)setTrackIdentifier:(int64_t)a3
{
  NSObject *v4;
  id v5;
  uint8_t buf[4];
  PTCinematographyDetection *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3 == 0xFFFFFFFFLL)
  {
    _PTLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v7 = self;
      _os_log_impl(&dword_1C9281000, v4, OS_LOG_TYPE_DEFAULT, "trackIdentifier missing from original detection %@", buf, 0xCu);
    }

    -[PTCinematographyDetection setTrackNumber:](self, "setTrackNumber:", 0);
  }
  else
  {
    NSNumberFromPTTrackID(a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PTCinematographyDetection setTrackNumber:](self, "setTrackNumber:");

  }
}

- (void)setTrackNumber:(id)a3
{
  objc_storeStrong((id *)&self->_trackNumber, a3);
  -[PTCinematographyDetection _clearCachedFocusIdentifier](self, "_clearCachedFocusIdentifier");
}

- (id)focusIdentifier
{
  NSString *cachedFocusIdentifier;
  NSString *v4;
  NSString *v5;

  cachedFocusIdentifier = self->_cachedFocusIdentifier;
  if (!cachedFocusIdentifier)
  {
    _PTFocusIdentifierMake(-[PTCinematographyDetection detectionType](self, "detectionType"), -[PTCinematographyDetection trackIdentifier](self, "trackIdentifier"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cachedFocusIdentifier;
    self->_cachedFocusIdentifier = v4;

    cachedFocusIdentifier = self->_cachedFocusIdentifier;
  }
  return cachedFocusIdentifier;
}

- (NSString)accessibilityLabel
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "accessibilityLabelForDetectionType:", -[PTCinematographyDetection detectionType](self, "detectionType"));
}

+ (id)accessibilityLabelForDetectionType:(unint64_t)a3
{
  return PTDetectionTypeAccessibilityLabel(a3);
}

- (void)setFocusIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cachedFocusIdentifier, a3);
  self->_cachedFocusIdentifierWasSetByClient = 1;
}

- (void)_clearCachedFocusIdentifier
{
  NSString *cachedFocusIdentifier;

  if (!-[PTCinematographyDetection cachedFocusIdentifierWasSetByClient](self, "cachedFocusIdentifierWasSetByClient"))
  {
    cachedFocusIdentifier = self->_cachedFocusIdentifier;
    self->_cachedFocusIdentifier = 0;

  }
}

- (BOOL)_isInvalid
{
  return (unint64_t)-[PTCinematographyDetection trackIdentifier](self, "trackIdentifier") >> 63;
}

- (void)_setInvalid:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  unint64_t v6;

  v3 = a3;
  v5 = -[PTCinematographyDetection trackIdentifier](self, "trackIdentifier");
  if (v3)
    v6 = 0x8000000000000000;
  else
    v6 = 0;
  -[PTCinematographyDetection setTrackIdentifier:](self, "setTrackIdentifier:", v6 & 0x8000000000000000 | v5 & 0x7FFFFFFFFFFFFFFFLL);
}

- (unint64_t)detectionType
{
  return self->_detectionType;
}

- (int64_t)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(int64_t)a3
{
  self->_groupIdentifier = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)setTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (float)focusDistance
{
  return self->_focusDistance;
}

- (void)setFocusDistance:(float)a3
{
  self->_focusDistance = a3;
}

- (NSNumber)trackNumber
{
  return self->_trackNumber;
}

- (NSString)cachedFocusIdentifier
{
  return self->_cachedFocusIdentifier;
}

- (void)setCachedFocusIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cachedFocusIdentifier, a3);
}

- (BOOL)cachedFocusIdentifierWasSetByClient
{
  return self->_cachedFocusIdentifierWasSetByClient;
}

- (void)setCachedFocusIdentifierWasSetByClient:(BOOL)a3
{
  self->_cachedFocusIdentifierWasSetByClient = a3;
}

- (BOOL)_isExcludedAsCinematicChoice
{
  return self->__excludedAsCinematicChoice;
}

- (void)_setExcludedAsCinematicChoice:(BOOL)a3
{
  self->__excludedAsCinematicChoice = a3;
}

- (NSDictionary)_namedSignals
{
  return self->__namedSignals;
}

- (void)set_namedSignals:(id)a3
{
  objc_storeStrong((id *)&self->__namedSignals, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__namedSignals, 0);
  objc_storeStrong((id *)&self->_cachedFocusIdentifier, 0);
  objc_storeStrong((id *)&self->_trackNumber, 0);
}

- (id)_initWithCinematographyDictionary:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  const __CFDictionary *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  CMTime v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PTCinematographyDetection;
  v5 = -[PTCinematographyDetection init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attributes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ptime"));
    v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeFromPTCinematographyDictionary(&v24, v7);
    *(CMTime *)(v5 + 56) = v24;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rect"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
      v8 = v6;
    *((double *)v5 + 10) = CGRectFromPTCinematographyDictionary(v8);
    *((_QWORD *)v5 + 11) = v10;
    *((_QWORD *)v5 + 12) = v11;
    *((_QWORD *)v5 + 13) = v12;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disparity"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    *((_DWORD *)v5 + 3) = v14;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("detected_object_id"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTrackNumber:", v15);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("focus_id"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v16;

    v5[8] = *((_QWORD *)v5 + 5) != 0;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("group_id"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      v20 = objc_msgSend(v18, "integerValue");
    else
      v20 = -1;
    *((_QWORD *)v5 + 3) = v20;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("label"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v5 + 2) = objc_msgSend(v21, "integerValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MLSignals"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "set_namedSignals:", v22);

  }
  return v5;
}

- (id)_asCinematographyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[PTCinematographyDetection trackNumber](self, "trackNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("detected_object_id"));

  -[PTCinematographyDetection time](self, "time");
  PTCinematographyDictionaryFromCMTime((uint64_t)&v20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ptime"));

  if (-[PTCinematographyDetection cachedFocusIdentifierWasSetByClient](self, "cachedFocusIdentifierWasSetByClient"))
  {
    -[PTCinematographyDetection cachedFocusIdentifier](self, "cachedFocusIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("focus_id"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PTCinematographyDetection detectionType](self, "detectionType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("label"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[PTCinematographyDetection focusDistance](self, "focusDistance");
  objc_msgSend(v8, "numberWithFloat:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("disparity"));

  if ((-[PTCinematographyDetection groupIdentifier](self, "groupIdentifier") & 0x8000000000000000) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PTCinematographyDetection groupIdentifier](self, "groupIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("group_id"));

  }
  -[PTCinematographyDetection rect](self, "rect");
  PTCinematographyDictionaryFromCGRect(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("rect"));
  -[PTCinematographyDetection _namedSignals](self, "_namedSignals");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("MLSignals"));

  v21 = CFSTR("attributes");
  v17 = (void *)objc_msgSend(v3, "copy");
  v22[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)_detectionsFromCinematographyArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PTCinematographyDetection *v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = [PTCinematographyDetection alloc];
        v12 = -[PTCinematographyDetection _initWithCinematographyDictionary:](v11, "_initWithCinematographyDictionary:", v10, (_QWORD)v15);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

+ (id)_cinematographyArrayFromDetections:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "_asCinematographyDictionary", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (BOOL)_fixMissingTrackIdentifier:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;

  -[PTCinematographyDetection trackNumber](self, "trackNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _PTLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[PTCinematographyDetection(Private) _fixMissingTrackIdentifier:].cold.1((uint64_t)self, v6);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3 | 0xFF00000000);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTCinematographyDetection setTrackNumber:](self, "setTrackNumber:", v7);

  }
  return v5 == 0;
}

+ (id)_detectionsByTrackIdentifierFromArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v9 += objc_msgSend(v11, "_fixMissingTrackIdentifier:", v9, (_QWORD)v15);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "trackIdentifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

+ (id)_detectionsByFocusIdentifierFromArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v9 += objc_msgSend(v11, "_fixMissingTrackIdentifier:", v9, (_QWORD)v15);
        objc_msgSend(v11, "focusIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (BOOL)_isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  int64_t v11;
  unint64_t v12;
  float v13;
  float v14;
  float v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  BOOL v28;
  int v29;
  CGRect v31;
  CGRect v32;

  v4 = a3;
  if (-[PTCinematographyDetection isEqual:](self, "isEqual:", v4))
  {
    v5 = v4;
    -[PTCinematographyDetection trackNumber](self, "trackNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trackNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = v7;
    v10 = (void *)v9;
    if (v8 | v9)
    {
      if (!v8 || !v9)
      {

        goto LABEL_13;
      }
      v29 = objc_msgSend((id)v8, "isEqual:", v9);

      if (!v29)
        goto LABEL_13;
    }
    v11 = -[PTCinematographyDetection groupIdentifier](self, "groupIdentifier");
    if (v11 == objc_msgSend(v5, "groupIdentifier"))
    {
      v12 = -[PTCinematographyDetection detectionType](self, "detectionType");
      if (v12 == objc_msgSend(v5, "detectionType"))
      {
        -[PTCinematographyDetection focusDistance](self, "focusDistance");
        v14 = v13;
        objc_msgSend(v5, "focusDistance");
        if (v14 == v15)
        {
          -[PTCinematographyDetection rect](self, "rect");
          v17 = v16;
          v19 = v18;
          v21 = v20;
          v23 = v22;
          objc_msgSend(v5, "rect");
          v32.origin.x = v24;
          v32.origin.y = v25;
          v32.size.width = v26;
          v32.size.height = v27;
          v31.origin.x = v17;
          v31.origin.y = v19;
          v31.size.width = v21;
          v31.size.height = v23;
          v28 = CGRectEqualToRect(v31, v32);
LABEL_14:

          goto LABEL_15;
        }
      }
    }
LABEL_13:
    v28 = 0;
    goto LABEL_14;
  }
  v28 = 0;
LABEL_15:

  return v28;
}

- (id)_detectionByChangingTime:(id *)a3
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  v4 = (void *)-[PTCinematographyDetection copy](self, "copy");
  v6 = *a3;
  objc_msgSend(v4, "setTime:", &v6);
  return v4;
}

+ (id)_prefixForDetectionType:(unint64_t)a3
{
  id result;

  if ((uint64_t)a3 > 99)
  {
    switch(a3)
    {
      case 'd':
        return CFSTR("A");
      case 'e':
        return CFSTR("X");
      case 'f':
        return CFSTR("T");
      default:
        return CFSTR("U");
    }
  }
  else
  {
    result = CFSTR("F");
    switch(a3)
    {
      case 1uLL:
        return result;
      case 2uLL:
        result = CFSTR("H");
        break;
      case 3uLL:
        result = CFSTR("B");
        break;
      case 4uLL:
        result = CFSTR("C");
        break;
      case 5uLL:
        result = CFSTR("D");
        break;
      case 9uLL:
        result = CFSTR("CH");
        break;
      case 0xAuLL:
        result = CFSTR("DH");
        break;
      case 0xBuLL:
        result = CFSTR("SB");
        break;
      case 0xCuLL:
        result = CFSTR("HFB");
        break;
      default:
        return CFSTR("U");
    }
  }
  return result;
}

+ (unint64_t)_detectionTypeForPrefix:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  objc_msgSend(&unk_1E8252F98, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(&unk_1E8252FC0, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedLongValue");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isAutoFocusDetection
{
  return -[PTCinematographyDetection detectionType](self, "detectionType") == 100;
}

- (BOOL)isFixedFocusDetection
{
  return -[PTCinematographyDetection detectionType](self, "detectionType") == 101;
}

- (BOOL)isCustomDetection
{
  return -[PTCinematographyDetection detectionType](self, "detectionType") == 102;
}

@end
