@implementation TTSAsset

+ (id)listAssetsOfTypes:(id)a3 matching:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  sub_19AD487A4(0, (unint64_t *)&qword_1ED05B330);
  v4 = sub_19AE5567C();
  v5 = sub_19AE553A0();
  swift_getObjCClassMetadata();
  static TTSAsset.listAssets(ofTypes:matching:)(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_19AD487A4(0, &qword_1ED05B1E0);
  v6 = (void *)sub_19AE55664();
  swift_bridgeObjectRelease();
  return v6;
}

+ (BOOL)_hasTrialEntitlements
{
  __SecTask *v2;
  __SecTask *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = SecTaskCreateFromSelf(0);
  if (v2)
  {
    v3 = v2;
    v4 = (void *)SecTaskCopyValueForEntitlement(v2, CFSTR("com.apple.trial.client"), 0);
    CFRelease(v3);
    if (v4)
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = v4;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v11;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v11 != v7)
              objc_enumerationMutation(v5);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "intValue", (_QWORD)v10) == 406)
            {
              LOBYTE(v6) = 1;
              goto LABEL_14;
            }
          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_14:

    }
    else
    {
      LOBYTE(v6) = 0;
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)downloadWithReservation:(id)a3 useBattery:(BOOL)a4 progress:(id)a5 then:(id)a6
{
  void *v9;
  void *v10;
  TTSAsset *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9 = _Block_copy(a5);
  v10 = _Block_copy(a6);
  if (a3)
    sub_19AE55448();
  *(_QWORD *)(swift_allocObject() + 16) = v9;
  *(_QWORD *)(swift_allocObject() + 16) = v10;
  v11 = self;
  TTSAsset.download(reservation:useBattery:progress:then:)((uint64_t)v11, v12, 0, v13, v14, sub_19AD82948);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)cancelDownloadingThen:(id)a3
{
  void *v4;
  TTSAsset *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_19AD82790((uint64_t)v5, (void (**)(_QWORD, _QWORD))v4);
  _Block_release(v4);

}

- (void)purgeImmediately:(BOOL)a3
{
  TTSAsset *v3;

  v3 = self;
  TTSAsset.purge(immediately:)(0);

}

- (int64_t)purgeCondition
{
  return 3;
}

- (id)legacyAssetWithBundle:(id)a3
{
  id v4;
  TTSAsset *v5;
  TTSAsset *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  TTSAsset.legacyAssetWithBundle(_:)(v6, (NSBundle)v4);
  v8 = v7;

  return v8;
}

+ (BOOL)handleProxyEvent:(id)a3 reply:(id)a4 connection:(id)a5
{
  char v8;

  swift_getObjCClassMetadata();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v8 = static TTSAsset.handleProxy(event:reply:connection:)(a3, (uint64_t)a4, a5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v8 & 1;
}

+ (BOOL)setServer:(id)a3 forType:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = (uint64_t)a3;
  v6 = a3;
  v7 = a4;
  LOBYTE(v5) = static TTSAsset.set(server:forType:)(v5, v7);

  return v5 & 1;
}

+ (BOOL)setServer:(id)a3 forType:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;

  swift_getObjCClassMetadata();
  v8 = a3;
  v9 = a4;
  v10 = a5;
  LOBYTE(a4) = static TTSAsset.set(server:forType:source:)((uint64_t)a3, (uint64_t)v9, (uint64_t)v10);

  return a4 & 1;
}

+ (id)getServerForType:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  static TTSAsset.get(serverForType:)(v3);
  v5 = v4;

  return v5;
}

+ (id)getServerForType:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  swift_getObjCClassMetadata();
  v6 = a3;
  v7 = a4;
  static TTSAsset.get(serverForType:source:)((uint64_t)v6, (uint64_t)v7);
  v9 = v8;

  return v9;
}

+ (id)describeServer:(id)a3 forType:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  static TTSAsset.describe(server:forType:)((uint64_t)v5, v6);

  v7 = (void *)sub_19AE55424();
  swift_bridgeObjectRelease();
  return v7;
}

+ (id)describeServer:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  void *v8;

  swift_getObjCClassMetadata();
  v6 = a3;
  v7 = a4;
  static TTSAsset.describe(server:source:)((uint64_t)v6, (uint64_t)v7);

  v8 = (void *)sub_19AE55424();
  swift_bridgeObjectRelease();
  return v8;
}

+ (void)waitForCatalogUpdates
{
  static TTSAsset.waitForCatalogUpdates()();
}

+ (TTSAssistantVoiceMaps)assistantVoiceMaps
{
  swift_getObjCClassMetadata();
  return (TTSAssistantVoiceMaps *)(id)static TTSAsset.assistantVoiceMaps.getter();
}

- (BOOL)isOlder:(id)a3
{
  TTSAsset *v4;
  TTSAsset *v5;

  v4 = (TTSAsset *)a3;
  v5 = self;
  LOBYTE(self) = TTSAsset.isOlder(_:)(v4);

  return self & 1;
}

- (BOOL)isNewer:(id)a3
{
  TTSAsset *v4;
  TTSAsset *v5;

  v4 = (TTSAsset *)a3;
  v5 = self;
  LOBYTE(self) = TTSAsset.isNewer(_:)(v4);

  return self & 1;
}

- (BOOL)locallyAvailable
{
  TTSAsset *v2;
  BOOL v3;

  v2 = self;
  v3 = TTSAsset.locallyAvailable.getter();

  return v3;
}

- (BOOL)downloading
{
  return 0;
}

- (BOOL)purgeable
{
  return 1;
}

- (NSString)description
{
  return (NSString *)sub_19ADFD298(self, (uint64_t)a2, (void (*)(void))TTSAsset.description.getter);
}

- (id)relatedAssetsWithOnlyAvailable:(BOOL)a3
{
  void *v3;

  sub_19AD487A4(0, &qword_1ED05B1E0);
  v3 = (void *)sub_19AE55664();
  swift_bridgeObjectRelease();
  return v3;
}

+ (id)bestAssetOfTypes:(id)a3 matching:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  sub_19AD487A4(0, (unint64_t *)&qword_1ED05B330);
  v4 = sub_19AE5567C();
  v5 = sub_19AE553A0();
  swift_getObjCClassMetadata();
  static TTSAsset.bestAsset(ofTypes:matching:)(v4, v5);
  v7 = v6;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

- (TTSAsset)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TTSAsset;
  return -[TTSAsset init](&v3, sel_init);
}

- (TTSAssetType)assetType
{
  return self->_assetType;
}

- (TTSAssetSource)assetSource
{
  return self->_assetSource;
}

- (TTSAssetTechnology)technology
{
  return self->_technology;
}

- (TTSAssetQuality)quality
{
  return self->_quality;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)versionNumber
{
  return self->_versionNumber;
}

- (NSString)versionDescription
{
  return self->_versionDescription;
}

- (NSArray)supportedLanguages
{
  return self->_supportedLanguages;
}

- (NSString)primaryLanguage
{
  return self->_primaryLanguage;
}

- (int64_t)gender
{
  return self->_gender;
}

- (NSNumber)age
{
  return self->_age;
}

- (NSNumber)downloadSize
{
  return self->_downloadSize;
}

- (NSNumber)diskSize
{
  return self->_diskSize;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_diskSize, 0);
  objc_storeStrong((id *)&self->_downloadSize, 0);
  objc_storeStrong((id *)&self->_age, 0);
  objc_storeStrong((id *)&self->_primaryLanguage, 0);
  objc_storeStrong((id *)&self->_supportedLanguages, 0);
  objc_storeStrong((id *)&self->_versionDescription, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_quality, 0);
  objc_storeStrong((id *)&self->_technology, 0);
  objc_storeStrong((id *)&self->_assetSource, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
}

+ (NSString)NewAssetNotification
{
  return (NSString *)CFSTR("com.apple.ttsasset.NewAssetNotification");
}

+ (void)_postNewAssetNotification
{
  notify_post("com.apple.ttsasset.NewAssetNotification");
}

+ (_NSRange)_gryphonVoiceCompatibility
{
  unsigned int MinCompatibilityVersion;
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  MinCompatibilityVersion = gryphon_GetMinCompatibilityVersion();
  v3 = gryphon_GetCurrentCompatibilityVersion() - MinCompatibilityVersion + 1;
  v4 = MinCompatibilityVersion;
  result.length = v3;
  result.location = v4;
  return result;
}

@end
