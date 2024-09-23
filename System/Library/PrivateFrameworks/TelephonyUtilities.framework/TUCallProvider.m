@implementation TUCallProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconTemplateImageData, 0);
  objc_storeStrong((id *)&self->_originalRingtoneSoundURL, 0);
  objc_storeStrong((id *)&self->_sandboxExtendedRingtoneSoundURL, 0);
  objc_storeStrong((id *)&self->_prioritizedSenderIdentities, 0);
  objc_storeStrong((id *)&self->_handoffIdentifiers, 0);
  objc_storeStrong((id *)&self->_emergencyLabeledHandles, 0);
  objc_storeStrong((id *)&self->_emergencyHandles, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_supportedHandleTypes, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  _BOOL8 v31;
  void *v32;
  _BOOL8 v33;
  void *v34;
  _BOOL8 v35;
  void *v36;
  _BOOL8 v37;
  void *v38;
  _BOOL8 v39;
  void *v40;
  _BOOL8 v41;
  void *v42;
  _BOOL8 v43;
  void *v44;
  _BOOL8 v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;

  v4 = a3;
  -[TUCallProvider identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[TUCallProvider bundleURL](self, "bundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bundleURL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[TUCallProvider bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bundleIdentifier);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[TUCallProvider localizedName](self, "localizedName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localizedName);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[TUCallProvider emergencyHandles](self, "emergencyHandles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_emergencyHandles);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[TUCallProvider emergencyLabeledHandles](self, "emergencyLabeledHandles");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_emergencyLabeledHandles);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v16);

  -[TUCallProvider handoffIdentifiers](self, "handoffIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_handoffIdentifiers);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, v18);

  -[TUCallProvider prioritizedSenderIdentities](self, "prioritizedSenderIdentities");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_prioritizedSenderIdentities);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, v20);

  -[TUCallProvider sandboxExtendedRingtoneSoundURL](self, "sandboxExtendedRingtoneSoundURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sandboxExtendedRingtoneSoundURL);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, v22);

  -[TUCallProvider originalRingtoneSoundURL](self, "originalRingtoneSoundURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_originalRingtoneSoundURL);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, v24);

  -[TUCallProvider iconTemplateImageData](self, "iconTemplateImageData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_iconTemplateImageData);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, v26);

  v27 = -[TUCallProvider maximumCallGroups](self, "maximumCallGroups");
  NSStringFromSelector(sel_maximumCallGroups);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v27, v28);

  v29 = -[TUCallProvider maximumCallsPerCallGroup](self, "maximumCallsPerCallGroup");
  NSStringFromSelector(sel_maximumCallsPerCallGroup);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v29, v30);

  v31 = -[TUCallProvider supportsAudioOnly](self, "supportsAudioOnly");
  NSStringFromSelector(sel_supportsAudioOnly);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v31, v32);

  v33 = -[TUCallProvider supportsAudioAndVideo](self, "supportsAudioAndVideo");
  NSStringFromSelector(sel_supportsAudioAndVideo);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v33, v34);

  v35 = -[TUCallProvider supportsEmergency](self, "supportsEmergency");
  NSStringFromSelector(sel_supportsEmergency);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v35, v36);

  v37 = -[TUCallProvider supportsVoicemail](self, "supportsVoicemail");
  NSStringFromSelector(sel_supportsVoicemail);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v37, v38);

  v39 = -[TUCallProvider supportsRecents](self, "supportsRecents");
  NSStringFromSelector(sel_supportsRecents);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v39, v40);

  v41 = -[TUCallProvider supportsCurrentPlatform](self, "supportsCurrentPlatform");
  NSStringFromSelector(sel_supportsCurrentPlatform);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v41, v42);

  v43 = -[TUCallProvider supportsRinging](self, "supportsRinging");
  NSStringFromSelector(sel_supportsRinging);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v43, v44);

  v45 = -[TUCallProvider supportsDynamicSystemUI](self, "supportsDynamicSystemUI");
  NSStringFromSelector(sel_supportsDynamicSystemUI);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v45, v46);

  v47 = -[TUCallProvider audioSessionID](self, "audioSessionID");
  NSStringFromSelector(sel_audioSessionID);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt32:forKey:", v47, v48);

  -[TUCallProvider supportedHandleTypes](self, "supportedHandleTypes");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_supportedHandleTypes);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v50, v49);

}

- (NSOrderedSet)prioritizedSenderIdentities
{
  return self->_prioritizedSenderIdentities;
}

- (BOOL)supportsAudioAndVideo
{
  return self->_supportsAudioAndVideo;
}

- (BOOL)supportsAudioOnly
{
  return self->_supportsAudioOnly;
}

- (NSArray)emergencyHandles
{
  return self->_emergencyHandles;
}

- (BOOL)supportsVoicemail
{
  return self->_supportsVoicemail;
}

- (BOOL)supportsRinging
{
  return self->_supportsRinging;
}

- (BOOL)supportsRecents
{
  return self->_supportsRecents;
}

- (BOOL)supportsEmergency
{
  return self->_supportsEmergency;
}

- (BOOL)supportsDynamicSystemUI
{
  return self->_supportsDynamicSystemUI;
}

- (NSSet)supportedHandleTypes
{
  return self->_supportedHandleTypes;
}

- (TUSandboxExtendedURL)sandboxExtendedRingtoneSoundURL
{
  return self->_sandboxExtendedRingtoneSoundURL;
}

- (NSURL)originalRingtoneSoundURL
{
  return self->_originalRingtoneSoundURL;
}

- (unint64_t)maximumCallsPerCallGroup
{
  return self->_maximumCallsPerCallGroup;
}

- (unint64_t)maximumCallGroups
{
  return self->_maximumCallGroups;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSData)iconTemplateImageData
{
  return self->_iconTemplateImageData;
}

- (NSArray)handoffIdentifiers
{
  return self->_handoffIdentifiers;
}

- (NSArray)emergencyLabeledHandles
{
  return self->_emergencyLabeledHandles;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (BOOL)supportsCurrentPlatform
{
  return !-[TUCallProvider isTinCanProvider](self, "isTinCanProvider") && self->_supportsCurrentPlatform;
}

- (BOOL)isTinCanProvider
{
  void *v2;
  char v3;

  -[TUCallProvider identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.telephonyutilities.callservicesd.TinCan"));

  return v3;
}

- (BOOL)isFaceTimeProvider
{
  void *v2;
  char v3;

  -[TUCallProvider identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.telephonyutilities.callservicesd.FaceTimeProvider"));

  return v3;
}

- (BOOL)isTelephonyProvider
{
  NSObject *v3;
  void *v5;
  char v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[TUCallProvider isSuperboxProvider](self, "isSuperboxProvider"))
  {
    TUDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = CFSTR("TUShouldUseSuperBoxTelephonyProvider");
      _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Because this is an internal install and the %@ default is set, com.apple.Superbox (aka Speakerbox) instead of TUCallProvider                     is acting as a telephony provider", (uint8_t *)&v7, 0xCu);
    }

    return 0;
  }
  else
  {
    -[TUCallProvider identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.coretelephony"));

    return v6;
  }
}

- (BOOL)isSuperboxProvider
{
  void *v3;
  char v4;
  void *v6;
  char v7;

  if (TUShouldUseSuperboxTelephonyProvider())
  {
    -[TUCallProvider identifier](self, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.coretelephony"));

    if ((v4 & 1) != 0)
      return 1;
  }
  -[TUCallProvider identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.Superbox"));

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (TUCallProvider)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  TUCallProvider *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSURL *bundleURL;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSString *bundleIdentifier;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSString *localizedName;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *emergencyHandles;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSArray *emergencyLabeledHandles;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSArray *handoffIdentifiers;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSOrderedSet *prioritizedSenderIdentities;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  TUSandboxExtendedURL *sandboxExtendedRingtoneSoundURL;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  NSURL *originalRingtoneSoundURL;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  NSData *iconTemplateImageData;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  NSSet *supportedHandleTypes;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TUCallProvider initWithIdentifier:](self, "initWithIdentifier:", v7);

  if (v8)
  {
    v9 = objc_opt_class();
    NSStringFromSelector(sel_bundleURL);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    bundleURL = v8->_bundleURL;
    v8->_bundleURL = (NSURL *)v11;

    v13 = objc_opt_class();
    NSStringFromSelector(sel_bundleIdentifier);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v15;

    v17 = objc_opt_class();
    NSStringFromSelector(sel_localizedName);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    localizedName = v8->_localizedName;
    v8->_localizedName = (NSString *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_emergencyHandles);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    emergencyHandles = v8->_emergencyHandles;
    v8->_emergencyHandles = (NSArray *)v25;

    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_emergencyLabeledHandles);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    emergencyLabeledHandles = v8->_emergencyLabeledHandles;
    v8->_emergencyLabeledHandles = (NSArray *)v31;

    v33 = (void *)MEMORY[0x1E0C99E60];
    v34 = objc_opt_class();
    objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_handoffIdentifiers);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, v36);
    v37 = objc_claimAutoreleasedReturnValue();
    handoffIdentifiers = v8->_handoffIdentifiers;
    v8->_handoffIdentifiers = (NSArray *)v37;

    v39 = (void *)MEMORY[0x1E0C99E60];
    v40 = objc_opt_class();
    objc_msgSend(v39, "setWithObjects:", v40, objc_opt_class(), 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_prioritizedSenderIdentities);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v41, v42);
    v43 = objc_claimAutoreleasedReturnValue();
    prioritizedSenderIdentities = v8->_prioritizedSenderIdentities;
    v8->_prioritizedSenderIdentities = (NSOrderedSet *)v43;

    v45 = objc_opt_class();
    NSStringFromSelector(sel_sandboxExtendedRingtoneSoundURL);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v45, v46);
    v47 = objc_claimAutoreleasedReturnValue();
    sandboxExtendedRingtoneSoundURL = v8->_sandboxExtendedRingtoneSoundURL;
    v8->_sandboxExtendedRingtoneSoundURL = (TUSandboxExtendedURL *)v47;

    v49 = objc_opt_class();
    NSStringFromSelector(sel_originalRingtoneSoundURL);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v49, v50);
    v51 = objc_claimAutoreleasedReturnValue();
    originalRingtoneSoundURL = v8->_originalRingtoneSoundURL;
    v8->_originalRingtoneSoundURL = (NSURL *)v51;

    v53 = objc_opt_class();
    NSStringFromSelector(sel_iconTemplateImageData);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v53, v54);
    v55 = objc_claimAutoreleasedReturnValue();
    iconTemplateImageData = v8->_iconTemplateImageData;
    v8->_iconTemplateImageData = (NSData *)v55;

    NSStringFromSelector(sel_maximumCallGroups);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_maximumCallGroups = objc_msgSend(v4, "decodeIntegerForKey:", v57);

    NSStringFromSelector(sel_maximumCallsPerCallGroup);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_maximumCallsPerCallGroup = objc_msgSend(v4, "decodeIntegerForKey:", v58);

    NSStringFromSelector(sel_supportsAudioOnly);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_supportsAudioOnly = objc_msgSend(v4, "decodeBoolForKey:", v59);

    NSStringFromSelector(sel_supportsAudioAndVideo);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_supportsAudioAndVideo = objc_msgSend(v4, "decodeBoolForKey:", v60);

    NSStringFromSelector(sel_supportsEmergency);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_supportsEmergency = objc_msgSend(v4, "decodeBoolForKey:", v61);

    NSStringFromSelector(sel_supportsVoicemail);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_supportsVoicemail = objc_msgSend(v4, "decodeBoolForKey:", v62);

    NSStringFromSelector(sel_supportsRecents);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_supportsRecents = objc_msgSend(v4, "decodeBoolForKey:", v63);

    NSStringFromSelector(sel_supportsCurrentPlatform);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_supportsCurrentPlatform = objc_msgSend(v4, "decodeBoolForKey:", v64);

    NSStringFromSelector(sel_supportsRinging);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_supportsRinging = objc_msgSend(v4, "decodeBoolForKey:", v65);

    NSStringFromSelector(sel_supportsDynamicSystemUI);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_supportsDynamicSystemUI = objc_msgSend(v4, "decodeBoolForKey:", v66);

    NSStringFromSelector(sel_audioSessionID);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_audioSessionID = objc_msgSend(v4, "decodeInt32ForKey:", v67);

    v68 = (void *)MEMORY[0x1E0C99E60];
    v69 = objc_opt_class();
    objc_msgSend(v68, "setWithObjects:", v69, objc_opt_class(), 0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_supportedHandleTypes);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v70, v71);
    v72 = objc_claimAutoreleasedReturnValue();
    supportedHandleTypes = v8->_supportedHandleTypes;
    v8->_supportedHandleTypes = (NSSet *)v72;

  }
  return v8;
}

- (TUCallProvider)initWithIdentifier:(id)a3
{
  id v5;
  TUCallProvider *v6;
  TUCallProvider *v7;
  NSArray *emergencyHandles;
  NSArray *v9;
  NSArray *emergencyLabeledHandles;
  NSArray *handoffIdentifiers;
  uint64_t v12;
  NSOrderedSet *prioritizedSenderIdentities;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TUCallProvider;
  v6 = -[TUCallProvider init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v7->_supportsCurrentPlatform = 1;
    v7->_supportsRinging = 1;
    emergencyHandles = v7->_emergencyHandles;
    v9 = (NSArray *)MEMORY[0x1E0C9AA60];
    v7->_emergencyHandles = (NSArray *)MEMORY[0x1E0C9AA60];

    emergencyLabeledHandles = v7->_emergencyLabeledHandles;
    v7->_emergencyLabeledHandles = v9;

    handoffIdentifiers = v7->_handoffIdentifiers;
    v7->_handoffIdentifiers = v9;

    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v12 = objc_claimAutoreleasedReturnValue();
    prioritizedSenderIdentities = v7->_prioritizedSenderIdentities;
    v7->_prioritizedSenderIdentities = (NSOrderedSet *)v12;

  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isSystemProvider
{
  NSObject *v3;
  uint8_t v5[16];

  if (_TUIsInternalInstall() && -[TUCallProvider isSuperboxProvider](self, "isSuperboxProvider"))
  {
    TUDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Because this is an internal install, com.apple.Superbox (aka Speakerbox) is acting as a system provider", v5, 2u);
    }

    if (!-[TUCallProvider isTelephonyProvider](self, "isTelephonyProvider")
      && !-[TUCallProvider isFaceTimeProvider](self, "isFaceTimeProvider")
      && !-[TUCallProvider isTinCanProvider](self, "isTinCanProvider"))
    {
      return -[TUCallProvider isSuperboxProvider](self, "isSuperboxProvider");
    }
  }
  else if (!-[TUCallProvider isTelephonyProvider](self, "isTelephonyProvider")
         && !-[TUCallProvider isFaceTimeProvider](self, "isFaceTimeProvider"))
  {
    return -[TUCallProvider isTinCanProvider](self, "isTinCanProvider");
  }
  return 1;
}

- (void)setSupportsRecents:(BOOL)a3
{
  self->_supportsRecents = a3;
}

- (void)setSupportsAudioOnly:(BOOL)a3
{
  self->_supportsAudioOnly = a3;
}

- (void)setSupportedHandleTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setLocalizedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setSupportsVoicemail:(BOOL)a3
{
  self->_supportsVoicemail = a3;
}

- (void)setSupportsEmergency:(BOOL)a3
{
  self->_supportsEmergency = a3;
}

- (void)setSupportsAudioAndVideo:(BOOL)a3
{
  self->_supportsAudioAndVideo = a3;
}

- (OS_tcc_identity)assumedIdentity
{
  void *v2;
  void *v3;

  -[TUCallProvider bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "tu_assumedIdentityForBundleIdentifier:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (OS_tcc_identity *)v3;
}

- (TUCallProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUCallProvider.m"), 43, CFSTR("%s is not available. Use a designated initializer instead."), "-[TUCallProvider init]");

  return 0;
}

- (id)description
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
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallProvider localizedName](self, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" localizedName=%@"), v4);

  -[TUCallProvider identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" identifier=%@"), v5);

  -[TUCallProvider bundleURL](self, "bundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" bundleURL=%@"), v6);

  -[TUCallProvider bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" bundleIdentifier=%@"), v7);

  -[TUCallProvider sandboxExtendedRingtoneSoundURL](self, "sandboxExtendedRingtoneSoundURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" sandboxExtendedRingtoneSoundURL=%@"), v8);

  -[TUCallProvider originalRingtoneSoundURL](self, "originalRingtoneSoundURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" originalRingtoneSoundURL=%@"), v9);

  -[TUCallProvider iconTemplateImageData](self, "iconTemplateImageData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" iconTemplateImageData=%p"), v10);

  objc_msgSend(v3, "appendFormat:", CFSTR(" maximumCallGroups=%lu"), -[TUCallProvider maximumCallGroups](self, "maximumCallGroups"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" maximumCallsPerCallGroup=%lu"), -[TUCallProvider maximumCallsPerCallGroup](self, "maximumCallsPerCallGroup"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" supportsAudioOnly=%d"), -[TUCallProvider supportsAudioOnly](self, "supportsAudioOnly"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" supportsAudioAndVideo=%d"), -[TUCallProvider supportsAudioAndVideo](self, "supportsAudioAndVideo"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" supportsEmergency=%d"), -[TUCallProvider supportsEmergency](self, "supportsEmergency"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" supportsVoicemail=%d"), -[TUCallProvider supportsVoicemail](self, "supportsVoicemail"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" supportsRecents=%d"), -[TUCallProvider supportsRecents](self, "supportsRecents"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" supportsCurrentPlatform=%d"), -[TUCallProvider supportsCurrentPlatform](self, "supportsCurrentPlatform"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" supportsRinging=%d"), -[TUCallProvider supportsRinging](self, "supportsRinging"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" audioSessionID=%u"), -[TUCallProvider audioSessionID](self, "audioSessionID"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" sandboxExtensionHandle=%lld"), -[TUCallProvider sandboxExtensionHandle](self, "sandboxExtensionHandle"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" supportsDynamicSystemUI=%d"), -[TUCallProvider supportsDynamicSystemUI](self, "supportsDynamicSystemUI"));
  -[TUCallProvider supportedHandleTypes](self, "supportedHandleTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR(","));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" supportedHandleTypes=%@"), v13);

  -[TUCallProvider emergencyHandles](self, "emergencyHandles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    -[TUCallProvider emergencyHandles](self, "emergencyHandles");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR(", "));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" emergencyHandles=%@"), v17);

  }
  -[TUCallProvider emergencyLabeledHandles](self, "emergencyLabeledHandles");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    -[TUCallProvider emergencyLabeledHandles](self, "emergencyLabeledHandles");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "componentsJoinedByString:", CFSTR(", "));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" emergencyLabeledHandles=%@"), v21);

  }
  -[TUCallProvider handoffIdentifiers](self, "handoffIdentifiers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (v23)
  {
    -[TUCallProvider handoffIdentifiers](self, "handoffIdentifiers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "componentsJoinedByString:", CFSTR(", "));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" handoffIdentifiers=%@"), v25);

  }
  -[TUCallProvider prioritizedSenderIdentities](self, "prioritizedSenderIdentities");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (v27)
  {
    -[TUCallProvider prioritizedSenderIdentities](self, "prioritizedSenderIdentities");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "array");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "componentsJoinedByString:", CFSTR(", "));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" prioritizedSenderIdentities=%@"), v30);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)supportsHandleType:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[TUCallProvider supportedHandleTypes](self, "supportedHandleTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (BOOL)supportsGuestModeBroadcastToDeviceType:(int64_t)a3
{
  return 0;
}

- (TUCallProvider)base
{
  return (TUCallProvider *)(id)-[TUCallProvider copy](self, "copy");
}

- (id)senderIdentityForUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TUCallProvider prioritizedSenderIdentities](self, "prioritizedSenderIdentities", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "UUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)setSupportsCurrentPlatform:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[TUCallProvider identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "setSupportsCurrentPlatform provider: %@ supportsCurrentPlatform: %d", (uint8_t *)&v8, 0x12u);

  }
  if (-[TUCallProvider isTinCanProvider](self, "isTinCanProvider") && v3)
  {
    TUDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[TUCallProvider setSupportsCurrentPlatform:].cold.1(v7);

  }
  self->_supportsCurrentPlatform = v3;
}

- (id)senderIdentityForAccountUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TUCallProvider prioritizedSenderIdentities](self, "prioritizedSenderIdentities", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "accountUUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)senderIdentityForHandle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[TUCallProvider prioritizedSenderIdentities](self, "prioritizedSenderIdentities", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v6)
    goto LABEL_19;
  v7 = *(_QWORD *)v20;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(_QWORD *)v20 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
      objc_msgSend(v9, "handle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToHandle:", v4);

      if (v11)
      {
        v6 = v9;
        goto LABEL_19;
      }
      if (objc_msgSend(v4, "type") == 2)
      {
        objc_msgSend(v9, "handle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)PNCopyBestGuessCountryCodeForNumber();

        if (objc_msgSend(v14, "length"))
        {
          if (!v14)
            goto LABEL_13;
        }
        else
        {
          TUHomeCountryCode();
          v15 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v15;
          if (!v15)
          {
LABEL_13:

            continue;
          }
        }
        objc_msgSend(v9, "handle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isCanonicallyEqualToHandle:isoCountryCode:", v4, v14);

        if ((v17 & 1) != 0)
        {
          v6 = v9;

          goto LABEL_19;
        }
        goto LABEL_13;
      }
    }
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
      continue;
    break;
  }
LABEL_19:

  return v6;
}

- (id)displayAppBundleIdentifier
{
  __CFString *v3;

  if (-[TUCallProvider isSystemProvider](self, "isSystemProvider"))
  {
    if (-[TUCallProvider isTelephonyProvider](self, "isTelephonyProvider")
      && +[TUCallCapabilities supportsPrimaryCalling](TUCallCapabilities, "supportsPrimaryCalling"))
    {
      v3 = CFSTR("com.apple.mobilephone");
    }
    else
    {
      TUPreferredFaceTimeBundleIdentifier();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[TUCallProvider bundleIdentifier](self, "bundleIdentifier");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)inCallUIBundleIdentifier
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  v3 = CFSTR("com.apple.InCallService");
  if (-[TUCallProvider isSystemProvider](self, "isSystemProvider"))
  {
    v4 = v3;
  }
  else
  {
    -[TUCallProvider bundleIdentifier](self, "bundleIdentifier");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (NSURL)ringtoneSoundURL
{
  void *v2;
  void *v3;

  -[TUCallProvider sandboxExtendedRingtoneSoundURL](self, "sandboxExtendedRingtoneSoundURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)setRingtoneSoundURL:(id)a3
{
  TUSandboxExtendedURL *v4;
  id v5;

  v5 = a3;
  if (v5)
  {
    v4 = -[TUSandboxExtendedURL initWithURL:]([TUSandboxExtendedURL alloc], "initWithURL:", v5);
    -[TUCallProvider setSandboxExtendedRingtoneSoundURL:](self, "setSandboxExtendedRingtoneSoundURL:", v4);

  }
  else
  {
    -[TUCallProvider setSandboxExtendedRingtoneSoundURL:](self, "setSandboxExtendedRingtoneSoundURL:", 0);
  }

}

- (void)setSenderIdentities:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithSet:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TUCallProvider setPrioritizedSenderIdentities:](self, "setPrioritizedSenderIdentities:", v4);

}

- (id)senderIdentities
{
  void *v2;
  void *v3;

  -[TUCallProvider prioritizedSenderIdentities](self, "prioritizedSenderIdentities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TUCallProvider isEqualToCallProvider:](self, "isEqualToCallProvider:", v4);

  return v5;
}

- (BOOL)isEqualToCallProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  unsigned int v30;
  void *v31;
  char v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;

  v4 = a3;
  -[TUCallProvider identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[TUCallProvider bundleURL](self, "bundleURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      -[TUCallProvider bundleIdentifier](self, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (TUStringsAreEqualOrNil((unint64_t)v9, (uint64_t)v10))
      {
        -[TUCallProvider localizedName](self, "localizedName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "localizedName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (TUStringsAreEqualOrNil((unint64_t)v11, (uint64_t)v12))
        {
          v47 = v11;
          -[TUCallProvider emergencyHandles](self, "emergencyHandles");
          v13 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "emergencyHandles");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = (void *)v13;
          if (TUObjectsAreEqualOrNil(v13, (uint64_t)v48))
          {
            -[TUCallProvider emergencyLabeledHandles](self, "emergencyLabeledHandles");
            v14 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "emergencyLabeledHandles");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = (void *)v14;
            if (TUObjectsAreEqualOrNil(v14, (uint64_t)v45))
            {
              -[TUCallProvider handoffIdentifiers](self, "handoffIdentifiers");
              v15 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "handoffIdentifiers");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = (void *)v15;
              if (TUObjectsAreEqualOrNil(v15, (uint64_t)v43))
              {
                -[TUCallProvider prioritizedSenderIdentities](self, "prioritizedSenderIdentities");
                v16 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "prioritizedSenderIdentities");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = (void *)v16;
                if (TUObjectsAreEqualOrNil(v16, (uint64_t)v41))
                {
                  -[TUCallProvider sandboxExtendedRingtoneSoundURL](self, "sandboxExtendedRingtoneSoundURL");
                  v17 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "sandboxExtendedRingtoneSoundURL");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v40 = (void *)v17;
                  if (TUObjectsAreEqualOrNil(v17, (uint64_t)v39))
                  {
                    -[TUCallProvider originalRingtoneSoundURL](self, "originalRingtoneSoundURL");
                    v18 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v4, "originalRingtoneSoundURL");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    v38 = (void *)v18;
                    if (TUObjectsAreEqualOrNil(v18, (uint64_t)v37))
                    {
                      -[TUCallProvider iconTemplateImageData](self, "iconTemplateImageData");
                      v19 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v4, "iconTemplateImageData");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      v36 = (void *)v19;
                      if (!TUObjectsAreEqualOrNil(v19, (uint64_t)v35))
                        goto LABEL_34;
                      v20 = -[TUCallProvider maximumCallGroups](self, "maximumCallGroups");
                      if (v20 != objc_msgSend(v4, "maximumCallGroups"))
                        goto LABEL_34;
                      v21 = -[TUCallProvider maximumCallsPerCallGroup](self, "maximumCallsPerCallGroup");
                      if (v21 != objc_msgSend(v4, "maximumCallsPerCallGroup"))
                        goto LABEL_34;
                      v22 = -[TUCallProvider supportsAudioOnly](self, "supportsAudioOnly");
                      if (v22 != objc_msgSend(v4, "supportsAudioOnly"))
                        goto LABEL_34;
                      v23 = -[TUCallProvider supportsAudioAndVideo](self, "supportsAudioAndVideo");
                      if (v23 != objc_msgSend(v4, "supportsAudioAndVideo"))
                        goto LABEL_34;
                      v24 = -[TUCallProvider supportsEmergency](self, "supportsEmergency");
                      if (v24 == objc_msgSend(v4, "supportsEmergency")
                        && (v25 = -[TUCallProvider supportsVoicemail](self, "supportsVoicemail"),
                            v25 == objc_msgSend(v4, "supportsVoicemail"))
                        && (v26 = -[TUCallProvider supportsRecents](self, "supportsRecents"),
                            v26 == objc_msgSend(v4, "supportsRecents"))
                        && (v27 = -[TUCallProvider supportsCurrentPlatform](self, "supportsCurrentPlatform"),
                            v27 == objc_msgSend(v4, "supportsCurrentPlatform"))
                        && (v28 = -[TUCallProvider supportsDynamicSystemUI](self, "supportsDynamicSystemUI"),
                            v28 == objc_msgSend(v4, "supportsDynamicSystemUI"))
                        && (v29 = -[TUCallProvider supportsRinging](self, "supportsRinging"),
                            v29 == objc_msgSend(v4, "supportsRinging"))
                        && (v30 = -[TUCallProvider audioSessionID](self, "audioSessionID"),
                            v30 == objc_msgSend(v4, "audioSessionID")))
                      {
                        -[TUCallProvider supportedHandleTypes](self, "supportedHandleTypes");
                        v31 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v4, "supportedHandleTypes");
                        v34 = (void *)objc_claimAutoreleasedReturnValue();
                        v32 = TUObjectsAreEqualOrNil((unint64_t)v31, (uint64_t)v34);

                      }
                      else
                      {
LABEL_34:
                        v32 = 0;
                      }
                      v11 = v47;

                    }
                    else
                    {
                      v32 = 0;
                      v11 = v47;
                    }

                  }
                  else
                  {
                    v32 = 0;
                    v11 = v47;
                  }

                }
                else
                {
                  v32 = 0;
                  v11 = v47;
                }

              }
              else
              {
                v32 = 0;
                v11 = v47;
              }

            }
            else
            {
              v32 = 0;
              v11 = v47;
            }

          }
          else
          {
            v32 = 0;
            v11 = v47;
          }

        }
        else
        {
          v32 = 0;
        }

      }
      else
      {
        v32 = 0;
      }

    }
    else
    {
      v32 = 0;
    }

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;

  -[TUCallProvider identifier](self, "identifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v45, "hash");
  -[TUCallProvider bundleURL](self, "bundleURL");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v44, "hash") ^ v3;
  -[TUCallProvider bundleIdentifier](self, "bundleIdentifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v43, "hash");
  -[TUCallProvider localizedName](self, "localizedName");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ v5 ^ objc_msgSend(v42, "hash");
  -[TUCallProvider emergencyHandles](self, "emergencyHandles");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v41, "hash");
  -[TUCallProvider emergencyLabeledHandles](self, "emergencyLabeledHandles");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 ^ objc_msgSend(v40, "hash");
  -[TUCallProvider handoffIdentifiers](self, "handoffIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[TUCallProvider prioritizedSenderIdentities](self, "prioritizedSenderIdentities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[TUCallProvider sandboxExtendedRingtoneSoundURL](self, "sandboxExtendedRingtoneSoundURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[TUCallProvider originalRingtoneSoundURL](self, "originalRingtoneSoundURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");
  -[TUCallProvider iconTemplateImageData](self, "iconTemplateImageData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v10 ^ v16 ^ objc_msgSend(v17, "hash");
  v19 = -[TUCallProvider maximumCallGroups](self, "maximumCallGroups");
  v20 = v19 ^ -[TUCallProvider maximumCallsPerCallGroup](self, "maximumCallsPerCallGroup");
  if (-[TUCallProvider supportsAudioOnly](self, "supportsAudioOnly"))
    v21 = 1231;
  else
    v21 = 1237;
  v22 = v20 ^ v21;
  if (-[TUCallProvider supportsAudioAndVideo](self, "supportsAudioAndVideo"))
    v23 = 1231;
  else
    v23 = 1237;
  v24 = v22 ^ v23;
  if (-[TUCallProvider supportsEmergency](self, "supportsEmergency"))
    v25 = 1231;
  else
    v25 = 1237;
  v26 = v18 ^ v24 ^ v25;
  if (-[TUCallProvider supportsVoicemail](self, "supportsVoicemail"))
    v27 = 1231;
  else
    v27 = 1237;
  if (-[TUCallProvider supportsRecents](self, "supportsRecents"))
    v28 = 1231;
  else
    v28 = 1237;
  v29 = v27 ^ v28;
  if (-[TUCallProvider supportsCurrentPlatform](self, "supportsCurrentPlatform"))
    v30 = 1231;
  else
    v30 = 1237;
  v31 = v29 ^ v30;
  if (-[TUCallProvider supportsRinging](self, "supportsRinging"))
    v32 = 1231;
  else
    v32 = 1237;
  v33 = v31 ^ v32;
  if (-[TUCallProvider supportsDynamicSystemUI](self, "supportsDynamicSystemUI"))
    v34 = 1231;
  else
    v34 = 1237;
  v35 = v26 ^ v33 ^ v34;
  v36 = -[TUCallProvider audioSessionID](self, "audioSessionID");
  -[TUCallProvider supportedHandleTypes](self, "supportedHandleTypes");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v35 ^ v36 ^ objc_msgSend(v37, "hash");

  return v38;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[TUCallProvider identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  v8 = (void *)objc_msgSend(v5, "initWithIdentifier:", v7);

  -[TUCallProvider bundleURL](self, "bundleURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copyWithZone:", a3);
  objc_msgSend(v8, "setBundleURL:", v10);

  -[TUCallProvider bundleIdentifier](self, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copyWithZone:", a3);
  objc_msgSend(v8, "setBundleIdentifier:", v12);

  -[TUCallProvider localizedName](self, "localizedName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copyWithZone:", a3);
  objc_msgSend(v8, "setLocalizedName:", v14);

  -[TUCallProvider emergencyHandles](self, "emergencyHandles");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copyWithZone:", a3);
  objc_msgSend(v8, "setEmergencyHandles:", v16);

  -[TUCallProvider emergencyLabeledHandles](self, "emergencyLabeledHandles");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copyWithZone:", a3);
  objc_msgSend(v8, "setEmergencyLabeledHandles:", v18);

  -[TUCallProvider handoffIdentifiers](self, "handoffIdentifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copyWithZone:", a3);
  objc_msgSend(v8, "setHandoffIdentifiers:", v20);

  -[TUCallProvider prioritizedSenderIdentities](self, "prioritizedSenderIdentities");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copyWithZone:", a3);
  objc_msgSend(v8, "setPrioritizedSenderIdentities:", v22);

  -[TUCallProvider sandboxExtendedRingtoneSoundURL](self, "sandboxExtendedRingtoneSoundURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSandboxExtendedRingtoneSoundURL:", v23);

  -[TUCallProvider originalRingtoneSoundURL](self, "originalRingtoneSoundURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOriginalRingtoneSoundURL:", v24);

  -[TUCallProvider iconTemplateImageData](self, "iconTemplateImageData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copyWithZone:", a3);
  objc_msgSend(v8, "setIconTemplateImageData:", v26);

  objc_msgSend(v8, "setMaximumCallGroups:", -[TUCallProvider maximumCallGroups](self, "maximumCallGroups"));
  objc_msgSend(v8, "setMaximumCallsPerCallGroup:", -[TUCallProvider maximumCallsPerCallGroup](self, "maximumCallsPerCallGroup"));
  objc_msgSend(v8, "setSupportsAudioOnly:", -[TUCallProvider supportsAudioOnly](self, "supportsAudioOnly"));
  objc_msgSend(v8, "setSupportsAudioAndVideo:", -[TUCallProvider supportsAudioAndVideo](self, "supportsAudioAndVideo"));
  objc_msgSend(v8, "setSupportsEmergency:", -[TUCallProvider supportsEmergency](self, "supportsEmergency"));
  objc_msgSend(v8, "setSupportsVoicemail:", -[TUCallProvider supportsVoicemail](self, "supportsVoicemail"));
  objc_msgSend(v8, "setSupportsRecents:", -[TUCallProvider supportsRecents](self, "supportsRecents"));
  objc_msgSend(v8, "setSupportsCurrentPlatform:", -[TUCallProvider supportsCurrentPlatform](self, "supportsCurrentPlatform"));
  objc_msgSend(v8, "setSupportsRinging:", -[TUCallProvider supportsRinging](self, "supportsRinging"));
  objc_msgSend(v8, "setSupportsDynamicSystemUI:", -[TUCallProvider supportsDynamicSystemUI](self, "supportsDynamicSystemUI"));
  objc_msgSend(v8, "setAudioSessionID:", -[TUCallProvider audioSessionID](self, "audioSessionID"));
  -[TUCallProvider supportedHandleTypes](self, "supportedHandleTypes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copyWithZone:", a3);
  objc_msgSend(v8, "setSupportedHandleTypes:", v28);

  return v8;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setBundleURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setEmergencyHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setEmergencyLabeledHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setHandoffIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setPrioritizedSenderIdentities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setSandboxExtendedRingtoneSoundURL:(id)a3
{
  objc_storeStrong((id *)&self->_sandboxExtendedRingtoneSoundURL, a3);
}

- (void)setOriginalRingtoneSoundURL:(id)a3
{
  objc_storeStrong((id *)&self->_originalRingtoneSoundURL, a3);
}

- (void)setIconTemplateImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setMaximumCallGroups:(unint64_t)a3
{
  self->_maximumCallGroups = a3;
}

- (void)setMaximumCallsPerCallGroup:(unint64_t)a3
{
  self->_maximumCallsPerCallGroup = a3;
}

- (void)setSupportsRinging:(BOOL)a3
{
  self->_supportsRinging = a3;
}

- (void)setSupportsDynamicSystemUI:(BOOL)a3
{
  self->_supportsDynamicSystemUI = a3;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

- (int64_t)sandboxExtensionHandle
{
  return self->_sandboxExtensionHandle;
}

- (void)setSandboxExtensionHandle:(int64_t)a3
{
  self->_sandboxExtensionHandle = a3;
}

- (void)setSupportsCurrentPlatform:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19A50D000, log, OS_LOG_TYPE_FAULT, "Setting supportsCurrentPlatform to True for iOS and walkie-talkie, this should not happen", v1, 2u);
}

@end
