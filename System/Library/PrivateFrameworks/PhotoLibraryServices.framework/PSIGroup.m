@implementation PSIGroup

- (PSIGroup)init
{
  PSIGroup *v2;
  const __CFAllocator *v3;
  CFMutableStringRef Mutable;
  NSMutableString *contentString;
  CFMutableStringRef v6;
  NSMutableString *normalizedString;
  CFMutableStringRef v8;
  NSMutableString *lookupIdentifier;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PSIGroup;
  v2 = -[PSIReusableObject init](&v11, sel_init);
  if (v2)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    contentString = v2->_contentString;
    v2->_contentString = (NSMutableString *)Mutable;

    v6 = CFStringCreateMutable(v3, 0);
    normalizedString = v2->_normalizedString;
    v2->_normalizedString = (NSMutableString *)v6;

    v8 = CFStringCreateMutable(v3, 0);
    lookupIdentifier = v2->_lookupIdentifier;
    v2->_lookupIdentifier = (NSMutableString *)v8;

  }
  return v2;
}

- (PSIGroup)initWithContentString:(id)a3 normalizedString:(id)a4 lookupIdentifier:(id)a5 category:(signed __int16)a6 groupId:(unint64_t)a7 owningGroupId:(int64_t)a8 score:(double)a9
{
  id v16;
  id v17;
  id v18;
  PSIGroup *v19;
  uint64_t v20;
  NSMutableString *contentString;
  uint64_t v22;
  NSMutableString *normalizedString;
  uint64_t v24;
  NSMutableString *lookupIdentifier;
  objc_super v27;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PSIGroup;
  v19 = -[PSIReusableObject init](&v27, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v16, "mutableCopy");
    contentString = v19->_contentString;
    v19->_contentString = (NSMutableString *)v20;

    v22 = objc_msgSend(v17, "mutableCopy");
    normalizedString = v19->_normalizedString;
    v19->_normalizedString = (NSMutableString *)v22;

    v24 = objc_msgSend(v18, "mutableCopy");
    lookupIdentifier = v19->_lookupIdentifier;
    v19->_lookupIdentifier = (NSMutableString *)v24;

    v19->_category = a6;
    v19->_groupId = a7;
    v19->_owningGroupId = a8;
    v19->_score = a9;
    -[PSIGroup _resetTokenRangesForContentString](v19, "_resetTokenRangesForContentString");
  }

  return v19;
}

- (PSIGroup)initWithContentString:(id)a3 lookupIdentifier:(id)a4 category:(signed __int16)a5 score:(double)a6
{
  return -[PSIGroup initWithContentString:normalizedString:lookupIdentifier:category:groupId:owningGroupId:score:](self, "initWithContentString:normalizedString:lookupIdentifier:category:groupId:owningGroupId:score:", a3, 0, a4, a5, 0, 0, a6);
}

- (void)dealloc
{
  __CFArray *assetIds;
  __CFArray *collectionIds;
  __CFArray *intersectedAssetIds;
  __CFArray *intersectedCollectionIds;
  objc_super v7;

  assetIds = self->_assetIds;
  if (assetIds)
    CFRelease(assetIds);
  collectionIds = self->_collectionIds;
  if (collectionIds)
    CFRelease(collectionIds);
  intersectedAssetIds = self->_intersectedAssetIds;
  if (intersectedAssetIds)
    CFRelease(intersectedAssetIds);
  intersectedCollectionIds = self->_intersectedCollectionIds;
  if (intersectedCollectionIds)
    CFRelease(intersectedCollectionIds);
  v7.receiver = self;
  v7.super_class = (Class)PSIGroup;
  -[PSIGroup dealloc](&v7, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSIGroup;
  -[PSIGroup description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" id=%d, category=%d, contentString=%@, normalizedString=%@, lookupIdentifier=%@, score=%f, nAssetIds=%d, nCollectionIds=%d"), self->_groupId, self->_category, self->_contentString, self->_normalizedString, self->_lookupIdentifier, *(_QWORD *)&self->_score, -[PSIGroup _assetIdsCount](self, "_assetIdsCount"), -[PSIGroup _collectionIdsCount](self, "_collectionIdsCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int)_assetIdsCount
{
  __CFArray *assetIds;

  assetIds = self->_assetIds;
  if (assetIds)
    LODWORD(assetIds) = CFArrayGetCount(assetIds);
  return (int)assetIds;
}

- (int)_collectionIdsCount
{
  __CFArray *collectionIds;

  collectionIds = self->_collectionIds;
  if (collectionIds)
    LODWORD(collectionIds) = CFArrayGetCount(collectionIds);
  return (int)collectionIds;
}

- (id)_tokenRangesDescription
{
  void *v3;
  unint64_t v4;
  NSUInteger *p_length;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("token ranges: "));
  if (self->_tokenRangesCount)
  {
    v4 = 0;
    p_length = &self->_tokenRanges[0].length;
    do
    {
      NSStringFromRange(*(NSRange *)(p_length - 1));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("%@, "), v6);

      ++v4;
      p_length += 2;
    }
    while (v4 < self->_tokenRangesCount);
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PSIGroup *v4;
  BOOL v5;

  v4 = (PSIGroup *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_groupId == v4->_groupId;
  }

  return v5;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PSIGroup;
  return self->_groupId ^ -[PSIGroup hash](&v3, sel_hash);
}

- (int64_t)compareToGroup:(id)a3
{
  __int16 *v4;
  int category;
  int v6;
  int64_t v7;

  v4 = (__int16 *)a3;
  category = self->_category;
  v6 = v4[96];
  if (category >= v6)
  {
    if (category <= v6)
      v7 = -[NSMutableString compare:](self->_contentString, "compare:", *((_QWORD *)v4 + 2));
    else
      v7 = 1;
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (unint64_t)tokenRangesCount
{
  return self->_tokenRangesCount;
}

- (_NSRange)tokenRangeAtIndex:(unint64_t)a3
{
  _NSRange *v3;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  v3 = &self->_tokenRanges[a3];
  location = v3->location;
  length = v3->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)prepareForReuse
{
  __CFArray *assetIds;
  __CFArray *collectionIds;
  __CFArray *intersectedAssetIds;
  __CFArray *intersectedCollectionIds;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PSIGroup;
  -[PSIReusableObject prepareForReuse](&v7, sel_prepareForReuse);
  self->_groupId = 0;
  self->_category = 0;
  self->_owningGroupId = 0;
  self->_score = 0.0;
  CFStringReplaceAll((CFMutableStringRef)self->_contentString, &stru_1E36789C0);
  CFStringReplaceAll((CFMutableStringRef)self->_normalizedString, &stru_1E36789C0);
  CFStringReplaceAll((CFMutableStringRef)self->_lookupIdentifier, &stru_1E36789C0);
  assetIds = self->_assetIds;
  if (assetIds)
  {
    CFRelease(assetIds);
    self->_assetIds = 0;
  }
  collectionIds = self->_collectionIds;
  if (collectionIds)
  {
    CFRelease(collectionIds);
    self->_collectionIds = 0;
  }
  intersectedAssetIds = self->_intersectedAssetIds;
  if (intersectedAssetIds)
  {
    CFRelease(intersectedAssetIds);
    self->_intersectedAssetIds = 0;
  }
  intersectedCollectionIds = self->_intersectedCollectionIds;
  if (intersectedCollectionIds)
  {
    CFRelease(intersectedCollectionIds);
    self->_intersectedCollectionIds = 0;
  }
  self->_tokenRangesCount = 0;
}

- (void)prepareFromStatement:(sqlite3_stmt *)a3
{
  const unsigned __int8 *v5;
  const unsigned __int8 *v6;
  const unsigned __int8 *v7;
  unint64_t v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PSIGroup;
  -[PSIReusableObject prepareFromStatement:](&v10, sel_prepareFromStatement_);
  self->_groupId = sqlite3_column_int64(a3, 0);
  self->_category = sqlite3_column_int(a3, 1);
  self->_owningGroupId = sqlite3_column_int64(a3, 2);
  v5 = sqlite3_column_text(a3, 3);
  v6 = sqlite3_column_text(a3, 4);
  v7 = sqlite3_column_text(a3, 5);
  self->_score = sqlite3_column_double(a3, 6);
  self->_compressedRanges[0] = sqlite3_column_int64(a3, 7);
  self->_compressedRanges[1] = sqlite3_column_int64(a3, 8);
  CFStringAppendCString((CFMutableStringRef)self->_contentString, (const char *)v5, 0x8000100u);
  CFStringAppendCString((CFMutableStringRef)self->_normalizedString, (const char *)v6, 0x8000100u);
  CFStringAppendCString((CFMutableStringRef)self->_lookupIdentifier, (const char *)v7, 0x8000100u);
  objc_msgSend((id)objc_opt_class(), "_getTokenRanges:fromCompressedRanges:", self->_tokenRanges, self->_compressedRanges);
  v8 = 0;
  self->_tokenRangesCount = 8;
  v9 = 64;
  while (*(Class *)((char *)&self->super.super.isa + v9))
  {
    ++v8;
    v9 += 16;
    if (v8 == 8)
      goto LABEL_6;
  }
  self->_tokenRangesCount = v8;
LABEL_6:
  -[PSIReusableObject didPrepareFromStatement:](self, "didPrepareFromStatement:", a3);
}

- (void)prepareFromFilenameStatement:(sqlite3_stmt *)a3
{
  const unsigned __int8 *v5;
  const unsigned __int8 *v6;
  unint64_t v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PSIGroup;
  -[PSIReusableObject prepareFromStatement:](&v9, sel_prepareFromStatement_);
  self->_groupId = sqlite3_column_int64(a3, 0);
  self->_category = 2100;
  self->_owningGroupId = 0;
  v5 = sqlite3_column_text(a3, 1);
  v6 = sqlite3_column_text(a3, 2);
  self->_compressedRanges[0] = sqlite3_column_int64(a3, 3);
  self->_compressedRanges[1] = sqlite3_column_int64(a3, 4);
  CFStringAppendCString((CFMutableStringRef)self->_contentString, (const char *)v5, 0x8000100u);
  CFStringAppendCString((CFMutableStringRef)self->_normalizedString, (const char *)v6, 0x8000100u);
  objc_msgSend((id)objc_opt_class(), "_getTokenRanges:fromCompressedRanges:", self->_tokenRanges, self->_compressedRanges);
  v7 = 0;
  self->_tokenRangesCount = 8;
  v8 = 64;
  while (*(Class *)((char *)&self->super.super.isa + v8))
  {
    ++v7;
    v8 += 16;
    if (v7 == 8)
      goto LABEL_6;
  }
  self->_tokenRangesCount = v7;
LABEL_6:
  -[PSIReusableObject didPrepareFromStatement:](self, "didPrepareFromStatement:", a3);
}

- (unint64_t)groupIdForObjectLookup
{
  int IsSynonym;
  int *v4;

  IsSynonym = PLSearchIndexCategoryIsSynonym(self->_category);
  v4 = &OBJC_IVAR___PSIGroup__groupId;
  if (IsSynonym)
    v4 = &OBJC_IVAR___PSIGroup__owningGroupId;
  return *(unint64_t *)((char *)&self->super.super.isa + *v4);
}

- (void)unionCollectionIdsWithGroup:(id)a3
{
  __CFArray *collectionIds;
  const __CFArray *v5;
  CFIndex Count;
  unint64_t v7;
  CFIndex v8;
  unint64_t v9;
  __CFArray *Mutable;
  unint64_t v11;
  unint64_t v12;
  const void *ValueAtIndex;
  const void *v14;
  const void *v15;
  const __CFArray *v17;
  CFRange v18;
  CFRange v19;

  collectionIds = self->_collectionIds;
  v5 = (const __CFArray *)objc_msgSend(a3, "collectionIds");
  if (!collectionIds || (Count = CFArrayGetCount(collectionIds)) == 0)
  {
    v17 = v5;
LABEL_20:
    Mutable = (__CFArray *)CFRetain(v17);
    goto LABEL_21;
  }
  if (!v5 || (v7 = Count, (v8 = CFArrayGetCount(v5)) == 0))
  {
    v17 = collectionIds;
    goto LABEL_20;
  }
  v9 = v8;
  Mutable = CFArrayCreateMutable(0, v8 + v7, 0);
  v11 = 0;
  v12 = 0;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(collectionIds, v11);
    v14 = CFArrayGetValueAtIndex(v5, v12);
    if (ValueAtIndex < v14)
      v15 = ValueAtIndex;
    else
      v15 = v14;
    if (ValueAtIndex <= v14)
      ++v11;
    if (ValueAtIndex >= v14)
      ++v12;
    CFArrayAppendValue(Mutable, v15);
  }
  while (v7 > v11 && v9 > v12);
  v18.location = v11;
  v18.length = v7 - v11;
  CFArrayAppendArray(Mutable, collectionIds, v18);
  v19.length = v9 - v12;
  v19.location = v12;
  CFArrayAppendArray(Mutable, v5, v19);
LABEL_21:
  -[PSIGroup setCollectionIds:](self, "setCollectionIds:", CFAutorelease(Mutable));
}

- (void)unionIdsWithGroup:(id)a3
{
  id v4;
  __CFArray *assetIds;
  const __CFArray *v6;
  CFIndex Count;
  unint64_t v8;
  CFIndex v9;
  unint64_t v10;
  __CFArray *Mutable;
  unint64_t v12;
  unint64_t v13;
  const void *ValueAtIndex;
  const void *v15;
  const void *v16;
  const __CFArray *v18;
  __CFArray *collectionIds;
  const __CFArray *v20;
  CFIndex v21;
  unint64_t v22;
  CFIndex v23;
  unint64_t v24;
  __CFArray *v25;
  unint64_t v26;
  unint64_t v27;
  const void *v28;
  const void *v29;
  const void *v30;
  const __CFArray *v32;
  id v33;
  CFRange v34;
  CFRange v35;
  CFRange v36;
  CFRange v37;

  v4 = a3;
  assetIds = self->_assetIds;
  v33 = v4;
  v6 = (const __CFArray *)objc_msgSend(v4, "assetIds");
  if (!assetIds || (Count = CFArrayGetCount(assetIds)) == 0)
  {
    v18 = v6;
LABEL_20:
    Mutable = (__CFArray *)CFRetain(v18);
    goto LABEL_21;
  }
  if (!v6 || (v8 = Count, (v9 = CFArrayGetCount(v6)) == 0))
  {
    v18 = assetIds;
    goto LABEL_20;
  }
  v10 = v9;
  Mutable = CFArrayCreateMutable(0, v9 + v8, 0);
  v12 = 0;
  v13 = 0;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(assetIds, v12);
    v15 = CFArrayGetValueAtIndex(v6, v13);
    if (ValueAtIndex < v15)
      v16 = ValueAtIndex;
    else
      v16 = v15;
    if (ValueAtIndex <= v15)
      ++v12;
    if (ValueAtIndex >= v15)
      ++v13;
    CFArrayAppendValue(Mutable, v16);
  }
  while (v8 > v12 && v10 > v13);
  v34.location = v12;
  v34.length = v8 - v12;
  CFArrayAppendArray(Mutable, assetIds, v34);
  v35.length = v10 - v13;
  v35.location = v13;
  CFArrayAppendArray(Mutable, v6, v35);
LABEL_21:
  -[PSIGroup setAssetIds:](self, "setAssetIds:", CFAutorelease(Mutable));
  collectionIds = self->_collectionIds;
  v20 = (const __CFArray *)objc_msgSend(v33, "collectionIds");
  if (!collectionIds || (v21 = CFArrayGetCount(collectionIds)) == 0)
  {
    v32 = v20;
LABEL_40:
    v25 = (__CFArray *)CFRetain(v32);
    goto LABEL_41;
  }
  if (!v20 || (v22 = v21, (v23 = CFArrayGetCount(v20)) == 0))
  {
    v32 = collectionIds;
    goto LABEL_40;
  }
  v24 = v23;
  v25 = CFArrayCreateMutable(0, v23 + v22, 0);
  v26 = 0;
  v27 = 0;
  do
  {
    v28 = CFArrayGetValueAtIndex(collectionIds, v26);
    v29 = CFArrayGetValueAtIndex(v20, v27);
    if (v28 < v29)
      v30 = v28;
    else
      v30 = v29;
    if (v28 <= v29)
      ++v26;
    if (v28 >= v29)
      ++v27;
    CFArrayAppendValue(v25, v30);
  }
  while (v22 > v26 && v24 > v27);
  v36.location = v26;
  v36.length = v22 - v26;
  CFArrayAppendArray(v25, collectionIds, v36);
  v37.length = v24 - v27;
  v37.location = v27;
  CFArrayAppendArray(v25, v20, v37);
LABEL_41:
  -[PSIGroup setCollectionIds:](self, "setCollectionIds:", CFAutorelease(v25));

}

- (void)_resetTokenRangesForContentString
{
  self->_tokenRanges[0] = 0u;
  self->_tokenRanges[1] = 0u;
  self->_tokenRanges[2] = 0u;
  self->_tokenRanges[3] = 0u;
  self->_tokenRanges[4] = 0u;
  self->_tokenRanges[5] = 0u;
  self->_tokenRanges[6] = 0u;
  self->_tokenRanges[7] = 0u;
  self->_tokenRanges[0].length = -[NSMutableString length](self->_contentString, "length");
  self->_tokenRangesCount = 1;
}

- (BOOL)isExactMatchForQuery
{
  return -[PSIGroup matchTypeForQuery](self, "matchTypeForQuery") - 1 < 3;
}

- (void)updateWithIntersectedIds:(__CFArray *)a3 searchResultType:(unint64_t)a4
{
  id v6;

  if (a4)
  {
    if ((a4 & 1) != 0)
    {
      -[PSIGroup _updateWithIntersectedAssetIds:](self, "_updateWithIntersectedAssetIds:", a3);
    }
    else if ((a4 & 2) != 0)
    {
      -[PSIGroup _updateWithIntersectedCollectionIds:](self, "_updateWithIntersectedCollectionIds:", a3);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PSIGroup.m"), 296, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResultType != (PLSearchResultTypeAsset & PLSearchResultTypeCollection)"));

  }
}

- (void)_updateWithIntersectedAssetIds:(__CFArray *)a3
{
  if (self->_intersectedAssetIds)
    +[PLScopedSearchUtilities intersectSortedArray:withOtherSortedArray:intersectionLimit:](PLScopedSearchUtilities, "intersectSortedArray:withOtherSortedArray:intersectionLimit:", &self->_intersectedAssetIds, a3, 0);
  else
    self->_intersectedAssetIds = CFArrayCreateCopy(0, a3);
}

- (void)_updateWithIntersectedCollectionIds:(__CFArray *)a3
{
  if (self->_intersectedCollectionIds)
    +[PLScopedSearchUtilities intersectSortedArray:withOtherSortedArray:intersectionLimit:](PLScopedSearchUtilities, "intersectSortedArray:withOtherSortedArray:intersectionLimit:", &self->_intersectedCollectionIds, a3, 0);
  else
    self->_intersectedCollectionIds = CFArrayCreateCopy(0, a3);
}

- (void)resetIntersectedIds
{
  __CFArray *intersectedAssetIds;
  __CFArray *intersectedCollectionIds;

  intersectedAssetIds = self->_intersectedAssetIds;
  if (intersectedAssetIds)
    CFRelease(intersectedAssetIds);
  intersectedCollectionIds = self->_intersectedCollectionIds;
  if (intersectedCollectionIds)
    CFRelease(intersectedCollectionIds);
  self->_intersectedAssetIds = 0;
  self->_intersectedCollectionIds = 0;
}

- (unint64_t)objectType
{
  return 2;
}

- (unint64_t)groupId
{
  return self->_groupId;
}

- (void)setGroupId:(unint64_t)a3
{
  self->_groupId = a3;
}

- (unint64_t)owningGroupId
{
  return self->_owningGroupId;
}

- (void)setOwningGroupId:(unint64_t)a3
{
  self->_owningGroupId = a3;
}

- (signed)category
{
  return self->_category;
}

- (void)setCategory:(signed __int16)a3
{
  self->_category = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (NSString)contentString
{
  return &self->_contentString->super;
}

- (NSString)normalizedString
{
  return &self->_normalizedString->super;
}

- (NSString)lookupIdentifier
{
  return &self->_lookupIdentifier->super;
}

- (__CFArray)assetIds
{
  return self->_assetIds;
}

- (void)setAssetIds:(__CFArray *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (__CFArray)collectionIds
{
  return self->_collectionIds;
}

- (void)setCollectionIds:(__CFArray *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 232);
}

- (unint64_t)matchTypeForQuery
{
  return self->_matchTypeForQuery;
}

- (void)setMatchTypeForQuery:(unint64_t)a3
{
  self->_matchTypeForQuery = a3;
}

- (__CFArray)intersectedAssetIds
{
  return self->_intersectedAssetIds;
}

- (__CFArray)intersectedCollectionIds
{
  return self->_intersectedCollectionIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupIdentifier, 0);
  objc_storeStrong((id *)&self->_normalizedString, 0);
  objc_storeStrong((id *)&self->_contentString, 0);
}

+ (void)getCompressedRanges:(unint64_t)a3[2] fromTokenRanges:(id *)a4 count:(int64_t)a5
{
  unint64_t v6;
  unint64_t v7;
  int64_t *p_var1;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  lldiv_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = 0;
  if (a5 >= 8)
    v7 = 8;
  else
    v7 = a5;
  p_var1 = &a4->var1;
  do
  {
    if (v6 >= v7)
    {
      v10 = 0;
      v9 = 0;
    }
    else
    {
      v9 = *(p_var1 - 1);
      v10 = *p_var1;
    }
    v12 = v9 > 256 || v10 > 256;
    v13 = v10;
    v14 = v9;
    v15 = lldiv(v6, 4);
    if (v12)
      v16 = 0;
    else
      v16 = v14;
    v17 = v16 << (16 * LOBYTE(v15.rem));
    if (v12)
      v18 = 0;
    else
      v18 = v13;
    a3[v15.quot] |= v17 | (v18 << ((16 * LOBYTE(v15.rem)) | 8u));
    ++v6;
    p_var1 += 2;
  }
  while (v6 != 8);
}

+ (void)_getTokenRanges:(_NSRange)a3[8] fromCompressedRanges:(unint64_t)a4[2]
{
  uint64_t i;
  lldiv_t v7;
  const double *v8;
  uint64x2_t v9;
  uint64x2_t v10;
  int8x16_t v11;

  for (i = 0; i != 8; ++i)
  {
    v7 = lldiv(i, 4);
    v8 = (const double *)&a4[v7.quot];
    v9.i64[0] = 16 * v7.rem;
    v9.i64[1] = (16 * v7.rem) | 8;
    v10.i64[0] = 255;
    v10.i64[1] = 255;
    v11 = (int8x16_t)vld1q_dup_f64(v8);
    a3[i] = (_NSRange)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v10, v9), v11), (uint64x2_t)vnegq_s64((int64x2_t)v9));
  }
}

@end
