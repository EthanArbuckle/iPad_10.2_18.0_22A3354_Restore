@implementation NSBundle(PCXBundleAdditions)

- (uint64_t)pcxImageForResource:()PCXBundleAdditions
{
  return objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:compatibleWithTraitCollection:", a3, a1, 0);
}

- (uint64_t)pcxPathForImageResource:()PCXBundleAdditions
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  result = objc_msgSend(&unk_1E6649938, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v10;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v7)
        objc_enumerationMutation(&unk_1E6649938);
      result = objc_msgSend(a1, "pathForResource:ofType:", a3, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
      if (result)
        break;
      if (v6 == ++v8)
      {
        result = objc_msgSend(&unk_1E6649938, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        v6 = result;
        if (result)
          goto LABEL_3;
        return result;
      }
    }
  }
  return result;
}

@end
