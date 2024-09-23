@implementation NSObject(PosterFoundation)

+ (id)pf_secureDecodedFromData:()PosterFoundation classReplacementMap:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v9 = v7;
    v10 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = 0;
LABEL_20:

      goto LABEL_21;
    }
    v11 = objc_msgSend(v10, "length");
    v12 = 0;
    if (!a1 || !v11)
      goto LABEL_20;
    v13 = (void *)MEMORY[0x249514230]();
    v19 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "pf_unarchivedObjectOfClass:fromData:classReplacementMap:error:", a1, v10, v9, &v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v19;
    if (v15)
    {
      PFLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[NSObject(PosterFoundation) pf_secureDecodedFromData:classReplacementMap:].cold.2(a1);

    }
    if (v14)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v14;
LABEL_19:

        objc_autoreleasePoolPop(v13);
        goto LABEL_20;
      }
      if (!v15)
      {
        PFLogCommon();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          +[NSObject(PosterFoundation) pf_secureDecodedFromData:classReplacementMap:].cold.1(a1);

      }
    }
    v12 = 0;
    goto LABEL_19;
  }
  v12 = 0;
LABEL_21:

  return v12;
}

+ (id)pf_secureDecodedFromData:()PosterFoundation ofClasses:classReplacementMap:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  NSObject *v25;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v31 = a1;
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    v24 = 0;
    goto LABEL_32;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithObjects:count:", &v31, 1);
  v11 = v10;
  if (v8)
    objc_msgSend(v10, "unionSet:", v8);
  v12 = v11;
  v13 = v9;
  v14 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v14, "length") && objc_msgSend(v12, "count"))
  {
    v15 = (void *)MEMORY[0x249514230]();
    v36 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "pf_unarchivedObjectOfClasses:fromData:classReplacementMap:error:", v12, v14, v13, &v36);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v36;
    if (v30)
    {
      PFLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        +[NSObject(PosterFoundation) pf_secureDecodedFromData:ofClasses:classReplacementMap:].cold.3((uint64_t)v30, v17);

    }
    if (v16)
    {
      v28 = v15;
      v29 = v13;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v18 = v12;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v33;
        while (2)
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v33 != v21)
              objc_enumerationMutation(v18);
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {

              v23 = v16;
              goto LABEL_34;
            }
            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          if (v20)
            continue;
          break;
        }
      }

      if (v30)
      {
        v23 = 0;
LABEL_34:
        v15 = v28;
        v13 = v29;
        goto LABEL_39;
      }
      PFLogCommon();
      v27 = objc_claimAutoreleasedReturnValue();
      v15 = v28;
      v13 = v29;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        +[NSObject(PosterFoundation) pf_secureDecodedFromData:ofClasses:classReplacementMap:].cold.2();

    }
    v23 = 0;
LABEL_39:

    objc_autoreleasePoolPop(v15);
    goto LABEL_23;
  }
  v23 = 0;
LABEL_23:

  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = v23;
  }
  else
  {
    if (v23)
    {
      PFLogCommon();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        +[NSObject(PosterFoundation) pf_secureDecodedFromData:ofClasses:classReplacementMap:].cold.1(&v31, (uint64_t)v23, v25);

    }
    v24 = 0;
  }

LABEL_32:
  return v24;
}

+ (void)pf_secureDecodedFromData:()PosterFoundation classReplacementMap:.cold.1(objc_class *a1)
{
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  NSStringFromClass(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_24462A000, v3, v4, "Error during decoding of data to type=%{public}@: decoded %{public}@ instead but unarchiver didn't filter it", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_0();
}

+ (void)pf_secureDecodedFromData:()PosterFoundation classReplacementMap:.cold.2(objc_class *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromClass(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_24462A000, v2, v3, "Error during decoding of data to type=%{public}@: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

+ (void)pf_secureDecodedFromData:()PosterFoundation ofClasses:classReplacementMap:.cold.1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  id v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = *a1;
  v6 = 136315650;
  v7 = "+[NSObject(PosterFoundation) pf_secureDecodedFromData:ofClasses:classReplacementMap:]";
  v8 = 2114;
  v9 = v4;
  v10 = 2114;
  v11 = (id)objc_opt_class();
  v5 = v11;
  _os_log_error_impl(&dword_24462A000, a3, OS_LOG_TYPE_ERROR, "%s decoded an unexpected type : expected=%{public}@ decoded=%{public}@", (uint8_t *)&v6, 0x20u);

}

+ (void)pf_secureDecodedFromData:()PosterFoundation ofClasses:classReplacementMap:.cold.2()
{
  objc_class *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_24462A000, v1, v2, "Error during decoding of data to types=%{public}@: decoded %{public}@ instead but unarchiver didn't filter it", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_1_0();
}

+ (void)pf_secureDecodedFromData:()PosterFoundation ofClasses:classReplacementMap:.cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_24462A000, a2, OS_LOG_TYPE_ERROR, "Error during decoding of data: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
