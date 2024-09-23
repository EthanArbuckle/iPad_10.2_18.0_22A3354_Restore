@implementation TUScreenShareAttributes

+ (id)defaultAttributes
{
  TUScreenShareAttributes *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(TUScreenShareAttributes);
  -[TUScreenShareAttributes setStyle:](v3, "setStyle:", 0);
  -[TUScreenShareAttributes setDeviceFamily:](v3, "setDeviceFamily:", objc_msgSend(a1, "currentDeviceFamily"));
  -[TUScreenShareAttributes setDeviceHomeButtonType:](v3, "setDeviceHomeButtonType:", objc_msgSend(a1, "currentDeviceHomeButtonType"));
  objc_msgSend(a1, "defaultDisplayScale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUScreenShareAttributes setDisplayScale:](v3, "setDisplayScale:", v4);

  objc_msgSend(a1, "defaultScaleFactor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUScreenShareAttributes setScaleFactor:](v3, "setScaleFactor:", v5);

  objc_msgSend(a1, "defaultCornerRadius");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUScreenShareAttributes setCornerRadius:](v3, "setCornerRadius:", v6);

  objc_msgSend(a1, "defaultSystemRootLayerTransform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUScreenShareAttributes setSystemRootLayerTransform:](v3, "setSystemRootLayerTransform:", v7);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", 0.0, 0.0, 0.0, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUScreenShareAttributes setOriginalResolution:](v3, "setOriginalResolution:", v8);

  return v3;
}

- (TUScreenShareAttributes)initWithAttributes:(id)a3
{
  id v4;
  TUScreenShareAttributes *v5;
  uint64_t v6;
  NSNumber *displayScale;
  uint64_t v8;
  NSNumber *scaleFactor;
  uint64_t v10;
  NSNumber *cornerRadius;
  uint64_t v12;
  NSValue *originalResolution;
  uint64_t v14;
  NSNumber *displayID;
  uint64_t v16;
  NSUUID *windowUUID;
  uint64_t v18;
  NSValue *systemRootLayerTransform;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TUScreenShareAttributes;
  v5 = -[TUScreenShareAttributes init](&v21, sel_init);
  if (v5)
  {
    v5->_deviceFamily = objc_msgSend(v4, "deviceFamily");
    v5->_deviceHomeButtonType = objc_msgSend(v4, "deviceHomeButtonType");
    v5->_style = objc_msgSend(v4, "style");
    objc_msgSend(v4, "displayScale");
    v6 = objc_claimAutoreleasedReturnValue();
    displayScale = v5->_displayScale;
    v5->_displayScale = (NSNumber *)v6;

    objc_msgSend(v4, "scaleFactor");
    v8 = objc_claimAutoreleasedReturnValue();
    scaleFactor = v5->_scaleFactor;
    v5->_scaleFactor = (NSNumber *)v8;

    objc_msgSend(v4, "cornerRadius");
    v10 = objc_claimAutoreleasedReturnValue();
    cornerRadius = v5->_cornerRadius;
    v5->_cornerRadius = (NSNumber *)v10;

    objc_msgSend(v4, "originalResolution");
    v12 = objc_claimAutoreleasedReturnValue();
    originalResolution = v5->_originalResolution;
    v5->_originalResolution = (NSValue *)v12;

    objc_msgSend(v4, "displayID");
    v14 = objc_claimAutoreleasedReturnValue();
    displayID = v5->_displayID;
    v5->_displayID = (NSNumber *)v14;

    objc_msgSend(v4, "windowUUID");
    v16 = objc_claimAutoreleasedReturnValue();
    windowUUID = v5->_windowUUID;
    v5->_windowUUID = (NSUUID *)v16;

    v5->_windowed = objc_msgSend(v4, "isWindowed");
    objc_msgSend(v4, "systemRootLayerTransform");
    v18 = objc_claimAutoreleasedReturnValue();
    systemRootLayerTransform = v5->_systemRootLayerTransform;
    v5->_systemRootLayerTransform = (NSValue *)v18;

  }
  return v5;
}

- (NSString)description
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
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" deviceFamily=%ld"), -[TUScreenShareAttributes deviceFamily](self, "deviceFamily"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" deviceHomeButtonType=%ld"), -[TUScreenShareAttributes deviceHomeButtonType](self, "deviceHomeButtonType"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" style=%ld"), -[TUScreenShareAttributes style](self, "style"));
  -[TUScreenShareAttributes displayScale](self, "displayScale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" displayScale=%@"), v4);

  -[TUScreenShareAttributes scaleFactor](self, "scaleFactor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" scaleFactor=%@"), v5);

  -[TUScreenShareAttributes cornerRadius](self, "cornerRadius");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" cornerRadius=%@"), v6);

  -[TUScreenShareAttributes displayID](self, "displayID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" displayID=%@"), v7);

  -[TUScreenShareAttributes frameRate](self, "frameRate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" frameRate=%@"), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR(" windowed=%d"), -[TUScreenShareAttributes isWindowed](self, "isWindowed"));
  -[TUScreenShareAttributes windowUUID](self, "windowUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" windowUUID=%@"), v9);

  -[TUScreenShareAttributes systemRootLayerTransform](self, "systemRootLayerTransform");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" systemRootLayerTransform=%@"), v10);

  -[TUScreenShareAttributes originalResolution](self, "originalResolution");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" originalResolution=%@"), v11);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v12 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v12;
}

+ (int64_t)currentDeviceFamily
{
  void *v2;
  uint64_t v3;
  int64_t v4;

  objc_msgSend((id)CUTWeakLinkClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceType");
  if (v3 == 4)
    v4 = 3;
  else
    v4 = 2 * (v3 == 2);

  return v4;
}

+ (int64_t)currentDeviceHomeButtonType
{
  void *v2;
  unsigned int homeButtonType;
  int64_t v4;

  MobileGestalt_get_current_device();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  homeButtonType = MobileGestalt_get_homeButtonType();
  if (homeButtonType < 3)
    v4 = homeButtonType + 1;
  else
    v4 = 0;

  return v4;
}

+ (NSNumber)defaultDisplayScale
{
  return (NSNumber *)&unk_1E38E9920;
}

+ (NSNumber)defaultScaleFactor
{
  return (NSNumber *)&unk_1E38E9930;
}

+ (NSNumber)defaultCornerRadius
{
  void *v2;
  void *v3;
  void *v4;

  MobileGestalt_get_current_device();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  MobileGestalt_get_deviceCornerRadius();
  objc_msgSend(v3, "numberWithFloat:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

+ (NSValue)defaultSystemRootLayerTransform
{
  __int128 v2;
  _OWORD v4[3];

  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGAffineTransform:", v4);
  return (NSValue *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isSignificantChangeFromAttributes:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;

  v4 = a3;
  v5 = -[TUScreenShareAttributes style](self, "style");
  if (v5 == objc_msgSend(v4, "style"))
  {
    -[TUScreenShareAttributes displayScale](self, "displayScale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayScale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUNumbersAreEqualOrNil((unint64_t)v6, (uint64_t)v7))
    {
      -[TUScreenShareAttributes displayID](self, "displayID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "displayID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (TUNumbersAreEqualOrNil((unint64_t)v8, (uint64_t)v9))
      {
        -[TUScreenShareAttributes systemRootLayerTransform](self, "systemRootLayerTransform");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "systemRootLayerTransform");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = TUObjectsAreEqualOrNil((unint64_t)v10, (uint64_t)v11) ^ 1;

      }
      else
      {
        LOBYTE(v12) = 1;
      }

    }
    else
    {
      LOBYTE(v12) = 1;
    }

  }
  else
  {
    LOBYTE(v12) = 1;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TUScreenShareAttributes isEqualToScreenShareAttributes:](self, "isEqualToScreenShareAttributes:", v4);

  return v5;
}

- (BOOL)isEqualToScreenShareAttributes:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _BOOL4 v19;
  int v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = a3;
  v5 = -[TUScreenShareAttributes deviceFamily](self, "deviceFamily");
  if (v5 == objc_msgSend(v4, "deviceFamily")
    && (v6 = -[TUScreenShareAttributes deviceHomeButtonType](self, "deviceHomeButtonType"),
        v6 == objc_msgSend(v4, "deviceHomeButtonType"))
    && (v7 = -[TUScreenShareAttributes style](self, "style"), v7 == objc_msgSend(v4, "style")))
  {
    -[TUScreenShareAttributes displayScale](self, "displayScale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayScale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUObjectsAreEqualOrNil((unint64_t)v8, (uint64_t)v9))
    {
      -[TUScreenShareAttributes scaleFactor](self, "scaleFactor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "scaleFactor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (TUObjectsAreEqualOrNil((unint64_t)v10, (uint64_t)v11))
      {
        -[TUScreenShareAttributes cornerRadius](self, "cornerRadius");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "cornerRadius");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (TUObjectsAreEqualOrNil((unint64_t)v12, (uint64_t)v13))
        {
          -[TUScreenShareAttributes originalResolution](self, "originalResolution");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "originalResolution");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (TUObjectsAreEqualOrNil((unint64_t)v14, (uint64_t)v15))
          {
            v28 = v14;
            -[TUScreenShareAttributes displayID](self, "displayID");
            v16 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "displayID");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = (void *)v16;
            if (TUObjectsAreEqualOrNil(v16, (uint64_t)v29))
            {
              -[TUScreenShareAttributes frameRate](self, "frameRate");
              v17 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "frameRate");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = (void *)v17;
              if (TUObjectsAreEqualOrNil(v17, (uint64_t)v26))
              {
                -[TUScreenShareAttributes windowUUID](self, "windowUUID");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "windowUUID");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (TUObjectsAreEqualOrNil((unint64_t)v25, (uint64_t)v24))
                {
                  -[TUScreenShareAttributes systemRootLayerTransform](self, "systemRootLayerTransform");
                  v18 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "systemRootLayerTransform");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = (void *)v18;
                  if (TUObjectsAreEqualOrNil(v18, (uint64_t)v22))
                  {
                    v19 = -[TUScreenShareAttributes isWindowed](self, "isWindowed");
                    v20 = v19 ^ objc_msgSend(v4, "isWindowed") ^ 1;
                  }
                  else
                  {
                    LOBYTE(v20) = 0;
                  }
                  v14 = v28;

                }
                else
                {
                  LOBYTE(v20) = 0;
                  v14 = v28;
                }

              }
              else
              {
                LOBYTE(v20) = 0;
                v14 = v28;
              }

            }
            else
            {
              LOBYTE(v20) = 0;
              v14 = v28;
            }

          }
          else
          {
            LOBYTE(v20) = 0;
          }

        }
        else
        {
          LOBYTE(v20) = 0;
        }

      }
      else
      {
        LOBYTE(v20) = 0;
      }

    }
    else
    {
      LOBYTE(v20) = 0;
    }

  }
  else
  {
    LOBYTE(v20) = 0;
  }

  return v20;
}

- (unint64_t)hash
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _BOOL4 v21;
  uint64_t v22;
  unint64_t v23;
  void *v25;

  v3 = -[TUScreenShareAttributes deviceFamily](self, "deviceFamily");
  v4 = -[TUScreenShareAttributes deviceHomeButtonType](self, "deviceHomeButtonType") ^ v3;
  v5 = v4 ^ -[TUScreenShareAttributes style](self, "style");
  -[TUScreenShareAttributes displayScale](self, "displayScale");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v25, "hash");
  -[TUScreenShareAttributes scaleFactor](self, "scaleFactor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5 ^ v6 ^ objc_msgSend(v7, "hash");
  -[TUScreenShareAttributes cornerRadius](self, "cornerRadius");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  -[TUScreenShareAttributes originalResolution](self, "originalResolution");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");
  -[TUScreenShareAttributes displayID](self, "displayID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8 ^ v12 ^ objc_msgSend(v13, "hash");
  -[TUScreenShareAttributes frameRate](self, "frameRate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hash");
  -[TUScreenShareAttributes windowUUID](self, "windowUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");
  -[TUScreenShareAttributes systemRootLayerTransform](self, "systemRootLayerTransform");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");
  v21 = -[TUScreenShareAttributes isWindowed](self, "isWindowed");
  v22 = 1237;
  if (v21)
    v22 = 1231;
  v23 = v14 ^ v20 ^ v22;

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUScreenShareAttributes)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSNumber *v10;
  NSNumber *displayScale;
  uint64_t v12;
  void *v13;
  NSNumber *v14;
  NSNumber *scaleFactor;
  uint64_t v16;
  void *v17;
  NSNumber *v18;
  NSNumber *cornerRadius;
  uint64_t v20;
  void *v21;
  NSValue *v22;
  NSValue *originalResolution;
  uint64_t v24;
  void *v25;
  NSNumber *v26;
  NSNumber *frameRate;
  uint64_t v28;
  void *v29;
  NSNumber *v30;
  NSNumber *displayID;
  void *v32;
  uint64_t v33;
  void *v34;
  NSUUID *v35;
  NSUUID *windowUUID;
  uint64_t v37;
  void *v38;
  NSValue *v39;
  NSValue *systemRootLayerTransform;

  v4 = a3;
  NSStringFromSelector(sel_deviceFamily);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_deviceFamily = objc_msgSend(v4, "decodeIntegerForKey:", v5);

  NSStringFromSelector(sel_deviceHomeButtonType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_deviceHomeButtonType = objc_msgSend(v4, "decodeIntegerForKey:", v6);

  NSStringFromSelector(sel_style);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_style = objc_msgSend(v4, "decodeIntegerForKey:", v7);

  v8 = objc_opt_class();
  NSStringFromSelector(sel_displayScale);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  displayScale = self->_displayScale;
  self->_displayScale = v10;

  v12 = objc_opt_class();
  NSStringFromSelector(sel_scaleFactor);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v13);
  v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  scaleFactor = self->_scaleFactor;
  self->_scaleFactor = v14;

  v16 = objc_opt_class();
  NSStringFromSelector(sel_cornerRadius);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, v17);
  v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  cornerRadius = self->_cornerRadius;
  self->_cornerRadius = v18;

  v20 = objc_opt_class();
  NSStringFromSelector(sel_originalResolution);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v20, v21);
  v22 = (NSValue *)objc_claimAutoreleasedReturnValue();
  originalResolution = self->_originalResolution;
  self->_originalResolution = v22;

  v24 = objc_opt_class();
  NSStringFromSelector(sel_frameRate);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v24, v25);
  v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  frameRate = self->_frameRate;
  self->_frameRate = v26;

  v28 = objc_opt_class();
  NSStringFromSelector(sel_displayID);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v28, v29);
  v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  displayID = self->_displayID;
  self->_displayID = v30;

  NSStringFromSelector(sel_isWindowed);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  self->_windowed = objc_msgSend(v4, "decodeBoolForKey:", v32);

  v33 = objc_opt_class();
  NSStringFromSelector(sel_windowUUID);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v33, v34);
  v35 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  windowUUID = self->_windowUUID;
  self->_windowUUID = v35;

  v37 = objc_opt_class();
  NSStringFromSelector(sel_systemRootLayerTransform);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v37, v38);
  v39 = (NSValue *)objc_claimAutoreleasedReturnValue();

  systemRootLayerTransform = self->_systemRootLayerTransform;
  self->_systemRootLayerTransform = v39;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  int64_t v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v4 = a3;
  v5 = -[TUScreenShareAttributes deviceFamily](self, "deviceFamily");
  NSStringFromSelector(sel_deviceFamily);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, v6);

  v7 = -[TUScreenShareAttributes deviceHomeButtonType](self, "deviceHomeButtonType");
  NSStringFromSelector(sel_deviceHomeButtonType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v7, v8);

  v9 = -[TUScreenShareAttributes style](self, "style");
  NSStringFromSelector(sel_style);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v9, v10);

  -[TUScreenShareAttributes displayScale](self, "displayScale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_displayScale);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[TUScreenShareAttributes scaleFactor](self, "scaleFactor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_scaleFactor);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[TUScreenShareAttributes cornerRadius](self, "cornerRadius");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_cornerRadius);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v16);

  -[TUScreenShareAttributes frameRate](self, "frameRate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_frameRate);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, v18);

  -[TUScreenShareAttributes displayID](self, "displayID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_displayID);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, v20);

  v21 = -[TUScreenShareAttributes isWindowed](self, "isWindowed");
  NSStringFromSelector(sel_isWindowed);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v21, v22);

  -[TUScreenShareAttributes windowUUID](self, "windowUUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_windowUUID);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, v24);

  -[TUScreenShareAttributes originalResolution](self, "originalResolution");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_originalResolution);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, v26);

  -[TUScreenShareAttributes systemRootLayerTransform](self, "systemRootLayerTransform");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_systemRootLayerTransform);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, v27);

}

- (int64_t)deviceFamily
{
  return self->_deviceFamily;
}

- (void)setDeviceFamily:(int64_t)a3
{
  self->_deviceFamily = a3;
}

- (int64_t)deviceHomeButtonType
{
  return self->_deviceHomeButtonType;
}

- (void)setDeviceHomeButtonType:(int64_t)a3
{
  self->_deviceHomeButtonType = a3;
}

- (NSNumber)displayID
{
  return self->_displayID;
}

- (void)setDisplayID:(id)a3
{
  objc_storeStrong((id *)&self->_displayID, a3);
}

- (NSNumber)displayScale
{
  return self->_displayScale;
}

- (void)setDisplayScale:(id)a3
{
  objc_storeStrong((id *)&self->_displayScale, a3);
}

- (NSNumber)frameRate
{
  return self->_frameRate;
}

- (void)setFrameRate:(id)a3
{
  objc_storeStrong((id *)&self->_frameRate, a3);
}

- (NSValue)originalResolution
{
  return self->_originalResolution;
}

- (void)setOriginalResolution:(id)a3
{
  objc_storeStrong((id *)&self->_originalResolution, a3);
}

- (NSNumber)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(id)a3
{
  objc_storeStrong((id *)&self->_scaleFactor, a3);
}

- (NSNumber)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(id)a3
{
  objc_storeStrong((id *)&self->_cornerRadius, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (BOOL)isWindowed
{
  return self->_windowed;
}

- (void)setWindowed:(BOOL)a3
{
  self->_windowed = a3;
}

- (NSUUID)windowUUID
{
  return self->_windowUUID;
}

- (void)setWindowUUID:(id)a3
{
  objc_storeStrong((id *)&self->_windowUUID, a3);
}

- (NSValue)systemRootLayerTransform
{
  return self->_systemRootLayerTransform;
}

- (void)setSystemRootLayerTransform:(id)a3
{
  objc_storeStrong((id *)&self->_systemRootLayerTransform, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemRootLayerTransform, 0);
  objc_storeStrong((id *)&self->_windowUUID, 0);
  objc_storeStrong((id *)&self->_cornerRadius, 0);
  objc_storeStrong((id *)&self->_scaleFactor, 0);
  objc_storeStrong((id *)&self->_originalResolution, 0);
  objc_storeStrong((id *)&self->_frameRate, 0);
  objc_storeStrong((id *)&self->_displayScale, 0);
  objc_storeStrong((id *)&self->_displayID, 0);
}

@end
