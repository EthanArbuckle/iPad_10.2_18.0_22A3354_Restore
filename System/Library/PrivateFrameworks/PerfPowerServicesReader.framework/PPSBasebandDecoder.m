@implementation PPSBasebandDecoder

+ (BOOL)isDecodableMetric:(id)a3
{
  void *v3;
  char v4;

  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(a3, "deviceCapability"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(&unk_2514401B8, "containsObject:", v3);

  return v4;
}

+ (id)decodeValue:(id)a3 withMetric:(id)a4
{
  id v5;
  id v6;
  void *v7;
  AWDMETRICSCellularPowerLog *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if (v5 && +[PPSBasebandDecoder isDecodableMetric:](PPSBasebandDecoder, "isDecodableMetric:", v6))
  {
    if ((objc_msgSend(v6, "deviceCapability") & 0xFFFFFFFE) == 0x12)
    {
      +[PPSBasebandDecoder hexStringToRawData:](PPSBasebandDecoder, "hexStringToRawData:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[AWDMETRICSCellularPowerLog initWithData:]([AWDMETRICSCellularPowerLog alloc], "initWithData:", v7);
      -[AWDMETRICSCellularPowerLog dictionaryRepresentation](v8, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
    +[PPSBasebandDecoder transformPayload:](PPSBasebandDecoder, "transformPayload:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSBasebandDecoder flattenResult:withParentKey:](PPSBasebandDecoder, "flattenResult:withParentKey:", v11, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)hexStringToRawData:(id)a3
{
  id v3;
  int v4;
  int v5;
  void *v6;
  uint64_t v7;
  id v8;
  unint64_t v10;
  char __str[3];

  v3 = a3;
  __str[2] = 0;
  v4 = objc_msgSend(v3, "length");
  if (v4 >= 0)
    v5 = v4;
  else
    v5 = v4 + 1;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", (uint64_t)v5 >> 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 >= 1)
  {
    v7 = 0;
    do
    {
      v8 = objc_retainAutorelease(v3);
      __str[0] = *(_BYTE *)(objc_msgSend(v8, "UTF8String") + v7);
      __str[1] = *(_BYTE *)(objc_msgSend(objc_retainAutorelease(v8), "UTF8String") + v7 + 1);
      v10 = 0;
      v10 = strtoul(__str, 0, 16);
      objc_msgSend(v6, "appendBytes:length:", &v10, 1);
      v7 += 2;
    }
    while ((int)v7 < v4);
  }

  return v6;
}

+ (id)transformPayload:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__PPSBasebandDecoder_transformPayload___block_invoke;
  v6[3] = &unk_25142A188;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = (void *)objc_msgSend((id)v8[5], "copy");
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __39__PPSBasebandDecoder_transformPayload___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v18 = a2;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = a3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v21;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v21 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j);
              objc_msgSend(v10, "objectForKeyedSubscript:", v15, v18);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v16, v15);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v12);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
  }
  v17 = v18;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v18, CFSTR("metric_name"), v18);

}

+ (id)flattenResult:(id)a3 withParentKey:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __50__PPSBasebandDecoder_flattenResult_withParentKey___block_invoke;
  v13 = &unk_25142A1B0;
  v7 = v6;
  v14 = v7;
  v15 = &v16;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v10);
  if (objc_msgSend((id)v17[5], "count", v10, v11, v12, v13))
    v8 = (void *)objc_msgSend((id)v17[5], "copy");
  else
    v8 = 0;

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __50__PPSBasebandDecoder_flattenResult_withParentKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), *(_QWORD *)(a1 + 32), v9);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v9;
  }
  v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[PPSBasebandDecoder flattenResult:withParentKey:](PPSBasebandDecoder, "flattenResult:withParentKey:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addEntriesFromDictionary:", v8);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v5, v7);
  }

}

@end
