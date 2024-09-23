@implementation UIAccessibilityHierarchyDecoder

- (UIAccessibilityHierarchyDecoder)initWithHierarchyData:(id)a3
{
  id v4;
  UIAccessibilityHierarchyDecoder *v5;
  UIAccessibilityHierarchyDecoder *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIAccessibilityHierarchyDecoder;
  v5 = -[UIAccessibilityHierarchyDecoder init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[UIAccessibilityHierarchyDecoder setHierarchyData:](v5, "setHierarchyData:", v4);

  return v6;
}

- (id)decodeHierarchyWithContainer:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3710];
  v8 = objc_opt_class();
  -[UIAccessibilityHierarchyDecoder hierarchyData](self, "hierarchyData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v7, "unarchivedObjectOfClass:fromData:error:", v8, v9, &v28);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v28;

  v12 = 0;
  v13 = 0;
  if (!v11)
  {
    objc_msgSend(v10, "rootElement");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v6;
    objc_msgSend(v14, "convertToAccessibilityElementWithContainer:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v10, "leafElements");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v19), "convertToAccessibilityElementWithContainer:", v13);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v17);
    }

    objc_msgSend(v12, "sortUsingSelector:", sel_accessibilityCompareGeometry_);
    objc_msgSend(v13, "setAccessibilityElements:", v12);
    v6 = v23;
  }
  if (*a4)
    *a4 = objc_retainAutorelease(v11);
  v21 = v13;

  return v21;
}

- (NSData)hierarchyData
{
  return self->_hierarchyData;
}

- (void)setHierarchyData:(id)a3
{
  objc_storeStrong((id *)&self->_hierarchyData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hierarchyData, 0);
}

@end
