@implementation PKDeviceSupportsApplicationForFeatureIdentifier

void __PKDeviceSupportsApplicationForFeatureIdentifier_block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PKDeviceSupportedFeatureIdentifiers();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v0, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = v0;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
        v8 = PKFeatureIdentifierFromString(v7);
        if (v8 <= 5)
        {
          if (((1 << v8) & 0x2C) == 0)
          {
            if (((1 << v8) & 0x12) == 0)
              goto LABEL_17;
LABEL_16:
            objc_msgSend(v1, "addObject:", v7, (_QWORD)v11);
            goto LABEL_17;
          }
          if (qword_1ECF21D00 != -1)
            dispatch_once(&qword_1ECF21D00, &__block_literal_global_218);
          if (byte_1ECF21C79)
            goto LABEL_16;
          if (qword_1ECF21D10 != -1)
            dispatch_once(&qword_1ECF21D10, &__block_literal_global_224);
          if (byte_1ECF21C7B)
            goto LABEL_16;
        }
LABEL_17:
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  v9 = objc_msgSend(v1, "copy");
  v10 = (void *)qword_1ECF21D48;
  qword_1ECF21D48 = v9;

}

@end
