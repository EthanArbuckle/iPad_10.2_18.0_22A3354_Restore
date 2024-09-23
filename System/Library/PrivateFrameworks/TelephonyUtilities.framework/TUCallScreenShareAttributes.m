@implementation TUCallScreenShareAttributes

+ (id)defaultAttributes
{
  TUCallScreenShareAttributes *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(TUCallScreenShareAttributes);
  -[TUCallScreenShareAttributes setStyle:](v3, "setStyle:", 0);
  -[TUCallScreenShareAttributes setDeviceFamily:](v3, "setDeviceFamily:", objc_msgSend(a1, "currentDeviceFamily"));
  -[TUCallScreenShareAttributes setDeviceHomeButtonType:](v3, "setDeviceHomeButtonType:", objc_msgSend(a1, "currentDeviceHomeButtonType"));
  objc_msgSend(a1, "defaultDisplayScale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallScreenShareAttributes setDisplayScale:](v3, "setDisplayScale:", v4);

  objc_msgSend(a1, "defaultScaleFactor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallScreenShareAttributes setScaleFactor:](v3, "setScaleFactor:", v5);

  objc_msgSend(a1, "defaultCornerRadius");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallScreenShareAttributes setCornerRadius:](v3, "setCornerRadius:", v6);

  objc_msgSend(a1, "defaultSystemRootLayerTransform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallScreenShareAttributes setSystemRootLayerTransform:](v3, "setSystemRootLayerTransform:", v7);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", 0.0, 0.0, 0.0, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallScreenShareAttributes setOriginalResolution:](v3, "setOriginalResolution:", v8);

  return v3;
}

- (TUCallScreenShareAttributes)initWithAttributes:(id)a3
{
  id v4;
  TUCallScreenShareAttributes *v5;
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
  v21.super_class = (Class)TUCallScreenShareAttributes;
  v5 = -[TUCallScreenShareAttributes init](&v21, sel_init);
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
  objc_msgSend(v3, "appendFormat:", CFSTR(" deviceFamily=%ld"), -[TUCallScreenShareAttributes deviceFamily](self, "deviceFamily"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" deviceHomeButtonType=%ld"), -[TUCallScreenShareAttributes deviceHomeButtonType](self, "deviceHomeButtonType"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" style=%ld"), -[TUCallScreenShareAttributes style](self, "style"));
  -[TUCallScreenShareAttributes displayScale](self, "displayScale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" displayScale=%@"), v4);

  -[TUCallScreenShareAttributes scaleFactor](self, "scaleFactor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" scaleFactor=%@"), v5);

  -[TUCallScreenShareAttributes cornerRadius](self, "cornerRadius");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" cornerRadius=%@"), v6);

  -[TUCallScreenShareAttributes displayID](self, "displayID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" displayID=%@"), v7);

  -[TUCallScreenShareAttributes frameRate](self, "frameRate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" frameRate=%@"), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR(" windowed=%d"), -[TUCallScreenShareAttributes isWindowed](self, "isWindowed"));
  -[TUCallScreenShareAttributes windowUUID](self, "windowUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" windowUUID=%@"), v9);

  -[TUCallScreenShareAttributes systemRootLayerTransform](self, "systemRootLayerTransform");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" systemRootLayerTransform=%@"), v10);

  -[TUCallScreenShareAttributes originalResolution](self, "originalResolution");
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
  return (NSNumber *)&unk_1E38E9900;
}

+ (NSNumber)defaultScaleFactor
{
  return (NSNumber *)&unk_1E38E9910;
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
  v5 = -[TUCallScreenShareAttributes style](self, "style");
  if (v5 == objc_msgSend(v4, "style"))
  {
    -[TUCallScreenShareAttributes displayScale](self, "displayScale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayScale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUNumbersAreEqualOrNil((unint64_t)v6, (uint64_t)v7))
    {
      -[TUCallScreenShareAttributes displayID](self, "displayID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "displayID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (TUNumbersAreEqualOrNil((unint64_t)v8, (uint64_t)v9))
      {
        -[TUCallScreenShareAttributes systemRootLayerTransform](self, "systemRootLayerTransform");
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
    && -[TUCallScreenShareAttributes isEqualToScreenShareAttributes:](self, "isEqualToScreenShareAttributes:", v4);

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
  v5 = -[TUCallScreenShareAttributes deviceFamily](self, "deviceFamily");
  if (v5 == objc_msgSend(v4, "deviceFamily")
    && (v6 = -[TUCallScreenShareAttributes deviceHomeButtonType](self, "deviceHomeButtonType"),
        v6 == objc_msgSend(v4, "deviceHomeButtonType"))
    && (v7 = -[TUCallScreenShareAttributes style](self, "style"), v7 == objc_msgSend(v4, "style")))
  {
    -[TUCallScreenShareAttributes displayScale](self, "displayScale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayScale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUObjectsAreEqualOrNil((unint64_t)v8, (uint64_t)v9))
    {
      -[TUCallScreenShareAttributes scaleFactor](self, "scaleFactor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "scaleFactor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (TUObjectsAreEqualOrNil((unint64_t)v10, (uint64_t)v11))
      {
        -[TUCallScreenShareAttributes cornerRadius](self, "cornerRadius");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "cornerRadius");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (TUObjectsAreEqualOrNil((unint64_t)v12, (uint64_t)v13))
        {
          -[TUCallScreenShareAttributes originalResolution](self, "originalResolution");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "originalResolution");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (TUObjectsAreEqualOrNil((unint64_t)v14, (uint64_t)v15))
          {
            v28 = v14;
            -[TUCallScreenShareAttributes displayID](self, "displayID");
            v16 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "displayID");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = (void *)v16;
            if (TUObjectsAreEqualOrNil(v16, (uint64_t)v29))
            {
              -[TUCallScreenShareAttributes frameRate](self, "frameRate");
              v17 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "frameRate");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = (void *)v17;
              if (TUObjectsAreEqualOrNil(v17, (uint64_t)v26))
              {
                -[TUCallScreenShareAttributes windowUUID](self, "windowUUID");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "windowUUID");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (TUObjectsAreEqualOrNil((unint64_t)v25, (uint64_t)v24))
                {
                  -[TUCallScreenShareAttributes systemRootLayerTransform](self, "systemRootLayerTransform");
                  v18 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "systemRootLayerTransform");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = (void *)v18;
                  if (TUObjectsAreEqualOrNil(v18, (uint64_t)v22))
                  {
                    v19 = -[TUCallScreenShareAttributes isWindowed](self, "isWindowed");
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

- (void)setResolutionAttributesWithContentScale:(id)a3 contentRect:(id)a4 displayScale:(id)a5
{
  NSNumber *v8;
  NSNumber *v9;
  NSNumber *scaleFactor;
  id v11;
  NSNumber *displayScale;
  NSNumber *v13;
  NSValue *v14;
  NSValue *originalResolution;
  NSNumber *v16;

  v8 = (NSNumber *)a3;
  v9 = (NSNumber *)a5;
  scaleFactor = self->_scaleFactor;
  self->_scaleFactor = v8;
  v16 = v8;
  v11 = a4;

  displayScale = self->_displayScale;
  self->_displayScale = v9;
  v13 = v9;

  +[TUCallScreenShareAttributes originalResolutionWithContentScale:contentRect:displayScale:](TUCallScreenShareAttributes, "originalResolutionWithContentScale:contentRect:displayScale:", v16, v11, v13);
  v14 = (NSValue *)objc_claimAutoreleasedReturnValue();

  originalResolution = self->_originalResolution;
  self->_originalResolution = v14;

}

+ (id)originalResolutionWithContentScale:(id)a3 contentRect:(id)a4 displayScale:(id)a5
{
  void *v5;
  id v8;
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

  v5 = 0;
  if (a3 && a4 && a5)
  {
    v8 = a5;
    v9 = a3;
    objc_msgSend(a4, "rectValue");
    v11 = v10;
    v13 = v12;
    objc_msgSend(v9, "doubleValue");
    v15 = v11 / v14;
    objc_msgSend(v8, "doubleValue");
    v17 = v16 * v15;
    objc_msgSend(v9, "doubleValue");
    v19 = v18;

    v20 = v13 / v19;
    objc_msgSend(v8, "doubleValue");
    v22 = v21;

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", 0.0, 0.0, v17, v20 * v22);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
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

  v3 = -[TUCallScreenShareAttributes deviceFamily](self, "deviceFamily");
  v4 = -[TUCallScreenShareAttributes deviceHomeButtonType](self, "deviceHomeButtonType") ^ v3;
  v5 = v4 ^ -[TUCallScreenShareAttributes style](self, "style");
  -[TUCallScreenShareAttributes displayScale](self, "displayScale");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v25, "hash");
  -[TUCallScreenShareAttributes scaleFactor](self, "scaleFactor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5 ^ v6 ^ objc_msgSend(v7, "hash");
  -[TUCallScreenShareAttributes cornerRadius](self, "cornerRadius");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  -[TUCallScreenShareAttributes originalResolution](self, "originalResolution");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");
  -[TUCallScreenShareAttributes displayID](self, "displayID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8 ^ v12 ^ objc_msgSend(v13, "hash");
  -[TUCallScreenShareAttributes frameRate](self, "frameRate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hash");
  -[TUCallScreenShareAttributes systemRootLayerTransform](self, "systemRootLayerTransform");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");
  -[TUCallScreenShareAttributes windowUUID](self, "windowUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");
  v21 = -[TUCallScreenShareAttributes isWindowed](self, "isWindowed");
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

- (TUCallScreenShareAttributes)initWithCoder:(id)a3
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
  v5 = -[TUCallScreenShareAttributes deviceFamily](self, "deviceFamily");
  NSStringFromSelector(sel_deviceFamily);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, v6);

  v7 = -[TUCallScreenShareAttributes deviceHomeButtonType](self, "deviceHomeButtonType");
  NSStringFromSelector(sel_deviceHomeButtonType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v7, v8);

  v9 = -[TUCallScreenShareAttributes style](self, "style");
  NSStringFromSelector(sel_style);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v9, v10);

  -[TUCallScreenShareAttributes displayScale](self, "displayScale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_displayScale);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[TUCallScreenShareAttributes scaleFactor](self, "scaleFactor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_scaleFactor);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[TUCallScreenShareAttributes cornerRadius](self, "cornerRadius");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_cornerRadius);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v16);

  -[TUCallScreenShareAttributes frameRate](self, "frameRate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_frameRate);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, v18);

  -[TUCallScreenShareAttributes displayID](self, "displayID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_displayID);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, v20);

  v21 = -[TUCallScreenShareAttributes isWindowed](self, "isWindowed");
  NSStringFromSelector(sel_isWindowed);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v21, v22);

  -[TUCallScreenShareAttributes windowUUID](self, "windowUUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_windowUUID);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, v24);

  -[TUCallScreenShareAttributes originalResolution](self, "originalResolution");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_originalResolution);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, v26);

  -[TUCallScreenShareAttributes systemRootLayerTransform](self, "systemRootLayerTransform");
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

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSNumber)displayScale
{
  return self->_displayScale;
}

- (void)setDisplayScale:(id)a3
{
  objc_storeStrong((id *)&self->_displayScale, a3);
}

- (NSValue)systemRootLayerTransform
{
  return self->_systemRootLayerTransform;
}

- (void)setSystemRootLayerTransform:(id)a3
{
  objc_storeStrong((id *)&self->_systemRootLayerTransform, a3);
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

- (NSNumber)frameRate
{
  return self->_frameRate;
}

- (void)setFrameRate:(id)a3
{
  objc_storeStrong((id *)&self->_frameRate, a3);
}

- (NSNumber)displayID
{
  return self->_displayID;
}

- (void)setDisplayID:(id)a3
{
  objc_storeStrong((id *)&self->_displayID, a3);
}

- (NSValue)originalResolution
{
  return self->_originalResolution;
}

- (void)setOriginalResolution:(id)a3
{
  objc_storeStrong((id *)&self->_originalResolution, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowUUID, 0);
  objc_storeStrong((id *)&self->_originalResolution, 0);
  objc_storeStrong((id *)&self->_displayID, 0);
  objc_storeStrong((id *)&self->_frameRate, 0);
  objc_storeStrong((id *)&self->_cornerRadius, 0);
  objc_storeStrong((id *)&self->_scaleFactor, 0);
  objc_storeStrong((id *)&self->_systemRootLayerTransform, 0);
  objc_storeStrong((id *)&self->_displayScale, 0);
}

@end
