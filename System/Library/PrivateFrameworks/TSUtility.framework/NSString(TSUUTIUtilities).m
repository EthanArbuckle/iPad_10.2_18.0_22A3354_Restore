@implementation NSString(TSUUTIUtilities)

- (BOOL)tsu_conformsToUTI:()TSUUTIUtilities
{
  return UTTypeConformsTo(a1, inConformsToUTI) != 0;
}

- (uint64_t)tsu_conformsToAnyUTI:()TSUUTIUtilities
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

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v10;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(a3);
        if ((objc_msgSend(a1, "tsu_conformsToUTI:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8)) & 1) != 0)
          return 1;
        ++v8;
      }
      while (v6 != v8);
      result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v6 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (CFStringRef)tsu_UTIFilenameExtension
{
  return (id)UTTypeCopyPreferredTagWithClass(a1, (CFStringRef)*MEMORY[0x24BDC1658]);
}

- (CFStringRef)tsu_pathUTI
{
  int v2;
  const __CFString *v3;
  const __CFString *v4;
  CFArrayRef AllIdentifiersForTag;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t i;
  const __CFString *v13;
  BOOL v14;
  __CFString *v15;
  unsigned __int8 v17;
  __CFString *v18;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(a1, "isAbsolutePath");
  v3 = (const __CFString *)*MEMORY[0x24BDC1658];
  v4 = (const __CFString *)objc_msgSend(a1, "pathExtension");
  if (!v2)
    return (id)UTTypeCreatePreferredIdentifierForTag(v3, v4, 0);
  AllIdentifiersForTag = UTTypeCreateAllIdentifiersForTag(v3, v4, 0);
  if ((unint64_t)-[__CFArray count](AllIdentifiersForTag, "count") >= 2)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = -[__CFArray countByEnumeratingWithState:objects:count:](AllIdentifiersForTag, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = 0;
      v10 = *(_QWORD *)v21;
      v11 = (const __CFString *)*MEMORY[0x24BDC1750];
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(AllIdentifiersForTag);
          v13 = *(const __CFString **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (UTTypeConformsTo(v13, v11))
            v8 = v13;
          else
            v9 = v13;
          if (v8)
            v14 = v9 == 0;
          else
            v14 = 1;
          if (!v14)
          {
            v19 = 1;
            v17 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "fileExistsAtPath:isDirectory:", a1, &v19);
            if ((v17 & (v19 == 0)) != 0)
              v15 = (__CFString *)v9;
            else
              v15 = (__CFString *)v8;
            goto LABEL_23;
          }
        }
        v7 = -[__CFArray countByEnumeratingWithState:objects:count:](AllIdentifiersForTag, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v7)
          continue;
        break;
      }
    }
  }
  v15 = (__CFString *)-[__CFArray objectAtIndex:](AllIdentifiersForTag, "objectAtIndex:", 0);
LABEL_23:
  v18 = v15;

  return v15;
}

- (uint64_t)tsu_pathConformsToUTI:()TSUUTIUtilities
{
  return objc_msgSend((id)objc_msgSend(a1, "pathExtension"), "tsu_pathExtensionConformsToUTI:", a3);
}

- (uint64_t)tsu_pathExtensionConformsToUTI:()TSUUTIUtilities
{
  __CFString *PreferredIdentifierForTag;
  __CFString *v4;
  uint64_t v5;

  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x24BDC1658], inTag, a3);
  v4 = PreferredIdentifierForTag;
  if (PreferredIdentifierForTag)
    v5 = -[__CFString hasPrefix:](PreferredIdentifierForTag, "hasPrefix:", CFSTR("dyn.")) ^ 1;
  else
    v5 = 0;

  return v5;
}

@end
