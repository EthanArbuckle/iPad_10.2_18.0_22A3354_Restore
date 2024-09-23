@implementation MPModelObject

- (id)pickableObjectFor:(int64_t)a3
{
  MPModelObject *v4;
  MPModelObject *v5;
  MPModelObject *v6;
  id v7;

  v4 = self;
  v5 = -[MPModelObject innermostModelObject](v4, "innermostModelObject");

  if (v5 == v4)
  {
    v7 = 0;
  }
  else
  {
    v6 = -[MPModelObject innermostModelObject](v4, "innermostModelObject");
    v7 = -[MPModelObject pickableObjectFor:](v6, "pickableObjectFor:", a3);

    v4 = v6;
  }

  return v7;
}

- (NSString)musicTypeIdentifier
{
  MPModelObject *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;

  v2 = self;
  v3 = -[MPModelObject pickableObjectFor:](v2, "pickableObjectFor:", 0);
  if (!v3)
  {

LABEL_6:
    v9 = 0;
    return (NSString *)v9;
  }
  v4 = v3;
  v5 = objc_msgSend(v3, "musicTypeIdentifier");
  if (!v5)
  {

    goto LABEL_6;
  }
  v6 = v5;
  static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  v8 = v7;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  return (NSString *)v9;
}

- (BOOL)shouldVisuallyDisableFor:(int64_t)a3
{
  return 0;
}

- (void)loadStoreRequestedProperties:(id)a3 completionHandler:(id)a4
{
  sub_34A634(self, (int)a2, a3, a4, (uint64_t)&unk_135B2F0, (uint64_t)sub_34BD78, (void (*)(id, uint64_t, uint64_t))sub_3487B0);
}

- (id)storeNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4
{
  void *v4;

  v4 = _Block_copy(a4);
  _Block_release(v4);
  return 0;
}

- (void)loadLibraryRequestedProperties:(id)a3 completionHandler:(id)a4
{
  _QWORD *v6;
  void (*v7)(_QWORD *, _QWORD, _QWORD);
  id v8;
  MPModelObject *v9;

  v6 = _Block_copy(a4);
  v7 = (void (*)(_QWORD *, _QWORD, _QWORD))v6[2];
  v8 = a3;
  v9 = self;
  v7(v6, 0, 0);
  _Block_release(v6);

}

- (void)loadCatalogSongsWithCompletionHandler:(void *)aBlock
{
  _QWORD *v4;
  void (*v5)(_QWORD *, _QWORD, _QWORD);
  id v6;

  v4 = _Block_copy(aBlock);
  v5 = (void (*)(_QWORD *, _QWORD, _QWORD))v4[2];
  v6 = a1;
  v5(v4, 0, 0);
  _Block_release(v4);

}

+ (id)requiredStoreNavigationHandlerProperties
{
  return objc_msgSend((id)objc_opt_self(MPPropertySet), "emptyPropertySet");
}

- (id)storeContentItemObjectPropertiesFor:(id)a3
{
  return a3;
}

- (NSString)shortDescription
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (double)preferredArtworkAspectRatio
{
  void *v3;
  double result;

  objc_opt_self(MPModelGenericObject);
  v3 = (void *)swift_dynamicCastObjCClass(self);
  if (!v3)
  {
    objc_opt_self(MPModelSong);
    v3 = (void *)swift_dynamicCastObjCClass(self);
    if (!v3)
      return 1.0;
  }
  objc_msgSend(v3, "preferredArtworkAspectRatio");
  return result;
}

@end
