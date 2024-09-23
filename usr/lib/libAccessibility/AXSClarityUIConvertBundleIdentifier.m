@implementation AXSClarityUIConvertBundleIdentifier

void ___AXSClarityUIConvertBundleIdentifier_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v0 = (void *)_AXSClarityUIConvertBundleIdentifier_ClarityToStandardBundleIdentifiers;
  _AXSClarityUIConvertBundleIdentifier_ClarityToStandardBundleIdentifiers = (uint64_t)&unk_1E2941B08;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = objc_msgSend(&unk_1E2941B08, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(&unk_1E2941B08);
        v6 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(&unk_1E2941B08, "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "setObject:forKeyedSubscript:", v6, v7);

      }
      v3 = objc_msgSend(&unk_1E2941B08, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }
  v8 = objc_msgSend(v1, "copy");
  v9 = (void *)_AXSClarityUIConvertBundleIdentifier_StandardToClarityBundleIdentifiers;
  _AXSClarityUIConvertBundleIdentifier_StandardToClarityBundleIdentifiers = v8;

}

@end
