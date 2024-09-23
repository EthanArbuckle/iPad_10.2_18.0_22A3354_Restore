@implementation PRSPosterSnapshotCollection

- (PRSPosterSnapshotCollection)initWithPrimaryLayersSnapshot:(id)a3 floatingLayerSnapshot:(id)a4 snapshotScale:(double)a5 interfaceStyle:(int64_t)a6 accessibilityContrast:(int64_t)a7 interfaceOrientation:(int64_t)a8 displayIdentity:(id)a9
{
  id v17;
  id v18;
  id v19;
  PRSPosterSnapshotCollection *v20;
  PRSPosterSnapshotCollection *v21;
  FBSDisplayIdentity *v22;
  FBSDisplayIdentity *snapshotDisplayIdentity;
  uint64_t v24;
  FBSDisplayIdentity *v25;
  objc_super v27;

  v17 = a3;
  v18 = a4;
  v19 = a9;
  v27.receiver = self;
  v27.super_class = (Class)PRSPosterSnapshotCollection;
  v20 = -[PRSPosterSnapshotCollection init](&v27, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_primaryLayersSnapshot, a3);
    objc_storeStrong((id *)&v21->_floatingLayerSnapshot, a4);
    v21->_snapshotScale = a5;
    v21->_interfaceStyle = a6;
    v21->_accessibilityContrast = a7;
    if (v19)
    {
      v22 = (FBSDisplayIdentity *)v19;
      snapshotDisplayIdentity = v21->_snapshotDisplayIdentity;
      v21->_snapshotDisplayIdentity = v22;
    }
    else
    {
      snapshotDisplayIdentity = (FBSDisplayIdentity *)objc_alloc_init(MEMORY[0x1E0D23100]);
      -[FBSDisplayIdentity mainIdentity](snapshotDisplayIdentity, "mainIdentity");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v21->_snapshotDisplayIdentity;
      v21->_snapshotDisplayIdentity = (FBSDisplayIdentity *)v24;

    }
    v21->_interfaceOrientation = a8;
    -[PRSPosterSnapshotCollection _populateInterfaceOrientationFromSurfacesIfPossible](v21, "_populateInterfaceOrientationFromSurfacesIfPossible");
  }

  return v21;
}

- (PRSPosterSnapshotCollection)initWithPrimaryLayersSnapshot:(id)a3 floatingLayerSnapshot:(id)a4 snapshotScale:(double)a5 interfaceStyle:(int64_t)a6 accessibilityContrast:(int64_t)a7
{
  return -[PRSPosterSnapshotCollection initWithPrimaryLayersSnapshot:floatingLayerSnapshot:snapshotScale:interfaceStyle:accessibilityContrast:interfaceOrientation:displayIdentity:](self, "initWithPrimaryLayersSnapshot:floatingLayerSnapshot:snapshotScale:interfaceStyle:accessibilityContrast:interfaceOrientation:displayIdentity:", a3, a4, a6, a7, 0, 0, a5);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  PRSPosterSnapshot *primaryLayersSnapshot;
  id v5;

  primaryLayersSnapshot = self->_primaryLayersSnapshot;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", primaryLayersSnapshot, CFSTR("primaryLayersSnapshot"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_floatingLayerSnapshot, CFSTR("floatingLayerSnapshot"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("snapshotScale"), self->_snapshotScale);
  objc_msgSend(v5, "encodeInt64:forKey:", self->_interfaceStyle, CFSTR("interfaceStyle"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_accessibilityContrast, CFSTR("accessibilityContrast"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_snapshotDisplayIdentity, CFSTR("snapshotDisplayIdentity"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_interfaceOrientation, CFSTR("interfaceOrientation"));

}

- (PRSPosterSnapshotCollection)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int64_t interfaceOrientation;
  PRSPosterSnapshotCollection *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v18;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryLayersSnapshot"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("floatingLayerSnapshot"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("snapshotScale"));
    v8 = v7;
    v9 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("interfaceStyle"));
    v10 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("accessibilityContrast"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("snapshotDisplayIdentity"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    interfaceOrientation = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("interfaceOrientation"));
    if ((unint64_t)(interfaceOrientation - 1) >= 2)
    {
      if (-[PRSPosterSnapshotCollection _populateInterfaceOrientationFromSurfacesIfPossible](self, "_populateInterfaceOrientationFromSurfacesIfPossible"))
      {
        interfaceOrientation = self->_interfaceOrientation;
      }
      else
      {
        objc_msgSend(v5, "surface");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v14, "width");
        objc_msgSend(v5, "surface");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "height");

        if (v18 <= v16)
          interfaceOrientation = 1;
        else
          interfaceOrientation = 2;
      }
    }
    self = -[PRSPosterSnapshotCollection initWithPrimaryLayersSnapshot:floatingLayerSnapshot:snapshotScale:interfaceStyle:accessibilityContrast:interfaceOrientation:displayIdentity:](self, "initWithPrimaryLayersSnapshot:floatingLayerSnapshot:snapshotScale:interfaceStyle:accessibilityContrast:interfaceOrientation:displayIdentity:", v5, v6, v9, v10, interfaceOrientation, v11, v8);

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_populateInterfaceOrientationFromSurfacesIfPossible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int IsPortrait;
  int64_t v16;

  -[PRSPosterSnapshot surface](self->_primaryLayersSnapshot, "surface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getkPaperboardIOSurfaceDeviceOrientationPropertiesKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    getkPaperboardIOSurfaceDeviceOrientationPropertiesKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attachmentForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unsignedIntegerValue");

    v8 = 1;
    if (BSInterfaceOrientationIsPortrait())
      v9 = 1;
    else
      v9 = 2;
    self->_interfaceOrientation = v9;
  }
  else
  {
    -[PRSPosterSnapshot surface](self->_floatingLayerSnapshot, "surface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    getkPaperboardIOSurfaceDeviceOrientationPropertiesKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attachmentForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v12 != 0;
    if (v12)
    {
      getkPaperboardIOSurfaceDeviceOrientationPropertiesKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "attachmentForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "unsignedIntegerValue");

      IsPortrait = BSInterfaceOrientationIsPortrait();
      v16 = 1;
      if (!IsPortrait)
        v16 = 2;
      self->_interfaceOrientation = v16;
    }

  }
  return v8;
}

- (PRSPosterSnapshot)primaryLayersSnapshot
{
  return self->_primaryLayersSnapshot;
}

- (PRSPosterSnapshot)floatingLayerSnapshot
{
  return self->_floatingLayerSnapshot;
}

- (FBSDisplayIdentity)snapshotDisplayIdentity
{
  return self->_snapshotDisplayIdentity;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (double)snapshotScale
{
  return self->_snapshotScale;
}

- (int64_t)interfaceStyle
{
  return self->_interfaceStyle;
}

- (int64_t)accessibilityContrast
{
  return self->_accessibilityContrast;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotDisplayIdentity, 0);
  objc_storeStrong((id *)&self->_floatingLayerSnapshot, 0);
  objc_storeStrong((id *)&self->_primaryLayersSnapshot, 0);
}

@end
