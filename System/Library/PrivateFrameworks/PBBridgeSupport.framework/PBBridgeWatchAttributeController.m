@implementation PBBridgeWatchAttributeController

- (unint64_t)size
{
  return SizeForInternalSize(self->_internalSize);
}

- (unint64_t)fallbackMaterialForSize:(unint64_t)a3
{
  unint64_t v3;

  v3 = 3;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0x14)
    v3 = 22;
  if (a3 == 19)
    return 14;
  else
    return v3;
}

void __58__PBBridgeWatchAttributeController_sharedDeviceController__block_invoke()
{
  PBBridgeWatchAttributeController *v0;
  void *v1;

  v0 = objc_alloc_init(PBBridgeWatchAttributeController);
  v1 = (void *)sharedDeviceController___material;
  sharedDeviceController___material = (uint64_t)v0;

}

- (PBBridgeWatchAttributeController)init
{
  PBBridgeWatchAttributeController *v2;
  NSCache *v3;
  NSCache *stringCache;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  unint64_t hardwareBehavior;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)PBBridgeWatchAttributeController;
  v2 = -[PBBridgeWatchAttributeController init](&v29, sel_init);
  if (v2)
  {
    if (_IsSetup_onceToken != -1)
      dispatch_once(&_IsSetup_onceToken, &__block_literal_global_194_0);
    if (_IsSetup___isSetup)
    {
      v3 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
      stringCache = v2->_stringCache;
      v2->_stringCache = v3;

      v5 = (void *)MGCopyAnswer();
      v6 = objc_msgSend(v5, "integerValue");
      pbb_setup_log();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v8)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2113B6000, v7, OS_LOG_TYPE_DEFAULT, "Device is CLHS Type", buf, 2u);
        }

        -[PBBridgeWatchAttributeController _setMaterialWithCLHSValue:](v2, "_setMaterialWithCLHSValue:", v6);
      }
      else
      {
        if (v8)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2113B6000, v7, OS_LOG_TYPE_DEFAULT, "Device is DMin Type", buf, 2u);
        }

        -[PBBridgeWatchAttributeController getGestaltDmin](v2, "getGestaltDmin");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PBBridgeWatchAttributeController _populateMaterialDetailsWithDMinProperties:](v2, "_populateMaterialDetailsWithDMinProperties:", v9);

      }
      v10 = (void *)MGCopyAnswer();
      v2->_hardwareBehavior = objc_msgSend(v10, "integerValue");
      if (MGGetBoolAnswer())
      {
        v11 = (void *)MGCopyAnswer();
        objc_msgSend(v11, "objectForKey:", CFSTR("ArtworkDeviceSubType"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "unsignedIntegerValue");
        v13 = NRDeviceSizeForArtworkDeviceSubType() - 1;
        hardwareBehavior = v2->_hardwareBehavior;
        switch(v13)
        {
          case 0:
            v15 = 5;
            if (hardwareBehavior != 2)
              v15 = 1;
            v16 = hardwareBehavior == 1;
            v17 = 3;
            goto LABEL_36;
          case 1:
            v15 = 2;
            if (hardwareBehavior == 2)
              v15 = 6;
            v16 = hardwareBehavior == 1;
            v17 = 4;
            goto LABEL_36;
          case 2:
            v15 = 7;
            if (hardwareBehavior == 2)
              v15 = 11;
            v16 = hardwareBehavior == 1;
            v17 = 9;
            goto LABEL_36;
          case 3:
            v15 = 8;
            if (hardwareBehavior == 2)
              v15 = 12;
            v16 = hardwareBehavior == 1;
            v17 = 10;
            goto LABEL_36;
          case 4:
            v15 = 14;
            if (hardwareBehavior == 2)
              v15 = 18;
            v16 = hardwareBehavior == 1;
            v17 = 16;
            goto LABEL_36;
          case 5:
            v15 = 13;
            if (hardwareBehavior == 2)
              v15 = 17;
            v16 = hardwareBehavior == 1;
            v17 = 15;
LABEL_36:
            if (!v16)
              v17 = v15;
            break;
          case 6:
            v22 = hardwareBehavior == 1;
            v17 = 19;
            v23 = 24;
            goto LABEL_42;
          case 7:
            v22 = hardwareBehavior == 1;
            v17 = 20;
            v23 = 22;
            goto LABEL_42;
          case 8:
            v22 = hardwareBehavior == 1;
            v17 = 21;
            v23 = 23;
LABEL_42:
            if (v22)
              v17 = v23;
            break;
          default:
            v17 = 0;
            break;
        }
        v2->_internalSize = v17;

      }
      else
      {
        v11 = (void *)MGCopyAnswer();
        v18 = v2->_hardwareBehavior;
        switch(NRDeviceSizeForProductType())
        {
          case 1u:
            v19 = 5;
            if (v18 != 2)
              v19 = 1;
            v20 = v18 == 1;
            v21 = 3;
            goto LABEL_63;
          case 2u:
            v19 = 2;
            if (v18 == 2)
              v19 = 6;
            v20 = v18 == 1;
            v21 = 4;
            goto LABEL_63;
          case 3u:
            v19 = 7;
            if (v18 == 2)
              v19 = 11;
            v20 = v18 == 1;
            v21 = 9;
            goto LABEL_63;
          case 4u:
            v19 = 8;
            if (v18 == 2)
              v19 = 12;
            v20 = v18 == 1;
            v21 = 10;
            goto LABEL_63;
          case 5u:
            v19 = 14;
            if (v18 == 2)
              v19 = 18;
            v20 = v18 == 1;
            v21 = 16;
            goto LABEL_63;
          case 6u:
            v19 = 13;
            if (v18 == 2)
              v19 = 17;
            v20 = v18 == 1;
            v21 = 15;
            goto LABEL_63;
          case 7u:
            v20 = v18 == 1;
            v19 = 19;
            v21 = 24;
            goto LABEL_63;
          case 8u:
            v20 = v18 == 1;
            v19 = 20;
            v21 = 22;
            goto LABEL_63;
          case 9u:
            v20 = v18 == 1;
            v19 = 21;
            v21 = 23;
LABEL_63:
            if (v20)
              v24 = v21;
            else
              v24 = v19;
            break;
          default:
            v24 = 0;
            break;
        }
        v2->_internalSize = v24;
        +[PBBridgeCAReporter recordMaterial:andSize:](PBBridgeCAReporter, "recordMaterial:andSize:", v6);
      }

      v25 = (void *)MGCopyAnswer();
      v2->_stingButtonColor = objc_msgSend(v25, "integerValue");
      pbb_setup_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        -[PBBridgeWatchAttributeController attributesDescription](v2, "attributesDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v31 = v27;
        _os_log_impl(&dword_2113B6000, v26, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

      }
    }
  }
  return v2;
}

+ (id)sharedDeviceController
{
  if (sharedDeviceController_onceToken != -1)
    dispatch_once(&sharedDeviceController_onceToken, &__block_literal_global_0);
  return (id)sharedDeviceController___material;
}

+ (unint64_t)materialFromDevice:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BE6B308]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");
  if (v6)
  {
    v7 = objc_msgSend(a1, "_materialForCLHSValue:", v6);
  }
  else
  {
    objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BE6B310]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", &unk_24CBCE7B8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "integerValue");

  }
  return v7;
}

- (id)resourceString:(id)a3 forAttributes:(unint64_t)a4
{
  char v4;
  id v6;
  NSObject *v7;
  unint64_t material;
  void *v9;
  void *v10;
  unint64_t edition;
  const __CFString *v12;
  const __CFString *v13;
  unint64_t v14;
  unint64_t v15;
  const __CFString *v16;
  NSObject *v17;
  int v19;
  unint64_t v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (self->_material - 30 <= 0xFFFFFFFFFFFFFFE2)
  {
    pbb_setup_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      material = self->_material;
      v19 = 134217984;
      v20 = material;
      _os_log_impl(&dword_2113B6000, v7, OS_LOG_TYPE_DEFAULT, "Unknown Material: %lu -- Will fallback to M3.", (uint8_t *)&v19, 0xCu);
    }

  }
  -[NSCache objectForKey:](self->_stringCache, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;
    if ((v4 & 2) != 0)
    {
      v14 = self->_material - 1;
      if (v14 >= 0x26)
        v13 = CFSTR("-M3");
      else
        v13 = off_24CBBDFE8[v14];
    }
    else
    {
      if ((v4 & 3) == 0)
      {
LABEL_17:
        if ((v4 & 4) != 0)
        {
          v15 = self->_internalSize - 1;
          if (v15 > 0x17)
            v16 = CFSTR("-448h");
          else
            v16 = off_24CBBE118[v15];
          objc_msgSend(v9, "appendString:", v16);
        }
        -[NSCache setObject:forKey:](self->_stringCache, "setObject:forKey:", v9, v6);
        goto LABEL_23;
      }
      edition = self->_edition;
      v12 = CFSTR("-E2");
      if (edition == 3)
        v12 = CFSTR("-E3");
      if (edition == 1)
        v13 = CFSTR("-E1");
      else
        v13 = v12;
    }
    objc_msgSend(v10, "appendString:", v13);
    goto LABEL_17;
  }
LABEL_23:
  pbb_setup_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = (unint64_t)v9;
    _os_log_impl(&dword_2113B6000, v17, OS_LOG_TYPE_DEFAULT, "-resourceString %@", (uint8_t *)&v19, 0xCu);
  }

  return v9;
}

+ (id)resourceString:(id)a3 material:(unint64_t)a4 size:(unint64_t)a5 forAttributes:(unint64_t)a6
{
  char v6;
  void *v9;
  void *v10;
  unint64_t v11;
  __CFString **v12;
  const __CFString *v13;
  const __CFString *v14;
  NSObject *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v6 = a6;
  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v6 & 2) != 0)
  {
    v11 = a4 - 1;
    if (a4 - 1 >= 0x26)
    {
      v13 = CFSTR("-M3");
      goto LABEL_10;
    }
    v12 = off_24CBBDFE8;
  }
  else
  {
    if ((v6 & 3) == 0)
      goto LABEL_11;
    v11 = a4 - 5;
    if (a4 - 5 >= 0x22)
    {
      v13 = CFSTR("-E2");
      goto LABEL_10;
    }
    v12 = off_24CBBDEB8;
  }
  v13 = v12[v11];
LABEL_10:
  objc_msgSend(v9, "appendString:", v13);
LABEL_11:
  if ((v6 & 4) != 0)
  {
    if (a5 - 1 > 0x17)
      v14 = CFSTR("-448h");
    else
      v14 = off_24CBBE118[a5 - 1];
    objc_msgSend(v10, "appendString:", v14);
  }
  pbb_setup_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v10;
    _os_log_impl(&dword_2113B6000, v15, OS_LOG_TYPE_DEFAULT, "+resourceString %@", (uint8_t *)&v17, 0xCu);
  }

  return v10;
}

- (void)_populateMaterialDetailsWithDMinProperties:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  id v6;

  objc_msgSend(a3, "objectForKey:", &unk_24CBCE7B8);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "integerValue");
  self->_material = v4;
  if (v4 - 1 > 0x25)
    v5 = 0;
  else
    v5 = qword_2114016B0[v4 - 1];
  self->_edition = v5;

}

- (id)attributesDescription
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  +[PBBridgeWatchAttributeController stingMaterialDescription:](PBBridgeWatchAttributeController, "stingMaterialDescription:", self->_stingButtonColor);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR(" (Sting: %@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD17C8];
  +[PBBridgeWatchAttributeController materialDescription:](PBBridgeWatchAttributeController, "materialDescription:", self->_material);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBBridgeWatchAttributeController sizeDescription:](PBBridgeWatchAttributeController, "sizeDescription:", self->_internalSize);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBBridgeWatchAttributeController editionDescription:](PBBridgeWatchAttributeController, "editionDescription:", self->_edition);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBBridgeWatchAttributeController hwBehaviorDescription:](PBBridgeWatchAttributeController, "hwBehaviorDescription:", self->_hardwareBehavior);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR(" Attributes: (Material: %@) (Size: %@) (Edition: %@) (HW Behavior: %@)%@"), v7, v8, v9, v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)hasTwoYearWarranty
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  if (-[PBBridgeWatchAttributeController size](self, "size") > 0x12)
    return 0;
  v4 = -[PBBridgeWatchAttributeController edition](self, "edition");
  v5 = -[PBBridgeWatchAttributeController hardwareBehavior](self, "hardwareBehavior");
  v6 = -[PBBridgeWatchAttributeController material](self, "material") & 0xFFFFFFFFFFFFFFFELL;
  return v4 == 3 || v5 == 1 || v6 == 10;
}

- (void)setDevice:(id)a3
{
  NRDevice *v4;
  NSCache *v5;
  NSCache *stringCache;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  unint64_t v16;
  BOOL v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  NRDevice *device;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = (NRDevice *)a3;
  if (self->_device != v4)
  {
    -[NSCache removeAllObjects](self->_stringCache, "removeAllObjects");
    v5 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    stringCache = self->_stringCache;
    self->_stringCache = v5;

    -[NRDevice valueForProperty:](v4, "valueForProperty:", *MEMORY[0x24BE6B310]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NRDevice valueForProperty:](v4, "valueForProperty:", *MEMORY[0x24BE6B300]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (int)objc_msgSend(v8, "intValue");

    -[NRDevice valueForProperty:](v4, "valueForProperty:", *MEMORY[0x24BE6B308]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");
    pbb_setup_log();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_2113B6000, v12, OS_LOG_TYPE_DEFAULT, "Device is CLHS Type", (uint8_t *)&v22, 2u);
      }

      -[PBBridgeWatchAttributeController _setMaterialWithCLHSValue:](self, "_setMaterialWithCLHSValue:", v11);
    }
    else
    {
      if (v13)
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_2113B6000, v12, OS_LOG_TYPE_DEFAULT, "Device is DMin Type", (uint8_t *)&v22, 2u);
      }

      -[PBBridgeWatchAttributeController _populateMaterialDetailsWithDMinProperties:](self, "_populateMaterialDetailsWithDMinProperties:", v7);
    }
    self->_hardwareBehavior = v9;
    -[NRDevice valueForProperty:](v4, "valueForProperty:", *MEMORY[0x24BE6B2E8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (MGGetBoolAnswer() && v14)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ArtworkDeviceSubType"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "unsignedIntegerValue");
      switch(NRDeviceSizeForArtworkDeviceSubType())
      {
        case 1u:
          goto LABEL_13;
        case 2u:
          goto LABEL_16;
        case 3u:
          goto LABEL_19;
        case 4u:
          goto LABEL_22;
        case 5u:
          goto LABEL_25;
        case 6u:
          goto LABEL_28;
        case 7u:
          goto LABEL_31;
        case 8u:
          goto LABEL_32;
        case 9u:
          goto LABEL_34;
        default:
          goto LABEL_33;
      }
    }
    -[NRDevice valueForProperty:](v4, "valueForProperty:", *MEMORY[0x24BE6B3B0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    switch(NRDeviceSizeForProductType())
    {
      case 1u:
LABEL_13:
        v16 = 5;
        if ((_DWORD)v9 != 2)
          v16 = 1;
        v17 = (_DWORD)v9 == 1;
        v18 = 3;
        goto LABEL_35;
      case 2u:
LABEL_16:
        v16 = 2;
        if ((_DWORD)v9 == 2)
          v16 = 6;
        v17 = (_DWORD)v9 == 1;
        v18 = 4;
        goto LABEL_35;
      case 3u:
LABEL_19:
        v16 = 7;
        if ((_DWORD)v9 == 2)
          v16 = 11;
        v17 = (_DWORD)v9 == 1;
        v18 = 9;
        goto LABEL_35;
      case 4u:
LABEL_22:
        v16 = 8;
        if ((_DWORD)v9 == 2)
          v16 = 12;
        v17 = (_DWORD)v9 == 1;
        v18 = 10;
        goto LABEL_35;
      case 5u:
LABEL_25:
        v16 = 14;
        if ((_DWORD)v9 == 2)
          v16 = 18;
        v17 = (_DWORD)v9 == 1;
        v18 = 16;
        goto LABEL_35;
      case 6u:
LABEL_28:
        v16 = 13;
        if ((_DWORD)v9 == 2)
          v16 = 17;
        v17 = (_DWORD)v9 == 1;
        v18 = 15;
        goto LABEL_35;
      case 7u:
LABEL_31:
        v17 = (_DWORD)v9 == 1;
        v16 = 19;
        v18 = 24;
        goto LABEL_35;
      case 8u:
LABEL_32:
        v17 = (_DWORD)v9 == 1;
        v16 = 20;
        v18 = 22;
        goto LABEL_35;
      case 9u:
LABEL_34:
        v17 = (_DWORD)v9 == 1;
        v16 = 21;
        v18 = 23;
LABEL_35:
        if (v17)
          v16 = v18;
        break;
      default:
LABEL_33:
        v16 = 0;
        break;
    }
    self->_internalSize = v16;

    pbb_setup_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      -[PBBridgeWatchAttributeController attributesDescription](self, "attributesDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v20;
      _os_log_impl(&dword_2113B6000, v19, OS_LOG_TYPE_DEFAULT, "Populating With Device: %{public}@", (uint8_t *)&v22, 0xCu);

    }
  }
  device = self->_device;
  self->_device = v4;

}

- (PDRDevice)pdrDevice
{
  NRDevice *device;
  void *v3;
  void *v4;
  void *v5;

  device = self->_device;
  if (device)
  {
    -[NRDevice pairingID](device, "pairingID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE6E638], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceForPairingID:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (PDRDevice *)v5;
}

- (id)getGestaltDmin
{
  NSLog(CFSTR("Calling MGCopyAnswer(%@, nil)"), a2, CFSTR("DMin"));
  return (id)MGCopyAnswer();
}

+ (id)stingMaterialDescription:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("Color-2022");
  else
    return 0;
}

+ (id)materialDescription:(unint64_t)a3
{
  if (a3 - 1 > 0x25)
    return CFSTR("Generic");
  else
    return off_24CBBDCC0[a3 - 1];
}

+ (id)sizeDescription:(unint64_t)a3
{
  if (a3 > 0x18)
    return 0;
  else
    return off_24CBBDDF0[a3];
}

+ (id)hwBehaviorDescription:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Default");
  if (a3 == 2)
    v3 = CFSTR("Nike+");
  if (a3 == 1)
    return CFSTR("Hermès");
  else
    return (id)v3;
}

+ (id)editionDescription:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("Sport");
  else
    return off_24CBBDFC8[a3];
}

+ (id)materialKeyColorForMaterial:(unint64_t)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;

  if (a3 == 20)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemOrangeColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 == 9)
    {
      v3 = (void *)MEMORY[0x24BDF6950];
      v4 = 0.91372549;
      v5 = 0.705882353;
      v6 = 0.549019608;
    }
    else
    {
      if (a3 != 8)
      {
        objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        return v7;
      }
      v3 = (void *)MEMORY[0x24BDF6950];
      v4 = 0.898039216;
      v5 = 0.796078431;
      v6 = 0.482352941;
    }
    objc_msgSend(v3, "colorWithRed:green:blue:alpha:", v4, v5, v6, 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)materialKeyColor
{
  return +[PBBridgeWatchAttributeController materialKeyColorForMaterial:](PBBridgeWatchAttributeController, "materialKeyColorForMaterial:", self->_material);
}

- (void)setInternalSize:(unint64_t)a3
{
  unint64_t v3;

  self->_internalSize = a3;
  if (a3 - 3 > 0x15)
    v3 = 0;
  else
    v3 = qword_2114014A0[a3 - 3];
  self->_hardwareBehavior = v3;
}

- (void)setMaterial:(unint64_t)a3
{
  unint64_t v3;

  self->_material = a3;
  if (a3 - 1 > 0x25)
    v3 = 0;
  else
    v3 = qword_2114016B0[a3 - 1];
  self->_edition = v3;
}

+ (unint64_t)sizeFromDevice:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v3 = a3;
  objc_msgSend(v3, "valueForProperty:", *MEMORY[0x24BE6B300]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  objc_msgSend(v3, "valueForProperty:", *MEMORY[0x24BE6B2E8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (MGGetBoolAnswer() && v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ArtworkDeviceSubType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unsignedIntegerValue");
    switch(NRDeviceSizeForArtworkDeviceSubType())
    {
      case 1u:
        goto LABEL_5;
      case 2u:
        goto LABEL_9;
      case 3u:
        goto LABEL_12;
      case 4u:
        goto LABEL_15;
      case 5u:
        goto LABEL_18;
      case 6u:
        goto LABEL_21;
      case 7u:
        goto LABEL_24;
      case 8u:
        goto LABEL_25;
      case 9u:
        goto LABEL_26;
      default:
        goto LABEL_8;
    }
  }
  objc_msgSend(v3, "valueForProperty:", *MEMORY[0x24BE6B3B0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  switch(NRDeviceSizeForProductType())
  {
    case 1u:
LABEL_5:
      v8 = 5;
      if (v5 != 2)
        v8 = 1;
      v9 = v5 == 1;
      v10 = 3;
      goto LABEL_27;
    case 2u:
LABEL_9:
      v8 = 2;
      if (v5 == 2)
        v8 = 6;
      v9 = v5 == 1;
      v10 = 4;
      goto LABEL_27;
    case 3u:
LABEL_12:
      v8 = 7;
      if (v5 == 2)
        v8 = 11;
      v9 = v5 == 1;
      v10 = 9;
      goto LABEL_27;
    case 4u:
LABEL_15:
      v8 = 8;
      if (v5 == 2)
        v8 = 12;
      v9 = v5 == 1;
      v10 = 10;
      goto LABEL_27;
    case 5u:
LABEL_18:
      v8 = 14;
      if (v5 == 2)
        v8 = 18;
      v9 = v5 == 1;
      v10 = 16;
      goto LABEL_27;
    case 6u:
LABEL_21:
      v8 = 13;
      if (v5 == 2)
        v8 = 17;
      v9 = v5 == 1;
      v10 = 15;
      goto LABEL_27;
    case 7u:
LABEL_24:
      v9 = v5 == 1;
      v8 = 19;
      v10 = 24;
      goto LABEL_27;
    case 8u:
LABEL_25:
      v9 = v5 == 1;
      v8 = 20;
      v10 = 22;
      goto LABEL_27;
    case 9u:
LABEL_26:
      v9 = v5 == 1;
      v8 = 21;
      v10 = 23;
LABEL_27:
      if (v9)
        v11 = v10;
      else
        v11 = v8;
      break;
    default:
LABEL_8:
      v11 = 0;
      break;
  }

  v12 = SizeForInternalSize(v11);
  return v12;
}

+ (unint64_t)materialFromPdrDevice:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BE6E658]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");
  if (v6)
  {
    v7 = objc_msgSend(a1, "_materialForCLHSValue:", v6);
  }
  else
  {
    objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BE6E660]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", &unk_24CBCE7B8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "integerValue");

  }
  return v7;
}

+ (unint64_t)sizeFromPdrDevice:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *MEMORY[0x24BE6E650];
  v4 = a3;
  objc_msgSend(v4, "valueForProperty:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BE6E680]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  switch(NRDeviceSizeForProductType())
  {
    case 1u:
      v8 = 5;
      if (v6 != 2)
        v8 = 1;
      v9 = v6 == 1;
      v10 = 3;
      goto LABEL_24;
    case 2u:
      v8 = 2;
      if (v6 == 2)
        v8 = 6;
      v9 = v6 == 1;
      v10 = 4;
      goto LABEL_24;
    case 3u:
      v8 = 7;
      if (v6 == 2)
        v8 = 11;
      v9 = v6 == 1;
      v10 = 9;
      goto LABEL_24;
    case 4u:
      v8 = 8;
      if (v6 == 2)
        v8 = 12;
      v9 = v6 == 1;
      v10 = 10;
      goto LABEL_24;
    case 5u:
      v8 = 14;
      if (v6 == 2)
        v8 = 18;
      v9 = v6 == 1;
      v10 = 16;
      goto LABEL_24;
    case 6u:
      v8 = 13;
      if (v6 == 2)
        v8 = 17;
      v9 = v6 == 1;
      v10 = 15;
      goto LABEL_24;
    case 7u:
      v9 = v6 == 1;
      v8 = 19;
      v10 = 24;
      goto LABEL_24;
    case 8u:
      v9 = v6 == 1;
      v8 = 20;
      v10 = 22;
      goto LABEL_24;
    case 9u:
      v9 = v6 == 1;
      v8 = 21;
      v10 = 23;
LABEL_24:
      if (v9)
        v11 = v10;
      else
        v11 = v8;
      break;
    default:
      v11 = 0;
      break;
  }

  return SizeForInternalSize(v11);
}

+ (unsigned)sizeFromInternalSize:(unint64_t)a3
{
  if (a3 - 1 > 0x17)
    return 0;
  else
    return word_211401550[a3 - 1];
}

+ (int64_t)pdrSizeFromInternalSize:(unint64_t)a3
{
  return +[PBBridgeWatchAttributeController sizeFromInternalSize:](PBBridgeWatchAttributeController, "sizeFromInternalSize:", a3);
}

+ (unint64_t)_materialForCLHSValue:(unint64_t)a3
{
  if (a3 - 2 > 0x25)
    return 3;
  else
    return qword_211401580[a3 - 2];
}

- (void)_setMaterialWithCLHSValue:(unint64_t)a3
{
  unint64_t v4;
  unint64_t v5;

  v4 = +[PBBridgeWatchAttributeController _materialForCLHSValue:](PBBridgeWatchAttributeController, "_materialForCLHSValue:", a3);
  self->_material = v4;
  if (v4 - 1 > 0x25)
    v5 = 0;
  else
    v5 = qword_2114016B0[v4 - 1];
  self->_edition = v5;
}

- (unint64_t)edition
{
  return self->_edition;
}

- (unint64_t)material
{
  return self->_material;
}

- (unint64_t)internalSize
{
  return self->_internalSize;
}

- (unint64_t)hardwareBehavior
{
  return self->_hardwareBehavior;
}

- (NRDevice)device
{
  return self->_device;
}

- (NSCache)stringCache
{
  return self->_stringCache;
}

- (void)setStringCache:(id)a3
{
  objc_storeStrong((id *)&self->_stringCache, a3);
}

- (unint64_t)stingButtonColor
{
  return self->_stingButtonColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringCache, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
