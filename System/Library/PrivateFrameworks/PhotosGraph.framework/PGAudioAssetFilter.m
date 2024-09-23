@implementation PGAudioAssetFilter

- (PGAudioAssetFilter)initWithAudioClassifications:(id)a3
{
  id v5;
  PGAudioAssetFilter *v6;
  PGAudioAssetFilter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGAudioAssetFilter;
  v6 = -[PGAudioAssetFilter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_audioClassifications, a3);

  return v7;
}

- (id)filteredAssetsFromAssets:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[PGAudioAssetFilter passesWithAsset:](self, "passesWithAsset:", v11, (_QWORD)v13))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)passesWithAsset:(id)a3
{
  id v4;
  int v5;
  NSIndexSet *audioClassifications;
  BOOL v7;
  _QWORD v9[5];
  __int16 v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  if (-[NSIndexSet count](self->_audioClassifications, "count"))
  {
    v5 = objc_msgSend(v4, "clsInterestingAudioClassifications");
    if (v5)
    {
      v11 = 0;
      v12 = &v11;
      v13 = 0x2020000000;
      v14 = 0;
      audioClassifications = self->_audioClassifications;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __38__PGAudioAssetFilter_passesWithAsset___block_invoke;
      v9[3] = &unk_1E842BD10;
      v10 = v5;
      v9[4] = &v11;
      -[NSIndexSet enumerateIndexesUsingBlock:](audioClassifications, "enumerateIndexesUsingBlock:", v9);
      v7 = *((_BYTE *)v12 + 24) != 0;
      _Block_object_dispose(&v11, 8);
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (PGAudioAssetFilter)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PGAudioAssetFilter *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audioClassifications"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PGAudioAssetFilter initWithAudioClassifications:](self, "initWithAudioClassifications:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_audioClassifications, CFSTR("audioClassifications"));
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v7.receiver = self;
  v7.super_class = (Class)PGAudioAssetFilter;
  -[PGAudioAssetFilter description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %@"), CFSTR("audioClassifications"), self->_audioClassifications);
  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  PGAudioAssetFilter *v4;
  NSIndexSet *audioClassifications;
  void *v6;
  char v7;

  v4 = (PGAudioAssetFilter *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      audioClassifications = self->_audioClassifications;
      -[PGAudioAssetFilter audioClassifications](v4, "audioClassifications");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSIndexSet isEqualToIndexSet:](audioClassifications, "isEqualToIndexSet:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSIndexSet)audioClassifications
{
  return self->_audioClassifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioClassifications, 0);
}

uint64_t __38__PGAudioAssetFilter_passesWithAsset___block_invoke(uint64_t result, __int16 a2, _BYTE *a3)
{
  if ((a2 & *(__int16 *)(result + 40)) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

+ (NSString)name
{
  return (NSString *)CFSTR("Audio");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
