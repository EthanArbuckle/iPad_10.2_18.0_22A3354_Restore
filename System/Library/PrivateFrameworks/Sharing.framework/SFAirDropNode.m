@implementation SFAirDropNode

+ (id)nodeWithSFNode:(__SFNode *)a3
{
  SFAirDropNode *v4;

  v4 = objc_alloc_init(SFAirDropNode);
  -[SFAirDropNode updateWithSFNode:](v4, "updateWithSFNode:", a3);
  return v4;
}

- (SFAirDropNode)init
{
  SFAirDropNode *v2;
  uint64_t v3;
  NSDate *discoveryDate;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFAirDropNode;
  v2 = -[SFAirDropNode init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    discoveryDate = v2->_discoveryDate;
    v2->_discoveryDate = (NSDate *)v3;

    v2->_sender = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_displayIcon);
  v3.receiver = self;
  v3.super_class = (Class)SFAirDropNode;
  -[SFAirDropNode dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *realName;
  void *v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[SFAirDropNode isSuggestion](self, "isSuggestion") && objc_msgSend(v5, "isSuggestion"))
    {
      realName = self->_realName;
      objc_msgSend(v5, "realName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[NSString isEqualToString:](realName, "isEqualToString:", v7);
    }
    else
    {
      -[SFAirDropNode node](self, "node");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = !valuesChanged(v7, (CFTypeRef)objc_msgSend(v5, "node"));
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  CFHashCode v3;

  -[SFAirDropNode node](self, "node");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CFHash(v2);

  return v3;
}

- (NSString)description
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  int64_t selectionReason;
  id v12;
  id v13;
  id v14;
  NSString *realName;
  id v17;

  objc_opt_class();
  NSAppendPrintF();
  v17 = 0;
  realName = self->_realName;
  NSAppendPrintF();
  v3 = v17;

  -[NSString stringByReplacingOccurrencesOfString:withString:](self->_displayName, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "), realName, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  v5 = v3;

  NSAppendPrintF();
  v6 = v5;

  NSAppendPrintF();
  v7 = v6;

  NSAppendPrintF();
  v8 = v7;

  NSAppendPrintF();
  v9 = v8;

  NSAppendPrintF();
  v10 = v9;

  selectionReason = self->_selectionReason;
  if (selectionReason >= 1)
  {
    NSAppendPrintF();
    v12 = v10;

    v10 = v12;
  }
  if (self->_rangingMeasurement)
  {
    NSAppendPrintF();
    v13 = v10;

    v10 = v13;
  }
  NSAppendPrintF();
  v14 = v10;

  return (NSString *)v14;
}

- (BOOL)isKnown
{
  return !-[SFAirDropNode isUnknown](self, "isUnknown");
}

- (void)updateWithSFNode:(__SFNode *)a3
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  CFSetRef v10;
  void *v11;
  void *v12;
  void *v13;
  CFSetRef v14;

  -[SFAirDropNode _updateDisplayIconWithSFNode:](self, "_updateDisplayIconWithSFNode:");
  self->_selectionReason = SFNodeGetSelectionReason((uint64_t)a3);
  self->_supportsCredentials = SFNodeSupportsCredentials((uint64_t)a3) != 0;
  self->_supportsFMF = SFNodeSupportsFMF((uint64_t)a3);
  self->_supportsPasses = SFNodeSupportsPasses((uint64_t)a3) != 0;
  self->_supportsMixedTypes = SFNodeSupportsMixedTypes((uint64_t)a3) != 0;
  self->_ultraWideBindCapable = SFNodeSupportsUWB((uint64_t)a3) != 0;
  v14 = SFNodeCopyKinds((uint64_t)a3);
  self->_disabled = -[__CFSet containsObject:](v14, "containsObject:", CFSTR("Disabled"));
  self->_me = -[__CFSet containsObject:](v14, "containsObject:", CFSTR("Me"));
  self->_unknown = -[__CFSet containsObject:](v14, "containsObject:", CFSTR("Unknown"));
  self->_monogram = -[__CFSet containsObject:](v14, "containsObject:", CFSTR("Monogram"));
  self->_classroom = -[__CFSet containsObject:](v14, "containsObject:", CFSTR("Classroom"));
  self->_classroomCourse = -[__CFSet containsObject:](v14, "containsObject:", CFSTR("ClassroomCourse"));
  self->_classroomGroup = -[__CFSet containsObject:](v14, "containsObject:", CFSTR("ClassroomGroup"));
  self->_suggestion = -[__CFSet containsObject:](v14, "containsObject:", CFSTR("Suggestion"));
  self->_rapport = -[__CFSet containsObject:](v14, "containsObject:", CFSTR("Rapport"));
  -[SFAirDropNode setNode:](self, "setNode:", a3);
  v5 = (__CFString *)SFNodeCopyRealName((uint64_t)a3);
  -[SFAirDropNode setRealName:](self, "setRealName:", v5);

  v6 = (__CFString *)SFNodeCopySecondaryName((uint64_t)a3);
  -[SFAirDropNode setSecondaryName:](self, "setSecondaryName:", v6);

  v7 = (__CFString *)SFNodeCopyContactIdentifier((uint64_t)a3);
  -[SFAirDropNode setContactIdentifier:](self, "setContactIdentifier:", v7);

  v8 = (__CFString *)SFNodeCopyModel((uint64_t)a3);
  -[SFAirDropNode setModel:](self, "setModel:", v8);

  v9 = (__CFString *)SFNodeCopyTransportBundleID((uint64_t)a3);
  if (v9)
    -[SFAirDropNode setTransportBundleID:](self, "setTransportBundleID:", v9);
  v10 = SFNodeCopyHandles((uint64_t)a3);
  -[SFAirDropNode setActualHandles:](self, "setActualHandles:", v10);

  v11 = (void *)SFNodeCopyRangingData((uint64_t)a3);
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (IsAppleInternalBuild())
  {
    if (CFPreferencesGetAppBooleanValue(CFSTR("ShowKnownInMagicHead"), CFSTR("com.apple.Sharing"), 0))
    {
      -[SFAirDropNode rangingMeasurement](self, "rangingMeasurement");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        if (!v12)
        {
          -[SFAirDropNode rangingMeasurement](self, "rangingMeasurement");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }
  -[SFAirDropNode updateDisplayName](self, "updateDisplayName");
  -[SFAirDropNode setRangingMeasurement:](self, "setRangingMeasurement:", v12);

}

- (void)_updateDisplayIconWithSFNode:(__SFNode *)a3
{
  void *v5;
  void *v6;
  const void *IconData;
  void *v8;
  void *v9;
  CGImage *v10;

  -[SFAirDropNode node](self, "node");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SFAirDropNode node](self, "node");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    IconData = (const void *)SFNodeGetIconData((uint64_t)v6);

  }
  else
  {
    IconData = 0;
  }

  if (a3)
  {
    v8 = (void *)SFNodeGetIconData((uint64_t)a3);
    if (v8)
    {
      v9 = v8;
      if (valuesChanged(IconData, v8))
      {
        v10 = SFCreateCGImageFromData(v9);
        -[SFAirDropNode setDisplayIcon:](self, "setDisplayIcon:", v10);
        CGImageRelease(v10);
      }
    }
  }
}

- (void)setRangingMeasurement:(id)a3
{
  id v5;
  CURangingMeasurement **p_rangingMeasurement;
  CURangingMeasurement *v7;
  CURangingMeasurement *v8;
  char v9;
  CURangingMeasurement *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  CURangingMeasurement *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CURangingMeasurement *v19;

  v5 = a3;
  p_rangingMeasurement = &self->_rangingMeasurement;
  v7 = self->_rangingMeasurement;
  v8 = (CURangingMeasurement *)v5;
  v19 = v8;
  if (v7 == v8)
  {

    v10 = v19;
LABEL_18:

    goto LABEL_19;
  }
  if ((v8 != 0) != (v7 == 0))
  {
    v9 = -[CURangingMeasurement isEqual:](v7, "isEqual:", v8);

    if ((v9 & 1) != 0)
      goto LABEL_19;
  }
  else
  {

  }
  objc_storeStrong((id *)&self->_rangingMeasurement, a3);
  +[SFSettingsDomain rootSettings](SFSettingsDomain, "rootSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "magicHeadSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "showRangingValues");

  if (v13)
  {
    v14 = -[CURangingMeasurement flags](*p_rangingMeasurement, "flags");
    v15 = (CURangingMeasurement *)objc_opt_new();
    v10 = v15;
    if ((v14 & 8) != 0)
    {
      -[CURangingMeasurement ptsScore](*p_rangingMeasurement, "ptsScore");
      -[CURangingMeasurement appendFormat:](v10, "appendFormat:", CFSTR("%.2f"), v16);
    }
    else
    {
      -[CURangingMeasurement appendString:](v15, "appendString:", CFSTR("nil"));
    }
    -[CURangingMeasurement appendString:](v10, "appendString:", CFSTR(","));
    if ((v14 & 2) != 0)
    {
      -[CURangingMeasurement horizontalAngle](*p_rangingMeasurement, "horizontalAngle");
      -[CURangingMeasurement appendFormat:](v10, "appendFormat:", CFSTR("%.2f"), v17);
    }
    else
    {
      -[CURangingMeasurement appendString:](v10, "appendString:", CFSTR("nil"));
    }
    -[CURangingMeasurement appendString:](v10, "appendString:", CFSTR("°"));
    -[CURangingMeasurement appendString:](v10, "appendString:", CFSTR(","));
    if ((v14 & 1) != 0)
    {
      -[CURangingMeasurement distanceMeters](*p_rangingMeasurement, "distanceMeters");
      -[CURangingMeasurement appendFormat:](v10, "appendFormat:", CFSTR("%.2f"), v18);
    }
    else
    {
      -[CURangingMeasurement appendString:](v10, "appendString:", CFSTR("nil"));
    }
    -[CURangingMeasurement appendString:](v10, "appendString:", CFSTR("↔︎"));
    -[SFAirDropNode appendDiscoveryInfoToDisplayName:](self, "appendDiscoveryInfoToDisplayName:", v10);
    -[SFAirDropNode setDisplayName:](self, "setDisplayName:", v10);
    goto LABEL_18;
  }
LABEL_19:

}

- (void)updateDisplayName
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  CFStringRef v8;
  __CFString *v9;
  __CFString *v10;
  CFStringRef v11;
  __CFString *v12;
  CFStringRef v13;
  id v14;
  __CFString *Name;
  __CFString *v16;
  NSPersonNameComponents *v17;
  NSPersonNameComponents *nameComponents;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  CFStringRef v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  id v33;

  -[SFAirDropNode node](self, "node");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_me && enableDeviceImages())
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = (__CFString *)SFNodeCopyModel((uint64_t)v3);
    objc_msgSend(v4, "stringWithFormat:", CFSTR("My %@"), v5);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

    -[SFAirDropNode setSecondaryName:](self, "setSecondaryName:", &stru_1E483B8E8);
    v6 = v27;
  }
  else
  {
    v6 = 0;
  }
  v28 = v6;
  if (!-[__CFString length](v6, "length") && (self->_unknown || self->_classroom))
  {
    v8 = SFNodeCopyDisplayName((uint64_t)v3);

    v7 = (__CFString *)v8;
  }
  else
  {
    v7 = v28;
  }
  v29 = v7;
  if (-[__CFString length](v7, "length") || self->_me)
  {
    v9 = v29;
  }
  else
  {
    v26 = SFNodeCopyNickName((uint64_t)v3);

    v9 = (__CFString *)v26;
  }
  v30 = v9;
  if (-[__CFString length](v9, "length") || !self->_me)
  {
    v10 = v30;
  }
  else
  {
    v11 = SFNodeCopyComputerName((uint64_t)v3);

    v10 = (__CFString *)v11;
  }
  v31 = v10;
  if (-[__CFString length](v10, "length") || !self->_suggestion)
  {
    v12 = v31;
  }
  else
  {
    v13 = SFNodeCopyDisplayName((uint64_t)v3);

    v12 = (__CFString *)v13;
  }
  v32 = v12;
  if (-[__CFString length](v12, "length"))
  {
    v14 = v32;
  }
  else
  {
    Name = (__CFString *)SFNodeCopyFirstName((uint64_t)v3);
    v16 = (__CFString *)SFNodeCopyLastName((uint64_t)v3);
    v17 = (NSPersonNameComponents *)objc_opt_new();
    nameComponents = self->_nameComponents;
    self->_nameComponents = v17;

    -[NSPersonNameComponents setGivenName:](self->_nameComponents, "setGivenName:", Name);
    -[NSPersonNameComponents setFamilyName:](self->_nameComponents, "setFamilyName:", v16);
    v19 = (void *)objc_opt_new();
    objc_msgSend(v19, "setStyle:", 0);
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "set_locale:", v20);

    objc_msgSend(v19, "stringFromPersonNameComponents:", self->_nameComponents);
    v21 = objc_claimAutoreleasedReturnValue();

    v14 = (id)v21;
  }
  v33 = v14;
  -[SFAirDropNode setDisplayName:](self, "setDisplayName:", v14);
  +[SFSettingsDomain rootSettings](SFSettingsDomain, "rootSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "magicHeadSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "showRangingValues");

  if (v24)
  {
    v25 = (void *)objc_msgSend(v33, "mutableCopy");
    -[SFAirDropNode appendDiscoveryInfoToDisplayName:](self, "appendDiscoveryInfoToDisplayName:", v25);
    -[SFAirDropNode setDisplayName:](self, "setDisplayName:", v25);

  }
}

- (void)appendDiscoveryInfoToDisplayName:(id)a3
{
  id v4;
  void *v5;
  CFArrayRef v6;
  const __CFArray *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  CFSetRef v14;
  CFSetRef v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SFAirDropNode node](self, "node");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SFNodeCopySiblingNodes((uint64_t)v5);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v6;
  v8 = -[__CFArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v8)
  {

    goto LABEL_18;
  }
  v9 = v8;
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v17;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v17 != v12)
        objc_enumerationMutation(v7);
      v14 = SFNodeCopyKinds(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
      v15 = v14;
      if ((v11 & v10 & 1) != 0)
      {
        v10 = 1;
LABEL_9:
        v11 = 1;
        goto LABEL_11;
      }
      if ((-[__CFSet containsObject:](v14, "containsObject:", CFSTR("Rapport"), (_QWORD)v16) & 1) != 0)
        goto LABEL_9;
      v10 |= -[__CFSet containsObject:](v15, "containsObject:", CFSTR("Bonjour"));
LABEL_11:

    }
    v9 = -[__CFArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  }
  while (v9);

  if ((v11 & 1) != 0)
    objc_msgSend(v4, "appendString:", CFSTR(",B"));
  if ((v10 & 1) != 0)
    objc_msgSend(v4, "appendString:", CFSTR(",A"));
LABEL_18:

}

- (id)displayNameForLocale:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSPersonNameComponents *v11;
  void *v12;
  NSObject *v13;

  v4 = a3;
  +[SFSettingsDomain rootSettings](SFSettingsDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "magicHeadSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "showRangingValues");

  if (v7)
  {
    -[SFAirDropNode displayName](self, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v4;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      airdrop_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[SFAirDropNode displayNameForLocale:].cold.2();

    }
    v11 = self->_nameComponents;
    if (v11)
    {
      v12 = (void *)objc_opt_new();
      objc_msgSend(v12, "setStyle:", 0);
      objc_msgSend(v12, "set_locale:", v9);
      objc_msgSend(v12, "stringFromPersonNameComponents:", v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      airdrop_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[SFAirDropNode displayNameForLocale:].cold.1(self, v13);

      -[SFAirDropNode displayName](self, "displayName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v8;
}

- (void)startSendForBundleID:(id)a3 sessionID:(id)a4 items:(id)a5 description:(id)a6 previewImage:(CGImage *)a7 fromShareSheet:(BOOL)a8
{
  _BOOL8 v8;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  __SFOperation *v20;
  __int128 v21;
  uint64_t (*v22)(_QWORD);
  uint64_t (*v23)(_QWORD);
  uint64_t v24;

  v8 = a8;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  if (!self->_sender)
  {
    airdrop_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[SFAirDropNode startSendForBundleID:sessionID:items:description:previewImage:fromShareSheet:].cold.1(a2, v17, v19);

    v20 = (__SFOperation *)SFOperationCreate(0, CFSTR("Sender"));
    self->_sender = v20;
    *(_QWORD *)&v21 = 0;
    *((_QWORD *)&v21 + 1) = self;
    v22 = MEMORY[0x1E0C98BD0];
    v23 = MEMORY[0x1E0C98BC0];
    v24 = 0;
    SFOperationSetClient((uint64_t)v20, (uint64_t)operationCallBack, &v21);
    SFOperationSetDispatchQueue((uint64_t)self->_sender, MEMORY[0x1E0C80D38]);
    SFOperationSetProperty((pthread_mutex_t *)self->_sender, CFSTR("Node"), self->_node);
    if (v15)
      SFOperationSetProperty((pthread_mutex_t *)self->_sender, CFSTR("BundleID"), v15);
    if (a7)
      SFOperationSetProperty((pthread_mutex_t *)self->_sender, CFSTR("FileIcon"), a7);
    SFOperationSetProperty((pthread_mutex_t *)self->_sender, CFSTR("FromShareSheet"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8));
    SFOperationSetProperty((pthread_mutex_t *)self->_sender, CFSTR("Items"), v17);
    if (v16)
      SFOperationSetProperty((pthread_mutex_t *)self->_sender, CFSTR("SessionID"), v16);
    if (v18)
      SFOperationSetProperty((pthread_mutex_t *)self->_sender, CFSTR("ItemsDescription"), v18);
    SFOperationResume((uint64_t)self->_sender);
  }

}

- (void)cancelSend
{
  __SFOperation *sender;

  sender = self->_sender;
  if (sender)
  {
    SFOperationCancel((uint64_t)sender);
    CFRelease(self->_sender);
    self->_sender = 0;
  }
}

- (void)handleOperationCallback:(__SFOperation *)a3 event:(int64_t)a4 withResults:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;

  v8 = a5;
  switch(a4)
  {
    case 2:
      SFOperationResume((uint64_t)a3);
      break;
    case 3:
    case 5:
    case 6:
    case 7:
    case 8:
    case 11:
    case 14:
    case 15:
      break;
    case 4:
    case 9:
      goto LABEL_6;
    case 10:
      airdrop_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[SFAirDropNode handleOperationCallback:event:withResults:].cold.2();

LABEL_6:
      -[SFAirDropNode cancelSend](self, "cancelSend");
      break;
    default:
      airdrop_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[SFAirDropNode handleOperationCallback:event:withResults:].cold.1(a4, (uint64_t)v8, v10);

      break;
  }

}

- (NSString)contactIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setContactIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (CGImage)displayIcon
{
  return (CGImage *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDisplayIcon:(CGImage *)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSUUID)endpointUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEndpointUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSUUID)nodeIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setNodeIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)realName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRealName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setModel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (int64_t)selectionReason
{
  return self->_selectionReason;
}

- (void)setSelectionReason:(int64_t)a3
{
  self->_selectionReason = a3;
}

- (BOOL)isClassroom
{
  return self->_classroom;
}

- (void)setClassroom:(BOOL)a3
{
  self->_classroom = a3;
}

- (BOOL)isSuggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(BOOL)a3
{
  self->_suggestion = a3;
}

- (NSSet)formattedHandles
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFormattedHandles:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSNumber)suggestionIndex
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSuggestionIndex:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSString)transportBundleID
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTransportBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (CNContact)contact
{
  return (CNContact *)objc_getProperty(self, a2, 128, 1);
}

- (void)setContact:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSDate)discoveryDate
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (id)node
{
  return objc_getProperty(self, a2, 144, 1);
}

- (void)setNode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSString)secondaryName
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSecondaryName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSSet)actualHandles
{
  return (NSSet *)objc_getProperty(self, a2, 160, 1);
}

- (void)setActualHandles:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (CURangingMeasurement)rangingMeasurement
{
  return self->_rangingMeasurement;
}

- (NSSet)contactIDs
{
  return self->_contactIDs;
}

- (void)setContactIDs:(id)a3
{
  objc_storeStrong((id *)&self->_contactIDs, a3);
}

- (NSString)derivedIntentIdentifier
{
  return self->_derivedIntentIdentifier;
}

- (void)setDerivedIntentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (BOOL)isMe
{
  return self->_me;
}

- (void)setMe:(BOOL)a3
{
  self->_me = a3;
}

- (BOOL)isUnknown
{
  return self->_unknown;
}

- (void)setUnknown:(BOOL)a3
{
  self->_unknown = a3;
}

- (BOOL)isMonogram
{
  return self->_monogram;
}

- (void)setMonogram:(BOOL)a3
{
  self->_monogram = a3;
}

- (BOOL)isclassroomGroup
{
  return self->_classroomGroup;
}

- (void)setClassroomGroup:(BOOL)a3
{
  self->_classroomGroup = a3;
}

- (BOOL)isClassroomCourse
{
  return self->_classroomCourse;
}

- (void)setClassroomCourse:(BOOL)a3
{
  self->_classroomCourse = a3;
}

- (BOOL)isRapport
{
  return self->_rapport;
}

- (void)setRapport:(BOOL)a3
{
  self->_rapport = a3;
}

- (BOOL)isUltraWideBindCapable
{
  return self->_ultraWideBindCapable;
}

- (void)setUltraWideBindCapable:(BOOL)a3
{
  self->_ultraWideBindCapable = a3;
}

- (BOOL)supportsCredentials
{
  return self->_supportsCredentials;
}

- (BOOL)supportsFMF
{
  return self->_supportsFMF;
}

- (BOOL)supportsPasses
{
  return self->_supportsPasses;
}

- (BOOL)supportsMixedTypes
{
  return self->_supportsMixedTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_derivedIntentIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIDs, 0);
  objc_storeStrong((id *)&self->_rangingMeasurement, 0);
  objc_storeStrong((id *)&self->_actualHandles, 0);
  objc_storeStrong((id *)&self->_secondaryName, 0);
  objc_storeStrong(&self->_node, 0);
  objc_storeStrong((id *)&self->_discoveryDate, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_transportBundleID, 0);
  objc_storeStrong((id *)&self->_suggestionIndex, 0);
  objc_storeStrong((id *)&self->_formattedHandles, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_realName, 0);
  objc_storeStrong((id *)&self->_nodeIdentifier, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
}

- (void)displayNameForLocale:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_1A2830000, a2, OS_LOG_TYPE_DEBUG, "displayNameForLocale: _nameComponents = nil, fall back to displayName: %@", v4, 0xCu);

}

- (void)displayNameForLocale:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_0(&dword_1A2830000, v0, v1, "displayNameForLocale: inLocale = nil, using currentLocale: %@", v2, v3, v4, v5, v6);
}

- (void)startSendForBundleID:(NSObject *)a3 sessionID:items:description:previewImage:fromShareSheet:.cold.1(const char *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "valueForKeyPath:", CFSTR("class"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  v11 = 2112;
  v12 = a2;
  _os_log_debug_impl(&dword_1A2830000, a3, OS_LOG_TYPE_DEBUG, "AirDrop %@ Items \nTypes: [%@], \nValues: [%@]", (uint8_t *)&v7, 0x20u);

  OUTLINED_FUNCTION_1_0();
}

- (void)handleOperationCallback:(uint64_t)a1 event:(uint64_t)a2 withResults:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v5;
  uint8_t v6[12];
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a1;
  v11 = *MEMORY[0x1E0C80C00];
  SFOperationEventToString(a1);
  OUTLINED_FUNCTION_7();
  v7 = 1024;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_1A2830000, a3, OS_LOG_TYPE_ERROR, "Sender UNHANDLED EVENT %@ [%d] %@", v6, 0x1Cu);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleOperationCallback:event:withResults:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_0(&dword_1A2830000, v0, v1, "Sender kSFOperationEventErrorOccured %@", v2, v3, v4, v5, v6);
}

@end
