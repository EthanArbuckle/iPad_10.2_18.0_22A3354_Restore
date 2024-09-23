@implementation PLSharedAssetsContainerIncrementalChange

- (PLSharedAssetsContainerIncrementalChange)initWithCoder:(id)a3
{
  id v4;
  PLSharedAssetsContainerIncrementalChange *v5;
  void *v6;
  uint64_t i;
  uint64_t v8;
  NSArray *highlightContainerChanges;
  objc_super v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLSharedAssetsContainerIncrementalChange;
  v5 = -[PLSharedAssetsContainerIncrementalChange init](&v11, sel_init);
  if (v5)
  {
    v5->_collectionChangeType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("collectionChangeType"));
    v5->_sharingChange = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sharingChange"));
    v5->_suggestionStateChange = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("suggestionStateChange"));
    v5->_mediaType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mediaType"));
    objc_opt_class();
    v12[0] = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v12[1] = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", v12, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 1; i != -1; --i)

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("highlightContainerChanges"));
    v8 = objc_claimAutoreleasedReturnValue();
    highlightContainerChanges = v5->_highlightContainerChanges;
    v5->_highlightContainerChanges = (NSArray *)v8;

    v5->_hasNoOtherAssetChangesRequiringMomentGeneration = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasNoOtherAssetChangesRequiringMomentGeneration"));
    if (!v5->_highlightContainerChanges)
      v5->_highlightContainerChanges = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[PLSharedAssetsContainerIncrementalChange collectionChangeType](self, "collectionChangeType"), CFSTR("collectionChangeType"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[PLSharedAssetsContainerIncrementalChange sharingChange](self, "sharingChange"), CFSTR("sharingChange"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[PLSharedAssetsContainerIncrementalChange suggestionStateChange](self, "suggestionStateChange"), CFSTR("suggestionStateChange"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[PLSharedAssetsContainerIncrementalChange mediaType](self, "mediaType"), CFSTR("mediaType"));
  -[PLSharedAssetsContainerIncrementalChange highlightContainerChanges](self, "highlightContainerChanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("highlightContainerChanges"));

  objc_msgSend(v5, "encodeBool:forKey:", -[PLSharedAssetsContainerIncrementalChange hasNoOtherAssetChangesRequiringMomentGeneration](self, "hasNoOtherAssetChangesRequiringMomentGeneration"), CFSTR("hasNoOtherAssetChangesRequiringMomentGeneration"));
}

- (BOOL)isEqual:(id)a3
{
  PLSharedAssetsContainerIncrementalChange *v4;
  PLSharedAssetsContainerIncrementalChange *v5;
  int64_t v6;
  int64_t v7;
  int v8;
  int v9;
  _BOOL4 v10;
  char IsEqual;

  v4 = (PLSharedAssetsContainerIncrementalChange *)a3;
  if (v4 == self)
  {
    IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PLSharedAssetsContainerIncrementalChange collectionChangeType](self, "collectionChangeType");
      if (v6 == -[PLSharedAssetsContainerIncrementalChange collectionChangeType](v5, "collectionChangeType")
        && (v7 = -[PLSharedAssetsContainerIncrementalChange sharingChange](self, "sharingChange"),
            v7 == -[PLSharedAssetsContainerIncrementalChange sharingChange](v5, "sharingChange"))
        && (v8 = -[PLSharedAssetsContainerIncrementalChange suggestionStateChange](self, "suggestionStateChange"),
            v8 == -[PLSharedAssetsContainerIncrementalChange suggestionStateChange](v5, "suggestionStateChange"))
        && (v9 = -[PLSharedAssetsContainerIncrementalChange mediaType](self, "mediaType"),
            v9 == -[PLSharedAssetsContainerIncrementalChange mediaType](v5, "mediaType"))
        && (v10 = -[PLSharedAssetsContainerIncrementalChange hasNoOtherAssetChangesRequiringMomentGeneration](self, "hasNoOtherAssetChangesRequiringMomentGeneration"), v10 == -[PLSharedAssetsContainerIncrementalChange hasNoOtherAssetChangesRequiringMomentGeneration](v5, "hasNoOtherAssetChangesRequiringMomentGeneration")))
      {
        IsEqual = PLObjectIsEqual();
      }
      else
      {
        IsEqual = 0;
      }

    }
    else
    {
      IsEqual = 0;
    }
  }

  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v2;
  _BOOL8 hasNoOtherAssetChangesRequiringMomentGeneration;

  v2 = self->_sharingChange ^ self->_collectionChangeType ^ self->_suggestionStateChange ^ (unint64_t)self->_mediaType;
  hasNoOtherAssetChangesRequiringMomentGeneration = self->_hasNoOtherAssetChangesRequiringMomentGeneration;
  return v2 ^ hasNoOtherAssetChangesRequiringMomentGeneration ^ -[NSArray hash](self->_highlightContainerChanges, "hash");
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[PLSharedAssetsContainerIncrementalChange collectionChangeType](self, "collectionChangeType");
  v6 = -[PLSharedAssetsContainerIncrementalChange sharingChange](self, "sharingChange");
  v7 = -[PLSharedAssetsContainerIncrementalChange suggestionStateChange](self, "suggestionStateChange");
  v8 = -[PLSharedAssetsContainerIncrementalChange mediaType](self, "mediaType");
  v9 = -[PLSharedAssetsContainerIncrementalChange hasNoOtherAssetChangesRequiringMomentGeneration](self, "hasNoOtherAssetChangesRequiringMomentGeneration");
  -[PLSharedAssetsContainerIncrementalChange highlightContainerChanges](self, "highlightContainerChanges");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    -[PLSharedAssetsContainerIncrementalChange highlightContainerChanges](self, "highlightContainerChanges");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "debugDescription");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v3;
    v14 = (void *)v12;
    objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p; collectionChangeType = %d, sharingChange = %d, suggestionStateChange = %d, mediaType = %d, hasNoOtherAssetChangesRequiringMomentGeneration = %d, highlightContainerChanges = %@>"),
      v4,
      self,
      v5,
      v6,
      v7,
      v8,
      v9,
      v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; collectionChangeType = %d, sharingChange = %d, suggestionStateChange = %d, mediaType = %d, hasNoOtherAssetChangesRequiringMomentGeneration = %d, highlightContainerChanges = %@>"),
      v4,
      self,
      v5,
      v6,
      v7,
      v8,
      v9,
      &stru_1E36789C0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (PLSharedAssetsContainerIncrementalChange)init
{
  PLSharedAssetsContainerIncrementalChange *v2;
  PLSharedAssetsContainerIncrementalChange *v3;
  NSArray *highlightContainerChanges;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLSharedAssetsContainerIncrementalChange;
  v2 = -[PLSharedAssetsContainerIncrementalChange init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_suggestionStateChange = 0;
    v2->_collectionChangeType = 0;
    v2->_sharingChange = 0;
    highlightContainerChanges = v2->_highlightContainerChanges;
    v2->_highlightContainerChanges = (NSArray *)MEMORY[0x1E0C9AA60];

    v3->_hasNoOtherAssetChangesRequiringMomentGeneration = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setSharingChange:", self->_sharingChange);
  objc_msgSend(v4, "setSuggestionStateChange:", self->_suggestionStateChange);
  objc_msgSend(v4, "setMediaType:", self->_mediaType);
  objc_msgSend(v4, "setCollectionChangeType:", self->_collectionChangeType);
  v5 = (void *)-[NSArray copy](self->_highlightContainerChanges, "copy");
  objc_msgSend(v4, "setHighlightContainerChanges:", v5);

  objc_msgSend(v4, "setHasNoOtherAssetChangesRequiringMomentGeneration:", self->_hasNoOtherAssetChangesRequiringMomentGeneration);
  return v4;
}

- (BOOL)hasSharingChanges
{
  BOOL v3;
  void *v4;

  if (-[PLSharedAssetsContainerIncrementalChange collectionChangeType](self, "collectionChangeType"))
    return 0;
  -[PLSharedAssetsContainerIncrementalChange highlightContainerChanges](self, "highlightContainerChanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    v3 = 0;
  else
    v3 = -[PLSharedAssetsContainerIncrementalChange sharingChange](self, "sharingChange") != 0;

  return v3;
}

- (BOOL)hasSharingOrSuggestionChanges
{
  return -[PLSharedAssetsContainerIncrementalChange hasSharingChanges](self, "hasSharingChanges")
      || -[PLSharedAssetsContainerIncrementalChange suggestionStateChange](self, "suggestionStateChange") != 0;
}

- (BOOL)hasSuggestionChanges
{
  return -[PLSharedAssetsContainerIncrementalChange suggestionStateChange](self, "suggestionStateChange") != 0;
}

- (BOOL)hasChanges
{
  BOOL v3;
  void *v4;

  if (-[PLSharedAssetsContainerIncrementalChange hasSharingOrSuggestionChanges](self, "hasSharingOrSuggestionChanges")
    || self->_collectionChangeType)
  {
    return 1;
  }
  -[PLSharedAssetsContainerIncrementalChange highlightContainerChanges](self, "highlightContainerChanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "count") != 0;

  return v3;
}

- (BOOL)hasChangesAffectingSharingComposition
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if (-[PLSharedAssetsContainerIncrementalChange hasSharingChanges](self, "hasSharingChanges"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v16[0] = CFSTR("highlightBeingAssets");
    v16[1] = CFSTR("dayGroupHighlightBeingAssets");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[PLSharedAssetsContainerIncrementalChange highlightContainerChanges](self, "highlightContainerChanges", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v3)
    {
      v6 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "relationshipKey");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v4, "containsObject:", v8);

          if ((v9 & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        v3 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v3;
}

- (void)addHighlightContainerChange:(id)a3 sourceHighlightID:(id)a4 destinationHighlightID:(id)a5
{
  unint64_t v9;
  unint64_t v10;
  PLSharedAssetsContainerIncrementalChangeHighlightContainerChange *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *highlightContainerChanges;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v9 = (unint64_t)a4;
  v10 = (unint64_t)a5;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSharedAssetsContainer.m"), 294, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("relationshipKey"));

  }
  if (!(v9 | v10))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSharedAssetsContainer.m"), 295, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceHighlightID != nil || destinationHighlightID != nil"));

  }
  v11 = objc_alloc_init(PLSharedAssetsContainerIncrementalChangeHighlightContainerChange);
  -[PLSharedAssetsContainerIncrementalChangeHighlightContainerChange setRelationshipKey:](v11, "setRelationshipKey:", v18);
  objc_msgSend((id)v9, "URIRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSharedAssetsContainerIncrementalChangeHighlightContainerChange setSourceHighlightURI:](v11, "setSourceHighlightURI:", v12);

  objc_msgSend((id)v10, "URIRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSharedAssetsContainerIncrementalChangeHighlightContainerChange setDestinationHighlightURI:](v11, "setDestinationHighlightURI:", v13);

  -[NSArray arrayByAddingObject:](self->_highlightContainerChanges, "arrayByAddingObject:", v11);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  highlightContainerChanges = self->_highlightContainerChanges;
  self->_highlightContainerChanges = v14;

}

- (void)mergeChangesFrom:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "collectionChangeType"))
      -[PLSharedAssetsContainerIncrementalChange setCollectionChangeType:](self, "setCollectionChangeType:", objc_msgSend(v5, "collectionChangeType"));
    if (objc_msgSend(v5, "sharingChange"))
    {
      if (-[PLSharedAssetsContainerIncrementalChange sharingChange](self, "sharingChange") == 1
        && objc_msgSend(v5, "sharingChange") == 2
        || -[PLSharedAssetsContainerIncrementalChange sharingChange](self, "sharingChange") == 2
        && objc_msgSend(v5, "sharingChange") == 1)
      {
        v6 = 0;
      }
      else
      {
        v6 = objc_msgSend(v5, "sharingChange");
      }
      -[PLSharedAssetsContainerIncrementalChange setSharingChange:](self, "setSharingChange:", v6);
    }
    if (objc_msgSend(v5, "suggestionStateChange"))
    {
      if (-[PLSharedAssetsContainerIncrementalChange suggestionStateChange](self, "suggestionStateChange") == 1
        && objc_msgSend(v5, "suggestionStateChange") == 2
        || -[PLSharedAssetsContainerIncrementalChange suggestionStateChange](self, "suggestionStateChange") == 2
        && objc_msgSend(v5, "suggestionStateChange") == 1)
      {
        v7 = 0;
      }
      else
      {
        v7 = objc_msgSend(v5, "suggestionStateChange");
      }
      -[PLSharedAssetsContainerIncrementalChange setSuggestionStateChange:](self, "setSuggestionStateChange:", v7);
    }
    -[PLSharedAssetsContainerIncrementalChange setMediaType:](self, "setMediaType:", objc_msgSend(v5, "mediaType"));
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v5, "highlightContainerChanges", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
          -[PLSharedAssetsContainerIncrementalChange highlightContainerChanges](self, "highlightContainerChanges");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "containsObject:", v13);

          if ((v15 & 1) == 0)
          {
            -[PLSharedAssetsContainerIncrementalChange highlightContainerChanges](self, "highlightContainerChanges");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (id)objc_msgSend(v16, "arrayByAddingObject:", v13);

          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

  }
}

- (int64_t)collectionChangeType
{
  return self->_collectionChangeType;
}

- (void)setCollectionChangeType:(int64_t)a3
{
  self->_collectionChangeType = a3;
}

- (int64_t)sharingChange
{
  return self->_sharingChange;
}

- (void)setSharingChange:(int64_t)a3
{
  self->_sharingChange = a3;
}

- (unsigned)suggestionStateChange
{
  return self->_suggestionStateChange;
}

- (void)setSuggestionStateChange:(unsigned __int8)a3
{
  self->_suggestionStateChange = a3;
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(unsigned __int8)a3
{
  self->_mediaType = a3;
}

- (BOOL)hasNoOtherAssetChangesRequiringMomentGeneration
{
  return self->_hasNoOtherAssetChangesRequiringMomentGeneration;
}

- (void)setHasNoOtherAssetChangesRequiringMomentGeneration:(BOOL)a3
{
  self->_hasNoOtherAssetChangesRequiringMomentGeneration = a3;
}

- (NSArray)highlightContainerChanges
{
  return self->_highlightContainerChanges;
}

- (void)setHighlightContainerChanges:(id)a3
{
  objc_storeStrong((id *)&self->_highlightContainerChanges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightContainerChanges, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
