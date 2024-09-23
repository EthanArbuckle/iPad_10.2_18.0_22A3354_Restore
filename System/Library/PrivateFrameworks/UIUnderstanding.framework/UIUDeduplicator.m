@implementation UIUDeduplicator

- (id)init:(int64_t)a3
{
  UIUDeduplicator *v4;
  UIDeduplicatorCompat *v5;
  id v6;
  UIDeduplicatorCompat *underlyingObject;
  BOOL v8;
  UIUDeduplicator *v9;
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UIUDeduplicator;
  v4 = -[UIUDeduplicator init](&v13, sel_init);
  if (a3 != 2)
    a3 = a3 == 1;
  v12 = 0;
  v5 = -[UIDeduplicatorCompat initWithPlatform:error:]([UIDeduplicatorCompat alloc], "initWithPlatform:error:", a3, &v12);
  v6 = v12;
  underlyingObject = v4->_underlyingObject;
  v4->_underlyingObject = v5;

  if (v4->_underlyingObject)
    v8 = 1;
  else
    v8 = v6 == 0;
  if (v8)
  {
    v9 = v4;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[UIUDeduplicator init:].cold.1(v6);
    v9 = 0;
  }

  return v9;
}

- (UIUDeduplicator)initWithPortraitModels
{
  return (UIUDeduplicator *)-[UIUDeduplicator init:](self, "init:", 0);
}

- (UIUDeduplicator)initWithSquareModels
{
  return (UIUDeduplicator *)-[UIUDeduplicator init:](self, "init:", 1);
}

- (id)identifyImage:(id)a3 image:(CGImage *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  UIUScreenShot *v10;
  id v12;

  v6 = a3;
  -[UIUDeduplicator underlyingObject](self, "underlyingObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v7, "identifyScreenshotWithId:image:error:", v6, a4, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;

  if (v8 || !v9)
  {
    v10 = -[UIUScreenShot initWithContents:]([UIUScreenShot alloc], "initWithContents:", v8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[UIUDeduplicator identifyImage:image:].cold.1((uint64_t)v6, v9);
    v10 = 0;
  }

  return v10;
}

- (id)identifyElements:(id)a3 elements:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  UIUDedupeElement *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "underlyingObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIUDeduplicator underlyingObject](self, "underlyingObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v10, "identifyElementsWithScreenshot:rectArray:error:", v9, v7, &v28);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v28;

  if (v11 || !v12)
  {
    v23 = v9;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v16 = v11;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          v21 = -[UIUDedupeElement initWithContents:]([UIUDedupeElement alloc], "initWithContents:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
          objc_msgSend(v8, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v18);
    }

    v15 = v8;
    v9 = v23;
  }
  else
  {
    objc_msgSend(v6, "underlyingObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[UIUDeduplicator identifyElements:elements:].cold.1((uint64_t)v14, v12);

    v15 = (id)MEMORY[0x24BDBD1A8];
  }

  return v15;
}

- (id)addElementsForScreen:(id)a3 candidates:(id)a4 screenGroupID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  UIUAddedElements *v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "underlyingObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v17), "underlyingObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v15);
  }

  -[UIUDeduplicator underlyingObject](self, "underlyingObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v19, "addElementsForScreenWithTargetScreenshot:candidateElements:screenGroupID:error:", v11, v12, v10, &v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v26;

  if (v20 || !v21)
  {
    v24 = -[UIUAddedElements initWithContents:]([UIUAddedElements alloc], "initWithContents:", v20);
  }
  else
  {
    objc_msgSend(v8, "underlyingObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "imageID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[UIUDeduplicator addElementsForScreen:candidates:screenGroupID:].cold.1((uint64_t)v23, v21);

    v24 = 0;
  }

  return v24;
}

- (void)setDebugMode
{
  id v2;

  -[UIUDeduplicator underlyingObject](self, "underlyingObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDebugTo:", 1);

}

+ (BOOL)areModelsAvailable
{
  return +[UIUModelFetcher areModelsAvailable](UIUModelFetcher, "areModelsAvailable");
}

+ (BOOL)downloadModelSet:(int64_t)a3 timeout:(double)a4
{
  return +[UIUModelFetcher downloadModelSet:timeout:](UIUModelFetcher, "downloadModelSet:timeout:", a3, a4);
}

+ (BOOL)downloadModels:(double)a3
{
  return objc_msgSend(a1, "downloadModelSet:timeout:", 0, a3);
}

- (UIDeduplicatorCompat)underlyingObject
{
  return (UIDeduplicatorCompat *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

- (void)init:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138412290;
  v3 = v1;
  _os_log_error_impl(&dword_2496CB000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to create deduplicator with error %@", (uint8_t *)&v2, 0xCu);

  OUTLINED_FUNCTION_1();
}

- (void)identifyImage:(uint64_t)a1 image:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2496CB000, MEMORY[0x24BDACB70], v3, "Failed to load image %@ with error %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)identifyElements:(uint64_t)a1 elements:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2496CB000, MEMORY[0x24BDACB70], v3, "Failed to identify elements on image %@ with error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)addElementsForScreen:(uint64_t)a1 candidates:(void *)a2 screenGroupID:.cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2496CB000, MEMORY[0x24BDACB70], v3, "Failed to add elements for screenshot %@ with error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
