@implementation PRSL2FeatureVector

+ (void)initialize
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  float v7;

  if ((id)objc_opt_class() == a1)
  {
    v2 = &byte_1E6E45C4A;
    v3 = 3235;
    do
    {
      v4 = *((unsigned __int16 *)v2 - 1);
      v6 = *v2;
      v2 += 16;
      v5 = v6;
      if ((v6 & 2) != 0)
        v7 = 0.0;
      else
        v7 = -1.0;
      sDefaultScores[v4] = v7;
      sFeatureFlags[v4] = v5;
      --v3;
    }
    while (v3);
  }
}

+ (__CFSet)getL2FeatureSet
{
  if (getL2FeatureSet_onceToken != -1)
    dispatch_once(&getL2FeatureSet_onceToken, &__block_literal_global_47);
  return (__CFSet *)getL2FeatureSet_sL2FeatureSet;
}

CFSetRef __37__PRSL2FeatureVector_getL2FeatureSet__block_invoke()
{
  uint64_t v0;
  __CFString **v1;
  CFSetRef result;
  CFSetCallBacks v3;
  void *values[3236];

  values[3235] = *(void **)MEMORY[0x1E0C80C00];
  bzero(values, 0x6518uLL);
  v0 = 0;
  v1 = &sFeatureInfo;
  do
  {
    values[v0++] = v1;
    v1 += 2;
  }
  while (v0 != 3235);
  memset(&v3, 0, 32);
  *(_OWORD *)&v3.equal = xmmword_1E6E526B0;
  result = CFSetCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)values, 3235, &v3);
  getL2FeatureSet_sL2FeatureSet = (uint64_t)result;
  return result;
}

+ (id)contextWithFeatureOrder:(id)a3 withInflation:(unint64_t)a4 withInflatedIndexToSize:(id)a5
{
  id v7;
  id v8;
  PRSL2FeatureVectorProcessingContext *v9;

  v7 = a5;
  v8 = a3;
  v9 = -[PRSL2FeatureVectorProcessingContext initWithFeatureOrder:withInflation:withInflatedIndexToSize:]([PRSL2FeatureVectorProcessingContext alloc], "initWithFeatureOrder:withInflation:withInflatedIndexToSize:", v8, a4, v7);

  return v9;
}

+ (FeatureInfo)featureForName:(id)a3
{
  id v3;
  FeatureInfo *Value;
  id v6[2];

  v6[1] = 0;
  v3 = a3;
  v6[0] = v3;
  Value = (FeatureInfo *)CFSetGetValue(+[PRSL2FeatureVector getL2FeatureSet](PRSL2FeatureVector, "getL2FeatureSet"), v6);

  return Value;
}

+ (id)allowedAttributeSetForAnonPipeline
{
  if (allowedAttributeSetForAnonPipeline_onceToken != -1)
    dispatch_once(&allowedAttributeSetForAnonPipeline_onceToken, &__block_literal_global_6481);
  return (id)allowedAttributeSetForAnonPipeline_allowedAttrSet;
}

void __56__PRSL2FeatureVector_allowedAttributeSetForAnonPipeline__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("kMDItemSubject"), CFSTR("kMDItemTitle"), CFSTR("kMDItemPath"), CFSTR("kMDItemContentURL"), CFSTR("redirectSourceTitle"), CFSTR("redirectSourceURL"), CFSTR("kMDItemFilename"), CFSTR("FPFilename"), CFSTR("kMDItemAlternateNames"), CFSTR("kMDItemDisplayName"), CFSTR("kMDItemAuthors"), CFSTR("kMDItemAuthorEmailAddresses"), CFSTR("kMDItemRecipients"), CFSTR("kMDItemPrimaryRecipientEmailAddresses"), CFSTR("kMDItemEmailAddresses"), CFSTR("kMDItemLastEditorName"), CFSTR("kMDItemContactKeywords"),
    CFSTR("kMDItemTextContent"),
    CFSTR("kMDItemComment"),
    CFSTR("kMDItemDescription"),
    CFSTR("kMDItemAttachmentNames"),
    CFSTR("com_apple_mail_attachmentKinds"),
    CFSTR("kMDItemAttachmentTypes"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allowedAttributeSetForAnonPipeline_allowedAttrSet;
  allowedAttributeSetForAnonPipeline_allowedAttrSet = v0;

}

- (PRSL2FeatureVector)init
{
  PRSL2FeatureVector *v2;
  PRSL2FeatureVector *v3;
  uint64_t v4;
  NSMutableDictionary *topicalityAnonFeatDict;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PRSL2FeatureVector;
  v2 = -[PRSL2FeatureVector init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_cache.count = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    topicalityAnonFeatDict = v3->_topicalityAnonFeatDict;
    v3->_topicalityAnonFeatDict = (NSMutableDictionary *)v4;

    v3->_featureDataLock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (PRSL2FeatureVector)initWithCache:(PRSL2FeatureScoreSmallCache *)a3 featureData:(void *)a4 featureDataSize:(unsigned __int16)a5 flags:(unsigned __int8)a6 values:(unsigned __int8)a7
{
  unsigned int v9;
  PRSL2FeatureVector *v12;
  PRSL2FeatureVector *v13;
  unint64_t v14;
  float *scores;
  void *v16;

  v9 = a5;
  v12 = -[PRSL2FeatureVector init](self, "init");
  v13 = v12;
  if (v12)
  {
    v12->_cache.count = a3->count;
    if (a3->count)
    {
      v14 = 0;
      scores = v12->_cache.scores;
      do
      {
        *((_WORD *)scores + v14 - 32) = a3->features[v14];
        scores[v14] = a3->scores[v14];
        ++v14;
      }
      while (v14 < a3->count);
    }
    v16 = malloc_type_malloc(v9, 0x9BAEE257uLL);
    v13->_featureData = v16;
    memcpy(v16, a4, v9);
    v13->_featureDataSize = v9;
    v13->_flags = a6;
    v13->_values = a7;
  }
  return v13;
}

- (void)setDisplayNameFuzzySpecialInsertion:(BOOL)a3
{
  os_unfair_lock_s *p_featureDataLock;

  p_featureDataLock = &self->_featureDataLock;
  os_unfair_lock_lock(&self->_featureDataLock);
  self->_flags |= 1u;
  os_unfair_lock_unlock(p_featureDataLock);
}

- (BOOL)displayNameFuzzySpecialInsertion
{
  os_unfair_lock_s *p_featureDataLock;

  p_featureDataLock = &self->_featureDataLock;
  os_unfair_lock_lock(&self->_featureDataLock);
  os_unfair_lock_unlock(p_featureDataLock);
  return 0;
}

- (void)setIsSiriAction:(BOOL)a3
{
  os_unfair_lock_s *p_featureDataLock;

  p_featureDataLock = &self->_featureDataLock;
  os_unfair_lock_lock(&self->_featureDataLock);
  self->_flags |= 2u;
  self->_values = self->_values & 0xFE | a3;
  os_unfair_lock_unlock(p_featureDataLock);
}

- (BOOL)isSiriAction
{
  PRSL2FeatureVector *v2;
  os_unfair_lock_s *p_featureDataLock;

  v2 = self;
  p_featureDataLock = &self->_featureDataLock;
  os_unfair_lock_lock(&self->_featureDataLock);
  LODWORD(v2) = v2->_values & ((v2->_flags & 2) >> 1);
  os_unfair_lock_unlock(p_featureDataLock);
  return (char)v2;
}

- (void)setIsAppInDock:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_featureDataLock;
  char v6;

  v3 = a3;
  p_featureDataLock = &self->_featureDataLock;
  os_unfair_lock_lock(&self->_featureDataLock);
  self->_flags |= 4u;
  if (v3)
    v6 = 2;
  else
    v6 = 0;
  self->_values = self->_values & 0xFD | v6;
  os_unfair_lock_unlock(p_featureDataLock);
}

- (BOOL)isAppInDock
{
  PRSL2FeatureVector *v2;
  os_unfair_lock_s *p_featureDataLock;

  v2 = self;
  p_featureDataLock = &self->_featureDataLock;
  os_unfair_lock_lock(&self->_featureDataLock);
  LODWORD(v2) = (v2->_flags >> 2) & ((v2->_values & 2) >> 1);
  os_unfair_lock_unlock(p_featureDataLock);
  return (char)v2;
}

- (BOOL)vipSenderMatchesQuery
{
  float v2;

  -[PRSL2FeatureVector scoreForFeature:](self, "scoreForFeature:", 1853);
  return v2 != 0.0;
}

- (BOOL)senderIsVip
{
  float v2;

  -[PRSL2FeatureVector scoreForFeature:](self, "scoreForFeature:", 1852);
  return v2 != 0.0;
}

- (BOOL)receiverIsVip
{
  float v2;

  -[PRSL2FeatureVector scoreForFeature:](self, "scoreForFeature:", 1854);
  return v2 != 0.0;
}

- (float)scoreForFeature:(unsigned __int16)a3
{
  unsigned int v3;
  os_unfair_lock_s *p_featureDataLock;
  uint64_t v6;
  int v7;
  int v8;
  unsigned __int8 *featureData;
  unsigned int v10;
  unsigned __int8 *v11;
  int v12;
  unsigned int v13;
  float v14;
  _BOOL4 BoolFromFlaggedFeature;

  v3 = a3;
  p_featureDataLock = &self->_featureDataLock;
  os_unfair_lock_lock(&self->_featureDataLock);
  if (self->_cache.count)
  {
    v6 = 0;
    do
    {
      if (self->_cache.features[v6] == v3)
      {
        v14 = self->_cache.scores[v6];
        goto LABEL_28;
      }
      ++v6;
    }
    while (self->_cache.count != v6);
  }
  if ((sFeatureFlags[v3] & 0x20) != 0)
  {
    BoolFromFlaggedFeature = getBoolFromFlaggedFeature(v3, self->_flags, self->_values);
    os_unfair_lock_unlock(p_featureDataLock);
    return (float)BoolFromFlaggedFeature;
  }
  if (!self->_featureDataSize)
  {
LABEL_25:
    v14 = sDefaultScores[v3];
    goto LABEL_28;
  }
  v7 = 0;
  v8 = 0;
  featureData = (unsigned __int8 *)self->_featureData;
  while (1)
  {
    v10 = *featureData;
    if ((v10 & 0xC0) != 0x40)
    {
      v11 = featureData + 1;
      if ((v10 & 0x3F) != 0)
      {
        v12 = v10 & 0x1F;
        if ((v10 & 0x20) != 0)
        {
          v11 = featureData + 2;
          v12 = featureData[1] | (v12 << 8);
        }
        if ((v10 & 0xC0) != 0)
        {
LABEL_15:
          if ((v10 & 0xC0) == 0x80)
          {
            if (v7 + v12 >= v3)
              goto LABEL_25;
          }
          else if (v10 >= 0xC0 && v7 + v12 >= v3)
          {
            v14 = 0.0;
            goto LABEL_28;
          }
          goto LABEL_23;
        }
      }
      else
      {
        v12 = 0;
        if ((v10 & 0xC0) != 0)
          goto LABEL_15;
      }
      if (v7 + v12 >= v3)
      {
        v14 = *(float *)&v11[4 * (v3 - v7)];
        goto LABEL_28;
      }
      v11 += (4 * v12 + 4);
LABEL_23:
      v8 += v12;
      goto LABEL_24;
    }
    if (v3 == (unsigned __int16)v8)
      break;
    v11 = featureData + 1;
LABEL_24:
    v13 = (unsigned __int16)v8++;
    v7 = (unsigned __int16)v8;
    featureData = v11;
    if (v13 >= 0xCA2)
      goto LABEL_25;
  }
  if ((v10 & 0x3F) == 0x3F)
    v14 = 2147500000.0;
  else
    v14 = (float)(v10 & 0x3F);
LABEL_28:
  os_unfair_lock_unlock(p_featureDataLock);
  return v14;
}

- (float)getAllScores:(float)a3[3235]
{
  os_unfair_lock_s *p_featureDataLock;
  uint64_t count;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  unsigned int v10;
  float v11;

  p_featureDataLock = &self->_featureDataLock;
  os_unfair_lock_lock(&self->_featureDataLock);
  decodeRankingScores((unsigned __int8 *)self->_featureData, self->_featureDataSize, (char *)a3);
  count = self->_cache.count;
  if (self->_cache.count)
  {
    v7 = 0;
    do
    {
      a3[self->_cache.features[v7]] = self->_cache.scores[v7];
      ++v7;
    }
    while (count != v7);
  }
  for (i = 0; i != 6; ++i)
  {
    v9 = (unsigned __int16)sFlaggedFeatureList[i];
    if ((sFeatureFlags[v9] & 0x20) == 0)
      continue;
    if ((unsigned __int16)sFlaggedFeatureList[i] > 0x78Au)
    {
      switch((_DWORD)v9)
      {
        case 0x78B:
          v10 = 1;
          break;
        case 0x7AD:
          v10 = 4;
          break;
        case 0x7AE:
          v10 = 2;
          break;
        default:
          continue;
      }
    }
    else
    {
      switch((_DWORD)v9)
      {
        case 0x73C:
          v10 = 16;
          break;
        case 0x73D:
          v10 = 8;
          break;
        case 0x73E:
          v10 = 32;
          break;
        default:
          continue;
      }
    }
    if ((self->_flags & v10) != 0)
    {
      if ((self->_values & (v10 >> 1)) != 0)
        v11 = 1.0;
      else
        v11 = 0.0;
      a3[v9] = v11;
    }
  }
  os_unfair_lock_unlock(p_featureDataLock);
  return a3;
}

- (void)setScores:(float *)a3 forFeatures:(unsigned __int16 *)a4 count:(unint64_t)a5
{
  os_unfair_lock_s *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int16 *v8;
  unsigned __int16 *v9;
  float *v10;
  float *v11;
  os_unfair_lock_s *v12;
  os_unfair_lock_s *v13;
  uint64_t os_unfair_lock_opaque_low;
  unsigned __int16 os_unfair_lock_opaque;
  int v16;
  int v17;
  float v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int v21;
  char v22;
  uint64_t i;
  int v24;
  int v25;
  float v26;
  unsigned int v27;
  unsigned int v28;
  char v29;
  char *v30;
  int v31;
  int v32;
  float *v33;
  float v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  float *v38;
  char *v39;
  float v40;
  int v41;
  unsigned int v43;
  uint64_t v44;
  float v45;
  uint64_t v48;
  int v49;
  char *v50;
  char v51;
  size_t v52;
  __int16 v53;
  int64_t v54;
  size_t v55;
  void *v56;
  void *v57;
  _BYTE __src[23];
  char v59[12940];
  uint64_t v60;

  v5 = (os_unfair_lock_s *)((uint64_t (*)(PRSL2FeatureVector *, SEL, float *, unsigned __int16 *, unint64_t))MEMORY[0x1E0C80A78])(self, a2, a3, a4, a5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = v5;
  v60 = *MEMORY[0x1E0C80C00];
  v13 = v5 + 2;
  os_unfair_lock_lock(v5 + 2);
  os_unfair_lock_opaque_low = LOWORD(v12[51]._os_unfair_lock_opaque);
  if ((unint64_t)(os_unfair_lock_opaque_low + v7) <= 0x1F)
  {
    if (!v7)
    {
LABEL_23:
      os_unfair_lock_unlock(v13);
      return;
    }
    os_unfair_lock_opaque = v12[51]._os_unfair_lock_opaque;
    while (1)
    {
      v17 = *v9++;
      v16 = v17;
      v18 = *v11;
      *((_WORD *)&v12[3]._os_unfair_lock_opaque + os_unfair_lock_opaque) = v17;
      v19 = LOWORD(v12[51]._os_unfair_lock_opaque);
      os_unfair_lock_opaque = v19 + 1;
      LOWORD(v12[51]._os_unfair_lock_opaque) = v19 + 1;
      *(float *)&v12[v19 + 19]._os_unfair_lock_opaque = v18;
      if ((sFeatureFlags[v17] & 0x20) != 0)
      {
        if (v16 > 1930)
        {
          switch(v16)
          {
            case 1931:
              v20 = 1;
              goto LABEL_18;
            case 1965:
              v20 = 4;
              goto LABEL_18;
            case 1966:
              v20 = 2;
              goto LABEL_18;
          }
        }
        else
        {
          switch(v16)
          {
            case 1852:
              v20 = 16;
              goto LABEL_18;
            case 1853:
              v20 = 8;
              goto LABEL_18;
            case 1854:
              v20 = 32;
LABEL_18:
              BYTE2(v12[54]._os_unfair_lock_opaque) |= v20;
              v21 = v20 >> 1;
              if (v18 == 1.0)
                v22 = HIBYTE(v12[54]._os_unfair_lock_opaque) | v21;
              else
                v22 = HIBYTE(v12[54]._os_unfair_lock_opaque) & ~(_BYTE)v21;
              HIBYTE(v12[54]._os_unfair_lock_opaque) = v22;
              break;
          }
        }
      }
      ++v11;
      if (!--v7)
        goto LABEL_23;
    }
  }
  bzero(v59, 0x328CuLL);
  decodeRankingScores(*(unsigned __int8 **)&v12[52]._os_unfair_lock_opaque, LOWORD(v12[54]._os_unfair_lock_opaque), v59);
  if ((_DWORD)os_unfair_lock_opaque_low)
  {
    for (i = 0; i != os_unfair_lock_opaque_low; ++i)
      *(os_unfair_lock_s *)&v59[4 * *((unsigned __int16 *)&v12[3]._os_unfair_lock_opaque + i)] = v12[i + 19];
  }
  for (LOWORD(v12[51]._os_unfair_lock_opaque) = 0; v7; --v7)
  {
    v25 = *v9++;
    v24 = v25;
    v26 = *v11;
    *(float *)&v59[4 * v25] = *v11;
    if ((sFeatureFlags[v25] & 0x20) != 0)
    {
      if (v24 > 1930)
      {
        switch(v24)
        {
          case 1931:
            v27 = 1;
            goto LABEL_42;
          case 1965:
            v27 = 4;
            goto LABEL_42;
          case 1966:
            v27 = 2;
            goto LABEL_42;
        }
      }
      else
      {
        switch(v24)
        {
          case 1852:
            v27 = 16;
            goto LABEL_42;
          case 1853:
            v27 = 8;
            goto LABEL_42;
          case 1854:
            v27 = 32;
LABEL_42:
            BYTE2(v12[54]._os_unfair_lock_opaque) |= v27;
            v28 = v27 >> 1;
            if (v26 == 1.0)
              v29 = HIBYTE(v12[54]._os_unfair_lock_opaque) | v28;
            else
              v29 = HIBYTE(v12[54]._os_unfair_lock_opaque) & ~(_BYTE)v28;
            HIBYTE(v12[54]._os_unfair_lock_opaque) = v29;
            break;
        }
      }
    }
    ++v11;
  }
  v57 = *(void **)&v12[52]._os_unfair_lock_opaque;
  v30 = __src;
  bzero(__src, 0x1F978uLL);
  v31 = 0;
  v32 = 0;
  do
  {
    v33 = (float *)&v59[4 * (unsigned __int16)v32];
    v34 = *v33;
    if (*v33 == sDefaultScores[(unsigned __int16)v32])
    {
      v35 = 128;
      goto LABEL_52;
    }
    if (v34 == 0.0)
    {
      v35 = 192;
LABEL_52:
      v36 = (v31 + 1);
      if (v31 == 3234)
      {
        *v30++ = v35;
      }
      else
      {
        v37 = 0;
        v38 = &sDefaultScores[v31 + 1];
        v39 = &v59[4 * v31 + 4];
        while ((unint64_t)(v36 + v37) <= 0xCA2)
        {
          v40 = *(float *)&v39[4 * v37];
          if (v40 == v38[v37])
          {
            v41 = 128;
          }
          else
          {
            if (v40 != 0.0)
              break;
            v41 = 192;
          }
          if (v41 != v35)
            break;
          if (++v37 == 2047)
            goto LABEL_64;
        }
        if ((unsigned __int16)v37 >= 0x20u)
        {
LABEL_64:
          *v30 = v35 | BYTE1(v37) & 0x1F | 0x20;
          v30[1] = v37;
          v30 += 2;
          goto LABEL_66;
        }
        *v30++ = v35 | v37;
LABEL_66:
        v32 += v37;
      }
      goto LABEL_67;
    }
    if (v34 != 2147500000.0 && (((int)v34 - 1) > 0x3D || v34 != (float)(int)v34))
    {
      if ((unsigned __int16)v32 > 0xCA1u)
      {
        v48 = 0;
        v43 = 0;
      }
      else
      {
        v43 = 0;
        v44 = (unsigned __int16)v32 + 1;
        while (1)
        {
          v45 = *(float *)&v59[4 * v44];
          if (v45 == 2147500000.0)
            break;
          if (v45 == 0.0 || v45 == sDefaultScores[v44])
            break;
          if (((int)v45 - 1) <= 0x3D && v45 == (float)(int)v45)
            break;
          ++v43;
          if (++v44 == 3235)
          {
            v43 = 3234 - v32;
            break;
          }
        }
        v48 = (unsigned __int16)v43;
        if ((unsigned __int16)v43 >= 0x20u)
        {
          v49 = (v43 >> 8) & 0x1F | 0x20;
          v50 = v30 + 2;
          v30[1] = v43;
LABEL_95:
          *v30 = v49;
          v52 = 4 * v48 + 4;
          memcpy(v50, v33, v52);
          v30 = &v50[v52];
          v32 += v43;
          goto LABEL_67;
        }
      }
      v50 = v30 + 1;
      LOBYTE(v49) = v43;
      goto LABEL_95;
    }
    if (v34 == 2147500000.0)
      v51 = 127;
    else
      v51 = (int)v34 & 0x3F | 0x40;
    *v30++ = v51;
LABEL_67:
    v31 = (unsigned __int16)++v32;
  }
  while ((unsigned __int16)v32 < 0xCA3u);
  v54 = v30 - __src;
  v55 = (unsigned __int16)((_WORD)v30 - (v53 + 8));
  v56 = malloc_type_malloc(v55, 0x6906E85FuLL);
  memcpy(v56, __src, v55);
  *(_QWORD *)&v12[52]._os_unfair_lock_opaque = v56;
  LOWORD(v12[54]._os_unfair_lock_opaque) = v54;
  os_unfair_lock_unlock(v13);
  free(v57);
}

- (id)dictionaryRepresentation
{
  return -[PRSL2FeatureVector _dictionaryRepresentationWithoutDefaultValues:](self, "_dictionaryRepresentationWithoutDefaultValues:", 0);
}

- (id)_dictionaryRepresentationWithoutDefaultValues:(BOOL)a3
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  float v11;
  int v12;
  uint64_t v13;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  _BYTE v24[12940];
  uint64_t v25;

  v3 = ((uint64_t (*)(PRSL2FeatureVector *, SEL, BOOL))MEMORY[0x1E0C80A78])(self, a2, a3);
  v5 = v4;
  v6 = v3;
  v25 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_opt_new();
  bzero(v24, 0x328CuLL);
  v8 = objc_msgSend((id)v6, "getAllScores:", v24);
  v9 = &byte_1E6E45C4A;
  v10 = 3235;
  do
  {
    v11 = *(float *)(v8 + 4 * *((unsigned __int16 *)v9 - 1));
    if (v5)
    {
      if ((unsigned __int16)(*((_WORD *)v9 - 1) - 2397) < 0x20u)
        goto LABEL_27;
      if (fabsf(v11 + 1.0) <= 0.001)
        goto LABEL_27;
      v12 = *((unsigned __int16 *)v9 - 1);
      if ((v12 - 397) < 2 || v12 == 2391)
        goto LABEL_27;
      if ((*v9 & 0x10) != 0)
      {
        v13 = 4;
        goto LABEL_16;
      }
      if ((*v9 & 8) != 0)
        goto LABEL_14;
      if ((*v9 & 4) != 0)
        goto LABEL_15;
      if ((*v9 & 0x40) != 0)
      {
        if (v11 <= 30.0)
LABEL_14:
          v13 = 2;
        else
LABEL_15:
          v13 = 1;
LABEL_16:
        +[PRSRankingUtilities floatValue:withSigFigs:](PRSRankingUtilities, "floatValue:withSigFigs:", v13);
      }
    }
    if (v11 == 0.0 || v11 == 1.0 || v11 == -1.0)
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)v11);
    else
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, *(_QWORD *)(v9 - 10));

LABEL_27:
    v9 += 16;
    --v10;
  }
  while (v10);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", *(_QWORD *)(v6 + 248), CFSTR("bundleID"));
  if ((v5 & 1) == 0)
  {
    LODWORD(v17) = *(_DWORD *)(v6 + 220);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("l2Score"));

    LODWORD(v19) = *(_DWORD *)(v6 + 224);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, CFSTR("l2ScoreExperimental"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v6 + 480));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, CFSTR("lscore_0_2"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v6 + 488));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, CFSTR("lscore_1_2"));

  return v7;
}

- (id)dictionaryRepresentationWithoutDefaultValues
{
  return -[PRSL2FeatureVector _dictionaryRepresentationWithoutDefaultValues:](self, "_dictionaryRepresentationWithoutDefaultValues:", 1);
}

- (void)restoreFromJazzkonPlusHacks:(float *)a3
{
  float v5;

  v5 = a3[372];
  if (-[NSString isEqualToString:](self->_bundleID, "isEqualToString:", CFSTR("com.apple.Preferences")))
  {
    -[PRSL2FeatureVector swapAllLastUsedDateFeatures:](self, "swapAllLastUsedDateFeatures:", a3);
    -[PRSL2FeatureVector swapAllRecenyFeatures:](self, "swapAllRecenyFeatures:", a3);
  }
  else if (-[NSString isEqualToString:](self->_bundleID, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")))
  {
    -[PRSL2FeatureVector swapAllLastUsedDateFeatures:](self, "swapAllLastUsedDateFeatures:", a3);
  }
  if (v5 == 0.0
    && (!-[NSString hasPrefix:](self->_bundleID, "hasPrefix:", CFSTR("com.apple."))
     || -[NSString isEqualToString:](self->_bundleID, "isEqualToString:", CFSTR("com.apple.Preferences"))
     || -[NSString isEqualToString:](self->_bundleID, "isEqualToString:", CFSTR("com.apple.CoreSuggestions"))))
  {
    -[PRSL2FeatureVector swapFeature:withSubstitute:scores:](self, "swapFeature:withSubstitute:scores:", 1911, 2355, a3);
  }
  if (-[NSString isEqualToString:](self->_bundleID, "isEqualToString:", CFSTR("com.apple.mobilecal"))
    && a3[2354] != -1.0)
  {
    -[PRSL2FeatureVector swapFeature:withSubstitute:scores:](self, "swapFeature:withSubstitute:scores:", 42, 2354, a3);
  }
  if (-[NSString isEqualToString:](self->_bundleID, "isEqualToString:", CFSTR("com.apple.mobilenotes"))
    || -[NSString isEqualToString:](self->_bundleID, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")))
  {
    -[PRSL2FeatureVector swapFeature:withSubstitute:scores:](self, "swapFeature:withSubstitute:scores:", 42, 2354, a3);
  }
  if (-[NSString isEqualToString:](self->_bundleID, "isEqualToString:", CFSTR("com.apple.mobilenotes")))
  {
    if (a3[2338] != -1.0)
      -[PRSL2FeatureVector swapFeature:withSubstitute:scores:](self, "swapFeature:withSubstitute:scores:", 10, 2338, a3);
    if (a3[2339] != -1.0)
      -[PRSL2FeatureVector swapFeature:withSubstitute:scores:](self, "swapFeature:withSubstitute:scores:", 8, 2339, a3);
    if (a3[2340] != -1.0)
      -[PRSL2FeatureVector swapFeature:withSubstitute:scores:](self, "swapFeature:withSubstitute:scores:", 6, 2340, a3);
  }
  if (-[NSString isEqualToString:](self->_bundleID, "isEqualToString:", CFSTR("com.apple.application"))
    || -[NSString isEqualToString:](self->_bundleID, "isEqualToString:", CFSTR("com.apple.Preferences"))
    || -[NSString isEqualToString:](self->_bundleID, "isEqualToString:", CFSTR("com.apple.DocumentsApp"))
    || -[NSString isEqualToString:](self->_bundleID, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage"))
    || -[NSString isEqualToString:](self->_bundleID, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider")))
  {
    if (a3[2354] == 1.0)
      -[PRSL2FeatureVector swapFeature:withSubstitute:scores:](self, "swapFeature:withSubstitute:scores:", 42, 2354, a3);
  }
  else if (-[NSString isEqualToString:](self->_bundleID, "isEqualToString:", CFSTR("com.apple.Passbook")))
  {
    -[PRSL2FeatureVector swapAllContentCreationDateFeatures:](self, "swapAllContentCreationDateFeatures:", a3);
  }
  if (-[NSString isEqualToString:](self->_bundleID, "isEqualToString:", CFSTR("com.apple.photos")) && a3[3085] != -1.0)
    -[PRSL2FeatureVector swapFeature:withSubstitute:scores:](self, "swapFeature:withSubstitute:scores:", 204, 3085, a3);
  if (v5 != 0.0)
    -[PRSL2FeatureVector swapFeature:withSubstitute:scores:](self, "swapFeature:withSubstitute:scores:", 377, 378, a3);
}

- (void)swapAllContentCreationDateFeatures:(float *)a3
{
  -[PRSL2FeatureVector swapFeature:withSubstitute:scores:](self, "swapFeature:withSubstitute:scores:", 1874, 2341, a3);
  -[PRSL2FeatureVector swapFeature:withSubstitute:scores:](self, "swapFeature:withSubstitute:scores:", 9, 2342, a3);
  -[PRSL2FeatureVector swapFeature:withSubstitute:scores:](self, "swapFeature:withSubstitute:scores:", 3, 2343, a3);
  -[PRSL2FeatureVector swapFeature:withSubstitute:scores:](self, "swapFeature:withSubstitute:scores:", 7, 2344, a3);
  -[PRSL2FeatureVector swapFeature:withSubstitute:scores:](self, "swapFeature:withSubstitute:scores:", 5, 2345, a3);
}

- (void)swapAllLastUsedDateFeatures:(float *)a3
{
  -[PRSL2FeatureVector swapFeature:withSubstitute:scores:](self, "swapFeature:withSubstitute:scores:", 10, 2338, a3);
  -[PRSL2FeatureVector swapFeature:withSubstitute:scores:](self, "swapFeature:withSubstitute:scores:", 8, 2339, a3);
  -[PRSL2FeatureVector swapFeature:withSubstitute:scores:](self, "swapFeature:withSubstitute:scores:", 6, 2340, a3);
}

- (void)swapAllRecenyFeatures:(float *)a3
{
  -[PRSL2FeatureVector swapFeature:withSubstitute:scores:](self, "swapFeature:withSubstitute:scores:", 1972, 2346, a3);
  -[PRSL2FeatureVector swapFeature:withSubstitute:scores:](self, "swapFeature:withSubstitute:scores:", 1973, 2347, a3);
  -[PRSL2FeatureVector swapFeature:withSubstitute:scores:](self, "swapFeature:withSubstitute:scores:", 1974, 2348, a3);
  -[PRSL2FeatureVector swapFeature:withSubstitute:scores:](self, "swapFeature:withSubstitute:scores:", 1975, 2349, a3);
  -[PRSL2FeatureVector swapFeature:withSubstitute:scores:](self, "swapFeature:withSubstitute:scores:", 1976, 2350, a3);
  -[PRSL2FeatureVector swapFeature:withSubstitute:scores:](self, "swapFeature:withSubstitute:scores:", 1977, 2351, a3);
  -[PRSL2FeatureVector swapFeature:withSubstitute:scores:](self, "swapFeature:withSubstitute:scores:", 1978, 2352, a3);
  -[PRSL2FeatureVector swapFeature:withSubstitute:scores:](self, "swapFeature:withSubstitute:scores:", 1979, 2353, a3);
}

- (void)setAllDisplayNameFeatures:(float *)a3 withValue:(float)a4
{
  float v4;
  int32x4_t v5;

  v4 = 1.0;
  if (a4 == -1.0)
    v4 = 0.0;
  a3[308] = v4;
  a3[131] = a4;
  a3[203] = a4;
  a3[165] = a4;
  a3[95] = a4;
  v5 = vdupq_lane_s32(*(int32x2_t *)&a4, 0);
  a3[77] = a4;
  *(int32x4_t *)(a3 + 198) = v5;
  a3[130] = a4;
  a3[202] = a4;
  a3[164] = a4;
  a3[113] = a4;
  *(int32x4_t *)(a3 + 410) = v5;
  *(int32x4_t *)(a3 + 414) = v5;
  *(int32x4_t *)(a3 + 418) = v5;
  a3[422] = a4;
  a3[423] = a4;
  a3[424] = a4;
  *(int32x4_t *)(a3 + 673) = v5;
  *(int32x4_t *)(a3 + 665) = v5;
  *(int32x4_t *)(a3 + 669) = v5;
  a3[2429] = a4;
  a3[2430] = a4;
  a3[2431] = a4;
  a3[2432] = a4;
  a3[2593] = a4;
  a3[2594] = a4;
}

- (void)swapFeature:(unsigned __int16)a3 withSubstitute:(unsigned __int16)a4 scores:(float *)a5
{
  float v5;
  float v6;

  v5 = a5[a4];
  if (v5 != -1.0)
  {
    v6 = a5[a3];
    a5[a3] = v5;
    a5[a4] = v6;
  }
}

- (BOOL)serializeToJSON:(void *)a3 options:(int64_t)a4
{
  uint64_t v4;
  char v5;
  char v6;
  _DWORD *v7;
  _DWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  float v14;
  double v17;
  int v18;
  uint64_t v19;
  float v20;
  id WeakRetained;
  uint64_t i;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  __CFString *v49;
  id v50;
  int v51;
  id v52;
  int v53;
  id v54;
  int v55;
  id v56;
  int v57;
  id v58;
  int v59;
  __CFString **v60;
  __CFString *v61;
  __CFString *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t j;
  void *v68;
  void *v69;
  float v70;
  float v71;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[132];
  _BYTE v78[12940];
  uint64_t v79;

  v4 = ((uint64_t (*)(PRSL2FeatureVector *, SEL, void *, int64_t))MEMORY[0x1E0C80A78])(self, a2, a3, a4);
  v6 = v5;
  v8 = v7;
  v9 = v4;
  v79 = *MEMORY[0x1E0C80C00];
  bzero(v78, 0x328CuLL);
  v10 = objc_msgSend((id)v9, "getAllScores:", v78);
  if ((v6 & 2) == 0)
    objc_msgSend((id)v9, "restoreFromJazzkonPlusHacks:", v10);
  v11 = -1;
  v12 = &byte_1E6E45C4A;
  v13 = 3235;
  do
  {
    v14 = *(float *)(v10 + 4 * *((unsigned __int16 *)v12 - 1));
    if (*((_WORD *)v12 - 1) == 363)
      v11 = (uint64_t)v14;
    if ((v6 & 1) == 0)
      goto LABEL_7;
    if ((unsigned __int16)(*((_WORD *)v12 - 1) - 2397) < 0x20u)
      goto LABEL_26;
    v17 = fabsf(v14 + 1.0);
    if (v17 <= 0.001)
      goto LABEL_26;
    v18 = *((unsigned __int16 *)v12 - 1);
    if ((v18 - 397) < 2 || v18 == 2391)
      goto LABEL_26;
    if ((*v12 & 0x10) != 0)
    {
      LODWORD(v17) = *(_DWORD *)(v10 + 4 * *((unsigned __int16 *)v12 - 1));
      v19 = 4;
      goto LABEL_31;
    }
    if ((*v12 & 8) != 0)
      goto LABEL_29;
    if ((*v12 & 4) != 0)
      goto LABEL_30;
    if ((*v12 & 0x40) != 0)
    {
      if (v14 <= 30.0)
      {
LABEL_29:
        LODWORD(v17) = *(_DWORD *)(v10 + 4 * *((unsigned __int16 *)v12 - 1));
        v19 = 2;
      }
      else
      {
LABEL_30:
        LODWORD(v17) = *(_DWORD *)(v10 + 4 * *((unsigned __int16 *)v12 - 1));
        v19 = 1;
      }
LABEL_31:
      +[PRSRankingUtilities floatValue:withSigFigs:](PRSRankingUtilities, "floatValue:withSigFigs:", v19, v17);
      v14 = v20;
    }
LABEL_7:
    json_writer_add_key((uint64_t)v8, (char *)objc_msgSend(*(id *)(v12 - 10), "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);
    if (v14 == 0.0 || v14 == 1.0 || v14 == -1.0)
      json_writer_add_int64((uint64_t)v8, (uint64_t)v14);
    else
      json_writer_add_double(v8, v14);
LABEL_26:
    v12 += 16;
    --v13;
  }
  while (v13);
  WeakRetained = objc_loadWeakRetained((id *)(v9 + 280));

  if (WeakRetained && v11 >= 1)
  {
    for (i = 0; i != v11; ++i)
    {
      v23 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("attrCountWordQueryTerm%lu"), i));
      json_writer_add_key((uint64_t)v8, (char *)objc_msgSend(v23, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);
      v24 = objc_loadWeakRetained((id *)(v9 + 280));
      json_writer_add_uint64((uint64_t)v8, objc_msgSend(v24, "attrCountWord:", i));

      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("attrCountWord2QueryTerm%lu"), i);
      v26 = objc_retainAutorelease(v25);
      json_writer_add_key((uint64_t)v8, (char *)objc_msgSend(v26, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);
      v27 = objc_loadWeakRetained((id *)(v9 + 280));
      json_writer_add_uint64((uint64_t)v8, objc_msgSend(v27, "attrCountWord2:", i));

      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("attrCountWord3QueryTerm%lu"), i);
      v29 = objc_retainAutorelease(v28);
      json_writer_add_key((uint64_t)v8, (char *)objc_msgSend(v29, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);
      v30 = objc_loadWeakRetained((id *)(v9 + 280));
      json_writer_add_uint64((uint64_t)v8, objc_msgSend(v30, "attrCountWord3:", i));

      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("attrCountPrefixQueryTerm%lu"), i);
      v32 = objc_retainAutorelease(v31);
      json_writer_add_key((uint64_t)v8, (char *)objc_msgSend(v32, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);
      v33 = objc_loadWeakRetained((id *)(v9 + 280));
      json_writer_add_uint64((uint64_t)v8, objc_msgSend(v33, "attrCountPrefix:", i));

      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("attrCountPrefix2QueryTerm%lu"), i);
      v35 = objc_retainAutorelease(v34);
      json_writer_add_key((uint64_t)v8, (char *)objc_msgSend(v35, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);
      v36 = objc_loadWeakRetained((id *)(v9 + 280));
      json_writer_add_uint64((uint64_t)v8, objc_msgSend(v36, "attrCountPrefix2:", i));

      v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("attrCountPrefix3QueryTerm%lu"), i);
      v38 = objc_retainAutorelease(v37);
      json_writer_add_key((uint64_t)v8, (char *)objc_msgSend(v38, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);
      v39 = objc_loadWeakRetained((id *)(v9 + 280));
      json_writer_add_uint64((uint64_t)v8, objc_msgSend(v39, "attrCountPrefix3:", i));

      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("attrCountPrefixLastQueryTerm%lu"), i);
      v41 = objc_retainAutorelease(v40);
      json_writer_add_key((uint64_t)v8, (char *)objc_msgSend(v41, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);
      v42 = objc_loadWeakRetained((id *)(v9 + 280));
      json_writer_add_uint64((uint64_t)v8, objc_msgSend(v42, "attrCountPrefixLast:", i));

      v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("attrCountPrefixLast2QueryTerm%lu"), i);
      v44 = objc_retainAutorelease(v43);
      json_writer_add_key((uint64_t)v8, (char *)objc_msgSend(v44, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);
      v45 = objc_loadWeakRetained((id *)(v9 + 280));
      json_writer_add_uint64((uint64_t)v8, objc_msgSend(v45, "attrCountPrefixLast2:", i));

      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("attrCountPrefixLast3QueryTerm%lu"), i);
      v47 = objc_retainAutorelease(v46);
      json_writer_add_key((uint64_t)v8, (char *)objc_msgSend(v47, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);
      v48 = objc_loadWeakRetained((id *)(v9 + 280));
      json_writer_add_uint64((uint64_t)v8, objc_msgSend(v48, "attrCountPrefixLast3:", i));

    }
  }
  if (!*(_QWORD *)(v9 + 248))
    goto LABEL_48;
  json_writer_add_key((uint64_t)v8, "bundleID", 8uLL, 1);
  v49 = (__CFString *)*(id *)(v9 + 248);
  v50 = objc_loadWeakRetained((id *)(v9 + 280));
  v51 = objc_msgSend(v50, "bundleIDType");

  if ((v51 & 0x2000000) == 0)
    goto LABEL_47;
  v52 = objc_loadWeakRetained((id *)(v9 + 280));
  v53 = objc_msgSend(v52, "bundleIDType");

  if ((v53 & 0x4000000) != 0)
  {
    v60 = SSSectionIdentifierSyndicatedPhotosMessages;
LABEL_46:
    v61 = *v60;

    v49 = v61;
    goto LABEL_47;
  }
  v54 = objc_loadWeakRetained((id *)(v9 + 280));
  v55 = objc_msgSend(v54, "bundleIDType");

  if ((v55 & 0x8000000) != 0)
  {
    v60 = SSSectionIdentifierSyndicatedPhotosNotes;
    goto LABEL_46;
  }
  v56 = objc_loadWeakRetained((id *)(v9 + 280));
  v57 = objc_msgSend(v56, "bundleIDType");

  if ((v57 & 0x10000000) != 0)
  {
    v60 = SSSectionIdentifierSyndicatedPhotosFiles;
    goto LABEL_46;
  }
  v58 = objc_loadWeakRetained((id *)(v9 + 280));
  v59 = objc_msgSend(v58, "bundleIDType");

  if ((v59 & 0x20000000) != 0)
  {
    v60 = SSSectionIdentifierSyndicatedPhotosFromPhotos;
    goto LABEL_46;
  }
LABEL_47:
  v62 = objc_retainAutorelease(v49);
  json_writer_add_string((uint64_t)v8, (char *)-[__CFString UTF8String](v62, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

LABEL_48:
  if ((v6 & 1) == 0)
  {
    json_writer_add_key((uint64_t)v8, "l2Score", 7uLL, 1);
    json_writer_add_double(v8, *(float *)(v9 + 220));
    json_writer_add_key((uint64_t)v8, "l2ScoreExperimental", 0x13uLL, 1);
    json_writer_add_double(v8, *(float *)(v9 + 224));
  }
  json_writer_add_key((uint64_t)v8, "lscore_0_2", 0xAuLL, 1);
  json_writer_add_uint64((uint64_t)v8, *(_QWORD *)(v9 + 480));
  json_writer_add_key((uint64_t)v8, "lscore_1_2", 0xAuLL, 1);
  json_writer_add_uint64((uint64_t)v8, *(_QWORD *)(v9 + 488));
  if ((v6 & 4) == 0)
  {
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    objc_msgSend(*(id *)(v9 + 272), "allKeys");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
    if (v64)
    {
      v65 = v64;
      v66 = *(_QWORD *)v74;
      do
      {
        for (j = 0; j != v65; ++j)
        {
          if (*(_QWORD *)v74 != v66)
            objc_enumerationMutation(v63);
          v68 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
          objc_msgSend(*(id *)(v9 + 272), "objectForKey:", v68);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "floatValue");
          v71 = v70;
          json_writer_add_key((uint64_t)v8, (char *)objc_msgSend(objc_retainAutorelease(v68), "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);
          json_writer_add_double(v8, v71);

        }
        v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
      }
      while (v65);
    }

  }
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_featureData);
  v3.receiver = self;
  v3.super_class = (Class)PRSL2FeatureVector;
  -[PRSL2FeatureVector dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  os_unfair_lock_s *p_featureDataLock;
  id v5;
  void *featureData;
  uint64_t featureDataSize;
  uint64_t flags;
  uint64_t values;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  _OWORD v28[12];
  int v29;

  p_featureDataLock = &self->_featureDataLock;
  os_unfair_lock_lock(&self->_featureDataLock);
  v5 = objc_alloc((Class)objc_opt_class());
  featureData = self->_featureData;
  featureDataSize = self->_featureDataSize;
  flags = self->_flags;
  values = self->_values;
  v10 = *(_OWORD *)&self->_cache.scores[20];
  v11 = *(_OWORD *)&self->_cache.scores[28];
  v28[10] = *(_OWORD *)&self->_cache.scores[24];
  v28[11] = v11;
  v29 = *(_DWORD *)&self->_cache.count;
  v12 = *(_OWORD *)&self->_cache.scores[4];
  v13 = *(_OWORD *)&self->_cache.scores[12];
  v28[6] = *(_OWORD *)&self->_cache.scores[8];
  v28[7] = v13;
  v28[8] = *(_OWORD *)&self->_cache.scores[16];
  v28[9] = v10;
  v14 = *(_OWORD *)&self->_cache.features[8];
  v15 = *(_OWORD *)&self->_cache.features[24];
  v28[2] = *(_OWORD *)&self->_cache.features[16];
  v28[3] = v15;
  v28[4] = *(_OWORD *)self->_cache.scores;
  v28[5] = v12;
  v28[0] = *(_OWORD *)self->_cache.features;
  v28[1] = v14;
  v16 = (void *)objc_msgSend(v5, "initWithCache:featureData:featureDataSize:flags:values:", v28, featureData, featureDataSize, flags, values);
  -[PRSL2FeatureVector originalL2Score](self, "originalL2Score");
  objc_msgSend(v16, "setOriginalL2Score:");
  -[PRSL2FeatureVector experimentalScore](self, "experimentalScore");
  objc_msgSend(v16, "setExperimentalScore:");
  -[PRSL2FeatureVector withinBundleScore](self, "withinBundleScore");
  objc_msgSend(v16, "setWithinBundleScore:");
  -[PRSL2FeatureVector bundleID](self, "bundleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBundleID:", v17);

  -[PRSL2FeatureVector device_type](self, "device_type");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDevice_type:", v18);

  -[PRSL2FeatureVector searchThroughCEPData](self, "searchThroughCEPData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v16, "setSearchThroughCEPData:", v20);

  v21 = -[PRSL2FeatureVector indexScore](self, "indexScore");
  objc_msgSend(v16, "setIndexScore:", v21, v22);
  objc_msgSend(v16, "setDisplayNameFuzzySpecialInsertion:", -[PRSL2FeatureVector displayNameFuzzySpecialInsertion](self, "displayNameFuzzySpecialInsertion"));
  objc_msgSend(v16, "setIsSiriAction:", -[PRSL2FeatureVector isSiriAction](self, "isSiriAction"));
  objc_msgSend(v16, "setIsAppInDock:", -[PRSL2FeatureVector isAppInDock](self, "isAppInDock"));
  -[PRSL2FeatureVector roundTripFeatures](self, "roundTripFeatures");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = objc_alloc(MEMORY[0x1E0C99D80]);
    -[PRSL2FeatureVector roundTripFeatures](self, "roundTripFeatures");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithDictionary:copyItems:", v25, 1);
    objc_msgSend(v16, "setRoundTripFeatures:", v26);

  }
  else
  {
    objc_msgSend(v16, "setRoundTripFeatures:", 0);
  }

  os_unfair_lock_unlock(p_featureDataLock);
  return v16;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<PRSL2FeatureVector:%p d:%p s:%d f:0x%x fv:0x%x>"), self, self->_featureData, self->_featureDataSize, self->_flags, self->_values);
}

- (float)originalL2Score
{
  return self->_originalL2Score;
}

- (void)setOriginalL2Score:(float)a3
{
  self->_originalL2Score = a3;
}

- (float)experimentalScore
{
  return self->_experimentalScore;
}

- (void)setExperimentalScore:(float)a3
{
  self->_experimentalScore = a3;
}

- (float)withinBundleScore
{
  return self->_withinBundleScore;
}

- (void)setWithinBundleScore:(float)a3
{
  self->_withinBundleScore = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSString)device_type
{
  return self->_device_type;
}

- (void)setDevice_type:(id)a3
{
  objc_storeStrong((id *)&self->_device_type, a3);
}

- (NSDictionary)searchThroughCEPData
{
  return self->_searchThroughCEPData;
}

- (void)setSearchThroughCEPData:(id)a3
{
  objc_storeStrong((id *)&self->_searchThroughCEPData, a3);
}

- (uint64_t)indexScore
{
  return *(_QWORD *)(a1 + 480);
}

- (void)setIndexScore:(PRSL2FeatureVector *)self
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)self->_indexScore = v2;
  *(_QWORD *)&self->_indexScore[8] = v3;
}

- (NSDictionary)roundTripFeatures
{
  return self->_roundTripFeatures;
}

- (void)setRoundTripFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_roundTripFeatures, a3);
}

- (PRSRankingItem)rankingItem
{
  return (PRSRankingItem *)objc_loadWeakRetained((id *)&self->_rankingItem);
}

- (void)setRankingItem:(id)a3
{
  objc_storeWeak((id *)&self->_rankingItem, a3);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (int64_t)textChunkTokenLength
{
  return self->_textChunkTokenLength;
}

- (void)setTextChunkTokenLength:(int64_t)a3
{
  self->_textChunkTokenLength = a3;
}

- (NSMutableDictionary)topicalityAnonFeatDict
{
  return self->_topicalityAnonFeatDict;
}

- (void)setTopicalityAnonFeatDict:(id)a3
{
  objc_storeStrong((id *)&self->_topicalityAnonFeatDict, a3);
}

- (float)kMDMailRead
{
  return self->_kMDMailRead;
}

- (void)setKMDMailRead:(float)a3
{
  self->_kMDMailRead = a3;
}

- (float)kMDMailRepliedTo
{
  return self->_kMDMailRepliedTo;
}

- (void)setKMDMailRepliedTo:(float)a3
{
  self->_kMDMailRepliedTo = a3;
}

- (float)kMDMailFlagged
{
  return self->_kMDMailFlagged;
}

- (void)setKMDMailFlagged:(float)a3
{
  self->_kMDMailFlagged = a3;
}

- (int64_t)kMDItemMailCategories
{
  return self->_kMDItemMailCategories;
}

- (void)setKMDItemMailCategories:(int64_t)a3
{
  self->_kMDItemMailCategories = a3;
}

- (int64_t)kMDItemCustomPageVisitCountScore
{
  return self->_kMDItemCustomPageVisitCountScore;
}

- (void)setKMDItemCustomPageVisitCountScore:(int64_t)a3
{
  self->_kMDItemCustomPageVisitCountScore = a3;
}

- (int64_t)kMDItemUseCount
{
  return self->_kMDItemUseCount;
}

- (void)setKMDItemUseCount:(int64_t)a3
{
  self->_kMDItemUseCount = a3;
}

- (int64_t)kMDItemPlayCount
{
  return self->_kMDItemPlayCount;
}

- (void)setKMDItemPlayCount:(int64_t)a3
{
  self->_kMDItemPlayCount = a3;
}

- (NSDate)kMDMailReceivedDate
{
  return self->_kMDMailReceivedDate;
}

- (void)setKMDMailReceivedDate:(id)a3
{
  objc_storeStrong((id *)&self->_kMDMailReceivedDate, a3);
}

- (NSDate)kMDMailLastViewedDate
{
  return self->_kMDMailLastViewedDate;
}

- (void)setKMDMailLastViewedDate:(id)a3
{
  objc_storeStrong((id *)&self->_kMDMailLastViewedDate, a3);
}

- (NSDate)kMDMailFreshnessDate
{
  return self->_kMDMailFreshnessDate;
}

- (void)setKMDMailFreshnessDate:(id)a3
{
  objc_storeStrong((id *)&self->_kMDMailFreshnessDate, a3);
}

- (NSDate)kMDItemContentCreationDate
{
  return self->_kMDItemContentCreationDate;
}

- (void)setKMDItemContentCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_kMDItemContentCreationDate, a3);
}

- (NSDate)kMDItemLastUsedDate
{
  return self->_kMDItemLastUsedDate;
}

- (void)setKMDItemLastUsedDate:(id)a3
{
  objc_storeStrong((id *)&self->_kMDItemLastUsedDate, a3);
}

- (NSDate)kMDItemApplicationLastLaunchedDate
{
  return self->_kMDItemApplicationLastLaunchedDate;
}

- (void)setKMDItemApplicationLastLaunchedDate:(id)a3
{
  objc_storeStrong((id *)&self->_kMDItemApplicationLastLaunchedDate, a3);
}

- (NSDate)kMDItemContentModificationDate
{
  return self->_kMDItemContentModificationDate;
}

- (void)setKMDItemContentModificationDate:(id)a3
{
  objc_storeStrong((id *)&self->_kMDItemContentModificationDate, a3);
}

- (NSDate)kMDItemDueDate
{
  return self->_kMDItemDueDate;
}

- (void)setKMDItemDueDate:(id)a3
{
  objc_storeStrong((id *)&self->_kMDItemDueDate, a3);
}

- (NSDate)kMDItemCompletionDate
{
  return self->_kMDItemCompletionDate;
}

- (void)setKMDItemCompletionDate:(id)a3
{
  objc_storeStrong((id *)&self->_kMDItemCompletionDate, a3);
}

- (NSDate)kMDItemExpirationDate
{
  return self->_kMDItemExpirationDate;
}

- (void)setKMDItemExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_kMDItemExpirationDate, a3);
}

- (NSDate)kMDItemStartDate
{
  return self->_kMDItemStartDate;
}

- (void)setKMDItemStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_kMDItemStartDate, a3);
}

- (NSDate)kMDItemEndDate
{
  return self->_kMDItemEndDate;
}

- (void)setKMDItemEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_kMDItemEndDate, a3);
}

- (NSString)kMDItemContentType
{
  return self->_kMDItemContentType;
}

- (void)setKMDItemContentType:(id)a3
{
  objc_storeStrong((id *)&self->_kMDItemContentType, a3);
}

- (NSArray)kMDItemUsedDates
{
  return self->_kMDItemUsedDates;
}

- (void)setKMDItemUsedDates:(id)a3
{
  objc_storeStrong((id *)&self->_kMDItemUsedDates, a3);
}

- (NSArray)kMDItemRecentSpotlightEngagementDatesNonUnique
{
  return self->_kMDItemRecentSpotlightEngagementDatesNonUnique;
}

- (void)setKMDItemRecentSpotlightEngagementDatesNonUnique:(id)a3
{
  objc_storeStrong((id *)&self->_kMDItemRecentSpotlightEngagementDatesNonUnique, a3);
}

- (NSArray)kMDItemRecentOutOfSpotlightEngagementDates
{
  return self->_kMDItemRecentOutOfSpotlightEngagementDates;
}

- (void)setKMDItemRecentOutOfSpotlightEngagementDates:(id)a3
{
  objc_storeStrong((id *)&self->_kMDItemRecentOutOfSpotlightEngagementDates, a3);
}

- (NSArray)kMDItemRecentAppSearchEngagementDates
{
  return self->_kMDItemRecentAppSearchEngagementDates;
}

- (void)setKMDItemRecentAppSearchEngagementDates:(id)a3
{
  objc_storeStrong((id *)&self->_kMDItemRecentAppSearchEngagementDates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kMDItemRecentAppSearchEngagementDates, 0);
  objc_storeStrong((id *)&self->_kMDItemRecentOutOfSpotlightEngagementDates, 0);
  objc_storeStrong((id *)&self->_kMDItemRecentSpotlightEngagementDatesNonUnique, 0);
  objc_storeStrong((id *)&self->_kMDItemUsedDates, 0);
  objc_storeStrong((id *)&self->_kMDItemContentType, 0);
  objc_storeStrong((id *)&self->_kMDItemEndDate, 0);
  objc_storeStrong((id *)&self->_kMDItemStartDate, 0);
  objc_storeStrong((id *)&self->_kMDItemExpirationDate, 0);
  objc_storeStrong((id *)&self->_kMDItemCompletionDate, 0);
  objc_storeStrong((id *)&self->_kMDItemDueDate, 0);
  objc_storeStrong((id *)&self->_kMDItemContentModificationDate, 0);
  objc_storeStrong((id *)&self->_kMDItemApplicationLastLaunchedDate, 0);
  objc_storeStrong((id *)&self->_kMDItemLastUsedDate, 0);
  objc_storeStrong((id *)&self->_kMDItemContentCreationDate, 0);
  objc_storeStrong((id *)&self->_kMDMailFreshnessDate, 0);
  objc_storeStrong((id *)&self->_kMDMailLastViewedDate, 0);
  objc_storeStrong((id *)&self->_kMDMailReceivedDate, 0);
  objc_storeStrong((id *)&self->_topicalityAnonFeatDict, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_destroyWeak((id *)&self->_rankingItem);
  objc_storeStrong((id *)&self->_roundTripFeatures, 0);
  objc_storeStrong((id *)&self->_searchThroughCEPData, 0);
  objc_storeStrong((id *)&self->_device_type, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
