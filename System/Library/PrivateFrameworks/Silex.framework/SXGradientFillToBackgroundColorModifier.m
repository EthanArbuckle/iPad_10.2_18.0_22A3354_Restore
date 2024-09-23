@implementation SXGradientFillToBackgroundColorModifier

- (void)modifyDOM:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  SXGradientFillToBackgroundColorModifier *v11;

  v5 = a3;
  objc_msgSend(v5, "componentStyles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__SXGradientFillToBackgroundColorModifier_modifyDOM_context___block_invoke;
  v9[3] = &unk_24D688B20;
  v10 = v5;
  v11 = self;
  v8 = v5;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9);

}

void __61__SXGradientFillToBackgroundColorModifier_modifyDOM_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v6, "fill");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v6, "fill");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v28 = a1;
        v29 = v6;
        v30 = v5;
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        objc_msgSend(v6, "fill");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "colorStops");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v14)
        {
          v15 = v14;
          v16 = 0;
          v17 = *(_QWORD *)v33;
          obj = v13;
          while (2)
          {
            v18 = 0;
            v19 = v16;
            do
            {
              if (*(_QWORD *)v33 != v17)
                objc_enumerationMutation(obj);
              v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v18);
              if (v19)
              {
                objc_msgSend(v19, "color");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "hex");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "color");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "hex");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v22, "isEqualToString:", v24);

                if (!v25)
                {
                  v6 = v29;
                  v26 = obj;
                  goto LABEL_18;
                }
              }
              v16 = v20;

              ++v18;
              v19 = v16;
            }
            while (v15 != v18);
            v13 = obj;
            v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
            if (v15)
              continue;
            break;
          }
        }
        else
        {
          v16 = 0;
        }

        v6 = v29;
        objc_msgSend(*(id *)(v28 + 40), "convertGradientFillToBackgroundColorForComponentStyle:", v29);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v28 + 32), "componentStyles");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, v30);

        v19 = v16;
LABEL_18:

        v5 = v30;
      }
    }
  }

}

- (id)convertGradientFillToBackgroundColorForComponentStyle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SXComponentStyle *v12;
  void *v13;
  SXComponentStyle *v14;

  v3 = a3;
  objc_msgSend(v3, "JSONRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v3, "fill");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorStops");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "color");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hex");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("backgroundColor"));

    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("fill"));
  }
  v12 = [SXComponentStyle alloc];
  objc_msgSend(v3, "specificationVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SXJSONObject initWithJSONObject:andVersion:](v12, "initWithJSONObject:andVersion:", v5, v13);

  return v14;
}

@end
