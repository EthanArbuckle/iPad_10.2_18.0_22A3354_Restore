@implementation XBApplicationSnapshotPredicate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSettings, 0);
}

- (void)setRequiredOSVersion:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[XBApplicationSnapshotPredicate _setClientObject:forKey:](self, "_setClientObject:forKey:", v4, 9);

}

+ (id)predicate
{
  return objc_alloc_init((Class)a1);
}

- (XBApplicationSnapshotPredicate)init
{
  XBApplicationSnapshotPredicate *v2;
  BSMutableSettings *v3;
  BSMutableSettings *clientSettings;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)XBApplicationSnapshotPredicate;
  v2 = -[XBApplicationSnapshotPredicate init](&v6, sel_init);
  if (v2)
  {
    v3 = (BSMutableSettings *)objc_alloc_init(MEMORY[0x24BE383A8]);
    clientSettings = v2->_clientSettings;
    v2->_clientSettings = v3;

  }
  return v2;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[XBApplicationSnapshotPredicate _setClientObject:forKey:](self, "_setClientObject:forKey:", v4, 12);

}

- (void)setInterfaceOrientationMask:(unint64_t)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[XBApplicationSnapshotPredicate _setClientObject:forKey:](self, "_setClientObject:forKey:", v4, 4);

  }
  else
  {
    -[XBApplicationSnapshotPredicate _removeClientObjectForKey:](self, "_removeClientObjectForKey:", 4);
  }
}

- (void)setStatusBarStateMask:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[XBApplicationSnapshotPredicate _setClientObject:forKey:](self, "_setClientObject:forKey:", v4, 8);

}

- (void)setContentTypeMask:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[XBApplicationSnapshotPredicate _setClientObject:forKey:](self, "_setClientObject:forKey:", v4, 7);

}

- (void)setReferenceSize:(CGSize)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", a3.width, a3.height);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[XBApplicationSnapshotPredicate _setClientObject:forKey:](self, "_setClientObject:forKey:", v4, 5);

}

- (void)_setClientObject:(id)a3 forKey:(unint64_t)a4
{
  -[BSMutableSettings setObject:forSetting:](self->_clientSettings, "setObject:forSetting:", a3);
  -[BSMutableSettings setFlag:forSetting:](self->_clientSettings, "setFlag:forSetting:", 1, a4);
}

- (void)setCustomSafeAreaInsets:(id)a3
{
  -[XBApplicationSnapshotPredicate _setClientObject:forKey:](self, "_setClientObject:forKey:", a3, 13);
}

- (void)setScheme:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[XBApplicationSnapshotPredicate _setClientObject:forKey:](self, "_setClientObject:forKey:", v4, 2);

}

- (BOOL)evaluateWithObject:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  double v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  char v39;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_35;
  if (-[XBApplicationSnapshotPredicate _hasClientObjectForKey:](self, "_hasClientObjectForKey:", 7))
  {
    v5 = -[XBApplicationSnapshotPredicate contentTypeMask](self, "contentTypeMask");
    if ((v5 & (1 << objc_msgSend(v4, "contentType"))) == 0)
      goto LABEL_35;
  }
  if (-[XBApplicationSnapshotPredicate _hasClientObjectForKey:](self, "_hasClientObjectForKey:", 4))
  {
    v6 = -[XBApplicationSnapshotPredicate interfaceOrientationMask](self, "interfaceOrientationMask");
    if ((v6 & (1 << objc_msgSend(v4, "interfaceOrientation"))) == 0)
      goto LABEL_35;
  }
  if (-[XBApplicationSnapshotPredicate _hasClientObjectForKey:](self, "_hasClientObjectForKey:", 5))
  {
    -[XBApplicationSnapshotPredicate referenceSize](self, "referenceSize");
    v8 = v7;
    v10 = v9;
    objc_msgSend(v4, "referenceSize");
    LOBYTE(v12) = 0;
    if (v8 != v13 || v10 != v11)
      goto LABEL_36;
  }
  if (-[XBApplicationSnapshotPredicate _hasClientObjectForKey:](self, "_hasClientObjectForKey:", 1))
  {
    -[XBApplicationSnapshotPredicate name](self, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = BSEqualStrings();

    if (!v16)
      goto LABEL_35;
  }
  if (-[XBApplicationSnapshotPredicate _hasClientObjectForKey:](self, "_hasClientObjectForKey:", 2))
  {
    -[XBApplicationSnapshotPredicate scheme](self, "scheme");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheme");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = BSEqualStrings();

    if (!v19)
      goto LABEL_35;
  }
  if (-[XBApplicationSnapshotPredicate _hasClientObjectForKey:](self, "_hasClientObjectForKey:", 9))
  {
    -[XBApplicationSnapshotPredicate requiredOSVersion](self, "requiredOSVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {

    }
    else
    {
      objc_msgSend(v4, "requiredOSVersion");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
        goto LABEL_35;
    }
    objc_msgSend(v4, "requiredOSVersion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[XBApplicationSnapshotPredicate requiredOSVersion](self, "requiredOSVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "compare:options:", v22, 64);

    if (v23 == 1)
      goto LABEL_35;
  }
  if (-[XBApplicationSnapshotPredicate _hasClientObjectForKey:](self, "_hasClientObjectForKey:", 3))
  {
    -[XBApplicationSnapshotPredicate launchInterfaceIdentifier](self, "launchInterfaceIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "launchInterfaceIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = BSEqualStrings();

    if (!v26)
      goto LABEL_35;
  }
  if (-[XBApplicationSnapshotPredicate _hasClientObjectForKey:](self, "_hasClientObjectForKey:", 6))
  {
    -[XBApplicationSnapshotPredicate imageScale](self, "imageScale");
    objc_msgSend(v4, "imageScale");
    if (!BSFloatEqualToFloat())
      goto LABEL_35;
  }
  if (-[XBApplicationSnapshotPredicate _hasClientObjectForKey:](self, "_hasClientObjectForKey:", 8))
  {
    v27 = -[XBApplicationSnapshotPredicate statusBarStateMask](self, "statusBarStateMask");
    objc_msgSend(v4, "statusBarSettings");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = XBStatusBarStateMaskMatchesSettings(v27, v28);

    if (!v12)
      goto LABEL_36;
  }
  if (-[XBApplicationSnapshotPredicate _hasClientObjectForKey:](self, "_hasClientObjectForKey:", 10))
  {
    -[XBApplicationSnapshotPredicate _clientObjectForKey:](self, "_clientObjectForKey:", 10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "creationDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_35;
  }
  if (-[XBApplicationSnapshotPredicate _hasClientObjectForKey:](self, "_hasClientObjectForKey:", 12))
  {
    v32 = -[XBApplicationSnapshotPredicate userInterfaceStyle](self, "userInterfaceStyle");
    v33 = objc_msgSend(v4, "userInterfaceStyle");
    if (v32)
    {
      if (v33 && v32 != v33)
      {
LABEL_35:
        LOBYTE(v12) = 0;
        goto LABEL_36;
      }
    }
  }
  if (-[XBApplicationSnapshotPredicate _hasClientObjectForKey:](self, "_hasClientObjectForKey:", 13))
  {
    -[XBApplicationSnapshotPredicate _clientObjectForKey:](self, "_clientObjectForKey:", 13);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34 && objc_msgSend(v4, "contentType") != 2)
    {
      objc_msgSend(v4, "customSafeAreaInsets");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v34, "isEqual:", v38);

      if ((v39 & 1) == 0)
        goto LABEL_33;
    }
    else
    {
      objc_msgSend(v4, "customSafeAreaInsets");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
LABEL_33:
        LOBYTE(v12) = 0;
LABEL_40:

        goto LABEL_36;
      }
    }
    LOBYTE(v12) = 1;
    goto LABEL_40;
  }
  LOBYTE(v12) = 1;
LABEL_36:

  return v12;
}

- (BOOL)_hasClientObjectForKey:(unint64_t)a3
{
  -[BSMutableSettings flagForSetting:](self->_clientSettings, "flagForSetting:", a3);
  return BSSettingFlagIsYes();
}

- (unint64_t)contentTypeMask
{
  void *v2;
  unint64_t v3;

  -[XBApplicationSnapshotPredicate _clientObjectForKey:](self, "_clientObjectForKey:", 7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (id)_clientObjectForKey:(unint64_t)a3
{
  return (id)-[BSMutableSettings objectForSetting:](self->_clientSettings, "objectForSetting:", a3);
}

- (NSString)requiredOSVersion
{
  return (NSString *)-[XBApplicationSnapshotPredicate _clientObjectForKey:](self, "_clientObjectForKey:", 9);
}

- (CGSize)referenceSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[XBApplicationSnapshotPredicate _clientObjectForKey:](self, "_clientObjectForKey:", 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CGSizeValue");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (unint64_t)interfaceOrientationMask
{
  void *v2;
  unint64_t v3;

  -[XBApplicationSnapshotPredicate _clientObjectForKey:](self, "_clientObjectForKey:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (int64_t)userInterfaceStyle
{
  void *v2;
  int64_t v3;

  -[XBApplicationSnapshotPredicate _clientObjectForKey:](self, "_clientObjectForKey:", 12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (unint64_t)statusBarStateMask
{
  void *v2;
  unint64_t v3;

  -[XBApplicationSnapshotPredicate _clientObjectForKey:](self, "_clientObjectForKey:", 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (double)imageScale
{
  void *v2;
  double v3;
  double v4;

  -[XBApplicationSnapshotPredicate _clientObjectForKey:](self, "_clientObjectForKey:", 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (NSString)scheme
{
  return (NSString *)-[XBApplicationSnapshotPredicate _clientObjectForKey:](self, "_clientObjectForKey:", 2);
}

- (void)setImageScale:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[XBApplicationSnapshotPredicate _setClientObject:forKey:](self, "_setClientObject:forKey:", v4, 6);

}

- (NSString)description
{
  return (NSString *)-[XBApplicationSnapshotPredicate descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)setName:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[XBApplicationSnapshotPredicate _setClientObject:forKey:](self, "_setClientObject:forKey:", v4, 1);

}

- (void)setLaunchInterfaceIdentifier:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[XBApplicationSnapshotPredicate _setClientObject:forKey:](self, "_setClientObject:forKey:", v4, 3);

}

- (void)setStatusBarState:(unint64_t)a3
{
  -[XBApplicationSnapshotPredicate setStatusBarStateMask:](self, "setStatusBarStateMask:", XBStatusBarStateMaskForStatusBarState(a3));
}

- (NSString)name
{
  return (NSString *)-[XBApplicationSnapshotPredicate _clientObjectForKey:](self, "_clientObjectForKey:", 1);
}

- (NSString)launchInterfaceIdentifier
{
  return (NSString *)-[XBApplicationSnapshotPredicate _clientObjectForKey:](self, "_clientObjectForKey:", 3);
}

- (BOOL)isFullScreen
{
  return 0;
}

- (unint64_t)statusBarState
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v2 = -[XBApplicationSnapshotPredicate statusBarStateMask](self, "statusBarStateMask");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__XBApplicationSnapshotPredicate_statusBarState__block_invoke;
  v5[3] = &unk_24D7F4770;
  v5[4] = &v6;
  XBEnumerateStatusBarStatesMatchingMask(v2, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__XBApplicationSnapshotPredicate_statusBarState__block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *a3 = 1;
  return result;
}

- (XBDisplayEdgeInsetsWrapper)customSafeAreaInsets
{
  return (XBDisplayEdgeInsetsWrapper *)-[XBApplicationSnapshotPredicate _clientObjectForKey:](self, "_clientObjectForKey:", 13);
}

- (void)_removeClientObjectForKey:(unint64_t)a3
{
  -[BSMutableSettings setObject:forSetting:](self->_clientSettings, "setObject:forSetting:", 0, a3);
  -[BSMutableSettings setFlag:forSetting:](self->_clientSettings, "setFlag:forSetting:", 0x7FFFFFFFFFFFFFFFLL, a3);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[XBApplicationSnapshotPredicate succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x24BE38380], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[XBApplicationSnapshotPredicate descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[XBApplicationSnapshotPredicate succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__XBApplicationSnapshotPredicate_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_24D7F45F0;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

id __72__XBApplicationSnapshotPredicate_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id result;

  if (objc_msgSend(*(id *)(a1 + 32), "_hasClientObjectForKey:", 1))
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v2, "appendObject:withName:skipIfNil:", v3, CFSTR("name"), 0);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "_hasClientObjectForKey:", 2))
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v5, "appendObject:withName:skipIfNil:", v6, CFSTR("scheme"), 0);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "_hasClientObjectForKey:", 3))
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "launchInterfaceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v8, "appendObject:withName:skipIfNil:", v9, CFSTR("launchInterfaceIdentifier"), 0);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "_hasClientObjectForKey:", 9))
  {
    v11 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "requiredOSVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v11, "appendObject:withName:skipIfNil:", v12, CFSTR("requiredOSVersion"), 0);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "_hasClientObjectForKey:", 4))
    v14 = (id)objc_msgSend(*(id *)(a1 + 40), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 32), "interfaceOrientationMask"), CFSTR("orientationMask"));
  if (objc_msgSend(*(id *)(a1 + 32), "_hasClientObjectForKey:", 7))
  {
    v15 = *(void **)(a1 + 40);
    XBApplicationSnapshotContentTypeMaskDescription(objc_msgSend(*(id *)(a1 + 32), "contentTypeMask"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v15, "appendObject:withName:", v16, CFSTR("contentTypeMask"));

  }
  if (objc_msgSend(*(id *)(a1 + 32), "_hasClientObjectForKey:", 8))
  {
    v18 = *(void **)(a1 + 40);
    XBStatusBarStateMaskDescription(objc_msgSend(*(id *)(a1 + 32), "statusBarStateMask"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v18, "appendObject:withName:", v19, CFSTR("statusBarStateMask"));

  }
  if (objc_msgSend(*(id *)(a1 + 32), "_hasClientObjectForKey:", 5))
  {
    v21 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "referenceSize");
    v22 = (id)objc_msgSend(v21, "appendSize:withName:", CFSTR("size"));
  }
  if (objc_msgSend(*(id *)(a1 + 32), "_hasClientObjectForKey:", 6))
  {
    v23 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "imageScale");
    v24 = (id)objc_msgSend(v23, "appendFloat:withName:decimalPrecision:", CFSTR("scale"), 1);
  }
  result = (id)objc_msgSend(*(id *)(a1 + 32), "_hasClientObjectForKey:", 12);
  if ((_DWORD)result)
    return (id)objc_msgSend(*(id *)(a1 + 40), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 32), "userInterfaceStyle"), CFSTR("userInterfaceStyle"));
  return result;
}

@end
