@implementation SSXPCEncodableRectWrapper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[SSXPCEncodableRectWrapper rect](self, "rect");
  objc_msgSend(v4, "encodeCGRect:forKey:", CFSTR("SSXPCEncodableRectWrapperRectKey"));

}

- (SSXPCEncodableRectWrapper)initWithBSXPCCoder:(id)a3
{
  id v4;
  SSXPCEncodableRectWrapper *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = a3;
  v5 = -[SSXPCEncodableRectWrapper init](self, "init");
  objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("SSXPCEncodableRectWrapperRectKey"));
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[SSXPCEncodableRectWrapper setRect:](v5, "setRect:", v7, v9, v11, v13);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[SSXPCEncodableRectWrapper rect](self, "rect");
  objc_msgSend(v4, "encodeCGRect:forKey:", CFSTR("SSXPCEncodableRectWrapperRectKey"));

}

- (SSXPCEncodableRectWrapper)initWithCoder:(id)a3
{
  id v4;
  SSXPCEncodableRectWrapper *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = a3;
  v5 = -[SSXPCEncodableRectWrapper init](self, "init");
  objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("SSXPCEncodableRectWrapperRectKey"));
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[SSXPCEncodableRectWrapper setRect:](v5, "setRect:", v7, v9, v11, v13);
  return v5;
}

+ (id)encodedRectsInDictionary:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_retainAutorelease(v6);
  objc_msgSend(v8, "cStringUsingEncoding:", 4);
  BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)MEMORY[0x24BDD1968];
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "rect");
        objc_msgSend(v14, "valueWithCGRect:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  return v7;
}

+ (void)encodeRects:(id)a3 inDictionary:(id)a4 forKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  SSXPCEncodableRectWrapper *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v15);
        v17 = objc_alloc_init(SSXPCEncodableRectWrapper);
        objc_msgSend(v16, "CGRectValue", (_QWORD)v19);
        -[SSXPCEncodableRectWrapper setRect:](v17, "setRect:");
        objc_msgSend(v10, "addObject:", v17);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  v18 = objc_retainAutorelease(v9);
  objc_msgSend(v18, "cStringUsingEncoding:", 4);
  BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();

}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

@end
