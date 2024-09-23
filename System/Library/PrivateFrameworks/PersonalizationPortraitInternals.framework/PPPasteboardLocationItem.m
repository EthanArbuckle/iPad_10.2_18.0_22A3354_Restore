@implementation PPPasteboardLocationItem

- (unint64_t)memoryFootprintEstimate
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = __51__PPPasteboardLocationItem_memoryFootprintEstimate__block_invoke(self->_text);
  v4 = __51__PPPasteboardLocationItem_memoryFootprintEstimate__block_invoke(self->_bundleIdentifier) + v3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSDictionary objectEnumerator](self->_addressComponents, "objectEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v4 += __51__PPPasteboardLocationItem_memoryFootprintEstimate__block_invoke(*(void **)(*((_QWORD *)&v11 + 1)
                                                                                            + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v4;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (void)setCreatedAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)addressComponents
{
  return self->_addressComponents;
}

- (void)setAddressComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressComponents, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

uint64_t __51__PPPasteboardLocationItem_memoryFootprintEstimate__block_invoke(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v4;

  v1 = a1;
  if (malloc_size(v1))
  {
    v4 = 0;
    if (objc_msgSend(v1, "_pas_fastUTF8StringPtrWithOptions:encodedLength:", 0, &v4))
      v2 = v4;
    else
      v2 = objc_msgSend(v1, "lengthOfBytesUsingEncoding:", 10);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end
