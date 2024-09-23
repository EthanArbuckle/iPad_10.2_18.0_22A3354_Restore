@implementation SSEnvironmentElementMetadata

- (NSString)loggableDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;
  CGRect v20;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SSEnvironmentElementMetadata rectsInElement](self, "rectsInElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "CGRectValue");
        v9 = (void *)MEMORY[0x24BDD17C8];
        NSStringFromCGRect(v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR(" %@ "), v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  -[SSEnvironmentElementMetadata userActivityTitle](self, "userActivityTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v12);

  return (NSString *)v3;
}

- (id)_encodableRects
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  SSXPCEncodableRectWrapper *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SSEnvironmentElementMetadata rectsInElement](self, "rectsInElement", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        v10 = objc_alloc_init(SSXPCEncodableRectWrapper);
        objc_msgSend(v9, "CGRectValue");
        -[SSXPCEncodableRectWrapper setRect:](v10, "setRect:");
        objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_decodedRectsForEncodedRects:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)MEMORY[0x24BDD1968];
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "rect", (_QWORD)v13);
        objc_msgSend(v10, "valueWithCGRect:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SSEnvironmentElementMetadata userActivityTitle](self, "userActivityTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SSEnvironmentElementMetadataUserActivityTitleKey"));

  -[SSEnvironmentElementMetadata _encodableRects](self, "_encodableRects");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCollection:forKey:", v6, CFSTR("SSEnvironmentElementMetadataRectKey"));

}

- (SSEnvironmentElementMetadata)initWithBSXPCCoder:(id)a3
{
  id v4;
  SSEnvironmentElementMetadata *v5;
  uint64_t v6;
  NSString *userActivityTitle;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *rectsInElement;

  v4 = a3;
  v5 = -[SSEnvironmentElementMetadata init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSEnvironmentElementMetadataUserActivityTitleKey"));
  v6 = objc_claimAutoreleasedReturnValue();
  userActivityTitle = v5->_userActivityTitle;
  v5->_userActivityTitle = (NSString *)v6;

  v8 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v8, objc_opt_class(), CFSTR("SSEnvironmentElementMetadataRectKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SSEnvironmentElementMetadata _decodedRectsForEncodedRects:](v5, "_decodedRectsForEncodedRects:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  rectsInElement = v5->_rectsInElement;
  v5->_rectsInElement = (NSArray *)v10;

  return v5;
}

- (NSString)userActivityTitle
{
  return self->_userActivityTitle;
}

- (void)setUserActivityTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)rectsInElement
{
  return self->_rectsInElement;
}

- (void)setRectsInElement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rectsInElement, 0);
  objc_storeStrong((id *)&self->_userActivityTitle, 0);
}

@end
