@implementation PLDCFUtilities

+ (id)dcfRegex
{
  pl_dispatch_once();
  return (id)dcfRegex_regex;
}

+ (BOOL)isValidDCFFileName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "dcfRegex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "fileName:matchesRegex:", v4, v5);

  return (char)a1;
}

+ (id)dcfCompliantNameForFileName:(id)a3 createDate:(id)a4 fileSize:(unint64_t)a5 filenameMarker:(id)a6
{
  id v10;
  void *v11;
  uint64_t v12;

  v10 = a6;
  objc_msgSend(a1, "makeDCFFileNameFromFileName:createDate:fileSize:", a3, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(a1, "insertAuxiliaryResourceTypeMarker:intoFileName:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }

  return v11;
}

+ (id)dcfRegexForAuxiliaryResourceFilenameMarker:(id)a3
{
  id v5;
  void *v6;
  void *v8;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLDCFUtilities.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("marker"));

  }
  pl_dispatch_once();
  objc_msgSend((id)dcfRegexForAuxiliaryResourceFilenameMarker__markerToRegexMap, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLDCFUtilities.m"), 98, CFSTR("Unknown auxiliary resource type marker: %@"), v5);

  }
  return v6;
}

+ (id)renderDCFRegex
{
  return (id)objc_msgSend(a1, "dcfRegexForAuxiliaryResourceFilenameMarker:", PLAuxiliaryResourceFilenameMarkerRender);
}

+ (BOOL)isRenderFileName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "renderDCFRegex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "fileName:matchesRegex:", v4, v5);

  return (char)a1;
}

+ (id)fileNameByRemovingRenderMarkerInFileName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if ((objc_msgSend(a1, "isRenderFileName:", v4) & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "substringToIndex:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "substringFromIndex:", 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v4;
  }

  return v8;
}

+ (BOOL)isSpatialOverCaptureFileName:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = PLAuxiliaryResourceFilenameMarkerSpatialOverCapture;
  v5 = a3;
  objc_msgSend(a1, "dcfRegexForAuxiliaryResourceFilenameMarker:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "fileName:matchesRegex:", v5, v6);

  return (char)a1;
}

+ (id)fileNameByRemovingSpatialOverCaptureMarkerInFileName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if ((objc_msgSend(a1, "isRenderFileName:", v4) & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "substringToIndex:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "substringFromIndex:", 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v4;
  }

  return v8;
}

+ (BOOL)fileName:(id)a3 matchesRegex:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;

  if (!a3)
    return 0;
  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v5, "numberOfMatchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));

  return v7 == 1;
}

+ (id)makeDCFFileNameFromFileName:(id)a3 createDate:(id)a4 fileSize:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  if (objc_msgSend(a1, "isValidDCFFileName:", v9))
    objc_msgSend(v9, "uppercaseString");
  else
    objc_msgSend(a1, "makeDCFFileNameByHashingFileName:createDate:fileSize:", v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)makeDCFFileNameByHashingFileName:(id)a3 createDate:(id)a4 fileSize:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;

  v8 = a3;
  objc_msgSend(a1, "encodeFileNameFromHash:", objc_msgSend(a1, "hashForFileName:createDate:fileSize:", v8, a4, a5));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "uppercaseString");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = &stru_1E36789C0;
  if (v11)
    v13 = (__CFString *)v11;
  v14 = v13;

  objc_msgSend(v9, "stringByAppendingPathExtension:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)insertAuxiliaryResourceTypeMarker:(id)a3 intoFileName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "substringToIndex:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "substringFromIndex:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (unsigned)hashForFileName:(id)a3 createDate:(id)a4 fileSize:(unint64_t)a5
{
  void *v6;
  Bytef buf[32];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%llu"), a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "computeSHA256OfString:intoBuffer:", v6, buf);
  LODWORD(a1) = crc32(0, buf, 0x20u);

  return a1;
}

+ (void)computeSHA256OfString:(id)a3 intoBuffer:(char *)a4
{
  const char *v5;
  CC_LONG v6;
  CC_SHA256_CTX v7;

  v5 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  memset(&v7, 0, sizeof(v7));
  CC_SHA256_Init(&v7);
  v6 = strlen(v5);
  CC_SHA256_Update(&v7, v5, v6);
  CC_SHA256_Final((unsigned __int8 *)a4, &v7);
}

+ (id)encodeFileNameFromHash:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = *(_QWORD *)&a3;
  pl_dispatch_once();
  objc_msgSend(a1, "convertHash:usingPlaceValues:", v3, encodeFileNameFromHash__pl_once_object_17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v23, "unsignedIntValue") + 65;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v22, "unsignedIntValue") + 65;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v20, "unsignedIntValue") + 65;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue") + 65;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntValue") + 48;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntValue") + 48;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntValue") + 48;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("%c%c%c%c%c%c%c%c"), v19, v18, v17, v7, v9, v11, v13, objc_msgSend(v14, "unsignedIntValue") + 48);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)convertHash:(unsigned int)a3 usingPlaceValues:(id)a4
{
  id v5;
  void *v6;
  int v7;
  unint64_t v8;
  void *v9;
  double v10;
  void *v11;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "count");
  if (v7 >= 1)
  {
    v8 = v7 + 1;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", (v8 - 2));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", vcvtmd_u64_f64((double)a3 / v10));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v11);

      a3 %= (unint64_t)objc_msgSend(v9, "unsignedIntegerValue");
      --v8;
    }
    while (v8 > 1);
  }

  return v6;
}

+ (id)placeValuesFromBases:(id)a3
{
  id v3;
  void *v4;
  int v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "count");
  if (v5 >= 1)
  {
    v6 = v5 + 1;
    v7 = 1;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", (v6 - 2));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v9);

      v7 *= objc_msgSend(v8, "unsignedIntegerValue");
      --v6;
    }
    while (v6 > 1);
  }

  return v4;
}

void __41__PLDCFUtilities_encodeFileNameFromHash___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "placeValuesFromBases:", &unk_1E37634D0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)encodeFileNameFromHash__pl_once_object_17;
  encodeFileNameFromHash__pl_once_object_17 = v1;

}

void __61__PLDCFUtilities_dcfRegexForAuxiliaryResourceFilenameMarker___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  _QWORD v15[6];

  v15[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dcfRegexForAuxiliaryResourceFilenameMarker__markerToRegexMap;
  dcfRegexForAuxiliaryResourceFilenameMarker__markerToRegexMap = v0;

  v15[0] = PLAuxiliaryResourceFilenameMarkerRender;
  v15[1] = PLAuxiliaryResourceFilenameMarkerAdjustmentBase;
  v15[2] = PLAuxiliaryResourceFilenameMarkerOriginalAdjustment;
  v15[3] = PLAuxiliaryResourceFilenameMarkerSpatialOverCapture;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("^ [[A-Z][_][0-9]]{4}     (?# alphanumeric + '_' x4)%@                       (?# render marker)[0-9]{4}                 (?# digit x4)\\.[[A-Z][0-9]]{3,4} $   (?# alphanumeric x3 or x4)"), v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", v8, 3, 0);
        objc_msgSend((id)dcfRegexForAuxiliaryResourceFilenameMarker__markerToRegexMap, "setObject:forKeyedSubscript:", v9, v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void __26__PLDCFUtilities_dcfRegex__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("^ [[A-Z][_][0-9]]{4}   (?# alphanumeric + '_' x4)[0-9]{4}               (?# digit x4)\\.[[A-Z][0-9]]{3,4} $ (?# alphanumeric x3 or x4)"), 3, 0);
  v1 = (void *)dcfRegex_regex;
  dcfRegex_regex = v0;

}

@end
