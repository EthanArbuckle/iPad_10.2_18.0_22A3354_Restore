@implementation SBSApplicationClient

- (id)applicationShortcutItemsOfTypes:(unint64_t)a3 forBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  v22 = 0;
  v7 = (void *)MEMORY[0x1E0D232D0];
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__SBSApplicationClient_applicationShortcutItemsOfTypes_forBundleIdentifier___block_invoke;
  v14[3] = &unk_1E288E438;
  v9 = v6;
  v15 = v9;
  v16 = a3;
  objc_msgSend(v7, "messageWithPacker:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __76__SBSApplicationClient_applicationShortcutItemsOfTypes_forBundleIdentifier___block_invoke_2;
  v13[3] = &unk_1E288E410;
  v13[4] = &v17;
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v10, 1, v13, 1, 0.0);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (void)fetchApplicationShortcutItemsOfTypes:(unint64_t)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  unint64_t v17;

  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0D232D0];
    v11 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __103__SBSApplicationClient_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletionHandler___block_invoke;
    v15[3] = &unk_1E288E438;
    v16 = v8;
    v17 = a3;
    objc_msgSend(v10, "messageWithPacker:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __103__SBSApplicationClient_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletionHandler___block_invoke_2;
    v13[3] = &unk_1E288E380;
    v14 = v9;
    -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v12, 1, v13, 0, 0.0);

  }
}

- (void)updateDynamicApplicationShortcutItems:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D232D0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__SBSApplicationClient_updateDynamicApplicationShortcutItems_bundleIdentifier___block_invoke;
  v12[3] = &unk_1E288EA50;
  v13 = v7;
  v14 = v6;
  v9 = v6;
  v11 = v7;
  objc_msgSend(v8, "messageWithPacker:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v10, 2);

}

+ (id)serviceFacilityIdentifier
{
  return CFSTR("com.apple.springboardservices.application");
}

void __79__SBSApplicationClient_updateDynamicApplicationShortcutItems_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
    BSSerializeStringToXPCDictionaryWithKey();
  BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();

}

void __76__SBSApplicationClient_applicationShortcutItemsOfTypes_forBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = v3;
    v4 = MEMORY[0x193FF8A34]() == MEMORY[0x1E0C812F8];
    v3 = v8;
    if (v4)
    {
      BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      v3 = v8;
    }
  }

}

void __103__SBSApplicationClient_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a2, "payload");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3 && MEMORY[0x193FF8A34](v3) == MEMORY[0x1E0C812F8])
  {
    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = (id)v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __103__SBSApplicationClient_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    BSSerializeStringToXPCDictionaryWithKey();
    v3 = v4;
  }
  xpc_dictionary_set_uint64(v3, "itemTypes", *(_QWORD *)(a1 + 40));

}

void __76__SBSApplicationClient_applicationShortcutItemsOfTypes_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    BSSerializeStringToXPCDictionaryWithKey();
    v3 = v4;
  }
  xpc_dictionary_set_uint64(v3, "itemTypes", *(_QWORD *)(a1 + 40));

}

- (void)deleteSnapshotsForApplicationIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D232D0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__SBSApplicationClient_deleteSnapshotsForApplicationIdentifier___block_invoke;
  v8[3] = &unk_1E288E488;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "messageWithPacker:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v6, 3);

}

uint64_t __64__SBSApplicationClient_deleteSnapshotsForApplicationIdentifier___block_invoke()
{
  return BSSerializeStringToXPCDictionaryWithKey();
}

- (void)fetchWhitePointAdaptivityStyleForDisplayId:(unsigned int)a3 withCompletionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  unsigned int v12;

  v6 = a4;
  if (v6)
  {
    v7 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __89__SBSApplicationClient_fetchWhitePointAdaptivityStyleForDisplayId_withCompletionHandler___block_invoke;
    v11[3] = &__block_descriptor_36_e33_v16__0__NSObject_OS_xpc_object__8l;
    v12 = a3;
    objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __89__SBSApplicationClient_fetchWhitePointAdaptivityStyleForDisplayId_withCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E288E380;
    v10 = v6;
    -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v8, 0, v9, 0, 0.0);

  }
}

void __89__SBSApplicationClient_fetchWhitePointAdaptivityStyleForDisplayId_withCompletionHandler___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_uint64(xdict, "displayId", *(unsigned int *)(a1 + 32));
}

void __89__SBSApplicationClient_fetchWhitePointAdaptivityStyleForDisplayId_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict;

  objc_msgSend(a2, "payload");
  xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  if (xdict && MEMORY[0x193FF8A34]() == MEMORY[0x1E0C812F8])
    xpc_dictionary_get_int64(xdict, "whitePointAdaptivityStyle");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)triggerShowAllWindowsForApplicationBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D232D0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__SBSApplicationClient_triggerShowAllWindowsForApplicationBundleIdentifier___block_invoke;
  v8[3] = &unk_1E288E488;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "messageWithPacker:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v6, 4);

}

uint64_t __76__SBSApplicationClient_triggerShowAllWindowsForApplicationBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return BSSerializeStringToXPCDictionaryWithKey();
  return result;
}

- (void)requestShelfPresentationForSceneWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D232D0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__SBSApplicationClient_requestShelfPresentationForSceneWithIdentifier___block_invoke;
  v8[3] = &unk_1E288E488;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "messageWithPacker:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v6, 5);

}

uint64_t __71__SBSApplicationClient_requestShelfPresentationForSceneWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return BSSerializeStringToXPCDictionaryWithKey();
  return result;
}

@end
