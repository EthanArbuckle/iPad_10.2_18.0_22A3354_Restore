@implementation UISApplicationSupportDisplayEdgeInfo

- (void)encodeWithXPCDictionary:(id)a3
{
  double v4;
  double v5;
  void *v6;
  xpc_object_t xdict;

  xdict = a3;
  xpc_dictionary_set_uint64(xdict, "UISApplicationSupportDisplayEdgeInfoFlags", self->_infoFlags.asInt);
  -[NSNumber doubleValue](self->_systemMinimumMargin, "doubleValue");
  xpc_dictionary_set_double(xdict, "UISApplicationSupportDisplaySystemMinimumMargin", v4);
  -[NSNumber doubleValue](self->_homeAffordanceOverlayAllowance, "doubleValue");
  xpc_dictionary_set_double(xdict, "UISApplicationSupportDisplayHomeAffordanceOverlayAllowance", v5);
  if (self->_peripheryInsets)
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  if (self->_safeAreaInsetsPortrait)
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  v6 = xdict;
  if (self->_safeAreaInsetsLandscapeLeft)
  {
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    v6 = xdict;
  }
  if (self->_safeAreaInsetsPortraitUpsideDown)
  {
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    v6 = xdict;
  }
  if (self->_safeAreaInsetsLandscapeRight)
  {
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    v6 = xdict;
  }

}

- (UISApplicationSupportDisplayEdgeInfo)initWithXPCDictionary:(id)a3
{
  id v4;
  UISApplicationSupportDisplayEdgeInfo *v5;
  uint64_t v6;
  NSNumber *systemMinimumMargin;
  uint64_t v8;
  NSNumber *homeAffordanceOverlayAllowance;
  uint64_t v10;
  UISApplicationSupportDisplayEdgeInsetsWrapper *peripheryInsets;
  uint64_t v12;
  UISApplicationSupportDisplayEdgeInsetsWrapper *safeAreaInsetsPortrait;
  uint64_t v14;
  UISApplicationSupportDisplayEdgeInsetsWrapper *safeAreaInsetsLandscapeLeft;
  uint64_t v16;
  UISApplicationSupportDisplayEdgeInsetsWrapper *safeAreaInsetsPortraitUpsideDown;
  uint64_t v18;
  UISApplicationSupportDisplayEdgeInsetsWrapper *safeAreaInsetsLandscapeRight;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)UISApplicationSupportDisplayEdgeInfo;
  v5 = -[UISApplicationSupportDisplayEdgeInfo init](&v21, sel_init);
  if (v5)
  {
    v5->_infoFlags.asInt = xpc_dictionary_get_uint64(v4, "UISApplicationSupportDisplayEdgeInfoFlags");
    if (xpc_dictionary_get_double(v4, "UISApplicationSupportDisplaySystemMinimumMargin") != 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v6 = objc_claimAutoreleasedReturnValue();
      systemMinimumMargin = v5->_systemMinimumMargin;
      v5->_systemMinimumMargin = (NSNumber *)v6;

    }
    if (xpc_dictionary_get_double(v4, "UISApplicationSupportDisplayHomeAffordanceOverlayAllowance") != 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v8 = objc_claimAutoreleasedReturnValue();
      homeAffordanceOverlayAllowance = v5->_homeAffordanceOverlayAllowance;
      v5->_homeAffordanceOverlayAllowance = (NSNumber *)v8;

    }
    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    v10 = objc_claimAutoreleasedReturnValue();
    peripheryInsets = v5->_peripheryInsets;
    v5->_peripheryInsets = (UISApplicationSupportDisplayEdgeInsetsWrapper *)v10;

    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    v12 = objc_claimAutoreleasedReturnValue();
    safeAreaInsetsPortrait = v5->_safeAreaInsetsPortrait;
    v5->_safeAreaInsetsPortrait = (UISApplicationSupportDisplayEdgeInsetsWrapper *)v12;

    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    v14 = objc_claimAutoreleasedReturnValue();
    safeAreaInsetsLandscapeLeft = v5->_safeAreaInsetsLandscapeLeft;
    v5->_safeAreaInsetsLandscapeLeft = (UISApplicationSupportDisplayEdgeInsetsWrapper *)v14;

    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    v16 = objc_claimAutoreleasedReturnValue();
    safeAreaInsetsPortraitUpsideDown = v5->_safeAreaInsetsPortraitUpsideDown;
    v5->_safeAreaInsetsPortraitUpsideDown = (UISApplicationSupportDisplayEdgeInsetsWrapper *)v16;

    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    v18 = objc_claimAutoreleasedReturnValue();
    safeAreaInsetsLandscapeRight = v5->_safeAreaInsetsLandscapeRight;
    v5->_safeAreaInsetsLandscapeRight = (UISApplicationSupportDisplayEdgeInsetsWrapper *)v18;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safeAreaInsetsLandscapeRight, 0);
  objc_storeStrong((id *)&self->_safeAreaInsetsPortraitUpsideDown, 0);
  objc_storeStrong((id *)&self->_safeAreaInsetsLandscapeLeft, 0);
  objc_storeStrong((id *)&self->_safeAreaInsetsPortrait, 0);
  objc_storeStrong((id *)&self->_homeAffordanceOverlayAllowance, 0);
  objc_storeStrong((id *)&self->_systemMinimumMargin, 0);
  objc_storeStrong((id *)&self->_peripheryInsets, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "_copyFromOtherInfo:", self);
  return v4;
}

- (void)_copyFromOtherInfo:(id)a3
{
  _QWORD *v4;
  UISApplicationSupportDisplayEdgeInsetsWrapper *v5;
  UISApplicationSupportDisplayEdgeInsetsWrapper *peripheryInsets;
  NSNumber *v7;
  NSNumber *systemMinimumMargin;
  UISApplicationSupportDisplayEdgeInsetsWrapper *v9;
  UISApplicationSupportDisplayEdgeInsetsWrapper *safeAreaInsetsPortrait;
  NSNumber *v11;
  NSNumber *homeAffordanceOverlayAllowance;
  UISApplicationSupportDisplayEdgeInsetsWrapper *v13;
  UISApplicationSupportDisplayEdgeInsetsWrapper *safeAreaInsetsLandscapeLeft;
  UISApplicationSupportDisplayEdgeInsetsWrapper *v15;
  UISApplicationSupportDisplayEdgeInsetsWrapper *safeAreaInsetsPortraitUpsideDown;
  UISApplicationSupportDisplayEdgeInsetsWrapper *v17;
  UISApplicationSupportDisplayEdgeInsetsWrapper *safeAreaInsetsLandscapeRight;
  unint64_t v19;

  v4 = a3;
  objc_msgSend(v4, "peripheryInsets");
  v5 = (UISApplicationSupportDisplayEdgeInsetsWrapper *)objc_claimAutoreleasedReturnValue();
  peripheryInsets = self->_peripheryInsets;
  self->_peripheryInsets = v5;

  objc_msgSend(v4, "systemMinimumMargin");
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  systemMinimumMargin = self->_systemMinimumMargin;
  self->_systemMinimumMargin = v7;

  objc_msgSend(v4, "safeAreaInsetsPortrait");
  v9 = (UISApplicationSupportDisplayEdgeInsetsWrapper *)objc_claimAutoreleasedReturnValue();
  safeAreaInsetsPortrait = self->_safeAreaInsetsPortrait;
  self->_safeAreaInsetsPortrait = v9;

  objc_msgSend(v4, "homeAffordanceOverlayAllowance");
  v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  homeAffordanceOverlayAllowance = self->_homeAffordanceOverlayAllowance;
  self->_homeAffordanceOverlayAllowance = v11;

  objc_msgSend(v4, "safeAreaInsetsLandscapeLeft");
  v13 = (UISApplicationSupportDisplayEdgeInsetsWrapper *)objc_claimAutoreleasedReturnValue();
  safeAreaInsetsLandscapeLeft = self->_safeAreaInsetsLandscapeLeft;
  self->_safeAreaInsetsLandscapeLeft = v13;

  objc_msgSend(v4, "safeAreaInsetsPortraitUpsideDown");
  v15 = (UISApplicationSupportDisplayEdgeInsetsWrapper *)objc_claimAutoreleasedReturnValue();
  safeAreaInsetsPortraitUpsideDown = self->_safeAreaInsetsPortraitUpsideDown;
  self->_safeAreaInsetsPortraitUpsideDown = v15;

  objc_msgSend(v4, "safeAreaInsetsLandscapeRight");
  v17 = (UISApplicationSupportDisplayEdgeInsetsWrapper *)objc_claimAutoreleasedReturnValue();
  safeAreaInsetsLandscapeRight = self->_safeAreaInsetsLandscapeRight;
  self->_safeAreaInsetsLandscapeRight = v17;

  v19 = v4[1];
  self->_infoFlags.asInt = v19;
  LOBYTE(self->_infoFlags.asInt) = v19 & 0xFE;
}

- (UISApplicationSupportDisplayEdgeInsetsWrapper)safeAreaInsetsPortrait
{
  return self->_safeAreaInsetsPortrait;
}

- (NSNumber)homeAffordanceOverlayAllowance
{
  return self->_homeAffordanceOverlayAllowance;
}

- (UISApplicationSupportDisplayEdgeInsetsWrapper)peripheryInsets
{
  return self->_peripheryInsets;
}

- (NSNumber)systemMinimumMargin
{
  return self->_systemMinimumMargin;
}

- (UISApplicationSupportDisplayEdgeInsetsWrapper)safeAreaInsetsPortraitUpsideDown
{
  return self->_safeAreaInsetsPortraitUpsideDown;
}

- (UISApplicationSupportDisplayEdgeInsetsWrapper)safeAreaInsetsLandscapeRight
{
  return self->_safeAreaInsetsLandscapeRight;
}

- (UISApplicationSupportDisplayEdgeInsetsWrapper)safeAreaInsetsLandscapeLeft
{
  return self->_safeAreaInsetsLandscapeLeft;
}

- (void)setSafeAreaInsetsPortrait:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__UISApplicationSupportDisplayEdgeInfo_setSafeAreaInsetsPortrait___block_invoke;
  v6[3] = &unk_1E2CAF5B8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[UISApplicationSupportDisplayEdgeInfo _performIvarUpdateIfAllowed:](self, "_performIvarUpdateIfAllowed:", v6);

}

void __66__UISApplicationSupportDisplayEdgeInfo_setSafeAreaInsetsPortrait___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

- (void)setPeripheryInsets:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__UISApplicationSupportDisplayEdgeInfo_setPeripheryInsets___block_invoke;
  v6[3] = &unk_1E2CAF5B8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[UISApplicationSupportDisplayEdgeInfo _performIvarUpdateIfAllowed:](self, "_performIvarUpdateIfAllowed:", v6);

}

void __59__UISApplicationSupportDisplayEdgeInfo_setPeripheryInsets___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (void)setHomeAffordanceOverlayAllowance:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__UISApplicationSupportDisplayEdgeInfo_setHomeAffordanceOverlayAllowance___block_invoke;
  v6[3] = &unk_1E2CAF5B8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[UISApplicationSupportDisplayEdgeInfo _performIvarUpdateIfAllowed:](self, "_performIvarUpdateIfAllowed:", v6);

}

- (void)_performIvarUpdateIfAllowed:(id)a3
{
  id v5;

  if ((self->_infoFlags.asInt & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISApplicationSupportDisplayEdgeInfo.m"), 235, CFSTR("Invalid attempt to mutate immutable UISApplicationSupportDisplayEdgeInfo instance"));

  }
  else
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

void __74__UISApplicationSupportDisplayEdgeInfo_setHomeAffordanceOverlayAllowance___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

+ (id)defaultDisplayEdgeInfo
{
  return (id)objc_msgSend(a1, "defaultDisplayEdgeInfoForceInsets:", 0);
}

+ (id)defaultDisplayEdgeInfoForceInsets:(BOOL)a3
{
  _QWORD block[4];
  BOOL v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__UISApplicationSupportDisplayEdgeInfo_defaultDisplayEdgeInfoForceInsets___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v5 = a3;
  if (qword_1ECDA5948 != -1)
    dispatch_once(&qword_1ECDA5948, block);
  return (id)_MergedGlobals_14;
}

void __74__UISApplicationSupportDisplayEdgeInfo_defaultDisplayEdgeInfoForceInsets___block_invoke(uint64_t a1)
{
  UISApplicationSupportDisplayEdgeInfo *v2;
  void *v3;
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  BOOL v11;
  _BOOL4 v12;
  UISApplicationSupportDisplayEdgeInsetsWrapper *v13;
  void *v14;
  void *v15;
  double v16;
  uint64_t v17;
  UISApplicationSupportDisplayEdgeInsetsWrapper *v18;
  void *v19;
  void *v20;
  UISApplicationSupportDisplayEdgeInsetsWrapper *v21;

  v2 = objc_alloc_init(UISApplicationSupportDisplayEdgeInfo);
  v3 = (void *)_MergedGlobals_14;
  _MergedGlobals_14 = (uint64_t)v2;

  v4 = (const __CFDictionary *)MGCopyAnswer();
  if (v4)
  {
    v5 = v4;
    CFDictionaryGetValue(v4, CFSTR("ArtworkDeviceSubType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6 || (v8 = objc_msgSend(v6, "intValue"), v8 < 0))
    {
      CFRelease(v5);
      goto LABEL_49;
    }
    v9 = v8;
    v10 = 1;
    if (v8 > 2555)
    {
      if (v8 > 2777)
      {
        if (v8 == 2778 || v8 == 2796)
          goto LABEL_20;
      }
      else if (v8 == 2556 || v8 == 2688)
      {
        goto LABEL_20;
      }
    }
    else if (v8 > 2435)
    {
      if (v8 == 2436 || v8 == 2532)
        goto LABEL_20;
    }
    else if (v8 == 1792 || v8 == 2340)
    {
      goto LABEL_20;
    }
    v10 = 0;
LABEL_20:
    if (v8 == 2732)
      v11 = MGGetSInt32Answer() == 2;
    else
      v11 = v8 == 2388 || v8 == 2360;
    v12 = v11;
    if (((v10 | v12) & 1) != 0 || !*(_BYTE *)(a1 + 32))
    {
      CFRelease(v5);
      if (!v10)
      {
LABEL_31:
        if (v12)
        {
          v13 = -[UISApplicationSupportDisplayEdgeInsetsWrapper initWithTop:left:bottom:right:]([UISApplicationSupportDisplayEdgeInsetsWrapper alloc], "initWithTop:left:bottom:right:", 0.0, 0.0, 20.0, 0.0);
          v14 = *(void **)(_MergedGlobals_14 + 40);
          *(_QWORD *)(_MergedGlobals_14 + 40) = v13;

          v15 = *(void **)(_MergedGlobals_14 + 32);
          *(_QWORD *)(_MergedGlobals_14 + 32) = &unk_1E2CBB658;
LABEL_48:

        }
LABEL_49:

        goto LABEL_50;
      }
    }
    else
    {
      CFRelease(v5);
      v12 = v9 == 2732;
      if ((v9 - 569) >= 2)
        goto LABEL_31;
    }
    v16 = 44.0;
    if (v9 <= 2555)
    {
      switch(v9)
      {
        case 1792:
          v17 = 0x4048000000000000;
          break;
        case 2340:
          v17 = 0x4049000000000000;
          break;
        case 2532:
          goto LABEL_43;
        default:
          goto LABEL_47;
      }
      v16 = *(double *)&v17;
      goto LABEL_47;
    }
    switch(v9)
    {
      case 2556:
        goto LABEL_42;
      case 2778:
LABEL_43:
        v16 = 47.0;
        break;
      case 2796:
LABEL_42:
        v16 = 59.0;
        break;
    }
LABEL_47:
    v18 = -[UISApplicationSupportDisplayEdgeInsetsWrapper initWithTop:left:bottom:right:]([UISApplicationSupportDisplayEdgeInsetsWrapper alloc], "initWithTop:left:bottom:right:", v16, 0.0, 34.0, 0.0);
    v19 = *(void **)(_MergedGlobals_14 + 40);
    *(_QWORD *)(_MergedGlobals_14 + 40) = v18;

    v20 = *(void **)(_MergedGlobals_14 + 32);
    *(_QWORD *)(_MergedGlobals_14 + 32) = &unk_1E2CBB648;

    v21 = -[UISApplicationSupportDisplayEdgeInsetsWrapper initWithTop:left:bottom:right:]([UISApplicationSupportDisplayEdgeInsetsWrapper alloc], "initWithTop:left:bottom:right:", 32.0, 0.0, 0.0, 0.0);
    v15 = *(void **)(_MergedGlobals_14 + 16);
    *(_QWORD *)(_MergedGlobals_14 + 16) = v21;
    goto LABEL_48;
  }
LABEL_50:
  *(_BYTE *)(_MergedGlobals_14 + 8) |= 1u;
}

- (void)setSystemMinimumMargin:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__UISApplicationSupportDisplayEdgeInfo_setSystemMinimumMargin___block_invoke;
  v6[3] = &unk_1E2CAF5B8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[UISApplicationSupportDisplayEdgeInfo _performIvarUpdateIfAllowed:](self, "_performIvarUpdateIfAllowed:", v6);

}

void __63__UISApplicationSupportDisplayEdgeInfo_setSystemMinimumMargin___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

- (void)setSafeAreaInsetsLandscapeLeft:(id)a3
{
  UISApplicationSupportDisplayEdgeInsetsWrapper *v5;
  UISApplicationSupportDisplayEdgeInsetsWrapper *safeAreaInsetsLandscapeLeft;
  void *v7;

  v5 = (UISApplicationSupportDisplayEdgeInsetsWrapper *)a3;
  if ((self->_infoFlags.asInt & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISApplicationSupportDisplayEdgeInfo.m"), 268, CFSTR("Invalid attempt to mutate immutable UISApplicationSupportDisplayEdgeInfo instance"));

  }
  safeAreaInsetsLandscapeLeft = self->_safeAreaInsetsLandscapeLeft;
  self->_safeAreaInsetsLandscapeLeft = v5;

}

- (void)setSafeAreaInsetsPortraitUpsideDown:(id)a3
{
  UISApplicationSupportDisplayEdgeInsetsWrapper *v5;
  UISApplicationSupportDisplayEdgeInsetsWrapper *safeAreaInsetsPortraitUpsideDown;
  void *v7;

  v5 = (UISApplicationSupportDisplayEdgeInsetsWrapper *)a3;
  if ((self->_infoFlags.asInt & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISApplicationSupportDisplayEdgeInfo.m"), 273, CFSTR("Invalid attempt to mutate immutable UISApplicationSupportDisplayEdgeInfo instance"));

  }
  safeAreaInsetsPortraitUpsideDown = self->_safeAreaInsetsPortraitUpsideDown;
  self->_safeAreaInsetsPortraitUpsideDown = v5;

}

- (void)setSafeAreaInsetsLandscapeRight:(id)a3
{
  UISApplicationSupportDisplayEdgeInsetsWrapper *v5;
  UISApplicationSupportDisplayEdgeInsetsWrapper *safeAreaInsetsLandscapeRight;
  void *v7;

  v5 = (UISApplicationSupportDisplayEdgeInsetsWrapper *)a3;
  if ((self->_infoFlags.asInt & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISApplicationSupportDisplayEdgeInfo.m"), 278, CFSTR("Invalid attempt to mutate immutable UISApplicationSupportDisplayEdgeInfo instance"));

  }
  safeAreaInsetsLandscapeRight = self->_safeAreaInsetsLandscapeRight;
  self->_safeAreaInsetsLandscapeRight = v5;

}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_systemMinimumMargin, CFSTR("systemMinimumMargin"), 1);
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_peripheryInsets, CFSTR("peripheryInsets"), 1);
  v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_safeAreaInsetsPortrait, CFSTR("safeAreaInsetsPortrait"), 1);
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_homeAffordanceOverlayAllowance, CFSTR("homeAffordanceOverlayAllowance"), 1);
  v8 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_safeAreaInsetsLandscapeLeft, CFSTR("safeAreaInsetsLandscapeLeft"), 1);
  v9 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_safeAreaInsetsPortraitUpsideDown, CFSTR("safeAreaInsetsPortraitUpsideDown"), 1);
  v10 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_safeAreaInsetsLandscapeRight, CFSTR("safeAreaInsetsLandscapeRight"), 1);
  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

@end
