@implementation OITSUMutableCustomFormat

- (id)copyWithZone:(_NSZone *)a3
{
  OITSUCustomFormat *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  OITSUCustomFormat *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = +[OITSUCustomFormat allocWithZone:](OITSUCustomFormat, "allocWithZone:", a3);
  -[OITSUCustomFormat formatName](self, "formatName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[OITSUCustomFormat formatType](self, "formatType");
  -[OITSUCustomFormat defaultFormatData](self, "defaultFormatData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[OITSUCustomFormat initWithName:formatType:data:](v4, "initWithName:formatType:data:", v5, v6, v7);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[OITSUCustomFormat conditionList](self, "conditionList", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "conditionType");
        objc_msgSend(v14, "conditionValue");
        v17 = v16;
        objc_msgSend(v14, "data");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[OITSUCustomFormat p_addConditionOfType:value:data:](v8, "p_addConditionOfType:value:data:", v15, v18, v17);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  return v8;
}

@end
