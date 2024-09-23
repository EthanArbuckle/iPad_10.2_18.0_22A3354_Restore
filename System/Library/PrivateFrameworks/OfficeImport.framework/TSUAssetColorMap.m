@implementation TSUAssetColorMap

+ (id)assetColorMap
{
  return objc_alloc_init((Class)a1);
}

- (TSUAssetColorMap)init
{
  TSUAssetColorMap *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mAssetPathToColorMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSUAssetColorMap;
  v2 = -[TSUAssetColorMap init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mAssetPathToColorMap = v2->mAssetPathToColorMap;
    v2->mAssetPathToColorMap = v3;

  }
  return v2;
}

- (NSDictionary)assetPathToColorMap
{
  -[NSMutableDictionary count](self->mAssetPathToColorMap, "count");
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->mAssetPathToColorMap, "copy");
}

- (id)TSUColorFromColorArray:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  float v13;
  float v14;
  void *v15;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4 > 4)
  {
    v15 = 0;
  }
  else
  {
    v5 = v4;
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intValue");

    if (v5 < 3)
    {
      v14 = 255.0;
      v11 = v7;
      v9 = v7;
    }
    else
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "intValue");

      objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "intValue");

      if (v5 == 4)
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "floatValue");
        v14 = v13;

      }
      else
      {
        v14 = 255.0;
      }
    }
    +[OITSUColor colorWithRed:green:blue:alpha:](OITSUColor, "colorWithRed:green:blue:alpha:", (float)((float)v7 / 255.0), (float)((float)v9 / 255.0), (float)((float)v11 / 255.0), (float)(v14 / 255.0));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (void)addEntriesFromPlistBasename:(id)a3 transformKeyBlock:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSMutableDictionary *mAssetPathToColorMap;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  SEL v34;

  v30 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUAssetColorMap addEntriesFromPlistBasename:transformKeyBlock:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUAssetColorMap.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 62, 0, "invalid nil value for '%{public}s'", "bundle");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  objc_msgSend(v8, "pathForResource:ofType:", v30, CFSTR("plist"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v11);
    v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __66__TSUAssetColorMap_addEntriesFromPlistBasename_transformKeyBlock___block_invoke;
    v31[3] = &unk_24F39CAF0;
    v33 = v7;
    v31[4] = self;
    v14 = v13;
    v32 = v14;
    v34 = a2;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v31);
    objc_msgSend(v14, "tsu_allKeysAsSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary tsu_allKeysAsSet](self->mAssetPathToColorMap, "tsu_allKeysAsSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "intersectsSet:", v16);

    if (v17)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUAssetColorMap addEntriesFromPlistBasename:transformKeyBlock:]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUAssetColorMap.m");
      v28 = v12;
      v29 = v7;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v14, "tsu_allKeysAsSet");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary tsu_allKeysAsSet](self->mAssetPathToColorMap, "tsu_allKeysAsSet");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setWithObjects:", v21, v22, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "tsu_intersectionOfSets:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 95, 0, "Overwriting duplicated entries %@", v24);

      v7 = v29;
      v12 = v28;

      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    }
    mAssetPathToColorMap = self->mAssetPathToColorMap;
    if (!mAssetPathToColorMap)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUAssetColorMap addEntriesFromPlistBasename:transformKeyBlock:]");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUAssetColorMap.m");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 96, 0, "invalid nil value for '%{public}s'", "mAssetPathToColorMap");

      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      mAssetPathToColorMap = self->mAssetPathToColorMap;
    }
    -[NSMutableDictionary addEntriesFromDictionary:](mAssetPathToColorMap, "addEntriesFromDictionary:", v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TSUAssetColorMap.m"), 100, CFSTR("No plist found for name %@"), v30);
  }

}

void __66__TSUAssetColorMap_addEntriesFromPlistBasename_transformKeyBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  TSUCheckedDynamicCast(v6, (uint64_t)v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
    {
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v7);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUAssetColorMap addEntriesFromPlistBasename:transformKeyBlock:]_block_invoke");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUAssetColorMap.m");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 72, 0, "invalid nil value for '%{public}s'", "convertedKey");

        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
        v9 = 0;
      }
    }
    else
    {
      v9 = v7;
    }
    v12 = (objc_class *)objc_opt_class();
    TSUCheckedDynamicCast(v12, (uint64_t)v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "TSUColorFromColorArray:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v14, v9);
      else
        NSLog((NSString *)CFSTR("Failed to map color for: %@ array: %@"), v15, v13);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("TSUAssetColorMap.m"), 85, CFSTR("Expected an NSArray, found %@ : %@"), objc_opt_class(), v5);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("TSUAssetColorMap.m"), 90, CFSTR("Expected an NSString key, found %@ : %@"), objc_opt_class(), v15);
  }

}

- (void)addSharedEntries
{
  -[TSUAssetColorMap addEntriesFromPlistBasename:transformKeyBlock:](self, "addEntriesFromPlistBasename:transformKeyBlock:", CFSTR("shared"), &__block_literal_global_38);
}

uint64_t __36__TSUAssetColorMap_addSharedEntries__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uppercaseString");
}

- (void)addChartEntries
{
  -[TSUAssetColorMap addEntriesFromPlistBasename:transformKeyBlock:](self, "addEntriesFromPlistBasename:transformKeyBlock:", CFSTR("ChartFillAssetColors"), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAssetPathToColorMap, 0);
}

@end
